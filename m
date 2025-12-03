Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BAFCA047C
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 18:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB9310E191;
	Wed,  3 Dec 2025 17:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hOCw7dgv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA99310E7C0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 17:12:26 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-78a7af9fe4fso63450627b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 09:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764781946; x=1765386746; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+dMlhUa22KWJ2ilQ42UhqcCRS5uDTPNIwpYqFYW9E1I=;
 b=hOCw7dgvRHSMOFR/vEpQZU1RQxz1h5YQNuio8Ay3hOJn8bKDT/Ex1IgjmXU1A+8RZD
 V3jjceU7QMICmMf5rG0WAdjHfSMkRyDSVgvdvpjYCBsnX1gHVS3YxO+SAZp8g7QE++y6
 HViOx7PUO1Y/lIEDqIv3UCpVuA1IEAd8fy25cyE2P4zgERlAwpl80uQgApan8bJ38yC8
 0RlpJyL9+BVQvIflVtP3WKuZaeUfQKVztYIRwkg8o71nffhx0x0dCYfmyMndSaSI1PJr
 mVAuK28OKhVHaNuPa/niUtM4e/Qq5FnyJnWAnrIiEcqjhRBjX8iPIx/ihcDAJ+/rMUYh
 0FVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764781946; x=1765386746;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+dMlhUa22KWJ2ilQ42UhqcCRS5uDTPNIwpYqFYW9E1I=;
 b=Xut8t/XdDIva9shkhPgmpA9h5ZHMZIOSr/il16SDI/G7ZR/6AnHM2BsWDCaUizkdyB
 GxSdjoYJ3F962M2xAz+Cmly1x0FcSIJnzoNOATnffjrq2QLl84xqFlbnw3O6SAqjTPIW
 0VyE342/JkIKOBtDXx92lBG+vOy5RHHgRla3eDGjGS1SqYdTA0HEjcfnFHLVrRq6x/Xv
 GyX2to+1jImt1ckLi9MS0HplGQVOngbSuUHhvYBio3PwTnR6jaXyFcyApe630CB38zUK
 HkO2TgvQlwb5VRuRLV7XKBneLAa7hERuCDvjNNtXbIqLcEP1MgQm9+pVc/3BL0tPnii+
 imEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFB3XCtDWCSOWOdEnPywdsZfrnZ6Fd5xZcothLAFeNrjXGlI++dAb9jga6xRGpSimXAmdmtxG1/aI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbSojaAVHKByW7yWDm3tVRC8PqBCnmZVYwO4X3o87PAzX5R7TW
 sNR0CsGzG0+Z4GmIgCXzMl4dbgT+zPo9JKBV9UWsldHYpRSbI4DTpmjx
X-Gm-Gg: ASbGnctqEmjigP7n8T3+iw1VAiu6hKLACmdA8GC8RCXopBHKI1EatIDR/Vul8758ezJ
 PxP87HtNJag/E/boGy1GlXgTuXt8iFOreBtvEBgd51ZT5Hcy6UDVqMxQFZCxG1bw4VbnML+B557
 20DNOnlzVC8EGlbt0UGcoVVcJm3c9lDCBMEuMTQz2b0IXClMclVA2tn6GkUMO2G295FvHfWMCHa
 jrdDlGd2NeJ7/xWroyoK/QyQNoukPX0f696Rv37be9qR8uTXyFMxixHq0aoqXeyafrtZsZKqjsl
 o40ju/4HQyWJcZ7tosobAqTSH/zUDiLS4Co0FcqJ1EN7iavrK0nO+ap6ajyCZIrNsf+RsrwKOrK
 DfRpYZIX6/7UwX2Chr0n8eu3kU6H3Oeyltgiwr6EZPBIoMgh4bBOr6mSt7hsDqcRudyhXiLXmhV
 L/9IscZaQ=
X-Google-Smtp-Source: AGHT+IEFfaor5TGluCdJ9VR8/Ps+0lVeXujezt2zJVQtO7vKz7xrftaiA2O5j0+xom7Jt8H9sL17Gw==
X-Received: by 2002:a05:690e:11c4:b0:63f:adfa:e5ff with SMTP id
 956f58d0204a3-64437038548mr2177966d50.57.1764781944118; 
 Wed, 03 Dec 2025 09:12:24 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:3422:8bf9:97bc:b085])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6433c050348sm7461970d50.1.2025.12.03.09.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 09:12:23 -0800 (PST)
Date: Wed, 3 Dec 2025 12:12:23 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] tracing: move tracing declarations from kernel.h
 to a dedicated header
Message-ID: <aTBvd6I5D3VAT841@yury>
References: <20251203162329.280182-1-yury.norov@gmail.com>
 <20251203162329.280182-5-yury.norov@gmail.com>
 <20251203121007.407eaf3d@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203121007.407eaf3d@gandalf.local.home>
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

On Wed, Dec 03, 2025 at 12:10:07PM -0500, Steven Rostedt wrote:
> On Wed,  3 Dec 2025 11:23:25 -0500
> "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
> 
> > diff --git a/include/linux/tracing.h b/include/linux/tracing.h
> > new file mode 100644
> > index 000000000000..1989e6328c59
> > --- /dev/null
> > +++ b/include/linux/tracing.h
> 
> Sorry, and I hope this isn't too much bike shedding, but I'm thinking we
> should call it trace_printk.h. It's mostly about using trace_printk() and
> other similar debugging aspects. Calling it "tracing.h" makes it sound like
> it is part of the generic tracing infrastructure.

I agree. I didn't change the name because it seemingly was a consensus
about it during v1 discussion. Let's wait for more comments. If no
other issues, I can send a quick v3, or you can fix it inplace,
assuming you're moving it yourself.

Thanks,
Yury
