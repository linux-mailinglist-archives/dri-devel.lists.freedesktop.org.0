Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92739959FD6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE74510E629;
	Wed, 21 Aug 2024 14:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFPK5kx7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C951010E624;
 Wed, 21 Aug 2024 14:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724250556; x=1755786556;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=98QAE7ItP2BlAUleCeafWZoHAeuINxbGXnaC6eY7i5c=;
 b=cFPK5kx74p3gsVjcu8MbAa2rpjlYCdoT48zpYVLJt29UDLDCq8fhUR/D
 N8fLBBqF/RY6hSmZ+JAraNV0BdN9QSRA6Q7hlPXJWwJnswc/Wnq2/4d9G
 4ilKwOZldsCmNOIUvUt8wK+DNxlaC5Udo2yXf2DpYTQkuiRSDY757zl/h
 ODspuFx52nIhU45d7rXqlKEvoTDUt+Jvg9rE4K5Rs4HyvDCENjZTpQyYz
 5Pt6p11XzUqoYKdM0N1xVaCSD44FI2WMxNFZxFZ+K/22rDc3kYASsrcNM
 3vA4qFcStTjeVv1j5OZozKj/3vXIgXyq5MlvZuyS4PAodJIsK4lilSeOX g==;
X-CSE-ConnectionGUID: XzsDLS48S4qiEYx7tdIDog==
X-CSE-MsgGUID: 2jcnWq45S6i1dg368CTOEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22225954"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22225954"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:29:15 -0700
X-CSE-ConnectionGUID: Er23HT5WQEyERoEPEJh7mg==
X-CSE-MsgGUID: bPZThqT6SiGIUTDKbrS3dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65997414"
Received: from sbutnari-mobl1.ti.intel.com (HELO localhost) ([10.245.246.20])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 07:29:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, airlied@gmail.com, daniel@ffwll.ch,
 lucas.demarchi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/xe: Support 'nomodeset' kernel command-line option
In-Reply-To: <172424976000.2071.18125280900868355577@gjsousa-mobl2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240821135750.102117-1-tzimmermann@suse.de>
 <172424976000.2071.18125280900868355577@gjsousa-mobl2>
Date: Wed, 21 Aug 2024 17:29:05 +0300
Message-ID: <87plq23q6m.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 21 Aug 2024, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> Quoting Thomas Zimmermann (2024-08-21 10:56:59-03:00)
>>Setting 'nomodeset' on the kernel command line disables all graphics
>>drivers with modesetting capabilities; leaving only firmware drivers,
>>such as simpledrm or efifb.
>>
>>Most DRM drivers automatically support 'nomodeset' via DRM's module
>>helper macros. In xe, which uses regular module_init(), manually call
>>drm_firmware_drivers_only() to test for 'nomodeset'. Do not register
>>the driver if set.
>>
>>Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>---
>> drivers/gpu/drm/xe/xe_module.c | 5 +++++
>> 1 file changed, 5 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>>index 923460119cec..60fb7dd26903 100644
>>--- a/drivers/gpu/drm/xe/xe_module.c
>>+++ b/drivers/gpu/drm/xe/xe_module.c
>>@@ -8,6 +8,8 @@
>> #include <linux/init.h>
>> #include <linux/module.h>
>> 
>>+#include <drm/drm_module.h>
>>+
>> #include "xe_drv.h"
>> #include "xe_hw_fence.h"
>> #include "xe_pci.h"
>>@@ -92,6 +94,9 @@ static int __init xe_init(void)
>> {
>>         int err, i;
>> 
>>+        if (drm_firmware_drivers_only())
>>+                return -ENODEV;
>>+
>
> Hm... But what if xe is to be used only for compute or render? Shouldn't
> we handle this somewhere else?

The question becomes, what does "nomodeset" really mean here?

See what i915 does in i915_module.c.

Cc: Sima.

BR,
Jani.



>
> Taking a quick look, xe_display_probe() might be a good candidate?
>
> --
> Gustavo Sousa
>
>>         for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
>>                 err = init_funcs[i].init();
>>                 if (err) {
>>-- 
>>2.46.0
>>

-- 
Jani Nikula, Intel
