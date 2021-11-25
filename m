Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E09E45DD65
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 16:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8946E900;
	Thu, 25 Nov 2021 15:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0936E900
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 15:27:07 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id i5so12465953wrb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 07:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=aJGhzRapkjxnSquRFQKdZiwXU/SjGJ7w38ExsLPAS2A=;
 b=EO/nVb5iod4bsDoCm3UD2u7+zCp3ZRp8SwHsRDdIsKKqoDGtKPRa+7aZkytV+FF3c2
 be+ykRZhM8B9uRRTgX8Z3uXfHvMpMO/JvQ8p9JNcE7b4e/lJrxf9fE3RGwto8Uqn2nSE
 yibEAJiGgv653/eg+oCa1mWUq8ZxfDkeILZcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=aJGhzRapkjxnSquRFQKdZiwXU/SjGJ7w38ExsLPAS2A=;
 b=PvmhEK3vJkwPCEr1a0oGL8WZuwLnWxUE0FFEpHTS9eK2DSgEJ11uxUilDEWIhJkeBC
 d35Ab43XHHvouh8It1xL/PAktjS4kgeo72Af/LQhYUv7aW9h+ipu19vCkrKSRjInpeoj
 2plIozUfcfU/zXVfOGugGaZ5zt42Pd0BKOm+QNtAGxKW42kaLhAimK5zDjETSqFW+4TA
 irKS1JBmTahafkKFvJt8mckEsPlpxNFFGmbsP7W32SHltZGXLNIE2QXrh6CM+M9JCOX6
 kca5HDU52+cCWrb9sk8MG6W3ZpWzyDTTDQyVhfZ0gwiDF8VrC5O7gwE9fL0eTeJmGrOK
 kV2w==
X-Gm-Message-State: AOAM532opfi+2nzUVA/MtY1V78wK11xBIyocXVJkLwNbCqoBjeTL/fpZ
 5Jm+YvCjdi2NWFU7x7/GnCHG7g==
X-Google-Smtp-Source: ABdhPJxsHddb9FpqPS3lP+icqHfabOZVXFoAOCQFOfbOxipWKNbUFgEs4eInNop8/mNtSbgGGUAP/w==
X-Received: by 2002:a5d:55d1:: with SMTP id i17mr7418506wrw.618.1637854026426; 
 Thu, 25 Nov 2021 07:27:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b14sm4077017wrd.24.2021.11.25.07.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:27:05 -0800 (PST)
Date: Thu, 25 Nov 2021 16:27:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: George Kennedy <george.kennedy@oracle.com>
Subject: Re: [PATCH] drm: check drm_format_info hsub and vsub to avoid divide
 by zero
Message-ID: <YZ+rSG7VmZ2XbJrf@phenom.ffwll.local>
Mail-Followup-To: George Kennedy <george.kennedy@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 airlied@linux.ie, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
References: <1635429437-21718-1-git-send-email-george.kennedy@oracle.com>
 <YXqt46TPL9tUZCL1@intel.com> <YZdxFvGkBPXrtoQ7@phenom.ffwll.local>
 <YZd2VI820CUGrMjv@intel.com> <YZd8tpDN9lsq0ZbZ@phenom.ffwll.local>
 <87a6i0jk8r.fsf@intel.com>
 <706003ee-62ca-17a1-f629-6bc010aa5d49@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <706003ee-62ca-17a1-f629-6bc010aa5d49@oracle.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 22, 2021 at 10:29:05AM -0500, George Kennedy wrote:
> 
> 
> On 11/19/2021 9:25 AM, Jani Nikula wrote:
> > On Fri, 19 Nov 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Fri, Nov 19, 2021 at 12:03:00PM +0200, Ville Syrjälä wrote:
> > > > On Fri, Nov 19, 2021 at 10:40:38AM +0100, Daniel Vetter wrote:
> > > > > On Thu, Oct 28, 2021 at 05:04:19PM +0300, Ville Syrjälä wrote:
> > > > > > On Thu, Oct 28, 2021 at 08:57:17AM -0500, George Kennedy wrote:
> > > > > > > Do a sanity check on struct drm_format_info hsub and vsub values to
> > > > > > > avoid divide by zero.
> > > > > > > 
> > > > > > > Syzkaller reported a divide error in framebuffer_check() when the
> > > > > > > DRM_FORMAT_Q410 or DRM_FORMAT_Q401 pixel_format is passed in via
> > > > > > > the DRM_IOCTL_MODE_ADDFB2 ioctl. The drm_format_info struct for
> > > > > > > the DRM_FORMAT_Q410 pixel_pattern has ".hsub = 0" and ".vsub = 0".
> > > > > > > fb_plane_width() uses hsub as a divisor and fb_plane_height() uses
> > > > > > > vsub as a divisor. These divisors need to be sanity checked for
> > > > > > > zero before use.
> > > > > > > 
> > > > > > > divide error: 0000 [#1] SMP KASAN NOPTI
> > > > > > > CPU: 0 PID: 14995 Comm: syz-executor709 Not tainted 5.15.0-rc6-syzk #1
> > > > > > > Hardware name: Red Hat KVM, BIOS 1.13.0-2
> > > > > > > RIP: 0010:framebuffer_check drivers/gpu/drm/drm_framebuffer.c:199 [inline]
> > > > > > > RIP: 0010:drm_internal_framebuffer_create+0x604/0xf90
> > > > > > > drivers/gpu/drm/drm_framebuffer.c:317
> > > > > > > 
> > > > > > > Call Trace:
> > > > > > >   drm_mode_addfb2+0xdc/0x320 drivers/gpu/drm/drm_framebuffer.c:355
> > > > > > >   drm_mode_addfb2_ioctl+0x2a/0x40 drivers/gpu/drm/drm_framebuffer.c:391
> > > > > > >   drm_ioctl_kernel+0x23a/0x2e0 drivers/gpu/drm/drm_ioctl.c:795
> > > > > > >   drm_ioctl+0x589/0xac0 drivers/gpu/drm/drm_ioctl.c:898
> > > > > > >   vfs_ioctl fs/ioctl.c:51 [inline]
> > > > > > >   __do_sys_ioctl fs/ioctl.c:874 [inline]
> > > > > > >   __se_sys_ioctl fs/ioctl.c:860 [inline]
> > > > > > >   __x64_sys_ioctl+0x19d/0x220 fs/ioctl.c:860
> > > > > > >   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> > > > > > >   do_syscall_64+0x3a/0x80 arch/x86/entry/common.c:80
> > > > > > >   entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > > > > > 
> > > > > > > Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> > > > > > > ---
> > > > > > >   drivers/gpu/drm/drm_framebuffer.c | 10 ++++++++++
> > > > > > >   1 file changed, 10 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> > > > > > > index 07f5abc..a146e4b 100644
> > > > > > > --- a/drivers/gpu/drm/drm_framebuffer.c
> > > > > > > +++ b/drivers/gpu/drm/drm_framebuffer.c
> > > > > > > @@ -195,6 +195,16 @@ static int framebuffer_check(struct drm_device *dev,
> > > > > > >   	/* now let the driver pick its own format info */
> > > > > > >   	info = drm_get_format_info(dev, r);
> > > > > > > +	if (info->hsub == 0) {
> > > > > > > +		DRM_DEBUG_KMS("bad horizontal chroma subsampling factor %u\n", info->hsub);
> > > > > > > +		return -EINVAL;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	if (info->vsub == 0) {
> > > > > > > +		DRM_DEBUG_KMS("bad vertical chroma subsampling factor %u\n", info->vsub);
> > > > > > > +		return -EINVAL;
> > > > > > > +	}
> > > > > > Looks like duct tape to me. I think we need to either fix those formats
> > > > > > to have valid format info, or just revert the whole patch that added such
> > > > > > broken things.
> > > > > Yeah maybe even a compile-time check of the format table(s) to validate
> > > > > them properly and scream ... Or at least a selftest.
> > > > I really wish C had (even very limited) compile time evaluation
> > > > so one could actually loop over arrays like at compile time to
> > > > check each element. As it stands you either have to check each
> > > > array element by hand, or you do some cpp macro horrors to
> > > > pretend you're iterating the array.
> > > Python preprocess or so seems to be the usual answer, and that then just
> > > generates the C table after it's all checked.
> > > 
> > > Or a post-processor which fishes the table out from the .o (or just links
> > > against it).
> > > 
> > > But yeah doing this in cpp isn't going to work, aside from it'd be really
> > > ugly.
> > Kbuild does have support for hostprogs which are typically used in the
> > build. The obvious idea is to use that for code generation, but it would
> > also be interesting to see how that could be used for compile-time
> > evaluation of sorts. Kind of like compile-time selftests? And, of
> > course, how badly that would be frowned upon.
> > 
> > git grep says there are only four hostprogs users in drivers/, so it
> > certainly isn't a popularity contest winner. (One of them is
> > "mkregtable" in radeon.)
> 
> So, can someone suggest a fix? A cpp type of approach does not seem
> feasible.
> 
> Adding the sanity checks that are in the patch, which are similar to the
> sanity checks preceding them in framebuffer_check(), along with a self-test
> that ran through all the table entries, might address all the concerns
> brought up in this thread.

drm selftest sounds like a reasonable approach to me.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
