Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E903C0F404
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D90210E4F0;
	Mon, 27 Oct 2025 16:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MQ6eA3jN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D3A10E4F1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:24:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CAE7144A97
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B082BC4AF0E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761582295;
 bh=iFUNgXsnYA88I+eiduiUIs6MsVz6z/JWH9W3jdxReHE=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=MQ6eA3jNU6YthoVvX9LZ7l+80taYxI33oodM2msDJTiUA5VHRUvGusLkep3aCLkjE
 3jmrvbvutcVP5Syp0em/zfmzPGmZFbs9LozbbtetBmEOG/lJwiKUed4kZrg2eNV4kS
 b9UKDn/Al9scQPwUby+8F5kIvCnKk2qcqFh6U2K9S+DH9v5G4ts2XqRVjHThROt+Pa
 3PTahRDXzojIbg4T1m9SHq/IK4YTvLwe2X5Nbk+T1z2Xi/UrJBuhGigCvyRneTP6PB
 +afHi/6I05xqwxdD9ih3/mcO7p2Rhkuv947Nl8N3n/F4Ej59NjVgJ3eCszGv/37P8M
 bFe2jjYotgUPQ==
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-378d50e1cccso51260781fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:24:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXrgpTMcHbMe+i1DqZ1R9Uk4Ef5Jxf9+TTZ7kC8Ss85KytxS+CWKUZjx+AZSNHOWyRB+G58PyjRvdo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHgHdqQdv1rhZuhFD0G7Ge8lcXo1bNVtkDaovKyrs0sA0n1wo7
 6cRpcHUsHXrLXykkdBssCQG4lwGtrdvOW/N7/e+uKX+AILta8/SMLNpDxUxhI05EKJjQkWs3Wo4
 4HvUmWeGwQ5e2kiq8YTqO3gdrr9dO9X4=
X-Google-Smtp-Source: AGHT+IHNdgAoqvQ51FNTDPIFsFNbMTSVRAmipqt4BZBmwcLmVQfhNjS4uyy5v2Kb0Ej+dyceOX4GBhIVuo22H/auzvU=
X-Received: by 2002:a05:651c:439b:10b0:372:904d:add4 with SMTP id
 38308e7fff4ca-3790774ba0cmr625021fa.28.1761582294117; Mon, 27 Oct 2025
 09:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-10-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-10-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 00:24:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v66f8qajMGCYLKPuS_mg73KejXx-OpfQqcdEf2fWDZkDig@mail.gmail.com>
X-Gm-Features: AWmQ_blCgsGXDdJxE07gjzrrlwEozdYBwqYFXf_-O0uUfEiCStxuxYsNrPVbQE4
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
