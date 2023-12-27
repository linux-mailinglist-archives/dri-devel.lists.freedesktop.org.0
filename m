Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C237381EEA1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Dec 2023 12:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6E610E03F;
	Wed, 27 Dec 2023 11:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E8110E03F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Dec 2023 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703677582; x=1735213582;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1Bjx7OKO39EhVcJGank6x7a0zGDB7Cr7ZQja2Edjt3s=;
 b=FLur9a1IQpCbnUJk1YyFBWDKEk0ed/+mH9ExXhOcGXj+B+0X+A4eJCVN
 TRVl5wqiClZjT1rRedBuIyb3l1TvGyvHtZ5zcdYOMRcKn6cH9Tx+GXBh2
 Iu97f3c+R595eFdCpoV9274YnQ6UxMkEMgdyiEjR017nYpy5CF81wIvs1
 CnEFh0vcC4UaK7jPce3YO/g+FDVtjTU/rqDQtSx2mjNTLJzUW4Bxle2SY
 PVZTB9soaHY4JlZzRrjWgi04XCnt++1850Q3VZQ0SWGskj2p6jWJ8LznG
 sIkSwmgVyWqnMmLUaI7fnvjI3ceb6tQUSvGnUB87942CHlwvZTKPkVwP/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="386866868"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; d="scan'208";a="386866868"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 03:45:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="848664647"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; d="scan'208";a="848664647"
Received: from imsoderb-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.35.36])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 03:45:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm/bridge: add ->edid_read hook and
 drm_bridge_edid_read()
In-Reply-To: <CAA8EJprSKWXZ20-=1-Wx+TkG+6BnYMvqTwtqFA1nwFr=6Rn1Xw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1698312534.git.jani.nikula@intel.com>
 <daa4703cc30ee05836fb477a1a8da4b89a391afd.1698312534.git.jani.nikula@intel.com>
 <CAA8EJprSKWXZ20-=1-Wx+TkG+6BnYMvqTwtqFA1nwFr=6Rn1Xw@mail.gmail.com>
Date: Wed, 27 Dec 2023 13:45:34 +0200
Message-ID: <877ckzswbl.fsf@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Dec 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Thu, 26 Oct 2023 at 12:40, Jani Nikula <jani.nikula@intel.com> wrote:
>>
>> Add new struct drm_edid based ->edid_read hook and
>> drm_bridge_edid_read() function to call the hook.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_bridge.c | 46 +++++++++++++++++++++++++++++++++++-
>>  include/drm/drm_bridge.h     | 33 ++++++++++++++++++++++++++
>>  2 files changed, 78 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index 30d66bee0ec6..e1cfba2ff583 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -27,8 +27,9 @@
>>  #include <linux/mutex.h>
>>
>>  #include <drm/drm_atomic_state_helper.h>
>> -#include <drm/drm_debugfs.h>
>>  #include <drm/drm_bridge.h>
>> +#include <drm/drm_debugfs.h>
>> +#include <drm/drm_edid.h>
>>  #include <drm/drm_encoder.h>
>>  #include <drm/drm_file.h>
>>  #include <drm/drm_of.h>
>> @@ -1206,6 +1207,47 @@ int drm_bridge_get_modes(struct drm_bridge *bridge,
>>  }
>>  EXPORT_SYMBOL_GPL(drm_bridge_get_modes);
>>
>> +/**
>> + * drm_bridge_edid_read - read the EDID data of the connected display
>> + * @bridge: bridge control structure
>> + * @connector: the connector to read EDID for
>> + *
>> + * If the bridge supports output EDID retrieval, as reported by the
>> + * DRM_BRIDGE_OP_EDID bridge ops flag, call &drm_bridge_funcs.edid_read to get
>> + * the EDID and return it. Otherwise return NULL.
>> + *
>> + * If &drm_bridge_funcs.edid_read is not set, fall back to using
>> + * drm_bridge_get_edid() and wrapping it in struct drm_edid.
>> + *
>> + * RETURNS:
>> + * The retrieved EDID on success, or NULL otherwise.
>
> Wouldn't it be better to return an ERR_PTR instead of NULL?

I don't think so. The existing drm_bridge_get_edid() returns NULL on
errors. The ->get_edid hook returns NULL on errors. The new ->edid_read
returns NULL on errors. The drm_get_edid() and drm_edid_read() functions
return NULL on errors.

It would be surprising if one of the functions started returning error
pointers.

I don't see any added benefit with error pointers here. The ->edid_read
hook could be made to return error pointers too, but then there's quite
the burden in making all drivers return sensible values where the
difference in error code actually matters. And which error scenarios do
we want to differentiate here? How should we handle them differently?


BR,
Jani.


>
>> + */
>> +const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
>> +                                           struct drm_connector *connector)
>> +{
>> +       if (!(bridge->ops & DRM_BRIDGE_OP_EDID))
>> +               return NULL;
>> +
>> +       /* Transitional: Fall back to ->get_edid. */
>> +       if (!bridge->funcs->edid_read) {
>> +               const struct drm_edid *drm_edid;
>> +               struct edid *edid;
>> +
>> +               edid = drm_bridge_get_edid(bridge, connector);
>> +               if (!edid)
>> +                       return NULL;
>> +
>> +               drm_edid = drm_edid_alloc(edid, (edid->extensions + 1) * EDID_LENGTH);
>> +
>> +               kfree(edid);
>> +
>> +               return drm_edid;
>> +       }
>> +
>> +       return bridge->funcs->edid_read(bridge, connector);
>> +}
>> +EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
>
> [skipped the rest]

-- 
Jani Nikula, Intel
