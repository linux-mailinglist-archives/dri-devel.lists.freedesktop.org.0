Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 487CE79CB6C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 11:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B6E10E043;
	Tue, 12 Sep 2023 09:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6A910E043
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 09:18:34 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AA6A26607320;
 Tue, 12 Sep 2023 10:18:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694510313;
 bh=iz2LBBnR9w4SJhy1RLefnXfnKy9ndi5CmJOeJXvF0Uk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BZa4OJCkQ/kRLdlXb3N01004mh98pudXnKG6tJG2RDAoHW+EC7PzJiboppv7e4H/I
 dvElgqNEynJFG3mmImf+FbqjzHigWv2SWnGxFIery6B/LKdxdrBAN5JIjbJoerGtl6
 yd9zJ3cVcOLMt0B7+Mz9F/o0YBNXL/YiW/e+fjJDYlI/bhY/RVqo5YuXfHI59g4X7/
 BFyOQaHh1HuUrG3lxeoDpG9pJUtm8bjCRY2Ih+6UXfksB0+Jh4EWe8MEGWvZqVoKB5
 7aUKaeDGGqratx+f8fKrliflKLXPyhSO+JYbt71T8qiUp4Iv7SfomFV6tNZpSORVUH
 lIDtX6x3viJdA==
Message-ID: <28285acc-4236-36d6-2784-eac0d9220a5b@collabora.com>
Date: Tue, 12 Sep 2023 11:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 03/14] media: platform: mtk-mdp3: add support second
 sets of MMSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <20230912075805.11432-4-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230912075805.11432-4-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/09/23 09:57, Moudy Ho ha scritto:
> MT8195 has two MMSYS sets, VPPSYS0 and VPPSYS1.
> These sets coordinate and control the clock, power, and
> register settings needed for the components of MDP3.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   .../platform/mediatek/mdp3/mdp_cfg_data.c     | 44 +++++++++----------
>   .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  1 +
>   .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 40 +++++++++++------
>   .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  3 ++
>   4 files changed, 53 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
> index 502eeae0bfdc..58792902abb5 100644
> --- a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
> +++ b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
> @@ -73,75 +73,75 @@ static const u32 mt8183_mutex_idx[MDP_MAX_COMP_COUNT] = {
>   
>   static const struct mdp_comp_data mt8183_mdp_comp_data[MDP_MAX_COMP_COUNT] = {
>   	[MDP_COMP_WPEI] = {
> -		{MDP_COMP_TYPE_WPEI, 0, MT8183_MDP_COMP_WPEI},
> +		{MDP_COMP_TYPE_WPEI, 0, MT8183_MDP_COMP_WPEI, 0},
>   		{0, 0, 0}
>   	},
>   	[MDP_COMP_WPEO] = {
> -		{MDP_COMP_TYPE_EXTO, 2, MT8183_MDP_COMP_WPEO},
> +		{MDP_COMP_TYPE_EXTO, 2, MT8183_MDP_COMP_WPEO, 0},
>   		{0, 0, 0}
>   	},
>   	[MDP_COMP_WPEI2] = {
> -		{MDP_COMP_TYPE_WPEI, 1, MT8183_MDP_COMP_WPEI2},
> +		{MDP_COMP_TYPE_WPEI, 1, MT8183_MDP_COMP_WPEI2, 0},
>   		{0, 0, 0}
>   	},
>   	[MDP_COMP_WPEO2] = {
> -		{MDP_COMP_TYPE_EXTO, 3, MT8183_MDP_COMP_WPEO2},
> +		{MDP_COMP_TYPE_EXTO, 3, MT8183_MDP_COMP_WPEO2, 0},
>   		{0, 0, 0}
>   	},
>   	[MDP_COMP_ISP_IMGI] = {
> -		{MDP_COMP_TYPE_IMGI, 0, MT8183_MDP_COMP_ISP_IMGI},
> +		{MDP_COMP_TYPE_IMGI, 0, MT8183_MDP_COMP_ISP_IMGI, 0},
>   		{0, 0, 4}
>   	},
>   	[MDP_COMP_ISP_IMGO] = {
> -		{MDP_COMP_TYPE_EXTO, 0, MT8183_MDP_COMP_ISP_IMGO},
> +		{MDP_COMP_TYPE_EXTO, 0, MT8183_MDP_COMP_ISP_IMGO, 0},
>   		{0, 0, 4}
>   	},
>   	[MDP_COMP_ISP_IMG2O] = {
> -		{MDP_COMP_TYPE_EXTO, 1, MT8183_MDP_COMP_ISP_IMG2O},
> +		{MDP_COMP_TYPE_EXTO, 1, MT8183_MDP_COMP_ISP_IMG2O, 0},
>   		{0, 0, 0}
>   	},
>   	[MDP_COMP_CAMIN] = {
> -		{MDP_COMP_TYPE_DL_PATH, 0, MT8183_MDP_COMP_CAMIN},
> +		{MDP_COMP_TYPE_DL_PATH, 0, MT8183_MDP_COMP_CAMIN, 0},
>   		{2, 2, 1}
>   	},
>   	[MDP_COMP_CAMIN2] = {
> -		{MDP_COMP_TYPE_DL_PATH, 1, MT8183_MDP_COMP_CAMIN2},
> +		{MDP_COMP_TYPE_DL_PATH, 1, MT8183_MDP_COMP_CAMIN2, 0},
>   		{2, 4, 1}
>   	},
>   	[MDP_COMP_RDMA0] = {
> -		{MDP_COMP_TYPE_RDMA, 0, MT8183_MDP_COMP_RDMA0},
> +		{MDP_COMP_TYPE_RDMA, 0, MT8183_MDP_COMP_RDMA0, 0},
>   		{2, 0, 0}
>   	},
>   	[MDP_COMP_CCORR0] = {
> -		{MDP_COMP_TYPE_CCORR, 0, MT8183_MDP_COMP_CCORR0},
> +		{MDP_COMP_TYPE_CCORR, 0, MT8183_MDP_COMP_CCORR0, 0},
>   		{1, 0, 0}
>   	},
>   	[MDP_COMP_RSZ0] = {
> -		{MDP_COMP_TYPE_RSZ, 0, MT8183_MDP_COMP_RSZ0},
> +		{MDP_COMP_TYPE_RSZ, 0, MT8183_MDP_COMP_RSZ0, 0},
>   		{1, 0, 0}
>   	},
>   	[MDP_COMP_RSZ1] = {
> -		{MDP_COMP_TYPE_RSZ, 1, MT8183_MDP_COMP_RSZ1},
> +		{MDP_COMP_TYPE_RSZ, 1, MT8183_MDP_COMP_RSZ1, 0},
>   		{1, 0, 0}
>   	},
>   	[MDP_COMP_TDSHP0] = {
> -		{MDP_COMP_TYPE_TDSHP, 0, MT8183_MDP_COMP_TDSHP0},
> +		{MDP_COMP_TYPE_TDSHP, 0, MT8183_MDP_COMP_TDSHP0, 0},
>   		{0, 0, 0}
>   	},
>   	[MDP_COMP_PATH0_SOUT] = {
> -		{MDP_COMP_TYPE_PATH, 0, MT8183_MDP_COMP_PATH0_SOUT},
> +		{MDP_COMP_TYPE_PATH, 0, MT8183_MDP_COMP_PATH0_SOUT, 0},
>   		{0, 0, 0}
>   	},
>   	[MDP_COMP_PATH1_SOUT] = {
> -		{MDP_COMP_TYPE_PATH, 1, MT8183_MDP_COMP_PATH1_SOUT},
> +		{MDP_COMP_TYPE_PATH, 1, MT8183_MDP_COMP_PATH1_SOUT, 0},
>   		{0, 0, 0}
>   	},
>   	[MDP_COMP_WROT0] = {
> -		{MDP_COMP_TYPE_WROT, 0, MT8183_MDP_COMP_WROT0},
> +		{MDP_COMP_TYPE_WROT, 0, MT8183_MDP_COMP_WROT0, 0},
>   		{1, 0, 0}
>   	},
>   	[MDP_COMP_WDMA] = {
> -		{MDP_COMP_TYPE_WDMA, 0, MT8183_MDP_COMP_WDMA},
> +		{MDP_COMP_TYPE_WDMA, 0, MT8183_MDP_COMP_WDMA, 0},
>   		{1, 0, 0}
>   	},
>   };
> @@ -402,10 +402,10 @@ static const struct mdp_limit mt8183_mdp_def_limit = {
>   };
>   
>   static const struct mdp_pipe_info mt8183_pipe_info[] = {
> -	[MDP_PIPE_WPEI] = {MDP_PIPE_WPEI, 0},
> -	[MDP_PIPE_WPEI2] = {MDP_PIPE_WPEI2, 1},
> -	[MDP_PIPE_IMGI] = {MDP_PIPE_IMGI, 2},
> -	[MDP_PIPE_RDMA0] = {MDP_PIPE_RDMA0, 3}
> +	[MDP_PIPE_WPEI] = {MDP_PIPE_WPEI, 0, 0},
> +	[MDP_PIPE_WPEI2] = {MDP_PIPE_WPEI2, 0, 1},
> +	[MDP_PIPE_IMGI] = {MDP_PIPE_IMGI, 0, 2},
> +	[MDP_PIPE_RDMA0] = {MDP_PIPE_RDMA0, 0, 3}
>   };
>   
>   const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
> index 20d2bcb77ef9..ddc6b654864a 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
> @@ -138,6 +138,7 @@ struct mdp_comp_match {
>   	enum mdp_comp_type type;
>   	u32 alias_id;
>   	s32 inner_id;
> +	u32 mmsys_id;
>   };
>   
>   /* Used to describe the item order in MDP property */
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index cc44be10fdb7..9c33d3aaf9cd 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -26,39 +26,45 @@ static const struct of_device_id mdp_of_ids[] = {
>   MODULE_DEVICE_TABLE(of, mdp_of_ids);
>   
>   static struct platform_device *__get_pdev_by_id(struct platform_device *pdev,
> +						struct platform_device *from,
>   						enum mdp_infra_id id)
>   {
> -	struct device_node *node;
> +	struct device_node *node, *f = NULL;
>   	struct platform_device *mdp_pdev = NULL;
>   	const struct mtk_mdp_driver_data *mdp_data;
>   	const char *compat;
>   
>   	if (!pdev)
> -		return NULL;
> +		return ERR_PTR(-ENODEV);
>   

Fixing the error handling shall be done in a different commit, which shall also
have a Fixes tag: this is both for backporting purposes and because those fixes
are not relevant to adding support for secondary sets of MMSYS (so, those are
not relevant for this specific commit).

>   	if (id < MDP_INFRA_MMSYS || id >= MDP_INFRA_MAX) {
>   		dev_err(&pdev->dev, "Illegal infra id %d\n", id);
> -		return NULL;
> +		return ERR_PTR(-ENODEV);
>   	}
>   
>   	mdp_data = of_device_get_match_data(&pdev->dev);
>   	if (!mdp_data) {
>   		dev_err(&pdev->dev, "have no driver data to find node\n");
> -		return NULL;
> +		return ERR_PTR(-ENODEV);
>   	}
> +
>   	compat = mdp_data->mdp_probe_infra[id].compatible;
> +	if (strlen(compat) == 0)
> +		return NULL;
>   
> -	node = of_find_compatible_node(NULL, NULL, compat);
> +	if (from)
> +		f = from->dev.of_node;
> +	node = of_find_compatible_node(f, NULL, compat);
>   	if (WARN_ON(!node)) {
>   		dev_err(&pdev->dev, "find node from id %d failed\n", id);
> -		return NULL;
> +		return ERR_PTR(-ENODEV);
>   	}
>   
>   	mdp_pdev = of_find_device_by_node(node);
>   	of_node_put(node);
>   	if (WARN_ON(!mdp_pdev)) {
>   		dev_err(&pdev->dev, "find pdev from id %d failed\n", id);
> -		return NULL;
> +		return ERR_PTR(-ENODEV);
>   	}
>   
>   	return mdp_pdev;
> @@ -152,7 +158,7 @@ static int mdp_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct mdp_dev *mdp;
> -	struct platform_device *mm_pdev;
> +	struct platform_device *mm_pdev, *mm2_pdev;
>   	int ret, i, mutex_id;
>   
>   	mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
> @@ -164,15 +170,23 @@ static int mdp_probe(struct platform_device *pdev)
>   	mdp->pdev = pdev;
>   	mdp->mdp_data = of_device_get_match_data(&pdev->dev);
>   
> -	mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_MMSYS);
> -	if (!mm_pdev) {
> +	mm_pdev = __get_pdev_by_id(pdev, NULL, MDP_INFRA_MMSYS);
> +	if (IS_ERR_OR_NULL(mm_pdev)) {
>   		ret = -ENODEV;
>   		goto err_destroy_device;
>   	}
>   	mdp->mdp_mmsys = &mm_pdev->dev;
>   
> -	mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_MUTEX);
> -	if (WARN_ON(!mm_pdev)) {
> +	/* MMSYS2 is not available on all chips, so the config may be null. */
> +	mm2_pdev = __get_pdev_by_id(pdev, mm_pdev, MDP_INFRA_MMSYS2);
> +	if (IS_ERR(mm2_pdev)) {
> +		ret = PTR_ERR(mm2_pdev);
> +		goto err_destroy_device;
> +	}
> +	mdp->mdp_mmsys2 = &mm2_pdev->dev;
> +
> +	mm_pdev = __get_pdev_by_id(pdev, NULL, MDP_INFRA_MUTEX);
> +	if (IS_ERR_OR_NULL(mm_pdev)) {
>   		ret = -ENODEV;
>   		goto err_destroy_device;
>   	}
> @@ -208,7 +222,7 @@ static int mdp_probe(struct platform_device *pdev)
>   		goto err_destroy_job_wq;
>   	}
>   
> -	mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_SCP);
> +	mm_pdev = __get_pdev_by_id(pdev, NULL, MDP_INFRA_SCP);
>   	if (WARN_ON(!mm_pdev)) {
>   		dev_err(&pdev->dev, "Could not get scp device\n");
>   		ret = -ENODEV;
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> index 7e21d226ceb8..0434b70e1fc9 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> @@ -20,6 +20,7 @@
>   
>   enum mdp_infra_id {
>   	MDP_INFRA_MMSYS,
> +	MDP_INFRA_MMSYS2,
>   	MDP_INFRA_MUTEX,
>   	MDP_INFRA_SCP,
>   	MDP_INFRA_MAX
> @@ -68,6 +69,7 @@ struct mtk_mdp_driver_data {
>   struct mdp_dev {
>   	struct platform_device			*pdev;
>   	struct device				*mdp_mmsys;
> +	struct device				*mdp_mmsys2;

I'm wondering if this would become more readable by doing it like so:

	struct mdp_dev_infra {
		struct device *mmsys;
		struct mtk_mutex *mtk_mutex[MDP_PIPE_MAX];
	}

	struct mdp_dev {
		struct platform_device *pdev;
		struct mdp_dev_infra mdp_infra;
		.....
	}

so that you can add the secondary MMSYS (that goes along with the secondary
MUTEX anyway) by then changing mdp_infra to

		struct mtk_dev_infra mdp_infra[NUM_MMSYS];

and then referencing that like

mdp->mdp_infra[MDP_INFRA_MMSYS0]->mmsys
mdp->mdp_infra[MDP_INFRA_MMSYS0]->mtk_mutex
mdp->mdp_infra[MDP_INFRA_MMSYS1]->mmsys
mdp->mdp_infra[MDP_INFRA_MMSYS1]->mtk_mutex

What do you think?

Regards,
Angelo

>   	struct mtk_mutex			*mdp_mutex[MDP_PIPE_MAX];
>   	struct mdp_comp				*comp[MDP_MAX_COMP_COUNT];
>   	const struct mtk_mdp_driver_data	*mdp_data;
> @@ -96,6 +98,7 @@ struct mdp_dev {
>   
>   struct mdp_pipe_info {
>   	enum mdp_pipe_id pipe_id;
> +	u32 mmsys_id;
>   	u32 mutex_id;
>   };
>   


