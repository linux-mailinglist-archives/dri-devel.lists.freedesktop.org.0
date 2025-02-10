Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA9CA2F4C8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 18:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3327910E05D;
	Mon, 10 Feb 2025 17:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="U+lU5Sm4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B9510E05D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739207507;
 bh=o0hGxA0NOgQ5LtRO7padQZ5PIO0xxvCaBJv4H++US4A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U+lU5Sm45JrbHGoZwGrg/5xCMw5y1ivPS6w6aZR6ogdC4Fd+WzQ/qvj4uul5GLk/K
 UrD+fz2LIpWcHhY3JBEcmswsDicSpCl3+gkogv+g5s0h1UWJsbr6piR4kJF9aRolxx
 bsANi9gVGx4V2kYsHFczZA2yjAzsohiHfjT8mZKpHZYyEzBKWg2tuWijcu8HMzLChn
 kSU723Z9VnD1iVyUaz8FI0F1ZWZYoGso/CSO1+3fd3B1U/FtbfcIuZHVUJiGWIBYD3
 w1c/96oALLNwtlQ75uU8k4QYjt3FdWEbgQ6ue3hXYFCRiKP4iw1sLVxq3zS9x1EwHx
 J0ZUxcDiaU/DA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C50CC17E0239;
 Mon, 10 Feb 2025 18:11:45 +0100 (CET)
Message-ID: <a5d6d63b-ae37-4cd6-94f7-50647c8b0a21@collabora.com>
Date: Mon, 10 Feb 2025 18:11:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 29/34] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "jie.qiu@mediatek.com" <jie.qiu@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?UTF-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?= <TommyYL.Chen@mediatek.com>,
 =?UTF-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-30-angelogioacchino.delregno@collabora.com>
 <8a4ba3fb6d953f1106d3a766208c4b86da1cfcb8.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <8a4ba3fb6d953f1106d3a766208c4b86da1cfcb8.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Il 10/02/25 03:18, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Mon, 2025-01-13 at 15:52 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> In preparation for adding a new driver for the HDMI TX v2 IP,
>> split out the functions that will be common between the already
>> present mtk_hdmi (v1) driver and the new one.
>>
>> Since the probe flow for both drivers is 90% similar, add a common
>> probe function that will be called from each driver's .probe()
>> callback, avoiding lots of code duplication.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/Kconfig           |  11 +-
>>   drivers/gpu/drm/mediatek/Makefile          |   1 +
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c        | 553 +--------------------
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 426 ++++++++++++++++
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 188 +++++++
>>   5 files changed, 648 insertions(+), 531 deletions(-)
>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
>>
>> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
>> index e47debd60619..994b48b82d44 100644
>> --- a/drivers/gpu/drm/mediatek/Kconfig
>> +++ b/drivers/gpu/drm/mediatek/Kconfig
>> @@ -30,9 +30,18 @@ config DRM_MEDIATEK_DP
>>          help
>>            DRM/KMS Display Port driver for MediaTek SoCs.
>>
>> +config DRM_MEDIATEK_HDMI_COMMON
>> +       tristate
>> +       depends on DRM_MEDIATEK
>> +       select DRM_DISPLAY_HDMI_HELPER
>> +       select DRM_DISPLAY_HELPER
>> +       select SND_SOC_HDMI_CODEC if SND_SOC
>> +       help
>> +         MediaTek SoC HDMI common library
>> +
>>   config DRM_MEDIATEK_HDMI
>>          tristate "DRM HDMI Support for Mediatek SoCs"
>>          depends on DRM_MEDIATEK
>> -       select SND_SOC_HDMI_CODEC if SND_SOC
>> +       select DRM_MEDIATEK_HDMI_COMMON
>>          help
>>            DRM/KMS HDMI driver for Mediatek SoCs
>> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
>> index 43afd0a26d14..78cf2d4fc85f 100644
>> --- a/drivers/gpu/drm/mediatek/Makefile
>> +++ b/drivers/gpu/drm/mediatek/Makefile
>> @@ -21,6 +21,7 @@ mediatek-drm-y := mtk_crtc.o \
>>
>>   obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
>>
>> +obj-$(CONFIG_DRM_MEDIATEK_HDMI_COMMON) += mtk_hdmi_common.o
> 
> It's not necessary to create CONFIG_DRM_MEDIATEK_HDMI_COMMON to build mtk_hdmi_common.o.
> 
> obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_hdmi_common.o
> obj-$(CONFIG_DRM_MEDIATEK_HDMI_V2) += mtk_hdmi_common.o
> 

What you proposed would work - but it's not feasible: this is duplication, and
duplication is bad. That's why CONFIG_DRM_MEDIATEK_HDMI_COMMON was created.

I will not change that, sorry.

>>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_cec.o
>>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_hdmi.o
>>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_hdmi_ddc.o
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 138c6283c038..7940c9b598c1 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c

..snip..

>> -
>>   static int mtk_hdmi_probe(struct platform_device *pdev)
>>   {
>>          struct mtk_hdmi *hdmi;
>> -       struct device *dev = &pdev->dev;
>> -       const int num_clocks = MTK_HDMI_CLK_COUNT;
>> -       int ret;
>> -
>> -       hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
>> -       if (!hdmi)
>> -               return -ENOMEM;
>>
>> -       hdmi->dev = dev;
>> -       hdmi->conf = of_device_get_match_data(dev);
>> +       hdmi = mtk_hdmi_common_probe(pdev);
>> +       if (IS_ERR(hdmi))
>> +               return PTR_ERR(hdmi);
>>
>> -       hdmi->clk = devm_kcalloc(dev, num_clocks, sizeof(*hdmi->clk), GFP_KERNEL);
>> -       if (!hdmi->clk)
>> -               return -ENOMEM;
>> -
>> -       ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev, mtk_hdmi_clk_names, num_clocks);
>> -       if (ret)
>> -               return ret;
>> -
>> -       hdmi->phy = devm_phy_get(dev, "hdmi");
>> -       if (IS_ERR(hdmi->phy))
>> -               return dev_err_probe(dev, PTR_ERR(hdmi->phy),
>> -                                    "Failed to get HDMI PHY\n");
>> -
>> -       mutex_init(&hdmi->update_plugged_status_lock);
>> -       platform_set_drvdata(pdev, hdmi);
>> -
>> -       ret = mtk_hdmi_register_audio_driver(dev);
>> -       if (ret)
>> -               return dev_err_probe(dev, ret,
>> -                                    "Failed to register audio driver\n");
>> -
>> -       hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
>> -       hdmi->bridge.of_node = pdev->dev.of_node;
>> -       hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
>> -                        | DRM_BRIDGE_OP_HPD;
>> -       hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>> -       hdmi->bridge.vendor = "MediaTek";
>> -       hdmi->bridge.product = "On-Chip HDMI";
>> -
>> -       ret = devm_drm_bridge_add(dev, &hdmi->bridge);
>> -       if (ret)
>> -               return dev_err_probe(dev, ret, "Failed to add bridge\n");
>> +       if (!hdmi->cec_dev)
>> +               return dev_err_probe(hdmi->dev, -ENODEV, "CEC is required by HDMIv1\n");
>>
>> -       ret = mtk_hdmi_clk_enable_audio(hdmi);
>> -       if (ret)
>> -               return dev_err_probe(dev, ret,
>> -                                    "Failed to enable audio clocks\n");
> 
> Originally, print error message for mtk_hdmi_clk_enable_audio() here.
> In this patch, it does not print error message here.
> If this modification is necessary, separate this to another patch.
> 

I'll separate that to a different patch. Ok.

>> -
>> -       return 0;
>> +       return mtk_hdmi_clk_enable_audio(hdmi);
>>   }
>>
>>   static void mtk_hdmi_remove(struct platform_device *pdev)

..snip..

>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> new file mode 100644
>> index 000000000000..7dc7ba46f44d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c

..snip..

>> +
>> +static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
>> +                                  const char * const *clk_names, size_t num_clocks)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct device_node *np = dev->of_node;
>> +       struct device_node *remote, *i2c_np;
>> +       int ret;
>> +
>> +       ret = mtk_hdmi_get_all_clk(hdmi, np, clk_names, num_clocks);
>> +       if (ret)
>> +               return dev_err_probe(dev, ret, "Failed to get clocks\n");
>> +
>> +       hdmi->regs = device_node_to_regmap(dev->of_node);
>> +       if (IS_ERR(hdmi->regs))
>> +               return PTR_ERR(hdmi->regs);
>> +
>> +       remote = of_graph_get_remote_node(np, 1, 0);
>> +       if (!remote)
>> +               return -EINVAL;
>> +
>> +       if (!of_device_is_compatible(remote, "hdmi-connector")) {
>> +               hdmi->next_bridge = of_drm_find_bridge(remote);
>> +               if (!hdmi->next_bridge) {
>> +                       dev_err(dev, "Waiting for external bridge\n");
>> +                       of_node_put(remote);
>> +                       return -EPROBE_DEFER;
>> +               }
>> +       }
>> +
>> +       i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
>> +       of_node_put(remote);
>> +       if (!i2c_np)
>> +               return dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
>> +
>> +       hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
>> +       of_node_put(i2c_np);
>> +       if (!hdmi->ddc_adpt)
>> +               return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
>> +
>> +       ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
>> +       if (ret == -ENOTSUPP)
>> +               dev_info(dev, "CEC support unavailable: node not found\n");
> 
> CEC is used only in v1 driver. So separate CEC related modification to another patch.
> 

Ok.

>> +       else if (ret)
>> +               return ret;
>> +
>> +       return 0;
>> +}
>> +

..snip..

>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
>> new file mode 100644
>> index 000000000000..d3de8afff40f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
>> @@ -0,0 +1,188 @@

..snip..

>> +struct mtk_hdmi_ver_conf {
>> +       const struct drm_bridge_funcs *bridge_funcs;
>> +       const struct hdmi_codec_ops *codec_ops;
>> +       const char * const *mtk_hdmi_clock_names;
>> +       int num_clocks;
>> +};
> 
> This patch create something new for new hdmi driver.
> And this patch also separate common function to common file.
> I would like to separate these to two patches.
> One for creating something new for new hdmi driver.
> Another one for separating common function to common file.
> 

That makes sense, will do.

Regards,
Angelo

> Regards,
> CK
> 
>> +
>> +struct mtk_hdmi_conf {
>> +       const struct mtk_hdmi_ver_conf *ver_conf;
>> +       bool tz_disabled;
>> +       bool cea_modes_only;
>> +       unsigned long max_mode_clock;
>> +};
>> +
>> +struct mtk_hdmi {
>> +       struct drm_bridge bridge;
>> +       struct drm_bridge *next_bridge;
>> +       struct drm_connector *curr_conn;/* current connector (only valid when 'enabled') */
>> +       struct device *dev;
>> +       const struct mtk_hdmi_conf *conf;
>> +       struct phy *phy;
>> +       struct device *cec_dev;
>> +       struct i2c_adapter *ddc_adpt;
>> +       struct clk **clk;
>> +       struct drm_display_mode mode;
>> +       bool dvi_mode;
>> +       struct regmap *sys_regmap;
>> +       unsigned int sys_offset;
>> +       struct regmap *regs;
>> +       struct platform_device *audio_pdev;
>> +       struct hdmi_audio_param aud_param;
>> +       bool audio_enable;
>> +       bool powered;
>> +       bool enabled;
>> +       hdmi_codec_plugged_cb plugged_cb;
>> +       struct device *codec_dev;
>> +       struct mutex update_plugged_status_lock;
>> +};
>> +
>> +static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
>> +{
>> +       return container_of(b, struct mtk_hdmi, bridge);
>> +}
>> +
>> +
>> +int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf, size_t len);
>> +void mtk_hdmi_audio_set_plugged_cb(struct mtk_hdmi *hdmi, hdmi_codec_plugged_cb fn,
>> +                                  struct device *codec_dev);
>> +int mtk_hdmi_audio_params(struct mtk_hdmi *hdmi, struct hdmi_codec_daifmt *daifmt,
>> +                         struct hdmi_codec_params *params);
>> +void mtk_hdmi_get_ncts(unsigned int sample_rate, unsigned int clock,
>> +                      unsigned int *n, unsigned int *cts);
>> +bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
>> +                               const struct drm_display_mode *mode,
>> +                               struct drm_display_mode *adjusted_mode);
>> +void mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
>> +                             const struct drm_display_mode *mode,
>> +                             const struct drm_display_mode *adjusted_mode);
>> +struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev);
>> +#endif /* _MTK_HDMI_COMMON_H */
>> --
>> 2.47.0
>>
> 


