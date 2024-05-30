Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7E68D48EC
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 11:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8CE10E083;
	Thu, 30 May 2024 09:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="jNNl3YLE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F240310E083
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 09:50:51 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44U9ofeI000674;
 Thu, 30 May 2024 04:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717062641;
 bh=uxW3c1qum3YvbkJyiB8ZfNCsUxF/LLwa29zaFh9WBSo=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=jNNl3YLEEGo1noulLDWchtMGhwcqU7HMX4oBAWoqivxTgbaVDdQjrkC1FEbSjSyEc
 U+FNpjwRkzY0WqCFIYlhJyggeLdQaktZUp7u2GxJQCJdZSwYc2GRrX96GyNz4Y9eY8
 CWQBpVgeHc26dww5Kkvbmnx6cw+8YHJmuqX0gjh4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44U9ofST063338
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 May 2024 04:50:41 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 04:50:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 04:50:41 -0500
Received: from [172.24.227.102]
 (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com [172.24.227.102])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44U9oZbA020286;
 Thu, 30 May 2024 04:50:36 -0500
Message-ID: <d03478b9-bcfb-41e3-bdbd-7427577a70a0@ti.com>
Date: Thu, 30 May 2024 15:20:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/bridge: Add pixel clock check in atomic_check
To: Maxime Ripard <mripard@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@linaro.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <sam@ravnborg.org>, <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <a-bhatia1@ti.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240530092930.434026-1-j-choudhary@ti.com>
 <20240530092930.434026-3-j-choudhary@ti.com>
 <20240530-spiked-psychedelic-monkey-ddd0b0@houat>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20240530-spiked-psychedelic-monkey-ddd0b0@houat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Hello Maxime,

On 30/05/24 15:04, Maxime Ripard wrote:
> Hi,
> 
> On Thu, May 30, 2024 at 02:59:30PM GMT, Jayesh Choudhary wrote:
>> Check the pixel clock for the mode in atomic_check and ensure that
>> it is within the range supported by the bridge.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   drivers/gpu/drm/bridge/sii902x.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
>> index 6a6055a4ccf9..1bf2f14a772d 100644
>> --- a/drivers/gpu/drm/bridge/sii902x.c
>> +++ b/drivers/gpu/drm/bridge/sii902x.c
>> @@ -494,6 +494,12 @@ static int sii902x_bridge_atomic_check(struct drm_bridge *bridge,
>>   				       struct drm_crtc_state *crtc_state,
>>   				       struct drm_connector_state *conn_state)
>>   {
>> +	if (crtc_state->mode.clock < SII902X_MIN_PIXEL_CLOCK_KHZ)
>> +		return MODE_CLOCK_LOW;
>> +
>> +	if (crtc_state->mode.clock > SII902X_MAX_PIXEL_CLOCK_KHZ)
>> +		return MODE_CLOCK_HIGH;
>> +
> 
> atomic_check doesn't return drm_mode_status but regular error codes (0
> on success, negative error code on failure)

Okay.

Will club together both conditions and return -EINVAL.

Warm Regards,
Jayesh

> 
> Maxime
