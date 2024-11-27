Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1769DA866
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 14:21:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD07910EAC9;
	Wed, 27 Nov 2024 13:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yYP8yt5U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0822D10EAC9;
 Wed, 27 Nov 2024 13:21:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkWiZ6xnaljuIRPTsR31P9zQFeoiij3fBLz93htPc84+IR5RNzkDxoWv21JnnvDqdLzHnu9uXS0P/NPqi8N9Oa3mLJUIk7Qp7/FRivmd4WLgnezhZmJS+CcFP1CTajsRWXS7MWWHIegnJ6FBB9nBqUiczKkQIhJMeS3qDciKGsIuF25AANUVsa+dNncCvXyvaiKCK8/Ph7Tl2bKIC+VGQJ2W9bg010lktqDcE1uZApIVJ3bzNSkWCyULZRhXLq8YHzuNf2Lw6rZzti5W/NQnBtswklYb71yScNSNGQNZ2kDij3O6mm+qcHs/sZWN/aMeGtvRhRnrQzCUY2ySCc9JbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtFEv7urqDHh8ukNZaEI7687wJiNwjxb6JJzQg+13yg=;
 b=rIToAo6Iih9hT0XH1oEshf+0LiKnoIuQzyIJ+lbNsWcQPWtDgXg8Ye83AV0WBuVkMqDi3EHjno469C40cbHwj1BWwqNudzae43LlLW75wFHKAdO3I40p7C0pUm4ir2F7g39rESkeE40GRt3paj4H30sxg76YGgHjALb7bBm9+l5G8Q+oNBx2ox1CSbk6V+KcrPzdgBdkrpdW07bsqxveMeq2F41mUbtRxSZwsOf2xvEuOyLvTMEVw/WNxfViRtVA8kXyTrfaJlRX5pdqPll2pj6+e4KQHuwXcy9xKr6Ea7KgZwGy37miu3Nlp17tw6uZjgCcxy4/Zbvtgykd5xuuaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtFEv7urqDHh8ukNZaEI7687wJiNwjxb6JJzQg+13yg=;
 b=yYP8yt5U1LM2Px2YPCCqfqurYZta1SxniFQoAgQ7hqOx7VHq0BVNb4ujv2QuZlAjzpSCoZwKS+DHWfojvUN/K/b3K626gIIGuw8e7Jv6PDtoYtpjC+N5451dKbrzqtzId6zTIcOU3zw7/9USw8UEpSEoqwTPTltveeX4HB8uzQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7926.namprd12.prod.outlook.com (2603:10b6:8:14a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 13:21:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 13:21:30 +0000
Message-ID: <cb1d2f9b-513d-4aab-8a59-1cb2ee7c5ba9@amd.com>
Date: Wed, 27 Nov 2024 14:21:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
References: <c62e5298-1ca6-4cd0-a558-3d2a91175fa0@amd.com>
 <d469ab3509a1b875ad0c44d01569675682d6c61c.camel@linux.intel.com>
 <6ab9e754-6f4a-48ec-b143-02585bc40291@amd.com>
 <5a16ef4ff06a530c52df7633833db19aaa15b33e.camel@linux.intel.com>
 <8d17a8a2-9a44-4f80-92b5-a8aa3efe6bf2@amd.com>
 <ZzeSr5ut6GVEwSJY@lstrano-desk.jf.intel.com>
 <Z0SX8WJCPADGLVE5@lstrano-desk.jf.intel.com>
 <634b07dd-aa5a-410e-8f62-0a96567c7932@amd.com>
 <Z0SzddLDzR8NDWmV@lstrano-desk.jf.intel.com>
 <18681d07-beb4-41c5-a935-11b8ec231c27@gmail.com>
 <Z0YKIGToB3pE+uZz@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z0YKIGToB3pE+uZz@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0239.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 04cf5238-3e68-4c64-37fa-08dd0ee667d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OElRdTJHQk81UEVkYjN2ZkxQS1hON2YvOXBQZlpKU3M5RGNpVGxwUXdNelhV?=
 =?utf-8?B?S2I4ZlJ6S1p1djA1dEU0aWp4dXBOUFVDZ285MjJpSkc3cXVrQTZRUDJtWkJq?=
 =?utf-8?B?VmhoRlF4bEppNks1c2VWM0duMjgvdVF4aUdhK00xZzkzUTZ3aVl5K2xQeDJD?=
 =?utf-8?B?RzhDRzkyS0ZvZ2EvbmgvZWxKckVVOVVOVXVEcGQwZVNFMWUwdVBER0R2Qnd5?=
 =?utf-8?B?T2hEZlcxdlhjUWlPZ2lyL3Y4cmliRXErSmpsOTcveUxrK0JaSFl6V2labjI2?=
 =?utf-8?B?NW01Q0pSczhCZTdnNW5JbVN2aWFQTUNpVWpuVjYzWkZZM3g3ZWtqS2FIc1lF?=
 =?utf-8?B?czd2QzA2cndmZHJNNURSZi9aYmlvdGMxQXA0NURuUTA4aFBkMGkwZm5Xa3Vt?=
 =?utf-8?B?dGt2M1NKbWZBODVYNnh6cUZ4YXpWeTFpbUxxcXpuY0tvQW9WVno0R08vWm0x?=
 =?utf-8?B?VUozWGVFNW9vT1RZNnNVbVBJSWtJS2h5Mk55WXhNN0JPT1BFOXBRd0cwYUNH?=
 =?utf-8?B?UUFuUjVlNVgvQVZwRFA0a00wVzZJWDFrKzFiTVZJd3lzdWh3SmZKKy9QTDA2?=
 =?utf-8?B?TTRoc1BJV0ltakJlTnVDbFZhQVI0QlRzenB2UjU4UnpWNmF6aVRyYXZBRTZB?=
 =?utf-8?B?TVIzUmxPZmoyR2t1Z1NLTVR3R2NiRVEwYkJVb3gwajZCYmdnRzJTNGlMSUE0?=
 =?utf-8?B?R1A4QTEzeGZ5MzFoemU5bHA1NVp2TGl2M1Z1Yk5GOVRyR2M4a3pzSXJ4eFQv?=
 =?utf-8?B?eWVBM3duNlQvKzNXZ1NEU3pnOTVqYnRCK2hXZ1pocEl1a2tRbkxDK1BnTTRH?=
 =?utf-8?B?QThhdDZsODJvRkFWQUc2ejZnaXRyUE80MzMwdjVoS00rNnVNSFptU0ZKRE8x?=
 =?utf-8?B?MmQ1UWl5MkU0Rlc2cjhNelNHM1RVb1BSV3oxTTIzZkd0dXFpTkRRNzk5NUY1?=
 =?utf-8?B?NnVubDV3RlJjcEhtQVN4N3JOWkhLN1VMTTBLNFVTbElmQjNRY1d4dEZHNEpr?=
 =?utf-8?B?dTNVZWljUkRMY3VqQWdCSDV4L3RYZ2lBbVFvU1lBTE8wcmpJMEM3OU1LZzdC?=
 =?utf-8?B?b2F4Z3ZMV2pjVVVKb2FKVTZyTVFYTU1tSWIwKzRRcFlQbk1NQXJ4bTN2Mi9T?=
 =?utf-8?B?LzlFWHBwTXNvUjlLaGZsZnp6Z25xWmo0MU1DR0FwRy9lbG0xSVVLTFVLWVRl?=
 =?utf-8?B?aklOVlpCcUM3UkxsNHZXKzd5dWVlc2MvQkt3VlpZN0lQaTNrUFlGM0E3NnRw?=
 =?utf-8?B?MzV1Ty9SNlk1TWluZjBVZk1oRE9JZmNkT09tMWwwMEE2Y0o5SGltSHVnRzhL?=
 =?utf-8?B?cDAxUjNpK0I3VklxNUh2T0MvRUMyZkdUWkcxdkN1c0VzQjJZdHkwbU96a2RZ?=
 =?utf-8?B?a0hrRWt0QnZmbnRIblR1bnRrR0hYNXp0b2s2eHRnZURjMlNwUVJMeVhud0lr?=
 =?utf-8?B?elh3RG1NUmgzYUtLS2hqcWNnQUJ2NkJnZmp3NUxPRURaOUdQTjJibFVyK20r?=
 =?utf-8?B?R0FnRTVCNGpRbUZ2b3BEMUcyaXR6ZzZGcTQwMzMyOFpNNlVHbW0rU1gyL2ZC?=
 =?utf-8?B?a2QxUlZhZ1o0VytTbGdQd2E5WlF0S1hRbGlPTW1IRmhrRTdJUmljU1pIZHBP?=
 =?utf-8?B?cUh0bUsxUDltR0xLb3pTYVJ4Snk3WUZreTJWSXJCakozQTZUTE4wYmRhUnJX?=
 =?utf-8?B?cmo1ckhXZ25WYWMyaStPdXhIK1pTaDhqQUVldzNyZnFocC9FT2lvTUV6b1lJ?=
 =?utf-8?B?SWlhb2N5SzJMNFRCUlZuTWVGcFJVRWpBV052elpVODJlb2lLOG5UajYveDZj?=
 =?utf-8?B?R0pPMzY4cktZeDVqMUtsZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anV5Z0JlYTB2MGtmWXBNa2ttK0ZBWkNJc01wRU5PaVA1bERpN0NPc1VyUllO?=
 =?utf-8?B?V0xFL1lrRGZlMGM1OHBESVhnZHNkY0tYRUNIRDBKR1RTd2ZSZTBpTVQ4WjFC?=
 =?utf-8?B?WUl4VERhL1A1N1FtK3VQMU80RjFnYWdadEsxOThkaFFrRVNXaE8zWjJmUDMx?=
 =?utf-8?B?UHh0UzV0WUhNRlRQOTNwSU5LVFIzbWcwa1M0dkJyaE53U3pnYjRIMkpDa014?=
 =?utf-8?B?d3I4WHIzRGlYYm1TNFRYNzdIa0E2Y1FhbVhBeDZXazVGdVp3d3o2aldPVHJU?=
 =?utf-8?B?Nnp2WGZhNU9CRXZFVkgvQUhxWXdJQU9RNERFUW5HSGF1ckFpZitka2tBMEJC?=
 =?utf-8?B?V1hUbkJmR1BvZE5sVDNweTZxa3ZXWDdhM0xuckVYT0lpY0dneldtL3gwTWZG?=
 =?utf-8?B?L0g5MVMwRE1PL002TFgwZTI3T0ZhOTB1Y2RjWURYd2xvTmppaVpzS1dVbldG?=
 =?utf-8?B?dXlRSzArR3ZTNWI0dUZVSnVDaHZvd3NsdU1DVFhCeUluc1hnaWFZQUVpemVr?=
 =?utf-8?B?SW1XeGJCKzVkRnlDdmlOTi9oMzVtaDZ5MzlNQW0wYzF0SzBkakh5WDVxQlkv?=
 =?utf-8?B?YkxGVGh5bHNpQTd2NDdMeUdJUXV1YnBpYW54aS9LM205QU5ITEJIMW5FdE9G?=
 =?utf-8?B?V3VNTWYvK3lxYjRhemMwQXlPa083QUZuM0lnWVdIYW5oVHNkQk80Slo1WC9p?=
 =?utf-8?B?NnRBalNQMDU2Z0tuQ0o4UEtiakQ5bkNYVlQrNVRvcFZrV2hnWkRWeDBGWWdx?=
 =?utf-8?B?b21Ba2p4OTVNMFFwZTVRb2t1N0NpVHNHQjNjaWtpdFJUS0FiTFptaGRQazcr?=
 =?utf-8?B?S0gvbWpjTGdBRFRHSGhMUHk2cFBUR3VUeGZublViQTJnaGtLaFBzZjBndDM1?=
 =?utf-8?B?OTZQL09BeHlYUTAzMytrYnZCa25FMncwQWRKMVlSNTdwSHhiVDlIK2xxc1RF?=
 =?utf-8?B?TEd4NTVUZmlLNzArNThQcDlLK01rL1ZjTUtiZTZYS2hOWTNMWElvTmpTOUNh?=
 =?utf-8?B?dVMyMUpacGtrY1ZBeGxreW9uZHREV1FCTVBKZTJqOTNVUnlPSFA5NEUyQlE2?=
 =?utf-8?B?VmtWNCtYTFdRdlU5QkJMa0ZydnE0SVMrOENBdlV0SzNZS3o1bHo3UExDNzYy?=
 =?utf-8?B?bXlXZE9IUkpkSXpCU1l1bHVMdjN3cHdUTEtQL25qZ2hhNTJUTGdacXhZNC9Z?=
 =?utf-8?B?NWFrNVVNbXJzVE84RWtuanFITWR5c1M1WnZyTzNTdTJ4K0lXcWdmMlR0SXBW?=
 =?utf-8?B?NUxIRnR3ZjdmRlZ4M0Rkb0ZEV2k2c2NVVnVnajQ5bWNJbHhzdXN6elQ5d3pK?=
 =?utf-8?B?TDU3aFVJNXpBc2hmWU1OTThHUFExc3djSmo4YnREcCtPU25HS3Aya2t6UUEy?=
 =?utf-8?B?Zlp6OGo4U3VvRGhsSE55eVhPRWR4ZjFmRHZXTFhJb21PYVVpZHQ4bzh4RkRZ?=
 =?utf-8?B?MjRBWHd3cmNvRDhiM3RtWXNSVzRpRGFwS1hiakNtWi93QnFUcy83dWdxWFVi?=
 =?utf-8?B?clVDR2tZaStwQk1KcW93REsydVdsVjhHc1cvUGExTW5uaVliWGJkK285RU9s?=
 =?utf-8?B?ZmVvb0wwY0lyc0NHS3pwUmtucnJOUzFTSlZidVA4MWZJbVU1dVVzdUFMMlZl?=
 =?utf-8?B?SjNvRTJLcVhKTlIzK00yYzJGY1lNSW5oSXovQWVnQzRLSU9na2RKZVo4aS9r?=
 =?utf-8?B?M1V5MW03QW1taTlSUlY3M2JFeXVKUk4xcEM3bTA5cHNZSnRXR2xBcGlQclly?=
 =?utf-8?B?OENZYy8wQzBVYUdzZ2hPck56cTJkT1Z5OCtPRkNpYjhmblc4S1BQQnF1YW9E?=
 =?utf-8?B?dXZKRXBBWEhCclZwdmZBS0R2ZjNkWkpERjZqYWgybVJoR3BwMUZIMERkQjZo?=
 =?utf-8?B?bkxLcWZTMkdRTVpjdU1qdU1Zem4zdzNVOFhQK3NocmRZb3hwQ3RGVU5hNGUr?=
 =?utf-8?B?Q01KRFo4TzhYL25uSkJtRDR0dlNvSHR3TVNGaUFtQ05GejBMSjVBWDVFc3lK?=
 =?utf-8?B?S1U0WnNaU01tc1pnRVd5NktaN3FWZEF4b2pjMVRKZWVOV2NJdjF6WlZMalZX?=
 =?utf-8?B?SDcydnh4SlUwSTZGKzVYN3JwNnJEcEZjdi80bkdMZWIra21VSTdDZ0IyZzNB?=
 =?utf-8?Q?m/Ftt1b0X/+/kg+OKtA5u62Gg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cf5238-3e68-4c64-37fa-08dd0ee667d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 13:21:30.6510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDK6cWcjKalxa0xSlnWL2JsiFqxtoFNAYW2v44l32Y+1TkyIF3uhg8hWRivTdomG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7926
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

Am 26.11.24 um 18:49 schrieb Matthew Brost:
> On Tue, Nov 26, 2024 at 09:19:47AM +0100, Christian König wrote:
>> Am 25.11.24 um 18:27 schrieb Matthew Brost:
>>> On Mon, Nov 25, 2024 at 05:19:54PM +0100, Christian König wrote:
>>>> Am 25.11.24 um 16:29 schrieb Matthew Brost:
>>>>> On Fri, Nov 15, 2024 at 10:27:59AM -0800, Matthew Brost wrote:
>>>>>> [SNIP]
>>>>>> We use this interface to read a BO marked with a dumpable flag during a
>>>>>> GPU hang in our error capture code. This is an internal KMD feature, not
>>>>>> directly exposed to user space. Would adding this helper be acceptable
>>>>>> for this use case? I can add kernel indicating the current restrictions
>>>>>> of the helper (do not directly expose to user space) too if that would
>>>>>> help.
>>>>>>
>>>>> Christian - ping on above.
>>>> Sorry, I will try to give those mailing list tasks a bit more time in before
>>>> the xmas holidays.
>>>>
>>>> That is an acceptable use case, but the problem is that this helper won't
>>>> work for that.
>>>>
>>>> See during a GPU hang you can't lock BOs, so how do you want to look into
>>>> their content with the peek helper?
>>>>
>>> Agree we cannot lock BO directly in GPU hang path (TDR). Our error
>>> capture code takes a snapshot of some the GPU state which is small and
>>> safe to capture in TDR and kicks a worker which opportunistically
>>> captures the VM state which has been marked to be captured. This is
>>> where the helper is called and it is safe to lock the BO.
>> Yeah that sounds like it should work.
>>
>> No objections from my side for that use case, but I would rather like to
>> keep the code inside ttm_bo_vm.c.
>>
> Thanks, reposted with code inside ttm_bo_vm.c. Any objection to merging
> entire series through drm-xe-next and then backporting single TTM patch
> drm-misc-next?

No need for a backport as long as nobody in drm-misc-next depends on that.

As far as I can see the change is small enough to not cause any 
conflicts, so merging through drm-xe-next is fine with me.

Christian.

>
> Matt
>
>> Crash dumping is usually something associated with the VMA even if it's a
>> bit special here for the VM state.
>>
>> Regards,
>> Christian.
>>
>>> Matt
>>>
>>>> The only thing you could potentially do is to trylock the BO and then dump,
>>>> but that would most likely be a bit unreliable.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>> Matt

