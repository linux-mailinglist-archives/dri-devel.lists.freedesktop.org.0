Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA39C6AD1BD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 23:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A71B10E423;
	Mon,  6 Mar 2023 22:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191B110E420
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 22:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=8pMcsd5zsIOHP2arWm7jYscL1z+fEnP4qax0CfOy3r4=; b=PnxSE/Dk3QLU+/mO+vdwos9hVX
 4RWt7WgP6zW0lX1R1VqwqVpS7t0HMBgJOWs5aRbkAB+v8RsRInvlLTop6DwSIwYmL3AIRoq57o6iq
 r4GMIu0UwGyb/pHAX9uJJscdqU63acW31/osv0zO2qhyLGJIcSpk6a2Epci8QdXC282zp78Jq0aQN
 4/qvwgU8EEEsDBEvyc1n9OIxZb1pbQC1dFuuPV+8ue1vBv0LfUlv49mnPXtlxTjHa465y7OsnpyWa
 eDduJRuBoC7SApYMKR+AaQv1reBLM/++f3SDd8eg/iqVgmBS44TeeOrdvgOXjCGmqZ54h55uKPM3i
 JRhK7Rew==;
Received: from [2601:1c2:980:9ec0::df2f]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZJSe-00FJDM-SF; Mon, 06 Mar 2023 22:37:41 +0000
Message-ID: <570edde0-cfea-f560-fe83-6077f4f221e5@infradead.org>
Date: Mon, 6 Mar 2023 14:37:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/99] lib: Add option iterator
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, paulus@samba.org, 
 benh@kernel.crashing.org, linux@armlinux.org.uk, pjones@redhat.com,
 timur@kernel.org, adaplas@gmail.com, s.hauer@pengutronix.de,
 shawnguo@kernel.org, mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
References: <20230306160016.4459-1-tzimmermann@suse.de>
 <20230306160016.4459-2-tzimmermann@suse.de>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230306160016.4459-2-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/6/23 07:58, Thomas Zimmermann wrote:
> Add struct option_iter and helpers that walk over individual options
> of an option string. Add documentation.
> 
> Kernel parameters often have the format of
> 
>   param=opt1,opt2:val,opt3
> 
> where the option string contains a number of comma-separated options.
> Drivers usually use strsep() in a loop to extract individual options
> from the string. Each call to strsep() modifies the given string, so
> callers have to duplicate kernel parameters that are to be parsed
> multiple times.
> 
> The new struct option_iter and its helpers wrap this code behind a
> clean interface. Drivers can iterate over the options without having
> to know the details of the option-string format. The iterator handles
> string memory internally without modifying the original options.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  Documentation/core-api/kernel-api.rst |  9 +++
>  include/linux/cmdline.h               | 29 ++++++++
>  lib/Makefile                          |  2 +-
>  lib/cmdline_iter.c                    | 97 +++++++++++++++++++++++++++
>  4 files changed, 136 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/cmdline.h
>  create mode 100644 lib/cmdline_iter.c
> 
> diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
> index 62f961610773..cdc7ba8decf9 100644
> --- a/Documentation/core-api/kernel-api.rst
> +++ b/Documentation/core-api/kernel-api.rst
> @@ -93,9 +93,18 @@ Bitmap Operations
>  Command-line Parsing
>  --------------------
>  
> +.. kernel-doc:: lib/cmdline_iter.c
> +   :doc: overview
> +
>  .. kernel-doc:: lib/cmdline.c
>     :export:
>  
> +.. kernel-doc:: lib/cmdline_iter.c
> +   :export:
> +
> +.. kernel-doc:: include/linux/cmdline.h
> +   :internal:
> +
>  Sorting
>  -------
>  
> diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
> new file mode 100644
> index 000000000000..5d7e648e98a5
> --- /dev/null
> +++ b/include/linux/cmdline.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef LINUX_CMDLINE_H
> +#define LINUX_CMDLINE_H
> +
> +/**
> + * struct option_iter - Iterates over string of kernel or module options
> + */
> +struct option_iter {
> +	char *optbuf;
> +	char *next_opt;
> +};
> +
> +void option_iter_init(struct option_iter *iter, const char *options);
> +void option_iter_release(struct option_iter *iter);
> +const char *option_iter_incr(struct option_iter *iter);
> +
> +/**
> + * option_iter_next - Loop condition to move over options
> + * @iter_:	the iterator
> + * @opt_:	the name of the option variable
> + *
> + * Iterates over option strings as part of a while loop and
> + * stores the current option in opt_.
> + */
> +#define option_iter_next(iter_, opt_) \
> +	(((opt_) = option_iter_incr(iter_)) != NULL)
> +
> +#endif

> diff --git a/lib/cmdline_iter.c b/lib/cmdline_iter.c
> new file mode 100644
> index 000000000000..d9371dfea08b
> --- /dev/null
> +++ b/lib/cmdline_iter.c
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/cmdline.h>
> +#include <linux/export.h>
> +#include <linux/slab.h>
> +
> +/**
> + * DOC: overview
> + *
> + * A kernel parameter's option string can contain multiple comma-separated
> + * options. Modules can parse an option string with struct &option_iter and
> + * its helpers. After obtaining the string, initialize and instance of the

                                                          an instance

> + * option iterator and loop iver its content as show below.

                               over

> + *
> + * .. code-block:: c
> + *
> + *	const char *options = ...; // provided option string
> + *
> + *	struct option_iter iter;
> + *	const char *opt;
> + *
> + *	option_iter_init(&iter, options);
> + *
> + *	while (option_iter_next(&iter, &opt)) {
> + *		if (!strcmp(opt, "foo"))
> + *			...
> + *		else (strcmp(opt, "bar"))
> + *			...
> + *		else
> + *			pr_warn("unknown option %s\n", opt);
> + *	}
> + *
> + *	option_iter_release(&iter);
> + *
> + * The call to option_iter_init() initializes the iterator instance
> + * from the option string. The while loop walks over the individual
> + * options in the sting and returns each in the second argument. The
> + * returned memory is owned by the iterator instance and callers may
> + * not modify or free it. The call to option_iter_release() frees all
> + * resources of the iterator. This process does not modify the original
> + * option string. If the option string contains an empty option (i.e.,
> + * two commas next to each other), option_iter_next() skips the empty
> + * option automatically.

Is that latter skipping over a ",," automatically something that you have
observed as needed?
I can imagine a driver or module wanting to know that an empty string
was entered (i.e., ",,").

> + */
> +
> +/**
> + * option_iter_init - Initializes an option iterator
> + * @iter:	the iterator to initialize
> + * @options:	the options string
> + */
> +void option_iter_init(struct option_iter *iter, const char *options)
> +{
> +	if (options && *options)
> +		iter->optbuf = kstrdup(options, GFP_KERNEL); // can be NULL
> +	else
> +		iter->optbuf = NULL;
> +	iter->next_opt = iter->optbuf;
> +}
> +EXPORT_SYMBOL(option_iter_init);
> +
> +/**
> + * option_iter_release - Releases an option iterator's resources
> + * @iter:	the iterator
> + */
> +void option_iter_release(struct option_iter *iter)
> +{
> +	kfree(iter->optbuf);
> +	iter->next_opt = NULL;
> +}
> +EXPORT_SYMBOL(option_iter_release);
> +
> +/**
> + * option_iter_incr - Return current option and advance to the next
> + * @iter:	the iterator
> + *
> + * Returns:

 * Return:
matches kernel-doc notation documentation.

> + * The current option string, or NULL if there are no more options.
> + */
> +const char *option_iter_incr(struct option_iter *iter)
> +{
> +	char *opt;
> +
> +	if (!iter->next_opt) { // can be OK if kstrdup failed
> +		if (iter->optbuf) // iter has already been released; logic error
> +			pr_err("Incrementing option iterator without string\n");
> +		return NULL;
> +	}
> +
> +	do {
> +		opt = strsep(&iter->next_opt, ",");
> +		if (!opt)
> +			return NULL;
> +	} while (!*opt); // found empty option string, try next
> +
> +	return opt;
> +}
> +EXPORT_SYMBOL(option_iter_incr);

Looks useful. Thanks.

-- 
~Randy
