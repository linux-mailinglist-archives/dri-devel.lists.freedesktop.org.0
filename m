Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60947C0F3FC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381AF10E4EE;
	Mon, 27 Oct 2025 16:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="upbFfh9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4BE10E4EE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:24:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 756FF603F7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2188EC116B1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761582291;
 bh=iFUNgXsnYA88I+eiduiUIs6MsVz6z/JWH9W3jdxReHE=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=upbFfh9cs0w560m5G42zUAqRYxPzCQhWJ3nOUwjD6MeOlDBIWPgR2G3a88oLebvnT
 ujk6tCfOjiUqdVgy2MFjKvN9rMWrXIN5316szN6mMd4+uAO0sLp53eAa8x2WovxYUA
 jxkiAu/00FklIY5zVMLZwqlAGkLcplG4IkbTAqj73DLth/o+LT4ZC333P15SGKcxjk
 xgrKa1lpY+9VJtRSx9RdhKoB/gIKqlvkASy/W7JdUeifItJSnyB4R1Qs+J/H0/GZF3
 lLTaw30AqORCfJ+MkMFkyaZL3SVfAfD11Zee/TPOUWl0UAIy2Qx4wFs/swJJfCRylJ
 dcudLK20iB9bw==
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-938de0df471so481768439f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:24:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVby4q6ljwFxNgICsyU5sWs7YZL/ePFRIGZtywEDMA3+DsqF8dshXJILpeZb3f27ysHK+VdlgxBGvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeFRyIIHv/UhXSHZ+9UMFOD18PVPosdXYnbCGe5q53DoWaBaB1
 o/TgiaYkkrGtU0GR1M1fuJ5VHl/Orvx9dn3dpFfUYIVUl8EgmmrI2uOw8EPh6kqnlQIkdn8WCOV
 vXGaIQUaYbuM3oaNdI8pZrFMHHyYehJI=
X-Google-Smtp-Source: AGHT+IHHe/XtS2GG/wdvqgHvDv+nRF07AMUFFVC6D3jwE43Y2hKkIN+nB3wIPE0Qg88P86L2vzXtvE/tbccFLfpnpgo=
X-Received: by 2002:a05:6e02:3f04:b0:430:c8ad:81d3 with SMTP id
 e9e14a558f8ab-4320f86b4f8mr8500885ab.30.1761582290543; Mon, 27 Oct 2025
 09:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-10-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-10-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 00:24:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v66f8qajMGCYLKPuS_mg73KejXx-OpfQqcdEf2fWDZkDig@mail.gmail.com>
X-Gm-Features: AWmQ_bmGka6WNi4gU3CVi9HH7uDknXm3j3l2W4WzjmEHbPbF7rcEUtNrr-KxlVo
Message-ID: <CAGb2v66f8qajMGCYLKPuS_mg73KejXx-OpfQqcdEf2fWDZkDig@mail.gmail.com>
Subject: Re: [PATCH 09/30] drm/sun4i: vi layer: Write attributes in one go
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

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> It turns out that none of the VI channel registers were meant to be
> read. Mostly it works fine but sometimes it returns incorrect values.
>
> Rework VI layer code to write all registers in one go to avoid reads.
>
> This rework will also allow proper code separation.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
