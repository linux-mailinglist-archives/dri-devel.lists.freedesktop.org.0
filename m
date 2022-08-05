Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0213C58AB73
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 15:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737BE93B66;
	Fri,  5 Aug 2022 13:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BCA8F72C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 13:15:10 +0000 (UTC)
Date: Fri, 05 Aug 2022 13:14:46 +0000
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="FAZEeCdd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1659705304; x=1659964504;
 bh=ziI5V+sIub4XwCkMXnfzTYqZ1lrMICCCmyYVkMbZJ64=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=FAZEeCddvGry0RRerFlnxxBc2UyoIGfr56LjriN9eMRNygtTSGxPO5QnIMOx8wl2c
 dSFITvunQak+jqDJcqx+gBEVw3veJnduFGbwnGO7VKOptySadtuBGlSvYoPz5d3vIN
 7EFYfH7F5Too/d1gcX303LiTtQdM2UowKc9+77PD5j87JLHDZqZ/H100t9j2I/lzLF
 OawfSicHFQVlV7kT5YgXOLCTrSmDc02SczVQhJiNTf3icSkrEwWkKfERjzJ4vy1uly
 7zTPOwF6x4G1rDEYgV60ougjBlhww1H+wx99rKV5NtvBRAst7eAaVSP5ZSxkN51rvO
 8PU4QrvmxCIhA==
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [RFC PATCH] drm/msm: lookup the ICC paths in both mdp5/dpu and
 mdss devices
Message-ID: <jqNAyNB27XoGsxddwc_bag0mjFI1qbGMGS7BtyDbd8ZK15RKmQNvVgJYUzcEc_U-h_Ei0mKju27yZJ5qI1xDxPbGvpcLkxX9aG_tmbxxzBI=@protonmail.com>
In-Reply-To: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
References: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
Feedback-ID: 6882736:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, August 5th, 2022 at 12:56 PM, Dmitry Baryshkov <dmitry.baryshkov=
@linaro.org> wrote:

> The commit 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master
> components") changed the MDP5 driver to look for the interconnect paths
> in the MDSS device rather than in the MDP5 device itself. This was left
> unnoticed since on my testing devices the interconnects probably didn't
> reach the sync state.
>
> Rather than just using the MDP5 device for ICC path lookups for the MDP5
> devices, introduce an additional helper to check both MDP5/DPU and MDSS
> nodes. This will be helpful for the MDP5->DPU conversion, since the
>
> driver will have to check both nodes.
>
> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
> Reported-by: Marijn Suijten marijn.suijten@somainline.org
>
> Reported-by: Yassine Oudjana y.oudjana@protonmail.com
>
> Signed-off-by: Dmitry Baryshkov dmitry.baryshkov@linaro.org
>
> ---
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 7 ++-----
> drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 9 +++------
> drivers/gpu/drm/msm/msm_drv.h | 2 ++
> drivers/gpu/drm/msm/msm_io_utils.c | 22 ++++++++++++++++++++++
> 4 files changed, 29 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/ms=
m/disp/dpu1/dpu_kms.c
> index e23e2552e802..9eff6c2b1917 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -383,12 +383,9 @@ static int dpu_kms_parse_data_bus_icc_path(struct dp=
u_kms *dpu_kms)
> struct icc_path *path1;
> struct drm_device *dev =3D dpu_kms->dev;
>
> struct device *dpu_dev =3D dev->dev;
>
> - struct device *mdss_dev =3D dpu_dev->parent;
>
>
> - /* Interconnects are a part of MDSS device tree binding, not the
> - * MDP/DPU device. */
> - path0 =3D of_icc_get(mdss_dev, "mdp0-mem");
> - path1 =3D of_icc_get(mdss_dev, "mdp1-mem");
> + path0 =3D msm_icc_get(dpu_dev, "mdp0-mem");
> + path1 =3D msm_icc_get(dpu_dev, "mdp1-mem");
>
> if (IS_ERR_OR_NULL(path0))
> return PTR_ERR_OR_ZERO(path0);
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/m=
sm/disp/mdp5/mdp5_kms.c
> index 3d5621a68f85..b0c372fef5d5 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -921,12 +921,9 @@ static int mdp5_init(struct platform_device *pdev, s=
truct drm_device *dev)
>
> static int mdp5_setup_interconnect(struct platform_device pdev)
> {
> - / Interconnects are a part of MDSS device tree binding, not the
> - * MDP5 device. */
> - struct device *mdss_dev =3D pdev->dev.parent;
>
> - struct icc_path *path0 =3D of_icc_get(mdss_dev, "mdp0-mem");
> - struct icc_path *path1 =3D of_icc_get(mdss_dev, "mdp1-mem");
> - struct icc_path *path_rot =3D of_icc_get(mdss_dev, "rotator-mem");
> + struct icc_path *path0 =3D msm_icc_get(&pdev->dev, "mdp0-mem");
>
> + struct icc_path *path1 =3D msm_icc_get(&pdev->dev, "mdp1-mem");
>
> + struct icc_path *path_rot =3D msm_icc_get(&pdev->dev, "rotator-mem");
>
>
> if (IS_ERR(path0))
> return PTR_ERR(path0);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.=
h
> index 08388d742d65..d38510f6dbf5 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -441,6 +441,8 @@ void __iomem *msm_ioremap_size(struct platform_device=
 *pdev, const char *name,
> phys_addr_t *size);
> void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char =
*name);
>
> +struct icc_path *msm_icc_get(struct device *dev, const char *name);
> +
> #define msm_writel(data, addr) writel((data), (addr))
> #define msm_readl(addr) readl((addr))
>
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm=
_io_utils.c
> index 7b504617833a..d02cd29ce829 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -5,6 +5,8 @@
> * Author: Rob Clark robdclark@gmail.com
>
> */
>
> +#include <linux/interconnect.h>
>
> +
> #include "msm_drv.h"
>
> /*
> @@ -124,3 +126,23 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *=
work,
> work->worker =3D worker;
>
> kthread_init_work(&work->work, fn);
>
> }
> +
> +struct icc_path *msm_icc_get(struct device *dev, const char *name)
> +{
> + struct device *mdss_dev =3D dev->parent;
>
> + struct icc_path path;
> +
> + path =3D of_icc_get(dev, name);
> + if (path)
> + return path;
> +
> + /
> + * If there are no interconnects attached to the corresponding device
> + * node, of_icc_get() will return NULL.
> + *
> + * If the MDP5/DPU device node doesn't have interconnects, lookup the
> + * path in the parent (MDSS) device.
> + */
> + return of_icc_get(mdss_dev, name);
> +
> +}
> --
> 2.35.1

Tested-by: Yassine Oudjana <y.oudjana@protonmail.com> # msm8996
