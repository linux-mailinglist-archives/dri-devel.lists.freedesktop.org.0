Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0150F7E2A56
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 17:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA5A10E36D;
	Mon,  6 Nov 2023 16:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715E210E36D;
 Mon,  6 Nov 2023 16:51:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeLLMgrB/ICvNnk3z8HDDoOGBcGjGif398SYGX0/DjmJZBFDi+L/k+0QZwfAqXmKpDjN5n5+zrufslFGs75LAz5kCverTy00w0K9FVvFUA+y6tC8zmpOpuDig1jHMHpmNQ+iT+mjEN6YTWOT59+LBUNwzmabHDvzvndtCEi+aDxgKL2QDqVQ8ZdUg457yLIAK5SGSqbQU7V/3qJGSUpFhlydYPVcB0/2CZzEObA0ATm/rZYVFIWe/QACtSFwn9ue5oM24ZlyPr3iXGMw0MI6/xUXXD6KwW43zXLXES9AG3DU22dbJtq8+KLiVG/asrwcF+t4PV4jmnnR6Jwg+nVYCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWk4NTRdsQkktVYcPW5r8HeWmjO9SqnLuAq3NC4NwZc=;
 b=nvzS8onb4PTjpSrodlxKyrGrm77TyZeCSZMgYVO4lv1UR/W67374D8GFgb852AlMvZK/b9jx9p+YvsyH0/5IOdACd984C8HnACTeKHmXIoZFDWlpVFp9n8WsNRJSQ7V0ZQYlFPs9oxgrNErEr2SBop2wPHFESMOPzeRuYocUvwn65qE8qGpfWreMREQc3vxaKTu9bs4ByQrX2vU3IgmoVPr3yDptsB904RcFsIhXlnw+g7J/npuPyoHjsl1mvh4kiR/MTZ8r9cRSNj4DPrOUiRmUWnznwDbjetOz9TxByFsk9tHV3vZTrzapYhsvJBandV0xE76KQtJU6LlqIRF90Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWk4NTRdsQkktVYcPW5r8HeWmjO9SqnLuAq3NC4NwZc=;
 b=flidnZquQd3jqr/iCtvrlqbcrjRYRDsF/Kkbgm4pa7pQmGmb2IslYKMZz+8vwLlcD2c87lOjGdGN/Ec6CEwLRMVW2MeNyIlg+nqTREYPbX4nUO5FkTSjMmlsMf8U1EpYrkWL5d2L0WhvGjs0NPepj2F4JvPh8INS38aE78B7X4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB9097.namprd12.prod.outlook.com (2603:10b6:610:1a6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 16:51:03 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 16:51:03 +0000
Message-ID: <8ff0355a-7ed3-4f15-9ad7-350e6094f00f@amd.com>
Date: Mon, 6 Nov 2023 10:51:01 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] PCI: Exclude PCIe ports used for tunneling in
 pcie_bandwidth_available()
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20231103190758.82911-1-mario.limonciello@amd.com>
 <20231103190758.82911-9-mario.limonciello@amd.com>
 <bdae1a8-d62-6af6-316d-1e3a5ac15bc@linux.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <bdae1a8-d62-6af6-316d-1e3a5ac15bc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0174.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB9097:EE_
X-MS-Office365-Filtering-Correlation-Id: c8948ce1-9e7f-4c42-ec3c-08dbdee8901d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hv3qVkQykV5ALR+UtzfQ5V26kcMX2JnHy2jn8g/362OFAQFcayF9jvQifAvwlgW21odRhRbSQzg0eZVS9r2Shj9lzI8EOcdDEhLmfxjYMxcaxotYoG/mKoIXLV9X61FzfKPcdeC7D0VheymSOENxVg2NsVPx6PIoSXCpSfrz15iLXw4PrXBULYoCpEwA/ghb+pREZshcYhd7ulCuAnlgk6SSnj21RW1rx3unMEd12u/O95eGyxLpZLPciFrg6u2UJQ4oZxBWXi8LAUCAVhIeNO4OqZEsGB3H8cAfspDnUJkjwjcbE1wfyenFxH8z17Zm2XQl1LJ0LvCZffc5yI7VVbx90iHwWhdlNHRBrjblAL41Pac6/c+cpzSreNhLlOIuL9gCIBiYBWD3gsq6CwP0mByjGO6Us14MTcMGsHh0ZB152qKqIMxodEBEyb2jv5XoNpXZSBBwUHMhb2FlxgFg9laSljPbo3IX4r9gigGbmQq1ZA1WvFj2VidBG35auPHE/BSnG3SQZ2bqtVAuE16XWXxkVVwWVx68i9zMtxCyTYD1EH17uVUojHf63X0ucpfuqVhHw/Q0T0/AMghX5tdK8FUr3RBv2zi0Eq+nOZoAsS4R2kYXLCAkLzJ98VlSOo4c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(346002)(366004)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(38100700002)(7416002)(5660300002)(41300700001)(2906002)(86362001)(31696002)(36756003)(478600001)(66574015)(31686004)(53546011)(83380400001)(6512007)(66946007)(26005)(2616005)(316002)(6916009)(54906003)(66476007)(66556008)(966005)(44832011)(6486002)(6506007)(8936002)(4326008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2NaL2p1ek03c1hGSUNGZWU0cjg0eURBM3p5bFFlNXhTUnpkQ3BKalpiMWlX?=
 =?utf-8?B?bFdGZXl2MllpKzNJcmFueUczRUFkU2ZhdUU5RTdVbnJ5RWFZcS85NkYwL1dU?=
 =?utf-8?B?TWFJQ3Q0aktzbVRTSjBZRld2eUNHS0FVbDFDN254UjJNRnRsY1BFcjBxTzFX?=
 =?utf-8?B?VnM4K1JlUnhXbEltdWJSUm93bFA2VHBLK0VoUzQ4SWJyU3RjWWxQYUlqQ1Z5?=
 =?utf-8?B?TGNkUmd0Rkg2YlZlbXpBM2owUHF4YWtsWjBWYmxvZFNaVCt6NGJjYkdwajVD?=
 =?utf-8?B?em9Fa1pCaExZOVI2Q1BUQi9xMWtSQ2lxdWFKSm9FN3NPU2hFRktxUDJ2NkY3?=
 =?utf-8?B?WUlHdVBLWUc3QkM1YXN3Y1ZiK2plMkVxRzNrRDRkV1VqRXRvUXd1enpKaU1t?=
 =?utf-8?B?MWUrVzNSbUd5VGVMdzJaN3NlY2M5ZDFxN2VxZGZxemVJUmlQbDR0aUY1RkFV?=
 =?utf-8?B?RzluZkh2N29xVFlVR1hSU005L0VrdmZKS2RZU01INkZ1b0lyR1JYem1nTmdh?=
 =?utf-8?B?RVFSYzg0LzhvSE9ZUGV5N3lQZmcxVzJiY2VTSjNVSkFvcVhvdG5sZlJFZEMw?=
 =?utf-8?B?am9LQUorSmZTajRENE9zeUxvTE9rY2pncTd5NTVqMDBhakRJU3NSZEJDVFA2?=
 =?utf-8?B?NTBVZWRMVzB5Q080Z25GVHFwQjkzbW5HTFdnTGhhOGpBTFNSM256UW5LcFFX?=
 =?utf-8?B?bkV2NGhEa0NkZmRjN0RFQ2xrN2l1V2swK09zUHNWcEVHRERYUjNMaUdrZmpz?=
 =?utf-8?B?MGIxc3B3UUhPMFVPRGdJdXpzdDB6eXJsQWhjN0hKRU5qejIvbU1ncHBQZmF3?=
 =?utf-8?B?VEcvRDFXYUR4MGdJb041NVpzN0s4OGRsVDRhbmdaQnVXb2d0d3VBT2pkU1gy?=
 =?utf-8?B?Q0V0bzhSME4xVExUK3AvVGgzZHFyajB3dVlZVURVMHNiN1VEbjVmRkdPaVRt?=
 =?utf-8?B?QWpxckNvSTFRZnUvWWpFTWVqUGlBbmlwUDZhSjA4NVIyYnY1d0llbGdLQ0Jq?=
 =?utf-8?B?ZWI3K3N3TmVqOTNLd21xVFNiMWJ0UXZNZkZRZGdpVEhpc3FYS1ZhMm1GbGJm?=
 =?utf-8?B?NnhsRTJuaFRBUFVxQW5obTQ0SXFNMWNlcndlYmhKbWpUamdLTGdXbFdzRzVY?=
 =?utf-8?B?dzJpblpIeUJrVHhkdGlQandQTE9ZOEZMMXhKTUtmK09NN3YvZkJhaDlTbFNU?=
 =?utf-8?B?eG5ScUtoc1QwMHpPQVFrQWgwZ0NSMzI5UHdLelRpbUNWTnhBYmtEbC9wZDdq?=
 =?utf-8?B?d3IyN2NkOCtyaEFSMjVUUVBtWTZ3ZllUby9UOHcwcllzY3RHdFhWYVNhem5L?=
 =?utf-8?B?T29XakRYTXZHek1jSmNsTFNqcmlFTG5TUDNobzd0YUl2SDQvZGFiSkpxd0RB?=
 =?utf-8?B?WkgvRExwRm1nWVQ1SkhZNVNhajgxdEVnSEN3L1lxY0l5SlBYSE1HUjNpbXNI?=
 =?utf-8?B?NVc5NG1XMktFampwcGRleC96RXh2TGNnTjVZdnc3d3RJei8vQ2dXTXJzcVdz?=
 =?utf-8?B?N0tGVEo5R3RIaDZNVHV1eXRZQ1BJajM3bUg0NHBtRVVKdXlMaDRmTVdVWVV6?=
 =?utf-8?B?TWEvRDU4emVkV1duNUlaWkl2SWppTFlaV2FUcFNRU3UwbmJ6NldqQnVTSzRy?=
 =?utf-8?B?RGxHblY4cFB0TnZ2SGJ5UllTV2tuNUlwVzZNdmpZMGlWbVN4UzArajQ3bmgz?=
 =?utf-8?B?VU94U2QvU0Iwc2xCVlF3OUhXUDZNUUxGNjBOTVk4VXJUR0Z2RkhsdEdiM2xq?=
 =?utf-8?B?TGVHQlZGQ2VXaTVYSjBnTnhnOXAvYkxMaFdiaDFZZEtSQnJFYnpNVlFLMEtL?=
 =?utf-8?B?NThrcU9NTmxjdDVyV0dkYjZiT01kU3JOZnFzUyt3OXUrdHk3WFlFOTJNSEY3?=
 =?utf-8?B?aUlocWRRVVJSNEtBRFBSRGdOcHJ0NjhCWkFla1FZZGQ5YUZCQ0pJT1FiVVNM?=
 =?utf-8?B?dExxNkxIcWJCTm1SZHh3TlFMbTJEQ3Z5SUFpK2NIZUFMbWhOY0JCaCs1aEFk?=
 =?utf-8?B?Ums4T0FjZDNSSE8yQTcyL1pmdmRjdmtpZndxUFAzQldwN0tCTC9KSFd5U0th?=
 =?utf-8?B?dWxhQVZwTFRob1lTVWNPcTU4UEEvNUowalB1MjhmOXpQSEFkcHhya1lDczF0?=
 =?utf-8?Q?0zH3+kokVdB+LOu2Vt65e5Pqc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8948ce1-9e7f-4c42-ec3c-08dbdee8901d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 16:51:03.6565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwV6QNIwJZ4KgOgaLK8nDw78hJkxtgjej0WzJiyjY5jnvTrnQ86ZYOVTFhcOP/qwLHdji7YgfYkJKTlNMibhmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9097
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

On 11/6/2023 06:52, Ilpo Järvinen wrote:
> On Fri, 3 Nov 2023, Mario Limonciello wrote:
> 
>> The USB4 spec specifies that PCIe ports that are used for tunneling
>> PCIe traffic over USB4 fabric will be hardcoded to advertise 2.5GT/s and
>> behave as a PCIe Gen1 device. The actual performance of these ports is
>> controlled by the fabric implementation.
>>
>> Downstream drivers such as amdgpu which utilize pcie_bandwidth_available()
>> to program the device will always find the PCIe ports used for
>> tunneling as a limiting factor potentially leading to incorrect
>> performance decisions.
>>
>> To prevent problems in downstream drivers check explicitly for ports
>> being used for PCIe tunneling and skip them when looking for bandwidth
>> limitations of the hierarchy. If the only device connected is a root port
>> used for tunneling then report that device.
>>
>> Downstream drivers could make this change on their own but then they
>> wouldn't be able to detect other potential speed bottlenecks from the
>> hierarchy without duplicating pcie_bandwidth_available() logic.
>>
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2925#note_2145860
>> Link: https://www.usb.org/document-library/usb4r-specification-v20
>>        USB4 V2 with Errata and ECN through June 2023
>>        Section 11.2.1
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/pci/pci.c | 74 +++++++++++++++++++++++++++++++----------------
>>   1 file changed, 49 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>> index d9aa5a39f585..15e37164ce56 100644
>> --- a/drivers/pci/pci.c
>> +++ b/drivers/pci/pci.c
>> @@ -6223,6 +6223,35 @@ int pcie_set_mps(struct pci_dev *dev, int mps)
>>   }
>>   EXPORT_SYMBOL(pcie_set_mps);
>>   
>> +static u32 pcie_calc_bw_limits(struct pci_dev *dev, u32 bw,
>> +			       struct pci_dev **limiting_dev,
>> +			       enum pci_bus_speed *speed,
>> +			       enum pcie_link_width *width)
>> +{
>> +	enum pcie_link_width next_width;
>> +	enum pci_bus_speed next_speed;
>> +	u32 next_bw;
>> +	u16 lnksta;
>> +
>> +	pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
>> +	next_speed = pcie_link_speed[lnksta & PCI_EXP_LNKSTA_CLS];
>> +	next_width = (lnksta & PCI_EXP_LNKSTA_NLW) >> PCI_EXP_LNKSTA_NLW_SHIFT;
>> +	next_bw = next_width * PCIE_SPEED2MBS_ENC(next_speed);
>> +
>> +	/* Check if current device limits the total bandwidth */
>> +	if (!bw || next_bw <= bw) {
>> +		bw = next_bw;
>> +		if (limiting_dev)
>> +			*limiting_dev = dev;
>> +		if (speed)
>> +			*speed = next_speed;
>> +		if (width)
>> +			*width = next_width;
>> +	}
>> +
>> +	return bw;
>> +}
>> +
>>   /**
>>    * pcie_bandwidth_available - determine minimum link settings of a PCIe
>>    *			      device and its bandwidth limitation
>> @@ -6236,47 +6265,42 @@ EXPORT_SYMBOL(pcie_set_mps);
>>    * limiting_dev, speed, and width pointers are supplied) information about
>>    * that point.  The bandwidth returned is in Mb/s, i.e., megabits/second of
>>    * raw bandwidth.
>> + *
>> + * This excludes the bandwidth calculation that has been returned from a
>> + * PCIe device used for transmitting tunneled PCIe traffic over a Thunderbolt
>> + * or USB4 link that is part of larger hierarchy. The calculation is excluded
>> + * because the USB4 specification specifies that the max speed returned from
>> + * PCIe configuration registers for the tunneling link is always PCI 1x 2.5 GT/s.
>> + * When only tunneled devices are present, the bandwidth returned is the
>> + * bandwidth available from the first tunneled device.
>>    */
>>   u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev **limiting_dev,
>>   			     enum pci_bus_speed *speed,
>>   			     enum pcie_link_width *width)
>>   {
>> -	u16 lnksta;
>> -	enum pci_bus_speed next_speed;
>> -	enum pcie_link_width next_width;
>> -	u32 bw, next_bw;
>> +	struct pci_dev *tdev = NULL;
>> +	u32 bw = 0;
>>   
>>   	if (speed)
>>   		*speed = PCI_SPEED_UNKNOWN;
>>   	if (width)
>>   		*width = PCIE_LNK_WIDTH_UNKNOWN;
>>   
>> -	bw = 0;
>> -
>>   	while (dev) {
>> -		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
>> -
>> -		next_speed = pcie_link_speed[lnksta & PCI_EXP_LNKSTA_CLS];
>> -		next_width = (lnksta & PCI_EXP_LNKSTA_NLW) >>
>> -			PCI_EXP_LNKSTA_NLW_SHIFT;
>> -
>> -		next_bw = next_width * PCIE_SPEED2MBS_ENC(next_speed);
>> -
>> -		/* Check if current device limits the total bandwidth */
>> -		if (!bw || next_bw <= bw) {
>> -			bw = next_bw;
>> -
>> -			if (limiting_dev)
>> -				*limiting_dev = dev;
>> -			if (speed)
>> -				*speed = next_speed;
>> -			if (width)
>> -				*width = next_width;
>> +		if (dev->is_tunneled) {
>> +			if (!tdev)
>> +				tdev = dev;
>> +			goto skip;
>>   		}
>> -
>> +		bw = pcie_calc_bw_limits(dev, bw, limiting_dev, speed, width);
>> +skip:
>>   		dev = pci_upstream_bridge(dev);
>>   	}
>>   
>> +	/* If nothing "faster" found on link, limit to first tunneled device */
>> +	if (tdev && !bw)
>> +		bw = pcie_calc_bw_limits(tdev, bw, limiting_dev, speed, width);
>> +
>>   	return bw;
>>   }
>>   EXPORT_SYMBOL(pcie_bandwidth_available);
>>
> 
> This patch should be split into two, where one just moves the code to the
> new function.

Good idea, thanks.

> 
> Also note that this will conflict with the FIELD_GET() changes (try to
> not reintroduce non-FIELD_GET() code when you rebase this on top of
> v6.7-rc1 :-)).
> 

Sure, will adjust for that when it's rebased to 6.7-rc1.
