Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E6CCCD88D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 21:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C255510EB4D;
	Thu, 18 Dec 2025 20:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QFiHIAdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com
 [74.125.224.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577DD10EB4D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 20:33:49 +0000 (UTC)
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-6446c2bbfe3so911893d50.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 12:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766090028; x=1766694828; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wxI1KcKPoVD1Uiga6uN/7Y0Mz7a7b0eOjCBdzKpvt0Q=;
 b=QFiHIAdId1xARLTOGe4tzKB2z/Q0c5XEAGkWOMRmtYqGtDJ7s9070RfT+T1n6Ppp3a
 SQ4Q/YdqoOjJFAeqMRxS5pzLX3zMhkX2PkDDzHSIssXrodQQjTxgtVl+yuTpZNNUPZVS
 bhKaFudi64h4KySiZuhbjpxbBGCzmbgm0LSnSk/NX/xybYKFPonNXBYdVaK5urd3JcVs
 c2Ug5Jta8ioI78NaGLpG1qgh0sGeYiBV7iRj6XRCS39O7s8OCCIMFLstIwJh8sGB0dbj
 pKRgBvFNJfqhQxLE7ECdUZvLn0nKQDRwRVZRw+DcjyTf2CMvZLhigak6gidAtCzrHHHW
 S90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766090028; x=1766694828;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wxI1KcKPoVD1Uiga6uN/7Y0Mz7a7b0eOjCBdzKpvt0Q=;
 b=SDpptv6bkLlfsBlA6ea9jnTtFWytze0z73n7O0p8KSFoAy/rTykI+jnqs1a8JXpqUr
 z1JQWoW/MLipq6Qszi9r9P8AlFXO8dLeeGgqnifMxTfSFn1aYNwWcdnPhOvWng7rYSGd
 K8HSXFhWhojTZ3S+LqmKfbLMvw6S5EKUc0NY7RgmdicMSiG+hmfxtFcgEgo62PIMnB9G
 UDBO6MMkbPXRbPIG/BKgYHuhjN2B9SFaOFg+Yb30KHgrCzqLbU+cvYZIwqmkqb+Ax604
 h7aI2vBnI/XlwUe0dzA/5KKSMvhU2uNgMwISkKGQC8/QaROwUyI6uavulaDMGwPIUyzv
 LVvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAlsp2ZJarIJyWJlnIgLwtcg7GQiHa9gCAmmUoCzNLHYGxWZ6sZHkmO8qN0BlGXSojokXEHpca7As=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRhLanVy5jbJS4kT4oY2PMAzQx7bsTWUp+01SwOQITNVzhbSKP
 zGfZwzvpZXin3tcYD4kcwdPOXEsfVA/XBmqc5OLuDiyGW4ldU4AKlv9T
X-Gm-Gg: AY/fxX5fxu1zhKYaejAM2nGW5cPwlQ3Q71raYwcPrJBDEkvmbq9I6Wvp0Q07Q4Cxols
 4BMbTriZAcNkjjfYvg2J6DmQQ6kaFfn3zY1scMOPTMdeStW+AS/RdSpa5Qe1wzVdPHVkEEXD1cQ
 Zb60SqrswKbUXEYztEYJSRg+j5/2YYOj1EstqPN2RPHf0S7lM5ai9Y43ovd6f2bNXf5EODc/eIF
 +xytct9PFNfA7RefOs9L7BKJTr2YffQlQ4rH7KDkEoss6QXccRJyseF+XhfcmwLNFX8jEED8wS7
 SEYQZgvj4Nm/mMK//j9LCx0UeB0RGZwLmak8KLfN2EgRdduyFsPha7NLKmw0vziIPF3dwW5A9PO
 jwsFLBN21pBRy9G3hWecsF1IBHsN8573VuLYBJZJuVwOUdCccC30lg2q3cYBRjUT7H4iqUimJ9U
 EgCjZX2A==
X-Google-Smtp-Source: AGHT+IFAJX9V2Yp2+qH1WSekUJE1tGwEk4Z57sP9mJ9kbl5NsNmWsxGEZgOmgfyGAsihFkzwCzGJlg==
X-Received: by 2002:a05:690e:1a48:b0:641:f5fa:e9be with SMTP id
 956f58d0204a3-6466a844cbcmr429969d50.34.1766090028008; 
 Thu, 18 Dec 2025 12:33:48 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:c44b:debe:992d:e6a])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6466a8bcc06sm220174d50.7.2025.12.18.12.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 12:33:47 -0800 (PST)
Date: Thu, 18 Dec 2025 15:33:47 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 4/4] tracing: move tracing declarations from kernel.h
 to a dedicated header
Message-ID: <aURlK1gpCrfLEKN9@yury>
References: <20251205175237.242022-1-yury.norov@gmail.com>
 <20251205175237.242022-5-yury.norov@gmail.com>
 <20251216161316.45b3f19ff0ad482018137189@linux-foundation.org>
 <55ceb7bf-0fe9-4edc-81c2-d51366847eec@infradead.org>
 <aUN8Hm377C5A0ILX@yury>
 <20251218123349.35339242@gandalf.local.home>
 <20251218124326.22334325@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218124326.22334325@gandalf.local.home>
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

On Thu, Dec 18, 2025 at 12:43:26PM -0500, Steven Rostedt wrote:
> On Thu, 18 Dec 2025 12:33:49 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > On Wed, 17 Dec 2025 22:59:33 -0500
> > Yury Norov <yury.norov@gmail.com> wrote:
> > 
> > > I deem to drop trace_printk.h from kernel.h - it is more aligned with
> > > the idea of unloading the header. The original motivation to keep
> > > trace_printk.h in kernel.h was just because a similar printk.h is living
> > > there. But after all, this is a purely debugging header, so no need for
> > > almost every C file to bear debugging stuff.  
> > 
> > It is a big deal for debugging stuff. A lot of developers debug their code
> > with trace_printk(), and do the "shotgun approach", where they cut and
> > paste trace_printk()s all over their code in several files. Having to now add:
> > 
> >   #include <linux/trace_printk.h>
> > 
> > whenever a trace_printk() is added is going to be a big PITA and slow down
> > all debugging efforts.
> >
> 
> I don't actually remember why I had __trace_puts() pass in the size. I
> could change it to:

This is the best approach. I'll schedule it for v4. Would you like me to
take it as-is, or you'd send a patch?
 
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index 5b46924fdff5..d5a939b8c391 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -331,10 +331,10 @@ int __trace_printk(unsigned long ip, const char *fmt, ...);
>  	if (__builtin_constant_p(str))					\
>  		__trace_bputs(_THIS_IP_, trace_printk_fmt);		\
>  	else								\
> -		__trace_puts(_THIS_IP_, str, strlen(str));		\
> +		__trace_puts(_THIS_IP_, str);				\
>  })
>  extern int __trace_bputs(unsigned long ip, const char *str);
> -extern int __trace_puts(unsigned long ip, const char *str, int size);
> +extern int __trace_puts(unsigned long ip, const char *str);
>  
>  extern void trace_dump_stack(int skip);
>  
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index e575956ef9b5..686741edb803 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -1178,11 +1178,10 @@ EXPORT_SYMBOL_GPL(__trace_array_puts);
>   * __trace_puts - write a constant string into the trace buffer.
>   * @ip:	   The address of the caller
>   * @str:   The constant string to write
> - * @size:  The size of the string.
>   */
> -int __trace_puts(unsigned long ip, const char *str, int size)
> +int __trace_puts(unsigned long ip, const char *str)
>  {
> -	return __trace_array_puts(printk_trace, ip, str, size);
> +	return __trace_array_puts(printk_trace, ip, str, strlen(str));
>  }
>  EXPORT_SYMBOL_GPL(__trace_puts);
>  
> @@ -1201,7 +1200,7 @@ int __trace_bputs(unsigned long ip, const char *str)
>  	int size = sizeof(struct bputs_entry);
>  
>  	if (!printk_binsafe(tr))
> -		return __trace_puts(ip, str, strlen(str));
> +		return __trace_puts(ip, str);
>  
>  	if (!(tr->trace_flags & TRACE_ITER(PRINTK)))
>  		return 0;
> diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
> index b6d42fe06115..de4e6713b84e 100644
> --- a/kernel/trace/trace.h
> +++ b/kernel/trace/trace.h
> @@ -2116,7 +2116,7 @@ extern void tracing_log_err(struct trace_array *tr,
>   * about performance). The internal_trace_puts() is for such
>   * a purpose.
>   */
> -#define internal_trace_puts(str) __trace_puts(_THIS_IP_, str, strlen(str))
> +#define internal_trace_puts(str) __trace_puts(_THIS_IP_, str)
>  
>  #undef FTRACE_ENTRY
>  #define FTRACE_ENTRY(call, struct_name, id, tstruct, print)	\
> 
> 
> 
> Which removes the strlen() altogether.
> 
> -- Steve
