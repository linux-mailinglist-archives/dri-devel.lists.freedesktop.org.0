Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7623A06FF0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A2F10ED1C;
	Thu,  9 Jan 2025 08:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMsu2F8H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1BF10ED1C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736411255; x=1767947255;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=t0CzeYihFBB2oHtjd/0Sy40BT20GI+Mo435O5kM5104=;
 b=BMsu2F8HcC6WBY5ptAnI7Hc1LrYW3YguyXrJUPrKqlK1mGJ3V3/L9YPe
 DXam5W7PAgfa58hVm+usK4X3WMjZTuPqTkRiSRXV4hjSbQD07x2PY42BX
 ndXk7jbkRBmzPPGE4UhNK97mlqQpRSYKgj3LWHC354eqZHWEaT3fSnQhG
 +4uvm4lll6pvhZje5ORDFuQ8oEW0oDYwLEUeSDHB9Jc/2UiChEP7oWQqv
 rQU/ZVbIfHkjTX5TzfQGtfYxWsrQ0KCVHurDc761DeIZpj5icxmGIivi4
 9ln6S8kO3OGcteHPKkIDuuUuRHZiO0aiyN1IktSJ4YkmtaD71eGX1g0db Q==;
X-CSE-ConnectionGUID: k+buRomgT0qq+t7wdIpgZg==
X-CSE-MsgGUID: G5Nqr2rOSDKXiBicgjUweA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36819602"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36819602"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:27:35 -0800
X-CSE-ConnectionGUID: +ivPQvQlTx+uKYy7tB+FhQ==
X-CSE-MsgGUID: FfNMwGJORRi2IpcJ+TRnVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="108320252"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:27:33 -0800
Message-ID: <9da84826-7ac4-4623-ad19-96648c5c8fea@linux.intel.com>
Date: Thu, 9 Jan 2025 09:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] accel/ivpu: Fix missing MMU events from reserved
 SSID
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
 <20250107173238.381120-9-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250107173238.381120-9-maciej.falkowski@linux.intel.com>
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

On 1/7/2025 6:32 PM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Generate recovery when fault from reserved context is detected.
> Add Abort (A) bit to reserved (1) SSID to ensure NPU also receives a fault.
> 
> There is no way to create a file_priv with reserved SSID
> but it is still possible to receive MMU faults from that SSID
> as it is a default NPU HW setting. Such situation will occur if
> FW freed context related resources but still performed access to DRAM.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_mmu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
> index ae1dcd04051c..b80bdded9fd7 100644
> --- a/drivers/accel/ivpu/ivpu_mmu.c
> +++ b/drivers/accel/ivpu/ivpu_mmu.c
> @@ -725,8 +725,8 @@ static int ivpu_mmu_cdtab_entry_set(struct ivpu_device *vdev, u32 ssid, u64 cd_d
>  	cd[2] = 0;
>  	cd[3] = 0x0000000000007444;
>  
> -	/* For global context generate memory fault on VPU */
> -	if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID)
> +	/* For global and reserved contexts generate memory fault on VPU */
> +	if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID || ssid == IVPU_RESERVED_CONTEXT_MMU_SSID)
>  		cd[0] |= IVPU_MMU_CD_0_A;
>  
>  	if (valid)
> @@ -945,7 +945,8 @@ void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
>  
>  	while ((event = ivpu_mmu_get_event(vdev))) {
>  		ssid = FIELD_GET(IVPU_MMU_EVT_SSID_MASK, *event);
> -		if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID) {
> +		if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID ||
> +		    ssid == IVPU_RESERVED_CONTEXT_MMU_SSID) {
>  			ivpu_mmu_dump_event(vdev, event);
>  			ivpu_pm_trigger_recovery(vdev, "MMU event");
>  			return;

