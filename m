Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2215C852E9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:31:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D08210E3F2;
	Tue, 25 Nov 2025 13:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fMxGmBqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8374A10E406
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:31:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDhNWB2NUyl6NmzSA4eMn68b2SBo/7se8JGy6aSXdEVXKvJgA7uyKtdpzQr6Bq8YHKKMzGsaHAbLSUVdbRbGdEqf6UPfTOjAFKjToa/3Ut9LuxidUE4jOu4qWb2ao+YuguZH4LHvZRqqTMJaJELnz0Z66sIp/aC9RJC08lDP6as00BbW9GkhuMnETl/4UcWcR+hlKtSkCpHWhSXzGp3ECyrlNtrh6aI/cwG0tXEuUGSKzp3yi/Mg88ffbbLri/QhWE3KZ9dghE8t5oeHaN4dTtKdpb4TGb00WQ3jxo750MqRbYiOsLzKGaQ1RFiEfodh51G4MwB6yS+/3zT/+ZrFGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/oelEC0cDXe3gpnMMcOdPhrre6yY0OVIYdBJq5ETQ8=;
 b=tBPqXtUSew6PZg2fdniIaAQnI/fmogM/WeySKibv7LwIToiFq674Dc6GU/OS2YfTJXHpOtx4bbwgaqhQQ5aU+7gl/LIs7NdUwVHuLQzZ68BDfiMhUYOFwnNwzVzvIRPk6PQ8jCRPEzzYCraOcWMQALvRgVPE1nMqWHVo593RoicJAoCPYMmvFNJ2VzNFyK6xp5691+QINkZpQLr9M5QvseVD/L3xEw42QEf+pHuHaKXWb2rjH/vHHolGXKK/PWQBzb7hRxE7eB/4NkDriH06M3qd09woa/Hj3+tH85EKW/Z+dxxKqItIXbn0Dq2HTlkQ7lQnbV6ixfwmMLhLd81d+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/oelEC0cDXe3gpnMMcOdPhrre6yY0OVIYdBJq5ETQ8=;
 b=fMxGmBqFhKbUVGB37RgIWVc7C6/OoWgfWaqvORcjHZQNe1Xz1GAlxozX5Cl8N3h9XNGgYAVwRLPiY88NnoiYZlw+pbsPQSNHL3PoIPSZTIau02q5nZOvKYsblzN08kAu1TuJZN7C3em40uKkfN6SYwfFSbnO3j/K38IrDyglcwI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB7003.namprd12.prod.outlook.com (2603:10b6:806:2c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 13:30:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 13:30:57 +0000
Message-ID: <914ba746-c32f-405b-97fd-d61dfa9073c3@amd.com>
Date: Tue, 25 Nov 2025 14:30:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-buf/dma-fence: Unify return codes for signalled
 fences
To: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251125104443.82974-2-phasta@kernel.org>
 <20251125104443.82974-3-phasta@kernel.org>
 <44d30056-612f-4563-ad9f-92696c5a803a@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <44d30056-612f-4563-ad9f-92696c5a803a@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 75247318-8a88-48a5-bcab-08de2c26ddbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEU5azI1M2trSlYwRlZ0QjJWQmErRjkxZGppejh6Q2JxMGdQaTlFWDhsTElI?=
 =?utf-8?B?dEpjeVdXU2t6S2xNZEZBdzdJT0x6RHFrQlE2eTZqN0pEdmFNa3JMZjI2QURC?=
 =?utf-8?B?anI4RDlpbWg4bXVaNVY5U2NSbDh0UFBoaG52L1FKUHdNczc3TmhGR3pKWTY0?=
 =?utf-8?B?YjVKUWZkQmUwNDFVSkR6SUNYeURzQWNLdGJ0NkRtZ3ZNYzlXampJMElDaXVW?=
 =?utf-8?B?TW9zV1pLRE5yNHdPSE5vWTVXV2ZBSEo3OWdkdVB6cWRuV0Y0ZmU4WkJCUk9k?=
 =?utf-8?B?Uk16eFdGckpxNU14NE12VnZFNHpzN1dZK2UzYWZGazJZN0tIZ1libjZMZjFr?=
 =?utf-8?B?RlFPeWh5YWxnZjNvYmRKREFUYmRmYXJHS28zbi9WOEZyWkYzL2tMNzNKQVNT?=
 =?utf-8?B?RU11ZVNBb0pYQUJLSE85VzVmMDNPU1Jaa2FkY0QwZGZHTEZPS1U1WjA3N2J2?=
 =?utf-8?B?dm93UGxQeWdVQk9KelFUT1Jxajd5RnlOTWZibytCVlBUNHI0UkZScDFmc2tK?=
 =?utf-8?B?eVp4MDRjR3BPR0NGOTdnQ2tZS3dtR080RXZXWTVpZk5mVmtsMWc3bTBDQjN1?=
 =?utf-8?B?eDlhM21xaWhHalZlZlVaVmhUUG9GUjIvSjZXWklQY3B6WE9rV0NNM0pWMmU5?=
 =?utf-8?B?T1FrSG5QMWtNcS9rVWFHZXYvek1IVlRWcDNxNHRLcEg3bnZUU2JHMXU4NnM1?=
 =?utf-8?B?Y0d2Tm83NVBvRTVkeFR0OTdBRERhMjJjYmloVGlSc0tTaXV6Zzhnekw5cVB4?=
 =?utf-8?B?ZHlPM1lEcVdDTWYvK3I2R0hmNytiNE8xOS9rYXZLZmRIcEtodEFOMDRkV2hk?=
 =?utf-8?B?ZzJKWmRkc3F5eVJCcW5HRllxRXJuRE5uTWw5K1ROVDhvZEtaNkdFVmNvUk5z?=
 =?utf-8?B?M1JDWFNNeDFiUlZPUXM0bDhETG5OcEVIZC9OZzlLUGs1dEkwNnJPTm8wU3VM?=
 =?utf-8?B?d0haN2gxUnJuaEFqSm1iUHc0Rm9neGo3bFBSTUpVRlhPVDFTeDNKTCtxMFdw?=
 =?utf-8?B?Q3dmZHUvblE2cjdGRFdYM1dzY1JIVStFUG1BYXRwUG9JTEtNRGd3VzlvUFVz?=
 =?utf-8?B?enduTk91R0tpeHlVRzAyZW9Cd1ZiM2UycjJQZlEvYWlybTZDRlBhbmthSDda?=
 =?utf-8?B?dXhqaVFJMjkxTDkyeXREQk53UXQ4SVZMNmsrWG9jVkk3WlJqN2VITVRVQmJX?=
 =?utf-8?B?dFBXeTVYZTF1RjQ1T0gyaDRlSGtZRWxyVmpTc2NiejVWaS9FWVgzeFkyNlB3?=
 =?utf-8?B?WDNrNW1hT0RhemJ1ZFYwd2l0QS9TUmdEbjB4Tm5HTFB1QVZmN0pCRkJsejVY?=
 =?utf-8?B?SG5tVzVCa25ROVhhZ1FpZ1NYM0JxUGZ5cllFVlhNQm95UThET3RYV1FENmYw?=
 =?utf-8?B?UHhIUDNZZVN4WWcvN3hjY0RCNUxNcGM1QmoxRHpUN0JzYnZjbWNJRFk3SG0x?=
 =?utf-8?B?aFlmZGlFMUt3OHhlZnFHZFlDTEMvRGNCbHl2STZpb25JemxEUm84QThCOGdZ?=
 =?utf-8?B?WDcxclhPaUVLRDFlaXpPUkVLdFI0cXFxbEhSbXBHeUswU3JaQ0o5NURhdVdS?=
 =?utf-8?B?bEFTUHoxVksrZHpnNU9iT3E5cHNnUllZWU40SEhGb0JMVjVMZW9XaE1CZ2FD?=
 =?utf-8?B?aGhVSmx6TzQxbEE5RGxzek5TQVZtbDExTnFIOXRKamt6YldRTEI3YVNmTzVB?=
 =?utf-8?B?ZWtoMXhta3Vtd2czZkxRSld0STg4WmE1MmtrQmo2RFJnMFRKTWJIZ29ra2JZ?=
 =?utf-8?B?d0dZWU5sNW9ObmtJcjdOR1dCVzdIVnRYU2gxVDFnTG9Kb2xBRjJwMHZtMFdC?=
 =?utf-8?B?bEUwbHVwSGNXYUwxY045Q3FtOFNWbGpteUVseDcxVVN4U0V4bllGQTBPZXZP?=
 =?utf-8?B?MkZIaE9tSzh3a0l3YnRjZW5qK0xSbXFSV2gyTERIRDQvdlZpdGUxNjVpYTda?=
 =?utf-8?Q?J2+DUNbps+YWSoF9l9wWGzOQKsTRYkwA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1NjWmJHVisyQ0NZbzdsMUJ2Yjh6b202ckFEam8ydVIzQ294emxNby85Lys2?=
 =?utf-8?B?OUhsQ2hLTFRWZWlLaXoxaVMwdUh6Mkd4NEF6Qk9NQ3dRSlgwRlZxTGF0OEZJ?=
 =?utf-8?B?WlhKTERTdlpYSzRMMmx4bzk1cVdWd0FJME1nTVg3cjB0dEM5RVdEWWdUMjBE?=
 =?utf-8?B?NTJXL1g3aWJRMnZVZm9zR2tNdlYrYlZzNmlGWHFSeE4weXJNSkdBNHZRNFZX?=
 =?utf-8?B?eG1QVDJldFBtMlA4VWlHbmlkaGdNRkRsVExYWkw4ZXBsN0t4aEgrM2NMUEdX?=
 =?utf-8?B?b0YrVzZJRkp4TXlGNkxOYU8xT3NqRGNpczR3RERWSndGb0YrbGhraHVkWkh6?=
 =?utf-8?B?Z2tVM2RrSEd5aVE5U2d4enAzQ3p4SGhlWFA5c2dFTHdLWW1jWUJOQnNRY0hZ?=
 =?utf-8?B?QVlzZld1NkM0RGdYcFZPNlhLY3l2Wm5Pb2ZiZHlIdVk0RTZ6eTFhTXd3WSto?=
 =?utf-8?B?bGYrdEJLWklQbzlFdFJkdENrNzFxem5kSGhpWTc1ZUJPUEJoV0F5UHpHam9m?=
 =?utf-8?B?OGQ5MnJ3TGFFRWp4QVlLdVNsZWxRd05aVjQ2VytHaGVPQU8xd1VzVHlYOCtP?=
 =?utf-8?B?VDBCcS94VEdkYVVrenAzc2ZEbytmL1Rnc0VDVG1BZFJFN2s2cVIyTmIxSkJI?=
 =?utf-8?B?aksvYkYvcHpJVGYwd21FNFRLNXRYNHhuQ0xEY0MvWThXS1hUQWNpcDlvbmFZ?=
 =?utf-8?B?ZVE1YjdTZ1ZyOUxad3l3dnlZN3Q2WXNUSi9pY3FuVm5jZDZ5UnZzWFpOZFFN?=
 =?utf-8?B?UWlCT0VTSGczTUJVWkc0eHpXVGJKcnp4T01hakk5ek1BTTg4TGRJZWJtK1Jp?=
 =?utf-8?B?ampSOE9RYjZqS2poS09ZK0ZSU0FlSjBBOUhxMUhWK0hOaFVGVHVCMjVrNmha?=
 =?utf-8?B?LzROdEkxYUNjK2pWVi9mbVJyRlhiaG1FUkhuTU1SR1FyTEFNaHREQkhKclZI?=
 =?utf-8?B?bnF2VFd0bDIxWlA2S0gvTHFpZ3dBUktlVzJzTmlpcUMxZEdJQUFTTm1MMHpl?=
 =?utf-8?B?U3lNSVp1ekFsNlVkcWZXdEZXY0d3bWNwRGVCeXd0OGJ3NmNabC9GdWZZVjR1?=
 =?utf-8?B?Nlo5U2dNWjdjZ2hUb0R2MzMwbVFwRFZPUGtjVEFPb203dVdmUlV3S2VZRUZL?=
 =?utf-8?B?RGpXRkJZSk13Z2YwK2xZTU1VTFJPb250dVlyak1sR0JzZ0M5WXJSWGxqNGVD?=
 =?utf-8?B?MEVlcXZHTWVlb1ZDb1hkYndhSXVzc0VLbFdCVUR5blFPYlZ4ckR2Vjc4ZzR4?=
 =?utf-8?B?Vy83dmE2STlBQkRyaXJQWGFPYWIxVmFublZHaDhDTFBXVWpac1p2R2xqWDVk?=
 =?utf-8?B?UjVJOG1TbHRMdUhCeHl2V21KWVUwN3hYZUpPcEFBZjFIT3BNRHhaUmg2OWxu?=
 =?utf-8?B?ckpuaHljKzlYQ1ZGbzN6ZVIvNHNZUTVudW94ZlNadTJzc1lLS0RlaWNJVXFm?=
 =?utf-8?B?cVI0SVB3elhKTjE5M213dXFrbW9TLzZzcWh0MEg2Q0FhWmJvcURGUjdHLzZN?=
 =?utf-8?B?RVA1QUhzLzk4djZQS0pOQnZHcENHZzdZcEw5V2owcmhJeWk0Zy9LeWNTeVdt?=
 =?utf-8?B?NS9ONVpwMWlNQWhzY3JQK05XbGhnbDB5ZHZRaEE0cU9jNzg0cnNZdFpla05C?=
 =?utf-8?B?dThJRWtYYjREWnRuTU1ycVBBU3lYY2VPYXlxdEpteExiLzBmb2FybGxxZ2s2?=
 =?utf-8?B?bE1HU0EyUmVpMDhoSWRJaTZzcld0eEd0aFN0WXVXNU5zaGJoYXVqSU5KODgx?=
 =?utf-8?B?MDRqeTFGekZSZWtUQ2diRW10cHgxVm40MW1KK0ZjcmlodHViUERVeUFRb1J6?=
 =?utf-8?B?eUswdFRvWDVNSXZjYjN1TURkdEE5Z05ZRW1ySytYQ0xoQWxwTlJOa2RVa29a?=
 =?utf-8?B?aDBRZUpneUdraE9IYm1INkUwQk9zdGVOTGo0MW92MGJDaURlQzNKYUUwRVBJ?=
 =?utf-8?B?d0FHZ1hXbzVwRVNqZzNGcWd6SWxpb3Q1T1NvVUtCdWkwdWFiZHJEZitTZ2V5?=
 =?utf-8?B?Q0Evam9FR2p6bG9nc0ZIdVhlNktRVGt2OWd4S3FDZEVwMURDbHh5ZDJCMGhG?=
 =?utf-8?B?L1pHN05nZndTV2cvS2FhZjRncEdTUkh0MEx2ckxHb3hKaWJWbzVsN3NDRWFm?=
 =?utf-8?Q?VVNjsA2e5Kz0AaGY7gmfSWgB6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75247318-8a88-48a5-bcab-08de2c26ddbe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 13:30:57.5038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vi/6lXkgdgcx7n5BUXArLiCAFYhKWqey/+uaJ5MbUxLYxGfxNde10gir7FyFmBLL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7003
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

On 11/25/25 14:20, Tvrtko Ursulin wrote:
> On 25/11/2025 10:44, Philipp Stanner wrote:
>> Almost all users of dma_fence_signal() ignore the return code which
>> would indicate that the fence was already signaled. The same return code
>> by dma_fence_add_callback() cannot be ignored, however, because it's
>> needed to detect races.
>>
>> For an already signaled fence, dma_fence_signal() returns -EINVAL,
>> whereas dma_fence_add_callback() returns -ENOENT.
>>
>> Unify the error codes by having dma_fence_signal() return -ENOENT, too.
>>
>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/dma-buf/dma-fence.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 3a48896ded62..09d97624e647 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -373,7 +373,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>       lockdep_assert_held(fence->lock);
>>         if (unlikely(__dma_fence_is_signaled(fence)))
>> -        return -EINVAL;
>> +        return -ENOENT;
>>         /* Stash the cb_list before replacing it with the timestamp */
>>       list_replace(&fence->cb_list, &cb_list);
> 
> Story checks out AFAICT - only two callers fetch the error, xe and kfd, and neither does anything with it. So I'd say it makes sense to unify the errno.

To be honest it rather sounds like removing the error code is the right thing to do.

IIRC the policy was initially that drivers should signal a fence only once and when they do it multiple times then that is an error.

But we quickly found that with opportunistically checking that this policy is actually not helpful and dropped it.

The error return code here is basically just a leftover from this policy and not useful as far as I can see.

Regards,
Christian. 

> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Regards,
> 
> Tvrtko
> 
> P.S. Just not sure of the 1/2 on which this one ends depending on. I *think* I suggested the helper in the context of some discussion long long time ago but what it was? And what about all the drivers which look at the signaled bit directly?

