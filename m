Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE11B3FA4A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC44C10E616;
	Tue,  2 Sep 2025 09:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="m449y+po";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C2610E616
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:27:54 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5829RbNs2954196;
 Tue, 2 Sep 2025 04:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756805257;
 bh=vE9iAHYq75eYvQEHVqllo047tep+ROLMiBTF8/YwkvE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=m449y+poAqcKE9AbgacHKx8a4ooNXiuTqSKcAce+qjTZTPPJLr86yNO08LUkddkNZ
 bTBIdiBBrzEq7i8IocdRWp927WJ+qXDCSK+J65OGtZyhtJbcgVnO3yZMGNLZ8E9yjz
 +1EyM2xrmAUL3Dp6e534kaxJeYGVTOFsP//5S3qE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5829RbJj3384826
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 2 Sep 2025 04:27:37 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 04:27:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 04:27:36 -0500
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5829RTbJ3567947;
 Tue, 2 Sep 2025 04:27:30 -0500
Message-ID: <7c0957a9-a970-4332-9df9-26ba432a0aec@ti.com>
Date: Tue, 2 Sep 2025 14:57:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] drm/bridge: cadence: cdns-mhdp8546-core: Set the
 mhdp connector earlier in atomic_enable()
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
 <20250811075904.1613519-4-h-shenoy@ti.com>
 <6fa1a8d5-149e-437d-aef0-587c49957197@ideasonboard.com>
Content-Language: en-US
From: Harikrishna Shenoy <h-shenoy@ti.com>
In-Reply-To: <6fa1a8d5-149e-437d-aef0-587c49957197@ideasonboard.com>
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


On 9/1/25 15:35, Tomi Valkeinen wrote:
> Hi,
>
> On 11/08/2025 10:59, Harikrishna Shenoy wrote:
>> From: Jayesh Choudhary <j-choudhary@ti.com>
>>
>> In case if we get errors in cdns_mhdp_link_up() or cdns_mhdp_reg_read()
>> in atomic_enable, we will go to cdns_mhdp_modeset_retry_fn() and will hit
>> NULL pointer while trying to access the mutex. We need the connector to
>> be set before that. Unlike in legacy !(DBANC) cases, we do not have
>> connector initialised in bridge_attach(). So set the mhdp->connector
>> in atomic_enable() earlier to avoid possible NULL pointer.
>>
>> Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 20 +++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> index c2ce3d6e5a88..b2f5a48cac2d 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> @@ -1759,12 +1759,21 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
>>   	struct drm_bridge_state *new_state;
>>   	const struct drm_display_mode *mode;
>>   	u32 resp;
>> -	int ret;
>> +	int ret = 0;
>>   
>>   	dev_dbg(mhdp->dev, "bridge enable\n");
>>   
>>   	mutex_lock(&mhdp->link_mutex);
>>   
>> +	mhdp->connector = drm_atomic_get_new_connector_for_encoder(state,
>> +								   bridge->encoder);
>> +	if (WARN_ON(!mhdp->connector))
>> +		goto out;
>> +
>> +	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector);
>> +	if (WARN_ON(!conn_state))
>> +		goto out;
> You are just moving code here, but... Shouldn't these be errors? If I
> read this right, ret is 0 here, and thus if we hit either of those
> issues above, we'll return 0.
>
>   Tomi
>
This is a void function, no need to return
>> +
>>   	if (mhdp->plugged && !mhdp->link_up) {
>>   		ret = cdns_mhdp_link_up(mhdp);
>>   		if (ret < 0)
>> @@ -1784,15 +1793,6 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
>>   	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
>>   			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
>>   
>> -	mhdp->connector = drm_atomic_get_new_connector_for_encoder(state,
>> -								   bridge->encoder);
>> -	if (WARN_ON(!mhdp->connector))
>> -		goto out;
>> -
>> -	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector);
>> -	if (WARN_ON(!conn_state))
>> -		goto out;
>> -
>>   	if (mhdp->hdcp_supported &&
>>   	    mhdp->hw_state == MHDP_HW_READY &&
>>   	    conn_state->content_protection ==
