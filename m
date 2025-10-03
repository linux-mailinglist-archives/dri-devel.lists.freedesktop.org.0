Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935EEBB822F
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 22:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A7D10E97D;
	Fri,  3 Oct 2025 20:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A906axIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com
 [74.125.224.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E886910E981
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 20:47:51 +0000 (UTC)
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-636d5cefab2so3894304d50.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 13:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759524471; x=1760129271; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ec07GK8IeebwUTlhOReO08byQCiI8XurDvMqhbTfpDs=;
 b=A906axIvcQ0fqgc1elVS3L34qCpuGV3JF+ognhEWYysXyCOXDKkN/vcXJvK0s2NugI
 NpJnRYbfXCzvx1kWxl+Ph0eWy5ToHpOzI4Xfw7EhrWzM3FRpI4npc1Ee24emxBQvDgLR
 J4+5ngVEJfEd8ZQOOlk5tGXwDYwVYO/jyVeDKZ7yp6rcOX3BxlXgTZOFtW7sGImwgcuf
 RvQYJhf9Yy2jHoWNKBnGW62rcYxTZgIFnKcXfq1vHFGJTudMbn6gfpJhN86yw/tk9GaX
 UnZFtcKxxVy9f2LDrDQv01YVhNpXs+F2+ECE2GVxYm2VTsStaOpIoc81dFqIBYQMPI9n
 Z5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759524471; x=1760129271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ec07GK8IeebwUTlhOReO08byQCiI8XurDvMqhbTfpDs=;
 b=atCXLtY5yVcK2oxoqcdKh+hmUZIURQFpxx1mvCj3BK2VZAYao5SwfSKKjIdcUFx2Lh
 ww804p6vQFrBi6MmSuT9RVleurQEnbrDGx6qVPqavydvuKcgHBeoATaSyOVxI2B72AQH
 C30j2FhLnDAeMCa7To4nPgWx9PG8mIqeVt4AqH85OML+R9QlywUetEF3ICigvdfhojHL
 1gKNY2lqpSNMYVBBrBtjSPxjLUQDq+dgr4VkhE7jaNy/Cspmx37Vc5ZdNJtxvPB2vFxs
 2f0r5bh0XgI5xn6Af2KNYxcvkeimfCVPd8tx88Je032JsQ/AVL58A27oC4IxAf/H7pZz
 U7HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpB7TBCq6M9UaeF2Tj9gntYXiFTaV0fylHPHAtTX+kAY7bnhsjjou0J3KQWMAnmYRd8m5PYabkqMU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRJEfU/r47gREnwWopMRQ44bgDrX1DceiDPFOvAZN5ITn9C60V
 gwo+UXA+Tk8tSYFTwlmNAmZTYuhdKXkPXE4LLTvKqt4Vd0kAoG4+JyomuwmX/sfHYBy5xiLXNTo
 3+5ZwEwOQaKD8R3ff/cXmw+W7Yx/8xTc=
X-Gm-Gg: ASbGncvHY7fNIM9X8mvIedTN3ZELMrO0XzQqtUR02pTrpKBQCO1uz9PAipmateD4WhX
 IaHpVxzf44nR1KwbwiLSd4BPMBy4QnU/xDL0rVCk1rEUDUL/SxuCkaqUpWarPI/tb6Xx83liwcd
 7Y93jUyUMKQCF3rO7+ApIEIkjCryeOnHSLqu+vMPkiuIi+BgXbZgR0ZQuGj+xzXcdQ+KSS7R99e
 cWmY9bCvHXWTrOp2I6STStabQx+1NAJwefunXCFd/uIiExBJJID4qfIhSm7EK8drI77qe13phNg
 7HKr46spr9qJEVNrFEP6DQ==
X-Google-Smtp-Source: AGHT+IGbRtPbh98BClkNFwaUaMJb45w8kt4Jk0KxRGScag36Tw0xGWcnBknxDwxYEhQPRsDsxQjX2aqyBPDcA2KuG7Q=
X-Received: by 2002:a53:8550:0:b0:638:53e9:bab0 with SMTP id
 956f58d0204a3-63b9a0ee753mr3639824d50.24.1759524470895; Fri, 03 Oct 2025
 13:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
 <20251003-mt8196-gpufreq-v6-6-76498ad61d9e@collabora.com>
In-Reply-To: <20251003-mt8196-gpufreq-v6-6-76498ad61d9e@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 3 Oct 2025 13:47:39 -0700
X-Gm-Features: AS18NWBGD0pXXLOymrZv-_f8nOh4HIhBGy-SAER5xKOoIW_DOui92j81TfsOhUs
Message-ID: <CAPaKu7Q==RvuZR-pgJekF++Y4HOdkryEvYV8QGJd_os0_if_vQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] drm/panthor: Use existing OPP table if present
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-pm@vger.kernel.org
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

On Fri, Oct 3, 2025 at 1:16=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On SoCs where the GPU's power-domain is in charge of setting performance
> levels, the OPP table of the GPU node will have already been populated
> during said power-domain's attach_dev operation.
>
> To avoid initialising an OPP table twice, only set the OPP regulator and
> the OPPs from DT if there's no OPP table present.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 26 ++++++++++++++++---------=
-
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/=
panthor/panthor_devfreq.c
> index 978f193a2aee561fadd9a976e9b1417118260889..6beb6170d6eea3dd65880dfe6=
4a61abbdd5f08da 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -143,6 +143,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev=
)
>         struct panthor_devfreq *pdevfreq;
>         struct dev_pm_opp *opp;
>         unsigned long cur_freq;
> +       struct opp_table *t;
>         unsigned long freq =3D ULONG_MAX;
>         int ret;
>
> @@ -152,18 +153,23 @@ int panthor_devfreq_init(struct panthor_device *ptd=
ev)
>
>         ptdev->devfreq =3D pdevfreq;
>
> -       ret =3D devm_pm_opp_set_regulators(dev, reg_names);
> -       if (ret) {
> -               if (ret !=3D -EPROBE_DEFER)
> -                       DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n=
");
> -
> -               return ret;
> +       t =3D dev_pm_opp_get_opp_table(dev);
"t" is too short for a long function like this one. We should either
rename it to "opp_table" or refactor this out to a shorter function.

dev_pm_domain_set_performance_state is new to me. It might just be me,
but a short comment explaining that the opp table might have been set
up by the pmdomain can be helpful.

With that, Reviewed-by: Chia-I Wu <olvaffe@gmail.com>.

> +       if (IS_ERR_OR_NULL(t)) {
> +               ret =3D devm_pm_opp_set_regulators(dev, reg_names);
> +               if (ret) {
> +                       if (ret !=3D -EPROBE_DEFER)
> +                               DRM_DEV_ERROR(dev, "Couldn't set OPP regu=
lators\n");
> +
> +                       return ret;
> +               }
> +
> +               ret =3D devm_pm_opp_of_add_table(dev);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               dev_pm_opp_put_opp_table(t);
>         }
>
> -       ret =3D devm_pm_opp_of_add_table(dev);
> -       if (ret)
> -               return ret;
> -
>         spin_lock_init(&pdevfreq->lock);
>
>         panthor_devfreq_reset(pdevfreq);
>
> --
> 2.51.0
>
