Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4206CC5F3B0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 21:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BF710EB13;
	Fri, 14 Nov 2025 20:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u/J4ftBD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB88310EB13;
 Fri, 14 Nov 2025 20:26:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A943C433C9;
 Fri, 14 Nov 2025 20:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D30BC4CEF5;
 Fri, 14 Nov 2025 20:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763151968;
 bh=x63UOQOHo8jQjD0iNdh/vxZyRzvj6C8n2ajAR7+Exl4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=u/J4ftBDXNFXtho9/bXFR6faCxuEe8pRPwy0wHDnFALkc2r1t+62NjDmAbc7kdCgU
 txRtv5RHPpZju/Y5F6/hgf6InGsF631kAHoKjGxc2uMxH6ETcRBffIKzrIEXJ+VuJi
 DeTcFcdFmVJZv5888BrLJxoYBfWZ0PEPtaxF1LDBCm5oVOaDcPLoFFiu9x32WUCRAZ
 N/UUZhhRgy+g8qjkxrLdqqXptOrFd/d69wxxMBgyDNsx+6nDRw3YZ5TDXywlxy6lEB
 4ewBOAHmn83Q3FT+PTKB/ihkAxHTPyQDdnj6ov7+eh7nMYPZuT0CPgCcNw1MEskzop
 2fPNddsZRJlWQ==
Message-ID: <61d28175-6662-4f3e-87bb-6148f3332642@kernel.org>
Date: Fri, 14 Nov 2025 14:26:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 "Tsao, Anson" <anson.tsao@amd.com>
References: <20251114-vram-carveout-tuning-for-upstream-v2-0-4f6bdd48030d@amd.com>
 <20251114-vram-carveout-tuning-for-upstream-v2-4-4f6bdd48030d@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251114-vram-carveout-tuning-for-upstream-v2-4-4f6bdd48030d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 11/14/2025 2:42 AM, Yo-Jung Leo Lin (AMD) wrote:
> Add two sysfs files as interfaces to inspect or change UMA carveout
> size. These files are:
> 
> - uma_carveout_options: a read-only file listing all the available
>    UMA allocation options and their index.
> 
> - uma_carveout: a file that is both readable and writable. On read,
>    it shows the index of the current setting. Writing a valid index
>    into this file allows users to change the UMA carveout size to that
>    option on the next boot.
> 
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 127 +++++++++++++++++++++++++++++++
>   1 file changed, 127 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index 444ab4102168..b9378f34eb79 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -30,6 +30,7 @@
>   #include <linux/power_supply.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/suspend.h>
> +#include <linux/device.h>
>   #include <acpi/video.h>
>   #include <acpi/actbl.h>
>   
> @@ -1247,6 +1248,125 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev, int xcc_id,
>   	return -ENOENT;
>   }
>   
> +static ssize_t uma_carveout_options_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buf)
> +{
> +	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
> +	ssize_t size = 0;
> +
> +	if (!uma_info || !uma_info->num_entries)
> +		return -ENODEV;
> +
> +	for (int i = 0; i < uma_info->num_entries; i++) {
> +		size += sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
> +				      i,
> +				      uma_info->entries[i].name,
> +				      uma_info->entries[i].memory_carved);

AFAICT when memory_carved is 0 does this shows as:

0: Minimum (0 GB)

This is actually 512 MB right?

Could you cross reference what Windows shows in that case?  Do they 
special case it to 512 MB?

I'm wondering if maybe that should be special cased here.
> +	}
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RO(uma_carveout_options);
> +
> +static ssize_t uma_carveout_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", amdgpu_acpi_priv.atcs.uma_info.uma_option_index);
> +}
> +
> +static ssize_t uma_carveout_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
> +	struct drm_device *ddev = dev_get_drvdata(dev);
> +	struct amdgpu_device *adev = drm_to_adev(ddev);
> +	struct amdgpu_uma_carveout_option *opt;
> +	unsigned long val;
> +	uint8_t flags;
> +	int r;
> +
> +	r = kstrtoul(buf, 10, &val);
> +	if (r)
> +		return r;
> +
> +	if (val >= uma_info->num_entries)
> +		return -EINVAL;
> +
> +	opt = &uma_info->entries[val];
> +
> +	if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
> +	    !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
> +		drm_err_once(ddev, "Option %ul not supported due to lack of Custom/Auto flag", r);
> +		return -EINVAL;
> +	}
> +
> +	flags = opt->flags;
> +	flags &= ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
> +
> +	guard(mutex)(&uma_info->update_lock);
> +
> +	r = amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
> +	if (r)
> +		return r;
> +
> +	uma_info->uma_option_index = val;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(uma_carveout);
> +
> +static struct attribute *amdgpu_uma_attrs[] = {
> +	&dev_attr_uma_carveout.attr,
> +	&dev_attr_uma_carveout_options.attr,
> +	NULL
> +};
> +
> +const struct attribute_group amdgpu_uma_attr_group = {
> +	.attrs = amdgpu_uma_attrs
> +};
> +
> +static int amdgpu_acpi_uma_option_init(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_atcs *atcs = &amdgpu_acpi_priv.atcs;
> +	int rc;
> +
> +	if (!atcs->functions.set_uma_allocation_size)
> +		return -ENODEV;
> +
> +	rc = amdgpu_atomfirmware_get_uma_carveout_info(adev, &atcs->uma_info);
> +	if (rc) {
> +		drm_dbg(adev_to_drm(adev),
> +			"Failed to parse UMA carveout info from VBIOS: %d\n", rc);
> +		goto out_info;
> +	}
> +
> +	mutex_init(&atcs->uma_info.update_lock);
> +
> +	rc = devm_device_add_group(adev->dev, &amdgpu_uma_attr_group);
> +	if (rc) {
> +		drm_dbg(adev_to_drm(adev), "Failed to add UMA carveout sysfs interfaces %d\n", rc);
> +		goto out_attr;
> +	}
> +
> +	return 0;
> +
> +out_attr:
> +	mutex_destroy(&atcs->uma_info.update_lock);
> +out_info:
> +	return rc;
> +}
> +
> +static void amdgpu_acpi_uma_option_fini(void)
> +{
> +	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
> +
> +	mutex_destroy(&uma_info->update_lock);
> +	uma_info->num_entries = 0;
> +}
> +
>   /**
>    * amdgpu_acpi_event - handle notify events
>    *
> @@ -1291,6 +1411,12 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
>   int amdgpu_acpi_init(struct amdgpu_device *adev)
>   {
>   	struct amdgpu_atif *atif = &amdgpu_acpi_priv.atif;
> +	int rc;
> +
> +	rc = amdgpu_acpi_uma_option_init(adev);
> +
> +	if (rc)
> +		drm_dbg(adev_to_drm(adev), "Not creating uma carveout interfaces: %d", rc);
>   
>   	if (atif->notifications.brightness_change) {
>   		if (adev->dc_enabled) {
> @@ -1343,6 +1469,7 @@ void amdgpu_acpi_get_backlight_caps(struct amdgpu_dm_backlight_caps *caps)
>   void amdgpu_acpi_fini(struct amdgpu_device *adev)
>   {
>   	unregister_acpi_notifier(&adev->acpi_nb);
> +	amdgpu_acpi_uma_option_fini();
>   }
>   
>   /**
> 

