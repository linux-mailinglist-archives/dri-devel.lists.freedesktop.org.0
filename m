Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D14ABA207
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 19:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7681110EB4A;
	Fri, 16 May 2025 17:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0FT7lMG6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E5110EB4A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 17:42:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hP+lgRZco/lvCzE4SO4S8skWBRzCJwGl0LT10gh0soyTU7gCh+a00pSZYMLt6i2GRtHLB/dvG5S2ghq6UnZgYI0uEqnVFXgiZGHnprJ9snYD38irl/4z6YhcrVyffenRmo4pvvEsA7SRm3jC1zB97hR6CR8hXEcx9VVYfeBF/2rzU15/jYgsyQwKRLZOOymUuRITLpoAv9Dn9uKnxq7JVwhclmDne6IdWllO+CvFkAQW/UiAiKyWYRzfTjVnLDMwTifdYWmnABOu5YjyV+UZQRDXuKP3y1rUGU0LrNqH73hg/VICiQdYxFensySBnwEPT2DtuR3/NmmLQ7fCW78xng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3AZPzGNy0j/yMwUS+3BEKLGL8I5CQes3F59oYjy/4M=;
 b=Le1ZBalxN4uMIQK2Wt3ozpZnR6K7vufnQeNMOfPAOAUGr2ls6u1cDJbcOZ3qSAtJ0IQqxhV8z0CbSDKtJ4q1mS3WX84vjPKw1qrjDjm4jH8yb1pxuZJ26eawj8XxS/no8fj7tSnC6Z7xTL92MHdQ3k/7lckU+VAOuPmGoczsjJOS3EbNya7iowEbaLyL6ILaTtGksvQdRLKXRopYwE36kkQMMuXeGkiCOMoEE9UYEvWiCyh6CggPYF8GhZrrkMtS8+KHRYKJ2rGaTDL4b+zYAu0FFSa9NLchCy/a2VTqf1v3NfZ8f3iDTBXw3aI4tYPBaoCjlcGtAkyaauDvLrYrcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3AZPzGNy0j/yMwUS+3BEKLGL8I5CQes3F59oYjy/4M=;
 b=0FT7lMG6V1vo8WquBXxbGt/nO/SJG6D4HXKBemcpg0ANCCl3q3rCn1gskMhvoy2vgeu/Cfx0U+l2HGnmuLNmJkfQUPjLXscGwVf3fArIvFB5ceW7Hld2n4caqBGH/xKfCCbQt2QgWneQ7e1eL7e9ZF08+Pmvmm+IwWXRLwUU3wo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6452.namprd12.prod.outlook.com (2603:10b6:208:3bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 17:42:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 17:42:13 +0000
Message-ID: <eff07695-3de2-49b7-8cde-19a1a6cf3161@amd.com>
Date: Fri, 16 May 2025 19:42:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
 <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
 <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
 <20250515160842.GA720744@cmpxchg.org>
 <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
 <20250516145318.GB720744@cmpxchg.org>
 <5000d284-162c-4e63-9883-7e6957209b95@amd.com>
 <20250516164150.GD720744@cmpxchg.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250516164150.GD720744@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: fb0c5cbd-9ef4-4699-9bdc-08dd94a0fda0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWNsN1ZxQVN2ZTFRSnB4REc2ZXhwNG1zMjRYU0Zac0lyTG1yR3BYK3BnbjNP?=
 =?utf-8?B?clJpUnRKaEozL2tCU2ZKblNBR3lkOWtzdFYyeXFuSEU3SHJZaG82enZlalZl?=
 =?utf-8?B?VEQ1b2hwYXVrR1RrWDAwUGl4T0hmSmg0RWo1MStDMmp4TDFPYWlORkdMNnhG?=
 =?utf-8?B?bGpneTRqRjc2L3grYzQ5QVlUbFZjTnN1REtIQ3c4N0FsellpY3BmM05FY3lS?=
 =?utf-8?B?OEo4RGVOUE1oQU9Xb2JBeDMwREtvUndBcmxSUEZmNGJSS0NoQUJwZGVtVkxO?=
 =?utf-8?B?clFCQWRQdTlnZG15SFFaUmtaM2RJbWYwRDVVWmJoemNjTTJkWjk4SzZQZWlO?=
 =?utf-8?B?VTBqVGJQcTkrNTZ4blNrMUltaUp1Tk9rbkltSnFDQ3NDWmRobDVYV3pLL0sz?=
 =?utf-8?B?c085N3hubnBGN0puUjNSU28zcDVtdU5SNEdNVG5xdExsYnJnMkFkdFh2TWJu?=
 =?utf-8?B?WnNZRkFybW9aRmkzaE1nOTc1eHV3bDQ4OHI4UVVLK0NIb251bXBhckhqNTZp?=
 =?utf-8?B?Q2FSN1hyTEh5UlVxVVBsMEo3R2t1UmlXZkhCZzQ0M3k5T3FTcGkxMmxPMVBV?=
 =?utf-8?B?SjI2OEFOU0o2NHA5ekFqcWZkWHk3OTczaEs2UWw4elIreW9wY2JaSzEzL3FN?=
 =?utf-8?B?TUplZmdKTE1rczdDaGtHR2lHUzRaQ3RLT3grTkxFZ3kvSE9DRWMxdEl0Zlcr?=
 =?utf-8?B?YU03YTVEd3pxN3dMVCtocVNGOXhhR1c5Vk5yWEZEdHFkZUgvbjE0cHhKUmNk?=
 =?utf-8?B?RldBc3htb2VxQW9IOUVHbENLZHNIZTJ5QWk3SkhMNUdiMkhHbndjQUNGMGtJ?=
 =?utf-8?B?dWYwbFcvNzBYbTk3S01kZGtZc00rMHhGWTkxUGJUTVhWTkUzc0xjUkdncVAw?=
 =?utf-8?B?NkVGcm9wMnVGVk9LWi9VUzE1WXVWQTAvWGNxMEVwRWpNOUJyQnMrQmNOY1Ix?=
 =?utf-8?B?TTNFSWs4LzB1Mmpvb1ZSSkJCU25mSlBSUHRnWlJwM0VLb0RSZi9HK3Q3c2hw?=
 =?utf-8?B?K2RmdW9HOE5YSk9EY1NmbDZHbTd2eHQ3aHlRU3YvajlUREZhbmV6eTJmM0pL?=
 =?utf-8?B?L0FudWxWclJCNDYya0c4ekZMSXhxN1VQakN2ei9yMTN3amR4SzMwMGhjaXJI?=
 =?utf-8?B?eTgyYTdkbTluWEwvTy9kSEVicEZXZmpGc0ZkUzRMRGZJU0tlbiticGxRMzQ1?=
 =?utf-8?B?SVlkYzZ4UW5oMWthbE9Eb3VyRUppZWtkNG5IL25yaVlIc0h4aER2UWUweEZu?=
 =?utf-8?B?WU4xVzF3Y3EwRndTTjJqakl3L093SU9qVndTN0MvTEVBcTdacXN0dnJudEZj?=
 =?utf-8?B?TzFqeDVrYUQ3ZE84NFZCbTdRSFJxUDNjRWVEZWFSSmN0TnE2bmRwUFRrSld5?=
 =?utf-8?B?SE51K3BlbG1CMnlqajkvZWlSVHRwc05SdU9hVDNwaGF0dGdMb3lzWG1XRUhP?=
 =?utf-8?B?SnlMWmtDcmZSbVNPeXQ0TVgwMjhBZm5pV0pidkNUUUpkTTNxODl3T1VvREpL?=
 =?utf-8?B?MW9UWUFJaEpGd2J6MFpjYW1zblBpakVqRWZseVN1OWJsMkhPOEZ6cXQ2bWo4?=
 =?utf-8?B?TnladWJpR1RIRWwwNFUyQmJEMzBCOWlpeklyU2FkNnJsNmVzVGtwR1NKcVky?=
 =?utf-8?B?SExzc0JOV1NyMHdGM05JVWcyUGEvSjVUWEtHbElBakVZVUN3NkFRcC9rbDJU?=
 =?utf-8?B?cGhkNVVUNWNpbkRKM0pVeDJGekJoRWhmMWxCWllGNGdZVUtXTnZkKy9iNXdq?=
 =?utf-8?B?d3B5Z0h2YU9xcjlCa2JmdG81dGJObWZUQ3BPTkV2aHY1Y3cycHd4VUpmU0NS?=
 =?utf-8?B?TDMrRzNRQXp2YjZvZk5VZFJUc3d3TDFWN0RQcWtxS0doQmp5UDFpWlovNEZT?=
 =?utf-8?B?eHg3U05QTmdKTnB3YXhLcCtsUWVBOWRXeVpJSGhDd25jMEhHNDFRWVdHRGJt?=
 =?utf-8?Q?wr4xAGxN6i4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzRzalRYaVZ5Zkp3UENaSUpheDZPSWtPcXhnZFZXNnZOdWtxOERrSGNCcnRB?=
 =?utf-8?B?VjBzMVl4Z2NFNXRqLzd0bGh2ajlqb2NaS0ZtS1Z3Qmd3WFNYeWlWb1RrZG1a?=
 =?utf-8?B?UEg3cldmc3AxYWhRUHBDTC9aZHN6SUlBUVV2Q2F3UUU0NmkwcXJqdGEwaDlo?=
 =?utf-8?B?MTc0WFBXQ2EwMWk2TlcwTVdEZEpGMWNGakd6ODFCU2JkeGR0MXdoS08rUjNK?=
 =?utf-8?B?Z3lkdnd1SXpkYk42N0xqWER6QXBBdTNZUmhzVUtpZVlwMXlaNEdQRHdPalpr?=
 =?utf-8?B?TEpxZjRJQ1ErRUpRQjFvcVhTZCtqSjBIVnpCZm42QXgyc0RnQUlLVS9UWDFm?=
 =?utf-8?B?cDg2QU9uQzhmVVhLTm91OGlIeHpWSHlQRlRUQk15OEhmLzlQQXhlWEhzQzNV?=
 =?utf-8?B?VjAwbE10c0w2cTVGc0lFamhoZTAvck42TnRKVjJ1S1BGbms3UGx1MTV4RDRX?=
 =?utf-8?B?R0s3VzBQUGFTYzFVZG5kTVcrZVJHMzlnVkwzK3pCT1NodzlaOStubXpENGxL?=
 =?utf-8?B?WENaTDVXMjFJUjVIUlZhVHBPMUhvQlRVdlgwWWMyRE1NVkU0UndOYXpPOEp0?=
 =?utf-8?B?S3doR3d5RWU1WkIxSGNIY25mMVpyeS9GbTVVZHY1cU5BQlhBVGFnU0lpWjBQ?=
 =?utf-8?B?L1RWMVBhcGpUczAxQkZiejBvVEdlWGs3RFQzK2xqSHU2Q3dwWnJDWDRXUUNw?=
 =?utf-8?B?dEFrcXlWS1FQMFZYUkZUQVliUUUyUUkySmdWZ2VPU3BTZmg5UTIvV0o2TFg3?=
 =?utf-8?B?aDNzYlVKOTlkMk9mc1JZNUc4c1g2L3dHaytVRDVCcFA4S3BQT0t3ZUdGZExF?=
 =?utf-8?B?MnN2emRoMUZvbU5UQ3BVNFc0a0tCNUgrZENDTUZ1Q2poa1NYT2NaMWdoZmJ3?=
 =?utf-8?B?a0FIYkdOQk95RmhaNkpSM0wyeFpDZVhHZWY1ZWF2K2F1VlFCaTNMQlpWUVcw?=
 =?utf-8?B?RDdmdnRXSXZmaUdLZlVFeFlKSGFsak1hbjRmWVk2VWJyL3E5QkhOVzM4Sm14?=
 =?utf-8?B?WmE0UDN4UVphT28vYjM0RFlHWUVFNHczSnBIOFpyM3NKanN1ZnRGME5KK25o?=
 =?utf-8?B?SXV6cVJYQjNMdWRvUm5pZzlyS201dVdsU3JOYlZJeGFCNWUvRlZHNy8xcGRZ?=
 =?utf-8?B?YWN2VmtRM3NpOFBhVXo5RGZJQnNCN21UNDVKSjNycE5QZXJIUE5nMWJiZDNS?=
 =?utf-8?B?aHVXL1dBc1hJVFpmL2xXUHF5WjhBT0ZQQm92NHprOHhyU21SRFJPdDdUQkNl?=
 =?utf-8?B?R3ZFcHAvNGptSis1V284dGdLWWJsczQ2bGdUU2V2U1F2RFpva2xGYVJJb2tu?=
 =?utf-8?B?akdWa0VXOWpRNmVGREpmUC90Rlh2R0dMOGcvMWFBMDBNaW44K2F0STZQam5H?=
 =?utf-8?B?clk4V0hrSVd3RnF6WDBQcXFEVDUyK1d5dUl2LzhCa0NjN1pvWEgzNVM1UExL?=
 =?utf-8?B?aHR2b3ovM3NmaFJTYTE4cGNsVlVTM1piSWhzZVdxWWhIeUs4RkRkemZGZjJh?=
 =?utf-8?B?ZEFFK05WWDNjd1ZiUHcrMmVZNkdJenBMT1lrbEl4SnFTcUlTbFBtYVIyVXNJ?=
 =?utf-8?B?YzdSR2prL1h0bGdYei9JNEtTSVFFMVFoR1BpVHpheUk5OUN3djBIWTY2RUVD?=
 =?utf-8?B?ZlFYK1BYV3lGbTJYWjJ6cHZ5M2JqRGZTRW9iT0s5SVpjeEhSdk1HTEJzRlc3?=
 =?utf-8?B?SVlET2cva0ZueGdJZit3U2NSamJ4QW4ycGdqMTROa2JQQXZuVEpsU1FzbG1t?=
 =?utf-8?B?dTVhZWJLSS8zTlllNTJjWU9wemIyVlV1TWxxWm1tYlpvS3VCYldrU1F6dzI5?=
 =?utf-8?B?b1lwUzgyYlhkWXFHZy9iQTR0T09TN29rVUJ3Ums5K2dnb3IxVVNCbUhyeHU0?=
 =?utf-8?B?Nm1MSlRhbDFnNXRsaVpoK3piKy8xNXRLa21SWlBQSVRTQ29GK3lwRnJSOUVs?=
 =?utf-8?B?YUpyY1dKODNOQW4rOVNMYXR4Q0NscmRlWTFuR3EzN2NlV0k0Uzc3OTJtNVAv?=
 =?utf-8?B?NUNyakl1VnhxdVpaYjZOU21XbXdXMUx1c3l4VUN0Q3Bkb01tT09qNkQwcUFI?=
 =?utf-8?B?MjJUWU1LY1cxQll3aTFLeGhhZ0l5YXM3cC9STmNRS1pZZUtLZDVRTFNTTVR4?=
 =?utf-8?Q?XQOwNcM9C5ma/t4FTaKfwyCs1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0c5cbd-9ef4-4699-9bdc-08dd94a0fda0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 17:42:13.1066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UH+TMJR62WXn3JzI8uyploziB+4wp2tBHLU4p5RhZ46Sy0Qf3NabtfLLAzvPxUKX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6452
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

On 5/16/25 18:41, Johannes Weiner wrote:
>>> Listen, none of this is even remotely new. This isn't the first cache
>>> we're tracking, and it's not the first consumer that can outlive the
>>> controlling cgroup.
>>
>> Yes, I knew about all of that and I find that extremely questionable
>> on existing handling as well.
> 
> This code handles billions of containers every day, but we'll be sure
> to consult you on the next redesign.

Well yes, please do so. I'm working on Linux for around 30 years now and halve of that on device memory management.

And the subsystems I maintain is used by literally billion Android devices and HPC datacenters

One of the reasons we don't have a good integration between device memory and cgroups is because specific requirements have been ignored while designing cgroups.

That cgroups works for a lot of use cases doesn't mean that it does for all of them.

>> Memory pools which are only used to improve allocation performance
>> are something the kernel handles transparently and are completely
>> outside of any cgroup tracking whatsoever.
> 
> You're describing a cache. It doesn't matter whether it's caching CPU
> work, IO work or network packets.

A cache description doesn't really fit this pool here.

The memory properties are similar to what GFP_DMA or GFP_DMA32 provide.

The reasons we haven't moved this into the core memory management is because it is completely x86 specific and only used by a rather specific group of devices.

> What matters is what it takes to recycle those pages for other
> purposes - especially non-GPU purposes.

Exactly that, yes. From the TTM pool pages can be given back to the core OS at any time. It's just a bunch of extra CPU cycles.

> And more importantly, *what other memory in other cgroups they
> displace in the meantime*.

What do you mean with that?

Other cgroups are not affected by anything the allocating cgroup does, except for the extra CPU overhead while giving pages back to the core OS, but that is negligible we haven't even optimized this code path. 

> It's really not that difficult to see an isolation issue here.
> 
> Anyway, it doesn't look like there is a lot of value in continuing
> this conversation, so I'm going to check out of this subthread.

Please don't!

I absolutely need to get this knowledge into somebody head on the cgroup side or we will have this discussion over and over again.

Regards,
Christian.
