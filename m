Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C031C0FC73
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C210310E537;
	Mon, 27 Oct 2025 17:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QX85SV5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EDD10E537
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:50:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2D3714613C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC7FC4AF0B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761587457;
 bh=jc/356FpIO5fq3wbVBLhYJF7QyfRlww33yCqXERm6yM=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=QX85SV5IPfGzOsBynpyHwugp0CyyVgKShCIr1Q7lnl8ZklOUGkFlOBFSI3nTLg6ke
 9ertPoek6SjQirRqvnVzkKMldV1MdeybOpXHGbkwvNOGArQhDZ8j+P9JxYNn8lu8Qj
 7eKET5JcnhsKQcC6BGqI8hs/20lU8/T9dTksPA/K9Mglk/SbLStYe4qfDVJgH6p1MR
 iubxIkr7EgXHfMYBH5y6ivTOPe9YPaZSwBsc7kZ4zcsFa8sVisBEgvUru5dZNdkBAQ
 pPtjP+qGBaSnuJC8BXvLVHeXqKPzT12/1o1WVtLvEvWF52VA5X1r+vJFynid+XEQES
 3UJ1dApDTm3xA==
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-92790f12293so228211239f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:50:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVZMdwS7SzaT6jLKnNFtkh4zh30WSZcXg3qFU/JdIHNSEV36CEwJR/FRM7ibfakEvVlZtvF1SwSskk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTjsduSFXfox98pyIIDy41jGEqKnZWG6l2a9g7HyZs5uD/x2P4
 7cer7D3PXqjrZxmdMnnctps7811A4oefnEez5EGsdoQsMtt3FCJKyq3HUquWeq/BCmUUKWL/Vrt
 XEg+4MjKncVY+d7MO7DK/csbMi5E7nlk=
X-Google-Smtp-Source: AGHT+IGnc89exOTZE3mKHcEYS+jts1LyngerTZI24ol1+00dieJ+BnfWVo6DyciMsJbIRCI98YsRjlcZ+jytqeDhnWA=
X-Received: by 2002:a05:6e02:1c06:b0:42e:d74:7260 with SMTP id
 e9e14a558f8ab-4320f866607mr12752885ab.29.1761587456395; Mon, 27 Oct 2025
 10:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-20-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-20-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 01:50:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v67mHaxFAZ_OtPoOfoKbV8x7EFCAmhiq7D0NY0zdRZ627w@mail.gmail.com>
X-Gm-Features: AWmQ_blzThNj1vSmpmbdGuHWVfAbSef_0wIVgxBtON1FA8iGGT9ZN-SnXracJEg
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
