Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7879D2B31
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 17:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E203E10E68B;
	Tue, 19 Nov 2024 16:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E2E2A10E68B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 16:41:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C1081007
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 08:41:58 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 285F03F66E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 08:41:28 -0800 (PST)
Date: Tue, 19 Nov 2024 16:41:14 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Karunika Choo <karunika.choo@arm.com>, nd@arm.com,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: Simplify FW fast reset path
Message-ID: <Zzy_qhXTZZrPwhHk@e110455-lin.cambridge.arm.com>
References: <20241119135030.3352939-1-karunika.choo@arm.com>
 <20241119152525.6579b438@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119152525.6579b438@collabora.com>
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

On Tue, Nov 19, 2024 at 03:25:25PM +0100, Boris Brezillon wrote:
> On Tue, 19 Nov 2024 13:50:29 +0000
> Karunika Choo <karunika.choo@arm.com> wrote:
> 
> > Stop checking the FW halt_status as MCU_STATUS should be sufficient.
> > This should make the check for successful FW halt and subsequently
> > setting fast_reset to true more robust.
> > 
> > We should also clear GLB_REQ.GLB_HALT bit only on post-reset prior
> > to starting the FW and only if we're doing a fast reset, because
> > the slow reset will re-initialize all FW sections, including the
> > global interface.
> > 
> > Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> and I think you forgot to add Liviu's R-b

I've fixed the commit and pushed it without compile testing it because I did
it for the patch before it. Obviously it doesn't compile because glb_iface is
not defined :(

Adding a new patch, can you guys R-b this?

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 4bc52b1b1a286..c807b6ce71bd4 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1133,6 +1133,7 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
                 * This is not needed on a slow reset because FW sections are
                 * re-initialized.
                 */
+               struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
                panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
 
                ret = panthor_fw_start(ptdev);


Best regards,
Liviu

> 
> > ---
> > v2:
> > - clarify comments and commit message with regards to when to clear the
> >   GLB_HALT flag.
> > 
> >  drivers/gpu/drm/panthor/panthor_fw.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> > index ecca5565ce41..4bc52b1b1a28 100644
> > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -1098,17 +1098,11 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
> >  		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
> >  		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> >  		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
> > -					status == MCU_STATUS_HALT, 10, 100000) &&
> > -		    glb_iface->output->halt_status == PANTHOR_FW_HALT_OK) {
> > +					status == MCU_STATUS_HALT, 10, 100000)) {
> >  			ptdev->fw->fast_reset = true;
> >  		} else {
> >  			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
> >  		}
> > -
> > -		/* The FW detects 0 -> 1 transitions. Make sure we reset
> > -		 * the HALT bit before the FW is rebooted.
> > -		 */
> > -		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
> >  	}
> >  
> >  	panthor_job_irq_suspend(&ptdev->fw->irq);
> > @@ -1134,6 +1128,13 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
> >  	 * the FW sections. If it fails, go for a full reset.
> >  	 */
> >  	if (ptdev->fw->fast_reset) {
> > +		/* The FW detects 0 -> 1 transitions. Make sure we reset
> > +		 * the HALT bit before the FW is rebooted.
> > +		 * This is not needed on a slow reset because FW sections are
> > +		 * re-initialized.
> > +		 */
> > +		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
> > +
> >  		ret = panthor_fw_start(ptdev);
> >  		if (!ret)
> >  			goto out;
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
