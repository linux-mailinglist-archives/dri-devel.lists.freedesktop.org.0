Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BD0A17A81
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 10:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9EB10E522;
	Tue, 21 Jan 2025 09:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OBYQEhn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748FD10E522
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 09:52:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F7871BF207;
 Tue, 21 Jan 2025 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737453101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8w+0Nos1+r32YTPnT8+vmSMEx9XcndSwe6RADc2G9g=;
 b=OBYQEhn1Bn/NZBDLwe9Lcjy3iPoilhgi4zy/aWB70u06DkODD41o3Vy4aZiwaNrleoHGeH
 RO7f5OtDdPQIi8g4kQ2O1fLRYk2knF2qqBac4UhtDUWK0sVQOSXYM3tXwKjbhkhAexK9uh
 kf487SzYZZbQbAVFJv1PMrFasiB1fH2ZyYmbFXgf1jQrM/Dbker2fWnV95xri+hncwbu/a
 LRBHYqBMdBdUIM6OGiUNzPnsNTDd49xOmEN3pj5iM695XtMo/IPWmsggpwAVK4+B3FLMXs
 St3MWEHRoay4J30G1YPReBWOXOmLfazx0k1ZCENK+E93XlNeAlVzuOTC3uFvIQ==
Date: Tue, 21 Jan 2025 10:51:37 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH v9 0/8] drm/vkms: Switch all vkms object to DRM managed
 objects
Message-ID: <Z49uKbr9x9VG2oL2@louis-chauvet-laptop>
Mail-Followup-To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
References: <20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 16/01/25 - 18:47, Louis Chauvet wrote:
> To simplify the memory managment, this series replace all manual drm
> object managment by drm-managed one. This way the VKMS code don't have to
> manage it directly and the DRM core will handle the object destruction.
> 
> No functional changes are intended in this series.
> 
> PATCH 1/8: Migrate connector managment to drmm
> PATCH 2/8: Migrate encoder managment to drmm
> PATCH 3/8: Add helper to allocate workqueue
> PATCH 4/8: Migrate CRTC management to drm
> PATCH 5/8: Create a helper to initialize drm_writeback_connector (common
>            part between drmm and normal variants)
> PATCH 6/8: Ensure the proper clean of drm_writeback_connector after a
>            failure during init
> PATCH 7/8: Create the drmm initialization for drm_writeback_connector
> PATCH 8/8: Migrate writeback connector management to drm
> 
> For the drmm_writeback helpers, you can find some discussions here [3].
> 
> [3]:https://lore.kernel.org/all/20240906-writeback-drmm-v1-1-01ede328182c@bootlin.com/
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Applied on drm-misc-next, thanks.

Louis Chauvet

> ---
> Changes in v9:
> - Move function definition in the correct patch (they were not used 
>   anymore in the original patch, I missed this since the v7, thanks 
>   kernel bot)
> - Link to v8: https://lore.kernel.org/r/20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com
> 
> Changes in v8:
> - Add the helper to allocate workqueue with drmm managment
> - Reorder includes
> - Link to v7: https://lore.kernel.org/r/20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com
> 
> Changes in v7:
> - Add Reviewed-by
> - Merge PATCH 4/8 and 5/8 as the function were statics
> - PATCH 6/7: Remove optional parameter for encoder
> - PATCH 7/7: Create dedicated encoder for vkms writeback connector
> - Removed useless cleanup in PATCH 6/8
> - Link to v6: https://lore.kernel.org/r/20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com
> 
> Changes in v6:
> - Added R-by
> - Splited the drmm_writeback_connector init in multiple commits + rework 
>   how it is done. This time it should not change the behavior of existing 
>   drivers
> - Link to v5: https://lore.kernel.org/r/20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com
> 
> Changes in v5:
> - Rebased on drm-misc-next
> - Link to v4: https://lore.kernel.org/r/20241010-google-vkms-managed-v4-0-ed04a62ad2e3@bootlin.com
> 
> Changes in v4:
> - No changes for the managed part
> - Add the patch to introduce drmm_writeback helpers
> - Link to v3: https://lore.kernel.org/r/20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com
> 
> Changes in v3:
> - As suggested by Maxime, split the managed and the dynamic allocation
>   parts in different series
> - To reduce the diff in this series, extract the "remove crtc index" part,
>   see https://lore.kernel.org/all/20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com/
> - Link to v2: https://lore.kernel.org/r/20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com
> 
> Changes in v2:
> - Applied comments from José
> - Extract the rename vkms_output -> vkms_crtc to avoid useless changes in
>   the last commit
> - Extract the rename to_vkms_crtc_state to
>   drm_crtc_state_to_vkms_crtc_state to avoid useless changes in last
>   commit
> - Extract the drm_mode_crtc_set_gamma_size result check in its own commit
> - Rebased on drm-misc/drm-misc-next
> - Link to v1: https://lore.kernel.org/r/20240814-google-vkms-managed-v1-0-7ab8b8921103@bootlin.com
> 
> ---
> Louis Chauvet (8):
>       drm/vkms: Switch to managed for connector
>       drm/vkms: Switch to managed for encoder
>       drm/managed: Add DRM-managed alloc_ordered_workqueue
>       drm/vkms: Switch to managed for crtc
>       drm: writeback: Create an helper for drm_writeback_connector initialization
>       drm: writeback: Add missing cleanup in case of initialization failure
>       drm: writeback: Create drmm variants for drm_writeback_connector initialization
>       drm/vkms: Switch to managed for writeback connector
> 
>  drivers/gpu/drm/drm_managed.c         |   8 ++
>  drivers/gpu/drm/drm_writeback.c       | 184 +++++++++++++++++++++++++++++-----
>  drivers/gpu/drm/vkms/vkms_crtc.c      |   5 +-
>  drivers/gpu/drm/vkms/vkms_drv.c       |   9 --
>  drivers/gpu/drm/vkms/vkms_drv.h       |   3 +-
>  drivers/gpu/drm/vkms/vkms_output.c    |  26 ++---
>  drivers/gpu/drm/vkms/vkms_writeback.c |  21 ++--
>  include/drm/drm_managed.h             |  12 +++
>  include/drm/drm_writeback.h           |   6 ++
>  9 files changed, 210 insertions(+), 64 deletions(-)
> ---
> base-commit: 6e11ce84c514f3ad8c8c766e1328bf49d80a0325
> change-id: 20240521-google-vkms-managed-4aec99461a77
> 
> Best regards,
> -- 
> Louis Chauvet <louis.chauvet@bootlin.com>
> 
