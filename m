Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA4BB3B104
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 04:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5105B10EB2A;
	Fri, 29 Aug 2025 02:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="hjl7ZbxX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2923510EB2A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 02:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type; bh=/NSh9exXaV3mbXvMj+1kS4uqG4EyWHM1miHRNzuQSLM=;
 b=hjl7ZbxXK4eydWkCtecrgKvGYg5I86g18ky3ymLIRDCGQEiXg+YpeQk0mtqz3u
 TcsOAAYx83eG5JvkPjFVOLp5AFw6PBUrL2gzr/x40bkZGxFU6kYtbPjchN3nB0Ac
 ERsjwcm3G0RyaJqqVB/3imrXd2wNw65O98jPpSFE3UYcI=
Received: from localhost (unknown [])
 by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id
 _____wD3HznMELFo1sYnEw--.1949S2; 
 Fri, 29 Aug 2025 10:30:37 +0800 (CST)
Date: Fri, 29 Aug 2025 10:30:35 +0800
From: Qianqiang Liu <qianqiang.liu@163.com>
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Yury Norov <yury.norov@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Shixiong Ou <oushixiong@kylinos.cn>,
 Zsolt Kajtar <soci@c64.rulez.org>, Ingo Molnar <mingo@kernel.org>,
 Nam Cao <namcao@linutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Joel Granados <joel.granados@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Sohil Mehta <sohil.mehta@intel.com>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 Sravan Kumar Gundu <sravankumarlpu@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
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
Subject: Re: [PATCH v2 3/9] crash_core: use panic_try_start() in crash_kexec()
Message-ID: <aLEQy-srX89Rndch@debian.debian.local>
References: <20250825022947.1596226-1-wangjinchao600@gmail.com>
 <20250825022947.1596226-4-wangjinchao600@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825022947.1596226-4-wangjinchao600@gmail.com>
X-CM-TRANSID: _____wD3HznMELFo1sYnEw--.1949S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF47JFy8JFyUCw18tr1rCrg_yoW8AFW7pF
 1ayay7Kw4kuFn5Kwn7JrsrtF4Fvw48JayxJa4vvF1fAasxJr15Jryv934xtFWjg343Kw1r
 AF12g3Zag398XFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziuT5PUUUUU=
X-Originating-IP: [60.166.106.45]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiYhq3amiwW6b1mwABsv
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

On Mon, Aug 25, 2025 at 10:29:31AM +0800, Jinchao Wang wrote:
> crash_kexec() had its own code to exclude parallel execution by setting
> panic_cpu. This is already handled by panic_try_start(). Switch to
> panic_try_start() to remove the duplication and keep the logic consistent.
> 
> Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
> ---
>  kernel/crash_core.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index a4ef79591eb2..bb38bbaf3a26 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2002-2004 Eric Biederman  <ebiederm@xmission.com>
>   */
>  
> +#include "linux/panic.h"

Can you change this line of code to #include <linux/panic.h>?

>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/buildid.h>
> @@ -143,17 +144,7 @@ STACK_FRAME_NON_STANDARD(__crash_kexec);
>  
>  __bpf_kfunc void crash_kexec(struct pt_regs *regs)
>  {
> -	int old_cpu, this_cpu;
> -
> -	/*
> -	 * Only one CPU is allowed to execute the crash_kexec() code as with
> -	 * panic().  Otherwise parallel calls of panic() and crash_kexec()
> -	 * may stop each other.  To exclude them, we use panic_cpu here too.
> -	 */
> -	old_cpu = PANIC_CPU_INVALID;
> -	this_cpu = raw_smp_processor_id();
> -
> -	if (atomic_try_cmpxchg(&panic_cpu, &old_cpu, this_cpu)) {
> +	if (panic_try_start()) {
>  		/* This is the 1st CPU which comes here, so go ahead. */
>  		__crash_kexec(regs);
>  
> @@ -161,7 +152,7 @@ __bpf_kfunc void crash_kexec(struct pt_regs *regs)
>  		 * Reset panic_cpu to allow another panic()/crash_kexec()
>  		 * call.
>  		 */
> -		atomic_set(&panic_cpu, PANIC_CPU_INVALID);
> +		panic_reset();
>  	}
>  }
>  
> -- 
> 2.43.0

-- 
Best,
Qianqiang Liu

