Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6C0CE7B26
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 18:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EB410E205;
	Mon, 29 Dec 2025 17:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TrFsZ39F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEB210E205
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 16:59:58 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-47aa03d3326so58982925e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 08:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767027597; x=1767632397; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SAHnLIOP3CeHiQHVSAqFE8504lFP+mdUtEiVf2D5dus=;
 b=TrFsZ39F/eITbDIet3URvuKC8aSZHfKXktNBBqtQDOPUyHg+IRCzHwKuZtj5tmGcfw
 bjzGsErnfDuBpERMrEPTANGFrLVPtqYmBTm1mNddQGz3AthJHbAg2RLvIft56EpGPIre
 5v5y6cEEHtSahWMt1SRkowVLxWvkZ1F0chgiWf2kFtOkrpcgkmJb4ZfxkGBYNF4ypwI2
 H2o4fM2LoBB1xoKpVFdUBBaKXueEFuGk2Bapz+a0vIyEB8MK4ogLiecN6WSgmULe2Frf
 0rOkAtg/4wcOktU2ChgFeU/S0KPjnLK25Naj9juWJdwGwYxea9cb1f6xDhOMmUFyZPZT
 WFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767027597; x=1767632397;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SAHnLIOP3CeHiQHVSAqFE8504lFP+mdUtEiVf2D5dus=;
 b=oGnRl4Af6CnMCOixiBiLPX4+nP1RKKhSWUsv+7n5lnN/qJfu3dUBDDdIpezpC+eZgN
 4ZpTqBq7Ov/GsFEtsIez2mb0mFmvQq2Yri45u63Ihvy4fiqMQja5JrRQjnyIXxflRBL5
 OpHyyhhGI6l9gEOL/PpAk8LgrxNRw/ZIXDj/W2bWLKyqOti0t45qIChHAwZX6RAY5kZO
 tAlpbcxjU6MzRFIVXYmjOTFyknllErc+o9dzMNGbgMdeXzNuAChhmeWUZ8DUyPztOjXX
 /ZDnVtjZqFgTgW1xfcrI/zdRXCUS6HgX4N3k1BAzgmq9H+dU4dqgTyR3IgF2GOXtjAZy
 wJBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWGD4AOQI3QuA7Undb/XSOmoruu/Mj3J5/1HMdsfUealeOMZH4wC06Nj/6cFV/maogCsg5/Pzh9QQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzXlo0CcycMbAC7Tvft0Kf34Gc/PF8+btrfJX6dHLHSaEQhyTp
 /8wD3LoWdPxAJOzCy26289goBKec8/k04ayJvuUaIwhTaWlyWfNJQTRK
X-Gm-Gg: AY/fxX6WgmSEisSHftXNFbZnLBv/jrbrMiXY5avpYtC7vm5kVddqsaFVoxypHwg6UGD
 nw7BfJcRPjunNOrZEnfg4OmtZ7FU56Es3GHkwF5m9VuLB+8CW55p13S8VBPLJffMc2sOYzahJEv
 bSrpIQsCWg3gXURDVpvxJnGRT9u9+oHCPoWZOhxlRYZEeWPzMTrEfbZo49obPAUAg6rO1f04Zu1
 RxnGFf2oSCnIOTOKtsyORQXxBxTqlY8TixpxCl9ZqqbInT7/gezDNlPzZRsRC3bzcOL/zlrfOMv
 7NmQLFycxqVuebm7ELy/4hPL1CY7ViGfAeLIGiHpHXioTPztxY1z77PKak4ma8QxStLJzxUrR6i
 KH/ablx9Ih2fMZtG0izK6O0EMRt9RBKVw/ybn8OpG3dx8UJsQThRZBfuMxjoomtcePUaVSv2DJM
 Y2MGS2nqzrlw==
X-Google-Smtp-Source: AGHT+IGi38bNIRPESZJXDDTOIcycAM4JzqF8pQs2Jd8WsPsTkkEeNKyDjnWBOP5oInCHwpdMvIFDIg==
X-Received: by 2002:a05:600c:4fc6:b0:477:8b77:155f with SMTP id
 5b1f17b1804b1-47d1953865fmr294601805e9.8.1767027597041; 
 Mon, 29 Dec 2025 08:59:57 -0800 (PST)
Received: from fedora ([94.73.37.171]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d1936d220sm595736745e9.8.2025.12.29.08.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 08:59:56 -0800 (PST)
Date: Mon, 29 Dec 2025 17:59:54 +0100
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
Message-ID: <aVKzioiSzhNO8dzr@fedora>
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

I have been thinking for a while about this *(int *) casting and I'm not sure if it
would work in all cases.

I had a minor concern about int vs u32 and, while I don't think int will cause
issues, u32 looks like a better type.

My main concern was about endianess. The fourcc_code() macro shifts bits around,
which takes into account endianess. My brain hurt after trying to visualize this,
so I wrote a simple tests that works on x86_64 but fails on Power PC:

static void vkms_config_test_plane_add_format(struct kunit *test)
{
	struct vkms_config *config;
	struct vkms_config_plane *plane_cfg;
	int ret;
	u32 *formats;

	config = vkms_config_default_create(false, false, false, false);
	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);

	plane_cfg = get_first_plane(config);

	// DRM_FORMAT_XBGR16161616 = 942948952
	char fmt[4] = {'X', 'B', '4', '8'};

	vkms_config_plane_remove_all_formats(plane_cfg);
	ret = vkms_config_plane_get_supported_formats_count(plane_cfg);
	KUNIT_EXPECT_EQ(test, ret, 0);
	
	ret = vkms_config_plane_add_format(plane_cfg, *(int *)fmt);
	KUNIT_EXPECT_EQ(test, ret, 0);

	ret = vkms_config_plane_get_supported_formats_count(plane_cfg);
	KUNIT_EXPECT_EQ(test, ret, 1);

	formats = vkms_config_plane_get_supported_formats(plane_cfg);
	KUNIT_EXPECT_EQ(test, formats[0], DRM_FORMAT_XBGR16161616);
}

On big endian it fails with the following error:

[17:55:07] # vkms_config_test_plane_add_format: EXPECTATION FAILED at drivers/gpu/drm/vkms/tests/vkms_config_test.c:1256
[17:55:07] Expected ret == 0, but
[17:55:07]     ret == -22 (0xffffffffffffffea)
[17:55:07] # vkms_config_test_plane_add_format: EXPECTATION FAILED at drivers/gpu/drm/vkms/tests/vkms_config_test.c:1259
[17:55:07] Expected ret == 1, but
[17:55:07]     ret == 0 (0x0)
[17:55:07] # vkms_config_test_plane_add_format: EXPECTATION FAILED at drivers/gpu/drm/vkms/tests/vkms_config_test.c:1262
[17:55:07] Expected formats[0] == ((__u32)('X') | ((__u32)('B') << 8) | ((__u32)('4') << 16) | ((__u32)('8') << 24)), but
[17:55:07]     formats[0] == 875713089 (0x34325241)
[17:55:07]     ((__u32)('X') | ((__u32)('B') << 8) | ((__u32)('4') << 16) | ((__u32)('8') << 24)) == 942948952 (0x38344258)
[17:55:07] [FAILED] vkms_config_test_plane_add_format
[17:55:07]     # module: vkms_kunit_tests

So we need to find another way to convert the format. Maybe using the fourcc_code() macro?

Jose

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
