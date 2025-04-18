Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE86AA93CB0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD7610E24F;
	Fri, 18 Apr 2025 18:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mC6Ydu0z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D13610E24F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:19:35 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7396f13b750so2297726b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745000375; x=1745605175; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8kS9LLNgYY9RzFfrzH68SeW5jhMvExMO5jq7yXv/Swg=;
 b=mC6Ydu0z+Q7r3RVwsPXOeQ+6Hp/mHU9Uj2m0HVy74vBOvjBC1SI5aTaL97KB8co/Np
 iGsbbql+KqqJyTR2wqNZX/nzybQ6VwZ39eC8SfpsE20089PtjWNYRY5rvhv6SGCief8f
 SK3zpSoeeHoNC9s/9tTqhqkVUklOOkFPs6bPgriBoD2ZBp3TZDNhiGeCWxYYQL14vpQr
 BfV8uoZIyB/Jl8Ei5lLieIzhkCx67dB3W1Rliqz5Q4IQVtlZWI9j/v6V296e47YRxMNz
 9ef41QzTDgJctg9fdq3b5AsTaDw5HtwBJQYt9GLg40WUtEDkR72FImCx37avteEJtfqM
 6/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745000375; x=1745605175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8kS9LLNgYY9RzFfrzH68SeW5jhMvExMO5jq7yXv/Swg=;
 b=sP9o5nWiQXgI8iUrPqO6IawqHhFemzoTYxOsrAQMkqk7Vjoe1uLppNBvzWqddR1QDW
 sEiqa5rfoXx3zSJUps1MiuNag+QEGM1G+tdQi5mA/3+C2jgw6RuaFlLIwEXnbPe+Jlkw
 IpA8xuiqSzYq/hM9A2vSdo38OE48aqVbNS8dvI2LWd2g8z+lPsbwH751TnRrGxni0c4p
 O/RzqFCett06+OtahwyObVdU4UW116a1x0S1eDMtHpAOUaTOCFBz49ytQ49HbbUlBeBg
 7t1qlOPm8kxYvvQ60mGasB/FhC+6MrzFFmPGzd8oyACU85p0fD4XAlK5t+n8B38OhMlt
 8sPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSkQFVW+60ppjQFSPsjvRK1prkmmNA32AwntTvhBIsGC78MtJISkWu0X4iB/Zp4xzS5MjKytUU+NE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSz0uFm0SN32WZW9oUcXGga69+ULLCW64UCzXSe4Tx1AtVluO5
 WvELo/SkZImRJ9zQqMxOw7TwXVQ2C9E3Sc/1JC0IifnHHWPV3lW3mUn0G/XIVzE=
X-Gm-Gg: ASbGncsTTm0gceALrCZr/NJUHdj+BM5FXWo4ymiW3lzi/ty7CLVhesu8pyJVUSUd0Ui
 EAlnkZ5pFQ9k3FFw/7jJTrH2UuoUV2vGW9u9hzhrAB9jgFl7qKKtya3uE1+S34jRHgaZ92HJGdS
 2bi3rPw6HJjuyfej9C3hlHWuvOk3yNTJyO6aDbkVw9lh/v7htPHyvsZPaw/i7GL//mUUoiW6/QX
 0VjW8je6NUneKQ66T7gE4QIzxpouma3Yf1cIVnROC3Rm83qVc/b2s97bwPR3dXr7DyKH0YtLcrL
 O06b9GWWvlJxop3T2UG/rWOEHQz3n/eooFe0R54=
X-Google-Smtp-Source: AGHT+IEjqGe6VSPq7PwLD+gzJ3hWDVXQTREJby4Lm4NevX09+gzhJFn1k3fAtNK4eeMvdM3YN6xsuQ==
X-Received: by 2002:a05:6a00:6c85:b0:736:4e02:c543 with SMTP id
 d2e1a72fcca58-73dc1497eb0mr4082141b3a.9.1745000375225; 
 Fri, 18 Apr 2025 11:19:35 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbf90d7easm1892085b3a.84.2025.04.18.11.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:19:34 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: krzk@kernel.org
Cc: conor+dt@kernel.org, danielt@kernel.org, deller@gmx.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jingoohan1@gmail.com, krzk+dt@kernel.org, lee@kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, lujianhua000@gmail.com, mitltlatltl@gmail.com,
 pavel@kernel.org, robh@kernel.org
Subject: Re: [PATCH 2/4] backlight: ktz8866: add slave handler
Date: Sat, 19 Apr 2025 02:17:16 +0800
Message-ID: <20250418181723.207795-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <eb23737f-5b6c-47fd-8b39-637e059bd5f1@kernel.org>
References: <eb23737f-5b6c-47fd-8b39-637e059bd5f1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On Tue, Apr 8, 2025 at 12:27 AM Daniel Thompson <daniel@riscstar.com> wrote:
> On Mon, Apr 07, 2025 at 05:51:17PM +0800, Pengyu Luo wrote:
> > Kinetic ktz8866, found in many android devices, nowadays, some oem use
> > dual ktz8866 to support a larger panel and  higher brightness, original
> > driver would only handle half backlight region on these devices,
> > registering it twice is unreasonable, so adding the slave handler to
> > support it.
> 
> Is there anything unique about KTZ8866 that allows it to be used like
> this? I think it would be better to add support for secondary backlight
> controllers into the backlight framework, rather than having to
> implement driver specific hacks for every backlight controller that
> appears in a primary/secondary configuration.
> 

According to my understanding, if I add the new api to backlight framework,
with a minimal modification, then I either do A or do B(I doubt it is my
fixed mindset)

A:
Tied two devices, registering the primary and the secondary device during
one probe, to do that, I access another KTZ8866 when probing. Those hack
is still here, that doesn't seem to help.

B:
Uncoupled, probing separately, the later one is registered as the
secondary one. Brightness control is a little uncoupled, there are two
sysfs, I doubt if userspace programs will write brightness to two
devices. Then we need synchronization, write primary => write primary
and write secondary, viceversa.

> Also, the kernel seeks to avoid adding new instances of master/slave
> terminology. See the coding style doc for suggested alternatives:
> https://www.kernel.org/doc/html/latest/process/coding-style.html#naming
> 

Agree.

Best wishes,
Pengyu
