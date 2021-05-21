Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC2038C669
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 14:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBE06E18E;
	Fri, 21 May 2021 12:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1466E49B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 12:22:53 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id z17so20867042wrq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 05:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tXzqoTh9Q6otGWSG/m2z4V/r+EdDHQXeOAwek5k1Apw=;
 b=fhGWDMtRWPPjaQRts6ngbU7RFDRPLZxsO/dYPBecxs11qDVpGOrqwFwTAclyPM2NM3
 nJP9nH1WfXkimY2pRXSwkgLLRAM1hH5iq2wdhk6yXFysmb/2V3dCMD+m/r8bCg5pCu20
 ytbeUFu8HYocl8xDkZD07SCx8OTWunCSNaeGb5HErEc3xvmS5tCcs72NgEZ5msvLwMmJ
 TOWwwzflosPbtN0ZPrkoNPsHKONhitwQCzjd2zYdQDaHymQK32IP8XUOxG5tKCfgtJrg
 sUALcf4OR6cFiuK4C+tykpV7nmZrJeviPP7dL+Zbes4wNiRGNZImMKgqKoXmpnF0BBeO
 sm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tXzqoTh9Q6otGWSG/m2z4V/r+EdDHQXeOAwek5k1Apw=;
 b=O2rC6ym2tW1Sw3gb3mIPEY8g7ov6ELCqddZ2rguGTmIEzqYLFS5HS+Msso4Ho3TgZA
 97VdGIXd7dKuMo0j07GqlM3i+5mlGIFhU/zfiJ1OApb7Zn284Ot9y6WoXiC24nuvEJiv
 gcwybF/pYz+rBTXSkSKJvO5afG58vzfhL8GNsCfcYZ7pNieG1K/qH4xbLY11K4rsZUry
 3rqscyzhAJS2N9u5UkpGjfbGZ2f5M5lZGE6dNkcc/eIIOhlzbNg0EQqhmK6dsFz38NE4
 vmgLg09eg5SDy6IYlicMzN/DOY+sCpa7zO0D/erNvDChpPg9qHw8ASXPoUPtou8rA+Kd
 IA8Q==
X-Gm-Message-State: AOAM533h1SrPImm3S4tpEZuHFDY8yh20G+eMdAFJzL9+MDTlPgRn10ca
 v6+H84va/C8D/A6GVU8jhcZAip86jumiAbWHdzWGTw==
X-Google-Smtp-Source: ABdhPJzs6JDh/PVfFHAZiz0tvGCOrZlKRQmwz7h15e9g9pD1J/vW4gLLdrMc8KrEGPgbhOVJa3TJluupr6PSsDmH+Fc=
X-Received: by 2002:adf:e70e:: with SMTP id c14mr9371714wrm.6.1621599771623;
 Fri, 21 May 2021 05:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20210521090959.1663703-4-daniel.vetter@ffwll.ch>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 21 May 2021 13:22:40 +0100
Message-ID: <CAPj87rMBVRamT+VAVUaUnq3C1KFVqzABi99RKs=1_vyb4YWDnQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] drm/panfrost: Fix implicit sync
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 21 May 2021 at 10:10, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> Currently this has no practial relevance I think because there's not
> many who can pull off a setup with panfrost and another gpu in the
> same system. But the rules are that if you're setting an exclusive
> fence, indicating a gpu write access in the implicit fencing system,
> then you need to wait for all fences, not just the previous exclusive
> fence.
>
> panfrost against itself has no problem, because it always sets the
> exclusive fence (but that's probably something that will need to be
> fixed for vulkan and/or multi-engine gpus, or you'll suffer badly).
> Also no problem with that against display.

Yeah, the 'second-generation Valhall' GPUs coming later this year /
early next year are starting to get pretty weird. Firmware-mediated
job scheduling out of multiple queues, userspace having direct access
to the queues and can do inter-queue synchronisation (at least I think
so), etc. For bonus points, synchronisation is based on $addr = $val
to signal and $addr == $val to wait, with a separate fence primitive
as well.

Obviously Arm should be part of this conversation here, but I guess
we'll have to wait for a while yet to see how everything's shaken out
with this new gen, and hope that whatever's been designed upstream in
the meantime is actually vaguely compatible ...

Cheers,
Daniel
