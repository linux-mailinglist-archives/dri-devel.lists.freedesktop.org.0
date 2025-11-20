Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E458C721FB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 04:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7253610E6DB;
	Thu, 20 Nov 2025 03:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b47f3xfn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012037.outbound.protection.outlook.com [52.101.53.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E7710E6DB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 03:59:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXSjYRyk1sAh7hN7PSkn48MHvUJU95ypw0HBLaSKmVUAn5Fqeza0bIxOpRT3gmL2enL3xxE7kujhlhJ9BHk90Ygdo2U8kUo6ZSN83J0Y0vcQgxR+A0UKUlJO3++Gh7Se5zWWrt5cwmKQdQL/WxhxqrPhZQ6gEnzl1hctmfdETIsGsRKsLxVllwAjv9537H0wBqV3rJwXQedYV/94zenSkNK59aKCjw/MW0ZrDFQJrTW9mEGqztCgJQEbICjvlCw1FtElrj7epsCulz9BvxKIAHPNHiWWOKx5BErmf6EYVvYRbHjrHtfbsHRjZN89mFFjllTWuxVXITH2/vYkSi+H8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnpLOHXeUtlamqUeAxA5GCgSwbFF4wH49gnRajaIeYo=;
 b=oEFVwi2Hjd96q6K4NfdkQ6VU8EWoiKyXClF7lBKVAAPZ+v9WkPtw3ofYLNaRfEtbOnPqgWG5bN99xRYhbu53Czbslss6Hx/XjyS4sHdP2sXsH4r2dGKzy97DEN3Mu5fZgFugctDcbOPWQJqL6DXF5bd5HIJ3MN9+SpZY/sBM4zsBDmYLriG7qVpt1/Gwb6erwZEmPaBo1ydovbeuxd/cefrepPMUczywH7arVKm38JWcCHStAqyJ/VmbnSeLZTTorEpokytjNxmuM/efFSPkjD80ti1Dg93IPzeMZSlLmcZre8VCkqZEYMW37MnVTwW4y6SaBbVvB59lj/IIF2h4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnpLOHXeUtlamqUeAxA5GCgSwbFF4wH49gnRajaIeYo=;
 b=b47f3xfnH1mq42zhvorGEjznbGUwCvTqRFjCEVGkzboC+HmhYz7CxWefdUG74He5R9a2vA9+UM6E+BrY/t+hwSim564aRLC3mmoDkAoOzlrNhmydizqa4UR7k08E1bNw7x8bE3ovlKoNLnJY8rQLK1O1mr8Xlf+/dUEIupEPzlMD9bEcOcI+1H5ArqWdr7Z2qzcM1c46GHJ0yIcze0uHHTF5i5E96bJf40MNkou/9r/+PVb5DBTBYhHOEuwJUIXWfbkH+RSn63ZUKinaHDsHP377lxP2mLwInTEtFt4L4u2CnM7oWqUwyUTXLVnAkCLglDhYQjaEiAq1VR2+i/GkTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by CH3PR12MB8331.namprd12.prod.outlook.com (2603:10b6:610:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 03:59:08 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::ea7d:e30d:fd74:c9e2]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::ea7d:e30d:fd74:c9e2%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 03:59:08 +0000
Message-ID: <e8efd187-237c-47c7-ab99-33183e0988df@nvidia.com>
Date: Thu, 20 Nov 2025 14:58:58 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 00/16] mm: support device-private THP
To: Matthew Brost <matthew.brost@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251008201740.d9507f4807a73058d4da23a8@linux-foundation.org>
 <a5992f11-5841-4bbf-b190-b5df41b68b0c@nvidia.com>
 <aOePfeoDuRW+prFq@lstrano-desk.jf.intel.com>
 <20251111154326.bc48466a6962fbbffd8ebdd0@linux-foundation.org>
 <7a0f2704-80b5-4cbd-8f3b-ac03692eefd3@nvidia.com>
 <aR5/uUFboeeSwN0z@lstrano-desk.jf.intel.com>
 <7ecb3faa-8bc7-4eb1-9342-404a9ff52b97@nvidia.com>
 <24d8d39b-5ebe-4f29-93ff-3f7ca2a9b1cc@nvidia.com>
 <aR6HtvxhmVxUvd+h@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <aR6HtvxhmVxUvd+h@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:a03:333::10) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|CH3PR12MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d6e180-8215-4aed-2452-08de27e92771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nk03dTcxTjdnZytzRUNvN3BCcTAyU3BqZ1dRV3k3eTR0Wm5uVkZhV3Rwei8x?=
 =?utf-8?B?dzFpNDJ2L2cwbmZZL2RPRitmbnhpNVFqZ2FYUmdJNnZITlZENjBTdTcyRURK?=
 =?utf-8?B?K3h1SEticTYzTERyQWxaN004RDFnb0VBRHBTZlN4N00rNkl3a0d0eVFzRDdy?=
 =?utf-8?B?YjNjRllPODNYb3FWbTdwZ3g5SU0ybTN3dmUxRnFLelBSOW1Nbjk4N0twU0t0?=
 =?utf-8?B?aWdVQ240TmdjWjRvZUFwVEt0ZXhKWUx2UG1UOTBaZW9BdTUwUDZvWGM1Nlow?=
 =?utf-8?B?eGMyOUhDdFVSWVhKTER1cUFVSlhlWVVYWnlyTXY2cUlNeTBnQ2pNT1Z5ZXda?=
 =?utf-8?B?N3RaMTl3c1NQSWVCbXJSdDFiSDg3TXVRaWRwa1NHRU9CQ2R4VTJ0YjVvMHlX?=
 =?utf-8?B?NklzM3d4aXU3aG1rS3dxdnRITTJCaWNPUG04cFk1OHNMMzAzQjEyRmV0Vzli?=
 =?utf-8?B?ZnZTVlE4RjVFV05HM0VxQ00vV1pKQmtnZHVtSm9TM0RoK2ZWeWhmRmJCaDFt?=
 =?utf-8?B?UUcxOWN2ZTNuWU83alVCZm9jNkhZZStQcFNsYW9tNEdrenJkR0xlSjUvelFJ?=
 =?utf-8?B?Q244ZTdOZWdUSXBCQnU2TU1MMzFPRlM5Tk8va2NZQ3hud3JkbTVnQzFFcTA4?=
 =?utf-8?B?SVpjUVVMS2ZFWUFGdXRZaDRYYjAwdEF6NS9lK3lkT2lCNjhETi8xaWVINWZm?=
 =?utf-8?B?NWdkc1FIeHJDaGtNZmplMG1QVWE4SE1CaVJXNkJsQ1dGc2QyYlV0QVBOTGxM?=
 =?utf-8?B?QXN4RHpzLzBlTU4wU1hTditTYXJVa3h2NmxmSHZReURpRkRMOE44MzhkQTJN?=
 =?utf-8?B?TUt2ZmNMa0JzUjZWeThmMFVYUVNHLzlHdmxaSVhOY2puR3k1ZDBJUDRDRUpk?=
 =?utf-8?B?aS9odEtmYW5QMGRTMVB0c0VYekZDR2s0QmREU0YrWjNaWnIxMkIvTUFmMmpN?=
 =?utf-8?B?NTFGMjRqSUNCRDVtVXBOaDJmeHB5VW9yY3ZWajBtdDM1Wi8wSVpML2I2SnZM?=
 =?utf-8?B?OUpjdTZ6VUJNVUU4eDFucjk0MXo4RCt1UmpoQ2JEZVU1MzgwTGFlMlh0akxS?=
 =?utf-8?B?RnNRZXlxbHB1blpQYkcwU3krdDVTNmV2Sjc3WjVrSmNpZVVUdjNqQWRqV3BJ?=
 =?utf-8?B?Mk95UUNsV1FvbE94QnM4a1JHa1RCZ0R1SzI0QXVrUXBoUzBNbXo5aE5iaFRO?=
 =?utf-8?B?MmVrc0RXL0tpdFE3TXFuWmJMNEk4V3hYc2d6QlZsQVJudGhHVFgwQzVnN0dq?=
 =?utf-8?B?a0VZbFd2VVdaNS9WeGdIcnhFNjFyYzBJWVAxUUtnZEhpMWx0ZnovL1RLZUwz?=
 =?utf-8?B?Z1p4YUJzcGlpUlVjVVJuNG9YeHh6elYveVVoTFptMFNpRVhMQjlkUG0rNUJO?=
 =?utf-8?B?ZzFuaWczTzB0ekllb1NkTVZxMDFaY2dvcHg3Ri9MTGNFa0FFV1phZkxOVjFW?=
 =?utf-8?B?eXlLRnppYkdsMmNpdk5CbFRjd3k3dFRJQWtkc29KS1VuRExEVWt3b1Z3eU9s?=
 =?utf-8?B?UVlmLzNyM0FwaVpuVXhzZDBneEpVWnNqQzhaVE5ZaHBNWnB0Nk5laWdIUjM1?=
 =?utf-8?B?a0pEaGZaQUlHSDBtZ1J4ejRmaHFQbVhXTTAyZnZaN1M3VTNPK2VkWkVPd1Fo?=
 =?utf-8?B?WVlRUnFyc2dkaVZkdU8rRDFRTXNZTTVUSExFOGtkOFRLWTcxSXVtMEVneUFw?=
 =?utf-8?B?M25wVEF1VHhmZmhORHBzdDg4L3BNMGh4MU84aHRKaVM2RXU0UGRxSk9BUlVq?=
 =?utf-8?B?V2h1MDd5aVVRZG5RRUhHOXF1NG1MZkt3WUVPWEt6NnRsRWZiaXFXSTExeis3?=
 =?utf-8?B?VStvSWJrMjYycWpxOHBaajFXeGZHcGRmYm1icHpuSzFPeXY5enZua0lpRmMz?=
 =?utf-8?B?cW9ibXYrOEV1LzdNTG5Lekc3ZlpWU3d4aFZIYlJtZ3dNM1BoZ0tVcGpLbEpL?=
 =?utf-8?Q?5rva02VR7xLUNUFwCd8vOBoxNf0ug8Ae?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTVlT2FYZG5RYXRwZlpmc095WU81ZkUxQmQveGJ1STJ3bUNrYktla05XRU9L?=
 =?utf-8?B?RVo1RjRSQTU2NEFWbE1DazdMTitJRDhoVW55UmpyNDFLaTQ2Um1Fc1hYb1d5?=
 =?utf-8?B?RUt1dmtpRnphdmxCS3lIZ1ZuRkdiQTZKdXovT3FMT0phYkx0MkN3bEIxMFpo?=
 =?utf-8?B?TmZUbThxWFljYllsYWNDYTU0dXZyb0VqaDlpR1VueUFRdzg3bjQ5NGNsMkYw?=
 =?utf-8?B?ZDhYZjU2T2NoKzdDbWY2MGVOSmJjNmI0Y0hUMk1MTy93QXk4R0dKWkRrN0hN?=
 =?utf-8?B?eUlxK2VzSGptYjNpTzZGcUIxVVRUVENVUWdpRnpoeVFQeVdjZ1g1MTNFWEFn?=
 =?utf-8?B?blAvdFM5M2IrNEtGZVFRQUNVWUNxNDJDUzB2N3U1WWlONzJGdUFHYVFYR0pt?=
 =?utf-8?B?NXBDZnIrOWM1ZytwdGZFVm5UYjk4VEZvMXBXMktZRDM1bGZMdzUycVdqZGx4?=
 =?utf-8?B?N1V0Vzk1WlJhNS92N2ZQTHdDaTJua0NHbVg5bjZzZjQ0SWFBV3VHcFZMNHNH?=
 =?utf-8?B?VU1lMkRjS0NXekFxUnYxYWpPb1A1NThXUFZlbldaeU1sTVVZV3JuUmt0ZVpl?=
 =?utf-8?B?aUJvSmtHZGo5ZWVhSXhmLzZhZlJyRGpjR2dac2wrVHlTZnljeDBRYVlYMXRo?=
 =?utf-8?B?OXhmRXBjajlvS3FSbEpwUTFPZkpSTTNiOW5NUVlPU1NiUkpzOTRDQVZPcDRF?=
 =?utf-8?B?eWswZVBTdTRaa3M5djZrMzlMWFNBcGdRTzZMeFFKdStrNlpSMDFDUThIQ0dT?=
 =?utf-8?B?aUNKbHBwMlFocUx4Q09TeGJpUkFXN29SdjJvQUlqSG9CZmRJUXB0UGpQdXkz?=
 =?utf-8?B?WW9PZzQweHFHRGJ5VzVXQ1Z2dFFxTGNmOVJXRWdlSnQzdWNpaWtvelV2WTNM?=
 =?utf-8?B?TjY4RW9sRzlMdGlVM2JIN0tLRXA4bURtOHc1Ymw5ODV3NEN6Q0hIU3Zpc2RC?=
 =?utf-8?B?R1FzWlVkTHhmS1ZLQVM0UGsvVDNrMVdsMlFacWlYaU53L25kWmRsMUEzQlF3?=
 =?utf-8?B?RDNnOGVweTYyNEZiT0dNOEdVeTFwT3VQUEdEN2hWN1dKYzBXVEhCME1XTkxT?=
 =?utf-8?B?T1N3WWQ2LzE3eTVobUZFZ1N1akdlZnpkamRFTk5RWm0yOXd4THpwY0lkeFRn?=
 =?utf-8?B?cmFPWmQ0eXRseC9LUWQzWCtEL1M2MG5jTG1CTEtVaWIrMUtDYzVRNWtrNG13?=
 =?utf-8?B?Tk1Ja0MvYlBRaUtqK216YjEwaTJtWm00TzUxYU42d2wxbHFOcGkwZHZ4K0pK?=
 =?utf-8?B?R3hQYTd0eFF6RlRYTVdjSFc1MXhoYVFtQkFLUHM5blpqSUhpWm1DenBHWlJM?=
 =?utf-8?B?Yjhad3pySUdjNW5yc1FHbFRyNW1pL09tT3pSbThCd3dBZDRTcVdENTBUaE9y?=
 =?utf-8?B?Y2VkTjNXMlIwTzcxWG0vTGlvL3FNQ2o3VmprOXlOWlc1WWFKVmNsQm1UaW5X?=
 =?utf-8?B?dWEvc3lpNUlGdFpDNGN6UVExbjBJMUwyaGc5KzVKR2t6alc1RkYyRHpKUCtK?=
 =?utf-8?B?Q3hFL0QrTWFSMVEzbjdXRmhwa2RNbC8xaU9jRGgzYTVaR3Vta1pYeWl3bi9l?=
 =?utf-8?B?NVFZOER0bHlTUmlyOW1IY0tLS1d2c05TQlVkUEpsL2hGNUdyVERwSWdUanZN?=
 =?utf-8?B?Qk9Dc3JVbWpYelRjbi9UYVBLck45R3cyZjI2d3l0ZDlpNlpTT0EvT2dRRTN4?=
 =?utf-8?B?VjI2a21EekI5VmdhS3QzbU5EaHVxSisveGpNcUt6eDgvMmRnTGVzc0g4ZmlX?=
 =?utf-8?B?NWFETjZpbWdrcE5SMTRqeGRVRCtRUXRvTzRGSTlYME55cFlSb1lKSDlqeGV1?=
 =?utf-8?B?STRmT3U4Vmh0QUhJSE5jWnozdURvcmRWSGYvZThoKy9vck1idWZsZUEzSGl0?=
 =?utf-8?B?ZGpqN3BVcDVlNkxHVWc0YWxLQVFFMEFjNVZFVEh4bHBBUTArR1N2bGV1L2lP?=
 =?utf-8?B?S3BxWDdtZHRRNjBKQkJXcGUrZ0p2NmZrcGgwNkJpZmlzcHJpWk93blpFQ3Vl?=
 =?utf-8?B?akFSMTY1WHltSFAxUTdRZkwyK0hjcWVtNndNdGE3d2pWQU9HZldaWkF0ejBq?=
 =?utf-8?B?alZrK3hZclJtRmNJeW02RGdNSUlZeHZmMHBaTkpHc3hiSEo2a3RXMGc5S1lF?=
 =?utf-8?B?M2dyY01OQjFzRk90RTg3dXpXZzJzRHRJVHNMOTBLTzRTVGhQVFBTb0NuSk0x?=
 =?utf-8?Q?NSo4rfu0IM37npqfPGmpyECtXMKlOUb/HBCenB12/s89?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d6e180-8215-4aed-2452-08de27e92771
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 03:59:07.9169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOLONvdxwoz3i0pB1w41IBD/OchD7cw9DhIE5mAS+rmFPrcGCHMrRWpeGO+syeMyWwwHUD8jJU02chF8C4ghpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8331
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

On 11/20/25 14:15, Matthew Brost wrote:
> On Thu, Nov 20, 2025 at 01:59:09PM +1100, Balbir Singh wrote:
>> On 11/20/25 13:50, Balbir Singh wrote:
>>> On 11/20/25 13:40, Matthew Brost wrote:
>>>> On Wed, Nov 12, 2025 at 10:52:43AM +1100, Balbir Singh wrote:
>>>>> On 11/12/25 10:43, Andrew Morton wrote:
>>>>>> On Thu, 9 Oct 2025 03:33:33 -0700 Matthew Brost <matthew.brost@intel.com> wrote:
>>>>>>
>>>>>>>>>> This patch series introduces support for Transparent Huge Page
>>>>>>>>>> (THP) migration in zone device-private memory. The implementation enables
>>>>>>>>>> efficient migration of large folios between system memory and
>>>>>>>>>> device-private memory
>>>>>>>>>
>>>>>>>>> Lots of chatter for the v6 series, but none for v7.  I hope that's a
>>>>>>>>> good sign.
>>>>>>>>>
>>>>>>>>
>>>>>>>> I hope so too, I've tried to address the comments in v6.
>>>>>>>>
>>>>>>>
>>>>>>> Circling back to this series, we will itegrate and test this version.
>>>>>>
>>>>>> How'd it go?
>>>>>>
>>>>
>>>> My apologies for the delay—I got distracted by other tasks in Xe (my
>>>> driver) and was out for a bit. Unfortunately, this series breaks
>>>> something in the existing core MM code for the Xe SVM implementation. I
>>>> have an extensive test case that hammers on SVM, which fully passes
>>>> prior to applying this series, but fails randomly with the series
>>>> applied (to drm-tip-rc6) due to the below kernel lockup.
>>>>
>>>> I've tried to trace where the migration PTE gets installed but not
>>>> removed or isolate a test case which causes this failure but no luck so
>>>> far. I'll keep digging as I have time.
>>>>
>>>> Beyond that, if I enable Xe SVM + THP, it seems to mostly work (though
>>>> the same issue as above eventually occurs), but I do need two additional
>>>> core MM patches—one is new code required for Xe, and the other could be
>>>> considered a bug fix. Those patches can included when Xe merges SVM THP
>>>> support but we need at least not break Xe SVM before this series merges.
>>>>
>>>> Stack trace:
>>>>
>>>> INFO: task kworker/u65:2:1642 blocked for more than 30
>>>> seconds.
>>>> [  212.624286]       Tainted: G S      W           6.18.0-rc6-xe+ #1719
>>>> [  212.630561] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
>>>> disables this message.
>>>> [  212.638285] task:kworker/u65:2   state:D stack:0     pid:1642
>>>> tgid:1642  ppid:2      task_flags:0x4208060 flags:0x00080000
>>>> [  212.638288] Workqueue: xe_page_fault_work_queue
>>>> xe_pagefault_queue_work [xe]
>>>> [  212.638323] Call Trace:
>>>> [  212.638324]  <TASK>
>>>> [  212.638325]  __schedule+0x4b0/0x990
>>>> [  212.638330]  schedule+0x22/0xd0
>>>> [  212.638331]  io_schedule+0x41/0x60
>>>> [  212.638333]  migration_entry_wait_on_locked+0x1d8/0x2d0
>>>> [  212.638336]  ? __pfx_wake_page_function+0x10/0x10
>>>> [  212.638339]  migration_entry_wait+0xd2/0xe0
>>>> [  212.638341]  hmm_vma_walk_pmd+0x7c9/0x8d0
>>>> [  212.638343]  walk_pgd_range+0x51d/0xa40
>>>> [  212.638345]  __walk_page_range+0x75/0x1e0
>>>> [  212.638347]  walk_page_range_mm+0x138/0x1f0
>>>> [  212.638349]  hmm_range_fault+0x59/0xa0
>>>> [  212.638351]  drm_gpusvm_get_pages+0x194/0x7b0 [drm_gpusvm_helper]
>>>> [  212.638354]  drm_gpusvm_range_get_pages+0x2d/0x40 [drm_gpusvm_helper]
>>>> [  212.638355]  __xe_svm_handle_pagefault+0x259/0x900 [xe]
>>>> [  212.638375]  ? update_load_avg+0x7f/0x6c0
>>>> [  212.638377]  ? update_curr+0x13d/0x170
>>>> [  212.638379]  xe_svm_handle_pagefault+0x37/0x90 [xe]
>>>> [  212.638396]  xe_pagefault_queue_work+0x2da/0x3c0 [xe]
>>>> [  212.638420]  process_one_work+0x16e/0x2e0
>>>> [  212.638422]  worker_thread+0x284/0x410
>>>> [  212.638423]  ? __pfx_worker_thread+0x10/0x10
>>>> [  212.638425]  kthread+0xec/0x210
>>>> [  212.638427]  ? __pfx_kthread+0x10/0x10
>>>> [  212.638428]  ? __pfx_kthread+0x10/0x10
>>>> [  212.638430]  ret_from_fork+0xbd/0x100
>>>> [  212.638433]  ? __pfx_kthread+0x10/0x10
>>>> [  212.638434]  ret_from_fork_asm+0x1a/0x30
>>>> [  212.638436]  </TASK>
>>>>
>>>
>>> Hi, Matt
>>>
>>> Thanks for the report, two questions
>>>
>>> 1. Are you using mm/mm-unstable, we've got some fixes in there (including fixes to remove_migration_pmd())
> 
> remove_migration_pmd - This is a PTE migration entry.
> 

I don't have your symbols, I thought we were hitting, the following condition in the walk

	if (thp_migration_supported() && pmd_is_migration_entry(pmd)) {

But sounds like you are not, PMD/THP has not been enabled in this case


>>>    - Generally a left behind migration entry is a symptom of a failed migration that did not clean up
>>>      after itself.
> 
> I'm on drm-tip as I generally need the latest version of my driver
> because of the speed we move at.
> 
> Yes, I agree it looks like somehow a migration PTE is not getting
> properly removed.
> 
> I'm happy to cherry pick any patches that you think might be helpful
> into my tree.
> 

Could you try the mm/mm-new tree with the current xe driver?

In general, w.r.t failure, I would check for the following

1. Are the dst_pfns in migrate_vma_pages() setup correctly by the device driver?
2. Any failures in folio_migrate_mapping()?
3. In migrate_vma_finalize() check to see if remove_migration_ptes() failed

If (3) fails that will explain the left over migration entries

>>> 2. The stack trace is from hmm_range_fault(), not something that this code touches.
>>>
> 
> Agree this is a symptom of the above issue.
> 
>>> The stack trace shows your code is seeing a migration entry and waiting on it.
>>> Can you please provide a reproducer for the issue? In the form of a test in hmm-tests.c
>>>
> 
> That will be my plan. Right now I'm opening my test up which runs 1000s
> of variations of SVM tests and the test that hangs is not consistent.
> Some of these are threaded or multi-process so it might possibly be a
> timing issue which could be hard to reproduce in hmm-tests.c. I'll do my
> best here.
> 
>>> Have you been able to bisect the issue?
>>
> 
> That is my next step along with isolating a test case.
> 
>> Also could you please try with 10b9feee2d0d ("mm/hmm: populate PFNs from PMD swap entry")
>> reverted?
>>
> 
> I can try but I highly doubt this is related. The hanging HMM code in is
> PTE walk step after this, also I am not even enabling THP device pages
> in my SVM code to reproduce this.
> 

Thanks, do regular hmm-tests pass for you in that setup/environment?

Balbir

> Matt
> 
>>>
>>> Balbir
>>>
>>>
>>>> Matt 
>>>>
>>>>>> Balbir, what's the status here?  It's been a month and this series
>>>>>> still has a "needs a new version" feeling to it.  If so, very soon
>>>>>> please.
>>>>>>
>>>>>
>>>>> I don't think this needs a new revision, I've been testing frequently
>>>>> at my end to see if I can catch any regressions. I have a patch update for
>>>>> mm-migrate_device-add-thp-splitting-during-migration.patch, it can be applied
>>>>> on top or I can send a new version of the patch. I was waiting
>>>>> on any feedback before I sent the patch out, but I'll do it now.
>>>>>
>>>>>> TODOs which I have noted are
>>>>>>
>>>>>> https://lkml.kernel.org/r/aOePfeoDuRW+prFq@lstrano-desk.jf.intel.com
>>>>>
>>>>> This was a clarification on the HMM patch mentioned in the changelog
>>>>>
>>>>>> https://lkml.kernel.org/r/CABzRoyZZ8QLF5PSeDCVxgcnQmF9kFQ3RZdNq0Deik3o9OrK+BQ@mail.gmail.com
>>>>>
>>>>> That's a minor comment on not using a temporary declaration, I don't think we need it, let me know if you feel strongly
>>>>>
>>>>>> https://lkml.kernel.org/r/D2A4B724-E5EF-46D3-9D3F-EBAD9B22371E@nvidia.com
>>>>>
>>>>> I have a patch for this, which I posted, I can do an update and resend it if required (the one mentioned above)
>>>>>
>>>>>> https://lkml.kernel.org/r/62073ca1-5bb6-49e8-b8d4-447c5e0e582e@
>>>>>>
>>>>>
>>>>> I can't seem to open this
>>>>>
>>>>>> plus a general re-read of the
>>>>>> mm-migrate_device-add-thp-splitting-during-migration.patch review
>>>>>> discussion.
>>>>>>
>>>>> That's the patch I have
>>>>>
>>>>> Thanks for following up
>>>>> Balbir
>>>
>>

