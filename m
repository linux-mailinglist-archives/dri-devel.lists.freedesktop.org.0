Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD045A437A8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 09:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4D910E184;
	Tue, 25 Feb 2025 08:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="P8Fk0O4a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b7/nqoBN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P8Fk0O4a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b7/nqoBN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D54110E5B0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 08:21:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BD3581F44F;
 Tue, 25 Feb 2025 08:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740471708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QvmZPE4KmqrD1GpBfdbxiu3bk14mnRw5WyOEOBSngdw=;
 b=P8Fk0O4aupVd9/7Xprx20YE7pO/GjVxIqfsUql2zh3B+5JLklTbTVCQfFRVV8uOlTCgr+Z
 mcP0hN0GZU/Ttsysmg4eo28nab8UhXkUsDWUxAcprd2flPoYWmweMoZdgb8zFMobYeuuB6
 mCoXniUrFOoPl8tFuOPnLJlFowylEIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740471708;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QvmZPE4KmqrD1GpBfdbxiu3bk14mnRw5WyOEOBSngdw=;
 b=b7/nqoBNkluimr44gkQxZeKkCrAI8yTUhgjhftPUbNY0blkcne4dCJaz7zrRduqzWGwMvn
 Ibb5eMntV4VfENDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740471708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QvmZPE4KmqrD1GpBfdbxiu3bk14mnRw5WyOEOBSngdw=;
 b=P8Fk0O4aupVd9/7Xprx20YE7pO/GjVxIqfsUql2zh3B+5JLklTbTVCQfFRVV8uOlTCgr+Z
 mcP0hN0GZU/Ttsysmg4eo28nab8UhXkUsDWUxAcprd2flPoYWmweMoZdgb8zFMobYeuuB6
 mCoXniUrFOoPl8tFuOPnLJlFowylEIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740471708;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QvmZPE4KmqrD1GpBfdbxiu3bk14mnRw5WyOEOBSngdw=;
 b=b7/nqoBNkluimr44gkQxZeKkCrAI8yTUhgjhftPUbNY0blkcne4dCJaz7zrRduqzWGwMvn
 Ibb5eMntV4VfENDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C80C13A61;
 Tue, 25 Feb 2025 08:21:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tBKiBZx9vWcNfQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Feb 2025 08:21:48 +0000
Message-ID: <02c1a1c0-c6d6-4527-93c2-20664cd2538d@suse.de>
Date: Tue, 25 Feb 2025 09:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] accel/rocket: Add a new driver for Rockchip's NPU
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-4-d4dbcfafc141@tomeuvizoso.net>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20250225-6-10-rocket-v2-4-d4dbcfafc141@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[tomeuvizoso.net,kernel.org,sntech.de,lwn.net,linux.intel.com,gmail.com,ffwll.ch,linaro.org,amd.com,collabora.com,quicinc.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[23]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TAGGED_RCPT(0.00)[dt]; MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 gitlab.freedesktop.org:url, lists.freedesktop.org:email, gen_header.py:url,
 suse.de:mid, tomeuvizoso.net:email]
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Mailman-Approved-At: Tue, 25 Feb 2025 08:31:33 +0000
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

Hi

Am 25.02.25 um 08:55 schrieb Tomeu Vizoso:
> This initial version supports the NPU as shipped in the RK3588 SoC and
> described in the first part of its TRM, in Chapter 36.
>
> This NPU contains 3 independent cores that the driver can submit jobs
> to.
>
> This commit adds just hardware initialization and power management.
>
> v2:
> - Split cores and IOMMUs as independent devices (Sebastian Reichel)
> - Add some documentation (Jeffrey Hugo)
> - Be more explicit in the Kconfig documentation (Jeffrey Hugo)
> - Remove resets, as these haven't been found useful so far (Zenghui Yu)
> - Repack structs (Jeffrey Hugo)
> - Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
> - Use devm_drm_dev_alloc (Jeffrey Hugo)
> - Use probe log helper (Jeffrey Hugo)
> - Introduce UABI header in a later patch (Jeffrey Hugo)
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>   Documentation/accel/index.rst           |    1 +
>   Documentation/accel/rocket/index.rst    |   19 +
>   MAINTAINERS                             |    8 +
>   drivers/accel/Kconfig                   |    1 +
>   drivers/accel/Makefile                  |    1 +
>   drivers/accel/rocket/Kconfig            |   25 +
>   drivers/accel/rocket/Makefile           |    8 +
>   drivers/accel/rocket/rocket_core.c      |   71 +
>   drivers/accel/rocket/rocket_core.h      |   29 +
>   drivers/accel/rocket/rocket_device.c    |   29 +
>   drivers/accel/rocket/rocket_device.h    |   29 +
>   drivers/accel/rocket/rocket_drv.c       |  273 ++
>   drivers/accel/rocket/rocket_drv.h       |   13 +
>   drivers/accel/rocket/rocket_registers.h | 4425 +++++++++++++++++++++++++++++++
>   14 files changed, 4932 insertions(+)
>
> diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
> index bc85f26533d88891dde482f91e26c99991b22869..d8fa332d60a890dbb617454d2a26d9b6f9b196aa 100644
> --- a/Documentation/accel/index.rst
> +++ b/Documentation/accel/index.rst
> @@ -10,6 +10,7 @@ Compute Accelerators
>      introduction
>      amdxdna/index
>      qaic/index
> +   rocket/index
>   
>   .. only::  subproject and html
>   
> diff --git a/Documentation/accel/rocket/index.rst b/Documentation/accel/rocket/index.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..ad33194dec0325d0dab362768fd349e8dc286970
> --- /dev/null
> +++ b/Documentation/accel/rocket/index.rst
> @@ -0,0 +1,19 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +=====================================
> + accel/rocket Rockchip NPU driver
> +=====================================
> +
> +The accel/rocket driver supports the Neural Processing Units (NPUs) inside some Rockchip SoCs such as the RK3588. Rockchip calls it RKNN and sometimes RKNPU.
> +
> +This NPU is closely based on the NVDLA IP released by NVIDIA as open hardware in 2018, along with open source kernel and userspace drivers.
> +
> +The frontend unit in Rockchip's NPU though is completely different from that in the open source IP, so this kernel driver is specific to Rockchip's version.
> +
> +The hardware is described in chapter 36 in the RK3588 TRM.
> +
> +This driver just powers the hardware on and off, allocates and maps buffers to the device and submits jobs to the frontend unit. Everything else is done in userspace, as a Gallium driver that is part of the Mesa3D project.
> +
> +Hardware currently supported:
> +
> +* RK3588
> \ No newline at end of file
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 25c86f47353de25c88291cc7fd6c4e9bfb12d5c4..cf89846b8bd2cf7ba742169debfc81838b2db46c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7135,6 +7135,14 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	drivers/accel/ivpu/
>   F:	include/uapi/drm/ivpu_accel.h
>   
> +DRM ACCEL DRIVER FOR ROCKCHIP NPU
> +M:	Tomeu Vizoso <tomeu@tomeuvizoso.net>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	drivers/accel/rocket/
> +F:	include/uapi/drm/rocket_accel.h
> +
>   DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
>   M:	Oded Gabbay <ogabbay@kernel.org>
>   L:	dri-devel@lists.freedesktop.org
> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
> index 5b9490367a39fd12d35a8d9021768aa186c09308..bb01cebc42bf16ebf02e938040f339ff94869e33 100644
> --- a/drivers/accel/Kconfig
> +++ b/drivers/accel/Kconfig
> @@ -28,5 +28,6 @@ source "drivers/accel/amdxdna/Kconfig"
>   source "drivers/accel/habanalabs/Kconfig"
>   source "drivers/accel/ivpu/Kconfig"
>   source "drivers/accel/qaic/Kconfig"
> +source "drivers/accel/rocket/Kconfig"
>   
>   endif
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index a301fb6089d4c515430175c5e2ba9190f6dc9158..ffc3fa58866616d933184a7659573cd4d4780a8d 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
>   obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>   obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>   obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
> +obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> \ No newline at end of file
> diff --git a/drivers/accel/rocket/Kconfig b/drivers/accel/rocket/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..83a401129ab2dc2847ccc30c6364e8802f43648d
> --- /dev/null
> +++ b/drivers/accel/rocket/Kconfig
> @@ -0,0 +1,25 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config DRM_ACCEL_ROCKET
> +       tristate "Rocket (support for Rockchip NPUs)"
> +       depends on DRM
> +       depends on ARM64 || COMPILE_TEST
> +       depends on MMU
> +       select DRM_SCHED
> +       select IOMMU_SUPPORT
> +       select IOMMU_IO_PGTABLE_LPAE
> +       select DRM_GEM_SHMEM_HELPER
> +       help
> +	  Choose this option if you have a Rockchip SoC that contains a
> +	  compatible Neural Processing Unit (NPU), such as the RK3588. Called by
> +	  Rockchip either RKNN or RKNPU, it accelerates inference of neural
> +	  networks.
> +
> +	  The interface exposed to userspace is described in
> +	  include/uapi/drm/rocket_accel.h and is used by the userspace driver in
> +	  Mesa3D.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called rocket.
> diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..73a7280d260c068d37ad3048824f710482333540
> --- /dev/null
> +++ b/drivers/accel/rocket/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_DRM_ACCEL_ROCKET) := rocket.o
> +
> +rocket-y := \
> +	rocket_core.o \
> +	rocket_device.o \
> +	rocket_drv.o
> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..09d966c826b5b1090a18cb24b3aa4aba286a12d4
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_core.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#include <linux/clk.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "rocket_core.h"
> +#include "rocket_registers.h"
> +
> +static int rocket_clk_init(struct rocket_core *core)
> +{
> +	struct device *dev = core->dev;
> +	int err;
> +
> +	core->a_clk = devm_clk_get(dev, "aclk");
> +	if (IS_ERR(core->a_clk)) {
> +		err = PTR_ERR(core->a_clk);
> +		dev_err(dev, "devm_clk_get_enabled failed %d for core %d\n", err, core->index);
> +		return err;
> +	}
> +
> +	core->h_clk = devm_clk_get(dev, "hclk");
> +	if (IS_ERR(core->h_clk)) {
> +		err = PTR_ERR(core->h_clk);
> +		dev_err(dev, "devm_clk_get_enabled failed %d for core %d\n", err, core->index);
> +		clk_disable_unprepare(core->a_clk);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +int rocket_core_init(struct rocket_core *core)
> +{
> +	struct device *dev = core->dev;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	uint32_t version;
> +	int err = 0;
> +
> +	err = rocket_clk_init(core);
> +	if (err) {
> +		dev_err(dev, "clk init failed %d\n", err);
> +		return err;
> +	}
> +
> +	core->iomem = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(core->iomem))
> +		return PTR_ERR(core->iomem);
> +
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 50); /* ~3 frames */
> +	pm_runtime_enable(dev);
> +
> +	err = pm_runtime_get_sync(dev);
> +
> +	version = rocket_read(core, REG_PC_VERSION);
> +	version += rocket_read(core, REG_PC_VERSION_NUM) & 0xffff;
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	dev_info(dev, "Rockchip NPU core %d version: %d\n", core->index, version);
> +
> +	return 0;
> +}
> +
> +void rocket_core_fini(struct rocket_core *core)
> +{
> +	pm_runtime_disable(core->dev);
> +}
> diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..2171eba7139ccc63fe24802dc81b4adb7f3abf31
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_core.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#ifndef __ROCKET_CORE_H__
> +#define __ROCKET_CORE_H__
> +
> +#include <drm/gpu_scheduler.h>
> +#include <linux/mutex_types.h>
> +#include <linux/io.h>

linux/ headers go first.

> +
> +#define rocket_read(core, reg) readl((core)->iomem + (reg))
> +#define rocket_write(core, reg, value) writel(value, (core)->iomem + (reg))
> +
> +struct rocket_core {
> +	struct device *dev;
> +	struct rocket_device *rdev;
> +	struct device_link *link;
> +	unsigned int index;
> +
> +	int irq;
> +	void __iomem *iomem;
> +	struct clk *a_clk;
> +	struct clk *h_clk;
> +};
> +
> +int rocket_core_init(struct rocket_core *core);
> +void rocket_core_fini(struct rocket_core *core);
> +
> +#endif
> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..ce3b533f15c1011d8a7a23dd8132e907cc334c58
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#include <linux/clk.h>
> +
> +#include "rocket_device.h"
> +
> +int rocket_device_init(struct rocket_device *rdev)
> +{
> +	struct device *dev = rdev->cores[0].dev;
> +	int err;
> +
> +	rdev->clk_npu = devm_clk_get(dev, "npu");
> +	rdev->pclk = devm_clk_get(dev, "pclk");
> +
> +	/* Initialize core 0 (top) */
> +	err = rocket_core_init(&rdev->cores[0]);
> +	if (err) {
> +		rocket_device_fini(rdev);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +void rocket_device_fini(struct rocket_device *rdev)
> +{
> +	rocket_core_fini(&rdev->cores[0]);
> +}
> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..466edba9102c5dc5dfac5d3fcc1c904f206eaebb
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_device.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#ifndef __ROCKET_DEVICE_H__
> +#define __ROCKET_DEVICE_H__
> +
> +#include <drm/drm_device.h>
> +
> +#include "rocket_core.h"
> +
> +struct rocket_device {
> +	struct drm_device ddev;
> +
> +	struct clk *clk_npu;
> +	struct clk *pclk;
> +
> +	struct rocket_core *cores;
> +	unsigned int num_cores;
> +};
> +
> +int rocket_device_init(struct rocket_device *rdev);
> +void rocket_device_fini(struct rocket_device *rdev);
> +
> +static inline struct rocket_device *to_rocket_device(struct drm_device *dev)
> +{
> +	return (struct rocket_device *)dev;

Please to a proper upcast with container_of().

> +}
> +
> +#endif
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c22d965f20f1239a36b1d823d5fe5f372713555d
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -0,0 +1,273 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#include <drm/drm_accel.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_ioctl.h>
> +#include <drm/drm_of.h>
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "rocket_drv.h"
> +
> +static int
> +rocket_open(struct drm_device *dev, struct drm_file *file)
> +{
> +	struct rocket_device *rdev = to_rocket_device(dev);
> +	struct rocket_file_priv *rocket_priv;
> +
> +	rocket_priv = kzalloc(sizeof(*rocket_priv), GFP_KERNEL);
> +	if (!rocket_priv)
> +		return -ENOMEM;
> +
> +	rocket_priv->rdev = rdev;
> +	file->driver_priv = rocket_priv;
> +
> +	return 0;
> +}
> +
> +static void
> +rocket_postclose(struct drm_device *dev, struct drm_file *file)
> +{
> +	struct rocket_file_priv *rocket_priv = file->driver_priv;
> +
> +	kfree(rocket_priv);
> +}
> +
> +static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
> +#define ROCKET_IOCTL(n, func) \
> +	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
> +};
> +
> +DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
> +
> +/*
> + * Rocket driver version:
> + * - 1.0 - initial interface
> + */
> +static const struct drm_driver rocket_drm_driver = {
> +	.driver_features	= DRIVER_COMPUTE_ACCEL,
> +	.open			= rocket_open,
> +	.postclose		= rocket_postclose,
> +	.ioctls			= rocket_drm_driver_ioctls,
> +	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
> +	.fops			= &rocket_accel_driver_fops,
> +	.name			= "rocket",
> +	.desc			= "rocket DRM",
> +};
> +
> +static int rocket_drm_bind(struct device *dev)
> +{
> +	struct device_node *core_node;
> +	struct rocket_device *rdev;
> +	struct drm_device *ddev;
> +	unsigned int num_cores = 1;
> +	int err;
> +
> +	rdev = devm_drm_dev_alloc(dev, &rocket_drm_driver, struct rocket_device, ddev);
> +	if (IS_ERR(ddev))
> +		return PTR_ERR(ddev);
> +
> +	ddev = &rdev->ddev;
> +	dev_set_drvdata(dev, rdev);
> +
> +	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core")
> +		if (of_device_is_available(core_node))
> +			num_cores++;
> +
> +	rdev->cores = devm_kmalloc_array(dev, num_cores, sizeof(*rdev->cores),
> +					 GFP_KERNEL | __GFP_ZERO);
> +	if (IS_ERR(rdev->cores))
> +		return PTR_ERR(rdev->cores);
> +
> +	/* Add core 0, any other cores will be added later when they are bound */
> +	rdev->cores[0].rdev = rdev;
> +	rdev->cores[0].dev = dev;
> +	rdev->cores[0].index = 0;
> +	rdev->num_cores = 1;
> +
> +	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
> +	if (err)
> +		return err;
> +
> +	err = rocket_device_init(rdev);
> +	if (err) {
> +		dev_err_probe(dev, err, "Fatal error during NPU init\n");
> +		goto err_device_fini;
> +	}
> +
> +	err = component_bind_all(dev, rdev);
> +	if (err)
> +		goto err_device_fini;
> +
> +	err = drm_dev_register(ddev, 0);
> +	if (err < 0)
> +		goto err_unbind;
> +
> +	return 0;
> +
> +err_unbind:
> +	component_unbind_all(dev, rdev);
> +err_device_fini:
> +	rocket_device_fini(rdev);
> +	return err;
> +}
> +
> +static void rocket_drm_unbind(struct device *dev)
> +{
> +	struct rocket_device *rdev = dev_get_drvdata(dev);
> +	struct drm_device *ddev = &rdev->ddev;
> +
> +	drm_dev_unregister(ddev);

I don't know if that works for accelerators, but for graphics, we often 
use drm_dev_unplug() instead of drm_dev_unregister(). The former will 
set the device state such that the rest of the driver can detect it. 
Makes hot-unplugging work.

> +
> +	component_unbind_all(dev, rdev);
> +
> +	rocket_device_fini(rdev);
> +}
> +
> +const struct component_master_ops rocket_drm_ops = {
> +	.bind = rocket_drm_bind,
> +	.unbind = rocket_drm_unbind,
> +};
> +
> +static int rocket_core_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct rocket_device *rdev = data;
> +	unsigned int core = rdev->num_cores;
> +	int err;
> +
> +	dev_set_drvdata(dev, rdev);
> +
> +	rdev->cores[core].rdev = rdev;
> +	rdev->cores[core].dev = dev;
> +	rdev->cores[core].index = core;
> +	rdev->cores[core].link = device_link_add(dev, rdev->cores[0].dev,
> +						 DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> +
> +	rdev->num_cores++;
> +
> +	err = rocket_core_init(&rdev->cores[core]);
> +	if (err) {
> +		rocket_device_fini(rdev);

num_cores has been incremented already. _fini works correctly with 
half-initialized cores?

> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static void rocket_core_unbind(struct device *dev, struct device *master, void *data)
> +{
> +	struct rocket_device *rdev = data;
> +
> +	for (unsigned int core = 1; core < rdev->num_cores; core++) {
> +		if (rdev->cores[core].dev == dev) {
> +			rocket_core_fini(&rdev->cores[core]);
> +			device_link_del(rdev->cores[core].link);
> +			break;
> +		}
> +	}
> +}
> +
> +const struct component_ops rocket_core_ops = {
> +	.bind = rocket_core_bind,
> +	.unbind = rocket_core_unbind,
> +};
> +
> +static int rocket_probe(struct platform_device *pdev)
> +{
> +	struct component_match *match = NULL;
> +	struct device_node *core_node;
> +
> +	if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,rk3588-rknn-core"))
> +		return component_add(&pdev->dev, &rocket_core_ops);
> +
> +	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core") {
> +		if (!of_device_is_available(core_node))
> +			continue;
> +
> +		drm_of_component_match_add(&pdev->dev, &match,
> +					   component_compare_of, core_node);
> +	}
> +
> +	return component_master_add_with_match(&pdev->dev, &rocket_drm_ops, match);
> +}
> +
> +static void rocket_remove(struct platform_device *pdev)
> +{
> +	if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,rk3588-rknn-core-top"))
> +		component_master_del(&pdev->dev, &rocket_drm_ops);
> +	else if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,rk3588-rknn-core"))
> +		component_del(&pdev->dev, &rocket_core_ops);
> +}
> +
> +static const struct of_device_id dt_match[] = {
> +	{ .compatible = "rockchip,rk3588-rknn-core-top" },
> +	{ .compatible = "rockchip,rk3588-rknn-core" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, dt_match);
> +
> +static int rocket_device_runtime_resume(struct device *dev)
> +{
> +	struct rocket_device *rdev = dev_get_drvdata(dev);
> +
> +	for (unsigned int core = 0; core < rdev->num_cores; core++) {
> +		if (dev != rdev->cores[core].dev)
> +			continue;
> +
> +		if (core == 0) {
> +			clk_prepare_enable(rdev->clk_npu);
> +			clk_prepare_enable(rdev->pclk);
> +		}
> +
> +		clk_prepare_enable(rdev->cores[core].a_clk);
> +		clk_prepare_enable(rdev->cores[core].h_clk);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rocket_device_runtime_suspend(struct device *dev)
> +{
> +	struct rocket_device *rdev = dev_get_drvdata(dev);
> +
> +	for (unsigned int core = 0; core < rdev->num_cores; core++) {
> +		if (dev != rdev->cores[core].dev)
> +			continue;
> +
> +		clk_disable_unprepare(rdev->cores[core].a_clk);
> +		clk_disable_unprepare(rdev->cores[core].h_clk);
> +
> +		if (core == 0) {
> +			clk_disable_unprepare(rdev->pclk);
> +			clk_disable_unprepare(rdev->clk_npu);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +EXPORT_GPL_DEV_PM_OPS(rocket_pm_ops) = {
> +	RUNTIME_PM_OPS(rocket_device_runtime_suspend, rocket_device_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +};
> +
> +static struct platform_driver rocket_driver = {
> +	.probe = rocket_probe,
> +	.remove = rocket_remove,
> +	.driver	 = {
> +		.name = "rocket",
> +		.pm = pm_ptr(&rocket_pm_ops),
> +		.of_match_table = dt_match,
> +	},
> +};
> +module_platform_driver(rocket_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("DRM driver for the Rockchip NPU IP");
> +MODULE_AUTHOR("Tomeu Vizoso");
> diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..ccdd50c69d4c033eea18cb800407fdcfb3bf2e9b
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_drv.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#ifndef __ROCKET_DRV_H__
> +#define __ROCKET_DRV_H__
> +
> +#include "rocket_device.h"
> +
> +struct rocket_file_priv {
> +	struct rocket_device *rdev;
> +};
> +
> +#endif
> diff --git a/drivers/accel/rocket/rocket_registers.h b/drivers/accel/rocket/rocket_registers.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..498566e9ca9fb7235f1c9035240075027b55a9e3
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_registers.h
> @@ -0,0 +1,4425 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +
> +#ifndef __ROCKET_REGISTERS_XML__
> +#define __ROCKET_REGISTERS_XML__
> +
> +/* Autogenerated file, DO NOT EDIT manually!
> +

That is the rest of the patch AFAICT. Could this file be added in a 
separate patch? It would make reviewing a bit easier.

Best regards
Thomas

> +This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> +http://gitlab.freedesktop.org/mesa/mesa/
> +git clone https://gitlab.freedesktop.org/mesa/mesa.git
> +
> +The rules-ng-ng source files this header was generated from are:
> +
> +- /home/tomeu/src/mesa/src/gallium/drivers/rocket/registers.xml (  60076 bytes, from Wed Jun 12 10:02:25 2024)
> +
> +Copyright (C) 2024-2025 by the following authors:
> +- Tomeu Vizoso <tomeu@tomeuvizoso.net> Tomeu Vizoso
> +
> +Permission is hereby granted, free of charge, to any person obtaining
> +a copy of this software and associated documentation files (the
> +"Software"), to deal in the Software without restriction, including
> +without limitation the rights to use, copy, modify, merge, publish,
> +distribute, sublicense, and/or sell copies of the Software, and to
> +permit persons to whom the Software is furnished to do so, subject to
> +the following conditions:
> +
> +The above copyright notice and this permission notice (including the
> +next paragraph) shall be included in all copies or substantial
> +portions of the Software.
> +
> +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> +EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> +MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
> +IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
> +LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> +OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
> +WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> +
> +*/
> +
> +#define REG_PC_VERSION						0x00000000
> +#define PC_VERSION_VERSION__MASK				0xffffffff
> +#define PC_VERSION_VERSION__SHIFT				0
> +static inline uint32_t PC_VERSION_VERSION(uint32_t val)
> +{
> +	return ((val) << PC_VERSION_VERSION__SHIFT) & PC_VERSION_VERSION__MASK;
> +}
> +
> +#define REG_PC_VERSION_NUM					0x00000004
> +#define PC_VERSION_NUM_VERSION_NUM__MASK			0xffffffff
> +#define PC_VERSION_NUM_VERSION_NUM__SHIFT			0
> +static inline uint32_t PC_VERSION_NUM_VERSION_NUM(uint32_t val)
> +{
> +	return ((val) << PC_VERSION_NUM_VERSION_NUM__SHIFT) & PC_VERSION_NUM_VERSION_NUM__MASK;
> +}
> +
> +#define REG_PC_OPERATION_ENABLE					0x00000008
> +#define PC_OPERATION_ENABLE_RESERVED_0__MASK			0xfffffffe
> +#define PC_OPERATION_ENABLE_RESERVED_0__SHIFT			1
> +static inline uint32_t PC_OPERATION_ENABLE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PC_OPERATION_ENABLE_RESERVED_0__SHIFT) & PC_OPERATION_ENABLE_RESERVED_0__MASK;
> +}
> +#define PC_OPERATION_ENABLE_OP_EN__MASK				0x00000001
> +#define PC_OPERATION_ENABLE_OP_EN__SHIFT			0
> +static inline uint32_t PC_OPERATION_ENABLE_OP_EN(uint32_t val)
> +{
> +	return ((val) << PC_OPERATION_ENABLE_OP_EN__SHIFT) & PC_OPERATION_ENABLE_OP_EN__MASK;
> +}
> +
> +#define REG_PC_BASE_ADDRESS					0x00000010
> +#define PC_BASE_ADDRESS_PC_SOURCE_ADDR__MASK			0xfffffff0
> +#define PC_BASE_ADDRESS_PC_SOURCE_ADDR__SHIFT			4
> +static inline uint32_t PC_BASE_ADDRESS_PC_SOURCE_ADDR(uint32_t val)
> +{
> +	return ((val) << PC_BASE_ADDRESS_PC_SOURCE_ADDR__SHIFT) & PC_BASE_ADDRESS_PC_SOURCE_ADDR__MASK;
> +}
> +#define PC_BASE_ADDRESS_RESERVED_0__MASK			0x0000000e
> +#define PC_BASE_ADDRESS_RESERVED_0__SHIFT			1
> +static inline uint32_t PC_BASE_ADDRESS_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PC_BASE_ADDRESS_RESERVED_0__SHIFT) & PC_BASE_ADDRESS_RESERVED_0__MASK;
> +}
> +#define PC_BASE_ADDRESS_PC_SEL__MASK				0x00000001
> +#define PC_BASE_ADDRESS_PC_SEL__SHIFT				0
> +static inline uint32_t PC_BASE_ADDRESS_PC_SEL(uint32_t val)
> +{
> +	return ((val) << PC_BASE_ADDRESS_PC_SEL__SHIFT) & PC_BASE_ADDRESS_PC_SEL__MASK;
> +}
> +
> +#define REG_PC_REGISTER_AMOUNTS					0x00000014
> +#define PC_REGISTER_AMOUNTS_RESERVED_0__MASK			0xffff0000
> +#define PC_REGISTER_AMOUNTS_RESERVED_0__SHIFT			16
> +static inline uint32_t PC_REGISTER_AMOUNTS_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PC_REGISTER_AMOUNTS_RESERVED_0__SHIFT) & PC_REGISTER_AMOUNTS_RESERVED_0__MASK;
> +}
> +#define PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT__MASK		0x0000ffff
> +#define PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT__SHIFT		0
> +static inline uint32_t PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT(uint32_t val)
> +{
> +	return ((val) << PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT__SHIFT) & PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT__MASK;
> +}
> +
> +#define REG_PC_INTERRUPT_MASK					0x00000020
> +#define PC_INTERRUPT_MASK_RESERVED_0__MASK			0xffffc000
> +#define PC_INTERRUPT_MASK_RESERVED_0__SHIFT			14
> +static inline uint32_t PC_INTERRUPT_MASK_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PC_INTERRUPT_MASK_RESERVED_0__SHIFT) & PC_INTERRUPT_MASK_RESERVED_0__MASK;
> +}
> +#define PC_INTERRUPT_MASK_DMA_WRITE_ERROR			0x00002000
> +#define PC_INTERRUPT_MASK_DMA_READ_ERROR			0x00001000
> +#define PC_INTERRUPT_MASK_PPU_1					0x00000800
> +#define PC_INTERRUPT_MASK_PPU_0					0x00000400
> +#define PC_INTERRUPT_MASK_DPU_1					0x00000200
> +#define PC_INTERRUPT_MASK_DPU_0					0x00000100
> +#define PC_INTERRUPT_MASK_CORE_1				0x00000080
> +#define PC_INTERRUPT_MASK_CORE_0				0x00000040
> +#define PC_INTERRUPT_MASK_CNA_CSC_1				0x00000020
> +#define PC_INTERRUPT_MASK_CNA_CSC_0				0x00000010
> +#define PC_INTERRUPT_MASK_CNA_WEIGHT_1				0x00000008
> +#define PC_INTERRUPT_MASK_CNA_WEIGHT_0				0x00000004
> +#define PC_INTERRUPT_MASK_CNA_FEATURE_1				0x00000002
> +#define PC_INTERRUPT_MASK_CNA_FEATURE_0				0x00000001
> +
> +#define REG_PC_INTERRUPT_CLEAR					0x00000024
> +#define PC_INTERRUPT_CLEAR_RESERVED_0__MASK			0xffffc000
> +#define PC_INTERRUPT_CLEAR_RESERVED_0__SHIFT			14
> +static inline uint32_t PC_INTERRUPT_CLEAR_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PC_INTERRUPT_CLEAR_RESERVED_0__SHIFT) & PC_INTERRUPT_CLEAR_RESERVED_0__MASK;
> +}
> +#define PC_INTERRUPT_CLEAR_DMA_WRITE_ERROR			0x00002000
> +#define PC_INTERRUPT_CLEAR_DMA_READ_ERROR			0x00001000
> +#define PC_INTERRUPT_CLEAR_PPU_1				0x00000800
> +#define PC_INTERRUPT_CLEAR_PPU_0				0x00000400
> +#define PC_INTERRUPT_CLEAR_DPU_1				0x00000200
> +#define PC_INTERRUPT_CLEAR_DPU_0				0x00000100
> +#define PC_INTERRUPT_CLEAR_CORE_1				0x00000080
> +#define PC_INTERRUPT_CLEAR_CORE_0				0x00000040
> +#define PC_INTERRUPT_CLEAR_CNA_CSC_1				0x00000020
> +#define PC_INTERRUPT_CLEAR_CNA_CSC_0				0x00000010
> +#define PC_INTERRUPT_CLEAR_CNA_WEIGHT_1				0x00000008
> +#define PC_INTERRUPT_CLEAR_CNA_WEIGHT_0				0x00000004
> +#define PC_INTERRUPT_CLEAR_CNA_FEATURE_1			0x00000002
> +#define PC_INTERRUPT_CLEAR_CNA_FEATURE_0			0x00000001
> +
> +#define REG_PC_INTERRUPT_STATUS					0x00000028
> +#define PC_INTERRUPT_STATUS_RESERVED_0__MASK			0xffffc000
> +#define PC_INTERRUPT_STATUS_RESERVED_0__SHIFT			14
> +static inline uint32_t PC_INTERRUPT_STATUS_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PC_INTERRUPT_STATUS_RESERVED_0__SHIFT) & PC_INTERRUPT_STATUS_RESERVED_0__MASK;
> +}
> +#define PC_INTERRUPT_STATUS_DMA_WRITE_ERROR			0x00002000
> +#define PC_INTERRUPT_STATUS_DMA_READ_ERROR			0x00001000
> +#define PC_INTERRUPT_STATUS_PPU_1				0x00000800
> +#define PC_INTERRUPT_STATUS_PPU_0				0x00000400
> +#define PC_INTERRUPT_STATUS_DPU_1				0x00000200
> +#define PC_INTERRUPT_STATUS_DPU_0				0x00000100
> +#define PC_INTERRUPT_STATUS_CORE_1				0x00000080
> +#define PC_INTERRUPT_STATUS_CORE_0				0x00000040
> +#define PC_INTERRUPT_STATUS_CNA_CSC_1				0x00000020
> +#define PC_INTERRUPT_STATUS_CNA_CSC_0				0x00000010
> +#define PC_INTERRUPT_STATUS_CNA_WEIGHT_1			0x00000008
> +#define PC_INTERRUPT_STATUS_CNA_WEIGHT_0			0x00000004
> +#define PC_INTERRUPT_STATUS_CNA_FEATURE_1			0x00000002
> +#define PC_INTERRUPT_STATUS_CNA_FEATURE_0			0x00000001
> +
> +#define REG_PC_INTERRUPT_RAW_STATUS				0x0000002c
> +#define PC_INTERRUPT_RAW_STATUS_RESERVED_0__MASK		0xffffc000
> +#define PC_INTERRUPT_RAW_STATUS_RESERVED_0__SHIFT		14
> +static inline uint32_t PC_INTERRUPT_RAW_STATUS_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PC_INTERRUPT_RAW_STATUS_RESERVED_0__SHIFT) & PC_INTERRUPT_RAW_STATUS_RESERVED_0__MASK;
> +}
> +#define PC_INTERRUPT_RAW_STATUS_DMA_WRITE_ERROR			0x00002000
> +#define PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR			0x00001000
> +#define PC_INTERRUPT_RAW_STATUS_PPU_1				0x00000800
> +#define PC_INTERRUPT_RAW_STATUS_PPU_0				0x00000400
> +#define PC_INTERRUPT_RAW_STATUS_DPU_1				0x00000200
> +#define PC_INTERRUPT_RAW_STATUS_DPU_0				0x00000100
> +#define PC_INTERRUPT_RAW_STATUS_CORE_1				0x00000080
> +#define PC_INTERRUPT_RAW_STATUS_CORE_0				0x00000040
> +#define PC_INTERRUPT_RAW_STATUS_CNA_CSC_1			0x00000020
> +#define PC_INTERRUPT_RAW_STATUS_CNA_CSC_0			0x00000010
> +#define PC_INTERRUPT_RAW_STATUS_CNA_WEIGHT_1			0x00000008
> +#define PC_INTERRUPT_RAW_STATUS_CNA_WEIGHT_0			0x00000004
> +#define PC_INTERRUPT_RAW_STATUS_CNA_FEATURE_1			0x00000002
> +#define PC_INTERRUPT_RAW_STATUS_CNA_FEATURE_0			0x00000001
> +
> +#define REG_PC_TASK_CON						0x00000030
> +#define PC_TASK_CON_RESERVED_0__MASK				0xffffc000
> +#define PC_TASK_CON_RESERVED_0__SHIFT				14
> +static inline uint32_t PC_TASK_CON_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PC_TASK_CON_RESERVED_0__SHIFT) & PC_TASK_CON_RESERVED_0__MASK;
> +}
> +#define PC_TASK_CON_TASK_COUNT_CLEAR__MASK			0x00002000
> +#define PC_TASK_CON_TASK_COUNT_CLEAR__SHIFT			13
> +static inline uint32_t PC_TASK_CON_TASK_COUNT_CLEAR(uint32_t val)
> +{
> +	return ((val) << PC_TASK_CON_TASK_COUNT_CLEAR__SHIFT) & PC_TASK_CON_TASK_COUNT_CLEAR__MASK;
> +}
> +#define PC_TASK_CON_TASK_PP_EN__MASK				0x00001000
> +#define PC_TASK_CON_TASK_PP_EN__SHIFT				12
> +static inline uint32_t PC_TASK_CON_TASK_PP_EN(uint32_t val)
> +{
> +	return ((val) << PC_TASK_CON_TASK_PP_EN__SHIFT) & PC_TASK_CON_TASK_PP_EN__MASK;
> +}
> +#define PC_TASK_CON_TASK_NUMBER__MASK				0x00000fff
> +#define PC_TASK_CON_TASK_NUMBER__SHIFT				0
> +static inline uint32_t PC_TASK_CON_TASK_NUMBER(uint32_t val)
> +{
> +	return ((val) << PC_TASK_CON_TASK_NUMBER__SHIFT) & PC_TASK_CON_TASK_NUMBER__MASK;
> +}
> +
> +#define REG_PC_TASK_DMA_BASE_ADDR				0x00000034
> +#define PC_TASK_DMA_BASE_ADDR_DMA_BASE_ADDR__MASK		0xfffffff0
> +#define PC_TASK_DMA_BASE_ADDR_DMA_BASE_ADDR__SHIFT		4
> +static inline uint32_t PC_TASK_DMA_BASE_ADDR_DMA_BASE_ADDR(uint32_t val)
> +{
> +	return ((val) << PC_TASK_DMA_BASE_ADDR_DMA_BASE_ADDR__SHIFT) & PC_TASK_DMA_BASE_ADDR_DMA_BASE_ADDR__MASK;
> +}
> +#define PC_TASK_DMA_BASE_ADDR_RESERVED_0__MASK			0x0000000f
> +#define PC_TASK_DMA_BASE_ADDR_RESERVED_0__SHIFT			0
> +static inline uint32_t PC_TASK_DMA_BASE_ADDR_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PC_TASK_DMA_BASE_ADDR_RESERVED_0__SHIFT) & PC_TASK_DMA_BASE_ADDR_RESERVED_0__MASK;
> +}
> +
> +#define REG_PC_TASK_STATUS					0x0000003c
> +#define PC_TASK_STATUS_RESERVED_0__MASK				0xf0000000
> +#define PC_TASK_STATUS_RESERVED_0__SHIFT			28
> +static inline uint32_t PC_TASK_STATUS_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PC_TASK_STATUS_RESERVED_0__SHIFT) & PC_TASK_STATUS_RESERVED_0__MASK;
> +}
> +#define PC_TASK_STATUS_TASK_STATUS__MASK			0x0fffffff
> +#define PC_TASK_STATUS_TASK_STATUS__SHIFT			0
> +static inline uint32_t PC_TASK_STATUS_TASK_STATUS(uint32_t val)
> +{
> +	return ((val) << PC_TASK_STATUS_TASK_STATUS__SHIFT) & PC_TASK_STATUS_TASK_STATUS__MASK;
> +}
> +
> +#define REG_CNA_S_STATUS					0x00001000
> +#define CNA_S_STATUS_RESERVED_0__MASK				0xfffc0000
> +#define CNA_S_STATUS_RESERVED_0__SHIFT				18
> +static inline uint32_t CNA_S_STATUS_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_S_STATUS_RESERVED_0__SHIFT) & CNA_S_STATUS_RESERVED_0__MASK;
> +}
> +#define CNA_S_STATUS_STATUS_1__MASK				0x00030000
> +#define CNA_S_STATUS_STATUS_1__SHIFT				16
> +static inline uint32_t CNA_S_STATUS_STATUS_1(uint32_t val)
> +{
> +	return ((val) << CNA_S_STATUS_STATUS_1__SHIFT) & CNA_S_STATUS_STATUS_1__MASK;
> +}
> +#define CNA_S_STATUS_RESERVED_1__MASK				0x0000fffc
> +#define CNA_S_STATUS_RESERVED_1__SHIFT				2
> +static inline uint32_t CNA_S_STATUS_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << CNA_S_STATUS_RESERVED_1__SHIFT) & CNA_S_STATUS_RESERVED_1__MASK;
> +}
> +#define CNA_S_STATUS_STATUS_0__MASK				0x00000003
> +#define CNA_S_STATUS_STATUS_0__SHIFT				0
> +static inline uint32_t CNA_S_STATUS_STATUS_0(uint32_t val)
> +{
> +	return ((val) << CNA_S_STATUS_STATUS_0__SHIFT) & CNA_S_STATUS_STATUS_0__MASK;
> +}
> +
> +#define REG_CNA_S_POINTER					0x00001004
> +#define CNA_S_POINTER_RESERVED_0__MASK				0xfffe0000
> +#define CNA_S_POINTER_RESERVED_0__SHIFT				17
> +static inline uint32_t CNA_S_POINTER_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_S_POINTER_RESERVED_0__SHIFT) & CNA_S_POINTER_RESERVED_0__MASK;
> +}
> +#define CNA_S_POINTER_EXECUTER__MASK				0x00010000
> +#define CNA_S_POINTER_EXECUTER__SHIFT				16
> +static inline uint32_t CNA_S_POINTER_EXECUTER(uint32_t val)
> +{
> +	return ((val) << CNA_S_POINTER_EXECUTER__SHIFT) & CNA_S_POINTER_EXECUTER__MASK;
> +}
> +#define CNA_S_POINTER_RESERVED_1__MASK				0x0000ffc0
> +#define CNA_S_POINTER_RESERVED_1__SHIFT				6
> +static inline uint32_t CNA_S_POINTER_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << CNA_S_POINTER_RESERVED_1__SHIFT) & CNA_S_POINTER_RESERVED_1__MASK;
> +}
> +#define CNA_S_POINTER_EXECUTER_PP_CLEAR__MASK			0x00000020
> +#define CNA_S_POINTER_EXECUTER_PP_CLEAR__SHIFT			5
> +static inline uint32_t CNA_S_POINTER_EXECUTER_PP_CLEAR(uint32_t val)
> +{
> +	return ((val) << CNA_S_POINTER_EXECUTER_PP_CLEAR__SHIFT) & CNA_S_POINTER_EXECUTER_PP_CLEAR__MASK;
> +}
> +#define CNA_S_POINTER_POINTER_PP_CLEAR__MASK			0x00000010
> +#define CNA_S_POINTER_POINTER_PP_CLEAR__SHIFT			4
> +static inline uint32_t CNA_S_POINTER_POINTER_PP_CLEAR(uint32_t val)
> +{
> +	return ((val) << CNA_S_POINTER_POINTER_PP_CLEAR__SHIFT) & CNA_S_POINTER_POINTER_PP_CLEAR__MASK;
> +}
> +#define CNA_S_POINTER_POINTER_PP_MODE__MASK			0x00000008
> +#define CNA_S_POINTER_POINTER_PP_MODE__SHIFT			3
> +static inline uint32_t CNA_S_POINTER_POINTER_PP_MODE(uint32_t val)
> +{
> +	return ((val) << CNA_S_POINTER_POINTER_PP_MODE__SHIFT) & CNA_S_POINTER_POINTER_PP_MODE__MASK;
> +}
> +#define CNA_S_POINTER_EXECUTER_PP_EN__MASK			0x00000004
> +#define CNA_S_POINTER_EXECUTER_PP_EN__SHIFT			2
> +static inline uint32_t CNA_S_POINTER_EXECUTER_PP_EN(uint32_t val)
> +{
> +	return ((val) << CNA_S_POINTER_EXECUTER_PP_EN__SHIFT) & CNA_S_POINTER_EXECUTER_PP_EN__MASK;
> +}
> +#define CNA_S_POINTER_POINTER_PP_EN__MASK			0x00000002
> +#define CNA_S_POINTER_POINTER_PP_EN__SHIFT			1
> +static inline uint32_t CNA_S_POINTER_POINTER_PP_EN(uint32_t val)
> +{
> +	return ((val) << CNA_S_POINTER_POINTER_PP_EN__SHIFT) & CNA_S_POINTER_POINTER_PP_EN__MASK;
> +}
> +#define CNA_S_POINTER_POINTER__MASK				0x00000001
> +#define CNA_S_POINTER_POINTER__SHIFT				0
> +static inline uint32_t CNA_S_POINTER_POINTER(uint32_t val)
> +{
> +	return ((val) << CNA_S_POINTER_POINTER__SHIFT) & CNA_S_POINTER_POINTER__MASK;
> +}
> +
> +#define REG_CNA_OPERATION_ENABLE				0x00001008
> +#define CNA_OPERATION_ENABLE_RESERVED_0__MASK			0xfffffffe
> +#define CNA_OPERATION_ENABLE_RESERVED_0__SHIFT			1
> +static inline uint32_t CNA_OPERATION_ENABLE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_OPERATION_ENABLE_RESERVED_0__SHIFT) & CNA_OPERATION_ENABLE_RESERVED_0__MASK;
> +}
> +#define CNA_OPERATION_ENABLE_OP_EN__MASK			0x00000001
> +#define CNA_OPERATION_ENABLE_OP_EN__SHIFT			0
> +static inline uint32_t CNA_OPERATION_ENABLE_OP_EN(uint32_t val)
> +{
> +	return ((val) << CNA_OPERATION_ENABLE_OP_EN__SHIFT) & CNA_OPERATION_ENABLE_OP_EN__MASK;
> +}
> +
> +#define REG_CNA_CONV_CON1					0x0000100c
> +#define CNA_CONV_CON1_RESERVED_0__MASK				0x80000000
> +#define CNA_CONV_CON1_RESERVED_0__SHIFT				31
> +static inline uint32_t CNA_CONV_CON1_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON1_RESERVED_0__SHIFT) & CNA_CONV_CON1_RESERVED_0__MASK;
> +}
> +#define CNA_CONV_CON1_NONALIGN_DMA__MASK			0x40000000
> +#define CNA_CONV_CON1_NONALIGN_DMA__SHIFT			30
> +static inline uint32_t CNA_CONV_CON1_NONALIGN_DMA(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON1_NONALIGN_DMA__SHIFT) & CNA_CONV_CON1_NONALIGN_DMA__MASK;
> +}
> +#define CNA_CONV_CON1_GROUP_LINE_OFF__MASK			0x20000000
> +#define CNA_CONV_CON1_GROUP_LINE_OFF__SHIFT			29
> +static inline uint32_t CNA_CONV_CON1_GROUP_LINE_OFF(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON1_GROUP_LINE_OFF__SHIFT) & CNA_CONV_CON1_GROUP_LINE_OFF__MASK;
> +}
> +#define CNA_CONV_CON1_RESERVED_1__MASK				0x1ffe0000
> +#define CNA_CONV_CON1_RESERVED_1__SHIFT				17
> +static inline uint32_t CNA_CONV_CON1_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON1_RESERVED_1__SHIFT) & CNA_CONV_CON1_RESERVED_1__MASK;
> +}
> +#define CNA_CONV_CON1_DECONV__MASK				0x00010000
> +#define CNA_CONV_CON1_DECONV__SHIFT				16
> +static inline uint32_t CNA_CONV_CON1_DECONV(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON1_DECONV__SHIFT) & CNA_CONV_CON1_DECONV__MASK;
> +}
> +#define CNA_CONV_CON1_ARGB_IN__MASK				0x0000f000
> +#define CNA_CONV_CON1_ARGB_IN__SHIFT				12
> +static inline uint32_t CNA_CONV_CON1_ARGB_IN(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON1_ARGB_IN__SHIFT) & CNA_CONV_CON1_ARGB_IN__MASK;
> +}
> +#define CNA_CONV_CON1_RESERVED_2__MASK				0x00000c00
> +#define CNA_CONV_CON1_RESERVED_2__SHIFT				10
> +static inline uint32_t CNA_CONV_CON1_RESERVED_2(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON1_RESERVED_2__SHIFT) & CNA_CONV_CON1_RESERVED_2__MASK;
> +}
> +#define CNA_CONV_CON1_PROC_PRECISION__MASK			0x00000380
> +#define CNA_CONV_CON1_PROC_PRECISION__SHIFT			7
> +static inline uint32_t CNA_CONV_CON1_PROC_PRECISION(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON1_PROC_PRECISION__SHIFT) & CNA_CONV_CON1_PROC_PRECISION__MASK;
> +}
> +#define CNA_CONV_CON1_IN_PRECISION__MASK			0x00000070
> +#define CNA_CONV_CON1_IN_PRECISION__SHIFT			4
> +static inline uint32_t CNA_CONV_CON1_IN_PRECISION(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON1_IN_PRECISION__SHIFT) & CNA_CONV_CON1_IN_PRECISION__MASK;
> +}
> +#define CNA_CONV_CON1_CONV_MODE__MASK				0x0000000f
> +#define CNA_CONV_CON1_CONV_MODE__SHIFT				0
> +static inline uint32_t CNA_CONV_CON1_CONV_MODE(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON1_CONV_MODE__SHIFT) & CNA_CONV_CON1_CONV_MODE__MASK;
> +}
> +
> +#define REG_CNA_CONV_CON2					0x00001010
> +#define CNA_CONV_CON2_RESERVED_0__MASK				0xff000000
> +#define CNA_CONV_CON2_RESERVED_0__SHIFT				24
> +static inline uint32_t CNA_CONV_CON2_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON2_RESERVED_0__SHIFT) & CNA_CONV_CON2_RESERVED_0__MASK;
> +}
> +#define CNA_CONV_CON2_KERNEL_GROUP__MASK			0x00ff0000
> +#define CNA_CONV_CON2_KERNEL_GROUP__SHIFT			16
> +static inline uint32_t CNA_CONV_CON2_KERNEL_GROUP(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON2_KERNEL_GROUP__SHIFT) & CNA_CONV_CON2_KERNEL_GROUP__MASK;
> +}
> +#define CNA_CONV_CON2_RESERVED_1__MASK				0x0000c000
> +#define CNA_CONV_CON2_RESERVED_1__SHIFT				14
> +static inline uint32_t CNA_CONV_CON2_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON2_RESERVED_1__SHIFT) & CNA_CONV_CON2_RESERVED_1__MASK;
> +}
> +#define CNA_CONV_CON2_FEATURE_GRAINS__MASK			0x00003ff0
> +#define CNA_CONV_CON2_FEATURE_GRAINS__SHIFT			4
> +static inline uint32_t CNA_CONV_CON2_FEATURE_GRAINS(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON2_FEATURE_GRAINS__SHIFT) & CNA_CONV_CON2_FEATURE_GRAINS__MASK;
> +}
> +#define CNA_CONV_CON2_RESERVED_2__MASK				0x00000008
> +#define CNA_CONV_CON2_RESERVED_2__SHIFT				3
> +static inline uint32_t CNA_CONV_CON2_RESERVED_2(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON2_RESERVED_2__SHIFT) & CNA_CONV_CON2_RESERVED_2__MASK;
> +}
> +#define CNA_CONV_CON2_CSC_WO_EN__MASK				0x00000004
> +#define CNA_CONV_CON2_CSC_WO_EN__SHIFT				2
> +static inline uint32_t CNA_CONV_CON2_CSC_WO_EN(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON2_CSC_WO_EN__SHIFT) & CNA_CONV_CON2_CSC_WO_EN__MASK;
> +}
> +#define CNA_CONV_CON2_CSC_DO_EN__MASK				0x00000002
> +#define CNA_CONV_CON2_CSC_DO_EN__SHIFT				1
> +static inline uint32_t CNA_CONV_CON2_CSC_DO_EN(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON2_CSC_DO_EN__SHIFT) & CNA_CONV_CON2_CSC_DO_EN__MASK;
> +}
> +#define CNA_CONV_CON2_CMD_FIFO_SRST__MASK			0x00000001
> +#define CNA_CONV_CON2_CMD_FIFO_SRST__SHIFT			0
> +static inline uint32_t CNA_CONV_CON2_CMD_FIFO_SRST(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON2_CMD_FIFO_SRST__SHIFT) & CNA_CONV_CON2_CMD_FIFO_SRST__MASK;
> +}
> +
> +#define REG_CNA_CONV_CON3					0x00001014
> +#define CNA_CONV_CON3_RESERVED_0__MASK				0x80000000
> +#define CNA_CONV_CON3_RESERVED_0__SHIFT				31
> +static inline uint32_t CNA_CONV_CON3_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON3_RESERVED_0__SHIFT) & CNA_CONV_CON3_RESERVED_0__MASK;
> +}
> +#define CNA_CONV_CON3_NN_MODE__MASK				0x70000000
> +#define CNA_CONV_CON3_NN_MODE__SHIFT				28
> +static inline uint32_t CNA_CONV_CON3_NN_MODE(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON3_NN_MODE__SHIFT) & CNA_CONV_CON3_NN_MODE__MASK;
> +}
> +#define CNA_CONV_CON3_RESERVED_1__MASK				0x0c000000
> +#define CNA_CONV_CON3_RESERVED_1__SHIFT				26
> +static inline uint32_t CNA_CONV_CON3_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON3_RESERVED_1__SHIFT) & CNA_CONV_CON3_RESERVED_1__MASK;
> +}
> +#define CNA_CONV_CON3_ATROUS_Y_DILATION__MASK			0x03e00000
> +#define CNA_CONV_CON3_ATROUS_Y_DILATION__SHIFT			21
> +static inline uint32_t CNA_CONV_CON3_ATROUS_Y_DILATION(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON3_ATROUS_Y_DILATION__SHIFT) & CNA_CONV_CON3_ATROUS_Y_DILATION__MASK;
> +}
> +#define CNA_CONV_CON3_ATROUS_X_DILATION__MASK			0x001f0000
> +#define CNA_CONV_CON3_ATROUS_X_DILATION__SHIFT			16
> +static inline uint32_t CNA_CONV_CON3_ATROUS_X_DILATION(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON3_ATROUS_X_DILATION__SHIFT) & CNA_CONV_CON3_ATROUS_X_DILATION__MASK;
> +}
> +#define CNA_CONV_CON3_RESERVED_2__MASK				0x0000c000
> +#define CNA_CONV_CON3_RESERVED_2__SHIFT				14
> +static inline uint32_t CNA_CONV_CON3_RESERVED_2(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON3_RESERVED_2__SHIFT) & CNA_CONV_CON3_RESERVED_2__MASK;
> +}
> +#define CNA_CONV_CON3_DECONV_Y_STRIDE__MASK			0x00003800
> +#define CNA_CONV_CON3_DECONV_Y_STRIDE__SHIFT			11
> +static inline uint32_t CNA_CONV_CON3_DECONV_Y_STRIDE(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON3_DECONV_Y_STRIDE__SHIFT) & CNA_CONV_CON3_DECONV_Y_STRIDE__MASK;
> +}
> +#define CNA_CONV_CON3_DECONV_X_STRIDE__MASK			0x00000700
> +#define CNA_CONV_CON3_DECONV_X_STRIDE__SHIFT			8
> +static inline uint32_t CNA_CONV_CON3_DECONV_X_STRIDE(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON3_DECONV_X_STRIDE__SHIFT) & CNA_CONV_CON3_DECONV_X_STRIDE__MASK;
> +}
> +#define CNA_CONV_CON3_RESERVED_3__MASK				0x000000c0
> +#define CNA_CONV_CON3_RESERVED_3__SHIFT				6
> +static inline uint32_t CNA_CONV_CON3_RESERVED_3(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON3_RESERVED_3__SHIFT) & CNA_CONV_CON3_RESERVED_3__MASK;
> +}
> +#define CNA_CONV_CON3_CONV_Y_STRIDE__MASK			0x00000038
> +#define CNA_CONV_CON3_CONV_Y_STRIDE__SHIFT			3
> +static inline uint32_t CNA_CONV_CON3_CONV_Y_STRIDE(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON3_CONV_Y_STRIDE__SHIFT) & CNA_CONV_CON3_CONV_Y_STRIDE__MASK;
> +}
> +#define CNA_CONV_CON3_CONV_X_STRIDE__MASK			0x00000007
> +#define CNA_CONV_CON3_CONV_X_STRIDE__SHIFT			0
> +static inline uint32_t CNA_CONV_CON3_CONV_X_STRIDE(uint32_t val)
> +{
> +	return ((val) << CNA_CONV_CON3_CONV_X_STRIDE__SHIFT) & CNA_CONV_CON3_CONV_X_STRIDE__MASK;
> +}
> +
> +#define REG_CNA_DATA_SIZE0					0x00001020
> +#define CNA_DATA_SIZE0_RESERVED_0__MASK				0xf8000000
> +#define CNA_DATA_SIZE0_RESERVED_0__SHIFT			27
> +static inline uint32_t CNA_DATA_SIZE0_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_DATA_SIZE0_RESERVED_0__SHIFT) & CNA_DATA_SIZE0_RESERVED_0__MASK;
> +}
> +#define CNA_DATA_SIZE0_DATAIN_WIDTH__MASK			0x07ff0000
> +#define CNA_DATA_SIZE0_DATAIN_WIDTH__SHIFT			16
> +static inline uint32_t CNA_DATA_SIZE0_DATAIN_WIDTH(uint32_t val)
> +{
> +	return ((val) << CNA_DATA_SIZE0_DATAIN_WIDTH__SHIFT) & CNA_DATA_SIZE0_DATAIN_WIDTH__MASK;
> +}
> +#define CNA_DATA_SIZE0_RESERVED_1__MASK				0x0000f800
> +#define CNA_DATA_SIZE0_RESERVED_1__SHIFT			11
> +static inline uint32_t CNA_DATA_SIZE0_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << CNA_DATA_SIZE0_RESERVED_1__SHIFT) & CNA_DATA_SIZE0_RESERVED_1__MASK;
> +}
> +#define CNA_DATA_SIZE0_DATAIN_HEIGHT__MASK			0x000007ff
> +#define CNA_DATA_SIZE0_DATAIN_HEIGHT__SHIFT			0
> +static inline uint32_t CNA_DATA_SIZE0_DATAIN_HEIGHT(uint32_t val)
> +{
> +	return ((val) << CNA_DATA_SIZE0_DATAIN_HEIGHT__SHIFT) & CNA_DATA_SIZE0_DATAIN_HEIGHT__MASK;
> +}
> +
> +#define REG_CNA_DATA_SIZE1					0x00001024
> +#define CNA_DATA_SIZE1_RESERVED_0__MASK				0xc0000000
> +#define CNA_DATA_SIZE1_RESERVED_0__SHIFT			30
> +static inline uint32_t CNA_DATA_SIZE1_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_DATA_SIZE1_RESERVED_0__SHIFT) & CNA_DATA_SIZE1_RESERVED_0__MASK;
> +}
> +#define CNA_DATA_SIZE1_DATAIN_CHANNEL_REAL__MASK		0x3fff0000
> +#define CNA_DATA_SIZE1_DATAIN_CHANNEL_REAL__SHIFT		16
> +static inline uint32_t CNA_DATA_SIZE1_DATAIN_CHANNEL_REAL(uint32_t val)
> +{
> +	return ((val) << CNA_DATA_SIZE1_DATAIN_CHANNEL_REAL__SHIFT) & CNA_DATA_SIZE1_DATAIN_CHANNEL_REAL__MASK;
> +}
> +#define CNA_DATA_SIZE1_DATAIN_CHANNEL__MASK			0x0000ffff
> +#define CNA_DATA_SIZE1_DATAIN_CHANNEL__SHIFT			0
> +static inline uint32_t CNA_DATA_SIZE1_DATAIN_CHANNEL(uint32_t val)
> +{
> +	return ((val) << CNA_DATA_SIZE1_DATAIN_CHANNEL__SHIFT) & CNA_DATA_SIZE1_DATAIN_CHANNEL__MASK;
> +}
> +
> +#define REG_CNA_DATA_SIZE2					0x00001028
> +#define CNA_DATA_SIZE2_RESERVED_0__MASK				0xfffff800
> +#define CNA_DATA_SIZE2_RESERVED_0__SHIFT			11
> +static inline uint32_t CNA_DATA_SIZE2_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_DATA_SIZE2_RESERVED_0__SHIFT) & CNA_DATA_SIZE2_RESERVED_0__MASK;
> +}
> +#define CNA_DATA_SIZE2_DATAOUT_WIDTH__MASK			0x000007ff
> +#define CNA_DATA_SIZE2_DATAOUT_WIDTH__SHIFT			0
> +static inline uint32_t CNA_DATA_SIZE2_DATAOUT_WIDTH(uint32_t val)
> +{
> +	return ((val) << CNA_DATA_SIZE2_DATAOUT_WIDTH__SHIFT) & CNA_DATA_SIZE2_DATAOUT_WIDTH__MASK;
> +}
> +
> +#define REG_CNA_DATA_SIZE3					0x0000102c
> +#define CNA_DATA_SIZE3_RESERVED_0__MASK				0xff000000
> +#define CNA_DATA_SIZE3_RESERVED_0__SHIFT			24
> +static inline uint32_t CNA_DATA_SIZE3_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_DATA_SIZE3_RESERVED_0__SHIFT) & CNA_DATA_SIZE3_RESERVED_0__MASK;
> +}
> +#define CNA_DATA_SIZE3_SURF_MODE__MASK				0x00c00000
> +#define CNA_DATA_SIZE3_SURF_MODE__SHIFT				22
> +static inline uint32_t CNA_DATA_SIZE3_SURF_MODE(uint32_t val)
> +{
> +	return ((val) << CNA_DATA_SIZE3_SURF_MODE__SHIFT) & CNA_DATA_SIZE3_SURF_MODE__MASK;
> +}
> +#define CNA_DATA_SIZE3_DATAOUT_ATOMICS__MASK			0x003fffff
> +#define CNA_DATA_SIZE3_DATAOUT_ATOMICS__SHIFT			0
> +static inline uint32_t CNA_DATA_SIZE3_DATAOUT_ATOMICS(uint32_t val)
> +{
> +	return ((val) << CNA_DATA_SIZE3_DATAOUT_ATOMICS__SHIFT) & CNA_DATA_SIZE3_DATAOUT_ATOMICS__MASK;
> +}
> +
> +#define REG_CNA_WEIGHT_SIZE0					0x00001030
> +#define CNA_WEIGHT_SIZE0_WEIGHT_BYTES__MASK			0xffffffff
> +#define CNA_WEIGHT_SIZE0_WEIGHT_BYTES__SHIFT			0
> +static inline uint32_t CNA_WEIGHT_SIZE0_WEIGHT_BYTES(uint32_t val)
> +{
> +	return ((val) << CNA_WEIGHT_SIZE0_WEIGHT_BYTES__SHIFT) & CNA_WEIGHT_SIZE0_WEIGHT_BYTES__MASK;
> +}
> +
> +#define REG_CNA_WEIGHT_SIZE1					0x00001034
> +#define CNA_WEIGHT_SIZE1_RESERVED_0__MASK			0xfff80000
> +#define CNA_WEIGHT_SIZE1_RESERVED_0__SHIFT			19
> +static inline uint32_t CNA_WEIGHT_SIZE1_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_WEIGHT_SIZE1_RESERVED_0__SHIFT) & CNA_WEIGHT_SIZE1_RESERVED_0__MASK;
> +}
> +#define CNA_WEIGHT_SIZE1_WEIGHT_BYTES_PER_KERNEL__MASK		0x0007ffff
> +#define CNA_WEIGHT_SIZE1_WEIGHT_BYTES_PER_KERNEL__SHIFT		0
> +static inline uint32_t CNA_WEIGHT_SIZE1_WEIGHT_BYTES_PER_KERNEL(uint32_t val)
> +{
> +	return ((val) << CNA_WEIGHT_SIZE1_WEIGHT_BYTES_PER_KERNEL__SHIFT) & CNA_WEIGHT_SIZE1_WEIGHT_BYTES_PER_KERNEL__MASK;
> +}
> +
> +#define REG_CNA_WEIGHT_SIZE2					0x00001038
> +#define CNA_WEIGHT_SIZE2_RESERVED_0__MASK			0xe0000000
> +#define CNA_WEIGHT_SIZE2_RESERVED_0__SHIFT			29
> +static inline uint32_t CNA_WEIGHT_SIZE2_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_WEIGHT_SIZE2_RESERVED_0__SHIFT) & CNA_WEIGHT_SIZE2_RESERVED_0__MASK;
> +}
> +#define CNA_WEIGHT_SIZE2_WEIGHT_WIDTH__MASK			0x1f000000
> +#define CNA_WEIGHT_SIZE2_WEIGHT_WIDTH__SHIFT			24
> +static inline uint32_t CNA_WEIGHT_SIZE2_WEIGHT_WIDTH(uint32_t val)
> +{
> +	return ((val) << CNA_WEIGHT_SIZE2_WEIGHT_WIDTH__SHIFT) & CNA_WEIGHT_SIZE2_WEIGHT_WIDTH__MASK;
> +}
> +#define CNA_WEIGHT_SIZE2_RESERVED_1__MASK			0x00e00000
> +#define CNA_WEIGHT_SIZE2_RESERVED_1__SHIFT			21
> +static inline uint32_t CNA_WEIGHT_SIZE2_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << CNA_WEIGHT_SIZE2_RESERVED_1__SHIFT) & CNA_WEIGHT_SIZE2_RESERVED_1__MASK;
> +}
> +#define CNA_WEIGHT_SIZE2_WEIGHT_HEIGHT__MASK			0x001f0000
> +#define CNA_WEIGHT_SIZE2_WEIGHT_HEIGHT__SHIFT			16
> +static inline uint32_t CNA_WEIGHT_SIZE2_WEIGHT_HEIGHT(uint32_t val)
> +{
> +	return ((val) << CNA_WEIGHT_SIZE2_WEIGHT_HEIGHT__SHIFT) & CNA_WEIGHT_SIZE2_WEIGHT_HEIGHT__MASK;
> +}
> +#define CNA_WEIGHT_SIZE2_RESERVED_2__MASK			0x0000c000
> +#define CNA_WEIGHT_SIZE2_RESERVED_2__SHIFT			14
> +static inline uint32_t CNA_WEIGHT_SIZE2_RESERVED_2(uint32_t val)
> +{
> +	return ((val) << CNA_WEIGHT_SIZE2_RESERVED_2__SHIFT) & CNA_WEIGHT_SIZE2_RESERVED_2__MASK;
> +}
> +#define CNA_WEIGHT_SIZE2_WEIGHT_KERNELS__MASK			0x00003fff
> +#define CNA_WEIGHT_SIZE2_WEIGHT_KERNELS__SHIFT			0
> +static inline uint32_t CNA_WEIGHT_SIZE2_WEIGHT_KERNELS(uint32_t val)
> +{
> +	return ((val) << CNA_WEIGHT_SIZE2_WEIGHT_KERNELS__SHIFT) & CNA_WEIGHT_SIZE2_WEIGHT_KERNELS__MASK;
> +}
> +
> +#define REG_CNA_CBUF_CON0					0x00001040
> +#define CNA_CBUF_CON0_RESERVED_0__MASK				0xffffc000
> +#define CNA_CBUF_CON0_RESERVED_0__SHIFT				14
> +static inline uint32_t CNA_CBUF_CON0_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_CBUF_CON0_RESERVED_0__SHIFT) & CNA_CBUF_CON0_RESERVED_0__MASK;
> +}
> +#define CNA_CBUF_CON0_WEIGHT_REUSE__MASK			0x00002000
> +#define CNA_CBUF_CON0_WEIGHT_REUSE__SHIFT			13
> +static inline uint32_t CNA_CBUF_CON0_WEIGHT_REUSE(uint32_t val)
> +{
> +	return ((val) << CNA_CBUF_CON0_WEIGHT_REUSE__SHIFT) & CNA_CBUF_CON0_WEIGHT_REUSE__MASK;
> +}
> +#define CNA_CBUF_CON0_DATA_REUSE__MASK				0x00001000
> +#define CNA_CBUF_CON0_DATA_REUSE__SHIFT				12
> +static inline uint32_t CNA_CBUF_CON0_DATA_REUSE(uint32_t val)
> +{
> +	return ((val) << CNA_CBUF_CON0_DATA_REUSE__SHIFT) & CNA_CBUF_CON0_DATA_REUSE__MASK;
> +}
> +#define CNA_CBUF_CON0_RESERVED_1__MASK				0x00000800
> +#define CNA_CBUF_CON0_RESERVED_1__SHIFT				11
> +static inline uint32_t CNA_CBUF_CON0_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << CNA_CBUF_CON0_RESERVED_1__SHIFT) & CNA_CBUF_CON0_RESERVED_1__MASK;
> +}
> +#define CNA_CBUF_CON0_FC_DATA_BANK__MASK			0x00000700
> +#define CNA_CBUF_CON0_FC_DATA_BANK__SHIFT			8
> +static inline uint32_t CNA_CBUF_CON0_FC_DATA_BANK(uint32_t val)
> +{
> +	return ((val) << CNA_CBUF_CON0_FC_DATA_BANK__SHIFT) & CNA_CBUF_CON0_FC_DATA_BANK__MASK;
> +}
> +#define CNA_CBUF_CON0_WEIGHT_BANK__MASK				0x000000f0
> +#define CNA_CBUF_CON0_WEIGHT_BANK__SHIFT			4
> +static inline uint32_t CNA_CBUF_CON0_WEIGHT_BANK(uint32_t val)
> +{
> +	return ((val) << CNA_CBUF_CON0_WEIGHT_BANK__SHIFT) & CNA_CBUF_CON0_WEIGHT_BANK__MASK;
> +}
> +#define CNA_CBUF_CON0_DATA_BANK__MASK				0x0000000f
> +#define CNA_CBUF_CON0_DATA_BANK__SHIFT				0
> +static inline uint32_t CNA_CBUF_CON0_DATA_BANK(uint32_t val)
> +{
> +	return ((val) << CNA_CBUF_CON0_DATA_BANK__SHIFT) & CNA_CBUF_CON0_DATA_BANK__MASK;
> +}
> +
> +#define REG_CNA_CBUF_CON1					0x00001044
> +#define CNA_CBUF_CON1_RESERVED_0__MASK				0xffffc000
> +#define CNA_CBUF_CON1_RESERVED_0__SHIFT				14
> +static inline uint32_t CNA_CBUF_CON1_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_CBUF_CON1_RESERVED_0__SHIFT) & CNA_CBUF_CON1_RESERVED_0__MASK;
> +}
> +#define CNA_CBUF_CON1_DATA_ENTRIES__MASK			0x00003fff
> +#define CNA_CBUF_CON1_DATA_ENTRIES__SHIFT			0
> +static inline uint32_t CNA_CBUF_CON1_DATA_ENTRIES(uint32_t val)
> +{
> +	return ((val) << CNA_CBUF_CON1_DATA_ENTRIES__SHIFT) & CNA_CBUF_CON1_DATA_ENTRIES__MASK;
> +}
> +
> +#define REG_CNA_CVT_CON0					0x0000104c
> +#define CNA_CVT_CON0_RESERVED_0__MASK				0xf0000000
> +#define CNA_CVT_CON0_RESERVED_0__SHIFT				28
> +static inline uint32_t CNA_CVT_CON0_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON0_RESERVED_0__SHIFT) & CNA_CVT_CON0_RESERVED_0__MASK;
> +}
> +#define CNA_CVT_CON0_CVT_TRUNCATE_3__MASK			0x0fc00000
> +#define CNA_CVT_CON0_CVT_TRUNCATE_3__SHIFT			22
> +static inline uint32_t CNA_CVT_CON0_CVT_TRUNCATE_3(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON0_CVT_TRUNCATE_3__SHIFT) & CNA_CVT_CON0_CVT_TRUNCATE_3__MASK;
> +}
> +#define CNA_CVT_CON0_CVT_TRUNCATE_2__MASK			0x003f0000
> +#define CNA_CVT_CON0_CVT_TRUNCATE_2__SHIFT			16
> +static inline uint32_t CNA_CVT_CON0_CVT_TRUNCATE_2(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON0_CVT_TRUNCATE_2__SHIFT) & CNA_CVT_CON0_CVT_TRUNCATE_2__MASK;
> +}
> +#define CNA_CVT_CON0_CVT_TRUNCATE_1__MASK			0x0000fc00
> +#define CNA_CVT_CON0_CVT_TRUNCATE_1__SHIFT			10
> +static inline uint32_t CNA_CVT_CON0_CVT_TRUNCATE_1(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON0_CVT_TRUNCATE_1__SHIFT) & CNA_CVT_CON0_CVT_TRUNCATE_1__MASK;
> +}
> +#define CNA_CVT_CON0_CVT_TRUNCATE_0__MASK			0x000003f0
> +#define CNA_CVT_CON0_CVT_TRUNCATE_0__SHIFT			4
> +static inline uint32_t CNA_CVT_CON0_CVT_TRUNCATE_0(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON0_CVT_TRUNCATE_0__SHIFT) & CNA_CVT_CON0_CVT_TRUNCATE_0__MASK;
> +}
> +#define CNA_CVT_CON0_DATA_SIGN__MASK				0x00000008
> +#define CNA_CVT_CON0_DATA_SIGN__SHIFT				3
> +static inline uint32_t CNA_CVT_CON0_DATA_SIGN(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON0_DATA_SIGN__SHIFT) & CNA_CVT_CON0_DATA_SIGN__MASK;
> +}
> +#define CNA_CVT_CON0_ROUND_TYPE__MASK				0x00000004
> +#define CNA_CVT_CON0_ROUND_TYPE__SHIFT				2
> +static inline uint32_t CNA_CVT_CON0_ROUND_TYPE(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON0_ROUND_TYPE__SHIFT) & CNA_CVT_CON0_ROUND_TYPE__MASK;
> +}
> +#define CNA_CVT_CON0_CVT_TYPE__MASK				0x00000002
> +#define CNA_CVT_CON0_CVT_TYPE__SHIFT				1
> +static inline uint32_t CNA_CVT_CON0_CVT_TYPE(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON0_CVT_TYPE__SHIFT) & CNA_CVT_CON0_CVT_TYPE__MASK;
> +}
> +#define CNA_CVT_CON0_CVT_BYPASS__MASK				0x00000001
> +#define CNA_CVT_CON0_CVT_BYPASS__SHIFT				0
> +static inline uint32_t CNA_CVT_CON0_CVT_BYPASS(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON0_CVT_BYPASS__SHIFT) & CNA_CVT_CON0_CVT_BYPASS__MASK;
> +}
> +
> +#define REG_CNA_CVT_CON1					0x00001050
> +#define CNA_CVT_CON1_CVT_SCALE0__MASK				0xffff0000
> +#define CNA_CVT_CON1_CVT_SCALE0__SHIFT				16
> +static inline uint32_t CNA_CVT_CON1_CVT_SCALE0(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON1_CVT_SCALE0__SHIFT) & CNA_CVT_CON1_CVT_SCALE0__MASK;
> +}
> +#define CNA_CVT_CON1_CVT_OFFSET0__MASK				0x0000ffff
> +#define CNA_CVT_CON1_CVT_OFFSET0__SHIFT				0
> +static inline uint32_t CNA_CVT_CON1_CVT_OFFSET0(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON1_CVT_OFFSET0__SHIFT) & CNA_CVT_CON1_CVT_OFFSET0__MASK;
> +}
> +
> +#define REG_CNA_CVT_CON2					0x00001054
> +#define CNA_CVT_CON2_CVT_SCALE1__MASK				0xffff0000
> +#define CNA_CVT_CON2_CVT_SCALE1__SHIFT				16
> +static inline uint32_t CNA_CVT_CON2_CVT_SCALE1(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON2_CVT_SCALE1__SHIFT) & CNA_CVT_CON2_CVT_SCALE1__MASK;
> +}
> +#define CNA_CVT_CON2_CVT_OFFSET1__MASK				0x0000ffff
> +#define CNA_CVT_CON2_CVT_OFFSET1__SHIFT				0
> +static inline uint32_t CNA_CVT_CON2_CVT_OFFSET1(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON2_CVT_OFFSET1__SHIFT) & CNA_CVT_CON2_CVT_OFFSET1__MASK;
> +}
> +
> +#define REG_CNA_CVT_CON3					0x00001058
> +#define CNA_CVT_CON3_CVT_SCALE2__MASK				0xffff0000
> +#define CNA_CVT_CON3_CVT_SCALE2__SHIFT				16
> +static inline uint32_t CNA_CVT_CON3_CVT_SCALE2(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON3_CVT_SCALE2__SHIFT) & CNA_CVT_CON3_CVT_SCALE2__MASK;
> +}
> +#define CNA_CVT_CON3_CVT_OFFSET2__MASK				0x0000ffff
> +#define CNA_CVT_CON3_CVT_OFFSET2__SHIFT				0
> +static inline uint32_t CNA_CVT_CON3_CVT_OFFSET2(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON3_CVT_OFFSET2__SHIFT) & CNA_CVT_CON3_CVT_OFFSET2__MASK;
> +}
> +
> +#define REG_CNA_CVT_CON4					0x0000105c
> +#define CNA_CVT_CON4_CVT_SCALE3__MASK				0xffff0000
> +#define CNA_CVT_CON4_CVT_SCALE3__SHIFT				16
> +static inline uint32_t CNA_CVT_CON4_CVT_SCALE3(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON4_CVT_SCALE3__SHIFT) & CNA_CVT_CON4_CVT_SCALE3__MASK;
> +}
> +#define CNA_CVT_CON4_CVT_OFFSET3__MASK				0x0000ffff
> +#define CNA_CVT_CON4_CVT_OFFSET3__SHIFT				0
> +static inline uint32_t CNA_CVT_CON4_CVT_OFFSET3(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON4_CVT_OFFSET3__SHIFT) & CNA_CVT_CON4_CVT_OFFSET3__MASK;
> +}
> +
> +#define REG_CNA_FC_CON0						0x00001060
> +#define CNA_FC_CON0_FC_SKIP_DATA__MASK				0xffff0000
> +#define CNA_FC_CON0_FC_SKIP_DATA__SHIFT				16
> +static inline uint32_t CNA_FC_CON0_FC_SKIP_DATA(uint32_t val)
> +{
> +	return ((val) << CNA_FC_CON0_FC_SKIP_DATA__SHIFT) & CNA_FC_CON0_FC_SKIP_DATA__MASK;
> +}
> +#define CNA_FC_CON0_RESERVED_0__MASK				0x0000fffe
> +#define CNA_FC_CON0_RESERVED_0__SHIFT				1
> +static inline uint32_t CNA_FC_CON0_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_FC_CON0_RESERVED_0__SHIFT) & CNA_FC_CON0_RESERVED_0__MASK;
> +}
> +#define CNA_FC_CON0_FC_SKIP_EN__MASK				0x00000001
> +#define CNA_FC_CON0_FC_SKIP_EN__SHIFT				0
> +static inline uint32_t CNA_FC_CON0_FC_SKIP_EN(uint32_t val)
> +{
> +	return ((val) << CNA_FC_CON0_FC_SKIP_EN__SHIFT) & CNA_FC_CON0_FC_SKIP_EN__MASK;
> +}
> +
> +#define REG_CNA_FC_CON1						0x00001064
> +#define CNA_FC_CON1_RESERVED_0__MASK				0xfffe0000
> +#define CNA_FC_CON1_RESERVED_0__SHIFT				17
> +static inline uint32_t CNA_FC_CON1_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_FC_CON1_RESERVED_0__SHIFT) & CNA_FC_CON1_RESERVED_0__MASK;
> +}
> +#define CNA_FC_CON1_DATA_OFFSET__MASK				0x0001ffff
> +#define CNA_FC_CON1_DATA_OFFSET__SHIFT				0
> +static inline uint32_t CNA_FC_CON1_DATA_OFFSET(uint32_t val)
> +{
> +	return ((val) << CNA_FC_CON1_DATA_OFFSET__SHIFT) & CNA_FC_CON1_DATA_OFFSET__MASK;
> +}
> +
> +#define REG_CNA_PAD_CON0					0x00001068
> +#define CNA_PAD_CON0_RESERVED_0__MASK				0xffffff00
> +#define CNA_PAD_CON0_RESERVED_0__SHIFT				8
> +static inline uint32_t CNA_PAD_CON0_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_PAD_CON0_RESERVED_0__SHIFT) & CNA_PAD_CON0_RESERVED_0__MASK;
> +}
> +#define CNA_PAD_CON0_PAD_LEFT__MASK				0x000000f0
> +#define CNA_PAD_CON0_PAD_LEFT__SHIFT				4
> +static inline uint32_t CNA_PAD_CON0_PAD_LEFT(uint32_t val)
> +{
> +	return ((val) << CNA_PAD_CON0_PAD_LEFT__SHIFT) & CNA_PAD_CON0_PAD_LEFT__MASK;
> +}
> +#define CNA_PAD_CON0_PAD_TOP__MASK				0x0000000f
> +#define CNA_PAD_CON0_PAD_TOP__SHIFT				0
> +static inline uint32_t CNA_PAD_CON0_PAD_TOP(uint32_t val)
> +{
> +	return ((val) << CNA_PAD_CON0_PAD_TOP__SHIFT) & CNA_PAD_CON0_PAD_TOP__MASK;
> +}
> +
> +#define REG_CNA_FEATURE_DATA_ADDR				0x00001070
> +#define CNA_FEATURE_DATA_ADDR_FEATURE_BASE_ADDR__MASK		0xffffffff
> +#define CNA_FEATURE_DATA_ADDR_FEATURE_BASE_ADDR__SHIFT		0
> +static inline uint32_t CNA_FEATURE_DATA_ADDR_FEATURE_BASE_ADDR(uint32_t val)
> +{
> +	return ((val) << CNA_FEATURE_DATA_ADDR_FEATURE_BASE_ADDR__SHIFT) & CNA_FEATURE_DATA_ADDR_FEATURE_BASE_ADDR__MASK;
> +}
> +
> +#define REG_CNA_FC_CON2						0x00001074
> +#define CNA_FC_CON2_RESERVED_0__MASK				0xfffe0000
> +#define CNA_FC_CON2_RESERVED_0__SHIFT				17
> +static inline uint32_t CNA_FC_CON2_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_FC_CON2_RESERVED_0__SHIFT) & CNA_FC_CON2_RESERVED_0__MASK;
> +}
> +#define CNA_FC_CON2_WEIGHT_OFFSET__MASK				0x0001ffff
> +#define CNA_FC_CON2_WEIGHT_OFFSET__SHIFT			0
> +static inline uint32_t CNA_FC_CON2_WEIGHT_OFFSET(uint32_t val)
> +{
> +	return ((val) << CNA_FC_CON2_WEIGHT_OFFSET__SHIFT) & CNA_FC_CON2_WEIGHT_OFFSET__MASK;
> +}
> +
> +#define REG_CNA_DMA_CON0					0x00001078
> +#define CNA_DMA_CON0_OV4K_BYPASS__MASK				0x80000000
> +#define CNA_DMA_CON0_OV4K_BYPASS__SHIFT				31
> +static inline uint32_t CNA_DMA_CON0_OV4K_BYPASS(uint32_t val)
> +{
> +	return ((val) << CNA_DMA_CON0_OV4K_BYPASS__SHIFT) & CNA_DMA_CON0_OV4K_BYPASS__MASK;
> +}
> +#define CNA_DMA_CON0_RESERVED_0__MASK				0x7ff00000
> +#define CNA_DMA_CON0_RESERVED_0__SHIFT				20
> +static inline uint32_t CNA_DMA_CON0_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_DMA_CON0_RESERVED_0__SHIFT) & CNA_DMA_CON0_RESERVED_0__MASK;
> +}
> +#define CNA_DMA_CON0_WEIGHT_BURST_LEN__MASK			0x000f0000
> +#define CNA_DMA_CON0_WEIGHT_BURST_LEN__SHIFT			16
> +static inline uint32_t CNA_DMA_CON0_WEIGHT_BURST_LEN(uint32_t val)
> +{
> +	return ((val) << CNA_DMA_CON0_WEIGHT_BURST_LEN__SHIFT) & CNA_DMA_CON0_WEIGHT_BURST_LEN__MASK;
> +}
> +#define CNA_DMA_CON0_RESERVED_1__MASK				0x0000fff0
> +#define CNA_DMA_CON0_RESERVED_1__SHIFT				4
> +static inline uint32_t CNA_DMA_CON0_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << CNA_DMA_CON0_RESERVED_1__SHIFT) & CNA_DMA_CON0_RESERVED_1__MASK;
> +}
> +#define CNA_DMA_CON0_DATA_BURST_LEN__MASK			0x0000000f
> +#define CNA_DMA_CON0_DATA_BURST_LEN__SHIFT			0
> +static inline uint32_t CNA_DMA_CON0_DATA_BURST_LEN(uint32_t val)
> +{
> +	return ((val) << CNA_DMA_CON0_DATA_BURST_LEN__SHIFT) & CNA_DMA_CON0_DATA_BURST_LEN__MASK;
> +}
> +
> +#define REG_CNA_DMA_CON1					0x0000107c
> +#define CNA_DMA_CON1_RESERVED_0__MASK				0xf0000000
> +#define CNA_DMA_CON1_RESERVED_0__SHIFT				28
> +static inline uint32_t CNA_DMA_CON1_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_DMA_CON1_RESERVED_0__SHIFT) & CNA_DMA_CON1_RESERVED_0__MASK;
> +}
> +#define CNA_DMA_CON1_LINE_STRIDE__MASK				0x0fffffff
> +#define CNA_DMA_CON1_LINE_STRIDE__SHIFT				0
> +static inline uint32_t CNA_DMA_CON1_LINE_STRIDE(uint32_t val)
> +{
> +	return ((val) << CNA_DMA_CON1_LINE_STRIDE__SHIFT) & CNA_DMA_CON1_LINE_STRIDE__MASK;
> +}
> +
> +#define REG_CNA_DMA_CON2					0x00001080
> +#define CNA_DMA_CON2_RESERVED_0__MASK				0xf0000000
> +#define CNA_DMA_CON2_RESERVED_0__SHIFT				28
> +static inline uint32_t CNA_DMA_CON2_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_DMA_CON2_RESERVED_0__SHIFT) & CNA_DMA_CON2_RESERVED_0__MASK;
> +}
> +#define CNA_DMA_CON2_SURF_STRIDE__MASK				0x0fffffff
> +#define CNA_DMA_CON2_SURF_STRIDE__SHIFT				0
> +static inline uint32_t CNA_DMA_CON2_SURF_STRIDE(uint32_t val)
> +{
> +	return ((val) << CNA_DMA_CON2_SURF_STRIDE__SHIFT) & CNA_DMA_CON2_SURF_STRIDE__MASK;
> +}
> +
> +#define REG_CNA_FC_DATA_SIZE0					0x00001084
> +#define CNA_FC_DATA_SIZE0_RESERVED_0__MASK			0xc0000000
> +#define CNA_FC_DATA_SIZE0_RESERVED_0__SHIFT			30
> +static inline uint32_t CNA_FC_DATA_SIZE0_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_FC_DATA_SIZE0_RESERVED_0__SHIFT) & CNA_FC_DATA_SIZE0_RESERVED_0__MASK;
> +}
> +#define CNA_FC_DATA_SIZE0_DMA_WIDTH__MASK			0x3fff0000
> +#define CNA_FC_DATA_SIZE0_DMA_WIDTH__SHIFT			16
> +static inline uint32_t CNA_FC_DATA_SIZE0_DMA_WIDTH(uint32_t val)
> +{
> +	return ((val) << CNA_FC_DATA_SIZE0_DMA_WIDTH__SHIFT) & CNA_FC_DATA_SIZE0_DMA_WIDTH__MASK;
> +}
> +#define CNA_FC_DATA_SIZE0_RESERVED_1__MASK			0x0000f800
> +#define CNA_FC_DATA_SIZE0_RESERVED_1__SHIFT			11
> +static inline uint32_t CNA_FC_DATA_SIZE0_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << CNA_FC_DATA_SIZE0_RESERVED_1__SHIFT) & CNA_FC_DATA_SIZE0_RESERVED_1__MASK;
> +}
> +#define CNA_FC_DATA_SIZE0_DMA_HEIGHT__MASK			0x000007ff
> +#define CNA_FC_DATA_SIZE0_DMA_HEIGHT__SHIFT			0
> +static inline uint32_t CNA_FC_DATA_SIZE0_DMA_HEIGHT(uint32_t val)
> +{
> +	return ((val) << CNA_FC_DATA_SIZE0_DMA_HEIGHT__SHIFT) & CNA_FC_DATA_SIZE0_DMA_HEIGHT__MASK;
> +}
> +
> +#define REG_CNA_FC_DATA_SIZE1					0x00001088
> +#define CNA_FC_DATA_SIZE1_RESERVED_0__MASK			0xffff0000
> +#define CNA_FC_DATA_SIZE1_RESERVED_0__SHIFT			16
> +static inline uint32_t CNA_FC_DATA_SIZE1_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_FC_DATA_SIZE1_RESERVED_0__SHIFT) & CNA_FC_DATA_SIZE1_RESERVED_0__MASK;
> +}
> +#define CNA_FC_DATA_SIZE1_DMA_CHANNEL__MASK			0x0000ffff
> +#define CNA_FC_DATA_SIZE1_DMA_CHANNEL__SHIFT			0
> +static inline uint32_t CNA_FC_DATA_SIZE1_DMA_CHANNEL(uint32_t val)
> +{
> +	return ((val) << CNA_FC_DATA_SIZE1_DMA_CHANNEL__SHIFT) & CNA_FC_DATA_SIZE1_DMA_CHANNEL__MASK;
> +}
> +
> +#define REG_CNA_CLK_GATE					0x00001090
> +#define CNA_CLK_GATE_RESERVED_0__MASK				0xffffffe0
> +#define CNA_CLK_GATE_RESERVED_0__SHIFT				5
> +static inline uint32_t CNA_CLK_GATE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_CLK_GATE_RESERVED_0__SHIFT) & CNA_CLK_GATE_RESERVED_0__MASK;
> +}
> +#define CNA_CLK_GATE_CBUF_CS_DISABLE_CLKGATE__MASK		0x00000010
> +#define CNA_CLK_GATE_CBUF_CS_DISABLE_CLKGATE__SHIFT		4
> +static inline uint32_t CNA_CLK_GATE_CBUF_CS_DISABLE_CLKGATE(uint32_t val)
> +{
> +	return ((val) << CNA_CLK_GATE_CBUF_CS_DISABLE_CLKGATE__SHIFT) & CNA_CLK_GATE_CBUF_CS_DISABLE_CLKGATE__MASK;
> +}
> +#define CNA_CLK_GATE_RESERVED_1__MASK				0x00000008
> +#define CNA_CLK_GATE_RESERVED_1__SHIFT				3
> +static inline uint32_t CNA_CLK_GATE_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << CNA_CLK_GATE_RESERVED_1__SHIFT) & CNA_CLK_GATE_RESERVED_1__MASK;
> +}
> +#define CNA_CLK_GATE_CSC_DISABLE_CLKGATE__MASK			0x00000004
> +#define CNA_CLK_GATE_CSC_DISABLE_CLKGATE__SHIFT			2
> +static inline uint32_t CNA_CLK_GATE_CSC_DISABLE_CLKGATE(uint32_t val)
> +{
> +	return ((val) << CNA_CLK_GATE_CSC_DISABLE_CLKGATE__SHIFT) & CNA_CLK_GATE_CSC_DISABLE_CLKGATE__MASK;
> +}
> +#define CNA_CLK_GATE_CNA_WEIGHT_DISABLE_CLKGATE__MASK		0x00000002
> +#define CNA_CLK_GATE_CNA_WEIGHT_DISABLE_CLKGATE__SHIFT		1
> +static inline uint32_t CNA_CLK_GATE_CNA_WEIGHT_DISABLE_CLKGATE(uint32_t val)
> +{
> +	return ((val) << CNA_CLK_GATE_CNA_WEIGHT_DISABLE_CLKGATE__SHIFT) & CNA_CLK_GATE_CNA_WEIGHT_DISABLE_CLKGATE__MASK;
> +}
> +#define CNA_CLK_GATE_CNA_FEATURE_DISABLE_CLKGATE__MASK		0x00000001
> +#define CNA_CLK_GATE_CNA_FEATURE_DISABLE_CLKGATE__SHIFT		0
> +static inline uint32_t CNA_CLK_GATE_CNA_FEATURE_DISABLE_CLKGATE(uint32_t val)
> +{
> +	return ((val) << CNA_CLK_GATE_CNA_FEATURE_DISABLE_CLKGATE__SHIFT) & CNA_CLK_GATE_CNA_FEATURE_DISABLE_CLKGATE__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_CTRL					0x00001100
> +#define CNA_DCOMP_CTRL_RESERVED_0__MASK				0xfffffff0
> +#define CNA_DCOMP_CTRL_RESERVED_0__SHIFT			4
> +static inline uint32_t CNA_DCOMP_CTRL_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_CTRL_RESERVED_0__SHIFT) & CNA_DCOMP_CTRL_RESERVED_0__MASK;
> +}
> +#define CNA_DCOMP_CTRL_WT_DEC_BYPASS__MASK			0x00000008
> +#define CNA_DCOMP_CTRL_WT_DEC_BYPASS__SHIFT			3
> +static inline uint32_t CNA_DCOMP_CTRL_WT_DEC_BYPASS(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_CTRL_WT_DEC_BYPASS__SHIFT) & CNA_DCOMP_CTRL_WT_DEC_BYPASS__MASK;
> +}
> +#define CNA_DCOMP_CTRL_DECOMP_CONTROL__MASK			0x00000007
> +#define CNA_DCOMP_CTRL_DECOMP_CONTROL__SHIFT			0
> +static inline uint32_t CNA_DCOMP_CTRL_DECOMP_CONTROL(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_CTRL_DECOMP_CONTROL__SHIFT) & CNA_DCOMP_CTRL_DECOMP_CONTROL__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_REGNUM					0x00001104
> +#define CNA_DCOMP_REGNUM_DCOMP_REGNUM__MASK			0xffffffff
> +#define CNA_DCOMP_REGNUM_DCOMP_REGNUM__SHIFT			0
> +static inline uint32_t CNA_DCOMP_REGNUM_DCOMP_REGNUM(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_REGNUM_DCOMP_REGNUM__SHIFT) & CNA_DCOMP_REGNUM_DCOMP_REGNUM__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_ADDR0					0x00001110
> +#define CNA_DCOMP_ADDR0_DECOMPRESS_ADDR0__MASK			0xffffffff
> +#define CNA_DCOMP_ADDR0_DECOMPRESS_ADDR0__SHIFT			0
> +static inline uint32_t CNA_DCOMP_ADDR0_DECOMPRESS_ADDR0(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_ADDR0_DECOMPRESS_ADDR0__SHIFT) & CNA_DCOMP_ADDR0_DECOMPRESS_ADDR0__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT0					0x00001140
> +#define CNA_DCOMP_AMOUNT0_DCOMP_AMOUNT0__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT0_DCOMP_AMOUNT0__SHIFT			0
> +static inline uint32_t CNA_DCOMP_AMOUNT0_DCOMP_AMOUNT0(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT0_DCOMP_AMOUNT0__SHIFT) & CNA_DCOMP_AMOUNT0_DCOMP_AMOUNT0__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT1					0x00001144
> +#define CNA_DCOMP_AMOUNT1_DCOMP_AMOUNT1__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT1_DCOMP_AMOUNT1__SHIFT			0
> +static inline uint32_t CNA_DCOMP_AMOUNT1_DCOMP_AMOUNT1(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT1_DCOMP_AMOUNT1__SHIFT) & CNA_DCOMP_AMOUNT1_DCOMP_AMOUNT1__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT2					0x00001148
> +#define CNA_DCOMP_AMOUNT2_DCOMP_AMOUNT2__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT2_DCOMP_AMOUNT2__SHIFT			0
> +static inline uint32_t CNA_DCOMP_AMOUNT2_DCOMP_AMOUNT2(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT2_DCOMP_AMOUNT2__SHIFT) & CNA_DCOMP_AMOUNT2_DCOMP_AMOUNT2__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT3					0x0000114c
> +#define CNA_DCOMP_AMOUNT3_DCOMP_AMOUNT3__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT3_DCOMP_AMOUNT3__SHIFT			0
> +static inline uint32_t CNA_DCOMP_AMOUNT3_DCOMP_AMOUNT3(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT3_DCOMP_AMOUNT3__SHIFT) & CNA_DCOMP_AMOUNT3_DCOMP_AMOUNT3__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT4					0x00001150
> +#define CNA_DCOMP_AMOUNT4_DCOMP_AMOUNT4__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT4_DCOMP_AMOUNT4__SHIFT			0
> +static inline uint32_t CNA_DCOMP_AMOUNT4_DCOMP_AMOUNT4(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT4_DCOMP_AMOUNT4__SHIFT) & CNA_DCOMP_AMOUNT4_DCOMP_AMOUNT4__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT5					0x00001154
> +#define CNA_DCOMP_AMOUNT5_DCOMP_AMOUNT5__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT5_DCOMP_AMOUNT5__SHIFT			0
> +static inline uint32_t CNA_DCOMP_AMOUNT5_DCOMP_AMOUNT5(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT5_DCOMP_AMOUNT5__SHIFT) & CNA_DCOMP_AMOUNT5_DCOMP_AMOUNT5__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT6					0x00001158
> +#define CNA_DCOMP_AMOUNT6_DCOMP_AMOUNT6__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT6_DCOMP_AMOUNT6__SHIFT			0
> +static inline uint32_t CNA_DCOMP_AMOUNT6_DCOMP_AMOUNT6(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT6_DCOMP_AMOUNT6__SHIFT) & CNA_DCOMP_AMOUNT6_DCOMP_AMOUNT6__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT7					0x0000115c
> +#define CNA_DCOMP_AMOUNT7_DCOMP_AMOUNT7__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT7_DCOMP_AMOUNT7__SHIFT			0
> +static inline uint32_t CNA_DCOMP_AMOUNT7_DCOMP_AMOUNT7(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT7_DCOMP_AMOUNT7__SHIFT) & CNA_DCOMP_AMOUNT7_DCOMP_AMOUNT7__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT8					0x00001160
> +#define CNA_DCOMP_AMOUNT8_DCOMP_AMOUNT8__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT8_DCOMP_AMOUNT8__SHIFT			0
> +static inline uint32_t CNA_DCOMP_AMOUNT8_DCOMP_AMOUNT8(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT8_DCOMP_AMOUNT8__SHIFT) & CNA_DCOMP_AMOUNT8_DCOMP_AMOUNT8__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT9					0x00001164
> +#define CNA_DCOMP_AMOUNT9_DCOMP_AMOUNT9__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT9_DCOMP_AMOUNT9__SHIFT			0
> +static inline uint32_t CNA_DCOMP_AMOUNT9_DCOMP_AMOUNT9(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT9_DCOMP_AMOUNT9__SHIFT) & CNA_DCOMP_AMOUNT9_DCOMP_AMOUNT9__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT10					0x00001168
> +#define CNA_DCOMP_AMOUNT10_DCOMP_AMOUNT10__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT10_DCOMP_AMOUNT10__SHIFT		0
> +static inline uint32_t CNA_DCOMP_AMOUNT10_DCOMP_AMOUNT10(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT10_DCOMP_AMOUNT10__SHIFT) & CNA_DCOMP_AMOUNT10_DCOMP_AMOUNT10__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT11					0x0000116c
> +#define CNA_DCOMP_AMOUNT11_DCOMP_AMOUNT11__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT11_DCOMP_AMOUNT11__SHIFT		0
> +static inline uint32_t CNA_DCOMP_AMOUNT11_DCOMP_AMOUNT11(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT11_DCOMP_AMOUNT11__SHIFT) & CNA_DCOMP_AMOUNT11_DCOMP_AMOUNT11__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT12					0x00001170
> +#define CNA_DCOMP_AMOUNT12_DCOMP_AMOUNT12__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT12_DCOMP_AMOUNT12__SHIFT		0
> +static inline uint32_t CNA_DCOMP_AMOUNT12_DCOMP_AMOUNT12(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT12_DCOMP_AMOUNT12__SHIFT) & CNA_DCOMP_AMOUNT12_DCOMP_AMOUNT12__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT13					0x00001174
> +#define CNA_DCOMP_AMOUNT13_DCOMP_AMOUNT13__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT13_DCOMP_AMOUNT13__SHIFT		0
> +static inline uint32_t CNA_DCOMP_AMOUNT13_DCOMP_AMOUNT13(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT13_DCOMP_AMOUNT13__SHIFT) & CNA_DCOMP_AMOUNT13_DCOMP_AMOUNT13__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT14					0x00001178
> +#define CNA_DCOMP_AMOUNT14_DCOMP_AMOUNT14__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT14_DCOMP_AMOUNT14__SHIFT		0
> +static inline uint32_t CNA_DCOMP_AMOUNT14_DCOMP_AMOUNT14(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT14_DCOMP_AMOUNT14__SHIFT) & CNA_DCOMP_AMOUNT14_DCOMP_AMOUNT14__MASK;
> +}
> +
> +#define REG_CNA_DCOMP_AMOUNT15					0x0000117c
> +#define CNA_DCOMP_AMOUNT15_DCOMP_AMOUNT15__MASK			0xffffffff
> +#define CNA_DCOMP_AMOUNT15_DCOMP_AMOUNT15__SHIFT		0
> +static inline uint32_t CNA_DCOMP_AMOUNT15_DCOMP_AMOUNT15(uint32_t val)
> +{
> +	return ((val) << CNA_DCOMP_AMOUNT15_DCOMP_AMOUNT15__SHIFT) & CNA_DCOMP_AMOUNT15_DCOMP_AMOUNT15__MASK;
> +}
> +
> +#define REG_CNA_CVT_CON5					0x00001180
> +#define CNA_CVT_CON5_PER_CHANNEL_CVT_EN__MASK			0xffffffff
> +#define CNA_CVT_CON5_PER_CHANNEL_CVT_EN__SHIFT			0
> +static inline uint32_t CNA_CVT_CON5_PER_CHANNEL_CVT_EN(uint32_t val)
> +{
> +	return ((val) << CNA_CVT_CON5_PER_CHANNEL_CVT_EN__SHIFT) & CNA_CVT_CON5_PER_CHANNEL_CVT_EN__MASK;
> +}
> +
> +#define REG_CNA_PAD_CON1					0x00001184
> +#define CNA_PAD_CON1_PAD_VALUE__MASK				0xffffffff
> +#define CNA_PAD_CON1_PAD_VALUE__SHIFT				0
> +static inline uint32_t CNA_PAD_CON1_PAD_VALUE(uint32_t val)
> +{
> +	return ((val) << CNA_PAD_CON1_PAD_VALUE__SHIFT) & CNA_PAD_CON1_PAD_VALUE__MASK;
> +}
> +
> +#define REG_CORE_S_STATUS					0x00003000
> +#define CORE_S_STATUS_RESERVED_0__MASK				0xfffc0000
> +#define CORE_S_STATUS_RESERVED_0__SHIFT				18
> +static inline uint32_t CORE_S_STATUS_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CORE_S_STATUS_RESERVED_0__SHIFT) & CORE_S_STATUS_RESERVED_0__MASK;
> +}
> +#define CORE_S_STATUS_STATUS_1__MASK				0x00030000
> +#define CORE_S_STATUS_STATUS_1__SHIFT				16
> +static inline uint32_t CORE_S_STATUS_STATUS_1(uint32_t val)
> +{
> +	return ((val) << CORE_S_STATUS_STATUS_1__SHIFT) & CORE_S_STATUS_STATUS_1__MASK;
> +}
> +#define CORE_S_STATUS_RESERVED_1__MASK				0x0000fffc
> +#define CORE_S_STATUS_RESERVED_1__SHIFT				2
> +static inline uint32_t CORE_S_STATUS_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << CORE_S_STATUS_RESERVED_1__SHIFT) & CORE_S_STATUS_RESERVED_1__MASK;
> +}
> +#define CORE_S_STATUS_STATUS_0__MASK				0x00000003
> +#define CORE_S_STATUS_STATUS_0__SHIFT				0
> +static inline uint32_t CORE_S_STATUS_STATUS_0(uint32_t val)
> +{
> +	return ((val) << CORE_S_STATUS_STATUS_0__SHIFT) & CORE_S_STATUS_STATUS_0__MASK;
> +}
> +
> +#define REG_CORE_S_POINTER					0x00003004
> +#define CORE_S_POINTER_RESERVED_0__MASK				0xfffe0000
> +#define CORE_S_POINTER_RESERVED_0__SHIFT			17
> +static inline uint32_t CORE_S_POINTER_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CORE_S_POINTER_RESERVED_0__SHIFT) & CORE_S_POINTER_RESERVED_0__MASK;
> +}
> +#define CORE_S_POINTER_EXECUTER__MASK				0x00010000
> +#define CORE_S_POINTER_EXECUTER__SHIFT				16
> +static inline uint32_t CORE_S_POINTER_EXECUTER(uint32_t val)
> +{
> +	return ((val) << CORE_S_POINTER_EXECUTER__SHIFT) & CORE_S_POINTER_EXECUTER__MASK;
> +}
> +#define CORE_S_POINTER_RESERVED_1__MASK				0x0000ffc0
> +#define CORE_S_POINTER_RESERVED_1__SHIFT			6
> +static inline uint32_t CORE_S_POINTER_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << CORE_S_POINTER_RESERVED_1__SHIFT) & CORE_S_POINTER_RESERVED_1__MASK;
> +}
> +#define CORE_S_POINTER_EXECUTER_PP_CLEAR__MASK			0x00000020
> +#define CORE_S_POINTER_EXECUTER_PP_CLEAR__SHIFT			5
> +static inline uint32_t CORE_S_POINTER_EXECUTER_PP_CLEAR(uint32_t val)
> +{
> +	return ((val) << CORE_S_POINTER_EXECUTER_PP_CLEAR__SHIFT) & CORE_S_POINTER_EXECUTER_PP_CLEAR__MASK;
> +}
> +#define CORE_S_POINTER_POINTER_PP_CLEAR__MASK			0x00000010
> +#define CORE_S_POINTER_POINTER_PP_CLEAR__SHIFT			4
> +static inline uint32_t CORE_S_POINTER_POINTER_PP_CLEAR(uint32_t val)
> +{
> +	return ((val) << CORE_S_POINTER_POINTER_PP_CLEAR__SHIFT) & CORE_S_POINTER_POINTER_PP_CLEAR__MASK;
> +}
> +#define CORE_S_POINTER_POINTER_PP_MODE__MASK			0x00000008
> +#define CORE_S_POINTER_POINTER_PP_MODE__SHIFT			3
> +static inline uint32_t CORE_S_POINTER_POINTER_PP_MODE(uint32_t val)
> +{
> +	return ((val) << CORE_S_POINTER_POINTER_PP_MODE__SHIFT) & CORE_S_POINTER_POINTER_PP_MODE__MASK;
> +}
> +#define CORE_S_POINTER_EXECUTER_PP_EN__MASK			0x00000004
> +#define CORE_S_POINTER_EXECUTER_PP_EN__SHIFT			2
> +static inline uint32_t CORE_S_POINTER_EXECUTER_PP_EN(uint32_t val)
> +{
> +	return ((val) << CORE_S_POINTER_EXECUTER_PP_EN__SHIFT) & CORE_S_POINTER_EXECUTER_PP_EN__MASK;
> +}
> +#define CORE_S_POINTER_POINTER_PP_EN__MASK			0x00000002
> +#define CORE_S_POINTER_POINTER_PP_EN__SHIFT			1
> +static inline uint32_t CORE_S_POINTER_POINTER_PP_EN(uint32_t val)
> +{
> +	return ((val) << CORE_S_POINTER_POINTER_PP_EN__SHIFT) & CORE_S_POINTER_POINTER_PP_EN__MASK;
> +}
> +#define CORE_S_POINTER_POINTER__MASK				0x00000001
> +#define CORE_S_POINTER_POINTER__SHIFT				0
> +static inline uint32_t CORE_S_POINTER_POINTER(uint32_t val)
> +{
> +	return ((val) << CORE_S_POINTER_POINTER__SHIFT) & CORE_S_POINTER_POINTER__MASK;
> +}
> +
> +#define REG_CORE_OPERATION_ENABLE				0x00003008
> +#define CORE_OPERATION_ENABLE_RESERVED_0__MASK			0xfffffffe
> +#define CORE_OPERATION_ENABLE_RESERVED_0__SHIFT			1
> +static inline uint32_t CORE_OPERATION_ENABLE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CORE_OPERATION_ENABLE_RESERVED_0__SHIFT) & CORE_OPERATION_ENABLE_RESERVED_0__MASK;
> +}
> +#define CORE_OPERATION_ENABLE_OP_EN__MASK			0x00000001
> +#define CORE_OPERATION_ENABLE_OP_EN__SHIFT			0
> +static inline uint32_t CORE_OPERATION_ENABLE_OP_EN(uint32_t val)
> +{
> +	return ((val) << CORE_OPERATION_ENABLE_OP_EN__SHIFT) & CORE_OPERATION_ENABLE_OP_EN__MASK;
> +}
> +
> +#define REG_CORE_MAC_GATING					0x0000300c
> +#define CORE_MAC_GATING_RESERVED_0__MASK			0xf8000000
> +#define CORE_MAC_GATING_RESERVED_0__SHIFT			27
> +static inline uint32_t CORE_MAC_GATING_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CORE_MAC_GATING_RESERVED_0__SHIFT) & CORE_MAC_GATING_RESERVED_0__MASK;
> +}
> +#define CORE_MAC_GATING_SLCG_OP_EN__MASK			0x07ffffff
> +#define CORE_MAC_GATING_SLCG_OP_EN__SHIFT			0
> +static inline uint32_t CORE_MAC_GATING_SLCG_OP_EN(uint32_t val)
> +{
> +	return ((val) << CORE_MAC_GATING_SLCG_OP_EN__SHIFT) & CORE_MAC_GATING_SLCG_OP_EN__MASK;
> +}
> +
> +#define REG_CORE_MISC_CFG					0x00003010
> +#define CORE_MISC_CFG_RESERVED_0__MASK				0xfff00000
> +#define CORE_MISC_CFG_RESERVED_0__SHIFT				20
> +static inline uint32_t CORE_MISC_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CORE_MISC_CFG_RESERVED_0__SHIFT) & CORE_MISC_CFG_RESERVED_0__MASK;
> +}
> +#define CORE_MISC_CFG_SOFT_GATING__MASK				0x000fc000
> +#define CORE_MISC_CFG_SOFT_GATING__SHIFT			14
> +static inline uint32_t CORE_MISC_CFG_SOFT_GATING(uint32_t val)
> +{
> +	return ((val) << CORE_MISC_CFG_SOFT_GATING__SHIFT) & CORE_MISC_CFG_SOFT_GATING__MASK;
> +}
> +#define CORE_MISC_CFG_RESERVED_1__MASK				0x00003800
> +#define CORE_MISC_CFG_RESERVED_1__SHIFT				11
> +static inline uint32_t CORE_MISC_CFG_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << CORE_MISC_CFG_RESERVED_1__SHIFT) & CORE_MISC_CFG_RESERVED_1__MASK;
> +}
> +#define CORE_MISC_CFG_PROC_PRECISION__MASK			0x00000700
> +#define CORE_MISC_CFG_PROC_PRECISION__SHIFT			8
> +static inline uint32_t CORE_MISC_CFG_PROC_PRECISION(uint32_t val)
> +{
> +	return ((val) << CORE_MISC_CFG_PROC_PRECISION__SHIFT) & CORE_MISC_CFG_PROC_PRECISION__MASK;
> +}
> +#define CORE_MISC_CFG_RESERVED_2__MASK				0x000000fc
> +#define CORE_MISC_CFG_RESERVED_2__SHIFT				2
> +static inline uint32_t CORE_MISC_CFG_RESERVED_2(uint32_t val)
> +{
> +	return ((val) << CORE_MISC_CFG_RESERVED_2__SHIFT) & CORE_MISC_CFG_RESERVED_2__MASK;
> +}
> +#define CORE_MISC_CFG_DW_EN__MASK				0x00000002
> +#define CORE_MISC_CFG_DW_EN__SHIFT				1
> +static inline uint32_t CORE_MISC_CFG_DW_EN(uint32_t val)
> +{
> +	return ((val) << CORE_MISC_CFG_DW_EN__SHIFT) & CORE_MISC_CFG_DW_EN__MASK;
> +}
> +#define CORE_MISC_CFG_QD_EN__MASK				0x00000001
> +#define CORE_MISC_CFG_QD_EN__SHIFT				0
> +static inline uint32_t CORE_MISC_CFG_QD_EN(uint32_t val)
> +{
> +	return ((val) << CORE_MISC_CFG_QD_EN__SHIFT) & CORE_MISC_CFG_QD_EN__MASK;
> +}
> +
> +#define REG_CORE_DATAOUT_SIZE_0					0x00003014
> +#define CORE_DATAOUT_SIZE_0_DATAOUT_HEIGHT__MASK		0xffff0000
> +#define CORE_DATAOUT_SIZE_0_DATAOUT_HEIGHT__SHIFT		16
> +static inline uint32_t CORE_DATAOUT_SIZE_0_DATAOUT_HEIGHT(uint32_t val)
> +{
> +	return ((val) << CORE_DATAOUT_SIZE_0_DATAOUT_HEIGHT__SHIFT) & CORE_DATAOUT_SIZE_0_DATAOUT_HEIGHT__MASK;
> +}
> +#define CORE_DATAOUT_SIZE_0_DATAOUT_WIDTH__MASK			0x0000ffff
> +#define CORE_DATAOUT_SIZE_0_DATAOUT_WIDTH__SHIFT		0
> +static inline uint32_t CORE_DATAOUT_SIZE_0_DATAOUT_WIDTH(uint32_t val)
> +{
> +	return ((val) << CORE_DATAOUT_SIZE_0_DATAOUT_WIDTH__SHIFT) & CORE_DATAOUT_SIZE_0_DATAOUT_WIDTH__MASK;
> +}
> +
> +#define REG_CORE_DATAOUT_SIZE_1					0x00003018
> +#define CORE_DATAOUT_SIZE_1_RESERVED_0__MASK			0xffff0000
> +#define CORE_DATAOUT_SIZE_1_RESERVED_0__SHIFT			16
> +static inline uint32_t CORE_DATAOUT_SIZE_1_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CORE_DATAOUT_SIZE_1_RESERVED_0__SHIFT) & CORE_DATAOUT_SIZE_1_RESERVED_0__MASK;
> +}
> +#define CORE_DATAOUT_SIZE_1_DATAOUT_CHANNEL__MASK		0x0000ffff
> +#define CORE_DATAOUT_SIZE_1_DATAOUT_CHANNEL__SHIFT		0
> +static inline uint32_t CORE_DATAOUT_SIZE_1_DATAOUT_CHANNEL(uint32_t val)
> +{
> +	return ((val) << CORE_DATAOUT_SIZE_1_DATAOUT_CHANNEL__SHIFT) & CORE_DATAOUT_SIZE_1_DATAOUT_CHANNEL__MASK;
> +}
> +
> +#define REG_CORE_CLIP_TRUNCATE					0x0000301c
> +#define CORE_CLIP_TRUNCATE_RESERVED_0__MASK			0xffffff80
> +#define CORE_CLIP_TRUNCATE_RESERVED_0__SHIFT			7
> +static inline uint32_t CORE_CLIP_TRUNCATE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << CORE_CLIP_TRUNCATE_RESERVED_0__SHIFT) & CORE_CLIP_TRUNCATE_RESERVED_0__MASK;
> +}
> +#define CORE_CLIP_TRUNCATE_ROUND_TYPE__MASK			0x00000040
> +#define CORE_CLIP_TRUNCATE_ROUND_TYPE__SHIFT			6
> +static inline uint32_t CORE_CLIP_TRUNCATE_ROUND_TYPE(uint32_t val)
> +{
> +	return ((val) << CORE_CLIP_TRUNCATE_ROUND_TYPE__SHIFT) & CORE_CLIP_TRUNCATE_ROUND_TYPE__MASK;
> +}
> +#define CORE_CLIP_TRUNCATE_RESERVED_1__MASK			0x00000020
> +#define CORE_CLIP_TRUNCATE_RESERVED_1__SHIFT			5
> +static inline uint32_t CORE_CLIP_TRUNCATE_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << CORE_CLIP_TRUNCATE_RESERVED_1__SHIFT) & CORE_CLIP_TRUNCATE_RESERVED_1__MASK;
> +}
> +#define CORE_CLIP_TRUNCATE_CLIP_TRUNCATE__MASK			0x0000001f
> +#define CORE_CLIP_TRUNCATE_CLIP_TRUNCATE__SHIFT			0
> +static inline uint32_t CORE_CLIP_TRUNCATE_CLIP_TRUNCATE(uint32_t val)
> +{
> +	return ((val) << CORE_CLIP_TRUNCATE_CLIP_TRUNCATE__SHIFT) & CORE_CLIP_TRUNCATE_CLIP_TRUNCATE__MASK;
> +}
> +
> +#define REG_DPU_S_STATUS					0x00004000
> +#define DPU_S_STATUS_RESERVED_0__MASK				0xfffc0000
> +#define DPU_S_STATUS_RESERVED_0__SHIFT				18
> +static inline uint32_t DPU_S_STATUS_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_S_STATUS_RESERVED_0__SHIFT) & DPU_S_STATUS_RESERVED_0__MASK;
> +}
> +#define DPU_S_STATUS_STATUS_1__MASK				0x00030000
> +#define DPU_S_STATUS_STATUS_1__SHIFT				16
> +static inline uint32_t DPU_S_STATUS_STATUS_1(uint32_t val)
> +{
> +	return ((val) << DPU_S_STATUS_STATUS_1__SHIFT) & DPU_S_STATUS_STATUS_1__MASK;
> +}
> +#define DPU_S_STATUS_RESERVED_1__MASK				0x0000fffc
> +#define DPU_S_STATUS_RESERVED_1__SHIFT				2
> +static inline uint32_t DPU_S_STATUS_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_S_STATUS_RESERVED_1__SHIFT) & DPU_S_STATUS_RESERVED_1__MASK;
> +}
> +#define DPU_S_STATUS_STATUS_0__MASK				0x00000003
> +#define DPU_S_STATUS_STATUS_0__SHIFT				0
> +static inline uint32_t DPU_S_STATUS_STATUS_0(uint32_t val)
> +{
> +	return ((val) << DPU_S_STATUS_STATUS_0__SHIFT) & DPU_S_STATUS_STATUS_0__MASK;
> +}
> +
> +#define REG_DPU_S_POINTER					0x00004004
> +#define DPU_S_POINTER_RESERVED_0__MASK				0xfffe0000
> +#define DPU_S_POINTER_RESERVED_0__SHIFT				17
> +static inline uint32_t DPU_S_POINTER_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_S_POINTER_RESERVED_0__SHIFT) & DPU_S_POINTER_RESERVED_0__MASK;
> +}
> +#define DPU_S_POINTER_EXECUTER__MASK				0x00010000
> +#define DPU_S_POINTER_EXECUTER__SHIFT				16
> +static inline uint32_t DPU_S_POINTER_EXECUTER(uint32_t val)
> +{
> +	return ((val) << DPU_S_POINTER_EXECUTER__SHIFT) & DPU_S_POINTER_EXECUTER__MASK;
> +}
> +#define DPU_S_POINTER_RESERVED_1__MASK				0x0000ffc0
> +#define DPU_S_POINTER_RESERVED_1__SHIFT				6
> +static inline uint32_t DPU_S_POINTER_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_S_POINTER_RESERVED_1__SHIFT) & DPU_S_POINTER_RESERVED_1__MASK;
> +}
> +#define DPU_S_POINTER_EXECUTER_PP_CLEAR__MASK			0x00000020
> +#define DPU_S_POINTER_EXECUTER_PP_CLEAR__SHIFT			5
> +static inline uint32_t DPU_S_POINTER_EXECUTER_PP_CLEAR(uint32_t val)
> +{
> +	return ((val) << DPU_S_POINTER_EXECUTER_PP_CLEAR__SHIFT) & DPU_S_POINTER_EXECUTER_PP_CLEAR__MASK;
> +}
> +#define DPU_S_POINTER_POINTER_PP_CLEAR__MASK			0x00000010
> +#define DPU_S_POINTER_POINTER_PP_CLEAR__SHIFT			4
> +static inline uint32_t DPU_S_POINTER_POINTER_PP_CLEAR(uint32_t val)
> +{
> +	return ((val) << DPU_S_POINTER_POINTER_PP_CLEAR__SHIFT) & DPU_S_POINTER_POINTER_PP_CLEAR__MASK;
> +}
> +#define DPU_S_POINTER_POINTER_PP_MODE__MASK			0x00000008
> +#define DPU_S_POINTER_POINTER_PP_MODE__SHIFT			3
> +static inline uint32_t DPU_S_POINTER_POINTER_PP_MODE(uint32_t val)
> +{
> +	return ((val) << DPU_S_POINTER_POINTER_PP_MODE__SHIFT) & DPU_S_POINTER_POINTER_PP_MODE__MASK;
> +}
> +#define DPU_S_POINTER_EXECUTER_PP_EN__MASK			0x00000004
> +#define DPU_S_POINTER_EXECUTER_PP_EN__SHIFT			2
> +static inline uint32_t DPU_S_POINTER_EXECUTER_PP_EN(uint32_t val)
> +{
> +	return ((val) << DPU_S_POINTER_EXECUTER_PP_EN__SHIFT) & DPU_S_POINTER_EXECUTER_PP_EN__MASK;
> +}
> +#define DPU_S_POINTER_POINTER_PP_EN__MASK			0x00000002
> +#define DPU_S_POINTER_POINTER_PP_EN__SHIFT			1
> +static inline uint32_t DPU_S_POINTER_POINTER_PP_EN(uint32_t val)
> +{
> +	return ((val) << DPU_S_POINTER_POINTER_PP_EN__SHIFT) & DPU_S_POINTER_POINTER_PP_EN__MASK;
> +}
> +#define DPU_S_POINTER_POINTER__MASK				0x00000001
> +#define DPU_S_POINTER_POINTER__SHIFT				0
> +static inline uint32_t DPU_S_POINTER_POINTER(uint32_t val)
> +{
> +	return ((val) << DPU_S_POINTER_POINTER__SHIFT) & DPU_S_POINTER_POINTER__MASK;
> +}
> +
> +#define REG_DPU_OPERATION_ENABLE				0x00004008
> +#define DPU_OPERATION_ENABLE_RESERVED_0__MASK			0xfffffffe
> +#define DPU_OPERATION_ENABLE_RESERVED_0__SHIFT			1
> +static inline uint32_t DPU_OPERATION_ENABLE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_OPERATION_ENABLE_RESERVED_0__SHIFT) & DPU_OPERATION_ENABLE_RESERVED_0__MASK;
> +}
> +#define DPU_OPERATION_ENABLE_OP_EN__MASK			0x00000001
> +#define DPU_OPERATION_ENABLE_OP_EN__SHIFT			0
> +static inline uint32_t DPU_OPERATION_ENABLE_OP_EN(uint32_t val)
> +{
> +	return ((val) << DPU_OPERATION_ENABLE_OP_EN__SHIFT) & DPU_OPERATION_ENABLE_OP_EN__MASK;
> +}
> +
> +#define REG_DPU_FEATURE_MODE_CFG				0x0000400c
> +#define DPU_FEATURE_MODE_CFG_COMB_USE__MASK			0x80000000
> +#define DPU_FEATURE_MODE_CFG_COMB_USE__SHIFT			31
> +static inline uint32_t DPU_FEATURE_MODE_CFG_COMB_USE(uint32_t val)
> +{
> +	return ((val) << DPU_FEATURE_MODE_CFG_COMB_USE__SHIFT) & DPU_FEATURE_MODE_CFG_COMB_USE__MASK;
> +}
> +#define DPU_FEATURE_MODE_CFG_TP_EN__MASK			0x40000000
> +#define DPU_FEATURE_MODE_CFG_TP_EN__SHIFT			30
> +static inline uint32_t DPU_FEATURE_MODE_CFG_TP_EN(uint32_t val)
> +{
> +	return ((val) << DPU_FEATURE_MODE_CFG_TP_EN__SHIFT) & DPU_FEATURE_MODE_CFG_TP_EN__MASK;
> +}
> +#define DPU_FEATURE_MODE_CFG_RGP_TYPE__MASK			0x3c000000
> +#define DPU_FEATURE_MODE_CFG_RGP_TYPE__SHIFT			26
> +static inline uint32_t DPU_FEATURE_MODE_CFG_RGP_TYPE(uint32_t val)
> +{
> +	return ((val) << DPU_FEATURE_MODE_CFG_RGP_TYPE__SHIFT) & DPU_FEATURE_MODE_CFG_RGP_TYPE__MASK;
> +}
> +#define DPU_FEATURE_MODE_CFG_NONALIGN__MASK			0x02000000
> +#define DPU_FEATURE_MODE_CFG_NONALIGN__SHIFT			25
> +static inline uint32_t DPU_FEATURE_MODE_CFG_NONALIGN(uint32_t val)
> +{
> +	return ((val) << DPU_FEATURE_MODE_CFG_NONALIGN__SHIFT) & DPU_FEATURE_MODE_CFG_NONALIGN__MASK;
> +}
> +#define DPU_FEATURE_MODE_CFG_SURF_LEN__MASK			0x01fffe00
> +#define DPU_FEATURE_MODE_CFG_SURF_LEN__SHIFT			9
> +static inline uint32_t DPU_FEATURE_MODE_CFG_SURF_LEN(uint32_t val)
> +{
> +	return ((val) << DPU_FEATURE_MODE_CFG_SURF_LEN__SHIFT) & DPU_FEATURE_MODE_CFG_SURF_LEN__MASK;
> +}
> +#define DPU_FEATURE_MODE_CFG_BURST_LEN__MASK			0x000001e0
> +#define DPU_FEATURE_MODE_CFG_BURST_LEN__SHIFT			5
> +static inline uint32_t DPU_FEATURE_MODE_CFG_BURST_LEN(uint32_t val)
> +{
> +	return ((val) << DPU_FEATURE_MODE_CFG_BURST_LEN__SHIFT) & DPU_FEATURE_MODE_CFG_BURST_LEN__MASK;
> +}
> +#define DPU_FEATURE_MODE_CFG_CONV_MODE__MASK			0x00000018
> +#define DPU_FEATURE_MODE_CFG_CONV_MODE__SHIFT			3
> +static inline uint32_t DPU_FEATURE_MODE_CFG_CONV_MODE(uint32_t val)
> +{
> +	return ((val) << DPU_FEATURE_MODE_CFG_CONV_MODE__SHIFT) & DPU_FEATURE_MODE_CFG_CONV_MODE__MASK;
> +}
> +#define DPU_FEATURE_MODE_CFG_OUTPUT_MODE__MASK			0x00000006
> +#define DPU_FEATURE_MODE_CFG_OUTPUT_MODE__SHIFT			1
> +static inline uint32_t DPU_FEATURE_MODE_CFG_OUTPUT_MODE(uint32_t val)
> +{
> +	return ((val) << DPU_FEATURE_MODE_CFG_OUTPUT_MODE__SHIFT) & DPU_FEATURE_MODE_CFG_OUTPUT_MODE__MASK;
> +}
> +#define DPU_FEATURE_MODE_CFG_FLYING_MODE__MASK			0x00000001
> +#define DPU_FEATURE_MODE_CFG_FLYING_MODE__SHIFT			0
> +static inline uint32_t DPU_FEATURE_MODE_CFG_FLYING_MODE(uint32_t val)
> +{
> +	return ((val) << DPU_FEATURE_MODE_CFG_FLYING_MODE__SHIFT) & DPU_FEATURE_MODE_CFG_FLYING_MODE__MASK;
> +}
> +
> +#define REG_DPU_DATA_FORMAT					0x00004010
> +#define DPU_DATA_FORMAT_OUT_PRECISION__MASK			0xe0000000
> +#define DPU_DATA_FORMAT_OUT_PRECISION__SHIFT			29
> +static inline uint32_t DPU_DATA_FORMAT_OUT_PRECISION(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_FORMAT_OUT_PRECISION__SHIFT) & DPU_DATA_FORMAT_OUT_PRECISION__MASK;
> +}
> +#define DPU_DATA_FORMAT_IN_PRECISION__MASK			0x1c000000
> +#define DPU_DATA_FORMAT_IN_PRECISION__SHIFT			26
> +static inline uint32_t DPU_DATA_FORMAT_IN_PRECISION(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_FORMAT_IN_PRECISION__SHIFT) & DPU_DATA_FORMAT_IN_PRECISION__MASK;
> +}
> +#define DPU_DATA_FORMAT_EW_TRUNCATE_NEG__MASK			0x03ff0000
> +#define DPU_DATA_FORMAT_EW_TRUNCATE_NEG__SHIFT			16
> +static inline uint32_t DPU_DATA_FORMAT_EW_TRUNCATE_NEG(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_FORMAT_EW_TRUNCATE_NEG__SHIFT) & DPU_DATA_FORMAT_EW_TRUNCATE_NEG__MASK;
> +}
> +#define DPU_DATA_FORMAT_BN_MUL_SHIFT_VALUE_NEG__MASK		0x0000fc00
> +#define DPU_DATA_FORMAT_BN_MUL_SHIFT_VALUE_NEG__SHIFT		10
> +static inline uint32_t DPU_DATA_FORMAT_BN_MUL_SHIFT_VALUE_NEG(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_FORMAT_BN_MUL_SHIFT_VALUE_NEG__SHIFT) & DPU_DATA_FORMAT_BN_MUL_SHIFT_VALUE_NEG__MASK;
> +}
> +#define DPU_DATA_FORMAT_BS_MUL_SHIFT_VALUE_NEG__MASK		0x000003f0
> +#define DPU_DATA_FORMAT_BS_MUL_SHIFT_VALUE_NEG__SHIFT		4
> +static inline uint32_t DPU_DATA_FORMAT_BS_MUL_SHIFT_VALUE_NEG(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_FORMAT_BS_MUL_SHIFT_VALUE_NEG__SHIFT) & DPU_DATA_FORMAT_BS_MUL_SHIFT_VALUE_NEG__MASK;
> +}
> +#define DPU_DATA_FORMAT_MC_SURF_OUT__MASK			0x00000008
> +#define DPU_DATA_FORMAT_MC_SURF_OUT__SHIFT			3
> +static inline uint32_t DPU_DATA_FORMAT_MC_SURF_OUT(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_FORMAT_MC_SURF_OUT__SHIFT) & DPU_DATA_FORMAT_MC_SURF_OUT__MASK;
> +}
> +#define DPU_DATA_FORMAT_PROC_PRECISION__MASK			0x00000007
> +#define DPU_DATA_FORMAT_PROC_PRECISION__SHIFT			0
> +static inline uint32_t DPU_DATA_FORMAT_PROC_PRECISION(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_FORMAT_PROC_PRECISION__SHIFT) & DPU_DATA_FORMAT_PROC_PRECISION__MASK;
> +}
> +
> +#define REG_DPU_OFFSET_PEND					0x00004014
> +#define DPU_OFFSET_PEND_RESERVED_0__MASK			0xffff0000
> +#define DPU_OFFSET_PEND_RESERVED_0__SHIFT			16
> +static inline uint32_t DPU_OFFSET_PEND_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_OFFSET_PEND_RESERVED_0__SHIFT) & DPU_OFFSET_PEND_RESERVED_0__MASK;
> +}
> +#define DPU_OFFSET_PEND_OFFSET_PEND__MASK			0x0000ffff
> +#define DPU_OFFSET_PEND_OFFSET_PEND__SHIFT			0
> +static inline uint32_t DPU_OFFSET_PEND_OFFSET_PEND(uint32_t val)
> +{
> +	return ((val) << DPU_OFFSET_PEND_OFFSET_PEND__SHIFT) & DPU_OFFSET_PEND_OFFSET_PEND__MASK;
> +}
> +
> +#define REG_DPU_DST_BASE_ADDR					0x00004020
> +#define DPU_DST_BASE_ADDR_DST_BASE_ADDR__MASK			0xffffffff
> +#define DPU_DST_BASE_ADDR_DST_BASE_ADDR__SHIFT			0
> +static inline uint32_t DPU_DST_BASE_ADDR_DST_BASE_ADDR(uint32_t val)
> +{
> +	return ((val) << DPU_DST_BASE_ADDR_DST_BASE_ADDR__SHIFT) & DPU_DST_BASE_ADDR_DST_BASE_ADDR__MASK;
> +}
> +
> +#define REG_DPU_DST_SURF_STRIDE					0x00004024
> +#define DPU_DST_SURF_STRIDE_DST_SURF_STRIDE__MASK		0xfffffff0
> +#define DPU_DST_SURF_STRIDE_DST_SURF_STRIDE__SHIFT		4
> +static inline uint32_t DPU_DST_SURF_STRIDE_DST_SURF_STRIDE(uint32_t val)
> +{
> +	return ((val) << DPU_DST_SURF_STRIDE_DST_SURF_STRIDE__SHIFT) & DPU_DST_SURF_STRIDE_DST_SURF_STRIDE__MASK;
> +}
> +#define DPU_DST_SURF_STRIDE_RESERVED_0__MASK			0x0000000f
> +#define DPU_DST_SURF_STRIDE_RESERVED_0__SHIFT			0
> +static inline uint32_t DPU_DST_SURF_STRIDE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_DST_SURF_STRIDE_RESERVED_0__SHIFT) & DPU_DST_SURF_STRIDE_RESERVED_0__MASK;
> +}
> +
> +#define REG_DPU_DATA_CUBE_WIDTH					0x00004030
> +#define DPU_DATA_CUBE_WIDTH_RESERVED_0__MASK			0xffffe000
> +#define DPU_DATA_CUBE_WIDTH_RESERVED_0__SHIFT			13
> +static inline uint32_t DPU_DATA_CUBE_WIDTH_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_CUBE_WIDTH_RESERVED_0__SHIFT) & DPU_DATA_CUBE_WIDTH_RESERVED_0__MASK;
> +}
> +#define DPU_DATA_CUBE_WIDTH_WIDTH__MASK				0x00001fff
> +#define DPU_DATA_CUBE_WIDTH_WIDTH__SHIFT			0
> +static inline uint32_t DPU_DATA_CUBE_WIDTH_WIDTH(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_CUBE_WIDTH_WIDTH__SHIFT) & DPU_DATA_CUBE_WIDTH_WIDTH__MASK;
> +}
> +
> +#define REG_DPU_DATA_CUBE_HEIGHT				0x00004034
> +#define DPU_DATA_CUBE_HEIGHT_RESERVED_0__MASK			0xfe000000
> +#define DPU_DATA_CUBE_HEIGHT_RESERVED_0__SHIFT			25
> +static inline uint32_t DPU_DATA_CUBE_HEIGHT_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_CUBE_HEIGHT_RESERVED_0__SHIFT) & DPU_DATA_CUBE_HEIGHT_RESERVED_0__MASK;
> +}
> +#define DPU_DATA_CUBE_HEIGHT_MINMAX_CTL__MASK			0x01c00000
> +#define DPU_DATA_CUBE_HEIGHT_MINMAX_CTL__SHIFT			22
> +static inline uint32_t DPU_DATA_CUBE_HEIGHT_MINMAX_CTL(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_CUBE_HEIGHT_MINMAX_CTL__SHIFT) & DPU_DATA_CUBE_HEIGHT_MINMAX_CTL__MASK;
> +}
> +#define DPU_DATA_CUBE_HEIGHT_RESERVED_1__MASK			0x003fe000
> +#define DPU_DATA_CUBE_HEIGHT_RESERVED_1__SHIFT			13
> +static inline uint32_t DPU_DATA_CUBE_HEIGHT_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_CUBE_HEIGHT_RESERVED_1__SHIFT) & DPU_DATA_CUBE_HEIGHT_RESERVED_1__MASK;
> +}
> +#define DPU_DATA_CUBE_HEIGHT_HEIGHT__MASK			0x00001fff
> +#define DPU_DATA_CUBE_HEIGHT_HEIGHT__SHIFT			0
> +static inline uint32_t DPU_DATA_CUBE_HEIGHT_HEIGHT(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_CUBE_HEIGHT_HEIGHT__SHIFT) & DPU_DATA_CUBE_HEIGHT_HEIGHT__MASK;
> +}
> +
> +#define REG_DPU_DATA_CUBE_NOTCH_ADDR				0x00004038
> +#define DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_0__MASK		0xe0000000
> +#define DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_0__SHIFT		29
> +static inline uint32_t DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_0__SHIFT) & DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_0__MASK;
> +}
> +#define DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_1__MASK		0x1fff0000
> +#define DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_1__SHIFT		16
> +static inline uint32_t DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_1(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_1__SHIFT) & DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_1__MASK;
> +}
> +#define DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_1__MASK		0x0000e000
> +#define DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_1__SHIFT		13
> +static inline uint32_t DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_1__SHIFT) & DPU_DATA_CUBE_NOTCH_ADDR_RESERVED_1__MASK;
> +}
> +#define DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_0__MASK		0x00001fff
> +#define DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_0__SHIFT		0
> +static inline uint32_t DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_0(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_0__SHIFT) & DPU_DATA_CUBE_NOTCH_ADDR_NOTCH_ADDR_0__MASK;
> +}
> +
> +#define REG_DPU_DATA_CUBE_CHANNEL				0x0000403c
> +#define DPU_DATA_CUBE_CHANNEL_RESERVED_0__MASK			0xe0000000
> +#define DPU_DATA_CUBE_CHANNEL_RESERVED_0__SHIFT			29
> +static inline uint32_t DPU_DATA_CUBE_CHANNEL_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_CUBE_CHANNEL_RESERVED_0__SHIFT) & DPU_DATA_CUBE_CHANNEL_RESERVED_0__MASK;
> +}
> +#define DPU_DATA_CUBE_CHANNEL_ORIG_CHANNEL__MASK		0x1fff0000
> +#define DPU_DATA_CUBE_CHANNEL_ORIG_CHANNEL__SHIFT		16
> +static inline uint32_t DPU_DATA_CUBE_CHANNEL_ORIG_CHANNEL(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_CUBE_CHANNEL_ORIG_CHANNEL__SHIFT) & DPU_DATA_CUBE_CHANNEL_ORIG_CHANNEL__MASK;
> +}
> +#define DPU_DATA_CUBE_CHANNEL_RESERVED_1__MASK			0x0000e000
> +#define DPU_DATA_CUBE_CHANNEL_RESERVED_1__SHIFT			13
> +static inline uint32_t DPU_DATA_CUBE_CHANNEL_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_CUBE_CHANNEL_RESERVED_1__SHIFT) & DPU_DATA_CUBE_CHANNEL_RESERVED_1__MASK;
> +}
> +#define DPU_DATA_CUBE_CHANNEL_CHANNEL__MASK			0x00001fff
> +#define DPU_DATA_CUBE_CHANNEL_CHANNEL__SHIFT			0
> +static inline uint32_t DPU_DATA_CUBE_CHANNEL_CHANNEL(uint32_t val)
> +{
> +	return ((val) << DPU_DATA_CUBE_CHANNEL_CHANNEL__SHIFT) & DPU_DATA_CUBE_CHANNEL_CHANNEL__MASK;
> +}
> +
> +#define REG_DPU_BS_CFG						0x00004040
> +#define DPU_BS_CFG_RESERVED_0__MASK				0xfff00000
> +#define DPU_BS_CFG_RESERVED_0__SHIFT				20
> +static inline uint32_t DPU_BS_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_BS_CFG_RESERVED_0__SHIFT) & DPU_BS_CFG_RESERVED_0__MASK;
> +}
> +#define DPU_BS_CFG_BS_ALU_ALGO__MASK				0x000f0000
> +#define DPU_BS_CFG_BS_ALU_ALGO__SHIFT				16
> +static inline uint32_t DPU_BS_CFG_BS_ALU_ALGO(uint32_t val)
> +{
> +	return ((val) << DPU_BS_CFG_BS_ALU_ALGO__SHIFT) & DPU_BS_CFG_BS_ALU_ALGO__MASK;
> +}
> +#define DPU_BS_CFG_RESERVED_1__MASK				0x0000fe00
> +#define DPU_BS_CFG_RESERVED_1__SHIFT				9
> +static inline uint32_t DPU_BS_CFG_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_BS_CFG_RESERVED_1__SHIFT) & DPU_BS_CFG_RESERVED_1__MASK;
> +}
> +#define DPU_BS_CFG_BS_ALU_SRC__MASK				0x00000100
> +#define DPU_BS_CFG_BS_ALU_SRC__SHIFT				8
> +static inline uint32_t DPU_BS_CFG_BS_ALU_SRC(uint32_t val)
> +{
> +	return ((val) << DPU_BS_CFG_BS_ALU_SRC__SHIFT) & DPU_BS_CFG_BS_ALU_SRC__MASK;
> +}
> +#define DPU_BS_CFG_BS_RELUX_EN__MASK				0x00000080
> +#define DPU_BS_CFG_BS_RELUX_EN__SHIFT				7
> +static inline uint32_t DPU_BS_CFG_BS_RELUX_EN(uint32_t val)
> +{
> +	return ((val) << DPU_BS_CFG_BS_RELUX_EN__SHIFT) & DPU_BS_CFG_BS_RELUX_EN__MASK;
> +}
> +#define DPU_BS_CFG_BS_RELU_BYPASS__MASK				0x00000040
> +#define DPU_BS_CFG_BS_RELU_BYPASS__SHIFT			6
> +static inline uint32_t DPU_BS_CFG_BS_RELU_BYPASS(uint32_t val)
> +{
> +	return ((val) << DPU_BS_CFG_BS_RELU_BYPASS__SHIFT) & DPU_BS_CFG_BS_RELU_BYPASS__MASK;
> +}
> +#define DPU_BS_CFG_BS_MUL_PRELU__MASK				0x00000020
> +#define DPU_BS_CFG_BS_MUL_PRELU__SHIFT				5
> +static inline uint32_t DPU_BS_CFG_BS_MUL_PRELU(uint32_t val)
> +{
> +	return ((val) << DPU_BS_CFG_BS_MUL_PRELU__SHIFT) & DPU_BS_CFG_BS_MUL_PRELU__MASK;
> +}
> +#define DPU_BS_CFG_BS_MUL_BYPASS__MASK				0x00000010
> +#define DPU_BS_CFG_BS_MUL_BYPASS__SHIFT				4
> +static inline uint32_t DPU_BS_CFG_BS_MUL_BYPASS(uint32_t val)
> +{
> +	return ((val) << DPU_BS_CFG_BS_MUL_BYPASS__SHIFT) & DPU_BS_CFG_BS_MUL_BYPASS__MASK;
> +}
> +#define DPU_BS_CFG_RESERVED_2__MASK				0x0000000c
> +#define DPU_BS_CFG_RESERVED_2__SHIFT				2
> +static inline uint32_t DPU_BS_CFG_RESERVED_2(uint32_t val)
> +{
> +	return ((val) << DPU_BS_CFG_RESERVED_2__SHIFT) & DPU_BS_CFG_RESERVED_2__MASK;
> +}
> +#define DPU_BS_CFG_BS_ALU_BYPASS__MASK				0x00000002
> +#define DPU_BS_CFG_BS_ALU_BYPASS__SHIFT				1
> +static inline uint32_t DPU_BS_CFG_BS_ALU_BYPASS(uint32_t val)
> +{
> +	return ((val) << DPU_BS_CFG_BS_ALU_BYPASS__SHIFT) & DPU_BS_CFG_BS_ALU_BYPASS__MASK;
> +}
> +#define DPU_BS_CFG_BS_BYPASS__MASK				0x00000001
> +#define DPU_BS_CFG_BS_BYPASS__SHIFT				0
> +static inline uint32_t DPU_BS_CFG_BS_BYPASS(uint32_t val)
> +{
> +	return ((val) << DPU_BS_CFG_BS_BYPASS__SHIFT) & DPU_BS_CFG_BS_BYPASS__MASK;
> +}
> +
> +#define REG_DPU_BS_ALU_CFG					0x00004044
> +#define DPU_BS_ALU_CFG_BS_ALU_OPERAND__MASK			0xffffffff
> +#define DPU_BS_ALU_CFG_BS_ALU_OPERAND__SHIFT			0
> +static inline uint32_t DPU_BS_ALU_CFG_BS_ALU_OPERAND(uint32_t val)
> +{
> +	return ((val) << DPU_BS_ALU_CFG_BS_ALU_OPERAND__SHIFT) & DPU_BS_ALU_CFG_BS_ALU_OPERAND__MASK;
> +}
> +
> +#define REG_DPU_BS_MUL_CFG					0x00004048
> +#define DPU_BS_MUL_CFG_BS_MUL_OPERAND__MASK			0xffff0000
> +#define DPU_BS_MUL_CFG_BS_MUL_OPERAND__SHIFT			16
> +static inline uint32_t DPU_BS_MUL_CFG_BS_MUL_OPERAND(uint32_t val)
> +{
> +	return ((val) << DPU_BS_MUL_CFG_BS_MUL_OPERAND__SHIFT) & DPU_BS_MUL_CFG_BS_MUL_OPERAND__MASK;
> +}
> +#define DPU_BS_MUL_CFG_RESERVED_0__MASK				0x0000c000
> +#define DPU_BS_MUL_CFG_RESERVED_0__SHIFT			14
> +static inline uint32_t DPU_BS_MUL_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_BS_MUL_CFG_RESERVED_0__SHIFT) & DPU_BS_MUL_CFG_RESERVED_0__MASK;
> +}
> +#define DPU_BS_MUL_CFG_BS_MUL_SHIFT_VALUE__MASK			0x00003f00
> +#define DPU_BS_MUL_CFG_BS_MUL_SHIFT_VALUE__SHIFT		8
> +static inline uint32_t DPU_BS_MUL_CFG_BS_MUL_SHIFT_VALUE(uint32_t val)
> +{
> +	return ((val) << DPU_BS_MUL_CFG_BS_MUL_SHIFT_VALUE__SHIFT) & DPU_BS_MUL_CFG_BS_MUL_SHIFT_VALUE__MASK;
> +}
> +#define DPU_BS_MUL_CFG_RESERVED_1__MASK				0x000000fc
> +#define DPU_BS_MUL_CFG_RESERVED_1__SHIFT			2
> +static inline uint32_t DPU_BS_MUL_CFG_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_BS_MUL_CFG_RESERVED_1__SHIFT) & DPU_BS_MUL_CFG_RESERVED_1__MASK;
> +}
> +#define DPU_BS_MUL_CFG_BS_TRUNCATE_SRC__MASK			0x00000002
> +#define DPU_BS_MUL_CFG_BS_TRUNCATE_SRC__SHIFT			1
> +static inline uint32_t DPU_BS_MUL_CFG_BS_TRUNCATE_SRC(uint32_t val)
> +{
> +	return ((val) << DPU_BS_MUL_CFG_BS_TRUNCATE_SRC__SHIFT) & DPU_BS_MUL_CFG_BS_TRUNCATE_SRC__MASK;
> +}
> +#define DPU_BS_MUL_CFG_BS_MUL_SRC__MASK				0x00000001
> +#define DPU_BS_MUL_CFG_BS_MUL_SRC__SHIFT			0
> +static inline uint32_t DPU_BS_MUL_CFG_BS_MUL_SRC(uint32_t val)
> +{
> +	return ((val) << DPU_BS_MUL_CFG_BS_MUL_SRC__SHIFT) & DPU_BS_MUL_CFG_BS_MUL_SRC__MASK;
> +}
> +
> +#define REG_DPU_BS_RELUX_CMP_VALUE				0x0000404c
> +#define DPU_BS_RELUX_CMP_VALUE_BS_RELUX_CMP_DAT__MASK		0xffffffff
> +#define DPU_BS_RELUX_CMP_VALUE_BS_RELUX_CMP_DAT__SHIFT		0
> +static inline uint32_t DPU_BS_RELUX_CMP_VALUE_BS_RELUX_CMP_DAT(uint32_t val)
> +{
> +	return ((val) << DPU_BS_RELUX_CMP_VALUE_BS_RELUX_CMP_DAT__SHIFT) & DPU_BS_RELUX_CMP_VALUE_BS_RELUX_CMP_DAT__MASK;
> +}
> +
> +#define REG_DPU_BS_OW_CFG					0x00004050
> +#define DPU_BS_OW_CFG_RGP_CNTER__MASK				0xf0000000
> +#define DPU_BS_OW_CFG_RGP_CNTER__SHIFT				28
> +static inline uint32_t DPU_BS_OW_CFG_RGP_CNTER(uint32_t val)
> +{
> +	return ((val) << DPU_BS_OW_CFG_RGP_CNTER__SHIFT) & DPU_BS_OW_CFG_RGP_CNTER__MASK;
> +}
> +#define DPU_BS_OW_CFG_TP_ORG_EN__MASK				0x08000000
> +#define DPU_BS_OW_CFG_TP_ORG_EN__SHIFT				27
> +static inline uint32_t DPU_BS_OW_CFG_TP_ORG_EN(uint32_t val)
> +{
> +	return ((val) << DPU_BS_OW_CFG_TP_ORG_EN__SHIFT) & DPU_BS_OW_CFG_TP_ORG_EN__MASK;
> +}
> +#define DPU_BS_OW_CFG_RESERVED_0__MASK				0x07fff800
> +#define DPU_BS_OW_CFG_RESERVED_0__SHIFT				11
> +static inline uint32_t DPU_BS_OW_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_BS_OW_CFG_RESERVED_0__SHIFT) & DPU_BS_OW_CFG_RESERVED_0__MASK;
> +}
> +#define DPU_BS_OW_CFG_SIZE_E_2__MASK				0x00000700
> +#define DPU_BS_OW_CFG_SIZE_E_2__SHIFT				8
> +static inline uint32_t DPU_BS_OW_CFG_SIZE_E_2(uint32_t val)
> +{
> +	return ((val) << DPU_BS_OW_CFG_SIZE_E_2__SHIFT) & DPU_BS_OW_CFG_SIZE_E_2__MASK;
> +}
> +#define DPU_BS_OW_CFG_SIZE_E_1__MASK				0x000000e0
> +#define DPU_BS_OW_CFG_SIZE_E_1__SHIFT				5
> +static inline uint32_t DPU_BS_OW_CFG_SIZE_E_1(uint32_t val)
> +{
> +	return ((val) << DPU_BS_OW_CFG_SIZE_E_1__SHIFT) & DPU_BS_OW_CFG_SIZE_E_1__MASK;
> +}
> +#define DPU_BS_OW_CFG_SIZE_E_0__MASK				0x0000001c
> +#define DPU_BS_OW_CFG_SIZE_E_0__SHIFT				2
> +static inline uint32_t DPU_BS_OW_CFG_SIZE_E_0(uint32_t val)
> +{
> +	return ((val) << DPU_BS_OW_CFG_SIZE_E_0__SHIFT) & DPU_BS_OW_CFG_SIZE_E_0__MASK;
> +}
> +#define DPU_BS_OW_CFG_OD_BYPASS__MASK				0x00000002
> +#define DPU_BS_OW_CFG_OD_BYPASS__SHIFT				1
> +static inline uint32_t DPU_BS_OW_CFG_OD_BYPASS(uint32_t val)
> +{
> +	return ((val) << DPU_BS_OW_CFG_OD_BYPASS__SHIFT) & DPU_BS_OW_CFG_OD_BYPASS__MASK;
> +}
> +#define DPU_BS_OW_CFG_OW_SRC__MASK				0x00000001
> +#define DPU_BS_OW_CFG_OW_SRC__SHIFT				0
> +static inline uint32_t DPU_BS_OW_CFG_OW_SRC(uint32_t val)
> +{
> +	return ((val) << DPU_BS_OW_CFG_OW_SRC__SHIFT) & DPU_BS_OW_CFG_OW_SRC__MASK;
> +}
> +
> +#define REG_DPU_BS_OW_OP					0x00004054
> +#define DPU_BS_OW_OP_RESERVED_0__MASK				0xffff0000
> +#define DPU_BS_OW_OP_RESERVED_0__SHIFT				16
> +static inline uint32_t DPU_BS_OW_OP_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_BS_OW_OP_RESERVED_0__SHIFT) & DPU_BS_OW_OP_RESERVED_0__MASK;
> +}
> +#define DPU_BS_OW_OP_OW_OP__MASK				0x0000ffff
> +#define DPU_BS_OW_OP_OW_OP__SHIFT				0
> +static inline uint32_t DPU_BS_OW_OP_OW_OP(uint32_t val)
> +{
> +	return ((val) << DPU_BS_OW_OP_OW_OP__SHIFT) & DPU_BS_OW_OP_OW_OP__MASK;
> +}
> +
> +#define REG_DPU_WDMA_SIZE_0					0x00004058
> +#define DPU_WDMA_SIZE_0_RESERVED_0__MASK			0xf0000000
> +#define DPU_WDMA_SIZE_0_RESERVED_0__SHIFT			28
> +static inline uint32_t DPU_WDMA_SIZE_0_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_WDMA_SIZE_0_RESERVED_0__SHIFT) & DPU_WDMA_SIZE_0_RESERVED_0__MASK;
> +}
> +#define DPU_WDMA_SIZE_0_TP_PRECISION__MASK			0x08000000
> +#define DPU_WDMA_SIZE_0_TP_PRECISION__SHIFT			27
> +static inline uint32_t DPU_WDMA_SIZE_0_TP_PRECISION(uint32_t val)
> +{
> +	return ((val) << DPU_WDMA_SIZE_0_TP_PRECISION__SHIFT) & DPU_WDMA_SIZE_0_TP_PRECISION__MASK;
> +}
> +#define DPU_WDMA_SIZE_0_SIZE_C_WDMA__MASK			0x07ff0000
> +#define DPU_WDMA_SIZE_0_SIZE_C_WDMA__SHIFT			16
> +static inline uint32_t DPU_WDMA_SIZE_0_SIZE_C_WDMA(uint32_t val)
> +{
> +	return ((val) << DPU_WDMA_SIZE_0_SIZE_C_WDMA__SHIFT) & DPU_WDMA_SIZE_0_SIZE_C_WDMA__MASK;
> +}
> +#define DPU_WDMA_SIZE_0_RESERVED_1__MASK			0x0000e000
> +#define DPU_WDMA_SIZE_0_RESERVED_1__SHIFT			13
> +static inline uint32_t DPU_WDMA_SIZE_0_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_WDMA_SIZE_0_RESERVED_1__SHIFT) & DPU_WDMA_SIZE_0_RESERVED_1__MASK;
> +}
> +#define DPU_WDMA_SIZE_0_CHANNEL_WDMA__MASK			0x00001fff
> +#define DPU_WDMA_SIZE_0_CHANNEL_WDMA__SHIFT			0
> +static inline uint32_t DPU_WDMA_SIZE_0_CHANNEL_WDMA(uint32_t val)
> +{
> +	return ((val) << DPU_WDMA_SIZE_0_CHANNEL_WDMA__SHIFT) & DPU_WDMA_SIZE_0_CHANNEL_WDMA__MASK;
> +}
> +
> +#define REG_DPU_WDMA_SIZE_1					0x0000405c
> +#define DPU_WDMA_SIZE_1_RESERVED_0__MASK			0xe0000000
> +#define DPU_WDMA_SIZE_1_RESERVED_0__SHIFT			29
> +static inline uint32_t DPU_WDMA_SIZE_1_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_WDMA_SIZE_1_RESERVED_0__SHIFT) & DPU_WDMA_SIZE_1_RESERVED_0__MASK;
> +}
> +#define DPU_WDMA_SIZE_1_HEIGHT_WDMA__MASK			0x1fff0000
> +#define DPU_WDMA_SIZE_1_HEIGHT_WDMA__SHIFT			16
> +static inline uint32_t DPU_WDMA_SIZE_1_HEIGHT_WDMA(uint32_t val)
> +{
> +	return ((val) << DPU_WDMA_SIZE_1_HEIGHT_WDMA__SHIFT) & DPU_WDMA_SIZE_1_HEIGHT_WDMA__MASK;
> +}
> +#define DPU_WDMA_SIZE_1_RESERVED_1__MASK			0x0000e000
> +#define DPU_WDMA_SIZE_1_RESERVED_1__SHIFT			13
> +static inline uint32_t DPU_WDMA_SIZE_1_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_WDMA_SIZE_1_RESERVED_1__SHIFT) & DPU_WDMA_SIZE_1_RESERVED_1__MASK;
> +}
> +#define DPU_WDMA_SIZE_1_WIDTH_WDMA__MASK			0x00001fff
> +#define DPU_WDMA_SIZE_1_WIDTH_WDMA__SHIFT			0
> +static inline uint32_t DPU_WDMA_SIZE_1_WIDTH_WDMA(uint32_t val)
> +{
> +	return ((val) << DPU_WDMA_SIZE_1_WIDTH_WDMA__SHIFT) & DPU_WDMA_SIZE_1_WIDTH_WDMA__MASK;
> +}
> +
> +#define REG_DPU_BN_CFG						0x00004060
> +#define DPU_BN_CFG_RESERVED_0__MASK				0xfff00000
> +#define DPU_BN_CFG_RESERVED_0__SHIFT				20
> +static inline uint32_t DPU_BN_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_BN_CFG_RESERVED_0__SHIFT) & DPU_BN_CFG_RESERVED_0__MASK;
> +}
> +#define DPU_BN_CFG_BN_ALU_ALGO__MASK				0x000f0000
> +#define DPU_BN_CFG_BN_ALU_ALGO__SHIFT				16
> +static inline uint32_t DPU_BN_CFG_BN_ALU_ALGO(uint32_t val)
> +{
> +	return ((val) << DPU_BN_CFG_BN_ALU_ALGO__SHIFT) & DPU_BN_CFG_BN_ALU_ALGO__MASK;
> +}
> +#define DPU_BN_CFG_RESERVED_1__MASK				0x0000fe00
> +#define DPU_BN_CFG_RESERVED_1__SHIFT				9
> +static inline uint32_t DPU_BN_CFG_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_BN_CFG_RESERVED_1__SHIFT) & DPU_BN_CFG_RESERVED_1__MASK;
> +}
> +#define DPU_BN_CFG_BN_ALU_SRC__MASK				0x00000100
> +#define DPU_BN_CFG_BN_ALU_SRC__SHIFT				8
> +static inline uint32_t DPU_BN_CFG_BN_ALU_SRC(uint32_t val)
> +{
> +	return ((val) << DPU_BN_CFG_BN_ALU_SRC__SHIFT) & DPU_BN_CFG_BN_ALU_SRC__MASK;
> +}
> +#define DPU_BN_CFG_BN_RELUX_EN__MASK				0x00000080
> +#define DPU_BN_CFG_BN_RELUX_EN__SHIFT				7
> +static inline uint32_t DPU_BN_CFG_BN_RELUX_EN(uint32_t val)
> +{
> +	return ((val) << DPU_BN_CFG_BN_RELUX_EN__SHIFT) & DPU_BN_CFG_BN_RELUX_EN__MASK;
> +}
> +#define DPU_BN_CFG_BN_RELU_BYPASS__MASK				0x00000040
> +#define DPU_BN_CFG_BN_RELU_BYPASS__SHIFT			6
> +static inline uint32_t DPU_BN_CFG_BN_RELU_BYPASS(uint32_t val)
> +{
> +	return ((val) << DPU_BN_CFG_BN_RELU_BYPASS__SHIFT) & DPU_BN_CFG_BN_RELU_BYPASS__MASK;
> +}
> +#define DPU_BN_CFG_BN_MUL_PRELU__MASK				0x00000020
> +#define DPU_BN_CFG_BN_MUL_PRELU__SHIFT				5
> +static inline uint32_t DPU_BN_CFG_BN_MUL_PRELU(uint32_t val)
> +{
> +	return ((val) << DPU_BN_CFG_BN_MUL_PRELU__SHIFT) & DPU_BN_CFG_BN_MUL_PRELU__MASK;
> +}
> +#define DPU_BN_CFG_BN_MUL_BYPASS__MASK				0x00000010
> +#define DPU_BN_CFG_BN_MUL_BYPASS__SHIFT				4
> +static inline uint32_t DPU_BN_CFG_BN_MUL_BYPASS(uint32_t val)
> +{
> +	return ((val) << DPU_BN_CFG_BN_MUL_BYPASS__SHIFT) & DPU_BN_CFG_BN_MUL_BYPASS__MASK;
> +}
> +#define DPU_BN_CFG_RESERVED_2__MASK				0x0000000c
> +#define DPU_BN_CFG_RESERVED_2__SHIFT				2
> +static inline uint32_t DPU_BN_CFG_RESERVED_2(uint32_t val)
> +{
> +	return ((val) << DPU_BN_CFG_RESERVED_2__SHIFT) & DPU_BN_CFG_RESERVED_2__MASK;
> +}
> +#define DPU_BN_CFG_BN_ALU_BYPASS__MASK				0x00000002
> +#define DPU_BN_CFG_BN_ALU_BYPASS__SHIFT				1
> +static inline uint32_t DPU_BN_CFG_BN_ALU_BYPASS(uint32_t val)
> +{
> +	return ((val) << DPU_BN_CFG_BN_ALU_BYPASS__SHIFT) & DPU_BN_CFG_BN_ALU_BYPASS__MASK;
> +}
> +#define DPU_BN_CFG_BN_BYPASS__MASK				0x00000001
> +#define DPU_BN_CFG_BN_BYPASS__SHIFT				0
> +static inline uint32_t DPU_BN_CFG_BN_BYPASS(uint32_t val)
> +{
> +	return ((val) << DPU_BN_CFG_BN_BYPASS__SHIFT) & DPU_BN_CFG_BN_BYPASS__MASK;
> +}
> +
> +#define REG_DPU_BN_ALU_CFG					0x00004064
> +#define DPU_BN_ALU_CFG_BN_ALU_OPERAND__MASK			0xffffffff
> +#define DPU_BN_ALU_CFG_BN_ALU_OPERAND__SHIFT			0
> +static inline uint32_t DPU_BN_ALU_CFG_BN_ALU_OPERAND(uint32_t val)
> +{
> +	return ((val) << DPU_BN_ALU_CFG_BN_ALU_OPERAND__SHIFT) & DPU_BN_ALU_CFG_BN_ALU_OPERAND__MASK;
> +}
> +
> +#define REG_DPU_BN_MUL_CFG					0x00004068
> +#define DPU_BN_MUL_CFG_BN_MUL_OPERAND__MASK			0xffff0000
> +#define DPU_BN_MUL_CFG_BN_MUL_OPERAND__SHIFT			16
> +static inline uint32_t DPU_BN_MUL_CFG_BN_MUL_OPERAND(uint32_t val)
> +{
> +	return ((val) << DPU_BN_MUL_CFG_BN_MUL_OPERAND__SHIFT) & DPU_BN_MUL_CFG_BN_MUL_OPERAND__MASK;
> +}
> +#define DPU_BN_MUL_CFG_RESERVED_0__MASK				0x0000c000
> +#define DPU_BN_MUL_CFG_RESERVED_0__SHIFT			14
> +static inline uint32_t DPU_BN_MUL_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_BN_MUL_CFG_RESERVED_0__SHIFT) & DPU_BN_MUL_CFG_RESERVED_0__MASK;
> +}
> +#define DPU_BN_MUL_CFG_BN_MUL_SHIFT_VALUE__MASK			0x00003f00
> +#define DPU_BN_MUL_CFG_BN_MUL_SHIFT_VALUE__SHIFT		8
> +static inline uint32_t DPU_BN_MUL_CFG_BN_MUL_SHIFT_VALUE(uint32_t val)
> +{
> +	return ((val) << DPU_BN_MUL_CFG_BN_MUL_SHIFT_VALUE__SHIFT) & DPU_BN_MUL_CFG_BN_MUL_SHIFT_VALUE__MASK;
> +}
> +#define DPU_BN_MUL_CFG_RESERVED_1__MASK				0x000000fc
> +#define DPU_BN_MUL_CFG_RESERVED_1__SHIFT			2
> +static inline uint32_t DPU_BN_MUL_CFG_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_BN_MUL_CFG_RESERVED_1__SHIFT) & DPU_BN_MUL_CFG_RESERVED_1__MASK;
> +}
> +#define DPU_BN_MUL_CFG_BN_TRUNCATE_SRC__MASK			0x00000002
> +#define DPU_BN_MUL_CFG_BN_TRUNCATE_SRC__SHIFT			1
> +static inline uint32_t DPU_BN_MUL_CFG_BN_TRUNCATE_SRC(uint32_t val)
> +{
> +	return ((val) << DPU_BN_MUL_CFG_BN_TRUNCATE_SRC__SHIFT) & DPU_BN_MUL_CFG_BN_TRUNCATE_SRC__MASK;
> +}
> +#define DPU_BN_MUL_CFG_BN_MUL_SRC__MASK				0x00000001
> +#define DPU_BN_MUL_CFG_BN_MUL_SRC__SHIFT			0
> +static inline uint32_t DPU_BN_MUL_CFG_BN_MUL_SRC(uint32_t val)
> +{
> +	return ((val) << DPU_BN_MUL_CFG_BN_MUL_SRC__SHIFT) & DPU_BN_MUL_CFG_BN_MUL_SRC__MASK;
> +}
> +
> +#define REG_DPU_BN_RELUX_CMP_VALUE				0x0000406c
> +#define DPU_BN_RELUX_CMP_VALUE_BN_RELUX_CMP_DAT__MASK		0xffffffff
> +#define DPU_BN_RELUX_CMP_VALUE_BN_RELUX_CMP_DAT__SHIFT		0
> +static inline uint32_t DPU_BN_RELUX_CMP_VALUE_BN_RELUX_CMP_DAT(uint32_t val)
> +{
> +	return ((val) << DPU_BN_RELUX_CMP_VALUE_BN_RELUX_CMP_DAT__SHIFT) & DPU_BN_RELUX_CMP_VALUE_BN_RELUX_CMP_DAT__MASK;
> +}
> +
> +#define REG_DPU_EW_CFG						0x00004070
> +#define DPU_EW_CFG_EW_CVT_TYPE__MASK				0x80000000
> +#define DPU_EW_CFG_EW_CVT_TYPE__SHIFT				31
> +static inline uint32_t DPU_EW_CFG_EW_CVT_TYPE(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EW_CVT_TYPE__SHIFT) & DPU_EW_CFG_EW_CVT_TYPE__MASK;
> +}
> +#define DPU_EW_CFG_EW_CVT_ROUND__MASK				0x40000000
> +#define DPU_EW_CFG_EW_CVT_ROUND__SHIFT				30
> +static inline uint32_t DPU_EW_CFG_EW_CVT_ROUND(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EW_CVT_ROUND__SHIFT) & DPU_EW_CFG_EW_CVT_ROUND__MASK;
> +}
> +#define DPU_EW_CFG_EW_DATA_MODE__MASK				0x30000000
> +#define DPU_EW_CFG_EW_DATA_MODE__SHIFT				28
> +static inline uint32_t DPU_EW_CFG_EW_DATA_MODE(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EW_DATA_MODE__SHIFT) & DPU_EW_CFG_EW_DATA_MODE__MASK;
> +}
> +#define DPU_EW_CFG_RESERVED_0__MASK				0x0f000000
> +#define DPU_EW_CFG_RESERVED_0__SHIFT				24
> +static inline uint32_t DPU_EW_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_RESERVED_0__SHIFT) & DPU_EW_CFG_RESERVED_0__MASK;
> +}
> +#define DPU_EW_CFG_EDATA_SIZE__MASK				0x00c00000
> +#define DPU_EW_CFG_EDATA_SIZE__SHIFT				22
> +static inline uint32_t DPU_EW_CFG_EDATA_SIZE(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EDATA_SIZE__SHIFT) & DPU_EW_CFG_EDATA_SIZE__MASK;
> +}
> +#define DPU_EW_CFG_EW_EQUAL_EN__MASK				0x00200000
> +#define DPU_EW_CFG_EW_EQUAL_EN__SHIFT				21
> +static inline uint32_t DPU_EW_CFG_EW_EQUAL_EN(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EW_EQUAL_EN__SHIFT) & DPU_EW_CFG_EW_EQUAL_EN__MASK;
> +}
> +#define DPU_EW_CFG_EW_BINARY_EN__MASK				0x00100000
> +#define DPU_EW_CFG_EW_BINARY_EN__SHIFT				20
> +static inline uint32_t DPU_EW_CFG_EW_BINARY_EN(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EW_BINARY_EN__SHIFT) & DPU_EW_CFG_EW_BINARY_EN__MASK;
> +}
> +#define DPU_EW_CFG_EW_ALU_ALGO__MASK				0x000f0000
> +#define DPU_EW_CFG_EW_ALU_ALGO__SHIFT				16
> +static inline uint32_t DPU_EW_CFG_EW_ALU_ALGO(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EW_ALU_ALGO__SHIFT) & DPU_EW_CFG_EW_ALU_ALGO__MASK;
> +}
> +#define DPU_EW_CFG_RESERVED_1__MASK				0x0000f800
> +#define DPU_EW_CFG_RESERVED_1__SHIFT				11
> +static inline uint32_t DPU_EW_CFG_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_RESERVED_1__SHIFT) & DPU_EW_CFG_RESERVED_1__MASK;
> +}
> +#define DPU_EW_CFG_EW_RELUX_EN__MASK				0x00000400
> +#define DPU_EW_CFG_EW_RELUX_EN__SHIFT				10
> +static inline uint32_t DPU_EW_CFG_EW_RELUX_EN(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EW_RELUX_EN__SHIFT) & DPU_EW_CFG_EW_RELUX_EN__MASK;
> +}
> +#define DPU_EW_CFG_EW_RELU_BYPASS__MASK				0x00000200
> +#define DPU_EW_CFG_EW_RELU_BYPASS__SHIFT			9
> +static inline uint32_t DPU_EW_CFG_EW_RELU_BYPASS(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EW_RELU_BYPASS__SHIFT) & DPU_EW_CFG_EW_RELU_BYPASS__MASK;
> +}
> +#define DPU_EW_CFG_EW_OP_CVT_BYPASS__MASK			0x00000100
> +#define DPU_EW_CFG_EW_OP_CVT_BYPASS__SHIFT			8
> +static inline uint32_t DPU_EW_CFG_EW_OP_CVT_BYPASS(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EW_OP_CVT_BYPASS__SHIFT) & DPU_EW_CFG_EW_OP_CVT_BYPASS__MASK;
> +}
> +#define DPU_EW_CFG_EW_LUT_BYPASS__MASK				0x00000080
> +#define DPU_EW_CFG_EW_LUT_BYPASS__SHIFT				7
> +static inline uint32_t DPU_EW_CFG_EW_LUT_BYPASS(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EW_LUT_BYPASS__SHIFT) & DPU_EW_CFG_EW_LUT_BYPASS__MASK;
> +}
> +#define DPU_EW_CFG_EW_OP_SRC__MASK				0x00000040
> +#define DPU_EW_CFG_EW_OP_SRC__SHIFT				6
> +static inline uint32_t DPU_EW_CFG_EW_OP_SRC(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EW_OP_SRC__SHIFT) & DPU_EW_CFG_EW_OP_SRC__MASK;
> +}
> +#define DPU_EW_CFG_EW_MUL_PRELU__MASK				0x00000020
> +#define DPU_EW_CFG_EW_MUL_PRELU__SHIFT				5
> +static inline uint32_t DPU_EW_CFG_EW_MUL_PRELU(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EW_MUL_PRELU__SHIFT) & DPU_EW_CFG_EW_MUL_PRELU__MASK;
> +}
> +#define DPU_EW_CFG_RESERVED_2__MASK				0x00000018
> +#define DPU_EW_CFG_RESERVED_2__SHIFT				3
> +static inline uint32_t DPU_EW_CFG_RESERVED_2(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_RESERVED_2__SHIFT) & DPU_EW_CFG_RESERVED_2__MASK;
> +}
> +#define DPU_EW_CFG_EW_OP_TYPE__MASK				0x00000004
> +#define DPU_EW_CFG_EW_OP_TYPE__SHIFT				2
> +static inline uint32_t DPU_EW_CFG_EW_OP_TYPE(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EW_OP_TYPE__SHIFT) & DPU_EW_CFG_EW_OP_TYPE__MASK;
> +}
> +#define DPU_EW_CFG_EW_OP_BYPASS__MASK				0x00000002
> +#define DPU_EW_CFG_EW_OP_BYPASS__SHIFT				1
> +static inline uint32_t DPU_EW_CFG_EW_OP_BYPASS(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EW_OP_BYPASS__SHIFT) & DPU_EW_CFG_EW_OP_BYPASS__MASK;
> +}
> +#define DPU_EW_CFG_EW_BYPASS__MASK				0x00000001
> +#define DPU_EW_CFG_EW_BYPASS__SHIFT				0
> +static inline uint32_t DPU_EW_CFG_EW_BYPASS(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CFG_EW_BYPASS__SHIFT) & DPU_EW_CFG_EW_BYPASS__MASK;
> +}
> +
> +#define REG_DPU_EW_CVT_OFFSET_VALUE				0x00004074
> +#define DPU_EW_CVT_OFFSET_VALUE_EW_OP_CVT_OFFSET__MASK		0xffffffff
> +#define DPU_EW_CVT_OFFSET_VALUE_EW_OP_CVT_OFFSET__SHIFT		0
> +static inline uint32_t DPU_EW_CVT_OFFSET_VALUE_EW_OP_CVT_OFFSET(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CVT_OFFSET_VALUE_EW_OP_CVT_OFFSET__SHIFT) & DPU_EW_CVT_OFFSET_VALUE_EW_OP_CVT_OFFSET__MASK;
> +}
> +
> +#define REG_DPU_EW_CVT_SCALE_VALUE				0x00004078
> +#define DPU_EW_CVT_SCALE_VALUE_EW_TRUNCATE__MASK		0xffc00000
> +#define DPU_EW_CVT_SCALE_VALUE_EW_TRUNCATE__SHIFT		22
> +static inline uint32_t DPU_EW_CVT_SCALE_VALUE_EW_TRUNCATE(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CVT_SCALE_VALUE_EW_TRUNCATE__SHIFT) & DPU_EW_CVT_SCALE_VALUE_EW_TRUNCATE__MASK;
> +}
> +#define DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SHIFT__MASK		0x003f0000
> +#define DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SHIFT__SHIFT		16
> +static inline uint32_t DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SHIFT(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SHIFT__SHIFT) & DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SHIFT__MASK;
> +}
> +#define DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SCALE__MASK		0x0000ffff
> +#define DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SCALE__SHIFT		0
> +static inline uint32_t DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SCALE(uint32_t val)
> +{
> +	return ((val) << DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SCALE__SHIFT) & DPU_EW_CVT_SCALE_VALUE_EW_OP_CVT_SCALE__MASK;
> +}
> +
> +#define REG_DPU_EW_RELUX_CMP_VALUE				0x0000407c
> +#define DPU_EW_RELUX_CMP_VALUE_EW_RELUX_CMP_DAT__MASK		0xffffffff
> +#define DPU_EW_RELUX_CMP_VALUE_EW_RELUX_CMP_DAT__SHIFT		0
> +static inline uint32_t DPU_EW_RELUX_CMP_VALUE_EW_RELUX_CMP_DAT(uint32_t val)
> +{
> +	return ((val) << DPU_EW_RELUX_CMP_VALUE_EW_RELUX_CMP_DAT__SHIFT) & DPU_EW_RELUX_CMP_VALUE_EW_RELUX_CMP_DAT__MASK;
> +}
> +
> +#define REG_DPU_OUT_CVT_OFFSET					0x00004080
> +#define DPU_OUT_CVT_OFFSET_OUT_CVT_OFFSET__MASK			0xffffffff
> +#define DPU_OUT_CVT_OFFSET_OUT_CVT_OFFSET__SHIFT		0
> +static inline uint32_t DPU_OUT_CVT_OFFSET_OUT_CVT_OFFSET(uint32_t val)
> +{
> +	return ((val) << DPU_OUT_CVT_OFFSET_OUT_CVT_OFFSET__SHIFT) & DPU_OUT_CVT_OFFSET_OUT_CVT_OFFSET__MASK;
> +}
> +
> +#define REG_DPU_OUT_CVT_SCALE					0x00004084
> +#define DPU_OUT_CVT_SCALE_RESERVED_0__MASK			0xfffe0000
> +#define DPU_OUT_CVT_SCALE_RESERVED_0__SHIFT			17
> +static inline uint32_t DPU_OUT_CVT_SCALE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_OUT_CVT_SCALE_RESERVED_0__SHIFT) & DPU_OUT_CVT_SCALE_RESERVED_0__MASK;
> +}
> +#define DPU_OUT_CVT_SCALE_FP32TOFP16_EN__MASK			0x00010000
> +#define DPU_OUT_CVT_SCALE_FP32TOFP16_EN__SHIFT			16
> +static inline uint32_t DPU_OUT_CVT_SCALE_FP32TOFP16_EN(uint32_t val)
> +{
> +	return ((val) << DPU_OUT_CVT_SCALE_FP32TOFP16_EN__SHIFT) & DPU_OUT_CVT_SCALE_FP32TOFP16_EN__MASK;
> +}
> +#define DPU_OUT_CVT_SCALE_OUT_CVT_SCALE__MASK			0x0000ffff
> +#define DPU_OUT_CVT_SCALE_OUT_CVT_SCALE__SHIFT			0
> +static inline uint32_t DPU_OUT_CVT_SCALE_OUT_CVT_SCALE(uint32_t val)
> +{
> +	return ((val) << DPU_OUT_CVT_SCALE_OUT_CVT_SCALE__SHIFT) & DPU_OUT_CVT_SCALE_OUT_CVT_SCALE__MASK;
> +}
> +
> +#define REG_DPU_OUT_CVT_SHIFT					0x00004088
> +#define DPU_OUT_CVT_SHIFT_CVT_TYPE__MASK			0x80000000
> +#define DPU_OUT_CVT_SHIFT_CVT_TYPE__SHIFT			31
> +static inline uint32_t DPU_OUT_CVT_SHIFT_CVT_TYPE(uint32_t val)
> +{
> +	return ((val) << DPU_OUT_CVT_SHIFT_CVT_TYPE__SHIFT) & DPU_OUT_CVT_SHIFT_CVT_TYPE__MASK;
> +}
> +#define DPU_OUT_CVT_SHIFT_CVT_ROUND__MASK			0x40000000
> +#define DPU_OUT_CVT_SHIFT_CVT_ROUND__SHIFT			30
> +static inline uint32_t DPU_OUT_CVT_SHIFT_CVT_ROUND(uint32_t val)
> +{
> +	return ((val) << DPU_OUT_CVT_SHIFT_CVT_ROUND__SHIFT) & DPU_OUT_CVT_SHIFT_CVT_ROUND__MASK;
> +}
> +#define DPU_OUT_CVT_SHIFT_RESERVED_0__MASK			0x3ff00000
> +#define DPU_OUT_CVT_SHIFT_RESERVED_0__SHIFT			20
> +static inline uint32_t DPU_OUT_CVT_SHIFT_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_OUT_CVT_SHIFT_RESERVED_0__SHIFT) & DPU_OUT_CVT_SHIFT_RESERVED_0__MASK;
> +}
> +#define DPU_OUT_CVT_SHIFT_MINUS_EXP__MASK			0x000ff000
> +#define DPU_OUT_CVT_SHIFT_MINUS_EXP__SHIFT			12
> +static inline uint32_t DPU_OUT_CVT_SHIFT_MINUS_EXP(uint32_t val)
> +{
> +	return ((val) << DPU_OUT_CVT_SHIFT_MINUS_EXP__SHIFT) & DPU_OUT_CVT_SHIFT_MINUS_EXP__MASK;
> +}
> +#define DPU_OUT_CVT_SHIFT_OUT_CVT_SHIFT__MASK			0x00000fff
> +#define DPU_OUT_CVT_SHIFT_OUT_CVT_SHIFT__SHIFT			0
> +static inline uint32_t DPU_OUT_CVT_SHIFT_OUT_CVT_SHIFT(uint32_t val)
> +{
> +	return ((val) << DPU_OUT_CVT_SHIFT_OUT_CVT_SHIFT__SHIFT) & DPU_OUT_CVT_SHIFT_OUT_CVT_SHIFT__MASK;
> +}
> +
> +#define REG_DPU_EW_OP_VALUE_0					0x00004090
> +#define DPU_EW_OP_VALUE_0_EW_OPERAND_0__MASK			0xffffffff
> +#define DPU_EW_OP_VALUE_0_EW_OPERAND_0__SHIFT			0
> +static inline uint32_t DPU_EW_OP_VALUE_0_EW_OPERAND_0(uint32_t val)
> +{
> +	return ((val) << DPU_EW_OP_VALUE_0_EW_OPERAND_0__SHIFT) & DPU_EW_OP_VALUE_0_EW_OPERAND_0__MASK;
> +}
> +
> +#define REG_DPU_EW_OP_VALUE_1					0x00004094
> +#define DPU_EW_OP_VALUE_1_EW_OPERAND_1__MASK			0xffffffff
> +#define DPU_EW_OP_VALUE_1_EW_OPERAND_1__SHIFT			0
> +static inline uint32_t DPU_EW_OP_VALUE_1_EW_OPERAND_1(uint32_t val)
> +{
> +	return ((val) << DPU_EW_OP_VALUE_1_EW_OPERAND_1__SHIFT) & DPU_EW_OP_VALUE_1_EW_OPERAND_1__MASK;
> +}
> +
> +#define REG_DPU_EW_OP_VALUE_2					0x00004098
> +#define DPU_EW_OP_VALUE_2_EW_OPERAND_2__MASK			0xffffffff
> +#define DPU_EW_OP_VALUE_2_EW_OPERAND_2__SHIFT			0
> +static inline uint32_t DPU_EW_OP_VALUE_2_EW_OPERAND_2(uint32_t val)
> +{
> +	return ((val) << DPU_EW_OP_VALUE_2_EW_OPERAND_2__SHIFT) & DPU_EW_OP_VALUE_2_EW_OPERAND_2__MASK;
> +}
> +
> +#define REG_DPU_EW_OP_VALUE_3					0x0000409c
> +#define DPU_EW_OP_VALUE_3_EW_OPERAND_3__MASK			0xffffffff
> +#define DPU_EW_OP_VALUE_3_EW_OPERAND_3__SHIFT			0
> +static inline uint32_t DPU_EW_OP_VALUE_3_EW_OPERAND_3(uint32_t val)
> +{
> +	return ((val) << DPU_EW_OP_VALUE_3_EW_OPERAND_3__SHIFT) & DPU_EW_OP_VALUE_3_EW_OPERAND_3__MASK;
> +}
> +
> +#define REG_DPU_EW_OP_VALUE_4					0x000040a0
> +#define DPU_EW_OP_VALUE_4_EW_OPERAND_4__MASK			0xffffffff
> +#define DPU_EW_OP_VALUE_4_EW_OPERAND_4__SHIFT			0
> +static inline uint32_t DPU_EW_OP_VALUE_4_EW_OPERAND_4(uint32_t val)
> +{
> +	return ((val) << DPU_EW_OP_VALUE_4_EW_OPERAND_4__SHIFT) & DPU_EW_OP_VALUE_4_EW_OPERAND_4__MASK;
> +}
> +
> +#define REG_DPU_EW_OP_VALUE_5					0x000040a4
> +#define DPU_EW_OP_VALUE_5_EW_OPERAND_5__MASK			0xffffffff
> +#define DPU_EW_OP_VALUE_5_EW_OPERAND_5__SHIFT			0
> +static inline uint32_t DPU_EW_OP_VALUE_5_EW_OPERAND_5(uint32_t val)
> +{
> +	return ((val) << DPU_EW_OP_VALUE_5_EW_OPERAND_5__SHIFT) & DPU_EW_OP_VALUE_5_EW_OPERAND_5__MASK;
> +}
> +
> +#define REG_DPU_EW_OP_VALUE_6					0x000040a8
> +#define DPU_EW_OP_VALUE_6_EW_OPERAND_6__MASK			0xffffffff
> +#define DPU_EW_OP_VALUE_6_EW_OPERAND_6__SHIFT			0
> +static inline uint32_t DPU_EW_OP_VALUE_6_EW_OPERAND_6(uint32_t val)
> +{
> +	return ((val) << DPU_EW_OP_VALUE_6_EW_OPERAND_6__SHIFT) & DPU_EW_OP_VALUE_6_EW_OPERAND_6__MASK;
> +}
> +
> +#define REG_DPU_EW_OP_VALUE_7					0x000040ac
> +#define DPU_EW_OP_VALUE_7_EW_OPERAND_7__MASK			0xffffffff
> +#define DPU_EW_OP_VALUE_7_EW_OPERAND_7__SHIFT			0
> +static inline uint32_t DPU_EW_OP_VALUE_7_EW_OPERAND_7(uint32_t val)
> +{
> +	return ((val) << DPU_EW_OP_VALUE_7_EW_OPERAND_7__SHIFT) & DPU_EW_OP_VALUE_7_EW_OPERAND_7__MASK;
> +}
> +
> +#define REG_DPU_SURFACE_ADD					0x000040c0
> +#define DPU_SURFACE_ADD_SURF_ADD__MASK				0xfffffff0
> +#define DPU_SURFACE_ADD_SURF_ADD__SHIFT				4
> +static inline uint32_t DPU_SURFACE_ADD_SURF_ADD(uint32_t val)
> +{
> +	return ((val) << DPU_SURFACE_ADD_SURF_ADD__SHIFT) & DPU_SURFACE_ADD_SURF_ADD__MASK;
> +}
> +#define DPU_SURFACE_ADD_RESERVED_0__MASK			0x0000000f
> +#define DPU_SURFACE_ADD_RESERVED_0__SHIFT			0
> +static inline uint32_t DPU_SURFACE_ADD_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_SURFACE_ADD_RESERVED_0__SHIFT) & DPU_SURFACE_ADD_RESERVED_0__MASK;
> +}
> +
> +#define REG_DPU_LUT_ACCESS_CFG					0x00004100
> +#define DPU_LUT_ACCESS_CFG_RESERVED_0__MASK			0xfffc0000
> +#define DPU_LUT_ACCESS_CFG_RESERVED_0__SHIFT			18
> +static inline uint32_t DPU_LUT_ACCESS_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_ACCESS_CFG_RESERVED_0__SHIFT) & DPU_LUT_ACCESS_CFG_RESERVED_0__MASK;
> +}
> +#define DPU_LUT_ACCESS_CFG_LUT_ACCESS_TYPE__MASK		0x00020000
> +#define DPU_LUT_ACCESS_CFG_LUT_ACCESS_TYPE__SHIFT		17
> +static inline uint32_t DPU_LUT_ACCESS_CFG_LUT_ACCESS_TYPE(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_ACCESS_CFG_LUT_ACCESS_TYPE__SHIFT) & DPU_LUT_ACCESS_CFG_LUT_ACCESS_TYPE__MASK;
> +}
> +#define DPU_LUT_ACCESS_CFG_LUT_TABLE_ID__MASK			0x00010000
> +#define DPU_LUT_ACCESS_CFG_LUT_TABLE_ID__SHIFT			16
> +static inline uint32_t DPU_LUT_ACCESS_CFG_LUT_TABLE_ID(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_ACCESS_CFG_LUT_TABLE_ID__SHIFT) & DPU_LUT_ACCESS_CFG_LUT_TABLE_ID__MASK;
> +}
> +#define DPU_LUT_ACCESS_CFG_RESERVED_1__MASK			0x0000fc00
> +#define DPU_LUT_ACCESS_CFG_RESERVED_1__SHIFT			10
> +static inline uint32_t DPU_LUT_ACCESS_CFG_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_ACCESS_CFG_RESERVED_1__SHIFT) & DPU_LUT_ACCESS_CFG_RESERVED_1__MASK;
> +}
> +#define DPU_LUT_ACCESS_CFG_LUT_ADDR__MASK			0x000003ff
> +#define DPU_LUT_ACCESS_CFG_LUT_ADDR__SHIFT			0
> +static inline uint32_t DPU_LUT_ACCESS_CFG_LUT_ADDR(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_ACCESS_CFG_LUT_ADDR__SHIFT) & DPU_LUT_ACCESS_CFG_LUT_ADDR__MASK;
> +}
> +
> +#define REG_DPU_LUT_ACCESS_DATA					0x00004104
> +#define DPU_LUT_ACCESS_DATA_RESERVED_0__MASK			0xffff0000
> +#define DPU_LUT_ACCESS_DATA_RESERVED_0__SHIFT			16
> +static inline uint32_t DPU_LUT_ACCESS_DATA_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_ACCESS_DATA_RESERVED_0__SHIFT) & DPU_LUT_ACCESS_DATA_RESERVED_0__MASK;
> +}
> +#define DPU_LUT_ACCESS_DATA_LUT_ACCESS_DATA__MASK		0x0000ffff
> +#define DPU_LUT_ACCESS_DATA_LUT_ACCESS_DATA__SHIFT		0
> +static inline uint32_t DPU_LUT_ACCESS_DATA_LUT_ACCESS_DATA(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_ACCESS_DATA_LUT_ACCESS_DATA__SHIFT) & DPU_LUT_ACCESS_DATA_LUT_ACCESS_DATA__MASK;
> +}
> +
> +#define REG_DPU_LUT_CFG						0x00004108
> +#define DPU_LUT_CFG_RESERVED_0__MASK				0xffffff00
> +#define DPU_LUT_CFG_RESERVED_0__SHIFT				8
> +static inline uint32_t DPU_LUT_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_CFG_RESERVED_0__SHIFT) & DPU_LUT_CFG_RESERVED_0__MASK;
> +}
> +#define DPU_LUT_CFG_LUT_CAL_SEL__MASK				0x00000080
> +#define DPU_LUT_CFG_LUT_CAL_SEL__SHIFT				7
> +static inline uint32_t DPU_LUT_CFG_LUT_CAL_SEL(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_CFG_LUT_CAL_SEL__SHIFT) & DPU_LUT_CFG_LUT_CAL_SEL__MASK;
> +}
> +#define DPU_LUT_CFG_LUT_HYBRID_PRIORITY__MASK			0x00000040
> +#define DPU_LUT_CFG_LUT_HYBRID_PRIORITY__SHIFT			6
> +static inline uint32_t DPU_LUT_CFG_LUT_HYBRID_PRIORITY(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_CFG_LUT_HYBRID_PRIORITY__SHIFT) & DPU_LUT_CFG_LUT_HYBRID_PRIORITY__MASK;
> +}
> +#define DPU_LUT_CFG_LUT_OFLOW_PRIORITY__MASK			0x00000020
> +#define DPU_LUT_CFG_LUT_OFLOW_PRIORITY__SHIFT			5
> +static inline uint32_t DPU_LUT_CFG_LUT_OFLOW_PRIORITY(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_CFG_LUT_OFLOW_PRIORITY__SHIFT) & DPU_LUT_CFG_LUT_OFLOW_PRIORITY__MASK;
> +}
> +#define DPU_LUT_CFG_LUT_UFLOW_PRIORITY__MASK			0x00000010
> +#define DPU_LUT_CFG_LUT_UFLOW_PRIORITY__SHIFT			4
> +static inline uint32_t DPU_LUT_CFG_LUT_UFLOW_PRIORITY(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_CFG_LUT_UFLOW_PRIORITY__SHIFT) & DPU_LUT_CFG_LUT_UFLOW_PRIORITY__MASK;
> +}
> +#define DPU_LUT_CFG_LUT_LO_LE_MUX__MASK				0x0000000c
> +#define DPU_LUT_CFG_LUT_LO_LE_MUX__SHIFT			2
> +static inline uint32_t DPU_LUT_CFG_LUT_LO_LE_MUX(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_CFG_LUT_LO_LE_MUX__SHIFT) & DPU_LUT_CFG_LUT_LO_LE_MUX__MASK;
> +}
> +#define DPU_LUT_CFG_LUT_EXPAND_EN__MASK				0x00000002
> +#define DPU_LUT_CFG_LUT_EXPAND_EN__SHIFT			1
> +static inline uint32_t DPU_LUT_CFG_LUT_EXPAND_EN(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_CFG_LUT_EXPAND_EN__SHIFT) & DPU_LUT_CFG_LUT_EXPAND_EN__MASK;
> +}
> +#define DPU_LUT_CFG_LUT_ROAD_SEL__MASK				0x00000001
> +#define DPU_LUT_CFG_LUT_ROAD_SEL__SHIFT				0
> +static inline uint32_t DPU_LUT_CFG_LUT_ROAD_SEL(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_CFG_LUT_ROAD_SEL__SHIFT) & DPU_LUT_CFG_LUT_ROAD_SEL__MASK;
> +}
> +
> +#define REG_DPU_LUT_INFO					0x0000410c
> +#define DPU_LUT_INFO_RESERVED_0__MASK				0xff000000
> +#define DPU_LUT_INFO_RESERVED_0__SHIFT				24
> +static inline uint32_t DPU_LUT_INFO_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_INFO_RESERVED_0__SHIFT) & DPU_LUT_INFO_RESERVED_0__MASK;
> +}
> +#define DPU_LUT_INFO_LUT_LO_INDEX_SELECT__MASK			0x00ff0000
> +#define DPU_LUT_INFO_LUT_LO_INDEX_SELECT__SHIFT			16
> +static inline uint32_t DPU_LUT_INFO_LUT_LO_INDEX_SELECT(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_INFO_LUT_LO_INDEX_SELECT__SHIFT) & DPU_LUT_INFO_LUT_LO_INDEX_SELECT__MASK;
> +}
> +#define DPU_LUT_INFO_LUT_LE_INDEX_SELECT__MASK			0x0000ff00
> +#define DPU_LUT_INFO_LUT_LE_INDEX_SELECT__SHIFT			8
> +static inline uint32_t DPU_LUT_INFO_LUT_LE_INDEX_SELECT(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_INFO_LUT_LE_INDEX_SELECT__SHIFT) & DPU_LUT_INFO_LUT_LE_INDEX_SELECT__MASK;
> +}
> +#define DPU_LUT_INFO_RESERVED_1__MASK				0x000000ff
> +#define DPU_LUT_INFO_RESERVED_1__SHIFT				0
> +static inline uint32_t DPU_LUT_INFO_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_INFO_RESERVED_1__SHIFT) & DPU_LUT_INFO_RESERVED_1__MASK;
> +}
> +
> +#define REG_DPU_LUT_LE_START					0x00004110
> +#define DPU_LUT_LE_START_LUT_LE_START__MASK			0xffffffff
> +#define DPU_LUT_LE_START_LUT_LE_START__SHIFT			0
> +static inline uint32_t DPU_LUT_LE_START_LUT_LE_START(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_LE_START_LUT_LE_START__SHIFT) & DPU_LUT_LE_START_LUT_LE_START__MASK;
> +}
> +
> +#define REG_DPU_LUT_LE_END					0x00004114
> +#define DPU_LUT_LE_END_LUT_LE_END__MASK				0xffffffff
> +#define DPU_LUT_LE_END_LUT_LE_END__SHIFT			0
> +static inline uint32_t DPU_LUT_LE_END_LUT_LE_END(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_LE_END_LUT_LE_END__SHIFT) & DPU_LUT_LE_END_LUT_LE_END__MASK;
> +}
> +
> +#define REG_DPU_LUT_LO_START					0x00004118
> +#define DPU_LUT_LO_START_LUT_LO_START__MASK			0xffffffff
> +#define DPU_LUT_LO_START_LUT_LO_START__SHIFT			0
> +static inline uint32_t DPU_LUT_LO_START_LUT_LO_START(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_LO_START_LUT_LO_START__SHIFT) & DPU_LUT_LO_START_LUT_LO_START__MASK;
> +}
> +
> +#define REG_DPU_LUT_LO_END					0x0000411c
> +#define DPU_LUT_LO_END_LUT_LO_END__MASK				0xffffffff
> +#define DPU_LUT_LO_END_LUT_LO_END__SHIFT			0
> +static inline uint32_t DPU_LUT_LO_END_LUT_LO_END(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_LO_END_LUT_LO_END__SHIFT) & DPU_LUT_LO_END_LUT_LO_END__MASK;
> +}
> +
> +#define REG_DPU_LUT_LE_SLOPE_SCALE				0x00004120
> +#define DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_OFLOW_SCALE__MASK	0xffff0000
> +#define DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_OFLOW_SCALE__SHIFT	16
> +static inline uint32_t DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_OFLOW_SCALE(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_OFLOW_SCALE__SHIFT) & DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_OFLOW_SCALE__MASK;
> +}
> +#define DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_UFLOW_SCALE__MASK	0x0000ffff
> +#define DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_UFLOW_SCALE__SHIFT	0
> +static inline uint32_t DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_UFLOW_SCALE(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_UFLOW_SCALE__SHIFT) & DPU_LUT_LE_SLOPE_SCALE_LUT_LE_SLOPE_UFLOW_SCALE__MASK;
> +}
> +
> +#define REG_DPU_LUT_LE_SLOPE_SHIFT				0x00004124
> +#define DPU_LUT_LE_SLOPE_SHIFT_RESERVED_0__MASK			0xfffffc00
> +#define DPU_LUT_LE_SLOPE_SHIFT_RESERVED_0__SHIFT		10
> +static inline uint32_t DPU_LUT_LE_SLOPE_SHIFT_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_LE_SLOPE_SHIFT_RESERVED_0__SHIFT) & DPU_LUT_LE_SLOPE_SHIFT_RESERVED_0__MASK;
> +}
> +#define DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_OFLOW_SHIFT__MASK	0x000003e0
> +#define DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_OFLOW_SHIFT__SHIFT	5
> +static inline uint32_t DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_OFLOW_SHIFT(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_OFLOW_SHIFT__SHIFT) & DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_OFLOW_SHIFT__MASK;
> +}
> +#define DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_UFLOW_SHIFT__MASK	0x0000001f
> +#define DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_UFLOW_SHIFT__SHIFT	0
> +static inline uint32_t DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_UFLOW_SHIFT(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_UFLOW_SHIFT__SHIFT) & DPU_LUT_LE_SLOPE_SHIFT_LUT_LE_SLOPE_UFLOW_SHIFT__MASK;
> +}
> +
> +#define REG_DPU_LUT_LO_SLOPE_SCALE				0x00004128
> +#define DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_OFLOW_SCALE__MASK	0xffff0000
> +#define DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_OFLOW_SCALE__SHIFT	16
> +static inline uint32_t DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_OFLOW_SCALE(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_OFLOW_SCALE__SHIFT) & DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_OFLOW_SCALE__MASK;
> +}
> +#define DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_UFLOW_SCALE__MASK	0x0000ffff
> +#define DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_UFLOW_SCALE__SHIFT	0
> +static inline uint32_t DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_UFLOW_SCALE(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_UFLOW_SCALE__SHIFT) & DPU_LUT_LO_SLOPE_SCALE_LUT_LO_SLOPE_UFLOW_SCALE__MASK;
> +}
> +
> +#define REG_DPU_LUT_LO_SLOPE_SHIFT				0x0000412c
> +#define DPU_LUT_LO_SLOPE_SHIFT_RESERVED_0__MASK			0xfffffc00
> +#define DPU_LUT_LO_SLOPE_SHIFT_RESERVED_0__SHIFT		10
> +static inline uint32_t DPU_LUT_LO_SLOPE_SHIFT_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_LO_SLOPE_SHIFT_RESERVED_0__SHIFT) & DPU_LUT_LO_SLOPE_SHIFT_RESERVED_0__MASK;
> +}
> +#define DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_OFLOW_SHIFT__MASK	0x000003e0
> +#define DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_OFLOW_SHIFT__SHIFT	5
> +static inline uint32_t DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_OFLOW_SHIFT(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_OFLOW_SHIFT__SHIFT) & DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_OFLOW_SHIFT__MASK;
> +}
> +#define DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_UFLOW_SHIFT__MASK	0x0000001f
> +#define DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_UFLOW_SHIFT__SHIFT	0
> +static inline uint32_t DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_UFLOW_SHIFT(uint32_t val)
> +{
> +	return ((val) << DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_UFLOW_SHIFT__SHIFT) & DPU_LUT_LO_SLOPE_SHIFT_LUT_LO_SLOPE_UFLOW_SHIFT__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_S_STATUS				0x00005000
> +#define DPU_RDMA_RDMA_S_STATUS_RESERVED_0__MASK			0xfffc0000
> +#define DPU_RDMA_RDMA_S_STATUS_RESERVED_0__SHIFT		18
> +static inline uint32_t DPU_RDMA_RDMA_S_STATUS_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_S_STATUS_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_S_STATUS_RESERVED_0__MASK;
> +}
> +#define DPU_RDMA_RDMA_S_STATUS_STATUS_1__MASK			0x00030000
> +#define DPU_RDMA_RDMA_S_STATUS_STATUS_1__SHIFT			16
> +static inline uint32_t DPU_RDMA_RDMA_S_STATUS_STATUS_1(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_S_STATUS_STATUS_1__SHIFT) & DPU_RDMA_RDMA_S_STATUS_STATUS_1__MASK;
> +}
> +#define DPU_RDMA_RDMA_S_STATUS_RESERVED_1__MASK			0x0000fffc
> +#define DPU_RDMA_RDMA_S_STATUS_RESERVED_1__SHIFT		2
> +static inline uint32_t DPU_RDMA_RDMA_S_STATUS_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_S_STATUS_RESERVED_1__SHIFT) & DPU_RDMA_RDMA_S_STATUS_RESERVED_1__MASK;
> +}
> +#define DPU_RDMA_RDMA_S_STATUS_STATUS_0__MASK			0x00000003
> +#define DPU_RDMA_RDMA_S_STATUS_STATUS_0__SHIFT			0
> +static inline uint32_t DPU_RDMA_RDMA_S_STATUS_STATUS_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_S_STATUS_STATUS_0__SHIFT) & DPU_RDMA_RDMA_S_STATUS_STATUS_0__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_S_POINTER				0x00005004
> +#define DPU_RDMA_RDMA_S_POINTER_RESERVED_0__MASK		0xfffe0000
> +#define DPU_RDMA_RDMA_S_POINTER_RESERVED_0__SHIFT		17
> +static inline uint32_t DPU_RDMA_RDMA_S_POINTER_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_S_POINTER_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_S_POINTER_RESERVED_0__MASK;
> +}
> +#define DPU_RDMA_RDMA_S_POINTER_EXECUTER__MASK			0x00010000
> +#define DPU_RDMA_RDMA_S_POINTER_EXECUTER__SHIFT			16
> +static inline uint32_t DPU_RDMA_RDMA_S_POINTER_EXECUTER(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_S_POINTER_EXECUTER__SHIFT) & DPU_RDMA_RDMA_S_POINTER_EXECUTER__MASK;
> +}
> +#define DPU_RDMA_RDMA_S_POINTER_RESERVED_1__MASK		0x0000ffc0
> +#define DPU_RDMA_RDMA_S_POINTER_RESERVED_1__SHIFT		6
> +static inline uint32_t DPU_RDMA_RDMA_S_POINTER_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_S_POINTER_RESERVED_1__SHIFT) & DPU_RDMA_RDMA_S_POINTER_RESERVED_1__MASK;
> +}
> +#define DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__MASK		0x00000020
> +#define DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__SHIFT	5
> +static inline uint32_t DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__SHIFT) & DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__MASK;
> +}
> +#define DPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__MASK		0x00000010
> +#define DPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__SHIFT		4
> +static inline uint32_t DPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__SHIFT) & DPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__MASK;
> +}
> +#define DPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__MASK		0x00000008
> +#define DPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__SHIFT		3
> +static inline uint32_t DPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__SHIFT) & DPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__MASK;
> +}
> +#define DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__MASK		0x00000004
> +#define DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__SHIFT		2
> +static inline uint32_t DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__SHIFT) & DPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__MASK;
> +}
> +#define DPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__MASK		0x00000002
> +#define DPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__SHIFT		1
> +static inline uint32_t DPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__SHIFT) & DPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__MASK;
> +}
> +#define DPU_RDMA_RDMA_S_POINTER_POINTER__MASK			0x00000001
> +#define DPU_RDMA_RDMA_S_POINTER_POINTER__SHIFT			0
> +static inline uint32_t DPU_RDMA_RDMA_S_POINTER_POINTER(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_S_POINTER_POINTER__SHIFT) & DPU_RDMA_RDMA_S_POINTER_POINTER__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_OPERATION_ENABLE			0x00005008
> +#define DPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__MASK		0xfffffffe
> +#define DPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__SHIFT	1
> +static inline uint32_t DPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__MASK;
> +}
> +#define DPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__MASK		0x00000001
> +#define DPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__SHIFT		0
> +static inline uint32_t DPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__SHIFT) & DPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_DATA_CUBE_WIDTH			0x0000500c
> +#define DPU_RDMA_RDMA_DATA_CUBE_WIDTH_RESERVED_0__MASK		0xffffe000
> +#define DPU_RDMA_RDMA_DATA_CUBE_WIDTH_RESERVED_0__SHIFT		13
> +static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_WIDTH_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_WIDTH_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_WIDTH_RESERVED_0__MASK;
> +}
> +#define DPU_RDMA_RDMA_DATA_CUBE_WIDTH_WIDTH__MASK		0x00001fff
> +#define DPU_RDMA_RDMA_DATA_CUBE_WIDTH_WIDTH__SHIFT		0
> +static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_WIDTH_WIDTH(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_WIDTH_WIDTH__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_WIDTH_WIDTH__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_DATA_CUBE_HEIGHT			0x00005010
> +#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_0__MASK		0xe0000000
> +#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_0__SHIFT	29
> +static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_0__MASK;
> +}
> +#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_EW_LINE_NOTCH_ADDR__MASK	0x1fff0000
> +#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_EW_LINE_NOTCH_ADDR__SHIFT	16
> +static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_EW_LINE_NOTCH_ADDR(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_EW_LINE_NOTCH_ADDR__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_EW_LINE_NOTCH_ADDR__MASK;
> +}
> +#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_1__MASK		0x0000e000
> +#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_1__SHIFT	13
> +static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_1__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_RESERVED_1__MASK;
> +}
> +#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_HEIGHT__MASK		0x00001fff
> +#define DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_HEIGHT__SHIFT		0
> +static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_HEIGHT(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_HEIGHT__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_HEIGHT_HEIGHT__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_DATA_CUBE_CHANNEL			0x00005014
> +#define DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_RESERVED_0__MASK	0xffffe000
> +#define DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_RESERVED_0__SHIFT	13
> +static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_RESERVED_0__MASK;
> +}
> +#define DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_CHANNEL__MASK		0x00001fff
> +#define DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_CHANNEL__SHIFT		0
> +static inline uint32_t DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_CHANNEL(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_CHANNEL__SHIFT) & DPU_RDMA_RDMA_DATA_CUBE_CHANNEL_CHANNEL__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_SRC_BASE_ADDR				0x00005018
> +#define DPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__MASK		0xffffffff
> +#define DPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__SHIFT	0
> +static inline uint32_t DPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__SHIFT) & DPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_BRDMA_CFG				0x0000501c
> +#define DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_0__MASK		0xffffffe0
> +#define DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_0__SHIFT		5
> +static inline uint32_t DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_0__MASK;
> +}
> +#define DPU_RDMA_RDMA_BRDMA_CFG_BRDMA_DATA_USE__MASK		0x0000001e
> +#define DPU_RDMA_RDMA_BRDMA_CFG_BRDMA_DATA_USE__SHIFT		1
> +static inline uint32_t DPU_RDMA_RDMA_BRDMA_CFG_BRDMA_DATA_USE(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_BRDMA_CFG_BRDMA_DATA_USE__SHIFT) & DPU_RDMA_RDMA_BRDMA_CFG_BRDMA_DATA_USE__MASK;
> +}
> +#define DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_1__MASK		0x00000001
> +#define DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_1__SHIFT		0
> +static inline uint32_t DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_1__SHIFT) & DPU_RDMA_RDMA_BRDMA_CFG_RESERVED_1__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_BS_BASE_ADDR				0x00005020
> +#define DPU_RDMA_RDMA_BS_BASE_ADDR_BS_BASE_ADDR__MASK		0xffffffff
> +#define DPU_RDMA_RDMA_BS_BASE_ADDR_BS_BASE_ADDR__SHIFT		0
> +static inline uint32_t DPU_RDMA_RDMA_BS_BASE_ADDR_BS_BASE_ADDR(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_BS_BASE_ADDR_BS_BASE_ADDR__SHIFT) & DPU_RDMA_RDMA_BS_BASE_ADDR_BS_BASE_ADDR__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_NRDMA_CFG				0x00005028
> +#define DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_0__MASK		0xffffffe0
> +#define DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_0__SHIFT		5
> +static inline uint32_t DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_0__MASK;
> +}
> +#define DPU_RDMA_RDMA_NRDMA_CFG_NRDMA_DATA_USE__MASK		0x0000001e
> +#define DPU_RDMA_RDMA_NRDMA_CFG_NRDMA_DATA_USE__SHIFT		1
> +static inline uint32_t DPU_RDMA_RDMA_NRDMA_CFG_NRDMA_DATA_USE(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_NRDMA_CFG_NRDMA_DATA_USE__SHIFT) & DPU_RDMA_RDMA_NRDMA_CFG_NRDMA_DATA_USE__MASK;
> +}
> +#define DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_1__MASK		0x00000001
> +#define DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_1__SHIFT		0
> +static inline uint32_t DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_1__SHIFT) & DPU_RDMA_RDMA_NRDMA_CFG_RESERVED_1__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_BN_BASE_ADDR				0x0000502c
> +#define DPU_RDMA_RDMA_BN_BASE_ADDR_BN_BASE_ADDR__MASK		0xffffffff
> +#define DPU_RDMA_RDMA_BN_BASE_ADDR_BN_BASE_ADDR__SHIFT		0
> +static inline uint32_t DPU_RDMA_RDMA_BN_BASE_ADDR_BN_BASE_ADDR(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_BN_BASE_ADDR_BN_BASE_ADDR__SHIFT) & DPU_RDMA_RDMA_BN_BASE_ADDR_BN_BASE_ADDR__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_ERDMA_CFG				0x00005034
> +#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_MODE__MASK		0xc0000000
> +#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_MODE__SHIFT		30
> +static inline uint32_t DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_MODE(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_MODE__SHIFT) & DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_MODE__MASK;
> +}
> +#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_SURF_MODE__MASK		0x20000000
> +#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_SURF_MODE__SHIFT		29
> +static inline uint32_t DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_SURF_MODE(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_SURF_MODE__SHIFT) & DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_SURF_MODE__MASK;
> +}
> +#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_NONALIGN__MASK		0x10000000
> +#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_NONALIGN__SHIFT		28
> +static inline uint32_t DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_NONALIGN(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_NONALIGN__SHIFT) & DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_NONALIGN__MASK;
> +}
> +#define DPU_RDMA_RDMA_ERDMA_CFG_RESERVED_0__MASK		0x0ffffff0
> +#define DPU_RDMA_RDMA_ERDMA_CFG_RESERVED_0__SHIFT		4
> +static inline uint32_t DPU_RDMA_RDMA_ERDMA_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_ERDMA_CFG_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_ERDMA_CFG_RESERVED_0__MASK;
> +}
> +#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_SIZE__MASK		0x0000000c
> +#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_SIZE__SHIFT		2
> +static inline uint32_t DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_SIZE(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_SIZE__SHIFT) & DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DATA_SIZE__MASK;
> +}
> +#define DPU_RDMA_RDMA_ERDMA_CFG_OV4K_BYPASS__MASK		0x00000002
> +#define DPU_RDMA_RDMA_ERDMA_CFG_OV4K_BYPASS__SHIFT		1
> +static inline uint32_t DPU_RDMA_RDMA_ERDMA_CFG_OV4K_BYPASS(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_ERDMA_CFG_OV4K_BYPASS__SHIFT) & DPU_RDMA_RDMA_ERDMA_CFG_OV4K_BYPASS__MASK;
> +}
> +#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DISABLE__MASK		0x00000001
> +#define DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DISABLE__SHIFT		0
> +static inline uint32_t DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DISABLE(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DISABLE__SHIFT) & DPU_RDMA_RDMA_ERDMA_CFG_ERDMA_DISABLE__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_EW_BASE_ADDR				0x00005038
> +#define DPU_RDMA_RDMA_EW_BASE_ADDR_EW_BASE_ADDR__MASK		0xffffffff
> +#define DPU_RDMA_RDMA_EW_BASE_ADDR_EW_BASE_ADDR__SHIFT		0
> +static inline uint32_t DPU_RDMA_RDMA_EW_BASE_ADDR_EW_BASE_ADDR(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_EW_BASE_ADDR_EW_BASE_ADDR__SHIFT) & DPU_RDMA_RDMA_EW_BASE_ADDR_EW_BASE_ADDR__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_EW_SURF_STRIDE			0x00005040
> +#define DPU_RDMA_RDMA_EW_SURF_STRIDE_EW_SURF_STRIDE__MASK	0xfffffff0
> +#define DPU_RDMA_RDMA_EW_SURF_STRIDE_EW_SURF_STRIDE__SHIFT	4
> +static inline uint32_t DPU_RDMA_RDMA_EW_SURF_STRIDE_EW_SURF_STRIDE(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_EW_SURF_STRIDE_EW_SURF_STRIDE__SHIFT) & DPU_RDMA_RDMA_EW_SURF_STRIDE_EW_SURF_STRIDE__MASK;
> +}
> +#define DPU_RDMA_RDMA_EW_SURF_STRIDE_RESERVED_0__MASK		0x0000000f
> +#define DPU_RDMA_RDMA_EW_SURF_STRIDE_RESERVED_0__SHIFT		0
> +static inline uint32_t DPU_RDMA_RDMA_EW_SURF_STRIDE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_EW_SURF_STRIDE_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_EW_SURF_STRIDE_RESERVED_0__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_FEATURE_MODE_CFG			0x00005044
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_RESERVED_0__MASK		0xfffc0000
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_RESERVED_0__SHIFT	18
> +static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_RESERVED_0__MASK;
> +}
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_IN_PRECISION__MASK	0x00038000
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_IN_PRECISION__SHIFT	15
> +static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_IN_PRECISION(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_IN_PRECISION__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_IN_PRECISION__MASK;
> +}
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_BURST_LEN__MASK		0x00007800
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_BURST_LEN__SHIFT		11
> +static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_BURST_LEN(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_BURST_LEN__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_BURST_LEN__MASK;
> +}
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_COMB_USE__MASK		0x00000700
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_COMB_USE__SHIFT		8
> +static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_COMB_USE(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_COMB_USE__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_COMB_USE__MASK;
> +}
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_PROC_PRECISION__MASK	0x000000e0
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_PROC_PRECISION__SHIFT	5
> +static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_PROC_PRECISION(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_PROC_PRECISION__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_PROC_PRECISION__MASK;
> +}
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_DISABLE__MASK	0x00000010
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_DISABLE__SHIFT	4
> +static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_DISABLE(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_DISABLE__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_DISABLE__MASK;
> +}
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_FP16TOFP32_EN__MASK	0x00000008
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_FP16TOFP32_EN__SHIFT	3
> +static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_FP16TOFP32_EN(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_FP16TOFP32_EN__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_MRDMA_FP16TOFP32_EN__MASK;
> +}
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_CONV_MODE__MASK		0x00000006
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_CONV_MODE__SHIFT		1
> +static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_CONV_MODE(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_CONV_MODE__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_CONV_MODE__MASK;
> +}
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_FLYING_MODE__MASK	0x00000001
> +#define DPU_RDMA_RDMA_FEATURE_MODE_CFG_FLYING_MODE__SHIFT	0
> +static inline uint32_t DPU_RDMA_RDMA_FEATURE_MODE_CFG_FLYING_MODE(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_FEATURE_MODE_CFG_FLYING_MODE__SHIFT) & DPU_RDMA_RDMA_FEATURE_MODE_CFG_FLYING_MODE__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_SRC_DMA_CFG				0x00005048
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_LINE_NOTCH_ADDR__MASK		0xfff80000
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_LINE_NOTCH_ADDR__SHIFT	19
> +static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_LINE_NOTCH_ADDR(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_LINE_NOTCH_ADDR__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_LINE_NOTCH_ADDR__MASK;
> +}
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_RESERVED_0__MASK		0x0007c000
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_RESERVED_0__SHIFT		14
> +static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_RESERVED_0__MASK;
> +}
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_POOLING_METHOD__MASK		0x00002000
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_POOLING_METHOD__SHIFT		13
> +static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_POOLING_METHOD(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_POOLING_METHOD__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_POOLING_METHOD__MASK;
> +}
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_UNPOOLING_EN__MASK		0x00001000
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_UNPOOLING_EN__SHIFT		12
> +static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_UNPOOLING_EN(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_UNPOOLING_EN__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_UNPOOLING_EN__MASK;
> +}
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_HEIGHT__MASK	0x00000e00
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_HEIGHT__SHIFT	9
> +static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_HEIGHT(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_HEIGHT__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_HEIGHT__MASK;
> +}
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_WIDTH__MASK	0x000001c0
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_WIDTH__SHIFT	6
> +static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_WIDTH(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_WIDTH__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_STRIDE_WIDTH__MASK;
> +}
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_HEIGHT__MASK		0x00000038
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_HEIGHT__SHIFT		3
> +static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_HEIGHT(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_HEIGHT__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_HEIGHT__MASK;
> +}
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_WIDTH__MASK		0x00000007
> +#define DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_WIDTH__SHIFT		0
> +static inline uint32_t DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_WIDTH(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_WIDTH__SHIFT) & DPU_RDMA_RDMA_SRC_DMA_CFG_KERNEL_WIDTH__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_SURF_NOTCH				0x0000504c
> +#define DPU_RDMA_RDMA_SURF_NOTCH_SURF_NOTCH_ADDR__MASK		0xfffffff0
> +#define DPU_RDMA_RDMA_SURF_NOTCH_SURF_NOTCH_ADDR__SHIFT		4
> +static inline uint32_t DPU_RDMA_RDMA_SURF_NOTCH_SURF_NOTCH_ADDR(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_SURF_NOTCH_SURF_NOTCH_ADDR__SHIFT) & DPU_RDMA_RDMA_SURF_NOTCH_SURF_NOTCH_ADDR__MASK;
> +}
> +#define DPU_RDMA_RDMA_SURF_NOTCH_RESERVED_0__MASK		0x0000000f
> +#define DPU_RDMA_RDMA_SURF_NOTCH_RESERVED_0__SHIFT		0
> +static inline uint32_t DPU_RDMA_RDMA_SURF_NOTCH_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_SURF_NOTCH_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_SURF_NOTCH_RESERVED_0__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_PAD_CFG				0x00005064
> +#define DPU_RDMA_RDMA_PAD_CFG_PAD_VALUE__MASK			0xffff0000
> +#define DPU_RDMA_RDMA_PAD_CFG_PAD_VALUE__SHIFT			16
> +static inline uint32_t DPU_RDMA_RDMA_PAD_CFG_PAD_VALUE(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_PAD_CFG_PAD_VALUE__SHIFT) & DPU_RDMA_RDMA_PAD_CFG_PAD_VALUE__MASK;
> +}
> +#define DPU_RDMA_RDMA_PAD_CFG_RESERVED_0__MASK			0x0000ff80
> +#define DPU_RDMA_RDMA_PAD_CFG_RESERVED_0__SHIFT			7
> +static inline uint32_t DPU_RDMA_RDMA_PAD_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_PAD_CFG_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_PAD_CFG_RESERVED_0__MASK;
> +}
> +#define DPU_RDMA_RDMA_PAD_CFG_PAD_TOP__MASK			0x00000070
> +#define DPU_RDMA_RDMA_PAD_CFG_PAD_TOP__SHIFT			4
> +static inline uint32_t DPU_RDMA_RDMA_PAD_CFG_PAD_TOP(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_PAD_CFG_PAD_TOP__SHIFT) & DPU_RDMA_RDMA_PAD_CFG_PAD_TOP__MASK;
> +}
> +#define DPU_RDMA_RDMA_PAD_CFG_RESERVED_1__MASK			0x00000008
> +#define DPU_RDMA_RDMA_PAD_CFG_RESERVED_1__SHIFT			3
> +static inline uint32_t DPU_RDMA_RDMA_PAD_CFG_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_PAD_CFG_RESERVED_1__SHIFT) & DPU_RDMA_RDMA_PAD_CFG_RESERVED_1__MASK;
> +}
> +#define DPU_RDMA_RDMA_PAD_CFG_PAD_LEFT__MASK			0x00000007
> +#define DPU_RDMA_RDMA_PAD_CFG_PAD_LEFT__SHIFT			0
> +static inline uint32_t DPU_RDMA_RDMA_PAD_CFG_PAD_LEFT(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_PAD_CFG_PAD_LEFT__SHIFT) & DPU_RDMA_RDMA_PAD_CFG_PAD_LEFT__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_WEIGHT				0x00005068
> +#define DPU_RDMA_RDMA_WEIGHT_E_WEIGHT__MASK			0xff000000
> +#define DPU_RDMA_RDMA_WEIGHT_E_WEIGHT__SHIFT			24
> +static inline uint32_t DPU_RDMA_RDMA_WEIGHT_E_WEIGHT(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_WEIGHT_E_WEIGHT__SHIFT) & DPU_RDMA_RDMA_WEIGHT_E_WEIGHT__MASK;
> +}
> +#define DPU_RDMA_RDMA_WEIGHT_N_WEIGHT__MASK			0x00ff0000
> +#define DPU_RDMA_RDMA_WEIGHT_N_WEIGHT__SHIFT			16
> +static inline uint32_t DPU_RDMA_RDMA_WEIGHT_N_WEIGHT(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_WEIGHT_N_WEIGHT__SHIFT) & DPU_RDMA_RDMA_WEIGHT_N_WEIGHT__MASK;
> +}
> +#define DPU_RDMA_RDMA_WEIGHT_B_WEIGHT__MASK			0x0000ff00
> +#define DPU_RDMA_RDMA_WEIGHT_B_WEIGHT__SHIFT			8
> +static inline uint32_t DPU_RDMA_RDMA_WEIGHT_B_WEIGHT(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_WEIGHT_B_WEIGHT__SHIFT) & DPU_RDMA_RDMA_WEIGHT_B_WEIGHT__MASK;
> +}
> +#define DPU_RDMA_RDMA_WEIGHT_M_WEIGHT__MASK			0x000000ff
> +#define DPU_RDMA_RDMA_WEIGHT_M_WEIGHT__SHIFT			0
> +static inline uint32_t DPU_RDMA_RDMA_WEIGHT_M_WEIGHT(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_WEIGHT_M_WEIGHT__SHIFT) & DPU_RDMA_RDMA_WEIGHT_M_WEIGHT__MASK;
> +}
> +
> +#define REG_DPU_RDMA_RDMA_EW_SURF_NOTCH				0x0000506c
> +#define DPU_RDMA_RDMA_EW_SURF_NOTCH_EW_SURF_NOTCH__MASK		0xfffffff0
> +#define DPU_RDMA_RDMA_EW_SURF_NOTCH_EW_SURF_NOTCH__SHIFT	4
> +static inline uint32_t DPU_RDMA_RDMA_EW_SURF_NOTCH_EW_SURF_NOTCH(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_EW_SURF_NOTCH_EW_SURF_NOTCH__SHIFT) & DPU_RDMA_RDMA_EW_SURF_NOTCH_EW_SURF_NOTCH__MASK;
> +}
> +#define DPU_RDMA_RDMA_EW_SURF_NOTCH_RESERVED_0__MASK		0x0000000f
> +#define DPU_RDMA_RDMA_EW_SURF_NOTCH_RESERVED_0__SHIFT		0
> +static inline uint32_t DPU_RDMA_RDMA_EW_SURF_NOTCH_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DPU_RDMA_RDMA_EW_SURF_NOTCH_RESERVED_0__SHIFT) & DPU_RDMA_RDMA_EW_SURF_NOTCH_RESERVED_0__MASK;
> +}
> +
> +#define REG_PPU_S_STATUS					0x00006000
> +#define PPU_S_STATUS_RESERVED_0__MASK				0xfffc0000
> +#define PPU_S_STATUS_RESERVED_0__SHIFT				18
> +static inline uint32_t PPU_S_STATUS_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_S_STATUS_RESERVED_0__SHIFT) & PPU_S_STATUS_RESERVED_0__MASK;
> +}
> +#define PPU_S_STATUS_STATUS_1__MASK				0x00030000
> +#define PPU_S_STATUS_STATUS_1__SHIFT				16
> +static inline uint32_t PPU_S_STATUS_STATUS_1(uint32_t val)
> +{
> +	return ((val) << PPU_S_STATUS_STATUS_1__SHIFT) & PPU_S_STATUS_STATUS_1__MASK;
> +}
> +#define PPU_S_STATUS_RESERVED_1__MASK				0x0000fffc
> +#define PPU_S_STATUS_RESERVED_1__SHIFT				2
> +static inline uint32_t PPU_S_STATUS_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << PPU_S_STATUS_RESERVED_1__SHIFT) & PPU_S_STATUS_RESERVED_1__MASK;
> +}
> +#define PPU_S_STATUS_STATUS_0__MASK				0x00000003
> +#define PPU_S_STATUS_STATUS_0__SHIFT				0
> +static inline uint32_t PPU_S_STATUS_STATUS_0(uint32_t val)
> +{
> +	return ((val) << PPU_S_STATUS_STATUS_0__SHIFT) & PPU_S_STATUS_STATUS_0__MASK;
> +}
> +
> +#define REG_PPU_S_POINTER					0x00006004
> +#define PPU_S_POINTER_RESERVED_0__MASK				0xfffe0000
> +#define PPU_S_POINTER_RESERVED_0__SHIFT				17
> +static inline uint32_t PPU_S_POINTER_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_S_POINTER_RESERVED_0__SHIFT) & PPU_S_POINTER_RESERVED_0__MASK;
> +}
> +#define PPU_S_POINTER_EXECUTER__MASK				0x00010000
> +#define PPU_S_POINTER_EXECUTER__SHIFT				16
> +static inline uint32_t PPU_S_POINTER_EXECUTER(uint32_t val)
> +{
> +	return ((val) << PPU_S_POINTER_EXECUTER__SHIFT) & PPU_S_POINTER_EXECUTER__MASK;
> +}
> +#define PPU_S_POINTER_RESERVED_1__MASK				0x0000ffc0
> +#define PPU_S_POINTER_RESERVED_1__SHIFT				6
> +static inline uint32_t PPU_S_POINTER_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << PPU_S_POINTER_RESERVED_1__SHIFT) & PPU_S_POINTER_RESERVED_1__MASK;
> +}
> +#define PPU_S_POINTER_EXECUTER_PP_CLEAR__MASK			0x00000020
> +#define PPU_S_POINTER_EXECUTER_PP_CLEAR__SHIFT			5
> +static inline uint32_t PPU_S_POINTER_EXECUTER_PP_CLEAR(uint32_t val)
> +{
> +	return ((val) << PPU_S_POINTER_EXECUTER_PP_CLEAR__SHIFT) & PPU_S_POINTER_EXECUTER_PP_CLEAR__MASK;
> +}
> +#define PPU_S_POINTER_POINTER_PP_CLEAR__MASK			0x00000010
> +#define PPU_S_POINTER_POINTER_PP_CLEAR__SHIFT			4
> +static inline uint32_t PPU_S_POINTER_POINTER_PP_CLEAR(uint32_t val)
> +{
> +	return ((val) << PPU_S_POINTER_POINTER_PP_CLEAR__SHIFT) & PPU_S_POINTER_POINTER_PP_CLEAR__MASK;
> +}
> +#define PPU_S_POINTER_POINTER_PP_MODE__MASK			0x00000008
> +#define PPU_S_POINTER_POINTER_PP_MODE__SHIFT			3
> +static inline uint32_t PPU_S_POINTER_POINTER_PP_MODE(uint32_t val)
> +{
> +	return ((val) << PPU_S_POINTER_POINTER_PP_MODE__SHIFT) & PPU_S_POINTER_POINTER_PP_MODE__MASK;
> +}
> +#define PPU_S_POINTER_EXECUTER_PP_EN__MASK			0x00000004
> +#define PPU_S_POINTER_EXECUTER_PP_EN__SHIFT			2
> +static inline uint32_t PPU_S_POINTER_EXECUTER_PP_EN(uint32_t val)
> +{
> +	return ((val) << PPU_S_POINTER_EXECUTER_PP_EN__SHIFT) & PPU_S_POINTER_EXECUTER_PP_EN__MASK;
> +}
> +#define PPU_S_POINTER_POINTER_PP_EN__MASK			0x00000002
> +#define PPU_S_POINTER_POINTER_PP_EN__SHIFT			1
> +static inline uint32_t PPU_S_POINTER_POINTER_PP_EN(uint32_t val)
> +{
> +	return ((val) << PPU_S_POINTER_POINTER_PP_EN__SHIFT) & PPU_S_POINTER_POINTER_PP_EN__MASK;
> +}
> +#define PPU_S_POINTER_POINTER__MASK				0x00000001
> +#define PPU_S_POINTER_POINTER__SHIFT				0
> +static inline uint32_t PPU_S_POINTER_POINTER(uint32_t val)
> +{
> +	return ((val) << PPU_S_POINTER_POINTER__SHIFT) & PPU_S_POINTER_POINTER__MASK;
> +}
> +
> +#define REG_PPU_OPERATION_ENABLE				0x00006008
> +#define PPU_OPERATION_ENABLE_RESERVED_0__MASK			0xfffffffe
> +#define PPU_OPERATION_ENABLE_RESERVED_0__SHIFT			1
> +static inline uint32_t PPU_OPERATION_ENABLE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_OPERATION_ENABLE_RESERVED_0__SHIFT) & PPU_OPERATION_ENABLE_RESERVED_0__MASK;
> +}
> +#define PPU_OPERATION_ENABLE_OP_EN__MASK			0x00000001
> +#define PPU_OPERATION_ENABLE_OP_EN__SHIFT			0
> +static inline uint32_t PPU_OPERATION_ENABLE_OP_EN(uint32_t val)
> +{
> +	return ((val) << PPU_OPERATION_ENABLE_OP_EN__SHIFT) & PPU_OPERATION_ENABLE_OP_EN__MASK;
> +}
> +
> +#define REG_PPU_DATA_CUBE_IN_WIDTH				0x0000600c
> +#define PPU_DATA_CUBE_IN_WIDTH_RESERVED_0__MASK			0xffffe000
> +#define PPU_DATA_CUBE_IN_WIDTH_RESERVED_0__SHIFT		13
> +static inline uint32_t PPU_DATA_CUBE_IN_WIDTH_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_DATA_CUBE_IN_WIDTH_RESERVED_0__SHIFT) & PPU_DATA_CUBE_IN_WIDTH_RESERVED_0__MASK;
> +}
> +#define PPU_DATA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__MASK		0x00001fff
> +#define PPU_DATA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__SHIFT		0
> +static inline uint32_t PPU_DATA_CUBE_IN_WIDTH_CUBE_IN_WIDTH(uint32_t val)
> +{
> +	return ((val) << PPU_DATA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__SHIFT) & PPU_DATA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__MASK;
> +}
> +
> +#define REG_PPU_DATA_CUBE_IN_HEIGHT				0x00006010
> +#define PPU_DATA_CUBE_IN_HEIGHT_RESERVED_0__MASK		0xffffe000
> +#define PPU_DATA_CUBE_IN_HEIGHT_RESERVED_0__SHIFT		13
> +static inline uint32_t PPU_DATA_CUBE_IN_HEIGHT_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_DATA_CUBE_IN_HEIGHT_RESERVED_0__SHIFT) & PPU_DATA_CUBE_IN_HEIGHT_RESERVED_0__MASK;
> +}
> +#define PPU_DATA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__MASK		0x00001fff
> +#define PPU_DATA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__SHIFT		0
> +static inline uint32_t PPU_DATA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT(uint32_t val)
> +{
> +	return ((val) << PPU_DATA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__SHIFT) & PPU_DATA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__MASK;
> +}
> +
> +#define REG_PPU_DATA_CUBE_IN_CHANNEL				0x00006014
> +#define PPU_DATA_CUBE_IN_CHANNEL_RESERVED_0__MASK		0xffffe000
> +#define PPU_DATA_CUBE_IN_CHANNEL_RESERVED_0__SHIFT		13
> +static inline uint32_t PPU_DATA_CUBE_IN_CHANNEL_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_DATA_CUBE_IN_CHANNEL_RESERVED_0__SHIFT) & PPU_DATA_CUBE_IN_CHANNEL_RESERVED_0__MASK;
> +}
> +#define PPU_DATA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__MASK		0x00001fff
> +#define PPU_DATA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__SHIFT		0
> +static inline uint32_t PPU_DATA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL(uint32_t val)
> +{
> +	return ((val) << PPU_DATA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__SHIFT) & PPU_DATA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__MASK;
> +}
> +
> +#define REG_PPU_DATA_CUBE_OUT_WIDTH				0x00006018
> +#define PPU_DATA_CUBE_OUT_WIDTH_RESERVED_0__MASK		0xffffe000
> +#define PPU_DATA_CUBE_OUT_WIDTH_RESERVED_0__SHIFT		13
> +static inline uint32_t PPU_DATA_CUBE_OUT_WIDTH_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_DATA_CUBE_OUT_WIDTH_RESERVED_0__SHIFT) & PPU_DATA_CUBE_OUT_WIDTH_RESERVED_0__MASK;
> +}
> +#define PPU_DATA_CUBE_OUT_WIDTH_CUBE_OUT_WIDTH__MASK		0x00001fff
> +#define PPU_DATA_CUBE_OUT_WIDTH_CUBE_OUT_WIDTH__SHIFT		0
> +static inline uint32_t PPU_DATA_CUBE_OUT_WIDTH_CUBE_OUT_WIDTH(uint32_t val)
> +{
> +	return ((val) << PPU_DATA_CUBE_OUT_WIDTH_CUBE_OUT_WIDTH__SHIFT) & PPU_DATA_CUBE_OUT_WIDTH_CUBE_OUT_WIDTH__MASK;
> +}
> +
> +#define REG_PPU_DATA_CUBE_OUT_HEIGHT				0x0000601c
> +#define PPU_DATA_CUBE_OUT_HEIGHT_RESERVED_0__MASK		0xffffe000
> +#define PPU_DATA_CUBE_OUT_HEIGHT_RESERVED_0__SHIFT		13
> +static inline uint32_t PPU_DATA_CUBE_OUT_HEIGHT_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_DATA_CUBE_OUT_HEIGHT_RESERVED_0__SHIFT) & PPU_DATA_CUBE_OUT_HEIGHT_RESERVED_0__MASK;
> +}
> +#define PPU_DATA_CUBE_OUT_HEIGHT_CUBE_OUT_HEIGHT__MASK		0x00001fff
> +#define PPU_DATA_CUBE_OUT_HEIGHT_CUBE_OUT_HEIGHT__SHIFT		0
> +static inline uint32_t PPU_DATA_CUBE_OUT_HEIGHT_CUBE_OUT_HEIGHT(uint32_t val)
> +{
> +	return ((val) << PPU_DATA_CUBE_OUT_HEIGHT_CUBE_OUT_HEIGHT__SHIFT) & PPU_DATA_CUBE_OUT_HEIGHT_CUBE_OUT_HEIGHT__MASK;
> +}
> +
> +#define REG_PPU_DATA_CUBE_OUT_CHANNEL				0x00006020
> +#define PPU_DATA_CUBE_OUT_CHANNEL_RESERVED_0__MASK		0xffffe000
> +#define PPU_DATA_CUBE_OUT_CHANNEL_RESERVED_0__SHIFT		13
> +static inline uint32_t PPU_DATA_CUBE_OUT_CHANNEL_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_DATA_CUBE_OUT_CHANNEL_RESERVED_0__SHIFT) & PPU_DATA_CUBE_OUT_CHANNEL_RESERVED_0__MASK;
> +}
> +#define PPU_DATA_CUBE_OUT_CHANNEL_CUBE_OUT_CHANNEL__MASK	0x00001fff
> +#define PPU_DATA_CUBE_OUT_CHANNEL_CUBE_OUT_CHANNEL__SHIFT	0
> +static inline uint32_t PPU_DATA_CUBE_OUT_CHANNEL_CUBE_OUT_CHANNEL(uint32_t val)
> +{
> +	return ((val) << PPU_DATA_CUBE_OUT_CHANNEL_CUBE_OUT_CHANNEL__SHIFT) & PPU_DATA_CUBE_OUT_CHANNEL_CUBE_OUT_CHANNEL__MASK;
> +}
> +
> +#define REG_PPU_OPERATION_MODE_CFG				0x00006024
> +#define PPU_OPERATION_MODE_CFG_RESERVED_0__MASK			0x80000000
> +#define PPU_OPERATION_MODE_CFG_RESERVED_0__SHIFT		31
> +static inline uint32_t PPU_OPERATION_MODE_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_OPERATION_MODE_CFG_RESERVED_0__SHIFT) & PPU_OPERATION_MODE_CFG_RESERVED_0__MASK;
> +}
> +#define PPU_OPERATION_MODE_CFG_INDEX_EN__MASK			0x40000000
> +#define PPU_OPERATION_MODE_CFG_INDEX_EN__SHIFT			30
> +static inline uint32_t PPU_OPERATION_MODE_CFG_INDEX_EN(uint32_t val)
> +{
> +	return ((val) << PPU_OPERATION_MODE_CFG_INDEX_EN__SHIFT) & PPU_OPERATION_MODE_CFG_INDEX_EN__MASK;
> +}
> +#define PPU_OPERATION_MODE_CFG_RESERVED_1__MASK			0x20000000
> +#define PPU_OPERATION_MODE_CFG_RESERVED_1__SHIFT		29
> +static inline uint32_t PPU_OPERATION_MODE_CFG_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << PPU_OPERATION_MODE_CFG_RESERVED_1__SHIFT) & PPU_OPERATION_MODE_CFG_RESERVED_1__MASK;
> +}
> +#define PPU_OPERATION_MODE_CFG_NOTCH_ADDR__MASK			0x1fff0000
> +#define PPU_OPERATION_MODE_CFG_NOTCH_ADDR__SHIFT		16
> +static inline uint32_t PPU_OPERATION_MODE_CFG_NOTCH_ADDR(uint32_t val)
> +{
> +	return ((val) << PPU_OPERATION_MODE_CFG_NOTCH_ADDR__SHIFT) & PPU_OPERATION_MODE_CFG_NOTCH_ADDR__MASK;
> +}
> +#define PPU_OPERATION_MODE_CFG_RESERVED_2__MASK			0x0000ff00
> +#define PPU_OPERATION_MODE_CFG_RESERVED_2__SHIFT		8
> +static inline uint32_t PPU_OPERATION_MODE_CFG_RESERVED_2(uint32_t val)
> +{
> +	return ((val) << PPU_OPERATION_MODE_CFG_RESERVED_2__SHIFT) & PPU_OPERATION_MODE_CFG_RESERVED_2__MASK;
> +}
> +#define PPU_OPERATION_MODE_CFG_USE_CNT__MASK			0x000000e0
> +#define PPU_OPERATION_MODE_CFG_USE_CNT__SHIFT			5
> +static inline uint32_t PPU_OPERATION_MODE_CFG_USE_CNT(uint32_t val)
> +{
> +	return ((val) << PPU_OPERATION_MODE_CFG_USE_CNT__SHIFT) & PPU_OPERATION_MODE_CFG_USE_CNT__MASK;
> +}
> +#define PPU_OPERATION_MODE_CFG_FLYING_MODE__MASK		0x00000010
> +#define PPU_OPERATION_MODE_CFG_FLYING_MODE__SHIFT		4
> +static inline uint32_t PPU_OPERATION_MODE_CFG_FLYING_MODE(uint32_t val)
> +{
> +	return ((val) << PPU_OPERATION_MODE_CFG_FLYING_MODE__SHIFT) & PPU_OPERATION_MODE_CFG_FLYING_MODE__MASK;
> +}
> +#define PPU_OPERATION_MODE_CFG_RESERVED_3__MASK			0x0000000c
> +#define PPU_OPERATION_MODE_CFG_RESERVED_3__SHIFT		2
> +static inline uint32_t PPU_OPERATION_MODE_CFG_RESERVED_3(uint32_t val)
> +{
> +	return ((val) << PPU_OPERATION_MODE_CFG_RESERVED_3__SHIFT) & PPU_OPERATION_MODE_CFG_RESERVED_3__MASK;
> +}
> +#define PPU_OPERATION_MODE_CFG_POOLING_METHOD__MASK		0x00000003
> +#define PPU_OPERATION_MODE_CFG_POOLING_METHOD__SHIFT		0
> +static inline uint32_t PPU_OPERATION_MODE_CFG_POOLING_METHOD(uint32_t val)
> +{
> +	return ((val) << PPU_OPERATION_MODE_CFG_POOLING_METHOD__SHIFT) & PPU_OPERATION_MODE_CFG_POOLING_METHOD__MASK;
> +}
> +
> +#define REG_PPU_POOLING_KERNEL_CFG				0x00006034
> +#define PPU_POOLING_KERNEL_CFG_RESERVED_0__MASK			0xff000000
> +#define PPU_POOLING_KERNEL_CFG_RESERVED_0__SHIFT		24
> +static inline uint32_t PPU_POOLING_KERNEL_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_POOLING_KERNEL_CFG_RESERVED_0__SHIFT) & PPU_POOLING_KERNEL_CFG_RESERVED_0__MASK;
> +}
> +#define PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_HEIGHT__MASK	0x00f00000
> +#define PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_HEIGHT__SHIFT	20
> +static inline uint32_t PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_HEIGHT(uint32_t val)
> +{
> +	return ((val) << PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_HEIGHT__SHIFT) & PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_HEIGHT__MASK;
> +}
> +#define PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_WIDTH__MASK	0x000f0000
> +#define PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_WIDTH__SHIFT	16
> +static inline uint32_t PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_WIDTH(uint32_t val)
> +{
> +	return ((val) << PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_WIDTH__SHIFT) & PPU_POOLING_KERNEL_CFG_KERNEL_STRIDE_WIDTH__MASK;
> +}
> +#define PPU_POOLING_KERNEL_CFG_RESERVED_1__MASK			0x0000f000
> +#define PPU_POOLING_KERNEL_CFG_RESERVED_1__SHIFT		12
> +static inline uint32_t PPU_POOLING_KERNEL_CFG_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << PPU_POOLING_KERNEL_CFG_RESERVED_1__SHIFT) & PPU_POOLING_KERNEL_CFG_RESERVED_1__MASK;
> +}
> +#define PPU_POOLING_KERNEL_CFG_KERNEL_HEIGHT__MASK		0x00000f00
> +#define PPU_POOLING_KERNEL_CFG_KERNEL_HEIGHT__SHIFT		8
> +static inline uint32_t PPU_POOLING_KERNEL_CFG_KERNEL_HEIGHT(uint32_t val)
> +{
> +	return ((val) << PPU_POOLING_KERNEL_CFG_KERNEL_HEIGHT__SHIFT) & PPU_POOLING_KERNEL_CFG_KERNEL_HEIGHT__MASK;
> +}
> +#define PPU_POOLING_KERNEL_CFG_RESERVED_2__MASK			0x000000f0
> +#define PPU_POOLING_KERNEL_CFG_RESERVED_2__SHIFT		4
> +static inline uint32_t PPU_POOLING_KERNEL_CFG_RESERVED_2(uint32_t val)
> +{
> +	return ((val) << PPU_POOLING_KERNEL_CFG_RESERVED_2__SHIFT) & PPU_POOLING_KERNEL_CFG_RESERVED_2__MASK;
> +}
> +#define PPU_POOLING_KERNEL_CFG_KERNEL_WIDTH__MASK		0x0000000f
> +#define PPU_POOLING_KERNEL_CFG_KERNEL_WIDTH__SHIFT		0
> +static inline uint32_t PPU_POOLING_KERNEL_CFG_KERNEL_WIDTH(uint32_t val)
> +{
> +	return ((val) << PPU_POOLING_KERNEL_CFG_KERNEL_WIDTH__SHIFT) & PPU_POOLING_KERNEL_CFG_KERNEL_WIDTH__MASK;
> +}
> +
> +#define REG_PPU_RECIP_KERNEL_WIDTH				0x00006038
> +#define PPU_RECIP_KERNEL_WIDTH_RESERVED_0__MASK			0xfffe0000
> +#define PPU_RECIP_KERNEL_WIDTH_RESERVED_0__SHIFT		17
> +static inline uint32_t PPU_RECIP_KERNEL_WIDTH_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_RECIP_KERNEL_WIDTH_RESERVED_0__SHIFT) & PPU_RECIP_KERNEL_WIDTH_RESERVED_0__MASK;
> +}
> +#define PPU_RECIP_KERNEL_WIDTH_RECIP_KERNEL_WIDTH__MASK		0x0001ffff
> +#define PPU_RECIP_KERNEL_WIDTH_RECIP_KERNEL_WIDTH__SHIFT	0
> +static inline uint32_t PPU_RECIP_KERNEL_WIDTH_RECIP_KERNEL_WIDTH(uint32_t val)
> +{
> +	return ((val) << PPU_RECIP_KERNEL_WIDTH_RECIP_KERNEL_WIDTH__SHIFT) & PPU_RECIP_KERNEL_WIDTH_RECIP_KERNEL_WIDTH__MASK;
> +}
> +
> +#define REG_PPU_RECIP_KERNEL_HEIGHT				0x0000603c
> +#define PPU_RECIP_KERNEL_HEIGHT_RESERVED_0__MASK		0xfffe0000
> +#define PPU_RECIP_KERNEL_HEIGHT_RESERVED_0__SHIFT		17
> +static inline uint32_t PPU_RECIP_KERNEL_HEIGHT_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_RECIP_KERNEL_HEIGHT_RESERVED_0__SHIFT) & PPU_RECIP_KERNEL_HEIGHT_RESERVED_0__MASK;
> +}
> +#define PPU_RECIP_KERNEL_HEIGHT_RECIP_KERNEL_HEIGHT__MASK	0x0001ffff
> +#define PPU_RECIP_KERNEL_HEIGHT_RECIP_KERNEL_HEIGHT__SHIFT	0
> +static inline uint32_t PPU_RECIP_KERNEL_HEIGHT_RECIP_KERNEL_HEIGHT(uint32_t val)
> +{
> +	return ((val) << PPU_RECIP_KERNEL_HEIGHT_RECIP_KERNEL_HEIGHT__SHIFT) & PPU_RECIP_KERNEL_HEIGHT_RECIP_KERNEL_HEIGHT__MASK;
> +}
> +
> +#define REG_PPU_POOLING_PADDING_CFG				0x00006040
> +#define PPU_POOLING_PADDING_CFG_RESERVED_0__MASK		0xffff8000
> +#define PPU_POOLING_PADDING_CFG_RESERVED_0__SHIFT		15
> +static inline uint32_t PPU_POOLING_PADDING_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_POOLING_PADDING_CFG_RESERVED_0__SHIFT) & PPU_POOLING_PADDING_CFG_RESERVED_0__MASK;
> +}
> +#define PPU_POOLING_PADDING_CFG_PAD_BOTTOM__MASK		0x00007000
> +#define PPU_POOLING_PADDING_CFG_PAD_BOTTOM__SHIFT		12
> +static inline uint32_t PPU_POOLING_PADDING_CFG_PAD_BOTTOM(uint32_t val)
> +{
> +	return ((val) << PPU_POOLING_PADDING_CFG_PAD_BOTTOM__SHIFT) & PPU_POOLING_PADDING_CFG_PAD_BOTTOM__MASK;
> +}
> +#define PPU_POOLING_PADDING_CFG_RESERVED_1__MASK		0x00000800
> +#define PPU_POOLING_PADDING_CFG_RESERVED_1__SHIFT		11
> +static inline uint32_t PPU_POOLING_PADDING_CFG_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << PPU_POOLING_PADDING_CFG_RESERVED_1__SHIFT) & PPU_POOLING_PADDING_CFG_RESERVED_1__MASK;
> +}
> +#define PPU_POOLING_PADDING_CFG_PAD_RIGHT__MASK			0x00000700
> +#define PPU_POOLING_PADDING_CFG_PAD_RIGHT__SHIFT		8
> +static inline uint32_t PPU_POOLING_PADDING_CFG_PAD_RIGHT(uint32_t val)
> +{
> +	return ((val) << PPU_POOLING_PADDING_CFG_PAD_RIGHT__SHIFT) & PPU_POOLING_PADDING_CFG_PAD_RIGHT__MASK;
> +}
> +#define PPU_POOLING_PADDING_CFG_RESERVED_2__MASK		0x00000080
> +#define PPU_POOLING_PADDING_CFG_RESERVED_2__SHIFT		7
> +static inline uint32_t PPU_POOLING_PADDING_CFG_RESERVED_2(uint32_t val)
> +{
> +	return ((val) << PPU_POOLING_PADDING_CFG_RESERVED_2__SHIFT) & PPU_POOLING_PADDING_CFG_RESERVED_2__MASK;
> +}
> +#define PPU_POOLING_PADDING_CFG_PAD_TOP__MASK			0x00000070
> +#define PPU_POOLING_PADDING_CFG_PAD_TOP__SHIFT			4
> +static inline uint32_t PPU_POOLING_PADDING_CFG_PAD_TOP(uint32_t val)
> +{
> +	return ((val) << PPU_POOLING_PADDING_CFG_PAD_TOP__SHIFT) & PPU_POOLING_PADDING_CFG_PAD_TOP__MASK;
> +}
> +#define PPU_POOLING_PADDING_CFG_RESERVED_3__MASK		0x00000008
> +#define PPU_POOLING_PADDING_CFG_RESERVED_3__SHIFT		3
> +static inline uint32_t PPU_POOLING_PADDING_CFG_RESERVED_3(uint32_t val)
> +{
> +	return ((val) << PPU_POOLING_PADDING_CFG_RESERVED_3__SHIFT) & PPU_POOLING_PADDING_CFG_RESERVED_3__MASK;
> +}
> +#define PPU_POOLING_PADDING_CFG_PAD_LEFT__MASK			0x00000007
> +#define PPU_POOLING_PADDING_CFG_PAD_LEFT__SHIFT			0
> +static inline uint32_t PPU_POOLING_PADDING_CFG_PAD_LEFT(uint32_t val)
> +{
> +	return ((val) << PPU_POOLING_PADDING_CFG_PAD_LEFT__SHIFT) & PPU_POOLING_PADDING_CFG_PAD_LEFT__MASK;
> +}
> +
> +#define REG_PPU_PADDING_VALUE_1_CFG				0x00006044
> +#define PPU_PADDING_VALUE_1_CFG_PAD_VALUE_0__MASK		0xffffffff
> +#define PPU_PADDING_VALUE_1_CFG_PAD_VALUE_0__SHIFT		0
> +static inline uint32_t PPU_PADDING_VALUE_1_CFG_PAD_VALUE_0(uint32_t val)
> +{
> +	return ((val) << PPU_PADDING_VALUE_1_CFG_PAD_VALUE_0__SHIFT) & PPU_PADDING_VALUE_1_CFG_PAD_VALUE_0__MASK;
> +}
> +
> +#define REG_PPU_PADDING_VALUE_2_CFG				0x00006048
> +#define PPU_PADDING_VALUE_2_CFG_RESERVED_0__MASK		0xfffffff8
> +#define PPU_PADDING_VALUE_2_CFG_RESERVED_0__SHIFT		3
> +static inline uint32_t PPU_PADDING_VALUE_2_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_PADDING_VALUE_2_CFG_RESERVED_0__SHIFT) & PPU_PADDING_VALUE_2_CFG_RESERVED_0__MASK;
> +}
> +#define PPU_PADDING_VALUE_2_CFG_PAD_VALUE_1__MASK		0x00000007
> +#define PPU_PADDING_VALUE_2_CFG_PAD_VALUE_1__SHIFT		0
> +static inline uint32_t PPU_PADDING_VALUE_2_CFG_PAD_VALUE_1(uint32_t val)
> +{
> +	return ((val) << PPU_PADDING_VALUE_2_CFG_PAD_VALUE_1__SHIFT) & PPU_PADDING_VALUE_2_CFG_PAD_VALUE_1__MASK;
> +}
> +
> +#define REG_PPU_DST_BASE_ADDR					0x00006070
> +#define PPU_DST_BASE_ADDR_DST_BASE_ADDR__MASK			0xfffffff0
> +#define PPU_DST_BASE_ADDR_DST_BASE_ADDR__SHIFT			4
> +static inline uint32_t PPU_DST_BASE_ADDR_DST_BASE_ADDR(uint32_t val)
> +{
> +	return ((val) << PPU_DST_BASE_ADDR_DST_BASE_ADDR__SHIFT) & PPU_DST_BASE_ADDR_DST_BASE_ADDR__MASK;
> +}
> +#define PPU_DST_BASE_ADDR_RESERVED_0__MASK			0x0000000f
> +#define PPU_DST_BASE_ADDR_RESERVED_0__SHIFT			0
> +static inline uint32_t PPU_DST_BASE_ADDR_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_DST_BASE_ADDR_RESERVED_0__SHIFT) & PPU_DST_BASE_ADDR_RESERVED_0__MASK;
> +}
> +
> +#define REG_PPU_DST_SURF_STRIDE					0x0000607c
> +#define PPU_DST_SURF_STRIDE_DST_SURF_STRIDE__MASK		0xfffffff0
> +#define PPU_DST_SURF_STRIDE_DST_SURF_STRIDE__SHIFT		4
> +static inline uint32_t PPU_DST_SURF_STRIDE_DST_SURF_STRIDE(uint32_t val)
> +{
> +	return ((val) << PPU_DST_SURF_STRIDE_DST_SURF_STRIDE__SHIFT) & PPU_DST_SURF_STRIDE_DST_SURF_STRIDE__MASK;
> +}
> +#define PPU_DST_SURF_STRIDE_RESERVED_0__MASK			0x0000000f
> +#define PPU_DST_SURF_STRIDE_RESERVED_0__SHIFT			0
> +static inline uint32_t PPU_DST_SURF_STRIDE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_DST_SURF_STRIDE_RESERVED_0__SHIFT) & PPU_DST_SURF_STRIDE_RESERVED_0__MASK;
> +}
> +
> +#define REG_PPU_DATA_FORMAT					0x00006084
> +#define PPU_DATA_FORMAT_INDEX_ADD__MASK				0xfffffff0
> +#define PPU_DATA_FORMAT_INDEX_ADD__SHIFT			4
> +static inline uint32_t PPU_DATA_FORMAT_INDEX_ADD(uint32_t val)
> +{
> +	return ((val) << PPU_DATA_FORMAT_INDEX_ADD__SHIFT) & PPU_DATA_FORMAT_INDEX_ADD__MASK;
> +}
> +#define PPU_DATA_FORMAT_DPU_FLYIN__MASK				0x00000008
> +#define PPU_DATA_FORMAT_DPU_FLYIN__SHIFT			3
> +static inline uint32_t PPU_DATA_FORMAT_DPU_FLYIN(uint32_t val)
> +{
> +	return ((val) << PPU_DATA_FORMAT_DPU_FLYIN__SHIFT) & PPU_DATA_FORMAT_DPU_FLYIN__MASK;
> +}
> +#define PPU_DATA_FORMAT_PROC_PRECISION__MASK			0x00000007
> +#define PPU_DATA_FORMAT_PROC_PRECISION__SHIFT			0
> +static inline uint32_t PPU_DATA_FORMAT_PROC_PRECISION(uint32_t val)
> +{
> +	return ((val) << PPU_DATA_FORMAT_PROC_PRECISION__SHIFT) & PPU_DATA_FORMAT_PROC_PRECISION__MASK;
> +}
> +
> +#define REG_PPU_MISC_CTRL					0x000060dc
> +#define PPU_MISC_CTRL_SURF_LEN__MASK				0xffff0000
> +#define PPU_MISC_CTRL_SURF_LEN__SHIFT				16
> +static inline uint32_t PPU_MISC_CTRL_SURF_LEN(uint32_t val)
> +{
> +	return ((val) << PPU_MISC_CTRL_SURF_LEN__SHIFT) & PPU_MISC_CTRL_SURF_LEN__MASK;
> +}
> +#define PPU_MISC_CTRL_RESERVED_0__MASK				0x0000fe00
> +#define PPU_MISC_CTRL_RESERVED_0__SHIFT				9
> +static inline uint32_t PPU_MISC_CTRL_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_MISC_CTRL_RESERVED_0__SHIFT) & PPU_MISC_CTRL_RESERVED_0__MASK;
> +}
> +#define PPU_MISC_CTRL_MC_SURF_OUT__MASK				0x00000100
> +#define PPU_MISC_CTRL_MC_SURF_OUT__SHIFT			8
> +static inline uint32_t PPU_MISC_CTRL_MC_SURF_OUT(uint32_t val)
> +{
> +	return ((val) << PPU_MISC_CTRL_MC_SURF_OUT__SHIFT) & PPU_MISC_CTRL_MC_SURF_OUT__MASK;
> +}
> +#define PPU_MISC_CTRL_NONALIGN__MASK				0x00000080
> +#define PPU_MISC_CTRL_NONALIGN__SHIFT				7
> +static inline uint32_t PPU_MISC_CTRL_NONALIGN(uint32_t val)
> +{
> +	return ((val) << PPU_MISC_CTRL_NONALIGN__SHIFT) & PPU_MISC_CTRL_NONALIGN__MASK;
> +}
> +#define PPU_MISC_CTRL_RESERVED_1__MASK				0x00000070
> +#define PPU_MISC_CTRL_RESERVED_1__SHIFT				4
> +static inline uint32_t PPU_MISC_CTRL_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << PPU_MISC_CTRL_RESERVED_1__SHIFT) & PPU_MISC_CTRL_RESERVED_1__MASK;
> +}
> +#define PPU_MISC_CTRL_BURST_LEN__MASK				0x0000000f
> +#define PPU_MISC_CTRL_BURST_LEN__SHIFT				0
> +static inline uint32_t PPU_MISC_CTRL_BURST_LEN(uint32_t val)
> +{
> +	return ((val) << PPU_MISC_CTRL_BURST_LEN__SHIFT) & PPU_MISC_CTRL_BURST_LEN__MASK;
> +}
> +
> +#define REG_PPU_RDMA_RDMA_S_STATUS				0x00007000
> +#define PPU_RDMA_RDMA_S_STATUS_RESERVED_0__MASK			0xfffc0000
> +#define PPU_RDMA_RDMA_S_STATUS_RESERVED_0__SHIFT		18
> +static inline uint32_t PPU_RDMA_RDMA_S_STATUS_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_S_STATUS_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_S_STATUS_RESERVED_0__MASK;
> +}
> +#define PPU_RDMA_RDMA_S_STATUS_STATUS_1__MASK			0x00030000
> +#define PPU_RDMA_RDMA_S_STATUS_STATUS_1__SHIFT			16
> +static inline uint32_t PPU_RDMA_RDMA_S_STATUS_STATUS_1(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_S_STATUS_STATUS_1__SHIFT) & PPU_RDMA_RDMA_S_STATUS_STATUS_1__MASK;
> +}
> +#define PPU_RDMA_RDMA_S_STATUS_RESERVED_1__MASK			0x0000fffc
> +#define PPU_RDMA_RDMA_S_STATUS_RESERVED_1__SHIFT		2
> +static inline uint32_t PPU_RDMA_RDMA_S_STATUS_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_S_STATUS_RESERVED_1__SHIFT) & PPU_RDMA_RDMA_S_STATUS_RESERVED_1__MASK;
> +}
> +#define PPU_RDMA_RDMA_S_STATUS_STATUS_0__MASK			0x00000003
> +#define PPU_RDMA_RDMA_S_STATUS_STATUS_0__SHIFT			0
> +static inline uint32_t PPU_RDMA_RDMA_S_STATUS_STATUS_0(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_S_STATUS_STATUS_0__SHIFT) & PPU_RDMA_RDMA_S_STATUS_STATUS_0__MASK;
> +}
> +
> +#define REG_PPU_RDMA_RDMA_S_POINTER				0x00007004
> +#define PPU_RDMA_RDMA_S_POINTER_RESERVED_0__MASK		0xfffe0000
> +#define PPU_RDMA_RDMA_S_POINTER_RESERVED_0__SHIFT		17
> +static inline uint32_t PPU_RDMA_RDMA_S_POINTER_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_S_POINTER_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_S_POINTER_RESERVED_0__MASK;
> +}
> +#define PPU_RDMA_RDMA_S_POINTER_EXECUTER__MASK			0x00010000
> +#define PPU_RDMA_RDMA_S_POINTER_EXECUTER__SHIFT			16
> +static inline uint32_t PPU_RDMA_RDMA_S_POINTER_EXECUTER(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_S_POINTER_EXECUTER__SHIFT) & PPU_RDMA_RDMA_S_POINTER_EXECUTER__MASK;
> +}
> +#define PPU_RDMA_RDMA_S_POINTER_RESERVED_1__MASK		0x0000ffc0
> +#define PPU_RDMA_RDMA_S_POINTER_RESERVED_1__SHIFT		6
> +static inline uint32_t PPU_RDMA_RDMA_S_POINTER_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_S_POINTER_RESERVED_1__SHIFT) & PPU_RDMA_RDMA_S_POINTER_RESERVED_1__MASK;
> +}
> +#define PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__MASK		0x00000020
> +#define PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__SHIFT	5
> +static inline uint32_t PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__SHIFT) & PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_CLEAR__MASK;
> +}
> +#define PPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__MASK		0x00000010
> +#define PPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__SHIFT		4
> +static inline uint32_t PPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__SHIFT) & PPU_RDMA_RDMA_S_POINTER_POINTER_PP_CLEAR__MASK;
> +}
> +#define PPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__MASK		0x00000008
> +#define PPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__SHIFT		3
> +static inline uint32_t PPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__SHIFT) & PPU_RDMA_RDMA_S_POINTER_POINTER_PP_MODE__MASK;
> +}
> +#define PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__MASK		0x00000004
> +#define PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__SHIFT		2
> +static inline uint32_t PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__SHIFT) & PPU_RDMA_RDMA_S_POINTER_EXECUTER_PP_EN__MASK;
> +}
> +#define PPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__MASK		0x00000002
> +#define PPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__SHIFT		1
> +static inline uint32_t PPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__SHIFT) & PPU_RDMA_RDMA_S_POINTER_POINTER_PP_EN__MASK;
> +}
> +#define PPU_RDMA_RDMA_S_POINTER_POINTER__MASK			0x00000001
> +#define PPU_RDMA_RDMA_S_POINTER_POINTER__SHIFT			0
> +static inline uint32_t PPU_RDMA_RDMA_S_POINTER_POINTER(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_S_POINTER_POINTER__SHIFT) & PPU_RDMA_RDMA_S_POINTER_POINTER__MASK;
> +}
> +
> +#define REG_PPU_RDMA_RDMA_OPERATION_ENABLE			0x00007008
> +#define PPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__MASK		0xfffffffe
> +#define PPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__SHIFT	1
> +static inline uint32_t PPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_OPERATION_ENABLE_RESERVED_0__MASK;
> +}
> +#define PPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__MASK		0x00000001
> +#define PPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__SHIFT		0
> +static inline uint32_t PPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__SHIFT) & PPU_RDMA_RDMA_OPERATION_ENABLE_OP_EN__MASK;
> +}
> +
> +#define REG_PPU_RDMA_RDMA_CUBE_IN_WIDTH				0x0000700c
> +#define PPU_RDMA_RDMA_CUBE_IN_WIDTH_RESERVED_0__MASK		0xffffe000
> +#define PPU_RDMA_RDMA_CUBE_IN_WIDTH_RESERVED_0__SHIFT		13
> +static inline uint32_t PPU_RDMA_RDMA_CUBE_IN_WIDTH_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_CUBE_IN_WIDTH_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_CUBE_IN_WIDTH_RESERVED_0__MASK;
> +}
> +#define PPU_RDMA_RDMA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__MASK		0x00001fff
> +#define PPU_RDMA_RDMA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__SHIFT	0
> +static inline uint32_t PPU_RDMA_RDMA_CUBE_IN_WIDTH_CUBE_IN_WIDTH(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__SHIFT) & PPU_RDMA_RDMA_CUBE_IN_WIDTH_CUBE_IN_WIDTH__MASK;
> +}
> +
> +#define REG_PPU_RDMA_RDMA_CUBE_IN_HEIGHT			0x00007010
> +#define PPU_RDMA_RDMA_CUBE_IN_HEIGHT_RESERVED_0__MASK		0xffffe000
> +#define PPU_RDMA_RDMA_CUBE_IN_HEIGHT_RESERVED_0__SHIFT		13
> +static inline uint32_t PPU_RDMA_RDMA_CUBE_IN_HEIGHT_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_CUBE_IN_HEIGHT_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_CUBE_IN_HEIGHT_RESERVED_0__MASK;
> +}
> +#define PPU_RDMA_RDMA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__MASK	0x00001fff
> +#define PPU_RDMA_RDMA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__SHIFT	0
> +static inline uint32_t PPU_RDMA_RDMA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__SHIFT) & PPU_RDMA_RDMA_CUBE_IN_HEIGHT_CUBE_IN_HEIGHT__MASK;
> +}
> +
> +#define REG_PPU_RDMA_RDMA_CUBE_IN_CHANNEL			0x00007014
> +#define PPU_RDMA_RDMA_CUBE_IN_CHANNEL_RESERVED_0__MASK		0xffffe000
> +#define PPU_RDMA_RDMA_CUBE_IN_CHANNEL_RESERVED_0__SHIFT		13
> +static inline uint32_t PPU_RDMA_RDMA_CUBE_IN_CHANNEL_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_CUBE_IN_CHANNEL_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_CUBE_IN_CHANNEL_RESERVED_0__MASK;
> +}
> +#define PPU_RDMA_RDMA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__MASK	0x00001fff
> +#define PPU_RDMA_RDMA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__SHIFT	0
> +static inline uint32_t PPU_RDMA_RDMA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__SHIFT) & PPU_RDMA_RDMA_CUBE_IN_CHANNEL_CUBE_IN_CHANNEL__MASK;
> +}
> +
> +#define REG_PPU_RDMA_RDMA_SRC_BASE_ADDR				0x0000701c
> +#define PPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__MASK		0xffffffff
> +#define PPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__SHIFT	0
> +static inline uint32_t PPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__SHIFT) & PPU_RDMA_RDMA_SRC_BASE_ADDR_SRC_BASE_ADDR__MASK;
> +}
> +
> +#define REG_PPU_RDMA_RDMA_SRC_LINE_STRIDE			0x00007024
> +#define PPU_RDMA_RDMA_SRC_LINE_STRIDE_SRC_LINE_STRIDE__MASK	0xfffffff0
> +#define PPU_RDMA_RDMA_SRC_LINE_STRIDE_SRC_LINE_STRIDE__SHIFT	4
> +static inline uint32_t PPU_RDMA_RDMA_SRC_LINE_STRIDE_SRC_LINE_STRIDE(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_SRC_LINE_STRIDE_SRC_LINE_STRIDE__SHIFT) & PPU_RDMA_RDMA_SRC_LINE_STRIDE_SRC_LINE_STRIDE__MASK;
> +}
> +#define PPU_RDMA_RDMA_SRC_LINE_STRIDE_RESERVED_0__MASK		0x0000000f
> +#define PPU_RDMA_RDMA_SRC_LINE_STRIDE_RESERVED_0__SHIFT		0
> +static inline uint32_t PPU_RDMA_RDMA_SRC_LINE_STRIDE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_SRC_LINE_STRIDE_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_SRC_LINE_STRIDE_RESERVED_0__MASK;
> +}
> +
> +#define REG_PPU_RDMA_RDMA_SRC_SURF_STRIDE			0x00007028
> +#define PPU_RDMA_RDMA_SRC_SURF_STRIDE_SRC_SURF_STRIDE__MASK	0xfffffff0
> +#define PPU_RDMA_RDMA_SRC_SURF_STRIDE_SRC_SURF_STRIDE__SHIFT	4
> +static inline uint32_t PPU_RDMA_RDMA_SRC_SURF_STRIDE_SRC_SURF_STRIDE(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_SRC_SURF_STRIDE_SRC_SURF_STRIDE__SHIFT) & PPU_RDMA_RDMA_SRC_SURF_STRIDE_SRC_SURF_STRIDE__MASK;
> +}
> +#define PPU_RDMA_RDMA_SRC_SURF_STRIDE_RESERVED_0__MASK		0x0000000f
> +#define PPU_RDMA_RDMA_SRC_SURF_STRIDE_RESERVED_0__SHIFT		0
> +static inline uint32_t PPU_RDMA_RDMA_SRC_SURF_STRIDE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_SRC_SURF_STRIDE_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_SRC_SURF_STRIDE_RESERVED_0__MASK;
> +}
> +
> +#define REG_PPU_RDMA_RDMA_DATA_FORMAT				0x00007030
> +#define PPU_RDMA_RDMA_DATA_FORMAT_RESERVED_0__MASK		0xfffffffc
> +#define PPU_RDMA_RDMA_DATA_FORMAT_RESERVED_0__SHIFT		2
> +static inline uint32_t PPU_RDMA_RDMA_DATA_FORMAT_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_DATA_FORMAT_RESERVED_0__SHIFT) & PPU_RDMA_RDMA_DATA_FORMAT_RESERVED_0__MASK;
> +}
> +#define PPU_RDMA_RDMA_DATA_FORMAT_IN_PRECISION__MASK		0x00000003
> +#define PPU_RDMA_RDMA_DATA_FORMAT_IN_PRECISION__SHIFT		0
> +static inline uint32_t PPU_RDMA_RDMA_DATA_FORMAT_IN_PRECISION(uint32_t val)
> +{
> +	return ((val) << PPU_RDMA_RDMA_DATA_FORMAT_IN_PRECISION__SHIFT) & PPU_RDMA_RDMA_DATA_FORMAT_IN_PRECISION__MASK;
> +}
> +
> +#define REG_DDMA_CFG_OUTSTANDING				0x00008000
> +#define DDMA_CFG_OUTSTANDING_RESERVED_0__MASK			0xffff0000
> +#define DDMA_CFG_OUTSTANDING_RESERVED_0__SHIFT			16
> +static inline uint32_t DDMA_CFG_OUTSTANDING_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_OUTSTANDING_RESERVED_0__SHIFT) & DDMA_CFG_OUTSTANDING_RESERVED_0__MASK;
> +}
> +#define DDMA_CFG_OUTSTANDING_WR_OS_CNT__MASK			0x0000ff00
> +#define DDMA_CFG_OUTSTANDING_WR_OS_CNT__SHIFT			8
> +static inline uint32_t DDMA_CFG_OUTSTANDING_WR_OS_CNT(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_OUTSTANDING_WR_OS_CNT__SHIFT) & DDMA_CFG_OUTSTANDING_WR_OS_CNT__MASK;
> +}
> +#define DDMA_CFG_OUTSTANDING_RD_OS_CNT__MASK			0x000000ff
> +#define DDMA_CFG_OUTSTANDING_RD_OS_CNT__SHIFT			0
> +static inline uint32_t DDMA_CFG_OUTSTANDING_RD_OS_CNT(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_OUTSTANDING_RD_OS_CNT__SHIFT) & DDMA_CFG_OUTSTANDING_RD_OS_CNT__MASK;
> +}
> +
> +#define REG_DDMA_RD_WEIGHT_0					0x00008004
> +#define DDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__MASK			0xff000000
> +#define DDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__SHIFT			24
> +static inline uint32_t DDMA_RD_WEIGHT_0_RD_WEIGHT_PDP(uint32_t val)
> +{
> +	return ((val) << DDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__SHIFT) & DDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__MASK;
> +}
> +#define DDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__MASK			0x00ff0000
> +#define DDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__SHIFT			16
> +static inline uint32_t DDMA_RD_WEIGHT_0_RD_WEIGHT_DPU(uint32_t val)
> +{
> +	return ((val) << DDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__SHIFT) & DDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__MASK;
> +}
> +#define DDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__MASK			0x0000ff00
> +#define DDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__SHIFT		8
> +static inline uint32_t DDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL(uint32_t val)
> +{
> +	return ((val) << DDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__SHIFT) & DDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__MASK;
> +}
> +#define DDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__MASK		0x000000ff
> +#define DDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__SHIFT		0
> +static inline uint32_t DDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE(uint32_t val)
> +{
> +	return ((val) << DDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__SHIFT) & DDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__MASK;
> +}
> +
> +#define REG_DDMA_WR_WEIGHT_0					0x00008008
> +#define DDMA_WR_WEIGHT_0_RESERVED_0__MASK			0xffff0000
> +#define DDMA_WR_WEIGHT_0_RESERVED_0__SHIFT			16
> +static inline uint32_t DDMA_WR_WEIGHT_0_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DDMA_WR_WEIGHT_0_RESERVED_0__SHIFT) & DDMA_WR_WEIGHT_0_RESERVED_0__MASK;
> +}
> +#define DDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__MASK			0x0000ff00
> +#define DDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__SHIFT			8
> +static inline uint32_t DDMA_WR_WEIGHT_0_WR_WEIGHT_PDP(uint32_t val)
> +{
> +	return ((val) << DDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__SHIFT) & DDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__MASK;
> +}
> +#define DDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__MASK			0x000000ff
> +#define DDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__SHIFT			0
> +static inline uint32_t DDMA_WR_WEIGHT_0_WR_WEIGHT_DPU(uint32_t val)
> +{
> +	return ((val) << DDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__SHIFT) & DDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__MASK;
> +}
> +
> +#define REG_DDMA_CFG_ID_ERROR					0x0000800c
> +#define DDMA_CFG_ID_ERROR_RESERVED_0__MASK			0xfffffc00
> +#define DDMA_CFG_ID_ERROR_RESERVED_0__SHIFT			10
> +static inline uint32_t DDMA_CFG_ID_ERROR_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_ID_ERROR_RESERVED_0__SHIFT) & DDMA_CFG_ID_ERROR_RESERVED_0__MASK;
> +}
> +#define DDMA_CFG_ID_ERROR_WR_RESP_ID__MASK			0x000003c0
> +#define DDMA_CFG_ID_ERROR_WR_RESP_ID__SHIFT			6
> +static inline uint32_t DDMA_CFG_ID_ERROR_WR_RESP_ID(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_ID_ERROR_WR_RESP_ID__SHIFT) & DDMA_CFG_ID_ERROR_WR_RESP_ID__MASK;
> +}
> +#define DDMA_CFG_ID_ERROR_RESERVED_1__MASK			0x00000020
> +#define DDMA_CFG_ID_ERROR_RESERVED_1__SHIFT			5
> +static inline uint32_t DDMA_CFG_ID_ERROR_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_ID_ERROR_RESERVED_1__SHIFT) & DDMA_CFG_ID_ERROR_RESERVED_1__MASK;
> +}
> +#define DDMA_CFG_ID_ERROR_RD_RESP_ID__MASK			0x0000001f
> +#define DDMA_CFG_ID_ERROR_RD_RESP_ID__SHIFT			0
> +static inline uint32_t DDMA_CFG_ID_ERROR_RD_RESP_ID(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_ID_ERROR_RD_RESP_ID__SHIFT) & DDMA_CFG_ID_ERROR_RD_RESP_ID__MASK;
> +}
> +
> +#define REG_DDMA_RD_WEIGHT_1					0x00008010
> +#define DDMA_RD_WEIGHT_1_RESERVED_0__MASK			0xffffff00
> +#define DDMA_RD_WEIGHT_1_RESERVED_0__SHIFT			8
> +static inline uint32_t DDMA_RD_WEIGHT_1_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DDMA_RD_WEIGHT_1_RESERVED_0__SHIFT) & DDMA_RD_WEIGHT_1_RESERVED_0__MASK;
> +}
> +#define DDMA_RD_WEIGHT_1_RD_WEIGHT_PC__MASK			0x000000ff
> +#define DDMA_RD_WEIGHT_1_RD_WEIGHT_PC__SHIFT			0
> +static inline uint32_t DDMA_RD_WEIGHT_1_RD_WEIGHT_PC(uint32_t val)
> +{
> +	return ((val) << DDMA_RD_WEIGHT_1_RD_WEIGHT_PC__SHIFT) & DDMA_RD_WEIGHT_1_RD_WEIGHT_PC__MASK;
> +}
> +
> +#define REG_DDMA_CFG_DMA_FIFO_CLR				0x00008014
> +#define DDMA_CFG_DMA_FIFO_CLR_RESERVED_0__MASK			0xfffffffe
> +#define DDMA_CFG_DMA_FIFO_CLR_RESERVED_0__SHIFT			1
> +static inline uint32_t DDMA_CFG_DMA_FIFO_CLR_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_FIFO_CLR_RESERVED_0__SHIFT) & DDMA_CFG_DMA_FIFO_CLR_RESERVED_0__MASK;
> +}
> +#define DDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__MASK		0x00000001
> +#define DDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__SHIFT		0
> +static inline uint32_t DDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__SHIFT) & DDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__MASK;
> +}
> +
> +#define REG_DDMA_CFG_DMA_ARB					0x00008018
> +#define DDMA_CFG_DMA_ARB_RESERVED_0__MASK			0xfffffc00
> +#define DDMA_CFG_DMA_ARB_RESERVED_0__SHIFT			10
> +static inline uint32_t DDMA_CFG_DMA_ARB_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_ARB_RESERVED_0__SHIFT) & DDMA_CFG_DMA_ARB_RESERVED_0__MASK;
> +}
> +#define DDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__MASK			0x00000200
> +#define DDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__SHIFT			9
> +static inline uint32_t DDMA_CFG_DMA_ARB_WR_ARBIT_MODEL(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__SHIFT) & DDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__MASK;
> +}
> +#define DDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__MASK			0x00000100
> +#define DDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__SHIFT			8
> +static inline uint32_t DDMA_CFG_DMA_ARB_RD_ARBIT_MODEL(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__SHIFT) & DDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__MASK;
> +}
> +#define DDMA_CFG_DMA_ARB_RESERVED_1__MASK			0x00000080
> +#define DDMA_CFG_DMA_ARB_RESERVED_1__SHIFT			7
> +static inline uint32_t DDMA_CFG_DMA_ARB_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_ARB_RESERVED_1__SHIFT) & DDMA_CFG_DMA_ARB_RESERVED_1__MASK;
> +}
> +#define DDMA_CFG_DMA_ARB_WR_FIX_ARB__MASK			0x00000070
> +#define DDMA_CFG_DMA_ARB_WR_FIX_ARB__SHIFT			4
> +static inline uint32_t DDMA_CFG_DMA_ARB_WR_FIX_ARB(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_ARB_WR_FIX_ARB__SHIFT) & DDMA_CFG_DMA_ARB_WR_FIX_ARB__MASK;
> +}
> +#define DDMA_CFG_DMA_ARB_RESERVED_2__MASK			0x00000008
> +#define DDMA_CFG_DMA_ARB_RESERVED_2__SHIFT			3
> +static inline uint32_t DDMA_CFG_DMA_ARB_RESERVED_2(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_ARB_RESERVED_2__SHIFT) & DDMA_CFG_DMA_ARB_RESERVED_2__MASK;
> +}
> +#define DDMA_CFG_DMA_ARB_RD_FIX_ARB__MASK			0x00000007
> +#define DDMA_CFG_DMA_ARB_RD_FIX_ARB__SHIFT			0
> +static inline uint32_t DDMA_CFG_DMA_ARB_RD_FIX_ARB(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_ARB_RD_FIX_ARB__SHIFT) & DDMA_CFG_DMA_ARB_RD_FIX_ARB__MASK;
> +}
> +
> +#define REG_DDMA_CFG_DMA_RD_QOS					0x00008020
> +#define DDMA_CFG_DMA_RD_QOS_RESERVED_0__MASK			0xfffffc00
> +#define DDMA_CFG_DMA_RD_QOS_RESERVED_0__SHIFT			10
> +static inline uint32_t DDMA_CFG_DMA_RD_QOS_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_RD_QOS_RESERVED_0__SHIFT) & DDMA_CFG_DMA_RD_QOS_RESERVED_0__MASK;
> +}
> +#define DDMA_CFG_DMA_RD_QOS_RD_PC_QOS__MASK			0x00000300
> +#define DDMA_CFG_DMA_RD_QOS_RD_PC_QOS__SHIFT			8
> +static inline uint32_t DDMA_CFG_DMA_RD_QOS_RD_PC_QOS(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_RD_QOS_RD_PC_QOS__SHIFT) & DDMA_CFG_DMA_RD_QOS_RD_PC_QOS__MASK;
> +}
> +#define DDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__MASK			0x000000c0
> +#define DDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__SHIFT			6
> +static inline uint32_t DDMA_CFG_DMA_RD_QOS_RD_PPU_QOS(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__SHIFT) & DDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__MASK;
> +}
> +#define DDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__MASK			0x00000030
> +#define DDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__SHIFT			4
> +static inline uint32_t DDMA_CFG_DMA_RD_QOS_RD_DPU_QOS(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__SHIFT) & DDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__MASK;
> +}
> +#define DDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__MASK			0x0000000c
> +#define DDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__SHIFT		2
> +static inline uint32_t DDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__SHIFT) & DDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__MASK;
> +}
> +#define DDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__MASK		0x00000003
> +#define DDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__SHIFT		0
> +static inline uint32_t DDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__SHIFT) & DDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__MASK;
> +}
> +
> +#define REG_DDMA_CFG_DMA_RD_CFG					0x00008024
> +#define DDMA_CFG_DMA_RD_CFG_RESERVED_0__MASK			0xffffe000
> +#define DDMA_CFG_DMA_RD_CFG_RESERVED_0__SHIFT			13
> +static inline uint32_t DDMA_CFG_DMA_RD_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_RD_CFG_RESERVED_0__SHIFT) & DDMA_CFG_DMA_RD_CFG_RESERVED_0__MASK;
> +}
> +#define DDMA_CFG_DMA_RD_CFG_RD_ARLOCK__MASK			0x00001000
> +#define DDMA_CFG_DMA_RD_CFG_RD_ARLOCK__SHIFT			12
> +static inline uint32_t DDMA_CFG_DMA_RD_CFG_RD_ARLOCK(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_RD_CFG_RD_ARLOCK__SHIFT) & DDMA_CFG_DMA_RD_CFG_RD_ARLOCK__MASK;
> +}
> +#define DDMA_CFG_DMA_RD_CFG_RD_ARCACHE__MASK			0x00000f00
> +#define DDMA_CFG_DMA_RD_CFG_RD_ARCACHE__SHIFT			8
> +static inline uint32_t DDMA_CFG_DMA_RD_CFG_RD_ARCACHE(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_RD_CFG_RD_ARCACHE__SHIFT) & DDMA_CFG_DMA_RD_CFG_RD_ARCACHE__MASK;
> +}
> +#define DDMA_CFG_DMA_RD_CFG_RD_ARPROT__MASK			0x000000e0
> +#define DDMA_CFG_DMA_RD_CFG_RD_ARPROT__SHIFT			5
> +static inline uint32_t DDMA_CFG_DMA_RD_CFG_RD_ARPROT(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_RD_CFG_RD_ARPROT__SHIFT) & DDMA_CFG_DMA_RD_CFG_RD_ARPROT__MASK;
> +}
> +#define DDMA_CFG_DMA_RD_CFG_RD_ARBURST__MASK			0x00000018
> +#define DDMA_CFG_DMA_RD_CFG_RD_ARBURST__SHIFT			3
> +static inline uint32_t DDMA_CFG_DMA_RD_CFG_RD_ARBURST(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_RD_CFG_RD_ARBURST__SHIFT) & DDMA_CFG_DMA_RD_CFG_RD_ARBURST__MASK;
> +}
> +#define DDMA_CFG_DMA_RD_CFG_RD_ARSIZE__MASK			0x00000007
> +#define DDMA_CFG_DMA_RD_CFG_RD_ARSIZE__SHIFT			0
> +static inline uint32_t DDMA_CFG_DMA_RD_CFG_RD_ARSIZE(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_RD_CFG_RD_ARSIZE__SHIFT) & DDMA_CFG_DMA_RD_CFG_RD_ARSIZE__MASK;
> +}
> +
> +#define REG_DDMA_CFG_DMA_WR_CFG					0x00008028
> +#define DDMA_CFG_DMA_WR_CFG_RESERVED_0__MASK			0xffffe000
> +#define DDMA_CFG_DMA_WR_CFG_RESERVED_0__SHIFT			13
> +static inline uint32_t DDMA_CFG_DMA_WR_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_WR_CFG_RESERVED_0__SHIFT) & DDMA_CFG_DMA_WR_CFG_RESERVED_0__MASK;
> +}
> +#define DDMA_CFG_DMA_WR_CFG_WR_AWLOCK__MASK			0x00001000
> +#define DDMA_CFG_DMA_WR_CFG_WR_AWLOCK__SHIFT			12
> +static inline uint32_t DDMA_CFG_DMA_WR_CFG_WR_AWLOCK(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_WR_CFG_WR_AWLOCK__SHIFT) & DDMA_CFG_DMA_WR_CFG_WR_AWLOCK__MASK;
> +}
> +#define DDMA_CFG_DMA_WR_CFG_WR_AWCACHE__MASK			0x00000f00
> +#define DDMA_CFG_DMA_WR_CFG_WR_AWCACHE__SHIFT			8
> +static inline uint32_t DDMA_CFG_DMA_WR_CFG_WR_AWCACHE(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_WR_CFG_WR_AWCACHE__SHIFT) & DDMA_CFG_DMA_WR_CFG_WR_AWCACHE__MASK;
> +}
> +#define DDMA_CFG_DMA_WR_CFG_WR_AWPROT__MASK			0x000000e0
> +#define DDMA_CFG_DMA_WR_CFG_WR_AWPROT__SHIFT			5
> +static inline uint32_t DDMA_CFG_DMA_WR_CFG_WR_AWPROT(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_WR_CFG_WR_AWPROT__SHIFT) & DDMA_CFG_DMA_WR_CFG_WR_AWPROT__MASK;
> +}
> +#define DDMA_CFG_DMA_WR_CFG_WR_AWBURST__MASK			0x00000018
> +#define DDMA_CFG_DMA_WR_CFG_WR_AWBURST__SHIFT			3
> +static inline uint32_t DDMA_CFG_DMA_WR_CFG_WR_AWBURST(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_WR_CFG_WR_AWBURST__SHIFT) & DDMA_CFG_DMA_WR_CFG_WR_AWBURST__MASK;
> +}
> +#define DDMA_CFG_DMA_WR_CFG_WR_AWSIZE__MASK			0x00000007
> +#define DDMA_CFG_DMA_WR_CFG_WR_AWSIZE__SHIFT			0
> +static inline uint32_t DDMA_CFG_DMA_WR_CFG_WR_AWSIZE(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_WR_CFG_WR_AWSIZE__SHIFT) & DDMA_CFG_DMA_WR_CFG_WR_AWSIZE__MASK;
> +}
> +
> +#define REG_DDMA_CFG_DMA_WSTRB					0x0000802c
> +#define DDMA_CFG_DMA_WSTRB_WR_WSTRB__MASK			0xffffffff
> +#define DDMA_CFG_DMA_WSTRB_WR_WSTRB__SHIFT			0
> +static inline uint32_t DDMA_CFG_DMA_WSTRB_WR_WSTRB(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_DMA_WSTRB_WR_WSTRB__SHIFT) & DDMA_CFG_DMA_WSTRB_WR_WSTRB__MASK;
> +}
> +
> +#define REG_DDMA_CFG_STATUS					0x00008030
> +#define DDMA_CFG_STATUS_RESERVED_0__MASK			0xfffffe00
> +#define DDMA_CFG_STATUS_RESERVED_0__SHIFT			9
> +static inline uint32_t DDMA_CFG_STATUS_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_STATUS_RESERVED_0__SHIFT) & DDMA_CFG_STATUS_RESERVED_0__MASK;
> +}
> +#define DDMA_CFG_STATUS_IDEL__MASK				0x00000100
> +#define DDMA_CFG_STATUS_IDEL__SHIFT				8
> +static inline uint32_t DDMA_CFG_STATUS_IDEL(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_STATUS_IDEL__SHIFT) & DDMA_CFG_STATUS_IDEL__MASK;
> +}
> +#define DDMA_CFG_STATUS_RESERVED_1__MASK			0x000000ff
> +#define DDMA_CFG_STATUS_RESERVED_1__SHIFT			0
> +static inline uint32_t DDMA_CFG_STATUS_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << DDMA_CFG_STATUS_RESERVED_1__SHIFT) & DDMA_CFG_STATUS_RESERVED_1__MASK;
> +}
> +
> +#define REG_SDMA_CFG_OUTSTANDING				0x00009000
> +#define SDMA_CFG_OUTSTANDING_RESERVED_0__MASK			0xffff0000
> +#define SDMA_CFG_OUTSTANDING_RESERVED_0__SHIFT			16
> +static inline uint32_t SDMA_CFG_OUTSTANDING_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_OUTSTANDING_RESERVED_0__SHIFT) & SDMA_CFG_OUTSTANDING_RESERVED_0__MASK;
> +}
> +#define SDMA_CFG_OUTSTANDING_WR_OS_CNT__MASK			0x0000ff00
> +#define SDMA_CFG_OUTSTANDING_WR_OS_CNT__SHIFT			8
> +static inline uint32_t SDMA_CFG_OUTSTANDING_WR_OS_CNT(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_OUTSTANDING_WR_OS_CNT__SHIFT) & SDMA_CFG_OUTSTANDING_WR_OS_CNT__MASK;
> +}
> +#define SDMA_CFG_OUTSTANDING_RD_OS_CNT__MASK			0x000000ff
> +#define SDMA_CFG_OUTSTANDING_RD_OS_CNT__SHIFT			0
> +static inline uint32_t SDMA_CFG_OUTSTANDING_RD_OS_CNT(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_OUTSTANDING_RD_OS_CNT__SHIFT) & SDMA_CFG_OUTSTANDING_RD_OS_CNT__MASK;
> +}
> +
> +#define REG_SDMA_RD_WEIGHT_0					0x00009004
> +#define SDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__MASK			0xff000000
> +#define SDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__SHIFT			24
> +static inline uint32_t SDMA_RD_WEIGHT_0_RD_WEIGHT_PDP(uint32_t val)
> +{
> +	return ((val) << SDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__SHIFT) & SDMA_RD_WEIGHT_0_RD_WEIGHT_PDP__MASK;
> +}
> +#define SDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__MASK			0x00ff0000
> +#define SDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__SHIFT			16
> +static inline uint32_t SDMA_RD_WEIGHT_0_RD_WEIGHT_DPU(uint32_t val)
> +{
> +	return ((val) << SDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__SHIFT) & SDMA_RD_WEIGHT_0_RD_WEIGHT_DPU__MASK;
> +}
> +#define SDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__MASK			0x0000ff00
> +#define SDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__SHIFT		8
> +static inline uint32_t SDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL(uint32_t val)
> +{
> +	return ((val) << SDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__SHIFT) & SDMA_RD_WEIGHT_0_RD_WEIGHT_KERNEL__MASK;
> +}
> +#define SDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__MASK		0x000000ff
> +#define SDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__SHIFT		0
> +static inline uint32_t SDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE(uint32_t val)
> +{
> +	return ((val) << SDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__SHIFT) & SDMA_RD_WEIGHT_0_RD_WEIGHT_FEATURE__MASK;
> +}
> +
> +#define REG_SDMA_WR_WEIGHT_0					0x00009008
> +#define SDMA_WR_WEIGHT_0_RESERVED_0__MASK			0xffff0000
> +#define SDMA_WR_WEIGHT_0_RESERVED_0__SHIFT			16
> +static inline uint32_t SDMA_WR_WEIGHT_0_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << SDMA_WR_WEIGHT_0_RESERVED_0__SHIFT) & SDMA_WR_WEIGHT_0_RESERVED_0__MASK;
> +}
> +#define SDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__MASK			0x0000ff00
> +#define SDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__SHIFT			8
> +static inline uint32_t SDMA_WR_WEIGHT_0_WR_WEIGHT_PDP(uint32_t val)
> +{
> +	return ((val) << SDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__SHIFT) & SDMA_WR_WEIGHT_0_WR_WEIGHT_PDP__MASK;
> +}
> +#define SDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__MASK			0x000000ff
> +#define SDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__SHIFT			0
> +static inline uint32_t SDMA_WR_WEIGHT_0_WR_WEIGHT_DPU(uint32_t val)
> +{
> +	return ((val) << SDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__SHIFT) & SDMA_WR_WEIGHT_0_WR_WEIGHT_DPU__MASK;
> +}
> +
> +#define REG_SDMA_CFG_ID_ERROR					0x0000900c
> +#define SDMA_CFG_ID_ERROR_RESERVED_0__MASK			0xfffffc00
> +#define SDMA_CFG_ID_ERROR_RESERVED_0__SHIFT			10
> +static inline uint32_t SDMA_CFG_ID_ERROR_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_ID_ERROR_RESERVED_0__SHIFT) & SDMA_CFG_ID_ERROR_RESERVED_0__MASK;
> +}
> +#define SDMA_CFG_ID_ERROR_WR_RESP_ID__MASK			0x000003c0
> +#define SDMA_CFG_ID_ERROR_WR_RESP_ID__SHIFT			6
> +static inline uint32_t SDMA_CFG_ID_ERROR_WR_RESP_ID(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_ID_ERROR_WR_RESP_ID__SHIFT) & SDMA_CFG_ID_ERROR_WR_RESP_ID__MASK;
> +}
> +#define SDMA_CFG_ID_ERROR_RESERVED_1__MASK			0x00000020
> +#define SDMA_CFG_ID_ERROR_RESERVED_1__SHIFT			5
> +static inline uint32_t SDMA_CFG_ID_ERROR_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_ID_ERROR_RESERVED_1__SHIFT) & SDMA_CFG_ID_ERROR_RESERVED_1__MASK;
> +}
> +#define SDMA_CFG_ID_ERROR_RD_RESP_ID__MASK			0x0000001f
> +#define SDMA_CFG_ID_ERROR_RD_RESP_ID__SHIFT			0
> +static inline uint32_t SDMA_CFG_ID_ERROR_RD_RESP_ID(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_ID_ERROR_RD_RESP_ID__SHIFT) & SDMA_CFG_ID_ERROR_RD_RESP_ID__MASK;
> +}
> +
> +#define REG_SDMA_RD_WEIGHT_1					0x00009010
> +#define SDMA_RD_WEIGHT_1_RESERVED_0__MASK			0xffffff00
> +#define SDMA_RD_WEIGHT_1_RESERVED_0__SHIFT			8
> +static inline uint32_t SDMA_RD_WEIGHT_1_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << SDMA_RD_WEIGHT_1_RESERVED_0__SHIFT) & SDMA_RD_WEIGHT_1_RESERVED_0__MASK;
> +}
> +#define SDMA_RD_WEIGHT_1_RD_WEIGHT_PC__MASK			0x000000ff
> +#define SDMA_RD_WEIGHT_1_RD_WEIGHT_PC__SHIFT			0
> +static inline uint32_t SDMA_RD_WEIGHT_1_RD_WEIGHT_PC(uint32_t val)
> +{
> +	return ((val) << SDMA_RD_WEIGHT_1_RD_WEIGHT_PC__SHIFT) & SDMA_RD_WEIGHT_1_RD_WEIGHT_PC__MASK;
> +}
> +
> +#define REG_SDMA_CFG_DMA_FIFO_CLR				0x00009014
> +#define SDMA_CFG_DMA_FIFO_CLR_RESERVED_0__MASK			0xfffffffe
> +#define SDMA_CFG_DMA_FIFO_CLR_RESERVED_0__SHIFT			1
> +static inline uint32_t SDMA_CFG_DMA_FIFO_CLR_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_FIFO_CLR_RESERVED_0__SHIFT) & SDMA_CFG_DMA_FIFO_CLR_RESERVED_0__MASK;
> +}
> +#define SDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__MASK		0x00000001
> +#define SDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__SHIFT		0
> +static inline uint32_t SDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__SHIFT) & SDMA_CFG_DMA_FIFO_CLR_DMA_FIFO_CLR__MASK;
> +}
> +
> +#define REG_SDMA_CFG_DMA_ARB					0x00009018
> +#define SDMA_CFG_DMA_ARB_RESERVED_0__MASK			0xfffffc00
> +#define SDMA_CFG_DMA_ARB_RESERVED_0__SHIFT			10
> +static inline uint32_t SDMA_CFG_DMA_ARB_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_ARB_RESERVED_0__SHIFT) & SDMA_CFG_DMA_ARB_RESERVED_0__MASK;
> +}
> +#define SDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__MASK			0x00000200
> +#define SDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__SHIFT			9
> +static inline uint32_t SDMA_CFG_DMA_ARB_WR_ARBIT_MODEL(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__SHIFT) & SDMA_CFG_DMA_ARB_WR_ARBIT_MODEL__MASK;
> +}
> +#define SDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__MASK			0x00000100
> +#define SDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__SHIFT			8
> +static inline uint32_t SDMA_CFG_DMA_ARB_RD_ARBIT_MODEL(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__SHIFT) & SDMA_CFG_DMA_ARB_RD_ARBIT_MODEL__MASK;
> +}
> +#define SDMA_CFG_DMA_ARB_RESERVED_1__MASK			0x00000080
> +#define SDMA_CFG_DMA_ARB_RESERVED_1__SHIFT			7
> +static inline uint32_t SDMA_CFG_DMA_ARB_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_ARB_RESERVED_1__SHIFT) & SDMA_CFG_DMA_ARB_RESERVED_1__MASK;
> +}
> +#define SDMA_CFG_DMA_ARB_WR_FIX_ARB__MASK			0x00000070
> +#define SDMA_CFG_DMA_ARB_WR_FIX_ARB__SHIFT			4
> +static inline uint32_t SDMA_CFG_DMA_ARB_WR_FIX_ARB(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_ARB_WR_FIX_ARB__SHIFT) & SDMA_CFG_DMA_ARB_WR_FIX_ARB__MASK;
> +}
> +#define SDMA_CFG_DMA_ARB_RESERVED_2__MASK			0x00000008
> +#define SDMA_CFG_DMA_ARB_RESERVED_2__SHIFT			3
> +static inline uint32_t SDMA_CFG_DMA_ARB_RESERVED_2(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_ARB_RESERVED_2__SHIFT) & SDMA_CFG_DMA_ARB_RESERVED_2__MASK;
> +}
> +#define SDMA_CFG_DMA_ARB_RD_FIX_ARB__MASK			0x00000007
> +#define SDMA_CFG_DMA_ARB_RD_FIX_ARB__SHIFT			0
> +static inline uint32_t SDMA_CFG_DMA_ARB_RD_FIX_ARB(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_ARB_RD_FIX_ARB__SHIFT) & SDMA_CFG_DMA_ARB_RD_FIX_ARB__MASK;
> +}
> +
> +#define REG_SDMA_CFG_DMA_RD_QOS					0x00009020
> +#define SDMA_CFG_DMA_RD_QOS_RESERVED_0__MASK			0xfffffc00
> +#define SDMA_CFG_DMA_RD_QOS_RESERVED_0__SHIFT			10
> +static inline uint32_t SDMA_CFG_DMA_RD_QOS_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_RD_QOS_RESERVED_0__SHIFT) & SDMA_CFG_DMA_RD_QOS_RESERVED_0__MASK;
> +}
> +#define SDMA_CFG_DMA_RD_QOS_RD_PC_QOS__MASK			0x00000300
> +#define SDMA_CFG_DMA_RD_QOS_RD_PC_QOS__SHIFT			8
> +static inline uint32_t SDMA_CFG_DMA_RD_QOS_RD_PC_QOS(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_RD_QOS_RD_PC_QOS__SHIFT) & SDMA_CFG_DMA_RD_QOS_RD_PC_QOS__MASK;
> +}
> +#define SDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__MASK			0x000000c0
> +#define SDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__SHIFT			6
> +static inline uint32_t SDMA_CFG_DMA_RD_QOS_RD_PPU_QOS(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__SHIFT) & SDMA_CFG_DMA_RD_QOS_RD_PPU_QOS__MASK;
> +}
> +#define SDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__MASK			0x00000030
> +#define SDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__SHIFT			4
> +static inline uint32_t SDMA_CFG_DMA_RD_QOS_RD_DPU_QOS(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__SHIFT) & SDMA_CFG_DMA_RD_QOS_RD_DPU_QOS__MASK;
> +}
> +#define SDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__MASK			0x0000000c
> +#define SDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__SHIFT		2
> +static inline uint32_t SDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__SHIFT) & SDMA_CFG_DMA_RD_QOS_RD_KERNEL_QOS__MASK;
> +}
> +#define SDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__MASK		0x00000003
> +#define SDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__SHIFT		0
> +static inline uint32_t SDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__SHIFT) & SDMA_CFG_DMA_RD_QOS_RD_FEATURE_QOS__MASK;
> +}
> +
> +#define REG_SDMA_CFG_DMA_RD_CFG					0x00009024
> +#define SDMA_CFG_DMA_RD_CFG_RESERVED_0__MASK			0xffffe000
> +#define SDMA_CFG_DMA_RD_CFG_RESERVED_0__SHIFT			13
> +static inline uint32_t SDMA_CFG_DMA_RD_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_RD_CFG_RESERVED_0__SHIFT) & SDMA_CFG_DMA_RD_CFG_RESERVED_0__MASK;
> +}
> +#define SDMA_CFG_DMA_RD_CFG_RD_ARLOCK__MASK			0x00001000
> +#define SDMA_CFG_DMA_RD_CFG_RD_ARLOCK__SHIFT			12
> +static inline uint32_t SDMA_CFG_DMA_RD_CFG_RD_ARLOCK(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_RD_CFG_RD_ARLOCK__SHIFT) & SDMA_CFG_DMA_RD_CFG_RD_ARLOCK__MASK;
> +}
> +#define SDMA_CFG_DMA_RD_CFG_RD_ARCACHE__MASK			0x00000f00
> +#define SDMA_CFG_DMA_RD_CFG_RD_ARCACHE__SHIFT			8
> +static inline uint32_t SDMA_CFG_DMA_RD_CFG_RD_ARCACHE(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_RD_CFG_RD_ARCACHE__SHIFT) & SDMA_CFG_DMA_RD_CFG_RD_ARCACHE__MASK;
> +}
> +#define SDMA_CFG_DMA_RD_CFG_RD_ARPROT__MASK			0x000000e0
> +#define SDMA_CFG_DMA_RD_CFG_RD_ARPROT__SHIFT			5
> +static inline uint32_t SDMA_CFG_DMA_RD_CFG_RD_ARPROT(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_RD_CFG_RD_ARPROT__SHIFT) & SDMA_CFG_DMA_RD_CFG_RD_ARPROT__MASK;
> +}
> +#define SDMA_CFG_DMA_RD_CFG_RD_ARBURST__MASK			0x00000018
> +#define SDMA_CFG_DMA_RD_CFG_RD_ARBURST__SHIFT			3
> +static inline uint32_t SDMA_CFG_DMA_RD_CFG_RD_ARBURST(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_RD_CFG_RD_ARBURST__SHIFT) & SDMA_CFG_DMA_RD_CFG_RD_ARBURST__MASK;
> +}
> +#define SDMA_CFG_DMA_RD_CFG_RD_ARSIZE__MASK			0x00000007
> +#define SDMA_CFG_DMA_RD_CFG_RD_ARSIZE__SHIFT			0
> +static inline uint32_t SDMA_CFG_DMA_RD_CFG_RD_ARSIZE(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_RD_CFG_RD_ARSIZE__SHIFT) & SDMA_CFG_DMA_RD_CFG_RD_ARSIZE__MASK;
> +}
> +
> +#define REG_SDMA_CFG_DMA_WR_CFG					0x00009028
> +#define SDMA_CFG_DMA_WR_CFG_RESERVED_0__MASK			0xffffe000
> +#define SDMA_CFG_DMA_WR_CFG_RESERVED_0__SHIFT			13
> +static inline uint32_t SDMA_CFG_DMA_WR_CFG_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_WR_CFG_RESERVED_0__SHIFT) & SDMA_CFG_DMA_WR_CFG_RESERVED_0__MASK;
> +}
> +#define SDMA_CFG_DMA_WR_CFG_WR_AWLOCK__MASK			0x00001000
> +#define SDMA_CFG_DMA_WR_CFG_WR_AWLOCK__SHIFT			12
> +static inline uint32_t SDMA_CFG_DMA_WR_CFG_WR_AWLOCK(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_WR_CFG_WR_AWLOCK__SHIFT) & SDMA_CFG_DMA_WR_CFG_WR_AWLOCK__MASK;
> +}
> +#define SDMA_CFG_DMA_WR_CFG_WR_AWCACHE__MASK			0x00000f00
> +#define SDMA_CFG_DMA_WR_CFG_WR_AWCACHE__SHIFT			8
> +static inline uint32_t SDMA_CFG_DMA_WR_CFG_WR_AWCACHE(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_WR_CFG_WR_AWCACHE__SHIFT) & SDMA_CFG_DMA_WR_CFG_WR_AWCACHE__MASK;
> +}
> +#define SDMA_CFG_DMA_WR_CFG_WR_AWPROT__MASK			0x000000e0
> +#define SDMA_CFG_DMA_WR_CFG_WR_AWPROT__SHIFT			5
> +static inline uint32_t SDMA_CFG_DMA_WR_CFG_WR_AWPROT(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_WR_CFG_WR_AWPROT__SHIFT) & SDMA_CFG_DMA_WR_CFG_WR_AWPROT__MASK;
> +}
> +#define SDMA_CFG_DMA_WR_CFG_WR_AWBURST__MASK			0x00000018
> +#define SDMA_CFG_DMA_WR_CFG_WR_AWBURST__SHIFT			3
> +static inline uint32_t SDMA_CFG_DMA_WR_CFG_WR_AWBURST(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_WR_CFG_WR_AWBURST__SHIFT) & SDMA_CFG_DMA_WR_CFG_WR_AWBURST__MASK;
> +}
> +#define SDMA_CFG_DMA_WR_CFG_WR_AWSIZE__MASK			0x00000007
> +#define SDMA_CFG_DMA_WR_CFG_WR_AWSIZE__SHIFT			0
> +static inline uint32_t SDMA_CFG_DMA_WR_CFG_WR_AWSIZE(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_WR_CFG_WR_AWSIZE__SHIFT) & SDMA_CFG_DMA_WR_CFG_WR_AWSIZE__MASK;
> +}
> +
> +#define REG_SDMA_CFG_DMA_WSTRB					0x0000902c
> +#define SDMA_CFG_DMA_WSTRB_WR_WSTRB__MASK			0xffffffff
> +#define SDMA_CFG_DMA_WSTRB_WR_WSTRB__SHIFT			0
> +static inline uint32_t SDMA_CFG_DMA_WSTRB_WR_WSTRB(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_DMA_WSTRB_WR_WSTRB__SHIFT) & SDMA_CFG_DMA_WSTRB_WR_WSTRB__MASK;
> +}
> +
> +#define REG_SDMA_CFG_STATUS					0x00009030
> +#define SDMA_CFG_STATUS_RESERVED_0__MASK			0xfffffe00
> +#define SDMA_CFG_STATUS_RESERVED_0__SHIFT			9
> +static inline uint32_t SDMA_CFG_STATUS_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_STATUS_RESERVED_0__SHIFT) & SDMA_CFG_STATUS_RESERVED_0__MASK;
> +}
> +#define SDMA_CFG_STATUS_IDEL__MASK				0x00000100
> +#define SDMA_CFG_STATUS_IDEL__SHIFT				8
> +static inline uint32_t SDMA_CFG_STATUS_IDEL(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_STATUS_IDEL__SHIFT) & SDMA_CFG_STATUS_IDEL__MASK;
> +}
> +#define SDMA_CFG_STATUS_RESERVED_1__MASK			0x000000ff
> +#define SDMA_CFG_STATUS_RESERVED_1__SHIFT			0
> +static inline uint32_t SDMA_CFG_STATUS_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << SDMA_CFG_STATUS_RESERVED_1__SHIFT) & SDMA_CFG_STATUS_RESERVED_1__MASK;
> +}
> +
> +#define REG_GLOBAL_OPERATION_ENABLE				0x0000f008
> +#define GLOBAL_OPERATION_ENABLE_RESERVED_0__MASK		0xffffff80
> +#define GLOBAL_OPERATION_ENABLE_RESERVED_0__SHIFT		7
> +static inline uint32_t GLOBAL_OPERATION_ENABLE_RESERVED_0(uint32_t val)
> +{
> +	return ((val) << GLOBAL_OPERATION_ENABLE_RESERVED_0__SHIFT) & GLOBAL_OPERATION_ENABLE_RESERVED_0__MASK;
> +}
> +#define GLOBAL_OPERATION_ENABLE_PPU_RDMA_OP_EN__MASK		0x00000040
> +#define GLOBAL_OPERATION_ENABLE_PPU_RDMA_OP_EN__SHIFT		6
> +static inline uint32_t GLOBAL_OPERATION_ENABLE_PPU_RDMA_OP_EN(uint32_t val)
> +{
> +	return ((val) << GLOBAL_OPERATION_ENABLE_PPU_RDMA_OP_EN__SHIFT) & GLOBAL_OPERATION_ENABLE_PPU_RDMA_OP_EN__MASK;
> +}
> +#define GLOBAL_OPERATION_ENABLE_PPU_OP_EN__MASK			0x00000020
> +#define GLOBAL_OPERATION_ENABLE_PPU_OP_EN__SHIFT		5
> +static inline uint32_t GLOBAL_OPERATION_ENABLE_PPU_OP_EN(uint32_t val)
> +{
> +	return ((val) << GLOBAL_OPERATION_ENABLE_PPU_OP_EN__SHIFT) & GLOBAL_OPERATION_ENABLE_PPU_OP_EN__MASK;
> +}
> +#define GLOBAL_OPERATION_ENABLE_DPU_RDMA_OP_EN__MASK		0x00000010
> +#define GLOBAL_OPERATION_ENABLE_DPU_RDMA_OP_EN__SHIFT		4
> +static inline uint32_t GLOBAL_OPERATION_ENABLE_DPU_RDMA_OP_EN(uint32_t val)
> +{
> +	return ((val) << GLOBAL_OPERATION_ENABLE_DPU_RDMA_OP_EN__SHIFT) & GLOBAL_OPERATION_ENABLE_DPU_RDMA_OP_EN__MASK;
> +}
> +#define GLOBAL_OPERATION_ENABLE_DPU_OP_EN__MASK			0x00000008
> +#define GLOBAL_OPERATION_ENABLE_DPU_OP_EN__SHIFT		3
> +static inline uint32_t GLOBAL_OPERATION_ENABLE_DPU_OP_EN(uint32_t val)
> +{
> +	return ((val) << GLOBAL_OPERATION_ENABLE_DPU_OP_EN__SHIFT) & GLOBAL_OPERATION_ENABLE_DPU_OP_EN__MASK;
> +}
> +#define GLOBAL_OPERATION_ENABLE_CORE_OP_EN__MASK		0x00000004
> +#define GLOBAL_OPERATION_ENABLE_CORE_OP_EN__SHIFT		2
> +static inline uint32_t GLOBAL_OPERATION_ENABLE_CORE_OP_EN(uint32_t val)
> +{
> +	return ((val) << GLOBAL_OPERATION_ENABLE_CORE_OP_EN__SHIFT) & GLOBAL_OPERATION_ENABLE_CORE_OP_EN__MASK;
> +}
> +#define GLOBAL_OPERATION_ENABLE_RESERVED_1__MASK		0x00000002
> +#define GLOBAL_OPERATION_ENABLE_RESERVED_1__SHIFT		1
> +static inline uint32_t GLOBAL_OPERATION_ENABLE_RESERVED_1(uint32_t val)
> +{
> +	return ((val) << GLOBAL_OPERATION_ENABLE_RESERVED_1__SHIFT) & GLOBAL_OPERATION_ENABLE_RESERVED_1__MASK;
> +}
> +#define GLOBAL_OPERATION_ENABLE_CNA_OP_EN__MASK			0x00000001
> +#define GLOBAL_OPERATION_ENABLE_CNA_OP_EN__SHIFT		0
> +static inline uint32_t GLOBAL_OPERATION_ENABLE_CNA_OP_EN(uint32_t val)
> +{
> +	return ((val) << GLOBAL_OPERATION_ENABLE_CNA_OP_EN__SHIFT) & GLOBAL_OPERATION_ENABLE_CNA_OP_EN__MASK;
> +}
> +
> +#endif /* __ROCKET_REGISTERS_XML__ */
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

