Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3183B7B7F2E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 14:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF37D88C3D;
	Wed,  4 Oct 2023 12:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AF888C3D;
 Wed,  4 Oct 2023 12:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696422784; x=1727958784;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=rqMIzkzF+oU8U8LUCSr0Mr0DAEsLqNHVkwrxAHSfYCs=;
 b=FpFJQ9JJ6alfKhO1TGBbr8JjiQjO5irpZDE6tka5nYWT1uXGKVr6IMSG
 PfZxK+aVgk9qDzX+5x4rwABfnIe1aSaIV/WdmqB7COUatKkRp2wrphO2z
 wcoiw+VyHrxsbhxqW6aeYTe+Rt0GlMXIMKqpsv1sZF2hrPnexgY7K+wmn
 0db0vjUzVN1Tgx7aqnGA6+EVhwfpZRryG/iyrHPbg2XbuSIRWzS+TrEOj
 6dcFrtt0/GIHodSPJoJ5AN6LqgB25v9mNULRYT6Lkxuv1i03FLiQG4SB5
 lA5nDwfHXZQuLs/1KrOH4S0t6UTg6nqiM1evXChabIUmGLdERiZqI+xSj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="385977939"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="385977939"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:33:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="780763444"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="780763444"
Received: from cyrillet-mobl.ger.corp.intel.com ([10.252.55.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:32:58 -0700
Date: Wed, 4 Oct 2023 15:32:56 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v2 11/16] platform/x86/amd/pmf: dump policy binary data
In-Reply-To: <20230930083715.2050863-12-Shyam-sundar.S-k@amd.com>
Message-ID: <826ae56e-76c6-aaaf-153-30fa3be96d69@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
 <20230930083715.2050863-12-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 30 Sep 2023, Shyam Sundar S K wrote:

> Sometimes policy binary retrieved from the BIOS maybe incorrect that can
> end up in failing to enable the Smart PC solution feature.
> 
> Use print_hex_dump_debug() to dump the policy binary in hex, so that we
> debug the issues related to the binary even before sending that to TA.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 01f974b55a6a..d16bdecfd43a 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -290,6 +290,9 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>  	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
>  		return -EFAULT;
>  
> +	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
> +			     dev->policy_sz, false);
> +
>  	ret = amd_pmf_start_policy_engine(dev);
>  	if (ret)
>  		return -EINVAL;
> @@ -341,6 +344,10 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  		return -ENOMEM;
>  
>  	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
> +			     dev->policy_sz, false);
> +#endif

Create a wrapper for print_hex_dump_debug into #ifdef and #else blocks for 
this too so you don't need the ifdef here.

-- 
 i.

