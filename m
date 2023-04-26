Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900EA6EEE61
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 08:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F113D10E8CC;
	Wed, 26 Apr 2023 06:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A8F10E8C2;
 Wed, 26 Apr 2023 06:31:22 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50445d911c5so1535521a12.0; 
 Tue, 25 Apr 2023 23:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682490681; x=1685082681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0E/HJYaBlbdK8uIw6DelOKBf1DeLdfCsbhmPo9K0QQI=;
 b=R45wF211GxIf2UIEkE79wyKG6568b1PZxqkVNlMRoEgFVFOCK/X+KdgWILj2xJVkzB
 PrqoS3X3Gjwkkv1gtImergpPjxbsG3f2yhEvz+Ir4l+Ib0yjXxXRxaON+ES2/DR5dD69
 zPPzHktlq8SmPuk+yR5ERxUEUWrkURJWWrfs4uUs08hMBFyieIA0W2b+pBTXzRxKKk1/
 yB68MhGnvgyc/rc2VCc9Tf3cL1zRs4M6LNFAdLFnztDYCvYiK1Eky/G1C+VGzHm9DVQ9
 ny09xplQsit3OxNSMqWI9VmUxa5zRH7xmBYv5M838JKJbTPmsiLxQZxyRcDdqr1HfqdA
 FO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682490681; x=1685082681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0E/HJYaBlbdK8uIw6DelOKBf1DeLdfCsbhmPo9K0QQI=;
 b=jGj/bvzfhRl6PWOkAE65ams95JqLSHpXTzGSISrzQoTCPPcahi/KfIpIyc1zowacQW
 G8xIhqdja9Au5fShu0ZXjlEhdTKqo2mr0a7pZaPI1feM+3/zKUwvrIk6fEjl3iNnK4K2
 52q+rklD9DuS7SAjWeIDBhg6ItXiGtDZMLTDprK+5T+c32w9ha5n53KVDf6wpn4unY5N
 k3+qo+iYZxyUNeYNVDUKZTjs1BH3hj36Gs9B97MZZqzIvGgbuuSOziIvfxHeSwy3kRMv
 +WZyCVMyqrh+/qM4MuLIXOMzT44Xilp+xHjytCoy6kvHJ0x0bW5D72ysSMoHGVjhsC5+
 NgrA==
X-Gm-Message-State: AC+VfDx/IZs+L84m5XvAdYBLQ+Q3sFuI7eyOZetvV/RKPgf0U/MWR6zP
 iFEOPhtkhQgGB04Xn2+kbbIZNiGxaAVtmmo1q6s=
X-Google-Smtp-Source: ACHHUZ7xZw0Nad5EHgnJdS/n6q1n9qakvSAIvHbFe/i0o5c4pgvnT1acbBUsn7q1pDtWZeneXB1AerBidf1I8qOrE5o=
X-Received: by 2002:a05:6402:4302:b0:509:c551:c028 with SMTP id
 m2-20020a056402430200b00509c551c028mr4303810edc.1.1682490680851; Tue, 25 Apr
 2023 23:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230426004831.650908-1-olvaffe@gmail.com>
 <ZEivhUGdECRpVztZ@kroah.com>
In-Reply-To: <ZEivhUGdECRpVztZ@kroah.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 25 Apr 2023 23:31:09 -0700
Message-ID: <CAPaKu7Ry84+ztnMRyzMzANSnnxW94ue4g=fL1SnahtfHod46bw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add a missing lock for AMDGPU_SCHED
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: amd-gfx@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 9:58=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Apr 25, 2023 at 05:48:27PM -0700, Chia-I Wu wrote:
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > Cc: stable@vger.kernel.org
>
> I know I can not take patches without any changelog text at all, maybe
> the DRM developers are more lax, but it's not a good idea at all.
Oops, sorry.  I've sent out v2 to address both review feedback.
>
> thanks,
>
> greg k-h
