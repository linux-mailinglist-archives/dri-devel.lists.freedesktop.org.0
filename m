Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22278B18823
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 22:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD0B10E0F0;
	Fri,  1 Aug 2025 20:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jxYLtzxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356CA10E0F0;
 Fri,  1 Aug 2025 20:30:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCEnIM/xO3Rga2/zl55jhjvzYOPbpK0AFxnAVQp5oBd8w6RkYp57KrCHNhZPMUkWcQ0VGvjtjtj7aE5JG8wMwNs+ovV/sdLZIaIMpC2dkMBl6QtDUDfgAFvtJJjdMdSIim+sAluzw/yeY/qsr2thSdYQEcJegAD+g/krsiV+ejW8qak9qb58RsZb6TIWAT0LHB6cIxMHvw8jdWGNWWoP2/q36nO9bUZN93TyrAnPYIvYkrh0GyytDJWiCZX/c1YkCdqz5lL1JL8z+nwEGHpDKyf7mdZym3DxTzQNjFIa5q2+xqRCf60GheBukEfy6x1ODxB81htsYxfLnDha9C6LHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tzeqh3QWoSE9DoIvWFoA3o+VpMHZf6lnDJI/bWQpZg=;
 b=cWd7ksaYbXnRGnL03d/H73WV5Aq1K9+GYWWuYqfhkvRTidxgRqkdwuW4iMOxe19sp/6sJXAZlaNN6BcLKGNGW4HssU0JfxLsOhFFUZh+GZArGqk50zb64IU4yMycdla+llSXZo2ubgK9yhup+yq6cCj4M53ovQxqb7t4cNOd4NCKpue7uRc/rrJjdWR0FTjolUROZDQyjXdSKDoZvGwHfQ5KXQetvCP2L73Gh1qNHL8k3iz1JK+GC+R+PJWH0QezZOQf9vhx9WG/h1S1amNBhuaoIe0pEUlGIu/nLO3wcMsLKpUhTXTVV0eRqVsa0Wp78JG3AKfglWqQd78adGa3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tzeqh3QWoSE9DoIvWFoA3o+VpMHZf6lnDJI/bWQpZg=;
 b=jxYLtzxzesEW5pSK/7ty1dVS+OcY37BZzAhdWRJGltdfW80A9bMvh0/AFTFEPryfid6IHUa/AEqV7b2Q16xQ5cDxTASy7pbVjSWwbod685CB9nD+d8iK/2yEN4FU0F0tKADQqGW81SVRWciQ0m2bsCvglqJ6KEMvXOWS2zTKtDxCDQfEyPVRP5fhTl90HwC2V1V871nh7Bi5/CWjP1BNfkBojZtc/rETJZpUuM+aAd9KKrUgXPo6iVMij/MHMHugnLGT0qfuOOtOpUdPopRckcKWY6ojlQ+/mhXEJ4UEI6nU/rS8Fyc4f/yTYL3Nb8A2vH1u6a8iOLuCHG5bMBeMtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by CH2PR12MB4296.namprd12.prod.outlook.com (2603:10b6:610:af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 20:30:04 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%6]) with mapi id 15.20.8989.010; Fri, 1 Aug 2025
 20:30:04 +0000
Message-ID: <23dc5ff9-24fd-44ae-ba98-be848e8fce78@nvidia.com>
Date: Fri, 1 Aug 2025 13:30:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Pass along the format info from .fb_create()
 nouveau_framebuffer_new()
To: imre.deak@intel.com
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20250731234104.25243-1-jajones@nvidia.com>
 <aIwmRwgOa3-YAhna@ideak-desk>
Content-Language: en-US
From: James Jones <jajones@nvidia.com>
In-Reply-To: <aIwmRwgOa3-YAhna@ideak-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0046.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::24) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|CH2PR12MB4296:EE_
X-MS-Office365-Filtering-Correlation-Id: 63db981b-a5a2-43a2-6e52-08ddd13a3299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3RJU0tRQnNvSFFQcm8rd2xXSFQ4bSsxZ0xUYmlSVWc2VXBQSk5LMmJ2dlcv?=
 =?utf-8?B?bHVxanM3Vk5zT2lDUzRtMEFUdmtvaEtiN2RXNUM4VllMYndQRFg0dWFhYUY0?=
 =?utf-8?B?TkVhSTBGZHQ3T0ZRci8veVJKNllOZWN1NVp6MUpvMW1HbUs4R1hoWDBlNG45?=
 =?utf-8?B?a0tJaGc1aHpselFQaHlDa1hYMmhkaEJGMFpDSk8vc2pYcEhaVnZ0N2phcGND?=
 =?utf-8?B?N2RGZUxUeks2RDBrMkNyV1Z1OW1uZEI5RjBKSnVXTlgxK3ZaQTVVeDl6RURK?=
 =?utf-8?B?emhETGdQMEQ4Tmo3V1dSc3g0R0RsV1EwNlgxWHJYYlo0WDJKQVdkZnRDamRU?=
 =?utf-8?B?N0tYTnVYUVhsVFkwSTRGMUUyeDhmYzhnTGhGWDRwUjdmdWJ2U1FYNml6Q0xm?=
 =?utf-8?B?ZXpNN2gwQkVBSWNPL3kyN0phakJYaXFDOEhXbEhjcFNwcUNXa09jWkhQcktH?=
 =?utf-8?B?OHJtTHgyVnBwUk1maFh2NzRJZUR4ODNiR0UvQjZydGdISlVGMlVxeDhiVEhE?=
 =?utf-8?B?Uk1oL0l3ZXptM3EvWHFJV2laZlo2Q0NLVWFlUWt2cXB6N1lDSk9meWRxYnZH?=
 =?utf-8?B?NXZQQ2JnemhhU0JaR0wvV3B1QzdHRnpZdTBLY2gvaWNXc2JUb3daUDh5NXNN?=
 =?utf-8?B?NE93cG9PcURld2orSkNQS2piV2p1ZmZ3Rk9vZThaNzgzS25SQUUwWjEweFhX?=
 =?utf-8?B?Q2JKbDZPc3Y2cXJYN0tPbGw0UWFLSGk4ekcrT0VyYmRXMmI1ZVZzZ21FU1ZV?=
 =?utf-8?B?OFFaNitUbXdvMjVEdnErN1B2YWdaeHJCZUdNbXRrNXpUaXNpek1SUE1rUExK?=
 =?utf-8?B?S3RZOUtvaUVpWWU0RlFERU50TEk2Q1lKWSszUElwR0Fsd3EvQ091QjlXL09S?=
 =?utf-8?B?UFVQa1JIZWkwWjFWZmQrblNUaUNxZTh2T0hBSGFBY3ZFb2NIQm1yMUVkTUZN?=
 =?utf-8?B?KzRQTjFqU0JGOGxzaTZhbG5oT1NFZ2lJaUVpeHBISXpHZXpEMGVQRlhka3NE?=
 =?utf-8?B?T2pNOTMxTG8wbWdGc2o2ekUrMnhRWUpDU0FOS2xmNVM0VExKTmpwSTltQnNN?=
 =?utf-8?B?dGx6cjhvNWlIS2lhVlhIbDdOOWxMOFVwbjA3dzhEdHpxQnhvc1Yxakg3RjBu?=
 =?utf-8?B?UDdmMjJLOWZXdTljc2lKaU1EcHEyWHgwNzY3MGVUQ1NRWitSWUo2UG4rN2pN?=
 =?utf-8?B?aFk5TWFpMHEyMlAwV0ZiU0J5RkczWFJxc1N6MUxRQXFMODFnaGNMOEdQalNs?=
 =?utf-8?B?cFpkd1orMFI5d2QvL3F6OVdLRVZhSE83cVdlVXRnWkFVTXdzZlVCM255M1dX?=
 =?utf-8?B?QUtjTjBSQUoxUTZzbDU2TTdGdHl3TE9XZmhBeWdHM0R2QmQ3bzQ5Z2dGUjVV?=
 =?utf-8?B?eVBtYXRZNU1Zb0dhQiszNXVJenBqS1J2cjd0U1VvZmpnZ1JKWkJsVHdTQy9n?=
 =?utf-8?B?RkQwZ3FwZGNERkdxUkNEZktNcUl0NUNwMm85VFdSb0h0blFtOEY2VFNvbUEr?=
 =?utf-8?B?QVNxZGhmMDZwTUQxbXR0bUJheXY0NXJzdlRiUHV1Sm9LNVl2UERzd2pabU9Y?=
 =?utf-8?B?cktnc1VwR0NtTkZ3MDZXWVY2amlpbFhYeXNlcWVNVTRTNnNMQ05DM3FYa2My?=
 =?utf-8?B?a1IydklGSDR3T2J5K29jdjVBbWJkaFpodnEvWW1HQVo0Ly9pVWlScTl1ZjZp?=
 =?utf-8?B?UFVGYm9uUTFKVDFTQTVVbzNpTnBjRVlrcEk0UkZwNTREZ2x6UTRvbVhabk5X?=
 =?utf-8?B?VjdoOGxZaCtQM2JhQ0Q1TWRPaEU2VDFiUEF6TG1JM3daRGVWd2l4NTZUN3pG?=
 =?utf-8?B?U25DUzhsVXJ1R3JVU1d3OGVrdC9TV1o3b0VNcjYvYS92aXhKdTRsTy9ZcWZm?=
 =?utf-8?B?RktyYXJ4QmpDMFhWSEJ2MWhpSTk5SithaFV1TUY2dDJOdHc4cFN1WGljRXFu?=
 =?utf-8?Q?zjR9QabRykg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHVtMkhZKzIwZE5jT3ZJWXVTQTJSQUVrbjlNcnZFTXFHUVFhOUEwQkVHYWR6?=
 =?utf-8?B?WmhSaWJJeDN0ZXRudzJwZ08yc051YjRYUGN4b2NnbTVKOVZHU3l1QWM4cVg1?=
 =?utf-8?B?V1lWeGF2dXhSSjNPbDZ5Rkg0VVJrZGhoY3hUQkJFUThTd2c5TnY2SHF5V3BK?=
 =?utf-8?B?UkYvV01DWUpPOWljdGYydUJlem1mMEJlb2xDVFpjR1RmRG9GMEpyaE91SzBX?=
 =?utf-8?B?a20wbzZvQitmWGxOYUZHdlVCbWVmQm0vSkpPOTFqME5TR2pVSko2b3RtaGZ2?=
 =?utf-8?B?bEw2SUsvYjdnbEFxZFRBSFpuNkV3cCtwS2hFbHNqRG9hcjlYNjltcUdMZEo4?=
 =?utf-8?B?NG5od1FDVnhnL1hPNElWWmhtK05vU1NOYnNZazJjMmpkQnliY0xCNDdUMHFy?=
 =?utf-8?B?OWx1bUF2SERsZmxxaFZIb2lBeEsweHBlZHJiZnU4UmlKbFJFOHg0Q05HaW5J?=
 =?utf-8?B?SEM2RXlNWmhpK1FyTkNIZW45c2QwaDZhZ1JxOFp2WTdLbmRYN2pINVVtdzhP?=
 =?utf-8?B?RXNhb3M4OEVCRlYrVjlaOFBSOHZ5ZTd3dUF1c1ozZ3JlREt6ZHpZYWo2S2JZ?=
 =?utf-8?B?OXJZYWJraWdseDVBV0QzZ3YzMEVLdk45Smd3bDZXUFYxTmh3bGZibGRpbTZY?=
 =?utf-8?B?eDVnUXdWcVNQdzZJVXcyYU53MUZrcTU2dmE0RlhtRWNBa2pYT1ozSVliQjJX?=
 =?utf-8?B?ZlNQQVVDWlBZa2toVUVvQ0draUlqckxxb3ZiYkFhbGxHbUJDVnVCanFYaStC?=
 =?utf-8?B?ZjF4UDd2amxMRDBrLzJGM25pbm5nclNCaW1peTlvekUvb2gybSsyK3BmMnNM?=
 =?utf-8?B?REdnN0VEb0hBeUh3WnVDSTR2TXhibFVSbnhSVG9uMW5YQzVidk9wc1BBbHBC?=
 =?utf-8?B?S0lFQnV2L0kyRm1lVXZoTC9wK3RMUWlra2VKMTEyOGdYMEdrQStYMW9hVEdV?=
 =?utf-8?B?dXhuRWJaVFl6T3N2WFFOdUJLQ2hhN29ieGxYY3oxZFpQT2FJTUpnQ29CYUVk?=
 =?utf-8?B?WFU1ck5jK2JOSGtRRlZPaEV6MVdTb3BXTjJJdWJnN2FZZlcyRnJJVE9hQStR?=
 =?utf-8?B?RHFUZEhiang1TDNtOUtzdytKOHFhUmwrY0VMdGdrQjk0aXJMOVhiNUlRc1d2?=
 =?utf-8?B?cDNFdWFMZWhkRFRqQi9ablhYYmVPWmlpemdRRzJXcnQ3MjJncGRmbFRnK1VK?=
 =?utf-8?B?VU9rbDdPaitWZ0dsa09VTHAwL3dSVWxhRStFaGY0dU0weXp3M0pzYndKbkNs?=
 =?utf-8?B?Q0pPQytJdnFrNFpTVVAxMEhXVTlNVVA0QldrTEVpU2ZQVk1mejFnNWx5NW1Y?=
 =?utf-8?B?alpTeVk0QW8wZEVpTzJiV1VYNTdUcXlaV1V4Slp6eElqZkl6blc1ZUM3TFhH?=
 =?utf-8?B?c3Q0TEtydlZIV2lrbWFacFpneHk2M0RSaUUyZHI5aGdob0tWdWF6L2xIdlpH?=
 =?utf-8?B?YitudEtqTFVyQ3V2UzhiTWc1ZXMzajNodjlzTkxQQTBVbnVFR1pIMEh0UzZ6?=
 =?utf-8?B?enN2bDhSMjNKcXlXZWJJTG1FNFBnaWlEN3pJaVlHY1pGUUwyTUtwbHAzTllr?=
 =?utf-8?B?VEk1Q0ZEdk81NUtuRGQwZ3pqYTJVRWg2T1c5c29ORDVqVHZDcEhQZVA1T25S?=
 =?utf-8?B?Q2M3Z0ppTlc1dUFINi85VzlNeWdpcmVIOSt1d2ZkYkFtN0V0VXd0WmpnM2Fv?=
 =?utf-8?B?TWZrQW9UQUZTR1IzQmdBamFOYzhwTXZGc25sSGdhS2I2cm1STUdzUGlXZm1i?=
 =?utf-8?B?SDZETUsxcTRObSs4bSs2MHp2R3V5NHpVd1lKQWRnVGJFblE1d1g3NGd3ck11?=
 =?utf-8?B?NlNaREM1Qzh5eG1WNGt0YUVqRGEvSkltY0hNRVBnRnZBVXYzMmRvVlhyL1lJ?=
 =?utf-8?B?clIyNWR5RmNpOW16c3UzcUF1dkQyeXFTWWlwWDFBeHgrZ095cURIMEl4blBE?=
 =?utf-8?B?Q0FUcFlnS2poRFBnUVFLUG1PWWN2R0pzUndFOFJ1RzdiNEFTdlJEdDUxdzRz?=
 =?utf-8?B?K3J1MER2M3lpanlVSlRPU3JxODl0VlNwNUJtNGMwYWlYQ0w1UnpHem1Db084?=
 =?utf-8?B?UXN4dlZJYTY1SjRPd3ZpZXdNVGcrVFd1TWZjSVB2Yk5xOG9DZVZMZU9SaHhk?=
 =?utf-8?Q?YgAaw5VVS05M6tJnaM3d+TMrQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63db981b-a5a2-43a2-6e52-08ddd13a3299
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 20:30:04.6020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q33itzWyUILukHmVqtyKxFHwfFV8Ks5bQVrT8foKnSMO0CQ1sWTYqH7evNb+dIJWczPqAQjyeGdtuapssqa7oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4296
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

Apologies, I saw your changes for another chipset, but missed the 
nouveau part. I've responded to your thread now. Thanks for making the fix!

-James

On 7/31/25 19:28, Imre Deak wrote:
> On Thu, Jul 31, 2025 at 04:41:04PM -0700, James Jones wrote:
>> Plumb the format info from .fb_create() all the way to
>> nouveau_framebuffer_new() to avoid the redundant lookup.
>> Also plumb the format info from there down to
>> drm_helper_mode_fill_fb_struct() as required, avoiding
>> a WARN_ON() and failure every time this path is used,
>> e.g., during fbdev init.
>>
>> Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
>> Signed-off-by: James Jones <jajones@nvidia.com>
>> CC: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> I posted this change already:
> https://lore.kernel.org/all/20250728101603.243788-3-imre.deak@intel.com
> 
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_display.c | 9 +++------
>>   drivers/gpu/drm/nouveau/nouveau_display.h | 1 +
>>   2 files changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
>> index e1e542126310..805d0a87aa54 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
>> @@ -253,6 +253,7 @@ nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
>>   
>>   int
>>   nouveau_framebuffer_new(struct drm_device *dev,
>> +			const struct drm_format_info *info,
>>   			const struct drm_mode_fb_cmd2 *mode_cmd,
>>   			struct drm_gem_object *gem,
>>   			struct drm_framebuffer **pfb)
>> @@ -260,7 +261,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>>   	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
>>   	struct drm_framebuffer *fb;
>> -	const struct drm_format_info *info;
>>   	unsigned int height, i;
>>   	uint32_t tile_mode;
>>   	uint8_t kind;
>> @@ -295,9 +295,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
>>   		kind = nvbo->kind;
>>   	}
>>   
>> -	info = drm_get_format_info(dev, mode_cmd->pixel_format,
>> -				   mode_cmd->modifier[0]);
>> -
>>   	for (i = 0; i < info->num_planes; i++) {
>>   		height = drm_format_info_plane_height(info,
>>   						      mode_cmd->height,
>> @@ -321,7 +318,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
>>   	if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
>>   		return -ENOMEM;
>>   
>> -	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
>> +	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
>>   	fb->obj[0] = gem;
>>   
>>   	ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
>> @@ -344,7 +341,7 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
>>   	if (!gem)
>>   		return ERR_PTR(-ENOENT);
>>   
>> -	ret = nouveau_framebuffer_new(dev, mode_cmd, gem, &fb);
>> +	ret = nouveau_framebuffer_new(dev, info, mode_cmd, gem, &fb);
>>   	if (ret == 0)
>>   		return fb;
>>   
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
>> index e45f211501f6..d569240df354 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_display.h
>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
>> @@ -10,6 +10,7 @@
>>   
>>   int
>>   nouveau_framebuffer_new(struct drm_device *dev,
>> +			const struct drm_format_info *info,
>>   			const struct drm_mode_fb_cmd2 *mode_cmd,
>>   			struct drm_gem_object *gem,
>>   			struct drm_framebuffer **pfb);
>> -- 
>> 2.50.1
>>

