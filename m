Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB671CCDC1A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 23:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3DE10E48C;
	Thu, 18 Dec 2025 22:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RZR0jJXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368E310E48C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 22:06:58 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso8238665e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766095617; x=1766700417; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FCWNyqqNvxqk0sIuAi6HOTqP3nuQgibcAJ59og/NAJg=;
 b=RZR0jJXg504+1815wqFSXK3lDcq7XofmnzDXt488oRUXr83j9jEdcWFrWpOYUXvUmx
 vccKzeYHWTHHUHWueG4nM3Llm8fbjA//OnAIiF1ZjvvpKF7JviLqUxyKXu6Y2RhypTQA
 PksbIKkE75OBKqTd+av6fTNSTSxNwgkeKpnu//VwSI2WvEUyUxIVBI4OTlKymRFYVW14
 LFokTFm5c3fxxrCHLWrK3xaGOVKl0TGbfB+L+NOcZ0k2mEQpfdme5xYl1LfKTn4uNReL
 Zegc2cm8W9xAP+9kmpGIgYGNqLrdc9uiJMXVGdX6Y3CaJ9qpIked8Mme9+lBYnqhww+u
 9xRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766095617; x=1766700417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FCWNyqqNvxqk0sIuAi6HOTqP3nuQgibcAJ59og/NAJg=;
 b=mrho5BnjKdp1s1Ho7qzf8+uI8fRw64EYFftAFDVLBpIlYMGo1iyzmVzWkL+cxJWoWp
 jBWReB40yAua+Vam3+OgkC9BkgNxfWKs2pmSzrS/lEwDzBvsUXya/hkTwBYj3l63F5tW
 TgcAJ6jIADImspcz/uf1nysn5ZechtJ1Rzq70lKjSXj0BKi/yYQCfnuTS1uCZFCrtfqb
 QZc+RwbhAd6fTCBMblY8KelYJZcbvA1XxvbaCVY0WsmoY6P/648uWLrfK63a7+HxVJxb
 TQChnKvAbrUxhOM9+e5ywTD+KkK+4leHcpeGmlXZnGm+XXM0cwDZmhLJQVvZZmkdJ2t5
 1G2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMjcbl+zvq0zzj3TWGceFvhJ5i1d+2u6lrzhJ207x8xvLxmuhbLknRr0QPM6VGCJ4RgY3DHaX/Odk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4GswrCJQN/0/XpYwLhiy9fW7o+S4wwjwSBV3Ml49rfzl+R2OD
 XWE1KOEcvrzZv6/90aETzivku3jRsTVHTbjG9qyYzv3tywZkpOtT6bh9
X-Gm-Gg: AY/fxX7F2/q1D3M3SnMMOw3R7XaPwYbDPi0muAMbVr2GrxLh/BPUurwMI1Ick7UXRf3
 +UI3XLqVkpLnELUeaBqNxO6LomFgXvPJ8dqa8Hucqi8uMd9MWf6+A5PG+tJ8UJlidMuGbiOS5DW
 J62YFrmhBGx/t872SMwkI0zN5Rt3ID7GLHYk+fJ/nPGQ6lmmB1HK7XYDINLAaIr4ToWjvZVP0nb
 UvzHbsKdPLDdUnFg08pviWtx9XSKlfxt0nn9pIoZimmUHN4ExLm2MYalYBLstLpz7nbwj0zmkiR
 k52wAB/msVhLGVqRl/5onzQQ0gWtExk3VzA5kERVKIyE+zq2oS+SP2FKqyolB38wfhLeoTt2QdJ
 WPykTebimWa/7nW68qqWRstRJumQoXvDE572Wa8XUlMRRq0RQmECiwvKSdPVV+u3zPaVsCu9UIP
 3L6PqbSBpnQPb4vvYeIdWUeDVnFZaPmQk9Ykt2TbjgOlfPQ94/1kk+
X-Google-Smtp-Source: AGHT+IGTunC8kRSxjImDPeRC9HvKyQNV1Ibv0KtdSMjVnMShq1E8PEmRrIAevTE0VIl4mZ+C4NDiJQ==
X-Received: by 2002:a05:600c:3b8d:b0:477:7725:c16a with SMTP id
 5b1f17b1804b1-47d1953da58mr7304975e9.10.1766095616415; 
 Thu, 18 Dec 2025 14:06:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be2723d19sm71561025e9.2.2025.12.18.14.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 14:06:56 -0800 (PST)
Date: Thu, 18 Dec 2025 22:06:51 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Vincent Mailhol <mailhol@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chris Mason <clm@fb.com>, David Sterba
 <dsterba@suse.com>, linux-kbuild@vger.kernel.org,
 linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
Message-ID: <20251218220651.5cdde06f@pumpkin>
In-Reply-To: <CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
 <20251218202644.0bd24aa8@pumpkin>
 <CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 19 Dec 2025 08:34:05 +1200
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Fri, 19 Dec 2025 at 08:26, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > One possibility is to conditionally add _Pragma()  
> 
> No. That compiler warning is pure and utter garbage. I have pointed it
> out fopr *years*, and compiler people don't get it.
> 
> So that warning just needs to die. It's shit. It's wrong.

True - especially for code like:
	if (x < 0 || x > limit)
		return ...
where the code is correct even with 'accidental' conversion of a
negative signed value to a large unsigned one.

clang seems to have a dozen similar warnings, all of which are a PITA
for kernel code - like rejecting !(4 << 16).

_Pragma() might be usable for -Wshadow, which is generally useful for
local variables (but not global functions like log() and j0()).
(I usually enable it and fix up the consequences.)
Things like the masked userspace access define which carefully
creates a readonly variable that shadows a user local would need
to disable that one.

	David

