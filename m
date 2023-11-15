Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE2A7EC967
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 18:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5079E10E0FF;
	Wed, 15 Nov 2023 17:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0F310E0F1;
 Wed, 15 Nov 2023 17:08:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWfbQV4N9ax6ZBBTxP+FiqqgK5rIiOHhcFNh/nCq0KgbfUYl7IdPKVBPX2zwgxrCcRjPaUVCBWcgiCuxlhoJ4GW6YzEzhx4tT6YoeFfr/dfHyT9lXTyBAgw1lvMcOxTc1mb2XXb1h8AmpJDyzY3DdKE5qrsgXE7hNIdbVY7VeAMgiMn2wbYKifHAZIR8cNPma74hX1vzDhfg1KGjHC7eoZkYfYvnf0wCuSHhhaiaz+egsq20HHmwxPQQM67sE2udFOnhXU74CNsi3GUx+6V0yxhOo6E401OTVLJbQkcchK8JYP88HU7x8vquQoFtO9zGjU4M0BcKvPIsshaQNcFX6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lN6CL2acWKZy0CwSo3JdCf8uGHAVsrZgEb6HlVE9/ko=;
 b=UwbNz5SuOw6pBTs9P24GIqvCaWx04i4/mHbIs+StG7LqZffbcH7mnlVO/c3JQMlWEu/CZwtpuoZ+x6egvQvC9BnIzuOpIKxd12fIsrZRFuhGgON6nnbweesG/6ItVw2b+HXlg4otLDEKIDXkBJtuyYqcILCXxkMoxlzy5EdKDlDPSqv2uYFtHQktmQnxMW+WRZoVVC3PoId+7joqgOL9+usasmR5pwqX68lfeJjQuIs28MXLsVB2XJzzD0lhMGSP1Fuf3hvekBUUwuhQyqwC+oyigBM6qqTNCp1XQBfVyIwkCJ+OZ4qix4Nqjr7JyDRhjUUrhkmSZ3IlDwYt1/YOXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lN6CL2acWKZy0CwSo3JdCf8uGHAVsrZgEb6HlVE9/ko=;
 b=S0TdVLKdI6CbMDAFZ2MybjDWb4xafa1irCQWgQD+YcVw5fiNC2nMK1UFg7dUd5ZcW5KqAXRIJZXqks9/K8VXOqKIXcZkXXJl6q5Ap4Fjc9TXwjOXLHcBTj5/dVnwpM93h+HxZxQROfVeWsJijTPPumZaiqVn6s2LTpp/MwtKFGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7948.namprd12.prod.outlook.com (2603:10b6:8:152::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 17:08:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.7002.019; Wed, 15 Nov 2023
 17:08:46 +0000
Message-ID: <70b35a0e-5ccd-4e19-a8ac-4cf095007a69@amd.com>
Date: Wed, 15 Nov 2023 11:08:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] PCI: ACPI: Detect PCIe root ports that are used
 for tunneling
Content-Language: en-US
To: Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20231114200755.14911-1-mario.limonciello@amd.com>
 <20231114200755.14911-6-mario.limonciello@amd.com>
 <20231115104019.GY17433@black.fi.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231115104019.GY17433@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:806:28::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: bc14c823-7c88-4fed-0819-08dbe5fd8742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pEdZM6wq5b1iGSH0ENTWoRV5IZQVklBGbIXMGdCks7NFOoG8AQECbkuKa+IiRGJTQccj7CJLjGA1s2KE8ZR+rHeZ3fBaaLoWt4Ya1dVnzK/F2Y6nJ8rraT5BDrK0x3HBKvDi4CDT/ED8JyohOq/TtLXd+fc9ibyH7INfcYqPUQ0bxkspJN6HcqS1h4MaZqtJrGKvoxA3t11EeVrpVOWqaR1fwjwN1eyWGEf8O3G73CMrxQ2ocNibqaMRbIYYDx4/a0g18PGCBskrNvsHpOq31XFDEnBUFLWp1uVccktfevoQ8UPDjx4v/iupH0c5+GYhfWQ9r5xo4ZoLuXkdaqnYN6CmmsZndN3TPjG6N1br08+ZJAZkQFbzv/9LLoEOnfsyfKnH1juZ0WbmYl+xj2dViK5QW97fx/b0KTY1YAmkWAU2uac08lEgeSeb1VNdBTxExu0EUDytkSos8TMRWuzQmZs81pUhmSB+3uIjgcNkarMbB2CAWSkCT9G/WyqvUkvJsYdOPdqvUgMrV9aqAtNRxpAauv58Yaa3DQ1tVuO/HRGGf25YnzpADDxa9lR2SwqVms7m9xjbzsm2Tqa3mXRxZlecT1sl0ecjGBrKqyuTvnLC7IeDy5cIVf7lguoAvSa3UogDelq01PGKoqe/F1z7Bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(376002)(136003)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(31686004)(6916009)(6486002)(66574015)(316002)(6666004)(53546011)(4326008)(83380400001)(6512007)(41300700001)(2906002)(8676002)(5660300002)(6506007)(7416002)(44832011)(66476007)(66946007)(54906003)(2616005)(66556008)(36756003)(478600001)(8936002)(31696002)(38100700002)(86362001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVJlNVJJTmd4SlIxWmNQM0xFRVFWYTdZd25SRHF0RzFGbEhYTk1Zb0ZrUHlG?=
 =?utf-8?B?U2VhMlVtZWVZT1pCekNHbWNiZ2NmcnIxNVZzOWRRK1ozYnJsOVl3WFFjcHlQ?=
 =?utf-8?B?TDJ4VnByQk9wNStybHBkRUUybkMrNzdwUG8xRVkxQ2tqaXk3eEoyMnF3eVFU?=
 =?utf-8?B?SjZqVS80NFVjT1EyS3JQU2h2eVUzblNPVlFJK3RHRG1xZGYyZmh1UEFmTkhk?=
 =?utf-8?B?UGJxank5clZ4REJsRVpQbGdFWmhxNTR4R1V0bDV6cngvSnN5VkF5WC80akIr?=
 =?utf-8?B?bURBc2IyR01zMW13ZTlGSSsvZTNkYStzSkgxbWh3SjFESzdtem1DQjdKdmRV?=
 =?utf-8?B?VHYya2ZXREhDUGV5NURKZUl6UG0zUm8xNHhkOHFBNHc4QXdkZ0g3ZXFkYk9o?=
 =?utf-8?B?T05FRi9GY1I5UExaL1dzcDJsK2NVRjFaTzRyZ0wxeFVnN2xkVThxL2V6dGhB?=
 =?utf-8?B?My8rdkIrRzBLMWcxNXJ5WWQ1eHZJWmFLM2RGSDl6YmI1TWpwUlVKWkU1MStS?=
 =?utf-8?B?YVpNYXdOc0laeTVjR1BDZXZ6QWcxeGxjZVJVMGFxZnR1YVhyNEo5emZCQzBi?=
 =?utf-8?B?a3VEdUxIL1M1OHV1ZGNNRmNKZXZHRVNiTDhuNSs2ZVNCY01kcjBZN0FVRmgw?=
 =?utf-8?B?aXdZK2k1Z1RlS0E1amw3MmE3eGwrWjVBamIrMzlFU3hTcGo3R3Z1cUZtOThM?=
 =?utf-8?B?aGNHakZxeWFHSVF4elZDL0p4U01aZTNuTUxGU3RwVlk5WW5nbG05eStwbUtT?=
 =?utf-8?B?cGgwN1kzb0hnc0hsWUNtNy9TdFg1ODlUSGN2SEhyLzh6VkMzUk9GVzJnVlNt?=
 =?utf-8?B?SzFSYlNzS2IxMENpckNWUVM0amZpUExHdW5tbWoyUFR1ZERVM1h5SWVTWUty?=
 =?utf-8?B?Y3dTeVNrTmdtYm96T3lqNFFjM2dwN2NONWhqUWZjMjJZN3hWSnJ4RXROVlh5?=
 =?utf-8?B?TlBYNElRRFdQTE84ZEpqdGpxRy9vNlRHMWpQNm5vVENsVHlzRXYyd1lvOEFu?=
 =?utf-8?B?OWtiZk1LT2NEcGEzUFdFYkJvMmJZOVZvZjlJeDBPMGM0Unl2ZldPYkcxTDBU?=
 =?utf-8?B?aG9Ra0F4eXU0TTJHR1FFYVVEV21SQjBuU28vRmJPeUVCajlLajJMUjhGZ0Iy?=
 =?utf-8?B?cU9waUZzM2lxbkRCa1RyV1djL3VXM2ZOY1Q5ckswOHp4bmNHQWRzU3lBT2Mz?=
 =?utf-8?B?cnpoVFhIV01wQS9iUUwzZ1dYa0Z3ZlQzUmFlYXU4TVR5eUZWN3prSWtkRlNJ?=
 =?utf-8?B?ODFtbCtIZXJ1VTFSZVE1ZndXcVVPcXZ6Uzk0T29aV2Z1OFI5aEVKd0RUaW1s?=
 =?utf-8?B?aHVpV0hFdllrUllvRlkra0NXOHd4SXJwcXMwSk1pWFRhTkdtQmRTNXY5TGNI?=
 =?utf-8?B?a01ERHhtT0cycm12YXVjMXBNS0tNc2lYQ1pWYm5WZDBtbzFPNkMwaTZEVzZH?=
 =?utf-8?B?VHltOXQzd0ZMemtQNk1MRkpheXdXZEY5WU9tTGVHMnRrT0R4Tmd2NE1DMmxo?=
 =?utf-8?B?dnM2aEhUOVU3dUcvdWpZeTd4TXNwWGV2ZDRJb2pROFJZSTh3dkNlOWpYbmpG?=
 =?utf-8?B?MWE3NW9jejVvME5sUTMvNTFmVzl6SGRUOE12ZzZWN0RsTnh5U2ZoNWEreEJP?=
 =?utf-8?B?bEY4eUFObm9IZzRPQjJYU0pUMG8yZjJpV1FIZlAxVE1KQlJialIvK1k5MTAw?=
 =?utf-8?B?S1hWdWpYQi9nRmNsTS9HcElTRmpXWEo1YVRIbERmdDBheXBXZ2NNdTUrSEwx?=
 =?utf-8?B?NWMvNnlKeFZIZjhrWGJWcU85Rml5a3JnQjlKNzdRdXA1NGQ3eGF3Q2l1aGc5?=
 =?utf-8?B?VmZQMFVDL1YzVHFYc08wdnFEM2lreTVEN3N5TFFWa1lNV3lKYnFSd290dGYz?=
 =?utf-8?B?Y2N6SmlBQjMxbE9LbGRuWUpOdlFHSVExR0JaeHJJMHFoYTBuYUg1bEszRGdT?=
 =?utf-8?B?Z1U1OHFqZmdmNGU4S2VQR2RBSlcrTzBpOFMwSjBDeCtzTm9SOVVXMmtsSFU3?=
 =?utf-8?B?RGRTWkI2NXNDNW1KOEpqT3MwQ0xlZmFrOFArWi9aZDFvQ1pyZk9QUFVHNDFy?=
 =?utf-8?B?akU3NVBZV0k5N25XNmtLd29KRjg2MmI3MG84RlhMckJVaGU2cU5zSi9sTlNJ?=
 =?utf-8?Q?vZJ6uymqoNBms8G/FSMZL2PxI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc14c823-7c88-4fed-0819-08dbe5fd8742
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 17:08:46.3441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEiiFuwE+NvGO/VwH7j9JFZSw4N8Y/OeFrGEhY0DUXJIglWvnMb4C2rOGF9oDvsZdePyh7qMbMEVBSgMN6dI5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7948
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
Cc: Karol Herbst <kherbst@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/15/2023 04:40, Mika Westerberg wrote:
> Hi Mario,
> 
> On Tue, Nov 14, 2023 at 02:07:53PM -0600, Mario Limonciello wrote:
>> USB4 routers support a feature called "PCIe tunneling". This
>> allows PCIe traffic to be transmitted over USB4 fabric.
>>
>> PCIe root ports that are used in this fashion can be discovered
>> by device specific data that specifies the USB4 router they are
>> connected to. For the PCI core, the specific connection information
>> doesn't matter, but it's interesting to know that this root port is
>> used for tunneling traffic. This will allow other decisions to be
>> made based upon it.
>>
>> Detect the `usb4-host-interface` _DSD and if it's found save it
>> into a new `is_virtual_link` bit in `struct pci_device`.
> 
> While this is fine for the "first" tunneled link, this does not take
> into account possible other "virtual" links that lead to the endpoint in
> question. Typically for eGPU it only makes sense to plug it directly to
> the host but say there is a USB4 hub (with PCIe tunneling capabilities)
> in the middle. Now the link from the hub to the eGPU that is also
> "virtual" is not marked as such and the bandwidth calculations may not
> get what is expected.

Right; you mentioned the DVSEC available for hubs in this case.  As I 
don't have one of these to validate it works properly I was thinking 
that should be a follow up.

If you think it should be part of the same series I'll add it, but I'd 
ask if you can please check I did it right on one that reports the DVSEC?

> 
> It should be possible to map the PCIe ports that go over USB4 links
> through router port operation "Get PCIe Downstream Entry Mapping" and
> for the Thunderbolt 3 there is the DROM entries (I believe Lukas has
> patches for this part already) but I guess it is outside of the scope of
> this series. 

Yeah I'd prefer to avoid the kitchen sink for the first pass and then we 
an add more cases to is_virtual_link later.

