Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88902C2D7B5
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E298B10E47D;
	Mon,  3 Nov 2025 17:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l64bn1uh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F03710E47D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:33:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DD3326013D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81393C19423
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762191212;
 bh=+o5dV5iJcb6acg+vuRYXWjvoxYCIxuxArBBgYrKL5qg=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=l64bn1uhzi4UXNLPwabx0bXjOyAkO9VVfL0LTdtFR/2gX7cNFuxjdk8tlJHEMHpyM
 owLu67ClCwCfmon160zMBZN1i+AStX68zSifyc49ftP6AKQnREwma9qBU5iB1lNU9V
 16vZhgTAVAA/uuZRiWm6J8hR8zpZEqyVMOUJfKLNMe+KK9VNvR+MyORJ3OnJrCl9QS
 P6P4/MfQvzG7x0E0bAAoNX5iHdEHDxx3wQiGF2s/bnV19PgVmeuSMHc5as3RajIj/l
 THOP74aC6hSLmKPl0TVEtuuJZN+Nyu95idQzisimIplPIKvPC/3rQoOMfciCDKHKzW
 Z8VQYd2IIwA2Q==
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-59431f57bf6so756424e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 09:33:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWTLzO0I9htxl4yOy1C8a3BEBjaFdkFtbDRAvN4KbSi3AVeLhKtXLSVL5ejNj5JghUeJw+Rnmo7e98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYrJpPpDdDOu5ak0aGZYkHCPsC7ZyJDIV7Pb3d2XZzr1fMK26I
 9OlL4ZwSaGDY1NQ4Jdy1uAwpLjbFF089sORBHItCNU8lEM0rSAfrJOpBYWvrtdHf8Y3wulb1yr7
 P+3lx64tCK/vqR3jo2JWLWbxMyK/DVmw=
X-Google-Smtp-Source: AGHT+IHeAV6gvUZakhroG+cdQ4cS//FtPIAPmnBlEfHgFaH6azoAUjYMPV9zLQGb7u1TcrlPCM1uYxkpaGVsOmKJEms=
X-Received: by 2002:a05:6512:63cb:b0:594:253c:209a with SMTP id
 2adb3069b0e04-594253c245fmr1658107e87.14.1762191210885; Mon, 03 Nov 2025
 09:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-30-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-30-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:33:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v66+oGwTnu_wtLwjcR4R6Owpb3PY5YTAoN0VUReB5+JePQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkzN1dsVffW7_6vHF-fIc5cl498aftDpvEUp2fdEJedEOeYbOYD0a_NxwI
Message-ID: <CAGb2v66+oGwTnu_wtLwjcR4R6Owpb3PY5YTAoN0VUReB5+JePQ@mail.gmail.com>
Subject: Re: [PATCH 29/30] drm/sun4i: vi_scaler: Find mixer from crtc
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
> With "floating" planes in DE33, mixer can't be stored in layer structure
> anymore. Find mixer using currently bound crtc.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
