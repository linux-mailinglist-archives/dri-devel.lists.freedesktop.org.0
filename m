Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A083CA82A5A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEC210E0E4;
	Wed,  9 Apr 2025 15:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="JVPbIGw7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C142F10E1B2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:30:17 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so6589805e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1744212616; x=1744817416; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NYoWpZxajoIHIaYiHf4bHzvKRXNdl/YUkiNhw0QxN6A=;
 b=JVPbIGw7QoOWv/6pfBpymuaYcmGp08GV7kFovTEDpBFcdvNygBCjpwhZrJW44BpWCP
 EvMLlkh+wTK99X06LtWfqTrHYL1+Q85432xt6ops+I9PEbIScvATY9m4NV4Q6d1fcD8z
 Je9HZf83AdhbgJizeehDFjtKqCJlQ1tfYOcEI3rG3BgRDzAtdwTVsXCAHwiQ8RDsykY2
 4gVhUWKv243JpPtmimpeFj8g7DKYrvkUAbo93Y9btjRMcvjUrWJPdO2CgSnJ8kjFbkaG
 z8he9z6q0nc7oyDVd+ACK66LCnX/EoM8hEXgob8ySfI6egQhGvqifXKx1mOLWr3nBRWJ
 3dyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744212616; x=1744817416;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NYoWpZxajoIHIaYiHf4bHzvKRXNdl/YUkiNhw0QxN6A=;
 b=GG7EFrDMJHFdu3ncxHavID0CY6pL+/iuGXZF5N7+PjkEBZfbZCcaneZgbgsWZ0bvWl
 OuRQO69U0FCdRNEf+m8KiQET9E2O8IS5749of7fx3idMcvh9UqPLJP8NWlBEBjpkAM+r
 OhcXR9wXLblRBb3hLGhpoZaw25tH11c4cbwHaQgyoYpanNLqKl5XHX21y0dziPqTy/wN
 QsQK1SkFMG8maLA3MQySQ594VWoL2iJXHtL5Udjgl510sJYF6Qm6OiqwomLr8DqH9XXs
 tunJ5PGwWt1cc/cjllgIiYtrHmtKCIoaqNu4wcYFWP+LuzFkqUEASjZhssQWAElhavUI
 GbDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9If1lApPVAvXF7Etrb3boXrQrVNFqXdM0v4Dp6Zra7f7iT6U2NBF2YHqx5ul36d39VSWiAxMsVpA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzz22b3Q62KrtO4ZIV5gq8RkCRfp7zAG2G5ChnqDV9lJUV4Wmvf
 aaezQsIlqwDu8c0QimGsRC5f1CewEQ9eZ6jTxlPE+jdHlbEtxhdKuxlg4pSRa6k=
X-Gm-Gg: ASbGncsszALsYttzcANPUXv9Yo4pgimVQABL7KBEx+3e8f1Tf60Ei5UivsKKrm8QeNz
 /HUa/v2/Jgag826UCeAAY52WJ/39CuotbNLmXs4bcOZ+WKv4LDiqNYnvb8bKtarDRLcS/Mv8qh5
 UY9WHkBYG3muY6HBaKFr3KWiuEhelz8IeuzKnXWag1ecnY7/QjOcACm4dCVVoz8FnLfDsLSktS5
 o2E7sVNPnoWFUf6pmo2us0uerwLwAhzYp40DPwYk865FtHTGfU7WnYmpTnV4svZjHR6maZdDGvS
 oYLZwOuWeqxqJ/MGAjMNtl10NmNjh6kgF/0AKO0RWXY=
X-Google-Smtp-Source: AGHT+IEPdF7TEMEPsBlbKy0LICAaKI5tSy/hvaMwPsy/0iACmx4P26wxRXBvDW6KHmSYeJXA9kBcqA==
X-Received: by 2002:a05:600c:1c0b:b0:439:873a:1114 with SMTP id
 5b1f17b1804b1-43f1ef33982mr29289245e9.6.1744212616063; 
 Wed, 09 Apr 2025 08:30:16 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c817dsm19339265e9.23.2025.04.09.08.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 08:30:15 -0700 (PDT)
Date: Wed, 9 Apr 2025 17:30:13 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Aditya Garg <gargaditya08@live.com>,
 "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 Kees Cook <kees@kernel.org>, "tamird@gmail.com" <tamird@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Hector Martin <marcan@marcan.st>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
Message-ID: <Z_aSbrS1hk8nltqc@pathway.suse.cz>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z_ThPOOKXa3VwvmO@smile.fi.intel.com>
 <PN3PR01MB959761E1B759183D83C1AC33B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z_TuqoRpTrjN07zo@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_TuqoRpTrjN07zo@smile.fi.intel.com>
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

On Tue 2025-04-08 12:38:50, Andy Shevchenko wrote:
> On Tue, Apr 08, 2025 at 08:52:10AM +0000, Aditya Garg wrote:
> > > On 8 Apr 2025, at 2:11 PM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Apr 08, 2025 at 12:17:13PM +0530, Aditya Garg wrote:
> > >> The vsprint patch was originally being sent as a seperate patch [1], and
> > >> I was waiting it to be taken up. But as suggested by Petr, I'm sending
> > >> them via DRM.
> > > 
> > > You need to do something about your tools, really.
> > 
> > Uhh, I'll just revert to the tried and tested macOS mail.
> > 
> > Although I don't think a resend is necessary here now.
> 
> I dunno. If people are using `b4`, it might mess up the patch ordering,
> I haven't checked this myself (it depends if it takes [PATCH x/y] or message
> threading into account first).

JFYI, it seems that b4 handles this correctly. AFAIK, it checks the
[PATCH x/y] in subjects.

But I am not sure what DRM guys are using. I guess that they are using
patchwork. I am not sure how it handles this...

Best Regards,
Petr
