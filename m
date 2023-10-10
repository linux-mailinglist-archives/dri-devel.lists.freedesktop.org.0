Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B2A7BFCE7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4A410E363;
	Tue, 10 Oct 2023 13:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071FC10E363;
 Tue, 10 Oct 2023 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696943311; x=1728479311;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=ySyQf6rgVg5IYZAWGy7uT+d1sPeGVBK59rJjjADPH1U=;
 b=PuVcTCGIAcoMDZPTLrv06Oq822AA18oT/FTf4BW8e6puKWjmxJX752K5
 5drHobOPaDbMVgWYLP/dX2OJh3Jr18d/kuagV+qZi06xGX3J8P0j36OLD
 LF4nclPGVau/wl/RnJIora6f9m1FNNhyLn0+kNeaZnagWz4qs6hEZ1StA
 QAve4Y+G8ZAJFHYdbB3lFH0FR7fH6j5Y37LqTk3rvnW8yqyRqnyxs+Qi/
 Evf8aM+aM79Ov1UQUYJ0rwursHJTS/UzeiDmUrdal5gkBeLfh3GmK7FAG
 GVR6o4YXFtqxul8xLlwPbG3EjH82H1RJ77XXf65aTdEZmXYIZ3mFlCJFY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="363737079"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="363737079"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 06:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="788576409"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="788576409"
Received: from jthomasb-mobl1.ger.corp.intel.com ([10.252.42.94])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 06:08:25 -0700
Date: Tue, 10 Oct 2023 16:08:23 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v3 11/16] platform/x86/amd/pmf: dump policy binary data
In-Reply-To: <20231010125917.138225-12-Shyam-sundar.S-k@amd.com>
Message-ID: <1f3e39fc-2c2f-72d5-ce61-16e7e5d257be@linux.intel.com>
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
 <20231010125917.138225-12-Shyam-sundar.S-k@amd.com>
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

On Tue, 10 Oct 2023, Shyam Sundar S K wrote:

> Sometimes policy binary retrieved from the BIOS maybe incorrect that can
> end up in failing to enable the Smart PC solution feature.
> 
> Use print_hex_dump_debug() to dump the policy binary in hex, so that we
> debug the issues related to the binary even before sending that to TA.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 994daf945795..e4386f503ad0 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -275,6 +275,12 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  }
>  
>  #ifdef CONFIG_AMD_PMF_DEBUG
> +static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev)
> +{
> +	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
> +			     dev->policy_sz, false);
> +}
> +

You forgot to add the empty version of amd_pmf_hex_dump_pb function into 
#else part (so the compile fails if CONFIG_AMD_PMF_DEBUG is not set).

>  static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>  				   size_t length, loff_t *pos)
>  {
> @@ -289,6 +295,7 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>  	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
>  		return -EFAULT;
>  
> +	amd_pmf_hex_dump_pb(dev);
>  	ret = amd_pmf_start_policy_engine(dev);
>  	if (ret)
>  		return -EINVAL;
> @@ -327,6 +334,7 @@ static int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
>  }
>  
>  static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
> +static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev) {}
>  #endif
>  
>  static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
> @@ -341,6 +349,7 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  
>  	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
>  
> +	amd_pmf_hex_dump_pb(dev);
>  	if (pb_side_load)
>  		amd_pmf_open_pb(dev, dev->dbgfs_dir);
>  
> 

-- 
 i.

