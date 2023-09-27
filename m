Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5354E7B0442
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 14:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504EF10E504;
	Wed, 27 Sep 2023 12:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DBB10E500;
 Wed, 27 Sep 2023 12:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695818042; x=1727354042;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=YPOv5yEn5ZM7AgUWexoeeAPtX+O6NhNqPLncR7gJ7qY=;
 b=mLVl/sCYqtq5egRP/OfDRuE4AEDrrDkJzL6Up2kkLbYclTSW910P/+RA
 74TroMUnakvrsvH/a9rwoNOuVjRA66pxf+FEa7MJSg8E5arUjaAthshS/
 3K8p8259R9Nvl8mz+j5B7HrltC1DaI2q66sqb57IPgKPE6Jr4Y5U1Kyh3
 bOWHKUH/I1l0XCxoo3dTpeJalXd3dKpeO98hSBSTomebl3vIXtKu9LYBT
 V+6lASPotjoWQzrK+ZccN8BvRINC6IFU7PFVG34C0KIDOx5Bn5X4zgSdk
 rUnLX0Q6paFmu+G+rAmd1qcU5LSBZmYuMKIBQ9zI6/k7g2V45zqKZOB3v w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385669911"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="385669911"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752557478"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="752557478"
Received: from clkuhl-mobl.amr.corp.intel.com (HELO
 idecesar-mobl.ger.corp.intel.com) ([10.252.53.225])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:33:22 -0700
Date: Wed, 27 Sep 2023 15:33:19 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 10/15] platform/x86/amd/pmf: Add capability to sideload
 of policy binary
In-Reply-To: <20230922175056.244940-11-Shyam-sundar.S-k@amd.com>
Message-ID: <1021e446-d522-4b38-c588-50597a20cb3e@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-11-Shyam-sundar.S-k@amd.com>
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
 markgross@kernel.org, hdegoede@redhat.com, benjamin.tissoires@redhat.com,
 mario.limonciello@amd.com, linux-input@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Sep 2023, Shyam Sundar S K wrote:

> A policy binary is OS agnostic, and the same policies are expected to work
> across the OSes.  At times it becomes difficult to debug when the policies
> inside the policy binaries starts to misbehave. Add a way to sideload such
> policies independently to debug them via a debugfs entry.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    |  1 +
>  drivers/platform/x86/amd/pmf/tee-if.c | 60 +++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 61a0f3225b62..780c442239e3 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -215,6 +215,7 @@ struct amd_pmf_dev {
>  	bool cnqf_supported;
>  	struct notifier_block pwr_src_notifier;
>  	/* Smart PC solution builder */
> +	struct dentry *esbin;
>  	unsigned char *policy_buf;
>  	u32 policy_sz;
>  	struct tee_context *tee_ctx;
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 4844782d93c7..fa37cfab2dc7 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -8,6 +8,7 @@
>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   */
>  
> +#include <linux/debugfs.h>
>  #include <linux/tee_drv.h>
>  #include <linux/uuid.h>
>  #include "pmf.h"
> @@ -21,6 +22,13 @@ module_param(pb_actions_ms, int, 0644);
>  MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (default = 1000ms)");
>  #endif
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +/* Sideload policy binaries to debug policy failures */
> +static bool pb_side_load;
> +module_param(pb_side_load, bool, 0444);
> +MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug policy failures");
> +#endif
> +
>  static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
>  						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
>  
> @@ -267,6 +275,49 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
> +				   size_t length, loff_t *pos)
> +{
> +	struct amd_pmf_dev *dev = filp->private_data;
> +	int ret;
> +
> +	/* policy binary size cannot exceed POLICY_BUF_MAX_SZ */
> +	if (length > POLICY_BUF_MAX_SZ || length == 0)
> +		return -EINVAL;
> +
> +	dev->policy_sz = length;
> +	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
> +		return -EFAULT;
> +
> +	ret = amd_pmf_start_policy_engine(dev);
> +	if (ret)
> +		return -EINVAL;
> +
> +	return length;
> +}
> +
> +static const struct file_operations pb_fops = {
> +	.write = amd_pmf_get_pb_data,
> +	.open = simple_open,
> +};
> +
> +int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
> +{
> +	struct dentry *file = NULL;
> +
> +	dev->esbin = debugfs_create_dir("pb", debugfs_root);
> +	if (IS_ERR(dev->esbin))
> +		return -EINVAL;
> +
> +	file = debugfs_create_file("update_policy", 0644, dev->esbin, dev, &pb_fops);
> +	if (!file)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +#endif
> +
>  static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  {
>  	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
> @@ -279,6 +330,11 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  
>  	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +	if (pb_side_load)

Can't this go into amd_pmf_open_pb() as early return?

> +		amd_pmf_open_pb(dev, dev->dbgfs_dir);

If you provide #else and empty amd_pmf_open_pb() above, you don't need to 
do ifdefs here.

> +#endif
> +
>  	return amd_pmf_start_policy_engine(dev);
>  }
>  
> @@ -381,6 +437,10 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  
>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>  {
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +	if (pb_side_load)
> +		debugfs_remove_recursive(dev->esbin);
> +#endif

Likewise here, if you add amd_pmf_remove_pb() into the above #ifdef + new 
#else block with empty body, you can just call it w/o #ifdefs here.

>  	kfree(dev->prev_data);
>  	kfree(dev->policy_buf);
>  	cancel_delayed_work_sync(&dev->pb_work);
> 

-- 
 i.

