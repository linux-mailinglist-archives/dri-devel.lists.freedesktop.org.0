Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1EFB3B414
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5123810EB53;
	Fri, 29 Aug 2025 07:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LBtXepGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693E610E052
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 04:39:30 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-771ed4a8124so1792744b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 21:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756442370; x=1757047170; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YMG2hjYDplEAn5LWv3MpjvQ+a5gZ6WKPCO72/I7KThc=;
 b=LBtXepGxrTehKLBeIHTb23QoJbm+IBAZ6brQCe9laSd1RU81Vv4rv7IO8H6e4wIUW+
 02RphiFaEWBT6/bmpUKvbuH/vcqA7tIe2GJst6nWco43yfvGNxN4/Quh0Pj/YriqFNbt
 kGHEj/IIQHohrVSuRhh/XoFhgrY+ZVcrflUrPdMHqhWI3As1Yu5tW35QZyobVwPPGGPp
 xmUQk2i5ITQ7OYZ09EY+bAGj1avh9qplcvb3V5rB1ZfDSFP8CRE8TdcxPpGD+qgYuLoK
 SB7afndZxVmFfYT/4Ng4j99M/74P1nLM09qSV4fa8uBIEzF/E2RIiI5WJ1aei+ToR2lM
 k6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756442370; x=1757047170;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YMG2hjYDplEAn5LWv3MpjvQ+a5gZ6WKPCO72/I7KThc=;
 b=rNS5nVFZe3xam2o0LeXSUg733T3n4f8+E7OwdxLtPf8ZIHhUAGo6UBh98eufLNulM6
 HjvIGGycLZomP14oF/9Xn1DqjU1KKBfZubGxZ5CyLClfdB3g+z8F0oN4iAqRZgu3C5QY
 iGBjbtcXLrZWUSM1Qqh4E7fVg5mwAipL54E5uwskApoPOKyNQPTkPAYfNcG2Ttz9uvzH
 ESmVaZyp/dE6YvmW4rWJCwSz1Nxms0+CNwmucfnAd9pt68NMpRAI0tRRRGsk7drPYet8
 ckYK27Kaml0kGtkHqxzKYny0THOADbtrwgCR4jzPIvIuseXRxMbGRHdRXWUIj+6h6q/Z
 14iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6rCZMGtXz8txEQ3YwUrZUzD7uj2TB8GNtSViYEoRi23oV0uKNOpvZ9fVUEV5QrY79QmKLiT+ZNHE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbVN7QIing3SjSMbHyCyI+hu6HGY6ORhFZr/lhqE2wA0xgqmaK
 ijC1xE6TIDymkZJHmu27LilrUpIolvigQeF4r1Wx4/Cfgtp7h1MDpMlm
X-Gm-Gg: ASbGncucISNNXwlTTHE36GAix+K1l2zji8m0mDYzhWshTD5pG+AwR5LjxNhZaIw8L2o
 58SU22I3AF2yLFUYl/umNMcm/5BceoOLHqQNYJ57f1wGp57pkhR5tKgoOUV4PwEdJWPunF6qyXQ
 j4UZ2DVN1gQ9OI8TctI/+PaEmk+IrRnr2mAYmndua0UjlIjPDiEsKmLx9hrogNevZBiWR+/0js0
 2own2XmtwvBF8jmPoFXfiE3V/BSsM/wrhm2eLAyqpebkA9g6QA7hKtznMdneIIGIbOsu89uNIC5
 FkUOkfaUFABnasNzHIQcWQMPg6AWq2ORqkUw7zw4vt3Zl4VEYSJHUC3tipbMUtfBHEan1NgJ+Oq
 7BTjGX9qC7pTu0T1WeJY25rwQQJcR/IjusCcKyIH2VzoTMa4=
X-Google-Smtp-Source: AGHT+IGJUc7Yk+JHWAKY9iaRV2EhpE+ow/DVQcP8YQgFsIIxjRV2hvCIR3RWEDtRtL041w/+SYnwCQ==
X-Received: by 2002:a05:6a00:bd92:b0:76b:f7af:c47d with SMTP id
 d2e1a72fcca58-7702f9df039mr32683745b3a.4.1756442369806; 
 Thu, 28 Aug 2025 21:39:29 -0700 (PDT)
Received: from [127.0.0.1] ([103.88.46.62]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26a4e5sm1070875b3a.19.2025.08.28.21.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 21:39:29 -0700 (PDT)
Message-ID: <58e87116-a8af-4c8f-b5b4-3d0540cd3333@gmail.com>
Date: Fri, 29 Aug 2025 12:39:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] crash_core: use panic_try_start() in crash_kexec()
To: Qianqiang Liu <qianqiang.liu@163.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Yury Norov <yury.norov@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Shixiong Ou <oushixiong@kylinos.cn>, Zsolt Kajtar <soci@c64.rulez.org>,
 Ingo Molnar <mingo@kernel.org>, Nam Cao <namcao@linutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Joel Granados <joel.granados@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Sohil Mehta <sohil.mehta@intel.com>, Feng Tang
 <feng.tang@linux.alibaba.com>, Sravan Kumar Gundu
 <sravankumarlpu@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna Schumaker <anna.schumaker@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Max Kellermann <max.kellermann@ionos.com>,
 Yunhui Cui <cuiyunhui@bytedance.com>, Tejun Heo <tj@kernel.org>,
 Luo Gengkun <luogengkun@huaweicloud.com>, Li Huafei <lihuafei1@huawei.com>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250825022947.1596226-1-wangjinchao600@gmail.com>
 <20250825022947.1596226-4-wangjinchao600@gmail.com>
 <aLEQy-srX89Rndch@debian.debian.local>
Content-Language: en-US
From: Jinchao Wang <wangjinchao600@gmail.com>
In-Reply-To: <aLEQy-srX89Rndch@debian.debian.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 29 Aug 2025 07:17:00 +0000
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

On 8/29/25 10:30, Qianqiang Liu wrote:
> On Mon, Aug 25, 2025 at 10:29:31AM +0800, Jinchao Wang wrote:
>> crash_kexec() had its own code to exclude parallel execution by setting
>> panic_cpu. This is already handled by panic_try_start(). Switch to
>> panic_try_start() to remove the duplication and keep the logic consistent.
>>
>> Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
>> ---
>>   kernel/crash_core.c | 15 +++------------
>>   1 file changed, 3 insertions(+), 12 deletions(-)
>>
>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>> index a4ef79591eb2..bb38bbaf3a26 100644
>> --- a/kernel/crash_core.c
>> +++ b/kernel/crash_core.c
>> @@ -4,6 +4,7 @@
>>    * Copyright (C) 2002-2004 Eric Biederman  <ebiederm@xmission.com>
>>    */
>>   
>> +#include "linux/panic.h"
> 
> Can you change this line of code to #include <linux/panic.h>?
Yes, I will.
Thanks for the feedback.>
>>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>   
>>   #include <linux/buildid.h>
>> @@ -143,17 +144,7 @@ STACK_FRAME_NON_STANDARD(__crash_kexec);
>>   
>>   __bpf_kfunc void crash_kexec(struct pt_regs *regs)
>>   {
>> -	int old_cpu, this_cpu;
>> -
>> -	/*
>> -	 * Only one CPU is allowed to execute the crash_kexec() code as with
>> -	 * panic().  Otherwise parallel calls of panic() and crash_kexec()
>> -	 * may stop each other.  To exclude them, we use panic_cpu here too.
>> -	 */
>> -	old_cpu = PANIC_CPU_INVALID;
>> -	this_cpu = raw_smp_processor_id();
>> -
>> -	if (atomic_try_cmpxchg(&panic_cpu, &old_cpu, this_cpu)) {
>> +	if (panic_try_start()) {
>>   		/* This is the 1st CPU which comes here, so go ahead. */
>>   		__crash_kexec(regs);
>>   
>> @@ -161,7 +152,7 @@ __bpf_kfunc void crash_kexec(struct pt_regs *regs)
>>   		 * Reset panic_cpu to allow another panic()/crash_kexec()
>>   		 * call.
>>   		 */
>> -		atomic_set(&panic_cpu, PANIC_CPU_INVALID);
>> +		panic_reset();
>>   	}
>>   }
>>   
>> -- 
>> 2.43.0
> 


-- 
Best regards,
Jinchao
