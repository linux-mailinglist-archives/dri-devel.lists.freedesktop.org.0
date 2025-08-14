Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9740B2655F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 14:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4809410E1A4;
	Thu, 14 Aug 2025 12:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ah7MfNiV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A5710E1A4;
 Thu, 14 Aug 2025 12:29:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxUOFgGMvfFSiVrRiAnjDg0pew8CNCFhsBxcioC7bRh/agJuZ66kWAFMyTPimWlDP/rXyKp6Uv3BhzkXry8ql+PR0r6OYKzdzaTyQgSdBlfZtS6jcr2qNCAm/rGmR9lshi9lkL54GDM1sn3t52NwgeAY8QLIlj/TsSSarGH99BOQ0SCXNg/xsTkKdWuRhaXD+LGaSDXRMWvuRkRKxEM0fAr180aaklQrZ9Gf5LpWdP4BrhhG6kObFxyYKiIg5tRO0RjWYW1MOKoF1eDbnhUgacI7l9UeReRXjMHiKNh893Bzd2MVW4zfKluIRSmaoxejyPksBGq+e9+7P2bnjLubbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTzNsG6kT0tKFMb8OHIl5onkwrfFCFjna7dlUFRs9mI=;
 b=MXQ4p14XgwNa2TeJdNGWrSh3Qet1jFNWbRhTFesiaCMfxfkovw+3Yk/4IHkui3vUEhM2YdnA2k8dLdLwbfCWX/poieVbcSjZClPXc0JKHCcXQm7mto05JYbMiYSLpN21eYIJyqSD7iYjBNY4bh5SzmTkt8X3JSPeA3Q+0hly5WN7/VduXRN2FUTNhBDvCy9Gp+I53TyGzzFxN2Xb511ROUFDJW/3zFIwb8I/HR4WrGsoG8rmVCGdy47X10riPZd0lJUfUSxfGlv/2F8SAm366et+Pe2PwJOtERuw8wDHy+QwOpm/doOzG+SHNNa3KQIh6dE6lJWu/IGSYzkZtXya1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTzNsG6kT0tKFMb8OHIl5onkwrfFCFjna7dlUFRs9mI=;
 b=Ah7MfNiVqneFZXt44pUWHRXPMD1o0jpg/EP9T2atfNo1AUHy2q/59va6U9Cg+qSjBTxYiQKBhIq4USHyBziB1F2wxsxOM3hBgnYcLjUBKj1Z6eJCvcoQ1/7z095XretK2lLWxsR//t+tUKxNkevjT0G+A6LiSZjquGoFPtWa0cc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH0PR12MB8505.namprd12.prod.outlook.com (2603:10b6:610:193::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Thu, 14 Aug
 2025 12:29:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 12:29:28 +0000
Message-ID: <f0d58122-5958-4c93-b1a7-daa229a723b6@amd.com>
Date: Thu, 14 Aug 2025 14:29:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: Move the memset() function call after the
 return statement
To: Liao Yuanhong <liaoyuanhong@vivo.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250814093957.137397-1-liaoyuanhong@vivo.com>
 <d77e242e-af6c-4693-b207-576b823a0c0f@amd.com>
 <14ed323d-de4c-4f98-a16c-8bdb1b92c34d@ursulin.net>
 <6ef5e1e8-3868-46c0-a31b-505f8a91d37a@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <6ef5e1e8-3868-46c0-a31b-505f8a91d37a@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0234.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH0PR12MB8505:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c04046-489c-45b0-4134-08dddb2e361d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEk3bmluL2dobEFyNnV5NDJCRU9XeXBDRmdiQUdjV0drNU5zZTRrYlJONHlr?=
 =?utf-8?B?TkdsRU54eExOaGFDNlZvVG51dVdwYUpwQm11UGtqWWtzWVFoT1JQci9qZGRq?=
 =?utf-8?B?RTEyRmhoNDJVdWRRZU9TL3NVRnk5d3hqdGYwSlpsdDdnUHo1dUUycTE2L2ZZ?=
 =?utf-8?B?Q2tpSEdCN2JjeU5Qay9xTS95S2tOODJ1WEpIdkw1ei8yNElhWS96TEVpZStq?=
 =?utf-8?B?ZExQNGo5eUE4NjVaNUFJd3VPM3VlSjlFREtEWWFLRnhCa0pLWTZEQzI0Nkow?=
 =?utf-8?B?WFhEK3cvb2NwanI3cUJWQkNLQ0tuSmwxSlhYeWNkbThoRktKRUlZMVZsYVh5?=
 =?utf-8?B?TmJ6QWZ5RmJBL3JTbWk0NHYwTWVENC8wVUJkdE1HZVVSOVdXYVJOMmZKcFNa?=
 =?utf-8?B?WVllZmVrTCsraExQZ2gwN3U2Sm53V1Bhc0VueHVwa1NNcnJDcGhrZHpQVnRN?=
 =?utf-8?B?STlNTUUrbDNDZjRtT0hzVGFuekllS1BBWCtpZ0pHK1ljUUJWblFJRWZsSHVU?=
 =?utf-8?B?Rk1LYVZmR3NHZlkyK0VkRnZoRUloaTdrcmg2cTg0Sk9IVlA1MThFVFhvUkxR?=
 =?utf-8?B?R1lRRTcrTktrYUdjYXJBdVJ5S2tRZEJxbllHVEVKOThPYzRkSDM5VTQvNjJW?=
 =?utf-8?B?ZjBxOEIrUnRDYXZ1QzB6WE52RFFUUmVra3AxS0dZS3ZUMmZDcmJjMHg3aHZP?=
 =?utf-8?B?RVBKRDcyRHplYzRublFmODJCbE1EWmJUNVQrUk1sVjl5Wk10Z3pzL3JiMUFj?=
 =?utf-8?B?em9RNW5aZ3JZN05CZy9RUi9nTXFRT2xCNC9Gd3kwUkl2YW9OUlIvVmViZlZj?=
 =?utf-8?B?VTNiYjNJbnpLdmJ4dWdWYzE4enlyWWlYWmhUbmZzQWVncWU3aVI4ajdETTBO?=
 =?utf-8?B?V2dldHhmOERmNGN3aEx6dG5nemJtcHN2bllrdGcvOGVkTWk3UlJvazZSVnBV?=
 =?utf-8?B?MUE4R3krblFGRG5CRGdyaUd6ZFdSSlZZS05TM1JSNk5wVHlBMFprUkVnYThn?=
 =?utf-8?B?R3d1emcvRGo5T3ZSak5jSEoxT3BTOU53UXNCKzJsNHlzSitNK2FvZFd2RHZj?=
 =?utf-8?B?TlhTZ2k4ZzJ4clF0cTE2TGFpNXdaYkFFZVdlMjl6a1VBSVN1R1lvUUt6OG5n?=
 =?utf-8?B?Ti9lVGRoZ2pMVk1ZWGlNVU5vTGMwbDN2bTBDbDlZU1Nhb2pqcjUycE5XNzVQ?=
 =?utf-8?B?UVNEOFNTZVNkcVJwTHA2ZEo4M280SExIYXhIR3cxeEVpVFkzZlRYZVN5RzlR?=
 =?utf-8?B?THErNXBadUpvQTBlb0I3YlZpM1hESWNQV1ZmYUlSUGowbTJYZTZ0aVUxZTNJ?=
 =?utf-8?B?U3E0YTg3UlRhNGtBdHhPem9oc1FUY29wWWFXcVBSaVpJeXA0RHl5T2taMkxm?=
 =?utf-8?B?Mmh6ZmFIVGhRZUtRWFd4anNhbHorMXdtRllDL0FWVVk4SGorcWdkcmxuVmM0?=
 =?utf-8?B?UHNmdC93UWp2Kzg2VnA0SlR2UUkrYkNXMDN3UG1uaTlIb1Q4VmNKWlpUVGxK?=
 =?utf-8?B?RmZ4Rml3cVFlVSt2WjJrWnlmNXd2OFk0bng1WUdjbmw2NE5RQVkzRFlDS01l?=
 =?utf-8?B?VC94TEZ3R0wzU01EVDN3b3E0NEJYU2d2QkFtZ3J0a2xNN09vTlozUGUwckVh?=
 =?utf-8?B?anBMRzRWV25ZSDZCVkcwRDU1MnhSNkVBTjB6NUFCeS9CeTUxc3Y1SG84elFD?=
 =?utf-8?B?WU1kQWJ3M2JqazE0UWg0MWx5VjNTKzM4RVpoYk1IYVMxTWRmUXI2SFgxZmxx?=
 =?utf-8?B?N2FzL1R0cHIySkxoUVJrVFJyUlhGZ0tCN2xLazdXVHdTSVIzc0R0cjZoUmRC?=
 =?utf-8?B?eDJGREFFSkdQY2lXaTVsOTllVklGaENVdlRZNGJrS3JpTUdBTlBOY2ZmYXRv?=
 =?utf-8?B?dFRTc1c2S0tTVkV3RGxRaWY5TFBEUExaUUIrMHU2NUdjWnZNZFlZZ2xmQWt6?=
 =?utf-8?Q?xug1g2jAn3g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzdIS1NRZE1ZVDVrNXJ6NkRBUnQvZkZ0QTM5ZlNkSXBmUVZaTFNoaVJ3eWFI?=
 =?utf-8?B?WkZlTDlMRGpMdXV5S0p5RkMxWnNSZXN3N2NjUlZKWFFmNlE0TmErdDJUZTN3?=
 =?utf-8?B?SkRqOHhBK01yMXRnemQ3bTJTL0JkdFZHV2J5amNQY25xeEhGeHhxQ3AxUzF5?=
 =?utf-8?B?QldmaFNLMEJIUVNKNXU4WU9WMDlHcW5CbmVtaGs1eTZKd2RZVzFXQ3IzblZ0?=
 =?utf-8?B?cHI1NS8rSTl2S0szRWRldjdBSHZLZGtlcmhkK2N6c25QVEZmR1J3L1pjcnpV?=
 =?utf-8?B?ZmdzOVpTaU5CL2tsdUkyb3hEREs3NTJNZlRQQ1FLRmlYTUhHY1dPcHpkSGhp?=
 =?utf-8?B?UXl6eHF6ZHdSVXZ3Q3NCd0Q0RktBTVUrSkdPVnRVTjkydVNjVkN6Tzlha0Y2?=
 =?utf-8?B?K2U1b2FSNXAwYlZCTGRWNVh4cHorNU9VSW1aNTZsbFRGWFBjbjI1KzF5ckZH?=
 =?utf-8?B?dmUwR3RkUzBGMTluazN1TmFjRGtzanpoZ3l0TGdvSFoyQk1HYlExd0MwTnMz?=
 =?utf-8?B?K2NCWlpLNGpMR0NPYXBhOGt0T3VJVG9BUEdWUkZjLzFLMndTQkhDb1F2QzFi?=
 =?utf-8?B?TmxDZS9rTTFwNmt6VDBNSEhielBHbGRCNEpKVkE3S0ZOL0xTSWtXTzNmbVov?=
 =?utf-8?B?eFlkazFyR2ovamoyRTQ5NmxOanVCOUo1bkkrZFZPNjN6S2RLTnBpQ29hNlpE?=
 =?utf-8?B?eXlhYlI4SnJqS1l5ZmFlbFBaY09ycFR0RG1PWEZqKzB4RmtUanczY29NRTFV?=
 =?utf-8?B?L1k2RjZhS0RMd0lINndQbDE2NWU4MXcyZ0szWlhBN3NJZ2xCTlNONXRhZGZC?=
 =?utf-8?B?dXR3RmNQUVpwMzhLQ2VmWHdIVUZlb2pBZkFid1JyellmOXJDV3FqQzYyTTNF?=
 =?utf-8?B?Y0FTeGtoSTZGQVRkcFM1d0toUERJZitVZjVYN1pIdFJrQTZiUkRiUDJWYVIv?=
 =?utf-8?B?dTRsVmY2T3BhTDQrVFB0UzZkVGZZWGRhc0pQRFBObXVzZ2txa0hFOXFBWWpl?=
 =?utf-8?B?cEs3OFFucE1yYytaM2RaRjYvSVE0WVlhWUdOR0NJM0FrVEFiOENFeTFHWmZp?=
 =?utf-8?B?Q3lwOFFLNHdFRlFNaWtZZUNIalRTWWJFck9GZjR5RWRjQkYzN1VPT3ZSOC9Y?=
 =?utf-8?B?YUlIMFVqdWhENnBMeVNIUVpONUF0aEMreGNKN1BjUVJtL242VE45RXN3Zktv?=
 =?utf-8?B?SGc3TjVpQlhNcWJqY3lKdVlCMGRyamdDTitWemUwQmUvN21DWUhYR0RlVDRW?=
 =?utf-8?B?TEtHTzJUM0dyWkQ3aklLa2VqZkFoOGM1Z1ZYaUM2VXk2OVB0VVh1YlRxOUZh?=
 =?utf-8?B?Y2x0U2pUekJ5T2EwcXI1dWxoMDR4N2VicHM4UWpUcm94bE1KL0lxVVVVRWlH?=
 =?utf-8?B?MG1UZGVXVUh4Y08vaUhjYTZxVU5wWjJqQ0N3TUJnaGNvWnl4TkdSZFpTRmdI?=
 =?utf-8?B?aXpQYzE0Q1pleG1lQko1Rm4zdXpvOXFIQ2VPcWlycmdRTkUzR09RaTVkZXpm?=
 =?utf-8?B?R2hmdkg1SzJyeHNIS2VxTmlBdXRRUW4waU10Y2NKZEpaS0dBaDc0Sk9BQzJq?=
 =?utf-8?B?UXRoaUhUVUxQcXhsaFZwa09uZ0ttUHpMR2NMemlSL0lqaU04Q0ZQNmRTbE1Z?=
 =?utf-8?B?Vys5WHMvQ0JxR041ZTU3Wmx1ZUlzSG1sSFJvYXBmY2hPcGFwenVDWWJPSmQv?=
 =?utf-8?B?UU8zcWp1UFdpVmhKR0JERWZPem04dWJ5V1pCc2JJODh3NnFmdDJ4cGUxWXhM?=
 =?utf-8?B?YXlxankrWmFTYXdaclBlV1hYanBldjAzQU1ZdjlPb1N4RmcrVlBPaTFIeXF0?=
 =?utf-8?B?dVFFa1hOY0VTbkNlUjl6T0t2VmY4Y1hFSzVpbUhEMGlsR3d6VDJTVmtXZndR?=
 =?utf-8?B?Q3pOL3A3cktvVCt5M1hKRUM1V2lzTytEOE4yK2dnbk41SVh5ZXVEeXlMS0RD?=
 =?utf-8?B?aE10YllNcW52V1VjRCszM3poZFZIL3RGMmxUK0JhZW1FUXNQVERvVjBhR2Zx?=
 =?utf-8?B?ZWVNZmpLYllPMi9ZcDFSK1F6VlJUNER2T2JHTDI3YzFsTGJtWUdUc1NmSVg2?=
 =?utf-8?B?RkZhcTVuSm9WK0sxaXF2RzdNZ2s1M2MrMmNrMWlHYThBS0N0OVhVVGZ1WWpp?=
 =?utf-8?Q?ZR2BpXQRceTakeQA2apIdDji2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c04046-489c-45b0-4134-08dddb2e361d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 12:29:28.0783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xSmveUgKkko2H1G0wTsPjJJXngM6cp2DXiZNc5RBidP2LmAGW2gE90J2ZK2NhaM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8505
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

On 14.08.25 13:56, Liao Yuanhong wrote:
> On 8/14/2025 7:07 PM, Tvrtko Ursulin wrote:
> 
>>
>> On 14/08/2025 11:11, Christian König wrote:
>>> On 14.08.25 11:39, Liao Yuanhong wrote:
>>>> Adjust the position of the memset() call to avoid unnecessary invocations.
>>>
>>> Hui? That doesn't seem to make much sense to me.
>>>
>>> We memset the local variable because we need to make sure that everything (including padding bytes) is zeroed out.
>>>
>>> Even if that isn't sometimes necessary because of error handling we clearly shouldn't try to optimize this.
>>
>> To interject with a curiousity, it is even worse to move the memset away from the declaration block when the often enabled CONFIG_INIT_STACK_ALL_ZERO is on. At least when they are close compiler can figure out it only needs to memset it once. Move them further apart and sometimes memset happens twice, yay.
>>
>> Main point when CONFIG_INIT_STACK_ALL_ZERO is on, and it often is, there is no way to avoid the sometimes pointless init. I have some local branches which try to address the worst offenders but it is so much in the noise that I don't think I ever sent them out.
>>
>> Regards,
>>
>> Tvrtko
>>
> If we converts memset() to = { },can it alleviate the problem?

No, memset is intentionally used here to make sure we set all bytes to zero. Including padding.

Regards,
Christian.

> 
> 
> Thanks,
> 
> Liao
> 
>>>> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
>>>> ---
>>>>   drivers/gpu/drm/radeon/atombios_crtc.c     |  8 ++++----
>>>>   drivers/gpu/drm/radeon/atombios_encoders.c | 20 ++++++++++----------
>>>>   2 files changed, 14 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
>>>> index 9b3a3a9d60e2..0aae84f5e27c 100644
>>>> --- a/drivers/gpu/drm/radeon/atombios_crtc.c
>>>> +++ b/drivers/gpu/drm/radeon/atombios_crtc.c
>>>> @@ -770,13 +770,13 @@ static void atombios_crtc_set_disp_eng_pll(struct radeon_device *rdev,
>>>>       int index;
>>>>       union set_pixel_clock args;
>>>>   -    memset(&args, 0, sizeof(args));
>>>> -
>>>>       index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
>>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev,
>>>>                      &crev))
>>>>           return;
>>>>   +    memset(&args, 0, sizeof(args));
>>>> +
>>>>       switch (frev) {
>>>>       case 1:
>>>>           switch (crev) {
>>>> @@ -832,12 +832,12 @@ static void atombios_crtc_program_pll(struct drm_crtc *crtc,
>>>>       int index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
>>>>       union set_pixel_clock args;
>>>>   -    memset(&args, 0, sizeof(args));
>>>> -
>>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev,
>>>>                      &crev))
>>>>           return;
>>>>   +    memset(&args, 0, sizeof(args));
>>>> +
>>>>       switch (frev) {
>>>>       case 1:
>>>>           switch (crev) {
>>>> diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
>>>> index d1c5e471bdca..f706e21a3509 100644
>>>> --- a/drivers/gpu/drm/radeon/atombios_encoders.c
>>>> +++ b/drivers/gpu/drm/radeon/atombios_encoders.c
>>>> @@ -492,11 +492,11 @@ atombios_dvo_setup(struct drm_encoder *encoder, int action)
>>>>       int index = GetIndexIntoMasterTable(COMMAND, DVOEncoderControl);
>>>>       uint8_t frev, crev;
>>>>   -    memset(&args, 0, sizeof(args));
>>>> -
>>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>>>>           return;
>>>>   +    memset(&args, 0, sizeof(args));
>>>> +
>>>>       /* some R4xx chips have the wrong frev */
>>>>       if (rdev->family <= CHIP_RV410)
>>>>           frev = 1;
>>>> @@ -856,8 +856,6 @@ atombios_dig_encoder_setup2(struct drm_encoder *encoder, int action, int panel_m
>>>>       if (dig->dig_encoder == -1)
>>>>           return;
>>>>   -    memset(&args, 0, sizeof(args));
>>>> -
>>>>       if (ASIC_IS_DCE4(rdev))
>>>>           index = GetIndexIntoMasterTable(COMMAND, DIGxEncoderControl);
>>>>       else {
>>>> @@ -870,6 +868,8 @@ atombios_dig_encoder_setup2(struct drm_encoder *encoder, int action, int panel_m
>>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>>>>           return;
>>>>   +    memset(&args, 0, sizeof(args));
>>>> +
>>>>       switch (frev) {
>>>>       case 1:
>>>>           switch (crev) {
>>>> @@ -1453,11 +1453,11 @@ atombios_external_encoder_setup(struct drm_encoder *encoder,
>>>>               (radeon_connector->connector_object_id & OBJECT_ID_MASK) >> OBJECT_ID_SHIFT;
>>>>       }
>>>>   -    memset(&args, 0, sizeof(args));
>>>> -
>>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>>>>           return;
>>>>   +    memset(&args, 0, sizeof(args));
>>>> +
>>>>       switch (frev) {
>>>>       case 1:
>>>>           /* no params on frev 1 */
>>>> @@ -1853,11 +1853,11 @@ atombios_set_encoder_crtc_source(struct drm_encoder *encoder)
>>>>       uint8_t frev, crev;
>>>>       struct radeon_encoder_atom_dig *dig;
>>>>   -    memset(&args, 0, sizeof(args));
>>>> -
>>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>>>>           return;
>>>>   +    memset(&args, 0, sizeof(args));
>>>> +
>>>>       switch (frev) {
>>>>       case 1:
>>>>           switch (crev) {
>>>> @@ -2284,11 +2284,11 @@ atombios_dac_load_detect(struct drm_encoder *encoder, struct drm_connector *conn
>>>>           int index = GetIndexIntoMasterTable(COMMAND, DAC_LoadDetection);
>>>>           uint8_t frev, crev;
>>>>   -        memset(&args, 0, sizeof(args));
>>>> -
>>>>           if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>>>>               return false;
>>>>   +        memset(&args, 0, sizeof(args));
>>>> +
>>>>           args.sDacload.ucMisc = 0;
>>>>             if ((radeon_encoder->encoder_id == ENCODER_OBJECT_ID_INTERNAL_DAC1) ||
>>>
>>

