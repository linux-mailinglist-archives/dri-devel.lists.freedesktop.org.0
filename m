Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3408A80C7D1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 12:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857B210E0D1;
	Mon, 11 Dec 2023 11:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E1C10E0D1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 11:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702293720; x=1733829720;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=jRLaTt6FjhPIMgcn7o41MVZgqFJ0TP9fecmxXVx69Hw=;
 b=apvcIKUpWK+nfC8sl+rG8Yhcp9ZxsDtH6imBhftKc8dBvWu/Zo0huD2M
 A7I7YPCoDtO5uOKOC8jkgbaYlkFUd8iXOFlcZbFhXs7WlG9gao7a1Ygl/
 IKYNbUTQDiLg3YZxIgjPhbQKK5eIr2rM7H0vW6h6dakOTijFaLVjVLC9o
 GF0/ULv9V0ZWOs9TVsXO2aG24MoGgqNIyctJfQ9vueTSPGwONsvO4+7xh
 esm5n6Vphviv8VPsc3i+pDgKsgTX52iP7q0zFNzstRJCADO6qgS5hHh3Y
 LaB7IMDm/3YqhjLAKF1fnzR0FKXaJ6OVv8xXHsC+YsQdT7TOIiR0Ci97r w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="398487357"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="398487357"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:22:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="749258197"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="749258197"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.128.67])
 ([10.249.128.67])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:21:17 -0800
Message-ID: <afbdf7d3-6fe8-43ee-9a1f-237f00f94b85@linux.intel.com>
Date: Mon, 11 Dec 2023 12:21:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/qaic: Implement quirk for SOC_HW_VERSION
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20231208163101.1295769-1-quic_jhugo@quicinc.com>
 <20231208163101.1295769-3-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231208163101.1295769-3-quic_jhugo@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 08.12.2023 17:31, Jeffrey Hugo wrote:
> The SOC_HW_VERSION register in the BHI space is not correctly initialized
> by the device and in many cases contains uninitialized data. The register
> could contain 0xFFFFFFFF which is a special value to indicate a link
> error in PCIe, therefore if observed, we could incorrectly think the
> device is down.
> 
> Intercept reads for this register, and provide the correct value - every
> production instance would read 0x60110200 if the device was operating as
> intended.
> 
> Fixes: a36bf7af868b ("accel/qaic: Add MHI controller")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> ---
>  drivers/accel/qaic/mhi_controller.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
> index 5036e58e7235..1405623b03e4 100644
> --- a/drivers/accel/qaic/mhi_controller.c
> +++ b/drivers/accel/qaic/mhi_controller.c
> @@ -404,8 +404,21 @@ static struct mhi_controller_config aic100_config = {
>  
>  static int mhi_read_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr, u32 *out)
>  {
> -	u32 tmp = readl_relaxed(addr);
> +	u32 tmp;
>  
> +	/*
> +	 * SOC_HW_VERSION quirk
> +	 * The SOC_HW_VERSION register (offset 0x224) is not reliable and
> +	 * may contain uninitialized values, including 0xFFFFFFFF. This could
> +	 * cause a false positive link down error.  Instead, intercept any
> +	 * reads and provide the correct value of the register.
> +	 */
> +	if (addr - mhi_cntrl->regs == 0x224) {
> +		*out = 0x60110200;
> +		return 0;
> +	}
> +
> +	tmp = readl_relaxed(addr);
>  	if (tmp == U32_MAX)
>  		return -EIO;
>  

