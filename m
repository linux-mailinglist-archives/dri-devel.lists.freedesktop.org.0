Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB74AC2C976
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A9B10E41D;
	Mon,  3 Nov 2025 15:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I/+PRojJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8872010E41D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:11:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D0617601AF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80300C4CEFD
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762182705;
 bh=1GaNNFCtknV83Jv0cqtYzHzLamBzWC1xpyIlAkgm43A=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=I/+PRojJO4YN8h2bvBzoZeo7h6nDwnL4uefQQ0bkGpg0hgJyjWPTgYEx6AdTd5QJp
 AzTwDamL3PBHLQjiuApsSqieDLII7glvyihzMk4QqVa8TnIkan+uP6eIyG93znND1+
 JKnVe9R3de9Eop1zv8OZPMzRuOwAY+0r03H93pkuKe5ENGc7xZJRuuWxc1srof2LwV
 IsH/gLKF8vbbaDS5nBuB/cQ4B+Vg0S9sh5SX7jr5o2T8L59JcNXvBB/PSXOov+iJbn
 ian9DlT39jN7IPbmsG2kDWdTkVBFssO0Od9kxeNeZWuUZ+onjLjiYNBZoN9FmlT/9s
 jEz2SSuoi4pkA==
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-37a2dcc52aeso21583301fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 07:11:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXOGv5WALqDZfTZEJhlJAWwQWma1oavaG5NJmm1F1N33u0LsSNps9mpgrw0dw9lIPZILtqsnHK/iwM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo2x10Gru23dzMnEiGXLxlpU2YVjo19bEVdL5Xo/A1x30tcB8H
 srSYGgO5a6bELDb4Q+PtKw+2/D5qh+9Dn9Ltmc+jL0NLBlAp3u4dxSiYSX6Lb/y/P4ruKEaaMX5
 v6La/ymWQAMwarjmmCvYTHdgS8bgkZyE=
X-Google-Smtp-Source: AGHT+IGWElttgB4rVGH++HgAV2+aJjHaHeGIca+Uf5ByxP1uF8tUjDilXB/buasyrsMUHZXVPNFUTSxNQSiSwWns+Qo=
X-Received: by 2002:a2e:8848:0:b0:36e:21a0:f212 with SMTP id
 38308e7fff4ca-37a18dc65b7mr29472661fa.29.1762182703902; Mon, 03 Nov 2025
 07:11:43 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-23-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-23-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 3 Nov 2025 23:11:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v663GuEnxxVK0v+zOJ=p_HbqmJjFhP45_9FFvhAtenABPw@mail.gmail.com>
X-Gm-Features: AWmQ_bm-fOqGieMMsHUhvs-YpT1nnfXeuYJQ_6Z3gI_-gHcMItjN5vkHcjHc7cg
Message-ID: <CAGb2v663GuEnxxVK0v+zOJ=p_HbqmJjFhP45_9FFvhAtenABPw@mail.gmail.com>
Subject: Re: [PATCH 22/30] drm/sun4i: layers: add physical index arg
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
> This avoids plane mapping in layers code, which allows future
> refactoring, when layer code will move away from accessing mixer
> structure.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
