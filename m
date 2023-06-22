Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D07E73AB4F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 23:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A76210E064;
	Thu, 22 Jun 2023 21:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B3010E064
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 21:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=+evnrWvMO11pB2Se6CmXqRpq5vuKB5b/OFz8WvDzXFA=; b=BpqlADxE+aE9eMikiqLg5s5PFW
 BseEQE5TVR+/CwqHyv131gu84M8Oa3/O1LFzKYdBhKDQ7rY1Ks4211A7yz+YLW0XIVv5YgyRnw94H
 O1m6D/h/pBcJ6M4qWtJWoy0KVMcaU2z/snhoOGl4aCQeVGkWWSTuC75vG70Ymqxr39+NvbLVfYlWQ
 wVtzjV9STTLc7AuYLG128apVY5VwdioqiCLEzG77hUOmIoWbHPwlwdnfPmKFAAsFDmOYhNu4Eopj1
 zd74OewfWSkFMev2BI46DptGQQ8Zv0wkf9zEOdXNohhxiUCsR28qEG1jB+nSjyQ8I8dHqh5OY/GYj
 ratQ5qgA==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qCRdW-001oSB-37; Thu, 22 Jun 2023 21:14:39 +0000
Message-ID: <8e68daf3-485a-7def-b382-edc33415265d@infradead.org>
Date: Thu, 22 Jun 2023 14:14:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2] docs: module: start adding some docs for MODULE_
 macros.
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230426042906.724352-1-airlied@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230426042906.724352-1-airlied@gmail.com>
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
 Jonathan Corbet <corbet@lwn.net>, linux-modules@vger.kernel.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/25/23 21:29, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> In order to add a new macro, Luis suggested converting some docs
> for the new ones.
> 
> This tries to keep exisiting module_init, module_exit where they are,
> and adds the new docs to the module section.
> 
> Cc: linux-doc@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: linux-modules@vger.kernel.org
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org> # for the kernel-doc

Thanks.

> ---
>  Documentation/core-api/kernel-api.rst |  3 ++
>  Documentation/driver-api/basics.rst   |  2 +-
>  include/linux/module.h                | 76 ++++++++++++++++++---------
>  3 files changed, 54 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
> index 62f961610773..0b78b1a3e8a2 100644
> --- a/Documentation/core-api/kernel-api.rst
> +++ b/Documentation/core-api/kernel-api.rst
> @@ -226,6 +226,9 @@ Module Loading
>  .. kernel-doc:: kernel/kmod.c
>     :export:
>  
> +.. kernel-doc:: include/linux/module.h
> +   :no-identifiers: module_init module_exit klp_modinfo
> +
>  Inter Module support
>  --------------------
>  
> diff --git a/Documentation/driver-api/basics.rst b/Documentation/driver-api/basics.rst
> index 4b4d8e28d3be..fea42d6cad80 100644
> --- a/Documentation/driver-api/basics.rst
> +++ b/Documentation/driver-api/basics.rst
> @@ -5,7 +5,7 @@ Driver Entry and Exit points
>  ----------------------------
>  
>  .. kernel-doc:: include/linux/module.h
> -   :internal:
> +   :identifiers: module_init module_exit
>  
>  Driver device table
>  -------------------
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 4435ad9439ab..f9d072a7e198 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -182,23 +182,27 @@ extern void cleanup_module(void);
>  #define MODULE_FILE	MODULE_INFO(file, KBUILD_MODFILE);
>  #endif
>  
> -/*
> +/**
> + * MODULE_LICENSE - module license
> + * @_license: license covering this module.
> + *
>   * The following license idents are currently accepted as indicating free
>   * software modules
>   *
> - *	"GPL"				[GNU Public License v2]
> - *	"GPL v2"			[GNU Public License v2]
> - *	"GPL and additional rights"	[GNU Public License v2 rights and more]
> - *	"Dual BSD/GPL"			[GNU Public License v2
> - *					 or BSD license choice]
> - *	"Dual MIT/GPL"			[GNU Public License v2
> - *					 or MIT license choice]
> - *	"Dual MPL/GPL"			[GNU Public License v2
> - *					 or Mozilla license choice]
> + *    "GPL"                        [GNU Public License v2]
>   *
> - * The following other idents are available
> + *    "GPL v2"                     [GNU Public License v2]
>   *
> - *	"Proprietary"			[Non free products]
> + *    "GPL and additional rights"  [GNU Public License v2 rights and more]
> + *
> + *    "Dual BSD/GPL"               [GNU Public License v2 or BSD license choice]
> + *
> + *    "Dual MIT/GPL"               [GNU Public License v2 or MIT license choice]
> + *
> + *    "Dual MPL/GPL"               [GNU Public License v2 or Mozilla license choice]
> + *
> + * The following other idents are available
> + *    "Proprietary"                [Non free products]
>   *
>   * Both "GPL v2" and "GPL" (the latter also in dual licensed strings) are
>   * merely stating that the module is licensed under the GPL v2, but are not
> @@ -221,20 +225,26 @@ extern void cleanup_module(void);
>   * is a GPL combined work.
>   *
>   * This exists for several reasons
> - * 1.	So modinfo can show license info for users wanting to vet their setup
> - *	is free
> + *
> + * 1.	So modinfo can show license info for users wanting to vet their setup is free
> + *
>   * 2.	So the community can ignore bug reports including proprietary modules
> + *
>   * 3.	So vendors can do likewise based on their own policies
>   */
>  #define MODULE_LICENSE(_license) MODULE_FILE MODULE_INFO(license, _license)
>  
> -/*
> - * Author(s), use "Name <email>" or just "Name", for multiple
> - * authors use multiple MODULE_AUTHOR() statements/lines.
> +/**
> + * MODULE_AUTHOR - Module author
> + * @_author: Author(s), use "Name <email>" or just "Name", for multiple
> + *           authors use multiple MODULE_AUTHOR() statements/lines.
>   */
>  #define MODULE_AUTHOR(_author) MODULE_INFO(author, _author)
>  
> -/* What your module does. */
> +/**
> + * MODULE_DESCRIPTION - Module description
> + * @_description: What your module does.
> + */
>  #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _description)
>  
>  #ifdef MODULE
> @@ -246,19 +256,23 @@ extern typeof(name) __mod_##type##__##name##_device_table		\
>  #define MODULE_DEVICE_TABLE(type, name)
>  #endif
>  
> -/* Version of form [<epoch>:]<version>[-<extra-version>].
> +/**
> + * MODULE_VERSION: version of module
> + * @_version: version in the form below
> + *
> + * Version of form [<epoch>:]<version>[-<extra-version>].
>   * Or for CVS/RCS ID version, everything but the number is stripped.
>   * <epoch>: A (small) unsigned integer which allows you to start versions
>   * anew. If not mentioned, it's zero.  eg. "2:1.0" is after
>   * "1:2.0".
> -
> + *
>   * <version>: The <version> may contain only alphanumerics and the
> - * character `.'.  Ordered by numeric sort for numeric parts,
> + * character '.'.  Ordered by numeric sort for numeric parts,
>   * ascii sort for ascii parts (as per RPM or DEB algorithm).
> -
> + *
>   * <extraversion>: Like <version>, but inserted for local
>   * customizations, eg "rh3" or "rusty1".
> -
> + *
>   * Using this automatically adds a checksum of the .c files and the
>   * local headers in "srcversion".
>   */
> @@ -284,11 +298,21 @@ extern typeof(name) __mod_##type##__##name##_device_table		\
>  		}
>  #endif
>  
> -/* Optional firmware file (or files) needed by the module
> - * format is simply firmware file name.  Multiple firmware
> - * files require multiple MODULE_FIRMWARE() specifiers */
> +/**
> + * MODULE_FIRMWARE - Optional firmware files needed by the module
> + * @_firmware: firmware file name
> + *
> + * Multiple firmware files require multiple MODULE_FIRMWARE() specifiers.
> + */
>  #define MODULE_FIRMWARE(_firmware) MODULE_INFO(firmware, _firmware)
>  
> +/**
> + * MODULE_IMPORT_NS - Set the symbol namespace for the module.
> + * @ns: symbol namespace to import the module into.
> + *
> + * This adds a modinfo tag 'import_ns' to the module. This is observed
> + * by userspace at module loading time.
> + */
>  #define MODULE_IMPORT_NS(ns)	MODULE_INFO(import_ns, __stringify(ns))
>  
>  struct notifier_block;

-- 
~Randy
