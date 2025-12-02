Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B55EC9B9C4
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 14:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E4F10E648;
	Tue,  2 Dec 2025 13:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A7AFC10E648
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 13:34:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6F2D153B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 05:33:59 -0800 (PST)
Received: from [10.2.10.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 EA09B3F66E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 05:34:06 -0800 (PST)
Date: Tue, 2 Dec 2025 13:33:43 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Rahul Kumar <rk0006818@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/komeda: Convert logging in d71_dev.c to drm_*
 with drm_device parameter
Message-ID: <aS7qty8ABRjwQWaF@e142607>
References: <20251118105934.748955-1-rk0006818@gmail.com>
 <20251118105934.748955-4-rk0006818@gmail.com>
 <CAKY2RyYgvr3z_KZKjEgcVLqKZ8Sq0hb+eoXkhFTPfFqU3N=STg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKY2RyYgvr3z_KZKjEgcVLqKZ8Sq0hb+eoXkhFTPfFqU3N=STg@mail.gmail.com>
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

On Tue, Nov 25, 2025 at 12:15:28PM +0530, Rahul Kumar wrote:
> Hi Liviu,

Hi Rahul,

Sorry, you caught me with your new series just before going on holiday so
did not started the review. Since coming back I had some other internal
issues to take care of, I will have a look at your series next week when
I should have more time for it.

Best regards,
Liviu

> 
> On Tue, Nov 18, 2025 at 4:32 PM Rahul Kumar <rk0006818@gmail.com> wrote:
> >
> > Replace DRM_DEBUG() and DRM_ERROR() calls in
> > drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c with the
> > drm_dbg() and drm_err() helpers in functions where a drm_device
> > parameter is available.
> >
> > The drm_*() logging macros require a struct drm_device * parameter,
> > which allows the DRM core to prefix log messages with the device
> > instance. This improves debugging clarity when multiple Komeda or
> > other DRM devices are present.
> >
> > Logging in early hardware probing functions such as d71_identify()
> > is intentionally left unchanged because they do not have access to
> > a drm_device pointer at that stage of initialization.
> >
> > This conversion follows the DRM TODO entry:
> > "Convert logging to drm_* functions with drm_device parameter".
> >
> > Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
> > ---
> > Changes since v1:
> > - Fixed incorrect use of dev_get_drvdata(): it returns struct komeda_drv *,
> >   not struct komeda_kms_dev *, as pointed out by Liviu Dudau.
> > - Updated DRM device pointer retrieval to use drv->kms.
> > - Combined both changes into a 0/3 series.
> > Link to v1:
> > https://lore.kernel.org/all/aRdT1qscQqO7-U6h@e110455-lin.cambridge.arm.com/
> > ---
> >  .../gpu/drm/arm/display/komeda/d71/d71_dev.c  | 24 +++++++++++++------
> >  1 file changed, 17 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> > index 80973975bfdb..39c51bbe2bb9 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> > +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> > @@ -9,6 +9,7 @@
> >  #include <drm/drm_print.h>
> >  #include "d71_dev.h"
> >  #include "malidp_io.h"
> > +#include "komeda_drv.h"
> >
> >  static u64 get_lpu_event(struct d71_pipeline *d71_pipeline)
> >  {
> > @@ -348,6 +349,9 @@ static void d71_cleanup(struct komeda_dev *mdev)
> >
> >  static int d71_enum_resources(struct komeda_dev *mdev)
> >  {
> > +       struct komeda_drv *drv = dev_get_drvdata(mdev->dev);
> > +       struct komeda_kms_dev *kms = drv->kms;
> > +       struct drm_device *drm = &kms->base;
> >         struct d71_dev *d71;
> >         struct komeda_pipeline *pipe;
> >         struct block_header blk;
> > @@ -366,7 +370,7 @@ static int d71_enum_resources(struct komeda_dev *mdev)
> >
> >         err = d71_reset(d71);
> >         if (err) {
> > -               DRM_ERROR("Fail to reset d71 device.\n");
> > +               drm_err(drm, "Fail to reset d71 device.\n");
> >                 goto err_cleanup;
> >         }
> >
> > @@ -376,8 +380,8 @@ static int d71_enum_resources(struct komeda_dev *mdev)
> >         d71->num_pipelines = (value >> 8) & 0x7;
> >
> >         if (d71->num_pipelines > D71_MAX_PIPELINE) {
> > -               DRM_ERROR("d71 supports %d pipelines, but got: %d.\n",
> > -                         D71_MAX_PIPELINE, d71->num_pipelines);
> > +               drm_err(drm, "d71 supports %d pipelines, but got: %d.\n",
> > +                       D71_MAX_PIPELINE, d71->num_pipelines);
> >                 err = -EINVAL;
> >                 goto err_cleanup;
> >         }
> > @@ -455,8 +459,8 @@ static int d71_enum_resources(struct komeda_dev *mdev)
> >                 offset += D71_BLOCK_SIZE;
> >         }
> >
> > -       DRM_DEBUG("total %d (out of %d) blocks are found.\n",
> > -                 i, d71->num_blocks);
> > +       drm_dbg(drm, "total %d (out of %d) blocks are found.\n",
> > +               i, d71->num_blocks);
> >
> >         return 0;
> >
> > @@ -555,6 +559,9 @@ static void d71_init_fmt_tbl(struct komeda_dev *mdev)
> >
> >  static int d71_connect_iommu(struct komeda_dev *mdev)
> >  {
> > +       struct komeda_drv *drv = dev_get_drvdata(mdev->dev);
> > +       struct komeda_kms_dev *kms = drv->kms;
> > +       struct drm_device *drm = &kms->base;
> >         struct d71_dev *d71 = mdev->chip_data;
> >         u32 __iomem *reg = d71->gcu_addr;
> >         u32 check_bits = (d71->num_pipelines == 2) ?
> > @@ -569,7 +576,7 @@ static int d71_connect_iommu(struct komeda_dev *mdev)
> >         ret = dp_wait_cond(has_bits(check_bits, malidp_read32(reg, BLK_STATUS)),
> >                         100, 1000, 1000);
> >         if (ret < 0) {
> > -               DRM_ERROR("timed out connecting to TCU!\n");
> > +               drm_err(drm, "timed out connecting to TCU!\n");
> >                 malidp_write32_mask(reg, BLK_CONTROL, 0x7, INACTIVE_MODE);
> >                 return ret;
> >         }
> > @@ -582,6 +589,9 @@ static int d71_connect_iommu(struct komeda_dev *mdev)
> >
> >  static int d71_disconnect_iommu(struct komeda_dev *mdev)
> >  {
> > +       struct komeda_drv *drv = dev_get_drvdata(mdev->dev);
> > +       struct komeda_kms_dev *kms = drv->kms;
> > +       struct drm_device *drm = &kms->base;
> >         struct d71_dev *d71 = mdev->chip_data;
> >         u32 __iomem *reg = d71->gcu_addr;
> >         u32 check_bits = (d71->num_pipelines == 2) ?
> > @@ -593,7 +603,7 @@ static int d71_disconnect_iommu(struct komeda_dev *mdev)
> >         ret = dp_wait_cond(((malidp_read32(reg, BLK_STATUS) & check_bits) == 0),
> >                         100, 1000, 1000);
> >         if (ret < 0) {
> > -               DRM_ERROR("timed out disconnecting from TCU!\n");
> > +               drm_err(drm, "timed out disconnecting from TCU!\n");
> >                 malidp_write32_mask(reg, BLK_CONTROL, 0x7, INACTIVE_MODE);
> >         }
> >
> > --
> > 2.43.0
> 
> 
> Just following up on my v2 Komeda logging patch series.
> Please let me know if any changes or suggestions are needed.
> 
> Thanks,
> Rahul
