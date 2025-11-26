Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC76CC8C46D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 00:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6E210E71E;
	Wed, 26 Nov 2025 23:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kv5FaxzU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2086E10E71E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 23:03:02 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-789524e6719so4979877b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 15:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764198181; x=1764802981; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gw9DMkLaNnLKzwOcjsx+05nyNGGJ9jxMAbhtYkSWLmQ=;
 b=kv5FaxzUc7Ykk1l1G3q7mxEdsQYpgrJ8+73IckI3RdSf1FDVef1XiQ6nIcPkyapis6
 7f0sfqRh9XEJ5SeXEcL5wRok0IZHa3rXOFLGBWlo77bUHf04M4BH7CgTtplJVgQjBXPC
 +QoPj8Tt+4A8BSk5zxKwFHpcoMAmcqF8JXnF6gjLVKxR3HvrCf1ajUWqtrP5LxnsngdC
 Fasi0JU+bVzVbhucKVwy4CuOPJzl+5E2QADK4utd/WgkriG/jy6qlaXLf7z3LjKTOGcv
 IXBp2vaXvzczTFlDjtryDAxoINo/E2yJeNI7n+rmD9oN4UzbtPxfarMzyy/yvvsPm7I8
 +eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764198181; x=1764802981;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gw9DMkLaNnLKzwOcjsx+05nyNGGJ9jxMAbhtYkSWLmQ=;
 b=wFfnkh68v5IfkFZoEuCerHerwEL8imHs/0D7eEm4aDBnBLnwpz9J+bC76p4y/uAl9r
 ZFHR3CdNeRvqCFJZ9/n6Lkq2s0l7xA0YQQ2RxrmfzZxxi5pWEUaLeCD19V+xRBsTgYw7
 opqDC8FhqrPJAWG/0/9NPEDXLhxcBQ/CbvPpBPHb6uiY2nzaVolWeOhN0k8kxQAIm6MM
 gOIwRMTveHyp1DojgJS2F7Ad2DoHjTCC6S52dZrSUCk7NRfrXxHX83rh3gi90cySNo9d
 ajlLVD6WClnhuTwbn1jI8/fwmfcDP/54yPVqvoU8DCiIh++zOGK1zpFcaBWQcXwyQ7Nf
 NYsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCz+Elx055fWXlmKHYHphe0WCdVzSKlZByIo3ahS2dN4MZ23NL6CVc2b1XukyAhJfGrwCN0W9cIb8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqceHFdNy5B82yrTDhZYkVTfhZCbNuWosmjBWo3kPIecaCb/ah
 fim7EzqWd4o+/hMRGPAAHhtaMHJcYj0idhLuGSb6HPZgEIcOqreGppL2eye+acC5jB+CxM/t9RB
 /ggdwuSOJqzZxd5/019thYtt4tItiZXzrlZnE
X-Gm-Gg: ASbGncv1ioBJr9EOUeFagpo2K5hOIvrey8y5vRXRuSSB5QmKZSzIuxRT0DITc9Bc/w7
 /KaA/VbujkFGR/2XOHqdc5lwrjyxxPxHqDqGisO6htLef2cNzvd3m6wCDYVL4TKlERzmNvqi0AJ
 Oa56ijO+PcM0PnI2mkgH7sRxV3/jDl8CB8K0FRpQhbMEX5bUZTfbbO4sT017Aq9TpqkjQDFDEE7
 1K1It1UIpItYe6fb2igxR5QsnUDvXEsO4TJYHvGp2mZ/1lrS2RBBPtYY5QrBdZk05P8NqiWG1ev
 d3QrSEeRCga5qHF76NifV/FQ2VNP
X-Google-Smtp-Source: AGHT+IHzIVQtDHiLj0hozua6koQs3M/OqADnQHlxf/i995uuIfeTsR9lOuF/SYjIM28Qgek9nxiEaaH1xTFNe7OFWuY=
X-Received: by 2002:a53:b10a:0:b0:63f:c019:23bc with SMTP id
 956f58d0204a3-642f8e30acamr18859442d50.27.1764198181005; Wed, 26 Nov 2025
 15:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20251112115142.1270931-1-boris.brezillon@collabora.com>
 <20251126131408.68e7d868@fedora>
 <ca768fdf-df13-433a-b841-5152e26c9b92@arm.com>
In-Reply-To: <ca768fdf-df13-433a-b841-5152e26c9b92@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 26 Nov 2025 15:02:50 -0800
X-Gm-Features: AWmQ_bmZPqYF4ez_ZiGyO7aensPNhDM5w6-vs3vfHT1QOtU7TyMOb3Fxp5pKs5I
Message-ID: <CAPaKu7Qs=Ga01-ikPxjnE43GLvPVBq1+ziM_w2upQJUqByt27w@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] drm/panthor: Misc scheduler fixes
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>, 
 Heinrich Fink <hfink@snap.com>, kernel@collabora.com
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

On Wed, Nov 26, 2025 at 8:06=E2=80=AFAM Steven Price <steven.price@arm.com>=
 wrote:
>
> On 26/11/2025 12:14, Boris Brezillon wrote:
> > On Wed, 12 Nov 2025 12:51:34 +0100
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >
> >> Hello,
> >>
> >> This series is a collection of fixes that seem to address the problem
> >> reported here [1]. In order to validate those changes, I added a few
> >> IGT tests [2], but I'd like to extend the test coverage before claimin=
g
> >> this is working properly. Until I get to it, I thought I'd post what
> >> I have for preliminary review/testing.
> >
> > I've posted the IGT patches to make sure the bugs fixed here are caught
> > if it ever regresses again. If there's no objection, I'd like to merge
> > those patches before the end of the week (given we're passed the 6.19
> > branching point, this should give us plenty of time to address
> > regressions, if any).
>
> I believe you've already got my R-b on all the patches, so from my point
> of view: merge away! ;)
I made a few minor comments. Whether they are addressed or not, feel free t=
o add

  Reviewed-by: Chia-I Wu <olvaffe@gmail.com>

And because they are so minor, feel free to merge without sending out v3.


>
> Thanks,
> Steve
>
> >>
> >> No major changes in this version, for more details, check the changelo=
g
> >> in each patch.
> >>
> >> Regards,
> >>
> >> Boris
> >>
> >> [1]https://gitlab.freedesktop.org/panfrost/linux/-/issues/48
> >> [2]https://gitlab.freedesktop.org/bbrezillon/igt-gpu-tools/-/tree/pant=
hor-sched?ref_type=3Dheads
> >>
> >> Boris Brezillon (8):
> >>   drm/panthor: Simplify group idleness tracking
> >>   drm/panthor: Don't try to enable extract events
> >>   drm/panthor: Fix the group priority rotation logic
> >>   drm/panthor: Fix the full_tick check
> >>   drm/panthor: Fix immediate ticking on a disabled tick
> >>   drm/panthor: Fix the logic that decides when to stop ticking
> >>   drm/panthor: Make sure we resume the tick when new jobs are submitte=
d
> >>   drm/panthor: Kill panthor_sched_immediate_tick()
> >>
> >>  drivers/gpu/drm/panthor/panthor_sched.c | 190 ++++++++++++-----------=
-
> >>  1 file changed, 98 insertions(+), 92 deletions(-)
> >>
> >
>
