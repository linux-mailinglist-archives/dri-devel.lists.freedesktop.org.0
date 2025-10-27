Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEDFC0FC6A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8C710E50C;
	Mon, 27 Oct 2025 17:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hPc5udlm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A4D10E50C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:50:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5DB5961478
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B87C4AF09
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761587435;
 bh=jc/356FpIO5fq3wbVBLhYJF7QyfRlww33yCqXERm6yM=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=hPc5udlmqmgZFtCyuwcvoyF0vHryNuhDjCkhPV1vzvSz+5k+2XSb1nJqPEqXrloqQ
 G2H/VFN54GYkbFKD79Mkp4StJfyREDjFMCUtEi0BmhHc1tEngsDtuoVi9a93NRHIOl
 NNNXLuENNF113z078ll+QdiiyPQNz/hEam9FePbsg6URFCREKBL2creHYabr8WuzZO
 I8jgr50Bh3OhHcEczSO+P9JFyWX1R07GUOI2A7Ijm7kf5KXWTkYuSxmiNjVn1/dVjX
 l9hsHViKHnowTnALtdy7v4H7Lxl++R8UNr6rb+V6Azqe6gGJVXlo5FXS90iyPKT+BB
 zaenp7vq3KRzg==
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-376466f1280so75391181fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:50:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWY4FP1jgzVShnHlVA/bBtQZ/5Wg5ory7gC1320NF8Ceht5DyB8lt31wPQJYf8Ka6UD+zPGZXgyRN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJlzOvyNJ5aPWt7r+xdVHcppIpqhfmEcpq1HXqEQadC7UiVW2X
 lTe1bT/rGvd3wjyziRUm0Kj8h4FAD0ajZQOwPbSWTK6AyqghUjSCbfMaapFkinCJFJJGUl10zNx
 UEbTID3Eodyrxe7tdFzKPw6Wu3qJcs5w=
X-Google-Smtp-Source: AGHT+IEpGNxxA7VDQv+o8rVV0qXU7mdmIaNInPaLQFSEX+7AAmZL6Vjak813oddK9k7tZDInWi03lBY0pbQ9WFw1kig=
X-Received: by 2002:a2e:9f10:0:b0:378:ddbe:2d93 with SMTP id
 38308e7fff4ca-379077813a2mr1483941fa.40.1761587434294; Mon, 27 Oct 2025
 10:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-20-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-20-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 01:50:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v67mHaxFAZ_OtPoOfoKbV8x7EFCAmhiq7D0NY0zdRZ627w@mail.gmail.com>
X-Gm-Features: AWmQ_blUGjau3HSQfAh8dWnb5YOCLFjTOutdiwr-yTqdCVXgYeAKGne6ORl8okc
Message-ID: <CAGb2v67mHaxFAZ_OtPoOfoKbV8x7EFCAmhiq7D0NY0zdRZ627w@mail.gmail.com>
Subject: Re: [PATCH 19/30] drm/sun4i: vi_scaler: use layer instead of mixer
 for args
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Layer related peripherals should take layer struct as a input. This
> looks cleaner and also necessary for proper DE33 support later.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
