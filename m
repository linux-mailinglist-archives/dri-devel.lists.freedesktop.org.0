Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2373D3AFFF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA38410E4AA;
	Mon, 19 Jan 2026 16:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RbyV4CSl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689C910E338
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 16:07:47 +0000 (UTC)
Received: by mail-dl1-f53.google.com with SMTP id
 a92af1059eb24-1232de2e2c6so154839c88.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:07:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768838867; cv=none;
 d=google.com; s=arc-20240605;
 b=TVM/M346+MX7hCcAFy7mHIDMoUS6LWbDEH28qrrUWKQ33wsp5bYxsgsoUxfcCI8GHd
 Ib79dPjuh/gG9RCNPd/IAzxV51Xs+evMAsIltL6ghE32y6nyi2U/xmOkfVvtIUALCBhi
 OA2kfXEpXlCVBImoQnXVM9R2oHeppxdln8zkKcqt3sEn5UIkFzDShMnxdZBhhk7Fr9u1
 MrrIxc9mokXvI9hVSXLOtylChRpizOmGZAmmmZrYze8m5oR1mzIT3Dz1Ve1enZju9mUt
 0lr9C4Zg6DQqkDgmoRQ34T/YO67fusSwfkck4QmqFetENpvdHysGx7fa3+mXzSHQw1M8
 oDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Qbaj/fDRaiKGOljlG6RQUY1Wy+mpyX2rcVYCDkUh0n4=;
 fh=jzqaYrMJQ++IP12+3eRSFT352jZp/5SDkEa/USgZh64=;
 b=Pyv5Olyf5PsRknZH/t39J3hCYniqtlXYWdRdw3TlpADow192dGJevmutb3johtwPBx
 LLOktJklJP6Sx3w61aejs1u+qgBYglPfizIdXSMiFx40Ez/RhBlvprx8EFqAO0/tsuf+
 be00eVaa6Y5LBi5A21C6W+jp8+jgscYn9gvO91jYlis1tJ7G5ULfQ2GEbZv1vE51FMnn
 GrNTG3r2WBalYFzqbILYncWjjnXNJtQBF3K/TWGpbmN5cWrrhZMqUnj2fvfSPbqcmyVn
 bMEduRbyxLCevPc14XeSgtTcnAg+IedJQjCDkolIRHXOXbIShYlghGCTGrr1FTHG2mCG
 rTlA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768838867; x=1769443667; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qbaj/fDRaiKGOljlG6RQUY1Wy+mpyX2rcVYCDkUh0n4=;
 b=RbyV4CSllzaSKvMkrw8QU0/RESwv8UeKdCSokdnINjlDJXY3wrwUWDgAkf3mZhadVk
 N54WupFmlqZ/WWpFfid8HVTDLEY5uOnkKiLuazANGVSNLpcm/+3g0mwbtQ+2uQbKTh9J
 SLugKcCDgTObxNVsku0k/RNowhq9WxyTZzh0tNpo2ZcMiLTRcibd0RlXw5cYfO6Wf/sg
 goDZ1wj4QG27jZHfk32yQaRIqgg2e6yURwEY46fdgEO92mtD8oBB/pQla2Q5vFoKbOiQ
 lhdEx0XmCk5xxqv3LyE3YZ3Olx7Cwm2gIvIH4yg0IHEZWJ+WKgNUXZ6rCgzWXgD/pnBq
 Klhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768838867; x=1769443667;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Qbaj/fDRaiKGOljlG6RQUY1Wy+mpyX2rcVYCDkUh0n4=;
 b=MC7ZGjbsAXl8Lx73F3hT0bx+oQL339nfxRg9ddd5TkqZ9G+kX6zwUEc5+9uC0zl1Zf
 ZOrzhSEYfD1iWiYaXE5+6pTeJCulyMX6gfZ8YVV4HakO6UapT08RF9SWHFtQkajMtVnp
 1pI/uIC19eBcUdNWDlb477i11/FuahhbC4oXxzA60lnL8ME0saTK3IQWVMSbe6FSp3Do
 k2wdsHtiKy0cDLYBARyrXTmOw2eJj+jCwy4TaxlNw3r0FIxkbZjJ+u7zKVUP10NNT72v
 43ECGLZBrG47ZWnxFOp+MnaMtLqNEzvAoxRIHq3+taxgtiGQMpjnAz9pWkJ4n6Bo66Q2
 37PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGKMuj3DJ3fg2UHUKNPEf/EsPQyfJiuWSS9fwuxlRBkI11HYL1re5bQco6IvE3eSxAXpJS3qbXkSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo8Pooa5NVoKr6jFMxRenMATnPtlut7Y+avtgMDmYpfmKRWlTt
 mQxmDtaEOhp8EEZ23vQrvgAS/hn9lZeTkm2LQbJLwXpzmXCtcGurStNgonZe1ILYnP1coVBWRi5
 4NQ1Aqt1sFoxDpWQhp8suJjAN/2KIF5c=
X-Gm-Gg: AY/fxX7t71XqaLuHJ4oJw0+yvew0gKwBINVI7NolQJm4gmyreckpbER8g/gwKojnpt3
 tcYMR5A2seE29yxbSJnBc65SK+ilecADk/iU+aQeaMQnVflAGHXEdDEIYXKXUZYrXsjUCuPnVUR
 bMhhgd3F85dDOheqsflFitSi1wDZcuSZp72kWY8BS4OK7gor+YP1tXGhdewlQQeD3FMfPP+TobC
 aArJepp15j5FmDMazgkDXzYKS0x6Oq335PBPC448CYSXZWqkzAQKXK3BrZv6r9JG8pvM58K
X-Received: by 2002:a05:7023:a8e:b0:119:e55a:95a3 with SMTP id
 a92af1059eb24-1244a7a2266mr4526044c88.5.1768838866559; Mon, 19 Jan 2026
 08:07:46 -0800 (PST)
MIME-Version: 1.0
References: <97A9D651052AA8A7+20260119084403.1420962-1-liurunrun@uniontech.com>
In-Reply-To: <97A9D651052AA8A7+20260119084403.1420962-1-liurunrun@uniontech.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 Jan 2026 11:07:34 -0500
X-Gm-Features: AZwV_QiaSJACqBg91UrPZBLMVc4s2iWPeLAMoh73ofm6h_RDkP4qnw_boTeip8A
Message-ID: <CADnq5_Nd1ok+fZUadHC6ukreUAJB-XE3NxUg29t8zfi3VXhb5A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix misspelling of "minimum" in dc_dsc.c
To: Runrun Liu <liurunrun@uniontech.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 zhanjun@uniontech.com, niecheng1@uniontech.com, kernel@uniontech.com, 
 Cryolitia PukNgae <cryolitia@uniontech.com>
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

Applied.  Thanks!

Alex

On Mon, Jan 19, 2026 at 8:57=E2=80=AFAM Runrun Liu <liurunrun@uniontech.com=
> wrote:
>
> Fix the typo "miniumum" =E2=86=92 "minimum" in a comment in dc_dsc.c.
>
> This typo is already listed in scripts/spelling.txt by commit
> 8c3200265787 ("scripts/spelling.txt: add several more common spelling
> mistakes").
>
> Suggested-by: Cryolitia PukNgae <cryolitia@uniontech.com>
> Signed-off-by: Runrun Liu <liurunrun@uniontech.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/dr=
m/amd/display/dc/dsc/dc_dsc.c
> index e4144b244332..5b3584ad5b6b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> @@ -1157,7 +1157,7 @@ static bool setup_dsc_config(
>         if (!is_dsc_possible)
>                 goto done;
>
> -       /* increase miniumum slice count to meet sink slice width limitat=
ions */
> +       /* increase minimum slice count to meet sink slice width limitati=
ons */
>         min_slices_h =3D dc_fixpt_ceil(dc_fixpt_max(
>                         dc_fixpt_div_int(dc_fixpt_from_int(pic_width), ds=
c_common_caps.max_slice_width), // sink min
>                         dc_fixpt_from_int(min_slices_h))); // source min
> --
> 2.51.0
>
