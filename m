Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6497DEBF9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D9210E02D;
	Thu,  2 Nov 2023 04:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E78A10E02D;
 Thu,  2 Nov 2023 04:44:37 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-53e2dc8fa02so747293a12.2; 
 Wed, 01 Nov 2023 21:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698900275; x=1699505075; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I+VxWQ4k/E3/qla6JztW2qtYTnXXlUbK1ykpNWnBSc4=;
 b=PJvANLjuGQeHodaXlX4cHyI/PzGicHKd81SZtj79PW773bj6obgLcv6L8vnoOjLg5E
 Wy72jvSdYaFiklB/4z7nozAhesLpcevIpeOTPapK+blPpyurqupV/MKSWzG7LZzLoXBR
 x51z/k7ijN19ntOojVx/dxwWhRSlVP1f6JxjW+ylDSyE9CnINRjPEHKhcB5Qe1JVfApX
 C+luB0XUuD/jzX+e4n4/tW2MfiveHNPxKOpzh2yFJaqWhDFdWeAK8ACyqbwIrsUMM/Al
 okFpmCMQNj4w9zhvBV4LikZ+6hLpWNWSiQDeI+dDA3a5RfjJeAaMW5qtMjocbPQfJOWa
 w5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698900275; x=1699505075;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I+VxWQ4k/E3/qla6JztW2qtYTnXXlUbK1ykpNWnBSc4=;
 b=v546NUsPcbIx963aSVAFCExbpvRkuNbkRBLwUyEqsVXYmc0QszgJwu5Y9QM3OxX6LD
 43m1YEx2G4leYuSn3RxDk1wZCubBJZ0Hpv20esUFkD5tFivu9XfhsOosqzohFAjR7u2J
 oxtJINa4dc6EkEpp4ZkX/HDFYx126Mjp0GPk9d31iS9L+naUfmG4S0utNga2D26UJLkF
 T87e2y/JRALZSxrSizkWHBvP1wPIcMMFtFD+xVM8YMq787TlDhCs5kmpFAJ12NRIUuNU
 quN8N3K6MJ3Tp9t+2OLgbJF6PHbsquZHjr3O42J8zNAxYEqjAWKHov7lWCCrcJcKmTcl
 tV5w==
X-Gm-Message-State: AOJu0Yzk9L7MgZLNqtvWxXbDjDeKyPSsMcDiXW2PCAp0tsOXi47uTfH3
 yRiHpN5lU7p4hJwVaZDW8x0cpbhFPCdjKXuFzU4=
X-Google-Smtp-Source: AGHT+IFKP1gGRhZOBwRbI3b3qzBxHp0gy+npS/PRjk49h25MKVTvezOcJ7G2BWNnJLD28VMz4AB72Bpi6b7vF1+u4Q0=
X-Received: by 2002:a17:907:841:b0:9bf:65b0:1122 with SMTP id
 ww1-20020a170907084100b009bf65b01122mr3308085ejb.69.1698900275330; Wed, 01
 Nov 2023 21:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231101233113.8059-1-dakr@redhat.com>
 <20231101233113.8059-9-dakr@redhat.com>
In-Reply-To: <20231101233113.8059-9-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 2 Nov 2023 14:44:23 +1000
Message-ID: <CAPM=9tx2CrrLWddTW0-sYCndsGq+tmc-hFZi0mmBFBJ0SDy-rQ@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v8 08/12] drm/nouveau: separately allocate
 struct nouveau_uvmm
To: Danilo Krummrich <dakr@redhat.com>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 faith@gfxstrand.net, boris.brezillon@collabora.com, donald.robson@imgtec.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Nov 2023 at 09:31, Danilo Krummrich <dakr@redhat.com> wrote:
>
> Allocate struct nouveau_uvmm separately in preparation for subsequent
> commits introducing reference counting for struct drm_gpuvm.
>
> While at it, get rid of nouveau_uvmm_init() as indirection of
> nouveau_uvmm_ioctl_vm_init() and perform some minor cleanups.
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Dave Airlie <airlied@redhat.com>
