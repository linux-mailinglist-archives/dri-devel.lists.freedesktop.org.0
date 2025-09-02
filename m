Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3486DB3FDDE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F023310E671;
	Tue,  2 Sep 2025 11:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="sZG5E+vQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3915410E671
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:35:24 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 582BZ1jH2575507;
 Tue, 2 Sep 2025 06:35:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756812901;
 bh=LtsiDi43sZ0egdYTWICeXiZ2Y/g4jJR93ARityDQGU8=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=sZG5E+vQeh42lR+WCaNwH4Sx88uhhs3FpV7o33YpLKHW8+Dk7eEJaCcAay1bLMZmX
 ncGZevtsGJwzO7f2nk2ZGQaSWHbCxmoSQmgxtjlxzY9x7B9pGhOMRdgkPsS2r3s1QH
 gJTFNg9q3XIziMgELFqduPk7CPmCiAQ1QjJ44W00=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 582BZ1ul3450798
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 2 Sep 2025 06:35:01 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 06:35:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 06:35:00 -0500
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 582BYrx94000852;
 Tue, 2 Sep 2025 06:34:54 -0500
Message-ID: <935869c2-46af-47d4-98d1-bb420e3826b5@ti.com>
Date: Tue, 2 Sep 2025 17:04:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] drm/bridge: cadence: cdns-mhdp8546-core: Handle
 HDCP state in bridge atomic check
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <lyude@redhat.com>,
 <luca.ceresoli@bootlin.com>, <viro@zeniv.linux.org.uk>,
 <andy.yan@rock-chips.com>, <linux@treblig.org>, <javierm@redhat.com>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>,
 <j-choudhary@ti.com>, <u-kumar1@ti.com>, <s-jain1@ti.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <mripard@kernel.org>, <lumag@kernel.org>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>
References: <20250811075904.1613519-1-h-shenoy@ti.com>
 <20250811075904.1613519-7-h-shenoy@ti.com>
 <4e7fb22e-8b15-46e5-906b-9b2aa65f2911@ideasonboard.com>
Content-Language: en-US
From: Harikrishna Shenoy <h-shenoy@ti.com>
In-Reply-To: <4e7fb22e-8b15-46e5-906b-9b2aa65f2911@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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


On 9/1/25 15:48, Tomi Valkeinen wrote:
> Hi,
>
> On 11/08/2025 10:59, Harikrishna Shenoy wrote:
>> Now that we have DBANC framework and legacy connector functions removed,
>> handle the HDCP disabling in bridge atomic check rather than in connector
>> atomic check previously.
> Both this and the patch 4 make me feel a bit confused: In patch 1 a
> bunch of code is removed. Then in patches 4 and 6 we add it back. Yes,
> we don't add it back the same way, but this raises the question if the
> first patch then breaks these two features, until patches 4 and 6 add it
> back.
>
> Or is the case that with DRM_BRIDGE_ATTACH_NO_CONNECTOR, which is the
> way tidss uses this, none of the code removed in patch 1 was even being
> called? And thus, in theory, patches 4 and 6 could even be added before
> patch 1?

Patch 4 and 6 preserve the cases which might miss handling like HDCP 
when removing

bunch of code associated with connector as those are basically rendered 
dead due to

DBANC flag, will recombine these patches (4 and 6) and also be clear 
about the bug fixed


>
> The patches nor the cover letter really explain well what's going on
> here. The "fixes" tags also confuse me. So is the current upstream
> driver working fine or not? Are there bugs? It would be good to fix
> those bugs first, then do the cleanup of removing the old code. Maybe
> that's difficult to do and this patch order makes sense, but it's all
> left very unclear to the reviewer.
>   Tomi
Will respin the series
>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>> ---
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 23 +++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> index 4fb1db3e030c..af41b2908a74 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> @@ -1960,6 +1960,10 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
>>   {
>>   	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
>>   	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>> +	struct drm_connector_state *old_state, *new_state;
>> +	struct drm_atomic_state *state = crtc_state->state;
>> +	struct drm_connector *conn = mhdp->connector;
>> +	u64 old_cp, new_cp;
>>   
>>   	mutex_lock(&mhdp->link_mutex);
>>   
>> @@ -1979,6 +1983,25 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
>>   	if (mhdp->info)
>>   		bridge_state->input_bus_cfg.flags = *mhdp->info->input_bus_flags;
>>   
>> +	if (conn && mhdp->hdcp_supported) {
>> +		old_state = drm_atomic_get_old_connector_state(state, conn);
>> +		new_state = drm_atomic_get_new_connector_state(state, conn);
>> +		old_cp = old_state->content_protection;
>> +		new_cp = new_state->content_protection;
>> +
>> +		if (old_state->hdcp_content_type != new_state->hdcp_content_type &&
>> +		    new_cp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
>> +			new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
>> +			crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
>> +			crtc_state->mode_changed = true;
>> +		}
>> +
>> +		if (!new_state->crtc) {
>> +			if (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
>> +				new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
>> +		}
>> +	}
>> +
>>   	mutex_unlock(&mhdp->link_mutex);
>>   	return 0;
>>   }
