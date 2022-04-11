Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26BC4FBC48
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 14:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5B710E348;
	Mon, 11 Apr 2022 12:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704B510E10D;
 Mon, 11 Apr 2022 12:40:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9/j9rT4+u9cldV1cMNKShBFK1ThHnq9IsLJP+HwzrnhiFKQ3LFLxOxftqQ2dkvVPrCcAmVIjm2FVfDIuk++hPxGFrUtdyxTraOlimX03ie4x5t/19aggc2FbC5HC2XfZye3yuuWfogBjk2VgZmJpt6uX/PCKNMYHkPAe5JkYA7c4IZDj6/L4UB42s5FxwmgrTVxx+M3mPJQVD92Ulh+KPRWp3UF+LOZ22y82pDTqKbTXOkXOf74lNgKkdwIMM7ax/tq3mpMohV8hxIrt/1nphDsYv+Ot8CcPArMt+ZFLL11Lq0YUI2Koa0wJalSCdEgv5pD97iFns/igi0SewnwWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFHybF+EB+2PosEJSn+r9FWTgYhwm5SwnljL2pnGGqQ=;
 b=dUpweOZSZkKsWVh3n73JALkO2y40GnOw6Mf6MO9ug26EgfcutFn6Eb2PGYwClq9LBq5vnIV4exJcC2XhTBS79BbEhOw6c8NTqu+2E/kZivddwf7FI1kbHSlClE+btD5qCuPRKJczrtMJI7HSJ6dYkCil4mxco/yVDPhW116jSWBQZBnPk2hAB/ORCoi8vtUHijOubpzJIKvS/beUi3ybDRktzle6TejPq/TByU7pBVM59Mkf7Rjne9yUZxiMvMk0CQ9LC4UOfMkYhU1C9pQuiIqTA3Ngm18qiQM1ldp4+bakgSADK9F0GK0ioUnybh4YlEKDp9WuRGnqudp4IJQ7dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFHybF+EB+2PosEJSn+r9FWTgYhwm5SwnljL2pnGGqQ=;
 b=PBogoTZONropwkhowMKWy+iPJ0mKLlEVnPMMGX8RfaxSRnsf6BCJj9nIj4ZEaXQqSRhC2Chl7PL9MjadedZQx9Jp+LRlukRKJ/4T70trotvvK8Whd/oIvOW9oZIgIhgsdrvn92iE5yCd0DO0RmNKlZQy+kNcEx88Kp+vuEtyiqw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR1201MB0158.namprd12.prod.outlook.com (2603:10b6:301:56::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 12:40:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 12:40:04 +0000
Message-ID: <83a5b082-32f4-a6c2-d3b7-a4253b47a529@amd.com>
Date: Mon, 11 Apr 2022 14:39:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/ttm: stop passing NULL fence in
 ttm_bo_move_sync_cleanup
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220411085603.58156-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220411085603.58156-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ce2e72c-300d-4b7c-cbaf-08da1bb866ec
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0158:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0158A94A3A947121A6AAC32583EA9@MWHPR1201MB0158.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n9fWAy6WI0Oeqx+YKH2SAP7l61EvAwf8dWPz0Qv6Z2rV66UsQc/RJL47xPRF06R7Y/WbVtsgCCiPOtqPtBix/Bkfic4t+ZPDYh160dkae6gdCjaGXD5s5OjTyrFzA7kfkcNFTnb0nHA7gu4s1FaRoGmYV9LFEof2iNrSvBvBZiTWDtAwA3PLaq41dn7YBQC5qIsbNTpEU7+CT/mbNeF4EP3b7DH1hcpUQuKUltfqTwjYSehxCt5Ds3Y5SgxNOz4jQsDD6dKmGqMx8wzDAgP6sUhUCMBygoqrZ5nbBh0RdixiQGiB2k1pGtYkp9+RCc7OYSwk9CqHQYjUX7WETyrwXs5iO/SKueAPaWjvvKqEbp6eVYG45NlQbpar4EQ68LnnvOdvAK9yXvCX3Yfgfg4XrsQzHVio6vrybf3uQD/1K0gGxwtuO1vnJkZgG41/0AxlrJmfN3xVhUdq1eMVAMUEAOzL7FFkndkqITWI4tJ7Q+8A3cXe5jbySjslZBo8RWZtFfX5VS4B2x73490J+gSi/FJC/+rRCGLcB6eD8jyin1vtliitIzms9eug6yXqDvrvllyKnrd5rbpdUjWdEhPs/x4wXL9fmePL0L6KU4nxkqcq8+cHNWNPSl6qOzU3brQn9Mqi0S712wE0XmoUU9Z1bVwIcN7jeRUd+DonZmygWzv1qcdX5HKvsBmN01l/4PYdbu8wi6HHZhSkau6em84BEGiEUyopBEqCpO9WJ2gzU3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(54906003)(2616005)(5660300002)(8676002)(508600001)(4326008)(316002)(6486002)(83380400001)(8936002)(86362001)(6506007)(186003)(2906002)(36756003)(31696002)(66476007)(31686004)(66556008)(66574015)(66946007)(6512007)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmdxQ0svcndhVHhhb1Evbjg3ZmJmTU5seCtDNExlVUdkNUJaLy9yWEFocDU3?=
 =?utf-8?B?c21Ud3JiaEwwUTY1Z094cTVVd1dwZDViOWd1RUVWcGxXUWl1RUZOc2Qza005?=
 =?utf-8?B?ZFdGOVNsNUFVVnNLbm1nMTJwVi9HL0t6VklBQmtOaTNhemhVSnhvOEtPMCtk?=
 =?utf-8?B?OUxhZ0lTN0M3VHIyWXlucU00VlN2bm1TeDFraVpZbmk3RitnNmhrSGJNWXBU?=
 =?utf-8?B?MDcxTkhoZGtNSUphWStNWUp2OXRsaWQ4ZG9hK1dpQlp2ZndLcFVLSWZST04r?=
 =?utf-8?B?ZXRJZG5mejd5LzRMUkFrN1diTWFkb0NMOS9pbFlVMGdLbG5STDl1VFlTa09k?=
 =?utf-8?B?Nkc5eVExWEdwVlV4RnYrei9UbW5UTXI2VFJ4TGZHSlNROU5wT1FRY0U2VEd6?=
 =?utf-8?B?b0dhMFpsc2NIUzdXVTZveVZTVXdJYjVrOFlPUXFKR0Z4S1ZhN2hwd3F6K1pI?=
 =?utf-8?B?OVRUSEVEUjdQMlI3YUtkTGIxRDJDZGppa3ZBSit2dTVZNXNrTlJOUHdDaU8v?=
 =?utf-8?B?Z2NZa1FFY0JZNHRUcXBZU3hacXczNlFLRUZZMFdvbHEzU1pKZmFuTisvbGls?=
 =?utf-8?B?eklHc2VobGNISmJHSmJmNXp4S3FJOVJONmE2ZTByRC9keFRaNFIrY0o0Tjh1?=
 =?utf-8?B?dWhyUFJBL2Z2am1xaDNsYStrUjNpRHMxTkI4VEZIS1BqQ09UcXZFbktMcWI5?=
 =?utf-8?B?ZXIzYXFPN1RsT1Q1ZHFqbjBNRVFoSk15TmQ4eTdZRXRiU3BuSnMyanhTVDdD?=
 =?utf-8?B?YnQ1cHNVTHZqcWNJei9yVG44bk5kV0h1SWNwR1hydFgwRFZZb3hFQ1JzQlFZ?=
 =?utf-8?B?R0hpdDdzU2pNQVJSd09OQUw1UWFyL250ZnVWNjJqYnFESnQ2MmVyK1hMbHBt?=
 =?utf-8?B?YXJhU0p4U1lDK1EzNUR6c3lmRklkZjBFZFA3MHZ5RFVFUmZVMXc3YjhXYlRC?=
 =?utf-8?B?QUxLZHdONGJuelR0NEpobjlFaFVYU1lSYTFFc0hzSDk0ODl3T1JyMEdRaE8w?=
 =?utf-8?B?a2licG5kZDlHSnlYY0Y2WVRnRGRwUktpc2lRcEU3TEhnSDU5di8vbWhiWEFR?=
 =?utf-8?B?b09XazlpT0JjY0RRVFRMN0Q0N1hIdFdqN0w0S1ByK2ZqTnZwTy9ML1NpVUw5?=
 =?utf-8?B?WnRPN2dMdCs4K1RqTWlRcnBoQ0ZFdHVZL1hyMWNrRkRoNmQ3VFZ1Z1hiZFNk?=
 =?utf-8?B?OHlIWGN1eHlSbVpYNFBmallHa2ZubW1NVjVpNEF6NitGVUMybktiRDNSMUVX?=
 =?utf-8?B?SDZ4YXhtT1JwdmlReXhOSkNFODJzR1pNYVdXWXJCTWtUKzUyTk90WHpNb0s4?=
 =?utf-8?B?aU1iMEYrcERCb3F6TWhQTGZNR3JqM2RMNzd2bnJUSkhWLys1dHlkOVkrN0s2?=
 =?utf-8?B?S3FpZ2JVVk5KSlFCWlczREgydURsUUxHZ2dJLzRCTTdneVl0YUJ0RFREODND?=
 =?utf-8?B?SmN0aStxd3Q0UGZYQ010bWp5TWU0TjF3aVRFanFQNEtBNWthOG5QSXFFU2xM?=
 =?utf-8?B?a2o1U3RyTU42Z1BEVlQ3R2Jqb3dqR0hUTWZJR2ZTbTRPcE1yb1g1LzJYUVFP?=
 =?utf-8?B?L1FqN2lla1FNRHI2Vlc0Unhpck9reVFyVlVDTVZYMVJObE1QWE8xU0NDSHNa?=
 =?utf-8?B?Vnp3MndUamJFaUhPckZTK28zTWZRWUFyT3gvMHp1QWlCb2k5L1VHS01oOUhl?=
 =?utf-8?B?WFBrcFhoaHBvbnVaaG9CbmVJbC83bERRS2VMYXBVQjlTcWVoaVpaSG1EYW1O?=
 =?utf-8?B?UTZxS2VVdDROTlpPcDE0OVJ6cGkxMUlKcDZUU2hZS1MySExjWFpqTDB6bUV4?=
 =?utf-8?B?cU5BOGZ1WlVWY3grSCsxUEVtUDYzcW5yNldTNmtXZkpta3JuVFF3RGhnM2w2?=
 =?utf-8?B?RTRoYmpHdlpRam03dXorWk5HQjIvb0VuQXl2Q2VZUFMvL3JXVlBZcEVCRUpL?=
 =?utf-8?B?aXNIVHNkVUsvbWpSQXZKZFRkc2ZPMjVaMGVNdUdmTk1wSzhucktOd1JhTjlB?=
 =?utf-8?B?Z3k3eGtCUGFoSjJ4dVN0dFducmx3Q0Z6dElLWG1RU3lJT3VVT1RBSXgvMThF?=
 =?utf-8?B?NWhZemRRZ2ZtZURXQ05nZHo1cWdIVUdGaDRhek5JQUVzSUppWUZtRnJGd2lk?=
 =?utf-8?B?TkNuY1dxQ1BJUWJjUWlRMnJoVmZIVDNET3YvdW1jMy9KOHc2SlFmZjNLcWN2?=
 =?utf-8?B?MVJDTHJnT3hTOHkwTkNFMGtraW9DbTJLUTNJbytJbkZCNzhEZldHOUFFazRO?=
 =?utf-8?B?cGJseVI2eWQ1K2d2QW5nb0lEMk5VaXNsVTc4RThpOGozbVk4UWRuME9ZdXhW?=
 =?utf-8?B?MGFiSnlvZFFhRk93Mi9OMGNrUzFucytBRUg3SDh6NStjcVY3Um5VSTJsRHYz?=
 =?utf-8?Q?FFNnPqOACUCSiafIkxsagIKxWiGY3fB46FVqigCQ6n8iP?=
X-MS-Exchange-AntiSpam-MessageData-1: EQVdmxVKYKnQJw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce2e72c-300d-4b7c-cbaf-08da1bb866ec
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 12:40:04.3104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqvOaVGctarBA9F41FF/nzKBm5d50U/1denUAr+YWggAmMOJF7lXlzmhnMV/3/hh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0158
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.04.22 um 10:56 schrieb Matthew Auld:
> If we hit the sync case, like when skipping clearing for kernel internal
> objects, or when falling back to cpu clearing, like in i915, we end up
> trying to add a NULL fence, but with some recent changes in this area
> this now just results in NULL deref in dma_resv_add_fence:
>
> <1>[    5.466383] BUG: kernel NULL pointer dereference, address: 0000000000000008
> <1>[    5.466384] #PF: supervisor read access in kernel mode
> <1>[    5.466385] #PF: error_code(0x0000) - not-present page
> <6>[    5.466386] PGD 0 P4D 0
> <4>[    5.466387] Oops: 0000 [#1] PREEMPT SMP NOPTI
> <4>[    5.466389] CPU: 5 PID: 267 Comm: modprobe Not tainted 5.18.0-rc2-CI-CI_DRM_11481+ #1
> <4>[    5.466391] RIP: 0010:dma_resv_add_fence+0x63/0x260
> <4>[    5.466395] Code: 38 85 c0 0f 84 df 01 00 00 0f 88 e8 01 00 00 83 c0 01 0f 88 df 01 00 00 8b 05 35 89 10 01 49 8d 5e 68 85 c0 0f 85 45 01 00 00 <48> 8b 45 08 48 3d c0 a5 0a 82 0f 84 5c 01 00 00 48 3d 60 a5 0a 82
> <4>[    5.466396] RSP: 0018:ffffc90000e974f8 EFLAGS: 00010202
> <4>[    5.466397] RAX: 0000000000000001 RBX: ffff888123e88b28 RCX: 00000000ffffffff
> <4>[    5.466398] RDX: 0000000000000001 RSI: ffffffff822e4f50 RDI: ffffffff8233f087
> <4>[    5.466399] RBP: 0000000000000000 R08: ffff8881313dbc80 R09: 0000000000000001
> <4>[    5.466399] R10: 0000000000000001 R11: 00000000da354294 R12: 0000000000000000
> <4>[    5.466400] R13: ffff88810927dc58 R14: ffff888123e88ac0 R15: ffff88810a88d600
> <4>[    5.466401] FS:  00007f5fa1193540(0000) GS:ffff88845d880000(0000) knlGS:0000000000000000
> <4>[    5.466402] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[    5.466402] CR2: 0000000000000008 CR3: 0000000106dd6003 CR4: 00000000003706e0
> <4>[    5.466403] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> <4>[    5.466404] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> <4>[    5.466404] Call Trace:
> <4>[    5.466405]  <TASK>
> <4>[    5.466406]  ttm_bo_move_accel_cleanup+0x62/0x270 [ttm]
> <4>[    5.466411]  ? i915_rsgt_from_buddy_resource+0x185/0x1e0 [i915]
> <4>[    5.466529]  i915_ttm_move+0xfd/0x430 [i915]
> <4>[    5.466833]  ? dma_resv_reserve_fences+0x4e/0x320
> <4>[    5.466836]  ? ttm_bo_add_move_fence.constprop.20+0xf7/0x140 [ttm]
> <4>[    5.466841]  ttm_bo_handle_move_mem+0xa1/0x140 [ttm]
> <4>[    5.466845]  ttm_bo_validate+0xee/0x160 [ttm]
> <4>[    5.466849]  __i915_ttm_get_pages+0x4f/0x210 [i915]
> <4>[    5.466976]  i915_ttm_get_pages+0xad/0x140 [i915]
> <4>[    5.467094]  ____i915_gem_object_get_pages+0x32/0xf0 [i915]
> <4>[    5.467210]  __i915_gem_object_get_pages+0x89/0xa0 [i915]
> <4>[    5.467323]  i915_vma_get_pages+0x114/0x1d0 [i915]
> <4>[    5.467446]  i915_vma_pin_ww+0xd3/0xa90 [i915]
> <4>[    5.467570]  i915_vma_pin.constprop.10+0x119/0x1b0 [i915]
> <4>[    5.467700]  ? __mutex_unlock_slowpath+0x3e/0x2b0
> <4>[    5.467704]  intel_alloc_initial_plane_obj.isra.6+0x1a9/0x390 [i915]
> <4>[    5.467833]  intel_crtc_initial_plane_config+0x83/0x340 [i915]
>
> In the ttm_bo_move_sync_cleanup() case it seems we only really care
> about calling ttm_bo_wait_free_node(), so let's instead just call that
> directly.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>

Ideally we wouldn't export that to drivers, but that's a different problem.

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 15 +++++++++++++++
>   include/drm/ttm/ttm_bo_driver.h   | 11 +++--------
>   2 files changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index bc5190340b9c..1cbfb00c1d65 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -572,6 +572,21 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>   }
>   EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
>   
> +void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
> +			      struct ttm_resource *new_mem)
> +{
> +	struct ttm_device *bdev = bo->bdev;
> +	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
> +	int ret;
> +
> +	ret = ttm_bo_wait_free_node(bo, man->use_tt);
> +	if (WARN_ON(ret))
> +		return;
> +
> +	ttm_bo_assign_mem(bo, new_mem);
> +}
> +EXPORT_SYMBOL(ttm_bo_move_sync_cleanup);
> +
>   /**
>    * ttm_bo_pipeline_gutting - purge the contents of a bo
>    * @bo: The buffer object
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 059a595e14e5..897b88f0bd59 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -245,7 +245,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>   			      struct ttm_resource *new_mem);
>   
>   /**
> - * ttm_bo_move_accel_cleanup.
> + * ttm_bo_move_sync_cleanup.
>    *
>    * @bo: A pointer to a struct ttm_buffer_object.
>    * @new_mem: struct ttm_resource indicating where to move.
> @@ -253,13 +253,8 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>    * Special case of ttm_bo_move_accel_cleanup where the bo is guaranteed
>    * by the caller to be idle. Typically used after memcpy buffer moves.
>    */
> -static inline void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
> -					    struct ttm_resource *new_mem)
> -{
> -	int ret = ttm_bo_move_accel_cleanup(bo, NULL, true, false, new_mem);
> -
> -	WARN_ON(ret);
> -}
> +void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
> +			      struct ttm_resource *new_mem);
>   
>   /**
>    * ttm_bo_pipeline_gutting.

