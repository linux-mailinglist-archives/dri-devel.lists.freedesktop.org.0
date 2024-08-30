Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5A39659CA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D314810E1ED;
	Fri, 30 Aug 2024 08:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="D1MMZZov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124BA10E1ED
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:14:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPm1ZpPL4gCh78+geMqMZ71d8edTvR6WoRC3u4kXaCZyjjQp7HbfFFiSUz/6GDPsrf0NMis0Jb1xtkolQme5Y8Fc3MgqlYTWIDXth3et9U5jYI5GI5Z+JD2TD9oRnXTbvipDnsIAnAtyiq3OJjQUQH/HE6fgFEjutCz2G6J2wKedfCCkwkBFyIpnfjKGzsXegOucHVOgDUa2klaxBewI6fmilmcac3qjZeIjxrBbiKeuyku4saEGRMg858Dq0COUrXE1jeVXbkFNtrH2ZYnwhN8tlu4pFFQ/eol4MtO4DWdpxSo4XJSZuSWf6BGUPOuNvXnAl7dOZWohTzHoLtPCkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50es2Y88AR/wGSK1PYWd+5rj/t9dM47AAYp7UrVn5Yo=;
 b=yYD/PzAjAJNNClw7L4v9mSuvNeXAduDgKYPVZA6KfjWwzvPvkvW1TD1AdBMtb3kSISvlmcHKFjeRbGOELGxxirhoxcN1imYwMy6JLZtw/euD/8elhgu4z7Zj89zTeXkIUuXjW/bmV+nxHb3glkHo2FRMHYHRLm6uB1JAOEln1zZ5yN/DDhc8n0Zp4iB2VV1Q8trkP0gWyhtMibj04h7AsweBn3nvEPSWDXGsoNgXiuetzov2iL9rkXoRUTlfr53BIIfV0vdIT8sXW1IKlSuf+5Lkvv/xLJnsdSckKOo7j1SH9XQNHZHwBNoWtmLDgFgyPBSkTieXXYzNXjItxtVqvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50es2Y88AR/wGSK1PYWd+5rj/t9dM47AAYp7UrVn5Yo=;
 b=D1MMZZoveXxAViKZyX2Ts8leBl4UqLES92FkpIY+MXDo7R7XVg+pljkms0EsQnXmUR0hNtwcOL7F+InulGaifni+CsUOuqDHD+l7FNPmv9NI098tjxltWN7VQsMQUopsbPwbnK2qk3g37fTNR1HigegMloIym4D8LZSDPRX8TkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 08:14:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 08:14:25 +0000
Message-ID: <bdc018b8-3732-4123-a752-b4e0e7e150dc@amd.com>
Date: Fri, 30 Aug 2024 10:14:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 kernel@collabora.com, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@redhat.com>
References: <20240829171238.609481-1-boris.brezillon@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240829171238.609481-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c5cbd7-d2ed-4e85-1304-08dcc8cbc288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFJiWjQrVWw5ckt1eVdBSEoxQzFMWHZ4N1NpUTlkSXFvUVlWTTE3TXdDdkdG?=
 =?utf-8?B?QWkyRWExVUY3bS9QWU1TT0NaaFJmeXY1Zm5ER0kweXd0bW9jSkl4Z1J0eDdr?=
 =?utf-8?B?eU9NaWMwdXNJL3ExdFk4NXlCNzhpTUVNdnp1dXBUNHdYeXgybW9YbjVoNWlh?=
 =?utf-8?B?YWltbmwvVWxyak9YOXA3YnZqUjhDR3p5RENGczJlZVFlNEVva1YrTFFHN01F?=
 =?utf-8?B?WllFQUtHc2hMSno0RndEVFQwb0I5MW0xb2R3cUdTbEI1bTg0K2oyQ2VBblBm?=
 =?utf-8?B?eno3S1RNUGNoTzFadkF3YjhseWpFSE1XVTZNZFBvN0E5Z3RIS2l6VGZjdkZh?=
 =?utf-8?B?U2p3MzFrZGEvTkR2MHJyeWZXS2h6UmJRMmdsdit6d0R2MGY4N2ZtRHN3VW5M?=
 =?utf-8?B?UENpUjJYYjNZaFpnQ2g4c3JuR2hDL29aWFdWOUQxbEpicEtHQ0ovVXRtSWFW?=
 =?utf-8?B?c0tVbCtXRXJtb2YzQWMrMC9DRU9QLzY0SzRtQVdJc2k0b3BpUk4rcFpDQXZQ?=
 =?utf-8?B?Q01qQWdYcU5XYTROSW5RY3pTTlltWWg1amhhbDJnc2pza1BOQm1CdkwxdUFW?=
 =?utf-8?B?MWNvVWFCNTErUjNUQTlka1dKS1Q5STdxcjF5aW1BbFQ2dXVZc0xnR0JLbDBE?=
 =?utf-8?B?bTlLYndaZkQvN3JTMnlnbHhEV3ovUTBIekdvSjFkdFk4R01TWE1GakpFVXJx?=
 =?utf-8?B?QnIzdGgxYjU4dXNUZWFva3ZUV1hETDNWQkpZVnlEKzNCc0xyQXR4a2ZienBB?=
 =?utf-8?B?MTY0NVF5ckR0UHJSOUVPdEM1T1JOYXdJZlhIcDh3YmszWDFGQXhJRzlzeWNO?=
 =?utf-8?B?d1JoYzl2eUdNeEtDaEdIQXJVd25ubHMxbUtobWxtNlhWZG9FZmU3SWNDeDZQ?=
 =?utf-8?B?QXdId3NnUG4wWE1qZm9LeEE2RWZPUXNISU5rV0pCSDl6U29nS0lESTZtUHIr?=
 =?utf-8?B?VmZTOHdZWkl1MlFqb1JQYVZiSVZSdFV6ZFd1UTJYeFBIdzV2M29hUW1SQXBS?=
 =?utf-8?B?bzQ5SnNVeTg5MCs2OTh3K2RYTEswbWdVQThtWkhmM2tjWUtpdytJZTFvNjVp?=
 =?utf-8?B?RGhVd0VJNEsyeTFSTWhjaWtXTmdHSWJTR29WY3g2RzFIL3FRUU1iaE82SDBI?=
 =?utf-8?B?cVBxTVBZbGpMTHQzNDhodDZHckhrcFdlZzZEbndrSXk4QWR6OGNCK2tMZHcz?=
 =?utf-8?B?UUpLNTc4Tm9pYytzOVI5bWdUOHVlVHhkNkVWZG15OVRNWHhtSUdkZUZiSXds?=
 =?utf-8?B?azVpeG1BVGQzNVZUSWlSWTBWM0ZVUklvWE1kandvWEpKWGhiUlpSU0l3ellU?=
 =?utf-8?B?dkZlaG5aYVJYTkx4d3pvY3A3b3B2Y0JWRlN0eGFLSTdMWDlqY0w4cVVSaWtG?=
 =?utf-8?B?b3h2b2tZcjRPSzFWTkhLUjV3OXdqR014aHJ1NDhKbkpzUFpva0IvZk11T1Mv?=
 =?utf-8?B?ZUgyZ1JHQXdGZlJuNVMzc3YwZk5vOG1PUW5lZXgwUlc1S3BEV2x6S0ZVMXVq?=
 =?utf-8?B?M2ZHakhmenBiNkFQSElYdnpCblNjOVNqc0xaQXBlcjNDZExuakp3OHhOMnNO?=
 =?utf-8?B?VzhobEpnS3QwQ2VyYVdpd3h3OUNEM0o0Mnk1KzVwZ2grUlBaQ1FUZHg3emd5?=
 =?utf-8?B?QTJqMGx1ZHA5Y1A3UG1IRWw1MTBPUjZSeFdBdWJKTDdkVXFPbzdNTkZUeDhZ?=
 =?utf-8?B?d1paOFhCQTBWT2kwdm85S3JjVFRNem50TVhDR1czRU14R0cxcm1hWkx6Szdn?=
 =?utf-8?B?WFVSdFI2WVhnTkZKZk5sWCtsMUlVTldGRDBpVW44MS9FOHZ1OU5NUU84RE4r?=
 =?utf-8?B?S1FXNGlXbUNOcDZpbzNPZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWViM1dMQ3YzV2lrM25ZRTVDeTRZaG9pb0pTc2wvNG5LVXU4d0JEeDc2ayts?=
 =?utf-8?B?c0luNUx1RWs1ZllMc1FHNGZHNDFqWFJibzRpWnhRRGh4cE9tZFJjcnJ0Sk5p?=
 =?utf-8?B?R01GaGxKbzhhaEVBMEpvUDdnMSt0QzB1TklvcnNaeWlJVWc5MjBzM0VhRHRF?=
 =?utf-8?B?UVdBU0FBZ2d2YVp3bC9VcnR3dXd3S202KzgyS05kSDhJa2hjK2RYczYxNmM2?=
 =?utf-8?B?ZUZ6dGdKbTFuTDhjZHdiMEdxTmFFeUlYZnJMWjNoWGJzM3pLWS9pK0g4Njcx?=
 =?utf-8?B?ekFzcWd3ZnFneGkxTzRRQ2grMmNCRGhCVlhiMnlVSC9EenNlR0Jia3V5QWc3?=
 =?utf-8?B?Qzg0cnI3SUE2TWc5YVFnQXhKS05zMVhxdGRJVVViT092SzJBazVaWEN6ZFF4?=
 =?utf-8?B?anBHdFF2UmhtV2h6S1NnQ3haQlFpdHBFTGJnNlBnUWFRWHBsWVpISHdNNmUv?=
 =?utf-8?B?MEN3MVRueTdNZXQ5eDZXTHlFcFZuY25DMk9qM3FScDVxWlg2TzZGSFVTTnJr?=
 =?utf-8?B?YWRkN3JZaDIrSlJoSEs5UU42Sko1dWRzTGhHSndYdWJiTndYZndydE53MFFz?=
 =?utf-8?B?T3BORmlFZ3FJc2hGamR0ZnNCcG5KdlFpWlBKMWpXYzdKMlpPS2t4UFVOOCta?=
 =?utf-8?B?RjM2RFhRZ1lFQ1UwVzRxdzA1Zlg5N0dRSUxGMjIwV2JqMngydkxVVi9lR3dp?=
 =?utf-8?B?dWhsM2NndHFmR3hFRm1yY2FhS2JjRnZTalI3ZytQcXNIa0lBR3B1S1M1ZWhh?=
 =?utf-8?B?Wi9iL0p2VEpTcGN4bGRGdldhS0s0ZkI4Q2ZIWEVBK0xjMHNONzBQT2NsdkZW?=
 =?utf-8?B?OWtyUnlXTy9vaVZBc3lKMjVHVWdXTmtTSXBKWVJUeTlDT2wxc2lReXBDenEr?=
 =?utf-8?B?V3QrU1BnOUtqL1FYWTVWeGRxZC9wR2xBWFJvc3F2ZGozaUhxQVFVcEFUU01j?=
 =?utf-8?B?ZDNTczZTeUoxRlVzUGpXb0VScmlFZGlHT3YxSllNQ0tqQURXMFRaYmFCMjYz?=
 =?utf-8?B?TXA2TlhtWFdOZEpwNzZQMTNtYmErc2J0dzdCUktDakY1dzR3WVVmUmNSR1V3?=
 =?utf-8?B?SHRqZnJwY0llYWpoczRxVStWR2g5aXIveEtwTlFXZjJVcVJmRDFaYlFQY0F3?=
 =?utf-8?B?cnNLYjdqTjAwRG9uSDZNUFdKRTY2RUFLSk1ONVhDbjViM0g2Q0k5eUdZV0pm?=
 =?utf-8?B?Zm5nb0sxM25QRDJldFI3WTJIWG9GakxNRUN2clY4SmUwTEpBSnhFbS9rV3BT?=
 =?utf-8?B?dGs4U1VCVkY4Q0JzZFBtaHdIanhzRDIvSzJtQTU1Y3Q0TEdJZWRTa1B4ajFw?=
 =?utf-8?B?K2JwSEdJbjFyWlNuR3ZKV0FOU00rSGRzSXNPb2Y4NGJwTHFlVm82cW84bVNF?=
 =?utf-8?B?RU9WM0hkTFpJaXVMU2RlUnZsbGxiTHZrK3R6andGcWJpdTI5ODhLdmlKYURq?=
 =?utf-8?B?dDBDRmcrSmIraEpWOFFsYjUzNjRIYUlha0ZWd1dlVGZ3NXNhMU5qS01jeVBy?=
 =?utf-8?B?WVN6N2ljWk50Q1BUY0gycWpLblJ0UGlodjU0SDZHTWoxUE5QZmVVMU9JaXJQ?=
 =?utf-8?B?WTJzSk42LytFUUw4TG9nb2ZDbURiay80eXZvbzhtS3B1cWs0eExHb3ZkeHFR?=
 =?utf-8?B?ZGJ2QzZ5NVdpRnJvQ1lkMkYyeEkvaXV4czNCTzlZOTBYQUc3U0FsbU9CMUF4?=
 =?utf-8?B?Y2ZKYm9QaXdsSFNybFpzSG8xQVhjZTF2OFZLUDl0ZmNFWHNER0xNYktJT25h?=
 =?utf-8?B?bG5iM3JiNjRBY21jZUliT3RwQnBlbi9BaTQrVXEwWFVRcEZja21XSkRQcDl6?=
 =?utf-8?B?ZzJvcW1OeHhzZk5vZDdxdlIyakFIS3dIL0pyeExCUkpqUStVeGZBbnVWYk5N?=
 =?utf-8?B?MUVWVElNUTV6UDkwNzhScU80Z0VRemtpbFkyenFkOHFpMXZ0ZlRjbkI4TlJB?=
 =?utf-8?B?Wkl2alM0bGU3bVNUbFh1bFRvaTlSOGkrSVhmKy9Vb09HdGJVcks2UWNUeEk3?=
 =?utf-8?B?UXNraER0K0Q1d05MMmFveHIzbWFXMmVRZ0JQQmJoU0pzQUM1NHdyZlpkek50?=
 =?utf-8?B?cFdDWGNTZzNlckxUd1dsR3NudUU5RTkwdVFaYm8vdGxsTmVEeURzV3NlNW5w?=
 =?utf-8?Q?vn4WANfeU5SO/1w3t4gdJjWVF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c5cbd7-d2ed-4e85-1304-08dcc8cbc288
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 08:14:24.9746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VJN38BUlAG0eNXo6O5/t5nLNzhZQPKSaFBraxlzrXFhnBi3UyaDvuDLJfDHI9bh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336
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

Am 29.08.24 um 19:12 schrieb Boris Brezillon:
> dma_fence objects created by an entity might outlive the
> drm_gpu_scheduler this entity was bound to if those fences are retained
> by other other objects, like a dma_buf resv. This means that
> drm_sched_fence::sched might be invalid when the resv is walked, which
> in turn leads to a UAF when dma_fence_ops::get_timeline_name() is called.
>
> This probably went unnoticed so far, because the drm_gpu_scheduler had
> the lifetime of the drm_device, so, unless you were removing the device,
> there were no reasons for the scheduler to be gone before its fences.

Nope, that is intentional design. get_timeline_name() is not safe to be 
called after the fence signaled because that would causes circular 
dependency problems.

E.g. when you have hardware fences it can happen that fences reference a 
driver module (for the function printing the name) and the module in 
turn keeps fences around.

So you easily end up with a module you can never unload.


> With the introduction of a new model where each entity has its own
> drm_gpu_scheduler instance, this situation is likely to happen every time
> a GPU context is destroyed and some of its fences remain attached to
> dma_buf objects still owned by other drivers/processes.
>
> In order to make drm_sched_fence_get_timeline_name() safe, we need to
> copy the scheduler name into our own refcounted object that's only
> destroyed when both the scheduler and all its fences are gone.
>
> The fact drm_sched_fence might have a reference to the drm_gpu_scheduler
> even after it's been released is worrisome though, but I'd rather
> discuss that with everyone than come up with a solution that's likely
> to end up being rejected.
>
> Note that the bug was found while repeatedly reading dma_buf's debugfs
> file, which, at some point, calls dma_resv_describe() on a resv that
> contains signalled fences coming from a destroyed GPU context.
> AFAIK, there's nothing invalid there.

Yeah but reading debugfs is not guaranteed to crash the kernel.

On the other hand the approach with a kref'ed string looks rather sane 
to me. One comment on this below.

>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   drivers/gpu/drm/scheduler/sched_fence.c |  8 +++-
>   drivers/gpu/drm/scheduler/sched_main.c  | 18 ++++++++-
>   include/drm/gpu_scheduler.h             | 52 +++++++++++++++++++++++++
>   3 files changed, 75 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 0f35f009b9d3..efa2a71d98eb 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>   static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>   {
>   	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> -	return (const char *)fence->sched->name;
> +	return (const char *)fence->timeline->name;
>   }
>   
>   static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
> @@ -112,8 +112,10 @@ static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
>    */
>   void drm_sched_fence_free(struct drm_sched_fence *fence)
>   {
> +	drm_sched_fence_timeline_put(fence->timeline);
> +
>   	/* This function should not be called if the fence has been initialized. */
> -	if (!WARN_ON_ONCE(fence->sched))
> +	if (!WARN_ON_ONCE(fence->timeline))
>   		kmem_cache_free(sched_fence_slab, fence);
>   }
>   
> @@ -224,6 +226,8 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>   	unsigned seq;
>   
>   	fence->sched = entity->rq->sched;
> +	fence->timeline = fence->sched->fence_timeline;
> +	drm_sched_fence_timeline_get(fence->timeline);
>   	seq = atomic_inc_return(&entity->fence_seq);
>   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>   		       &fence->lock, entity->fence_context, seq);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7e90c9f95611..1e31a9c8ce15 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1288,10 +1288,21 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		sched->own_submit_wq = true;
>   	}
>   
> +	sched->fence_timeline = kzalloc(sizeof(*sched->fence_timeline), GFP_KERNEL);
> +	if (!sched->fence_timeline)
> +		goto Out_check_own;
> +
> +	sched->fence_timeline->name = kasprintf(GFP_KERNEL, "%s", sched->name);
> +	if (!sched->fence_timeline->name)
> +		goto Out_free_fence_timeline;
> +
> +	kref_init(&sched->fence_timeline->kref);
> +
>   	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
>   					GFP_KERNEL | __GFP_ZERO);
>   	if (!sched->sched_rq)
> -		goto Out_check_own;
> +		goto Out_free_fence_timeline;
> +
>   	sched->num_rqs = num_rqs;
>   	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>   		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
> @@ -1319,6 +1330,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   
>   	kfree(sched->sched_rq);
>   	sched->sched_rq = NULL;
> +Out_free_fence_timeline:
> +	if (sched->fence_timeline)
> +		kfree(sched->fence_timeline->name);
> +	kfree(sched->fence_timeline);
>   Out_check_own:
>   	if (sched->own_submit_wq)
>   		destroy_workqueue(sched->submit_wq);
> @@ -1367,6 +1382,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   	sched->ready = false;
>   	kfree(sched->sched_rq);
>   	sched->sched_rq = NULL;
> +	drm_sched_fence_timeline_put(sched->fence_timeline);
>   }
>   EXPORT_SYMBOL(drm_sched_fini);
>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 5acc64954a88..615ca89f77dc 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -261,6 +261,52 @@ struct drm_sched_rq {
>   	struct rb_root_cached		rb_tree_root;
>   };
>   
> +/**
> + * struct drm_sched_fence_timeline - Wrapped around the timeline name
> + *
> + * This is needed to cope with the fact dma_fence objects created by
> + * an entity might outlive the drm_gpu_scheduler this entity was bound
> + * to, making drm_sched_fence::sched invalid and leading to a UAF when
> + * dma_fence_ops::get_timeline_name() is called.
> + */
> +struct drm_sched_fence_timeline {
> +	/** @kref: Reference count of this timeline object. */
> +	struct kref			kref;
> +
> +	/**
> +	 * @name: Name of the timeline.
> +	 *
> +	 * This is currently a copy of drm_gpu_scheduler::name.
> +	 */
> +	const char			*name;

Make that a char name[] and embed the name into the structure. The macro 
struct_size() can be used to calculate the size.

> +};
> +
> +static inline void
> +drm_sched_fence_timeline_release(struct kref *kref)
> +{
> +	struct drm_sched_fence_timeline *tl =
> +		container_of(kref, struct drm_sched_fence_timeline, kref);
> +
> +	kfree(tl->name);
> +	kfree(tl);

This avoids having two allocations for the timeline name.

Regards,
Christian.

> +}
> +
> +static inline void
> +drm_sched_fence_timeline_put(struct drm_sched_fence_timeline *tl)
> +{
> +	if (tl)
> +		kref_put(&tl->kref, drm_sched_fence_timeline_release);
> +}
> +
> +static inline struct drm_sched_fence_timeline *
> +drm_sched_fence_timeline_get(struct drm_sched_fence_timeline *tl)
> +{
> +	if (tl)
> +		kref_get(&tl->kref);
> +
> +	return tl;
> +}
> +
>   /**
>    * struct drm_sched_fence - fences corresponding to the scheduling of a job.
>    */
> @@ -289,6 +335,9 @@ struct drm_sched_fence {
>   	 */
>   	ktime_t				deadline;
>   
> +        /** @timeline: the timeline this fence belongs to. */
> +	struct drm_sched_fence_timeline	*timeline;
> +
>           /**
>            * @parent: the fence returned by &drm_sched_backend_ops.run_job
>            * when scheduling the job on hardware. We signal the
> @@ -488,6 +537,8 @@ struct drm_sched_backend_ops {
>    * @credit_count: the current credit count of this scheduler
>    * @timeout: the time after which a job is removed from the scheduler.
>    * @name: name of the ring for which this scheduler is being used.
> + * @fence_timeline: fence timeline that will be passed to fences created by
> + *                  and entity that's bound to this scheduler.
>    * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
>    *           as there's usually one run-queue per priority, but could be less.
>    * @sched_rq: An allocated array of run-queues of size @num_rqs;
> @@ -521,6 +572,7 @@ struct drm_gpu_scheduler {
>   	atomic_t			credit_count;
>   	long				timeout;
>   	const char			*name;
> +	struct drm_sched_fence_timeline	*fence_timeline;
>   	u32                             num_rqs;
>   	struct drm_sched_rq             **sched_rq;
>   	wait_queue_head_t		job_scheduled;

