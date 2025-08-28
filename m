Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A90AB3AAE3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 21:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1E810EAA4;
	Thu, 28 Aug 2025 19:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dfzMtSaY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C424F10EAA4;
 Thu, 28 Aug 2025 19:31:41 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-248e01cd834so2094935ad.0; 
 Thu, 28 Aug 2025 12:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756409501; x=1757014301; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=20L/t/dQg856UitOCMDzjeFNPY/n61oJgouq8+c/wpg=;
 b=dfzMtSaYnrZZ2YBaxE+GM71E4cvnVG9i7K+66b/SUcJnydFZR5RzXE9coKBlA7pLnE
 Ffej+dYc6wpXNQm4jTC2TnfJPiMwdvIyRx58XinN8rPqGUNUwtyZxe/NIwiVg/cBpL4L
 eLHYr6EsX1fhez1LEf5qCQ/uTI85ys9vFuEvTde5PYhpenzER+u+n3pu5wCEzkltb/Bj
 u2dAsbtf7EF5WdDfBwx+BB+1f6MSj10aG/xLQ6ecNalZfbUKulfxyMy9UsO1k9OJ8ADQ
 Hmoct1IAu7o6kDxPDAQr9RSAbBgSinb4kch87N3VAX9HiOcCjMB/74FiXKWPosPr7Oft
 SKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756409501; x=1757014301;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=20L/t/dQg856UitOCMDzjeFNPY/n61oJgouq8+c/wpg=;
 b=KNOxJqrZJ9TkfK0o4mb9HxdmzFmBInaBIy/N+A3IS7z7IlX/UMOJ3wuZLNcdErWVde
 H57eGb+4u+qD6XDW2Dx3Fz2HzCW0RmGSEvbiSQeT+fM72tA7zQnpT36kqgvjJ2M5cVWN
 gky1tISwmqzseeNBfRx9PvQ0/AkmD1Jgv02o0juOYmvwvqQA4lbP9ltTXq/Tr+pGu8/v
 8TV/vdAkhlQvB01o/vKjhgKa58K3w1otYn/NNls/foJwjOdv60jr1WBlR4KXaqq1L6Yu
 /wUgn1H+CqgTNnMAjL3wmQBqABl+gMYbbexV6BSD+Bn5Ai1v+4gWjQaxYDkwkAqUKoXi
 EwiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0U0VK9IEaxF3wdltQwGYnWkNmt0geOFc0twbZzUbkHwaUXRiu9oIThQSsEjv4g2gSuCkqxWi/fac=@lists.freedesktop.org,
 AJvYcCWEvkqFM5g1KyGq12nCvdbfzR2OZEIlzmv+++IJDv4xxMbGRbyectLoOBzgWLs9k2WG+WIodq8iIg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyjoq/NZZle989ZlRFtFg3CbkgH9rgBKUosBRa1ykKZmmDvaDo7
 Z716YTsFCvhpo3I4qdoTlzTLTL/mpEPu0xP49KrRo5rIfHa/1YoQdRIgvf8/iwbALeQ5+lA9JzO
 dkrmDhHTORwyuGabO/fVMF43xPjnch9I=
X-Gm-Gg: ASbGncu/7Xjjz3p6qGbhnJDq+ldKX1l4TKqaxuCzz0x6133lKO315exVU4kH56TLo1Z
 SLhcB+I4WK1WMEodbeJoI9RXUYTds6R0FcChFD0As5ot0UHBamTghwtdvHaUd265ST9httoT5xM
 G2VMnEErpNNiZyjT5slRcm3DA6gJ2xdOkSLAxqrjzI0SWHi3i+rELOhI1T2q2q1n7LmfdBtFryy
 O3gwJ/l9bGzLCnyB3QDVpbqgXuJxSC55N9Kjmt/JRDYNPdqObHxyjutr2ZM/Djt9IJJHvCNWZkE
 omJpGiPDKLGiCE0dqHRBUCvqo+CNBEU+IxUG
X-Google-Smtp-Source: AGHT+IFWdw6UhPiyKJrbHE7IDTwFisR1W8SRBwQA99k5or2f4Qr+eBc4mB2thKEKcqtoV9bQyWk8o9eMXoEOsRDv48Q=
X-Received: by 2002:a17:902:d50d:b0:240:25f3:5be9 with SMTP id
 d9443c01a7336-2462ef6f3fbmr183406685ad.10.1756409501161; Thu, 28 Aug 2025
 12:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250828160247.37492-1-ojeda@kernel.org>
 <b680c343-ba97-4eb4-b426-56e318dce492@kernel.org>
 <DCEB1J2P3MZS.3IGXEYP0MAC5H@kernel.org>
In-Reply-To: <DCEB1J2P3MZS.3IGXEYP0MAC5H@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 Aug 2025 21:31:28 +0200
X-Gm-Features: Ac12FXwvQbB3YxWRKL103qR7GEVPMjkX_VgeadkNh7YUOWF4Fhw5ZECkLfkRVzk
Message-ID: <CANiq72mkPqFnb4ztiCokE6+ntVSmgOTgERshg-4SMmLboFOqNg@mail.gmail.com>
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

On Thu, Aug 28, 2025 at 9:24=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Maybe I spoke too soon, it's actually pretty painful to keep 32-bit
> compatibility, even though it would be nice for testing purposes.
>
> I'll paste the diff to fix it below, I think that makes it obvious why I =
say
> that.
>
> Instead, we should really just depend on CONFIG_64BIT (which implies
> ARCH_DMA_ADDR_T_64BIT).

Yeah, it isn't great.

If it were just that, maybe it it is worth it (and a `DmaAddress`
newtype, not just a typedef, could perhaps be nice anyway?), but if
you think it will become increasingly painful later, then it may be
best to focus on what matters.

It is unlikely there is going to be actual users on a 32-bit platform, righ=
t?

Cheers,
Miguel
