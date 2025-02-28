Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B21BA4A17C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 19:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FF010E2D1;
	Fri, 28 Feb 2025 18:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="eyjUPMFJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB1F10E0EA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 18:27:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A7701102901CC; Fri, 28 Feb 2025 19:27:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1740767229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9CdXt1sb9hF/qYyFIBouuUvILgc0/orYH3chQLK7vwg=;
 b=eyjUPMFJu4kjE7nYaUGe20Yi4pGLvofEGSGrl2a4zZ+qOpdwtlKK7OYWtHit0AQxK/HRqW
 ozBA5MxABrvrPpKBXm+/w+s0q/UK8o04Dw/AobKVUe02mD+QsLplvF1ZCLHpXNyaUaquyL
 SYIKM06o/qT+Y7e7dTZJjFYQjAmHKQA8ZisFc/LIlxKQrPqkZgMK+KAk6dFghkNmVTWZEa
 gwxChUGoL5Muj2rnO0cPohjYWeEc4l+vy6MwqnnRJb87FOTb+naAW52MZYqjv5ea99IkMG
 ir3tVFvuzA0EDKKuK/zM0G0Vjayrocw/hNCOGyGKJOSMm26UTbeZCCVQNuLLqw==
Message-ID: <39351f48-04be-4659-8b3b-9a4ef6030efd@denx.de>
Date: Fri, 28 Feb 2025 18:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] drm/panthor: Implement support for multiple power
 domains
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-6-marex@denx.de> <2848587.BEx9A2HvPv@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2848587.BEx9A2HvPv@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

On 2/28/25 11:10 AM, Alexander Stein wrote:

Hi,

>> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> index 51ee9cae94504..4348b7e917b64 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.c
>> +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> @@ -75,6 +75,58 @@ static int panthor_reset_init(struct panthor_device *ptdev)
>>   	return 0;
>>   }
>>   
>> +/* Generic power domain handling code, see drivers/gpu/drm/tiny/simpledrm.c */
>> +static void panthor_detach_genpd(void *res)
>> +{
>> +	struct panthor_device *ptdev = res;
>> +	int i;
>> +
>> +	if (ptdev->pwr_dom_count <= 1)
>> +		return;
>> +
>> +	for (i = ptdev->pwr_dom_count - 1; i >= 0; i--)
>> +		dev_pm_domain_detach(ptdev->pwr_dom_devs[i], true);
>> +}
>> +
>> +static int panthor_genpd_init(struct panthor_device *ptdev)
>> +{
>> +	struct device *dev = ptdev->base.dev;
>> +	int i, ret;
>> +
>> +	ptdev->pwr_dom_count = of_count_phandle_with_args(dev->of_node, "power-domains",
>> +							  "#power-domain-cells");
>> +	/*
>> +	 * Single power-domain devices are handled by driver core nothing to do
>> +	 * here. The same for device nodes without "power-domains" property.
>> +	 */
>> +	if (ptdev->pwr_dom_count <= 1)
>> +		return 0;
>> +
>> +	if (ptdev->pwr_dom_count > ARRAY_SIZE(ptdev->pwr_dom_devs)) {
>> +		drm_warn(&ptdev->base, "Too many power domains (%d) for this device\n",
>> +			 ptdev->pwr_dom_count);
>> +		return -EINVAL;
>> +	}
>> +
>> +	for (i = 0; i < ptdev->pwr_dom_count; i++) {
>> +		ptdev->pwr_dom_devs[i] = dev_pm_domain_attach_by_id(dev, i);
>> +		if (!IS_ERR(ptdev->pwr_dom_devs[i]))
>> +			continue;
>> +
>> +		ret = PTR_ERR(ptdev->pwr_dom_devs[i]);
>> +		if (ret != -EPROBE_DEFER) {
>> +			drm_warn(&ptdev->base, "pm_domain_attach_by_id(%u) failed: %d\n", i, ret);
>> +			continue;
> 
> Is it a good idea to continue if a power-domain is missing? Any access might
> stuck completely. IMHO returning an error is more sensible.
> Also some dev_err_probe() should be added here.
Fixed both, thanks .
