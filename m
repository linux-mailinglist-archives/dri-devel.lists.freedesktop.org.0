Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85316D22D71
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09EB10E6C4;
	Thu, 15 Jan 2026 07:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Coi4U+Xa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED87F10E6C4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:30:10 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-42fbbc3df8fso273228f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 23:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768462209; x=1769067009; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SLFgkknC2AdJRw5yZa4R2LGRFg1LDifmm6eP5yD+R4I=;
 b=Coi4U+Xa8YzI62YA76ZkHupuOVRYt3k8SQBwrj8DODbFsYWasAvZVh3F053Krr+67a
 LOAxEunLBy5az5H+viVQawlZJo4XI9zYjvuTSB519t9b2GGF0pTclF8MbSeNFB5/PTqf
 VGWlksH076vcjXEdxnLjhMovloQQFI65D7YDuF+fDX3klHutmbCcmYc9ZcfapLKYcvN7
 +nEnoaP//7LhzrTwuQ/2ccRrr4m+BokaTXfjZdSUJgm5l0mlh8nQNIiOQ5nFQr+CBFeJ
 i4+vSLJgfVfo8QOKqO6pg4gGkrb3r0LiQO84W3TqdgcgIBaWLvyRyaj5J3kud1QmJZt+
 HZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768462209; x=1769067009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SLFgkknC2AdJRw5yZa4R2LGRFg1LDifmm6eP5yD+R4I=;
 b=sAZneyUY+ynWxYa7qHlU0xh2ZkcMQnyeWVxWKjvlIJwBTrJlLcUmsG/M7Z3A2uhC9m
 5bpyQpC2wJNWAP8PpRt01eU7WsGxw95CEC3Dt5Ge1KXb6fH03lc4oI0TqF3VsoyhixMw
 VhiZR6qyL87TfctEXDlkVWUYEu7t2Sy8n92scHXOa5SfpxQTPqzdP4lvHRJbH87eVL1l
 B1FBO+U9cH7LGhui5578/jau2if9e7r40gemDRNGbpcgmwoDU5nUC1xz+Fb9/EGQrvDD
 a0R6Q8JMfT/bkaRBRaVtVWw8K4+o00p7vgL5BdLER02qFdwglUz8FIbSgcCNYGmjPuH4
 ZQsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWxGyzNIDNNJKXJx93V3Ix52dqDzoiZr2NSHF4w960rIreSubkgOdxUAba/6BU0vmoZorORBs21B0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxaj1VTtRESEdMJ44+1QPWI1fRDo1r2AevTlA0SjzpqD3hdMbId
 uv45tHFYGEFZTVTjyu8w38l6VD6gApmYRGEM3NP4k+Me6vYz5DBAvDhMuMwcEIa9eoE0+OlofBz
 7Nzl1quQ+cgMKqRa8yalJburqZfCk1iA=
X-Gm-Gg: AY/fxX7mqgcax9sqzTwXgVt63bUWzGvaZDCMC3jj/SLAzH2rPI2GXUTWoQuISA2OhTR
 9brUWkYDEjoGaegcrGsyiNr2BddoivGZ157mQasd5OZ8rjUPyb4q3PTJaJFIzQJsRIm6OcwD79j
 VpI/bU925rWCr1Ow3yLbKhvQ8lolG8z72R4/DW4VnxmFakx+ERuH8SLn5c4bukzSzTa028ULUpu
 JfHcoAMpwwl6IBGsgnlbrQLFpqhXH4XtdLm4xKLjlffVoi5mdb9MAEzMoiK3WeLHng5Ch82
X-Received: by 2002:a05:6000:4301:b0:431:864:d4a9 with SMTP id
 ffacd0b85a97d-4342c3ed5cemr5803879f8f.8.1768462209134; Wed, 14 Jan 2026
 23:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20251204061436.5401-1-clamor95@gmail.com>
 <4706491.kQq0lBPeGt@senjougahara>
In-Reply-To: <4706491.kQq0lBPeGt@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Jan 2026 09:29:57 +0200
X-Gm-Features: AZwV_QgFceOIXDqRscxFY9mK9hyVQDnnrFDFPm2hILKsJwk2miJfkqseLCRuwSU
Message-ID: <CAPVz0n2pxCe1=rGcX5SE3ypJyPCAacvuguHuNupeDnfeNBLphw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2 RESEND] tegra: dsi: improvements for video mode
 ganged panels
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
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

=D1=87=D1=82, 15 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 09:09 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, December 4, 2025 3:14=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Expand SOL delay and packet parameters calculations to include video mo=
de
> > ganged panels. At the moment only command mode ganged panels are suppor=
ted.
> >
> > Svyatoslav Ryhel (2):
> >   gpu/drm: tegra: dsi: make SOL delay calculation mode independent
> >   gpu/drm: tegra: dsi: calculate packet parameters for video mode
> >
> >  drivers/gpu/drm/tegra/dsi.c | 54 ++++++++++++++++++-------------------
> >  1 file changed, 27 insertions(+), 27 deletions(-)
> >
> >
>
> I can see this series has been merged.
>
> Mikko
>

I wasn't notified that this series was accepted, thank you for letting me k=
now.
