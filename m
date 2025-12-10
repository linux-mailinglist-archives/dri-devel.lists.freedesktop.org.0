Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6ABCB3849
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 17:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E2210E173;
	Wed, 10 Dec 2025 16:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA2C010E173
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 16:48:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18199153B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 08:48:09 -0800 (PST)
Received: from [10.2.10.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 1BC773F73B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 08:48:15 -0800 (PST)
Date: Wed, 10 Dec 2025 16:47:52 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Rahul Kumar <rk0006818@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] drm/komeda: Convert logging to drm_* helpers
Message-ID: <aTmkOCE5M7fJeuPo@e142607>
References: <20251118105934.748955-1-rk0006818@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118105934.748955-1-rk0006818@gmail.com>
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

Hi Rahul,

Appologies for the amount of time it took me to get to review the series,
I hope this is a one-off instance.

On Tue, Nov 18, 2025 at 04:29:31PM +0530, Rahul Kumar wrote:
> This series converts Komeda logging from the legacy DRM_ERROR/WARN/INFO()
> and DRM_DEBUG() macros to the modern drm_*() helpers. The drm_*() helpers
> take a struct drm_device * and allow the DRM core to include device
> information in the log output. This improves readability and brings the
> driver in line with current DRM logging guidelines.
> 
> To support this conversion, a small Komeda internal header
> (komeda_drv.h) is introduced to provide access to struct komeda_drv
> where needed. No functional changes are intended.

Here are some comments for the general direction of the patches that can
help you improve the series.

First, you don't need to expose the structure komeda_drv, as that is meant
to be internal to komeda_drv.c. What you can do is take inspiration from the
function following the definition of the structure and add a new accessor,
something like this:

--8<------------------------
+struct komeda_kms_dev *dev_to_kmsdev(struct device *dev)
+{
+	struct komeda_drv *mdrv = dev_get_drvdata(dev);
+
+	return mdrv ? mdrv->kms : NULL;
+}
-->8------------------------

Then you can reduce the boilerplate code that you have spread through your
patches to just calling this function to get the komeda_kms_dev. Alternatively,
you can make the function to return a struct drm_device *.

If you read through the code and try to understand its structure you will
realise that there is a top-down organisation of concepts, from a drm_device
down to a komeda_dev that is trying to abstract the hardware differences
between D71 and future Arm Display IP. But some functions, like komeda_pipeline_dump()
are only used in a limited scope, which means you could add the drm_device pointer
to the function signature because komeda_crtc_add() is the only caller of that
function and it already has drm_device pointer, so no point into going through hoops
to get it inside komeda_pipeline_dump().

Another thing that you can do with the series is to be comprehensive and
remove ALL calls to DRM_ERROR/WARN/INFO/DEBUG() where appropriate (leaving
the probe call path untouched as the drm_device is not valid yet).
komeda_pipeline_state.c, komeda_wb_connector.c and komeda_framebuffer.c
should at minimum be cleaned up as well.

There is a third thing that can be done, but that's not on you. komeda
driver is a bit too verbose with the error and debug messages and I could
just go and remove them as they don't add too much information unless
you're doing bring up on a new platform.


Best regards,
Liviu

> 
> Changes in v2:
> - Corrected the use of dev_get_drvdata(); it returns struct komeda_drv *,
>   not struct komeda_kms_dev *.
> - Added komeda_drv.h to make struct komeda_drv available for logging
>   conversion.
> - Split the series into 3 small patches as requested.
> 
> Rahul Kumar (3):
>   drm/komeda: Add komeda_drv.h to make struct komeda_drv available
>   drm/komeda: Convert logging in komeda_pipeline.c to drm_* with
>   drm_device parameter
>   drm/komeda: Convert logging in d71_dev.c to drm_* with drm_device
>   parameter
> 
>  .../gpu/drm/arm/display/komeda/d71/d71_dev.c  | 24 +++++---
>  .../gpu/drm/arm/display/komeda/komeda_drv.c   |  6 +-
>  .../gpu/drm/arm/display/komeda/komeda_drv.h   | 24 ++++++++
>  .../drm/arm/display/komeda/komeda_pipeline.c  | 61 +++++++++++++------
>  4 files changed, 84 insertions(+), 31 deletions(-)
>  create mode 100644 drivers/gpu/drm/arm/display/komeda/komeda_drv.h
> 
> -- 
> 2.43.0
> 
