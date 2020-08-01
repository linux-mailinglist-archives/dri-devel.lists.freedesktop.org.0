Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283A423A0D8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E3789BAF;
	Mon,  3 Aug 2020 08:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF85E6E1B3
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 03:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=D0ZAEeULLhO0dRSJEKdMB4o06gOWrXsNB6Gpl1foU8s=; b=pQTyMwSyTafkhb+jmPKcsik00L
 3yiCd+U6Dsxcu/6ZwkRbRshAcdqWfIKRKl7V92jF1sKArZQrBcQftbTUoZyeV19ifYFQ1vtvgvhVS
 65t1agBt63lSovRXk/ENK5dil2ddKJq3fA5MFWRwtpRdpmklsW8CoN6lSLJnyydg3O5UZXxshVSc9
 NXyJI5tzTsbS5RFXKI4vzwStTz+nVDQ1eE0K4ffhg5HxcDI3q3hxfN9zpE6bOWoavDyKQmlWxGpB2
 3fRjrdzxtEQYXXbQLgzGCFFJZOs/8GQPFm17WxmCqZpAbE7YZlchM/5Z8godf4cjZ6PMLCWzAsc1B
 2U9qZGRA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1iYC-00057S-O2; Sat, 01 Aug 2020 03:51:14 +0000
Subject: Re: [PATCH v3 02/23] x86/numa: Add 'nohmat' option
To: Dan Williams <dan.j.williams@intel.com>, akpm@linux-foundation.org
References: <159625229779.3040297.11363509688097221416.stgit@dwillia2-desk3.amr.corp.intel.com>
 <159625231266.3040297.2759117253481288037.stgit@dwillia2-desk3.amr.corp.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <545078f8-d6d3-5db7-02f6-648218513752@infradead.org>
Date: Fri, 31 Jul 2020 20:51:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159625231266.3040297.2759117253481288037.stgit@dwillia2-desk3.amr.corp.intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:37 +0000
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
Cc: x86@kernel.org, linux-acpi@vger.kernel.org, ard.biesheuvel@linaro.org,
 Peter Zijlstra <peterz@infradead.org>, vishal.l.verma@intel.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, joao.m.martins@oracle.com,
 linux-nvdimm@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/31/20 8:25 PM, Dan Williams wrote:
> Disable parsing of the HMAT for debug, to workaround broken platform
> instances, or cases where it is otherwise not wanted.
> 
> ---
>  arch/x86/mm/numa.c       |    2 ++
>  drivers/acpi/numa/hmat.c |    8 +++++++-
>  include/acpi/acpi_numa.h |    8 ++++++++
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> index 87c52822cc44..f3805bbaa784 100644
> --- a/arch/x86/mm/numa.c
> +++ b/arch/x86/mm/numa.c
> @@ -41,6 +41,8 @@ static __init int numa_setup(char *opt)
>  		return numa_emu_cmdline(opt + 5);
>  	if (!strncmp(opt, "noacpi", 6))
>  		disable_srat();
> +	if (!strncmp(opt, "nohmat", 6))
> +		disable_hmat();

Hopefully that will be documented in
Documentation/x86/x86_64/boot-options.rst.

>  	return 0;
>  }
>  early_param("numa", numa_setup);

thanks.
-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
