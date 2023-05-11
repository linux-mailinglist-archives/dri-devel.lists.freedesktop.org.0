Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659066FF545
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 16:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B278C10E4E5;
	Thu, 11 May 2023 14:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E76810E4E5;
 Thu, 11 May 2023 14:58:04 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-541f2112f82so2891009eaf.1; 
 Thu, 11 May 2023 07:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683817083; x=1686409083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKh9RanEco8HkFU0f9YQUCI4J1uPooBwGH0J45ObAN4=;
 b=sfcr2gDmpA6MfW6T3fpKqQu/TnYVeZ0fxsPI86zsuUPnzmWasEialKeKTWXqS7u4D4
 nXAmdFPbkhVAxyjP9VrIVNaQNudJ45aNUqOCRB1IGcVfzLaPYqZpk+FHaEBKvM4nIvJa
 BrPZct/zhxfL5d8xAhEPBCe8Pfoeiko4NS+WsyWv/hMoEfjeE9l5SUEVkELWJLepsLWO
 bNVm6P2m43HS86NR/CHCBAMuP+OUM4yG/cZymVNXUrdib1sLGRStWZXVcJ6goiUPJ0H5
 WyjurJUrawTO+PfgOG+D+RJVm+oh27AwT+1gMmuyz1gnnZa2+3OFg+h2Xyq1OF/88BMz
 +fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683817083; x=1686409083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DKh9RanEco8HkFU0f9YQUCI4J1uPooBwGH0J45ObAN4=;
 b=aLNYVM+KbA/fxBfD+hqUGbLk08fDymGYv/yVpjET6sWZZTOc5zlXgMegxtrJAXBM/6
 dQmp82nRhP/zhyU2Plpve9Px5JS6BeV7YCJriva5yiZyD68Ym1QTI+u2fjBn+qatiB/S
 hGzgPJKyuPmR9ZGQJ9NLZYsf5pf1wDVq+teHuWLEv0tmbIifjK/tMp5LbHjEhJyCvhoh
 yK3ejpcb6twE9XloTNvWVc8hJdn6+FJfq0CMlxWNHPFM6RS0VBxVpLCKI0D5v009WFBc
 9grpVgFDldy4VVOP0iJ/acnbASweAX6G28NCA+OKLCpJilHBXo0uhfIe2vxoVYLRCQom
 eUbA==
X-Gm-Message-State: AC+VfDyksZjlTB8jXXReTpQRGqUc+XA8hci76idbtKHXLx55I0s/4fgM
 G4pzdQnHrrrAGBYnyQimrjOIKDABPFqMHhAlvmo=
X-Google-Smtp-Source: ACHHUZ5Khr1M1krofX3oPdVbeyqlHZyoM2Fi52Fky/qFtI72qyW77RliSQNSaGdqi6r11ujdm5AjYBayy415E9N3LzQ=
X-Received: by 2002:a4a:7606:0:b0:54f:54b3:cb9c with SMTP id
 t6-20020a4a7606000000b0054f54b3cb9cmr4931936ooc.1.1683817082839; Thu, 11 May
 2023 07:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230509163712.376117-1-robdclark@gmail.com>
 <CAA8EJppVaCuh1kp7842pHt=5sWSBVaf18fZGC6ifmsQKgGNVSw@mail.gmail.com>
In-Reply-To: <CAA8EJppVaCuh1kp7842pHt=5sWSBVaf18fZGC6ifmsQKgGNVSw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 11 May 2023 07:57:51 -0700
Message-ID: <CAF6AEGuX721j41jCco1B6F_TW3EO3_W6+JDmh3S7Dfd62iAv7A@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/arm-smmu-qcom: Fix missing adreno_smmu's
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Lepton Wu <lepton@chromium.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Emma Anholt <emma@anholt.net>,
 Will Deacon <will@kernel.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux-foundation.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Elliot Berman <quic_eberman@quicinc.com>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 11, 2023 at 7:51=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 9 May 2023 at 19:37, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > When the special handling of qcom,adreno-smmu was moved into
> > qcom_smmu_create(), it was overlooked that we didn't have all the
> > required entries in qcom_smmu_impl_of_match.  So we stopped getting
> > adreno_smmu_priv on sc7180, breaking per-process pgtables.
> >
> > Fixes: 30b912a03d91 ("iommu/arm-smmu-qcom: Move the qcom,adreno-smmu ch=
eck into qcom_smmu_create")
> > Suggested-by: Lepton Wu <lepton@chromium.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu=
/arm/arm-smmu/arm-smmu-qcom.c
> > index d1b296b95c86..760d9c43dbd2 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -496,20 +496,21 @@ static const struct qcom_smmu_match_data qcom_smm=
u_500_impl0_data =3D {
> >  /*
> >   * Do not add any more qcom,SOC-smmu-500 entries to this list, unless =
they need
> >   * special handling and can not be covered by the qcom,smmu-500 entry.
> >   */
> >  static const struct of_device_id __maybe_unused qcom_smmu_impl_of_matc=
h[] =3D {
> >         { .compatible =3D "qcom,msm8996-smmu-v2", .data =3D &msm8996_sm=
mu_data },
> >         { .compatible =3D "qcom,msm8998-smmu-v2", .data =3D &qcom_smmu_=
v2_data },
> >         { .compatible =3D "qcom,qcm2290-smmu-500", .data =3D &qcom_smmu=
_500_impl0_data },
> >         { .compatible =3D "qcom,qdu1000-smmu-500", .data =3D &qcom_smmu=
_500_impl0_data  },
> >         { .compatible =3D "qcom,sc7180-smmu-500", .data =3D &qcom_smmu_=
500_impl0_data },
> > +       { .compatible =3D "qcom,sc7180-smmu-v2", .data =3D &qcom_smmu_v=
2_data },
> >         { .compatible =3D "qcom,sc7280-smmu-500", .data =3D &qcom_smmu_=
500_impl0_data },
> >         { .compatible =3D "qcom,sc8180x-smmu-500", .data =3D &qcom_smmu=
_500_impl0_data },
> >         { .compatible =3D "qcom,sc8280xp-smmu-500", .data =3D &qcom_smm=
u_500_impl0_data },
> >         { .compatible =3D "qcom,sdm630-smmu-v2", .data =3D &qcom_smmu_v=
2_data },
> >         { .compatible =3D "qcom,sdm845-smmu-v2", .data =3D &qcom_smmu_v=
2_data },
> >         { .compatible =3D "qcom,sdm845-smmu-500", .data =3D &sdm845_smm=
u_500_data },
> >         { .compatible =3D "qcom,sm6115-smmu-500", .data =3D &qcom_smmu_=
500_impl0_data},
> >         { .compatible =3D "qcom,sm6125-smmu-500", .data =3D &qcom_smmu_=
500_impl0_data },
> >         { .compatible =3D "qcom,sm6350-smmu-v2", .data =3D &qcom_smmu_v=
2_data },
> >         { .compatible =3D "qcom,sm6350-smmu-500", .data =3D &qcom_smmu_=
500_impl0_data },
> > @@ -540,12 +541,14 @@ struct arm_smmu_device *qcom_smmu_impl_init(struc=
t arm_smmu_device *smmu)
> >                 /* Match platform for ACPI boot */
> >                 if (acpi_match_platform_list(qcom_acpi_platlist) >=3D 0=
)
> >                         return qcom_smmu_create(smmu, &qcom_smmu_500_im=
pl0_data);
> >         }
> >  #endif
> >
> >         match =3D of_match_node(qcom_smmu_impl_of_match, np);
> >         if (match)
> >                 return qcom_smmu_create(smmu, match->data);
> >
> > +       WARN_ON(of_device_is_compatible(np, "qcom,adreno-smmu"));
>
> Could you please add a comment here, noting the reason? Or maybe we
> should  change that to:
> if (WARN_ON(...))
>   return ERR_PTR(-EINVAL);

I'll add a comment.  Not having an iommu is even worse, so returning
an error isn't a good idea.  I just wanted to leave some breadcrumbs
so people can see where the problem actually is if per-process
pgtables break again.

BR,
-R

>
> > +
> >         return smmu;
> >  }
> > --
> > 2.40.1
> >
>
>
> --
> With best wishes
> Dmitry
