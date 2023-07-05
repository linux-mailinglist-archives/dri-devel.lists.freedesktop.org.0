Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939EE747F9E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 10:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAC410E168;
	Wed,  5 Jul 2023 08:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE94110E168
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 08:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688545613; x=1720081613;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5kaFg4/iik5TEXy7IgoIvoLinoCBKEGMy9qIk/NG9z8=;
 b=XmrSSjOt1CNnemmOfNZ4EMHAxtD1Dshf8KegGWILlrxzY8e+a7suUVdS
 MSNOYWud6WmChuyEqklt6YSDuvgsh4wr6Xo7vx4gp7bI7ETVac0OvnuR0
 ltxSgXTV/K+tyZppcyca381r18+uLJ0CNljYDncbBOniwixEJu9z229fE
 iC3mc0dzuTRpj1PMRDkf/oeJ+pE7aafW9FtCa0W2FqV8rN0a3DPAz96fi
 ntDGFZeqEi1y/rCeqF4Zpn5xgBP8exVulpN4cqcZuY/sWCNsWoj66pfF+
 3cbvQ44vr4kYBjJq5pUzgk/wfW5zyj4XDNAPxAJ534McT0JzcTphxkjBF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="360758764"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="360758764"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 01:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="863644495"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="863644495"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.143.1])
 ([10.249.143.1])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 01:26:51 -0700
Message-ID: <42d3dd5a-1669-48ff-81eb-0dbe1229720c@linux.intel.com>
Date: Wed, 5 Jul 2023 10:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] accel/ivpu: Fix VPU register access in irq disable
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230703080725.2065635-1-stanislaw.gruszka@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230703080725.2065635-1-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 03.07.2023 10:07, Stanislaw Gruszka wrote:
> From: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> Incorrect REGB_WR32() macro was used to access VPUIP register.
> Use correct REGV_WR32().
> 
> Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
> Cc: stable@vger.kernel.org # 6.3.x
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_hw_mtl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
> index 3ff60fbbc8d9..d3ba633daaa0 100644
> --- a/drivers/accel/ivpu/ivpu_hw_mtl.c
> +++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
> @@ -874,7 +874,7 @@ static void ivpu_hw_mtl_irq_disable(struct ivpu_device *vdev)
>  	REGB_WR32(MTL_BUTTRESS_GLOBAL_INT_MASK, 0x1);
>  	REGB_WR32(MTL_BUTTRESS_LOCAL_INT_MASK, BUTTRESS_IRQ_DISABLE_MASK);
>  	REGV_WR64(MTL_VPU_HOST_SS_ICB_ENABLE_0, 0x0ull);
> -	REGB_WR32(MTL_VPU_HOST_SS_FW_SOC_IRQ_EN, 0x0);
> +	REGV_WR32(MTL_VPU_HOST_SS_FW_SOC_IRQ_EN, 0x0);
>  }
>  
>  static void ivpu_hw_mtl_irq_wdt_nce_handler(struct ivpu_device *vdev)
