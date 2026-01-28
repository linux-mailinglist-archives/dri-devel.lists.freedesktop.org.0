Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIYFEljmeWl60wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 11:35:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95359F89D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 11:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D25D10E23B;
	Wed, 28 Jan 2026 10:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="de5YgG5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 28 Jan 2026 06:27:59 UTC
Received: from mail-m32116.qiye.163.com (mail-m32116.qiye.163.com
 [220.197.32.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B12B10E1AD;
 Wed, 28 Jan 2026 06:27:59 +0000 (UTC)
Received: from [172.16.12.14] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 323dec204;
 Wed, 28 Jan 2026 14:22:51 +0800 (GMT+08:00)
Message-ID: <33bbb3ec-5659-4d50-a5ff-dafa44e291dd@rock-chips.com>
Date: Wed, 28 Jan 2026 14:22:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
 <llbnkm72mgcsrucnp7pdkwbgyzenvhe4kudxkdixplgaoirdem@3q3me34o5drf>
 <0104896e-44d0-485a-a44e-694864c819b7@linaro.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <0104896e-44d0-485a-a44e-694864c819b7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c0344df9609cckunmfeac2e531bd066
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkxLSFZNSUsaHkMZQ01MGB5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=de5YgG5yXN9uH1U/29igFPjzMtVXZjG11RVK1ox3PS+J0OxMUsWTNCOPROu8id+oUwcmJpuixHyc9xQu9wm+e011mhPVPHSDxOEQqVX7UmuUb4yIv1FjZ8cKPaXr4zOp8OU4D4CKufl7NjYy2zQtn0eUL36w0+D3ewWucOSsJ/4=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=MAfz+13K76TPUxvO+5QDm/lgQXp/YWJ9M/nw8Kebqcw=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Wed, 28 Jan 2026 10:34:57 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[rock-chips.com,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[rock-chips.com:+]
X-Rspamd-Queue-Id: D95359F89D
X-Rspamd-Action: no action

在 2026/01/28 星期三 5:53, Neil Armstrong 写道:
> On 1/27/26 16:53, Manivannan Sadhasivam wrote:
>> On Tue, Jan 27, 2026 at 10:57:29AM +0100, Neil Armstrong wrote:
>>> Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host 
>>> Controller
>>> power control which connects over PCIe and requires specific power 
>>> supplies
>>> to start up.
>>>
>>
>> This driver only handles the supplies. So why can't you use the existing
>> pwrctrl-slot driver as a fallback?
> 
> It would fit with no change, but the name "slot" doesn't match the goal 
> here,
> it's not a slot at all, it's an actual pcie IC.
> 

How about renaming slot.cto something like pci-pwrctrl-simple.c, 
especially if most power sequences fit into this category? This would 
follow the naming example seen in other subsystems, such as 
drivers/mmc/core/pwrseq_simple.c.

> Neil
> 
>>
>> - Mani
>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/pci/pwrctrl/Kconfig                 | 10 ++++
>>>   drivers/pci/pwrctrl/Makefile                |  2 +
>>>   drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c | 88 ++++++++++++++++++ 
>>> +++++++++++
>>>   3 files changed, 100 insertions(+)
>>>
>>> diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
>>> index e0f999f299bb..5a94e60d0d3e 100644
>>> --- a/drivers/pci/pwrctrl/Kconfig
>>> +++ b/drivers/pci/pwrctrl/Kconfig
>>> @@ -11,6 +11,16 @@ config PCI_PWRCTRL_PWRSEQ
>>>       select POWER_SEQUENCING
>>>       select PCI_PWRCTRL
>>> +config PCI_PWRCTRL_UPD720201
>>> +    tristate "PCI Power Control driver for the UPD720201 USB3 Host 
>>> Controller"
>>> +    select PCI_PWRCTRL
>>> +    help
>>> +      Say Y here to enable the PCI Power Control driver of the 
>>> UPD720201
>>> +      USB3 Host Controller.
>>> +
>>> +      The voltage regulators powering the rails of the PCI slots
>>> +      are expected to be defined in the devicetree node of the PCI 
>>> device.
>>> +
>>>   config PCI_PWRCTRL_SLOT
>>>       tristate "PCI Power Control driver for PCI slots"
>>>       select PCI_PWRCTRL
>>> diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
>>> index 13b02282106c..a99f85de8a3d 100644
>>> --- a/drivers/pci/pwrctrl/Makefile
>>> +++ b/drivers/pci/pwrctrl/Makefile
>>> @@ -5,6 +5,8 @@ pci-pwrctrl-core-y            := core.o
>>>   obj-$(CONFIG_PCI_PWRCTRL_PWRSEQ)    += pci-pwrctrl-pwrseq.o
>>> +obj-$(CONFIG_PCI_PWRCTRL_UPD720201)    += pci-pwrctrl-upd720201.o
>>> +
>>>   obj-$(CONFIG_PCI_PWRCTRL_SLOT)        += pci-pwrctrl-slot.o
>>>   pci-pwrctrl-slot-y            := slot.o
>>> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c b/drivers/ 
>>> pci/pwrctrl/pci-pwrctrl-upd720201.c
>>> new file mode 100644
>>> index 000000000000..db96bbb69c21
>>> --- /dev/null
>>> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
>>> @@ -0,0 +1,88 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Based on upd720201.c:
>>> + * Copyright (C) 2024 Linaro Ltd.
>>> + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> + */
>>> +
>>> +#include <linux/device.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/module.h>
>>> +#include <linux/pci-pwrctrl.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/regulator/consumer.h>
>>> +#include <linux/slab.h>
>>> +
>>> +struct pci_pwrctrl_upd720201_data {
>>> +    struct pci_pwrctrl ctx;
>>> +    struct regulator_bulk_data *supplies;
>>> +    int num_supplies;
>>> +};
>>> +
>>> +static void devm_pci_pwrctrl_upd720201_power_off(void *data)
>>> +{
>>> +    struct pci_pwrctrl_upd720201_data *upd720201 = data;
>>> +
>>> +    regulator_bulk_disable(upd720201->num_supplies, upd720201- 
>>> >supplies);
>>> +    regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
>>> +}
>>> +
>>> +static int pci_pwrctrl_upd720201_probe(struct platform_device *pdev)
>>> +{
>>> +    struct pci_pwrctrl_upd720201_data *upd720201;
>>> +    struct device *dev = &pdev->dev;
>>> +    int ret;
>>> +
>>> +    upd720201 = devm_kzalloc(dev, sizeof(*upd720201), GFP_KERNEL);
>>> +    if (!upd720201)
>>> +        return -ENOMEM;
>>> +
>>> +    ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
>>> +                    &upd720201->supplies);
>>> +    if (ret < 0) {
>>> +        dev_err_probe(dev, ret, "Failed to get upd720201 
>>> regulators\n");
>>> +        return ret;
>>> +    }
>>> +
>>> +    upd720201->num_supplies = ret;
>>> +    ret = regulator_bulk_enable(upd720201->num_supplies, upd720201- 
>>> >supplies);
>>> +    if (ret < 0) {
>>> +        dev_err_probe(dev, ret, "Failed to enable upd720201 
>>> regulators\n");
>>> +        regulator_bulk_free(upd720201->num_supplies, upd720201- 
>>> >supplies);
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret = devm_add_action_or_reset(dev, 
>>> devm_pci_pwrctrl_upd720201_power_off,
>>> +                       upd720201);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    pci_pwrctrl_init(&upd720201->ctx, dev);
>>> +
>>> +    ret = devm_pci_pwrctrl_device_set_ready(dev, &upd720201->ctx);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret, "Failed to register pwrctrl 
>>> driver\n");
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct of_device_id pci_pwrctrl_upd720201_of_match[] = {
>>> +    {
>>> +        .compatible = "pci1912,0014",
>>> +    },
>>> +    { }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, pci_pwrctrl_upd720201_of_match);
>>> +
>>> +static struct platform_driver pci_pwrctrl_upd720201_driver = {
>>> +    .driver = {
>>> +        .name = "pci-pwrctrl-upd720201",
>>> +        .of_match_table = pci_pwrctrl_upd720201_of_match,
>>> +    },
>>> +    .probe = pci_pwrctrl_upd720201_probe,
>>> +};
>>> +module_platform_driver(pci_pwrctrl_upd720201_driver);
>>> +
>>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>>> +MODULE_DESCRIPTION("PCI Power Control driver for UPD720201 USB3 Host 
>>> Controller");
>>> +MODULE_LICENSE("GPL");
>>>
>>> -- 
>>> 2.34.1
>>>
>>
> 
> 
> 

