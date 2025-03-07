Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CB0A56F88
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 18:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2BA10EC17;
	Fri,  7 Mar 2025 17:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lGKtBk0p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FD010EC18;
 Fri,  7 Mar 2025 17:48:39 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2232aead377so44795015ad.0; 
 Fri, 07 Mar 2025 09:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741369719; x=1741974519; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lRufdviAnmuT6DteRbLHEBa+gV4tGFtrU2SoznIeeXg=;
 b=lGKtBk0pWXEL08d67wPDRAPw6WQENJgNssFjlkdEakZhjWfx+T5DzXtlLmzunZXEDw
 YTpGcj5ZB9c92+eJ6WoXeFLBW0ROdr0QJvPs3Aze7UeZ6rGXXpDQTRBOOH7z0AS9jc8E
 eLwdT4+wLDWXcnXs9/U/mDErBRmuvcnJg3/4YnY7qqcHKH81raXEutC5X6obENftwYII
 KpipKitCI03PhbIwRMBwRd54MPL75pFgsO5hLAyQxjAXiIeN6DWXT7cQPuxUaKpTSyYl
 iK4qnOW5ayBPhRVJvXCnS7IK/Ou3IoozKdPvkkze7WDt9ntRn3IBJQSShaMm8V6uAtfv
 STRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741369719; x=1741974519;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lRufdviAnmuT6DteRbLHEBa+gV4tGFtrU2SoznIeeXg=;
 b=ceEredx35xE2TJrbAs1lLaYEskkgoPLJM/omfc3bl4uexbcaDh1cCNeHVS4s96L+na
 8jT9ZiJgvxn6mAmYEM5Fd49scMK4D6zVb7MpxBFI7XZwOjhvdacRwta8y7p/MCILQNUI
 cNjE+ZCPD1h0c4AuQDTVUfjRV6PEnkrZTjsIGaQAPoD9X18RQLqMI9RkB8IYFGgNXzfG
 gwkpesOZ5jIU+9+x+5uoBRNqmcUrH6zOLP8aGXtj9hHYKf0MvnIs1l4tTVeSKRL9an8P
 zzvmdrQY6HG4RlSCM9htYy6VPtW3tzZ2ZXNhqD5v4Zb238ufvbr0+kqYTjeWGZ0kptUy
 CDfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwBQoVmDKm7r7Yo01FcvnH37urTJB/IEWgFBm2QZiMe5vrnwfYSmGBIQBHJuexu1bmQ60zCtPfIOgk@lists.freedesktop.org,
 AJvYcCV8z3c+RdbLvJLmuQkrvfgQ+TxZy/l18FAefU/YCayn9g9Ve2a8B2G9xXkme5rH+/Gvd2qCw+/S15M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoWNgDXshDyFu483BirslQvUizgWNgegq+IBJtjII2l2x+y0Yk
 hxRbWmbFGgPRVW02tEmTP/XNJsz7e4DFRlT+u/I4ZO4QwFwfesD7
X-Gm-Gg: ASbGncsEIw1m2fnR/vQZERFBQLuvswNcK2Elfu0vtjdZz3DSXw6WRmqBppdTmWa3I8V
 zxO8PkTqnXwnnT8u2z0/gVvcXtJbXYkmp4Nb6hrjCZRKX/5N1iwlADNNcV+egWgMmG7dFmcbukJ
 FDAWi4o12gAJtqb1fzmQjswOQZ6aRdE8qQQeIMsF5cW2wdDBepHaFIOMT941j7WWw3tSA3Az+u8
 yDQwMqKaY4xG8rPZo6op5tG+37T9wCA4PfYXSWpri3D/W6DpG8uf9zGL0cz8wQT49lo+9I7I4T9
 mF9uoc2JFRBbM9ylvqpuxVeVJoE2fvx+DsFekzZzjIvp
X-Google-Smtp-Source: AGHT+IEjZU9p4DHsi8ki85oRnVlIV3neE5cWyioPrK7kaRY8hlLWs1+CZSrq8Ll4+I1znDxUmj29qA==
X-Received: by 2002:a05:6a21:10c:b0:1f3:44de:6190 with SMTP id
 adf61e73a8af0-1f544c93787mr9937505637.36.1741369718923; 
 Fri, 07 Mar 2025 09:48:38 -0800 (PST)
Received: from localhost ([216.228.125.130]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af2810be5aesm2821781a12.34.2025.03.07.09.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 09:48:38 -0800 (PST)
Date: Fri, 7 Mar 2025 12:48:36 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: mailhol.vincent@wanadoo.fr, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v6 0/7] bits: Fixed-type GENMASK_U*() and BIT_U*()
Message-ID: <Z8sxdOjk3LksG9ky@thinkpad>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <Z8sqSpKZzfolKm8Q@thinkpad> <Z8swXUGf9rtTHw1o@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8swXUGf9rtTHw1o@smile.fi.intel.com>
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

On Fri, Mar 07, 2025 at 07:43:57PM +0200, Andy Shevchenko wrote:
> On Fri, Mar 07, 2025 at 12:18:02PM -0500, Yury Norov wrote:
> > No rush, please allow your reviewers a week or two before submitting
> > a new iteration unless you want to disregard the previous version for
> > some reason, of course. This will not get into the upcoming merge
> > window, anyways.
> > 
> > So, what should I do? Go through the v5 and all discussions in there,
> > or just jump on this?
> 
> There is also question to you. Are we going to leave with U128 variants or is
> it subject to remove? If the latter, can you issue a formal patch?

I asked Anshuman about it as he's the only person interested in it. Will wait
for a _usual_ few weeks for reply before making any conclusions. If you know
anyone relevant in ARM or everywhere else, feel free to loop them.
