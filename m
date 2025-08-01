Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AEBB1814F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 13:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DE510E13F;
	Fri,  1 Aug 2025 11:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="NqSJwMoE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88D510E13F;
 Fri,  1 Aug 2025 11:52:42 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 9981333B81B;
 Fri,  1 Aug 2025 12:52:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1754049160; bh=mmI05tNrK9zVCmlky/MXauCEIwzpyCIx1+VMxKf5fJ4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NqSJwMoE+DaG6ZSstd1ZvMPXSRKKS7d6q7NVKIueoWfjrrgqyvpIgp+i12Dj/7cAf
 j2A59K15uA4nVWqwy6w2hNgUtVbfyO4S6jAn/zZ+xqLe3v2ZJt2PDuuwER/YHNUkGM
 GHMJDZ4yakSubKCnLKNIb9C449gtOCdunGqbGehH159issKW0yu+o5POj0JFPFryHA
 WcsGZ9uAkn8UUy18xKWN+4DvpTBsjfyDt8FgLF7iQzfhAeaCGzU3NqKvnBbFD0GMOl
 WJ0NjtkEw7QG5e3fCFiCqnUlFnQ5JUYhPShA2Yat8SeVLT+Dn5sgfo7xGgKe09wkRV
 14HyV75XxwbCQ==
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-af93381a1d2so100309166b.3; 
 Fri, 01 Aug 2025 04:52:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWLzVi2X89OzF261SdWJTpETm8eSyxTSQiSaRyWmkcAEsLxgX7C2TxMHH+rUJ8wOynAUasDr4eo1gXG@lists.freedesktop.org,
 AJvYcCX0W5XdmTnH7GeBNAw+gxHramAMGbtDAmneywLKWl6s6IuRXEzKfjpPTawmOiQri9AifoRuwx5d@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0auNTg1vzOoVwmjVAYasbR4tltMvZsJaZbiSJfELafQAd6fJe
 bTVs+K98NbA19JVa0d0RvuJxgJcmP3tjQHK/3IweDvIHDggo6WNoY0LTxPsSBZaSt2r+Tdqf/bY
 /ZvJwqLIn6Cz8lkK6/hX3wSL1jkflN/w=
X-Google-Smtp-Source: AGHT+IE4S8Y53DPW/S4TQMY++oWooYOxjeHdg/kArpJg92kGLpX0eoKuozYr3sUupsziiB3vJIxQaveTcPYL9YeM0bE=
X-Received: by 2002:a17:907:3f19:b0:ae0:de30:8569 with SMTP id
 a640c23a62f3a-af8fd69c2demr1242363166b.1.1754049160089; Fri, 01 Aug 2025
 04:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250731151732.9295-1-xaver.hugl@kde.org>
 <e5e0c109-f206-47c6-b17c-661d0ea0e700@intel.com>
In-Reply-To: <e5e0c109-f206-47c6-b17c-661d0ea0e700@intel.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Fri, 1 Aug 2025 13:52:28 +0200
X-Gmail-Original-Message-ID: <CAFZQkGweN5LxT16khohrFFp+P0XYEdOCiLh0Ckb2AYEMsy5_UA@mail.gmail.com>
X-Gm-Features: Ac12FXwx-1lKzC5fN0_DEf7Jf43riEbF8aRWJTarpbAdpYH2hndmeHnWM8k_YcM
Message-ID: <CAFZQkGweN5LxT16khohrFFp+P0XYEdOCiLh0Ckb2AYEMsy5_UA@mail.gmail.com>
Subject: Re: [PATCH v2] drm: don't run atomic_async_check for disabled planes
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, andrealmeid@igalia.com, chris@kode54.net, 
 naveen1.kumar@intel.com, ville.syrjala@linux.intel.com, mdaenzer@redhat.com,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 alexdeucher@gmail.com
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

> As said in my earlier comment, this new_state->visible is not yet
> populated. It will be viable to have these after atomic_check where
> state->visible gets updated.
> Instead fb can be checked to see if its changed to NULL then it means
> disable the plane and instead of rejecting the change, can proceed.
Oh, I assumed that visible would be set when setting the properties
(but potentially wrong while not all properties are set yet). I
should've checked where it's actually calculated, sorry about that,
I'll change it to use FB_ID instead.

> These kind of checks will be much easier with having the proposed change
> in RFC https://patchwork.freedesktop.org/series/150081/
Yeah, some cleanups in this area would be amazing :)

- Xaver
