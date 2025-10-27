Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61CBC0F79D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514A410E500;
	Mon, 27 Oct 2025 16:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OEgi0eJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E59910E500
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:55:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E5CD644922
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06C1C116C6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761584135;
 bh=KddKMVM5wd0B6J1q1MLWD60MfPMYXHaAJAvI7FQnRAc=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=OEgi0eJbG5TcR+9LSQwWgmXDBAJ7OpXXhNUs0/2rA0ViWXyq6yyd6gYVyP9h8BbZr
 126ppYrbnahjMz7WjD46RZQndMzJeJpIZMuRo7F4LjIkSbNfSpcRh5gu7oIOxFmRv0
 +7qdo63pj8NWI8zknqj0Eq9lMBG7MmXdzgWPjN+r48PbJHSRGc7JoaA5Q/Tgk5/CFT
 UF/XUvTz0fyJY6uCVzPqxlAbCHIhG1ri3StqZCZBPI4Vrw7SSjF0q5iOGvLfvI1JLv
 kQEH1CTHFhffVT9SduHwktYAN7AuySBLjEAZHA4F0Mn/kqPuPIO9Zsfy+jL/W0pH5C
 hnqCiqBjOTpcQ==
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-378e622e9e3so43335751fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:55:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU2o9XV1uYebdnHTJUuioT7fhkshUaSZgxh0NzYB6iSY5ZWKme3e8KhxO7R+fo4EXmzb4Hq3hG/D1U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqASz+duoE15WFLfwbToCFF0pN5yueuVGv61LvtRmMI5QO0L67
 gUpaW6tno+d9BS8s+0Ef+3EwYrqx05PyKtxIrclIsRSaF7QpCT/gLpk0ShBYcevnYo/rkC0i4FS
 bN+Hy2RssXWQ8hFMm8Pik6beYiAWqssk=
X-Google-Smtp-Source: AGHT+IGwv/BQ+++SBFxYYP2GD7RTs091hoc1u0QU8IvYs61A4uKZ+F34EWnDa2h9Kf3sdYzwjvjhGmCCjViKq/p155s=
X-Received: by 2002:a05:651c:1444:b0:372:221a:b124 with SMTP id
 38308e7fff4ca-37907b313edmr634581fa.0.1761584133992; Mon, 27 Oct 2025
 09:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-16-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-16-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 00:55:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v66br9q8S0uVOoUsPoMOHxXnO1UExhs2PhbbuFYqhB9-kw@mail.gmail.com>
X-Gm-Features: AWmQ_blFUa5jniV5lL0-JsOEEq2milyC58nrIxK4tO0XvnhoJRoyHMfQHehc-Rc
Message-ID: <CAGb2v66br9q8S0uVOoUsPoMOHxXnO1UExhs2PhbbuFYqhB9-kw@mail.gmail.com>
Subject: Re: [PATCH 15/30] drm/sun4i: layer: move num of planes calc out of
 layer code
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
> With DE33, number of planes no longer depends on mixer because layers
> are shared between all mixers.
>
> Get this value via parameter, so DE specific code can fill in proper
> value.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
