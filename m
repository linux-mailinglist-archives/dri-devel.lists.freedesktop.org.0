Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754369AB848
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 23:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB8B10E1C9;
	Tue, 22 Oct 2024 21:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.b="Lyf9eK+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A6410E0F6;
 Tue, 22 Oct 2024 21:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
 MIME-Version:Date:Message-ID:content-disposition;
 bh=TgerkKHU+W70hpEqn7HGkgopsgSDErck10sEePVgCrE=; b=Lyf9eK+YAptXwpU2UBsLWPfxIS
 OomHFA+kiegXoBLOLFcQAoinNu3dT3+zXqs6YATgrGGTnCz+V6IWBv5mDp6VvVBtxBlPOofGeqKjY
 UTJPvq1N83wdXkMBTkYBxQGDykN7USFbP1cuOfDsOFYoL7tf4KvLjV1fPCT9LVQGyZYZXnTzj7Pg4
 m6j46hyNl+Vtea6WmJ7pmaQgbwrzEbBtksswquyMxvdebtWZOK6meZI3mTR5mwW2zHSDtqhnCfX1K
 9SM4g7cn7zuhC0D2uaMiokjpmLylY/HjVptH1lJImVLv+LzkW8tY1ryXBfmevNV3O7nBiN0HMmPNK
 G9yUPYkQ==;
Received: from d104-157-31-28.abhsia.telus.net ([104.157.31.28]
 helo=[192.168.1.250]) by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <logang@deltatee.com>) id 1t3MDc-00FYLI-18;
 Tue, 22 Oct 2024 15:15:09 -0600
Message-ID: <26d7baf8-cfdc-4118-b423-5935128cc47f@deltatee.com>
Date: Tue, 22 Oct 2024 15:15:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Helgaas <helgaas@kernel.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
References: <20241022151616.GA879071@bhelgaas>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20241022151616.GA879071@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 104.157.31.28
X-SA-Exim-Rcpt-To: helgaas@kernel.org, vivek.kasireddy@intel.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 bhelgaas@google.com, linux-pci@vger.kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=4.0.0
Subject: Re: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
 of same device
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
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



On 2024-10-22 09:16, Bjorn Helgaas wrote:
> On Sun, Oct 20, 2024 at 10:21:29PM -0700, Vivek Kasireddy wrote:
>> Functions of the same PCI device (such as a PF and a VF) share the
>> same bus and have a common root port and typically, the PF provisions
>> resources for the VF. Therefore, they can be considered compatible
>> as far as P2P access is considered.
>>
>> Currently, although the distance (2) is correctly calculated for
>> functions of the same device, an ACS check failure prevents P2P DMA
>> access between them. Therefore, introduce a small function named
>> pci_devs_are_p2pdma_compatible() to determine if the provider and
>> client belong to the same device and facilitate P2P DMA between
>> them by not enforcing the ACS check.
>>
>> v2:
>> - Relax the enforcment of ACS check only for Intel GPU functions
>>   as they are P2PDMA compatible given the way the PF provisions
>>   the resources among multiple VFs.
> 
> I don't want version history in the commit log.  If the content is
> useful, just incorporate it here directly (without the version info),
> and put the version-to-version changelog below the "---".
> 
>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>> Cc: Logan Gunthorpe <logang@deltatee.com>
>> Cc: <linux-pci@vger.kernel.org>
>> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> ---
>>  drivers/pci/p2pdma.c | 17 +++++++++++++++--
>>  1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
>> index 4f47a13cb500..a230e661f939 100644
>> --- a/drivers/pci/p2pdma.c
>> +++ b/drivers/pci/p2pdma.c
>> @@ -535,6 +535,17 @@ static unsigned long map_types_idx(struct pci_dev *client)
>>  	return (pci_domain_nr(client->bus) << 16) | pci_dev_id(client);
>>  }
>>  
>> +static bool pci_devs_are_p2pdma_compatible(struct pci_dev *provider,
>> +					   struct pci_dev *client)
>> +{
>> +	if (provider->vendor == PCI_VENDOR_ID_INTEL) {
>> +		if (pci_is_vga(provider) && pci_is_vga(client))
>> +			return pci_physfn(provider) == pci_physfn(client);
>> +	}

I'd echo many of Bjorn's concerns. In addition, I think the name of the
pci_devs_are_p2pdma_compatible() isn't quite right. Specifically this is
dealing with PCI functions within a single device that are known to
allow P2P traffic. So I think the name should probably reflect that.

Thanks,

Logan
