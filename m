Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6678C86F58C
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 15:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A0C10FA39;
	Sun,  3 Mar 2024 14:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JjfwudWN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3991C10FA39
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Mar 2024 14:36:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1745ACE0C07
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Mar 2024 14:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C90C433C7
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Mar 2024 14:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709476580;
 bh=p29mR435sSXSXicv5WUIv2plEonRkmPy0b1GJGHyFf0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JjfwudWNylC1CWkulnzf5sVih5ijPqr1E0vp+qc8KPVSv9i9AwwA9joAgIELoZ9DL
 3T4/QiBKikHWKK+7Z6SPl+1fuJd/1M/JNLTDoh96LkEAUhqiLQXQisolXv/pdvpfo8
 t0dtcMUmdu3IP8BGU5LP1Z09Udmk8qoyhREBol5mcHpDam0ZQvgJCcgOv0Ok5auBZ1
 cHoy3vGC4YLorUC+s/wV02xTML4ssDafiilP6G8xOxgSs0TaiUNiTzD8Uon2054WZc
 LWkCMLzHSZV0ucuzWq8ykIib1gvvNBSB6IjLH2hRWOBxsLkQVLC9mMwXU9qXyrg72G
 X6BXGLPEqr3MA==
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a4499ef8b5aso209479466b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Mar 2024 06:36:20 -0800 (PST)
X-Gm-Message-State: AOJu0YywieiaGn752eijX0xYPrcsQinvMWYADcAeeIW4AEzCM5jiYsTA
 /IkokoVgBkEqd17PfFRTNeTF8c1ffJe/GDZE0oBteMpy6/ALWpfwdZ0KOwdm0eAmABTmwZGnA7/
 ujEBL7SRhT5M2omWAtLErQpEkWUs=
X-Google-Smtp-Source: AGHT+IEmtCw44VHJZj0J5mhJJx/rJbZKzyDmkOHkwBRNn9f1KPVE3yIuo/41Y9ZjZIMNGFPQFWGwvicst3PpHPRg14Y=
X-Received: by 2002:a17:906:bc48:b0:a44:415d:fa3b with SMTP id
 s8-20020a170906bc4800b00a44415dfa3bmr4358669ejv.6.1709476578787; Sun, 03 Mar
 2024 06:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20240229175822.30613-1-sidpranjale127@protonmail.com>
In-Reply-To: <20240229175822.30613-1-sidpranjale127@protonmail.com>
From: Timur Tabi <timur@kernel.org>
Date: Sun, 3 Mar 2024 08:35:41 -0600
X-Gmail-Original-Message-ID: <CAOZdJXVHEQC4CSaZGTs9YvD+VHMBk+ar5e9Lx8JX0jTTYv9HEg@mail.gmail.com>
Message-ID: <CAOZdJXVHEQC4CSaZGTs9YvD+VHMBk+ar5e9Lx8JX0jTTYv9HEg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: keep DMA buffers required for suspend/resume
To: Sid Pranjale <siddharthpranjale127@gmail.com>
Cc: dri-devel@lists.freedesktop.org, 
 Sid Pranjale <sidpranjale127@protonmail.com>
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

On Fri, Mar 1, 2024 at 2:23=E2=80=AFAM Sid Pranjale
<siddharthpranjale127@gmail.com> wrote:
>
> Nouveau deallocates a few buffers post GPU init which are required for GP=
U suspend/resume to function correctly.
> This is likely not as big an issue on systems where the NVGPU is the only=
 GPU, but on multi-GPU set ups it leads to a regression where the kernel mo=
dule errors and results in a system-wide rendering freeze.

Were you able to catch this because nvkm_gsp_mem_dtor() now poisons the buf=
fers?
