Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356B5CE74C9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 17:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266EF10E49C;
	Mon, 29 Dec 2025 16:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JXBEGVcX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936D810E49C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 16:09:12 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-37ba5af5951so83368261fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 08:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767024551; x=1767629351; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=viNL3mFHBnToRPhoCkRAwUSKqcs0NQzo4JsKb7OlQtg=;
 b=JXBEGVcX1ybejMl042nk4hb9aTSru1mq7GL7pWZ1nBDhy5W12jCkZVEEYHq8/z7+1z
 2dYVdbZ4H1BlTmUdjSa7347cVQbB0G4hGKmyWyQlhTmtkko0iSuCCE+Kz10EUqQ4Yh6C
 PnQQK1PUtIGCqApIOBcVjHRSIyXpUdBtiBm4vTYEo5wdqFVl3SekqDVdh+B8GGONhdtX
 AwuqGXdSnds9PNHlyXLBQPU+brXtGzGds6Q2WMDGnI/GI6p8WzSo5Q5KFqjx+lxgdvEt
 RZVR/3gWOa1UVfVwgbVO4xX2nAE7d+5Tic1LLsTkVuLftUt9Qy8GfvW2tODAB3zcqEoV
 eg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767024551; x=1767629351;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=viNL3mFHBnToRPhoCkRAwUSKqcs0NQzo4JsKb7OlQtg=;
 b=aC39ljpt8uA37vKRz0hePFmJZFzKdZ8K1zulyNPgcqBeiePBvqFnaI9WhaU/VZ0Kfb
 eXV6bGL0AWjv0bFXqImYbCzuH58xYnmG8MEbv4LQgq4DMdt/R4mI+vO4a0GrLisdNn9c
 1fByaIjg8ITy4ECh74gsGM+fP2ibg7nACxrUd24qLIo3sqnPpatvdPagihPAxrBMBcUy
 oIemjmsC+/4UC2xvaUCCrxwZSp2W9Y9ixa3/nQWIMomqJeA3uRnOZpUUfX5KRwNT4uFz
 xC4xphUFwbcuzhXI2ajIgt0kMKPz2ArM9qC9MLpHJcQhjcloaj25ayrnP+Q6AfY9Np0C
 bMFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4O0jfXHS3rthFlRCd60+gQMUKV5JtE9RIU/+49LvFtjWY7JqNHBINGO7Pox3ryv28NcNYn/3ilFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxLXNwgS/7cmNqLRlJtk6EqVsZSgOAuDtAiMyMFiJvkTYWVk3m
 lzYum2UVYZ7qylxw+4dN7fs514JaCjYoY7XKuZN66iSiX2nsd1hFyGv/
X-Gm-Gg: AY/fxX5EVzVSU2QKvrWQJhdUTjNOQdS6uRYEoDDW9Igm1XnAB6gV8KzpgAmog/tNNqm
 ZEvtvXy+/55SlfuQNqg7s/4t9nytRw6Po3u1bnBM7zyXfcrmKKY1RC242sFbXEwo/YnGwslQ4IA
 GZTX1klYljpDvNDKDu++UC55tYhA/feqQJNftvPtYbh1C1ppi+Z1uzg1X1ZbTHWY8OJiaAYv5nH
 O62pmQJbJAAms9rFbJcGuBCQ4auQqkwGrF+joOwtuxq8FyGLYvJxowOyXfy6QKamgjkUsvOn1yi
 yMMuzlfKge3NO8FT8ldc9CtkJUoOXiMh6yBC+gNQ0dNcjoan8a6ID4x9gg+c2vYSDENiF2zyj58
 FXyd4YwVdqTBW0lDAZedZygk46zWnrXLfItjPYoi7U3VmfVdRMoTN//rG0it1D6hPK9Ke3MsYUO
 c//vw+WxgGrg==
X-Google-Smtp-Source: AGHT+IEq24qoXUndheWJd7OMN/IrFeM+ep1ZOCBIoWsrm2y8qXSBgYQ79tZu/kTLfxg6AJukkWKC/g==
X-Received: by 2002:a05:651c:549:b0:37b:9b58:dcfb with SMTP id
 38308e7fff4ca-38121568e47mr109382561fa.7.1767024550384; 
 Mon, 29 Dec 2025 08:09:10 -0800 (PST)
Received: from fedora ([94.73.37.171]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38122539ae3sm79732271fa.21.2025.12.29.08.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 08:09:09 -0800 (PST)
Date: Mon, 29 Dec 2025 17:09:07 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
Message-ID: <aVKno9Oh1d1h06m2@fedora>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
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

On Mon, Dec 22, 2025 at 11:11:20AM +0100, Louis Chauvet wrote:
> To allow the userspace to test many hardware configuration, introduce a
> new interface to configure the available formats per planes. VKMS supports
> multiple formats, so the userspace can choose any combination.
> 
> The supported formats are configured by writing the fourcc code in
> supported_formats:
>  # enable AR24 format
>   echo '+AR24' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
>  # disable AR24 format
>   echo '-AR24' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
>  # enable all format supported by VKMS
>   echo '+*' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
>  # disable all formats
>   echo '-*' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/ABI/testing/configfs-vkms         |   9 ++
>  Documentation/gpu/vkms.rst                      |   7 +-
>  drivers/gpu/drm/vkms/tests/Makefile             |   3 +-
>  drivers/gpu/drm/vkms/tests/vkms_configfs_test.c | 102 ++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_configfs.c            | 118 ++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_configfs.h            |   6 ++
>  6 files changed, 243 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> index 2ace79ce848a..48f92538c602 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -153,6 +153,15 @@ Description:
>          Default color range presented to userspace, same
>          values as supported_color_ranges.
>  
> +What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_formats
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        List of supported formats for this plane. To add a new
> +        item, write its fourcc code prefixed with '+'. To remove,
> +        use '-' prefix. Use '+*' to add all formats, '-*' to
> +        remove all.
> +
>  What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
>  Date:		Nov 2025
>  Contact:	dri-devel@lists.freedesktop.org
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index ab0eb2f97fc2..15d62ad963c9 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -87,7 +87,7 @@ Start by creating one or more planes::
>  
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>  
> -Planes have 8 configurable attributes:
> +Planes have 9 configurable attributes:
>  
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>    exposed by the "type" property of a plane)
> @@ -109,6 +109,11 @@ Planes have 8 configurable attributes:
>    must be set too.
>  - default_color_range: Default color range presented to the userspace, same
>    values as supported_color_ranges
> +- supported_formats: List of supported formats for this plane. To add a new item in the
> +  list, write it using a plus and fourcc code: +XR24
> +  To remove a format, use a minus and its fourcc: -XR24
> +  To add all formats use +*
> +  To remove all formats, use -*
>  
>  Continue by creating one or more CRTCs::
>  
> diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
> index d4d9ba8d4c54..92cfa7262ba4 100644
> --- a/drivers/gpu/drm/vkms/tests/Makefile
> +++ b/drivers/gpu/drm/vkms/tests/Makefile
> @@ -3,6 +3,7 @@
>  vkms-kunit-tests-y := \
>  	vkms_config_test.o \
>  	vkms_format_test.o \
> -	vkms_color_test.o
> +	vkms_color_test.o \
> +	vkms_configfs_test.o \
>  
>  obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_configfs_test.c b/drivers/gpu/drm/vkms/tests/vkms_configfs_test.c
> new file mode 100644
> index 000000000000..8d02c2c459d9
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_configfs_test.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include "linux/printk.h"
> +#include <kunit/test.h>
> +
> +#include "../vkms_configfs.h"
> +
> +MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
> +
> +/**
> + * struct vkms_configfs_parse_format_case - Store test case for format parsing
> + * @str: Contains the string to parse
> + * @str_len: str len
> + * @expected_len: expected len of the matched format
> + * @expected_offset: expected offset in the string for the parsed format
> + */
> +struct vkms_configfs_parse_format_case {
> +	const char *str;
> +	int str_len;
> +	int expected_len;
> +	int expected_offset;
> +};
> +
> +struct vkms_configfs_parse_format_case vkms_configfs_parse_format_test_cases[] = {
> +	{
> +		.str = "+RG24",
> +		.str_len = 6,
> +		.expected_len = 5,
> +		.expected_offset = 0,
> +	}, {
> +		.str = "-RG24",
> +		.str_len = 6,
> +		.expected_len = 5,
> +		.expected_offset = 0
> +	}, {
> +		.str = "  -RG24",
> +		.str_len = 8,
> +		.expected_len = 5,
> +		.expected_offset = 2
> +	}, {
> +		.str = "+*",
> +		.str_len = 3,
> +		.expected_len = 2,
> +		.expected_offset = 0
> +	}, {
> +		.str = "-RG24+RG24",
> +		.str_len = 11,
> +		.expected_len = 5,
> +		.expected_offset = 0
> +	}, {
> +		.str = "-R1+RG24",
> +		.str_len = 9,
> +		.expected_len = 3,
> +		.expected_offset = 0
> +	}, {
> +		.str = "\n-R1",
> +		.str_len = 5,
> +		.expected_len = 3,
> +		.expected_offset = 1
> +	}, {
> +		.str = "-R1111",
> +		.str_len = 3,
> +		.expected_len = 3,
> +		.expected_offset = 0
> +	}
> +};
> +
> +static void vkms_configfs_test_parse_format(struct kunit *test)
> +{
> +	const struct vkms_configfs_parse_format_case *param = test->param_value;
> +	char *out;
> +	int len = vkms_configfs_parse_next_format(param->str, param->str + param->str_len, &out);
> +
> +	KUNIT_EXPECT_EQ(test, len, param->expected_len);
> +	KUNIT_EXPECT_PTR_EQ(test, out, param->str + param->expected_offset);
> +}
> +
> +static void vkms_configfs_test_parse_format_get_desc(struct vkms_configfs_parse_format_case *t,
> +						     char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", t->str);
> +}
> +
> +KUNIT_ARRAY_PARAM(vkms_configfs_test_parse_format, vkms_configfs_parse_format_test_cases,
> +		  vkms_configfs_test_parse_format_get_desc
> +);
> +
> +static struct kunit_case vkms_configfs_test_cases[] = {
> +	KUNIT_CASE_PARAM(vkms_configfs_test_parse_format,
> +			 vkms_configfs_test_parse_format_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite vkms_configfs_test_suite = {
> +	.name = "vkms-configfs",
> +	.test_cases = vkms_configfs_test_cases,
> +};
> +
> +kunit_test_suite(vkms_configfs_test_suite);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Kunit test for vkms configfs utility");
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 7be6d10b2b68..a451d1122acf 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -3,6 +3,8 @@
>  #include <linux/configfs.h>
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
> +#include <kunit/visibility.h>
>  
>  #include "vkms_drv.h"
>  #include "vkms_config.h"
> @@ -628,6 +630,120 @@ static ssize_t plane_default_color_encoding_store(struct config_item *item,
>  	return count;
>  }
>  
> +static ssize_t plane_supported_formats_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	page[0] = '\0';
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		u32 *formats = vkms_config_plane_get_supported_formats(plane->config);
> +
> +		for (int i = 0;
> +		     i < vkms_config_plane_get_supported_formats_count(plane->config);
> +		     i++) {
> +			char tmp[6] = { 0 };
> +			const ssize_t ret = snprintf(tmp, ARRAY_SIZE(tmp), "%.*s\n",
> +					       (int)sizeof(*formats),
> +					       (char *)&formats[i]);
> +			if (ret < 0)
> +				return ret;
> +			/*
> +			 * Limitation of ConfigFS attributes, an attribute can't be bigger
> +			 * than PAGE_SIZE. This will crop the result if this plane support
> +			 * more than ≈1000 formats.
> +			 */
> +			if (ret + strlen(page) > PAGE_SIZE - 1)
> +				return -ENOMEM;
> +			strncat(page, tmp, ARRAY_SIZE(tmp));
> +		}
> +	}
> +
> +	return strlen(page);
> +}
> +
> +/**
> + * parse_next_format() - Parse the next format in page, skipping all non fourcc-related characters
> + * @page: page to search into
> + * @page_end: last character of the page
> + * @out: Output pointer, will point inside page
> + *
> + * Returns: size of the matched format, @out will point to the + or -
> + */
> +VISIBLE_IF_KUNIT
> +int vkms_configfs_parse_next_format(const char *page, const char *page_end, char **out)
> +{
> +	int count = page - page_end;

Shouldn't this be "page_end - page"? An example logging the variables shows
that "count" takes negative numbers:

$ echo "-XB48" | sudo tee /sys/kernel/config/vkms/gpu1/planes/plane0/supported_formats

[22854.585268] page = 000000001ec38388
[22854.585277] page_end = 000000000b71ccb5
[22854.585279] count = -6
[22854.585281] page = 00000000625917b4
[22854.585282] page_end = 000000000b71ccb5
[22854.585283] count = -1

Jose

> +	char *tmp_plus = strnchr(page, count, '+');
> +	char *tmp_minus = strnchr(page, count, '-');
> +
> +	if (!tmp_plus && !tmp_minus)
> +		return 0;
> +	if (!tmp_plus)
> +		*out = tmp_minus;
> +	else if (!tmp_minus)
> +		*out = tmp_plus;
> +	else
> +		*out = min(tmp_plus, tmp_minus);
> +
> +	char *end = *out + 1;
> +
> +	while (end < page_end) {
> +		if (!isalnum(*end) && *end != '*')
> +			break;
> +		end++;
> +	}
> +
> +	return end - *out;
> +}
> +EXPORT_SYMBOL_IF_KUNIT(vkms_configfs_parse_next_format);
> +
> +static ssize_t plane_supported_formats_store(struct config_item *item,
> +					     const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +	int ret = 0;
> +	const char *end_page = page + count;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		while (1) {
> +			char *tmp;
> +			char fmt[4] = {' ', ' ', ' ', ' '};
> +			int len = vkms_configfs_parse_next_format(page, end_page, &tmp);
> +
> +			// No fourcc code found
> +			if (len <= 1 || len > 5)
> +				break;
> +
> +			page = tmp + len;
> +			memcpy(fmt, &tmp[1], min(len - 1, 4));
> +			if (tmp[0] == '+') {
> +				if (fmt[0] == '*') {
> +					ret = vkms_config_plane_add_all_formats(plane->config);
> +					if (ret)
> +						return ret;
> +				} else {
> +					ret = vkms_config_plane_add_format(plane->config,
> +									   *(int *)fmt);
> +					if (ret)
> +						return ret;
> +				}
> +			} else if (tmp[0] == '-') {
> +				if (fmt[0] == '*')
> +					vkms_config_plane_remove_all_formats(plane->config);
> +				else
> +					vkms_config_plane_remove_format(plane->config, *(int *)fmt);
> +			}
> +		}
> +	}
> +
> +	return count;
> +}
> +
>  CONFIGFS_ATTR(plane_, type);
>  CONFIGFS_ATTR(plane_, name);
>  CONFIGFS_ATTR(plane_, supported_rotations);
> @@ -636,6 +752,7 @@ CONFIGFS_ATTR(plane_, supported_color_ranges);
>  CONFIGFS_ATTR(plane_, default_color_range);
>  CONFIGFS_ATTR(plane_, supported_color_encodings);
>  CONFIGFS_ATTR(plane_, default_color_encoding);
> +CONFIGFS_ATTR(plane_, supported_formats);
>  
>  static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_type,
> @@ -646,6 +763,7 @@ static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_default_color_range,
>  	&plane_attr_supported_color_encodings,
>  	&plane_attr_default_color_encoding,
> +	&plane_attr_supported_formats,
>  	NULL,
>  };
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.h b/drivers/gpu/drm/vkms/vkms_configfs.h
> index e9020b0043db..2774655bfcc5 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.h
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.h
> @@ -2,7 +2,13 @@
>  #ifndef _VKMS_CONFIGFS_H_
>  #define _VKMS_CONFIGFS_H_
>  
> +#include <linux/types.h>
> +
>  int vkms_configfs_register(void);
>  void vkms_configfs_unregister(void);
>  
> +#if IS_ENABLED(CONFIG_KUNIT)
> +int vkms_configfs_parse_next_format(const char *page, const char *end_page, char **out);
> +#endif
> +
>  #endif /* _VKMS_CONFIGFS_H_ */
> 
> -- 
> 2.51.2
> 
