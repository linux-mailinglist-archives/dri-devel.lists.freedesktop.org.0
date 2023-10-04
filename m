Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A1F7B7FB8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 14:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022C289317;
	Wed,  4 Oct 2023 12:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5426989317;
 Wed,  4 Oct 2023 12:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696423753; x=1727959753;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=rj9ckGhx7qabhBsJN6ooilfTGh5kM2iDQp2HkYAkZJ8=;
 b=QXCqHaMXFRX9hVTA4t7BmmaMO5+0WSqb/xq4nkAv7g2qL3HlGaAu32Xn
 pp4P8735OeUEm7i8490FIsjVYPCWnWg2J+YfzsRN6/+UBHMJ9DEjncjbT
 00oqYD+GTx5NahCBPdTfdId1uSCEc0v2swHZqvbQLKgwV13vfZ4ve8emb
 RGzJ38ivipEwLQIGd/pgDMVcOOrZjB6s3EqVmMb970jlasxGq7HZpVwEW
 tGniqnv0x8bY5nndXtdiOVVztwnehKh+0Fkugz6CJqy3V96mgbG21pRDr
 +DxqoOOBJQA51TOCKnOBpo45NedvxDVR3lREslu25HAsg1o2zRl05mY92 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="469431267"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="469431267"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:49:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="817083231"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="817083231"
Received: from cyrillet-mobl.ger.corp.intel.com ([10.252.55.203])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:49:08 -0700
Date: Wed, 4 Oct 2023 15:49:05 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v2 12/16] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
In-Reply-To: <20230930083715.2050863-13-Shyam-sundar.S-k@amd.com>
Message-ID: <e7b33961-23bb-cb8-2941-ced3f0cf2620@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
 <20230930083715.2050863-13-Shyam-sundar.S-k@amd.com>
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

> In order to provide GPU inputs to TA for the Smart PC solution to work, we
> need to have interface between the PMF driver and the AMDGPU driver.
> 
> Add the initial code path for get interface from AMDGPU.
> 
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

> @@ -355,6 +356,21 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  	return amd_pmf_start_policy_engine(dev);
>  }
>  
> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
> +{
> +	struct amd_pmf_dev *dev = data;
> +
> +	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
> +		/* get the amdgpu handle from the pci root after walking through the pci bus */

I can see from the code that you assign to amdgpu handle so this comment 
added no information.

It doesn't really answer at all why you're doing this second step. Based 
on the give parameters to pci_get_device(), it looks as if you're asking 
for the same device you already have in pdev to be searched to you.

> +		dev->gfx_data.gpu_dev = pci_get_device(pdev->vendor, pdev->device, NULL);
> +		if (dev->gfx_data.gpu_dev) {
> +			pci_dev_put(pdev);
> +			return 1; /* stop walking */
> +		}
> +	}
> +	return 0; /* continue walking */
> +}
> +
>  static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
>  {
>  	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
> @@ -451,6 +467,15 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>  	amd_pmf_set_dram_addr(dev);
>  	amd_pmf_get_bios_buffer(dev);
> +
> +	/* get amdgpu handle */
> +	pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
> +	if (!dev->gfx_data.gpu_dev)
> +		dev_err(dev->dev, "GPU handle not found!\n");
> +
> +	if (!amd_pmf_gpu_init(&dev->gfx_data))
> +		dev->gfx_data.gpu_dev_en = true;
> +


-- 
 i.

