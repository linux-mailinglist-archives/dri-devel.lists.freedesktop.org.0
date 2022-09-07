Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF315B0CE4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 21:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C0D10E56E;
	Wed,  7 Sep 2022 19:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC0110E56E;
 Wed,  7 Sep 2022 19:09:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 287ChFh0010610;
 Wed, 7 Sep 2022 19:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JH79js+Sfhoori9dAkBaFpvTfzahrGMhTTC8hA39eu8=;
 b=jrNK8pNiYU3zV9MWS+msnho5Blc7oOT0GISN18rTmL6VrJrVW0vZqvYVfC/5K81ToC6f
 UMS3BaepuDJOoSAuYadeievhekfYl34okYxZ3Oc2TLmRGfpHT+bk5DXBv1G5MbYv3CaT
 oVNkoGCthzliUsnUk3CGLILsMY37JlMsjv/72fZx/lnPzb7FmM+/65QsM66iGyqGhmrU
 GXf+2YNUZ/cY9z0dOokAcggB4S+r0QwWwHM2686jERgeZ6K+vj/eBDc2T3jz00AO5TNF
 EewF931GuYIgr5TrV3CJSCI6JLVm+cKP6aPBMbJ0CA+VmPz8xeYh6aD3b6uOJ+saBBPx ww== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jenmjtsud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 19:09:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 287J9JBl017967
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 7 Sep 2022 19:09:19 GMT
Received: from [10.111.169.242] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 7 Sep 2022
 12:09:17 -0700
Message-ID: <c379132c-e0b5-51d7-8b9a-708ef4c1d7b3@quicinc.com>
Date: Wed, 7 Sep 2022 12:09:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2 3/5] drm/msm/hdmi: move resource allocation
 to probe function
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
 <20220826093927.851597-4-dmitry.baryshkov@linaro.org>
 <b1b6ba61-10a6-ba9e-ac79-8b4182d348d9@quicinc.com>
In-Reply-To: <b1b6ba61-10a6-ba9e-ac79-8b4182d348d9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WrQklWkzIUnc2Px9Bd6kG9Wm8uX_0g_L
X-Proofpoint-ORIG-GUID: WrQklWkzIUnc2Px9Bd6kG9Wm8uX_0g_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_10,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2209070071
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/7/2022 11:54 AM, Abhinav Kumar wrote:
> 
> 
> On 8/26/2022 2:39 AM, Dmitry Baryshkov wrote:
>> Rather than having all resource allocation happen in the _bind function
>> (resulting in possible EPROBE_DEFER returns and component bind/unbind
>> cycles) allocate and check all resources in _probe function. While we
>> are at it, use platform_get_irq() to get the IRQ rather than going
>> through the irq_of_parse_and_map().
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/hdmi/hdmi.c | 303 +++++++++++++++-----------------
>>   1 file changed, 138 insertions(+), 165 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c 
>> b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> index 4a364d8f4c0b..c298a36f3b42 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> @@ -76,8 +76,6 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
>>       if (hdmi->i2c)
>>           msm_hdmi_i2c_destroy(hdmi->i2c);
>> -
>> -    platform_set_drvdata(hdmi->pdev, NULL);
>>   }
>>   static int msm_hdmi_get_phy(struct hdmi *hdmi)
> 
> Between v1 and v2, it just seems like a rebase to me on top of the 6.1 
> MR. But what about moving msm_hdmi_get_phy() to probe(). I thought you 
> were going to check that as well for v2.

Please ignore this part of the comment, I see that moving 
msm_hdmi_get_phy() to probe() is in the patch 5 of this series.

Thanks for making that change.

The below comment still holds true.

> 
> A change log would have been nice here. Because as part of the rebase 
> looks like we even migrate to using panel bridge for hdmi driver.
> 
> Usage of drm_of_find_panel_or_bridge was not present in v1 and wasnt 
> obvious from the commit text either.
> 
>> @@ -117,142 +115,10 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
>>    * we are to EPROBE_DEFER we want to do it here, rather than later
>>    * at modeset_init() time
>>    */
>> -static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
>> +static int msm_hdmi_init(struct hdmi *hdmi)
>>   {
>> -    struct hdmi_platform_config *config = pdev->dev.platform_data;
>> -    struct hdmi *hdmi = NULL;
>> -    struct resource *res;
>> -    int i, ret;
>> -
>> -    hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
>> -    if (!hdmi) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> -
>> -    hdmi->pdev = pdev;
>> -    hdmi->config = config;
>> -    spin_lock_init(&hdmi->reg_lock);
>> -
>> -    ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, 
>> &hdmi->next_bridge);
>> -    if (ret && ret != -ENODEV)
>> -        goto fail;
>> -
>> -    hdmi->mmio = msm_ioremap(pdev, "core_physical");
>> -    if (IS_ERR(hdmi->mmio)) {
>> -        ret = PTR_ERR(hdmi->mmio);
>> -        goto fail;
>> -    }
>> -
>> -    /* HDCP needs physical address of hdmi register */
>> -    res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> -        "core_physical");
>> -    if (!res) {
>> -        ret = -EINVAL;
>> -        goto fail;
>> -    }
>> -    hdmi->mmio_phy_addr = res->start;
>> -
>> -    hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
>> -    if (IS_ERR(hdmi->qfprom_mmio)) {
>> -        DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
>> -        hdmi->qfprom_mmio = NULL;
>> -    }
>> -
>> -    hdmi->hpd_regs = devm_kcalloc(&pdev->dev,
>> -                      config->hpd_reg_cnt,
>> -                      sizeof(hdmi->hpd_regs[0]),
>> -                      GFP_KERNEL);
>> -    if (!hdmi->hpd_regs) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> -    for (i = 0; i < config->hpd_reg_cnt; i++)
>> -        hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
>> -
>> -    ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt, 
>> hdmi->hpd_regs);
>> -    if (ret) {
>> -        DRM_DEV_ERROR(&pdev->dev, "failed to get hpd regulator: 
>> %d\n", ret);
>> -        goto fail;
>> -    }
>> -
>> -    hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
>> -                      config->pwr_reg_cnt,
>> -                      sizeof(hdmi->pwr_regs[0]),
>> -                      GFP_KERNEL);
>> -    if (!hdmi->pwr_regs) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> -
>> -    for (i = 0; i < config->pwr_reg_cnt; i++)
>> -        hdmi->pwr_regs[i].supply = config->pwr_reg_names[i];
>> -
>> -    ret = devm_regulator_bulk_get(&pdev->dev, config->pwr_reg_cnt, 
>> hdmi->pwr_regs);
>> -    if (ret) {
>> -        DRM_DEV_ERROR(&pdev->dev, "failed to get pwr regulator: 
>> %d\n", ret);
>> -        goto fail;
>> -    }
>> -
>> -    hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
>> -                      config->hpd_clk_cnt,
>> -                      sizeof(hdmi->hpd_clks[0]),
>> -                      GFP_KERNEL);
>> -    if (!hdmi->hpd_clks) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> -    for (i = 0; i < config->hpd_clk_cnt; i++) {
>> -        struct clk *clk;
>> -
>> -        clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
>> -        if (IS_ERR(clk)) {
>> -            ret = PTR_ERR(clk);
>> -            DRM_DEV_ERROR(&pdev->dev, "failed to get hpd clk: %s 
>> (%d)\n",
>> -                    config->hpd_clk_names[i], ret);
>> -            goto fail;
>> -        }
>> -
>> -        hdmi->hpd_clks[i] = clk;
>> -    }
>> -
>> -    hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
>> -                      config->pwr_clk_cnt,
>> -                      sizeof(hdmi->pwr_clks[0]),
>> -                      GFP_KERNEL);
>> -    if (!hdmi->pwr_clks) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> -    for (i = 0; i < config->pwr_clk_cnt; i++) {
>> -        struct clk *clk;
>> -
>> -        clk = msm_clk_get(pdev, config->pwr_clk_names[i]);
>> -        if (IS_ERR(clk)) {
>> -            ret = PTR_ERR(clk);
>> -            DRM_DEV_ERROR(&pdev->dev, "failed to get pwr clk: %s 
>> (%d)\n",
>> -                    config->pwr_clk_names[i], ret);
>> -            goto fail;
>> -        }
>> -
>> -        hdmi->pwr_clks[i] = clk;
>> -    }
>> -
>> -    hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", 
>> GPIOD_IN);
>> -    /* This will catch e.g. -EPROBE_DEFER */
>> -    if (IS_ERR(hdmi->hpd_gpiod)) {
>> -        ret = PTR_ERR(hdmi->hpd_gpiod);
>> -        DRM_DEV_ERROR(&pdev->dev, "failed to get hpd gpio: (%d)\n", 
>> ret);
>> -        goto fail;
>> -    }
>> -
>> -    if (!hdmi->hpd_gpiod)
>> -        DBG("failed to get HPD gpio");
>> -
>> -    if (hdmi->hpd_gpiod)
>> -        gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
>> -
>> -    devm_pm_runtime_enable(&pdev->dev);
>> +    struct platform_device *pdev = hdmi->pdev;
>> +    int ret;
>>       hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);
>> @@ -276,13 +142,13 @@ static struct hdmi *msm_hdmi_init(struct 
>> platform_device *pdev)
>>           hdmi->hdcp_ctrl = NULL;
>>       }
>> -    return hdmi;
>> +    return 0;
>>   fail:
>>       if (hdmi)
>>           msm_hdmi_destroy(hdmi);
>> -    return ERR_PTR(ret);
>> +    return ret;
>>   }
>>   /* Second part of initialization, the drm/kms level modeset_init,
>> @@ -332,13 +198,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>       drm_connector_attach_encoder(hdmi->connector, hdmi->encoder);
>> -    hdmi->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
>> -    if (!hdmi->irq) {
>> -        ret = -EINVAL;
>> -        DRM_DEV_ERROR(dev->dev, "failed to get irq\n");
>> -        goto fail;
>> -    }
>> -
>>       ret = devm_request_irq(&pdev->dev, hdmi->irq,
>>               msm_hdmi_irq, IRQF_TRIGGER_HIGH,
>>               "hdmi_isr", hdmi);
>> @@ -358,8 +217,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>       priv->bridges[priv->num_bridges++]       = hdmi->bridge;
>> -    platform_set_drvdata(pdev, hdmi);
>> -
>>       return 0;
>>   fail:
>> @@ -387,7 +244,7 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>   static const char *hpd_reg_names_8960[] = {"core-vdda"};
>>   static const char *hpd_clk_names_8960[] = {"core", "master_iface", 
>> "slave_iface"};
>> -static struct hdmi_platform_config hdmi_tx_8960_config = {
>> +const static struct hdmi_platform_config hdmi_tx_8960_config = {
>>           HDMI_CFG(hpd_reg, 8960),
>>           HDMI_CFG(hpd_clk, 8960),
>>   };
>> @@ -397,7 +254,7 @@ static const char *pwr_clk_names_8x74[] = {"extp", 
>> "alt_iface"};
>>   static const char *hpd_clk_names_8x74[] = {"iface", "core", 
>> "mdp_core"};
>>   static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
>> -static struct hdmi_platform_config hdmi_tx_8974_config = {
>> +const static struct hdmi_platform_config hdmi_tx_8974_config = {
>>           HDMI_CFG(pwr_reg, 8x74),
>>           HDMI_CFG(pwr_clk, 8x74),
>>           HDMI_CFG(hpd_clk, 8x74),
>> @@ -512,23 +369,12 @@ static int msm_hdmi_register_audio_driver(struct 
>> hdmi *hdmi, struct device *dev)
>>   static int msm_hdmi_bind(struct device *dev, struct device *master, 
>> void *data)
>>   {
>>       struct msm_drm_private *priv = dev_get_drvdata(master);
>> -    struct hdmi_platform_config *hdmi_cfg;
>> -    struct hdmi *hdmi;
>> -    struct device_node *of_node = dev->of_node;
>> +    struct hdmi *hdmi = dev_get_drvdata(dev);
>>       int err;
>> -    hdmi_cfg = (struct hdmi_platform_config *)
>> -            of_device_get_match_data(dev);
>> -    if (!hdmi_cfg) {
>> -        DRM_DEV_ERROR(dev, "unknown hdmi_cfg: %pOFn\n", of_node);
>> -        return -ENXIO;
>> -    }
>> -
>> -    dev->platform_data = hdmi_cfg;
>> -
>> -    hdmi = msm_hdmi_init(to_platform_device(dev));
>> -    if (IS_ERR(hdmi))
>> -        return PTR_ERR(hdmi);
>> +    err = msm_hdmi_init(hdmi);
>> +    if (err)
>> +        return err;
>>       priv->hdmi = hdmi;
>>       err = msm_hdmi_register_audio_driver(hdmi, dev);
>> @@ -561,6 +407,133 @@ static const struct component_ops msm_hdmi_ops = {
>>   static int msm_hdmi_dev_probe(struct platform_device *pdev)
>>   {
>> +    const struct hdmi_platform_config *config;
>> +    struct device *dev = &pdev->dev;
>> +    struct hdmi *hdmi;
>> +    struct resource *res;
>> +    int i, ret;
>> +
>> +    config = of_device_get_match_data(dev);
>> +    if (!config)
>> +        return -EINVAL;
>> +
>> +    hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
>> +    if (!hdmi)
>> +        return -ENOMEM;
>> +
>> +    hdmi->pdev = pdev;
>> +    hdmi->config = config;
>> +    spin_lock_init(&hdmi->reg_lock);
>> +
>> +    ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, 
>> &hdmi->next_bridge);
>> +    if (ret && ret != -ENODEV)
>> +        return ret;
>> +
>> +    hdmi->mmio = msm_ioremap(pdev, "core_physical");
>> +    if (IS_ERR(hdmi->mmio))
>> +        return PTR_ERR(hdmi->mmio);
>> +
>> +    /* HDCP needs physical address of hdmi register */
>> +    res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> +        "core_physical");
>> +    if (!res)
>> +        return -EINVAL;
>> +    hdmi->mmio_phy_addr = res->start;
>> +
>> +    hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
>> +    if (IS_ERR(hdmi->qfprom_mmio)) {
>> +        DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
>> +        hdmi->qfprom_mmio = NULL;
>> +    }
>> +
>> +    hdmi->irq = platform_get_irq(pdev, 0);
>> +    if (hdmi->irq < 0)
>> +        return hdmi->irq;
>> +
>> +    hdmi->hpd_regs = devm_kcalloc(&pdev->dev,
>> +                      config->hpd_reg_cnt,
>> +                      sizeof(hdmi->hpd_regs[0]),
>> +                      GFP_KERNEL);
>> +    if (!hdmi->hpd_regs)
>> +        return -ENOMEM;
>> +
>> +    for (i = 0; i < config->hpd_reg_cnt; i++)
>> +        hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
>> +
>> +    ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt, 
>> hdmi->hpd_regs);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "failed to get hpd 
>> regulators\n");
>> +
>> +    hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
>> +                      config->pwr_reg_cnt,
>> +                      sizeof(hdmi->pwr_regs[0]),
>> +                      GFP_KERNEL);
>> +    if (!hdmi->pwr_regs)
>> +        return -ENOMEM;
>> +
>> +    for (i = 0; i < config->pwr_reg_cnt; i++)
>> +        hdmi->pwr_regs[i].supply = config->pwr_reg_names[i];
>> +
>> +    ret = devm_regulator_bulk_get(&pdev->dev, config->pwr_reg_cnt, 
>> hdmi->pwr_regs);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "failed to get pwr 
>> regulators\n");
>> +
>> +    hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
>> +                      config->hpd_clk_cnt,
>> +                      sizeof(hdmi->hpd_clks[0]),
>> +                      GFP_KERNEL);
>> +    if (!hdmi->hpd_clks)
>> +        return -ENOMEM;
>> +
>> +    for (i = 0; i < config->hpd_clk_cnt; i++) {
>> +        struct clk *clk;
>> +
>> +        clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
>> +        if (IS_ERR(clk))
>> +            return dev_err_probe(dev, PTR_ERR(clk),
>> +                         "failed to get hpd clk: %s\n",
>> +                         config->hpd_clk_names[i]);
>> +
>> +        hdmi->hpd_clks[i] = clk;
>> +    }
>> +
>> +    hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
>> +                      config->pwr_clk_cnt,
>> +                      sizeof(hdmi->pwr_clks[0]),
>> +                      GFP_KERNEL);
>> +    if (!hdmi->pwr_clks)
>> +        return -ENOMEM;
>> +
>> +    for (i = 0; i < config->pwr_clk_cnt; i++) {
>> +        struct clk *clk;
>> +
>> +        clk = msm_clk_get(pdev, config->pwr_clk_names[i]);
>> +        if (IS_ERR(clk))
>> +            return dev_err_probe(dev, PTR_ERR(clk),
>> +                         "failed to get pwr clk: %s\n",
>> +                         config->pwr_clk_names[i]);
>> +
>> +        hdmi->pwr_clks[i] = clk;
>> +    }
>> +
>> +    hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", 
>> GPIOD_IN);
>> +    /* This will catch e.g. -EPROBE_DEFER */
>> +    if (IS_ERR(hdmi->hpd_gpiod))
>> +        return dev_err_probe(dev, PTR_ERR(hdmi->hpd_gpiod),
>> +                     "failed to get hpd gpio\n");
>> +
>> +    if (!hdmi->hpd_gpiod)
>> +        DBG("failed to get HPD gpio");
>> +
>> +    if (hdmi->hpd_gpiod)
>> +        gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
>> +
>> +    ret = devm_pm_runtime_enable(&pdev->dev);
>> +    if (ret)
>> +        return ret;
>> +
>> +    platform_set_drvdata(pdev, hdmi);
>> +
>>       return component_add(&pdev->dev, &msm_hdmi_ops);
>>   }
