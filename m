Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE537B03E6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 14:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D8210E063;
	Wed, 27 Sep 2023 12:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D53910E063;
 Wed, 27 Sep 2023 12:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695817377; x=1727353377;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=zEVS6a6AaPOjeuX3gQlt/POpX9rso+ofY3ZQrlQiOBQ=;
 b=ToV26qeHDARBwsyGI3x5ReuB7ibb6fEPeBNJ6kf4xra34lC6nWnbR7B7
 +rMsQDLl5uNXuyYFtD3cYb0FyncJXUTrmWHSwODa0iq5XgZOlKu3euvmC
 YSbIQV7FtRO0rQs0pqW1F0VXignYs9U+G536Up+gKps9qyh4r9yQJCUSd
 MBbprQAOGuSZJtBZTOsjH7ZKgUCBAepKscNgt96CcKoMGpYImxXnqx9O3
 O03BaEV8PxYobUQHZJYmc6qHQhL+2LxgcyknBidwyJw9BEz/uQR2+kb0A
 cB67e0P26WMR/acKtol5uuJbziSf7Zvwtb/D2tmqQ69ksodgq/A4pBDNu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="384599169"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="384599169"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:22:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="814855002"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="814855002"
Received: from clkuhl-mobl.amr.corp.intel.com ([10.252.53.225])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:22:17 -0700
Date: Wed, 27 Sep 2023 15:22:16 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 08/15] platform/x86/amd/pmf: Add support to update system
 state
In-Reply-To: <20230922175056.244940-9-Shyam-sundar.S-k@amd.com>
Message-ID: <54eb24f0-c6c9-fd17-ec4b-9072658f644e@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-9-Shyam-sundar.S-k@amd.com>
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

> PMF driver based on the output actions from the TA can request to update
> the system states like entering s0i3, lock screen etc. by generating
> an uevent. Based on the udev rules set in the userspace the event id
> matching the uevent shall get updated accordingly using the systemctl.
> 
> Sample udev rules under Documentation/admin-guide/pmf.rst.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  Documentation/admin-guide/pmf.rst     | 24 ++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h    |  9 ++++++
>  drivers/platform/x86/amd/pmf/tee-if.c | 40 ++++++++++++++++++++++++++-
>  3 files changed, 72 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/admin-guide/pmf.rst
> 
> diff --git a/Documentation/admin-guide/pmf.rst b/Documentation/admin-guide/pmf.rst
> new file mode 100644
> index 000000000000..b60f381410c3
> --- /dev/null
> +++ b/Documentation/admin-guide/pmf.rst
> @@ -0,0 +1,24 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Set udev rules for PMF Smart PC Builder
> +---------------------------------------
> +
> +AMD PMF(Platform Management Framework) Smart PC Solution builder has to set the system states
> +like S0i3, Screen lock, hibernate etc, based on the output actions provided by the PMF
> +TA (Trusted Application).
> +
> +In order for this to work the PMF driver generates a uevent for userspace to react to. Below are
> +sample udev rules that can facilitate this experience when a machine has PMF Smart PC solution builder
> +enabled.
> +
> +Please add the following line(s) to
> +``/etc/udev/rules.d/99-local.rules``::
> +        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="1", RUN+="/usr/bin/systemctl suspend"
> +        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="2", RUN+="/usr/bin/systemctl hibernate"
> +        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="3", RUN+="/bin/loginctl lock-sessions"
> +
> +EVENT_ID values:
> +1= Put the system to S0i3/S2Idle
> +2= Put the system to hibernate
> +3= Lock the screen
> +
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 897f61b75e2f..c5334f1177a4 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -70,6 +70,7 @@
>  #define PMF_POLICY_STT_MIN					6
>  #define PMF_POLICY_STT_SKINTEMP_APU				7
>  #define PMF_POLICY_STT_SKINTEMP_HS2				8
> +#define PMF_POLICY_SYSTEM_STATE					9
>  #define PMF_POLICY_P3T						38
>  
>  /* TA macros */
> @@ -436,6 +437,13 @@ struct apmf_dyn_slider_output {
>  } __packed;
>  
>  /* Smart PC - TA internals */
> +enum system_state {
> +	SYSTEM_STATE__S0i3 = 1,
> +	SYSTEM_STATE__S4,
> +	SYSTEM_STATE__SCREEN_LOCK,
> +	SYSTEM_STATE__MAX
> +};
> +
>  enum ta_slider {
>  	TA_BEST_BATTERY, /* Best Battery */
>  	TA_BETTER_BATTERY, /* Better Battery */
> @@ -467,6 +475,7 @@ enum ta_pmf_error_type {
>  };
>  
>  struct pmf_action_table {
> +	enum system_state system_state;
>  	unsigned long spl; /* in mW */
>  	unsigned long sppt; /* in mW */
>  	unsigned long sppt_apuonly; /* in mW */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 883dd143375a..1629856c20b4 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -24,6 +24,20 @@ MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (defau
>  static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
>  						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
>  
> +static const char *amd_pmf_uevent_as_str(unsigned int state)
> +{
> +	switch (state) {
> +	case SYSTEM_STATE__S0i3:
> +		return "S0i3";
> +	case SYSTEM_STATE__S4:
> +		return "S4";
> +	case SYSTEM_STATE__SCREEN_LOCK:
> +		return "SCREEN_LOCK";
> +	default:
> +		return "Unknown Smart PC event";
> +	}
> +}
> +
>  static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
>  				 struct tee_ioctl_invoke_arg *arg,
>  				 struct tee_param *param)
> @@ -42,9 +56,23 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
>  	param[0].u.memref.shm_offs = 0;
>  }
>  
> +static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
> +{
> +	char *envp[2] = {};
> +
> +	envp[0] = kasprintf(GFP_KERNEL, "EVENT_ID=%d", event);
> +	if (!envp[0])
> +		return -EINVAL;
> +
> +	kobject_uevent_env(&dev->dev->kobj, KOBJ_CHANGE, envp);
> +
> +	kfree(envp[0]);
> +	return 0;
> +}
> +
>  static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>  {
> -	u32 val;
> +	u32 val, event = 0;
>  	int idx;
>  
>  	for (idx = 0; idx < out->actions_count; idx++) {
> @@ -113,6 +141,16 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  				dev->prev_data->p3t_limit = val;
>  			}
>  			break;
> +
> +		case PMF_POLICY_SYSTEM_STATE:
> +			event = val + 1;
> +			if (dev->prev_data->system_state != event) {
> +				amd_pmf_update_uevents(dev, event);
> +				dev_dbg(dev->dev, "update SYSTEM_STATE : %s\n",
> +					amd_pmf_uevent_as_str(event));
> +				dev->prev_data->system_state = 0;

Is it intentional to assign 0 here? If it is, it makes 
prev_data->system_state pretty useless?

> +			}
> +			break;
>  		}
>  	}
>  }
> 

-- 
 i.

