Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF577737394
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 20:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153E010E317;
	Tue, 20 Jun 2023 18:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A518F10E32B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 18:14:26 +0000 (UTC)
Received: from mail.denx.de (unknown
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6DBC58469F;
 Tue, 20 Jun 2023 20:14:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1687284861;
 bh=SjdM1y3pAq64zbSAuwOjpEAw61n8bR5gpaLDtXoaHVc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SBgWLJmY/umjBScRIGyw4PCBD3mM/HRcPeD3MC9K7ObWZxUNgkPzUXq2ELHnjJZwG
 RMdys+XQ3dZiODpRpgZL74Jn7SRO6F5//6qtn55KMzsmZ/UeHRk+mbRZC4QQj70W13
 UeEhSjfVbG/n4Qw5ZdkpXwRfXZoeOCnKma49S6csceH2uZfnHgL/L6s/T/spjJEXct
 DMZwWfzB0Y6z/gQejg6uLRgqpvnE8UwPiowtDrNY8G2yeqxBRumSHDPNiCR2SsuEHp
 P16XgUG2zbxdjxZPoDTOfHBS0eieDwncWZIT+BKImD1zSEQX+xGJZJoz65a+13JrBd
 gn9BQlPuf7KRA==
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 20 Jun 2023 15:14:21 -0300
From: Fabio Estevam <festevam@denx.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/3] drm/msm/a3xx: Pass the revision information
In-Reply-To: <254e633f-1cc4-0eac-d6d9-365f78433227@linaro.org>
References: <20230620173305.896438-1-festevam@gmail.com>
 <254e633f-1cc4-0eac-d6d9-365f78433227@linaro.org>
Message-ID: <23355aa73e9c8d84f119f675d599a00c@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/06/2023 14:40, Dmitry Baryshkov wrote:

> This looks like a boilerplate being added to all aYxx drivers (and
> then these fields are also set in adreno_gpu_init()). Can we remove
> duplication somehow?

Sorry, I missed this comment prior to sending v2.

Maybe a simpler fix for a2xx_gpu would be:

--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -540,6 +540,10 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device 
*dev)
         gpu->perfcntrs = perfcntrs;
         gpu->num_perfcntrs = ARRAY_SIZE(perfcntrs);

+       ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
+       if (ret)
+               goto fail;
+
         if (adreno_is_a20x(adreno_gpu))
                 adreno_gpu->registers = a200_registers;
         else if (adreno_is_a225(adreno_gpu))
@@ -547,10 +551,6 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device 
*dev)
         else
                 adreno_gpu->registers = a220_registers;

-       ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
-       if (ret)
-               goto fail;
-
         if (!gpu->aspace) {
                 dev_err(dev->dev, "No memory protection without MMU\n");
                 if (!allow_vram_carveout) {

What do you think?

a3xx and a4xx call adreno_gpu_init() prior to adreno_is_xxx() so they 
don't have issues.
