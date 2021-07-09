Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C401D3C2122
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 11:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5036E9ED;
	Fri,  9 Jul 2021 09:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307D76E9C5
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 07:28:32 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4GLlBk1mNmz4x4yN;
 Fri,  9 Jul 2021 07:28:30 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="WIEBp5X3"
Date: Fri, 09 Jul 2021 07:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1625815705;
 bh=RkfvnmLdaWZqZxjDUvmzYCOv0xZV2QzxYSVXkQHzzbM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=WIEBp5X3N39INqaynv4SEqwjar9wa/XWQet0WZeAlFZ25c9ng3WZ/q0o2y/NV3exc
 NORKsapydxEGEGLq5saeDxHg5xAuxF/ic2EPr0prdJjWT1h6bW315BdRxKwEKxWTwx
 ZkM6uaw18g5BZZzw/HvNNDDvMUbCYLoI8SHtLOe0=
To: Rob Clark <robdclark@gmail.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH] drm/msm: Fix display fault handling
Message-ID: <3pFCrTgsGtxAZ1a2xns0dgqCOz61HZr4foJlLOl1l3I@cp4-web-034.plabs.ch>
In-Reply-To: <20210707180113.840741-1-robdclark@gmail.com>
References: <20210707180113.840741-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Fri, 09 Jul 2021 09:01:52 +0000
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
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Wed, Jul 7 2021 at 21:57:05 +0400, Rob Clark <robdclark@gmail.com>=20
wrote:
> From: Rob Clark <robdclark@chromium.org>
>=20
> It turns out that when the display is enabled by the bootloader, we=20
> can
> get some transient iommu faults from the display.  Which doesn't go=20
> over
> too well when we install a fault handler that is gpu specific.  To=20
> avoid
> this, defer installing the fault handler until we get around to=20
> setting
> up per-process pgtables (which is adreno_smmu specific).  The arm-smmu
> fallback error reporting is sufficient for reporting display related
> faults (and in fact was all we had prior to=20
> f8f934c180f629bb927a04fd90d)
>=20
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Fixes: 2a574cc05d38 ("drm/msm: Improve the a6xx page fault handler")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Tested-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c=20
> b/drivers/gpu/drm/msm/msm_iommu.c
> index eed2a762e9dd..bcaddbba564d 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -142,6 +142,9 @@ static const struct iommu_flush_ops null_tlb_ops=20
> =3D {
>  =09.tlb_add_page =3D msm_iommu_tlb_add_page,
>  };
>=20
> +static int msm_fault_handler(struct iommu_domain *domain, struct=20
> device *dev,
> +=09=09unsigned long iova, int flags, void *arg);
> +
>  struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
>  {
>  =09struct adreno_smmu_priv *adreno_smmu =3D dev_get_drvdata(parent->dev)=
;
> @@ -157,6 +160,13 @@ struct msm_mmu=20
> *msm_iommu_pagetable_create(struct msm_mmu *parent)
>  =09if (!ttbr1_cfg)
>  =09=09return ERR_PTR(-ENODEV);
>=20
> +=09/*
> +=09 * Defer setting the fault handler until we have a valid adreno_smmu
> +=09 * to avoid accidentially installing a GPU specific fault handler=20
> for
> +=09 * the display's iommu
> +=09 */
> +=09iommu_set_fault_handler(iommu->domain, msm_fault_handler, iommu);
> +
>  =09pagetable =3D kzalloc(sizeof(*pagetable), GFP_KERNEL);
>  =09if (!pagetable)
>  =09=09return ERR_PTR(-ENOMEM);
> @@ -300,7 +310,6 @@ struct msm_mmu *msm_iommu_new(struct device *dev,=20
> struct iommu_domain *domain)
>=20
>  =09iommu->domain =3D domain;
>  =09msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
> -=09iommu_set_fault_handler(domain, msm_fault_handler, iommu);
>=20
>  =09atomic_set(&iommu->pagetables, 0);
>=20
> --
> 2.31.1
>=20

Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>



