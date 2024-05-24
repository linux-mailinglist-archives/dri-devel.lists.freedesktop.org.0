Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F3F8CE52E
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 14:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F7110F181;
	Fri, 24 May 2024 12:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="wEv8x/8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F3110EB24
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 12:24:27 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44OCOAeB072566;
 Fri, 24 May 2024 07:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1716553450;
 bh=3qMBw6WRH8Qi98NWykEp6y7Qays0g4/TXrxegpA4IRg=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=wEv8x/8u7GA+R60hURzHW2DHcLRKNDLaSzbzJ5xtKx2Zyas18lPRLGu33jmOqCgYy
 zd8R4KRTUWOSUQDCp42AzAXGuIwoQhcAPggFV9wz8ixKQAnpZIBx6knsskXX69QBdd
 brlOEHu7XruS4mfYBvkIR2bRZkjnXX6dhAtdFvj4=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44OCOAET003898
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 24 May 2024 07:24:10 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 May 2024 07:24:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 May 2024 07:24:09 -0500
Received: from [172.24.227.102]
 (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com [172.24.227.102] (may be
 forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44OCO4k8051568;
 Fri, 24 May 2024 07:24:05 -0500
Message-ID: <4cd64cf5-d2b0-4aa9-b958-6b6fc54f0bf2@ti.com>
Date: Fri, 24 May 2024 17:54:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/bridge: sii902x: Fix mode_valid hook
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <sam@ravnborg.org>,
 <mripard@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <a-bhatia1@ti.com>
References: <20240524093509.127189-1-j-choudhary@ti.com>
 <20240524093509.127189-2-j-choudhary@ti.com>
 <y6ersd72tp2d6k4i2hja7bg37lahnvye2qion67urxeakw6rju@dher7oomt2ks>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <y6ersd72tp2d6k4i2hja7bg37lahnvye2qion67urxeakw6rju@dher7oomt2ks>
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

Hello Dmitry,

On 24/05/24 15:11, Dmitry Baryshkov wrote:
> On Fri, May 24, 2024 at 03:05:08PM +0530, Jayesh Choudhary wrote:
>> Currently, mode_valid hook returns all mode as valid and it is
>> defined only in drm_connector_helper_funcs. With the introduction of
>> 'DRM_BRIDGE_ATTACH_NO_CONNECTOR', connector is not initialized in
>> bridge_attach call for cases when the encoder has this flag enabled.
>> So add the mode_valid hook in drm_bridge_funcs as well with proper
>> clock checks for maximum and minimum pixel clock supported by the
>> bridge.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

[...]

>> +
>>   static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
>>   					       struct drm_display_mode *mode)
>>   {
>> -	/* TODO: check mode */
>> +	struct sii902x *sii902x = connector_to_sii902x(connector);
>> +	const struct drm_display_mode *mod = mode;
>>   
>> -	return MODE_OK;
>> +	return sii902x_validate(sii902x, mod);
> 
> There is no need to. The drm_bridge_chain_mode_valid() should take care
> of calling bridge's mode_valid callback and rejecting the mode if it is
> not accepted.

I need some clarity here.

IIRC, if the bridge does initialize the connector in case
where the encoder does not attach the bridge with the
DRM_BRIDGE_ATTACH_NO_CONNECTOR (DBANC) flag (referring to tidss
encoder before we implemented the DBANC feature), then
drm_connector_helper_func are called and drm_bridge_funcs
are NOT called (atleast from what I have seen in detect
hook for cdns-mhdp-8546 driver which is there in both
structures).

I do not have any platform to test non-DBANC encoders.
And I did not want to break any platform that were still using
bridge_attach without DBANC flag.
That is why I kept mode_valid hook in both structures.

Are you implying that if connector_helper_funcs are not there
then there will be some sort of fallback to bridge_funcs instead
of passthrough for mode_valid check? Because that goes against my
previous observations.

Thanks,
Jayesh


