Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8028396A22E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 17:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FDD10E5B1;
	Tue,  3 Sep 2024 15:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qSOgVD/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C5210E585;
 Tue,  3 Sep 2024 15:24:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JN4iOl4jo612y25nf1F3mA99Qz65T8DAdigqav9Vzqn0xOESD5loMvada1hNSWgM07wU5rHYd83dq1SzhkjxgvWMAMzTDwHuhDnG0NkK7zGNtX17yV1H7YD4oIIQIOQUis76me/O/VbqSvjqZ/CExkRggNt+GPG/heu32lRnMiC/NcCbLtfltC00cBXhBrSldCL7cAzjuGOJpCoe3AIh/HdywcJzaipRIw3OwWNEuFG1spm5m25Pr1fbXcqEAHfd5uPenrfVT0hEbnwQao2g2AnqnyiJObFO4P4yUTg2bDYw4w7uYbdo9iUZtKFq0UmjvbnFACL6c5TyQ2YhHASd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hT39x7sdim//fpCsEuRqAWSTaSWeexV7XGp3treuyI8=;
 b=ZElAsPHurO/lccJgUwKpxBfcEmcxZYnwHmd0IOs1Ura6y0sMptr0vf9zB9/OGnsVf4DwKCz9DjPqEdQZUkJ2TswCJYzbYx8x0Ltiotpiwh4JyjzVLKJH6Xzkz7xBHP29X+Xi5Q3kFZYdo4Zzm1e6TtFBLvy+pY98UxELrA6w7p9p+b8I44mo97EHRvlCLjivEIeEBe8yEuw1r2yyGsl54rzCUNZKpvz3B9H2rITqg1ARyTjD2K2QOeBPJJ5JJWe5nq/jrRxV/KpsOWzdi8jGpK/kU8w1Rclgonv/ninStmsB7IEV54yuxrBqg2XGHhhcIkuxsSxguhiUvrkdoNtEuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hT39x7sdim//fpCsEuRqAWSTaSWeexV7XGp3treuyI8=;
 b=qSOgVD/HwHSBrOJJtl392cnsNobC2gXTv2pp7foOR9kGxpbnb5sZ9XTP1XgOFRV2M30WCHemRBAUA94C2RIc3Sf56/9tb7rSvCGQmFHGgBjB68fqw37chK1kwPc61IHOcgtjHj/VrouINt4Nil5Dri2fmq+BtbqYKwYSngALj8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7240.namprd12.prod.outlook.com (2603:10b6:303:226::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 15:24:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 15:24:16 +0000
Message-ID: <46af952e-71ce-49e9-8008-2dc1d6c9b67c@amd.com>
Date: Tue, 3 Sep 2024 17:24:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/ttm: Forward -ENOSPC to drivers requesting it
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240903133849.17119-1-thomas.hellstrom@linux.intel.com>
 <60e8310d-5f8d-41d9-b889-58bc7cbaa395@amd.com>
 <4b47f5829ea3e4a2e55b983775c775a9735f7fc5.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4b47f5829ea3e4a2e55b983775c775a9735f7fc5.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: 665ff577-9b2a-4db1-2305-08dccc2c78f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVV2OG9jYXVxSWFjTW44VUhkaWhBYXQyVEN5MkNYZHJXN0hyUXRubVU4U3pR?=
 =?utf-8?B?anVDRFljSDU0NE5rcENVRnVrNno4dzNkd201WDBiM0o2VHQ0WG5zdDJObm5G?=
 =?utf-8?B?SElHcXFnM0RlZGtBNURCekRqdHRGVkUzSUlKcjA1enZzdDhHdXdacndpbVB0?=
 =?utf-8?B?bmtKQjQrVnpDN3dLUENXczBxRUZBOU5QMEJCc3dXcmFUNHJwMEk3SW1xVkJW?=
 =?utf-8?B?QVRuNHVTeHRPK21pL3FGcVBKSGpwUitNR0psYVNucGlMNzFRay9UZDRlc25h?=
 =?utf-8?B?cDhDdjZzV0t1ZG1CMnluWkZpSGpTTTRzSDFoV3dwaHBhUFhhc1JEbnpESFhr?=
 =?utf-8?B?QWxmdTJrZ1VNdmtiQlh3aklEUklQMEJQdEJ0MkU0MEdLcFQ2VjNVRGRRRjE3?=
 =?utf-8?B?MnhaVWpVOE04VzJDd0ticDNhYXR4NVRHU2Q3NnZMaHBjR01KSUJ5c1RFMFZM?=
 =?utf-8?B?NDQ5L1huUEUvem1rK1M1UndjMmNZMm51dG5oK0kyQWhLdjZSSlV2NXNHUzN4?=
 =?utf-8?B?ek1KOTZTcXZrb3BIUHBMUDd5QmVUUWZ2SXhZdERaZ090bVZCSS9NZVlsTHY5?=
 =?utf-8?B?TWtVMWp4RFptelprd0FLOTh2MU5NQVhnTDU5WHBNSVR0SjlGd1BxNWs2L2w4?=
 =?utf-8?B?bSt1cHB3QUhkRHQyTXpNeWxqWjZrOFlVdUUzMlBIdm5pV3lJdFR4anV0Skc4?=
 =?utf-8?B?dlV3ZU5wWlRoMHNSK1VZOTJXRzlqSWRPcmlXQ1MwUHdYN1ZtdklJSHBxVnk2?=
 =?utf-8?B?TzJVRzk1WFBtWHZMUEpMeVJlT1p2N3p0N0dmRlJsYzFYbDB3Q3hlUDJoRWJx?=
 =?utf-8?B?Z3IvbDVkeVUwTnYyMitQWW9MUEUwUlB5ZHY2enFEVnhHejJnVCtGZmtoL1o1?=
 =?utf-8?B?TEo4TzhSTHNRSmxHUzFTaldPNnpLYkx3OHM4TWVlTFZjM1VPZEdoTUM3NGd1?=
 =?utf-8?B?SlpxTGIvQkJlc2tRanJtMVFIK3dxWlBJb3c3eXdjRmgrUXVSd0pvWDdTbmtx?=
 =?utf-8?B?enIvckcrck96RVZ1czNPOXJEaFRZWjErQklpZ3QwYTUwZmRWNWJvZG5XOURC?=
 =?utf-8?B?R0VqSksxMm9qNE5TVENSV2xNRkQ4dEt4S3d5MEhxRlRjL3Q2elBwSXlrREh3?=
 =?utf-8?B?ejF3bHRwR0Q2QnBZcmphVTYxR01ZSzl5ZVhzdG1KdnJIcVVtZk40N0lmNmlu?=
 =?utf-8?B?U3gxTGhBQ0hPNzQ3WVdnMExXRFBPOENDNlYvL0hZMnFRaFptbEoreXpTbEZw?=
 =?utf-8?B?WjhqdzVsZEdZYTFoSnY0Q1R6d2ZHcW1iNTZIN1I4bnF3dkcyVHRxTnQ4NlZS?=
 =?utf-8?B?dkFpeTc1L0RHRXJVblRESk1zZzl0enhzME5uWDV6MVN4RDJlZzI0czZuUXdw?=
 =?utf-8?B?YzFyeFhFYXlaS2FlVmxhU2UycGp4Y2dLczY3WVQrdzBDb0MvV3FKWXJSeFRS?=
 =?utf-8?B?TFhCVnA4VlhvdTZWdzFOS3pUQ2ZsVzM4b3JTTklMODV2ZjRwbWFyQ2R5bDd5?=
 =?utf-8?B?SzBaREJ4TS8zSjRac21KS0lYckFWS1U4YmdDM1FBNDU4WnNyc3dzbnJWcVlT?=
 =?utf-8?B?aXAwNlZnTm5sQlUyQlE4SWNTRkpYVUc3QTloYmNDcGw2UGZwVHR4SmEvWFYz?=
 =?utf-8?B?WktRc0I3L1VnYXU3cUtkS2ZMcmMrcXRnT3ZIN3F6MWl6dW9QRlU4dUhvcDhP?=
 =?utf-8?B?QUEvSFJpM0dtUHJSLy9GWVZNMUNYZjFzRVFJdGpobGh4cHNPL2hNbWhXWVdv?=
 =?utf-8?B?VzhsTGtSTUJsUEw0K05tWmEzeG12UGNJc0xVcCtaZ21TL3V2eXFLbTAya0pQ?=
 =?utf-8?B?KzJFQjZNMDNsRDZYN2tUdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V05UWW5kZmJQL3ovNkVETm5kWGp6VUM4TDM1RHNyS3Foek1yNnlQVXhrMXlQ?=
 =?utf-8?B?UHBwbU5uczhwMWUyT2h6blp5WHVkSkdUVTRDZjFwMFZrR2I0bk9TUU55QVVC?=
 =?utf-8?B?VFFoSWorR2pwQUxFWUtuNmorVklacnE1UW04WUk2eWJKVjNDbi92KzBQSHpn?=
 =?utf-8?B?aURpQlVQMFBJbUVuckdjRVBLUU5oWmUwb25OZUF2U0pzVkRVcmxKRXM2alNR?=
 =?utf-8?B?L0dMd2JnWnNPdEVJVCtPNmFWWHZjV1ljbk4xOGxhcG4xWkN1REw0alNvSGVR?=
 =?utf-8?B?cVovUFd3bUNZTURtWjhYTXZmaC8vVlNBV1Q1TlJQUzZWbEl0ZCtEMlk1OUMr?=
 =?utf-8?B?YkQ2cHFPb0NXUEZBSHQyWTA1ZU1GREx3T0c2cHpLeUJnaVdUdThrNk5pOGsr?=
 =?utf-8?B?N0U4OTBHZ3l1VUlKNVhYQ0NpaWIyMWg4SzhuWmlUUHp2Tmw5VUpHY29vZWlP?=
 =?utf-8?B?SWd1MmhlUUZXV0lYN0lkQ3ZDL2lpK1NKWTFwYVBpT2w1QXJxeG01M0cyTGF4?=
 =?utf-8?B?T0tUUTdqMWFrUkd1bm56bS9IK3pGWEcrZkxMOWVXWWg3V1lTZlBhSGlLSzJV?=
 =?utf-8?B?ZlE4aE56Vy92K3d3TS9CUVZOZWlrcTlTQ0hzYnM0N3lycktoTFRWK0laaDA3?=
 =?utf-8?B?bzZuSElTaDhhZGVTNlMrcG5PeVBxSUxLd1RWNWFPRWd0V0NzNjNqQ3FHRE9X?=
 =?utf-8?B?dVl3Tnp3dEF2YTVxQ2VqQW1VSU9jTG12MjFkNnpvMWZVdG0rM25tVjlxaE9z?=
 =?utf-8?B?cmJuVHVFNzhnckszdlNCUEtVMHVwWHF0N25GWlhPZU54a1ZBSGJoWnhCZjNS?=
 =?utf-8?B?YmFaV3R1ZnpDUGs5b2RqNDROWFE0em8yMnVGV0sxZFlGTkEvaXNQRXgxcUxB?=
 =?utf-8?B?T2lFb1RRMjBHSDJkY2RjOFl1azZuZjE5WWJNcm1SdDZ2OGc5N01UZkVoTnU4?=
 =?utf-8?B?YjJxeFg0d3F2bDlhTWtEUkJLS3ZkZzZEQklQaVAzTENQY1BLTFI2QW93ektE?=
 =?utf-8?B?ZlVXNHN3SWxObnRONFlObElWUzZYRm4xNXcrRmIrbzlXdWtGQ2tjTXZhWlZx?=
 =?utf-8?B?Nk5RbnZ2V0hwQjFRQ0l3VDlFU1ZhMllDTjBMRVRDbmpTeUhhSDN5NFZjQVlj?=
 =?utf-8?B?SEMrbFFRcGpZUldQTU9YR1RqQ3Evbkx5VW5ka1JRNWZTRHhUTTNuSVNFWlFs?=
 =?utf-8?B?bjBscUcrYTlHdDU4L2JwWTNWSGZvZVQrUlBhNTJZUnJTMnIwNEQvQzcveGNj?=
 =?utf-8?B?NTlFejdpRGZ1VHBFZHhFTk1BUmI4eTRFVTRybDRFa1V2N2xiQ1dKcEJuSlFD?=
 =?utf-8?B?bDl1OUM5cTVPTjJsekJ4c0E4TllhT1lncjVsWVp1WkZ2L3hqRkNsZXFiRGYw?=
 =?utf-8?B?N3RUNEN0SEIvSGc4bWd4bFA4TkJBZ3VaMnNWb005enFlWTAzUk01RjJSVHJt?=
 =?utf-8?B?Yk9Jd1ZTdVpjQTNkNjFvN2dGSERjVmZuVnlnbk13cUVaeW5FU0ZUZFZHVWRm?=
 =?utf-8?B?OENVbmU0VGNWQ1hNUmE1YVVSTTlwaFZrSjFTMjhzRXVhNlRqc1NLczR6QkZW?=
 =?utf-8?B?SERGWmdFbmVzL2xTVnhyaFhsa0tEWGtPbEUzdmhOdk02bW9nb0VkZVJINjVB?=
 =?utf-8?B?MkVuc2hBZ2V2Ym43d0pKN0FJei9naFF3QjZpSFl0Ris1ekl5d0lWcjFxWUVo?=
 =?utf-8?B?K20yNWtwa0FGM003ZUNaN08xL0pmN2gxUTVjOEEzbDJER2J2a0RSVitRVWZr?=
 =?utf-8?B?ancyaEVPNmpKa0VxbC91TzVzNjRucDF4NzZFRjRhMWFySUFsYWdXU3pxemtM?=
 =?utf-8?B?YkpySkpIeG1QM1JsaXdBR2F3OHViUFUrNml4anV3MmZQT2NMUWJSdVovalEv?=
 =?utf-8?B?Tmp4Y3Z4aUZQZnVNMmlvMXFJUVB3aXMxTkk1RWlLQWFhRmpaSTZQRVdNUnRi?=
 =?utf-8?B?MGRhdVozSnJ1bzJaUXBLYVNPTHptQUFHekY2RCt5NW1UOVprZlZJVFI2YU0w?=
 =?utf-8?B?WkZKckNiR29uUTZ3SWVjeU9CT281TFBaeTJGTFRCTUdvODBIc1QyRDRzdHZr?=
 =?utf-8?B?bFhhMGhpS2hXOGZpTWF0ODNnZmVoOHBLUWh5d0dNZ0dsUFVBNlQ4S01UNERB?=
 =?utf-8?Q?FlNKAwbyvsW0WSciKNY2Rcf/b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665ff577-9b2a-4db1-2305-08dccc2c78f6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 15:24:16.2110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWmgY9I8s5OIXRtqTYAi5MReTGQ3W4r6VKVguBnmGmSga8jSk2MbUB/MHvfd/i6x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7240
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

Am 03.09.24 um 17:22 schrieb Thomas Hellström:
> On Tue, 2024-09-03 at 17:14 +0200, Christian König wrote:
>> Am 03.09.24 um 15:38 schrieb Thomas Hellström:
>>> Some user-space APIs distinguison between graphics memory OOMs and
>>> system (host) memory OOMs. To aid UMDs in determining the type of
>>> OOM, allow forwarding the ENOSPC from resource managers to drivers
>>> on calls to ttm_bo_validate().
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Ah yes that was on my TODO list as well.
>>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>>>    include/drm/ttm/ttm_bo.h     | 3 +++
>>>    2 files changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index dd867b5e744c..d9a320dc8130 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -836,7 +836,7 @@ int ttm_bo_validate(struct ttm_buffer_object
>>> *bo,
>>>    	} while (ret && force_space);
>>>    
>>>    	/* For backward compatibility with userspace */
>>> -	if (ret == -ENOSPC)
>>> +	if (ret == -ENOSPC && !ctx->forward_enospc)
>> Mhm, couldn't we put that into the bdev? I would rather like to keep
>> the
>> UAPI consistent at least per driver.
> Yes, we could probably do that, although that means changing
> ttm_device_init() in all drivers.
>
> And if doing that, then I think we should coalesce all bool arguments
> to a flags argument to make the callers more readable.
>
> What do you think?

Works for me.

Christian.

>
> /Thomas
>
>
>
>> Christian.
>>
>>>    		return -ENOMEM;
>>>    
>>>    	/*
>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>> index 5804408815be..d3e12318d336 100644
>>> --- a/include/drm/ttm/ttm_bo.h
>>> +++ b/include/drm/ttm/ttm_bo.h
>>> @@ -174,6 +174,8 @@ struct ttm_bo_kmap_obj {
>>>     * BOs share the same reservation object.
>>>     * @force_alloc: Don't check the memory account during suspend or
>>> CPU page
>>>     * faults. Should only be used by TTM internally.
>>> + * @forward_enospc: Don't translate -ENOSPC errors from resource
>>> managers to
>>> + * -ENOMEM, but forward them to the driver.
>>>     * @resv: Reservation object to allow reserved evictions with.
>>>     * @bytes_moved: Statistics on how many bytes have been moved.
>>>     *
>>> @@ -185,6 +187,7 @@ struct ttm_operation_ctx {
>>>    	bool no_wait_gpu;
>>>    	bool gfp_retry_mayfail;
>>>    	bool allow_res_evict;
>>> +	bool forward_enospc;
>>>    	bool force_alloc;
>>>    	struct dma_resv *resv;
>>>    	uint64_t bytes_moved;

