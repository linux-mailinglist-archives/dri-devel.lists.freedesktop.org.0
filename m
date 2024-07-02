Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D24924740
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 20:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D3910E686;
	Tue,  2 Jul 2024 18:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I76UWR/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB26810E2D6;
 Tue,  2 Jul 2024 18:24:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1cA1GKC4XvqgD6go+nip0FkHxVNYiyjrS865nHSuzsIPq50/wWqwv9sJWpjtyY+Kuqj7FY13tLgCj4UAfawOacihfxMhoLdBqeZe2yEvlosmf5lWCjLxTPoANKwKmNgnueKCEp/0/gcdAzmVkAWosgErN3/Ohz9vwApqLnta20vLIysZGXZ1AIc3ChEvcaoG9eGcr+qCNpFUPavvj7I6lAWt3xW19/t4Tksmm7+voeT08RjREVYmqGZHKgkadqHf3tPzZozYOttvvvpi6VEiB4RihqGpDe8lXICpk3gsNVwN68S35Vk42BvOwl9elrNHn9xaYa9CpXP+0eVXl3GtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zff3iv/67fbD+8A4hy+eXys4QeWun3JX+J7PtT32wT0=;
 b=ksKJoylK0AJzoFa0gbSX8CgbNoje0Ch7wUziqLCbB+7MSt11mQFvtjFQ2Gw8j5yQXNaVMHaanJ9Kf9JKIW4jbBrM2W6Js7Bw5o9Lx3nr8ONatfalMMCxodh1umCDDqbe5vFVk44F0RIAZ18/IW9PdTG2HUhp7qKcbCJfhfI6QCJx46zDlniGZOjbPOzjbJ4DMgZsMVCCTngqnVv/LorX9YogbPh7OqrkpN06BIxg37S6aSWWv4Z1KnexsyRChPl42gQ27psxYFQ9dQX8dg75ZP4aGPPhts3L7g5g48ZePUS4j0CrJK8PcT4EeBlPVKxLS0LjfgWeoZNyy+WAfTS3dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zff3iv/67fbD+8A4hy+eXys4QeWun3JX+J7PtT32wT0=;
 b=I76UWR/Gi5l/aKcJZ27cRPr50sSi0QRG9BtsRqzvbQBX+NJolwWcftRQKUjQVQKD/p2YdkeyRgXP2P4QtCvixZDM5R8iNYPt6jwbmBfyNMZYxWxHChTzwybUAiUCoEVlOO1557SfcUe9Rf1Ow4/Q/alxZNQXFoA+eSko+4sMOys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB7504.namprd12.prod.outlook.com (2603:10b6:8:110::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 18:24:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 18:24:45 +0000
Message-ID: <efc11b48-ccc1-4bdf-9585-a66edfa6307e@amd.com>
Date: Tue, 2 Jul 2024 20:24:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/ttm: Make ttm shrinkers NUMA aware
To: Alex Deucher <alexdeucher@gmail.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Cc: amd-gfx@lists.freedesktop.org, felix.kuehling@amd.com,
 alexander.deucher@amd.com
References: <20240702173048.2286044-1-rajneesh.bhardwaj@amd.com>
 <20240702173048.2286044-2-rajneesh.bhardwaj@amd.com>
 <CADnq5_MU-j1sBYn-7dzvEKF73VBc=bcYOYY0AcbPjrJnKB24Zg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_MU-j1sBYn-7dzvEKF73VBc=bcYOYY0AcbPjrJnKB24Zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0269.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: d61ce02b-3955-4d94-6ae8-08dc9ac43f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzc3QkZrUHgyQjRxNnNLdGRwMm1WWm9wekNPNThiaEFMTXFPWWt6T3hLZzBq?=
 =?utf-8?B?b3pxQzhBN25LOGFqRzFzYmJ5NHBkVGdXcG9iazRXTVpPOFYzVkRHMCtRbFpO?=
 =?utf-8?B?WWI0eFF5UGpnQzNvMHdlTFNhcWNtUkJkaVRZTjRwLzdaajNBSi9xM2JRN1lt?=
 =?utf-8?B?THpvMHY5UzhIeXIrVXkreDc0enFJSE1qcjZFRTBoc2xMWElpWVJDZWNkRUpH?=
 =?utf-8?B?ckZhUGg0aWdDZURGUFgxSHdDWHYxcWo3enJCQ3NlNlF2WTMwdmFnaEd3ZlJZ?=
 =?utf-8?B?MDJjanR2VEM1WVBwZ1hXRXRrcmFhcVliNEZJc2Y4TnN6WUprSGc4WVY3czRa?=
 =?utf-8?B?MWZhS3BKMUdFdDJqczNQRC81RG9lTWhHRVEvTHZDRm10eFk2TEdId1F3N053?=
 =?utf-8?B?NGpaQzY5R2FqS3ozZGl0OU5MR2VnaDRhOUU2L0JVZEVVZ2Y0cTA4NVU1NlE3?=
 =?utf-8?B?UnliWXBlRmxzM0VzR21oazlRbTlEQnlZSEQ2amhMWERkTXpOYzJnNTBEMCty?=
 =?utf-8?B?Mml3cGZ4bTEzSzllUVd0OWN4ZFE5R0Nwa08ySHgvdDRCMmlpd25ZbkJUYlMx?=
 =?utf-8?B?d1dPMFNWWkZ2TjY5M2pTMzNoQS9GNyttVlFsV2xxNHVmdWY3U3lMc3J6RHJz?=
 =?utf-8?B?Vlpnak5YNUZZZnJUZWtjbFNYanVDbkpBUHhURDViNVcwRG0ydW1VR3p4UjBS?=
 =?utf-8?B?M3FEN2NTUTc3VjRpWXh5S2x6MVRUUVBZNjJZQXAzbWJPSXQ0YTRvc29HS1dG?=
 =?utf-8?B?KzhSZ0F2aS9wWWlLRnJENy85UFh3aDUvSnZlc3JsVDhNdDN0UEttYUxiaTBz?=
 =?utf-8?B?NFUzclJpM09KYUczSjRWWkZZS2djY0M4SkhUZGJkdWZTR2ZhdWZHaHIzdGJ6?=
 =?utf-8?B?VmozenNnenBVMHpwKzQ5R0hKaVVVanhqeWEybnF2VUdXOTJHTTVyU2Nna3Zj?=
 =?utf-8?B?bDYxenFacFlqK1V1bmx5bjFidTBqU2RrV2FIM01RU01nL1VRVnRTWUF0QStj?=
 =?utf-8?B?dzRxc1ROZmgybTAzWVp5SEVZeCtnQW83LzZjdW0xcGpQbjVrczBtaHNiRVhB?=
 =?utf-8?B?c0U1YnljQVFVaTN1cmF6SmFoN1JONHR5WWNmT0NiU1BIZkp6anMwNjJYck5z?=
 =?utf-8?B?YWgzcFY2cFRVcHdaTWphVW5BbzJJc21paEpNL2Zwa3NNdENtNE1LdVZtdnNG?=
 =?utf-8?B?dzBaQlVtdFNSMW16bVlSTkZpM1ljMlBNVWp5U0V3QjNyalJheGFzQ0U0YkJx?=
 =?utf-8?B?NUVFbjBHeXV0cmtteGNZcW5FRUtRV2JyaWJFZU94Wjk4YzFmOUtuTXBINnVj?=
 =?utf-8?B?bCtvWE92ZmpEL2FGUVJ1VC9zTDhXWWxxSUJZbWxQMUVTdU50ZjJ5RHlPcEI1?=
 =?utf-8?B?TXl1STB6R2JQVEw1dVB2QnhwUUxpSWtPYVI2dWRoYlhXdXRjMi90Q0x2TU0z?=
 =?utf-8?B?UXFWQjN2SHc1Ym5FZXpqOUIxZjFJMnhBZmplTmhVUXdWbGpoVHg2S0s3MWU3?=
 =?utf-8?B?MlAvQ25FdnRnMjZkQUIwdHl6WnVnRVpLWU9wenExVjVWTTB3cXJLMy92NGdS?=
 =?utf-8?B?azkvMnlaNWVyOWFRTnovMGI0NDFLS2hvRFFtQ3FlVlppdEIrS2RJZnorck00?=
 =?utf-8?B?b0FiakdlblhKU2o2MTRlNE1heEFvMTV6WllXalEwR0l6ZFJ3SWtlOTFvMzR6?=
 =?utf-8?B?ZTZaQ2kvQnpmeGFTcGlYRUQzTmIwUks2RzFIMTdwQTBRSUl3U1NvVmx6RDFk?=
 =?utf-8?B?dGxwRG94aWxPa0tLeTFhOTZ4bTRjbHNlV0U2NWs1dVVnOVNaL1U3aEtNcEJO?=
 =?utf-8?B?SHRQbUxaOGdmbkNrYVV0QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW9TTks3cXQ3a01QNXZkaTA1MXgzOVZGc1dVNTRRL1hwQWlnV1NkV1hkWi9L?=
 =?utf-8?B?SWZGY1hFUnJ3NS9zdDkybXVmdmVUV1BtWmNnSWVsTUd5OVVHTjRuMnh1U2U2?=
 =?utf-8?B?L2lpM2NLZ29OaGFPVTNhZWVqMCtGVkEyaGdrR3NjeVFyR09rZEF3a0pUN3Zk?=
 =?utf-8?B?WkxQZkdzblFRVWR0WjNmL3FIYlhrVlJOQXQyMGwrT3F5cmhTU3dGeU5FWllY?=
 =?utf-8?B?UUpKOGl6ZVRUSGxkRmpZc1JvclJ2dFlLSVhwdm04eVo5Q0ZWVlA0MktaY3FC?=
 =?utf-8?B?Z3V3NWdNWjQycmw1THZpMVh5alpTalpBb082L2FlSk1IQ2FhdVNjT09WbHVO?=
 =?utf-8?B?YlZuZFgvVnl6UWJwMzBIbHgxMDEwdDJxQ2VUOGtiTzV3VWxsbEkzeUVxa2pQ?=
 =?utf-8?B?dGtSSnRkajVZaENqcHY3K2ZNak5KdnRvRHdkai9YejlTNysvVHZEWHlsUWRh?=
 =?utf-8?B?OUlRL0xjU1BsNXBjcExEbTVyeWI2cThwcVB6d2VBTFBkR1hiUHNaQkcvOEdi?=
 =?utf-8?B?dEJ3QWJFNTU5TnBpWUFpMVE0ZjF1a0VFdHY5SVJydHU4WU04QUFZZUR4Y01O?=
 =?utf-8?B?aUlrTkNPcjB6VlBWNUlidis2My8wbWgrQzc4YlVaOG50OWFxaWNUTUN2K2sx?=
 =?utf-8?B?bWwvbjU4WE9UK2J2WXFYRDN3ekNzaHVBM2p0L0NPeklxYkM0QWw2Y25lMTNV?=
 =?utf-8?B?V0FGK3k0VktEM1BOUW5GZlFFNUYrMlVpRFk2NTBYNWVEemp1U2xTVmkxQ2h1?=
 =?utf-8?B?Z0xxN0hvazVUSmFRcEJtS2JqZjhmQWtYaG9wOFEwR0thMXNLY0pYSVY1Rld5?=
 =?utf-8?B?cHVmZytkYzQ0YWVYVXhWeEdLSnVON1c4REc1b1FBcTJsWG1xenAvUVY3VVQ5?=
 =?utf-8?B?dmdpcXdiNUVnM0w2cll6Zm9CZXdpclV2TkFUaHNqck1DUEZ6MUdYWVdJdVNU?=
 =?utf-8?B?M1lVdXhkZ29Bb29PaHZyRUxKVUM0Vko3OGloRC9YL1l4aVd0OWtKWGRYcE91?=
 =?utf-8?B?b3IrNnN6S0I1SFFYYmVocTZzSEZtUEtlWDVwODEza01pMUdxMUY1Q1ZBMjBr?=
 =?utf-8?B?QkdVOHhMOVh0cGxlcmpjNmEwMGVRYkNydHBXWVllaGVvY3hOclI5c1pmZWNP?=
 =?utf-8?B?bEJPT05tK0c0Z2JHRUtFQ2lrU1lxakpPbXR6YisrWEVsRzIzTnVLdm0wU2hs?=
 =?utf-8?B?VmQzSkxNS2doS1Q2UDk4ZWh4YVRRT1B0dkhvUjhCdGNkTlNpeElBRCt6WGds?=
 =?utf-8?B?YjFPL0VQTmdreTAzd0dEUWJ1ekJibGpJYXhLYTZTV0ljK24vUHdKWEJTNHBq?=
 =?utf-8?B?MXRvbGQ0WHVUUzIyVWpXenZtMmZaTjVIekl3VWw1V3Zqekw0aVc3YU5XVGla?=
 =?utf-8?B?Wmo3MXVZQTR2M0h1ZU8ySmtkNzRSbnFsRXJ3Y0RsRm13czNvL2hxQVhzMXdU?=
 =?utf-8?B?SFZqTm5Cd2VxeXpOamdMRWZUS0xDQ3JEUkFuNFBwZlFYVnRJSUlZa296ck5k?=
 =?utf-8?B?VDVEa1NFcWMraG1TSG5UMExWczdaNGdaeVAyclBwTHFRNHhHZHlmYW5wTDNs?=
 =?utf-8?B?T29neVgzYWYxZVhVVW8zeVZORllINDByRmVwQUI2a2VSOUYxYVdpOXZBRnFm?=
 =?utf-8?B?REMyMjRzZVNlWEhlQndKZkkzTTNLbm1lMkllZENTVG1HbEk5WGExSlNoZVNJ?=
 =?utf-8?B?cVhHYUtISk5NZnV2YTQ5QVg1SHBoSkpVZmdpTWMwWGZqejQ0WFMwYWdva2JF?=
 =?utf-8?B?bWJsSXVvQ3ZlUUxKQTJUVUZ0cy8zVW9uWWxJdllVaUp5VWVLSkNaakpzSlUw?=
 =?utf-8?B?ZWZzc0J0V3NaOHVqdWhIWlh2MUhlemNOUGQ4UVplSDNuZE1pblg5N0FWTUc0?=
 =?utf-8?B?aG0rNkpLZU8zVERrS3lPN2hyMURlWXFmNktGNExTajh6NlV0bWJGem5Na21w?=
 =?utf-8?B?STB5WTN1OTYxaXV4WktkUDlxdzYzZzNtL1ovbFRCSU5PVndvazdpQjZlcGNE?=
 =?utf-8?B?cHBKeFFqQ2RTKzFiTi9FdFBHWkkxcEN0S25CRmNxKzJmS3pRUkVSQkJZSUg4?=
 =?utf-8?B?c1g5Y2xld1puVHRmeGRKQjNTcFlkOG53bHkzWGZwbWtNTUR3UytjRkh5SHhW?=
 =?utf-8?Q?hUFngOcDNEaHBghjZohZ6t2Sc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61ce02b-3955-4d94-6ae8-08dc9ac43f9d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 18:24:45.3899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cyzx8ODlHQxnv2AJrbrXIFR6TLwHHi83lIAqddxSooR3twBdg9uRsS2xL7naO8cG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7504
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



Am 02.07.24 um 20:20 schrieb Alex Deucher:
> + dri-devel
>
> On Tue, Jul 2, 2024 at 1:40 PM Rajneesh Bhardwaj
> <rajneesh.bhardwaj@amd.com> wrote:
>> Otherwise the nid is always passed as 0 during memory reclaim so
>> make TTM shrinkers NUMA aware.
>>
>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>> index cc27d5c7afe8..f93ac9089a60 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -812,7 +812,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>>                              &ttm_pool_debugfs_shrink_fops);
>>   #endif
>>
>> -       mm_shrinker = shrinker_alloc(0, "drm-ttm_pool");
>> +       mm_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool");

You also need to make ttm_pool_shrink() actually use the nid.

Just setting the flag won't really help us.

Regards,
Christian.

>>          if (!mm_shrinker)
>>                  return -ENOMEM;
>>
>> --
>> 2.34.1
>>

