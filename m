Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F16E77790D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 15:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8561010E519;
	Thu, 10 Aug 2023 13:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9B1F310E519
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 13:05:47 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxRvGp4NRkJ64UAA--.44517S3;
 Thu, 10 Aug 2023 21:05:45 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxF82p4NRkgC9TAA--.8581S3; 
 Thu, 10 Aug 2023 21:05:45 +0800 (CST)
Message-ID: <a0d6277c-a4ad-38a5-bc6f-883513987547@loongson.cn>
Date: Thu, 10 Aug 2023 21:05:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 02/11] PCI: Add the pci_get_class_masked() helper
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
References: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
 <20230808223412.1743176-3-sui.jingfeng@linux.dev>
 <19dc4b81-5b72-247c-d459-3ea9d1cddff0@linux.intel.com>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <19dc4b81-5b72-247c-d459-3ea9d1cddff0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxF82p4NRkgC9TAA--.8581S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWrWUXF4xJFW7KF1UtrW7WrX_yoWruFy8pF
 W3Aay5KrW8KFy7Gr13Zw4xZFyfX392ya4rCr4Skw1Yk390yF9Yqr97WF15Ar1fArWDuF1U
 tw4UKryUWr1FqagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
 Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
 14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4s2-UUUUU
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/8/9 22:01, Ilpo Järvinen wrote:
> On Wed, 9 Aug 2023, Sui Jingfeng wrote:
>
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> Because there is no good way to get the mask member used to searching for
>> devices that conform to a specific PCI class code, an application needs to
>> process all PCI display devices can achieve its goal as follows:
> This is mixing old and new way in a single sentence (which is confusing)?


Thanks for reviewing, but I can't understand this sentence.
Are you telling me that my description have grammar problem or something else?


I means that before apply this patch, we don't have a function can be used
to get all PCI(e) devices in a system by matching against its the PCI base class code only,
while keep the Sub-Class code and the Programming Interface ignored.
By supply a mask as argument, such thing become possible.

If an application want to process all PCI display devices in the system,
then it can achieve its goal by calling pci_get_class_masked() function.


>> pdev = NULL;
>> do {
>> 	pdev = pci_get_class_masked(PCI_BASE_CLASS_DISPLAY << 16, 0xFF0000, pdev);
>> 	if (pdev)
>> 		do_something_for_pci_display_device(pdev);
>> } while (pdev);
>>
>> While previously, we just can not ignore Sub-Class code and the Programming
> cannot
>
>> Interface byte when do the searching.
> doing the search.


OK, will be fixed at the next version.


>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/pci/search.c | 30 ++++++++++++++++++++++++++++++
>>   include/linux/pci.h  |  7 +++++++
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/pci/search.c b/drivers/pci/search.c
>> index b4c138a6ec02..f1c15aea868b 100644
>> --- a/drivers/pci/search.c
>> +++ b/drivers/pci/search.c
>> @@ -334,6 +334,36 @@ struct pci_dev *pci_get_device(unsigned int vendor, unsigned int device,
>>   }
>>   EXPORT_SYMBOL(pci_get_device);
>>   
>> +/**
>> + * pci_get_class_masked - begin or continue searching for a PCI device by class and mask
>> + * @class: search for a PCI device with this class designation
>> + * @from: Previous PCI device found in search, or %NULL for new search.
>> + *
>> + * Iterates through the list of known PCI devices.  If a PCI device is
> No double spaces in kernel comments. Perhaps your editor might be adding
> them on reflow (might be configurable to not do that).
>
>> + * found with a matching @class, the reference count to the device is
>> + * incremented and a pointer to its device structure is returned.
>> + * Otherwise, %NULL is returned.
>> + * A new search is initiated by passing %NULL as the @from argument.
>> + * Otherwise if @from is not %NULL, searches continue from next device
>> + * on the global list.  The reference count for @from is always decremented
>> + * if it is not %NULL.
> Use kerneldoc's Return: section for describing return value.
>
>> + */
>> +struct pci_dev *pci_get_class_masked(unsigned int class, unsigned int mask,
>> +				     struct pci_dev *from)
>> +{
>> +	struct pci_device_id id = {
>> +		.vendor = PCI_ANY_ID,
>> +		.device = PCI_ANY_ID,
>> +		.subvendor = PCI_ANY_ID,
>> +		.subdevice = PCI_ANY_ID,
>> +		.class_mask = mask,
>> +		.class = class,
>> +	};
>> +
>> +	return pci_get_dev_by_id(&id, from);
>> +}
>> +EXPORT_SYMBOL(pci_get_class_masked);
>> +
>>   /**
>>    * pci_get_class - begin or continue searching for a PCI device by class
>>    * @class: search for a PCI device with this class designation
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index 0ff7500772e6..b20e7ba844bf 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -1180,6 +1180,9 @@ struct pci_dev *pci_get_slot(struct pci_bus *bus, unsigned int devfn);
>>   struct pci_dev *pci_get_domain_bus_and_slot(int domain, unsigned int bus,
>>   					    unsigned int devfn);
>>   struct pci_dev *pci_get_class(unsigned int class, struct pci_dev *from);
>> +struct pci_dev *pci_get_class_masked(unsigned int class, unsigned int mask,
>> +				     struct pci_dev *from);
>> +
>>   int pci_dev_present(const struct pci_device_id *ids);
>>   
>>   int pci_bus_read_config_byte(struct pci_bus *bus, unsigned int devfn,
>> @@ -1895,6 +1898,10 @@ static inline struct pci_dev *pci_get_class(unsigned int class,
>>   					    struct pci_dev *from)
>>   { return NULL; }
>>   
>> +static inline struct pci_dev *pci_get_class_masked(unsigned int class,
>> +						   unsigned int mask,
>> +						   struct pci_dev *from)
>> +{ return NULL; }
>>   
>>   static inline int pci_dev_present(const struct pci_device_id *ids)
>>   { return 0; }
>>

