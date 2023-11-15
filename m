Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821577EC94F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 18:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376B210E0CD;
	Wed, 15 Nov 2023 17:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED38C10E0CD;
 Wed, 15 Nov 2023 17:04:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqexmg4Prb7TZujcWGbBV9Rn/+rAtYGhm/DHyNI+rH3CPLNO/nROYreSBEI+513LXsS9brBq7/oOIp56TtGmnSmKzxBCgVEA10L4q+Jc0c+TBAGMAdqUtS1440buP4s70OtumMBm+rjkjjOUB2NVhaJyqqY6YxikjaO0MapQQ6oqOuNj3oGn6kSZIqM7PMTYdDtqxQynjMfTOO5bw2hwzle0pfIjHYG4JaWZKBPyzx7Js83JByRJGXxONz38s/JmDFhE/fR9kX7ML/oJ/Ej9EY0FTEmlG3gpJNKrSfV03O8QVQ2ExjYLh+BNdZdov5SVL0H3/ki3mGQQFOHbyhr+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYzvMFQMmVP4Edc0DIQl+yH8WH7dvuR39BmEmf/9l/c=;
 b=H4HlZb5QvOtSIajk5fYFc400BD7ECr6dyx2Q7k8irklpmrtXw1v3hhfrj0UHqAZWIPpKXb8G/g/R8wjzlqtqcjyLxy5D+Xb9BMJIisFuDBxTdZYYVP8E8rrpYSBuar2vfhlysLaPBbGdomEJk4chADKMPRhm5qUyOPnfDlKeV/VIiGHFSl7A7owaFkvzRWNgqL2M+RQF34wxw0Jm8zDQ6E4Y8Qx6nX8H2ZOXEDmwMvc0yQraMissEijcg0i4IPsbX/dJ0fr1bEnSRv/hxTDdvZMz8uJbvwe545sFwC4/jUC8tt807hmmVKA7hfd8g/8pgcI2NLX4dgWhEXIYAQUG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYzvMFQMmVP4Edc0DIQl+yH8WH7dvuR39BmEmf/9l/c=;
 b=h1/LYs+NmMXyvONsPmRea1EiCXFZzQKNejEdjennX2Pu0bfeEDHi/QPI9RHyN2QDs65cWlErH063S1UI4qtr16eT5wMB3GYzAhdb0YRg1VKc2RPnP4HvMYLcPxC/DnrePtDL1sJYUY67xLwcQKTZNSgn9ApMpcSI3ofGtkG6lWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB5006.namprd12.prod.outlook.com (2603:10b6:5:1b8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Wed, 15 Nov
 2023 17:04:45 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.7002.019; Wed, 15 Nov 2023
 17:04:45 +0000
Message-ID: <5356bcbd-0785-4156-993c-338fed67d39d@amd.com>
Date: Wed, 15 Nov 2023 11:04:42 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] PCI: Exclude PCIe ports used for virtual links in
 pcie_bandwidth_available()
Content-Language: en-US
To: "Lazar, Lijo" <lijo.lazar@amd.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>
References: <20231114200755.14911-1-mario.limonciello@amd.com>
 <20231114200755.14911-8-mario.limonciello@amd.com>
 <e0e76948-a0a8-b6c2-163b-1d00afb6650c@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <e0e76948-a0a8-b6c2-163b-1d00afb6650c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:805:de::37) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: 870119d7-96eb-4a4a-0d07-08dbe5fcf78b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2xwsMHw0/NU7bsQoz3no09Ly58YDbTKyNx7FBuerWSjCdhX1+2acH+qHu34Ur46b9Ye7urbYTc4Vv2yUbiFNiqYsxFrM5SrBAIwtIqtur1Ew0xV+p1b+BFq39AY1QFcanlEkKq0mY0pe6ZaLr8zns5jh9mRzZIIAODdqsQjmCfgsg2SbSS5Vg5jKdFGMW+58uGPCJU8LI8qrVSgWTNNLT4ozbwIFG3nuI5qiqB/JlEqYTJTBsa5UgNFm3Zf658FCa8SKQpGF4McgtpO5m24/sq5DiXX/ENk8BxOq3Ap2ylM9AHLK0DzNKIKAmjLSTrrpYS4Y1nWFOVsa0zyRexZTtnWOrtky/zN2BasG3stgjnKscXSKcApnjxLCmiD9KNaDIsFXnSTSEyGmkDYZG0Ml/Jrg6+yJYOLXIEzwLVs/TCA2YQo/vhW9Plrm6sm9+x4AV4Cm/mKgGB4lUdFlBD1adfSktHPribBELBEonb444MMTdkTUnqthOJfKaHl4ooXzYpJVdy67XkVOcXucM7JkzultpN5lYDvnT2jbbi+zgDm9CkWDWaTyj8GCVKzw7FdSvqzlGdualKtOege0r4UmOz11VXWaEP3aaspbXMfWi6WrSjP5tUiAVgvCTnIe2RA2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(38100700002)(83380400001)(110136005)(54906003)(66946007)(8676002)(8936002)(66476007)(66556008)(4326008)(31686004)(36756003)(41300700001)(26005)(31696002)(6512007)(2616005)(6506007)(53546011)(6666004)(478600001)(966005)(6486002)(2906002)(44832011)(7416002)(316002)(5660300002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU1DNG15aFYwYjdJTUhhSjNHQXBZM1pOZnVndkFFY1o1ZUxqMmFaUDJ5bjBD?=
 =?utf-8?B?UzBTWHpqSDlSVkFhYlpqQmxjbWR2SjdYclVKQmJSNUJmVk56eGdOeWRHWERz?=
 =?utf-8?B?Z2w2Ly9pMmtQeUhEUml4WnowdnQvdFBlbkhyT3lzOEt4citBb0MyKzJGUmpB?=
 =?utf-8?B?azVZOUtVREQ1dzRrRGNtTW5kTys5UUErcGEzS29NNkFXNytkbHk1MDA2dmJr?=
 =?utf-8?B?dmpCNU9ULzFzMDRaNk04cjJucWZpL3ZDQWNjYTNMOVRiTHdFYjNjZ3lnZytk?=
 =?utf-8?B?NjVxeGl5WE9GQ2pyaWdRbm8xVzFDWGJ3U0F1Q01ta2YrN3IyditSVHF1cmNk?=
 =?utf-8?B?aWFOcHk2dURWbHdjYklCK01CNHVocXZxbzEwK2dhZDU5eGFSdlV2NzA4b0V4?=
 =?utf-8?B?SG5PWnVhN2ZncUFaUk5XRVArdkpjaTRxSkEwdlBMZi9CMWZ3S3ptQmlmUWx3?=
 =?utf-8?B?Qk5HamtMRHBLRlkyT2cwYXFJUzdCNjg2ckpvZVFxaHJlSTYrOGFFSXNCU3Ns?=
 =?utf-8?B?Y01ZUk8yZ3ZwYVBkb0xGZzJHZGUvMno0VGE5ZWd2R0xUMDd4Y2k3d3BjaS84?=
 =?utf-8?B?cjFZcVNYbGlsS0kzdStLWklPMmNHUjhuWkJCV0w1am90TGw0OUNTOGRaSUcr?=
 =?utf-8?B?bFpPL1J5MEJvUTZsWFNERlNtMVBPSFFlalZJTmkwQmcxZXpwR21UZ0hZZHMw?=
 =?utf-8?B?WTczckkyUzUrRUxPdUdaa3RyTXJDQ2YvMTQyUHFjNlVOdmlsRndVRTR2ZE5M?=
 =?utf-8?B?VnNxSlBRT1JNL1BVdjJRQ2RhR1hjT0k0MWxtZUVkQ0xGWGVWbTNjUjNYeHIy?=
 =?utf-8?B?S2pQaEt6UFowM2RXK1BVSWtiNVpMQ1QwZit6YkUydTRRRlpGL3dmVVZVcG5W?=
 =?utf-8?B?MmhDUXc3OUgvbjN4eU1HWk9SUkxkYzByWmMyK0hoOFdleWVYSUVydlNBNEJL?=
 =?utf-8?B?Vi81NVA0OFdtZG9LZkEvakFKbkRYZ0dSN3VPdXR0WXpXaGlab0NDOXhhbWsy?=
 =?utf-8?B?d2dteHpjcmlQKzg4MEZ5cTVOejVjcDl2SDVUU0N2UEZKYXBUWWhpaTQxaldX?=
 =?utf-8?B?cUQ5bjI3a0JpRkE0U3FQbW5DYWNlMjlIc1hMWk0vcWV2QkRUWVlqSUJ6Q2xX?=
 =?utf-8?B?dnRxOGZnZE80SnBCSDVONFU0Mm1hMTF3RWRYbFhkNEc5RGNZV1pTOElvLys5?=
 =?utf-8?B?RU9VQUk3dzdpcHNXL2FlOEJPeHBKTUR1VEt3QlRGQ09BYVRtdjFWUEYxa3Vv?=
 =?utf-8?B?UGJsM1BEL1lvaUVDaFd6V1dMdnlpajZYR0ViLzN6ZWwyTVcvUFM1bzg1bXg1?=
 =?utf-8?B?TkMzV1VGQlJQZVladjZMZ0FCSGFZQ1huQ2hwY3VzTFpPUFFTY2hIKzhLYmxS?=
 =?utf-8?B?UWNVbk9xVFlzU1FnZUFYVW5BWEZld2ZkRm9Qam9mWWEzMHZMRk9SS1FYaHU2?=
 =?utf-8?B?cVhwdTg5WWwrQ1pHaE9Qb1Bzc28yd0cyNzJKNUV2cEE3UisxdVpFakJxUTlX?=
 =?utf-8?B?VFJ3dWRWOStaNXJSVkYrU0ZaSFVRVW5Ma3haLzN5WEF1QXgyNll1ZFRuazlZ?=
 =?utf-8?B?YzIrTzNZUFpFZGp1WTF6TmFnZWp3SHlocW5kZC91TWRid1l5SUYvSWVxa2pv?=
 =?utf-8?B?QmFLb0VMUGJMU2IvRis5SDRBZUo5RmpZQXBqMTVyWVNaMHlXeWtpdXJpMDQv?=
 =?utf-8?B?R3hodnRocjhnb0F3L3lwaWVCWldIYnlrV3ljd2dtZy9DTGNOY3RxSlRaeTlO?=
 =?utf-8?B?VnQvbDNtdXhFbVlzRkVleWVDRU5ocVdiSU43YkFBbXdqU0RXL3puS3ZOdFNR?=
 =?utf-8?B?QmJtRktLN2dxV0RHUjZoT29UNXAxZFJlU09wNUEvR0o0R1ZhanVGMklyc2Iy?=
 =?utf-8?B?MHZyZFRnZVU2eGkwSEVMRVR5MUdGZTh0ODhVaVpsZGdQMjJUSDc0MUV1TGRC?=
 =?utf-8?B?V0R2VnlKbCtyTUpMV09Sdi9ETlFIbmY0M09ML0NnQ0traDdnU2laby9EVEdL?=
 =?utf-8?B?cnJ5U0M5TlBkeG40TGlBQklPWjBPeUxhQjgrTVF0UGwvdVgxbVoyUFNSZXZQ?=
 =?utf-8?B?VlRZYlN4bVhYN0ROdVlEM1hwTkR3a1Y4ZTI1dDhDd0p5a1ZwQzZvUkpZVmlq?=
 =?utf-8?Q?DAEKmMZoY9fHpvkbFMPOIpAiI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 870119d7-96eb-4a4a-0d07-08dbe5fcf78b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 17:04:45.2397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLgWPAeSotv6yt5PYUDAm8j0cc74oVYuMdKXdlSIt0V8P02x/kKL+Jn/yoNO12WUYceEnJvj2EPEWyJGOyB5YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5006
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
Cc: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
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
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/14/2023 21:23, Lazar, Lijo wrote:
> 
> 
> On 11/15/2023 1:37 AM, Mario Limonciello wrote:
>> The USB4 spec specifies that PCIe ports that are used for tunneling
>> PCIe traffic over USB4 fabric will be hardcoded to advertise 2.5GT/s and
>> behave as a PCIe Gen1 device. The actual performance of these ports is
>> controlled by the fabric implementation.
>>
>> Callers for pcie_bandwidth_available() will always find the PCIe ports
>> used for tunneling as a limiting factor potentially leading to incorrect
>> performance decisions.
>>
>> To prevent such problems check explicitly for ports that are marked as
>> virtual links or as thunderbolt controllers and skip them when looking
>> for bandwidth limitations of the hierarchy. If the only device connected
>> is a port used for tunneling then report that device.
>>
>> Callers to pcie_bandwidth_available() could make this change on their
>> own as well but then they wouldn't be able to detect other potential
>> speed bottlenecks from the hierarchy without duplicating
>> pcie_bandwidth_available() logic.
>>
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2925#note_2145860
>> Link: https://www.usb.org/document-library/usb4r-specification-v20
>>        USB4 V2 with Errata and ECN through June 2023
>>        Section 11.2.1
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> v2->v3:
>>   * Split from previous patch version
>>   * Look for thunderbolt or virtual link
>> ---
>>   drivers/pci/pci.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>> index 0ff7883cc774..b1fb2258b211 100644
>> --- a/drivers/pci/pci.c
>> +++ b/drivers/pci/pci.c
>> @@ -6269,11 +6269,20 @@ static u32 pcie_calc_bw_limits(struct pci_dev 
>> *dev, u32 bw,
>>    * limiting_dev, speed, and width pointers are supplied) information 
>> about
>>    * that point.  The bandwidth returned is in Mb/s, i.e., 
>> megabits/second of
>>    * raw bandwidth.
>> + *
>> + * This excludes the bandwidth calculation that has been returned from a
>> + * PCIe device that is used for transmitting tunneled PCIe traffic 
>> over a virtual
>> + * link part of larger hierarchy. Examples include Thunderbolt3 and 
>> USB4 links.
>> + * The calculation is excluded because the USB4 specification 
>> specifies that the
>> + * max speed returned from PCIe configuration registers for the 
>> tunneling link is
>> + * always PCI 1x 2.5 GT/s.  When only tunneled devices are present, 
>> the bandwidth
>> + * returned is the bandwidth available from the first tunneled device.
>>    */
>>   u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev 
>> **limiting_dev,
>>                    enum pci_bus_speed *speed,
>>                    enum pcie_link_width *width)
>>   {
>> +    struct pci_dev *vdev = NULL;
>>       u32 bw = 0;
>>       if (speed)
>> @@ -6282,10 +6291,20 @@ u32 pcie_bandwidth_available(struct pci_dev 
>> *dev, struct pci_dev **limiting_dev,
>>           *width = PCIE_LNK_WIDTH_UNKNOWN;
>>       while (dev) {
>> +        if (dev->is_virtual_link || dev->is_thunderbolt) {
>> +            if (!vdev)
>> +                vdev = dev;
>> +            goto skip;
>> +        }
> 
> One problem with this is it *silently* ignores the bandwidth limiting 
> device - the bandwidth may not be really available if there are virtual 
> links in between. That is a change in behavior from the messages shown 
> in __pcie_print_link_status.

That's a good point.  How about a matching behavioral change to 
__pcie_print_link_status() where it looks at the entire hierarchy for 
any links marked as virtual and prints a message along the lines of:

"This value may be further limited by virtual links".

> 
> Thanks,
> Lijo
> 
>>           bw = pcie_calc_bw_limits(dev, bw, limiting_dev, speed, width);
>> +skip:
>>           dev = pci_upstream_bridge(dev);
>>       }
>> +    /* If nothing "faster" found on hierarchy, limit to first virtual 
>> link */
>> +    if (vdev && !bw)
>> +        bw = pcie_calc_bw_limits(vdev, bw, limiting_dev, speed, width);
>> +
>>       return bw;
>>   }
>>   EXPORT_SYMBOL(pcie_bandwidth_available);

