Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B918D3861
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 15:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8727B113B21;
	Wed, 29 May 2024 13:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYLSbycw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBBC113B1F;
 Wed, 29 May 2024 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716990692; x=1748526692;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=4qG4dad29dPTvZyqQLXRikddg2y7NmdD+VTC9hKpIPE=;
 b=BYLSbycwjVncgClmsRzXsnhBInZ9R/CQlc4+YDZIZp6b9Jarw3RrCiwj
 Ayn25G+v4Jobl2bGMxkjAKAnJTN3P9Sq1u276Mf37n8IE6eKwfRqDdoey
 F38I+lLLxDBUluOBk6jaxjy9uSelSwQsFekkrzTv1TA634ZLRJTS7W+Ne
 K4nlRfBgjYPsO8GAgSi6fKNy+S2sa+cookUT3JZ8W+EGDvGJTUkaYFqdI
 +k4JcXUzDT2+83KodN8xhnYCanT1JqSZIdZDrT7zEmBDV00WMAhdJOWHs
 Uk8tY5uNhKjl4yTQir2E8JdZhVCrX0hip9EF1jx0CAN7D6GmQRC3ObuM6 A==;
X-CSE-ConnectionGUID: EWZGcBvWTceAEBNu+6peLA==
X-CSE-MsgGUID: lqwK8S36TxWyJttFypMSFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13558544"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13558544"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 06:51:31 -0700
X-CSE-ConnectionGUID: aFSTnD87RZ2C1kyGZFNVww==
X-CSE-MsgGUID: QENQtQuSRL+hs1haaaXu0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35390243"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.86])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 06:51:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>, Mario Limonciello
 <mario.limonciello@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chris Bainbridge
 <chris.bainbridge@gmail.com>, hughsient@gmail.com
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
In-Reply-To: <CADnq5_OzPT1MVnsqXs2vjr1L2_6jeM6x7jgs4ZtYpNzdDHM6uA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240528210319.1242-1-mario.limonciello@amd.com>
 <CADnq5_OzPT1MVnsqXs2vjr1L2_6jeM6x7jgs4ZtYpNzdDHM6uA@mail.gmail.com>
Date: Wed, 29 May 2024 16:51:35 +0300
Message-ID: <87r0dkiv4o.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 29 May 2024, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Tue, May 28, 2024 at 5:03=E2=80=AFPM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> If the lid on a laptop is closed when eDP connectors are populated
>> then it remains enabled when the initial framebuffer configuration
>> is built.
>>
>> When creating the initial framebuffer configuration detect the ACPI
>> lid status and if it's closed disable any eDP connectors.
>>
>> Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
> Do you have drm-misc access or do you need someone to apply this for you?

I've bounced this to intel-gfx and intel-xe lists to get CI testing. I'd
appreciate holding off on merging until we have results.

Thanks,
Jani.

>
> Alex
>
>> ---
>> Cc: hughsient@gmail.com
>> v1->v2:
>>  * Match LVDS as well
>> ---
>>  drivers/gpu/drm/drm_client_modeset.c | 30 ++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_=
client_modeset.c
>> index 31af5cf37a09..0b0411086e76 100644
>> --- a/drivers/gpu/drm/drm_client_modeset.c
>> +++ b/drivers/gpu/drm/drm_client_modeset.c
>> @@ -8,6 +8,7 @@
>>   */
>>
>>  #include "drm/drm_modeset_lock.h"
>> +#include <acpi/button.h>
>>  #include <linux/module.h>
>>  #include <linux/mutex.h>
>>  #include <linux/slab.h>
>> @@ -257,6 +258,34 @@ static void drm_client_connectors_enabled(struct dr=
m_connector **connectors,
>>                 enabled[i] =3D drm_connector_enabled(connectors[i], fals=
e);
>>  }
>>
>> +static void drm_client_match_edp_lid(struct drm_device *dev,
>> +                                    struct drm_connector **connectors,
>> +                                    unsigned int connector_count,
>> +                                    bool *enabled)
>> +{
>> +       int i;
>> +
>> +       for (i =3D 0; i < connector_count; i++) {
>> +               struct drm_connector *connector =3D connectors[i];
>> +
>> +               switch (connector->connector_type) {
>> +               case DRM_MODE_CONNECTOR_LVDS:
>> +               case DRM_MODE_CONNECTOR_eDP:
>> +                       if (!enabled[i])
>> +                               continue;
>> +                       break;
>> +               default:
>> +                       continue;
>> +               }
>> +
>> +               if (!acpi_lid_open()) {
>> +                       drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is close=
d, disabling\n",
>> +                                   connector->base.id, connector->name);
>> +                       enabled[i] =3D false;
>> +               }
>> +       }
>> +}
>> +
>>  static bool drm_client_target_cloned(struct drm_device *dev,
>>                                      struct drm_connector **connectors,
>>                                      unsigned int connector_count,
>> @@ -844,6 +873,7 @@ int drm_client_modeset_probe(struct drm_client_dev *=
client, unsigned int width,
>>                 memset(crtcs, 0, connector_count * sizeof(*crtcs));
>>                 memset(offsets, 0, connector_count * sizeof(*offsets));
>>
>> +               drm_client_match_edp_lid(dev, connectors, connector_coun=
t, enabled);
>>                 if (!drm_client_target_cloned(dev, connectors, connector=
_count, modes,
>>                                               offsets, enabled, width, h=
eight) &&
>>                     !drm_client_target_preferred(dev, connectors, connec=
tor_count, modes,
>> --
>> 2.43.0
>>

--=20
Jani Nikula, Intel
