Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E098AB3841
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 15:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C267B10E36E;
	Mon, 12 May 2025 13:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KAVOta36";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E821C10E36E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 13:16:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bgxov8xcIuyb1gMVaMtHyf/JiVmn8llD1C8q/wbOm9bV0nejjJIb3lLeqgtOn13CTwfhLZ8yornsV4ZP4D8zyeiiw92B3YdJyZ49WnPZpiOhj+PrWkz3tfMuj8kMkJzjzrOYW4WpyhOrea+QxZVr4SkQbB2anA1iWWK636Sm+W9tlICNXTX+VDGnchMD2BTsBshM75oxPfKAr4R6NB4cpz0FG0WrWuhhXgvwDEzVRVn/dqztDpQnH1tZhz2n3whjWga9TwWDxTzoBb0v2wtex+8p4XVegjVL0EO/uq3Pv4vE2U6YLRaF5RakAQ/vhFuiEq0CDDEnVO5plD4veGgA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjfQ4YlhJatjhNTaokWCDXKWITZR67EKcuaAH1bn8X4=;
 b=gtQVMFzkc7ORzIN0ZXj4Crv3DsBHNzt/pS7Qi3BdawqNDHJVrH+2CAWwZkLlJvWJ0SYcNOC+lxi1XM10Mgl+EjFpTbVxOXPivzUsGQniR3fU89ILo7GSOUv0k92jTL+bs5IsPkjgToNY5hlllqzcXI/GZAn99UQxVhRFb0OlKaRftM2kk4Qin/TYCpfv2upEPjeFfoeale9a7SPOK3pHW59uf6JOpxtShJ1JmTwHsZTQAHapkfCO3STbohE9NVbZMN6s4CqvbEs7dbQWqFvJJNMn5x8DfVPhnLEkJH2Ds2YiFJ+dChzuB82ZVOBS5ofbeGQUdVCkU8YhHgxht/cJHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjfQ4YlhJatjhNTaokWCDXKWITZR67EKcuaAH1bn8X4=;
 b=KAVOta36CF8QcZBWyZSusdQmpvFAAgfkltzAGHVG5Mj64MIiOrshO6heyroH8xOeVyWwyhz5w0YJLti4OQSUsBgJh5JFhVKQOdJnVIiHOT1/uIlMmnYuTzD24NQ3qpiETK7ojfuqIyi9we+7OhVKwViExhPuEpTO5dqKcJpIwyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB7669.namprd12.prod.outlook.com (2603:10b6:8:106::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 13:16:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 13:16:39 +0000
Message-ID: <86ddb4dd-6327-4a4b-8584-df366737d636@amd.com>
Date: Mon, 12 May 2025 15:16:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: insert memory barrier before updating num_fences
To: Hyejeong Choi <hjeong.choi@samsung.com>, sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <CGME20250512111240epcas2p321f5121e34f63383e1724de05e55420d@epcas2p3.samsung.com>
 <20250512111231.GA1265534@au1-maretx-p37.eng.sarc.samsung.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250512111231.GA1265534@au1-maretx-p37.eng.sarc.samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL6PEPF0001640C.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b3f4f8-03ca-4f94-5bc1-08dd91573aa4
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDdwMkVLZjNEVUNKOVNiYnRLVWJ2S2ZqMXkraVdHay9XUy9WZ2oydW50K1ow?=
 =?utf-8?B?MVlONTVUbFJ6NUNQeFNoMTRNTFJ3YkRYTE5kK1pWbjJvUkFybmZEb24wbTZV?=
 =?utf-8?B?Q0FTODlaWUU5WUcweE8vQUlGU2hoK3lnOGhvUnNjQzdvdXFrNWpMbFFZOFFG?=
 =?utf-8?B?VlgyVm1yQ3FqQmIyQ1lSZDUvTmhPc1Z1eVZKL00vZmtiS2cyYXpncEMyUjhj?=
 =?utf-8?B?WUZEcUg0N0JhWjFhQjhOWUNCVTh4d3B0RHN1T2FRTVNqdFg3RnlaUGljUzlX?=
 =?utf-8?B?bE5laEVIOFZEWWI2bWtVREtpVTJtd0dxM0phM3JZaXczUklYZXFuczZ2SVRK?=
 =?utf-8?B?M29SRHhsVWlCaWFUWjU2M0tsMDIrTktGT0JBRm5pOHArNi9HcHhHcytJaTRR?=
 =?utf-8?B?aXNGaituRGxqTDA0cGdZYkpJb2xscDBHZG92dzdFTFlLemx5TVVNVGpocldC?=
 =?utf-8?B?OTBuMWRxZWdnNGlOVDdHTjZZU1VnZ0FwQkFLc2xlMXZHQ3loTzg0VSthL1dH?=
 =?utf-8?B?OFpZNmEyN0RJTCttU2FvcFhDVHlaazM1M200eDQ3YVhJOURxTmFnQUF6a0Jx?=
 =?utf-8?B?c0dOVU9PMmw4QXhZL1RrcHg1NFZVaCtBWCtxQkdxdk5VTXJSSU1CSThNRk1x?=
 =?utf-8?B?bnBvZ01FMHZnUnBleUdGTUc5SWYzb3U2WXhIMldORkpmWGVnV1BxbDk1T3R2?=
 =?utf-8?B?QkkyV2Zhc2R5MFNkS1JKakhObWQ5UXJ2cmV6V2NkU0dZMlRTbG9sOTBrSFJj?=
 =?utf-8?B?RXhISStuaUJMeVA0cG9PcmVVVitzWGo4UHpiVS95T1RFRHJQakZsTmVnbXJH?=
 =?utf-8?B?K3g4MFBESDdsT3dYWmpMbERiM3dmL1VNS1kvZDc1YUNKRlM0VW15UDQ4ak8y?=
 =?utf-8?B?L05jc1pKUTlDdlFJRkdkTWduWUR6L012Y0t6cjdINUxRYkxUWXBOdlNQaEJs?=
 =?utf-8?B?Mld2Wm9KWkptaGVSMHdkcENIMEpxOS9uWkw3S2JKazV2elYwT2VBTzlTck9h?=
 =?utf-8?B?ZEw1TFIvNFZUMjFMVFdicnZ6MytMKzJnS0s3TE9pS0pqVmY2bUhRMW5PWGov?=
 =?utf-8?B?TWdXakZDb0RCSUo0N20wR1lzMmZUc0t6RklXMXpyQTFhYmhIN2l4UDM1eHpl?=
 =?utf-8?B?RU1HMXNiMzFFUVdMay9nRlN5Q2d1SmkwWHBITXA5eEdIYjB3dGM5aDF4UUEr?=
 =?utf-8?B?UGNvYjRwaTNTb0tSTE9yeUpyclI2aGhIMjZTYy9lbkZvUmtsaTloMFFkN0NT?=
 =?utf-8?B?YVQxQm9uTnJ5WG9PQTYzSGxPdFR6amVNalNYQWxQKzFXaUlkQ3l0VGdXc0d6?=
 =?utf-8?B?LzJiYVRrLzFrcm9wQU9yY0E3OTdQV3FzRndFYmZyaVUvb3E0dU15S0ZUbUUx?=
 =?utf-8?B?endkdXB3VWZRTktveG0vNll3MnBKYmFKRFNaTW5qeXBrVVd4RVBraW1EejNI?=
 =?utf-8?B?OS9WbGl3QTNSZitBRnRFS1h2aXNSVHBXS3NvTmZLQ2Q1UjFGckdmcnZjTTRl?=
 =?utf-8?B?Y2J4VWczc2NYTWdoMFI2eXR4YTlnUkY1bDVuUUhzMnpWUUxxdjN0TktrbXZK?=
 =?utf-8?B?QjhKRWJuTnVjWmtackdvV0QyYkJhQ3JBanAwRkVrV0U2aTlnK0V3TlVPSEFC?=
 =?utf-8?B?MnU1QTAyYStOaDlGNEVGc0pNK2pXaDM3S0doNllrNWpIOTROZ1kxRHpEaGNt?=
 =?utf-8?B?Tm45UU5QVlNyMlM2cWwzYVJmbTdvYkNJTHpmZjgzejB5aUprVkRxODR1bHFJ?=
 =?utf-8?B?Y2NramNRSlo1WlNXdTg1U1dTdGN3RHdkdXZSWDZmQWZCaE5HdUxDcnZKeXcw?=
 =?utf-8?B?Qkh1c2YzQ2FCMGx3Qk9idG1mYkxDWFVYTFEzV0tRVVVnQWVad1BBQUQzZTBp?=
 =?utf-8?B?RXVQc1hHa2Flb0NWUnlkcGM2bWdzVGMxd2lQWW5XWS9zOWNFcXhXVTV4SkdE?=
 =?utf-8?Q?INjn+JMnW98=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clVWdzI0amZ2OXlSZHpTN2UzWWNSREMwV0VDcWZXMEVPUmErcjdBN1dtOWFj?=
 =?utf-8?B?a2Z6eGY4U2w4YlQ4LzR5VWZlYTNxOGl4QndvWkJzdUdtSW92YUltd3lHNGtW?=
 =?utf-8?B?N09lNUxKTDUvWVl6eU9QWXo0NTRpbXkrVVhiK0kxU1NTdGpyY0Rkc2dSWjk2?=
 =?utf-8?B?UkxralQrN1hOZlloMmdrUVRhWGFNZEJHT3FWeEl1OTUxVXJnaGQ3Slc2blRY?=
 =?utf-8?B?V3FRRVVGaTdFNSt2eER6Zkt1cHYyTzdmc3psaEdnS2taYndrQUQxMVhrQ3d1?=
 =?utf-8?B?d3NwOURCM3lZOCtKUDhSdnlHTFdDNnJvUE5IcUNJLy82bmc1UUc5bFBzekJ4?=
 =?utf-8?B?dXBVNktaRHp5bnVSdDRySFk2Rk13MUV2bHQwMEVKQ0VIOGx3MWFFSTBqaVBB?=
 =?utf-8?B?QjI4OUJMSkY1cE1xWC9SOFQ4RG8zVERTY0JwRGxtcWo5SXkzR0F6NnZEV21V?=
 =?utf-8?B?UlR3N01WckdyODQ4WDdDYWxHWTVUcDNhaCt2L3lNOXE4TWdGdFJYZEM1b2hH?=
 =?utf-8?B?NithNGVLNk5pbWFmOCtSOHhUVEd2TEkvWURJd3BwZ0c3QUhCa3pneGh6S2p4?=
 =?utf-8?B?UTVUVmN2MW1Kd1hxeE5Dd3BGTXNTQU50WWN5RWlwVmVoZFNiY2dnZDlFNWxG?=
 =?utf-8?B?TVhxMSthYndjdE5tdmhldktsNFZNQVNGalQzcisxUEl3ZnAwcXVvZlg5SUpT?=
 =?utf-8?B?RjVwZG1IK2hMemJTU0cyRDVUeFYwOEJYSHROeUdLU2o3ZzNjNkVpUXJvWkZO?=
 =?utf-8?B?RVRPZk4wZytFemVzUmNkcms1Qk83UVdkOWlXdDdQZVFjbTVaKzNqZGU4VU5h?=
 =?utf-8?B?cTF3cjhLSFFSOHZoRVhQNndYUU8xdXQ4N3kvQ2hrN2o1azloWjRFNm5QVzht?=
 =?utf-8?B?SWtObkozaC94cGZMaFA0YkQ4N2dYczVwVkNWTXVGRzR2NnFOK1lpU1ZBRTNS?=
 =?utf-8?B?bG93cEZpTVRRSlRzalBZSXN2YVdJVzVhK3YyVVlUbFJsbkZ4OVg2S1RabWow?=
 =?utf-8?B?c3d0WGRWY3kralNTV09RY1Q4ajc4U0pLSVBkV3UvOXFLajFEdlFmVUk5WXhU?=
 =?utf-8?B?V2RUWEh4K0RSek1BdXlGb0dIamd2VjRmUm4zckZRYzF6ZmwxV3ZWeDE5ME4y?=
 =?utf-8?B?WjF4YWkwbStqUEJodUdJNktKdThBQnErb0g2Q3Jqd2pmZkQ1Qk1UL3JWT3FX?=
 =?utf-8?B?SkZ5WGZSeVhMRDMybnlzNlk3VUlZY0hYa2MwODQ0Wk1jOGpQMkNWQ29RSlZ4?=
 =?utf-8?B?K0RhM1pSOU5jYXpYMWI5ckM3S2JULy9nVFA4OHphVkdIRVpHQWU3S0tJL0pV?=
 =?utf-8?B?SEdxYnZCTVRVQW1KL3FMb3VFU3R3ckRvUXZ5aHBWNUVCVUt2T2szMnBUdk5K?=
 =?utf-8?B?NDJTMEpKWENBc0VHUDZXUFhVZDRRamZFakFKcFFaR25xZkMrZWVQRjJjUTF0?=
 =?utf-8?B?ckhwd1lOUSsxMTBEM3FETkJSc0o4SFhlZjN3VG9raEhYL2Q4Ny82YlR2TkZK?=
 =?utf-8?B?VFY0dkJkUVhQOUcvNUVQdStyWFhnaEM4ZWcrUGxpNGZPdFU0WE1LUGxTd1A0?=
 =?utf-8?B?KzNFbm82aXQyWGRMUzdwMUhxa2p2Q1FSVHB5V3hyeHBRaldRZC9RRW9zUWhM?=
 =?utf-8?B?RmRWOTZpbmozbnp2ZUhOVXltdWtmK3h1V3dVdmNJOC9YOWJvNjF6MWFlSzFN?=
 =?utf-8?B?NVZ2eHN5a2dxZWVrNi90Y0YxamR0R01WTG15ZDZvKzFKVW5HeVJiQ2FVc0pU?=
 =?utf-8?B?TiswZEhrelN6c0phUlhxQTAwWlN2YkU2Y0J4alBta1piakZrTk9LRkhaYlcz?=
 =?utf-8?B?T3Jxa1R4bjJCOFErMmpsNUxkbnhhY0xGT1JsNVZFSm5QeklhSGtYMXRZckpD?=
 =?utf-8?B?L3FRSm9tVVliNlp5czg1YUxFdUIzTzFUamNOeXNSbTl6TVVKcFlUeUV2MVEw?=
 =?utf-8?B?cmN0ODk0dXREbWNMVEJEaFY5eFNPMXFoMWdFNmZ0YWpSZit4YmlJQWhCVGVj?=
 =?utf-8?B?cFBKK0xrMllpYkZzWExTaXRIaERzWTNDa3NsRUFYY3lYUzQ3VkhKbHd4eGlt?=
 =?utf-8?B?emt3d1h0Z2pua3hCalZwVExxa3JBWWFXSWo1RVNXd09LTVR2b2FPN1Z1NnRr?=
 =?utf-8?Q?0/ZKeNsfXKgvvZ/ahN/KIT0di?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b3f4f8-03ca-4f94-5bc1-08dd91573aa4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 13:16:39.1605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OybMah6ZhNU/RJlQIxrXezuIXiX3PQ90IIoQEIxS1paEOa8rEfj6lMa8TRrexXYu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7669
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

On 5/12/25 13:12, Hyejeong Choi wrote:
> smp_store_mb() inserts memory barrier after storing operation.
> It is different with what the comment is originally aiming so Null
> pointer dereference can be happened if memory update is reordered.
> 
> Signed-off-by: Hyejeong Choi <hjeong.choi@samsung.com>
> ---
>  drivers/dma-buf/dma-resv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 5f8d010516f0..52af5c7430da 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -320,8 +320,9 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
>  	count++;
>  
>  	dma_resv_list_set(fobj, i, fence, usage);
> -	/* pointer update must be visible before we extend the num_fences */
> -	smp_store_mb(fobj->num_fences, count);
> +	/* fence update must be visible before we extend the num_fences */
> +	smp_wmb();
> +	WRITE_ONCE(fobj->num_fences, count);

The WRITE_ONCE isn't necessary since smp_wmb() implies a compiler barrier, but apart from that really good catch.

Can you modify the patch and re-send? I will be pushing it to -fixes ASAP.

Regards,
Christian.

>  }
>  EXPORT_SYMBOL(dma_resv_add_fence);
>  
> 
> 

