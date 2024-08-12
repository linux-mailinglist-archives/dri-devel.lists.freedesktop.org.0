Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE00194FA11
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 00:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2805C10E1A3;
	Mon, 12 Aug 2024 22:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LcW5/qwE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B98010E1A3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 22:58:53 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-492959b906eso1848251137.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 15:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723503530; x=1724108330;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4R5ybnevxBtj+R9uSFEmpvuFSAZVoFC8EhL88LHQQz0=;
 b=LcW5/qwEhxor0bPyZdCTQfVZHz/rtWhH9rX94GtA0su4LaIpb2W7COWYHS5RbfW7bv
 +2s2Ak10IABWRQvZR75GMO5SiVs2Xn8FMPCi44HTixo6ON05QMrjpOOC0mIu14mcKtHF
 TDrcRK2dbOYP13DzNidtaVGIHYDtl4cpaDL3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723503530; x=1724108330;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4R5ybnevxBtj+R9uSFEmpvuFSAZVoFC8EhL88LHQQz0=;
 b=Ax9VChVV8FccyEJoyeTeofCvWFfzNBEDZg36Je6JYH+Bm5kxu3CHEf1PScjAZLs5DY
 iX5P/70TCXJDCrVgW7kJb/ET/aRGieKE868lcT+4VVSOCMtyT1gLYl15dxo9PXKNre/G
 K++T3DzjrhbtGS4cAAg1KMTeIslo2BKvKRl6IBOnJfsIWfy8cfd2NLbeEGWFz/AI+E7B
 OUsd9OJXOoEiWKJxEhHj7/cCN6X0GIq1xv0cJfvjmBermQJvh0Jcy8fa/30gb0rRSnO0
 3moGEb0YOXa6PJZWsdZUUySDkXGikzlgAyGOuSpNAvMi51P2aUFNX51kyGVEQX+4Uen2
 qMow==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7cz04OD78VgF2db3tvacOyzjlOX8SFLM836T2g7OjQPD4hoHsUar9O07QQdiX64eqdlz4BkbxhlkvpulhnlC0oV7Zy2dXAUzy5dd/0OKo
X-Gm-Message-State: AOJu0YyoWNfGh2taqls4B+yq3nzLdiBQmOl+Sfm3x9WQ6C3/N3FVUFBx
 +1CoTD+XyrfSwfRJnEkVrCu4AlXz0DiFnwJt/D3qYY9iZwy9CoJN2hXYc+k4/diK1UOVetbiRgg
 =
X-Google-Smtp-Source: AGHT+IFleZZNV89zVpU3BgugYTXEmPnduNSXepQr67ZBw06Mql2zixDd9pIFY6i5BeZpFLCpCk2ySw==
X-Received: by 2002:a05:6102:390c:b0:494:4fdd:4b7a with SMTP id
 ada2fe7eead31-49743a917f2mr2238032137.17.1723503530633; 
 Mon, 12 Aug 2024 15:58:50 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com.
 [209.85.219.46]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4c7d6da49sm286619185a.28.2024.08.12.15.58.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 15:58:49 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6b5dfcfb165so27614276d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 15:58:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWLYq8E+NjxbphUcaTH/4J68wQL2zPmaHXrJ5JG4Ihanb84eMM/+nBBHxdkFoqGspFZryXdauQgS8hYw1vtBXfKxkeVfT7Ht7x/37qyqSc/
X-Received: by 2002:a05:6214:2e4a:b0:6b7:9a69:f5f8 with SMTP id
 6a1803df08f44-6bf4f79c2b0mr24926066d6.21.1723503528446; Mon, 12 Aug 2024
 15:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240810045404.188146-1-tejasvipin76@gmail.com>
 <20240810045404.188146-2-tejasvipin76@gmail.com>
In-Reply-To: <20240810045404.188146-2-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Aug 2024 15:58:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xy6ce-E=MpAJ-gknc925vD+RwiatX4AZd-Z-EZmrcPjA@mail.gmail.com>
Message-ID: <CAD=FV=Xy6ce-E=MpAJ-gknc925vD+RwiatX4AZd-Z-EZmrcPjA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mipi-dsi: Add mipi_dsi_dcs_set_tear_scanline_multi
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Fri, Aug 9, 2024 at 9:55=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> mipi_dsi_dcs_set_tear_scanline_multi can heavily benefit from being
> converted to a multi style function as it is often called in the context =
of
> similar functions.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 31 +++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     |  2 ++
>  2 files changed, 33 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
