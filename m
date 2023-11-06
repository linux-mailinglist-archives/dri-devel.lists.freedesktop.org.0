Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC017E2C33
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 19:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBED510E3AF;
	Mon,  6 Nov 2023 18:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2050.outbound.protection.outlook.com [40.107.95.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC32510E3AB;
 Mon,  6 Nov 2023 18:44:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlPNa6vUTMzqIDNEuytZKrQA6p7PHXjUtXeQlof1nDIzjxhy+/tNZGHfAoFfCR0bThSETvjc9Lup2YpRSBYZOekx99hA30IVbXRsm8XsMlZcKZEmSIp9Agml+i0HT15dM1A2lUKgl3MhkpIOhNwz5RfOs3UqSbozJm4IQO/fPPNnXTJOMpA5I4QCUguMtRgM6f63I6SgRfWcSGRTynnL4VPbZAZ9m5w8da+6LXUWpFbQVNiQoHNS78yogNYzeF2ufAc/5y8BtpXlB7kFG/BykzwR1fDcR/zHCMoc3SRSWDfJzxAVNdcnaq6DypFuinWrDAVTO8WaW8+0rfQ13L7BUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIDX2l4+tZUCBn9a4rIn5yTQL380rGu6Pk2tkzeEni8=;
 b=Tc++XlNQaM4rPBW0xSjDON4BsryxoW3/pXn5ovWQXsZsw0clqIfqiNnhakGeQ+ZWJRo7S1XYPBEF2XrDhNbtAcdcDo8afRr5dd0FZ6lXDUAFqYzIW8fqICvmv4pYFU60N30x2nMU6/gB/Beq1vk/w5QDTtx6QkRs+D/BaUfH4LPM6YqNiQZlpjZcuG8dFFvesqQEU20tE6lOM+mn8JF7Cns1kA4xzQRBLBTkCSGLhXtK3mtkrO1koIYB00MAs7mb6o7WPZHtai++/azseyt8jOf3cacIgXm2yGimRb+XdO0jRuDEhNXuX0D2uRAguS2JSxedZrA8zQB03aNq4BvnBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIDX2l4+tZUCBn9a4rIn5yTQL380rGu6Pk2tkzeEni8=;
 b=FIb9qDf7lkyAH2MWi0UkgE0IGcZ/aq9noiSW1qIwODsWF6Qmn31Cl6Ts+qMgt83WyPBq6OLwZX68GkrB5rRACA7JG+hjSkBLPNddKCLWgoXqs6aFoLA4KmWaIReRLGgirQLr85xl0wpxOaf9i2t/JJulIq3SNF1xNtrCHOUJYRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB5901.namprd12.prod.outlook.com (2603:10b6:510:1d5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 18:44:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 18:44:29 +0000
Message-ID: <712ebb25-3fc0-49b5-96a1-a13c3c4c4921@amd.com>
Date: Mon, 6 Nov 2023 12:44:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] PCI: Exclude PCIe ports used for tunneling in
 pcie_bandwidth_available()
Content-Language: en-US
To: Lukas Wunner <lukas@wunner.de>
References: <20231103190758.82911-1-mario.limonciello@amd.com>
 <20231103190758.82911-9-mario.limonciello@amd.com>
 <20231106181022.GA18564@wunner.de>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231106181022.GA18564@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:5:134::37) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c590c4-d750-431c-d7e6-08dbdef868c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m5a7XngHzL9FJE9XEwovGBNp3xwfYfpVjZ0tmNvfuXIqPPSr6ozzT7LthxGyMQQSd+wXpGEdnhObS9dXkjWcMbMpPVlgLmLp2clHK/N7fVPLyY9Lx4ge2WugqMRy8YCCjCK8BFDYx39eCi1zMllOep/kY6SLlwtNrqnBx++H0xrVpdMrslYdEEgmU1eqpdPe2747pVcdwwEphpJU8vZ7xhpTf7qvc8ZP5utVxDGMxjH4sxuG8EaCAPMUAMh3kY3F4fhY1j9BuZVEJmZVv9EXqD8Ipb0fvFeCm41aM4yZ6+fiok/Nk4i5NSqjwYbtcoyWiwJDZ+U82SiOAg+AAWV00uTh/trS9+a4Ape0zo5uh7oFViUMTB5NuupDHb25NfIwX4jj4KNDvRrHivSuGwpCgxAAYpmwPHn7AHTquBdBi8JETsORC6BmFeWuIyWswIn5X/LeSY2zrTARnzqbYYm65P5EG4gR5MDPLUU2BRv69w7YClnE3FNnljrCHCpVpzie15YnFwjsJaUHMTuFb8QwV3cufOqBXWMMFjm/7Pg4JU3ZORq0YLOq0punnWWTkpZzjo8vCYxOqPSap3mShxf8cUXkVmUKT1pXRutJOchdqL68AXXbGzjqcYwQbDzUWTRH/l0mquRtQjxJY2gVFh76GA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(346002)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6666004)(53546011)(6506007)(2616005)(6512007)(966005)(6486002)(478600001)(83380400001)(26005)(2906002)(41300700001)(5660300002)(44832011)(66556008)(66476007)(66946007)(7416002)(316002)(4326008)(54906003)(8936002)(8676002)(6916009)(38100700002)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm5GSlVPRVhDd3VGMloyb2RiNXYzeVM5Ukh1UFgzZzdyN2tyN0x3QzR0dlA5?=
 =?utf-8?B?TVArL2JVd1F6djhxYXk3dUNlSWthWmFpeHIvNXBNbExnaDk0Qm1kYWZEbkYw?=
 =?utf-8?B?VWhQUVhaRVUyTnhZdTZUeVVtSEF0NzB3WjRpMXM2dnMrS0dsT2hNOVZ1VXJH?=
 =?utf-8?B?bWxqdmRKK1NCa3dTY2RTeFF0M0tCYlJob0xQWTlIV2dBR1Fid05za25JcmdU?=
 =?utf-8?B?REVveEdJcTdmLzhPZWFJSnFFUXUzc1ZLNE9ENkZhUnN4eW84cmkvTTEwQ3NX?=
 =?utf-8?B?OEsxNk4zbXp1R0NoaXFOaGczVkFVQzRFKzNvZXJrWXRUSTAyYkZUN05paGZB?=
 =?utf-8?B?VmpTRDNVU29nRk1IT25keGdObHVMWW43QWQ5K3VsblZER0xGTWhUYXN6cVVp?=
 =?utf-8?B?bW9mT2I0SGdUc1pnYko0M1VFaStLdmxqUmUwWE5KYzRuQ0ZCcE5TZ3d1cmgr?=
 =?utf-8?B?dTA2ZFF0M1pJamQveURZblIwazBvdFFUaVVuUHBVdXYwS1lha3YveGI1VDlX?=
 =?utf-8?B?YUVUN0hSUnBmVFBIZXp2eXkxd1BVZkR1V0pYSHlWQ2J6QndFWDUvUVBNVmRh?=
 =?utf-8?B?NzRlU0VHSWZJVi9zSXhZcTc3azVCVVJvbTFscWVDK3R1STJOWXhLSkQ3UmVp?=
 =?utf-8?B?WlhKd2Rnb1BOWHVqanRoUnQ1YXBhUnpCWEdJUVRwc3lIeHN1RVpySGlMMEM0?=
 =?utf-8?B?UFY2ZlBEdXZGN1FxbkJ2YXJjYXlITEVIT1Nyc2I5WWdVTkZjK3VvWXgwejg4?=
 =?utf-8?B?SlppdytmWUhLRVZYY3NTNDRQeEFRQXRia3NMVmorUWFBWGZ5eG1LZUw4dEFu?=
 =?utf-8?B?d1d6TVo5VldWcU1wN1lybUtVc1ZBUnlyTlpSKzk5dmFWTlJ5dHZldnB6T2xh?=
 =?utf-8?B?R1NqeEJvMkFzdFFyRlY2am1xWGxrWmFlcTJ5a2dDMVNuT205d0I1UDZSVUJj?=
 =?utf-8?B?STl6Qm0wUEhBdlRJQlFnbERScUFCZ3NZUC9sUC9KMGNXT0J1Tml4ai9ISk9v?=
 =?utf-8?B?MzFxQmhiazRtOG9WZ2JyeDVlUVduYk5TdlMwQ2F6eDZ2bys0dWcrOWVJUmxT?=
 =?utf-8?B?c2ZJQ3ZJWXd0R29LejBPcDZ2aVNhcmNUY3Y2cTJpalZsWHg0TmNndGhRQVFP?=
 =?utf-8?B?Uk9EZDYrekVNZndEdWZNV0x0eTIyRHRhdUtZTHFURUZhRG96dndRMDNkNktl?=
 =?utf-8?B?bDYzK1JGTHNTSlVvRWh4aFF1Q0ZVdkZqeTh3bHRaT2ZQZDMwNmNjcEJYVGpZ?=
 =?utf-8?B?OHpCaFNGQjRrYXVIeEw0cldUVXc0eUh2OEtvYThnUStpT3FEa2wwSEhEMXlq?=
 =?utf-8?B?K0dnbDBrSnhzczJERWVYaThZalVOSGZRNjNUMm0wTXd3YloxWUErc0VtNlZP?=
 =?utf-8?B?aU9kSWE3QTdWTm1aUks1VWE0QnlWMEhVbGRtNWVyRldEbnhIdUEwa05xTnRt?=
 =?utf-8?B?RUdjU2JaVy9JZjRyVHVxRTNVQ2lwaFZpU2VhMEFBUFNVck8yUGxxK2VaOFdy?=
 =?utf-8?B?UTlWZ0tMM2pLeXZtRTFxMGxQRm9FcmtZOFBoNFp2ZGRORXYzMjJKRnhCSHpY?=
 =?utf-8?B?Z3gwdEx2TXlIZThKQlZXR2x3ZG1RSlFMeDZyQTl5TkdmZGFzSmdMZlRpZUNX?=
 =?utf-8?B?ODhTM0VFM3dZaUNOQVNZdnJKTUxGOU1USmRXajRpMzQ0R3lPbGY0WU1YdHkv?=
 =?utf-8?B?WmV5bmVmWHJTamVpSEw5YXJGQjBTR09Ic1pCYVlnWS80MWZuU3dYRUY1U3hG?=
 =?utf-8?B?TzJCY240ZTRxcS9RbG1ZVExaOURJTzcwdjlmQU5rTTd3VTg2ajExeEgxcGRP?=
 =?utf-8?B?aERNeWJVK1ltRTR2NHB5YXZQTmo0QlpNSlVFdGxuQVN6L3ZzUzBodEdyNHVZ?=
 =?utf-8?B?dUtsdHIzeXFmdlVNZStjQ2hUWURMWngxUXR0TTc0SStOY3V1MXo1WkE0K0xQ?=
 =?utf-8?B?enJIdTJrTmRyTFFpMUl3dkQxZnhLOThkanhIMGxoOWRTWlVkZlFHSlRONTNI?=
 =?utf-8?B?S2w5bGsrdXplSENSWTh5czhUZmFZbUgzMFArM0cvVXUxYzFNaDhseTR5RTJn?=
 =?utf-8?B?djg3UmE0Wnc5TUh6Ym9ZNFAvOTNsKzBjTDF1VHdWNWhZZld2Y0MyT0h5Z3BN?=
 =?utf-8?Q?ntN2fNtv3Sgwc98EMfh5JB6TB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c590c4-d750-431c-d7e6-08dbdef868c5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 18:44:29.6023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4oveiOIVuvXny3gJDAy30wnbW/4MAYAk52jGEF1a8+bxRBcqxIc3m/Cdp8WG0NYisH8wWCchlkv6eRmh+yErQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5901
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
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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

On 11/6/2023 12:10, Lukas Wunner wrote:
> On Fri, Nov 03, 2023 at 02:07:57PM -0500, Mario Limonciello wrote:
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
> 
> I think a better approach would be to define three new bandwidths for
> Thunderbolt in enum pci_bus_speed and add appropriate descriptions in
> pci_speed_string().  Those three bandwidths would be 10 GBit/s for
> Thunderbolt 1, 20 GBit/s for Thunderbolt 2, 40 GBit/s for Thunderbolt 3
> and 4.

It's an interesting idea, but there's a few short comings I can think of.

1) The USB4 specification doesn't actually require 40GB/s support, this 
is only a Thunderbolt 4 requirement.

https://www.tomsguide.com/features/thunderbolt-4-vs-usb4-whats-the-difference

The TBT/USB4 link speed can be discovered, but it's not a property of 
the *switch* not of the PCIe tunneling port.

Tangentially related; the link speed is currently symmetric but there 
are two sysfs files.  Mika left a comment in 
drivers/thunderbolt/switch.c it may be asymmetric in the future. So we 
may need to keep that in mind on any design that builds on top of them.

On an AMD Phoenix system connected to a TBT3 Alpine Ridge based eGPU 
enclosure I can see:

$ cat /sys/bus/thunderbolt/devices/1-0/generation
4
$ cat /sys/bus/thunderbolt/devices/1-2/generation
3
$ cat /sys/bus/thunderbolt/devices/1-2/tx_speed
20.0 Gb/s
$ cat /sys/bus/thunderbolt/devices/1-2/rx_speed
20.0 Gb/s

2) This works until you end up with USB4v2 which supports 80GBit/s.

So this might mean an extra 80GB/s enum and porting some variation of 
usb4_switch_version() outside of the thunderbolt driver so that PCI core 
can use it too.

> 
> Code to determine the Thunderbolt generation from the PCI ID already exists
> in tb_switch_get_generation().

As 'thunderbolt' can be a module or built in, we need to bring code into 
PCI core so that it works in early boot before it loads.

On the presumption that no more "new" TBT3 devices will be released to 
the market I suppose that *a lot* of that code could come over to PCI 
core especially if we can bring some variation of usb4_switch_version() 
over too.

The other option is that we can stop allowing thunderbolt as a module 
and require it to be built-in. If we do this we can export symbols from 
it and use some of them in PCI core too.

> 
> This will not only address the amdgpu issue you're trying to solve,
> but also emit an accurate speed from __pcie_print_link_status().
> 
> The speed you're reporting with your approach is not necessarily
> accurate because the next non-tunneled device in the hierarchy might
> be connected with a far higher PCIe speed than what the Thunderbolt
> fabric allows.
>  > Thanks,
> 
> Lukas

