Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEBD7E92F0
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 23:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEBE10E031;
	Sun, 12 Nov 2023 22:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 530 seconds by postgrey-1.36 at gabe;
 Sun, 12 Nov 2023 22:14:31 UTC
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [91.218.175.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9042110E031
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 22:14:31 +0000 (UTC)
Message-ID: <2110acaf-cf29-47a2-bd52-e57a806ecae5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1699826739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3i6BP0zbmR3LQgLLTFHssZ1wJY22w+EEB/u5e6o0EKc=;
 b=CBFYeQSgT6NbhetnXofybckCvf4ph/vZid/DVKqFBmG81YyZGZToBj8G2+DudexInpjRHm
 sSipCnRA8gfGsCy8me+1cAIYhS//ZKErJ3rgpVrCI9l0G/NeUQzXBLAqfjpmPx6KhO8fvC
 2Wifn/dkaABX8yheEUcIhfjMta9LkmQ=
Date: Mon, 13 Nov 2023 06:05:33 +0800
MIME-Version: 1.0
Subject: Re: Dependencies of DRM_LOONGSON
To: Jean Delvare <jdelvare@suse.de>
References: <20231110175854.40ee0629@endymion.delvare>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231110175854.40ee0629@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/11/11 00:58, Jean Delvare wrote:
> Hi Jingfeng,
>
> You recently added the loongson drm driver to the Linux kernel tree.
> Unlike all other loongson drivers, the drm driver doesn't have any
> dependency set on the platform or architecture, and is therefore
> proposed on all architectures. As far as I understand, this driver is
> only useful on Loongson-based MIPS systems, therefore I believe it
> should only be offered as an option on these systems.

Yes, you are right for now. Thanks a lot for pointed out.
But it is also usable on LoongArch[1] systems.

[1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html


> Would the following change be OK with you?

"depends on LOONGARCH || MIPS || COMPILE_TEST" should be enough,
so please update the patch and resend, thanks a lot. :-)


> From: Jean Delvare <jdelvare@suse.de>
> Subject: drm/loongson: Add platform dependency
>
> Only offer the Loongson DRM driver as an option on platforms where
> it makes sense.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> ---
>   drivers/gpu/drm/loongson/Kconfig |    1 +
>   1 file changed, 1 insertion(+)
>
> --- linux-6.6.orig/drivers/gpu/drm/loongson/Kconfig
> +++ linux-6.6/drivers/gpu/drm/loongson/Kconfig
> @@ -3,6 +3,7 @@
>   config DRM_LOONGSON
>   	tristate "DRM support for Loongson Graphics"
>   	depends on DRM && PCI && MMU
> +	depends on MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST

depends on LOONGARCH || MIPS || COMPILE_TEST


>   	select DRM_KMS_HELPER
>   	select DRM_TTM
>   	select I2C
>
> Thanks,
