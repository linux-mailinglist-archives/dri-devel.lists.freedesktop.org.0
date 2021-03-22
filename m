Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24B134526B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 23:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9485889BFF;
	Mon, 22 Mar 2021 22:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066E36E7D2;
 Mon, 22 Mar 2021 22:07:55 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id c6so13591168qtc.1;
 Mon, 22 Mar 2021 15:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bp6cadiLp9JG4ot8VD8DrNUhLvtl3tOiutuJ7QXWznQ=;
 b=iaV83Ux9xBDgj/qom3Bk+Pnnd+Npq2g7l2Wcj4hhm0C9/Wqa5sWw8p1Jsa6IVtm0yS
 TdIiUfQGXTD6NiCLV6NBiRXyZP2uVw+Q2q6lU7LXwrWQJ/Maefvj0xV0Uec18FcSeRXF
 vIJU9u5du1ZOWFtkZrF5/qMHCMqhC93pFGIqrrKl6XUhkAUrPxcx4X0Batpu84izU0rl
 6nUs9IEvPSvLgj3W8ej7UliIwlqDMHRm/QB8uQcgZsL5UpAnoTMEMr+Ed2fl6upuTDTk
 ++B/wzn6EYS99xzPoQfKZFL2om7c/ZVOPmZEz09Ms8KU+NvgtrohB8esdB1kDZFPOvri
 10Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bp6cadiLp9JG4ot8VD8DrNUhLvtl3tOiutuJ7QXWznQ=;
 b=hChIbxRdjrfZNgZfOVsk6lW8TJ6l4mN+U3aauRzTycS7kNCHYQwRyemNPI2XO50bsX
 jl0icYqETZGe8f+Exc1evZfLhFf+D0dAPanQuD+WdU2xgG2gzSpN5ijOjV1Q+7A6UUbH
 wBxYb2ysTT4X+kzHEE28F/PzfuCp10Jy/7XQ29a3E8tU1HpnglJzaerxwSJRFVb+kKjU
 RP2B7nJ57zMOI9fH4girLTQ40QYQ2lZLeuy9aTNHkkU2ddX85leeK/lW2OqY+wwGkU63
 VaC54KX95rY5ykg3ddcrfMPsH9VPEj9I4DaovAI+9zwVjfG4+7+kvThgv//E89iHeGdW
 fzCA==
X-Gm-Message-State: AOAM530mVpKqt+WRA8lV8MBD8miNV6FifuQ4DEK/KVfgiQlLuYadux1N
 md5AaI+cfDwK2K5PfwdCdOY=
X-Google-Smtp-Source: ABdhPJw2Q59a1ZLYugiGOh0k53LBnL3VNySQVKoaoySDrE/bFUhGmQDuP132X+ofXKkmUC96EG1Wbg==
X-Received: by 2002:ac8:5281:: with SMTP id s1mr1870981qtn.293.1616450875002; 
 Mon, 22 Mar 2021 15:07:55 -0700 (PDT)
Received: from [192.168.0.41] (71-218-23-248.hlrn.qwest.net. [71.218.23.248])
 by smtp.gmail.com with ESMTPSA id
 y19sm12052651qky.111.2021.03.22.15.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 15:07:54 -0700 (PDT)
Subject: Re: [PATCH 02/11] x86: tboot: avoid Wstringop-overread-warning
To: Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-3-arnd@kernel.org>
 <20210322202958.GA1955909@gmail.com>
From: Martin Sebor <msebor@gmail.com>
Message-ID: <b944a853-0e4b-b767-0175-cc2c1edba759@gmail.com>
Date: Mon, 22 Mar 2021 16:07:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20210322202958.GA1955909@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 22 Mar 2021 22:26:21 +0000
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
Cc: dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, linux-scsi@vger.kernel.org, x86@kernel.org,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Ingo Molnar <mingo@redhat.com>, Kalle Valo <kvalo@codeaurora.org>,
 ath11k@lists.infradead.org, Serge Hallyn <serge@hallyn.com>,
 Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Ning Sun <ning.sun@intel.com>, Anders Larsen <al@alarsen.net>,
 Borislav Petkov <bp@alien8.de>, cgroups@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Martin Sebor <msebor@gcc.gnu.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, intel-gfx@lists.freedesktop.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/22/21 2:29 PM, Ingo Molnar wrote:
> 
> * Arnd Bergmann <arnd@kernel.org> wrote:
> 
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> gcc-11 warns about using string operations on pointers that are
>> defined at compile time as offsets from a NULL pointer. Unfortunately
>> that also happens on the result of fix_to_virt(), which is a
>> compile-time constant for a constantn input:
>>
>> arch/x86/kernel/tboot.c: In function 'tboot_probe':
>> arch/x86/kernel/tboot.c:70:13: error: '__builtin_memcmp_eq' specified bound 16 exceeds source size 0 [-Werror=stringop-overread]
>>     70 |         if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
>>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> I hope this can get addressed in gcc-11 before the release.
>>
>> As a workaround, split up the tboot_probe() function in two halves
>> to separate the pointer generation from the usage. This is a bit
>> ugly, and hopefully gcc understands that the code is actually correct
>> before it learns to peek into the noinline function.
>>
>> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   arch/x86/kernel/tboot.c | 44 ++++++++++++++++++++++++-----------------
>>   1 file changed, 26 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/x86/kernel/tboot.c b/arch/x86/kernel/tboot.c
>> index 4c09ba110204..f9af561c3cd4 100644
>> --- a/arch/x86/kernel/tboot.c
>> +++ b/arch/x86/kernel/tboot.c
>> @@ -49,6 +49,30 @@ bool tboot_enabled(void)
>>   	return tboot != NULL;
>>   }
>>   
>> +/* noinline to prevent gcc from warning about dereferencing constant fixaddr */
>> +static noinline __init bool check_tboot_version(void)
>> +{
>> +	if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
>> +		pr_warn("tboot at 0x%llx is invalid\n", boot_params.tboot_addr);
>> +		return false;
>> +	}
>> +
>> +	if (tboot->version < 5) {
>> +		pr_warn("tboot version is invalid: %u\n", tboot->version);
>> +		return false;
>> +	}
>> +
>> +	pr_info("found shared page at phys addr 0x%llx:\n",
>> +		boot_params.tboot_addr);
>> +	pr_debug("version: %d\n", tboot->version);
>> +	pr_debug("log_addr: 0x%08x\n", tboot->log_addr);
>> +	pr_debug("shutdown_entry: 0x%x\n", tboot->shutdown_entry);
>> +	pr_debug("tboot_base: 0x%08x\n", tboot->tboot_base);
>> +	pr_debug("tboot_size: 0x%x\n", tboot->tboot_size);
>> +
>> +	return true;
>> +}
>> +
>>   void __init tboot_probe(void)
>>   {
>>   	/* Look for valid page-aligned address for shared page. */
>> @@ -66,25 +90,9 @@ void __init tboot_probe(void)
>>   
>>   	/* Map and check for tboot UUID. */
>>   	set_fixmap(FIX_TBOOT_BASE, boot_params.tboot_addr);
>> -	tboot = (struct tboot *)fix_to_virt(FIX_TBOOT_BASE);
>> -	if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
>> -		pr_warn("tboot at 0x%llx is invalid\n", boot_params.tboot_addr);
>> +	tboot = (void *)fix_to_virt(FIX_TBOOT_BASE);
>> +	if (!check_tboot_version())
>>   		tboot = NULL;
>> -		return;
>> -	}
>> -	if (tboot->version < 5) {
>> -		pr_warn("tboot version is invalid: %u\n", tboot->version);
>> -		tboot = NULL;
>> -		return;
>> -	}
>> -
>> -	pr_info("found shared page at phys addr 0x%llx:\n",
>> -		boot_params.tboot_addr);
>> -	pr_debug("version: %d\n", tboot->version);
>> -	pr_debug("log_addr: 0x%08x\n", tboot->log_addr);
>> -	pr_debug("shutdown_entry: 0x%x\n", tboot->shutdown_entry);
>> -	pr_debug("tboot_base: 0x%08x\n", tboot->tboot_base);
>> -	pr_debug("tboot_size: 0x%x\n", tboot->tboot_size);
> 
> This is indeed rather ugly - and the other patch that removes a debug
> check seems counterproductive as well.
> 
> Do we know how many genuine bugs -Wstringop-overread-warning has
> caught or is about to catch?
> 
> I.e. the real workaround might be to turn off the -Wstringop-overread-warning,
> until GCC-11 gets fixed?

In GCC 10 -Wstringop-overread is a subset of -Wstringop-overflow.
GCC 11 breaks it out as a separate warning to make it easier to
control.  Both warnings have caught some real bugs but they both
have a nonzero rate of false positives.  Other than bug reports
we don't have enough data to say what their S/N ratio might be
but my sense is that it's fairly high in general.

   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=wstringop-overread
   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=wstringop-overflow

In GCC 11, all access warnings expect objects to be either declared
or allocated.  Pointers with constant values are taken to point to
nothing valid (as Arnd mentioned above, this is to detect invalid
accesses to members of structs at address zero).

One possible solution to the known address problem is to extend GCC
attributes address and io that pin an object to a hardwired address
to all targets (at the moment they're supported on just one or two
targets).  I'm not sure this can still happen before GCC 11 releases
sometime in April or May.

Until then, another workaround is to convert the fixed address to
a volatile pointer before using it for the access, along the lines
below.  It should have only a negligible effect on efficiency.

diff --git a/arch/x86/kernel/tboot.c b/arch/x86/kernel/tboot.c
index 4c09ba110204..76326b906010 100644
--- a/arch/x86/kernel/tboot.c
+++ b/arch/x86/kernel/tboot.c
@@ -67,7 +67,9 @@ void __init tboot_probe(void)
         /* Map and check for tboot UUID. */
         set_fixmap(FIX_TBOOT_BASE, boot_params.tboot_addr);
         tboot = (struct tboot *)fix_to_virt(FIX_TBOOT_BASE);
-       if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
+       if (memcmp(&tboot_uuid,
+                  (*(struct tboot* volatile *)(&tboot))->uuid,
+                  sizeof(tboot->uuid))) {
                 pr_warn("tboot at 0x%llx is invalid\n", 
boot_params.tboot_addr);
                 tboot = NULL;
                 return;

Martin

> 
> Thanks,
> 
> 	Ingo
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
