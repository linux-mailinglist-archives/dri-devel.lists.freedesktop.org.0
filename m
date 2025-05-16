Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DE9AB9ACC
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 13:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A33710E042;
	Fri, 16 May 2025 11:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QVyNt3NJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6845D10E042;
 Fri, 16 May 2025 11:12:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCHNOujuOp2QiT/nPvYLrAjCclb4Az1JWUpbq3226/cWGu6vlX4jToKTZ/Ab0le08J/0LZ/HooA7hrVN5ohLNiIm9bi3tpsfdGglQHagFO1s97UAVTxwVVjnY4u4W3nB+EtjEIYy1g2cueqBV/kk8PoaXSqvoGlBmFtTdc5pewUXz5BLaq4pXwOr+ZgDMu86IW13fz05kk+9tmSRUN7SgbNOUITKlIFzlN1a+ASqEDAtwe3lZkbkKiN9adgzEybu0TjFt2JkVPo2gXbZj7k2QpPaacfJ+n0gUt1YbgxmIWyLXAYTXkmsYL+PgyfD2RBW1n2Yw8ERnvqC1v8PWqXxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7L/xaS7AWrgAjSd6uFCL2kyGrQwyaixlCKQ0SeZArU=;
 b=d0SqqhtWkw/eqvKXdH92UznlypXaQjdeyHrBRaP6wE2dPzkLq7uX0fktZrueknDoxSukpUWbyuaVA14OmVtLNLCaw0zL0pgr2n+X8PwGLytREnGYT9UZyMs1ira27XbLPKHBv7fd0BGXcMgY9Cw8FaXsTJp4OT2HS/PkCN4QcYB5MsSmE/MVHm9XDP1wd+I6q+Fpl6qSe7vYnEHX8MXOrjx0hNsSvHz3/AXHQmfX6oVfUuCXicLiz4TYe1sdLZpTJVMbKTZ+bT87TGDmqgRxP7JnPk4a4129Q8tVkCdSaIp690yf+T5BBvWPjxSj+L6uCtzfiI8FKfCFAP63y5CIrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7L/xaS7AWrgAjSd6uFCL2kyGrQwyaixlCKQ0SeZArU=;
 b=QVyNt3NJOIaLgGS8NTjz4TD2g+6TkLTJ5KBRkHlAWwSOr5sC5t6e0xpyLs2YX52OjKeUrOl32xc0DSwW/C3tZzPBuM66R3N7d8cHCFtClIuMsW9MoW89IehSh0IUGn+EwxKI8edPiSIJebvE0LciAtHvSq3DpCTCG8IkHBLBvAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5819.namprd12.prod.outlook.com (2603:10b6:8:63::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 11:12:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 11:12:22 +0000
Message-ID: <bb99cd02-d647-4592-926a-223be19f7c95@amd.com>
Date: Fri, 16 May 2025 13:12:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: TTM evicting same-vm bos
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
References: <5f75b052edab8fbe643c58473992237748a6f861.camel@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5f75b052edab8fbe643c58473992237748a6f861.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::37) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: f6440538-7ad7-409b-86e0-08dd946a87ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGljb3UvWld0Q012NlpLUEpaT0xsbjBYVVlJUStLSDkwNmNyYUcrSVFPdEZS?=
 =?utf-8?B?L1p1b2owSC8wUEdKVldVVzdRWUFMdDV0WDJYUlNVUm5RUnhHNTQwRnNsOHR5?=
 =?utf-8?B?MlZLdTRIU3J5SlRaNFYrb1BsRU1zdEZnN3RSSjhXMjh0cThCaUl5TkVjaTh2?=
 =?utf-8?B?QlFYaTYyMFZaMktGTUlTTk1mN0ozLzRTSjQ1RWZGN1ZyRHBrMG5xcEtvc1hV?=
 =?utf-8?B?bG5xWWdVTXIyMGZ1VzdXZnA1bVhaZGorUVlqQ2dOTG95NER6RDE5Q1BVUnI4?=
 =?utf-8?B?Sjk0TTMwV3BVOXB1WCszalp2cmQrT0pQaTJKcSszWWZ4WjFlelJ3TllDejVY?=
 =?utf-8?B?NzZmZks2dHJxbENRWURCOXd2b09Eckw2ZjNtMmZ2NnE4N0ZsOWFQTFdUckN1?=
 =?utf-8?B?akwrOE11eFNUMjk0QjJ2emE5Q1BJbDN1OUgvZHJDem9BZmxQU0hFampzaW9N?=
 =?utf-8?B?ckFPU28yRnFQRE04Szhrb1cvYjhuWWFBcjlrRjZNbVozU2FSWW5wbjdaVnFV?=
 =?utf-8?B?WXpEZDYxMkhQaURmcXhMWTA1NU9Udk1tMmpQSDhmZzZTQkZxRTJnUGlBWm9j?=
 =?utf-8?B?NVU4OU5hUEVlMTQwSnVud2xRVnYwbVBEZlJHakMya0gzeWQraTZDMmI5STUy?=
 =?utf-8?B?UE9JeVdMWEJ0ejYybWljOGtta1prNUE0d2dvRHJTMTcwTFFkbmdmWE02QWxp?=
 =?utf-8?B?THNhQzg4VGN1a0N4RndCZlBsOHBXa1d3ejVYMmdZVFkvYjBrZG5YOG9NRFda?=
 =?utf-8?B?RDdPT1V5RFoxdmI0VStyVWNZZE0rbURWMmVUYzlGZGNKbGI2cS9RS0dKN0NM?=
 =?utf-8?B?UlJHWEZYOVhDZlMwQnkxWnhudmwxWnlBUzFNRTVaM2pkK2hKMmpyajYxR2Vn?=
 =?utf-8?B?QWVsckRZMENUaVhXRWdFNTlBZnNNVWtIaU9HcFlFKzlJNkJWSExuUlMzUlZJ?=
 =?utf-8?B?N1J2dzZZL0ZtSnVsQitPK3pmTFlTTE9SV1dzZm5MaDRBK3ZnbGpmVnc3aHFC?=
 =?utf-8?B?Qk1lTWNnd2NhUEsvNzNhNXhUalE1L2I5eDhGUnh5d1ptOHQ3eDRQM2h6bUhX?=
 =?utf-8?B?WTVBRGZUUU5UU2xPbFRZMDBINkUyVGxVZ2lxRmEzTDU4WmlMU3JxMEQ1Z1FZ?=
 =?utf-8?B?L2FUQ3B6aEREeVpDM3h4VG5JUVZvWkN1K3B6L3lja2V2UUE4T2ZqNGFjOUt3?=
 =?utf-8?B?U280d2RyUlcxQUpjbEd0Ui9NMXBrTXpVVGRHMG5VbDJtSDYydGJubXFGOVlj?=
 =?utf-8?B?bXorNHA3akxYVFJ6UWF1cCtiUkJHSk9JYi9ybDBPVmtzOXFGaVBZY0lTRzlF?=
 =?utf-8?B?ZGowMTJTQThwUEdqSTFDMkIyREdkUjRoL2U0ZUhLQ0VnV2l0SjRSbmxPbFVL?=
 =?utf-8?B?Yi9GS21sL09ZVDN0WWd3ZzZPQng1cjJpc0VJNEh4SVNzR1hEMStZb2xja2Zv?=
 =?utf-8?B?S3Z5QzhiVmRRdzNsYVRsT0NteExNQ0FoQWozU3hYTTgwdEc4N3VBR2tpL2dI?=
 =?utf-8?B?WlBGR1FGTHhFelBaek1iVlNnaDRUTEp5clMxTW9VZktTMFNVSlpUaGlrU2JW?=
 =?utf-8?B?TWdxbDI5UCtyMVJiYnZxZGJIRmpCRkV2RDM4eVo3NWczU1R2UnVpbDR6cVFL?=
 =?utf-8?B?bFlRTDdhd0VOS0VJeVB2dDRxU2xaY00wdmswNEZBVmN1akRVZkRPMFkzbG5a?=
 =?utf-8?B?R2xvRVZnNno1a20zZlJyTGk4ZEhadTI4NnF3aFVucFJMVDlRVmE5RCt3U1Uy?=
 =?utf-8?B?TmFOUGtSTFdzZWhHMUQ3YlR6aXp1N0NVejRJaXZVSk5Fc25JZXc5ZjBsc21o?=
 =?utf-8?B?ckt0UVkxenUveGdobEM3TVlFRHQrK0pQUFZ0VmxTeE00eFNvL2YxQ0JsQ1J4?=
 =?utf-8?B?MVBtWjMyT1pRcyt0Zkp5UE9sakxTODByMUIxVGZmZlRMUXhkOFRNVHpXR2RI?=
 =?utf-8?Q?Jgj7absNa6c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODduYjg1aFdjcGpIK3FGLy9IczUydSs3Mm5rbUdSQThNUWxlbmhrSWJWaUg0?=
 =?utf-8?B?VkxmVkU5QTFQNmpPNjBhWTlqVFJDaDZxbnNaMFVhUTFNRU1IK3EyTVBOZlBh?=
 =?utf-8?B?dW1BU2oyN3VKSDlUcmowQmdpOVZrVXdXSUdhMXR4akoxenJsdjZraXZIWUk3?=
 =?utf-8?B?UzlrMXFvSTVkRnIwUHIxSU9xNFJQWlhsSU81RVprT2R2WCtvam5RVUVXWXhZ?=
 =?utf-8?B?SFczSW1haHpORmNxVXptUXRtNzVacTJLVmJncHMwT0s1RXI2MGZBRDNoS25M?=
 =?utf-8?B?UlpZcndITHpiZmdPWVhCSUF2cTExTi9UcHNyQ1gxbE52b2VEQkJLZVFDWXh0?=
 =?utf-8?B?SFlCdS95OUZQNEU0MXkzeUt4TkhzZVBUQ1hObnNqd0xSdmVGQzVwdFZ6c2xW?=
 =?utf-8?B?RjZRWmZzOXBtNWJEMkZmMzVNOEJuZ0pqem9kU0VJY0JWR1hhWGpVR1dxUjJt?=
 =?utf-8?B?K3NjWkJBZFVqdGIxZmhNTEN0WjJaWGZiU0tPQlpudXY0eGpOcDZhekJ5UFU2?=
 =?utf-8?B?NXYwL0tlSlRPYXZoOEYwYXJaMTVZUG53VnJXd0VVZzBEampVYTBNclltVXpQ?=
 =?utf-8?B?TENML1p2Vmd4Z0hIRWNTMjlqaFJ1aVlVbWwxakpvNEVxcEpKc0p5aEsxWmVK?=
 =?utf-8?B?UmJ6VkNNdTkrZWlLbzdiamcxUFRxQmx3UVNSekFXOVA1WnRFZm9TdDYwOW5r?=
 =?utf-8?B?TWpRMHl4VTNaVHRxOFV1ODh5WXR0RWsvOFAvTFZ3dmFCSDZORUZsRzYxNlZE?=
 =?utf-8?B?ZW9sN1RTNWQ5RVl2MjRxMHozenM3djkzblBvaGI3eTByQlkzdEsydE1YOW9N?=
 =?utf-8?B?NHFvOStlNHU4L0FhczJBTlFUb1JjaXI3ak5GOHl0MjF1OWtSU0s0YUhVaU82?=
 =?utf-8?B?cUtZT3FKZXJpMWkwRHordllBakxCUlViZG9sazJkWldVODV4WnNwL0VXbkN4?=
 =?utf-8?B?Rkdsc1NMYndia2loM0ZtZ2VJNGRKMkhlQm1kc3BlTVVaKzFzNHJBRUR2ZnRq?=
 =?utf-8?B?Q0Ewa1hQeXpJMGFRSEtTQkZFQ0c2S1l3WVhrRFVUR0tDY0dBV3hQM2dPL2tt?=
 =?utf-8?B?Zk5kd2Y2RFlYWWNiTERyYm5pYlRIM085Uyt0eGFlUThxQUpib2dJZEpFMlJo?=
 =?utf-8?B?VGVicXBmekJoTGQwSkl4WFlnUmRSS2ZMdHJ0ejFpd1lPZUFBRGNoVjdTN2Nn?=
 =?utf-8?B?WHdZVVJES1E4NXNGYVBnNThtUkM0a1c0SUpZYzNDUmhoK3cwdXdsL0NYQnhG?=
 =?utf-8?B?WTJGUnlPdVpnNnlSY1RQRjVtRi9YeEVpbVVWaTcvZzh6NkFjVzI2aGtUNjQ5?=
 =?utf-8?B?U29sd29RbmxrNkVQSURUQks5VGlyMEtDM1Rkck90UFJyaHpnMnBidE50eGpR?=
 =?utf-8?B?cGZRL2I3Z0NFcXl2NGZrQktGd0M5UDNHWUFicWNWQTFhUXBWdllhTzFNNGxB?=
 =?utf-8?B?YjAvUS9NVitFZWlaM1A2MVFuT3hHWHBZRlBhTkJWaGI4YXB4TmV3Y2xjQkZu?=
 =?utf-8?B?ZnF2cGN6dzQ2QkZmaHNPbnloK3plOXNHZWUydVlZU25HWnZDZnJISGovMXBV?=
 =?utf-8?B?YmdqWFkrOE56MERNQ0pwaDkrRnUyd2p5M2k2UTQ5WktZMzZKMWsza2NlOWxE?=
 =?utf-8?B?VHNzZ1ovTU5sOUtZdTM0amo5Tkk2U0FLVGRvcTlFbzhZUFZhQm9paEVxdjNk?=
 =?utf-8?B?d2FFS25DQXJ1QUEwK3VCRmdNUmNMQ2d4dWVUMjk2bGZ2L0RNU0oxclEvU0VF?=
 =?utf-8?B?NkQ5KzNlYU0rOFdibXV0TlIweEV2UGpmSDVxV1RoNWJxYnQ5QTd1YTVjMkRo?=
 =?utf-8?B?emJkTWN0Mm9QVTQ3NjVuSWNDMWFyUDhrR3pyRW5nMHJETGlTRE5DQzRkVXMv?=
 =?utf-8?B?aWdsYW5qcEQ5djhWSFVjQTh3QUJ5YXNvZjlNUTdlSDJtY0xOaUp1U1J4alJP?=
 =?utf-8?B?OFdhQXhUc0RTQTR0ZkQvc0RrSm81QjNEbHgxMENvaUU4aDBqRkNrR2tjb2o0?=
 =?utf-8?B?K0FDYnpkeDVYZmpxUzFGdE40NWxDWDBCdWFiTFNsTFdZK2t6UVFsSldLdlBT?=
 =?utf-8?B?MjBiM3hhWExjRzN0bG9ka3RRSTdYeDFUd2N1MURJQ0x1dW9mWVJJWFF0Rktt?=
 =?utf-8?Q?Xys1aW4LYvu8MlRddHki2VOWK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6440538-7ad7-409b-86e0-08dd946a87ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 11:12:22.6016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbO7Ilp7UeeLwTXzWTKR1G+2iRwzwrGee27gnc0xpQWh8dCs3HYwi19pXyVK4NSu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5819
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

Hi Thomas,

sorry for the delayed reply.

On 5/13/25 11:14, Hellstrom, Thomas wrote:
> Hi, Christian
> 
> During eviction we want to be able to evict bos that share the VM's
> reservation object but that are currently not bound to the VM since
> they are not part of the current working set.
> 
> TTM can't handle this situation since it's not aware of whether a bo is
> bound to a VM or not.

That's not 100% true.

We already have support for something similar for the KFD as well, see function amdgpu_ttm_bo_eviction_valuable():

        /* If bo is a KFD BO, check if the bo belongs to the current process.
         * If true, then return false as any KFD process needs all its BOs to
         * be resident to run successfully
         */
        dma_resv_for_each_fence(&resv_cursor, bo->base.resv,
                                DMA_RESV_USAGE_BOOKKEEP, f) {
                if (amdkfd_fence_check_mm(f, current->mm) &&
                    !(place->flags & TTM_PL_FLAG_CONTIGUOUS))
                        return false;
        }

But to be honest I never really liked that approach because it abuses the fact that KFD fences are bound to the struct mm.

Additional to that we have a few flags in the context object which allows to evict BOs with the same resv object during object creation.
 > Do you have a preference of how to address this? One idea would be to
> forward the operation ctx to the eviction_valuable callback. Another to
> add an "unbound" flag to the bo and an "unbound_only" flag to the
> operation ctx.

Adding the ctx to the eviction valuable callback sounds like a good approach to me.

Regards,
Christian.

> 
> Any feedback appreciated.
> Thanks,
> Thomas
> 
> 
> 

