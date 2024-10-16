Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112A39A04DA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 10:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8540D10E05B;
	Wed, 16 Oct 2024 08:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ktwEXtu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E983010E05B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 08:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729069021;
 bh=YbjvGMpQcanhEZFZJCLKxetwxjKMZgIh4JmLEb/suz8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ktwEXtu5CUlK+OQqpVTVnm3X/u43XHv4EQhGkBt9kxVbUDI0uCYuOOunKOsuS8dCJ
 bkLjcC1Hdsf9g1YAGsryWs62QYGU9y1aX+44fSnrkI2C9i/lWFDbUfoQLyxDjpdoFi
 hviNs0zuw4IbRMsUJCZckF/M2G9aTmpDl7qtrbnpmLAdGg1Unw+sC/oidzSl75OuE5
 WwhegXL8xOVdYsQNiQ0h81PTgWsJM7GSyJuJnTe+p0PxfDW0Qog+PSqKfaPqHfCkUF
 yupX4bFXTAMFJrkc7T4JoBApBIxz/Wn5VFm5uHGer3HGbpy97sfviYIUgvNz4368fc
 caPxa2X0cXHZg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 418CA17E11E2;
 Wed, 16 Oct 2024 10:57:00 +0200 (CEST)
Message-ID: <a25b625a-1a2d-454f-a758-43341695e16b@collabora.com>
Date: Wed, 16 Oct 2024 10:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/3] drm/mediatek: Implement OF graphs support for
 display paths
To: Rob Herring <robh@kernel.org>
Cc: chunkuang.hu@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, shawn.sung@mediatek.com,
 yu-chang.lee@mediatek.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
 kernel@collabora.com, sui.jingfeng@linux.dev, michael@walle.cc,
 sjoerd@collabora.com, Alexandre Mergnat <amergnat@baylibre.com>,
 Michael Walle <mwalle@kernel.org>
References: <20241014085148.71105-1-angelogioacchino.delregno@collabora.com>
 <20241014085148.71105-4-angelogioacchino.delregno@collabora.com>
 <20241015132849.GA447702-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241015132849.GA447702-robh@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/10/24 15:28, Rob Herring ha scritto:
> On Mon, Oct 14, 2024 at 10:51:48AM +0200, AngeloGioacchino Del Regno wrote:
>> It is impossible to add each and every possible DDP path combination
>> for each and every possible combination of SoC and board: right now,
>> this driver hardcodes configuration for 10 SoCs and this is going to
>> grow larger and larger, and with new hacks like the introduction of
>> mtk_drm_route which is anyway not enough for all final routes as the
>> DSI cannot be connected to MERGE if it's not a dual-DSI, or enabling
>> DSC preventively doesn't work if the display doesn't support it, or
>> others.
>>
>> Since practically all display IPs in MediaTek SoCs support being
>> interconnected with different instances of other, or the same, IPs
>> or with different IPs and in different combinations, the final DDP
>> pipeline is effectively a board specific configuration.
>>
>> Implement OF graphs support to the mediatek-drm drivers, allowing to
>> stop hardcoding the paths, and preventing this driver to get a huge
>> amount of arrays for each board and SoC combination, also paving the
>> way to share the same mtk_mmsys_driver_data between multiple SoCs,
>> making it more straightforward to add support for new chips.
>>
>> Note that the OVL_ADAPTOR software component driver needs relatively
>> big changes in order to fully support OF Graphs (and more SoCs anyway)
>> and such changes will come at a later time.
>> As of now, the mtk_disp_ovl_adaptor driver takes the MERGE components
>> (for example, on mt8195, merge 1 to 4) dynamically so, even though
>> later updates to the ovl-adaptor driver will *not* require bindings
>> changes, the merge1-4 will be temporarily omitted in the graph for the
>> MT8195 SoC.
>>
>> This means that an example graph for this SoC looks like:
>>
>> mdp_rdma (0 ~ 7) -> padding (0 ~ 7) -> ethdr -> merge5
>>
>> and the resulting path in this driver will be `ovl_adaptor -> merge5`
>>
>> Later updates to the ovl adaptor will expand it to support more SoCs
>> and, in turn, to also fully support graphs.
>>
>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>> Tested-by: Michael Walle <mwalle@kernel.org> # on kontron-sbc-i1200
>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   1 +
>>   .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  43 ++-
>>   drivers/gpu/drm/mediatek/mtk_dpi.c            |  21 +-
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 253 +++++++++++++++++-
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +-
>>   drivers/gpu/drm/mediatek/mtk_dsi.c            |  14 +-
>>   6 files changed, 312 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>> index 082ac18fe04a..94843974851f 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>> @@ -108,6 +108,7 @@ size_t mtk_ovl_get_num_formats(struct device *dev);
>>   
>>   void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex);
>>   void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex);
>> +bool mtk_ovl_adaptor_is_comp_present(struct device_node *node);
>>   void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev,
>>   			     unsigned int next);
>>   void mtk_ovl_adaptor_disconnect(struct device *dev, struct device *mmsys_dev,
>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>> index c6768210b08b..4e064d3c97cc 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>> @@ -490,6 +490,41 @@ static int compare_of(struct device *dev, void *data)
>>   	return dev->of_node == data;
>>   }
>>   
>> +static int ovl_adaptor_of_get_ddp_comp_type(struct device_node *node,
>> +					    enum mtk_ovl_adaptor_comp_type *ctype)
>> +{
>> +	const struct of_device_id *of_id = of_match_node(mtk_ovl_adaptor_comp_dt_ids, node);
>> +
>> +	if (!of_id)
>> +		return -EINVAL;
>> +
>> +	*ctype = (enum mtk_ovl_adaptor_comp_type)((uintptr_t)of_id->data);
>> +
>> +	return 0;
>> +}
>> +
>> +bool mtk_ovl_adaptor_is_comp_present(struct device_node *node)
>> +{
>> +	enum mtk_ovl_adaptor_comp_type type;
>> +	int ret;
>> +
>> +	ret = ovl_adaptor_of_get_ddp_comp_type(node, &type);
>> +	if (ret)
>> +		return false;
>> +
>> +	if (type >= OVL_ADAPTOR_TYPE_NUM)
>> +		return false;
>> +
>> +	/*
>> +	 * In the context of mediatek-drm, ETHDR, MDP_RDMA and Padding are
>> +	 * used exclusively by OVL Adaptor: if this component is not one of
>> +	 * those, it's likely not an OVL Adaptor path.
>> +	 */
>> +	return type == OVL_ADAPTOR_TYPE_ETHDR ||
>> +	       type == OVL_ADAPTOR_TYPE_MDP_RDMA ||
>> +	       type == OVL_ADAPTOR_TYPE_PADDING;
>> +}
>> +
>>   static int ovl_adaptor_comp_init(struct device *dev, struct component_match **match)
>>   {
>>   	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
>> @@ -499,12 +534,11 @@ static int ovl_adaptor_comp_init(struct device *dev, struct component_match **ma
>>   	parent = dev->parent->parent->of_node->parent;
>>   
>>   	for_each_child_of_node_scoped(parent, node) {
>> -		const struct of_device_id *of_id;
>>   		enum mtk_ovl_adaptor_comp_type type;
>> -		int id;
>> +		int id, ret;
>>   
>> -		of_id = of_match_node(mtk_ovl_adaptor_comp_dt_ids, node);
>> -		if (!of_id)
>> +		ret = ovl_adaptor_of_get_ddp_comp_type(node, &type);
>> +		if (ret)
>>   			continue;
>>   
>>   		if (!of_device_is_available(node)) {
>> @@ -513,7 +547,6 @@ static int ovl_adaptor_comp_init(struct device *dev, struct component_match **ma
>>   			continue;
>>   		}
>>   
>> -		type = (enum mtk_ovl_adaptor_comp_type)(uintptr_t)of_id->data;
>>   		id = ovl_adaptor_comp_get_id(dev, node, type);
>>   		if (id < 0) {
>>   			dev_warn(dev, "Skipping unknown component %pOF\n",
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index e4da5cc75e60..ad37b0ecafb9 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -755,6 +755,20 @@ static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
>>   				 enum drm_bridge_attach_flags flags)
>>   {
>>   	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>> +	int ret;
>> +
>> +	dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 1, -1);
>> +	if (IS_ERR(dpi->next_bridge)) {
>> +		ret = PTR_ERR(dpi->next_bridge);
>> +		if (ret == -EPROBE_DEFER)
>> +			return ret;
>> +
>> +		/* Old devicetree has only one endpoint */
>> +		dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 0, 0);
>> +		if (IS_ERR(dpi->next_bridge))
>> +			return dev_err_probe(dpi->dev, PTR_ERR(dpi->next_bridge),
>> +					     "Failed to get bridge\n");
>> +	}
>>   
>>   	return drm_bridge_attach(bridge->encoder, dpi->next_bridge,
>>   				 &dpi->bridge, flags);
>> @@ -1162,13 +1176,6 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>>   	if (dpi->irq < 0)
>>   		return dpi->irq;
>>   
>> -	dpi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
>> -	if (IS_ERR(dpi->next_bridge))
>> -		return dev_err_probe(dev, PTR_ERR(dpi->next_bridge),
>> -				     "Failed to get bridge\n");
>> -
>> -	dev_info(dev, "Found bridge node: %pOF\n", dpi->next_bridge->of_node);
>> -
>>   	platform_set_drvdata(pdev, dpi);
>>   
>>   	dpi->bridge.funcs = &mtk_dpi_bridge_funcs;
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index a4594f8873d5..85be035a209a 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -27,6 +27,7 @@
>>   
>>   #include "mtk_crtc.h"
>>   #include "mtk_ddp_comp.h"
>> +#include "mtk_disp_drv.h"
>>   #include "mtk_drm_drv.h"
>>   #include "mtk_gem.h"
>>   
>> @@ -820,12 +821,235 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>>   	{ }
>>   };
>>   
>> +static int mtk_drm_of_get_ddp_comp_type(struct device_node *node, enum mtk_ddp_comp_type *ctype)
>> +{
>> +	const struct of_device_id *of_id = of_match_node(mtk_ddp_comp_dt_ids, node);
>> +
>> +	if (!of_id)
>> +		return -EINVAL;
>> +
>> +	*ctype = (enum mtk_ddp_comp_type)((uintptr_t)of_id->data);
>> +
>> +	return 0;
>> +}
>> +
>> +static int mtk_drm_of_get_ddp_ep_cid(struct device_node *node,
>> +				     int output_port, enum mtk_crtc_path crtc_path,
>> +				     struct device_node **next, unsigned int *cid)
>> +{
>> +	struct device_node *ep_dev_node, *ep_out;
>> +	enum mtk_ddp_comp_type comp_type;
>> +	int ret;
>> +
>> +	ep_out = of_graph_get_endpoint_by_regs(node, output_port, crtc_path);
>> +	if (!ep_out)
>> +		return -ENOENT;
>> +
>> +	ep_dev_node = of_graph_get_remote_port_parent(ep_out);
>> +	of_node_put(ep_out);
>> +	if (!ep_dev_node)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Pass the next node pointer regardless of failures in the later code
>> +	 * so that if this function is called in a loop it will walk through all
>> +	 * of the subsequent endpoints anyway.
>> +	 */
>> +	*next = ep_dev_node;
>> +
>> +	if (!of_device_is_available(ep_dev_node))
>> +		return -ENODEV;
>> +
>> +	ret = mtk_drm_of_get_ddp_comp_type(ep_dev_node, &comp_type);
>> +	if (ret) {
>> +		if (mtk_ovl_adaptor_is_comp_present(ep_dev_node)) {
>> +			*cid = (unsigned int)DDP_COMPONENT_DRM_OVL_ADAPTOR;
>> +			return 0;
>> +		}
>> +		return ret;
>> +	}
>> +
>> +	ret = mtk_ddp_comp_get_id(ep_dev_node, comp_type);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* All ok! Pass the Component ID to the caller. */
>> +	*cid = (unsigned int)ret;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * mtk_drm_of_ddp_path_build_one - Build a Display HW Pipeline for a CRTC Path
>> + * @dev:          The mediatek-drm device
>> + * @cpath:        CRTC Path relative to a VDO or MMSYS
>> + * @out_path:     Pointer to an array that will contain the new pipeline
>> + * @out_path_len: Number of entries in the pipeline array
>> + *
>> + * MediaTek SoCs can use different DDP hardware pipelines (or paths) depending
>> + * on the board-specific desired display configuration; this function walks
>> + * through all of the output endpoints starting from a VDO or MMSYS hardware
>> + * instance and builds the right pipeline as specified in device trees.
>> + *
>> + * Return:
>> + * * %0       - Display HW Pipeline successfully built and validated
>> + * * %-ENOENT - Display pipeline was not specified in device tree
>> + * * %-EINVAL - Display pipeline built but validation failed
>> + * * %-ENOMEM - Failure to allocate pipeline array to pass to the caller
>> + */
>> +static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_crtc_path cpath,
>> +					 const unsigned int **out_path,
>> +					 unsigned int *out_path_len)
>> +{
>> +	struct device_node *next, *prev, *vdo = dev->parent->of_node;
>> +	unsigned int temp_path[DDP_COMPONENT_DRM_ID_MAX] = { 0 };
>> +	unsigned int *final_ddp_path;
>> +	unsigned short int idx = 0;
>> +	bool ovl_adaptor_comp_added = false;
>> +	int ret;
>> +
>> +	/* Get the first entry for the temp_path array */
>> +	ret = mtk_drm_of_get_ddp_ep_cid(vdo, 0, cpath, &next, &temp_path[idx]);
>> +	if (ret) {
>> +		if (next && temp_path[idx] == DDP_COMPONENT_DRM_OVL_ADAPTOR) {
>> +			dev_dbg(dev, "Adding OVL Adaptor for %pOF\n", next);
>> +			ovl_adaptor_comp_added = true;
>> +		} else {
>> +			if (next)
>> +				dev_err(dev, "Invalid component %pOF\n", next);
>> +			else
>> +				dev_err(dev, "Cannot find first endpoint for path %d\n", cpath);
>> +
>> +			return ret;
>> +		}
>> +	}
>> +	idx++;
>> +
>> +	/*
>> +	 * Walk through port outputs until we reach the last valid mediatek-drm component.
>> +	 * To be valid, this must end with an "invalid" component that is a display node.
>> +	 */
>> +	do {
>> +		prev = next;
>> +		ret = mtk_drm_of_get_ddp_ep_cid(next, 1, cpath, &next, &temp_path[idx]);
>> +		of_node_put(prev);
>> +		if (ret) {
>> +			of_node_put(next);
>> +			break;
>> +		}
>> +
>> +		/*
>> +		 * If this is an OVL adaptor exclusive component and one of those
>> +		 * was already added, don't add another instance of the generic
>> +		 * DDP_COMPONENT_OVL_ADAPTOR, as this is used only to decide whether
>> +		 * to probe that component master driver of which only one instance
>> +		 * is needed and possible.
>> +		 */
>> +		if (temp_path[idx] == DDP_COMPONENT_DRM_OVL_ADAPTOR) {
>> +			if (!ovl_adaptor_comp_added)
>> +				ovl_adaptor_comp_added = true;
>> +			else
>> +				idx--;
>> +		}
>> +	} while (++idx < DDP_COMPONENT_DRM_ID_MAX);
>> +
>> +	/*
>> +	 * The device component might not be enabled: in that case, don't
>> +	 * check the last entry and just report that the device is missing.
>> +	 */
>> +	if (ret == -ENODEV)
>> +		return ret;
>> +
>> +	/* If the last entry is not a final display output, the configuration is wrong */
>> +	switch (temp_path[idx - 1]) {
>> +	case DDP_COMPONENT_DP_INTF0:
>> +	case DDP_COMPONENT_DP_INTF1:
>> +	case DDP_COMPONENT_DPI0:
>> +	case DDP_COMPONENT_DPI1:
>> +	case DDP_COMPONENT_DSI0:
>> +	case DDP_COMPONENT_DSI1:
>> +	case DDP_COMPONENT_DSI2:
>> +	case DDP_COMPONENT_DSI3:
>> +		break;
>> +	default:
>> +		dev_err(dev, "Invalid display hw pipeline. Last component: %d (ret=%d)\n",
>> +			temp_path[idx - 1], ret);
>> +		return -EINVAL;
>> +	}
>> +
>> +	final_ddp_path = devm_kmemdup(dev, temp_path, idx * sizeof(temp_path[0]), GFP_KERNEL);
>> +	if (!final_ddp_path)
>> +		return -ENOMEM;
>> +
>> +	dev_dbg(dev, "Display HW Pipeline built with %d components.\n", idx);
>> +
>> +	/* Pipeline built! */
>> +	*out_path = final_ddp_path;
>> +	*out_path_len = idx;
>> +
>> +	return 0;
>> +}
>> +
>> +static int mtk_drm_of_ddp_path_build(struct device *dev, struct device_node *node,
>> +				     struct mtk_mmsys_driver_data *data)
>> +{
>> +	struct device_node *ep_node;
>> +	struct of_endpoint of_ep;
>> +	bool output_present[MAX_CRTC] = { false };
>> +	int ret;
>> +
>> +	for_each_endpoint_of_node(node, ep_node) {
>> +		ret = of_graph_parse_endpoint(ep_node, &of_ep);
>> +		if (ret) {
>> +			dev_err_probe(dev, ret, "Cannot parse endpoint\n");
>> +			break;
>> +		}
>> +
>> +		if (of_ep.id >= MAX_CRTC) {
>> +			ret = dev_err_probe(dev, -EINVAL,
>> +					    "Invalid endpoint%u number\n", of_ep.port);
>> +			break;
>> +		}
>> +
>> +		output_present[of_ep.id] = true;
>> +	}
>> +
>> +	if (ret) {
>> +		of_node_put(ep_node);
>> +		return ret;
>> +	}
>> +
>> +	if (output_present[CRTC_MAIN]) {
>> +		ret = mtk_drm_of_ddp_path_build_one(dev, CRTC_MAIN,
>> +						    &data->main_path, &data->main_len);
>> +		if (ret && ret != -ENODEV)
>> +			return ret;
>> +	}
>> +
>> +	if (output_present[CRTC_EXT]) {
>> +		ret = mtk_drm_of_ddp_path_build_one(dev, CRTC_EXT,
>> +						    &data->ext_path, &data->ext_len);
>> +		if (ret && ret != -ENODEV)
>> +			return ret;
>> +	}
>> +
>> +	if (output_present[CRTC_THIRD]) {
>> +		ret = mtk_drm_of_ddp_path_build_one(dev, CRTC_THIRD,
>> +						    &data->third_path, &data->third_len);
>> +		if (ret && ret != -ENODEV)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int mtk_drm_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>>   	struct device_node *phandle = dev->parent->of_node;
>>   	const struct of_device_id *of_id;
>>   	struct mtk_drm_private *private;
>> +	struct mtk_mmsys_driver_data *mtk_drm_data;
>>   	struct device_node *node;
>>   	struct component_match *match = NULL;
>>   	struct platform_device *ovl_adaptor;
>> @@ -846,7 +1070,27 @@ static int mtk_drm_probe(struct platform_device *pdev)
>>   	if (!of_id)
>>   		return -ENODEV;
>>   
>> -	private->data = of_id->data;
>> +	mtk_drm_data = (struct mtk_mmsys_driver_data *)of_id->data;
>> +	if (!mtk_drm_data)
>> +		return -EINVAL;
>> +
>> +	/* Try to build the display pipeline from devicetree graphs */
>> +	if (of_graph_is_present(phandle)) {
>> +		dev_dbg(dev, "Building display pipeline for MMSYS %u\n",
>> +			mtk_drm_data->mmsys_id);
>> +		private->data = devm_kmemdup(dev, mtk_drm_data,
>> +					     sizeof(*mtk_drm_data), GFP_KERNEL);
>> +		if (!private->data)
>> +			return -ENOMEM;
>> +
>> +		ret = mtk_drm_of_ddp_path_build(dev, phandle, private->data);
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		/* No devicetree graphs support: go with hardcoded paths if present */
>> +		dev_dbg(dev, "Using hardcoded paths for MMSYS %u\n", mtk_drm_data->mmsys_id);
>> +		private->data = mtk_drm_data;
>> +	};
>>   
>>   	private->all_drm_private = devm_kmalloc_array(dev, private->data->mmsys_dev_num,
>>   						      sizeof(*private->all_drm_private),
>> @@ -868,12 +1112,11 @@ static int mtk_drm_probe(struct platform_device *pdev)
>>   
>>   	/* Iterate over sibling DISP function blocks */
>>   	for_each_child_of_node(phandle->parent, node) {
>> -		const struct of_device_id *of_id;
>>   		enum mtk_ddp_comp_type comp_type;
>>   		int comp_id;
>>   
>> -		of_id = of_match_node(mtk_ddp_comp_dt_ids, node);
>> -		if (!of_id)
>> +		ret = mtk_drm_of_get_ddp_comp_type(node, &comp_type);
>> +		if (ret)
>>   			continue;
>>   
>>   		if (!of_device_is_available(node)) {
>> @@ -882,8 +1125,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
>>   			continue;
>>   		}
>>   
>> -		comp_type = (enum mtk_ddp_comp_type)(uintptr_t)of_id->data;
>> -
>>   		if (comp_type == MTK_DISP_MUTEX) {
>>   			int id;
>>   
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>> index ce897984de51..675cdc90a440 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>> @@ -63,7 +63,7 @@ struct mtk_drm_private {
>>   	struct device *mmsys_dev;
>>   	struct device_node *comp_node[DDP_COMPONENT_DRM_ID_MAX];
>>   	struct mtk_ddp_comp ddp_comp[DDP_COMPONENT_DRM_ID_MAX];
>> -	const struct mtk_mmsys_driver_data *data;
>> +	struct mtk_mmsys_driver_data *data;
>>   	struct drm_atomic_state *suspend_state;
>>   	unsigned int mbox_index;
>>   	struct mtk_drm_private **all_drm_private;
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index eeec641cab60..33ceeb8d6925 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -988,9 +988,17 @@ static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
>>   	dsi->lanes = device->lanes;
>>   	dsi->format = device->format;
>>   	dsi->mode_flags = device->mode_flags;
>> -	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
>> -	if (IS_ERR(dsi->next_bridge))
>> -		return PTR_ERR(dsi->next_bridge);
>> +	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>> +	if (IS_ERR(dsi->next_bridge)) {
>> +		ret = PTR_ERR(dsi->next_bridge);
>> +		if (ret == -EPROBE_DEFER)
>> +			return ret;
>> +
>> +		/* Old devicetree has only one endpoint */
>> +		dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> 
> Here's the problem with your binding change.
> 
> next_bridge was port 0, and now it is port 1. Yes, you have a fallback
> for an old DT, but what happens with a new DT passed to a kernel without
> the change here?
> 

Rob, sorry but, didn't we have to ensure retro-compatibility and not really
forward-compatibility?
That's what I'm doing here.

Besides, it's not granted, yes, but it's a somewhat estabilished practice for
people to either upgrade both kernel and devicetree or just the kernel without
the devicetree.
Using the devicetree from a newer kernel version that is not a linux-stable version
is something that I've practically never seen (it's just me, and I'm not saying
that this is something that *never* happens at all), so I am guessing that this is
"more unique than rare", hence something that we shouldn't really worry about.

> Plus now we've got to carry this fallback code path when it's completely
> avoidable.

As I said in the reply of [1/3], the problem here is about consistency of the input
and output port number(s), and that's why the fallback is here.

Is it avoidable? Sure it is, but we lose that consistency.

My opinion is that this is not really avoidable if we want consistent devicetrees
on all MediaTek SoCs (counting arm64 only, more than 10 and growing, adding up the
arm ones they're many more).


Cheers,
Angelo

