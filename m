Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16C946C23A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 18:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F192A620;
	Tue,  7 Dec 2021 17:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D4A2A620
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 17:58:01 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id p18so11443173wmq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 09:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=tSqxAmkMTvOxNT3n0srAiUEeFVVSOI9yabtjn14TKOA=;
 b=Ao4xCbR1hTNSOglddntRCUwCjC+xXiNc5Yf1zNLJde7XCUoepH+MqEwHJEd944YPgq
 Qmju/bra6Uznfy8kB9FQ+dhpWAKxHT9VQXxmnZE9WDYkHEnneciZXlRLcGUmwOl6f8fo
 C6Aj8BC6C1VXbPGj/2qHnT02mbC2uxdAqoAdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=tSqxAmkMTvOxNT3n0srAiUEeFVVSOI9yabtjn14TKOA=;
 b=2voLCZEJcwcSQKqYjXv1/KkqTRXvn80W8ptp+RxIEG66NR90pbmhBbViX8e4xP4IBl
 QYywZvT/EZzFJcgYZ91W8kZb6Li59T5U2eOOobm8+RwehYOXsQgGhvSy0YUW8/EXusCf
 +qZW2UQ4pJNAOTF/ydTFv5jEfbb2fVXuJ8dZsxg1Adlz9aQMXwny6pBtbomWnpWD8B5Y
 wz9iQLUJAcmBBk3e8E3Vut7dTdvSosJfQSsoVm8jtt/U3rU1llL6cRtFDmKTApMGPvRi
 FspdQluK59zlZPPC+nHBYAi9U55bm59wtJAJCwrtI6ZfYo+ErSLl9MgYVKwhYlEgT5fS
 nbuQ==
X-Gm-Message-State: AOAM530/Yo7hZ3KzqaZLqzb9hfyKN4WO8e1qwIqh2HWnbbC5cXz3fNuA
 76J7KsPQnLkFFGn5nvdj1euZ8g==
X-Google-Smtp-Source: ABdhPJzwqlyFdsPqq7XHHL+NMw9kSD5Z5LiJIUwy4/ckbW6myWGA5agV7h1X4wxFyc/mEWPUR2X+Mg==
X-Received: by 2002:a05:600c:4982:: with SMTP id
 h2mr8855087wmp.4.1638899880371; 
 Tue, 07 Dec 2021 09:58:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z7sm3254001wmi.33.2021.12.07.09.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 09:57:59 -0800 (PST)
Date: Tue, 7 Dec 2021 18:57:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: George Kennedy <george.kennedy@oracle.com>
Subject: Re: [PATCH] drm: check drm_format_info hsub and vsub to avoid divide
 by zero
Message-ID: <Ya+gpUghEYH3BFlQ@phenom.ffwll.local>
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
 <YZ+rSG7VmZ2XbJrf@phenom.ffwll.local>
 <79d30c1e-2d02-6e0a-6f33-172ab7f91722@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79d30c1e-2d02-6e0a-6f33-172ab7f91722@oracle.com>
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
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 02, 2021 at 09:17:37AM -0500, George Kennedy wrote:
> 
> 
> On 11/25/2021 10:27 AM, Daniel Vetter wrote:
> > On Mon, Nov 22, 2021 at 10:29:05AM -0500, George Kennedy wrote:
> > > 
> > > On 11/19/2021 9:25 AM, Jani Nikula wrote:
> > > > On Fri, 19 Nov 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > On Fri, Nov 19, 2021 at 12:03:00PM +0200, Ville Syrjälä wrote:
> > > > > > On Fri, Nov 19, 2021 at 10:40:38AM +0100, Daniel Vetter wrote:
> > > > > > > On Thu, Oct 28, 2021 at 05:04:19PM +0300, Ville Syrjälä wrote:
> > > > > > > > On Thu, Oct 28, 2021 at 08:57:17AM -0500, George Kennedy wrote:
> > > > > > > > > Do a sanity check on struct drm_format_info hsub and vsub values to
> > > > > > > > > avoid divide by zero.
> > > > > > > > > 
> > > > > > > > > Syzkaller reported a divide error in framebuffer_check() when the
> > > > > > > > > DRM_FORMAT_Q410 or DRM_FORMAT_Q401 pixel_format is passed in via
> > > > > > > > > the DRM_IOCTL_MODE_ADDFB2 ioctl. The drm_format_info struct for
> > > > > > > > > the DRM_FORMAT_Q410 pixel_pattern has ".hsub = 0" and ".vsub = 0".
> > > > > > > > > fb_plane_width() uses hsub as a divisor and fb_plane_height() uses
> > > > > > > > > vsub as a divisor. These divisors need to be sanity checked for
> > > > > > > > > zero before use.
> > > > > > > > > 
> > > > > > > > > divide error: 0000 [#1] SMP KASAN NOPTI
> > > > > > > > > CPU: 0 PID: 14995 Comm: syz-executor709 Not tainted 5.15.0-rc6-syzk #1
> > > > > > > > > Hardware name: Red Hat KVM, BIOS 1.13.0-2
> > > > > > > > > RIP: 0010:framebuffer_check drivers/gpu/drm/drm_framebuffer.c:199 [inline]
> > > > > > > > > RIP: 0010:drm_internal_framebuffer_create+0x604/0xf90
> > > > > > > > > drivers/gpu/drm/drm_framebuffer.c:317
> > > > > > > > > 
> > > > > > > > > Call Trace:
> > > > > > > > >    drm_mode_addfb2+0xdc/0x320 drivers/gpu/drm/drm_framebuffer.c:355
> > > > > > > > >    drm_mode_addfb2_ioctl+0x2a/0x40 drivers/gpu/drm/drm_framebuffer.c:391
> > > > > > > > >    drm_ioctl_kernel+0x23a/0x2e0 drivers/gpu/drm/drm_ioctl.c:795
> > > > > > > > >    drm_ioctl+0x589/0xac0 drivers/gpu/drm/drm_ioctl.c:898
> > > > > > > > >    vfs_ioctl fs/ioctl.c:51 [inline]
> > > > > > > > >    __do_sys_ioctl fs/ioctl.c:874 [inline]
> > > > > > > > >    __se_sys_ioctl fs/ioctl.c:860 [inline]
> > > > > > > > >    __x64_sys_ioctl+0x19d/0x220 fs/ioctl.c:860
> > > > > > > > >    do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> > > > > > > > >    do_syscall_64+0x3a/0x80 arch/x86/entry/common.c:80
> > > > > > > > >    entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > > > > > > > 
> > > > > > > > > Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> > > > > > > > > ---
> > > > > > > > >    drivers/gpu/drm/drm_framebuffer.c | 10 ++++++++++
> > > > > > > > >    1 file changed, 10 insertions(+)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> > > > > > > > > index 07f5abc..a146e4b 100644
> > > > > > > > > --- a/drivers/gpu/drm/drm_framebuffer.c
> > > > > > > > > +++ b/drivers/gpu/drm/drm_framebuffer.c
> > > > > > > > > @@ -195,6 +195,16 @@ static int framebuffer_check(struct drm_device *dev,
> > > > > > > > >    	/* now let the driver pick its own format info */
> > > > > > > > >    	info = drm_get_format_info(dev, r);
> > > > > > > > > +	if (info->hsub == 0) {
> > > > > > > > > +		DRM_DEBUG_KMS("bad horizontal chroma subsampling factor %u\n", info->hsub);
> > > > > > > > > +		return -EINVAL;
> > > > > > > > > +	}
> > > > > > > > > +
> > > > > > > > > +	if (info->vsub == 0) {
> > > > > > > > > +		DRM_DEBUG_KMS("bad vertical chroma subsampling factor %u\n", info->vsub);
> > > > > > > > > +		return -EINVAL;
> > > > > > > > > +	}
> > > > > > > > Looks like duct tape to me. I think we need to either fix those formats
> > > > > > > > to have valid format info, or just revert the whole patch that added such
> > > > > > > > broken things.
> > > > > > > Yeah maybe even a compile-time check of the format table(s) to validate
> > > > > > > them properly and scream ... Or at least a selftest.
> > > > > > I really wish C had (even very limited) compile time evaluation
> > > > > > so one could actually loop over arrays like at compile time to
> > > > > > check each element. As it stands you either have to check each
> > > > > > array element by hand, or you do some cpp macro horrors to
> > > > > > pretend you're iterating the array.
> > > > > Python preprocess or so seems to be the usual answer, and that then just
> > > > > generates the C table after it's all checked.
> > > > > 
> > > > > Or a post-processor which fishes the table out from the .o (or just links
> > > > > against it).
> > > > > 
> > > > > But yeah doing this in cpp isn't going to work, aside from it'd be really
> > > > > ugly.
> > > > Kbuild does have support for hostprogs which are typically used in the
> > > > build. The obvious idea is to use that for code generation, but it would
> > > > also be interesting to see how that could be used for compile-time
> > > > evaluation of sorts. Kind of like compile-time selftests? And, of
> > > > course, how badly that would be frowned upon.
> > > > 
> > > > git grep says there are only four hostprogs users in drivers/, so it
> > > > certainly isn't a popularity contest winner. (One of them is
> > > > "mkregtable" in radeon.)
> > > So, can someone suggest a fix? A cpp type of approach does not seem
> > > feasible.
> > > 
> > > Adding the sanity checks that are in the patch, which are similar to the
> > > sanity checks preceding them in framebuffer_check(), along with a self-test
> > > that ran through all the table entries, might address all the concerns
> > > brought up in this thread.
> > drm selftest sounds like a reasonable approach to me.
> In the meantime, should a bugzilla bug be opened to track the issue? From
> this thread it does not seem as though there is a drm selftest in the works.

I think if you don't end up typing it, it's just not going to happen.
We're not really doing a great job in tracking these kinds of tasks
unfortunately :-/

Best we have is Documentation/gpu/todo.rst, but that's kinda
high-overhead.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
