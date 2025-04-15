Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302D4A89E9D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB7810E780;
	Tue, 15 Apr 2025 12:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kzhbj6Lt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BE210E780
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 12:53:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltrY1v2YmtU7qn6DqEs/jDgEaIPnn4T/zOsRz+N0V17SgNiF6+KyPz3yfjnqbGhX322FC/zwKM15t0w+qlZ2xHXinE0qBwLtfVcMh4mz7HzWsW6rsExmfMPrFfU3Kf2mXaA0IzbS1lZp11vZQjvx38ID0HttKaGcYqqlbbNLJk4wnSmvpTtssRdBY/nE8SB00xLmE9+sQ1qE5Zde0BXGFCXFj4YPghAGSRc3gZjtO3nbQy0BU+vOhscss6oQZ39Uo9fj9T4BCMRvHnFWdJkh65A1QdZmgp7WAdl91Jz4BclErdfR3EBBrkvgOSOLPqKPTbF+IKDYToIwlWj1LpHvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ux53MoiYJi5JG9sFRnTGiPnjTNKsMXeBhVMZxkRrhCQ=;
 b=QSXxi91FJdfu/iGcrqyPGhr3J3hxnQeiUDvad135GXClp2Bt0jZcpF1/hglfRV604CL00/aR1KZXT89D8vrhsBxx2sR/eIjlC4CIuFyyhC37qjGoNITM/WZhRSfIF1jaiMZ3xvWGjdh9fW9I+oOYMhIAMdGIrqJOoqbM5m4A6pVgYk+rasxeCf6m37cbLpPdS2qkkY6lwrpOqDKPjo1tgQJt1MDEZeevFayrB+rZ9k3SEm6mTfdpJP69PRMwwCrNg+mFVB1HV77DRnXn8f7OW3Hve0e7nOOOVSHTwQi+DN3jLD30vagZiP2tMvX6QzFqI3eXWiMnaEpMC/14YIcVkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ux53MoiYJi5JG9sFRnTGiPnjTNKsMXeBhVMZxkRrhCQ=;
 b=kzhbj6Lt6VjBwm+c08Kfavnx3mqvJnYsOr/WrT4jaJps+cGrWIRevmnH59S8zO/7ACrTUUoqFh/Mwc7h8ZyZy/4M+nQiO5iBUyP60pnN98ty4gYyoxs3gBce5GfxN2AQkCdE/Hz1rCe1894pE1BIg+T0hxyCHC6hAy39uB9AkvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7554.namprd12.prod.outlook.com (2603:10b6:208:43e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 12:53:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.025; Tue, 15 Apr 2025
 12:53:00 +0000
Message-ID: <ac0aba3d-ec77-4f6b-9ac1-f6077519f30d@amd.com>
Date: Tue, 15 Apr 2025 14:52:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Internally test import_attach for imported
 objects
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250415092057.63172-1-tzimmermann@suse.de>
 <e2e82102-eb9f-4eb6-8ac3-6122ed7fcf28@amd.com>
 <48ab9b82-0d26-4d7c-88b0-feab9762b128@suse.de>
 <b924ffa7-99c0-42f1-9170-069e92299021@amd.com>
 <ddb93e8d-7716-47b3-b06c-0bf862d9c32b@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ddb93e8d-7716-47b3-b06c-0bf862d9c32b@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 596b9fc8-b8a7-404e-f464-08dd7c1c7398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnI5UG9KZXJIa1BZcFJaVXRLT09RM3FxVFlramJDeWFIM25ZRWFtVjE3Qy9x?=
 =?utf-8?B?K3ZlcG1wYnFlbUkrS21DakdNMUVieElxSkVHeHVXYXBzYnNWMDBFK1BHanV5?=
 =?utf-8?B?MmlXcTl5M1JlRitIZVJJVVRGakE1cCtydUVIMlBtYUFuZjdKSWduc0sxQWYz?=
 =?utf-8?B?QS9yMzBiSTdjWW9ORHJlbE40L1pKR3FpR0J6RklHVnkrOEJ5YTlVRCsxVi9Y?=
 =?utf-8?B?aEh4a1FLTHpDMllRYTQvKzM5UjdWb09QMDdZY2U1ajQ2WVNOZmIweE04K0hK?=
 =?utf-8?B?bkpYYUR1czZ4R3VSQ0ZoU29QL3NNaHVWMmRRK1UvdEdkTGpWNkVVcUNhb3B6?=
 =?utf-8?B?UlBWSVJ3MkgzNW1PL1didHhjaFM4Unk5emhVTEU3NWxjMFUzVWRJUEVmR0lJ?=
 =?utf-8?B?L0ZTemFqdUlQZjVldVVMYURPcThLZnQyWWZ0RndrdDMxalZBN3BCOTBVTUwv?=
 =?utf-8?B?MzVwOVMrSXdVTkdJVnU3UWRoaHdQbWJQY21MVzdTVU1KZi9MUGR5T3BvbEhQ?=
 =?utf-8?B?cXRLdDc1SmxyTTN3cXlINVdpYm85Zk9CelNYRkxBRWw5a3U1TFU1M2pHVGlq?=
 =?utf-8?B?RWQzc21HMmFPZ2ZQN09lU0xUSFBvN1ZvRlZ5LzNPL29wckJrTnJTV1U1d0lU?=
 =?utf-8?B?dFIxQmpsRVZucXlHejlyM21GY0U2NkJjQ3NwdndwK0gxeXJ2UTAxWlN5UXJK?=
 =?utf-8?B?WlBtLzNxUWNmVjBXNGx0bFFkRGJkR09UVW9nZEdmWno0cy93ZlR4anZndWFU?=
 =?utf-8?B?eEJTS2RMSnkyd0U4Q0xPVXNUVzVHTzZHL3MyQjJRbW5VT0x1dW94cXpBOVBi?=
 =?utf-8?B?MUlIdGVaVDkvU3kyRnNid3kwcXZMWjBrc3lVcE5DdzFIMkJqOFVmZ25qdFNI?=
 =?utf-8?B?RDE2WUVyVkhhUml4dVFsRlA1QmFNSUlYMjdFV3E1OUowUzQrMGVDN3dLbVFj?=
 =?utf-8?B?TWZvVHMwWHJENFFFVTUvRTVjN2ZUU0dCaTZMSTlkendtcHdtT0VHRDdEcDgr?=
 =?utf-8?B?QTM1UUlwRzJvUVdGdUdwTXY2ZVZGcVZnOURsNlFrTFRMS1JreE4rUE1oUVFD?=
 =?utf-8?B?eVdpZEZVMEJJWjdnVksremt5R2ZCNGF0MkNWRFZlL21FbWtHWk5vamZqYUhR?=
 =?utf-8?B?Z1pPY000Y2hudzl6eDYzcGl5aWJYUU4vWnU2Z3NkTzdXcHB0SUJzb092VTA3?=
 =?utf-8?B?UzJZb2t4VlowMmU4U3FDYUlQMDN2ZmtqWWNsRHVGTUdTQzZjY3YvZllVSUky?=
 =?utf-8?B?bGQ0SGt2Nkg2RXdHTHdNL05GdjZhNXU0NnVHeTI2b2VEaDNiT2M4d2xRekFa?=
 =?utf-8?B?NG44V1ZKeXk5L0lXZGNnNStVNkxlOVJreG8wemZyNlpSUmRIdWJ0VitkTWR0?=
 =?utf-8?B?cUFta2hwenF4bTBjYkRqVS8yMHl1dkFab3V5cmpYelJGdkJSbjR4R2JYbmVB?=
 =?utf-8?B?NFAvekhtT3owNFZZZVpXeUVNZkJjUFN3ZWpnZnlhMkl6N24veEtOUlhoN05s?=
 =?utf-8?B?NFUwQUZ0clB4Nys4TFFVQVE1TXBqekllcE4xWXh6QVZBUmQ2WGQzdVNDQUZY?=
 =?utf-8?B?M3hBWndBSS9mbnNiR3JjL3lDVXRyOWlTd0lBTzlqSmU1R0xoU1NYa0JmdVJj?=
 =?utf-8?B?cGdxTTFDVTZ0a2ROS3JLcUJYcDJyRFRpaXN2K1phamxIMW9laXF6cEFYYzM5?=
 =?utf-8?B?aVNRb2VwWGlJTUJTcHhXYmVuSkxZQ2pnRm9sbXNKV3NQTkdSVDhQYVpNNTFD?=
 =?utf-8?B?SUtOZXNqc2NTNjY2YTMwTlBJazREUkM2aFQyb1Z3SmM2bHpvZ2c2OU9UazJC?=
 =?utf-8?Q?jMBUYr9mCbTuNXyGDHOHMh3pNZlxDgAkezYUc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnhOcFpqa1hOWThqRU52bElwS2ZiUGh0V3NSOFNVV3E5QlhTaE92UktKZHA4?=
 =?utf-8?B?Rnhpcm9PTXl5NmRKZmR2dExmZGRvM1R4VWx2RGozdUlLQVBvUmExbjk4V2pm?=
 =?utf-8?B?UDg2QXdsZmZSMXJBeHF3M09CZnB0a2VGZ0FzK0RYRnJlbGJySnJUSFVZYUlO?=
 =?utf-8?B?bmEwcWNNSUl4SjFEQ05ROXhsUTdlRko3MXlab2xZSTh1UHEvMm5nRno3amc0?=
 =?utf-8?B?WHhROGdnUzBySjNEMXNmMGx2R1BScE1wVG5vQ2ZaMGJmRDlRUlBnRndXcjdl?=
 =?utf-8?B?anlZT1ZWTnFmNEY5QlUwYjQrRGpvWU55bncyTnlKakh4Q25oMWdkbXZFamxm?=
 =?utf-8?B?WklteXprNHUwZi9GSTFXUjhvNC9GMkxXWTNhS05rNlZlblZZcnlBaVdWWi80?=
 =?utf-8?B?OXpwb0paNjlPQ1F0eGN2M1d5M29QcGJteFdQZHc3Q1hIdE1MbnVYQkVuR2pD?=
 =?utf-8?B?ZEM2MHB5S2J3bktVTU5acDZrbHZaLzNaQk5US3d4ZU44c3hVOHl4cmVIdFNq?=
 =?utf-8?B?K0ZoZUJCb1ZFTWovWWd5c2VwdmU0anEwd2kzbDJiT29Id2hUbnNnYUdKOHAy?=
 =?utf-8?B?RzVCS3hYVUZ0VVdVcW9ZbjhiZldDNW1qTVlyZkVJMmQwY1pZU3BOWmxFeDBY?=
 =?utf-8?B?R09vN0w0YVRWd2ZIYUFOZk8vR2YxazQxTnRLRFFObkdtR1J6NEZSTHNwZFpO?=
 =?utf-8?B?Y3I1WW96OHNGQXFYV1ExcDBEQk5yWVVYN3o2WS9mRlZJTTdDc21PM1NHTWpj?=
 =?utf-8?B?UlVGNGhIWGFUS1oybkQwam9JYUVtbFpnOFVUQytoSjJvMDc4NEVsaUZZQ0h0?=
 =?utf-8?B?RkRRamIzVEVuMDRRaU5rREFJK3hSMUViMjR1dFZiQVNjMnBYR1FJeVV5UklK?=
 =?utf-8?B?UVVVYlVWUUgzOVZRWG0velVhcXkvVHg4NDJxT2ZCajZBZ1RLZjZjdWhmaUZn?=
 =?utf-8?B?RWpvYXVKbGVYcG1rZFZrc09pS0I4a3k0Q3V4OXc0L0lna3F2dWJ4L244aEVx?=
 =?utf-8?B?WHZLQnFjMmpwM2REZVlOMFY1SkdzdTFHbjZra00xUCtxTzVOZ3cvUXdRaENT?=
 =?utf-8?B?MXFLU1pWWksyL3dxVFlObTFHMTgrR05UbmoyMGV0THVyNUhrWU5xbExDZlo4?=
 =?utf-8?B?TFBucklPVFBTTGNNeUJEcXB5bHhsOGZLUy81RW9rZGRjdDlHQXhXMFFqQzRZ?=
 =?utf-8?B?VCt0U0ZGOGhLcEs2VG1KTCszK2x3RmVEdFIzVTVES1Z5MUNtY2dRN3FuZDYw?=
 =?utf-8?B?b21UeVY1MzZMeDdocmhtY3VRakdxMkZ0VFRYZDJmNU5lV0VWVFdtZnI0WGVW?=
 =?utf-8?B?L0dzRm1JaTN0cTBmcDFoU3hKWW1GZEQ2Yjk4cDlDL2VFVzFXSXpsMS9WTVVj?=
 =?utf-8?B?d2JaZ3hGaS9pWUlDTTNHcFBTVDJTc3dxSXFybWE0dnFFN0VhRkE0YnlQalNO?=
 =?utf-8?B?dFMvbDZ3SmFyM1RkaGwvQVlnWlBNTnhRR01VNG1USTdkZE04NFJwYnBaMXBQ?=
 =?utf-8?B?MjdmT2plaGxsajBiT2ZLVVVEMHEzOCtBSTFqeUJ4TzkySWViR2QzUVc1Q24w?=
 =?utf-8?B?MFgzQUhmak5nS3NNTTc0NXZaUVI0RjlVSWlyWDF3c2hkNm94RHk2bnJicUpB?=
 =?utf-8?B?d3BrMHRXMmdFdkhveURVSHRNdEN1U2dPRVJhdW1NT1pwVWdZbmJaYkVXWkxr?=
 =?utf-8?B?ZmxnVVZJK3YvWGNlZ21aeTVrWDNhdUczUzhtQjg4V01hQ2dySWgxNlh3V2lN?=
 =?utf-8?B?STVySnlLUHpHM2xlbnlqRzJ1OGhBdjlJM1lIU0RoM1pnVUNzY1FtclloZlVh?=
 =?utf-8?B?c0J2TzdTRkNJQzNGZW42c3N0VUtGVno2ODhkUkg4UDR1WHBUbzVGN3pGUEM5?=
 =?utf-8?B?QzF4Z1Zxc2s5RDRoc0VNQ1QzZzhaZXdyRmwvM25MK25LL29CWVg1RFpib2U5?=
 =?utf-8?B?cDV2VnlqaFFkY0l0Qk44TE5zd2t2ejY1aVUwb3RTNlhFQm52WmExeVJRRWhZ?=
 =?utf-8?B?YkY2RFZkUnBIZUZiUEpXVHJWWTBZV3E2QTJMNkFNV2djdW5PaC9MbVVCMGR3?=
 =?utf-8?B?MDNtYWNtaWF4V2dnUkpPUmdJNmZlSE5KTmxOeUUyMmhXdTRYalF4UTd3YVQ4?=
 =?utf-8?Q?crWALU70OYdHYTtyPwiBcd+bf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596b9fc8-b8a7-404e-f464-08dd7c1c7398
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 12:52:59.9193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWc73h/F7NfXF0+puKTT8MR9t9eB/twMB/yxrOPSareH/HvMGVM+eETkgDav1qEA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7554
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

Am 15.04.25 um 14:40 schrieb Thomas Zimmermann:
> Hi
>
> Am 15.04.25 um 14:19 schrieb Christian König:
>> Am 15.04.25 um 12:45 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> Am 15.04.25 um 11:39 schrieb Christian König:
>>>> Am 15.04.25 um 11:20 schrieb Thomas Zimmermann:
>>>>> Test struct drm_gem_object.import_attach to detect imported objects
>>>>> during cleanup. At that point, the imported DMA buffer might have
>>>>> already been released and the dma_buf field is NULL. The object's
>>>>> free callback then does a cleanup as for native objects.
>>>> I don't think that this is a good idea.
>>>>
>>>> The DMA-buf is separately reference counted through the import attachment.
>>> I understand that it's not ideal, but testing for import_attach to be set is what we currently do throughout drivers. Putting this behind an interface is already a step forward.
>>>
>>>>> Happens for calls to drm_mode_destroy_dumb_ioctl() that eventually
>>>>> clear the dma_buf field in drm_gem_object_exported_dma_buf_free().
>>>> That is for exported DMA-buf and should *NEVER* be used for imported ones.
>>> Did you look at the discussion at the Closes tag? Where else could dma-buf be cleared?
>> Yeah, I've seen that. The solution is just completely wrong.
>>
>> See for the export case obj->dma_buf points to the exported DMA-buf and causes a circle dependency when not set to NULL when the last handle is released.
>>
>> But for the import case obj->dma_buf is actually not that relevant. Instead obj->import_attach->dma_buf should be used.
>
> So if I understand correctly, the tests in that helper should be done by looking at import_attach->dma_buf.

At least in theory yes. IIRC we also set obj->dma_buf to the same value as import_attach->dma_buf for convenient so that code doesn't need to check both.

But it can be that obj->dma_buf is already NULL while the import attachment is still in the process of being cleaned up. So there are a couple of cases where we have to look at obj->import_attach->dma_buf.

> The long-term goal is to make import_attach optional because its setup requires a DMA-capable device.

HUI WHAT?

Dmitry and I put quite some effort into being able to create an import_attach without the requirement to have a DMA-capable device.

The last puzzle piece of that landed a month ago in the form of this patch here:

commit b72f66f22c0e39ae6684c43fead774c13db24e73
Author: Christian König <christian.koenig@amd.com>
Date:   Tue Feb 11 17:20:53 2025 +0100

    dma-buf: drop caching of sg_tables
    
    That was purely for the transition from static to dynamic dma-buf
    handling and can be removed again now.
    
    Signed-off-by: Christian König <christian.koenig@amd.com>
    Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
    Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20250211163109.12200-5-christian.koenig@amd.com

When you don't create an import attachment the exporter wouldn't know that his buffer is actually used which is usually a quite bad idea.

This is for devices who only want to do a vmap of the buffer, isn't it?

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
>>> Best regards
>>> Thomas
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
>>>>> Reported-by: Andy Yan <andyshrk@163.com>
>>>>> Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
>>>>> Tested-by: Andy Yan <andyshrk@163.com>
>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Cc: Anusha Srivatsa <asrivats@redhat.com>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>> Cc: linux-media@vger.kernel.org
>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>> ---
>>>>>    include/drm/drm_gem.h | 8 +++++++-
>>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>> index 9b71f7a9f3f8..f09b8afcf86d 100644
>>>>> --- a/include/drm/drm_gem.h
>>>>> +++ b/include/drm/drm_gem.h
>>>>> @@ -589,7 +589,13 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
>>>>>    static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>>>>>    {
>>>>>        /* The dma-buf's priv field points to the original GEM object. */
>>>>> -    return obj->dma_buf && (obj->dma_buf->priv != obj);
>>>>> +    return (obj->dma_buf && (obj->dma_buf->priv != obj)) ||
>>>>> +           /*
>>>>> +        * TODO: During object release, the dma-buf might already
>>>>> +        *       be gone. For now keep testing import_attach, but
>>>>> +        *       this should be removed at some point.
>>>>> +        */
>>>>> +           obj->import_attach;
>>>>>    }
>>>>>      #ifdef CONFIG_LOCKDEP
>

