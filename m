Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8032A8FE51B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 13:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EE410E8E0;
	Thu,  6 Jun 2024 11:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C83210E8E0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 11:18:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11103DA7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 04:19:16 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 602113F905
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 04:18:51 -0700 (PDT)
Date: Thu, 6 Jun 2024 12:18:43 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: pengfuyuan <pengfuyuan@kylinos.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] arm/komeda: Compile DEFINE_SHOW_ATTRIBUTE() only when
 CONFIG_DEBUG_FS is enabled
Message-ID: <ZmGbE3g_OFuowEgF@e110455-lin.cambridge.arm.com>
References: <20240606075846.1307007-1-pengfuyuan@kylinos.cn>
 <87ed9abhxx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ed9abhxx.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 06, 2024 at 11:20:58AM +0300, Jani Nikula wrote:
> On Thu, 06 Jun 2024, pengfuyuan <pengfuyuan@kylinos.cn> wrote:
> > We do not call komeda_debugfs_init() and the debugfs core function
> > declaration if CONFIG_DEBUG_FS is not defined, but we should not
> > compile it either because the debugfs core function declaration is
> > not included.
> >
> > Reported-by: k2ci <kernel-bot@kylinos.cn>

Can we see what the bot reported?

> > Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
> 
> An interesting alternative might actually be to remove *all* the
> CONFIG_DEBUG_FS conditional compilation from the file. Since the debugfs
> functions have no-op stubs for CONFIG_DEBUG_FS=n, the compiler will
> optimize the rest away, because they're no longer referenced. (For the
> same reason, I don't think this patch has an impact for code size.)
> 
> The upside for removing conditional compilation is that you'll actually
> do build testing for both CONFIG_DEBUG_FS config values. Assuming most
> developers have it enabled, there's not a lot of testing going on for
> CONFIG_DEBUG_FS=n, and you might introduce build failures with the
> conditional compilation.
> 
> Of course, up to Liviu to decide.

Yeah, I quite like the idea of removing the conditional compilation from
the file entirely.

Pengfuyuan, do you mind sending a new patch removing all the CONFIG_DEBUG_FS
from the file, rather than moving things around?

Best regards,
Liviu

> 
> 
> BR,
> Jani.
> 
> 
> > ---
> >  drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> > index 14ee79becacb..7ada8e6f407c 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> > @@ -21,6 +21,7 @@
> >  
> >  #include "komeda_dev.h"
> >  
> > +#ifdef CONFIG_DEBUG_FS
> >  static int komeda_register_show(struct seq_file *sf, void *x)
> >  {
> >  	struct komeda_dev *mdev = sf->private;
> > @@ -43,7 +44,6 @@ static int komeda_register_show(struct seq_file *sf, void *x)
> >  
> >  DEFINE_SHOW_ATTRIBUTE(komeda_register);
> >  
> > -#ifdef CONFIG_DEBUG_FS
> >  static void komeda_debugfs_init(struct komeda_dev *mdev)
> >  {
> >  	if (!debugfs_initialized())
> 
> -- 
> Jani Nikula, Intel

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
