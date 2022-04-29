Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C445146E2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 12:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCBC10E9FD;
	Fri, 29 Apr 2022 10:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBF010E9FD;
 Fri, 29 Apr 2022 10:38:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mn6IH8vQu2GWl6YsOJkY7IafUl2JVLlbn7QP3AmXupJ/RgNFM6G0I07fC66IWI6t+g0J3/qjNMPJ5fTis2rYUVKjEveA1EH+wAQ3xMLFWKiR8behk8ricTR5RB09J+LG1Yobqssymn5lRPa2EhCkU3PfrK3bXq9PoX5ww8s/3OMmNKFk9EXvotPPrDPD8OlitfMuyZUgQ+O2GhN9fZqdxvPyQ4XKbPW4c/mJjj7cAOOj8JlGJeKV/3Chfy6e8uv85ttWHL7xoB90Y5hz0vFu73+EsHiV0uUAAhHxCVFg9mKIIxOweMExNie9aFzQpdg/Ga1CXLTZpiNQSz9oHdD7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1PtUvqypmRGjP9T8c3r3wsfEavZafnWDcvxXDO2jFI=;
 b=ZBrN6iqJ82yOk896e4lOt4lnxzsRPvfg7q8lJRQY3lscEvJAOqWsEKus4KW/JM8qCJHsQUnRaxVcjbkLfxKXpkyGbr9AbQ5s5uHGLKNFbKisGUFLZvUZXrqjMXr7san5z3lA0Nk5kRQPnAs+Q+tGJ5jxtW8XHhfRv10DUxtOhZJIH4oDEHv1FYicsuhkCEsZMfUS1NqJMcfEuoV/pxu3Q9E48oPcmr6jZ1nmbcrw6L021zL8t0FbpV4KWwwJDknjIrbvcWumwDs4xyjlynaJAmIk/vO1lur+jnXqQ6zBX+2QT6u6zI4L95e5Fe5A2fDrMEHZFWpL3GXWwaopsGE4aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1PtUvqypmRGjP9T8c3r3wsfEavZafnWDcvxXDO2jFI=;
 b=Yt7/otQ802af0QAvZdOJqdBiFmH26yAZH0G//bDG29SyrVnutg35A0vmY3S9b3zr5myo+Lf/yAKmLIMb1PDSIS6tE7RgDhSY/qwCgYqcuVyVu6bp/NGMcM6L5NvoWL2ihgGcfbIqw/I9ZwKzWoloq583H1emFifqJV1F2bqMcXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6029.namprd12.prod.outlook.com (2603:10b6:208:3cf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Fri, 29 Apr
 2022 10:38:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5186.021; Fri, 29 Apr 2022
 10:38:13 +0000
Message-ID: <17b8fbf1-0765-5189-6a8b-cd1d05bcd052@amd.com>
Date: Fri, 29 Apr 2022 12:38:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@linux.ie>
References: <20220406103405.299c06b9@canb.auug.org.au>
 <20220413101014.6b6c4db2@canb.auug.org.au>
 <20220429111354.197c6dee@canb.auug.org.au>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220429111354.197c6dee@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b516b10-9cfe-455c-87b0-08da29cc5c52
X-MS-TrafficTypeDiagnostic: MN0PR12MB6029:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB6029C21B1598F7AA41E6143D83FC9@MN0PR12MB6029.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tllpxUAkljkIsSoFXvz8riJmb1IFNCg2YgdngL6T8B/5nODN3QA4XCwcxwjhlv4wAyVc94/ukJgsHUzri8jtOt5ZIRzUFWKZn1lS2UGJvi8k1TBWjkFJqmyTWhDP/r416QckCccXHegV9MXcDPHJ13gDFp5pb8MbMaOSVZG1qPnVKSl6aUk0wW/OMRUz43vkwt0sWIn8t2dU0gUFoyt/Nq2P9IETsp22RYB1Bwt27UBh1u4gfEqYPRgn+GFGgezISflcfOJfwBMbUUULGOjd3ZyrevY5tB8AeNTJzw+MuQZ1iefXXnNcAVqIY8wc2IsgsFdHzrUWYwllz9Y/xI8amTInojawaTvXQbVFxu3AvYlypDgdFUPFfzu0OxLA5P0Lmu5RWSEnYG1hVkbtO/3AfC6JdXpyPLmKZ1O5+LTNzWyUqvcZMvF2Z8RtCnvLCNTUbrPBkC1mf6uROqsLY7uIBbKWi5RfPYmBWQJKY2JV1fQPV394W4RkRc4qSB/pay7IRdK27BzJTNsGBDgDm9ore+rWw5dQ/tD4ZSZKUE5/56H+NEofkuR74KAy+R3yuKyUfIWd/oVOB9Zp1NoQDKzIchE6Ecyl9IoqgCvanGILpULcWI7VjzitmAGS/36CnEVee8z8DFYpK9nwzZ+TCvYJ/X0TxVnH90Br4qlBrr3Ut0960JYyj9QLBrPejHCT7mRFCG/z1BIKMOeO+Og3Oh48zSNuNfyk4zo9XnXrRjHyANI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(2616005)(83380400001)(54906003)(66946007)(8676002)(31686004)(66556008)(4326008)(36756003)(66476007)(110136005)(316002)(508600001)(6486002)(31696002)(6666004)(6506007)(53546011)(86362001)(2906002)(6512007)(186003)(8936002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEFSL1djRTlSQXY5VXJPN3ZVcEZ0aU42U0ZlbFpQcXZOczBIS0xUSjJUaVBB?=
 =?utf-8?B?eUhmeUdiOFRVRnUrSy93cVZDMTJLSVpaUDZJUUxVTlVOVXk1d3lTSTFwczVi?=
 =?utf-8?B?V1g1THJ0YzdzZEhKcStheGR6SEhTaEJOUE5IZVNLVTVpd0dNb2hHcVkvWUVs?=
 =?utf-8?B?RWdXWE1mblhlRForNEZyeUUybFp0WWNZYk1ZeGkvUjJBbFBEQVlQM1RlRlNy?=
 =?utf-8?B?WUwxN2RjVWtIMUU2UTFUS1QyMS80U2VmUzdBZlNmNEN2ZXlaQStrMi94Si9E?=
 =?utf-8?B?R2E5YU1CU1h6VjZneTJPb2VIK1A2TitITFgrQVNQM3RMSEdlaU5pcnQ5SW52?=
 =?utf-8?B?aUFGaTE2aGVvYkVFKysvRFVyUk9vMVRtMis4UG56NUZaVm5TL0lWMmJMSnZi?=
 =?utf-8?B?aHFzbFdOMllaTXR3NDVBUHZsQ1ZQRm5ZL3h2eWVjc2RFdHB0UnE3ci84ZTBr?=
 =?utf-8?B?enhLZ0h1SUlmaHA3ejFJaXRJbE1qdTFndHRuR0FGR1Y5QnhLaDhhYU1ZY3dG?=
 =?utf-8?B?TTBtTUFnaW1sMTdndkdvdkQrVW1Xem5HMk93anpoMmpVS0tFRnJtZGpEUVN1?=
 =?utf-8?B?eXM3MXpHVU1LYTIrZ2RLSXNFb3ZqdCthZzdtWW9xczM5d3o4OXhRM3hpblJz?=
 =?utf-8?B?c0tkZmgvQ3pUZmZuYm9jV2R0R1hYemNENVFPTEExV0llWDM4QnVhKzl5Zlov?=
 =?utf-8?B?VG4rbi9ZNWJIYjBzWGNoVDlScEZmd3VCdFdUUHo0QkJxbUVZbHA4cEdiVVpv?=
 =?utf-8?B?bmJEWTNueGxWVGhBd0YzMXNEVEh0TTVzOUdUSnBFU0dvNkxoSStrSjZMZnlT?=
 =?utf-8?B?bTh0TjJnSy81NytZNUlvcUNHRituVUJoSGFEQmdOOTBzZFJpSTB1bDkyazNl?=
 =?utf-8?B?MzBvUjlFR0JUVFk1dmVNcTB1clY1bmtXRVR3RitnN0FDcHpzcWxrN0VDVTRt?=
 =?utf-8?B?RXpMNjFaTXZRTHFjMStYOEJYNXFUZVRkb2VQR0ZpNVV6eFE2K0UvbTA0WC9B?=
 =?utf-8?B?R25JMFZXQ090a1ozRUgraGE1N0RNRDR3Z2JLVGVKYklma2hpeHcrMWJSUFE5?=
 =?utf-8?B?RzN2MFRnbUhqYWFmQWhIOUlmenlUcmh1d0YvTVFtOE91SGJUbTVJVDd6Njlp?=
 =?utf-8?B?SS91eUZLclJXd2g1TEM0QWpQS0ZpQXlpZXJpNmNMaFQvamdaOThaKzk2eHYr?=
 =?utf-8?B?YVdGcW1wcUpXSUZYdjB1RHE3YjJIQzlRdlVMYkVXNnVTUnlmNlFLcGsyV1h4?=
 =?utf-8?B?dkVNQ0Vab2dqa0ptd2dBQjdscXdQODlTcHJ4UEN0eC92R3J5NmJsZGlRVzZr?=
 =?utf-8?B?cnBiTHFWL29DWFpId3NPd28wSlcwenc2OHhwWktVK3FhdFlaRC9CYi85NTNm?=
 =?utf-8?B?Z1ZjRjFrUDBYcVlSajd1WkdQQUJMWUdnZ3NPTWRYSmVMUDBUd2JtUW02Vm9P?=
 =?utf-8?B?K0xiTVM4a0EvNGZoT0tnYTNLS3hUYTY5ZkVEdnNjVzd6anNTN3BudUNoS0sx?=
 =?utf-8?B?cjFLaGxDRVJMelAzM25xYUtUcitFd3VlSmlWWFczQXlBNytCV0pRZUYzMVpi?=
 =?utf-8?B?MEJZS21yWjBUTXVwdlZkd2JCQTBzSFlLaDB0NlpRTUNFSU50RDFWQmFTOHcw?=
 =?utf-8?B?ZWE4VEhTbkE0LzdtLzBaQy9Ra0hGZHRkeTBFY1NxMUlJcjRWZld5SG56bUVl?=
 =?utf-8?B?QWsyVFVNd2t5L2lWRXlTZnY5aGdPejBiZSttNzA1K252Umk1UHlzRnFicjNs?=
 =?utf-8?B?VVF6TXRDRjFIcEVPWGphRk9QZzVpbFZwN3dmd1ByVEZoOTF4R3F0d3VVSy9a?=
 =?utf-8?B?MUFYVHQrcmpjYk5xM3BwbDZhUzR6cUVKVHFQWkxoSEsyTFZoSHhYL3BUZFFv?=
 =?utf-8?B?S0FRT1A0OTFDZURpa2Y2SktFRmZwWk5lcHpsRk5iRnlhTHpadm9JWFU2dGFB?=
 =?utf-8?B?NXFQMU5RNmRCcTBzdFF0RU5EVi93RG1oQ0d5YW9RamNUNHZBN1Q4Q1dCbHAw?=
 =?utf-8?B?SCtFRUtzQmpNOUNUYzQyMXdIWDZzeTdub0NoTEZQeThLZlJXL3d6aHd5ZXJC?=
 =?utf-8?B?cWVyTGpkS3dIRWRoYXpkTHJIck96eWNVS1JhTkpLN0R2U0tsUjlUTldkOGhI?=
 =?utf-8?B?YTBuUm1CT2dtRS9lOWJFSGdGQUgvbk4zQzB4VGtDN2VUdlkwdkJCVm9sL3d3?=
 =?utf-8?B?UUZXU3V4V0tubVB6ZmRVbkJCbUhxT2ZleEpXeHNabzBHSllKcWJ2QllWazRs?=
 =?utf-8?B?MXNaME5MbTBGK3RsamxmUnJmSy9BQzloYW5jRm1pb1B4K3lMRmFIek5FT2pq?=
 =?utf-8?B?Y3NVSlJtd3ZpR21TS1dxZXh4cTBqeEZNbE43d0p6ZFJFNmNrcWQ3cndPMGIw?=
 =?utf-8?Q?oy0P3UDnbl7YsBfLy21CfmHT+UglMCD1xd+d/emeEAj3y?=
X-MS-Exchange-AntiSpam-MessageData-1: 3Ag+WYXvXpo9vw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b516b10-9cfe-455c-87b0-08da29cc5c52
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 10:38:12.9232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7V4PMn6nOXKJaMvMvkUfTlbFtAOXLVmjpNd2Nz/gw4pXFjOYcnA803UA2bxouMi2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6029
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.04.22 um 03:13 schrieb Stephen Rothwell:
> Hi all,
>
> On Wed, 13 Apr 2022 10:10:14 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> On Wed, 6 Apr 2022 10:34:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> Today's linux-next merge of the amdgpu tree got a conflict in:
>>>
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>
>>> between commit:
>>>
>>>    fee2ede15542 ("drm/ttm: rework bulk move handling v5")
>>>
>>> from the drm-misc tree and commit:
>>>
>>>    184a69ca4d41 ("drm/amdgpu: separate VM PT handling into amdgpu_vm_pt.c")
>>>
>>> from the amdgpu tree.
>>>
>>> I fixed it up (I used this file from the latter and added the following
>>> patch) and can carry the fix as necessary. This is now fixed as far as
>>> linux-next is concerned, but any non trivial conflicts should be mentioned
>>> to your upstream maintainer when your tree is submitted for merging.
>>> You may also want to consider cooperating with the maintainer of the
>>> conflicting tree to minimise any particularly complex conflicts.
>>>
>>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>>> Date: Wed, 6 Apr 2022 10:28:53 +1000
>>> Subject: [PATCH] fix up for "drm/ttm: rework bulk move handling v5"
>>>
>>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c | 9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>>> index 958d7ed97882..a29933fa001f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>>> @@ -630,7 +630,14 @@ static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
>>>   
>>>   	if (!entry->bo)
>>>   		return;
>>> +
>>>   	shadow = amdgpu_bo_shadowed(entry->bo);
>>> +	if (shadow) {
>>> +		ttm_bo_set_bulk_move(&shadow->tbo, NULL);
>>> +		amdgpu_bo_unref(&shadow);
>>> +	}
>>> +
>>> +	ttm_bo_set_bulk_move(&entry->bo->tbo, NULL);
>>>   	entry->bo->vm_bo = NULL;
>>>   	list_del(&entry->vm_status);
>>>   	amdgpu_bo_unref(&shadow);
>>> @@ -653,8 +660,6 @@ static void amdgpu_vm_pt_free_dfs(struct amdgpu_device *adev,
>>>   	struct amdgpu_vm_pt_cursor cursor;
>>>   	struct amdgpu_vm_bo_base *entry;
>>>   
>>> -	vm->bulk_moveable = false;
>>> -
>>>   	for_each_amdgpu_vm_pt_dfs_safe(adev, vm, start, cursor, entry)
>>>   		amdgpu_vm_pt_free(entry);
>>>   
>>> -- 
>>> 2.35.1
>> This is now a conflict between the drm tree and the amdgpu tree.
> I noticed that commit 184a69ca4d41 was merged into the drm tree but
> only the second hunk of this merge fixup was applied.  So is the first
> hunk above unnecessary?

Ah! Thanks a lot for noticing this.

And the hunk is absolutely necessary and we already have a bug report 
that it is missing wondering why I can't reproduce this.

Thanks,
Christian.
