Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B12573AB41
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 23:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5029F10E062;
	Thu, 22 Jun 2023 21:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8FE10E062
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 21:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=sCjqzOq5Io+fRooVNMtJwjPs6uLllaRKt1mjXlVAIv4=; b=ekmILxLCU+yJCsVbZvrDd095fb
 KtUwn6YCwwpcqJsSRbES6wK0e7DKijgUorYorBIfKAVfwvhGL/lv/mMAKdA/uRTllqqseFyewhf5+
 Z/emSJmpLdLXCtGfNTGflU0Cb5wyHAv+udPs/H6WzxXuTuVaY4WK6ioFdO6Re37ilQps/HB2Kz6Ox
 1ZDtJKSS6Yje/U4xKt9sIMwJB2P+jEuCHaGBR2mOwb/YN16mg6BUI74EdBIi0g6K0x2ORatPCZlU1
 myFHr5sdwvkArOQA3kqgY2JPbKROD1rSyScSPkOriNZTcfGwhCKRUr6h4A9vsszD/8beX1yQvQxzr
 K+JcJw8w==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qCRbV-001o92-1k; Thu, 22 Jun 2023 21:12:33 +0000
Message-ID: <dd6bd147-6d5f-ee2c-4feb-ec3376c01a87@infradead.org>
Date: Thu, 22 Jun 2023 14:12:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/2] modules/firmware: add a new option to denote a
 firmware group to choose one.
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230426042906.724352-1-airlied@gmail.com>
 <20230426042906.724352-2-airlied@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230426042906.724352-2-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Dave Airlie <airlied@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>,
 linux-modules@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/25/23 21:29, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This adds a tag that will go into the module info, only one firmware from
> the group given needs to be available for this driver to work. This allows
> dracut to avoid adding in firmware that aren't needed.
> 
> This just brackets a module list in the modinfo, the modules in the list
> will get entries in reversed order so the last module in the list is the
> preferred one.
> 
> The corresponding dracut code it at:
> https://github.com/dracutdevs/dracut/pull/2309
> 
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: linux-modules@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  include/linux/module.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/include/linux/module.h b/include/linux/module.h
> index f9d072a7e198..d3e7085cedd0 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -306,6 +306,28 @@ extern typeof(name) __mod_##type##__##name##_device_table		\
>   */
>  #define MODULE_FIRMWARE(_firmware) MODULE_INFO(firmware, _firmware)
>  
> +/**
> + * MODULE_FIRMWARE_GROUP_ONLY_ONE - Create a need only one firmware group

                                                need-only-one

> + * @_grpname: group name
> + *
> + * This creates a group of which the driver only needs one firmware installed.
> + * This is to allow dracut to limit the number of firmwares in the initramfs.
> + * This just creates a new entry in the modinfo section, there should be one

                                                   section;

> + * of these entries bracketing the group of MODULE_INFO lines.
> + * Due to how modinfo is constructed the ordering of the modinfo means the
> + * last module info in the group will end up being the first one dracut will
> + * search for, so place the newest firmware last.
> + *
> + * ``MODULE_FIRMWARE_GROUP_ONLY_ONE("mygroup")``
> + *
> + * ``MODULE_FIRMWARE("firmwarev1")``
> + *
> + * ``MODULE_FIRMWARE("firmwarev2")``
> + *
> + * ``MODULE_FIRMWARE_GROUP_ONLY_ONE("mygroup")``
> + */
> +#define MODULE_FIRMWARE_GROUP_ONLY_ONE(_grpname) MODULE_INFO(firmware_group_only_one, _grpname)
> +
>  /**
>   * MODULE_IMPORT_NS - Set the symbol namespace for the module.
>   * @ns: symbol namespace to import the module into.

Tested-by: Randy Dunlap <rdunlap@infradead.org> # for the kernel-doc

Is this going anywhere? It was posted about 2 months ago.

thanks.
-- 
~Randy
