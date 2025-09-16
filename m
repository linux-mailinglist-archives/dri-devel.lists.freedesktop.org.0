Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42445B592C7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 11:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B2F10E767;
	Tue, 16 Sep 2025 09:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="T2Jm5xdL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1039B10E771
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 09:57:17 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b07d4d24d09so271551766b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 02:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1758016635; x=1758621435; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6HInf3vVICYvsjl1BbLw9IcLOL1iDFPRtoXvi2r6kSo=;
 b=T2Jm5xdLk+jjjijB5f8YBg5FCbKdFUo8OtuEoBK9dSFBrmUU7lZemIN0OrF2/BHpq7
 V7z3J8GKUeYQydrcq6R2gOrB5+mX3E2OTmjcimgkg0HWODu7fuD2YQQiWOpecp8MTz23
 Z08kG9jgS5EHFldM9d78mvT9igLmcUH3LOrkaW0Hoo8KAD+nU1oRIgtFtuXl45++i0Yj
 eL/yPQ4BSNg9bOeQ21XL5OtC/toCpJ7/JYw7DdO8CmsAafzJClcDmpmTkiRlW5JtR98K
 IxzmKaRTaqp65z3KWXIPyIV1K08cQxHRXOcTr+u679+hksR3B9IDpQ1plrv6vmkqaNHi
 J3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758016635; x=1758621435;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6HInf3vVICYvsjl1BbLw9IcLOL1iDFPRtoXvi2r6kSo=;
 b=cBtC1LGABEmUn2l6woZYlWVnqZnQiuD8YihICXpA0ujjRk3a5qVUPupbdBe+7rMmKE
 69eAtkqL2mHjXacKXlWAoHqpJthMVI64gipeHdyNbF88+OA67HnwEmZRtT7/iB7rcWc7
 VirLqC+tLCHUe8ak4dFD19E1nt7YYgO3o6Dgkvoy9NtihH2AS7+sc4ELFqzES0/iKQjL
 WjGUnoEwXIA+TUXQ9FY6DfbolHVE3asYjalspUAmVls9FZKDaOI9j88QAsy+pVfEj/83
 K59bqTnzAel+ZXVek3y0wi98LdTRc1b3i40usuk1vXyUOyDpsEyAUodka03kLXFoxryr
 YOQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX5Hzlw0mWXsQ0lnug7/PeUA8mGVUGH6bPcdSaHp0yPJmP00Yj72YTNGnpNhY5EVjuUxTJP4lH8ZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNHLoGnOyzS1Nto3hUULu2k02RnsNvJkBg288hriiu824qivBX
 5GHQVBD48KN4LUp1G7az/frpdmFPT9Z7WZ65VHfdRrt86S3n3539WLr9ts8IOwTVTdQ=
X-Gm-Gg: ASbGncs1JXzT5SJfyHO4WxV+VsihlElU8glHSOQNSGgv+tn5z3+FNKtl4Qg+UMlwJAu
 1M9TyEdcy54jhl36WSOk5AhxqfX4A4gg3pF4ON2bCuwsppmdNZWl/vKFVzxyqZrYn9WAXR0CfD1
 ZyKsy1Nyk0mX61RYEf4G58l2WQNoZZ3bSv0wHni1LfNjWKZYby1jta23m2XkB+PWaxc8WwR4ykp
 RiIOsCWzjmAkHNci0zg7EjUeeLDECfEqpTNEXHdd+Mzjl/njgqqoZrmqwfNzF7F+Y4H1Ho1plTy
 9BO8HBG0H0tgAVxiTmtC6aE8pUrg4tdq3QIE4f0tcIZ8lkuqW/4w3BKKIgQq0HSPRGwRPwNdzMY
 O301u0MeZVVv62aUtEeqA8aejNYr7Jwq0qi1lHwfB
X-Google-Smtp-Source: AGHT+IHumhbFeoKijO1bIfbeRN7muXKT3iQrz7PNZcfL0Hw4Nuwk0HrRa1xVrQAwNjSiMUzT+ONYBQ==
X-Received: by 2002:a17:907:3e9e:b0:b04:5cca:9988 with SMTP id
 a640c23a62f3a-b07c38699ffmr1699588866b.43.1758016634556; 
 Tue, 16 Sep 2025 02:57:14 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b31291b0sm1128497566b.34.2025.09.16.02.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 02:57:14 -0700 (PDT)
Date: Tue, 16 Sep 2025 11:57:11 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Yury Norov <yury.norov@gmail.com>, Qianqiang Liu <qianqiang.liu@163.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
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
Subject: Re: [PATCH v2 1/9] panic: Introduce helper functions for panic state
Message-ID: <aMk0d5JO_4YECYGY@pathway.suse.cz>
References: <20250825022947.1596226-1-wangjinchao600@gmail.com>
 <20250825022947.1596226-2-wangjinchao600@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825022947.1596226-2-wangjinchao600@gmail.com>
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

On Mon 2025-08-25 10:29:29, Jinchao Wang wrote:
> This patch introduces four new helper functions to abstract the
> management of the panic_cpu variable. These functions will be used in
> subsequent patches to refactor existing code.
> 
> The direct use of panic_cpu can be error-prone and ambiguous, as it
> requires manual checks to determine which CPU is handling the panic.
> The new helpers clarify intent:
> 
> panic_try_start():
> Atomically sets the current CPU as the panicking CPU.
> 
> panic_reset():
> Reset panic_cpu to PANIC_CPU_INVALID.
> 
> panic_in_progress():
> Checks if a panic has been triggered.
> 
> panic_on_this_cpu():
> Returns true if the current CPU is the panic originator.
> 
> panic_on_other_cpu():
> Returns true if a panic is on another CPU.
> 
> This change lays the groundwork for improved code readability
> and robustness in the panic handling subsystem.
> 
> Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
> ---
>  include/linux/panic.h  |  6 +++++
>  kernel/panic.c         | 53 ++++++++++++++++++++++++++++++++++++++++++
>  kernel/printk/printk.c |  5 ----
>  3 files changed, 59 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/panic.h b/include/linux/panic.h
> index 7be742628c25..6f972a66c13e 100644
> --- a/include/linux/panic.h
> +++ b/include/linux/panic.h
> @@ -43,6 +43,12 @@ void abort(void);
>  extern atomic_t panic_cpu;
>  #define PANIC_CPU_INVALID	-1
>  
> +bool panic_try_start(void);
> +void panic_reset(void);
> +bool panic_in_progress(void);
> +bool panic_on_this_cpu(void);
> +bool panic_on_other_cpu(void);
> +
>  /*
>   * Only to be used by arch init code. If the user over-wrote the default
>   * CONFIG_PANIC_TIMEOUT, honor it.
> diff --git a/kernel/panic.c b/kernel/panic.c
> index 72fcbb5a071b..eacb0c972110 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -294,6 +294,59 @@ void __weak crash_smp_send_stop(void)
>  
>  atomic_t panic_cpu = ATOMIC_INIT(PANIC_CPU_INVALID);
>  
> +bool panic_try_start(void)
> +{
> +	int old_cpu, this_cpu;
> +
> +	/*
> +	 * Only one CPU is allowed to execute the crash_kexec() code as with
> +	 * panic().  Otherwise parallel calls of panic() and crash_kexec()
> +	 * may stop each other.  To exclude them, we use panic_cpu here too.
> +	 */
> +	old_cpu = PANIC_CPU_INVALID;
> +	this_cpu = raw_smp_processor_id();
> +
> +	return atomic_try_cmpxchg(&panic_cpu, &old_cpu, this_cpu);
> +}
> +EXPORT_SYMBOL(panic_try_start);
> +
> +void panic_reset(void)
> +{
> +	atomic_set(&panic_cpu, PANIC_CPU_INVALID);
> +}
> +EXPORT_SYMBOL(panic_reset);
> +
> +bool panic_in_progress(void)
> +{
> +	return unlikely(atomic_read(&panic_cpu) != PANIC_CPU_INVALID);
> +}
> +EXPORT_SYMBOL(panic_in_progress);
> +
> +/* Return true if a panic is in progress on the current CPU. */
> +bool panic_on_this_cpu(void)
> +{
> +	/*
> +	 * We can use raw_smp_processor_id() here because it is impossible for
> +	 * the task to be migrated to the panic_cpu, or away from it. If
> +	 * panic_cpu has already been set, and we're not currently executing on
> +	 * that CPU, then we never will be.
> +	 */
> +	return unlikely(atomic_read(&panic_cpu) == raw_smp_processor_id());
> +}
> +EXPORT_SYMBOL(panic_on_this_cpu);
> +
> +/*
> + * Return true if a panic is in progress on a remote CPU.
> + *
> + * On true, the local CPU should immediately release any printing resources
> + * that may be needed by the panic CPU.
> + */
> +bool panic_on_other_cpu(void)
> +{
> +	return (panic_in_progress() && !this_cpu_in_panic());
> +}
> +EXPORT_SYMBOL(panic_on_other_cpu);
> +
>  /*
>   * A variant of panic() called from NMI context. We return if we've already
>   * panicked on this CPU. If another CPU already panicked, loop in
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 0efbcdda9aab..5fe35f377b79 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -345,11 +345,6 @@ static void __up_console_sem(unsigned long ip)
>  }
>  #define up_console_sem() __up_console_sem(_RET_IP_)
>  
> -static bool panic_in_progress(void)
> -{
> -	return unlikely(atomic_read(&panic_cpu) != PANIC_CPU_INVALID);
> -}
> -
>  /* Return true if a panic is in progress on the current CPU. */
>  bool this_cpu_in_panic(void)
>  {

All the functions are trivial. It would make sense to define
them in linux/panic.h. Then the callers would benefit
from the (unlikely) prediction macro...

It can be done in a followup path.

Otherwise, the patch looks good. I think that it is too late
but feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
