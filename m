Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE10BB73A7
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 16:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EC910E92E;
	Fri,  3 Oct 2025 14:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="QNtY7dSf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E89F10E92E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 14:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1759502868; x=1760107668; i=markus.elfring@web.de;
 bh=A41BSUqR2Q7Gz9/FMHcdj/oye62an2xQtKyuzIgBSdw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QNtY7dSfrz1ghkwwYYNfo4k6LIMgpctt9I8M/Q09+jEbAd320JzsWCpXxypDpQWG
 iCO5i17t/AxyrKdrefhFnI4UosRp2Qeq686PP911LZj5pN/Sp7PVeDQMhTTY3vUhI
 5PxxfdvTATQQsM67Vfts7bNe69ETVsilnV/XbWSaDZuaPUnlgA0jEFlWMnEc5PBG1
 /M3PfkMyEMboJoPmvK5gxgtP8ClrJJZyDBmfHZyX386NFwRTeHBY7LFRnGZSKAJPY
 pCaSSulOmoLvtPYd2a7LkzI3VVIrhw7R5vaFtD5qK/M+F8s0SMR54CvC7hkWZcbpD
 8ygOxP4+eCSKzLBfew==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.196]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Md6y1-1uUXDi3SXj-00mi24; Fri, 03
 Oct 2025 16:42:13 +0200
Message-ID: <1afdfccc-04f1-4f82-a1bf-bf93df42af29@web.de>
Date: Fri, 3 Oct 2025 16:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandr Sapozhnikov <alsp705@gmail.com>,
 dri-devel@lists.freedesktop.org, lvc-project@linuxtesting.org
Cc: LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20251002091844.11-1-alsp705@gmail.com>
Subject: Re: [PATCH v2] vgem: fix error return in vgem_init()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251002091844.11-1-alsp705@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wb7aLHu6Ld4wqeXMWjvakHs10JDB59OOT8ILe0sKaXNhTCg+Q7V
 S565W3FL8583SnRoH7MZyQnfsFZu9Vo3MrjVZDMWeXXM7mS5Rcqo+B6K8g7MErXqh9cUMgb
 EyJANmLjahq+g+NKb8XYe85Y1ksttusYSDeqi3T4X3e9e0u6ZSaxkSk+DIw0fQnZLIj+jIZ
 724iD+oFcBUntRYSgNU8w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:prcNwShFHGY=;jstKwSALEDQ9YVeixodQGsIiX1I
 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
 vYiLk7JcVEvprw==
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

> The dma_coerce_mask_and_coherent function may=20
> fail to apply a mask due to incorrectly passed parameters.=20
=E2=80=A6

* You may occasionally put more than 61 characters into text lines
  of such a change description.
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.17#n658

* Would you like to choose another imperative wording?

* How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and=
 =E2=80=9CCc=E2=80=9D) accordingly?


=E2=80=A6
> ---
>  drivers/gpu/drm/vgem/vgem_drv.c | 4 +++-
=E2=80=A6

Some contributors would appreciate patch version descriptions.
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22


=E2=80=A6
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -140,8 +140,10 @@ static int __init vgem_init(void)
>  		goto out_unregister;
>  	}
> =20
> -	dma_coerce_mask_and_coherent(&pdev->dev,
> +	ret =3D dma_coerce_mask_and_coherent(&pdev->dev,
>  				     DMA_BIT_MASK(64));
> +	if (ret)
> +		goto out_unregister;
=E2=80=A6

I suggest to keep the passed parameters in the same line for this function=
 call.

Regards,
Markus
