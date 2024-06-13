Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DF1907643
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 17:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3F810E03E;
	Thu, 13 Jun 2024 15:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="EllD0SyD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 494 seconds by postgrey-1.36 at gabe;
 Thu, 13 Jun 2024 15:13:31 UTC
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com
 [95.215.58.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA8010E03E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 15:13:31 +0000 (UTC)
X-Envelope-To: christophe.jaillet@wanadoo.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1718291114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N065K9zNHNGpuRaLl+nprLkgcSGQ568ihUQMVU2BLJg=;
 b=EllD0SyDBeMkOGeaIaxZmqcKY7M1zqEgbzoIkCaHrMOAvYQYbWZakznOm2clrE5nyVWOl6
 eyUUR4aR/U3is3tXsblYmq7dT8Ck4YpakP8v/cayQlSkoSLy7HRNwicCpJOqO3nH50pj9K
 cJGZ9Kmle0+PXG9xQmxwu8+6MjnRVOI=
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: tomi.valkeinen@ideasonboard.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: michal.simek@amd.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: kernel-janitors@vger.kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Message-ID: <120ffe3c-0240-4f93-a220-e0df565bcdbf@linux.dev>
Date: Thu, 13 Jun 2024 11:05:01 -0400
MIME-Version: 1.0
Subject: Re: [PATCH] drm: zynqmp_dpsub: Fix an error handling path in
 zynqmp_dpsub_probe()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
References: <974d1b062d7c61ee6db00d16fa7c69aa1218ee02.1716198025.git.christophe.jaillet@wanadoo.fr>
 <5288867f-ee45-4930-bde0-14b24b878181@linux.dev>
Content-Language: en-US
In-Reply-To: <5288867f-ee45-4930-bde0-14b24b878181@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 5/20/24 11:05, Sean Anderson wrote:
> On 5/20/24 05:40, Christophe JAILLET wrote:
>> If zynqmp_dpsub_drm_init() fails, we must undo the previous
>> drm_bridge_add() call.
>> 
>> Fixes: be3f3042391d ("drm: zynqmp_dpsub: Always register bridge")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Compile tested only
>> ---
>>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
>> index face8d6b2a6f..f5781939de9c 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
>> @@ -269,6 +269,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>>  	return 0;
>>  
>>  err_disp:
>> +	drm_bridge_remove(dpsub->bridge);
>>  	zynqmp_disp_remove(dpsub);
>>  err_dp:
>>  	zynqmp_dp_remove(dpsub);
> 
> Reviewed-by: Sean Anderson <sean.anderso@linux.dev>

Will this be applied soon? The patch it fixes has made its way into the stable tree already.

--Sean

