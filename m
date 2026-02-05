Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG1qASOdhGmI3wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 14:37:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACD9F35DB
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 14:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FFB10E8B1;
	Thu,  5 Feb 2026 13:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1C81110E8B1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 13:37:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 480561516
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 05:37:28 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 6EB163F778
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 05:37:34 -0800 (PST)
Date: Thu, 5 Feb 2026 13:35:36 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Alexander Konyukhov <Alexander.Konyukhov@kaspersky.com>
Cc: Brian Starkey <brian.starkey@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
 "nd@arm.com" <nd@arm.com>
Subject: Re: [PATCH] drm/komeda: fix integer overflow in AFBC framebuffer
 size check
Message-ID: <aYScqPO_C8sQKnzy@e142607>
References: <20260203134907.1587067-1-Alexander.Konyukhov@kaspersky.com>
 <ct5tkr764socel5o4gtd4k2fgofqiljy3yzdjokij3jjkcf2ks@c3p7fs33znoe>
 <aYNIjm8XIdxKNo-0@e142607>
 <57df230af1624c679a947317152fd8ed@kaspersky.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <57df230af1624c679a947317152fd8ed@kaspersky.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Alexander.Konyukhov@kaspersky.com,m:brian.starkey@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lvc-project@linuxtesting.org,m:nd@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[liviu.dudau@arm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,linuxtesting.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[liviu.dudau@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qian.wang:url,arm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email,intel.com:email,kaspersky.com:email]
X-Rspamd-Queue-Id: 3ACD9F35DB
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 02:56:38PM +0000, Alexander Konyukhov wrote:
> Thank you for the replies.
> 
> According to ISO 9899 6.3.1 both operands are first converted to a common type (u32), there are no defined limits of kfb->afbc_size and fb->offsets[0] , so min_size can have an overflowed u32 value.

Brian has pointed out that just looking at the type of the result is not enough.

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Will push this into drm-misc-next later today.

Thanks for the fix!

Best regards,
Liviu

> 
> -----Original Message-----
> From: Liviu Dudau <liviu.dudau@arm.com> 
> Sent: Wednesday, February 4, 2026 4:25 PM
> To: Brian Starkey <brian.starkey@arm.com>
> Cc: Alexander Konyukhov <Alexander.Konyukhov@kaspersky.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; lvc-project@linuxtesting.org; nd@arm.com
> Subject: Re: [PATCH] drm/komeda: fix integer overflow in AFBC framebuffer size check
> 
> Caution: This is an external email.
> 
> 
> 
> On Tue, Feb 03, 2026 at 09:43:12PM +0000, Brian Starkey wrote:
> > Hi Alexander,
> >
> > On Tue, Feb 03, 2026 at 04:48:46PM +0000, Alexander Konyukhov wrote:
> > > The AFBC framebuffer size validation calculates the minimum required 
> > > buffer size by adding the AFBC payload size to the framebuffer offset.
> > > This addition is performed without checking for integer overflow.
> > >
> > > If the addition oveflows, the size check may incorrectly succed and 
> > > allow userspace to provide an undersized drm_gem_object, potentially 
> > > leading to out-of-bounds memory access.
> > >
> > > Add usage of check_add_overflow() to safely compute the minimum 
> > > required size and reject the framebuffer if an overflow is detected.
> > > This makes the AFBC size validation more robust against malformed.
> > >
> > > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> > >
> > > Fixes: 65ad2392dd6d ("drm/komeda: Added AFBC support for komeda 
> > > driver")
> > > Signed-off-by: Alexander Konyukhov 
> > > <Alexander.Konyukhov@kaspersky.com>
> > > ---
> > >  drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c 
> > > b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
> > > index 3ca461eb0a24..3cb34d03f7f8 100644
> > > --- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
> > > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
> > > @@ -4,6 +4,8 @@
> > >   * Author: James.Qian.Wang <james.qian.wang@arm.com>
> > >   *
> > >   */
> > > +#include <linux/overflow.h>
> > > +
> > >  #include <drm/drm_device.h>
> > >  #include <drm/drm_fb_dma_helper.h>
> > >  #include <drm/drm_gem.h>
> > > @@ -93,7 +95,9 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb, struct drm_file *file,
> > >     kfb->afbc_size = kfb->offset_payload + n_blocks *
> > >                      ALIGN(bpp * AFBC_SUPERBLK_PIXELS / 8,
> > >                            AFBC_SUPERBLK_ALIGNMENT);
> > > -   min_size = kfb->afbc_size + fb->offsets[0];
> >
> > Can this really overflow? Is the concern a hypothetical ILP64 
> > situation?
> >
> > min_size is u64, kfb->afbc_size is u32, and fb->offsets[0] is unsigned 
> > int.
> 
> Yeah, I was thinking the same thing yesterday at the end of the work day when I looked at the patch. I don't think following the call flow you can end up with an overflow.
> 
> Best regards,
> Liviu
> 
> >
> > Thanks,
> > -Brian
> >
> > > +   if (check_add_overflow(kfb->afbc_size, fb->offsets[0], &min_size)) {
> > > +           goto check_failed;
> > > +   }
> > >     if (min_size > obj->size) {
> > >             DRM_DEBUG_KMS("afbc size check failed, obj_size: 0x%zx. min_size 0x%llx.\n",
> > >                           obj->size, min_size);
> > > --
> > > 2.43.0
> > >
