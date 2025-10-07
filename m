Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6B0BC19FF
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 16:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD0810E6A7;
	Tue,  7 Oct 2025 14:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="efK1FN3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011031.outbound.protection.outlook.com [52.101.62.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED6B10E69B;
 Tue,  7 Oct 2025 14:03:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sk8zwe5lgt7CvBaHuVXOYyhfXWKp8KI6CQ7BCKEwNmaP18dGdGw0lsUpKCZlD5SVEZyBVTXg62Zy/3k9NZSbdZfv2JyX0lZ3TQ6LOKRJQY0JLMwGhHgmi5yLYKmxa/6bEjMbTfmG4ZL5g1/KuHFUvYnCCpc5Xo4Eklu/g1v9yoqQm0agBMCwS5YTuvpp398l3KvmyxoUQwxPFWG8ReWB1NtoA8vgbZZ+CFeQwBXgVjOtyzKiR5jP5UrjW/VPjolMvyZp9F6rvOoIP9yI0ukohKHVlJJTdUTJVi8pFeFGnTyedlgT8l9NDZkrcKPCcnykDZ3mRLoFaJVEK/hv1l2kMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBgEdnO+yG+fBmzylyo5ox+BvVjX2G878yIobTxOie8=;
 b=RECFWzA5MJM/SZ3as9gfc1F2UPEJ8uqH74N9mvEYsLbINo6C7TSeM7ib0b6foueaiuloP/3lBwdRC0GRaCiP4x8SO1fEmsyH7Sy2cgzz1pN7E7CPNgaqLZak3b57MN1uz0/xRxptFx3HnCwc7AmfAXsiOQqb9UoZE/g9kSFW7JHiOeK3Sju2zb7vRyBFers6+TxlWocb49CE7kSkhl8FyoumnXPRNvio1b3s+AuyYlufzVGfhuCYvR0D+MhWbfEU/QABDpZpnn00e7lpiJBIv6nDQb2l54dIJlgNgE/gFG5o6FbRh1zpYAwZanTauFyK41o/ekousWICaN/SkR+U/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBgEdnO+yG+fBmzylyo5ox+BvVjX2G878yIobTxOie8=;
 b=efK1FN3oZ3IFdoDX7kDVV/oo1OoFqAqndKaXi+BqgR+DyeID2GO/WwI2CrJiajDidwhqKpo/eVSzhHQ6jDO28Qb4bmpoY+fyvZoyQ4iwXzvl6AdvWLXVZ3GkMSQwG2+8o+3BoO2acOmyncQT5fW+8NSPdJmvK91dc9QFgKZk4bM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB5773.namprd12.prod.outlook.com (2603:10b6:408:17b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 14:03:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 14:03:06 +0000
Message-ID: <07ed348b-e8a7-4831-88d2-b53fcd07d5c5@amd.com>
Date: Tue, 7 Oct 2025 16:03:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 1/5] drm/ttm: Add getter for some pool properties
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20251003135836.41116-1-tvrtko.ursulin@igalia.com>
 <20251003135836.41116-2-tvrtko.ursulin@igalia.com>
 <b9a866ea-0f67-4e34-bb30-f8e297ee26f2@amd.com>
 <c3cb4df5-d6db-4cff-ba4c-c51f6503181c@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c3cb4df5-d6db-4cff-ba4c-c51f6503181c@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB5773:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b268220-3469-42e9-bf00-08de05aa3d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnhYQWlFU0ZEZUdGNi92NnhiZ2lGSGgzZkhnclBRcHFIcDVYM0ZwUFJsUzVp?=
 =?utf-8?B?NnFlTnpLTjRJNXAycHRsV2QwcTk3ZWZRR0YvM1VMYnZJMTlkUkRmWG1PYUFS?=
 =?utf-8?B?aVl1UFYzZ2EzbEU1dm13SW5CWmxsZEJxbGJ2cWZ6NG1sYlFsUmhyejZNRC9B?=
 =?utf-8?B?WUt4ckp2eUdsUE9BKzVrMzkvdnVUWVdoR0UvRHErUmJDd244UVArditTaDZW?=
 =?utf-8?B?T1V1WmJibjlLcHBaTmovb1EzOW1oZk4zcjFRWHJHdXQ4Qk01c2pvTDg4eUdZ?=
 =?utf-8?B?RnZkYTlaNVRIZlhNVGROektXWnVQR2RnbDJNUHR0dCtEOHBUZFdwanN3cXlS?=
 =?utf-8?B?RFArVVFRemthVm5LZmRQbUlPQm8xcFlhZTdBQTlIbEo1UXNQMzdvdHI5ZmZN?=
 =?utf-8?B?V2N6c2tYQWJGSGtIYnA0Y3VTRkNMeVpJUi9HaWFCTElEbWdkaDNYQ0Zoc2Fz?=
 =?utf-8?B?ZzdoY1dDSmRCaHNIMkM4Q3kwSktZRWR3Rmxvb0wvVzkvOHRzTmNHaHRTa3FF?=
 =?utf-8?B?R1h1YlZkdWVHb1hNeFg4YVF6TnFmQWVPcEpOS0pzd3Y5Tm1EWjlURk01V3Mz?=
 =?utf-8?B?cVJoVVpkNlh5QVhkUDYxM2Y5VGdtZjd3VTlIbmhGWjVMdS9LTHRKOU1ORVlG?=
 =?utf-8?B?SXFmQ0gxaG5weDVBdnNNVTFVK1lyL0FxQlVZRVpXUWZEWGxyVW9GZ0NtRzF2?=
 =?utf-8?B?T0dlZnkrSW9pREZIK1kxbG44aElFUGtzY0kvZ3FQOE8zeGx0NG9wNmQ3YjFT?=
 =?utf-8?B?Y3UxUE1VRVUzdGU4S1BnQTBHVnhQT09OcjVBZEVLMnd0UHN3OFJ1aHo0ZVY3?=
 =?utf-8?B?Q01jSDVFMHpkZTRwcm5kSDUreGJpUUFPS3JwSWRrekFLOEZpN1lJRDlMZDVz?=
 =?utf-8?B?WHhudlAyU0trOU5RZHFzNExIMDcxUFlIaFB2RkZiVEM4bERZVFVFU1FYanZn?=
 =?utf-8?B?L3pFWWNoZGtTQ3NhM0VVS3BkOCtNaUxUT3lORXVhZlVRWE14U3diQ095S084?=
 =?utf-8?B?eENKV2FoMit5bFdlNkxvdGh1M2pBekFrOTZwTUdNMnBkRDBCRjIrVU5GZ3Iz?=
 =?utf-8?B?TDRDOGozVUIvM0E4SmdtRTJwMFNoUm5iTnpyRXk2ZW9FYWhZMXhETGRySUhj?=
 =?utf-8?B?a0lkeVJlNnFYYWl5c2FZVmRJQlNEMktSUzB5UWRWcHpGZ01VbzNhc0tma2RS?=
 =?utf-8?B?NmtGaG1iQVVJUU9JenZkMngySVMyK1NJNG1xaTIzN2V0cjlmWW9iUFdQZnZ3?=
 =?utf-8?B?dElaYVpyV1N4Z0dYaWhzZUQ5V0FacllNUmRLNk1wQUNTTHVrTWtJc1pRZWVH?=
 =?utf-8?B?TEV2b0o2a2xyblpuVWVMVVplb2JKR0ErMGtHYWV0dkFnVFFCSEwrWXRXM0cy?=
 =?utf-8?B?SVdHQkxHZjRzZkNyOVBHbG5XZnRyd2w1VnlsWnZXTG00Sm1DaUN3THprWWs5?=
 =?utf-8?B?c3g2SHJBR0xDTmhMZzZPRUR1eGtCeFBKV0VacGZKaGN1NStPamowOTRXSjBO?=
 =?utf-8?B?S0lBbkE0M1Avc3ZxaFd1TXJHMDNHWDBia1JTVmtVOTRwTTBIYWtCYUhVVndM?=
 =?utf-8?B?bFY3MDVFRlo0VTM3ZVJ0WlBGUHkySFJqbThiMDdZa0VnZzBZb1c3NFpsVkg1?=
 =?utf-8?B?c2xTaTVWNkpmV1hySjRlbkE5eUVkeExmVURGemM5STFkWDBtZDE3Z081U0dE?=
 =?utf-8?B?V29ROFp1MEhGeUxza0RyV0haREZJelRaK0U5eEJldnFEVVNiWWJUayt5MERC?=
 =?utf-8?B?aDJ0cWNnR1crN05LczlJSnJpcUx4QmF0Z0RNekJSelRNU1pONGZnNDlRek9i?=
 =?utf-8?B?NjZ0Z09pUkFvOEpzazMrMVNlZ2twaUphdzVhRWxURmNzYklMTGVGZWJDcG5N?=
 =?utf-8?B?NHYrMk9LeHVxV3hTYjhJd05UL2NibkVDa3N2SDFmMTJ0dnZ4aUJhTnRSRENp?=
 =?utf-8?Q?3wNq5gQXzZAwHy7gW0/1R1m75jQ6Bw3s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGl0Y2ppUVR0M0pnSVl3RWwwZTBleTcremFScCs2QkxMdnk2Y0U5d2wvYjZE?=
 =?utf-8?B?NkxjVzBMeE5Ra2lSUndkR3VZYkZuaTFCTGFJMWFRNFpVZXZBMjMvN3dZVDls?=
 =?utf-8?B?Z0Jzenh1ZUtLcmtBMWlhVnUxUFBDSUlQRTJGNEtzNW90UEdvWERpTzFpNEtj?=
 =?utf-8?B?eUJDSGhlOUtCNWVIU1ZIWU1pRWQxR3EvVjcxMW16ekxyT2VTbDVqYzJkZFNZ?=
 =?utf-8?B?YVBiNkdYUlhWR2JQbWRBM25JVFZXVGtEZE51SUUzMG5FOWowaWx3TXBkSEpV?=
 =?utf-8?B?Y1Q0L3FId0swYVlrZU1COTB3OFpDVGpxMGc5TGM3THFCS1U1M0ZuNXNCdzRs?=
 =?utf-8?B?b3RrenJYVmxlUFQ0RVVlejVSTXFOVUZRbmROQUwvTjhUakpVcitjSFNiK1Va?=
 =?utf-8?B?dkNhb0lzZCtyNE5hNmVlbGprOW9pV0M3M1M1K3J3SXhLdEJaZ2VDTG1lSnlR?=
 =?utf-8?B?bThrNUNJdkcrMURvNmltOHVMR0dBVk43SEtsTUdDUXR1Qm1scUlhUnlnWm93?=
 =?utf-8?B?NGpCWWRjay9BK3NwTG44NzRBb3k0bitnVVZ6aExzTERsUVRJY09OVTZVMVRX?=
 =?utf-8?B?SjVMMFFKajJLSnJXZzJhV1ZPT3RxZjZuT05YOU5GT04yeTl0alpMNzYwMHBV?=
 =?utf-8?B?VG9zdTFQRVY0S3JsckpjVk9Pa0FNN0lZczI1c1BRYzZLZ3NQak1DQlZJL0dm?=
 =?utf-8?B?NHUvQ1IvTW41RHhZVVFwQkxSSzhKRlNTSndnNFFKWjhrb0hDNnpKN2pESE5y?=
 =?utf-8?B?ZUh2elN5T3F4TDFjSlNUTFhUWWptQlBWd2QvODJ6bmhPdjhQOFhKNURjQ21k?=
 =?utf-8?B?dFhqNy9WcGRNR2hCZDZsRk04ZFlrcXlXTnEwNkpxOThHbDdaNlA1cWEwR3VP?=
 =?utf-8?B?N3lLK2tPdGFCL3FGWE50MVpqVnh5eGtRdWlKdi9kTVMwVnlyK3dKNU1BWERz?=
 =?utf-8?B?ckhxaEFseTVaM3VCZmQ0dlZBTnlyZUJCTk1RTUVuVnc4aVVIYlhjVzdKTGFj?=
 =?utf-8?B?cWNwV2hhSUJwbmYvclZ0eGtRcmwwNWNuYS9jRCtPYkx2MjFEMUxLbjRNQVFV?=
 =?utf-8?B?MWNBdXlBZHhZMmNuN1pCTk9VczM4R1NPYWUzL1FsZjhIYzREb2xJSFdIbFlL?=
 =?utf-8?B?SW42S3RMNjZQRlM2S0diQTdlMGxoSS9VRjF2QXJsWm5uVFlQc2VrVnhVVElv?=
 =?utf-8?B?aWEvcXFQbnN2cms2c0Z4QkZpQUJUcmsvNDR5aU5sQityOTJDL2k4SGZwUWI3?=
 =?utf-8?B?ZSsyN2Fkd3RaREthc0tMbVp2WFg0UXVwMWZPbmxaUSswOWRGU1YrVGZ2UnB0?=
 =?utf-8?B?RjJtd2Mrb1JUb0RKNTJyTmM0VldHTTAxZXlsMzZaVEIwVWhqNlBCSTd3NUpx?=
 =?utf-8?B?Y1hoT0tQV1diQjFrK0FQeXF2dEUvSXhSMW5zZFNhb2FtRDM2c05rRzFYNkZj?=
 =?utf-8?B?OVY1OFE0bnhWYk8yaXdnSzlyM0xYeFJOc0RHc2pWTWhDenhxT09uaUxab1hY?=
 =?utf-8?B?RXB4YnJoa2UxRUJ1WFF3ZXVBVkIzU3oyQnpsdEU4RGpCMldjVTF1QTJab2tD?=
 =?utf-8?B?NVd2ejlvRjRsRkdjWkp4RlhEZDBFYWN0ZjJrSVBkaTdKRjR5cmNVZXBQYWZ3?=
 =?utf-8?B?MWlkazlvTWNlc1pzYmp6SW1acDF4ZWZoM3N4QURWdU8xUEE0Q0JOSmhUaWll?=
 =?utf-8?B?by82cEV5MUFDa28zZmNPTVFxN0x0TkZlc0M1Q1g0eVBvZVEvS3EwaFMvSitk?=
 =?utf-8?B?OG5xQm1yNXhacG1NSkRGdE04cG5VSXowd044bks4aWpZTGMvc2J1Z3Vab0hp?=
 =?utf-8?B?MmZPTHNOUDJMb3F5SXdwV0k0Y2xkMVJYcUc2WHFHYTlZN0JhYWozSDFlaTZX?=
 =?utf-8?B?bTVwTmlhbWhNOG5WRXNCSEMzZWJGYVFXVUJLY2tyc2JnWUtFVGZqaWkwY1VY?=
 =?utf-8?B?MEk2Z0VsRm1kNVRXdFROT0IrRG5oZXE4V0R0NThCWGNpUTZkL3AwTmxjS1VJ?=
 =?utf-8?B?NEJRYmFjY3JBV3R0RzFBd1N0R1lvT2E1SFhQMUlRMDRreU54am9IUGxqTThL?=
 =?utf-8?B?QnRCcEdIS0FnV3IvR1k0OEVwQWZsczJ1SEUvNCtCSytsbjkvdDlPNXVoczBm?=
 =?utf-8?Q?uLco=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b268220-3469-42e9-bf00-08de05aa3d53
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 14:03:06.8281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUpn1T6JhJR4M0Vt379jGXY95HhYsiRpk5CYCAobuLeqCH8ib2R65VXSi3Xr/BtO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5773
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

On 07.10.25 16:00, Tvrtko Ursulin wrote:
>>
>> Please not in the header. Neither drivers nor other TTM modules should mess with such properties.
>>
>> That is all internal to the pool.
> 
> Hmm IMHO it is not that bad. Especially that ttm_pool.c and ttm_tt.c need to have access to them. Alternatiev is a new header for internal helpers which sounds a bit too much. But if you insist I can create it.

Wait a second why is ttm_tt.c still needing this? For the DMA32 eviction?

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 

