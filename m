Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B981D7AF103
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 18:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA8410E40A;
	Tue, 26 Sep 2023 16:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940C010E40A;
 Tue, 26 Sep 2023 16:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695746573; x=1727282573;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=CnqTju9waJ27u9EJI4wwOu6Bv5zzEI0lbmM/4/wsm1k=;
 b=XTwO9FK75Jcyy5zBzECbFcQ3D3i0ckWP90qsmR85kA9T2ZrjIO9CAfOY
 xaEFH7SMQybWNKsiqV/be25ctDw8xH7+Vcq+Zk5Zu/uEOcv8PBKaYyCMT
 NmnfaoPlBiJXiT59WFKBv9Lu430lz2pLRPKMdvQXiD9c2c/3Hl2ucr3NF
 KUael/3JZxqL8w2uBB9YyUxxGNj/HEXBkco0VhzGqI7QCQ6ur+wTl2MHi
 28DSRLJ+nDa68BLRLEGqCxYZViqmlCq8JetWgUUkt/TV7tIxDdOlQKENW
 HyartGwzKOEKI2s41/F52Q9ZggRMqDffR2HrjHC3VOopFpdtO9UbC3ZvF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="380481639"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="380481639"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 09:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1079768272"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="1079768272"
Received: from hhalmen-mobl.ger.corp.intel.com ([10.251.219.207])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 09:42:48 -0700
Date: Tue, 26 Sep 2023 19:42:45 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 01/15] platform/x86/amd/pmf: Add PMF TEE interface
In-Reply-To: <20230922175056.244940-2-Shyam-sundar.S-k@amd.com>
Message-ID: <f0fae1c2-1dce-3a9d-6d48-299e90b4942@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-2-Shyam-sundar.S-k@amd.com>
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

On Fri, 22 Sep 2023, Shyam Sundar S K wrote:

> AMD PMF driver loads the PMF TA (Trusted Application) into the AMD
> ASP's (AMD Security Processor) TEE (Trusted Execution Environment).
> 
> PMF Trusted Application is a secured firmware placed under
> /lib/firmware/amdtee gets loaded only when the TEE environment is
> initialized. Add the initial code path to build these pipes.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Makefile |   3 +-
>  drivers/platform/x86/amd/pmf/core.c   |  11 ++-
>  drivers/platform/x86/amd/pmf/pmf.h    |  16 ++++
>  drivers/platform/x86/amd/pmf/tee-if.c | 106 ++++++++++++++++++++++++++
>  4 files changed, 132 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/pmf/tee-if.c
> 
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> index fdededf54392..d2746ee7369f 100644
> --- a/drivers/platform/x86/amd/pmf/Makefile
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -6,4 +6,5 @@
>  
>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
>  amd-pmf-objs := core.o acpi.o sps.o \
> -		auto-mode.o cnqf.o
> +		auto-mode.o cnqf.o \
> +		tee-if.o
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 78ed3ee22555..68f1389dda3e 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -309,8 +309,11 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>  		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>  	}
>  
> -	/* Enable Auto Mode */
> -	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
> +	if (amd_pmf_init_smart_pc(dev)) {
> +		/* Enable Smart PC Solution builder */
> +		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
> +	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
> +		/* Enable Auto Mode */
>  		amd_pmf_init_auto_mode(dev);
>  		dev_dbg(dev->dev, "Auto Mode Init done\n");
>  	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
> @@ -330,7 +333,9 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>  		amd_pmf_deinit_sps(dev);
>  	}
>  
> -	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
> +	if (dev->smart_pc_enabled) {
> +		amd_pmf_deinit_smart_pc(dev);
> +	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>  		amd_pmf_deinit_auto_mode(dev);
>  	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
>  			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index deba88e6e4c8..02460c2a31ea 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -179,6 +179,12 @@ struct amd_pmf_dev {
>  	bool cnqf_enabled;
>  	bool cnqf_supported;
>  	struct notifier_block pwr_src_notifier;
> +	/* Smart PC solution builder */
> +	struct tee_context *tee_ctx;
> +	struct tee_shm *fw_shm_pool;
> +	u32 session_id;
> +	void *shbuf;
> +	bool smart_pc_enabled;
>  };
>  
>  struct apmf_sps_prop_granular {
> @@ -389,6 +395,13 @@ struct apmf_dyn_slider_output {
>  	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>  } __packed;
>  
> +struct ta_pmf_shared_memory {
> +	int command_id;
> +	int resp_id;
> +	u32 pmf_result;
> +	u32 if_version;
> +};
> +
>  /* Core Layer */
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
> @@ -433,4 +446,7 @@ void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
>  int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
>  extern const struct attribute_group cnqf_feature_attribute_group;
>  
> +/* Smart PC builder Layer*/
> +int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
> +void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
>  #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> new file mode 100644
> index 000000000000..b48340edbf44
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Platform Management Framework Driver - TEE Interface
> + *
> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + */
> +
> +#include <linux/tee_drv.h>
> +#include <linux/uuid.h>
> +#include "pmf.h"
> +
> +#define MAX_TEE_PARAM	4
> +static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
> +						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
> +
> +static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
> +{
> +	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
> +}
> +
> +static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
> +{
> +	struct tee_ioctl_open_session_arg sess_arg = {};
> +	int rc;
> +
> +	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid);
> +	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
> +	sess_arg.num_params = 0;
> +
> +	rc = tee_client_open_session(ctx, &sess_arg, NULL);
> +	if (rc < 0 || sess_arg.ret != 0) {
> +		pr_err("%s: tee_client_open_session failed err:%#x, ret:%#x\n",
> +		       __func__, sess_arg.ret, rc);

Don't print function names but meaningful messages (no __func__ nor 
manually added function names). I didn't make the others, please take care 
of them all, thank you.

-- 
 i.


> +		rc = -EINVAL;
> +	} else {
> +		*id = sess_arg.session;
> +	}
> +
> +	return rc;
> +}
> +
> +static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
> +{
> +	int ret;
> +	u32 size;
> +
> +	/* Open context with TEE driver */
> +	dev->tee_ctx = tee_client_open_context(NULL, amd_pmf_amdtee_ta_match, NULL, NULL);
> +	if (IS_ERR(dev->tee_ctx)) {
> +		dev_err(dev->dev, "%s: tee_client_open_context failed\n", __func__);
> +		return PTR_ERR(dev->tee_ctx);
> +	}
> +
> +	/* Open session with PMF Trusted App */
> +	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id);
> +	if (ret) {
> +		dev_err(dev->dev, "%s: amd_pmf_ta_open_session failed(%d)\n", __func__, ret);
> +		ret = -EINVAL;
> +		goto out_ctx;
> +	}
> +
> +	size = sizeof(struct ta_pmf_shared_memory);
> +	dev->fw_shm_pool = tee_shm_alloc_kernel_buf(dev->tee_ctx, size);
> +	if (IS_ERR(dev->fw_shm_pool)) {
> +		dev_err(dev->dev, "%s: tee_shm_alloc_kernel_buf failed\n", __func__);
> +		ret = PTR_ERR(dev->fw_shm_pool);
> +		goto out_sess;
> +	}
> +
> +	dev->shbuf = tee_shm_get_va(dev->fw_shm_pool, 0);
> +	dev_dbg(dev->dev, "TEE init done\n");
> +
> +	return 0;
> +
> +out_sess:
> +	tee_client_close_session(dev->tee_ctx, dev->session_id);
> +out_ctx:
> +	tee_client_close_context(dev->tee_ctx);
> +
> +	return ret;
> +}
> +
> +static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
> +{
> +	/* Free the shared memory pool */
> +	tee_shm_free(dev->fw_shm_pool);
> +
> +	/* close the existing session with PMF TA*/
> +	tee_client_close_session(dev->tee_ctx, dev->session_id);
> +
> +	/* close the context with TEE driver */
> +	tee_client_close_context(dev->tee_ctx);
> +}
> +
> +int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
> +{
> +	return amd_pmf_tee_init(dev);
> +}
> +
> +void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
> +{
> +	amd_pmf_tee_deinit(dev);
> +}
> 
