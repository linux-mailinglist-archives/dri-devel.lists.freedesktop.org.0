Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987A37ED5AB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 22:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C61710E10B;
	Wed, 15 Nov 2023 21:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F7F10E10B;
 Wed, 15 Nov 2023 21:09:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0lGvH7585XTgFQJWJo6Ne6Jf7qoBog1o47Kho6hFs2D3xBlHe9+Hq+h+wqb5quZfs7UTHuzM29vHuDCWE/LddMddEJ9fKRXqto7Ol8VJhqXxUadGVR7hxbR97m9MQQRFVozNbqnl0Gikf25uNad0K1AKM8dg77FMjUA+wO1W3dyZgqsBV/XCqEkB/PVkFwCf5puI1Gzl98CZOC/6SMneXynXbvOV9qOBEH7OA3JVOdgm8yvIe9Ae+a6Q6opLDa6ewashmfs71nJddgRXoEoT/tFFlldwthqBQFWLLrxb+SohQ0QXQOtanBK8xGBsqIczsXb8C/1XvRjTYLl5ucHVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEAGG7uaQ7Cx4EW/SpG+sUaW8WzVuepuE6BNGplDn0k=;
 b=byVDGCpz384wMfJCO4AMfrA45HIMkpdHscWlmXlV1yVGhjMkM1nL/x+8mnVov/MnrwX2tqkjW4eMr5xstuj3Iz1qp8YeHD8iBo3YjSQ+eJRhFug2cogffj9dl175MjJ0Q6NlgYPSr/ljEew0rGaDwLY4cHE/P7pgNOciqlMmgSNmXZNFABb1NVhrNfr7YG43G5zFCiPAJu/NJk0W7EOkIZRQo7J+hSOVXZbMl3SQBArRnMDL/SkcTv4ybW3WNmugsAt5oG2H1IaAZ3YySbJikP7k3YMQ4PQyOhUJZ65FcO25nAl4LuxNF390hMnVsMl6mIPIilFp30Oi4u3p+HpatQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEAGG7uaQ7Cx4EW/SpG+sUaW8WzVuepuE6BNGplDn0k=;
 b=5KmSIE5vcdtsByWfkmdtDel79v77vWxoOFZRmLYfgqT7mfPejO7bfSuAYsiIsuAGxh8po98Y3yJLAxMRWoiXCGl/RM78aoDU7JbTp8hhRJEsvv7DiQmYL73OMmFmunbenpBZVnJDnlxiJzGbey6lCVjok9kxFIB6bflcvQ4TWUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA3PR12MB8021.namprd12.prod.outlook.com (2603:10b6:806:305::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 21:09:12 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.7002.019; Wed, 15 Nov 2023
 21:09:12 +0000
Message-ID: <d7539754-1877-43ed-a1b4-f969315ec271@amd.com>
Date: Wed, 15 Nov 2023 15:09:09 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] PCI: Exclude PCIe ports used for virtual links in
 pcie_bandwidth_available()
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
To: "Lazar, Lijo" <lijo.lazar@amd.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>
References: <20231114200755.14911-1-mario.limonciello@amd.com>
 <20231114200755.14911-8-mario.limonciello@amd.com>
 <e0e76948-a0a8-b6c2-163b-1d00afb6650c@amd.com>
 <5356bcbd-0785-4156-993c-338fed67d39d@amd.com>
In-Reply-To: <5356bcbd-0785-4156-993c-338fed67d39d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0210.namprd04.prod.outlook.com
 (2603:10b6:806:126::35) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA3PR12MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: bb0818b5-fedc-4b50-1e8e-08dbe61f1da5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XSDulacBpiZOYPqY02M1QXNhuWU+lQ44PhLYYbFBAxPLMIsKrujhBC+MqvSE2PF7GlneU2Iur64RvzjY1KzNPeBkCXj8btycM4IPXJHczXBffLhRPnbKLZKPx5UZ6OBcRSfMZHpnHWT7KfXMVtXzYf6I5xQO1YK93XNEUoP5RiZzwIW5j/ASlGdEwfwt48r3pZ0P8FvXZGOY7bkf/U0NxYhI8C3DdwyKHMP4u7FJgtcUvsfDIFdC6eCQnx0anny1eB2y0jBX/Y4jmkxj1WuZQmUTBu5ADRbNjgpcX07LTUZAPmPTlHZwUsYBsLsfe/B+YHqWjZRh8UOm5qUfHNOaMr5DSPrAB/ZLdxrUk9SmAweYKYbMZIvEJkdx7lzqmY1ZbIiSZgKvT4vPN6ou/3UKv+aCq87MCNWiao1gwCFZ5/scAGlc7+WDPeoU7uFaUhcj249XNkaF6FSKHWsE8Hbr0DK7o7dPZRGro8zZEUwd7xWSIwiBSDidmn9mxt8rnKZWBVMMHWJhGJlFoeimvQsXCCbcoxMrEUv+GQqyopxT5kXllSm47eNg+uZi8+lmTsfBrCwv42y29gSNG4vlWM7NxY317ECDp+Xx01eqfW7oPNrbaI4RYRvzp1WyZQbXO7nl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(8936002)(31686004)(54906003)(2906002)(7416002)(5660300002)(4326008)(83380400001)(966005)(6486002)(44832011)(8676002)(478600001)(36756003)(66476007)(86362001)(66946007)(31696002)(316002)(41300700001)(38100700002)(66556008)(53546011)(6506007)(6666004)(2616005)(26005)(6512007)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWJzQVdsaENSNElNUGtDcU8wcG5SN3RyN1gvN1NYdGEybnFucXdHeVNtaFh6?=
 =?utf-8?B?SUMxaWprekMrb043eWduWVpxZ1BZWERiZStLM09xYWRJWWlrRlI3TEtSQTds?=
 =?utf-8?B?US9QS3JLQ2lLWkVVN2lvZXExWm9nRTd5NUdEVHgvV2FYWW1ZUFI1K2psNGl6?=
 =?utf-8?B?aEJOQzYybXJDNE81T3JZSlU1YXdscTQ4OGZkMG5ySzM5NjFjVWFEOUV1cTV0?=
 =?utf-8?B?dElxVlRzSGN6Rkw0SThHZjduRHd5L052ZXRxSHowNU80ZldETFIrREJkOXdT?=
 =?utf-8?B?eGo0VVVpSEJPSENEL3dXUmduQU92VWgvcS9zb1hMNi9Od09YWVZTRG5EY2FW?=
 =?utf-8?B?OFU0eEVrc01LVzNkaWNmdDJ5dTJXYjladUtNdGVOcnMxRWk3ck1lMmJqZC9X?=
 =?utf-8?B?N1VlUmEzcmxwOHAyTlhteU5PczJaV3RVa0NJQy9UM0xCbVNiR2hhenlVdWtN?=
 =?utf-8?B?VWlRWWVIaGZLc0xjYnBEWWZ0M0s2Rjh1WURsdUh1WGNncFVMU0xRYnR3cDJ1?=
 =?utf-8?B?QW8rdzdjaklZalVzUE5ja1hGdU1aN0kvc0JQSHNQZVFjN0llMy95RGl6VjdY?=
 =?utf-8?B?NllCWmgzNE00aDFTVm5hTlV4cHpQc0R2NzlUOGMrUmVpVFZOWTQ4eDllOHRB?=
 =?utf-8?B?My9TVHFNYTFvYmVQVkFkVE1QVnZFendwUUZrdnU3d3p2TGtscUZNZkgrYTdN?=
 =?utf-8?B?eWRvbVhDY0k2V3R5cDlyVUUvaDAwSm9sOTdZbHprTHBTRnRyUmx2VEVmb2FU?=
 =?utf-8?B?aWJhaitBK3pab3U1RGg0MWVjNUJGRmpyaWc3bDNDU0lJWHd4YmFyNUg0MERD?=
 =?utf-8?B?alM2bHFHVnZiSXlNYlFCYXE4QkloRWNuUVJvT2VJMUQ1SDJNZVNpajNsbmM0?=
 =?utf-8?B?M3RLcThLRk9UVWNPczZtTHd0eEYzVER4cDd4NGM3VzNBL1NIaFZsbzE2eUZU?=
 =?utf-8?B?M3llZGRsNTRNNzhLSThYbmF3QnNWSjd6QjRMZWVYandjb2ZWREx2Ylo2ei9m?=
 =?utf-8?B?SUlSYkxXTUllZ1VDeVNIcHoyZndPUExFOWxXYzhLMkFySEdUWS9zcnQ3Vnpq?=
 =?utf-8?B?OVJRNTFMSHlWWHJodk9ZdkdseXY0c1ROa0gvNVdRQUVvUUpTR3hSNloyTU5I?=
 =?utf-8?B?MzB4UWpoRkJsSmlOUFQ5bXhZMVQ2VndBVXQ1VnZmZW1KQVFuU3crcElJK2xT?=
 =?utf-8?B?TnVDakNrZUh0NHhNVlgvN3pRdzI5SUZ0b2Vxc3Yvdm9DdDVOSUxSaWY2d1I3?=
 =?utf-8?B?Sk80TmZEajFCcHpvZUpkYXlzeGovT0t2Mkd6QWtuOVR0bU5YZGErYW5PMy9V?=
 =?utf-8?B?NGZxWWU0Ukx3TU9UYndPNVl4S29VNnhqMU9QRElwc3dGbmZvclpSNk9QUUFQ?=
 =?utf-8?B?YjZkN0N3ckt0Smk4TmNVcFNQZDBzNXVCbWI2M0grcjBRWUV0bFU4WWJheWFX?=
 =?utf-8?B?bjUyc25tUXdVb3VNUXZiU1pKMjJnYjlkRHozVEVCS21wRFE5cUkvQnZXdll1?=
 =?utf-8?B?ditYYlJqSEZKamRZdXhBSHRMQjVIVWhxY2llYkVRbG9UdXNkY0wxdTJ3Wk9W?=
 =?utf-8?B?dENlZ0o5bjVpUUlWTjFGaTFveTRJakVieEhOTEt5S2pkZDQ0OVBvUFpZYXVq?=
 =?utf-8?B?TzJiU0ZSd2lQUkQvUHlDNHhxN1Bld2NrNWxucWZIczBTazFEdE11Q3FqaHBl?=
 =?utf-8?B?VmZtNWJWQ01PY0RqdFBuOGQ1ZkRVcG1mRWtXSnlrUTdyODRORWZlNUZwWVNW?=
 =?utf-8?B?T1VwWW9TWFR6ODJhTzF3V1h4WFNaMUVsaHp0d3ZSRzduT2hUQjVsODhCUHkz?=
 =?utf-8?B?aG1ZSkk1VUxnUWE5N2xLdnJEOGtoLzlIbmU5Uk4ra2MxK001VndEQjN4NjJU?=
 =?utf-8?B?cmxtOHJkQm5xN3BhUEd2b2YxeHBhNjYzQlI1Vng5WjNCL0pCckhtWlJkTm4v?=
 =?utf-8?B?ZDQzTVFHcytSSEdCb1paZTVBOEQvQlhvMmdTZy9lOTdGS1FOdTl3UVRGdWNh?=
 =?utf-8?B?QXpMb0hycXhrTVBKVi8zTUZvOFNoVEV6T1JnY2xHdGZlTlF4OGUxSmRLaGxD?=
 =?utf-8?B?L2oxVi9VNFg5TXNHaXpxeExLTUhvNUZTUWp5Q1RoZjlNVkZIM21Ydld3RzZu?=
 =?utf-8?Q?umJUHMGpaKzMbmHGN5EpwnT0r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0818b5-fedc-4b50-1e8e-08dbe61f1da5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 21:09:12.0446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 894K+cIUIXH53edsRey+eUXhVK+B8QMVv3KdCXXxjged4rzpwmKdkC9+sanOAEueOnKFuRhVfRrG9w8QneS0YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8021
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

On 11/15/2023 11:04, Mario Limonciello wrote:
> On 11/14/2023 21:23, Lazar, Lijo wrote:
>>
>>
>> On 11/15/2023 1:37 AM, Mario Limonciello wrote:
>>> The USB4 spec specifies that PCIe ports that are used for tunneling
>>> PCIe traffic over USB4 fabric will be hardcoded to advertise 2.5GT/s and
>>> behave as a PCIe Gen1 device. The actual performance of these ports is
>>> controlled by the fabric implementation.
>>>
>>> Callers for pcie_bandwidth_available() will always find the PCIe ports
>>> used for tunneling as a limiting factor potentially leading to incorrect
>>> performance decisions.
>>>
>>> To prevent such problems check explicitly for ports that are marked as
>>> virtual links or as thunderbolt controllers and skip them when looking
>>> for bandwidth limitations of the hierarchy. If the only device connected
>>> is a port used for tunneling then report that device.
>>>
>>> Callers to pcie_bandwidth_available() could make this change on their
>>> own as well but then they wouldn't be able to detect other potential
>>> speed bottlenecks from the hierarchy without duplicating
>>> pcie_bandwidth_available() logic.
>>>
>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2925#note_2145860
>>> Link: https://www.usb.org/document-library/usb4r-specification-v20
>>>        USB4 V2 with Errata and ECN through June 2023
>>>        Section 11.2.1
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>> v2->v3:
>>>   * Split from previous patch version
>>>   * Look for thunderbolt or virtual link
>>> ---
>>>   drivers/pci/pci.c | 19 +++++++++++++++++++
>>>   1 file changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>>> index 0ff7883cc774..b1fb2258b211 100644
>>> --- a/drivers/pci/pci.c
>>> +++ b/drivers/pci/pci.c
>>> @@ -6269,11 +6269,20 @@ static u32 pcie_calc_bw_limits(struct pci_dev 
>>> *dev, u32 bw,
>>>    * limiting_dev, speed, and width pointers are supplied) 
>>> information about
>>>    * that point.  The bandwidth returned is in Mb/s, i.e., 
>>> megabits/second of
>>>    * raw bandwidth.
>>> + *
>>> + * This excludes the bandwidth calculation that has been returned 
>>> from a
>>> + * PCIe device that is used for transmitting tunneled PCIe traffic 
>>> over a virtual
>>> + * link part of larger hierarchy. Examples include Thunderbolt3 and 
>>> USB4 links.
>>> + * The calculation is excluded because the USB4 specification 
>>> specifies that the
>>> + * max speed returned from PCIe configuration registers for the 
>>> tunneling link is
>>> + * always PCI 1x 2.5 GT/s.  When only tunneled devices are present, 
>>> the bandwidth
>>> + * returned is the bandwidth available from the first tunneled device.
>>>    */
>>>   u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev 
>>> **limiting_dev,
>>>                    enum pci_bus_speed *speed,
>>>                    enum pcie_link_width *width)
>>>   {
>>> +    struct pci_dev *vdev = NULL;
>>>       u32 bw = 0;
>>>       if (speed)
>>> @@ -6282,10 +6291,20 @@ u32 pcie_bandwidth_available(struct pci_dev 
>>> *dev, struct pci_dev **limiting_dev,
>>>           *width = PCIE_LNK_WIDTH_UNKNOWN;
>>>       while (dev) {
>>> +        if (dev->is_virtual_link || dev->is_thunderbolt) {
>>> +            if (!vdev)
>>> +                vdev = dev;
>>> +            goto skip;
>>> +        }
>>
>> One problem with this is it *silently* ignores the bandwidth limiting 
>> device - the bandwidth may not be really available if there are 
>> virtual links in between. That is a change in behavior from the 
>> messages shown in __pcie_print_link_status.
> 
> That's a good point.  How about a matching behavioral change to 
> __pcie_print_link_status() where it looks at the entire hierarchy for 
> any links marked as virtual and prints a message along the lines of:
> 
> "This value may be further limited by virtual links".

I'll wait for some more feedback on the series before posting another 
version, but I did put this together and this is a sample from dmesg of 
the wording I'm planning on using for the next version:

31.504 Gb/s available PCIe bandwidth, this may be further limited by 
conditions of virtual link 0000:00:03.1

> 
>>
>> Thanks,
>> Lijo
>>
>>>           bw = pcie_calc_bw_limits(dev, bw, limiting_dev, speed, width);
>>> +skip:
>>>           dev = pci_upstream_bridge(dev);
>>>       }
>>> +    /* If nothing "faster" found on hierarchy, limit to first 
>>> virtual link */
>>> +    if (vdev && !bw)
>>> +        bw = pcie_calc_bw_limits(vdev, bw, limiting_dev, speed, width);
>>> +
>>>       return bw;
>>>   }
>>>   EXPORT_SYMBOL(pcie_bandwidth_available);
> 

