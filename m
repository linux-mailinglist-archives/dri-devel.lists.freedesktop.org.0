Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4493655A25D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F3710EDA5;
	Fri, 24 Jun 2022 20:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5BE10EDA5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:13:32 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id g26so6856211ejb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 13:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=ZDlqgf14zeOe/H6KdqMqyUaKiEwdFOQWmVC6blo0CJY=;
 b=dWEF+ZHzCmMX3vcid8rxsyHe6NbxfY6excwXrVhOubtLlgnEWZT/dpXietutVee1Fj
 2f/uIx02gGRTvTkl8pSE5tlyzd5bJEJoaLMuorMexDf/awqadeFajEtUxRRT+F12z6hU
 GLx17PMC/lwy7o+XF53FIg5bKhHEwWQ+j6LZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=ZDlqgf14zeOe/H6KdqMqyUaKiEwdFOQWmVC6blo0CJY=;
 b=njVA1VjOHT/QVT1zvhBcdbL3Ki3WHy4s6HnqT4cGzbHTRAYohOEpRg6LI5s5CzOdrV
 kS8gSvtGnS8lrlFEzwTKHlmst3iACeMEu3TfzbFGhh/KXhmOVb6kMOd5zMGv0MNuI1Se
 /qLc66j5f21EMOK+ZwKd1HSSIpyJrvSsVykc15vPGefSydYaEWXtZjCaXeirdksNZP5M
 bTR3YuBvQH5uhiXci1a66cvvzpApH8ZeTvRDULDnfKr833S3KFoqoGLLZqjw/e+hSQZQ
 3pbApOIU3R+lnUdCS9kTNSfVhnfZUxv+S7Ow3X4Xhx/Ij8E53xlJYgaQuWzNgHqbjovE
 UsHg==
X-Gm-Message-State: AJIora+te+ka7yr7yVqyal+mqnXDkQuLtryCGySA16aEfvHBgEP+r/dE
 nFll6mASkC3HaQ7yTvMvveJUQA==
X-Google-Smtp-Source: AGRyM1s8V47qxFEGAmWUTGvk4SXZ8+mjeCDjMS6oi3XRVTuZn4mdegCcH3FOFHRRUr8odugvbzEEGw==
X-Received: by 2002:a17:907:1694:b0:716:14a4:fba with SMTP id
 hc20-20020a170907169400b0071614a40fbamr791128ejc.290.1656101611140; 
 Fri, 24 Jun 2022 13:13:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bg6-20020a170906a04600b00722e31fcf42sm1622964ejb.184.2022.06.24.13.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 13:13:30 -0700 (PDT)
Date: Fri, 24 Jun 2022 22:13:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 04/11] drm/r128: Fix undefined behavior due to shift
 overflowing the constant
Message-ID: <YrYa6DIWbUaABFMp@phenom.ffwll.local>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
 Borislav Petkov <bp@alien8.de>, LKML <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Alex Deucher <alexander.deucher@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220405151517.29753-1-bp@alien8.de>
 <20220405151517.29753-5-bp@alien8.de>
 <04ff7802-c87a-2ea2-156e-c437446bc072@infradead.org>
 <YoZAhPj0IJmE8ss8@phenom.ffwll.local>
 <fc19b80e-3492-4b1a-e7e8-20a6a8ee6cf5@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc19b80e-3492-4b1a-e7e8-20a6a8ee6cf5@infradead.org>
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 Borislav Petkov <bp@alien8.de>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 16, 2022 at 09:06:45AM -0700, Randy Dunlap wrote:
> 
> 
> On 5/19/22 06:05, Daniel Vetter wrote:
> > On Mon, Apr 25, 2022 at 11:46:53AM -0700, Randy Dunlap wrote:
> >>
> >>
> >> On 4/5/22 08:15, Borislav Petkov wrote:
> >>> From: Borislav Petkov <bp@suse.de>
> >>>
> >>> Fix:
> >>>
> >>>   drivers/gpu/drm/r128/r128_cce.c: In function ‘r128_do_init_cce’:
> >>>   drivers/gpu/drm/r128/r128_cce.c:417:2: error: case label does not reduce to an integer constant
> >>>     case R128_PM4_64BM_64VCBM_64INDBM:
> >>>     ^~~~
> >>>   drivers/gpu/drm/r128/r128_cce.c:418:2: error: case label does not reduce to an integer constant
> >>>     case R128_PM4_64PIO_64VCPIO_64INDPIO:
> >>>     ^~~~
> >>>
> >>> See https://lore.kernel.org/r/YkwQ6%2BtIH8GQpuct@zn.tnic for the gory
> >>> details as to why it triggers with older gccs only.
> >>>
> >>> Signed-off-by: Borislav Petkov <bp@suse.de>
> >>> Cc: David Airlie <airlied@linux.ie>
> >>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>> Cc: dri-devel@lists.freedesktop.org
> >>
> >> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> > 
> > Pushed to drm-misc-next, thanks for patch&review.
> > -Daniel
> > 
> 
> Hi,
> 
> Will this be merged to mainline any time soonish?

It missed the merge window by a hair, so it's in linux-next and will get
into the next one.
-Daniel

> 
> thanks.
> 
> >>
> >> Thanks.
> >>
> >>> ---
> >>>  drivers/gpu/drm/r128/r128_drv.h | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/r128/r128_drv.h b/drivers/gpu/drm/r128/r128_drv.h
> >>> index 2e1bc01aa5c9..970e192b0d51 100644
> >>> --- a/drivers/gpu/drm/r128/r128_drv.h
> >>> +++ b/drivers/gpu/drm/r128/r128_drv.h
> >>> @@ -300,8 +300,8 @@ extern long r128_compat_ioctl(struct file *filp, unsigned int cmd,
> >>>  #	define R128_PM4_64PIO_128INDBM		(5  << 28)
> >>>  #	define R128_PM4_64BM_128INDBM		(6  << 28)
> >>>  #	define R128_PM4_64PIO_64VCBM_64INDBM	(7  << 28)
> >>> -#	define R128_PM4_64BM_64VCBM_64INDBM	(8  << 28)
> >>> -#	define R128_PM4_64PIO_64VCPIO_64INDPIO	(15 << 28)
> >>> +#	define R128_PM4_64BM_64VCBM_64INDBM	(8U  << 28)
> >>> +#	define R128_PM4_64PIO_64VCPIO_64INDPIO	(15U << 28)
> >>>  #	define R128_PM4_BUFFER_CNTL_NOUPDATE	(1  << 27)
> >>>  
> >>>  #define R128_PM4_BUFFER_WM_CNTL		0x0708
> >>
> >> -- 
> >> ~Randy
> > 
> 
> -- 
> ~Randy

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
