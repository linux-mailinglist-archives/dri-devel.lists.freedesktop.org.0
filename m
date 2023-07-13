Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16711751CD7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4A510E654;
	Thu, 13 Jul 2023 09:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E8810E65E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689239455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4W0yrN0Cztq3pwQ9ywn2rhI9G08X2g+8/njUIA/yh2o=;
 b=VC1P3C6YZufs9jt/ZL3xTxI/3Qx98wtnMgyCQ3zubNJ0VDaNnw2RbFmrXfzHCajEYlAqXC
 cRyzf0g3gJHugjf5qXeEua+Ajz2Zu6YvBCrYNPpce3U7s4/EfXfoAj5rz3JIdhSdaJ+e0p
 NfoLazb6GdlUlfxQQM2h8qclW9IV3jw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-R8E309YcPy6RfG9xvlnmNw-1; Thu, 13 Jul 2023 05:10:54 -0400
X-MC-Unique: R8E309YcPy6RfG9xvlnmNw-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b6c4c018aaso1232731fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 02:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689239452; x=1689844252;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4W0yrN0Cztq3pwQ9ywn2rhI9G08X2g+8/njUIA/yh2o=;
 b=JKfXoecN1f0nWWDMbvCC45N6m0jU6QFZw9ptn4yDiZ7AFRlFw684HKW8aXFjXsns3R
 ZCI97Pu7Xe3BQtrxWQFANZllXLi9DfTgNmySh3lBl5QrBAqB0iCYsPHSi3OuBin1HaeM
 IKv7Asz+sMPAhA0QPd1E3uDZDjOOOMrKklkPzt+iMJnDyVpPs06XA/uQFjNbMcAy2a26
 0jwMaSXh4cxcs5X4H3dUj3iU41CmGf1kFZ2cLS8mAchrx+RIDLcltghgKJlCni+oxIVY
 n7Kw3DTCoL0grsVfSO5x7FpCRcnkTYox48JMtOB1/XCk9xCKQ3rLHFmpuME2RHn5uQQM
 ESWw==
X-Gm-Message-State: ABy/qLbTLg/HRwg3IrSdVqp0apLFemHDaoPsBZ3BU49UrSK5r4A+SeYb
 rbAl/iDsPXSQP79lwIMy6QFDdrElV14Nr+OAjYitiYKxcF+oVQ7lgSlbSTEreuDHPpOTMIshHKT
 4Dry3+voo79/+jzZ4UmTh/OKCEmvFIVyiXEDVJuRyE4A3pocL87RxXPQ=
X-Received: by 2002:a05:651c:1a29:b0:2b7:3f55:9cb9 with SMTP id
 by41-20020a05651c1a2900b002b73f559cb9mr846827ljb.5.1689239452443; 
 Thu, 13 Jul 2023 02:10:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFTnbNU5Ab6EvMvIcED79oNwfHqmFNcsSHM5EzDOSFj8yh2O3lsaqjAzj2RLA9IWeT11AKCZtA9u/lc82jnsZY=
X-Received: by 2002:a05:651c:1a29:b0:2b7:3f55:9cb9 with SMTP id
 by41-20020a05651c1a2900b002b73f559cb9mr846805ljb.5.1689239452111; Thu, 13 Jul
 2023 02:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230710072012.54076-1-xujianghui@cdjrlc.com>
 <0b4bfadaf22077b14fe579c1935058ff@208suo.com>
In-Reply-To: <0b4bfadaf22077b14fe579c1935058ff@208suo.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 13 Jul 2023 11:10:41 +0200
Message-ID: <CACO55ttEnpLTJspqb23RaqNZHms3TM030hZZcFVsBojBskLnDA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/pci: ERROR: "foo * bar" should be "foo *bar"
To: sunran001@208suo.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 10, 2023 at 9:23=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
> index 6be87ecffc89..bc51987c5f5f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
> @@ -147,7 +147,7 @@ gk104_pcie_set_link_speed(struct nvkm_pci *pci, enum
> nvkm_pcie_speed speed)
>   }
>
>   static int
> -gk104_pcie_init(struct nvkm_pci * pci)
> +gk104_pcie_init(struct nvkm_pci *pci)
>   {
>       enum nvkm_pcie_speed lnkctl_speed, max_speed, cap_speed;
>       struct nvkm_subdev *subdev =3D &pci->subdev;
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

