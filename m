Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F1E7B7DB8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 13:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750FF10E0F5;
	Wed,  4 Oct 2023 11:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FEE10E0F5;
 Wed,  4 Oct 2023 11:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696417411; x=1727953411;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=9wFZDTVPfxaaXT4OzZ8Ud4lOXKjaifdovN0viPzCpTM=;
 b=ZRGCo8+O+N9b8lL9rDmpklmH6F2le+xo1McaVkjZEnGxx6m1AxVFPvui
 5NzMX7wAWOZWN7hfLXiGaSPvHtb9ZhfdQoONagZiYjhNe25mUU66dQ9tN
 ECsaFRYTOldapldL9oTrHWVOZoxkDdFoScwbmqedtU2PoRWY2/omt8nC2
 IndxmTqNDeNHfS0v2UCgrPWYBQUDijmShFdECsW+0VV7ktEOmPeuHAltg
 mTez9Q2rZLb+fVG5A7rfqeJu/1Jgp5kvYDBFshI5TU8WAzzowDcEWmGVN
 Gfh8yYxOMloViAQudSl9KDaeLUMI3OorxZRekEKA0l1Fa4SeSZo0d/bpc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="363399258"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="363399258"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 04:03:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="998416391"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="998416391"
Received: from cyrillet-mobl.ger.corp.intel.com ([10.252.55.203])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 04:03:26 -0700
Date: Wed, 4 Oct 2023 14:03:24 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v2 03/16] platform/x86/amd/pmf: Change return type of
 amd_pmf_set_dram_addr()
In-Reply-To: <20230930083715.2050863-4-Shyam-sundar.S-k@amd.com>
Message-ID: <567055c-d8cc-1f4b-4fc6-758cb52b2c75@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
 <20230930083715.2050863-4-Shyam-sundar.S-k@amd.com>
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

> In the current code, the metrics table information was required only
> for auto-mode or CnQF at a given time. Hence keeping the return type
> of amd_pmf_set_dram_addr() as static made sense.
> 
> But with the addition of Smart PC builder feature, the metrics table
> information has to be shared by the Smart PC also and this feature
> resides outside of core.c.
> 
> To make amd_pmf_set_dram_addr() visible outside of core.c make it
> as a non-static function and move the allocation of memory for
> metrics table from amd_pmf_init_metrics_table() to amd_pmf_set_dram_addr()
> as amd_pmf_set_dram_addr() is the common function to set the DRAM
> address.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 26 ++++++++++++++++++--------
>  drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>  2 files changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 68f1389dda3e..678dce4fea08 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -251,29 +251,35 @@ static const struct pci_device_id pmf_pci_ids[] = {
>  	{ }
>  };
>  
> -static void amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
> +int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
>  {
>  	u64 phys_addr;
>  	u32 hi, low;
>  
> +	/* Get Metrics Table Address */
> +	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
> +	if (!dev->buf)
> +		return -ENOMEM;
> +
>  	phys_addr = virt_to_phys(dev->buf);
>  	hi = phys_addr >> 32;
>  	low = phys_addr & GENMASK(31, 0);
>  
>  	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
>  	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
> +
> +	return 0;
>  }
>  
>  int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>  {
> -	/* Get Metrics Table Address */
> -	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
> -	if (!dev->buf)
> -		return -ENOMEM;
> +	int ret;
>  
>  	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
>  
> -	amd_pmf_set_dram_addr(dev);
> +	ret = amd_pmf_set_dram_addr(dev);
> +	if (ret)
> +		return ret;
>  
>  	/*
>  	 * Start collecting the metrics data after a small delay
> @@ -287,9 +293,13 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>  static int amd_pmf_resume_handler(struct device *dev)
>  {
>  	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> +	int ret;
>  
> -	if (pdev->buf)
> -		amd_pmf_set_dram_addr(pdev);
> +	if (pdev->buf) {
> +		ret = amd_pmf_set_dram_addr(pdev);

Won't this now leak the previous ->buf?

> +		if (ret)
> +			return ret;
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index e0837799f521..3930b8ed8333 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -421,6 +421,7 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>  int amd_pmf_get_power_source(void);
>  int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
>  int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
> +int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev);
>  
>  /* SPS Layer */
>  int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> 

-- 
 i.

