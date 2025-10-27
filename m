Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25403C0FC7F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C1310E53B;
	Mon, 27 Oct 2025 17:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n3hwdSEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005E010E53B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:51:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7556F60447
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CCBC116B1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761587477;
 bh=jc/356FpIO5fq3wbVBLhYJF7QyfRlww33yCqXERm6yM=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=n3hwdSEwthgPPcywNsj3EZpS+VohH9aqf7E/4Ypn+BMqjXgEGBkKnjTt+Pgn2a9Rg
 xU5t5+FZZRzmHNXQrMwFJzcn+vmfr96vLKN/eTH7sf59prfug7+AIl6be7heIGJPtH
 ojO0/BREXByGL1ngRzOFhj8WjaCRjSXv4bjvGu62ZxcX96rV4g/1UUuFwzlXmYOTMb
 OhOHNwSo4ouplu8PxCMSeq9b0BGW2UplgOTjxOix5Jwm1FlUUsq6kD++kGA16yNTen
 NCdfhVIQPEEfaUzs2J0pwVSFSZtlyYZlHbMN8T6IBQJxcowt/PvzojJhy2lYgGIGvp
 wEd5BmNMRQ1gw==
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-945a42fd465so75682139f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:51:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXsui/sEoTPdL69/TMRGFSAzbKBmaSnoshITvXWWlYYul23hTFVksh8HDZMRrc2HmhuDveDRXH3vNs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyEDNJ5cOUATgujBIeke7QNOA7Gnb8Drgh8ze/IaOhskQDGls7
 lUAKAzmwZjJx8pylZjrMI3ul+ZfG5dQCCA0iJsDYxFgwf+UjI9x3/FJJ0e59ugNTwZCST2zR1qd
 LNkjXWhwHK6bFdOzO4Ze2Z8A5L0I5nH8=
X-Google-Smtp-Source: AGHT+IEhTGVPKoQalrYiBqAlEMUBEMY4lVStU7gZnh33SrdNNW4aszsD0LMWPepio43TunWqrlJUD6gVWjPrIKcEXaE=
X-Received: by 2002:a05:6e02:1a86:b0:42d:84ec:b5da with SMTP id
 e9e14a558f8ab-4320f7bdd26mr14178625ab.10.1761587476526; Mon, 27 Oct 2025
 10:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-20-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-20-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 01:50:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v67mHaxFAZ_OtPoOfoKbV8x7EFCAmhiq7D0NY0zdRZ627w@mail.gmail.com>
X-Gm-Features: AWmQ_bn3iNNBGbv363upd8-xJWoo6mzsgGMKFnqSa-M9FJF6MPfIXgvUhr5jEow
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
