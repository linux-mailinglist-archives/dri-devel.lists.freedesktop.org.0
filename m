Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D36BD7E2A54
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 17:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD7C10E364;
	Mon,  6 Nov 2023 16:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D280F10E363;
 Mon,  6 Nov 2023 16:50:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxnBKfJDgZzMvpKtjRn0eTP0dKEeTdUVZ1lfw9w9RvLyy2+gBuyAaJ8tR1ydfZDE+KpwZ5sTi7KNpsCcJgnbXVFXY25nY9IsEHxLcO2P0hpaJQ6891EvwpX5m+08w6doGovO9HCllnnGBjonQKU4/t6qp8+voP/2r/+DB+p47zZ4YUF3DrG/6YKk+X8fDyaMYxzWSfVz9mn19WKeCX60rk4+K/5pfCR01xguxBmVTjz90+GMg0v97h1X1WtFNeVV1XvgrNF5P0aiOuVSB5j9Z0cTQB79c0tg0Uvbye4tJc30k0sFMyW6KiWZdIqmDsLVXx23knWoFHCuFevN/9ljvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2g/v3ryj8OmrbU3OjyYI41cO/bOduKizapb23euYQI=;
 b=Z4DU0+bAsm0Zex6t0FKDW3BCSCdIxXqeXjhW/IwAhTezjtIYlfoo5rVqIuyB8kVHNua7d42hOYtoFjYe2obHwf1vDyFZ+dS+mPV+iiBBOmCj39UGAc1wZilN+38hK+fE4RIyalnShtDiCF3e4fZEPwYrH5ur4Ns1ykvm+NDpBTyHX2wxe4/wl/y1ps9y7tVgf3Ow3LTa/3+axM/oTqWIrajIy47OC2IM3NNB9hjyGp5zGRib1ZeqkMzslGYJQKRce8mqBzCh85sR2peWR+m3InGgglXwjlxSYw9o0UfxIx3scJlLsQS3hbTPC8bJqXcBNEGzYm4+QN1O4Mk3Y07FWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2g/v3ryj8OmrbU3OjyYI41cO/bOduKizapb23euYQI=;
 b=K3/1uQNEry69lrhDY2lm/J/e5jBwWns1fZ8Skfd9ZRqQCflIdfCEe0nn6gDG9ydAAcGWFGoJvrILH6C4VGSb2rXblp+sC/eSqORiO0vdcAL/wAkJUd+zElw88cE8GNizmwHi2PzaZ1xA8fPSCCKNuIIqqQYxykmP4qVr3pn7jwM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH0PR12MB5218.namprd12.prod.outlook.com (2603:10b6:610:d1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 16:50:11 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 16:50:11 +0000
Message-ID: <c7259be5-f2e7-41d5-9078-f9074ccf71f7@amd.com>
Date: Mon, 6 Nov 2023 10:50:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] PCI: pciehp: Move check for is_thunderbolt into a
 quirk
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20231103190758.82911-1-mario.limonciello@amd.com>
 <20231103190758.82911-6-mario.limonciello@amd.com>
 <e0a74b28-e862-202e-328-9eca3cb622f@linux.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <e0a74b28-e862-202e-328-9eca3cb622f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0174.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH0PR12MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: c0eaeb23-5629-492a-626e-08dbdee870e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4gNsiHxP6OhiTZh4XuXLmlVTUNBn13h4geS0UUickmD6hlkj1gFuBXI+iDLsUWi8JWTgKbmhKOoNMMXzLvHdEGfzBqT+uPg6mtE1tXzkAZabjsy1k3aCkMZ/OJdlcUzWRY90ubRCg+UcjztAc57s++wh7zKiq14eHWJ42gYSo+w1TUyj0Qp5vQVliAnLqQeHTRvDd2XhpPwrOyZ9mHiLyeCsMstiuQ1eLVQ6qQw3JD23Uxwomfpxb9b9zFzjZtVcjp6THuwLBv2efXMXnHjoAOFASVLKeTuvC84k093eh42t+QnuZG4jaZVJKfqulfhCeD3mAX0cZhi0UJCkcFhrHST9ReX6LRKopXIJuca8vVzJ3Ed3sU+jwAqLQ6FaUzxHqLEz0OSw0wYSahitZOTEEMln9o4GJekfWGWuQrNIF/jgRPVyeI3OfqksL9CZJbzwFnzwDByeOZBTcHVzcGdT14lPoDIXF3W1OlMlwJfIX98VWJQXZ/NexbHSCXj1YsPGLfU6ybzVaunEQS1WCWZTaUXSmAFD71PmvjnukeOu/hALnH5D1NrnMk8qZhh7f31FylKlTyTKz8lRceg6Kzrn8pU4iiWzCr5fKHwf2HS54dAEnNPWo5t/vZdQYbWCONbkV65Id1b1CiQ4uQm4dEA3Kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(39860400002)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(31686004)(66476007)(66556008)(6506007)(6512007)(6666004)(53546011)(66946007)(478600001)(6486002)(36756003)(31696002)(86362001)(38100700002)(2616005)(83380400001)(26005)(4326008)(7416002)(8676002)(2906002)(6916009)(316002)(41300700001)(54906003)(5660300002)(8936002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2I1NXJON2pkMHRCaGhRWTRtSStiRVBaSmpqdjlHb3FQR2xSUi82Ry9TbUZI?=
 =?utf-8?B?MktiN1MvUXNMMi9RVFpGdXBabERxWnRBL010dzVnRkZKT1VPM0k1QmZTMWRy?=
 =?utf-8?B?TitnREM4NmJpQnJmaGQ5UndhNHN6Sm1IZkxlZW1TbHVPTENIOXNHV3NrYUhN?=
 =?utf-8?B?YlUybHJGRHl2dzZPeGdrQmd3WDl5aFhFVlVhWS9VOUVHbFdzeDFJVUdZQWJz?=
 =?utf-8?B?bW5ZZ21kdk05NER1RXVPUFB4VkF1aDN4eFhKZFlkbWxPT2NXRlE2MEtCNWgx?=
 =?utf-8?B?SklXMDY3bXB2ZWNodUs1MFhtb2V2VWlMZXBCOU1reFMxUkE3UHByZVM3V2M0?=
 =?utf-8?B?bFFoNmtEeFlwN1BzaVBYOU1nS3hMeDJxU1o1emFEZG45a2wrMmR0TWVNOFdn?=
 =?utf-8?B?Z0dzRE5DM0Y3VU5FdlBsVFZadStHcFhIdGo0SW1KLzBWOGVmbnJibFNlT2FL?=
 =?utf-8?B?MXIxazBrYmJJVng2M3p1VXFrVk5oNllvZWxtdlpwRitMN3hKU3dMYXk5SjBr?=
 =?utf-8?B?ZVNTS3NoSVZ2SWZaR2lOT1FVZ1VkK1RoK09LYncyZTVJblRjRmlvNmNMaE4y?=
 =?utf-8?B?T3VoL2VrRHR2K1VHc0lreUc4NVlIVTZiWEUxZXd2YmY4TlJJVkQrZHkrTHNr?=
 =?utf-8?B?WUJrcFhXcE4rd3l2bGJrKzUyeFBuVFlrU2xxNG83K2ZmQXNZempxZFd5V0RD?=
 =?utf-8?B?czZFVHk0VnZSc1F1aUdVV09DYXBjL3RianIrK1piM3BYbjh1L0hFdEtqczFC?=
 =?utf-8?B?bUU1Z1k1M1kzcGxjRlRaOTNnTnJyZG9YbHdaanFMUVFCQVV4N3lBSWNrQVVk?=
 =?utf-8?B?QVR1THN2emI5aUgxNWpDazlFc1BGT1ZhWk5SNi9DbHg5czRnY2ZGcVB6L1Ux?=
 =?utf-8?B?QmM2RW55bnd5KzhQNXBpTmJValpaaHdoM2hwU1hsVlgrLzVFdUk0ak9YbHl1?=
 =?utf-8?B?dDI2ajd0a2ZCdDhXWXV0SUZrYnRUSkdXeWsxSmRFY0s1Tzd2R0Y4YXB5bURL?=
 =?utf-8?B?UDdkOTlBZjIxUVRUckt4SFc2NzkreXBlbFBpQzVyQ05JSTFQVk5WbXhxZ2tr?=
 =?utf-8?B?citnV0NHanZGTjF6UDRMVEtNYnZKSHkwOTY3cS9nTnB1aTJhVVdMMlpWWFlS?=
 =?utf-8?B?K2dmL3V5VUdJVGN5eU1zbi9QUFBXQ21PeU44T2JiWTMzQi9xNWtrU3g4aTQ3?=
 =?utf-8?B?ME5tNWhyaVBGZ05YalV0dGxLMEgyRXBRdEVvMlRzMkgxZGd6NFIxd2xuRWh4?=
 =?utf-8?B?MTlKWEF2RVFUUDM0RE5vTTF1UWlSYVU0bzYvLzdQMVVaZmt6ZEdrRjl3UXJ1?=
 =?utf-8?B?Um44RHJNbklHS3NzZVh0Mk5JcG9qQmdrQmpOTWh6U0Jab2taaHZESlFSWVVU?=
 =?utf-8?B?ekxJL3RWd2ZkM2VPelZkYkpacEZ6NUlFdEVzaDh1OFA3Zk1mRzRSVzFHbm9p?=
 =?utf-8?B?dDR1MnM5UmNlRlNIcmRjYVpoM2lXWVZjS1lwOEVTNkVGVTNkbDYxZWhFd29H?=
 =?utf-8?B?bFR0NHlBTzR6U1BCWDVadW9LT3BTU3Nmd1FJRjdiZW4rY24zaHdyeVg0aUM5?=
 =?utf-8?B?STA5akZqczUrcEFBK2hZUllLTEdFT21VL1RoQ2FPVE1DUHYwOGc2UmMzUFdZ?=
 =?utf-8?B?cms1bTl1RHBUQVZoV1dLdkh3ditHRUh3aUxTdUNJaTM4S0FRY2Z3YnRvNWlV?=
 =?utf-8?B?eFRVV3JUOUJkUWFJV0FpdmhOWnp0VS8zY25lclZZd3dwaGM4eTRBTk5NM2da?=
 =?utf-8?B?cHNtdDNaWk4vVWJnbVRYSDViUTU0L1pJZ2UyYncxUnUrWWY1UmIzU3kxd0RC?=
 =?utf-8?B?ZTZWcmdxbkNSWFY1V2d4TVZ5eEVEZUxscWRSbUVLYWtqZXIwcnNhZzd4U0hM?=
 =?utf-8?B?MjJOMDFWU2Z4cnAzd0NRQ3FHcThJMHhiYjVqcGlLUHNvZVRGcVgrVWZnbzB5?=
 =?utf-8?B?eFA0UUtaSm1jeXEwaFBrU1JKTWgwOGRRS2N3N0VZak0wSUppeHNkNzZuUGFH?=
 =?utf-8?B?cFFZQnRTaFFEcW1lV1RYSHBpYVRKRW1zOU4zS1Q3YXpJbzVUNmtqTVQxWUI3?=
 =?utf-8?B?RStiM0RvWXlESmMyTkp0M2ZpK3hXV3JXWm96bGcrdFRVclVKdFVXb3h2QWxq?=
 =?utf-8?Q?4RUHWpudlfc6XYuhcBNqK4XZH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0eaeb23-5629-492a-626e-08dbdee870e8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 16:50:11.2421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ok9jpna+5jkqLpc8Uq99EMOUcd+F3gWUV1SxMKO3sVqEShrF7xvWANxvI3y/gFc8kB1Be8MohtNrXgMOwZmvFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5218
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
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Karol Herbst <kherbst@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/6/2023 06:41, Ilpo Järvinen wrote:
> On Fri, 3 Nov 2023, Mario Limonciello wrote:
> 
>> commit 493fb50e958c ("PCI: pciehp: Assume NoCompl+ for Thunderbolt
>> ports") added a check into pciehp code to explicitly set NoCompl+
>> for all Intel Thunderbolt controllers, including those that don't
>> need it.
>>
>> This overloaded the purpose of the `is_thunderbolt` member of
>> `struct pci_device` because that means that any controller that
>> identifies as thunderbolt would set NoCompl+ even if it doesn't
>> suffer this deficiency. As that commit helpfully specifies all the
>> controllers with the problem, move them into a PCI quirk.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/pci/hotplug/pciehp_hpc.c |  6 +-----
>>   drivers/pci/quirks.c             | 20 ++++++++++++++++++++
>>   include/linux/pci.h              |  1 +
>>   3 files changed, 22 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
>> index fd713abdfb9f..23a92d681d1c 100644
>> --- a/drivers/pci/hotplug/pciehp_hpc.c
>> +++ b/drivers/pci/hotplug/pciehp_hpc.c
>> @@ -991,11 +991,7 @@ struct controller *pcie_init(struct pcie_device *dev)
>>   	if (pdev->hotplug_user_indicators)
>>   		slot_cap &= ~(PCI_EXP_SLTCAP_AIP | PCI_EXP_SLTCAP_PIP);
>>   
>> -	/*
>> -	 * We assume no Thunderbolt controllers support Command Complete events,
>> -	 * but some controllers falsely claim they do.
>> -	 */
>> -	if (pdev->is_thunderbolt)
>> +	if (pdev->no_command_complete)
>>   		slot_cap |= PCI_EXP_SLTCAP_NCCS;
>>   
>>   	ctrl->slot_cap = slot_cap;
>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>> index eeec1d6f9023..4bbf6e33ca11 100644
>> --- a/drivers/pci/quirks.c
>> +++ b/drivers/pci/quirks.c
>> @@ -3807,6 +3807,26 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C
>>   DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PORT_RIDGE,
>>   			quirk_thunderbolt_hotplug_msi);
>>   
>> +/*
>> + * We assume no Thunderbolt controllers support Command Complete events,
>> + * but some controllers falsely claim they do.
> 
> IMO, this wording makes little sense with the new code. How about taking
> some text from the original commit's changelog:
> 
> /*
>   * Certain Thunderbolt 1 controllers falsely claim to support Command
>   * Completed events.
>   */
> 
> The code change looks fine.
> 

Ack, will change.
