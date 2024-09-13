Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2554F978A6A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 23:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A589C10EDAA;
	Fri, 13 Sep 2024 21:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LcXvpDa5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAE410EBD5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 21:05:12 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4582b71df40so19651cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 14:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726261511; x=1726866311;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1BcM4lFpbGajeTbbT/mhOoL1c44seTsAjZcdL46W1OY=;
 b=LcXvpDa5M1MhA5uzajnpf5Uu9urBo5YSQ/ZS84X1hyA1mpssukTBo1rksHBFVoFY/L
 PO0RNjQFPuTRLddiytPMTONtoMrHPgTNYK7wobtbHNB8qSXfLRvhBm9AfGUfeyzamKUc
 au/2C+Ap8j1I6sV5sw8gCGXSGDZ8/yeGDD75o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726261511; x=1726866311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1BcM4lFpbGajeTbbT/mhOoL1c44seTsAjZcdL46W1OY=;
 b=cwl+VGazXLjHbeC2TcZ+Hae+ud5r3dckKDwowDE5Ki7oDcMn6tdh3qERnw60SO5Kd8
 N751PmwN3sDGQXvLtjRd6L4bIjjSjsUIFCgxrFbij3L0c12L9gTBcaBhD8VXS9u7AuXn
 0T07FrzW4FhWiofX0oELWQW0uOJ32cBXERkf1LNC1+T6q46ZDawP2NrZDkuUkHq4HF4b
 4Kba+enc6SyrT6e/7q8kd8hL7Ngtj2VCr/zkiQLVKl1Am6booX9J3e/8gswYx8WI16+3
 R3S/ljPPI092G8GcPG/V3eEpSSYFBiu6bs6lV9EFb9/VixxpwYPqpe72DljONPy/R2wT
 KMUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz/ZPbx9VGT1obV2zBe6bpVHDDSuvkS9JKfblsAM/nFkLSH3f7xZYQi6+sS0lAIzT2RFftBE8OlrU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2Ou6gyMlCjCrXKfTuVT63TjyuCBlINriCV2cBNxSzm0GDQODG
 PN5wXjxaB9b641Mf1ZjrkYnX52QdbUdHdvmCpoE06MP6h0SFy+Igy49Ht9bpz7Ma24XtMVmzsE0
 616n5whS89ywz85Ej8B82MiUyF6mRkdEowiOX
X-Google-Smtp-Source: AGHT+IFNRp9kjdF5lPJBN4P/u35hlTu6w+0QAcj6x9ZSyI0WuN2oPGU/zG4A4BHZew+CcsGHtVNi4SatFGwQfWsqIMc=
X-Received: by 2002:ac8:7e8f:0:b0:453:56d3:d155 with SMTP id
 d75a77b69052e-4586079ad25mr7773551cf.8.1726261511093; Fri, 13 Sep 2024
 14:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240913191428.1539653-1-javierm@redhat.com>
In-Reply-To: <20240913191428.1539653-1-javierm@redhat.com>
From: Julius Werner <jwerner@chromium.org>
Date: Fri, 13 Sep 2024 14:04:55 -0700
Message-ID: <CAODwPW8nEkc=x+BeSajfMVjXzET_0G3h-xFMnbUaE8Lgi-173Q@mail.gmail.com>
Subject: Re: [PATCH v2] firmware: coreboot: Don't register a pdev if
 screen_info data is present
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Hugues Bruant <hugues.bruant@gmail.com>, Julius Werner <jwerner@chromium.org>, 
 Brian Norris <briannorris@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Borislav Petkov <bp@alien8.de>, Tzung-Bi Shih <tzungbi@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> +       /*
> +        * On Coreboot systems, the advertised LB_TAG_FRAMEBUFFER entry
> +        * in the Coreboot table should only be used if the payload did
> +        * not pass a framebuffer information to the Linux kernel.

nit: The official brand spelling is "coreboot", always lowercase (even
at the start of a sentence). Not a big deal though.

Reviewed-by: Julius Werner <jwerner@chromium.org>
