Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268607A70B1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 04:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153DF10E2BF;
	Wed, 20 Sep 2023 02:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 57EB610E2BC;
 Wed, 20 Sep 2023 02:46:52 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Bx5fAXXQplAyIqAA--.15807S3;
 Wed, 20 Sep 2023 10:46:47 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxP90HXQplwS4MAA--.26420S3; 
 Wed, 20 Sep 2023 10:46:44 +0800 (CST)
Message-ID: <c505a778-bc37-93be-1ac1-c3d651ae1525@loongson.cn>
Date: Wed, 20 Sep 2023 10:46:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/5] Add the pci_get_base_class() helper and use it
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>
References: <20230825062714.6325-1-sui.jingfeng@linux.dev>
 <BL1PR12MB514444DF0C2E304A46DE0F4BF7E3A@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <BL1PR12MB514444DF0C2E304A46DE0F4BF7E3A@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxP90HXQplwS4MAA--.26420S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr45ZFW8ZF4rJr43KF4rWFX_yoW8ur4kpF
 43AF4YkF1kJrsrGr97Wrn3uF18G3ykXryrJr1v934I93s0vrnIqan7Cw4Du39IvrWY9a1q
 qrWIyr12g34YqagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
 Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
 14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j5xhLUUUUU=
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/8/25 21:18, Deucher, Alexander wrote:
> [Public]
>
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Sui
>> Jingfeng
>> Sent: Friday, August 25, 2023 2:27 AM
>> To: Bjorn Helgaas <bhelgaas@google.com>
>> Cc: alsa-devel@alsa-project.org; Sui Jingfeng <suijingfeng@loongson.cn>;
>> nouveau@lists.freedesktop.org; linux-kernel@vger.kernel.org; dri-
>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; linux-
>> pci@vger.kernel.org
>> Subject: [PATCH 0/5] Add the pci_get_base_class() helper and use it
>>
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> There is no function that can be used to get all PCI(e) devices in a system by
>> matching against its the PCI base class code only, while keep the sub-class code
>> and the programming interface ignored. Therefore, add the
>> pci_get_base_class() function to suit the need.
>>
>> For example, if an application want to process all PCI(e) display devices in a
>> system, it can achieve such goal by writing the code as following:
>>
>>      pdev = NULL;
>>      do {
>>          pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev);
>>          if (!pdev)
>>              break;
>>
>>          do_something_for_pci_display_device(pdev);
>>      } while (1);
>>
>> Sui Jingfeng (5):
>>    PCI: Add the pci_get_base_class() helper
>>    ALSA: hda/intel: Use pci_get_base_class() to reduce duplicated code
>>    drm/nouveau: Use pci_get_base_class() to reduce duplicated code
>>    drm/amdgpu: Use pci_get_base_class() to reduce duplicated code
>>    drm/radeon: Use pci_get_base_class() to reduce duplicated code
>>
> Series is:
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Thanks a lot.


What to do next then?

By the way, Bjorn, what's your opinion?
I'm ask because I don't know what to do next with this series.

As they belong to different system of Linux kernel,
the rest of patch (0002 ~ 0005) depend on the first one.

I think, merge the 0001-patch firstly, then wait it arrive at drm-misc, alsa branch.
Or, to do something else?

