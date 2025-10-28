Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B3CC159A3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6086510E608;
	Tue, 28 Oct 2025 15:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RTQKgm2N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944B910E5F8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761666689;
 bh=MyntksnbV/kHN08UZNudeGV5Mwxd32nHSOa6iJ8X3eY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RTQKgm2Nco9XkEFOuT1WlglZrZAxc6bSIN6gitnKptdsZjIHIM8yYgBh48MBE8IGE
 3x9L5AJtuBSn2jz8zpRMP/FxzUXNW6FR2GQQYSP/y5CZGPdITfl5ZO4YzLJkdMXgXG
 uGDk2oc3MCO/Xenip1GPa48iq5xqotJ5rCj2EIygtXBAh2dFcMg+evF9T2ULchL1m5
 bCky+Nv+IqOygfRd2eWN3eCQ1mrxpQCHznnTrZ6F3AYYpRXsMVreIFd/j/UZqqrzNH
 x7SW5brtvyWeuv0zmYqMo7x7RNueCnYeXOVjIIqz//u/Sx8MHh64ZtiCFOky2CKnPO
 cFj2eED+Ges1Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7D85F17E0DF2;
 Tue, 28 Oct 2025 16:51:28 +0100 (CET)
Message-ID: <61291f3f-ef56-48fa-bdf1-c34d9beb910a@collabora.com>
Date: Tue, 28 Oct 2025 16:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/mediatek: mtk_disp_ovl: Enable/disable interrupt
 on bind/unbind
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "djkurtz@chromium.org" <djkurtz@chromium.org>,
 "granquet@baylibre.com" <granquet@baylibre.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?UTF-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "littlecvr@chromium.org" <littlecvr@chromium.org>,
 =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>
References: <20250924103708.19071-1-angelogioacchino.delregno@collabora.com>
 <20250924103708.19071-3-angelogioacchino.delregno@collabora.com>
 <79e1cb6b8ddbd027096cc7f1d6a6f32ba4fbfbd9.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <79e1cb6b8ddbd027096cc7f1d6a6f32ba4fbfbd9.camel@mediatek.com>
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

Il 28/10/25 10:55, CK Hu (胡俊光) ha scritto:
> On Wed, 2025-09-24 at 12:37 +0200, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> The OVL driver is installing an ISR in the probe function but, if
>> the component is not bound yet, the interrupt handler may call the
>> vblank_cb ahead of time (while probing other drivers) or too late
>> (while removing other drivers), possibly accessing memory that it
>> should not try to access by reusing stale pointers.
>>
>> In order to fix this, add a new `irq` member to struct mtk_disp_ovl
>> and then set the NOAUTOEN flag to the irq before installing the ISR
>> to manually call enable_irq() and disable_irq() in the bind and
>> unbind callbacks respectively.
>>
>> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
>> Link: https://lore.kernel.org/r/20250402083628.20111-5-angelogioacchino.delregno@collabora.com
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 20 +++++++++++++-------
>>   1 file changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> index e0236353d499..8e20b45411fc 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> @@ -161,6 +161,7 @@ struct mtk_disp_ovl {
>>          struct drm_crtc                 *crtc;
>>          struct clk                      *clk;
>>          void __iomem                    *regs;
>> +       int                             irq;
>>          struct cmdq_client_reg          cmdq_reg;
>>          const struct mtk_disp_ovl_data  *data;
>>          void                            (*vblank_cb)(void *data);
>> @@ -594,12 +595,18 @@ void mtk_ovl_bgclr_in_off(struct device *dev)
>>   static int mtk_disp_ovl_bind(struct device *dev, struct device *master,
>>                               void *data)
>>   {
>> +       struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
>> +
>> +       enable_irq(priv->irq);
>>          return 0;
>>   }
>>
>>   static void mtk_disp_ovl_unbind(struct device *dev, struct device *master,
>>                                  void *data)
>>   {
>> +       struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
>> +
>> +       disable_irq(priv->irq);
>>   }
>>
>>   static const struct component_ops mtk_disp_ovl_component_ops = {
>> @@ -611,16 +618,15 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
>>   {
>>          struct device *dev = &pdev->dev;
>>          struct mtk_disp_ovl *priv;
>> -       int irq;
>>          int ret;
>>
>>          priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>          if (!priv)
>>                  return -ENOMEM;
>>
>> -       irq = platform_get_irq(pdev, 0);
>> -       if (irq < 0)
>> -               return irq;
>> +       priv->irq = platform_get_irq(pdev, 0);
>> +       if (priv->irq < 0)
>> +               return priv->irq;
>>
>>          priv->clk = devm_clk_get(dev, NULL);
>>          if (IS_ERR(priv->clk))
>> @@ -640,10 +646,10 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
>>          priv->data = of_device_get_match_data(dev);
>>          platform_set_drvdata(pdev, priv);
>>
>> -       ret = devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
>> -                              IRQF_TRIGGER_NONE, dev_name(dev), priv);
>> +       ret = devm_request_irq(dev, priv->irq, mtk_disp_ovl_irq_handler,
>> +                              IRQF_NO_AUTOEN, dev_name(dev), priv);
> 
> RDMA driver would clear pending interrupt and disable interrupt before request irq.
> I would like the hardware would be in idle state when probe.
> So OVL should do like RDMA.
> 

As I commented on RDMA - that won't work. After unbinding components, only the
bind() op will be executed, not probe(), so the interrupt will not be reset in
HW, and while re-binding other components, IRQs will come and produce a kernel
panic (in the best scenario, eh!) for use-after-free.

Regards,
Angelo

> Regards,
> CK
> 
>>          if (ret < 0)
>> -               return dev_err_probe(dev, ret, "Failed to request irq %d\n", irq);
>> +               return dev_err_probe(dev, ret, "Failed to request irq %d\n", priv->irq);
>>
>>          pm_runtime_enable(dev);
>>
>> --
>> 2.51.0
>>
> 


