Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EAEC12C25
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 04:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB3B10E064;
	Tue, 28 Oct 2025 03:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="UVUL36IU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CD210E064
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 03:28:31 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59S3S9ek2563347;
 Mon, 27 Oct 2025 22:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1761622089;
 bh=SokHI3gbW0CM5UxYqOGcXWx0ix+zGTlPjnprPVmhxx0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=UVUL36IUlJUphl9pTXw/RQwYV3s/CR1oxvonDXlqOAkbiCOk+oBWGjne+o2sFhOxw
 KGveqRLCVjYk9UZFRIqtzteEZVJilXUIp5FOOv9WI07BZXf5OkTs+ERg4AGz9bCAnG
 YnWfnxyvAi75xBAalznPUDK0L/0oh2yNDuHeZMgQ=
Received: from DLEE203.ent.ti.com (dlee203.ent.ti.com [157.170.170.78])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59S3S91L1390877
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 Oct 2025 22:28:09 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 22:28:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 22:28:08 -0500
Received: from [10.249.128.221] ([10.249.128.221])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59S3S3mm1671754;
 Mon, 27 Oct 2025 22:28:03 -0500
Message-ID: <b6ce2b26-d941-4620-9544-e72d1d3d0d73@ti.com>
Date: Tue, 28 Oct 2025 08:58:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] Decouple max/min_pclk_khz check from constant
 display feats
To: <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <mripard@kernel.org>,
 <tomi.valkeinen@ideasonboard.com>, <jyri.sarha@iki.fi>,
 <maarten.lankhorst@linux.intel.com>, <simona@ffwll.ch>,
 <airlied@gmail.com>, <tzimmermann@suse.de>, <h-shenoy@ti.com>
CC: <praneeth@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20251027212624.359235-1-s-jain1@ti.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20251027212624.359235-1-s-jain1@ti.com>
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



On 28-10-2025 02:56, Swamil Jain wrote:
> In an effort to make the existing compatibles more usable, we are
> removing the max/min_pclk_khz form dispc_features structure and doing
> the supported pixel clock checks using clk_round_rate().
> 
> Changes are fully backwards compatible.
> 
> - Remove max/min_pclk_khz and use clk_round_rate to validate modes
> - Skip OLDI mode validate through dispc_vp_mode_valid and add
>    mode_valid hook to validate modes for OLDI bridge in tidss_oldi.c
> 
> ---

NACK. I will resend v7 with some modifications in the cover letter.

Regards,
Swamil> Changelog v6->v7
> - Remove both max/min_pclk_khz as suggested by Tomi
> - Use mode_valid() instead of atomic_check()
> - Squash patches v6 PATCH 1/3 and PATCH 2/3 which is a fix to OLDI
>    series[1]
> - Minor fixes in commit message
> - Update comments to include more reasoning to add Fixes tag to
>    Patch v7 2/2
> 
> [1]: https://lore.kernel.org/all/20250528122544.817829-1-aradhya.bhatia@linux.dev/
> 
> v6 patch link:
> https://lore.kernel.org/all/20250911110715.2873596-1-s-jain1@ti.com/
> 
> Changelog v5->v6
> - Drop caching logic
> - Add comments for tolerance value
>    (We are targeting another series for reducing tolerance value)
> - Minor fixes in commit message
> 
> v5 patch link:
> https://lore.kernel.org/all/20250819192113.2420396-1-s-jain1@ti.com/
> 
> Changelog v4->v5
> - Rename is_oldi_vp[] to is_ext_vp_clk[]
> - Store both pixel clock round_rate and attempted_rate to reduce
>    clk_round_rate() calls while validating modes
> - Code changes suggested by Tomi[2]
> - Minor fixes in comments and commit message
> 
> [2]: https://lore.kernel.org/all/8cd9d1c4-2e9f-4766-b224-21925c4f991d@ideasonboard.com/
> 
> v4 patch link:
> https://lore.kernel.org/all/20250704094851.182131-1-j-choudhary@ti.com/
> 
> Changelog v3->v4:
> - Minor cosmetic fixes in code, comments and commit message
> - Pick up R-by and add Fixes tag
> 
> v3 patch link:
> https://lore.kernel.org/all/20250701095541.190422-1-j-choudhary@ti.com/
> 
> Changelog v2->v3:
> - Add changes for OLDI
> - Rename max_pclk as it is misleading
> - Change commit message to make it more appropriate
> - Drop unnecessary zero initialization
> 
> v2 patch link:
> https://lore.kernel.org/all/20250618100509.20386-1-j-choudhary@ti.com/
> 
> Changelog v1->v2:
> - Rebase it on linux-next after OLDI support series as all of its
>    patches are reviewed and tested and it touches one of the functions
>    used.
>    
> v1 patch link:
> https://lore.kernel.org/all/20250618075804.139844-1-j-choudhary@ti.com/
> 
> ---
> Jayesh Choudhary (2):
>    drm/tidss: Remove max_pclk_khz and min_pclk_khz from tidss display
>      features
>    drm/tidss: Move OLDI mode validation to OLDI bridge mode_valid hook
> 
>   drivers/gpu/drm/tidss/tidss_dispc.c | 87 +++++++++++------------------
>   drivers/gpu/drm/tidss/tidss_dispc.h |  3 -
>   drivers/gpu/drm/tidss/tidss_drv.h   |  2 +
>   drivers/gpu/drm/tidss/tidss_oldi.c  | 21 +++++++
>   4 files changed, 55 insertions(+), 58 deletions(-)
> 

