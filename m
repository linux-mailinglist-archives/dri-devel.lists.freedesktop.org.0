Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C835EA775
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 15:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C42410E3EF;
	Mon, 26 Sep 2022 13:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B835010E6C8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 13:38:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC6461042
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 06:38:47 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E2A9A3F66F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 06:38:40 -0700 (PDT)
Date: Mon, 26 Sep 2022 14:38:34 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH RESEND drm-misc-next 4/7] drm/arm/hdlcd: plane: use drm
 managed resources
Message-ID: <YzGrWkbMzNPjhbSq@e110455-lin.cambridge.arm.com>
References: <20220905152719.128539-1-dakr@redhat.com>
 <20220905152719.128539-5-dakr@redhat.com>
 <Yx9uAe//u/Z9zfmM@e110455-lin.cambridge.arm.com>
 <dc472070-34a8-93e1-2ca3-4847c49f12eb@redhat.com>
 <YyBGRMAcV2Mrliis@e110455-lin.cambridge.arm.com>
 <a10cf8af-1f62-ddd2-3975-066dd9494c9f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a10cf8af-1f62-ddd2-3975-066dd9494c9f@redhat.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 14, 2022 at 12:03:58AM +0200, Danilo Krummrich wrote:
> On 9/13/22 10:58, Liviu Dudau wrote:
> > On Mon, Sep 12, 2022 at 09:50:26PM +0200, Danilo Krummrich wrote:
> > > Hi Liviu,
> > 
> > Hi Danilo,
> > 
> > > 
> > > Thanks for having a look!
> > > 
> > > This is not about this patch, it's about patch 3/7 "drm/arm/hdlcd: crtc: use
> > > drmm_crtc_init_with_planes()".
> > 
> > Agree! However, this is the patch that removes the .destroy hook, so I've replied here.
> 
> This is a different .destroy hook, it's the struct drm_plane_funcs one, not
> the struct drm_crtc_funcs one, which the warning is about. Anyway, as said,
> we can just drop the mentioned patch. :-)

Sorry, my mistake.

> 
> > 
> > > 
> > > And there it's the other way around. When using drmm_crtc_init_with_planes()
> > > we shouldn't have a destroy hook in place, that's the whole purpose of
> > > drmm_crtc_init_with_planes().
> > > 
> > > We should just drop patch 3/7 "drm/arm/hdlcd: crtc: use
> > > drmm_crtc_init_with_planes()", it's wrong.
> > 
> > So we end up with mixed use of managed and unmanaged APIs?
> 
> In this case, yes. However, I don't think this makes it inconsistent. They
> only thing drmm_crtc_init_with_planes() does different than
> drm_crtc_init_with_planes() is that it set's things up to automatically call
> drm_crtc_cleanup() on .destroy. Since this driver also does a register write
> in the .destroy callback and hence we can't get rid of the callback we can
> just keep it as it is.

I'm trying to test your v2 on a flaky platform (my Juno R1 has developed some memory
issues that leads to crashes on most boots) and I'm seeing some issues that I'm
trying to replicate (and understand) before posting the stack trace. I'm not sure yet
if they are related to the mixing of managed and unmanaged APIs, I need a bit more
time for testing.


> 
> > 
> > > 
> > > Do you want me to send a v2 for that?
> > 
> > Yes please! It would help me to understand your thinking around the whole lifecycle of the driver.
> > 
> > BTW, I appreciate the care in patches 5-7 to make sure that the driver doesn't access freed resources,
> > however I'm not sure I like the fact that rmmod-ing the hdlcd driver while I have an fbcon running
> > hangs now the command and prevents a kernel reboot, while it works without your series. Can you explain
> > to me again what are you trying to fix?
> 
> Sure! DRM managed resources are cleaned up whenever the last reference is
> put. This is not necessarily the case when the driver is unbound, hence
> there might still be calls into the driver and therefore we must protect
> resources that are bound to the driver/device lifecycle (e.g. a MMIO region
> mapped via devm_ioremap_resource()) from being accessed. That's why the
> hdlcd_write() and hdlcd_read() calls in the crtc callbacks need to be
> protected.

Thanks for the explanation on what the code ultimately does. I was trying to
understand what was the impetus for the change in the first place. Why did you
thought adding the calls to managed APIs was needed and what were you trying to fix?


> 
> However, of course, the changes needed to achieve that should not result
> into hanging rmmod. Unfortunately, just by looking at the patches again I
> don't see how this could happen.
> 
> Do you mind trying again with my v2 (although v2 shouldn't make a difference
> for this issue) and provide the back-trace when it hangs?

I'm trying to do that. I've got one good trace that I'm trying to reproduce, but
unfortunately my main Juno board has developed a memory fault and the replacement for
it is taking longer than I wanted.

Best regards,
Liviu


> 
> Thanks,
> Danilo
> 
> > 
> > Best regards,
> > Liviu
> > 
> > 
> > > 
> > > - Danilo
> > > 
> > > 
> > > 
> > > On 9/12/22 19:36, Liviu Dudau wrote:
> > > > Hi Danilo,
> > > > 
> > > > I have applied your patch series for HDLCD on top of drm-next (commit 213cb76ddc8b)
> > > > and on start up I get a warning:
> > > > 
> > > > [   12.882554] hdlcd 7ff50000.hdlcd: drm_WARN_ON(funcs && funcs->destroy)
> > > > [   12.882596] WARNING: CPU: 1 PID: 211 at drivers/gpu/drm/drm_crtc.c:393 __drmm_crtc_init_with_planes+0x70/0xf0 [drm]
> > > > 
> > > > It looks like the .destroy hook is still required or I'm missing some other required
> > > > series where the WARN has been removed?
> > > > 
> > > > Best regards,
> > > > Liviu
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
