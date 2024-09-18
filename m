Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10E597BBB4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 13:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6696D10E148;
	Wed, 18 Sep 2024 11:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b9Q9qXZs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934ED10E148;
 Wed, 18 Sep 2024 11:42:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nM1hBd7IjuQTalVw42Ab2vv9GLhldH34iHtdl4hKJwHbKR6tTp9qRjNkH/yvZn5TsVt+BWq0qBe6RP8NRzzXwhquzygwSCJbwZXrfE20bTt401vVTAKIlBm0Gjydqpd98r/1Pvbov2K1DohLWI9GCISj0qYz49of1tROAu5S2beah2Nt/ENgHSNT+4OD10XSoVvqD+SFOwLj46o91j/Ap5lh+4CXlVsOkmBfa9Ei3E1Qshwpxz+9/wckRIg6Ql6LI7Mpu8KKvefQspI/+AVU5bgqD9zSHBqVhf/1ecOLtUAaRYVy43vBvnKbxu1gjEtVjR6DvAOq6m7Ld3blOU573w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDHw3m7CXT4ruN32mTaR3zNpaL05nxkRaAawKljI71s=;
 b=h7HVVyUl5TlEeQ9tqhIh7UInDhwVQl+2V94hUH9eaUJUNeklLjQOPqthGrNWOd+NlOBKrMsd9SBtEmZUycQ8xFoi+Uhnu5IMaBoIHuvij/y+loax1loOKnCub9N6ZslaBKsbewBwuTlm/rD8XloP7BFZYreNQm/IPvwR6XstsFo1ZuAWeogUNQlHxKxPmLvBpbC0PPoDhVAEj8hBaPChg6QaLTVYaNUlvD5QASadynKlrjOWSASYCN00CeMqftXZJSYzU85qCd78cSKF9a1xR2DJHJ3ucbbo+9VyFVaePX9r9J1Adb5yWMRxZdBiQfCibd4rAx4mhnL4Yhjwu2NipA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDHw3m7CXT4ruN32mTaR3zNpaL05nxkRaAawKljI71s=;
 b=b9Q9qXZsfqCiJGOqzAEF4GP1sQxUMLQXke68lfDIwg0WqjNymkl6pw67I3BvnfpoVrU2VlvzRsOmd2Ly+Jq4YX6+theCgPDbSUKmZkFDiDe8hW5867vOhyHLw2mXRF/mGB5mHGuf65c5GZA+PR4gmO1JuaJ273UzQBH2IVty93Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.23; Wed, 18 Sep 2024 11:42:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 11:42:31 +0000
Message-ID: <d5770ded-cb46-4021-a3c3-851031c09f94@amd.com>
Date: Wed, 18 Sep 2024 13:42:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] drm/ttm: Balance ttm_resource_cursor_init() and
 ttm_resource_cursor_fini()
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20240916145112.3336-1-thomas.hellstrom@linux.intel.com>
 <20240916145112.3336-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240916145112.3336-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: 75830107-2fe2-409f-ee7a-08dcd7d6fb0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDMyQ0p0RG1aZXBLNkpXeXMyeWdiYVZ1emEwejUxd0ZDV2Q1c2hMM2NGbGZ4?=
 =?utf-8?B?bTNBNGYybjdmL01VbVdkWlEwSUp3aEhWdm9qYm5iSEZTYXJnbDJJRU9YdTlL?=
 =?utf-8?B?MHc5K2R0cnF0Vk9iSHhsaTdDblRLZGlhM1ozWnB5UlFmQTZZZGdUemwxNWRM?=
 =?utf-8?B?ZWhDUHFDMUp2V2JveWNibW04VFBMK1BCMmZYL0NneTJpYXpXWGlsd29CNmxz?=
 =?utf-8?B?U1V1SmJjb3h4eDhyMGU5bW9PV3pMNnEraTFWZldvbXR0R29sY21yL0xFekls?=
 =?utf-8?B?T2lQanhvclc2dGpHQ3d4TnkvTGtDNmY3M0FKNkJwbzEwRkxGVDV2VTU2eEJ4?=
 =?utf-8?B?MHdSalBVUGRLcW82ZEhQaTRLNzg0NmQ4Rmp4VTBVV1pMUjV0dE5pQWFnZGdP?=
 =?utf-8?B?Z0lBRTBaUWRaQTRCNFkvVzNTL2JVbk42djhSQUdqRXZlTnQyZXlXUEJDK2ls?=
 =?utf-8?B?bUFhelN3NHp0dVlJOTlNTFJZUkFVc0djRHVpVTVRZTVnN2dhYWRWSUhUc01Q?=
 =?utf-8?B?Z0RUVVBjNG84dGxwNERBTzBHVk5WdGExb0JiYmU4bGM1RGwvWmtSY25Fd0VE?=
 =?utf-8?B?WWY0RlNQS01udDRqVDM2V0F5SG9ESDhidHIzeGtJQ21jYldhZmQrYzZmVTlC?=
 =?utf-8?B?TmxndFI0SG9xZGxFNGZZR0U3OC9JYzROdjRTc28vbGQzbTkvRTdiVFF1NVVh?=
 =?utf-8?B?elZTbFlqYkI4eGtyRW5YMnhxRitNUkVsbWVTU0RDSFhhNXpVY3d6MDFQTEJi?=
 =?utf-8?B?RUxBSFMrN1A3c3R3YnR2dUJUWDVCbkZYMjdjR2lHakI3VE9BZDlsRTF5dXoy?=
 =?utf-8?B?djhzVzZaOS85aFVqM1JaZWlrcExxTUY4T0EyYTU5aVBDaDZEdVNockhmN2Jx?=
 =?utf-8?B?aTBrK2txaXZOV3pOMExDbUk4SGNMSEREUGppMExHNHFCZXdFSmw1U0NjNTBi?=
 =?utf-8?B?UVhCaWUwMVo0MzBzZm9EU04vV0w5U3BqZHYyTU1qTGhFMm5UYjRnM0E0K2J2?=
 =?utf-8?B?UWRZNFE4V1o1SUVmYmtHNGVBYnVZS3BaWUNGNjNuTGcvcFdyTFliemJhZTYv?=
 =?utf-8?B?aGJGWkFGTWN5VXRVQURHRnJvaWZKSmczei9pWG1aMzJobEQxTGU2cFNXT0pD?=
 =?utf-8?B?NklqSTlZQXVRc3pFRDk1MWwwZk5hc0ltTlZaRFhrNzAwT2VVVEZtZCs2eUVT?=
 =?utf-8?B?c216MjhIN3VTQWpTOUZpZkxubGN1KzRTYWJBRkprSjhDOUdvMDk5NkxneVFs?=
 =?utf-8?B?U2FZSnVjbEt5RWdkYnBHMitldUJzeEtRbEM5MnFjdDZLcG5rYVQ4WXM1NDB2?=
 =?utf-8?B?TmR6RjZkNWtBZTRlbmI3MlNUMDdNNEpybzZvcENNZUpBL1hnSEFDcDlPakVl?=
 =?utf-8?B?UEVvZlN1NzUyUTdyaEx6bEpBa29MNUZMTGhmbERnemw5dWZEL2tIMFBseFdD?=
 =?utf-8?B?cis5NVpLckNKbDhGZ0Y5MldVNmJMY3VsVXJaN0NxMmFXRzFpOGlEQUZ6WHpu?=
 =?utf-8?B?dGZRRlhVOG1DeVYya1VRYzh6ZWlwODdJdStkTEcvL2srcHR6Z1QzYlZjUzZp?=
 =?utf-8?B?bFhsTmJzb3djL0tRUjVYenR3NWlRdk5OZnZBdmVmNEg1d1h0QlYrMVVkZHFq?=
 =?utf-8?B?bEpTdnJVajhqZGcxQzRwMWRLZWdDU1Y5YTZKTGM2RllKZ3g5VEI2N1Fzdk9E?=
 =?utf-8?B?MUE0T2pLQTJwNmFiTkl0VzhURGQvdU9JUitpanRvUmtvVm16clljYmQ3cWRP?=
 =?utf-8?B?Y2Z6UXVkQURhL0lreXpJc3k2K0VFUWM0eUx6cFJPOEtmNE1aaURZUzBvVFBy?=
 =?utf-8?B?VHMvMXYwVGw4Vm9TQWpuQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDNmT0JPNUp1NUt5TXAydVptbkNsVHJsQ1JvZi9nZEMwQWh6cFI0NHNhbmN1?=
 =?utf-8?B?dmRDbnJ1QXJQOFFBWEkyU1E5UFMzdngyNzAzbDZzMHp0NHdEY2RES2lYV20v?=
 =?utf-8?B?cTRVSExnbElVb0swMFFCR0FxSkJkZ3M1V1krVGVGN2kyL3pPK1RsNFlFNk1Y?=
 =?utf-8?B?V2hwZHRpY1RhSVlBL2F3U0RhUDJLNjJqVGF6eUlYaWwxRiszUGNNV1UvKzJ0?=
 =?utf-8?B?MUw1WVVGUy9CbWIzdWlqL1FFd0dMUm10RmROQmoyZ1Z0bmdzM3lNOTcvcnhu?=
 =?utf-8?B?MXZqL2E4eHF2d3RZWmc1ckJvNi9UYjExWVRjQ3dkL3NvekRDMFlpa3NIcTNL?=
 =?utf-8?B?SStRMnJ0OWNvcUo1YnNEOEZZNUQ2K2xhOW5WWkd1VUpyRmt6L1NtOWFlRmxF?=
 =?utf-8?B?TFhWRXp5dy9hVWpYYkFsN1VCbjcwT1lMOU85ei92bFJZYkV1SnVHeGZ4cHV5?=
 =?utf-8?B?YVhuZ0dzRHFiZ1pIc25melNvc0t2SXN6SG9PUkIzeW45ZlBxK3Rnb1VzUjlN?=
 =?utf-8?B?c01XVlFFdjhneE9WMkVUUGI2VjR1V3cxUHdJQU1pOWZEWEhUa2MzUUUzaWpR?=
 =?utf-8?B?b09aN2RvN25YQUdnaGFlTU5GbG9PUmFUVzFWbHRLZ2k2QmJSVkFJczkrdStJ?=
 =?utf-8?B?Um5xN0lSaVFUbzJCS2k3WkIzSHkvdldFbnN6TUJlQ2NEZys0Z29PN01VNlV4?=
 =?utf-8?B?MnhyTTJETVc5enVPMjJ5Yy9BeG1QclNUYWswQkUyeEFKWW5sL1dPQUNaZ3Jk?=
 =?utf-8?B?cjNLazd1d05XbDM4OHhkODUzWmVEWlhlQW9scWRoVzlFVlBOK2V0S0hjSllS?=
 =?utf-8?B?VWk5eDJvemxKMUc4NFhlQWlaejNlUE83dXdxTmdJOWxSTmJ4VklvaC9Kd25t?=
 =?utf-8?B?M09pRVJrMWF6WXM4TkJmRWFYR2lKaE56OHprQnYwb0poa0dkelBGU2pTRmJx?=
 =?utf-8?B?YjBXOXV0Qlp3OGNCYkwrT0hyRTZUTmUrRUdWaEdiWExzQ2hHN2hJTlk1alpu?=
 =?utf-8?B?SmFhb21RY0ZlY3lFK1hRQTJRMlRwbG9WSVB4aEJQcGlwSU1hdkIrdXpEYmc0?=
 =?utf-8?B?NjBxbE9nRGZJZCtrdlowbkRZanlOTnJ4SUtVditmYnhudnpEYTZDVEhlS1dz?=
 =?utf-8?B?eFdtcTlpc2hPRGhXdGZ5UTVaSUw5RGRaOGQ5TUtoMlVJbmUzTFFVak82Z1I5?=
 =?utf-8?B?ekFaWHZFWkZVVDFTejBFRTV6OFBRR1NRQU5kWXMxVW9ZVGxoR2tJZ3l3YUdU?=
 =?utf-8?B?OGMyWUF6dVFRMlZiMlBWM3JwZFB6Y1RCc0htRkNUYW9KRis4anFHdGE3U2xl?=
 =?utf-8?B?VS8xdFcrMDhSSDBYZVBCTVh0VW13UWo3Zmx1ZlpPZ24vVmdIR3F3cGk1Qys4?=
 =?utf-8?B?c01HMDRvUEhNS21vUlA0c1FmNC9IM1lxTm5iN09RdUxOQ1VPL2MvSXE1cXBQ?=
 =?utf-8?B?aXdiSTNmRXVUWmR3NU96YTZBYmxkb1B1SXdKTTJFZjFMK2ZmNlBWdTZBMGxY?=
 =?utf-8?B?QTBFdVZ5d2VOTG0yRlBLK1hvRy9PNTlINjBlWEsrWExoenNLdmNWNUpHN2U4?=
 =?utf-8?B?WmV6VTNqV2ZaNSsyTkxqT244ZVZUeFRPRnV3bnhkM1hySHAwUnY1TVluclBl?=
 =?utf-8?B?Mmdib2M3TEoyemtpbXlHREh0L2I0N2M1RTV1R3RUQmNjUTFxVVlVTWY3MnpB?=
 =?utf-8?B?TGRoM2IvRjV6THFxTXNmdlM0Um5EMVY4U1NCRDJJbUJjaTVPUlRRTnMwaXZr?=
 =?utf-8?B?TG4rNC9qVC9RWHAvcXFLLzl4OXNZS09td1hUWFUrZXRxcncwdVJhYVVRdzF2?=
 =?utf-8?B?ZXlxMVpQY3dhWEFPVzIyQjdVTXp6dWZIMlJsaXE0VlNLYUh0UWI0VXJPV0pN?=
 =?utf-8?B?Tnd6QUhqSm16VjFpK3doZGhkUWV4MXg4RlFudEZEYUJUQ1liZEFDV281UkZ3?=
 =?utf-8?B?U3JXNmtSSW8zUUthMHo3MllzNnZTL2pCWGF5WmxWTU51ZXUvYjV5WXV6eHN3?=
 =?utf-8?B?ZlRiaEdFUEkxN0hza0tSRFF6WlJtMk5YT1FJVEZiSHBVaUZqRkhwRmJnOXd2?=
 =?utf-8?B?MHR1ZUNpVWZiSjBYQlJ6S3NmTm04SUF6cCsxSHRKYnFYUDdlTkRwNERuaXhK?=
 =?utf-8?Q?Gz4U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75830107-2fe2-409f-ee7a-08dcd7d6fb0e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 11:42:31.7429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVsOmkCCdvc/dTSTNGxXLB+1RRqrwLAxWWNb8Zspas8f+hB07yx0O4HBFZly3YUA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6446
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

Am 16.09.24 um 16:51 schrieb Thomas Hellström:
> Make the interface more symmetric by providing and using a
> ttm_resource_cursor_init().
>
> v10:
> - Fix a stray newline (Matthew Brost)
> - Update kerneldoc (Matthew Brost)
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c       |  3 ++-
>   drivers/gpu/drm/ttm/ttm_bo_util.c  |  3 ++-
>   drivers/gpu/drm/ttm/ttm_resource.c | 35 ++++++++++++++++++++----------
>   include/drm/ttm/ttm_resource.h     | 11 +++++-----
>   4 files changed, 34 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 320592435252..06a237d420dc 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -450,7 +450,8 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man
>   	int ret = 0;
>   
>   	spin_lock(&bdev->lru_lock);
> -	res = ttm_resource_manager_first(man, &cursor);
> +	ttm_resource_cursor_init(&cursor, man);
> +	res = ttm_resource_manager_first(&cursor);
>   	ttm_resource_cursor_fini(&cursor);
>   	if (!res) {
>   		ret = -ENOENT;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 3c07f4712d5c..454a51239614 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -865,7 +865,8 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>   	s64 lret;
>   
>   	spin_lock(&bdev->lru_lock);
> -	ttm_resource_manager_for_each_res(man, &cursor, res) {
> +	ttm_resource_cursor_init(&cursor, man);
> +	ttm_resource_manager_for_each_res(&cursor, res) {
>   		struct ttm_buffer_object *bo = res->bo;
>   		bool bo_needs_unlock = false;
>   		bool bo_locked = false;
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 6d764ba88aab..2b69229f127c 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -80,6 +80,23 @@ static void ttm_bulk_move_drop_cursors(struct ttm_lru_bulk_move *bulk)
>   		ttm_resource_cursor_clear_bulk(cursor);
>   }
>   
> +/**
> + * ttm_resource_cursor_init() - Initialize a struct ttm_resource_cursor
> + * @cursor: The cursor to initialize.
> + * @man: The resource manager.
> + *
> + * Initialize the cursor before using it for iteration.
> + */
> +void ttm_resource_cursor_init(struct ttm_resource_cursor *cursor,
> +			      struct ttm_resource_manager *man)
> +{
> +	cursor->priority = 0;
> +	cursor->man = man;
> +	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> +	INIT_LIST_HEAD(&cursor->bulk_link);
> +	INIT_LIST_HEAD(&cursor->hitch.link);
> +}
> +
>   /**
>    * ttm_resource_cursor_fini() - Finalize the LRU list cursor usage
>    * @cursor: The struct ttm_resource_cursor to finalize.
> @@ -577,7 +594,6 @@ ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
>   /**
>    * ttm_resource_manager_first() - Start iterating over the resources
>    * of a resource manager
> - * @man: resource manager to iterate over
>    * @cursor: cursor to record the position
>    *
>    * Initializes the cursor and starts iterating. When done iterating,
> @@ -586,17 +602,16 @@ ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
>    * Return: The first resource from the resource manager.
>    */
>   struct ttm_resource *
> -ttm_resource_manager_first(struct ttm_resource_manager *man,
> -			   struct ttm_resource_cursor *cursor)
> +ttm_resource_manager_first(struct ttm_resource_cursor *cursor)
>   {
> -	lockdep_assert_held(&man->bdev->lru_lock);
> +	struct ttm_resource_manager *man = cursor->man;
>   
> -	cursor->priority = 0;
> -	cursor->man = man;
> -	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> -	INIT_LIST_HEAD(&cursor->bulk_link);
> -	list_add(&cursor->hitch.link, &man->lru[cursor->priority]);
> +	if (WARN_ON_ONCE(!man))
> +		return NULL;
> +
> +	lockdep_assert_held(&man->bdev->lru_lock);
>   
> +	list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
>   	return ttm_resource_manager_next(cursor);
>   }
>   
> @@ -632,8 +647,6 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>   		ttm_resource_cursor_clear_bulk(cursor);
>   	}
>   
> -	ttm_resource_cursor_fini(cursor);
> -
>   	return NULL;
>   }
>   
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index be034be56ba1..e1f3b95d73b6 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -325,6 +325,9 @@ struct ttm_resource_cursor {
>   	unsigned int priority;
>   };
>   
> +void ttm_resource_cursor_init(struct ttm_resource_cursor *cursor,
> +			      struct ttm_resource_manager *man);
> +
>   void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
>   
>   /**
> @@ -456,8 +459,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>   				struct drm_printer *p);
>   
>   struct ttm_resource *
> -ttm_resource_manager_first(struct ttm_resource_manager *man,
> -			   struct ttm_resource_cursor *cursor);
> +ttm_resource_manager_first(struct ttm_resource_cursor *cursor);
>   struct ttm_resource *
>   ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
>   
> @@ -466,14 +468,13 @@ ttm_lru_first_res_or_null(struct list_head *head);
>   
>   /**
>    * ttm_resource_manager_for_each_res - iterate over all resources
> - * @man: the resource manager
>    * @cursor: struct ttm_resource_cursor for the current position
>    * @res: the current resource
>    *
>    * Iterate over all the evictable resources in a resource manager.
>    */
> -#define ttm_resource_manager_for_each_res(man, cursor, res)		\
> -	for (res = ttm_resource_manager_first(man, cursor); res;	\
> +#define ttm_resource_manager_for_each_res(cursor, res)	\
> +	for (res = ttm_resource_manager_first(cursor); res;	\
>   	     res = ttm_resource_manager_next(cursor))
>   
>   struct ttm_kmap_iter *

