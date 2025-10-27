Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68506C0F713
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B654889DA5;
	Mon, 27 Oct 2025 16:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="spnCglXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05FE89DA5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:49:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B3DA8455AB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976BDC116C6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761583768;
 bh=iwt0jedyUiNOzFlobqK/cAcMQOp8Zb3j6L3DOCL3MJ8=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=spnCglXjZvgKfzL4Yh67/LPtpXbNsmmsvIcdUaJEmXTVIRDxkkjn3AcLZF99Rkgam
 MZYOPgkn69POki8jL61AtdMxSHXSM5xee+poAVTOfHf7uZ511JYHDwHdRUOeXMrU6J
 +MjQ1Uwx/xShff8Ug9Zs/gYeLi4bvVK3enujeE1aAMdNQahL+sVavlb3ln0Itqwilo
 vMgAviDAsUmWDvn3TewOKtFgiAJcFx18ojQacW3Q3QmhWsadDK7CowbcS4/3DjxARg
 navc+Z46aTu0M918PiHTPlfTsMSGoYeisIs2Hw7lz3hGuuP0b/kbmtRnNg2fs8Zkas
 OUBM9tuP0oTsw==
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-378d50e1cccso51549721fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:49:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVyKnbcXkiJTJyY8OXOAqxG2SwKsChH2OYFqGzYeX7kOKkIg2TTEF1mmv+kk9f89yPwjykZAvoSWx0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbXD5Vwf1JIS1jLNRqRKcwuzdVhBQpxXKo7i1NWG96cRgzrbHl
 /4XMcPklOvPhCJe7ph9OSJpc3giq/pix5qAgAu/OgjHeqZoZmRiRjBj00182esxiY1fCcoTmgMF
 i3n8VViDeJ5yIMFo47NOs91uhPa1OjFE=
X-Google-Smtp-Source: AGHT+IGjZBPVCroqeihNgSQn8QEjwNnQ2fNEMf1WNTWh/VQEvPpTrq85cH+GmAxeA1rjsw+++pJ4KpH26mh31O7ZNf0=
X-Received: by 2002:a2e:a902:0:b0:364:f830:230b with SMTP id
 38308e7fff4ca-379076f696bmr1122261fa.22.1761583766949; Mon, 27 Oct 2025
 09:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-12-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-12-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 00:49:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v66f0s0n4cv7M6_DXF6cxnzjd=9jRuCk-o-=rVV+6OZLqw@mail.gmail.com>
X-Gm-Features: AWmQ_bm0ycd464KA4-SLL89Dthjko7sDvbYHRomqDxy1qMNmkmTwAyRYJbT_EzA
Message-ID: <CAGb2v66f0s0n4cv7M6_DXF6cxnzjd=9jRuCk-o-=rVV+6OZLqw@mail.gmail.com>
Subject: Re: [PATCH 11/30] drm/sun4i: de2/de3: Simplify CSC config interface
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
> Merging both function into one lets this one decide on it's own if CSC
> should be enabled or not. Currently heuristics for that is pretty simple
> - enable it for YUV formats and disable for RGB. DE3 and newer allows
> YUV pipeline, which will be easier to implement these way.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
