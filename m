Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99397B87E1F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 07:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5D610E930;
	Fri, 19 Sep 2025 05:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HJr7Y5Xv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011033.outbound.protection.outlook.com
 [40.93.194.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9126D10E930
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 05:01:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMtlpnvPKYBPrVEjU6jmDueGIP+UcXRYAFZs1zw9OrFFW06qVLU8fyWcIuO4a7HedvKtxrvehS+cmjcWGixSPz2YkTolKQx+coHmOoyAwtBeXkmnT+x3GwPxr/yYvLHYjo9BHJuiZGdRN1mEGQ6AemiYcFaOm0kFVeXX51jA56C2I1IvL5Ej7tTzLUHGBmMh4wgT5tgY49PzrWIRM2NIiqobBA2U0NURALSb5gxQHTR52rZdV8dCT12F5+k4Tc6v6eXFrC+xbhq3ULu+trNBHFsGQRKO5b0cvY6AOqs14G1/Z82eGXHARaXVhmtNaFw2vqwjOjpezdqf/nrRGDRkKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJOb5JoAR7WLbMJyYInCbH0lcgrTYgrBU+y+OvfHdX8=;
 b=sKRsmSyiEK7GWJCPHl78enARPHZuNQt1eD/5DdrAFVOLe2xu7v/U7assRXC1liTYgMO3LXQvbuVvcvhI++Z19Z+scWl6BPk/hmKZdA9vJDXcGFaZr358mFZ/TY9yu+X68ZUPdiuMxB7VbAdCZ3wjUf+Dbv5mKjFBM3mxrrtPg+oU85bYXn/7dkK0TU/itI3+MDyJ+/Q+BoxEeUSI3spwrgezV8BE2+oGUCkZ3YUg2fgSsgDkvY9hX1RbSnHn33R9pvtfTXzxPTgqsEZYHOvkkJnxjptDlMHEwP2wZCVkPCDlUSa9kwGjChddgJ1+MI8LVk+MVOG/c96QVJMEg5kGOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJOb5JoAR7WLbMJyYInCbH0lcgrTYgrBU+y+OvfHdX8=;
 b=HJr7Y5XvPW7Lllhfp076HVGyzUIgXVr+bhHDhKGRUCfKJ3mzETuWWX7CkXTgjn0013+DQ5oQNJxI2u0UCs4FpqoKUl0XNj3esFx8/Xim51nKghBs+9A4j3lizP10hTX+Gpr4pvpFlXjr9/LEVdxpMyDAkgETe9gZbrvaAihtUuzdCC/CdM4uCgQUBf0Kzvhpx2zW2Iz6lj5mj7bYZwL8p/u8kTYTG38dsmDgJ0Upc/4HgqRTvC7xh47QjVy28D+hywDaPapMIgWh3Wj0mZZyGPts9XUO1p7c09v6Sj1Y2og8FOzt6fF6xC5at8XGXzJimcihyxO/CiLsWeJHRBBb0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 05:01:22 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 05:01:22 +0000
Message-ID: <f026c5a1-ec51-4fa5-bc58-c2d690f9248c@nvidia.com>
Date: Fri, 19 Sep 2025 15:01:15 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 01/15] mm/zone_device: support large zone device private
 folios
To: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
 Alistair Popple <apopple@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, damon@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-2-balbirs@nvidia.com>
 <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: cc97dc4f-b1da-40dc-1529-08ddf73993f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzhIMzQxeGVpeVZKdmp2b0tHRWVwNWFPNGdMcTQwU1o2ZURpTkxiMnBqTDc3?=
 =?utf-8?B?aFVnbm1lNlh0TE13MzBCTmg1YXh0aE1ic1NLMmhVaUNVdjBCeFZZK0VmU3ZH?=
 =?utf-8?B?Y2JZT3hQZEtMYXBFbGN6TGxVR3RYeHVseWtPT0EyRWtPWktSbGR2eEtoVUI0?=
 =?utf-8?B?MDNQRnJnWHFBUzFQY1lWdTkzazRPa3BXbjk0NWlMZENIdmNZL1ZjanlGT0dq?=
 =?utf-8?B?REdld0ZyWU5RSlZnakpEWUhENkt0aC91MmxKSUpBUnRvek9zbXdqd1I2Mnpa?=
 =?utf-8?B?cXdiZnFKd1BITkcxUmwvUFhKdmhOdEU5eHN3LzFKSlhsMEpCeGQ0OEZSdCsy?=
 =?utf-8?B?Y1E1b1M3d1NzL2NERGcrZ1ZLdHhkMVl3U1A4TXlvMkVjR1hLUWh0eVdicHZG?=
 =?utf-8?B?dy8vdHVZTVFoTGNMbGxZbVl1TXNEeVRwN2dPYVlnbG0xYmdUeE5RcysrNkZp?=
 =?utf-8?B?aklPQkdqb3RXcmprRHVFY215eS92UWxIajMzaTBWcTFQZmhiVWg0ZXZ6ZVhN?=
 =?utf-8?B?U0ZobUZrc2hyd2JRRVRLZFB3bW5zaWo0TGtYMEl6Zld6QitIS1d6bjdsb0dy?=
 =?utf-8?B?dmVKR1RjbjVmZ2N2b0E2RXNXaWZ3SlZySlUzM1UrVndyU2lueWtRV2c0TDl2?=
 =?utf-8?B?ZmE0YkhDK2hZdGRURHRlUkxjMmdZaE90QitSazRuRStyZlVyTUt5MHRIT1lT?=
 =?utf-8?B?SkppQ1FQUnlBa0MvWjRlbElQUVhTbEIzcDM4N202UitnaWg2R0NRcjhKZUJF?=
 =?utf-8?B?OWcrOXZtdkI0ZFlYWmx1ZlFNOG9LcEVaeERoZjMvR0hCd2ZDa0E3NW1xL0RE?=
 =?utf-8?B?MjRqL0MyQWg5ckJCN2dSeEVnL0ZwN1NVbGo2ciswNHQxREhOa2M0ZzBybmhU?=
 =?utf-8?B?Mk51Nlc5di9YL1JlYTNaTXRiYVlHMlM3My9wQnVVN0V0NzFmejRYdUtWWnpU?=
 =?utf-8?B?WHFZWFFtb2xWLysveXIvL2JaS1VINEo3cUNNMWl0QlZ4Zng0VWl6c3BWaytT?=
 =?utf-8?B?elR4TDB1ekl4QWhEaWd1SlNTZUNpRTl3aUIwNnVSK1h6RFI4YnVsQmhWRTVt?=
 =?utf-8?B?WmR0eEJkamo0VS9OOEMzcFVlaE9CWHdBNjNrWEhZbkdmMWZvMGh4TFJJRXZJ?=
 =?utf-8?B?dFdob1daUTlUckQ2STVzdkI3UTBMRG96VnpIQmpraWZwZlZETlVkUDhHNUJr?=
 =?utf-8?B?N3VvT2I3dVM1cGNYbklZL2VuOFJkYUQzbE5UaEVRdlNNYXI4YnRrZ01UM3Z2?=
 =?utf-8?B?U0QvdzRUaGk2ZHdvMm5rc0Z4bWN0dWxsRHdaZ1VuOENBdjVGMXhIaTd1V0J1?=
 =?utf-8?B?NlFxN0NNMHQrUURtTXhXMDVSK3VHejRKSDZZbVVwRGlEVWRuV25CZnd5c1R2?=
 =?utf-8?B?K2trVG96V3dNVHBzSTJibTZXNVZCZktoWEdBb3N2UzZOT2NITVZRT0RDa2cx?=
 =?utf-8?B?TzNPNFYzSmg5YmhpQzFrV2l1K1FTTmpIb29wc0Q3UzMvVnEyM2FTU2FML3FY?=
 =?utf-8?B?WmY0U0VDanJ1TkhlUWNqYjVxMzZaa2t1T0JmSGdXYXI5czBWUnZFMWJiZitK?=
 =?utf-8?B?NktiM09HYmVweVoyM09DTStjZ3RyOHZPWXZuclZFMHdob1Q2ejdTRk01bXF6?=
 =?utf-8?B?YmpRZkcxRnNWMFhwQ0lKdFljNmppOVg3T3VDK0FkT2VudGpCVzlvcWlQbFpS?=
 =?utf-8?B?UWY0dkthOXZjMVRqS2dkL3IyWWJmL3NVNzBOVkNvcklNYWN5UlZtVzV5V2ty?=
 =?utf-8?B?T2pTdCtFRjVxVVMwOFZ1cGgzeW5qb2YwekxWNmxMYkNEc1liemJoWGdFWWRJ?=
 =?utf-8?B?d3F5RlhrSWJscndqKzNFSGFGYlBEQkhrQVJqZmUyZ3hNZUI2U1VpQUJZRWl4?=
 =?utf-8?B?aUtIS1o3YlNId1k5a3RLMk50TU9TZXM2djBoZ0FtMk1IZHdsM0NJN1o3ZTVC?=
 =?utf-8?Q?dRG7QcXPfHI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1ZsNit0SFA1OVU0U0VpS2tTZ3d2dWs2enhCRzY4Ym9XeVpRaUpoM0l0Umwr?=
 =?utf-8?B?NHIyNlBDTnpuS2VuU3NNK1NtVWV4WHo0eExDUi9VenJKSnM4QXU1eGJZcCth?=
 =?utf-8?B?RlZFUWwwMGNhZXJtR3ZZb3I0Vml0Q21EVzNjQlB1aWhmNS9mS0dlS2dnRDRp?=
 =?utf-8?B?dUV3dUFSQkdnaWp5Q0FNWWpXWEtHbkl3akd0bmRzdEZkS2p4WVJWemhTb1RM?=
 =?utf-8?B?WHpIUmJSbERpZUxjMjhkeFgvSHNOMEtqeStKQUNUbkhCWFZSRUtSbTN1WkJB?=
 =?utf-8?B?akVoeUxQZDZSNlJyWi9uSVl4L3NRVERzRUJ2bDdmdHdJRHh0U0ptM3gzUEJs?=
 =?utf-8?B?UWg4QXFqeERzV1VZb2xnS1BaVko5TjBtR3hxQ0RXNHkyaEtpR2c3bFNjTXU3?=
 =?utf-8?B?cHNJSFRtKy9ZMnpKVGdxbVNxNDJycXpiYXZYT3VRdjBGZ2F0OXdueVlKL1RN?=
 =?utf-8?B?MmpRRU56cDY1eUlaeE4zNjlFSUtTQjMxLy9GOEx4dDBJT0trZFRDa3NXZXk5?=
 =?utf-8?B?VDJPUW45NktFNFFZOXUyT0lpMVFwVTU0NHdYMDBGYVo4R29UQ2YxbndWdWk4?=
 =?utf-8?B?WFFLKzJibXdCKzNlMmdTbzFxQmxCWGluQit0VzFGeU5rRlM1NW9JNDF6M3ZP?=
 =?utf-8?B?RnFZeVlLdVpyZ3h6V1k3QU1Kc0tEd1A4dWdBSGpLRW8rVW41ODdFMzJFR01U?=
 =?utf-8?B?SmZXeFlNekRnLzJ1RElOTDdmc1J5QW5xNmJMc2hxVTJvUURmTGJZaCtXZDNN?=
 =?utf-8?B?ZExmNHBYQUMzS0xNMS90VmppaDZNV282SDNSVXp1ZCtveW9DQ0FJQnFoSzhB?=
 =?utf-8?B?Y1M1NkNJc3F2akhja25LekdGdTNQZ1EweEVoUHJTTWg2N1I4dUpXV2l2LzBP?=
 =?utf-8?B?WXhGbFZIdkJOS2tPRlM0K1ZoWkJ6U29hUDd2WkFVczY3NVd2TFNiamlra1p1?=
 =?utf-8?B?dHY3bVVGSHdiSHpLTXdERDlaUkZRbTNNeHhrZGtHY29WSmh1eTY1UmJwL1Vj?=
 =?utf-8?B?M2cvdHBEMkdxVVlqcmh4bkh1Y2lZSWZFT1JPdGVpWXlFL29pbHY2RzJkK3Rq?=
 =?utf-8?B?aU1LendRMFFGL2tMT0s2RXZqTDAxOEtoSXJEaytBQ0sweDJpTUlHc2p2NTdz?=
 =?utf-8?B?VVhuVVJIc245SHk1NEFDZ0NuTXY3SGllUytoYVRrak94Z2c0VUVlODI3WUtm?=
 =?utf-8?B?ckN0bnNUemt6c0s0MGl4YXFibSt0YUd0M2lldkpZckJiVmoyM05oVmlSNjZU?=
 =?utf-8?B?Y2hXclhLWHNod0ttTjdiK2pwOWJJOGFkWG1PbkdFR0RWWDJyQytpK1VtV1ZK?=
 =?utf-8?B?amJWQTBOMHhZME0rNEdkMlgxd0M2TWc4ODZ6Nmd4WkdtbElnV2NubkVYakhI?=
 =?utf-8?B?YVErWlA3dllRTlJ0bkUxNDNYSGRNNmxLSEdrNFVrYWl0UHhJOHlRUHgxS0Nu?=
 =?utf-8?B?RXNZVDkvT3hVWE5ZYWVock9BVnNkYjZxbFBtbnJ0OVhQTURkaFNBNlNxV3Ja?=
 =?utf-8?B?OXJ0eFBjMnhhb2RZaVN0T2loMjRUTFlWSFlaTUtJQ1JvU1UyZmtjN3FzMVRF?=
 =?utf-8?B?RHdib2hNYi9VM0V4K3FlNTAwVm9HaVBwczlyTXRLQUdpbEZ4bHkvTzNuYndk?=
 =?utf-8?B?eTRlNW80TUJ2Y1FwY01wSFhGRUgxNDJDajVGOHhWQUs5OHpRakRRN1JLbGVC?=
 =?utf-8?B?ZGphWlJmSmxYd3kwWmVrN2Z0ejgxWEFCVSs2K3NIa29SYmJKQlZmNU91d3pL?=
 =?utf-8?B?MXF5eWFhbXM5SDdQWEpReU9kSW1sRUg4dlIvaDlOMHYxUjU3S3ZlajYvL3NY?=
 =?utf-8?B?WWc5SmRDWmdFb2lKUHB1dXkzMER4VjRzYnlKYSthMSs0S2hsVnUwS1NRU244?=
 =?utf-8?B?ZHFhTnBYdkg2RThMYjZrZG55SThOQWFWVnRKN1hkZXNucC9IK2VYSmE1YWpr?=
 =?utf-8?B?anVXdlAzNHVJandIcVZ3THNGYTNVQ2lCRXVaaHN5ajFoUFpMOUhLVE90djd6?=
 =?utf-8?B?MXNmTm9Edyt4YXhtSWFKSklpenEwKzBIYWZjZ0p5emZ2d05UWHBseUxockIw?=
 =?utf-8?B?WWhrZG1rVGp2QTY4MFFTTm85NFNSZDUwbjNvZWtkZ1RhcCtOQTJhQTYyeFhp?=
 =?utf-8?B?b0dxRTFCcVMvK29KeVFodE03b3FLTlpoTkY5cEsvb2dlSzZtd1NFVUQ3dk96?=
 =?utf-8?Q?Kb34SSMHjx0p2InYumqtm+rR+d7m9PWqQHByJ/+gS+Rb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc97dc4f-b1da-40dc-1529-08ddf73993f8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 05:01:22.5711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4o0OMU37rpq3+whPJQ/ny7hSBuK5FaUCxv8H40/3SJgwdbC89BhLGuT/CymiE+D6ymTW6MxYl2aE+d6uxYdWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370
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

On 9/18/25 12:49, Zi Yan wrote:
> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
> 
>> Add routines to support allocation of large order zone device folios
>> and helper functions for zone device folios, to check if a folio is
>> device private and helpers for setting zone device data.
>>
>> When large folios are used, the existing page_free() callback in
>> pgmap is called when the folio is freed, this is true for both
>> PAGE_SIZE and higher order pages.
>>
>> Zone device private large folios do not support deferred split and
>> scan like normal THP folios.
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>> Cc: Rakie Kim <rakie.kim@sk.com>
>> Cc: Byungchul Park <byungchul@sk.com>
>> Cc: Gregory Price <gourry@gourry.net>
>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Nico Pache <npache@redhat.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Cc: Barry Song <baohua@kernel.org>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: Mika Penttilä <mpenttil@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> ---
>>  include/linux/memremap.h | 10 +++++++++-
>>  mm/memremap.c            | 34 +++++++++++++++++++++-------------
>>  mm/rmap.c                |  6 +++++-
>>  3 files changed, 35 insertions(+), 15 deletions(-)
>>
>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> index e5951ba12a28..9c20327c2be5 100644
>> --- a/include/linux/memremap.h
>> +++ b/include/linux/memremap.h
>> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct page *page)
>>  }
>>
>>  #ifdef CONFIG_ZONE_DEVICE
>> -void zone_device_page_init(struct page *page);
>> +void zone_device_folio_init(struct folio *folio, unsigned int order);
>>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>>  void memunmap_pages(struct dev_pagemap *pgmap);
>>  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
>> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn);
>>  bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>>
>>  unsigned long memremap_compat_align(void);
>> +
>> +static inline void zone_device_page_init(struct page *page)
>> +{
>> +	struct folio *folio = page_folio(page);
>> +
>> +	zone_device_folio_init(folio, 0);
> 
> I assume it is for legacy code, where only non-compound page exists?
> 
> It seems that you assume @page is always order-0, but there is no check
> for it. Adding VM_WARN_ON_ONCE_FOLIO(folio_order(folio) != 0, folio)
> above it would be useful to detect misuse.
> 
>> +}
>> +
>>  #else
>>  static inline void *devm_memremap_pages(struct device *dev,
>>  		struct dev_pagemap *pgmap)
>> diff --git a/mm/memremap.c b/mm/memremap.c
>> index 46cb1b0b6f72..a8481ebf94cc 100644
>> --- a/mm/memremap.c
>> +++ b/mm/memremap.c
>> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>>  void free_zone_device_folio(struct folio *folio)
>>  {
>>  	struct dev_pagemap *pgmap = folio->pgmap;
>> +	unsigned long nr = folio_nr_pages(folio);
>> +	int i;
>>
>>  	if (WARN_ON_ONCE(!pgmap))
>>  		return;
>>
>>  	mem_cgroup_uncharge(folio);
>>
>> -	/*
>> -	 * Note: we don't expect anonymous compound pages yet. Once supported
>> -	 * and we could PTE-map them similar to THP, we'd have to clear
>> -	 * PG_anon_exclusive on all tail pages.
>> -	 */
>>  	if (folio_test_anon(folio)) {
>> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
>> -		__ClearPageAnonExclusive(folio_page(folio, 0));
>> +		for (i = 0; i < nr; i++)
>> +			__ClearPageAnonExclusive(folio_page(folio, i));
>> +	} else {
>> +		VM_WARN_ON_ONCE(folio_test_large(folio));
>>  	}
>>
>>  	/*
>> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
>>  	case MEMORY_DEVICE_COHERENT:
>>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>>  			break;
>> -		pgmap->ops->page_free(folio_page(folio, 0));
>> -		put_dev_pagemap(pgmap);
>> +		pgmap->ops->page_free(&folio->page);
>> +		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>  		break;
>>
>>  	case MEMORY_DEVICE_GENERIC:
>> @@ -480,14 +479,23 @@ void free_zone_device_folio(struct folio *folio)
>>  	}
>>  }
>>
>> -void zone_device_page_init(struct page *page)
>> +void zone_device_folio_init(struct folio *folio, unsigned int order)
>>  {
>> +	struct page *page = folio_page(folio, 0);
> 
> It is strange to see a folio is converted back to page in
> a function called zone_device_folio_init().
> 
>> +
>> +	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>> +
>>  	/*
>>  	 * Drivers shouldn't be allocating pages after calling
>>  	 * memunmap_pages().
>>  	 */
>> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
>> -	set_page_count(page, 1);
>> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
>> +	folio_set_count(folio, 1);
>>  	lock_page(page);
>> +
>> +	if (order > 1) {
>> +		prep_compound_page(page, order);
>> +		folio_set_large_rmappable(folio);
>> +	}
> 
> OK, so basically, @folio is not a compound page yet when zone_device_folio_init()
> is called.
> 
> I feel that your zone_device_page_init() and zone_device_folio_init()
> implementations are inverse. They should follow the same pattern
> as __alloc_pages_noprof() and __folio_alloc_noprof(), where
> zone_device_page_init() does the actual initialization and
> zone_device_folio_init() just convert a page to folio.
> 
> Something like:
> 
> void zone_device_page_init(struct page *page, unsigned int order)
> {
> 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> 
> 	/*
> 	 * Drivers shouldn't be allocating pages after calling
> 	 * memunmap_pages().
> 	 */
> 
>     WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
> 	
> 	/*
> 	 * anonymous folio does not support order-1, high order file-backed folio
> 	 * is not supported at all.
> 	 */
> 	VM_WARN_ON_ONCE(order == 1);
> 
> 	if (order > 1)
> 		prep_compound_page(page, order);
> 
> 	/* page has to be compound head here */
> 	set_page_count(page, 1);
> 	lock_page(page);
> }
> 
> void zone_device_folio_init(struct folio *folio, unsigned int order)
> {
> 	struct page *page = folio_page(folio, 0);
> 
> 	zone_device_page_init(page, order);
> 	page_rmappable_folio(page);
> }
> 
> Or
> 
> struct folio *zone_device_folio_init(struct page *page, unsigned int order)
> {
> 	zone_device_page_init(page, order);
> 	return page_rmappable_folio(page);
> }
> 
> 
> Then, it comes to free_zone_device_folio() above,
> I feel that pgmap->ops->page_free() should take an additional order
> parameter to free a compound page like free_frozen_pages().
> 
> 
> This is my impression after reading the patch and zone device page code.
> 
> Alistair and David can correct me if this is wrong, since I am new to
> zone device page code.
> 	

Thanks, I did not want to change zone_device_page_init() for several
drivers (outside my test scope) that already assume it has an order size of 0.

Balbir Singh
