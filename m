Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29659734AB9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 05:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB1910E18B;
	Mon, 19 Jun 2023 03:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D26810E18B;
 Mon, 19 Jun 2023 03:45:35 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:57978.1471128269
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 505FA10029B;
 Mon, 19 Jun 2023 11:45:30 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 7239e2ea64ab49028b0edbdbd8b976d0 for macro@orcam.me.uk; 
 Mon, 19 Jun 2023 11:45:32 CST
X-Transaction-ID: 7239e2ea64ab49028b0edbdbd8b976d0
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <c53476a4-fbc9-00e9-d47d-51a4ce5b9259@189.cn>
Date: Mon, 19 Jun 2023 11:45:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 2/8] PCI/VGA: Deal only with VGA class devices
Content-Language: en-US
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
References: <20230613030151.216625-1-15330273260@189.cn>
 <20230613030151.216625-3-15330273260@189.cn>
 <alpine.DEB.2.21.2306190339590.14084@angie.orcam.me.uk>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <alpine.DEB.2.21.2306190339590.14084@angie.orcam.me.uk>
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/19 11:02, Maciej W. Rozycki wrote:
> On Tue, 13 Jun 2023, Sui Jingfeng wrote:
>
>> Deal only with the VGA devcie(pdev->class == 0x0300), so replace the
>   Typo here: s/devcie/device/.
Thanks a lot,
>> pci_get_subsys() function with pci_get_class(). Filter the non-PCI display
>> device(pdev->class != 0x0300) out. There no need to process the non-display
>> PCI device.
>   I've only come across this patch series now.  Without diving into what
> this code actually does I have just one question as a matter of interest.
>
>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>> index c1bc6c983932..22a505e877dc 100644
>> --- a/drivers/pci/vgaarb.c
>> +++ b/drivers/pci/vgaarb.c
>> @@ -1500,7 +1496,9 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>>   	struct pci_dev *pdev = to_pci_dev(dev);
>>   	bool notify = false;
>>   
>> -	vgaarb_dbg(dev, "%s\n", __func__);
>> +	/* Only deal with VGA class devices */
>> +	if (pdev->class != PCI_CLASS_DISPLAY_VGA << 8)
>> +		return 0;
>   Hmm, shouldn't this also handle PCI_CLASS_NOT_DEFINED_VGA?

If your machine have only one such a VGA card, it probably don't hurt.

But, such a card will also get ignored originally (before applying this 
patch).

>   As far as I
> know it is the equivalent of PCI_CLASS_DISPLAY_VGA for PCI <= 2.0 devices
> that were implemented before the idea of PCI device classes has developed
> into its current form.

If multiple video card problems on your machine is matter,

then I think it do deserve another patch to clarify this issue and to 
explain the rationale.

>   I may have such a VGA device somewhere.
>
>    Maciej
