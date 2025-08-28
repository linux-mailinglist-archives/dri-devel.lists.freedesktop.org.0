Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F40EB3AB03
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 21:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40BC10EAB1;
	Thu, 28 Aug 2025 19:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GH7NRUCs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0E510EAB1;
 Thu, 28 Aug 2025 19:36:20 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-248f2da72edso1456735ad.2; 
 Thu, 28 Aug 2025 12:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756409780; x=1757014580; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FPYnbt4z9PqW8+XCueL8f6hyeaxZluayQKz6AjJWREU=;
 b=GH7NRUCspovkuKGVsCa8msQuEsccUlh8c2t8S5VH9WDfBvDei+GHff1lRuWRM71SBe
 a1yfbvaTlSAwcHpIUUCWikhV2MTANF9iKjNpI4CpQIq95TA2XUU0Glgb9gFMWjDH9P3E
 HSvJUwNHF8OSZjftTONL+SloejogBmalsB5ca42kCIzq1rA5iFUecUEEymxwmgWTB4BZ
 XuRNsqYLzw6H5LN+uaurxkAZPWT+2Ow921nHt4x10Sx56g9H5j4/SkYxRG0esU76O/fK
 XgQTRJG/85ekbPb91JtS0dvnKenf0SexTa1DLBPkFyS80jN0JzbL8io/DlOn1a7EyOnl
 AbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756409780; x=1757014580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FPYnbt4z9PqW8+XCueL8f6hyeaxZluayQKz6AjJWREU=;
 b=lz0dmZubk1YJYF0mt3YNYmUVfGMl6/evY78Bs06MA1oFYEuA6uwzroW/M9tEa5HrGQ
 BNure+2ozCblAgxe8P9Ksm0ICB7iZsLDmMpWaPvMJlFO09TgOUJ3i4Ss8T8zsEUm+A+k
 7V6LW+XAUth4xYUn84DTNc5HwAj3iZwnNp2bshTUlRGizck0zworPkWtFRDNHetnvbA0
 OJlyMiZnxoLRyUUswXcWsHye/ozkK//POYKS2pK/TivnEN8xe3hLiUFS59dEHBTM1D3M
 u+F4fyWvR81dBYxKdkU/6KP3BnGtAe2a9W27htm2ZzEdbXArCev2PEWHj0k9Ty/+Sg3q
 bcQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEdlCsi/Cvxkp92FKAGsrd4qkLLuOHLsc+YEKH+vizswaybEiOAQ2SwYOgX6R4No5vYr4vgH0+cQ==@lists.freedesktop.org,
 AJvYcCXrpnVyiEcwziOs7iL6MelBdj8TXKFq3ER99C3mAIXXW4tZxHB3ylRR+jb5/Q/zOsL7lxekFwrpnB8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvayXrUxjqqIGyc0mo206KxfdWGValF0ceq5HnaDQb29zvVf1B
 NoA39eZZm8FVPhFVPCFUzKH7hQ1ON3cooBvjd4aznkbGPh8XcNt9mhxAvBZEIf9tdnmlJgZgK+V
 ZijrpogYrRFJVawF6NuH+KFu/nwJnb1o=
X-Gm-Gg: ASbGnctsgbKSxoxcjE2OVdERO/VnzbzccQ+x8JEc9xHBT9m84BCJ5PnR1bpkqaXImFi
 m0TYxfppy8O6dtYSkS66SlHRcDI6daBBO8vmsRIaBQDvMDemkFbfhujQqYk9tpOHTdfdPK5URVO
 nIppDo5GfYsLcwTztyal0in5WujpJKTyAEsDKGGWCl7I4x2ckq2G1nT6KK/xh5qNXyfy58f9Smd
 iU0+i8gWVmtgphxJR4DqYdJCVWQsaT/F39kA1Wkr+0GZIkvLyb8nFhaYPR8tcsndet183U2ykO0
 T3ZEDm/2bBZFGji0poivz7krDQ==
X-Google-Smtp-Source: AGHT+IHfdoPvT3BCCGLuczSe9PPNY89s467ywbu87kEOVFUaRViMez0tWnQkPG3jel8d8TX57n3a2PCq5DJC/O1xUEM=
X-Received: by 2002:a17:902:da8b:b0:246:b41d:252e with SMTP id
 d9443c01a7336-246b42c6bbamr143309125ad.2.1756409780124; Thu, 28 Aug 2025
 12:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250828160247.37492-1-ojeda@kernel.org>
 <b680c343-ba97-4eb4-b426-56e318dce492@kernel.org>
 <DCEB1J2P3MZS.3IGXEYP0MAC5H@kernel.org>
 <CANiq72mkPqFnb4ztiCokE6+ntVSmgOTgERshg-4SMmLboFOqNg@mail.gmail.com>
In-Reply-To: <CANiq72mkPqFnb4ztiCokE6+ntVSmgOTgERshg-4SMmLboFOqNg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 Aug 2025 21:36:05 +0200
X-Gm-Features: Ac12FXw2hLVUgBSwSS2yfSEkQm89avb4BuFIG4x_TILvdztH4UADYAvwE3UX24Q
Message-ID: <CANiq72=6Ji97UW96V-VjjbRG=ouGeHA7QXpP2gBOJYFx=oJ19w@mail.gmail.com>
Subject: Re: gpu: nova-core: arm32 build errors
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Aug 28, 2025 at 9:31=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> and a `DmaAddress`
> newtype, not just a typedef, could perhaps be nice anyway?

The one from your linked patch is not a newtype though, so I guess
there is a reason for that.

Cheers,
Miguel
