Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2798707433
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 23:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F5410E48D;
	Wed, 17 May 2023 21:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E05E10E48D;
 Wed, 17 May 2023 21:27:03 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-96a6c0cc0fbso32004366b.1; 
 Wed, 17 May 2023 14:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684358821; x=1686950821;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzYzSX84H6WHKtz+iH1LcjjiFBZ+NTz6SMtxmugCTuE=;
 b=dMIQ7h9ygisE9xCOEILiU++AsVgAME8zdFw1htlciHACuRFaquIqoSxj4m336DF36G
 DYciwnOTAkIgztl+Lng0jklKQ11YgDFrOu/UTRPc/11gHgAPpYc6TSCOeOHoDk4xIyX+
 ltm6ZxAEdsv5Y6SGv0WbzHlCTwfL0eSBss5R5TGwIoO51Owkc0Prje194Vu3mbPx6VIX
 95s315MmMOnBmwI5VmkV00bAA1eSv0XCebyAMcx1JU0mtvVVXG/XZzWa4F7J4vQqDYcT
 /DqIyyzZxDh+mf+V1lP3un2gSdy3np293IyB0nqHtWyByD9ChJ3Gj6ICwsA5k/GGBDtk
 U3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684358821; x=1686950821;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kzYzSX84H6WHKtz+iH1LcjjiFBZ+NTz6SMtxmugCTuE=;
 b=j7S9v0m75TujCakpl6cND5qggISaCaPqgKIX4DJYLiPWJELtV+gQoypZ2pWwqoKiJW
 XLW7tc28FlyDsmF5o68HlLuRcnVBXoSFjhf4LjP9RawuhVAO3ZkLZAZRYzwh4QZs2l6/
 FbBh/BWJqtNkSi2tBbkua3FoyePy7GUFkERH7jCnOwg5UKCyfdK38+LUWwHmM6S82m0h
 OPgRj2q5Zr8z3YzgoiqVswsn5iKB+d7D5GXhwHFEVKCvrLqB/X/bgVqBQDgOUKxGAsh7
 w84FX28Pg8Jt0ISd8HVdP6rFQEzNRjqKL9+q6vp7An+aCRc7OXCjPAtY1g6phQrFohnl
 itEQ==
X-Gm-Message-State: AC+VfDz2eCVrLKfxoWUwRJ+7aeecmrWLR1s6W50JHPFzz4io65uL1Dk3
 7pUrkvVtx+wDOHJgE4Lzv8hrb06Lmur5NSR2GQSOTeUo
X-Google-Smtp-Source: ACHHUZ5RJENfs+AvgwNVePKeS1Vm6dlZR93nZAHnNB30jh0lj49u+IN2gssLagp228gacwO2Q/Fjtxdh0OUmWFZwako=
X-Received: by 2002:a17:906:74c8:b0:965:a6c1:9b96 with SMTP id
 z8-20020a17090674c800b00965a6c19b96mr3029111ejl.2.1684358820832; Wed, 17 May
 2023 14:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230509183301.1745462-1-olvaffe@gmail.com>
In-Reply-To: <20230509183301.1745462-1-olvaffe@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 17 May 2023 14:26:49 -0700
Message-ID: <CAPaKu7TqUt1L-5RUuwEagr2UUs8maOO+FSoS2PEoP9eO1-JJSw@mail.gmail.com>
Subject: Re: [PATCH 1/2] amdgpu: validate drm_amdgpu_gem_va addrs for all ops
To: dri-devel@lists.freedesktop.org
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
Cc: Philip Yang <Philip.Yang@amd.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 amd-gfx@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Yang Li <yang.lee@linux.alibaba.com>,
 Danijel Slivka <danijel.slivka@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 9, 2023 at 11:33=E2=80=AFAM Chia-I Wu <olvaffe@gmail.com> wrote=
:
>
> Extend the address and size validations to AMDGPU_VA_OP_UNMAP and
> AMDGPU_VA_OP_CLEAR by moving the validations to amdgpu_gem_va_ioctl.
>
> Internal users of amdgpu_vm_bo_map are no longer validated but they
> should be fine.
>
> Userspace (radeonsi and radv) seems fine as well.
Does this series make sense?
