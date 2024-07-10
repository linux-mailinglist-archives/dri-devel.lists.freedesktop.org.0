Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E10E92CA57
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 08:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD2110E03F;
	Wed, 10 Jul 2024 06:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NeRODjts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF56810E5AE;
 Wed, 10 Jul 2024 06:03:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpeUbMx8hXVgn1CCyA0ozR5yBoOqeZPVFu+aZ3XHqgF5hN0gL4FPINPYqtfTXhZLqfUmV0mLfLZ1wq/8eQGesIrYYn4ncCpmuDu+dVA8hXD0sxVlSiIl2rO1tg1DNXJIbWhpo357Ydwzy9W71c+xVmiMoCfhR2Ttc/BcdRj8qB2JIDMEC6SJimO3q1/YwNTtQILe7uuO17JOEj1IuZhDXr9u9Q1rjeWwCxcN68Kt/MF5z3WWYvYlNKCT+us1Ol4+vfG7ri9lKvGvWflBSNi+lGC/NKsnxizvgp9p8MpUN7vvefKlcBuj33pNpWEXKolIh+qI+TUxdpvsDy9C2m+u+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Y8fb7hkV+xh2r11Sz1cZ6m+9F5Fd9hvKhZA7utPF7A=;
 b=jyvv4XvDcldFP7IT1yF4mxoZwM+EQFUrXCg2rpFnrFUBVGl5QwFzqwXFpZ4vp7Rrr0/aNysvaIMcRRqG2WRNreDd3WjqARKqk2dWFxEkqpW20AmtkckthC20z7jcwwmh8TT9zQYJnZkDBsmUWhyqcrXp4byo7aRSFLBS3cdCBjdzOPPar8Y5WdCiPuoCSo1icJ/+IjtP4U2Btv/KneFPTG899GxAF8UCe5Is8F0bo4Xz5eBdL4xcpqGdvS1lb8HUUNNVWS8+tLKgSQQnkAeSHdXvMKTfjzFEr6xFcJ1bjL4OmRpsPwgDJAaX1s1xWeRzha+LhrJzY3O8KD7KyT8knA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Y8fb7hkV+xh2r11Sz1cZ6m+9F5Fd9hvKhZA7utPF7A=;
 b=NeRODjtsFPhlwAphoVO7aWoPExQDdp3nwUrcSwdybOlzrDyCcN1i3bR4+Ss+ckLjOOWBVIK/OnM+R5C4LckiiTYze9+5RUoi4S/NPDj46JPlCRFjR6P0RbtWP+SGzwiUvcF6vcEoH6HCmIZd96OHxPn9h48Slo7wBsP4igB8j4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by LV3PR12MB9260.namprd12.prod.outlook.com (2603:10b6:408:1b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 06:03:27 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%4]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 06:03:27 +0000
Message-ID: <635ee761-13a5-413e-9953-cfb8c6d3cc0e@amd.com>
Date: Wed, 10 Jul 2024 11:33:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Add start address support to trim function
To: Alex Deucher <alexdeucher@gmail.com>, Matthew Auld <matthew.auld@intel.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, christian.koenig@amd.com, alexander.deucher@amd.com,
 frank.min@amd.com, marek.olsak@amd.com
References: <20240704083008.870021-1-Arunpravin.PaneerSelvam@amd.com>
 <CADnq5_OcuKoZYizbeU_RGPaWYvTpxGMPWg6xOXaPASBMYb5kig@mail.gmail.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <CADnq5_OcuKoZYizbeU_RGPaWYvTpxGMPWg6xOXaPASBMYb5kig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::17) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|LV3PR12MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ed94c0-e6a7-4249-0a9d-08dca0a603ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1lmN25PRlVmRk40ellMM3NjdWFvaFVjNktxaXB3VjNwZ2xVU2UrSm5zMENx?=
 =?utf-8?B?eUhTb0Q2dnJQSDlZTkFDNFRpUTlBNTJoeDU1VUFlNFV5THBMTnJlaXUwK0l1?=
 =?utf-8?B?dWpXRnFBdTdnRmJ1MTBPeGxZSitWTWNDQlFGK2FHczlaQm5FUDY1OU8rdzBH?=
 =?utf-8?B?b3AyRkdOK0FlVnJiWnU2QTBOclB2cmlmbTBLS05sRi9iU3N0cDR2WUx1WlBk?=
 =?utf-8?B?clBnVGxLN3NXMmduTmU5WUZldmhic3pkc3RyQmYxQzB0Wm00T0tZNnZnNUhz?=
 =?utf-8?B?OWgwS0hZNi9Wckk3bmx0QlhLRmlraW13OCtheE1GL29mcmFXZlB3RGhmRHcz?=
 =?utf-8?B?TGRBUWVEanBsM0dkNnlFdlV2UzBuTUlZRW5JOEMzcFZsY2FrdFQ1K0JWcTY4?=
 =?utf-8?B?bTU1R05CZjNmcUQ2bFB3ZU9zbDhvWDJMcCtVdmlSNENYb1FqZlBFOTVCVDBV?=
 =?utf-8?B?TGZwTGQycUlHNVpld0FqekhzRXhJdjNrRXNxd1pDMXd6NnlvR3dMOXAySVUy?=
 =?utf-8?B?akhnOVljVjkrcDlLRjFFVVFRZ25acEJDU045MjBIa1VkMG54UlcybDhrL1JV?=
 =?utf-8?B?VitEaVZITmZqN0FXZDVMWlRSMm1ZTTdvR3c4d3c5RkY3alh4SlNicUNUR3lX?=
 =?utf-8?B?M3ZZUHFXa1VjbjJ1MUlFaGUramFoSEJaZGY3U2NpRDNrWTJEQ2tZa21vbFJx?=
 =?utf-8?B?M3hHUnI4Z2FlZ1BOYmRFWHRLclYySG05cWgzcjkwbkxnbGxSOEFDZHBwcUVl?=
 =?utf-8?B?eDQ0ajErSlpSZVNlbU1jOUZEdmVuN2wraEo3NGVBRWRPekJkT2NJNm03WVpy?=
 =?utf-8?B?YjdON20xYmVydHFTN2o1bXZjUG4yd2tqdVJJa25uYS9kWDhVNEZXMXFEa2dG?=
 =?utf-8?B?QUFOQlVIL0Zxbm13Zzg3d01kQ1d4SmtwelVpSTIxcUpCZ3NVN1B2YmZkenRi?=
 =?utf-8?B?Umh3SmFhVFlXRENiMzFGTzRqNjk4Z2NvZGRNUTYxWkMyeFRmZ3QyUUo3RWhp?=
 =?utf-8?B?OE8ySWI3ZEJHZGUxVjFFaXVoOGtyOUI4WkRVVU90RkpDbExrUTUvVGZ6bGZ5?=
 =?utf-8?B?eWNhbERmQVVEN2FHZzNydGZmTDJNZWcxM1V1RXBGMUplVzYzMVl0R2FxMmlV?=
 =?utf-8?B?QTZOU1BxenB0eVRxNytpQVNIUndlNUFnRHNnUC92dHpZSlkxYjE5cUdJL3l4?=
 =?utf-8?B?K256K0JQa3lEUENMbTg3MERZelVuNnZYenZIbFJJOUplckp6dGpMajdsa2Z0?=
 =?utf-8?B?Q1VWNEdGdGswSmkyTUlhbk52NjIyVElwQlpmd1hwMTVQNWlodDFRdURtR2Fh?=
 =?utf-8?B?dnZKWi8rTk1qdkhtenlOL2ZmRy8rOFNsMnc5clllMU96NU1oVVR2TjF2clcz?=
 =?utf-8?B?empzMnUwM1ZraGQrWWgrY1RRNUpUWVBNYkdlYjgwLzB3TlY4U05SOFI2T2lL?=
 =?utf-8?B?RTBDSVRJN0l0SUEyWWlycW9vV1BRY2lXQlBwL2x3aS9MdUNSQmlJVWQ3MGdH?=
 =?utf-8?B?SExBL3k3L2M3a3VJM2I4OTVXdThCYnBLejVBTFYvLzR4OVpPcFBjVkt4TWxq?=
 =?utf-8?B?TlRyMXFWOGJZN1l4WVAzcjZ0dWdyY3JaN0ZKcFROa2gwcXRpVmQvZWY1c1p6?=
 =?utf-8?B?bUQ2eW9Ibi96bVExbWxDT1hGSTFYV1V1UmFWZUNic1JGaFVUam1RUEJVZndB?=
 =?utf-8?B?VXR0YzF6SDQwcTBrT29VOS92aWtpZ2tlMlJUNTJEaG1sTmM5ZmtQYWQ2cldz?=
 =?utf-8?B?QkFxQ2xCNUkrUVZzcy9NWWRrRnMva2pvMnp3WWt0bzlOWVZBN2I0UU90WXRa?=
 =?utf-8?B?ak01MjEvcjFMWGQ4eEZaZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmxHaFZ5clQyQlBNSC82RW1BU0hBZUluTXhYdFNWemtCVlpPWWdSNE8vaWFl?=
 =?utf-8?B?NG1GbHlLdWYydy9uNEY0ZlViTW85QytLRlhTakxjai9NeVZLTlQ5dFlLeU1u?=
 =?utf-8?B?MVdMMm9BOHVvWEpEMEU0cERmVUY1c0tQNFZaRXNubW5yNUI0dEFTYkNMYW9V?=
 =?utf-8?B?K1RDR1d2d2YyL0tiL2dKSG1JbTYyN0pzbXVCRUdQTnN4Y2l5cVBKOVFQdUUy?=
 =?utf-8?B?ZXZTblF5eGxYcHU3LzgvNkRoK2JiMnFuejZ3dUQ1NFQ0OFVqODgwTC9uQXBG?=
 =?utf-8?B?Vm1IUm1jUVo5UzVZbEtQbmQzRnJKbXJRaGZOWkxzRlVYZmJ1YzZlWVBsOWVw?=
 =?utf-8?B?ZWFEWGVaS2NJdDFFdTAzNTBmaDhSak53ajkzbm95a3NFK1duSTJyTW9wdm53?=
 =?utf-8?B?QzBSdzM4cFg4Y0hVUWp5OHl1cFdyemJSeFZHWC9ZajRiMmd3aU1wMUdhSTNm?=
 =?utf-8?B?czFpdkZWaWdVVkVhT2cybnpxT1ptcURHMUpPRkExeFVxcXpTc3lnaXJBYlZZ?=
 =?utf-8?B?RStKMHBPVWUwK1QwZGdCVUdHNFI3WXpod0ppRlFGRHFnVGZRYzVsU3BHS0hs?=
 =?utf-8?B?MThSUDNvU3NWMGNYdU1iRTZmNFhMVlJGY0w4MEhpSmJ3djhvYkxRY2VidEJ2?=
 =?utf-8?B?SUp5NmlTZ0hXa2F1QjVHRFhZenhSKzdsY1hnK1AyOWlVZTZQODRQbDM3Ry8y?=
 =?utf-8?B?UjRUVEJLL0JGR0RiT3lGbjBLbUJnSEllY2Ryd0ZLZVlienFVcERjeTRRaXA0?=
 =?utf-8?B?ZC9lUGVWRVpBbHUrODVGTlplS0VTM3RQb3FZenBEMWIyb01CUEJjTzBTVjhU?=
 =?utf-8?B?a2lZMHgyZXk3WGZFUEZXUmFXeS9CNTZqSzJHdG5rREZjOVc1cWlyL2s1dUs2?=
 =?utf-8?B?Yi9mUThua1VzT0J6NU1DYWtYWjRjSmNEdXI4b21IY09QS3owbVRhOWs2Q1Y1?=
 =?utf-8?B?dlVsMDdCNG5VMU1CL0RTN2dSODliMHJ0eEF5dEtVdUNKZ1lXRVdJQ21QbVBX?=
 =?utf-8?B?NElveEEyYjRlTDVnVzdJenl3cUFZWUtjQ256d29YYjlZYi9rMFo3RlU1Y0Ev?=
 =?utf-8?B?NDYrc3A3dlg3RWNyOGJSOE5wUUpuSy9LRTlMWjdjUE9EUHdMbzVabXh5Q0RS?=
 =?utf-8?B?RFJmVlRuQmF5M1FCV0RPVEFZaElpYVhWbnF6K1VEb3lncTlOMFRmK2dEbENa?=
 =?utf-8?B?cGVTQ2VRazRadlpDUkRNTEdXc093SlVBRUpMaW5wRDNheG16cWZCNHRsSFNN?=
 =?utf-8?B?L0RNd055SHo2eVJqYzYxMlV3d0NVY2Q0cUwxRUJ1SEh2Y0o3Q25XMmJUL1pM?=
 =?utf-8?B?dEZ5V21nQlorWk1KenF2b3AyRCtTN2tocjJ6M2E3ZU1ONHZKUFYxV1VzaXJw?=
 =?utf-8?B?Wk93NHJRY1IwS1dwcm9US3NrNFhXN2NSaDVxUVp1RlBsbGt5aURxcDdLaDl4?=
 =?utf-8?B?NHZMSmwzY2Fuc2tWNktCTHJPK0Q3ZHZGNDFPZ2x3TkFNQmpXWHlIOFgwQUF1?=
 =?utf-8?B?RkdxdDZHeE5YdzkrRnpuYTFwallnOElZWnlzNnhqSFZrYWVWSEU5ZE9lZ1Nn?=
 =?utf-8?B?dW1lWlh3SDFGY2ZQZ1dpbXlESjgyV3ppUTJYYmZ5d2wydlkwb2VtSnd4dDM0?=
 =?utf-8?B?QndGSXFLVUNUcS9uTUh6ZzloT2NjRzdkMFUvcmRXbGpBVlRtYU5IOVhiR09t?=
 =?utf-8?B?Nld1cEdCVVhTekM0VUVLNHIvL3UwTXp6ditDaDc0NTdUUjg2TWZJdHQ1cEV6?=
 =?utf-8?B?ZmRGOTdpcUNCbURCYkhFb1YwM3padUdmc2xOaFJrY2NDTlAxdStkclJ3S0hW?=
 =?utf-8?B?Tll3V2JVQWpoWFpYalEreFRoeVJScituc3VDUjUwQWEwVVVKU0FUOWVQS2M1?=
 =?utf-8?B?amMvMGwvQzhjUkc5RngzQngvYzNhYXFoNnRqbExhY0pXR29TZTRUcHNxTUdn?=
 =?utf-8?B?Y0E5cG16Qk8vZ2pPaWZIUm1hQi9UcmVnMHdhMlZQS1VQZDVsbDFrZ3JKVkF1?=
 =?utf-8?B?a2duQ1NOdmNzR1BIMVM5cHhsZ09LOEsxQ2hYVnhDYWkrbFFXdGRTdmU1SEk3?=
 =?utf-8?B?a3FoSGdiNlJVVEN6VUJaV1Q4ZkRpQXdwcjdHWFFsak5FR0dpN1U4K3VkUUpZ?=
 =?utf-8?Q?TDpT/gq1YGZB2aen3F340PzEL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ed94c0-e6a7-4249-0a9d-08dca0a603ae
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 06:03:27.0234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYyJaS7gVMfZ/LP7EhFCHsTgjmMM2c95PGrLxcQTxtk+nYst2j7U0/GlpKd8+MdhaPIJxNumDSHh4UFa0l/6yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9260
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

Thanks Alex.

Hi Matthew,
Any comments?

Thanks,
Arun.

On 7/9/2024 1:42 AM, Alex Deucher wrote:
> On Thu, Jul 4, 2024 at 4:40 AM Arunpravin Paneer Selvam
> <Arunpravin.PaneerSelvam@amd.com> wrote:
>> - Add a new start parameter in trim function to specify exact
>>    address from where to start the trimming. This would help us
>>    in situations like if drivers would like to do address alignment
>>    for specific requirements.
>>
>> - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
>>    flag to disable the allocator trimming part. This patch enables
>>    the drivers control trimming and they can do it themselves
>>    based on the application requirements.
>>
>> v1:(Matthew)
>>    - check new_start alignment with min chunk_size
>>    - use range_overflows()
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Series is:
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>
> I'd like to take this series through the amdgpu tree if there are no
> objections as it's required for display buffers on some chips and I'd
> like to make sure it lands in 6.11.
>
> Thanks,
>
> Alex
>
>> ---
>>   drivers/gpu/drm/drm_buddy.c          | 25 +++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
>>   include/drm/drm_buddy.h              |  2 ++
>>   3 files changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 94f8c34fc293..8cebe1fa4e9d 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>>    * drm_buddy_block_trim - free unused pages
>>    *
>>    * @mm: DRM buddy manager
>> + * @start: start address to begin the trimming.
>>    * @new_size: original size requested
>>    * @blocks: Input and output list of allocated blocks.
>>    * MUST contain single block as input to be trimmed.
>> @@ -866,11 +867,13 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>>    * 0 on success, error code on failure.
>>    */
>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>> +                        u64 *start,
>>                           u64 new_size,
>>                           struct list_head *blocks)
>>   {
>>          struct drm_buddy_block *parent;
>>          struct drm_buddy_block *block;
>> +       u64 block_start, block_end;
>>          LIST_HEAD(dfs);
>>          u64 new_start;
>>          int err;
>> @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>                                   struct drm_buddy_block,
>>                                   link);
>>
>> +       block_start = drm_buddy_block_offset(block);
>> +       block_end = block_start + drm_buddy_block_size(mm, block);
>> +
>>          if (WARN_ON(!drm_buddy_block_is_allocated(block)))
>>                  return -EINVAL;
>>
>> @@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>          if (new_size == drm_buddy_block_size(mm, block))
>>                  return 0;
>>
>> +       new_start = block_start;
>> +       if (start) {
>> +               new_start = *start;
>> +
>> +               if (new_start < block_start)
>> +                       return -EINVAL;
>> +
>> +               if (!IS_ALIGNED(new_start, mm->chunk_size))
>> +                       return -EINVAL;
>> +
>> +               if (range_overflows(new_start, new_size, block_end))
>> +                       return -EINVAL;
>> +       }
>> +
>>          list_del(&block->link);
>>          mark_free(mm, block);
>>          mm->avail += drm_buddy_block_size(mm, block);
>> @@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>          parent = block->parent;
>>          block->parent = NULL;
>>
>> -       new_start = drm_buddy_block_offset(block);
>>          list_add(&block->tmp_link, &dfs);
>>          err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
>>          if (err) {
>> @@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>          } while (1);
>>
>>          /* Trim the allocated block to the required size */
>> -       if (original_size != size) {
>> +       if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
>> +           original_size != size) {
>>                  struct list_head *trim_list;
>>                  LIST_HEAD(temp);
>>                  u64 trim_size;
>> @@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>                  }
>>
>>                  drm_buddy_block_trim(mm,
>> +                                    NULL,
>>                                       trim_size,
>>                                       trim_list);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> index fe3779fdba2c..423b261ea743 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>>          } while (remaining_size);
>>
>>          if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> -               if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
>> +               if (!drm_buddy_block_trim(mm, NULL, vres->base.size, &vres->blocks))
>>                          size = vres->base.size;
>>          }
>>
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 82570f77e817..0c2f735f0265 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -27,6 +27,7 @@
>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION                BIT(2)
>>   #define DRM_BUDDY_CLEAR_ALLOCATION             BIT(3)
>>   #define DRM_BUDDY_CLEARED                      BIT(4)
>> +#define DRM_BUDDY_TRIM_DISABLE                 BIT(5)
>>
>>   struct drm_buddy_block {
>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>> @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>                             unsigned long flags);
>>
>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>> +                        u64 *start,
>>                           u64 new_size,
>>                           struct list_head *blocks);
>>
>> --
>> 2.25.1
>>

