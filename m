Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9A791B7E6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 09:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F7010E051;
	Fri, 28 Jun 2024 07:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G1BZhPGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C092C10E051
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 07:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719558797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBCG6Aq7g5s4IKz6cGy3Qa4TvJeSerIQI/YPWTkVSgw=;
 b=G1BZhPGj/8qN5SKsEVi7e/Jm+KGYZSJNRAoVmN20uX8fXJBklm3ddTsPsMsl75RnZx9G0v
 afKmC6LEmIKh+1W0ozlhypsvV8ePyVtsBxRUGWm+A1CL4mqy746KH2qA/xidmJGVGscw6Q
 1irbj3/EvYV8Cplzq4dds5wN1HstA/g=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-n03YguuyPNimiA_2aKVGbQ-1; Fri, 28 Jun 2024 03:13:15 -0400
X-MC-Unique: n03YguuyPNimiA_2aKVGbQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-52cdc4a8f44so297427e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 00:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719558794; x=1720163594;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uBCG6Aq7g5s4IKz6cGy3Qa4TvJeSerIQI/YPWTkVSgw=;
 b=M4G/JPGc/gy4yr9KacrXQbUzVQdsEfqKwcrEvz/mLNet4tyL9tktQozt8+8zhfFyVn
 0hbCBd+tpzctke+yQMx9MGYnxOOpUlTi4lds8Lt5pbcctg5pzRmwNBIZeZOJolJgf4fX
 MkRl+tZDIhnX9Zw0dfIn1O3a/trS5m+vpkaMIglb8n0nI+biyF/tluVYV0c0E4XV31TD
 IUHS/eMA9ddAlaq7QJ84I0Lv0lZU6S53YBZSYBtRWjx++kOxE7s8nruWKAlHxohhmdhI
 SjI9FD33cVw58FifMfQyi4PXv2pB6j/QUEsKfzPY4jrSkeKjt1Ue/baTj0N96MYRTsmE
 XK3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6+lbBlQM35loUqUq4mH2VkNjRExhO+Ew7MnCN6Tq4so6JJ5k/4B3nzoOyENMqmFMtSCWDf94MDrEVnMvgBUqAFLy7cD5/b3Gt5sGDuS3+
X-Gm-Message-State: AOJu0YwY/96N2I59+VKoxAIX79hbJlo3r++Bf8jKb39OmfYEtQsucPH8
 w9qhTRv5/lPF8yr8Avr2yS6M9GskUwp7F7M/aVG2EJWCiZ5yPamNPik82qlva/T3WqNhKtRQ6mh
 xNjX+uZ+smFRnSZB5Rj+kHif8Z4A52fXp/F93jmao/2eThMhpFyEGUQqDAoWqge1jEw==
X-Received: by 2002:a05:6512:398f:b0:52e:6d6e:5770 with SMTP id
 2adb3069b0e04-52e6d6e580emr4883280e87.14.1719558794356; 
 Fri, 28 Jun 2024 00:13:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRNgxsh6SyinhqzjcyCteF/29SBwjZ8FpGkU83w6uoSo0McICUu/E5sqzerM5X1kwtLLuEIw==
X-Received: by 2002:a05:6512:398f:b0:52e:6d6e:5770 with SMTP id
 2adb3069b0e04-52e6d6e580emr4883265e87.14.1719558793916; 
 Fri, 28 Jun 2024 00:13:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0642acsm22012305e9.25.2024.06.28.00.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 00:13:13 -0700 (PDT)
Message-ID: <06899fda-de75-4d44-bda5-dcbb3e35d037@redhat.com>
Date: Fri, 28 Jun 2024 09:13:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] printk: Add a short description string to kmsg_dump()
To: Kees Cook <kees@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20240625123954.211184-1-jfalempe@redhat.com>
 <202406260906.533095B1@keescook>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <202406260906.533095B1@keescook>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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



On 26/06/2024 18:26, Kees Cook wrote:
> On Tue, Jun 25, 2024 at 02:39:29PM +0200, Jocelyn Falempe wrote:
>> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
>> callback.
>> This patch adds a new parameter "const char *desc" to the kmsg_dumper
>> dump() callback, and update all drivers that are using it.
>>
>> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
>> function and a macro for backward compatibility.
>>
>> I've written this for drm_panic, but it can be useful for other
>> kmsg_dumper.
>> It allows to see the panic reason, like "sysrq triggered crash"
>> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
> 
> Seems reasonable. Given the prototype before/after:
> 
> dump(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason)
> 
> dump(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason,
>       const char *desc)
> 
> Perhaps this should instead be a struct that the panic fills in? Then
> it'll be easy to adjust the struct in the future:

yes that's a good idea, so it's a bit more flexible.

> 
> struct kmsg_dump_detail {
> 	enum kmsg_dump_reason reason;
> 	const char *description;
> };
> 
> dump(struct kmsg_dumper *dumper, struct kmsg_dump *detail)
> 
> This .cocci could do the conversion:
> 
> 
> @ dump_func @
> identifier DUMPER, CALLBACK;
> @@
> 
>    struct kmsg_dumper DUMPER = {
>      .dump = CALLBACK,
>    };
> 
> @ detail @
> identifier dump_func.CALLBACK;
> identifier DUMPER, REASON;
> @@
> 
> 	CALLBACK(struct kmsg_dumper *DUMPER,
> -		 enum kmsg_dump_reason REASON
> +		 struct kmsg_dump_detail *detail
> 		)
> 	{
> 		<...
> -		REASON
> +		detail->reason
> 		...>
> 	}
> 
> 
> Also, just to double-check, doesn't the panic reason show up in the
> kmsg_dump log itself (at the end?) I ask since for pstore, "desc" is
> likely redundant since it's capturing the entire console log.

It is present in the kdump log, but before all the register dumps.
So to retrieve it you need to parse the last 30~40 lines of logs, and 
search for a line starting with "Kernel panic - not syncing".
https://elixir.bootlin.com/linux/v6.10-rc5/source/kernel/panic.c#L341
But I think that's a bit messy, and I prefer having a kmsg_dump parameter.

-- 

Jocelyn
> 
> -Kees
> 
> Here's the patch from the above cocci:
> 
> 
> diff -u -p a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
> --- a/drivers/hv/hv_common.c
> +++ b/drivers/hv/hv_common.c
> @@ -207,13 +207,13 @@ static int hv_die_panic_notify_crash(str
>    * buffer and call into Hyper-V to transfer the data.
>    */
>   static void hv_kmsg_dump(struct kmsg_dumper *dumper,
> -			 enum kmsg_dump_reason reason)
> +			 struct kmsg_dump_detail *detail)
>   {
>   	struct kmsg_dump_iter iter;
>   	size_t bytes_written;
>   
>   	/* We are only interested in panics. */
> -	if (reason != KMSG_DUMP_PANIC || !sysctl_record_panic_msg)
> +	if (detail->reason != KMSG_DUMP_PANIC || !sysctl_record_panic_msg)
>   		return;
>   
>   	/*
> diff -u -p a/arch/powerpc/platforms/powernv/opal-kmsg.c b/arch/powerpc/platforms/powernv/opal-kmsg.c
> --- a/arch/powerpc/platforms/powernv/opal-kmsg.c
> +++ b/arch/powerpc/platforms/powernv/opal-kmsg.c
> @@ -20,13 +20,13 @@
>    * message, it just ensures that OPAL completely flushes the console buffer.
>    */
>   static void kmsg_dump_opal_console_flush(struct kmsg_dumper *dumper,
> -				     enum kmsg_dump_reason reason)
> +				     struct kmsg_dump_detail *detail)
>   {
>   	/*
>   	 * Outside of a panic context the pollers will continue to run,
>   	 * so we don't need to do any special flushing.
>   	 */
> -	if (reason != KMSG_DUMP_PANIC)
> +	if (detail->reason != KMSG_DUMP_PANIC)
>   		return;
>   
>   	opal_flush_console(0);
> diff -u -p a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
> --- a/arch/powerpc/kernel/nvram_64.c
> +++ b/arch/powerpc/kernel/nvram_64.c
> @@ -73,7 +73,7 @@ static const char *nvram_os_partitions[]
>   };
>   
>   static void oops_to_nvram(struct kmsg_dumper *dumper,
> -			  enum kmsg_dump_reason reason);
> +			  struct kmsg_dump_detail *detail);
>   
>   static struct kmsg_dumper nvram_kmsg_dumper = {
>   	.dump = oops_to_nvram
> @@ -643,7 +643,7 @@ void __init nvram_init_oops_partition(in
>    * partition.  If that's too much, go back and capture uncompressed text.
>    */
>   static void oops_to_nvram(struct kmsg_dumper *dumper,
> -			  enum kmsg_dump_reason reason)
> +			  struct kmsg_dump_detail *detail)
>   {
>   	struct oops_log_info *oops_hdr = (struct oops_log_info *)oops_buf;
>   	static unsigned int oops_count = 0;
> @@ -655,7 +655,7 @@ static void oops_to_nvram(struct kmsg_du
>   	unsigned int err_type = ERR_TYPE_KERNEL_PANIC_GZ;
>   	int rc = -1;
>   
> -	switch (reason) {
> +	switch (detail->reason) {
>   	case KMSG_DUMP_SHUTDOWN:
>   		/* These are almost always orderly shutdowns. */
>   		return;
> @@ -671,7 +671,7 @@ static void oops_to_nvram(struct kmsg_du
>   		break;
>   	default:
>   		pr_err("%s: ignoring unrecognized KMSG_DUMP_* reason %d\n",
> -		       __func__, (int) reason);
> +		       __func__, (int) detail->reason);
>   		return;
>   	}
>   
> warning: detail, node 59: record.reason = ... ;[1,2,21,22,32] in pstore_dump may be inconsistently modified
> warning: detail, node 105: if[1,2,21,22,54] in pstore_dump may be inconsistently modified
> diff -u -p a/fs/pstore/platform.c b/fs/pstore/platform.c
> --- a/fs/pstore/platform.c
> +++ b/fs/pstore/platform.c
> @@ -275,7 +275,7 @@ void pstore_record_init(struct pstore_re
>    * end of the buffer.
>    */
>   static void pstore_dump(struct kmsg_dumper *dumper,
> -			enum kmsg_dump_reason reason)
> +			struct kmsg_dump_detail *detail)
>   {
>   	struct kmsg_dump_iter iter;
>   	unsigned long	total = 0;
> @@ -285,9 +285,9 @@ static void pstore_dump(struct kmsg_dump
>   	int		saved_ret = 0;
>   	int		ret;
>   
> -	why = kmsg_dump_reason_str(reason);
> +	why = kmsg_dump_reason_str(detail->reason);
>   
> -	if (pstore_cannot_block_path(reason)) {
> +	if (pstore_cannot_block_path(detail->reason)) {
>   		if (!spin_trylock_irqsave(&psinfo->buf_lock, flags)) {
>   			pr_err("dump skipped in %s path because of concurrent dump\n",
>   					in_nmi() ? "NMI" : why);
> @@ -311,7 +311,7 @@ static void pstore_dump(struct kmsg_dump
>   		pstore_record_init(&record, psinfo);
>   		record.type = PSTORE_TYPE_DMESG;
>   		record.count = oopscount;
> -		record.reason = reason;
> +		record.reason = detail->reason;
>   		record.part = part;
>   		record.buf = psinfo->buf;
>   
> @@ -352,7 +352,7 @@ static void pstore_dump(struct kmsg_dump
>   		}
>   
>   		ret = psinfo->write(&record);
> -		if (ret == 0 && reason == KMSG_DUMP_OOPS) {
> +		if (ret == 0 && detail->reason == KMSG_DUMP_OOPS) {
>   			pstore_new_entry = 1;
>   			pstore_timer_kick();
>   		} else {
> diff -u -p a/arch/um/kernel/kmsg_dump.c b/arch/um/kernel/kmsg_dump.c
> --- a/arch/um/kernel/kmsg_dump.c
> +++ b/arch/um/kernel/kmsg_dump.c
> @@ -8,7 +8,7 @@
>   #include <os.h>
>   
>   static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
> -				enum kmsg_dump_reason reason)
> +				struct kmsg_dump_detail *detail)
>   {
>   	static struct kmsg_dump_iter iter;
>   	static DEFINE_SPINLOCK(lock);
> 

