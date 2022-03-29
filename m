Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1942D4EA98D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 10:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9373710E7B9;
	Tue, 29 Mar 2022 08:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DC810E7B9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:45:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p189so9815446wmp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 01:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=leAuZREaw8nfEmtW7ruXdribbWRIO4GyRB3TM2WPrZU=;
 b=ZghBrot0nEslQiSM+TSX6PpqRLxe/Q+3+5NX2SpFBrdYSXyaBpHMuSMnr5V+9I3Yua
 HyBfoOWO9nwZ90vMB8Ib1/c9+lf70zDSinWodLKaHO8ldjLWzTzWgmOMWOrLlpUcaIt1
 4pVGrVtK1prnOvO1Z46KwrPj1DAyfL1wj7SCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=leAuZREaw8nfEmtW7ruXdribbWRIO4GyRB3TM2WPrZU=;
 b=qRn8KlIUY/6BNU8dd8oNMT6IAlB6KTupHPJhkKCW7OYsyTI2eMFDkwmHE6cKs5VUuF
 OlYm9/bMF9e5pI9mEK1yAHM5bGP4oi+C3MgG2H5e6NQMGP4vBAUfaT82mtRRbZoIzaLX
 YJeypGRdNrip9qKY6GOExLRuhdIAXb5s8UKLiYoPeYwso7Rw5QiTI6TxT0mijheBEpsa
 fHAcMiywcDTDFsAZnDQ0nZlGeYcktL/Q4h87XCT8n5dxLoO5O1PB/bZuOZSJ1+qiEPH0
 umhy5g9yYypjEnRp0ijg723hNN+wuUfmdUdfnqTLxT2teAg8suHqsbhHxajUcIr02CXn
 UKrw==
X-Gm-Message-State: AOAM5300Bm6HHiESXrn3BspDbI5oRIf1nsj2K1bggBwPnzXyqPdP36O6
 4Nz3vRZunrXin1DINvDUDS//Rg==
X-Google-Smtp-Source: ABdhPJyG1VjHY/gKAL0uy24McEyS4tmV6EaZxeg0kqJfrAkqNPPj5LI20D6nqqJeMCLTS54GwLIoOQ==
X-Received: by 2002:a7b:ce04:0:b0:38c:6c34:9aac with SMTP id
 m4-20020a7bce04000000b0038c6c349aacmr5261977wmc.142.1648543541654; 
 Tue, 29 Mar 2022 01:45:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a05600015c600b00203fa70b4ebsm18084964wry.53.2022.03.29.01.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 01:45:41 -0700 (PDT)
Date: Tue, 29 Mar 2022 10:45:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH next, v2] kernel: Add 1 ms delay to init handler to fix s3
 resume hang
Message-ID: <YkLHMxf/G+TgXBsJ@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Zhenneng Li <lizhenneng@kylinos.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Evan Quan <evan.quan@amd.com>, Guchun Chen <guchun.chen@amd.com>,
 Jack Zhang <Jack.Zhang1@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20220329030547.286265-1-lizhenneng@kylinos.cn>
 <ca4bd694-4685-a76c-25ae-65627c36d142@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca4bd694-4685-a76c-25ae-65627c36d142@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Jack Zhang <Jack.Zhang1@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Zhenneng Li <lizhenneng@kylinos.cn>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Kevin Wang <kevin1.wang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 08:20:24AM +0200, Christian König wrote:
> Am 29.03.22 um 05:05 schrieb Zhenneng Li:
> > This is a workaround for s3 resume hang for r7 340(amdgpu).
> > When we test s3 with r7 340 on arm64 platform, graphics card will hang up,
> > the error message are as follows:
> > Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.599374][ 7] [  T291] amdgpu 0000:02:00.0: fb0: amdgpudrmfb frame buffer device
> > Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.612869][ 7] [  T291] [drm:amdgpu_device_ip_late_init [amdgpu]] *ERROR* late_init of IP block <si_dpm> failed -22
> > Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.623392][ 7] [  T291] amdgpu 0000:02:00.0: amdgpu_device_ip_late_init failed
> > Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.630696][ 7] [  T291] amdgpu 0000:02:00.0: Fatal error during GPU init
> > Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.637477][ 7] [  T291] [drm] amdgpu: finishing device.
> > 
> > On the following hardware:
> > lspci -nn -s 05:00.0
> > 05:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Oland [Radeon HD 8570 / R7 240/340 / Radeon 520 OEM] [1002:6611] (rev 87)
> 
> Well that's rather funny and certainly a NAK. To recap you are adding a
> delay to a delayed work handler. In other words you could delay the work
> handler in the first place :)
> 
> But this is not the reason why that here is a NAK. The more obvious problem
> is that we seem to have a race between the DPM code kicking in to save power
> after driver load and the asynchronous testing if userspace command
> submission works.
> 
> Adding the delay here works around that for the IB submission, but there can
> be other things going on in parallel which can fail as well.

Yeah standard pattern for this is to refcount your dpm code (using power
domains or runtime pm ideally or hand-rolled if you have to). And then
grabbing a dpm reference before you launch that work, and dropping that
when the work has finished.

That gives you a nice clean way to handle all these problems around "right
now I'm really not ready to allow low power states" in a very clean
fashion. arm-soc drivers go totally overboard on this with runtime pm on
all the chip components, that's maybe a bit much but afaiui we could do it
on big pci drivers with power domains too :-)

Also with power domains you get autosuspend delay timers for free and
tunable in sysfs ...

Cheers, Daniel

> 
> Please rather open up a bug report instead.
> 
> Regards,
> Christian.
> 
> > 
> > Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index 3987ecb24ef4..1eced991b5b2 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2903,6 +2903,8 @@ static void amdgpu_device_delayed_init_work_handler(struct work_struct *work)
> >   		container_of(work, struct amdgpu_device, delayed_init_work.work);
> >   	int r;
> > +	mdelay(1);
> > +
> >   	r = amdgpu_ib_ring_tests(adev);
> >   	if (r)
> >   		DRM_ERROR("ib ring test failed (%d).\n", r);
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
