Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD22C7A437A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E33B10E1FE;
	Mon, 18 Sep 2023 07:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9917110E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 07:52:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D559B80D06
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 07:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180A1C433CB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 07:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695023549;
 bh=JpRQj+CS1LIqG6RxrH0LFqYOg4M7sfDK2bw5TGAmPjk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DiCFZttO/1LGzwn/74BSriJkG66LPqKOPVJlGdd2jcUCLPb9ACaJG06N8MW6eI/5R
 m0sg957uKn9KsPzp+hc2vD1Hfx6g9NP0uJA3AFnW5mr3GR2MSgGycPzP7p3J0L9z1H
 IDitOlkeQw4eopY6eX6/w3itdWMUZgZo2NzO/a0rAJcT6COpD2pPUKLA1oElFctQ3J
 UUbg89tpOyizK4zliUygfwEu7WDTar24Rijg8qdrxdUexrVBGtLar2F/AeRh3qrDMu
 F18cYooFM1Q/3lVdNCBLeJbLdXDxydYuphSblAAgW45AwKJJ49usmzr1PiAcSATn5y
 1aDtgboA73DmQ==
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-4526a936dcaso310445137.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 00:52:29 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy/UXsvdveBHM09NJFAwcR9tTA/MDkcz4hd8bg6qGnav26INKxl
 l4FzeCSUumkqaqT9WGBzhQ0tFG9Gw2zf+3AF3W8=
X-Google-Smtp-Source: AGHT+IG9StBg3ebnKnehHNUgY0wdwNcbSqnJu80Bw9fzTMW636VcC+o0IvC9AC/K8X4Jubw7Cog0n7XUMSPqoHVe+t8=
X-Received: by 2002:a05:6102:668d:b0:452:67b7:42be with SMTP id
 gw13-20020a056102668d00b0045267b742bemr1977559vsb.4.1695023548157; Mon, 18
 Sep 2023 00:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230823-strncpy-drivers-accel-habanalabs-common-habanalabs_drv-v1-1-147656947586@google.com>
 <20230825091856.GB3748525@linux.intel.com>
In-Reply-To: <20230825091856.GB3748525@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 18 Sep 2023 10:52:01 +0300
X-Gmail-Original-Message-ID: <CAFCwf11afiokfGubENdOggb6VvmWAyakeAqJAR-JQN66QHOpAA@mail.gmail.com>
Message-ID: <CAFCwf11afiokfGubENdOggb6VvmWAyakeAqJAR-JQN66QHOpAA@mail.gmail.com>
Subject: Re: [PATCH] accel/habanalabs: refactor deprecated strncpy
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
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Justin Stitt <justinstitt@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 25, 2023 at 12:19=E2=80=AFPM Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> On Wed, Aug 23, 2023 at 12:23:08AM +0000, Justin Stitt wrote:
> > `strncpy` is deprecated for use on NUL-terminated destination strings [=
1].
> >
> > A suitable replacement is `strscpy` [2] due to the fact that it
> > guarantees NUL-termination on its destination buffer argument which is
> > _not_ the case for `strncpy`!
> >
> > There is likely no bug happening in this case since HL_STR_MAX is
> > strictly larger than all source strings. Nonetheless, prefer a safer an=
d
> > more robust interface.
> >
> > It should also be noted that `strscpy` will not pad like `strncpy`. If
> > this NUL-padding behavior is _required_ we should use `strscpy_pad`
> > instead of `strscpy`.
> >
> > Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on=
-nul-terminated-strings[1]
> > Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en=
.html [2]
> > Link: https://github.com/KSPP/linux/issues/90
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>
Applied to -next
Thanks,
Oded
