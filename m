Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257186606A9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 19:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA01510E8B6;
	Fri,  6 Jan 2023 18:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B765310E8BA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 18:52:52 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id z16so2120941wrw.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 10:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zFR7Wmf9ELtFjlJq04xcru9S2eGwAWVDYFWePjOvsWE=;
 b=JOtgCNHTFmz8jD2kcDh2BY8qEJFDafRE6HT4cApEbKPvQgifmAp92UAzXqcRzxOeqi
 VNfYJ15XEzqvwg77AERdY08BX56pUOkxv9Y78wPLj72Tw7JAoQXQAVfbDJxoLtuGZpeY
 AiqGCU/nqHkttNptiLn7PFFH6buLt9DYx/Veo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zFR7Wmf9ELtFjlJq04xcru9S2eGwAWVDYFWePjOvsWE=;
 b=QqPBSRltSFMWOl5sEwAyxqa/7Szw+RVe8ZFiZVRsjHbb0rWrmYAAM9gvKgX8vpdPcN
 6r7klBT2Yz85Qw4MQG9q2HWG2IpeoV3T30JF1JIs6Ag4RvSnww0CtbW64oqNXnLdBlGS
 faHQqZOQmY7DFWkSBUrhpc2S957v95D/7IAReo8B4WGUjflcKJucTZr0tWIRf+w0MxIU
 ASpXHoBme3pHq5PlP98IaA+HBXlXrkuEH+FIeBuqV44yWy4j+T8YMhUPh4T1TivPBSXn
 nMuGsJCo51rBJQd/kDCwhqL9pDLWOQVZyBqkkIoUnT0yCWyxSu2/laHAsonO+7TKxTKh
 bzxA==
X-Gm-Message-State: AFqh2kqGQIfdfGKQ0yGdSDCxmw7GEpxle+dDYXaMb/Xp3oX7B7XXb3Ol
 1xWy9d9tFju9Y5+SDW5Cznhl9w==
X-Google-Smtp-Source: AMrXdXuChnuE6AXI+/EZeqKTU0XPuoALftuNLu4VCEg1NN6I1L5JLRtfk0jqNteHsg3uijYuLmPnnQ==
X-Received: by 2002:a5d:46d0:0:b0:294:381e:1c7d with SMTP id
 g16-20020a5d46d0000000b00294381e1c7dmr13187714wrs.8.1673031171103; 
 Fri, 06 Jan 2023 10:52:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m5-20020adfdc45000000b002428c4fb16asm1966950wrj.10.2023.01.06.10.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 10:52:50 -0800 (PST)
Date: Fri, 6 Jan 2023 19:52:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/radeon: free iio for atombios when driver shutdown
Message-ID: <Y7ht/7gujgsrQt3Z@phenom.ffwll.local>
Mail-Followup-To: Alex Deucher <alexdeucher@gmail.com>,
 Liwei Song <liwei.song@windriver.com>,
 AlexDeucher <alexander.deucher@amd.com>,
 =?iso-8859-1?Q?ChristianK=F6nig?= <christian.koenig@amd.com>,
 PanXinhui <Xinhui.Pan@amd.com>, DavidAirlie <airlied@gmail.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230106094729.38598-1-liwei.song@windriver.com>
 <CADnq5_Mu-9_HoH9PULANvWS39D0Sra+nxodwFspH-TXX_3GJKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_Mu-9_HoH9PULANvWS39D0Sra+nxodwFspH-TXX_3GJKA@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Liwei Song <liwei.song@windriver.com>, PanXinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, AlexDeucher <alexander.deucher@amd.com>,
 =?iso-8859-1?Q?ChristianK=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a quick drive-by. For these simple cases where we just need to make
sure that memory is freed using drmm_kmalloc and friends should help
simplify things. Probably not worth it for radeon, but figured I'll throw
it out there.

For more functional code switching to drmm is harder because you need the
right order. But for these all that matters is that stuff gets freed so
there's no leak, and drmm can take care of that without ordering
constraints.
-Daniel

On Fri, Jan 06, 2023 at 10:36:53AM -0500, Alex Deucher wrote:
> Applied.  Thanks!
> 
> Alex
> 
> On Fri, Jan 6, 2023 at 5:00 AM Liwei Song <liwei.song@windriver.com> wrote:
> >
> > Fix below kmemleak when unload radeon driver:
> >
> > unreferenced object 0xffff9f8608ede200 (size 512):
> >   comm "systemd-udevd", pid 326, jiffies 4294682822 (age 716.338s)
> >   hex dump (first 32 bytes):
> >     00 00 00 00 c4 aa ec aa 14 ab 00 00 00 00 00 00  ................
> >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >   backtrace:
> >     [<0000000062fadebe>] kmem_cache_alloc_trace+0x2f1/0x500
> >     [<00000000b6883cea>] atom_parse+0x117/0x230 [radeon]
> >     [<00000000158c23fd>] radeon_atombios_init+0xab/0x170 [radeon]
> >     [<00000000683f672e>] si_init+0x57/0x750 [radeon]
> >     [<00000000566cc31f>] radeon_device_init+0x559/0x9c0 [radeon]
> >     [<0000000046efabb3>] radeon_driver_load_kms+0xc1/0x1a0 [radeon]
> >     [<00000000b5155064>] drm_dev_register+0xdd/0x1d0
> >     [<0000000045fec835>] radeon_pci_probe+0xbd/0x100 [radeon]
> >     [<00000000e69ecca3>] pci_device_probe+0xe1/0x160
> >     [<0000000019484b76>] really_probe.part.0+0xc1/0x2c0
> >     [<000000003f2649da>] __driver_probe_device+0x96/0x130
> >     [<00000000231c5bb1>] driver_probe_device+0x24/0xf0
> >     [<0000000000a42377>] __driver_attach+0x77/0x190
> >     [<00000000d7574da6>] bus_for_each_dev+0x7f/0xd0
> >     [<00000000633166d2>] driver_attach+0x1e/0x30
> >     [<00000000313b05b8>] bus_add_driver+0x12c/0x1e0
> >
> > iio was allocated in atom_index_iio() called by atom_parse(),
> > but it doesn't got released when the dirver is shutdown.
> > Fix this kmemleak by free it in radeon_atombios_fini().
> >
> > Signed-off-by: Liwei Song <liwei.song@windriver.com>
> > ---
> >  drivers/gpu/drm/radeon/radeon_device.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> > index 92905ebb7b45..1c005e0ddd38 100644
> > --- a/drivers/gpu/drm/radeon/radeon_device.c
> > +++ b/drivers/gpu/drm/radeon/radeon_device.c
> > @@ -1022,6 +1022,7 @@ void radeon_atombios_fini(struct radeon_device *rdev)
> >  {
> >         if (rdev->mode_info.atom_context) {
> >                 kfree(rdev->mode_info.atom_context->scratch);
> > +               kfree(rdev->mode_info.atom_context->iio);
> >         }
> >         kfree(rdev->mode_info.atom_context);
> >         rdev->mode_info.atom_context = NULL;
> > --
> > 2.33.1
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
