Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC80BB8C04
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 11:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892FE10E214;
	Sat,  4 Oct 2025 09:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mts/iX20";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C05110E214
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 09:36:58 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-280fc0e9f50so4332365ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Oct 2025 02:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759570618; x=1760175418; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=feYeUBQ+zRG9kMk06d6rOS7HenSqT9mRm9UdGzyR9sk=;
 b=mts/iX20+Q/RaWeVxln73RpPs9sOs0duQZo4XsnyOMAObn8vyIRzfGgx5PZxpP4fcd
 e9xnWGPgP7W2+INywgOYcjazJK4xcOYXfbS4GHrh2hi6BkFfNzJZVvVO1XJ14vXcoNLj
 eA8eu6teHE9Q+dzMzoDblT9m5Clunwgjb0l72BeRZcVBv9MANfBt89UgqqMkR5Zjai5R
 jfJ+kBJudz8s75+WR9HPblB5HpCh4GKM1EfBuZEjaF/Agd8A7geJic85CuvD08DDgtpD
 R7J5bxMhnF1aOlU7CBZOmI61UXVsd5fMUQ6HH36TslLaal8aZNdIRKmU0F8qJ/9ZSqdd
 JFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759570618; x=1760175418;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=feYeUBQ+zRG9kMk06d6rOS7HenSqT9mRm9UdGzyR9sk=;
 b=O1kbKOJI2z5cL7+ffRdR6TzDDbte7v8I74dMh2zo/Q6CV0j87DoDwK00Z1QpKXAC7D
 Zvo/C6lIP91eQFFTNZYqUh8+lBFNdujNNLk3EABRycRLw52FzNyp6ry9++VLsPxfVgro
 kvDb8jtT5vd4XfgdI3JaPOyrWdNqEIo7+eFuw1j+Pvqj1jG4PHgFHlXHcN67Jdn1kbl7
 ouHoso2HfUKqxobnkFebMtlOfcBjewbj8XoFnpxWfnKuI5a1cGhdCCrWTO9eUzRRG9BU
 Kg9NNVcEXY0JumqulFDRpE1fMlrPc0LNbo3NsPcx0rLvsffGDTGt38UH362Y1A4tigdB
 j1vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhzF4wUISlq0XL7glPTd8ZCrEssNw/7YOTtOXNH81JmdknkOLHz+x3xbpkTD6vfVu9SGOf9B36drA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybBaYtn+b4Za92MTEKFVoxmkee7GL5jkXjVcJT00oBlCsR6IYl
 F38HnvOz0JHAWMY/eUeqeMrFPsLA2/QeDAjxZm/In0SYT+RatnU7ZVNL9xfP86bdylj2QVQwLc+
 pbAqvQiQ65q63FgFa59glM1Yz5XBhDBGbEKwj+9k=
X-Gm-Gg: ASbGnct8FDkpP3m4nff5l9Hxw+35Ct45EqjdR46JAaOzMrDyu6IaBZaNkM7K7EohrcD
 WyGuyIt7KaKX/TdJiKAXltwxItdr4PpG9AMJDR0tIGLYllPLntSY48FveO/GlpLE6MzZkG7q+i9
 kbTnugVfsSXasFSd/4ukGlv4zJDN16CfXTPjS7ddhZufgRNpTgYQp7th6ZGgWh4046mPnzY9Cc4
 jx9qpIqxX9zH28b89xTbYXrTZSLGbC30Wu0m995dXfhc38PZVtnV2pnZP3LiL1t0lP7NsOjDNLd
 QNi2B9+jvTCRuQTh3TP/manJHZFeN1xo0qy1h3KDfQr6M4A2+A==
X-Google-Smtp-Source: AGHT+IF77wTkNQM9OohiiK7sgjNFds3niKOBIfBEyFk8BZ16yvDihaUL7UtpNXy0XNC2sOVra2ov0jtp328+HUcOPDg=
X-Received: by 2002:a17:902:d2ca:b0:288:8c30:f08c with SMTP id
 d9443c01a7336-28e9a5d22c7mr40643515ad.2.1759570618049; Sat, 04 Oct 2025
 02:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CAHk-=wgO7S_FZUSBbngG5vtejWOpzDfTTBkVvP3_yjJmFddbzA@mail.gmail.com>
 <CANiq72kq5YHovH=_a9c0JQgfrAx9gRsQvVo1VfHd-FaupOp7rQ@mail.gmail.com>
 <bd004ac5-9e51-4e90-a3a4-025d74941a38@nvidia.com>
In-Reply-To: <bd004ac5-9e51-4e90-a3a4-025d74941a38@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Oct 2025 11:36:45 +0200
X-Gm-Features: AS18NWBfyunA2-nfASh7Yj1hCcCcrL6FKNe1jx_SFPOW7HhxILbzUUVeFdW6VCI
Message-ID: <CANiq72mRdQRM_uDPxB35zUDXrS99o6i=RaPjTghVTZSG53i2_Q@mail.gmail.com>
Subject: Re: [git pull] drm for 6.18-rc1
To: John Hubbard <jhubbard@nvidia.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Sima Vetter <sima@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Sat, Oct 4, 2025 at 3:54=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> Very happy! Far more so than I expected. Being able to *not* fuss around
> with minor formatting details (while editing, rebasing, and reviewing)
> has been absolutely transformative.

Thanks :)

> For example, on today's linux.git, I just now ran it, and you can guess
> what happened: it changed its little mind about yet another use
> statement! See below.

Hmm... I am not sure what you mean by "another" -- this is the one
that Linus left in the tree, i.e. the one that originated this thread.

In other words, changes should not appear randomly -- the stability of
`rustfmt`'s output has been perfect so far for us in these years and I
hope they continue to maintain their stability guarantee. It is what
enables this, after all.

Cheers,
Miguel
