Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0ADCB73BE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 22:51:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FA410E302;
	Thu, 11 Dec 2025 21:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w6My6m53";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DAF10E302
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 21:50:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yky597a7ZdUFUKGTyLgwdZTuByyzUxx70r2DjITdkd9C2JEv5NWrkiJJSeG/fzK98tPZoiqP1ALG/nVM0rqAED86CT89OZwTVSyCUYK2NV03iJ0tkWZXwLKjp/wzrxLoHN434nni0oWkUAN2Nv6i/JZ/g8AFkEZIlBbQXEplwKvPTDcDL4QHef0o80YABpqDjjfISwAW4OQ4it5sutPLgP2PeZErnYqy5gAHNtdBw7AZrO10dwU9pHjprcgaUhR3sx8Wqm9txxD6a/Tw2BoOe2XC6gyGYzfVDaJOzcHtGJPpgH8+6/BdYfuLA8k3kMcor0DyEHb7asEy8JR2/e58Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxrSTiSmtJeQYv1O1J4IT++M6sTI95KrCxlFsWQ2lnY=;
 b=VZ06Y0m2ClvEPpYX3UojgzI315YF7GIGt2pLBsp9JacsWIptRZHyfZ63/9Y0DSXmCXiNqWkDLGy+flxephZyyNVy7wbLI6Xvn1ZBwYa8b5EFIaKraHxHbRuKMS3Xg3s5F1/k1iweqVjkwQFGpqNKrObcdzyEny638ZA6XhaqwEUzu0b6XKFJwc7XJkGfynbEB28Hv4Sbt48lK7xjBgKUp4x7gu0AqqYns2ZhyuwaK50OSZVUpBWlLwSt7I4rUImi+wsZ1tnN9E2UjgHxRVFaXcrTcb8N9dfYojs677MYIr5ozQLhAQ5DNoG8o5a/Yt0sqq54H/hgNVBre8ZIcq1nnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxrSTiSmtJeQYv1O1J4IT++M6sTI95KrCxlFsWQ2lnY=;
 b=w6My6m536Iza//6NrlKUsLCGsHmh1s/LzgeeSk4uLDtGJxNnJL6wB9OI8Bg70HlR/bhGS96FIZ3I9WsHd+NjfXBDr5d6z5I3io87qPDYqWLoDGZgZ5xQNEB7lyai4ZKn8I1lCiGfIbB1MCZL93ShJa0NvNMLWNFUEtwvqGxY+MA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB6607.namprd12.prod.outlook.com (2603:10b6:8:d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 21:50:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 21:50:46 +0000
Message-ID: <36165050-73c0-4ed8-85d3-42a874ae125f@amd.com>
Date: Thu, 11 Dec 2025 15:50:42 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix potential NULL pointer dereference
 in context cleanup
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251211045647.1725300-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251211045647.1725300-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0132.namprd11.prod.outlook.com
 (2603:10b6:806:131::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a1c8ee-5281-4020-8712-08de38ff56d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1FkWFZidGFkc0cvNnpXTndZOElTaDhtZVJ6Unc1Y1ZUb3N0WllXR1YrVGlh?=
 =?utf-8?B?TnQzdFRGY3NQTStBN2lNdWEzRzJ5WUduMVQ5RmYvWUpUeWpZNExLVnFPRnBR?=
 =?utf-8?B?clgvS2FBREZSVVBJbEpJZHFDUHUrQVo4Vml1Y2FhbWl3ZDJzUjdMR0YzRnN4?=
 =?utf-8?B?Y0JHaTZPZjFuVmZ4UThZSUttUWJjbWdKcDlCak1VL0lOTVN3LyswZCtuejB3?=
 =?utf-8?B?SklQVVFJSG1CSGVGU3VteTU4V01Vem9QdmExUXk5TVlpdEZnSXFROGtCUCtz?=
 =?utf-8?B?K3ZPdm8rNWJDRGpIelQyT2pjdUYwWkZqdEpVOE43WWFaUXVwemJUckhvUGtB?=
 =?utf-8?B?SGVubnlCYVk0cjJNNXVlRElOSmtnUnZscmY2S05MRUpEd1l1QVZqZmY2alpk?=
 =?utf-8?B?cUFtRFVzYTdjamdQTW5XcUVkWXFuV1NnQzYwVXh1dzRsU0Q2YUdYWVRUU2lQ?=
 =?utf-8?B?bktlQmlsdGdIaU1ab0R4ZVFZUkxYenlXR3JwY1pBSHJGNyszLytEUUhhTjZI?=
 =?utf-8?B?TFpJOVkxdTRMQjdvK2FUS2dvOVE0S2tlckoyWVB1ckdERnlyd1NuQWo2Umsr?=
 =?utf-8?B?LzAzYTBvYXdadGlCZlAyTUNXWjVWb210dHIzc3JrcnFYWkZhcmY3Sm9aK3pM?=
 =?utf-8?B?M01QWnBZa2tRaHVBQzlOb1ErNk5sRmNBMkRaM2dhbkxrMG05VTdpZng1QVIz?=
 =?utf-8?B?QS9mdE5YQzdVOE9Dbng3aDJJdEd2cU56dW1haDl2VDlObWMvOTAzSTVhbzNn?=
 =?utf-8?B?NE1GVk9oSWRMUGNJOGQ0REhlMUwvbldZRmRtanBYT3lBUGZ4Y3lVbjlKMVRr?=
 =?utf-8?B?UjQvZDVqTmFlTXQ4OG9aWlBuUmI4bklaOGl5TjY3OEIzazNRZUpkczhWT1NL?=
 =?utf-8?B?S0ZPTjlMMVVNM01nOWp3S3ZvTndQSmFCaE90WTNFT1RybE1QZDIxZFkreXQ4?=
 =?utf-8?B?eHFtZFlDT1o4a1RHL1M5Yldab3dPaTdycnplQ3hncWwxSitDL2lBMVhBTUJs?=
 =?utf-8?B?WGY4akJNa2RsSmZhSXFTVnYrSWNpM3N6L0M5dkdkK1JnTWdDN0pEWFhQUGFa?=
 =?utf-8?B?YWhDcWtqQ09STXo4c2dnRlRUYk00TE5vNUF5eS9uTVM1dFFMSVJ6Mnoyd3Jv?=
 =?utf-8?B?MU8vNk8rOURRQUg0Q0VTeGV2TEI0T09FVVFaR282L2dhaWlDRDEzOER6a1pO?=
 =?utf-8?B?bjJzeW9YR2k2Sk9STDNtaU5DSXdqd005enNLTGRmZXZFbFNRWGEzYUtNUG9H?=
 =?utf-8?B?dFVJUDF5ME9iSy93aDZoS2hVREN1M3h3VVR0QytML0t2MzNGTXJpMDgwRVRV?=
 =?utf-8?B?OWc1U04wOEJkSFRMVDM1bE5KQ2FrK3ZOYzhZMERxckpROHNDMXVSdE5Xbllr?=
 =?utf-8?B?dVk2SkpycGRCOVpjS3VKSldCUTg0UlJwM1pVOExPWXRmMWNFbWpQREVyNktZ?=
 =?utf-8?B?WmpKSFZOYkFZWVVOTkVZaUhBdTh1Z1k1MXlJSXc2RnFkN1FmN0h2ZDUzQ3Mw?=
 =?utf-8?B?dytIT3Q5S1UzK0tCZkRpQ0szaDNIQkNrbmpLTGpmamFSRGNFaGlMYWltRW11?=
 =?utf-8?B?Q3VjU29JYXJYT1RQRG1jT3hxZml1cFQycmwzR3dSUUQwYWl2aFptR0FLejlq?=
 =?utf-8?B?cUJ6M0lOU005N2dZUDRuRmlSQndOSy9wMk1KY0xvbFlNT1IyKzE3Z1c2V3lN?=
 =?utf-8?B?Nnlsekk2VjNWcGpvY0h5YUtNby83ZWl6VDZ5MXZ5MGVmRFRtRkU5VGxUYVF5?=
 =?utf-8?B?Myt3Q2taUmVvTXZEL3BLKytibzFmenYrWmZ5MzNZY3VkQkxnZGxhU1I3NXNl?=
 =?utf-8?B?ZlMzQ2hISWxqZVZ2VEFIVkJ2ZEk2YjJUMDB2RU53em9nR2tRWkw1NmFSVUhH?=
 =?utf-8?B?K0hUamZSRElTTXpXMUFxa0ptT2x2WjdZaGt0bDhteC9ZcVBDa1BsY0V5ZmhF?=
 =?utf-8?Q?8RpP2ejybWErwpFhax9RIPp/lj7I4P+b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWxGNG00ZnVCS0g1MExiNk5GS05WLzZ5OGxydHBIdDVPL2grWE03WEFTQ3Fa?=
 =?utf-8?B?cHoyNUtTUUlPdGFwYnlubWxtbWgyLzhXeWNaNXZ2WDV3M0VLM2FUQVdXU09T?=
 =?utf-8?B?RUxaR1dVeW8wcmx4aFBDckl1U0wvcTN4T3YrOUNJQzV3d1E2anNDdFQwNEhs?=
 =?utf-8?B?ZUNSWFdRaUpCWmtKL0hXTml5emdzZHlSZlZjWVZwS1lyV1FpbHU1WkoyZlcv?=
 =?utf-8?B?NlJlNTBucUx5L1N4RDJOc1I1a3FhVmVmZ0M3VEJFd0UyOFVYdHFFMkhGcTIw?=
 =?utf-8?B?MkV1ekZRV3dUaWYwckc4SjcyZVY3UzhtRitRVUtnYitTTjViMk5Oa1BWMmVj?=
 =?utf-8?B?amFzM1ZZUDBLM2Z5aStMc3QrV2MwVnpEaTQwSU1lWU9XZk05K1VIN0VxMDNu?=
 =?utf-8?B?aDJya3VRcmRUdjUvREVmUlRyL1F4OC82NlFZSWVWeUZ5NXhYOXRYOXZHYmFH?=
 =?utf-8?B?RXo1Y1MrZDVpVWFuc1RrY1lUODdESllWZGZWQng0UWRtRmdaamlBMDhIb09K?=
 =?utf-8?B?WE5jZTJGS1h6Zld5OVZyMk1RdTJaNU5iaVdWQkhBcVVPK1haeHM3c2ZGclRz?=
 =?utf-8?B?clJNaXg5K25oOUtOa1l6WjVUeTE0SzhJOUVxSzgrdVNNRlpYYzVkL2VqTnJ5?=
 =?utf-8?B?SnA4dStwQzRzeW40WXpIaUpYYWR1ZEtvMUpzbXhEZE9rSVVZcm1hSlJDRHVF?=
 =?utf-8?B?RW14Z1JTR2xRRWFCMzJhZjNqdjlDNFZuZ3g5aXNtZTFSeVpMZGdnYXI4UGV3?=
 =?utf-8?B?ckZRVVJPNkVnZXVuaVV6OGt2eXdnNW15MU9EcUpWUDE4RWFrUDNJZkE3aXZs?=
 =?utf-8?B?bHRqczBMeWNHcldNNjNvcWx2YS9Mck84TnZoLzBybWwrYUZPZ1JjMTJNMmcw?=
 =?utf-8?B?ejRTeTNPTVcwNkZ2eE41UWRMaVJRYmhYenZjSzhybDBEbUlSVFhHQjh3T05S?=
 =?utf-8?B?QmJxOUNYZ2xIbENISnNjUEJBakY3RzdYWTlmSUNOOVhrdU5NYm15emdDOW1i?=
 =?utf-8?B?MEcyM0x0b3MyVUlXcVJsc2JhS0lNWmFNWER6b2FrWngwanF2YXQ5MVVSdXg4?=
 =?utf-8?B?enVOWmJ6elJSM2VtaG5hWWgwNjh6SU4xbzdrRU1mcGM0ZlI5aXRBbHhvWWsw?=
 =?utf-8?B?TTg4MnVvMWVPdDRiY3NvdTJLNkdNK2FuQjVuMVRLN2JXK1FYdXFJVTlGNVVx?=
 =?utf-8?B?OTI3R3QxaGFPcno0WjlqT3BiLzFkanBJVWliUCsrRWlsdmVSdmhOaHZoTllp?=
 =?utf-8?B?cytHVzNaRXE2elJuSkpGN2MrMW5Nb1lFdFZVOTFWcktCOE8zeEozTDZvOFl5?=
 =?utf-8?B?Nmh5YjN6Vm9LUW5FKy9MNVhVTnVlaVh2Z2IzbHo2NVBBWjBlMCt5ZTJwaHhR?=
 =?utf-8?B?VVk5dkFBOGp6a21nc1d4NXdocXlWWk1nTDhEcGE0QUhORHU2aUZnUXJrZnd0?=
 =?utf-8?B?eDNwMTlxN0NZNmVCdituOThHUHErb2lzTEdMaUN0OXhvUGg0UFJyM3RML2kx?=
 =?utf-8?B?N3YyNy9vK3llMjZCbzErOS9ZOXZZT1FqRmd2QjJzN3pXcS9xNzBiWlJKR2Yz?=
 =?utf-8?B?SWRkam8xb1A1UGU0cFhacnRod0E2VnlJK2w4RnlEUC9yTzNTcVJvNnVSMWtH?=
 =?utf-8?B?YzZzWUZLWS9hQmovdHlqQUp0N1k1WkdaMzFjZ09wVlE5YnZTUE5JL3g3QkN2?=
 =?utf-8?B?V3R0dndKZ01NNGV6eXk2OU5oS1ljM2orRUQ5RERRenBEbHhyNU1Nck1Gamhw?=
 =?utf-8?B?QTU3OU11ZERzd0NOcHFpa090bmMyQ0d0WkNFTGZCMDhJcE5zUlJ5SHlYT2pN?=
 =?utf-8?B?TWdUZ3BSRXArMXozRVQzL0ZsdS9KUkw1ZE0xT0ZCZ1h0VktpUjhNMm5ZcGlH?=
 =?utf-8?B?eXNZUVdPRHR6UXZyck1hemE2ckc2M3pyUXhvMktZWVo2R0xWTFlsOFdtTHhY?=
 =?utf-8?B?dVUyK0dTVmhNUTFlWURFTEdtRml0UUQ1VVd2dTNjNmpncEU2OEFVRVFKV21s?=
 =?utf-8?B?QzEyTzVUWnNOblV6R3lCY0ZraVNoSXV5VC9YU25mcDJyNWE0R3VYTFFOaDVZ?=
 =?utf-8?B?bnlsZWJHSzhCdVIwSHFIQzdjYWtoMGZXU1NYekQvaTVUdEd4eG15SmpZZkhW?=
 =?utf-8?Q?n+c/15nYibte9O5oegZI23c62?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a1c8ee-5281-4020-8712-08de38ff56d4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 21:50:45.9138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdJ6Uh0Jf6tazug6nON4hl4x8Jiv0QsJHz/b304rYqVbTT+Q8ruxU7KQ6e1m/F/ydNSUJh1YAFOx3FPeWqghbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6607
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

On 12/10/25 10:56 PM, Lizhi Hou wrote:
> aie_destroy_context() is invoked during error handling in
> aie2_create_context(). However, aie_destroy_context() assumes that the
> context's mailbox channel pointer is non-NULL. If mailbox channel
> creation fails, the pointer remains NULL and calling aie_destroy_context()
> can lead to a NULL pointer dereference.
> 
> In aie2_create_context(), replace aie_destroy_context() with a function
> which request firmware to remove the context created previously.
> 
> Fixes: be462c97b7df ("accel/amdxdna: Add hardware context")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_message.c | 52 +++++++++++++++-------------
>   1 file changed, 28 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 03b75757a6e6..980aef9dc51a 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -192,6 +192,19 @@ int aie2_query_firmware_version(struct amdxdna_dev_hdl *ndev,
>   	return 0;
>   }
>   
> +static int aie2_destroy_context_req(struct amdxdna_dev_hdl *ndev, u32 id)
> +{
> +	DECLARE_AIE2_MSG(destroy_ctx, MSG_OP_DESTROY_CONTEXT);
> +	struct amdxdna_dev *xdna = ndev->xdna;
> +	int ret;
> +
> +	req.context_id = id;
> +	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
> +	if (ret)
> +		XDNA_WARN(xdna, "Destroy context failed, ret %d", ret);
> +
> +	return ret;
> +}
>   int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx)
>   {
>   	DECLARE_AIE2_MSG(create_ctx, MSG_OP_CREATE_CONTEXT);
> @@ -214,13 +227,16 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>   		return ret;
>   
>   	hwctx->fw_ctx_id = resp.context_id;
> -	WARN_ONCE(hwctx->fw_ctx_id == -1, "Unexpected context id");
> +	if (hwctx->fw_ctx_id == -1) {
> +		WARN_ON_ONCE("Unexpected context id");
> +		return -EINVAL;
> +	}

Is the message super important?  I'd think just do this:

if (WARN_ON_ONCE(hwctx->fw_ctx_id == -1))
	return -EINVAL;>
>   	if (ndev->force_preempt_enabled) {
>   		ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_FORCE_PREEMPT, &hwctx->fw_ctx_id);
>   		if (ret) {
>   			XDNA_ERR(xdna, "failed to enable force preempt %d", ret);
> -			return ret;
> +			goto del_ctx_req;
>   		}
>   	}
>   
> @@ -237,51 +253,39 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>   
>   	ret = pci_irq_vector(to_pci_dev(xdna->ddev.dev), resp.msix_id);
>   	if (ret == -EINVAL) {
> -		XDNA_ERR(xdna, "not able to create channel");
> -		goto out_destroy_context;
> +		XDNA_ERR(xdna, "Alloc IRQ failed %d", ret);
> +		goto del_ctx_req;
>   	}
>   
>   	intr_reg = i2x.mb_head_ptr_reg + 4;
>   	hwctx->priv->mbox_chann = xdna_mailbox_create_channel(ndev->mbox, &x2i, &i2x,
>   							      intr_reg, ret);
>   	if (!hwctx->priv->mbox_chann) {
> -		XDNA_ERR(xdna, "not able to create channel");
> +		XDNA_ERR(xdna, "Not able to create channel");
>   		ret = -EINVAL;
> -		goto out_destroy_context;
> +		goto del_ctx_req;
>   	}
>   	ndev->hwctx_num++;
>   
> -	XDNA_DBG(xdna, "%s mailbox channel irq: %d, msix_id: %d",
> -		 hwctx->name, ret, resp.msix_id);
> -	XDNA_DBG(xdna, "%s created fw ctx %d pasid %d", hwctx->name,
> -		 hwctx->fw_ctx_id, hwctx->client->pasid);
> +	XDNA_DBG(xdna, "Mailbox channel irq: %d, msix_id: %d", ret, resp.msix_id);
> +	XDNA_DBG(xdna, "Created fw ctx %d pasid %d", hwctx->fw_ctx_id, hwctx->client->pasid);
>   
>   	return 0;
>   
> -out_destroy_context:
> -	aie2_destroy_context(ndev, hwctx);
> +del_ctx_req:
> +	aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
>   	return ret;
>   }
>   
>   int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx)
>   {
> -	DECLARE_AIE2_MSG(destroy_ctx, MSG_OP_DESTROY_CONTEXT);
>   	struct amdxdna_dev *xdna = ndev->xdna;
>   	int ret;
>   
> -	if (hwctx->fw_ctx_id == -1)
> -		return 0;
> -
>   	xdna_mailbox_stop_channel(hwctx->priv->mbox_chann);
> -
> -	req.context_id = hwctx->fw_ctx_id;
> -	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
> -	if (ret)
> -		XDNA_WARN(xdna, "%s destroy context failed, ret %d", hwctx->name, ret);
> -
> +	ret = aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
>   	xdna_mailbox_destroy_channel(hwctx->priv->mbox_chann);
> -	XDNA_DBG(xdna, "%s destroyed fw ctx %d", hwctx->name,
> -		 hwctx->fw_ctx_id);
> +	XDNA_DBG(xdna, "Destroyed fw ctx %d", hwctx->fw_ctx_id);
>   	hwctx->priv->mbox_chann = NULL;
>   	hwctx->fw_ctx_id = -1;
>   	ndev->hwctx_num--;

