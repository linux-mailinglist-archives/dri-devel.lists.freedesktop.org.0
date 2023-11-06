Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AEE7E2A33
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 17:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41F610E359;
	Mon,  6 Nov 2023 16:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C52310E359;
 Mon,  6 Nov 2023 16:46:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeoJ9olzQlbhAsrMagcxyjFfD1LGLLomDxHRD51B3dYwHh08Nz2mmt0GKI6CZ0avc1H9+bHb7ihsfTLKHO0dKngzOA9ZRcHPCsr9JZlRqeIvz/gqZNQc3wk79MJVkgzd8tvYrRcAzxomQq6RXn4QYnTm1qrsi9nWIiXfNfFsRy+xljUBTQLZhm+kOnRNru0r1WhKq8UpHnnBEQhbssM9fcDfYVIXe67STBRuu0Ou61YYi87jo/6zjEYxqIObgbuY/JEfcFnvsbXSZ8e47UG2QaRQJqAmm+VLdRO+/PAVemuv6Wi5FMNpEWq9JZ2v08TYbvGxqMTdpu++qEspKSxP9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4k4WZ/A1TYfkk0m2CIMNmMpw7PJw5qnrqUp5yr5hdsc=;
 b=XtfKtxPfe32qvCPXBnjhAwyQx+Ne0bTOyn6MLe9xl5vLQoQ7yB2BjJPqYKOgr+tWygSm80CklyMjtCpewd91OK2YFzsQTfNOT7uj8HlWOPfXlAcvuZ4c/nUQmUya3ZiPdzXEUr3Qq2hvuhTzN9aSZPHvPmp2KRDCPD8jgMIWAQqOM9RGNHRJqbNUd3LiN17QPsjtDO3g2VSAyW2TQH3m4Qs4q5K0RF0fpK1AcA54DZK+mvA7EdP+HQQ7yscCb75X3V9KoRHFxUM4Iuev3Hq2jECZij62qN6TcuuWlbLPD0g9IttMgiXnYhb+EaTPeeWFBkVFP8MJQ3IANZjz+RDPSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4k4WZ/A1TYfkk0m2CIMNmMpw7PJw5qnrqUp5yr5hdsc=;
 b=q31wrKnkD52mi6aRK6Izo3oPtqi5B+I2d30izX3sArhGuZ1Jbwgh88kcv/3eS5vBJcPXxTCH6hUlLmlMIXzwR093KFemxec5C/7Xlf5VN5e/zVOWwijPZTpI/rSkNAiQKbDnPFsGzLR30eHnAc6drX65LJcwluO9YJamRQsTHyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CO6PR12MB5459.namprd12.prod.outlook.com (2603:10b6:303:13b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 16:46:14 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 16:46:14 +0000
Message-ID: <00e4bd57-bcf4-4fb0-805a-61fbf6ef2587@amd.com>
Date: Mon, 6 Nov 2023 10:46:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] PCI: Drop pci_is_thunderbolt_attached()
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20231103190758.82911-1-mario.limonciello@amd.com>
 <20231103190758.82911-4-mario.limonciello@amd.com>
 <4747b7b8-ea48-4117-f746-a18dae97bc2@linux.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <4747b7b8-ea48-4117-f746-a18dae97bc2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0041.namprd04.prod.outlook.com
 (2603:10b6:806:120::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CO6PR12MB5459:EE_
X-MS-Office365-Filtering-Correlation-Id: f2fd8018-7f26-4b4f-4f23-08dbdee7e35f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CIeJEUaF7oSw8wrZDbdwbfM+FCJGvNUjm8ILjIFpNikla2R4QWbsA6fBiH4HmjRFoxr+1BQmZpfpKb9VuAqXEs2T9+kbVIzZxUEztrPllOn/FSU9ENC/Z4Iw2tBesacL1axybu0VQL7Xp8iiqUPrKXWTLLXJJVj0LXheMRFcOOgp+3IGhIsGzPovBUpcHUr4AIOuEf/E17mbM0KEtv5KZRYyDTTdvKNkMbUOBFufzlZRL5MdTCcGd/dXI70SdZCpUJxklC2r6qjC8Bw6m3+djEvwYCKKiAL+kmecT6hz8NdI5PVAHQ1E9YzQC8PUyZTJMPCMIUX4RkM1W5fatEEiRS9TM8flUArKSC2DgLM/q8TCCDP+3pPp+/seBNTWEk4PhfpXoZ4JVsfWyf5deCBgjadchXSY6d4OAO++INcQ1RsD1JzlD+D3FZsR+gK9uxuYgnhJ59bt3d3stl7MUd/6P+CQElo282MbZcR22Rx1d44flPtqbn4a3ZuctghRHGmI0H1iZD6lLdrXnhTeccSYcQguC46hqbrIVVTxoIJOIq3EeUK4UohIi3FXHa4sc97WHlJpmk29YSBa/duJb2IOQC6ynMPrsQqJTohglMssHlIUUY0yfgD+4hbSxa3t5eMm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(366004)(346002)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(86362001)(38100700002)(7416002)(5660300002)(41300700001)(2906002)(31696002)(36756003)(478600001)(83380400001)(31686004)(53546011)(6512007)(66946007)(26005)(2616005)(66556008)(316002)(6916009)(54906003)(66476007)(966005)(6486002)(44832011)(6666004)(6506007)(4326008)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHYyUDJ5MDRuTGgxOVA0TFFZSitMb05ua0pPVFpKbFhJbnY3d0hUeFNPb1FJ?=
 =?utf-8?B?NXNpYkVFZDVGbGx6S1JML3V1Sk1FY1BRTi9DdUl1clNYeHY2QUwwenhQL0po?=
 =?utf-8?B?UjlDdUlPZ3FDUU4yRit5RW9XY3ZFb0hsMGhaYW9vWWh0WUwxV24zSmQ4T2wy?=
 =?utf-8?B?aG5MZ0syNVVvdWxoaFFCclFhQjZha09iZFg4cENwMytDbFJiNWpLbU1lMU1W?=
 =?utf-8?B?U3dLaGZSSzVTQXptMHh2RjhSeTJSTnc1V21GVzBNVkc5WW1PbG9yTHFRbXRC?=
 =?utf-8?B?eGgzd3pXTUs3TXM4ZGFQVjQ4UUFQRmxqdTg5SG5xcytVMmh5aXdsWFNVMG4v?=
 =?utf-8?B?blhCaSs0a1A4bG1aVU5mSXRzMlplOUZxNFZFMWJXdWh3QXJIRFdRc1lIck1w?=
 =?utf-8?B?MGVpalJpa09aK3g3VWZybS81Nkt4aXhqM0ZtcXZmenl0QVoxbklSc3hIemNo?=
 =?utf-8?B?K21WSStQUm50Ykp1TExDdG9FUExUMitjZERkQ2RGU3oySXN1Z3pPU3Z5TkEw?=
 =?utf-8?B?SVFzSjB6bGt1YmFoc25qZytiTkJXcm5MYmFkRDRqd1l1bS9LOWhVMnFyS0d1?=
 =?utf-8?B?MEtnRnJTL1U3cFJKaThER1NHSzBnVzJSMTlPa3h3NFV0RkEzd2VQVWkvUjA4?=
 =?utf-8?B?WXgrcXdxVWE3dkZjRjB0bzdjSmpYTDFYdnZJVFNxL2VZZ21YL241SStNYThu?=
 =?utf-8?B?dUxpZnJVbGJpVkd0NWtxbFpUeGE4WjVLTGVIWTU2ZWVIQ2pPUUp2VXp5RzIy?=
 =?utf-8?B?NUNyQXdMcXdha3VZTmVxT1VpMEUvZWdiRDBxVUtFOWVuODlhT1R4ZWg5aFAz?=
 =?utf-8?B?VU81WHQvaEhlV2ZhYzBGZW1Vb2V0Vy82dHpLMVlkK21KQmpTVW1udzErTjc0?=
 =?utf-8?B?S1pQU2JPc3d1bXE1aXJNcHhPa1BLVzNxdWNJQ3B2cGhxS1k4TDhuM1c1dW02?=
 =?utf-8?B?MzdpdXlPRFhKYm8ySHVjc0RJQ0NxZ1NmOVdMS01YRHAvN2VYbmVXNnVyY3JY?=
 =?utf-8?B?WTNwTkRsaS85cGVaRldlZENiYk1xamV4Y2JOQkwxaDIwck4xK05LQ0NRa3pH?=
 =?utf-8?B?TTVEdkJZV2lCVmdXb054dEFZU3I5aktIS3BZUEFPSVg5U1NGNkpnVGxWeGYz?=
 =?utf-8?B?b25JcnlBK1I5THF2SkhTYVgwY0ZId3JGOWErSEpaWjM4emQ5RVp4bDJHMzhj?=
 =?utf-8?B?YjlNc29zUTBCSW5JUk5TTnY3c3IxRnN2ZVJPSFdTUmVEeEVFdklueHhaYWhN?=
 =?utf-8?B?TzBwL0ptN2pPSkVESW5kMHVWT2I4UE5pMk5rejVjbFdNd1FJRVYrMWhsZ2Rz?=
 =?utf-8?B?RHJsaVQxckQ4b2V3Wk8wZ2RGRG9DM1AxS2tDTUFYbGExdmx3K3VvOG0reDRt?=
 =?utf-8?B?ZW0wN2ZmQkk3a0NLbk5yaHNtVjRuTTViN0pTOVhYc2NsVk0zWWJvanMwVlBB?=
 =?utf-8?B?MENnZDBuekF6dFMrTXZlRE1RMVJmaW1ET0M2aUVpWUtmRkJqbStQWktKQ0ln?=
 =?utf-8?B?Ry9NeWQ2Q1luRGQzYW85TWFSMEpvd3BPM2RsRy9pdldJL3BwbzFsK3NtaGxD?=
 =?utf-8?B?R2p1VVFpYmY2bm56d1ZOYXFxbk5vVzA5bXAvVlNFWmdTNTVkaSthNWdsNnFW?=
 =?utf-8?B?cU9PdmgyZktsTnkxVUlGOU9rTTdGeUVDb2JTbEYxUmpIRTg5Rm44RUNnZW1z?=
 =?utf-8?B?UGtJVFdRVXBTVTJqV1F4QUFGanhtcHdTTVVWUGJiajNyR0F4VTV3elJzRDRa?=
 =?utf-8?B?cjNxTGxkdTY5ajJ4UDFnZlNnUWpzN3RNQnBmNnRWYjQ2SzZmbkN1WkZKRGNp?=
 =?utf-8?B?RHBwRTFreFFnV2NkYUFuN0xxU2lmWGFUNmNRdnJoT2wvQTVYRVdiNksyYlpy?=
 =?utf-8?B?ckQ4L0owTnJ5TzN6RzdPaGVRVm0yd2EyYnZkTDVZZjBENWR1S2ZjWkZoRzFw?=
 =?utf-8?B?REF5K1E4L01vWGNJQ29ST2tmVG1aMXlYZkU0V2xuMm50d2xRdXVIamFLUGZU?=
 =?utf-8?B?QWNTYWMxQ29GTklQa2QrazE0NXNpSVNvTkwwTnZUam93VTdkN2ZtOGFJdE5W?=
 =?utf-8?B?VnRZZWJaZllOdnlnTUR2NHIzWHFKWjgyQjZtZEIyUFlCNjVuWkh2UzlvalRE?=
 =?utf-8?Q?Fe33DM1ogHIVEDSu1gHXxcyfe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fd8018-7f26-4b4f-4f23-08dbdee7e35f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 16:46:14.2846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8ScKQKnTLwrn/ojGvrLtj7ItMW6VOssrrPvrwUKJuoVWTknF3jUHrwUMBvskyGOFpW5NKvchYGMePXFNy+hEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5459
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

On 11/6/2023 06:33, Ilpo Järvinen wrote:
> On Fri, 3 Nov 2023, Mario Limonciello wrote:
> 
>> All callers have switched to dev_is_removable() for detecting
>> hotpluggable PCIe devices.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   include/linux/pci.h | 22 ----------------------
>>   1 file changed, 22 deletions(-)
>>
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index b56417276042..530b0a360514 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -2616,28 +2616,6 @@ static inline bool pci_ari_enabled(struct pci_bus *bus)
>>   	return bus->self && bus->self->ari_enabled;
>>   }
>>   
>> -/**
>> - * pci_is_thunderbolt_attached - whether device is on a Thunderbolt daisy chain
>> - * @pdev: PCI device to check
>> - *
>> - * Walk upwards from @pdev and check for each encountered bridge if it's part
>> - * of a Thunderbolt controller.  Reaching the host bridge means @pdev is not
>> - * Thunderbolt-attached.  (But rather soldered to the mainboard usually.)
>> - */
>> -static inline bool pci_is_thunderbolt_attached(struct pci_dev *pdev)
>> -{
>> -	struct pci_dev *parent = pdev;
>> -
>> -	if (pdev->is_thunderbolt)
>> -		return true;
>> -
>> -	while ((parent = pci_upstream_bridge(parent)))
>> -		if (parent->is_thunderbolt)
>> -			return true;
>> -
>> -	return false;
>> -}
>> -
>>   #if defined(CONFIG_PCIEPORTBUS) || defined(CONFIG_EEH)
>>   void pci_uevent_ers(struct pci_dev *pdev, enum  pci_ers_result err_type);
>>   #endif
>>
> 
> I don't think all callers have been removed. Ah, lkp has caught the same
> problem.
> 

As I mentioned in the cover letter this series is done on 6.6 + a patch 
going into 6.7-rc1.  The LKP report will drop off when I rebase the 
series on 6.7-rc1.

As it's not yet in Linus' tree here is that patch so you can see it:

https://gitlab.freedesktop.org/agd5f/linux/-/commit/7b1c6263eaf4fd64ffe1cafdc504a42ee4bfbb33
