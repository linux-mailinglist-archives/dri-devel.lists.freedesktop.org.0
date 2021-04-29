Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA2B36EE69
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 18:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8625D6F3E8;
	Thu, 29 Apr 2021 16:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13C86F3E3;
 Thu, 29 Apr 2021 16:53:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXk1MGQHjXHHMKkOrxfyT/Ydc2uvrsmME2soUy1CTYpBRjPIbJU74HEgosbgAAf9oQ+fDHX94M7CQNNxYprjxdb8euiPJma1odk3SwGpZ04i/803vnV20UM1jijgWVFLzyIZiS/IWDstcONp/rGggZbngnV8JJbD6ctWjF26sV6VBb6OyNZ9ZDrP8pgoFu0zrUd11GeX+ZUQ+kY2J4vANS5Abua3UMEvCRjhq9iOYWIixKGu1qOFptC68ZGtJCsPc/IuLFiMUnb/EG6hCQdEZwHAGKgXWfIdrCefDlRVVcjnAOo0CyZ72LmWAtBFQzje3JonXeORitNVqfOzuZLWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpHqKnirgNXhDdFzYnK1KvP47iLbjC8Uf+Z/wBROuvY=;
 b=GlFewf8HGO6wECrGgfh/63cmwWxUBV0Xnq4+4oq9mLJdL8vp5Qu/Na26ECe6ZHAl2XfJYzPfc0BX5Gx40IdRmRAte+dDhI/NwtnTwPg9tBZGTgjXVgbhUW8Dj0aU3dQ4B3Q5K1tgNOPXmfJBmsSrWL2mWlhlsPJ1l/fsjIoE7rYllEqWab+mAizqeX/Xnmc75/Nl9d9c9oLbmioOxc2kKH10nRwHtpG59lNoGYrW4qjw14PxxS3dZ162SPc2ICCt7diY9S30k4AP/GgVQDe4TUgUuYv66XjTPS4Fk/bviRnqSyHG0SsP47J5PzCAPY2VYIcBDNPyoVnGsdBbYxR/fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpHqKnirgNXhDdFzYnK1KvP47iLbjC8Uf+Z/wBROuvY=;
 b=OLg5jXAqL42CLn+B5PNMHp7uyznXiREqLTdA2PpeiCm/nrFr6SjAgG1c02ymeFzfj/5yYlHcNohxLZXjf57K3YvpV3ZBXHLupb0+cUvFUeo3g09nN22ytUdeMypeEDxVnVOQlUeXHxgEvFvnIoLWhCLPDOQ9qJthR0w3LwF+mII=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2847.namprd12.prod.outlook.com (2603:10b6:805:76::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Thu, 29 Apr
 2021 16:53:18 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 16:53:18 +0000
Subject: Re: [PATCH v5 08/27] PCI: add support for dev_groups to struct
 pci_device_driver
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20210428165318.GA239081@bjorn-Precision-5520>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <c315d0d0-6fd8-0510-99c6-dd72bd583c0a@amd.com>
Date: Thu, 29 Apr 2021 12:53:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210428165318.GA239081@bjorn-Precision-5520>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:497:888:9bb9:54f1]
X-ClientProxiedBy: YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::35) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:497:888:9bb9:54f1]
 (2607:fea8:3edf:49b0:497:888:9bb9:54f1) by
 YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Thu, 29 Apr 2021 16:53:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51db99fa-b40f-47b7-aa03-08d90b2f49f8
X-MS-TrafficTypeDiagnostic: SN6PR12MB2847:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB284769D7B829A88D5333D4DAEA5F9@SN6PR12MB2847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uH+FBmLZt+1xz+5kEPMXl/jQoVjj0RNQpwvgFP2BBaJJdorQrDaUOHsuOqO7b1kNMGcHC1Xvo2jYgGhmrpMuNAShrcYrvcH4Fu20mcRpgeIlvCxblugZ8pfu057HMW0opNsK3MdKsRPoM9fXhxc1t9k453DQJrjnd4Qe/IYVQXyLoU4suXe5pyf+5AoOvMPFHUx97wKKktsc5ftKMTVctISGeMxOFPLjcPaOvfnG1EOQYHdTEjk/xpe8hVUyXXzf/o8uO7KX+44WbQ9+x/SXlwT/Z789KaVfVRWVP08s5deADzzV37dJ0hHnUXgRo7cTb7B3Dd7RKmQBTV+tMT6ru5+GutxB3rcOc8N9V8yefubJL1wqOcoHq50h2vZM1GZEzTy9vZbSWCfKNFGSlsH3pmZ8RoF43uHYOVZ/R+rhbml7+YPiMGV0ZWJFoJmG0cJCVBz/8Qba2OazDb/a1Ql3lCiZ3EINx75SiGgwtTfInB3RGm0UJvCn/hkvxisaTAoQXkvI9O7AqVWgA7l3hOCuYQwbTKK3DVBEr3JcABxCOlOW2aiZcRlUQJozWzZ77yxk/cy/G4QnHCrht0Vc+DQKkeg93gOjlh/3K5k23tM9HuXlpZZebZCwC9UBNR8TODu/ZMCs+1MWuEhwSBibJha27FJ9Cj4PwRzFVKSjApXEpcE+TCsy5eJ8DOKkXbMnOohH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(2616005)(316002)(478600001)(66946007)(36756003)(8936002)(8676002)(66476007)(66556008)(44832011)(38100700002)(31686004)(86362001)(52116002)(6916009)(53546011)(5660300002)(4326008)(186003)(6486002)(31696002)(2906002)(16526019)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cUQ0L1Yya3BGNEIxTi9DbloyelJYUTl6d2o5bmxSTzRER2NlbERLbWdZMDg1?=
 =?utf-8?B?Y0h3QTZUeThYbWZIQkZOQUt1ZHpvMjBBMGlVWkgyMmZrM0pqSDNFRXRLdi8x?=
 =?utf-8?B?OVJEUVk0aSt2Uy84NlhzZkxudFV0R3huUmxlZVBFSCs1UklqL1F4NDZhZTR2?=
 =?utf-8?B?YXNYRmJETUtpcEFEd0Jid0VOMGZTaVBWZm5RLzNtYTJRRW50eUYzWnZldDlS?=
 =?utf-8?B?RFczbkNpTW1SN1N4VHVXemNYTHgrdk9lNnFkUjRGd1BNWkNWQ1U2U3AvSXJw?=
 =?utf-8?B?c29MT0tMSnhiNkpGZ2tSVTdCdzlkRzdIdzh5ZWZ5bHhqTUJEcXQ3aU5zck9C?=
 =?utf-8?B?T05zWVlNTmpNd0o1L1hLbGZPTDlwZFFtcjgvbk8yNUJoRDIzUXM3N0VRdGNF?=
 =?utf-8?B?SDl0U2ZuTUQ2TldMRHZWVWlZS3owUDFoVDRITFgxYTBuTW9Fc05xaFhwYVU2?=
 =?utf-8?B?bjNHOVpXMUpvSWRTMmtvTzJub3ZwQWdTTGNobHhnNThaZWdjb1p0cHNIbGJF?=
 =?utf-8?B?Y3laVUlDcTZJRE9aUzc2WkNRR2cyMlhzMFVWcHFhRklpOHVYdkhYL3I5dDhh?=
 =?utf-8?B?YStFWWdVVytaai9kZVZCcFhDTUJvREU5b1crNlorKzBHTlNLZHIzMXNpU0Jq?=
 =?utf-8?B?TW9DSnhlYXEzQ2hRT25lelpCamRKMGx0R3RsWUtENE1MbCsyVzN5RUd0ZjRF?=
 =?utf-8?B?cHJZbEdLbkNRZTFxS1c1OWR2dUdsQXFNNjVEWnVkZ3I5ZkppR1BjY001clRL?=
 =?utf-8?B?NHdLVmoxTDZnOFRYdUpRTkFhSmlrbHZ1NDRkbXZHZjdhRWtWekxQSCtCMGRt?=
 =?utf-8?B?dkxMRk1aWVpqYlJHaUlsTGU1amgvZE9wMkhlRGZRQTFoRzhoWmlGUlE4K3c5?=
 =?utf-8?B?TlB2K2pwcit3d0l1Ri9ac2UyWkpkUjN6dlordEo4MmtiOUVraVZyTU9IZ3Rr?=
 =?utf-8?B?RmVQckFaK1ZRUzF4QnFjSkNLbEs2WW1xTEFycVVucU1iR1lZaDd6L3NJSEZr?=
 =?utf-8?B?cDgydU91T3VXeXBYcmJqUnhTNzBKRng2K0xhN0pZbjBiT2RlTkpCZFMxd0RO?=
 =?utf-8?B?bXRBZWV1akJIOVhpYUhFMUlEUnZISndIUU9tWGFLSWpCTFNONDBZaFcxOGk1?=
 =?utf-8?B?WThzdnRhSGg4czZVZ0RUWlliQUM0bkUzamxKc2JMWjAzUnBhT3M3WVU2bVZG?=
 =?utf-8?B?T3hGcC9NWW9Gc3B1SVFUbGcxTDBPT3pWWkRacEtvSGVTKzkzRjRadXR1NjRv?=
 =?utf-8?B?MnFhcE4vTWw0Z1RVVXZqQnBYY0g0MWdNS2EzYmZhbXpXSjdRWXY2bzU5Yjht?=
 =?utf-8?B?dG5PQWk5ckU1NGp5WU5OSEVmSXJXdHNYYzJhREZncjVZQ0xoS2VvS0dGL3RW?=
 =?utf-8?B?eGNjRVpRSFlvcGJvMElZZDRpbDdLdkcrcE9xU1ZxOVhZaVVBbGVlemNES2lO?=
 =?utf-8?B?dThLeFpqbEhWdE51anorS3A3ZEhOZmc4dDZMRitvdStCanlSeFdDU1VqMWNO?=
 =?utf-8?B?WVEvc1FpdWJxSEZWd2RPWW5oUWlOa3cyZFVORThnVVRKRi9tUWJ3aWg4ZDFk?=
 =?utf-8?B?SFZvcnRkREcydUw0eW5BeTNMUFJEVld1QjF4SHRsYVZhZVM1b3ZlOWIrVGZE?=
 =?utf-8?B?am9Ga2h4VzBYYU1vTmxYcmV2OVJYMGFJUXJTZGxHYUpMa21IQXMxNE44MjA0?=
 =?utf-8?B?N2Vza2JoQllQOWlJVWVNQWJLTnE4K3BRaWRvcUVET3FtMU9zZzNSZHNQa2ZX?=
 =?utf-8?B?TitYekdlR05VM3pDVENsNkVlUWNnM1E0a25nUVkzaXcrUVpOOE42R1pOeGlz?=
 =?utf-8?B?L1IyMkhQT1Mra1grRXA0VExNKy9ESklvTGI2Umk2dlU0YWhYN1pXZWFKMTU2?=
 =?utf-8?Q?zQpF67LfTuQgj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51db99fa-b40f-47b7-aa03-08d90b2f49f8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 16:53:18.4925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1Mp8+jeSVYYGdr38cEDp4law4Uqmds9gTgxs83t6Tfi4SMFx7MYicn4wZgKbTUJPUbVJFd1xRmrrwLNQlcJsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2847
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
Cc: ckoenig.leichtzumerken@gmail.com, gregkh@linuxfoundation.org,
 daniel.vetter@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Alexander.Deucher@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-04-28 12:53 p.m., Bjorn Helgaas wrote:
> In subject:
> 
> s/PCI: add support/PCI: Add support/
> 
> to match convention ("git log --oneline drivers/pci/pci-driver.c" to
> learn this).
> 
> On Wed, Apr 28, 2021 at 11:11:48AM -0400, Andrey Grodzovsky wrote:
>> This is exact copy of 'USB: add support for dev_groups to
>> struct usb_device_driver' patch by Greg but just for
>> the PCI case.
> 
> Ideally this would be an imperative sentence telling us what the patch
> *does*, not just that it's a copy of something else.
> 
> I'd also like a brief comment about why this is useful, i.e., why you
> need this and what you're going to use it for.
> 
> The usual commit citation format is 7d9c1d2f7aca ("USB: add support
> for dev_groups to struct usb_device_driver") so it's easier to locate
> the commit.
> 
> I see there is also b71b283e3d6d ("USB: add support for dev_groups to
> struct usb_driver").  I don't know enough about USB to know whether
> 7d9c1d2f7aca or b71b283e3d6d is a closer analogue to what you're doing
> here, but I do see that struct usb_driver is far more common than
> struct usb_device_driver.
> 
> PCI has struct pci_driver, but doesn't have the concept of a struct
> pci_device_driver.

Since we don't have pci_device_driver then pci_driver is the best place
for it then, no ?

Andrey

> 
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> ---
>>   drivers/pci/pci-driver.c | 1 +
>>   include/linux/pci.h      | 3 +++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
>> index ec44a79e951a..3a72352aa5cf 100644
>> --- a/drivers/pci/pci-driver.c
>> +++ b/drivers/pci/pci-driver.c
>> @@ -1385,6 +1385,7 @@ int __pci_register_driver(struct pci_driver *drv, struct module *owner,
>>   	drv->driver.owner = owner;
>>   	drv->driver.mod_name = mod_name;
>>   	drv->driver.groups = drv->groups;
>> +	drv->driver.dev_groups = drv->dev_groups;
>>   
>>   	spin_lock_init(&drv->dynids.lock);
>>   	INIT_LIST_HEAD(&drv->dynids.list);
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index 86c799c97b77..b57755b03009 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -858,6 +858,8 @@ struct module;
>>    *		number of VFs to enable via sysfs "sriov_numvfs" file.
>>    * @err_handler: See Documentation/PCI/pci-error-recovery.rst
>>    * @groups:	Sysfs attribute groups.
>> + * @dev_groups: Attributes attached to the device that will be
>> + *              created once it is bound to the driver.
>>    * @driver:	Driver model structure.
>>    * @dynids:	List of dynamically added device IDs.
>>    */
>> @@ -873,6 +875,7 @@ struct pci_driver {
>>   	int  (*sriov_configure)(struct pci_dev *dev, int num_vfs); /* On PF */
>>   	const struct pci_error_handlers *err_handler;
>>   	const struct attribute_group **groups;
>> +	const struct attribute_group **dev_groups;
>>   	struct device_driver	driver;
>>   	struct pci_dynids	dynids;
>>   };
>> -- 
>> 2.25.1
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
