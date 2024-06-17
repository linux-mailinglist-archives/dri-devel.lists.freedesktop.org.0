Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6074890AE59
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 14:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D1310E0ED;
	Mon, 17 Jun 2024 12:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dqj/bBmJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F146D10E0ED;
 Mon, 17 Jun 2024 12:56:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWL8rlSBEHJ32cvAjz56ftW6KSzbt3mC1f94W1gg7d1k98K9wasvyKk70fXkOGNiOryL3bqI149xpNzinxNWCpfv6S6IXm1zVVWy16ciwaF9YCtIxuCZc1Gl74/H1DSsky+OQ9friyBC3aV0cu5K6oQ6QemUS/0JqysoRjX09lrffNG2UhfeFa+bs8fneJAPVfFHhwBeWeTNmxmbNV/1HOpPEMV6u9h4PelUk+AwC8RqDw0C/u7moAMhHLoodnWAeqvhNOhCDFAGcJQoTFUy52WYjHJ2riuaYjMFX1TD8KRrqNsZoxCFRJBmPX+tGnOxkHliiDDi9nP9YWPtapKvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0nqDHyfznvWZPEbxveq3pQfe0tuW/PrDnQqOpj7NRw=;
 b=NYbQS2MeYXtp+CVo++ETv1qK53VeukGcOYN5WQ/1oaJ3o2cBMthC71ZabftbN9oO5+hUaYNxik5P+3bwMR/DNQV7JKsd7YdJa3+gOjZ7/sfvbBYQodSDuragUaAWtOqlyk//t6RUWPr+krmGBRgPL59hYKOEWBLIXhji8y1niFsM3WC4JAVGWHObwFixLtn1P4fOOfOBxfbpWXxrctPh0aEUojvWq7wrSJXIIeBn07tFeZIJsUZil9YJ1RG/N9SRVGBM0xk05Pv/XkDj9hnkoEplt2cv33kAugkJGERTfqsfg+5qJto7oIYaKJUOjblqDcD7G83z2Falhdu8U+AgMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0nqDHyfznvWZPEbxveq3pQfe0tuW/PrDnQqOpj7NRw=;
 b=dqj/bBmJxvTf1tywaDjE855Lk57xceD+AT1q0WsX+T3lmx3DceLX5763+7N/1MtJ1CqyLVcGAsktop+VEV2N4S/YW5g069MPGZT6LVHOE5Jv69O6RmPrJyxEqD5g6dJ3vBv24l2DTKDqU+9N5SDNKfSRfkrkbykVQgc8hUSIzy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5684.namprd12.prod.outlook.com (2603:10b6:303:1a1::21)
 by PH8PR12MB6745.namprd12.prod.outlook.com (2603:10b6:510:1c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 12:56:25 +0000
Received: from MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105]) by MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105%6]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 12:56:25 +0000
Message-ID: <67be6450-7ae3-4e71-8899-717a023c22dd@amd.com>
Date: Mon, 17 Jun 2024 14:56:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/ttm: Store the bo_kmap_type in struct iosys_map
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, ray.huang@amd.com, kraxel@redhat.com,
 airlied@redhat.com, suijingfeng@loongson.cn
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20240614133556.11378-1-tzimmermann@suse.de>
 <20240614133556.11378-3-tzimmermann@suse.de>
 <5e770114-2751-414f-af57-de8077f6a6a0@amd.com>
 <820be6c8-ce77-4262-bb45-2c18597a661d@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <820be6c8-ce77-4262-bb45-2c18597a661d@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To MW5PR12MB5684.namprd12.prod.outlook.com
 (2603:10b6:303:1a1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5684:EE_|PH8PR12MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3c6012-75c7-4eb9-25bb-08dc8ecce578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|7416011|376011|1800799021|921017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFVvVWcvRStKWDcwOWsxMGZZdlVBbjVleElrMmEzVGNsclFtM09TUGpQTTA4?=
 =?utf-8?B?SHl4dVdnRElwNUhNejVRNE5QUG1jMkgrME9FQ1ZJcTFsNG51VU1vRExvS2hT?=
 =?utf-8?B?V0xuNDNrUm9zYzFjWU55SDRTcU14N1pVRkNtREJ4a2RaNmwvaDhhdmE1alVx?=
 =?utf-8?B?YWVDL1pZcG9IaHFtZjV2b0lyaWxTRzhzSFE3dWczNGJsYmFOWXNtbDFGVlhO?=
 =?utf-8?B?R2NKSEliVFBiMThFRE9MRGpVV29VbVF3SFR5MHdXTk81QXhUWjlYWHZBMXVU?=
 =?utf-8?B?aUtDdjU1eWJzenBqNzFQSEJ4MFhabTYxZm5pZGRTNlVHNUF2S2dJTW5UR1ov?=
 =?utf-8?B?UmdGQmdFdXgzdzZ4cXZ2L1FsekRCVjVzL0hYd0pWbUNVUmRNcXhLUmJxM2lG?=
 =?utf-8?B?UXVnMEpjalNkaUtBUDlGMWg4Qnh2bXk1amM4VVY1MG1KV21QZU91VDhxaG1x?=
 =?utf-8?B?MmJXMVIrU0V2WXFHU3dpejU0SVZuUy83U21ySTQ2WGRHM3phVzhpb01wZTRW?=
 =?utf-8?B?V1d4MWJaMmlqNDhYeFRUNEdsUFF3ZnljVjd2Q0Z3enpiRW8vV0RkaHYweUZQ?=
 =?utf-8?B?V2p4bVcwTHQyYkd3NXIrbnVJNllZWXdieXJIa1NvalQzZDZZamZ1aURJc2tU?=
 =?utf-8?B?RzdjTEVoYVRJeVBnWnNPL2Y1UEsxQlR6TVM5RVFPYW91R25xcjJqbXZqaTNr?=
 =?utf-8?B?S2k5TVFBN0NXNlVaN2ZzYUpZdXowOWttK1lpV0JpTmlva0JIZnhXRWhJRGRi?=
 =?utf-8?B?YUZyUkJEM3ZhK0ZXTDIvRTIxV1pBWjdOYkJvbXl0YnMvVytkMWxoTDc0aGdo?=
 =?utf-8?B?eUNtR1loTk96V2lCaGVGdzYyMFpBUEtrQ3hrUHZBREhJVHFSRVBoN3VKY2Vh?=
 =?utf-8?B?aHd5TVByS2dQVS9SWlpKUVM0UFZNbWhTZFMwL1IvTlZmM2ZERVFLV3A4c1By?=
 =?utf-8?B?clk2cHpKN1RaU0hiSTljQzRTNTd1elN4U0tGWFgwMjJ5M2lwb1FlQ2pveW5O?=
 =?utf-8?B?TzJOaVFLR0lMNkdTQnNmTWxCeDl5K1pGa3REcldYSmZENjhSL3pBWWFia1hZ?=
 =?utf-8?B?aDR0cEpjQ2kvZ21jWjZyb05Va1c3U29zUU5uUSs1VjRNMHVOTllYY1VaazNZ?=
 =?utf-8?B?Vi94eUZGZ1ZEdUpLRjRlVUJXUjIzdElXb0p1YlA3dUFsakVXdVpQR3l0by9v?=
 =?utf-8?B?bktjSHdpSGU3S2lTdTdpWTdmL3RSREZ0WlJaanl1NWhQNllxNG54bEVSR01E?=
 =?utf-8?B?RktjZCsvU2haNTdvU3pBV0V4UVQxNHNTeFYzSEhvYlJIZzhOQ1VJSnFDMkJl?=
 =?utf-8?B?UDJGczk3M2FxdWM2VkNXODFONVM1bFBQZnY5RHYxZUxCM2VETGlqdGV4UTJK?=
 =?utf-8?B?UVAzL2t6aE10WHljQ0VBckh2REQ5SlVGYjM3eitVbnpEUlVjOEY1QnJ6YWpq?=
 =?utf-8?B?TW5SamxtdUhRWFdLY1dzYnNYTWtIVDUrMm53emhPWDFIY3psQjFVV2U5Zkln?=
 =?utf-8?B?Nmk2bWJXN0JKUEE1UVZJOThoSFZ4VnB3RHVFMlpXOStlb1cyM28wSmhSQXVs?=
 =?utf-8?B?TElaU0NLV2I4dGxiM1ZmRHZ4Vi8rWTZTNTBRS2gyeWZ6SHVBREJDZk9DRU5W?=
 =?utf-8?B?cTVGZ0U4RC8vdXg0bE5WVCtoekRoVVRnTVpSS3FXNjh6dm9waTEraUZWdHQ5?=
 =?utf-8?B?OVdOK0RROUl4bXZQeEowTSszL0liQjQxdkNNY1ZBanpydEJqc245U3l2ZUJG?=
 =?utf-8?B?TXAwK1pvUG5vaUJReWNjSkhnOTNvOXdqaFBLQmNjUEVQY28rQ2Z6dnZKRFJH?=
 =?utf-8?Q?lTFe1gSYzxUGGEbfGlS0gJDtjNFuB4B2wsWYY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR12MB5684.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(7416011)(376011)(1800799021)(921017); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3FwWitES1ZFQ0plNnBLa2xHUmZNdmZWRjJwUzMvTGRlY1VvcUNOQVQ2aUdL?=
 =?utf-8?B?RWptcVBxQ1UrcGNocVVzSnRaSVRHZ2xZeXUvSnJvTEhJVlRVOTR6RmhxeEJ1?=
 =?utf-8?B?cnhjQUVHSW9rS0x0RW05aHRMSXhQMmo5WlJWYWtpdm1abDZZQm12VFFRY0ps?=
 =?utf-8?B?MzVRdEZTLzNYeHZGSklyUVB6RkJUa3ZVb2ZxWHdmeG5rUVVWK3NMWlFzN3hW?=
 =?utf-8?B?a2VCMDVVVHZ2KzBWclRhT0V2WWJjcTF2aHh1TU1KcXhXVzBLNEJxNmpzLzBi?=
 =?utf-8?B?UUFtSWJpdStka2FLb01UT2t1b0VMQUJQTmt6T2lGREF2ZzFiTS9LbVU5TmRw?=
 =?utf-8?B?bThyUlgySmxaK3YyTGxWZStyclNlY0psOTQvQ2tENXQ2SHNPKzFCdnhoL25F?=
 =?utf-8?B?TWxjS0NsdkZXaUE3Wk5FdDJMYWF5a2R3T1N6WmZLK0hmdjdkbnZ1M0JPQW9k?=
 =?utf-8?B?YUxhSEhOSGRsUHl6QVBEMjNmL3pVd0Mrck9XUms5ejMzdloxaU4vdkpOQXZv?=
 =?utf-8?B?Smt1WGdjVWo0M2xPZXhGT1orMTBNNi9zZHZ6Si9pMm5VTjRxZkg2N1FUdVRp?=
 =?utf-8?B?bmJVYzQ1cEdxSEFRb1ZLYzV0dFgxYUtBQk1xWU1ZYkQ3NjhiN2NUZ01KSERJ?=
 =?utf-8?B?MEZBd3JzK2JyRkVXa2xmZlJ3dFQ4d0JiaXlBalpJdTZSa1hNLzJHWDAxaldJ?=
 =?utf-8?B?cmRpS0JrelFzRWdrZFhSQ1loM1ZZeTF2TTBydnNLdHptajhwTlBPV293NWJU?=
 =?utf-8?B?a1lMQnRXSE5TZndpWDNwTmkxRlhzeW5LeFBVN3VRYXpJNTVycE14b1NNRDRF?=
 =?utf-8?B?QnNXL1E5WHMzQ0FIU3libFZSZnM2dDd6ekU4UVNRQ0hsWm4wTHF6YjlSSDY5?=
 =?utf-8?B?Rngvck4xYUduV1JXSWI1bXVXbDBLa2EwV3JSckFlSTNqbVJpTWw4WjhMRWZv?=
 =?utf-8?B?RTBSZ0pQMVh6NTVaL0Rxb2kxRG1NSFZmdkxzblVLQVJ1VklQcGZRUExwK0dm?=
 =?utf-8?B?U284SlliWjlVOGp0eHYvaXJQaWMrQ2l4bkNCeVdWWXFGNW04UFcyL283dnVq?=
 =?utf-8?B?YnJteDB2MWdWYXJueVo3WnRSRWFSOXFhdExBbzA5OTZwTmE4TnFLMkRSTUlp?=
 =?utf-8?B?eElVamVIUEs5eU9sWmpxK0FuUDFYRjl2RExIZnMrYU1Kc25KR095VG1SSWdX?=
 =?utf-8?B?ZzhxTkxTWlBmK2RYbUk2OG40U0NrN3JUdTRVWlZPR2UzaThsZWIzNzY3OEgv?=
 =?utf-8?B?c3kxbUlFU2RHVlJoMkhHRzBkMUF3M1lPR3VsZnYybjBIdHlHSEQrVTRHc1k3?=
 =?utf-8?B?RWVjNEtGYktxbG93NGcxSTVyTXo0b0dqN3pCTXNjNDlDT25GQ0RBM1h5Rk9k?=
 =?utf-8?B?ZkduOU1Uc3ZpTWVEbmQxS3h6VHNwa3B4Qy9QRGJhUSs3bi82WENBcVJJY3Az?=
 =?utf-8?B?eko3T2ZzcWN1Z1J5VFM5Zkt6QWZUd1hsZTdZQ3VBTWtLeVVHdFZOS3NrM0Rt?=
 =?utf-8?B?dzFESXIvZWN3akQrcEhWeUxiNmQ1bGxpWFhWWHQ1V1JreVdXQXNaVzRCdSt0?=
 =?utf-8?B?L25MU3JNOWZ0bWMvaXlFN1BUL3lxb091T0drZE13R2Nkb1plWXRSWVNmbVB6?=
 =?utf-8?B?c01YTzVrYU9kelhDTzdHblZoelZpR2xXZGZ6bHI2VXVMZDdnMUo0M0lmNE1a?=
 =?utf-8?B?RG8yb0VSandaOU5LZ0R2Qnp3d0dRTDIvYjJUUmhvM2IzWjRia0ZQbEIxLzd1?=
 =?utf-8?B?NVRqZXdnVEVHYXBxejF1Rlk3RGd5bThnS3JIK1pxTjR6S2k0MFhOc1RVNjRu?=
 =?utf-8?B?M084TUZLS3NSR2pPN2VLbWhtTlBsN3JyWS9ta3JMVWVyRmJiODlOWTVqZFVZ?=
 =?utf-8?B?SlNpSnJKUytzUGxOT2d1OGJmKzNieC9NZWRHNWFyMEdWWEU5aU1zemxKN2FO?=
 =?utf-8?B?cEZUZy9zOStWMzNvaUlrTWdiOFhHMGJ4Z3BibjhzVkNMYlJJUDhSUzZBU2dH?=
 =?utf-8?B?WTBMbmw4dFh0Z1pCdHU4UUUrNTR2ak95bU5NUUxOMnhSTkZVcDNUUmhNRnBI?=
 =?utf-8?B?Vk0vN3lPVndqZjFDaUI4OTZPbDBEQ0VjeEZoV0dqSTBsMnh4ZHN1OHZ1dGM1?=
 =?utf-8?Q?KA4boR6qSquQgZ4zblJ2XQPV5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3c6012-75c7-4eb9-25bb-08dc8ecce578
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5684.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 12:56:25.5565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lufukJmjDxCjTeBGlPTiyigZy4tW0B5ufS8FoOg8q5mrAh/5Lhc3v1CJuCja7K75
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6745
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

Hi,

Am 17.06.24 um 14:32 schrieb Thomas Zimmermann:
> Hi
>
> Am 14.06.24 um 16:31 schrieb Christian König:
>> Am 14.06.24 um 15:21 schrieb Thomas Zimmermann:
>>> For each instances of struct iosys_map set up by ttm_bo_vmap(), store
>>> the type of allocation in the instance. Use this information to unmap
>>> the memory in ttm_bo_vunmap(). This change simplifies the unmap code
>>> and puts the complicated logic entirely into the map code.
>>
>> I'm not sure that's a good idea.
>>
>> The mapping information should already be available in the resource 
>> and storing it in the iosys_map structures duplicates that information.
>>
>> So we might run into the issue that the resource has changed and so 
>> we need a different approach now, but the iosys_map will say that we 
>> should unmap things for example.
>
> Patches 1 and 2 are only here to make patch 4 (add the kmap special 
> case) work. How can I distinguish between vmap'ed and kmap'ed memory? 
> It's not clear to me, whether there is a benefit from patch 4. The xe 
> driver makes it sound like that, but the rest of the kernel appears to 
> disagree.

Yeah, exactly that's the point.

The last time we talked about that we came to the conclusion that the 
kmap approach of mapping only a single page or range of pages isn't that 
useful in general.

The only use case where you actually need this is the 
ttm_bo_vm_access_kmap() helper and that is static and internal to TTM.

So what exactly is the use case xe tries to handle here?

Regards,
Christian.

>
> Best regards
> Thomas
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 46 
>>> +++++++++++++++++++++----------
>>>   1 file changed, 31 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> index 0b3f4267130c4..a9df0deff2deb 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> @@ -36,6 +36,7 @@
>>>   #include <drm/ttm/ttm_tt.h>
>>>     #include <drm/drm_cache.h>
>>> +#include <drm/drm_device.h>
>>>     struct ttm_transfer_obj {
>>>       struct ttm_buffer_object base;
>>> @@ -479,24 +480,29 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, 
>>> struct iosys_map *map)
>>>         if (mem->bus.is_iomem) {
>>>           void __iomem *vaddr_iomem;
>>> +        u16 alloc_flags;
>>>   -        if (mem->bus.addr)
>>> +        if (mem->bus.addr) {
>>>               vaddr_iomem = (void __iomem *)mem->bus.addr;
>>> -        else if (mem->bus.caching == ttm_write_combined)
>>> -            vaddr_iomem = ioremap_wc(mem->bus.offset,
>>> -                         bo->base.size);
>>> +            alloc_flags = ttm_bo_map_premapped;
>>> +        } else if (mem->bus.caching == ttm_write_combined) {
>>> +            vaddr_iomem = ioremap_wc(mem->bus.offset, bo->base.size);
>>> +            alloc_flags = ttm_bo_map_iomap;
>>>   #ifdef CONFIG_X86
>>> -        else if (mem->bus.caching == ttm_cached)
>>> -            vaddr_iomem = ioremap_cache(mem->bus.offset,
>>> -                          bo->base.size);
>>> +        } else if (mem->bus.caching == ttm_cached) {
>>> +            vaddr_iomem = ioremap_cache(mem->bus.offset, 
>>> bo->base.size);
>>> +            alloc_flags = ttm_bo_map_iomap;
>>>   #endif
>>> -        else
>>> +        } else {
>>>               vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
>>> +            alloc_flags = ttm_bo_map_iomap;
>>> +        }
>>>             if (!vaddr_iomem)
>>>               return -ENOMEM;
>>>             iosys_map_set_vaddr_iomem(map, vaddr_iomem);
>>> +        map->alloc_flags = alloc_flags;
>>>         } else {
>>>           struct ttm_operation_ctx ctx = {
>>> @@ -506,6 +512,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, 
>>> struct iosys_map *map)
>>>           struct ttm_tt *ttm = bo->ttm;
>>>           pgprot_t prot;
>>>           void *vaddr;
>>> +        u16 alloc_flags;
>>>             ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
>>>           if (ret)
>>> @@ -519,8 +526,10 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, 
>>> struct iosys_map *map)
>>>           vaddr = vmap(ttm->pages, ttm->num_pages, 0, prot);
>>>           if (!vaddr)
>>>               return -ENOMEM;
>>> +        alloc_flags = ttm_bo_map_vmap;
>>>             iosys_map_set_vaddr(map, vaddr);
>>> +        map->alloc_flags = alloc_flags;
>>>       }
>>>         return 0;
>>> @@ -537,20 +546,27 @@ EXPORT_SYMBOL(ttm_bo_vmap);
>>>    */
>>>   void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map 
>>> *map)
>>>   {
>>> -    struct ttm_resource *mem = bo->resource;
>>> -
>>>       dma_resv_assert_held(bo->base.resv);
>>>         if (iosys_map_is_null(map))
>>>           return;
>>>   -    if (!map->is_iomem)
>>> -        vunmap(map->vaddr);
>>> -    else if (!mem->bus.addr)
>>> +    switch (map->alloc_flags) {
>>> +    case ttm_bo_map_iomap:
>>>           iounmap(map->vaddr_iomem);
>>> -    iosys_map_clear(map);
>>> -
>>> +        break;
>>> +    case ttm_bo_map_vmap:
>>> +        vunmap(map->vaddr);
>>> +        break;
>>> +    case ttm_bo_map_premapped:
>>> +        break;
>>> +    default:
>>> +        drm_err(bo->base.dev, "Unsupported alloc_flags 0x%x\n", 
>>> map->alloc_flags);
>>> +        return;
>>> +    }
>>>       ttm_mem_io_free(bo->bdev, bo->resource);
>>> +
>>> +    iosys_map_clear(map);
>>>   }
>>>   EXPORT_SYMBOL(ttm_bo_vunmap);
>>
>

