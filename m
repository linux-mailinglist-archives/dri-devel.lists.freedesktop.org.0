Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1098534F3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 16:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A3110E751;
	Tue, 13 Feb 2024 15:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f14VceYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF54310E751
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 15:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707839034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DvFdww0sUH0VEiyLkggkdre2/6HC0kSSjcb5GZAg18E=;
 b=f14VceYXgCmocHcxvhBHFexlVooeBA8JNNTrrxzSTdQTv7z2EGwzibbIyqO69s5lR6PAES
 N0rTtrL3lI69KqpWtUgPly+na017bAFUvT8F+CPvnTzbmXxiXTrZiDxLRHACRgZwt57tiN
 pQl/QWydGI3bC6bKYccLn7V0AQbIkGs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-UX9Ooz1kM467gwctjapTgQ-1; Tue, 13 Feb 2024 10:43:53 -0500
X-MC-Unique: UX9Ooz1kM467gwctjapTgQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a2b068401b4so528777066b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 07:43:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707839032; x=1708443832;
 h=content-transfer-encoding:in-reply-to:cc:organization:from
 :references:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DvFdww0sUH0VEiyLkggkdre2/6HC0kSSjcb5GZAg18E=;
 b=YBRGOit33gJz05f/qRdk4dRyBjo1E6+IU70eR59eZmhS7SMO/cDRz3rWanjZgfADRD
 A1UTEDD6Va4f6ggVTVYtad2AmUAigaBtH8EE2TD1POTxeXy3C50rdlS48t9/2YuzXyG1
 O26wZEc11SyPVY32k64ErWicUF983B8q+gkdI2e6QRHuELXJLKOSolG/oRD7OHBhbI2J
 e8rEnIN1ur+hNQcCOjvogcuiP4zFYOB+oXb5peThklSi/Uxpttp1fuhCUSV80gISSufe
 AB/5yT2e7EQHpPmmxVbsWNWTwzsBZdEbDSpCKpDMjuYWS45ss55JFijDMeyRBRva2T/p
 0bKQ==
X-Gm-Message-State: AOJu0YwWZ514QWTTQf0xwEbcywuzJrod+Xy7kFmxuqiFKDALo00NXSII
 dlIfppyxaZV+dZpASUqyM9y+GQ+IooEVGIxgJwy2Mnbvci2ku0L6U9i02gvcbdIcQEhGqui591t
 ty1iRljbHBHPFaWfUhoBbyfEPqNQJSnkalNmZL21zOXmuMzMcvpAv9WH9+kpFJ1eWRw==
X-Received: by 2002:a17:906:f9cb:b0:a3c:f4e8:ac43 with SMTP id
 lj11-20020a170906f9cb00b00a3cf4e8ac43mr2605075ejb.21.1707839032310; 
 Tue, 13 Feb 2024 07:43:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEc7SjscpGEcn3fKHxkgJ3ZUunzTu93kwcdYqS9oKsNg9r76J+L5UVuYJPbiXX0sJV92kiOhA==
X-Received: by 2002:a17:906:f9cb:b0:a3c:f4e8:ac43 with SMTP id
 lj11-20020a170906f9cb00b00a3cf4e8ac43mr2605040ejb.21.1707839031824; 
 Tue, 13 Feb 2024 07:43:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUgWKVgL4Repd10j6kqbCtKCiFSzqHZ/forM/2HZ6y3xtHnX4lm8DT7EBZtglhJkC0jXznSs0cGv23oxHSDma19fvFCFkn01q9yM/G0RA5dns25/8/ktBCcI4qSqQOR3d1kM1GWU6G5Dv5auA/OqRj8SPa90RpP8ISLmOAKInDnqw==
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 gv20-20020a170906f11400b00a3c9bd8e1c9sm1385430ejb.76.2024.02.13.07.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 07:43:51 -0800 (PST)
Message-ID: <824eea2e-30df-45e3-a357-daaad4b8ce57@redhat.com>
Date: Tue, 13 Feb 2024 16:43:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] [v3] nouveau: add command-line GSP-RM registry support
To: Timur Tabi <ttabi@nvidia.com>
References: <20240212211548.1094496-1-ttabi@nvidia.com>
 <20240212211548.1094496-2-ttabi@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
Cc: Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20240212211548.1094496-2-ttabi@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 2/12/24 22:15, Timur Tabi wrote:
> Add the NVreg_RegistryDwords command line parameter, which allows
> specifying additional registry keys to be sent to GSP-RM.  This
> allows additional configuration, debugging, and experimentation
> with GSP-RM, which uses these keys to alter its behavior.
> 
> Note that these keys are passed as-is to GSP-RM, and Nouveau does
> not parse them.  This is in contrast to the Nvidia driver, which may
> parse some of the keys to configure some functionality in concert with
> GSP-RM.  Therefore, any keys which also require action by the driver
> may not function correctly when passed by Nouveau.  Caveat emptor.
> 
> The name and format of NVreg_RegistryDwords is the same as used by
> the Nvidia driver, to maintain compatibility.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
> v3: rebased to drm-next
> 
>   .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |   6 +
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 279 ++++++++++++++++--
>   2 files changed, 261 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 6f5d376d8fcc..3fbc57b16a05 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -211,6 +211,12 @@ struct nvkm_gsp {
>   		struct mutex mutex;;
>   		struct idr idr;
>   	} client_id;
> +
> +	/* A linked list of registry items. The registry RPC will be built from it. */
> +	struct list_head registry_list;
> +
> +	/* The size of the registry RPC */
> +	size_t registry_rpc_size;
>   };
>   
>   static inline bool
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 1c46e3f919be..86b62c7e1229 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -54,6 +54,8 @@
>   #include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
>   
>   #include <linux/acpi.h>
> +#include <linux/ctype.h>
> +#include <linux/parser.h>
>   
>   #define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
>   #define GSP_MSG_MAX_SIZE GSP_PAGE_MIN_SIZE * 16
> @@ -1082,51 +1084,280 @@ r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
>   	return nvkm_gsp_rpc_wr(gsp, rpc, true);
>   }
>   
> +struct registry_list_entry {
> +	struct list_head list;

Nit: 'head' or 'entry' might be more suitable.

> +	size_t name_len;
> +	u32 type;

I prefer to represent type as enum or use a define for '1 = integer' instead.
This also gets you rid of the need to explicitly explain it's meaning in the
documentation of add_registry().

> +	u32 data;
> +	u32 length;
> +	char name[];
> +};
> +
> +/**
> + * add_registry -- adds a registry entry
> + * @gsp: gsp pointer
> + * @name: name of the registry key
> + * @type: type of data (1 = integer)
> + * @data: value
> + * @length: size of data, in bytes
> + *
> + * Adds a registry key/value pair to the registry database.
> + *
> + * Currently, only 32-bit integers (type == 1, length == 4) are supported.

What if we pass something else? This function doesn't seem to ensure nothing
else is accepted. Although I recognize that it's only used by add_registry_num()
enforcing this limitation by it's function signature.

> + *
> + * This function collects the registry information in a linked list.  After
> + * all registry keys have been added, build_registry() is used to create the
> + * RPC data structure.
> + *
> + * registry_rpc_size is a running total of the size of all registry keys.
> + * It's used to avoid an O(n) calculation of the size when the RPC is built.
> + *
> + * Returns 0 on success, or negative error code on error.
> + */
> +static int add_registry(struct nvkm_gsp *gsp, const char *name, u32 type, u32 data, u32 length)
> +{
> +	struct registry_list_entry *reg;
> +	size_t nlen = strlen(name) + 1;
> +
> +	/* Set an arbitrary limit to avoid problems with broken command lines */
> +	if (strlen(name) > 64)

Could re-use nlen for this check.

> +		return -EFBIG;

This error code doesn't seem to apply here, prefer EINVAL.

> +
> +	reg = kmalloc(sizeof(struct registry_list_entry) + nlen, GFP_KERNEL);
> +	if (!reg)
> +		return -ENOMEM;
> +
> +	memcpy(reg->name, name, nlen);
> +	reg->name_len = nlen;
> +	reg->type = type;
> +	reg->data = data;
> +	reg->length = length;
> +
> +	nvkm_debug(&gsp->subdev, "adding GSP-RM registry '%s=%u'\n", name, data);
> +	list_add_tail(&reg->list, &gsp->registry_list);
> +	gsp->registry_rpc_size += sizeof(PACKED_REGISTRY_ENTRY) + nlen;
> +
> +	return 0;
> +}
> +
> +static int add_registry_num(struct nvkm_gsp *gsp, const char *name, u32 value)
> +{
> +	return add_registry(gsp, name, 1, value, sizeof(u32));
> +}
> +
> +/**
> + * build_registry -- create the registry RPC data
> + * @gsp: gsp pointer
> + * @registry: pointer to the RPC payload to fill
> + *
> + * After all registry key/value pairs have been added, call this function to
> + * build the RPC.
> + *
> + * The registry RPC looks like this:
> + *
> + * +-----------------+
> + * |NvU32 size;      |
> + * |NvU32 numEntries;|
> + * +-----------------+
> + * +---------------------+
> + * |PACKED_REGISTRY_ENTRY|
> + * +---------------------+
> + * |PACKED_REGISTRY_ENTRY|
> + * +---------------------+
> + * ... (one copy for each entry)
> + *
> + * +----------------------------------+
> + * |Null-terminated string for entry 0|
> + * +----------------------------------+
> + * |Null-terminated string for entry 1|
> + * +----------------------------------+
> + * ... (one copy for each entry)
> + *
> + * All memory allocated by add_registry() is released.
> + */
> +static void build_registry(struct nvkm_gsp *gsp, PACKED_REGISTRY_TABLE *registry)
> +{
> +	struct registry_list_entry *reg, *n;
> +	size_t str_offset;
> +	unsigned int i = 0;
> +
> +	registry->numEntries = list_count_nodes(&gsp->registry_list);
> +	str_offset = struct_size(registry, entries, registry->numEntries);
> +
> +	list_for_each_entry_safe(reg, n, &gsp->registry_list, list) {
> +		registry->entries[i].type = reg->type;
> +		registry->entries[i].data = reg->data;
> +		registry->entries[i].length = reg->length;
> +		registry->entries[i].nameOffset = str_offset;
> +		memcpy((void *)registry + str_offset, reg->name, reg->name_len);
> +		str_offset += reg->name_len;
> +		i++;
> +
> +		list_del(&reg->list);
> +		kfree(reg);
> +	}
> +
> +	/* Double-check that we calculated the sizes correctly */
> +	WARN_ON(gsp->registry_rpc_size != str_offset);
> +
> +	registry->size = gsp->registry_rpc_size;
> +}
> +
> +/**
> + * clean_registry -- clean up registry memory in case of error
> + * @gsp: gsp pointer
> + *
> + * Call this function to clean up all memory allocated by add_registry()
> + * in case of error and build_registry() is not called.
> + */
> +static void clean_registry(struct nvkm_gsp *gsp)
> +{
> +	struct registry_list_entry *reg, *n;
> +
> +	list_for_each_entry_safe(reg, n, &gsp->registry_list, list) {
> +		list_del(&reg->list);
> +		kfree(reg);
> +	}
> +
> +	gsp->registry_rpc_size = sizeof(PACKED_REGISTRY_TABLE);
> +}
> +
> +MODULE_PARM_DESC(NVreg_RegistryDwords,
> +		 "A semicolon-separated list of key=integer pairs of GSP-RM registry keys");
> +static char *NVreg_RegistryDwords;
> +module_param(NVreg_RegistryDwords, charp, 0400);
> +
>   /* dword only */
>   struct nv_gsp_registry_entries {
>   	const char *name;
>   	u32 value;
>   };
>   
> +/**
> + * r535_registry_entries - required registry entries for GSP-RM
> + *
> + * This array lists registry entries that are required for GSP-RM to
> + * function correctly.
> + *
> + * RMSecBusResetEnable - enables PCI secondary bus reset
> + * RMForcePcieConfigSave - forces GSP-RM to preserve PCI configuration
> + *   registers on any PCI reset.
> + */
>   static const struct nv_gsp_registry_entries r535_registry_entries[] = {
>   	{ "RMSecBusResetEnable", 1 },
>   	{ "RMForcePcieConfigSave", 1 },
>   };
>   #define NV_GSP_REG_NUM_ENTRIES ARRAY_SIZE(r535_registry_entries)
>   
> +/**
> + * strip - strips all characters in 'reject' from 's'
> + * @s: string to strip
> + * @reject: string of characters to remove
> + *
> + * 's' is modified.
> + *
> + * Returns the length of the new string.
> + */
> +static size_t strip(char *s, const char *reject)
> +{
> +	char *p = s, *p2 = s;
> +	size_t length = 0;
> +	char c;
> +
> +	do {
> +		while ((c = *p2) && strchr(reject, c))
> +			p2++;
> +
> +		*p++ = c = *p2++;
> +		length++;
> +	} while (c);
> +
> +	return length;
> +}
> +
> +/**
> + * r535_gsp_rpc_set_registry - build registry RPC and call GSP-RM
> + * @gsp: gsp pointer
> + *
> + * The GSP-RM registry is a set of key/value pairs that configure some aspects
> + * of GSP-RM. The keys are strings, and the values are 32-bit integers.
> + *
> + * The registry is built from a combination of a static hard-coded list (see
> + * above) and entries passed on the driver's command line.
> + */
>   static int
>   r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
>   {
>   	PACKED_REGISTRY_TABLE *rpc;
> -	char *strings;
> -	int str_offset;
> -	int i;
> -	size_t rpc_size = struct_size(rpc, entries, NV_GSP_REG_NUM_ENTRIES);
> +	unsigned int i;
> +	int ret;
>   
> -	/* add strings + null terminator */
> -	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++)
> -		rpc_size += strlen(r535_registry_entries[i].name) + 1;
> +	INIT_LIST_HEAD(&gsp->registry_list);
> +	gsp->registry_rpc_size = sizeof(PACKED_REGISTRY_TABLE);
>   
> -	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_SET_REGISTRY, rpc_size);
> -	if (IS_ERR(rpc))
> -		return PTR_ERR(rpc);
> +	/* Add the required registry entries first */
> +	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
> +		ret = add_registry_num(gsp, r535_registry_entries[i].name,
> +				 r535_registry_entries[i].value);
> +		if (ret) {
> +			clean_registry(gsp);
> +			return ret;
> +		}
> +	}
> +
> +	/*
> +	 * The NVreg_RegistryDwords parameter is a string of key=value
> +	 * pairs separated by semicolons. We need to extract and trim each
> +	 * substring, and then parse the substring to extract the key and
> +	 * value.
> +	 */
> +	if (NVreg_RegistryDwords) {
> +		char *p = kstrdup(NVreg_RegistryDwords, GFP_KERNEL);
> +		char *start, *next = p, *equal;
> +		size_t length;
> +
> +		/* Remove any whitespace from the parameter string */
> +		length = strip(p, " \t\n");
> +
> +		while ((start = strsep(&next, ";"))) {
> +			long value;
> +
> +			equal = strchr(start, '=');
> +			if (!equal || (equal == start) || !isdigit(equal[1])) {
> +				nvkm_error(&gsp->subdev,
> +					"ignoring invalid registry string '%s'\n", start);
> +				continue;
> +			}
>   
> -	rpc->numEntries = NV_GSP_REG_NUM_ENTRIES;
> +			ret = kstrtol(equal + 1, 0, &value);
> +			if (ret) {
> +				nvkm_error(&gsp->subdev,
> +					"ignoring invalid registry value in '%s'\n", start);
> +				continue;
> +			}

At a first glance, the string parsing looks correct to me. Did you test with invalid
strings as well?

>   
> -	str_offset = offsetof(typeof(*rpc), entries[NV_GSP_REG_NUM_ENTRIES]);
> -	strings = (char *)&rpc->entries[NV_GSP_REG_NUM_ENTRIES];
> -	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
> -		int name_len = strlen(r535_registry_entries[i].name) + 1;
> -
> -		rpc->entries[i].nameOffset = str_offset;
> -		rpc->entries[i].type = 1;
> -		rpc->entries[i].data = r535_registry_entries[i].value;
> -		rpc->entries[i].length = 4;
> -		memcpy(strings, r535_registry_entries[i].name, name_len);
> -		strings += name_len;
> -		str_offset += name_len;
> +			/* Truncate the key=value string to just key */
> +			*equal = 0;

What's the purpose for that?

> +
> +			ret = add_registry_num(gsp, start, value);
> +			if (ret) {
> +				nvkm_error(&gsp->subdev,
> +					"ignoring invalid registry key/value '%s=%lu'\n",
> +					start, value);
> +				continue;
> +			}
> +		}
> +
> +		kfree(p);
>   	}
> -	rpc->size = str_offset;
> +
> +	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_SET_REGISTRY, gsp->registry_rpc_size);
> +	if (IS_ERR(rpc)) {
> +		clean_registry(gsp);
> +		return PTR_ERR(rpc);
> +	}
> +
> +	build_registry(gsp, rpc);
>   
>   	return nvkm_gsp_rpc_wr(gsp, rpc, false);
>   }

