Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2A479E6A6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 13:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E11010E044;
	Wed, 13 Sep 2023 11:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E398810E044
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:25:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 08925CE21B1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF12C433C9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694604331;
 bh=gd4Qg3wRr62r6hfNz7SvyOMx7SR3EXpHDzF31oJWhNg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fo1KTGbXd6yIn2G5OTB8aXaZ0oNY2PoRgqPMb2bkR3QDXuZ8OoFmfTmR6bLztmi9x
 jyZAjwygsU0QQE9I5pvecp8p/1rV7QYk8kyonQyaeOCkMljHwP8tR+SWIyw/Cr9T5t
 ZmiQXLvzQEwP/AVEwCewjBiQwSh1+pyaIBkCKzvwXwbq+wBlx0dQ/R4b9YLUfExxsD
 jJdxRfmio/ua4K1MB/slVwl9PClTibPp3A3/dOl17tBr5BCoMJMVm99RhGLqzgd7aB
 JyTOQpbieVzjmdGEYpEreJcgKyH5aeo2sy2FKM/rGqgOFfIyQOz24kSHnS8azaKE0j
 dOt1psUDKAnfQ==
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-579de633419so67346497b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 04:25:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YwmtI6j0UUfYc3jc3541/Yko7/LnzIX2K39h8ktPb7HW4jrG80R
 9AhdAMIKUHAvGVLTsSVDviiuyAHeZSPZiPnbBkc=
X-Google-Smtp-Source: AGHT+IF++WTrqbY3O8aaxIaa8Yma5uo3TC1iem9FGG5Ad85NyXYy6VAVo51407NjSpy8mj+70+8MDQDzOS1MswcqFvI=
X-Received: by 2002:a25:d009:0:b0:d7b:9d44:767a with SMTP id
 h9-20020a25d009000000b00d7b9d44767amr2030302ybg.17.1694604330438; Wed, 13 Sep
 2023 04:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <d38582083ece76155dabdfd9a29d5a9dd0d6bce7.1693855091.git.christophe.jaillet@wanadoo.fr>
 <20230905122827.GD184247@linux.intel.com>
In-Reply-To: <20230905122827.GD184247@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 13 Sep 2023 14:25:03 +0300
X-Gmail-Original-Message-ID: <CAFCwf11LyA-pyq2kZ_oJhCtw_LCyx3h_a4JTurPvRNBFngzqcw@mail.gmail.com>
Message-ID: <CAFCwf11LyA-pyq2kZ_oJhCtw_LCyx3h_a4JTurPvRNBFngzqcw@mail.gmail.com>
Subject: Re: [PATCH] accel/habanalabs/gaudi2: Fix incorrect string length
 computation in gaudi2_psoc_razwi_get_engines()
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
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
Cc: Dani Liberman <dliberman@habana.ai>, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 5, 2023 at 3:28=E2=80=AFPM Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> On Mon, Sep 04, 2023 at 09:18:36PM +0200, Christophe JAILLET wrote:
> > snprintf() returns the "number of characters which *would* be generated=
 for
> > the given input", not the size *really* generated.
> >
> > In order to avoid too large values for 'str_size' (and potential negati=
ve
> > values for "PSOC_RAZWI_ENG_STR_SIZE - str_size") use scnprintf()
> > instead of snprintf().
> >
> > Fixes: c0e6df916050 ("accel/habanalabs: fix address decode RAZWI handli=
ng")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Applied to -next.
Thanks for the patch.
Oded
