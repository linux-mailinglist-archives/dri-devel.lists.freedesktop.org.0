Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9E6A07666
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6565310E372;
	Thu,  9 Jan 2025 13:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YNNCAe1C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEB810E372
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:02:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGwJWj8wYM8m5TuvpMXxVlcYH0VOzEtHXs7EWwV85cMD135byx90iAVHksyJph5lciqhchbTT/k22N0rltlHxYzkzKsjON5pP+dAetcp4a9X0G3V+iUE4jQtQFuJ0zJS/WIHvqowpnYx2bBNwZTlkt9KGyukGZN+0YxmK21ILpRwB7U2xMS639eV5fxSvHcLelLSXBDjUYE/1L9VETWhF4LVgb00HkoPa1nqwy4LhgUqQFzFWnsVPigHZ9Dl856NGVS45UdQWWEB4oUI1QN1EunTP7U/TKy76miuDBIPnzlDZAueHJQ1WgdQNRhX8zMUn+uGWV7sjtFvRfxSnSdM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vxJCbjiFy6XO9oeBLFOowDms81Y34DtML/VaPUwktI=;
 b=bJ5oL1Wf0QO770EcN4DPg3cygMCpOgrON8KeLBQHHgWiPqiDAKq5Ee+BvwWuA3Q7GvBB9AexdX78yfugGCS5QiQuiY7Y2p3ol5OG88iqgXS69e0mje38z3//XSgWxMk3wi1h1AlUwKGPqQ2eu7kIMU6c8udKzcTX3iEWTQ00nlelgjcTwj0z3QnM8JO/hMcoInatZGbdftDOi9ncNsDNoXGVjFW/bzI2r2JUI4QGw4KGjhuoq9fqFg9wocDuY45YKK9ph3mk8QG6Oa3ZerQwKW0Y4H6O21cnFZyZ8K+i1x8906S0ZAe4OH++mQbysVNF05X1DRDX3boojHfJBZIeFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vxJCbjiFy6XO9oeBLFOowDms81Y34DtML/VaPUwktI=;
 b=YNNCAe1CG+4f1V3YwIzoJEuYS7j+3pyv0xqUlsf1Kq535pvTbmJdpbTUtiMRkMNacf2UUzfPeaD5MeqhsbYlpbAPvQw0vNv1G6w0hMkTLsWM2kNv3FsviFL/jFBymu6SqKs8lcIrqFAmwIBglndOwuCpBKP9LYMTZIe3TIBt2eA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 13:02:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 13:02:16 +0000
Message-ID: <0d6d504a-38e3-4b9a-b4ef-d2255518336f@amd.com>
Date: Thu, 9 Jan 2025 14:02:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 12/18] drm/sched: Move run queue related code into a
 separate file
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-13-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250108183528.41007-13-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: b36f1a5b-0b27-494b-5983-08dd30add7d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmRKTEdLazB1Y2ZzbkJac0JVWExBUFNGOVJPOXA4bWczTVV4TlJlbWNaNDJW?=
 =?utf-8?B?ckdLV1RjZkFZOXBIVXh2dXd3ZnNHRHVVZEhFNnpKcUFHc0dLS0tTMVVZaUVH?=
 =?utf-8?B?Qm05dVc1dDEvTTR0V1pCYS8xY1Y1aXlZRXlJQjhGMmw5bEg4elhBakQ2aC8w?=
 =?utf-8?B?clJlOFRiZ2NSczNBQkhRekNDeXZFazU5cHJnVnVXWUwxc2NySnkvUmVhQW5Y?=
 =?utf-8?B?dHNXUUpZUUFhc0pBaFFacDMzcWY4ZnRPV1dDc3Exb3p6WXVOV0k5Qy9GZ0pp?=
 =?utf-8?B?Q1ZFS3ZRekFIQmVmVmJ3d0tEUHIxV3Z2dUIweHhNVDFkNkQxYXhwWjZCNDhT?=
 =?utf-8?B?RjhhS3ZYRmRzQk1TbDZOU0RoUFlaK1BNUElFd1VTY2JFSEpqVncrditjWFFV?=
 =?utf-8?B?eElPcjlvbXBQeTlBM3Z1ZzhaYjY1dXdLdkwxTVpDeExjMkpTemk4MjZNNC9L?=
 =?utf-8?B?K1pUUHlrOU5wWnU0N3FDclhBaTVST05lVnFSNFpxYlRWYnlqRFFWUmgxZE1v?=
 =?utf-8?B?ajFkZGg3MFpCZmNDcThTL09pRmNvUGdoN2pmTzdxRlpyYnRpSGtoY3EzNFds?=
 =?utf-8?B?SldUTDBkeE96SmtlUlhsNWdpQjdIdzMveDdIcy9FWTZrWkJYZEVUcnUyUjNn?=
 =?utf-8?B?M1NQOXBmWjA1MWR6NlJ0MUc3VDU0MW9VbVlKbHhRSDQwUU5jUmE1ejN6NkVX?=
 =?utf-8?B?b3dLamhuMnFUTGk5WUlwcm5YT0hnRjBoU0p2blZHakt2Z0ZLMmU2U2phaEFC?=
 =?utf-8?B?dnRzQll4cHRzZFhTdHZQeStaNE5razgrWW8ycjNCb2haRWc3QnREeUhWeXc1?=
 =?utf-8?B?WEJuR2RVZDE1NncvbFZUVFdrK2dHdHZYQnUrZm1naWVPREVKQ0Y3d2FmWktT?=
 =?utf-8?B?RGVpeVRVemJMcHV2M3FqeldXcjFJZDlMR3FWV2orSm5kTjFseUZhZnlmRlFH?=
 =?utf-8?B?Z2hCajNHOG9tSExLOUpwWFFOZzh1NEZaQTE0KzVtcFduNURQZmNKeHg0Nmlr?=
 =?utf-8?B?M3Z3QkUyMmRhUkY5QXk5RFkvWU5XVHJEcG9Vbzk1cVhONVd0bis3M0FFM2hj?=
 =?utf-8?B?Mis3QzNsditORlBrUGY0cFluWVVkSTlzRkZLQ2JYblp2K04xdDN6dW5CUEpp?=
 =?utf-8?B?Tk1HSUxJUFRpbkgvSmdheVA2aHlNN1pFSHpGV3A3ZkRZSEpTcmoxbDRPSzhm?=
 =?utf-8?B?eDNwRkVmWjhNMzl5b0paYkQrZG96MzM3NzNNRnh3MnlJcUtUN0VteDhxR3RS?=
 =?utf-8?B?QWUyWEkvNW04RkxIdDF4dGdmcmZxK2ZucUwvc2xmR1FtdGhMTTZIejh0aVow?=
 =?utf-8?B?WXpvOTcxWkpza1k2L1kvSXl6Q0c2dzFYUlZOR0FpbThaZDN0QXduUHlJTnVL?=
 =?utf-8?B?ZGdFUlFXTlB4Yko0YnJLVHNsbWFMWjcxZGQyZWt0T3ZsN3gvQ1NyOGJXbG5M?=
 =?utf-8?B?aytxdzUzbEFpN3YzYUtqSytoVG1FTDdzNmF5cU5Za2gveUhGUlJ3b0c5WW83?=
 =?utf-8?B?dzBkaGdqc0NsOG1OYlp4WmFiOUtzU3hFOTJVTGU1WGY0Y2NMRC83VEVrR281?=
 =?utf-8?B?bXFUWHdQZHY2VElzMlNaQ0tybUxVMVkzMyt4Mk0ycWh2YnVyQXZLK0FOQWh6?=
 =?utf-8?B?eGZ4dlVtMnBkcEdHTWxqMXdkMVBINHFuS3A5NVYyMHdRZ3p4RTQrWGQzcWpZ?=
 =?utf-8?B?ZFd2MTZJMlBQa2hXejFsNzB1MDNTdktBUGVxMjYraTFRV093aFpkdjZ0VmdE?=
 =?utf-8?B?L3lYK2VaN1FRR0h6Y3IvUmpGQ2RxazR1ZzVQNlNBZVg2V1p4YW5iRklJUTVZ?=
 =?utf-8?B?M3pRREVKY2F1TFJoQmlaSGdUOFJXNndIN3FMc3hmd3V2bmd6c2JQR2wxdTBK?=
 =?utf-8?Q?FsfPX9dIzXtk3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmg5Ym1ma0RSREhkdlVjTmM3c1I0VVlFUCs2a1RndWM5bGhKa3hFUXY2ajFq?=
 =?utf-8?B?K2NielNYL3VYQU51MFZjeGVtODYzZ0w5YXZIem5JNXlQYlhXeEJCbzFWS3FY?=
 =?utf-8?B?blFTYmlWSG1NTlpRbTRaWjVHWUxhUTNCR0NMWENKSWtybWFIR0M1bUxLUmFz?=
 =?utf-8?B?TGNPcWRHQ3NJVE91aytpNHlqWmh0WERIWndBL0ordXd2VTlaWW9PT2UxRjE3?=
 =?utf-8?B?dG05V2syeUI2bEYyNWRCVGdrTVZCYldLKzE5cWdUMGRaSWp6R1p3cWFSOXJT?=
 =?utf-8?B?MUtzQkFXUzhtaFRhMFR2VDNNcEFHbFVOMlBVZEFkbnU5RW5PdCt6bldBekJy?=
 =?utf-8?B?ZThFZ054eFVlN3hiMnFoUXBFVGIxZ1hXYWIrbDVkN0w3ZGdFaTF4dnJ0UWhR?=
 =?utf-8?B?aHVkaEhQZFllazI5OE1tdTJhbXdSbCtzbDdPY1ZFdk5tYW11bTNzSDlnNEZa?=
 =?utf-8?B?N3lOUVZpV00rRlo1ZnBXb3ZSeUJuTU5DUkk3L0Z1ZTl1RXROZFFta0ljd0lC?=
 =?utf-8?B?VE1qdkVidldqaFdodVRldndHUEdETERjNUUydWtESWpXRWQ5RHozbnp5R0FI?=
 =?utf-8?B?OEhiZHpZYks2ekNBcVVqczFtWFlINS9lSCt6M3VWVnR2RkxEcWY5enZXcHc1?=
 =?utf-8?B?Q3RSVlJObG0xcjViS1RmVWEzRHdiR0l3Z2grNEIxaHVoSFpPSGpPU0ZBOFhZ?=
 =?utf-8?B?R2g1REtkMWlmenJheDlqTi84R2ZFWkw0cmU0emR6Q0dkQVNtSlMya1lBM0dx?=
 =?utf-8?B?QzR1MU1lRi9kLzhYZTlFLzYyOHlJVC9kM28wZDErb0xYWlZEVlc5VTlnUWFr?=
 =?utf-8?B?RmthbURJVVdYMUZlVjVjOVh1alVDWEJvNnFMTGFESnpiSHBWeDhBdW9rd2Jv?=
 =?utf-8?B?UVNiWm43TFJuVUp3N053bkZIOHJrTFV2ZmVEQlM5MGtyM0psVWpUNW9TVUo4?=
 =?utf-8?B?NzF4Q2pJd1lyeldoTHJpU1hPcUR6SXdOSy9qSi9QNUV2ams3djZoSlZQYUZ4?=
 =?utf-8?B?KzhpTkwyWEhaOUFJZUE3bjBobStTNVBMNG5sZnc3ZENLbzhHcUt4V3dEU0kw?=
 =?utf-8?B?WGFscVN3czFZSjM1YzdFUzJISXUwQ2VpUHBqRGN6QWtNTE1UY2pCSGhFV2sr?=
 =?utf-8?B?VnIyU2dPcUFRWkV5RnV1em1ESmtWaXlhbnZYVVNLU0F0YTB6YXhDNEU0bEk1?=
 =?utf-8?B?NG5aa2k1NjJ3YWVmUC8rcFVBUmJJTldEZDN2WmlNc3drN28zSkdMMjB1UlpW?=
 =?utf-8?B?azNIVmZFZFYzcXEyMFhBK1hmbG9UQml3YXBoaUpibEVMbFBRdHkyODkzamwy?=
 =?utf-8?B?dldpWkpQNU9wYmkyVkJWdDI0cTZIaFdFWFpDMmdOU0p0YWkvKzFlYmJHVmtp?=
 =?utf-8?B?bE0wS3FkbTR2YnJUYjJuNW1YaTBveHp1KzA4ZThlWWFtcDRxejNZVHNSa0ZD?=
 =?utf-8?B?SmlxQU8vUjNRa3AwNmc4MTZrQmVWMVR1MWMyTjIxRW9DdjRJTVY4LzJKdVJK?=
 =?utf-8?B?N1hISXNhNHoxeTBrNnB2b2ViUmIxcXc4L0MzTXpXTjFZb0x6eHhkaGxsSWRo?=
 =?utf-8?B?TkVyeThNclhRZkJUTFJzOE9BVm9KWEQ4b0liZHhyVlhzbHkxUnZSemt3NnNO?=
 =?utf-8?B?WHdMU1BqZTU5bDEyZC80Q0V1RlREM093ejFCaVArMExESUhXeGZwWUgzYnhx?=
 =?utf-8?B?dXpiMEdPNFpnNTZYZGpXYTJVcjBaU3NQN084MlpHV25RbWJuZHM2NlU5dHBB?=
 =?utf-8?B?bEdGZlJOSHFUTXRLK0V6S0NHcnVmMkY0UVNrK2M2TkczMm8zK2gwamU2dFNt?=
 =?utf-8?B?MWpIdzJ3OXZZVnFGajVzYXhwK0tTbEsrNkNVUzBxbFFiSHdhQ2Q3bjdwc21o?=
 =?utf-8?B?R0o4SUtNZWJLbHNTTzR6cFl6Z2VCRldCTkw0bWxTM0NsOVlKd1ladm5BQVpB?=
 =?utf-8?B?Ykx6WjQ5ejh1a1g4b0dtY0E5OWtVc0VSYitsU2pkckJrcjdYSGpJYmExN3pL?=
 =?utf-8?B?QVQya3ZsNG9XcGhZcFJ6cE5OMVpVNFJXdkQ3T2VUdncyRnlmK0cwQ0V1K0FW?=
 =?utf-8?B?eGtkeXlJTXdTOCtGcVJwKzZvNHpxRFUvR3gxemNPbW92aCt3Zk5CZUtxdHB4?=
 =?utf-8?Q?XCQ7pEHceDUEYUWMH3H7GwkMd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b36f1a5b-0b27-494b-5983-08dd30add7d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 13:02:16.7793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuak4wNg9LExTTkncLBJ9I4o2KgMmgCpc1fHOg9GCUzG0xthYo2ZYs2pwIRSzvcu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6457
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

Am 08.01.25 um 19:35 schrieb Tvrtko Ursulin:
> Lets move all the code dealing with struct drm_sched_rq into a separate
> compilation unit. Advantage being sched_main.c is left with a clearer set
> of responsibilities.

Looks like a good idea to me in general, but I would also push to 
completely remove run queues or at least rename them.

We only came up with the run queue object to handle different job 
priorities.

But with the FIFO approach now used everywhere you can nuke that and 
just give individual jobs with higher priorities a boost in their FIFO 
score.

Regards,
Christian.

>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/Makefile     |   2 +-
>   drivers/gpu/drm/scheduler/sched_main.c | 210 +------------------------
>   drivers/gpu/drm/scheduler/sched_rq.c   | 207 ++++++++++++++++++++++++
>   include/drm/gpu_scheduler.h            |  12 ++
>   4 files changed, 222 insertions(+), 209 deletions(-)
>   create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>
> diff --git a/drivers/gpu/drm/scheduler/Makefile b/drivers/gpu/drm/scheduler/Makefile
> index 53863621829f..d11d83e285e7 100644
> --- a/drivers/gpu/drm/scheduler/Makefile
> +++ b/drivers/gpu/drm/scheduler/Makefile
> @@ -20,6 +20,6 @@
>   # OTHER DEALINGS IN THE SOFTWARE.
>   #
>   #
> -gpu-sched-y := sched_main.o sched_fence.o sched_entity.o
> +gpu-sched-y := sched_main.o sched_fence.o sched_entity.o sched_rq.o
>   
>   obj-$(CONFIG_DRM_SCHED) += gpu-sched.o
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index a21376ce859f..a556ee736f9f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -87,9 +87,6 @@ static struct lockdep_map drm_sched_lockdep_map = {
>   };
>   #endif
>   
> -#define to_drm_sched_job(sched_job)		\
> -		container_of((sched_job), struct drm_sched_job, queue_node)
> -
>   int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>   
>   /**
> @@ -118,8 +115,8 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
>    * Return true if we can push at least one more job from @entity, false
>    * otherwise.
>    */
> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> -				struct drm_sched_entity *entity)
> +bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> +			 struct drm_sched_entity *entity)
>   {
>   	struct drm_sched_job *s_job;
>   
> @@ -137,209 +134,6 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>   	return drm_sched_available_credits(sched) >= s_job->credits;
>   }
>   
> -static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
> -							    const struct rb_node *b)
> -{
> -	struct drm_sched_entity *ent_a =  rb_entry((a), struct drm_sched_entity, rb_tree_node);
> -	struct drm_sched_entity *ent_b =  rb_entry((b), struct drm_sched_entity, rb_tree_node);
> -
> -	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
> -}
> -
> -static void __drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
> -					      struct drm_sched_rq *rq)
> -{
> -	lockdep_assert_held(&entity->lock);
> -	lockdep_assert_held(&rq->lock);
> -
> -	rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
> -	RB_CLEAR_NODE(&entity->rb_tree_node);
> -}
> -
> -static void __drm_sched_rq_add_fifo_locked(struct drm_sched_entity *entity,
> -					   struct drm_sched_rq *rq,
> -					   ktime_t ts)
> -{
> -	/*
> -	 * Both locks need to be grabbed, one to protect from entity->rq change
> -	 * for entity from within concurrent drm_sched_entity_select_rq and the
> -	 * other to update the rb tree structure.
> -	 */
> -	lockdep_assert_held(&entity->lock);
> -	lockdep_assert_held(&rq->lock);
> -
> -	entity->oldest_job_waiting = ts;
> -
> -	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> -		      drm_sched_entity_compare_before);
> -}
> -
> -/**
> - * drm_sched_rq_init - initialize a given run queue struct
> - *
> - * @sched: scheduler instance to associate with this run queue
> - * @rq: scheduler run queue
> - *
> - * Initializes a scheduler runqueue.
> - */
> -static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> -			      struct drm_sched_rq *rq)
> -{
> -	spin_lock_init(&rq->lock);
> -	INIT_LIST_HEAD(&rq->entities);
> -	rq->rb_tree_root = RB_ROOT_CACHED;
> -	rq->sched = sched;
> -}
> -
> -static ktime_t
> -drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
> -{
> -	lockdep_assert_held(&rq->lock);
> -
> -	rq->rr_deadline = ktime_add_ns(rq->rr_deadline, 1);
> -
> -	return rq->rr_deadline;
> -}
> -
> -/**
> - * drm_sched_rq_add_entity - add an entity
> - *
> - * @rq: scheduler run queue
> - * @entity: scheduler entity
> - *
> - * Adds a scheduler entity to the run queue.
> - *
> - * Returns a DRM scheduler pre-selected to handle this entity.
> - */
> -struct drm_gpu_scheduler *
> -drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> -			struct drm_sched_entity *entity,
> -			ktime_t ts)
> -{
> -	struct drm_gpu_scheduler *sched;
> -
> -	if (entity->stopped) {
> -		DRM_ERROR("Trying to push to a killed entity\n");
> -		return NULL;
> -	}
> -
> -	spin_lock(&entity->lock);
> -	spin_lock(&rq->lock);
> -
> -	sched = rq->sched;
> -
> -	if (!list_empty(&entity->list)) {
> -		atomic_inc(sched->score);
> -		list_add_tail(&entity->list, &rq->entities);
> -	}
> -
> -	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
> -		ts = drm_sched_rq_get_rr_deadline(rq);
> -
> -	if (!RB_EMPTY_NODE(&entity->rb_tree_node))
> -		__drm_sched_rq_remove_fifo_locked(entity, rq);
> -	__drm_sched_rq_add_fifo_locked(entity, rq, ts);
> -
> -	spin_unlock(&rq->lock);
> -	spin_unlock(&entity->lock);
> -
> -	return sched;
> -}
> -
> -/**
> - * drm_sched_rq_remove_entity - remove an entity
> - *
> - * @rq: scheduler run queue
> - * @entity: scheduler entity
> - *
> - * Removes a scheduler entity from the run queue.
> - */
> -void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> -				struct drm_sched_entity *entity)
> -{
> -	lockdep_assert_held(&entity->lock);
> -
> -	if (list_empty(&entity->list))
> -		return;
> -
> -	spin_lock(&rq->lock);
> -
> -	atomic_dec(rq->sched->score);
> -	list_del_init(&entity->list);
> -
> -	if (!RB_EMPTY_NODE(&entity->rb_tree_node))
> -		__drm_sched_rq_remove_fifo_locked(entity, rq);
> -
> -	spin_unlock(&rq->lock);
> -}
> -
> -void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
> -			     struct drm_sched_entity *entity)
> -{
> -	struct drm_sched_job *next_job;
> -
> -	spin_lock(&entity->lock);
> -	spin_lock(&rq->lock);
> -	__drm_sched_rq_remove_fifo_locked(entity, rq);
> -	next_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> -	if (next_job) {
> -		ktime_t ts;
> -
> -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -			ts = next_job->submit_ts;
> -		else
> -			ts = drm_sched_rq_get_rr_deadline(rq);
> -
> -		__drm_sched_rq_add_fifo_locked(entity, rq, ts);
> -	}
> -	spin_unlock(&rq->lock);
> -	spin_unlock(&entity->lock);
> -}
> -
> -/**
> - * drm_sched_rq_select_entity - Select an entity which provides a job to run
> - *
> - * @sched: the gpu scheduler
> - * @rq: scheduler run queue to check.
> - *
> - * Find oldest waiting ready entity.
> - *
> - * Return an entity if one is found; return an error-pointer (!NULL) if an
> - * entity was ready, but the scheduler had insufficient credits to accommodate
> - * its job; return NULL, if no ready entity was found.
> - */
> -static struct drm_sched_entity *
> -drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> -			   struct drm_sched_rq *rq)
> -{
> -	struct drm_sched_entity *entity = NULL;
> -	struct rb_node *rb;
> -
> -	spin_lock(&rq->lock);
> -	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
> -		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> -		if (drm_sched_entity_is_ready(entity))
> -			break;
> -		else
> -			entity = NULL;
> -	}
> -	spin_unlock(&rq->lock);
> -
> -	if (!entity)
> -		return NULL;
> -
> -	/*
> -	 * If scheduler cannot take more jobs signal the caller to not consider
> -	 * lower priority queues.
> -	 */
> -	if (!drm_sched_can_queue(sched, entity))
> -		return ERR_PTR(-ENOSPC);
> -
> -	reinit_completion(&entity->entity_idle);
> -
> -	return entity;
> -}
> -
>   /**
>    * drm_sched_run_job_queue - enqueue run-job work
>    * @sched: scheduler instance
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
> new file mode 100644
> index 000000000000..40f5b770f21a
> --- /dev/null
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -0,0 +1,207 @@
> +#include <linux/rbtree.h>
> +
> +#include <drm/drm_print.h>
> +#include <drm/gpu_scheduler.h>
> +
> +static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
> +							    const struct rb_node *b)
> +{
> +	struct drm_sched_entity *ent_a =  rb_entry((a), struct drm_sched_entity, rb_tree_node);
> +	struct drm_sched_entity *ent_b =  rb_entry((b), struct drm_sched_entity, rb_tree_node);
> +
> +	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
> +}
> +
> +static void __drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
> +					      struct drm_sched_rq *rq)
> +{
> +	lockdep_assert_held(&entity->lock);
> +	lockdep_assert_held(&rq->lock);
> +
> +	rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
> +	RB_CLEAR_NODE(&entity->rb_tree_node);
> +}
> +
> +static void __drm_sched_rq_add_fifo_locked(struct drm_sched_entity *entity,
> +					   struct drm_sched_rq *rq,
> +					   ktime_t ts)
> +{
> +	/*
> +	 * Both locks need to be grabbed, one to protect from entity->rq change
> +	 * for entity from within concurrent drm_sched_entity_select_rq and the
> +	 * other to update the rb tree structure.
> +	 */
> +	lockdep_assert_held(&entity->lock);
> +	lockdep_assert_held(&rq->lock);
> +
> +	entity->oldest_job_waiting = ts;
> +	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> +		      drm_sched_entity_compare_before);
> +}
> +
> +/**
> + * drm_sched_rq_init - initialize a given run queue struct
> + *
> + * @sched: scheduler instance to associate with this run queue
> + * @rq: scheduler run queue
> + *
> + * Initializes a scheduler runqueue.
> + */
> +void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> +		       struct drm_sched_rq *rq)
> +{
> +	spin_lock_init(&rq->lock);
> +	INIT_LIST_HEAD(&rq->entities);
> +	rq->rb_tree_root = RB_ROOT_CACHED;
> +	rq->sched = sched;
> +}
> +
> +static ktime_t
> +drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
> +{
> +	lockdep_assert_held(&rq->lock);
> +
> +	rq->rr_deadline = ktime_add_ns(rq->rr_deadline, 1);
> +
> +	return rq->rr_deadline;
> +}
> +
> +/**
> + * drm_sched_rq_add_entity - add an entity
> + *
> + * @rq: scheduler run queue
> + * @entity: scheduler entity
> + * @ts: submission timestamp
> + *
> + * Adds a scheduler entity to the run queue.
> + *
> + * Returns a DRM scheduler pre-selected to handle this entity.
> + */
> +struct drm_gpu_scheduler *
> +drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> +			struct drm_sched_entity *entity,
> +			ktime_t ts)
> +{
> +	struct drm_gpu_scheduler *sched;
> +
> +	if (entity->stopped) {
> +		DRM_ERROR("Trying to push to a killed entity\n");
> +		return NULL;
> +	}
> +
> +	spin_lock(&entity->lock);
> +	spin_lock(&rq->lock);
> +
> +	sched = rq->sched;
> +
> +	if (!list_empty(&entity->list)) {
> +		atomic_inc(sched->score);
> +		list_add_tail(&entity->list, &rq->entities);
> +	}
> +
> +	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
> +		ts = drm_sched_rq_get_rr_deadline(rq);
> +
> +	if (!RB_EMPTY_NODE(&entity->rb_tree_node))
> +		__drm_sched_rq_remove_fifo_locked(entity, rq);
> +	__drm_sched_rq_add_fifo_locked(entity, rq, ts);
> +
> +	spin_unlock(&rq->lock);
> +	spin_unlock(&entity->lock);
> +
> +	return sched;
> +}
> +
> +/**
> + * drm_sched_rq_remove_entity - remove an entity
> + *
> + * @rq: scheduler run queue
> + * @entity: scheduler entity
> + *
> + * Removes a scheduler entity from the run queue.
> + */
> +void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> +				struct drm_sched_entity *entity)
> +{
> +	lockdep_assert_held(&entity->lock);
> +
> +	if (list_empty(&entity->list))
> +		return;
> +
> +	spin_lock(&rq->lock);
> +
> +	atomic_dec(rq->sched->score);
> +	list_del_init(&entity->list);
> +
> +	if (!RB_EMPTY_NODE(&entity->rb_tree_node))
> +		__drm_sched_rq_remove_fifo_locked(entity, rq);
> +
> +	spin_unlock(&rq->lock);
> +}
> +
> +void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
> +			     struct drm_sched_entity *entity)
> +{
> +	struct drm_sched_job *next_job;
> +
> +	spin_lock(&entity->lock);
> +	spin_lock(&rq->lock);
> +	__drm_sched_rq_remove_fifo_locked(entity, rq);
> +	next_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> +	if (next_job) {
> +		ktime_t ts;
> +
> +		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +			ts = next_job->submit_ts;
> +		else
> +			ts = drm_sched_rq_get_rr_deadline(rq);
> +
> +		__drm_sched_rq_add_fifo_locked(entity, rq, ts);
> +	}
> +	spin_unlock(&rq->lock);
> +	spin_unlock(&entity->lock);
> +}
> +
> +/**
> + * drm_sched_rq_select_entity - Select an entity which provides a job to run
> + *
> + * @sched: the gpu scheduler
> + * @rq: scheduler run queue to check.
> + *
> + * Find oldest waiting ready entity.
> + *
> + * Return an entity if one is found; return an error-pointer (!NULL) if an
> + * entity was ready, but the scheduler had insufficient credits to accommodate
> + * its job; return NULL, if no ready entity was found.
> + */
> +struct drm_sched_entity *
> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> +			   struct drm_sched_rq *rq)
> +{
> +	struct drm_sched_entity *entity = NULL;
> +	struct rb_node *rb;
> +
> +	spin_lock(&rq->lock);
> +	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
> +		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> +		if (drm_sched_entity_is_ready(entity))
> +			break;
> +		else
> +			entity = NULL;
> +	}
> +	spin_unlock(&rq->lock);
> +
> +	if (!entity)
> +		return NULL;
> +
> +	/*
> +	 * If scheduler cannot take more jobs signal the caller to not consider
> +	 * lower priority queues.
> +	 */
> +	if (!drm_sched_can_queue(sched, entity))
> +		return ERR_PTR(-ENOSPC);
> +
> +	reinit_completion(&entity->entity_idle);
> +
> +	return entity;
> +}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index daf4665f37fa..ccb39e7bf384 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -386,6 +386,9 @@ struct drm_sched_job {
>   	ktime_t                         submit_ts;
>   };
>   
> +#define to_drm_sched_job(sched_job)		\
> +		container_of((sched_job), struct drm_sched_job, queue_node)
> +
>   static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
>   					    int threshold)
>   {
> @@ -547,6 +550,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		   atomic_t *score, const char *name, struct device *dev);
>   
>   void drm_sched_fini(struct drm_gpu_scheduler *sched);
> +bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> +			 struct drm_sched_entity *entity);
> +
>   int drm_sched_job_init(struct drm_sched_job *job,
>   		       struct drm_sched_entity *entity,
>   		       u32 credits, void *owner);
> @@ -586,6 +592,9 @@ bool drm_sched_dependency_optimized(struct dma_fence* fence,
>   				    struct drm_sched_entity *entity);
>   void drm_sched_fault(struct drm_gpu_scheduler *sched);
>   
> +void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> +		       struct drm_sched_rq *rq);
> +
>   struct drm_gpu_scheduler *
>   drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   			struct drm_sched_entity *entity,
> @@ -595,6 +604,9 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   
>   void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
>   			     struct drm_sched_entity *entity);
> +struct drm_sched_entity *
> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> +			   struct drm_sched_rq *rq);
>   
>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>   			  enum drm_sched_priority priority,

