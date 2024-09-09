Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101AD971C01
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 16:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8AE10E5A1;
	Mon,  9 Sep 2024 14:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1116110E5A4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 14:01:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3443DFEC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 07:01:51 -0700 (PDT)
Received: from [192.168.99.12] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 4E5BF3F64C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 07:01:22 -0700 (PDT)
Message-ID: <10e00d20-6176-4ca6-9c46-8e5176f1a4f7@foss.arm.com>
Date: Mon, 9 Sep 2024 15:01:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Display FW version information
To: dri-devel@lists.freedesktop.org
References: <20240906094025.638173-1-steven.price@arm.com>
Content-Language: en-US
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <20240906094025.638173-1-steven.price@arm.com>
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

+1

I like the interface ver. :)

On 9/6/24 10:40 AM, Steven Price wrote:
> The version number output when loading the firmware is actually the
> interface version not the version of the firmware itself. Update the
> message to make this clearer.
> 
> However, the firmware binary has a git SHA embedded into it which can be
> used to identify which firmware binary is being loaded. So output this
> as a drm_info() so that it's obvious from a dmesg log which firmware
> binary is being used.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> v2:
>   * Fix indentation
>   * Also update the FW interface message to include "using interface" to
>     make it clear it's not the FW version
>   * Add Reviewed-bys
> 
>   drivers/gpu/drm/panthor/panthor_fw.c | 57 +++++++++++++++++++++++++++-
>   1 file changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 857f3f11258a..aea5dd9a4969 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -78,6 +78,12 @@ enum panthor_fw_binary_entry_type {
>   
>   	/** @CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA: Timeline metadata interface. */
>   	CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA = 4,
> +
> +	/**
> +	 * @CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA: Metadata about how
> +	 * the FW binary was built.
> +	 */
> +	CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA = 6
>   };
>   
>   #define CSF_FW_BINARY_ENTRY_TYPE(ehdr)					((ehdr) & 0xff)
> @@ -132,6 +138,13 @@ struct panthor_fw_binary_section_entry_hdr {
>   	} data;
>   };
>   
> +struct panthor_fw_build_info_hdr {
> +	/** @meta_start: Offset of the build info data in the FW binary */
> +	u32 meta_start;
> +	/** @meta_size: Size of the build info data in the FW binary */
> +	u32 meta_size;
> +};
> +
>   /**
>    * struct panthor_fw_binary_iter - Firmware binary iterator
>    *
> @@ -628,6 +641,46 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>   	return 0;
>   }
>   
> +static int panthor_fw_read_build_info(struct panthor_device *ptdev,
> +				      const struct firmware *fw,
> +				      struct panthor_fw_binary_iter *iter,
> +				      u32 ehdr)
> +{
> +	struct panthor_fw_build_info_hdr hdr;
> +	char header[9];
> +	const char git_sha_header[sizeof(header)] = "git_sha: ";
> +	int ret;
> +
> +	ret = panthor_fw_binary_iter_read(ptdev, iter, &hdr, sizeof(hdr));
> +	if (ret)
> +		return ret;
> +
> +	if (hdr.meta_start > fw->size ||
> +	    hdr.meta_start + hdr.meta_size > fw->size) {
> +		drm_err(&ptdev->base, "Firmware build info corrupt\n");
> +		/* We don't need the build info, so continue */
> +		return 0;
> +	}
> +
> +	if (memcmp(git_sha_header, fw->data + hdr.meta_start,
> +		   sizeof(git_sha_header))) {
> +		/* Not the expected header, this isn't metadata we understand */
> +		return 0;
> +	}
> +
> +	/* Check that the git SHA is NULL terminated as expected */
> +	if (fw->data[hdr.meta_start + hdr.meta_size - 1] != '\0') {
> +		drm_warn(&ptdev->base, "Firmware's git sha is not NULL terminated\n");
> +		/* Don't treat as fatal */
> +		return 0;
> +	}
> +
> +	drm_info(&ptdev->base, "Firmware git sha: %s\n",
> +		 fw->data + hdr.meta_start + sizeof(git_sha_header));
> +
> +	return 0;
> +}
> +
>   static void
>   panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
>   {
> @@ -672,6 +725,8 @@ static int panthor_fw_load_entry(struct panthor_device *ptdev,
>   	switch (CSF_FW_BINARY_ENTRY_TYPE(ehdr)) {
>   	case CSF_FW_BINARY_ENTRY_TYPE_IFACE:
>   		return panthor_fw_load_section_entry(ptdev, fw, &eiter, ehdr);
> +	case CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA:
> +		return panthor_fw_read_build_info(ptdev, fw, &eiter, ehdr);
>   
>   	/* FIXME: handle those entry types? */
>   	case CSF_FW_BINARY_ENTRY_TYPE_CONFIG:
> @@ -921,7 +976,7 @@ static int panthor_fw_init_ifaces(struct panthor_device *ptdev)
>   			return ret;
>   	}
>   
> -	drm_info(&ptdev->base, "CSF FW v%d.%d.%d, Features %#x Instrumentation features %#x",
> +	drm_info(&ptdev->base, "CSF FW using interface v%d.%d.%d, Features %#x Instrumentation features %#x",
>   		 CSF_IFACE_VERSION_MAJOR(glb_iface->control->version),
>   		 CSF_IFACE_VERSION_MINOR(glb_iface->control->version),
>   		 CSF_IFACE_VERSION_PATCH(glb_iface->control->version),
