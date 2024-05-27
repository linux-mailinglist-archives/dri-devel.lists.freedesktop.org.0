Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F08CF9FF
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 09:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC07D10F916;
	Mon, 27 May 2024 07:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="DEd+ktRV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B33E10F91A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 07:24:19 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44R7NxZW088786;
 Mon, 27 May 2024 02:23:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1716794639;
 bh=snx6Ph4uQVjQek/swj+K0VorNZB+1Jjhdc3Cuw8ryaI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=DEd+ktRVrjIlbm14MNfdqAYORqaMMqdN5NYOvM4ujIOoycoMApi15Awu+rhO8VW3j
 767GmphGs63Cj3WJyYBtuKEWIFUv0P2oGYlczI8LRDJo4Q53QTQl5PXTae20sBqQLW
 davT8oQMqHh1nKkfioiWv/7COG26jjsAEuAcGbDg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44R7NxZm007598
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2024 02:23:59 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 May 2024 02:23:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 May 2024 02:23:58 -0500
Received: from [172.24.227.102]
 (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com [172.24.227.102])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44R7NsIg083020;
 Mon, 27 May 2024 02:23:54 -0500
Message-ID: <5bf589c6-6ba9-434a-b7da-eb0c09284dcd@ti.com>
Date: Mon, 27 May 2024 12:53:53 +0530
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
 <4cd64cf5-d2b0-4aa9-b958-6b6fc54f0bf2@ti.com>
 <x7i5miguht47wxliioos7npelzzicnwt7g5pfjqjvdztksgzga@c7djvf3lg3kf>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <x7i5miguht47wxliioos7npelzzicnwt7g5pfjqjvdztksgzga@c7djvf3lg3kf>
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



On 25/05/24 01:16, Dmitry Baryshkov wrote:
> On Fri, May 24, 2024 at 05:54:02PM +0530, Jayesh Choudhary wrote:
>> Hello Dmitry,
>>
>> On 24/05/24 15:11, Dmitry Baryshkov wrote:
>>> On Fri, May 24, 2024 at 03:05:08PM +0530, Jayesh Choudhary wrote:
>>>> Currently, mode_valid hook returns all mode as valid and it is
>>>> defined only in drm_connector_helper_funcs. With the introduction of
>>>> 'DRM_BRIDGE_ATTACH_NO_CONNECTOR', connector is not initialized in
>>>> bridge_attach call for cases when the encoder has this flag enabled.
>>>> So add the mode_valid hook in drm_bridge_funcs as well with proper
>>>> clock checks for maximum and minimum pixel clock supported by the
>>>> bridge.
>>>>
>>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>
>> [...]
>>
>>>> +
>>>>    static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
>>>>    					       struct drm_display_mode *mode)
>>>>    {
>>>> -	/* TODO: check mode */
>>>> +	struct sii902x *sii902x = connector_to_sii902x(connector);
>>>> +	const struct drm_display_mode *mod = mode;
>>>> -	return MODE_OK;
>>>> +	return sii902x_validate(sii902x, mod);
>>>
>>> There is no need to. The drm_bridge_chain_mode_valid() should take care
>>> of calling bridge's mode_valid callback and rejecting the mode if it is
>>> not accepted.
>>
>> I need some clarity here.
>>
>> IIRC, if the bridge does initialize the connector in case
>> where the encoder does not attach the bridge with the
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR (DBANC) flag (referring to tidss
>> encoder before we implemented the DBANC feature), then
>> drm_connector_helper_func are called and drm_bridge_funcs
>> are NOT called (atleast from what I have seen in detect
>> hook for cdns-mhdp-8546 driver which is there in both
>> structures).
> 
> There are different kinds of bridge_funcs. detect is a part of the
> connector-related interface, so it is not called by the drm core. On the
> other hand functions like mode_valid, enable/disable, etc. are called
> for all bridges.
> 

Oh okay!
Thanks for clarifying.

>> I do not have any platform to test non-DBANC encoders.
>> And I did not want to break any platform that were still using
>> bridge_attach without DBANC flag.
>> That is why I kept mode_valid hook in both structures.
>>
>> Are you implying that if connector_helper_funcs are not there
>> then there will be some sort of fallback to bridge_funcs instead
>> of passthrough for mode_valid check? Because that goes against my
>> previous observations.
> 
> Not quite. See how drm_atomic_heler uses bridge_funcs.
> 

I will do that and spin another revision with the suggested changes.

Warm Regards,
Jayesh
