Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3389BCB73
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 12:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A08B10E572;
	Tue,  5 Nov 2024 11:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lechuck.jsg.id.au (jsg.id.au [193.114.144.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B8910E572
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 11:17:54 +0000 (UTC)
Received: from largo.jsg.id.au (largo.jsg.id.au [192.168.1.44])
 by lechuck.jsg.id.au (OpenSMTPD) with ESMTPS id d628feca
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 5 Nov 2024 22:17:51 +1100 (AEDT)
Received: from localhost (largo.jsg.id.au [local])
 by largo.jsg.id.au (OpenSMTPD) with ESMTPA id ddafef16;
 Tue, 5 Nov 2024 22:17:50 +1100 (AEDT)
Date: Tue, 5 Nov 2024 22:17:50 +1100
From: Jonathan Gray <jsg@jsg.id.au>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: use ATOMIC64_INIT() for atomic64_t
Message-ID: <Zyn-3sJGdJEgzF9F@largo.jsg.id.au>
References: <20240111023045.50013-1-jsg@jsg.id.au> <87bk9suraz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bk9suraz.fsf@intel.com>
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

On Thu, Jan 11, 2024 at 11:56:20AM +0200, Jani Nikula wrote:
> On Thu, 11 Jan 2024, Jonathan Gray <jsg@jsg.id.au> wrote:
> > use ATOMIC64_INIT() not ATOMIC_INIT() for atomic64_t
> >
> > Fixes: 3f09a0cd4ea3 ("drm: Add common fdinfo helper")
> > Signed-off-by: Jonathan Gray <jsg@jsg.id.au>
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

This patch didn't get merged.  Should I resend it?

> 
> > ---
> >  drivers/gpu/drm/drm_file.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > index 446458aca8e9..d3b10dd91584 100644
> > --- a/drivers/gpu/drm/drm_file.c
> > +++ b/drivers/gpu/drm/drm_file.c
> > @@ -149,7 +149,7 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
> >   */
> >  struct drm_file *drm_file_alloc(struct drm_minor *minor)
> >  {
> > -	static atomic64_t ident = ATOMIC_INIT(0);
> > +	static atomic64_t ident = ATOMIC64_INIT(0);
> 
> I think we should probably redefine both ATOMIC_INIT and ATOMIC64_INIT
> to cast the result to the correct type to avoid this problem once and
> for all.
> 
> If we had
> 
> #define ATOMIC_INIT(i) (atomic_t){ (i) }
> 
> and
> 
> #define ATOMIC64_INIT(i) (atomic64_t){ (i) }
> 
> we'd get a build failure using them incorrectly.
> 
> BR,
> Jani.
> 
> 
> >  	struct drm_device *dev = minor->dev;
> >  	struct drm_file *file;
> >  	int ret;
> 
> -- 
> Jani Nikula, Intel
> 
