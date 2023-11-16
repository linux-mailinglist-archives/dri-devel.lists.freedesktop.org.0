Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF697EDAD0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 05:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0BA10E121;
	Thu, 16 Nov 2023 04:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134A910E056;
 Thu, 16 Nov 2023 04:34:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1VfOEQRTKkZMgOfXo9lqAIYOmK1HgUp4Mxf+eSZb+q9JEvVXjWF770u79VNl8f/m4EeSI5ueX8+wp7fyq4PqGibMQg+PWu4jm6b73tlhyw313gAZCT+1xjlmCy+1QW/O4g5h4IxzxkywgjZQEwnDAXuCdgvW++n5Q2xxv8eHllMvLYuhRevp/eCFAO2BZ2ZTJg80tQGf/O7qEwK0/jQgOMXvBqP3TUYVwFiAh+UriqXa3Qm0D0wrEBgS1tv70vIlj+Mwfa26DXcbwZrZtsdVqRUE8QO47AwhEbaS0D4kgncOJI2VQuCc8d3zy2w+bMJp+hQq71mY2Yb0s73yAW5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPX9Y3DDSPe4Dkmf3EwQ714i3oyO+ArRVD8DwL6RTRU=;
 b=JMfwyiJi/5BLkQlEEoPUf/gVmwbCiq4XgKgeMVv4MPTmnHyVhXe7FIjZdx54vVcVTRJc4AwdCZMLc07P6fpI9QDJsQlNPcXq0K6U4MZs1vAerc08XkP0OxSNHu51mE39nhOeg7cx8UXFNniYTfRAxJ9LSPeKtSNrTpIrie1kdJkjC7E93LyzhfX7/tv9IF8gUgEPPdBuJqaYsi8PhIA4Q2v/1ZW5yNA1Plz8X+gFr9DPK8Pt8HbU+2H6n1kvt7n4OpzSSK8TyeM7BdMPAUSphALitDH045wAk6i/H/mqu2XscyjNwQH73mSV4NwXLBDk8SQYdddPg7OOAS86na8zMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPX9Y3DDSPe4Dkmf3EwQ714i3oyO+ArRVD8DwL6RTRU=;
 b=kcfzk6zLM8EDO/LBolXZTWDZrXw2X8fxhHbxRYnpZLJfBOlJSXEd75tuoHV72C+h1Sz4RgWyOfcfpdx5LlTfK2e4CYpgPaOg0FvfsuRgKdR0UIE40Su6i6dth+0kceAEWhu1yKPZ26YZBtdxLpI3/0X3mCwYMRehIednQrBmcus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by MN6PR12MB8541.namprd12.prod.outlook.com (2603:10b6:208:47a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 04:33:58 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::c258:1e94:a85b:1510]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::c258:1e94:a85b:1510%4]) with mapi id 15.20.6977.033; Thu, 16 Nov 2023
 04:33:58 +0000
Message-ID: <ed07b850-8924-29b5-895c-331e3093d8a2@amd.com>
Date: Thu, 16 Nov 2023 10:03:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v3 7/7] PCI: Exclude PCIe ports used for virtual links in
 pcie_bandwidth_available()
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>
References: <20231114200755.14911-1-mario.limonciello@amd.com>
 <20231114200755.14911-8-mario.limonciello@amd.com>
 <e0e76948-a0a8-b6c2-163b-1d00afb6650c@amd.com>
 <5356bcbd-0785-4156-993c-338fed67d39d@amd.com>
 <d7539754-1877-43ed-a1b4-f969315ec271@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <d7539754-1877-43ed-a1b4-f969315ec271@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::20) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|MN6PR12MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac6499f-87fb-4c64-c4bc-08dbe65d3f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LOiyDkmUOkb50OJqFQJ/i5aIGVmSNJUztWYRt5rT2BNtnJbq8SqakH7iDPDfAlurwuw/Jd0AElvuK0jET1caazjytTDjhFxyADCEjFLfbuHuvcXquY04KK18yslVuSmkW8fafV6D4stePfWGdUofvxslpj4EGrLaWD06visIIk9LUfJjyxLpxX2w9FiSNPRPL0mr8gCOlYY3fZjVRV4W2QbS4gvqQDV+554bNfJinHebGX1121y4pB4Sw341+7zhnCpepaSi9xp09GHIbcAzGKCykRv1QZsKpflYB2yKTSWWfG0pArtBcrKfOqYW7JTXgX/LhUvodWq/SYfeT8J/vHMbDbcbvtW0diNnU9ayrgckxZvi6rlknxf11hulRRZACEZC6fWzCSA3sf6FTWLN5cvn5pqzraHexwjfrJ2ISssMvjh1gp4LAA+wq4CKMgBeTWaRCNPAhhvoS9aYoipPhHv/0UOhq+FS6GebQsTHUFM0+BNIPO5Bj5+7aj7689oq1zzkVR8oHVSMmYKpkegr2nLTAOUm0Qzsz/sAnBwOnQ37NATZWICscqm9eNIgm8o966jIqIGQhAHl8x/hLTHFA+gUpMjZmN880+oq8lqPaKyZccTOTmSzs8hJM6hlnJnj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(136003)(346002)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(54906003)(316002)(86362001)(6512007)(53546011)(6486002)(6506007)(66476007)(966005)(478600001)(31686004)(31696002)(36756003)(5660300002)(2616005)(7416002)(8936002)(110136005)(66946007)(4326008)(6666004)(66556008)(8676002)(26005)(83380400001)(41300700001)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0JaT1RoYUhwYVhiNkpYbWtTdTFodG9VU3d4czRTZ3FZeEtqMHFMaHozUDJM?=
 =?utf-8?B?OFk2OEhzVTRxVnIvckV6Vk0rMUFtcENzZENUOE1DR0xKNjhWVWZPbnBnb2Vn?=
 =?utf-8?B?eTB6OUczOVc0V2dtWGJoSTdWNkx4NnhSdXdTRXVIelo3cU5yOHlESUFEQ2Uw?=
 =?utf-8?B?SHFkZkZ0clpuSEpJNkpnRTRDMGNia2Y1RTQ1R2ltRjY2T3UxZDVlblZNYytu?=
 =?utf-8?B?MnkrQlEvL3Y1WUN0OXpDcnZ5dExJQS9iTzZwdTB3T1JGNHVvK0ltTGE5MlNs?=
 =?utf-8?B?ZVdPNEQ5WXNmQTY5dUd6bVZaUFBWQ3RnMXdYMFZMVVBxdCthanZFM3M4Ky9n?=
 =?utf-8?B?emI3NHlNZEhtMWZGdkpIOTQreWZMcmRYWHdFd1hNUTJWWnV6V0RLNHVtWHc5?=
 =?utf-8?B?V1dqY0k3clhRbDZ5NWpvd040Z05yMmVxdkpLMXBlaEdPYzBWMEZ1bG1HcmV5?=
 =?utf-8?B?TlFNdEVaSGVCamJJcTdtb3U5Tmw1WHE2YXdMZ0U1L2plWHVid0gyR3ZRRFR5?=
 =?utf-8?B?S0x6bWdORU5UdUI1N0VzTmlpZHJYa2dFald1M25QcjF1bldYQzErQmhWUHZh?=
 =?utf-8?B?U0JJcmRiT0VDWVdlQkc5Y1U0aFdzZUJYQXFoZjBVOUZyL3IySHlEWU82LzlJ?=
 =?utf-8?B?eitrSUhxcWZteFRxQklvd2V4Vm9oUDNITlE4S2MxRGowN3p1ODVhN2U4QUMv?=
 =?utf-8?B?L1llQSttdkRrZlQ3dlF1TkowSzdQb0VSZHYvWHdnVnVDUkp0MW1lQjJQZ3NQ?=
 =?utf-8?B?Z2FNVG9TMWJxSzVsazM1d3pvM2pvRXJ1MHBXYkpyMFdENWYxZWx3a0o2Rk0y?=
 =?utf-8?B?SUgvMzBtaWJXN2FkMWh4bCs2NWN6QWw4aFFCdjhrN2FhR0prOWFaOTE1V0pX?=
 =?utf-8?B?M25Yd2FBYlg3OWlIaE9zR2RSWStLUHVqZHZLeURUWjluTzlybzdDSmZhWkVu?=
 =?utf-8?B?dXdLY2JEVHhnK0Z5R2tPeXc3V3Bac3kwcnlRc1p1eEpHVFdHWXZiRUJodGRu?=
 =?utf-8?B?VlpjZlVpRnVoaWdhbnFLd0dtMUdROUZDRjMxcG54aHRWQlBLVFZsdW1aRDc0?=
 =?utf-8?B?c1QrbnBCTEQyK0lPVW00b1U2VVlyYjNad29Zb29PeGdER1BnTjhzWHdjV25O?=
 =?utf-8?B?RDFudWNSWnNBbXowRGNERUNoUkZVV3R2NkE3NXNnSXI4Uy84MUhVT25zK1Ju?=
 =?utf-8?B?a1FDSVk2U2U3dVVIWndscFVNZXltay9KdW1Jd3pkRGJBOGNXVklvSzczSlY2?=
 =?utf-8?B?VVg4VUExOCtWTVVMUU1UR0NKUW1KUUtCemVIa21Hc0N4YzRNOGR0ZzlrNzhX?=
 =?utf-8?B?NnhOdUtrb2YzcVlUUmlMRFJGVjRsb2lVVGU5cHRXOThHUVczR3BPTlIwL1Rm?=
 =?utf-8?B?ajFMNmRtQi9sbXZlRUdrYU5uZHRsaGQzUEpKVEtYODJrQlZadkNRcFZvZVR5?=
 =?utf-8?B?NHlRUmUzdUEranliMExhU3ZhZ0NlQUVxUm1kT1ovbnZ1Y2UrQ25XNjcyZWc5?=
 =?utf-8?B?a1ZQVWlSMnBFK1FBQWRQNXVLNDZJdkt3dWNuMUc1NXVlSEtFNGdiZ3E5SDFv?=
 =?utf-8?B?WXFYM0dUZ2c4Q1piOXFRcFY3WU9JVEtiRGtNT1JsbVFBMmxjaXRHa0RGOWlK?=
 =?utf-8?B?cFBic3Q3YUd0RFpsZXFxMzUrbFJjejBRcXBDWXdaaFVNK1oralhIZEdkNTB3?=
 =?utf-8?B?MnJadG1VcC85TitaZXZnQUlLTWVPb1VBcmFMZ0w4aFZTWEJ0emw5NWYxclhI?=
 =?utf-8?B?eFlMVDM0NlA4d0kzcFBjZVBSZG5sY1BzUUF6WWZGY1BuSkgvMGp5MVRTSU9S?=
 =?utf-8?B?bHllQWgxcS9lTmtJOEMyTEFnemZKcHAxWk9sM0JtSGk3ZlByOGpGb0ZEVWRx?=
 =?utf-8?B?d1NFR0dPSjc2MTJYOS9seTNrdVBqeVFLNkx6TE1oVUp5ZmNoYVRGMlNuK3hx?=
 =?utf-8?B?MHJUMkpZUXZUTk1meGRxeEZtNkl3WDBrZzQ5QnpwYThuSi9hRmdleTAxcVFq?=
 =?utf-8?B?S3ZzZUd3NE5MakNFeVBRNkZodmtxbXZtVDh5blFaNFVkMm1IOE5zVW1yeUdW?=
 =?utf-8?B?a1JpYWtUd1JNOHRoMkpWdERHclN3bnRWUGJyWU5YUnBYTGVieXdyYWhDOFJv?=
 =?utf-8?Q?rXnvbdox0de6Bmg8tJ99Y3Gia?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac6499f-87fb-4c64-c4bc-08dbe65d3f25
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 04:33:57.2946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUHmYuf2zfmK7EzTtP9eoDRbqO2nu3jL4qUcUC/HqARatlnO0706oTFjcBKI6X3h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8541
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
Cc: =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Xinhui Pan <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Manivannan Sadhasivam <mani@kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/16/2023 2:39 AM, Mario Limonciello wrote:
> On 11/15/2023 11:04, Mario Limonciello wrote:
>> On 11/14/2023 21:23, Lazar, Lijo wrote:
>>>
>>>
>>> On 11/15/2023 1:37 AM, Mario Limonciello wrote:
>>>> The USB4 spec specifies that PCIe ports that are used for tunneling
>>>> PCIe traffic over USB4 fabric will be hardcoded to advertise 2.5GT/s 
>>>> and
>>>> behave as a PCIe Gen1 device. The actual performance of these ports is
>>>> controlled by the fabric implementation.
>>>>
>>>> Callers for pcie_bandwidth_available() will always find the PCIe ports
>>>> used for tunneling as a limiting factor potentially leading to 
>>>> incorrect
>>>> performance decisions.
>>>>
>>>> To prevent such problems check explicitly for ports that are marked as
>>>> virtual links or as thunderbolt controllers and skip them when looking
>>>> for bandwidth limitations of the hierarchy. If the only device 
>>>> connected
>>>> is a port used for tunneling then report that device.
>>>>
>>>> Callers to pcie_bandwidth_available() could make this change on their
>>>> own as well but then they wouldn't be able to detect other potential
>>>> speed bottlenecks from the hierarchy without duplicating
>>>> pcie_bandwidth_available() logic.
>>>>
>>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2925#note_2145860
>>>> Link: https://www.usb.org/document-library/usb4r-specification-v20
>>>>        USB4 V2 with Errata and ECN through June 2023
>>>>        Section 11.2.1
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> ---
>>>> v2->v3:
>>>>   * Split from previous patch version
>>>>   * Look for thunderbolt or virtual link
>>>> ---
>>>>   drivers/pci/pci.c | 19 +++++++++++++++++++
>>>>   1 file changed, 19 insertions(+)
>>>>
>>>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>>>> index 0ff7883cc774..b1fb2258b211 100644
>>>> --- a/drivers/pci/pci.c
>>>> +++ b/drivers/pci/pci.c
>>>> @@ -6269,11 +6269,20 @@ static u32 pcie_calc_bw_limits(struct 
>>>> pci_dev *dev, u32 bw,
>>>>    * limiting_dev, speed, and width pointers are supplied) 
>>>> information about
>>>>    * that point.  The bandwidth returned is in Mb/s, i.e., 
>>>> megabits/second of
>>>>    * raw bandwidth.
>>>> + *
>>>> + * This excludes the bandwidth calculation that has been returned 
>>>> from a
>>>> + * PCIe device that is used for transmitting tunneled PCIe traffic 
>>>> over a virtual
>>>> + * link part of larger hierarchy. Examples include Thunderbolt3 and 
>>>> USB4 links.
>>>> + * The calculation is excluded because the USB4 specification 
>>>> specifies that the
>>>> + * max speed returned from PCIe configuration registers for the 
>>>> tunneling link is
>>>> + * always PCI 1x 2.5 GT/s.  When only tunneled devices are present, 
>>>> the bandwidth
>>>> + * returned is the bandwidth available from the first tunneled device.
>>>>    */
>>>>   u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev 
>>>> **limiting_dev,
>>>>                    enum pci_bus_speed *speed,
>>>>                    enum pcie_link_width *width)
>>>>   {
>>>> +    struct pci_dev *vdev = NULL;
>>>>       u32 bw = 0;
>>>>       if (speed)
>>>> @@ -6282,10 +6291,20 @@ u32 pcie_bandwidth_available(struct pci_dev 
>>>> *dev, struct pci_dev **limiting_dev,
>>>>           *width = PCIE_LNK_WIDTH_UNKNOWN;
>>>>       while (dev) {
>>>> +        if (dev->is_virtual_link || dev->is_thunderbolt) {
>>>> +            if (!vdev)
>>>> +                vdev = dev;
>>>> +            goto skip;
>>>> +        }
>>>
>>> One problem with this is it *silently* ignores the bandwidth limiting 
>>> device - the bandwidth may not be really available if there are 
>>> virtual links in between. That is a change in behavior from the 
>>> messages shown in __pcie_print_link_status.
>>
>> That's a good point.  How about a matching behavioral change to 
>> __pcie_print_link_status() where it looks at the entire hierarchy for 
>> any links marked as virtual and prints a message along the lines of:
>>
>> "This value may be further limited by virtual links".
> 
> I'll wait for some more feedback on the series before posting another 
> version, but I did put this together and this is a sample from dmesg of 
> the wording I'm planning on using for the next version:
> 
> 31.504 Gb/s available PCIe bandwidth, this may be further limited by 
> conditions of virtual link 0000:00:03.1
> 

This will cover the the message, but for any real user of the API this 
is not good enough as the speed returned doesn't really indicate the 
bandwidth available. Or, modify the description such that users know 
that the value cannot be trusted when there is virtual link in between 
(probably the API should indicate that through some param/return code) 
and act accordingly.

Thanks,
Lijo

>>
>>>
>>> Thanks,
>>> Lijo
>>>
>>>>           bw = pcie_calc_bw_limits(dev, bw, limiting_dev, speed, 
>>>> width);
>>>> +skip:
>>>>           dev = pci_upstream_bridge(dev);
>>>>       }
>>>> +    /* If nothing "faster" found on hierarchy, limit to first 
>>>> virtual link */
>>>> +    if (vdev && !bw)
>>>> +        bw = pcie_calc_bw_limits(vdev, bw, limiting_dev, speed, 
>>>> width);
>>>> +
>>>>       return bw;
>>>>   }
>>>>   EXPORT_SYMBOL(pcie_bandwidth_available);
>>
> 
