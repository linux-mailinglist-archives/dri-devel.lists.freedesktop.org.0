Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426C8B0AB18
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 22:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8173D10E06C;
	Fri, 18 Jul 2025 20:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mLNtqK84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0BB10E06C;
 Fri, 18 Jul 2025 20:23:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+c9Bh7p7sWKizayAQuJbRHPpwps6d8FLo1563BS9QQd6eBuQ4BXCW3fj4GJgOuJnBGBdXfplkGkgUOwR5nXAWpond+UGBuTjo7KABKWOwJ33TLR69+SffW8REDLdmdbu1eIbBY/8dI6tsaVIf0TaTMqlsgZWWQCQ7POaTuOKyOUKLe9pmLrkv+/Czi8THkSO4/j0+rHoaVE9ynNU+R/OeA5GAGHMd5nfJYOkGI4Y3/ZhoK6xvsyxYF09zFdHkeQlkjQOhCs9XZfTTZIBJ5gfTb9dcMRjiigSqGVWD3drzsjU2H2HhT92tz1ZIEdUmKktth82Ct4vSB5eoQNG7kk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8VvY8iE4vR0N97C1ryETYWqk+3ROER1X9jmGG7N2Lc=;
 b=MhOwdtVk32bxh2Rvx4/RUbxBBH9kD8kOmuxXmpKuzLy6IT0cR9W70AhDiDcLohKluXjFyqRJ8pFtMe/kn68W+py9anybR+D+HJxd5fDLPxZ4/Mt9GdOiWp7Z/bHfCNqJArd9VVN3+j+3UBed4zs5QgjRz4kFTOuX5PgT+q0Anl5FyfnP17g1Eq0UIP3GUOi4ETK5N+wvOLwLm14vLOVgl8EQEObu9eg+S4oEyylcCYaZwl0HJ27ws2MIi7uA52RjzU/xpcpH7paXE7IVBp1AheOil8MsqxF96KrzdipjNB6LLFnJ8hpvvR1VgsGANXk8jM9eCzVraHUyFK+SExqQKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8VvY8iE4vR0N97C1ryETYWqk+3ROER1X9jmGG7N2Lc=;
 b=mLNtqK841oT+1E8p/s89wrnlF0aPUSoio9c/5a9v+FKj6nsrGAJkAS2ltmh/q6W9OIODblwb5kCqJvE52YYVhvlThOtoSu1hHr7BqeOmKEu00jRw2zJna0/s30Ch2H/Pho42jR03TWxCDdxLzmqZTMJXw8/adcP/4bzXIZZIZBFCGb8iFBhIV0uFgZ8wlVJGibybbVyPiZadwm2vodikLGUx3IsmMvusIbm/9Gsz9eEH8dw3ynCtTx8EG8+AC4oGj5O5ujitgjr6sZZEmzvJr3KwiDHesMn6spH5PS20pTxIEbqo4vSsgPtfQEtLG+PE5MHDxK8nt09kD1mnVl05dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 18 Jul
 2025 20:23:09 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%7]) with mapi id 15.20.8901.033; Fri, 18 Jul 2025
 20:23:09 +0000
Message-ID: <5beb884b-f0fe-46b8-ac62-f11637fcc93f@nvidia.com>
Date: Fri, 18 Jul 2025 13:23:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/19] gpu: nova-core: falcon: add distinct base
 address for PFALCON2
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-16-7b6a762aa1cd@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-16-7b6a762aa1cd@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ab167c-21b5-489b-4f45-08ddc638e971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHNpc3VXaGN2L0dJMVVyWUxNVFFHQWhTeTMyVUtiQjB2aHVHdmlneitkQ3Qx?=
 =?utf-8?B?MWQzbVZGRHVFSlgzNy9udldrdjMrMXZQWkJySzF3QjludlVteVdWRmpDS3Bz?=
 =?utf-8?B?amlmamxoWEY0SG5VRlNTQ0xtelB3Nm9vb1BDRlZJUDdJOXFkUStFU3hWWlcw?=
 =?utf-8?B?SCtrZUJjem5aSTdzdzJmNWxMdUpLdkNaei90dXNXellhR3hCNU5ScG9IN2FM?=
 =?utf-8?B?OGJpaDJtZ1loSDQwQjZPK2cvZ1Fkb2JtczJWZVg3TmFQL1dUVHZrVWszS2tV?=
 =?utf-8?B?MytyMGRxMytzVERlT3pldGJocFdQZThhSjBmV0tib0JOL2ZJZTlRMXBMVEVV?=
 =?utf-8?B?dFl2TVVwMFp2VkZmVG1keVpMY0dzSUFBVHNZOFY5bytJV2ttTGU2ZEJLUWdF?=
 =?utf-8?B?QUE0bDRIK2lOcGNQdkhCbDd1a25MMmdRMHd5VERBdnlYamttcnJkbGlMOWQz?=
 =?utf-8?B?SUpWSlVVbkRQVmFBVzd6NkttNkdObFB0WEIrbGtJelFxYjVuSG8wZ1BwSlJa?=
 =?utf-8?B?R1UvRWV6bUIxelVTaVFpemUxdE1IMCtOTlZSRWdBSiszVFo1TkdPR2lBaTgy?=
 =?utf-8?B?emk5MXhNcDBrVUgwTlNIWGlqaDRWWGRQOHZETzN3K0tyamFUV3lzRWZXR3ln?=
 =?utf-8?B?a2QyYkpMOHdUb0V0d2NOdDlGc3pZN1dxZkwrMjJVMDlVZjlUUDcvTm5rQ0F0?=
 =?utf-8?B?OFczb1I4ZlRZQVp1WlBxMkZKSzFwQk1YR1VRa2RZNi8zbFNXaWFmbytQQjU5?=
 =?utf-8?B?QkNqNzlGNkpNTzI4aFdFNDQ2WDBsb3pNOWpGMFhIbE9vOUsyeHhSR3l4UEYx?=
 =?utf-8?B?dTcyd1VNa0dOS0xEbE1yRVVuQk9IRWZrS0NXREtkWEtPbHd2NHJPc3FCZ2Ey?=
 =?utf-8?B?azFiNGlTa0xIeDZ3WFUrM1FMdW54b3NuMWhtVnVSSG93MGcvZ0JZSEZ4WWZM?=
 =?utf-8?B?WURQTDR5UzBnVUF1djFrdERheW9qVlBaSWY3L2hUWWgyK0ZKYmhxWVM4Qmts?=
 =?utf-8?B?QjdRT1ZQSlowTDB6dXg3MlNMUnkrb1V0NUpMdVA5SW85TkxWUTdsMmZRUk9l?=
 =?utf-8?B?M0lzYXpEUUNhcXhxU3lWbDFmZ0ZqeVd5SWtVUjdtdmt0c29HdHEwWjdSSEJS?=
 =?utf-8?B?alRBL0FvZFRoTGxtS2FYZjlVVkkra1NpT0JlRDlZbUVSSTdHZy9NTFNMWFE3?=
 =?utf-8?B?L3AvajVuOWRjN3YrSmJSMGJtbkFocnZrb3VLbVZjMk1DaldNdVZVenQ2bHAz?=
 =?utf-8?B?SkVZdStPMDFuZ1lrdXJpZ0lNN2FSMys1bDZQOEFCSHF4SkZLN1pneURFZUNV?=
 =?utf-8?B?UVZwTjA0amFDK25WTURoYzVUeWZIMGtiT0IzQjB5ZVdnTnEyd1VDYUh0bHVK?=
 =?utf-8?B?ZHFQMkNSRlhibkpROGZhYjNQcFlPWEpnaWRkakFjaDlQay96Nlc3RVNZREdj?=
 =?utf-8?B?am96bXJHT3lFeWoyWDRIYXJNcHBybWcvQVZhNDVocytpa0xoMUx2dDJRdS9v?=
 =?utf-8?B?RWwycXF6SlFSbkxteGo0Mm00WSthOTRYRUhIVkxkVS9WR1U3dkNWdjgrVXNQ?=
 =?utf-8?B?TVAwTmxTSHgwNlRad08wbWpVYzJJOERlUno1eExITjlhWTcwZi9nRlpaVkxP?=
 =?utf-8?B?SXg5RE9VbnZRVCtXUmZnMEtuNC96azRqQlFmdm5WUmdYSTY4ZGF4Wlp0cjls?=
 =?utf-8?B?bHZ3Ly9sNjk5S0VURTRCaUNVNEI1YlE2SVJMZ2paS0JNbXcweXExd3NFQ1Vx?=
 =?utf-8?B?dUdqaVpZeHFLaWJNdEV2Wml0MUh5clBqaklJSitGekp1TUh1TjFCSSs3eklu?=
 =?utf-8?B?bEZNQ3hRRStETUdBb0VLeW5KK0NGRHl0aVJjQ0hsbUJHTGIyR28vQmlKbG9I?=
 =?utf-8?B?S2VUSWRFWWFKT25OL1pUZ082SGZWZ2VlN1ZZQzRCMnhHV3lHOTRxaVcrY25M?=
 =?utf-8?Q?1zdVN4wU5mI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWU1WmZ4TlFYcXFKTG9OS1dvR3c1ZlNkeHNpUEZ3VWlXaWNkalRZQWlpazJE?=
 =?utf-8?B?bUVOaGZrd3ZzVENrRXB2M0docDVMelBxVXpKMEJNZEpyVzFHRjdkK0RUNnVW?=
 =?utf-8?B?M3V3cFgxVTRCY0xvVWRxMGpvZ2ZDNW93RnpvNzFVOVBCRFdzQmNQOHN0S2R3?=
 =?utf-8?B?bzFlMW80c1o1enVHeG9sV1pGWmxjRm1nMUxLeEl5M3BUM3g5aE1hV3l4Nk11?=
 =?utf-8?B?a0VFSmhXeTVMdHA1VnppOGR6eUh5Z1poY2I5Y3VsRS9yQ1IrVzdUN0YxNjRs?=
 =?utf-8?B?RFVVRXROaVFBZHhZTERsZElrNkNTVWNwSmlXeHdFbFI3K1l4SHpwTzVlVkht?=
 =?utf-8?B?d01hN29teGprenJ5dDBxMlcveExtcis2b09XVzRnUDVwMlg4R2U1L2l0aW03?=
 =?utf-8?B?M3FlYU9aYlU4ejVpN0tHQzhJVTd1VnArU090OWRwd0xYVkE3ZFVOeGJKR05K?=
 =?utf-8?B?Vm5FNFFrUEdHV2VRdDIyMFowcC9YNEtlVGxYKzZCVlR6c1lSNDk2NHkzN3BP?=
 =?utf-8?B?YjRuZjVJeC9ibjdDZnBQSGdLQ1lwVGw4MXU2M25ZUCtBSjdENzU5OHExL01Z?=
 =?utf-8?B?eUx4aFBzbW5nSkZDS2kvK0d2eCtJTys0eXZMeGNFUWFFNHlQNi9XcTkvMUJR?=
 =?utf-8?B?b0FsRmdMekRGTStHVThCbEJmV0FHa2x6N25sSGZtSnQ0YkRGN2xRUE1rRDVL?=
 =?utf-8?B?KzVXN2tRYmFoVHVHcDhHaTFDT2ZlL0pwNEM2UHNaOGdlYUZLMDNpQVdVNVlN?=
 =?utf-8?B?cFNQcXhtQXY2cGRWNHFhaksxUXp1YlA4cjdmVDVjVG5TT254Mzh4UGZJQ0hh?=
 =?utf-8?B?ZitjYkc3TCthTWhiQzBhY0h5bHJLT2RwRFBiQ1JjRVMvZHhPUVRNWDBveVh5?=
 =?utf-8?B?dStYMFgyRUhqZE1adnM5eUF3L3hoNE5tdkYybHRjbnVnVUptSUxlRWpPQSs2?=
 =?utf-8?B?dGxUblRoSEYzN2p4WS9QQU4wSHBlZ2krWnYxeHZxUEswN3p6cGx0YXFBZjZB?=
 =?utf-8?B?OGpmUWRuNnU4VmJDaXY1SUZlRFRYM2xzd0pOSjBERWhNY2pvK1JmUXlCSWpT?=
 =?utf-8?B?VzNtOUFkWkNRTW1HWGh0YnZ0RmlyMXhwU3M5aHlTNjJtZ1JNN29SV3luUW1E?=
 =?utf-8?B?VG9qQ1o5L25jTUZ2Z3J0L25tQnFwZXRhSndiNnFzOFFmakxORWF4SEhJb0lH?=
 =?utf-8?B?SFJpNkVDQXMycFRqb0hCMFNuRkx5enN2ZjQxRVJHM3VNQnhnM2xmQnk4aDBM?=
 =?utf-8?B?Q2FuUlFWNlhZa3Z4azlDOVkyeEFWcWtiQ0t0K0FnU3ZhQU1kbUhiZzhRbTg5?=
 =?utf-8?B?Q05OL3VTbEx4a1QrRkNIMVlyZHBFNmZZNjhzSGJPNGM5MENVNDdwSDFiOEJV?=
 =?utf-8?B?ejl2OEFldys4eHdmTzlZcnM4ak5uMjdWN3dya2VhMTkrN3lIWjcrVWZRR2kz?=
 =?utf-8?B?YXVNTzYxdUQxaU9Qdm42ZEZtakNiZ1c4b1hEZXExbWdKUW0zeCt5djlzV0pp?=
 =?utf-8?B?cTJhOWN2V08weVNLOTY0K3pmR3E0TUhIdS93a2E4LzlOVzJVN3U5TGtUOFlN?=
 =?utf-8?B?VVQraEtxdXlPd2xoQldTVWxRekhQVFpMcXRMd1dQcUpnNU85ZUtKY3NQK1RU?=
 =?utf-8?B?MmluS2kwK2RaeUM2MmhlUWpIcGE2eDg3T0s1QmJiU1E1M2NXZzNlMjkyYkln?=
 =?utf-8?B?WmFwNGs0L2x0aGkxL1JMY3VkRk9qQ1dxNFc2SUgyNU1ZMGRXMmN0aXF6YS9T?=
 =?utf-8?B?Z0xtbGpDS3F4aGJUTUs2RU9scXlLLzlJalFkRXNNVlJFM0Z0UmhUbEhQSmFH?=
 =?utf-8?B?eVB2R1ZQRHRIUFBKM3NidWJFSmFNU0d6NlkrVXZ4VlNDNTNXSUFtbm5oQzhF?=
 =?utf-8?B?Vmpnc0syNWh4K1BhZ1hFbUhOM0U3TkcrQXkvc1oxUkFmVlZHMVdUcWFoUFlu?=
 =?utf-8?B?c1lyYkJxUy9yUGlwWXF2dElTYnNwZFYxa0ZEU05NdlpyV2VHSUJyQXFWdFVJ?=
 =?utf-8?B?NE1OS1hQY25XRm14OEs5NkRYTm5FazdlU3hvRkxoeVFCK2cwV2hGYjlIempx?=
 =?utf-8?B?d3NtSU1JZU9tTkZVcU9Mcml0NmxCeThzZExzQ1lKRldNN3d2VTAzODQrUk52?=
 =?utf-8?B?Y1g4ejl3YnBVS1RuWTE1Qll2WU9oK0hlUzR0MUhjSmxYbCtqUHNnVU8xUUV1?=
 =?utf-8?Q?HhJH79IBgdBAHimMPg2JsWI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ab167c-21b5-489b-4f45-08ddc638e971
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 20:23:09.5639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqN3PWwd4GbPdIyQXi43Myp4kneyHUmyNVJNWwO7Vnldx/sKp/BabFc7/fDVGsxvTytHo/jL76FzzbQM7Ur5zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005
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

On 7/18/25 12:26 AM, Alexandre Courbot wrote:
...
> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
> index 0db9f94036a6a7ced5a461aec2cff2ce246a5e0e..f17599cb49fa1e5077a554dc14b3715aa62a4ebd 100644
> --- a/drivers/gpu/nova-core/falcon/gsp.rs
> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
> @@ -2,7 +2,7 @@
>   
>   use crate::{
>       driver::Bar0,
> -    falcon::{Falcon, FalconEngine, PFalconBase},
> +    falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
>       regs::{self, macros::RegisterBase},
>   };
>   
> @@ -13,6 +13,10 @@ impl RegisterBase<PFalconBase> for Gsp {
>       const BASE: usize = 0x00110000;

This approach means that the reference manual values such as these, end
up being scattered throughout the code base, as magic numbers.

I'm thinking that there should be no problem with using a symbol from
the manuals, listed in a common area, instead, right?

>   }
>   
> +impl RegisterBase<PFalcon2Base> for Gsp {
> +    const BASE: usize = 0x00111000;
> +}
> +
>   impl FalconEngine for Gsp {
>       const ID: Self = Gsp(());
>   }
> diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
> index dbc486a712ffce30efa3a4264b0757974962302e..815786c8480db6cb74541d7ab574112baeb816fe 100644
> --- a/drivers/gpu/nova-core/falcon/sec2.rs
> +++ b/drivers/gpu/nova-core/falcon/sec2.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   
> -use crate::falcon::{FalconEngine, PFalconBase};
> +use crate::falcon::{FalconEngine, PFalcon2Base, PFalconBase};
>   use crate::regs::macros::RegisterBase;
>   
>   /// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
> @@ -10,6 +10,10 @@ impl RegisterBase<PFalconBase> for Sec2 {
>       const BASE: usize = 0x00840000;
>   }
>   
> +impl RegisterBase<PFalcon2Base> for Sec2 {
> +    const BASE: usize = 0x00841000;
> +}

Here are a re more examples of that.


thanks,
-- 
John Hubbard

