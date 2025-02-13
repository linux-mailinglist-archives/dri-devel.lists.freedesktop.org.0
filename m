Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C314CA33CCA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 11:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1C110EA49;
	Thu, 13 Feb 2025 10:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="g3ifTBzg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7141810EA49
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739442888;
 bh=35xQ3XU/c9jHM/pt/XsRyFhzFFeSPKtFpTinc1AhEc0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=g3ifTBzgbJKTXGVF0K8jfa8nrnSiGhPZ2FBE2Gd8LzlMualD71Rv/oyMKJ+a7Nr/X
 mBwFMLSVbmYpxQtjmymtUgTyoUdgzzsehiQCI54bVajj93s7eeQfu41neTg1tsO9Oe
 gSDilPzenaLsRn7WfyO/HKKCjEDyg9wdXFYPGCS/0pwMqnLBVOzec28PwqKP0qW8vA
 7fYTDeFoseI+vc/Rkh2QxAUNCwRaANJ6uCzP0Khx0TpPV46AuM0DyMjeAbo+kxJjr6
 q8Ric2B8PdlEKfABLqZbC1YkF1yT61ZOnPqmDWA4AL4SlRNbHlL+28bQWeKZiE+l0v
 1k376nYV5DPzw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CDF6717E1247;
 Thu, 13 Feb 2025 11:34:46 +0100 (CET)
Message-ID: <d7ca076e-4359-4e1e-a700-820198388a66@collabora.com>
Date: Thu, 13 Feb 2025 11:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 25/42] drm/mediatek: mtk_hdmi: Move CEC device parsing
 in new function
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
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
 <20250211113409.1517534-26-angelogioacchino.delregno@collabora.com>
 <0e164efeaa3cde827293bfed001d7a2c5fbb56fc.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <0e164efeaa3cde827293bfed001d7a2c5fbb56fc.camel@mediatek.com>
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

Il 13/02/25 08:42, CK Hu (胡俊光) ha scritto:
> On Tue, 2025-02-11 at 12:33 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Move the CEC device parsing logic to a new function called
>> mtk_hdmi_get_cec_dev(), and move the parsing action to the end
>> of mtk_hdmi_dt_parse_pdata(), allowing to remove gotos in this
>> function, reducing code size and improving readability.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 82 ++++++++++++++---------------
>>   1 file changed, 39 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 6140b55c2830..03b56588fc7d 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -1367,20 +1367,12 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
>>          .edid_read = mtk_hdmi_bridge_edid_read,
>>   };
>>
>> -static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>> -                                  struct platform_device *pdev)
>> +static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struct device_node *np)
>>   {
>> -       struct device *dev = &pdev->dev;
>> -       struct device_node *np = dev->of_node;
>> -       struct device_node *remote, *i2c_np;
>>          struct platform_device *cec_pdev;
>> -       struct regmap *regmap;
>> +       struct device_node *cec_np;
>>          int ret;
>>
>> -       ret = mtk_hdmi_get_all_clk(hdmi, np);
>> -       if (ret)
>> -               return dev_err_probe(dev, ret, "Failed to get clocks\n");
>> -
>>          /* The CEC module handles HDMI hotplug detection */
>>          cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
>>          if (!cec_np)
>> @@ -1394,65 +1386,69 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>>                  return -EPROBE_DEFER;
>>          }
>>          of_node_put(cec_np);
>> -       hdmi->cec_dev = &cec_pdev->dev;
>>
>>          /*
>>           * The mediatek,syscon-hdmi property contains a phandle link to the
>>           * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
>>           * registers it contains.
>>           */
>> -       regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
>> -       ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1,
>> -                                        &hdmi->sys_offset);
>> -       if (IS_ERR(regmap))
>> -               ret = PTR_ERR(regmap);
>> -       if (ret) {
>> -               dev_err_probe(dev, ret,
>> -                             "Failed to get system configuration registers\n");
>> -               goto put_device;
>> -       }
>> -       hdmi->sys_regmap = regmap;
>> +       hdmi->sys_regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
>> +       if (IS_ERR(hdmi->sys_regmap))
>> +               return PTR_ERR(hdmi->sys_regmap);
>> +
>> +       ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1, &hdmi->sys_offset);
>> +       if (ret)
>> +               return dev_err_probe(dev, ret,
>> +                                    "Failed to get system configuration registers\n");
>> +
>> +       hdmi->cec_dev = &cec_pdev->dev;
>> +       return 0;
>> +}
>> +
>> +static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>> +                                  struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct device_node *np = dev->of_node;
>> +       struct device_node *remote, *i2c_np;
>> +       int ret;
>> +
>> +       ret = mtk_hdmi_get_all_clk(hdmi, np);
>> +       if (ret)
>> +               return dev_err_probe(dev, ret, "Failed to get clocks\n");
>>
>>          hdmi->regs = device_node_to_regmap(dev->of_node);
>> -       if (IS_ERR(hdmi->regs)) {
>> -               ret = PTR_ERR(hdmi->regs);
>> -               goto put_device;
>> -       }
>> +       if (IS_ERR(hdmi->regs))
>> +               return PTR_ERR(hdmi->regs);
>>
>>          remote = of_graph_get_remote_node(np, 1, 0);
>> -       if (!remote) {
>> -               ret = -EINVAL;
>> -               goto put_device;
>> -       }
>> +       if (!remote)
>> +               return -EINVAL;
>>
>>          if (!of_device_is_compatible(remote, "hdmi-connector")) {
>>                  hdmi->next_bridge = of_drm_find_bridge(remote);
>>                  if (!hdmi->next_bridge) {
>>                          dev_err(dev, "Waiting for external bridge\n");
>>                          of_node_put(remote);
>> -                       ret = -EPROBE_DEFER;
>> -                       goto put_device;
>> +                       return -EPROBE_DEFER;
>>                  }
>>          }
>>
>>          i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
>>          of_node_put(remote);
>> -       if (!i2c_np) {
>> -               ret = dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
>> -               goto put_device;
>> -       }
>> +       if (!i2c_np)
>> +               return dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
>>
>>          hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
>>          of_node_put(i2c_np);
>> -       if (!hdmi->ddc_adpt) {
>> -               ret = dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
>> -               goto put_device;
>> -       }
>> +       if (!hdmi->ddc_adpt)
>> +               return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
>> +
>> +       ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
>> +       if (ret)
>> +               return ret;
>>
>>          return 0;
> 
> return mtk_hdmi_get_cec_dev(hdmi, dev, np);
> 
> or
> 
> ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
> 
> return ret;
> 
> After this,
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 

Can we please avoid this change?

That's done so that any addition to the end of the function produces a smaller diff
and for return value readability.

Thanks,
Angelo

>> -put_device:
>> -       put_device(hdmi->cec_dev);
>> -       return ret;
>>   }
>>
>>   /*
>> --
>> 2.48.1
>>
> 

