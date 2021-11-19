Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAD5456D4B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 11:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999E46EA76;
	Fri, 19 Nov 2021 10:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E376EA76
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 10:30:18 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r25so3837083edq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 02:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=carminywHVkfCA+4NFBY21DE5JrCWEMoTBTfqat9eKo=;
 b=JqTXLWoxo1pt0SAgax4z8lSGfacM06j1bbOo6BXYZWxREyW4PtseemiDrziHWIYDLW
 n+8QuoaNkc7kMmxv9iXIr04af3CgxEX4JuYVT5UyEhA4Sia9127m2bRpxUeMU/XXWFgf
 QsfGhDRetZT5zOt/8sjx1a6wPXY7DyI+MUQoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=carminywHVkfCA+4NFBY21DE5JrCWEMoTBTfqat9eKo=;
 b=JE9JzETwpS9IXYX6FT3DXVoBqZ+k1+TBn7uO52uaxjff+XWSZL9zBziON39xX39uk1
 QnvLvKF4Gme/mGctuqlglszmFggKbHcVe58sqMDNcj3Inzaxz8aoHdOep8TNu6Z2btRU
 4D3QNhtU/zNIa48rZkWK7c9WXNTyCkNQRl1IL8WWbH/fZvFdHkCTYjbuLSVB/Z+uvvL/
 OvcJHy6QrHSUOpqtiZYb12UQTCc9rw24KR7NfKQIifdaBDO/ZUNswhNakJyNhxlL7/3s
 aCcO9FAfEQ256eZ3X1DqJDKDtkB12Wm1r07/Z7PzI+prDetMoHXkIRJOfAmlH3ZThp+M
 mJKg==
X-Gm-Message-State: AOAM533/jBevBWhLps0RIO7yP4J2/EIbFRizrMjywrYYDuPgvP/im17k
 yJbzBFStvEuMTPvK9YIr/nsFBg==
X-Google-Smtp-Source: ABdhPJxW3RqitM6BIFpy4p8RffcLsHT+hwVTb5ABQGC5XemUNLnMWWDLgyhFpXWCLoZreYYGO99w0w==
X-Received: by 2002:a17:907:2d20:: with SMTP id
 gs32mr6309596ejc.270.1637317817093; 
 Fri, 19 Nov 2021 02:30:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f22sm617738edf.93.2021.11.19.02.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 02:30:16 -0800 (PST)
Date: Fri, 19 Nov 2021 11:30:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: check drm_format_info hsub and vsub to avoid divide
 by zero
Message-ID: <YZd8tpDN9lsq0ZbZ@phenom.ffwll.local>
Mail-Followup-To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, 
 George Kennedy <george.kennedy@oracle.com>,
 gregkh@linuxfoundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1635429437-21718-1-git-send-email-george.kennedy@oracle.com>
 <YXqt46TPL9tUZCL1@intel.com> <YZdxFvGkBPXrtoQ7@phenom.ffwll.local>
 <YZd2VI820CUGrMjv@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YZd2VI820CUGrMjv@intel.com>
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 George Kennedy <george.kennedy@oracle.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 12:03:00PM +0200, Ville Syrjälä wrote:
> On Fri, Nov 19, 2021 at 10:40:38AM +0100, Daniel Vetter wrote:
> > On Thu, Oct 28, 2021 at 05:04:19PM +0300, Ville Syrjälä wrote:
> > > On Thu, Oct 28, 2021 at 08:57:17AM -0500, George Kennedy wrote:
> > > > Do a sanity check on struct drm_format_info hsub and vsub values to
> > > > avoid divide by zero.
> > > > 
> > > > Syzkaller reported a divide error in framebuffer_check() when the
> > > > DRM_FORMAT_Q410 or DRM_FORMAT_Q401 pixel_format is passed in via
> > > > the DRM_IOCTL_MODE_ADDFB2 ioctl. The drm_format_info struct for
> > > > the DRM_FORMAT_Q410 pixel_pattern has ".hsub = 0" and ".vsub = 0".
> > > > fb_plane_width() uses hsub as a divisor and fb_plane_height() uses
> > > > vsub as a divisor. These divisors need to be sanity checked for
> > > > zero before use.
> > > > 
> > > > divide error: 0000 [#1] SMP KASAN NOPTI
> > > > CPU: 0 PID: 14995 Comm: syz-executor709 Not tainted 5.15.0-rc6-syzk #1
> > > > Hardware name: Red Hat KVM, BIOS 1.13.0-2
> > > > RIP: 0010:framebuffer_check drivers/gpu/drm/drm_framebuffer.c:199 [inline]
> > > > RIP: 0010:drm_internal_framebuffer_create+0x604/0xf90
> > > > drivers/gpu/drm/drm_framebuffer.c:317
> > > > 
> > > > Call Trace:
> > > >  drm_mode_addfb2+0xdc/0x320 drivers/gpu/drm/drm_framebuffer.c:355
> > > >  drm_mode_addfb2_ioctl+0x2a/0x40 drivers/gpu/drm/drm_framebuffer.c:391
> > > >  drm_ioctl_kernel+0x23a/0x2e0 drivers/gpu/drm/drm_ioctl.c:795
> > > >  drm_ioctl+0x589/0xac0 drivers/gpu/drm/drm_ioctl.c:898
> > > >  vfs_ioctl fs/ioctl.c:51 [inline]
> > > >  __do_sys_ioctl fs/ioctl.c:874 [inline]
> > > >  __se_sys_ioctl fs/ioctl.c:860 [inline]
> > > >  __x64_sys_ioctl+0x19d/0x220 fs/ioctl.c:860
> > > >  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> > > >  do_syscall_64+0x3a/0x80 arch/x86/entry/common.c:80
> > > >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > > 
> > > > Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_framebuffer.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> > > > index 07f5abc..a146e4b 100644
> > > > --- a/drivers/gpu/drm/drm_framebuffer.c
> > > > +++ b/drivers/gpu/drm/drm_framebuffer.c
> > > > @@ -195,6 +195,16 @@ static int framebuffer_check(struct drm_device *dev,
> > > >  	/* now let the driver pick its own format info */
> > > >  	info = drm_get_format_info(dev, r);
> > > >  
> > > > +	if (info->hsub == 0) {
> > > > +		DRM_DEBUG_KMS("bad horizontal chroma subsampling factor %u\n", info->hsub);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	if (info->vsub == 0) {
> > > > +		DRM_DEBUG_KMS("bad vertical chroma subsampling factor %u\n", info->vsub);
> > > > +		return -EINVAL;
> > > > +	}
> > > 
> > > Looks like duct tape to me. I think we need to either fix those formats
> > > to have valid format info, or just revert the whole patch that added such
> > > broken things.
> > 
> > Yeah maybe even a compile-time check of the format table(s) to validate
> > them properly and scream ... Or at least a selftest.
> 
> I really wish C had (even very limited) compile time evaluation
> so one could actually loop over arrays like at compile time to 
> check each element. As it stands you either have to check each
> array element by hand, or you do some cpp macro horrors to 
> pretend you're iterating the array.

Python preprocess or so seems to be the usual answer, and that then just
generates the C table after it's all checked.

Or a post-processor which fishes the table out from the .o (or just links
against it).

But yeah doing this in cpp isn't going to work, aside from it'd be really
ugly.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
