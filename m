Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83333CCD930
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 21:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D277510E23A;
	Thu, 18 Dec 2025 20:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FJW0QYje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B402710E23A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 20:52:20 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-644715aad1aso1299754d50.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 12:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766091140; x=1766695940; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hFDV1spVh/axh1lyx/WAElGBcEI9dw5Gpw/DvU/t3OY=;
 b=FJW0QYje41VC/tGfeAVx0UWuT8LbA7RlKtXtB3Ht84R/gTCDI9/oyTRQW29yYX9VPu
 HED6F+xv8+BwLqxJhZu4q/0ERiRPDLTWoz+/zTramezQF9dNtqigMtaoSVVGE+fm6uK9
 9mqQkJD7k0q/ovoiplsWNbc+VmWh3pNA4Kl2WZ+SNWM0cWmpCbrwxzsMxTYyjOR5t0HX
 uEXA4YC4zrgVJ3xG7lqr53Zm+bnONF/3SLxP86YUZDj6/cAZ826P/5NU25SWUIJd6lX9
 11CdT2qNogl8hUOtpwIO0eFKWtlarZv9oftFZ3INM6xfvd+1yIthXiIO+lB40CCSEx/q
 Udaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766091140; x=1766695940;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hFDV1spVh/axh1lyx/WAElGBcEI9dw5Gpw/DvU/t3OY=;
 b=MWeNaZ0binJwZDbKybEdOmQTFzcExynsRqVIM/pEMBFfO31537gjaZO4lijouCxnpJ
 TlP003DiP2I13pgl7X0hDWoVVjaiNlWCUf687rL2qCT+0P+Zg2drxMgijbT7FpwhiUCj
 6EHsZ34CPb7qNFmJZ42q8Byh+MCC6DtXec4tK7po2xYwVTt2RYto0S0Xfw3NvicskCrX
 FXvqLcMY5FA0QllroHxu/0+gMeFxZMafSG6srC4gtPJmsR6afDf2I7BX9JKjY1JbSX/1
 GZRh0V6ybhexWp/qZRrbmHU5o2lz/4OCE2PofaMMtVhj1Vn7aG3+WjMSFqmtHwuDV3UN
 9NlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU/7NtfEaIqF+ljh+KXwpIwk2209RCZvI+YxV4zsUNWzDcHt34aJ1df8Z8Yvh6yQ5/J7NVx+sKZsI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywzv6/ELCQfI7clZ0oiqtuvemtFfzaEm6Ew8K6jd4qMHyn1z+gd
 9F1CWFlJekFqJs+TO0gLe9J/eZiif7k0gojNxTef5BNatACVvu4s488K
X-Gm-Gg: AY/fxX5fqBlfLh6TVEcGnwDGiPXAu6wevvhS5o/9nVsvP42b/2kMzXgRjqwwPL5P5pD
 IBvy6Q6mdurY1pMqeM4QHf/y+qCr/Lm0Iq3PpMUtMWkWQBMzX8naqPf2ZSRcFtf6G3NzlASMzlb
 b9snub5bQq9XtSqrWGV1AK8/JmCmdEG1m18MYcBtKGevCS9iRiIkUVJoMWHuetJV4hwJuwBwUf7
 pyrkev3x/FGH5KRf+R7WQEhb1YaOf+RlHyghbIvHxKckkvG3tihMs3AqfyPf7CeTRgUAUuqhsQ/
 +wfyhe96PyHNHZp/9Yjiz/Ow2f0JKsczz4R2HpYwL8LWQyGu0RxJb5elZR2LlTI9POreymNJTQI
 zXWw0q3cKTsbW97JC4nG+N3yO0xJ2xLZC1wkcYk4xGrpxyY4OPbvkk3BBTq8W8t7dPRkUssDhpa
 hDze+xhA==
X-Google-Smtp-Source: AGHT+IFKJgg2mFtYeRpAZPfX2mtS+pdy3ddv+t7myY/XFxqvRRKbskRVQyl2Y5hOxjA0iZJLraQFNQ==
X-Received: by 2002:a05:690e:1248:b0:644:5166:3065 with SMTP id
 956f58d0204a3-64669d87d09mr709918d50.21.1766091139724; 
 Thu, 18 Dec 2025 12:52:19 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:c44b:debe:992d:e6a])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78fb44f9a42sm1763817b3.29.2025.12.18.12.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 12:52:19 -0800 (PST)
Date: Thu, 18 Dec 2025 15:52:18 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
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
Message-ID: <aURpgm7csvlGzSoS@yury>
References: <20251205175237.242022-1-yury.norov@gmail.com>
 <20251205175237.242022-5-yury.norov@gmail.com>
 <20251216161316.45b3f19ff0ad482018137189@linux-foundation.org>
 <55ceb7bf-0fe9-4edc-81c2-d51366847eec@infradead.org>
 <aUN8Hm377C5A0ILX@yury>
 <20251218123349.35339242@gandalf.local.home>
 <95f0c65b-15ff-45db-9845-579f7adf4c86@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95f0c65b-15ff-45db-9845-579f7adf4c86@infradead.org>
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

On Thu, Dec 18, 2025 at 10:34:07AM -0800, Randy Dunlap wrote:
> 
> 
> On 12/18/25 9:33 AM, Steven Rostedt wrote:
> > On Wed, 17 Dec 2025 22:59:33 -0500
> > Yury Norov <yury.norov@gmail.com> wrote:
> > 
> >> I deem to drop trace_printk.h from kernel.h - it is more aligned with
> >> the idea of unloading the header. The original motivation to keep
> >> trace_printk.h in kernel.h was just because a similar printk.h is living
> >> there. But after all, this is a purely debugging header, so no need for
> >> almost every C file to bear debugging stuff.
> > 
> > It is a big deal for debugging stuff. A lot of developers debug their code
> > with trace_printk(), and do the "shotgun approach", where they cut and
> > paste trace_printk()s all over their code in several files. Having to now add:
> > 
> >   #include <linux/trace_printk.h>
> > 
> > whenever a trace_printk() is added is going to be a big PITA and slow down
> > all debugging efforts.
> 
> Eh? Maybe a PITA, but surely not a big one.
> Slow down "all debugging efforts?"
> Please cut down on the hyperbole.

For me, removing trace_prink.h saves 1.5-2% of compile time:

Before:                         
#1 real	5m12.602s               
#2 real	5m11.333s               

After:
#1 real	5m6.190s
#2 real	5m7.151s

I'm building ubuntu-derived localyesconfig with a couple extra drivers.
Steven, if you're not absolutely against, lets drop the trace_printk.h?

Thanks,
Yury
