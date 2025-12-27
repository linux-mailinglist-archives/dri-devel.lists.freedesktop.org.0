Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F7CE017A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 20:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7187C1131C7;
	Sat, 27 Dec 2025 19:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W2QyQPuF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com
 [74.125.224.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A671131C7
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:35:55 +0000 (UTC)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-6432842cafdso7047826d50.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 11:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766864155; x=1767468955; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZscOEY94JtpqTuF2Rte0ITMRfXFqnWcGnNUyPWqzXog=;
 b=W2QyQPuFiXSJhkcSjIQP//1Ccl6cuYhEONxIVW0ReHvpyN8miU/5EwTFm2bGVu+ZnZ
 Ga84mpXs+WgPXnnCqTEc2pMAoUG5buTzJ/B5hkbPCjiDGlOdnk+8xzSvzRY141eh/cOa
 KKbLuT42lHgCwura+mztU9HgBRhTnjm6zw1c+zvMujdfceFnXpNG780F6wK7w9Pb6iTT
 gO3fgvTsZO7jCAvjRT+dFrk5THy13rj6x8oouJIZ+6bq3QTR/mSDJxowhYnIIC8hs2K3
 bxfIhLGd2znLQOmFPr7LIHlGQKGf9vAwMlDgwA/PiFMYvnr9TO1fGswee9FlWgbMee21
 6L3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766864155; x=1767468955;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZscOEY94JtpqTuF2Rte0ITMRfXFqnWcGnNUyPWqzXog=;
 b=UpBvKrvcHnMmIyZ5ltbsTCz0MrU3vlS97DaFbLZ96O9LQU1ZTlufM92tIIpM/sSQRn
 06jdOWWMFKUXqfmP4Y4Pt+l2Qj4tod/uWPj5w//BnU4oaIjd9Lmq051Kw0QETBLqOUNj
 NrVwnZO6OEopimMW2sTSDaEIVxtWimZEpRQ7L8iUh/h/K8xS8BfKpElq5CVvilIvQf4L
 h4614bWaE4k1wZRa/15Krv/kV71P8I9L8/3dZ1AysSfJvcfKYjtEd2B/0+nB5zjPwYhI
 ihu2MNI9vRkd+qiMiLHYDv85QluupYpt3xVlEpZqbAMTKvCO/+v35n1AgAxEi9VWPj4N
 LYuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr27p9eiBW7y9kO8dQK8vHiW8jl3p98hdTIWNclawF6xlr6rb88nf2FbiETv6wPx2jCPZjkoX6KAI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw585VfJggkH6dy1D2Do3f4eyItbos+dKsYIVznkX/tXv5dcDOg
 RgdsVm32WNodsr+wk3oeQilHSuLbf8FE1+/lPrtnbQ1EceXw0N2+Ci9r
X-Gm-Gg: AY/fxX7+nuG/KuDtwFBO36EBssQy1GILlzIZqwxQpgXjquVAGU1P2rtqtIJOGtmlFnQ
 ZJv8Ub1N3BMU2lDunY5U6v+El09klMHSkUr6jNUThSI+rgKlWDJ45BOKtlNisLEnzZJ/IpQpi6v
 xa/TT6qm7aTLbbZYqUU0Wu40R+KPs2RKDzq45w798HTLtWJdWeq9RG+4yuWsYWXJeLpLITrSC3I
 Vk+9+JvyhpxNea44/bgL5vP8YjsNdtEeAIJWHwgzNJKJEsPj7DNBC6185b6J069UPqw6B5hXcc7
 X24rYExPzEEcg4ymFMDc9Zk2dZ/Sli5ZiNPUvIHxws2ZPvMVNqZkSn1+AadAO7KOL0btkwgYwUU
 OGqCLhFCW62eS54VveyImX9XbyPp1mAPTtlnC6M2+9yKPATYZe2+lGHIkaOwLY1mDUxklEJuioL
 9ehCmoJhU=
X-Google-Smtp-Source: AGHT+IFTyqtO8AIMR6I5RrW0NJVOngvdnp5kCSpfYPRgSEcWGvPmUWwG/Vuj1vc27aG6932toBOBHQ==
X-Received: by 2002:a05:690e:4106:b0:644:60d9:865e with SMTP id
 956f58d0204a3-6466a8ede93mr19913042d50.97.1766864154604; 
 Sat, 27 Dec 2025 11:35:54 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:f47d:8af8:869d:704b])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6466a8bd4c3sm12689811d50.8.2025.12.27.11.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 11:35:53 -0800 (PST)
Date: Sat, 27 Dec 2025 14:35:52 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Message-ID: <aVA1GGfWAHSFdACF@yury>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <aU_xG7pK9iauff65@smile.fi.intel.com>
 <20251227105701.5cbeb47e@robin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227105701.5cbeb47e@robin>
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

On Sat, Dec 27, 2025 at 10:57:01AM -0500, Steven Rostedt wrote:
> On Sat, 27 Dec 2025 16:45:47 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > > I'm fine for trying other ways to speed up the compilation, but removing
> > > full access to trace_printk() isn't one of them.  

OK, then let's keep trace_printk() available for kernel.h users.

Andrew, can you take the first 6 patches of the series, if no other
objections?

> > I interpreted this as if the header inclusion should be moved from kernel.h
> > to printk.h as a compromise that satisfies all (?) stakeholders. Is it possible
> > approach?
> 
> I'm fine with putting the include of trace_printk.h into printk.h. If
> you remove printk.h from kernel.h I would expect a lot more people to
> complain about it. Including Linus himself.

The difference is that printk() is not a debugging tool. It is used
widely to report errors and info messages. Normally, I want to cleanup
all debugging code from my module after finishing development. If
trace_printk.h will be a part of printk.h, there's always a chance to
miss trace_printk() somewhere. I'd prefer to keep them separate.

Thanks,
Yury

