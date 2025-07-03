Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9A8AF6C47
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 10:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A71910E7E1;
	Thu,  3 Jul 2025 08:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T4jY+aEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB4910E7E1;
 Thu,  3 Jul 2025 08:00:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4l+pIKnztUcTpA9Tcjw+Mb/iFIoy4wd21UkmjsN1OBZ1eU1QY839/ekHbATWrxu3nE8p8ZCTL4ewu+kiNxzdQyrC8NETnJnt7EeTSWEWaMrw4mHuApFQZ3sL6SqaAav2P4mZxGo4wfAxBGkzyg5raaqf0sO9bIyk+0AMDLkHcG5uQeZurrf8s1OdkRVyLjnPvLn/q1v5FFFCwXT5rabeRgXAiLt02trOhLnoOBUdn3SSMD9pmb/VJrRReUd52Gh1En1LOYe0RrJhhL/5+s5TLuLAcSdbPFIiYBz4XgeAGaCPPsmVAvuEw/67rs4CmhQr6wKjFkT6wSpN/ezp3O6Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUqzbKed81c/j/aGBPBgIT7BvF3Z2kHKFkr3pi8YneQ=;
 b=e2JZlYg2qSBfMswVHdSW+6MJzx7T3FOkPH2XioncOy4Sl1JAknuBNCfLkt/riW+N6C/Z0q+FnYGNXRi4EsuV/08aPHxY2dJXgkCMzRmYVORzNX2vySS5eapw49H2ZJhhJiFJUVkq9iuZc8xtwvguVNQ1hpQMMGCdI+WUeVEefjXhOLINiVbHDM3WT+OrkGRWJsTg9ZfIHdXmljGYup+DiaC67N3FwWgWr3drZbArHFs8OPbQ4XGjn5YmIBhh/ul7X6qDxrdOn3qcebO093LBZPqxpaMTbr6nimQyZGiJS3ys80ifLnI/k0jP8BKJKTz0cPGZB2GKmEfX2ST+3U+5Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUqzbKed81c/j/aGBPBgIT7BvF3Z2kHKFkr3pi8YneQ=;
 b=T4jY+aEzAAMJn4Y7jHL3F7CtxoqZmuME8QhbOVauA5laQRQ8F4SAuktWa7UkTWXS//XVmSAIar6cdss8c5JrZHIkXMDISUR8effwT0kq/Wc7yM6hX2le2oLNiVz20OY6HbAahuxId1EIF23pZMyfkyJ3tVTDMImyaUZtreq24Lk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB7931.namprd12.prod.outlook.com (2603:10b6:510:289::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Thu, 3 Jul
 2025 08:00:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 08:00:10 +0000
Message-ID: <586cff2c-bf69-4202-8ca5-67a3f30d80ec@amd.com>
Date: Thu, 3 Jul 2025 10:00:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] drm/amdgpu: add debugfs support for VM pagetable
 per client
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
 linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20250701164948.8105-1-sunil.khatri@amd.com>
 <20250701164948.8105-4-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250701164948.8105-4-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0258.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 6529ce00-2ee3-4d60-5952-08ddba07a1c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzN2ekhTL29mVVRYbng4Q3JLODl6b2VlT2pQMzVIMmdHSTZQTkFUdTZUWTZI?=
 =?utf-8?B?N1ZqNEh3UGdRK3Z5M1pYRldsN3kra2d0eHBLYTM1YmFrWWxmb05mRyswUUNP?=
 =?utf-8?B?WU4wM29WQk95azE0RjJDMHQ2VjYvSDBOSlNjdS9nOHQrQzREdTBLWjhobk12?=
 =?utf-8?B?TUNSYm5sVkcyT3g5czdaTVgyL3loYmtFcndzWUVVOUhzcTZaSkd4SGVUVUlI?=
 =?utf-8?B?WkRSMlJCei9wdTBZOWx4UStFNWU5TnRjY0t5RGNOZzlGUnBwRjErVWhDZDRW?=
 =?utf-8?B?RjB4VjRwN0tCdU1GS1RxbHgvREYvZGxjTWpmb3NCeFJUN0Rlb3lHQ2lMYVJZ?=
 =?utf-8?B?aUpwdEVxZkFScEtBWEVaY3JlSnJGWDY5RkVpcGIyUTdGTnliZThLZmM3TFBw?=
 =?utf-8?B?TXhTcnM1S3JFdkVPSjRQbGJ3eDNrR3duY3hKRlZ2bk5RN285ck85d21rc3lp?=
 =?utf-8?B?NnQ0a3FKbnFRZTFmblUzcWJibGZpV09JeDB4OWs3bHZuSFR2eWJKMmtVQ0Nh?=
 =?utf-8?B?eWZHWHhnVk0zbkFuUHhhTGV5M0tPWXI0b1h2VEdMcjgvSGgzWGxkKzZmN0RR?=
 =?utf-8?B?Z0srWllTdFZ5UmQ4LythU1BJM3orZHI3eE9lQ0ZtaUR4Uk9xWkphQVQyNEk0?=
 =?utf-8?B?RnJ4Q09CRGw3SUt6UWp2dHpMYklyd1V5TFRvQXlaNlRkVWU2WnJCSkJQZDhI?=
 =?utf-8?B?UDZFT0RaOHJVZGtrQTdTaS9xR3JNRlNoOVZNN25xZHozMmd3RXZ1ZVFSU1JR?=
 =?utf-8?B?TGIxSXViNG15RlE4M240aG40TklmZEJMbXBZSVZCSm50SHd2KytkSTZndkpD?=
 =?utf-8?B?VXpjSktrZ1BYa1BQdXA4ZnJGQ2RENE92RG5sVjdSVTZpcE93QkMvYWw2NFhE?=
 =?utf-8?B?cGVhYmhiMGlkUTJhRktjT1JWb0p2VG55OUw4NWJzUGdBUXJVTG5kTVZ4U2o3?=
 =?utf-8?B?NWN5bVB0ZmRlejduV0c2Q0pKdG5EWjdEUk1JeEx0U3FiUGNHK09wVXdiTXND?=
 =?utf-8?B?K05USzVLNXhtSkpTMHhXNWZ6d3pPdldWdmI0dHdSU1lBYlVXUk0zWFJZN1Z6?=
 =?utf-8?B?dk11b2krOWJySkZOMVlHeWpsRVovWEhST2o3TVJDVGhpTDFxL283dC9yYU8w?=
 =?utf-8?B?L3pvNEJBM21Yb1VsZVpmeFBDMWJCemNIMWladFJzUW5DbHlWSEozSFljVUZ0?=
 =?utf-8?B?UVJEY2N6Rk92dmRGUml5eUJkTkxrRm5HMVRLaitnYjRCNEFnQVdTbnp6VTI0?=
 =?utf-8?B?dlFrRjJzR0dFS2RBSjFNR1RZOGFLTjFSUGkvWWNYV1NreGEyZmV2Ny9sUEl6?=
 =?utf-8?B?by90Y1ZvcG9ZTjRWTGliaEVqeG1ZQ293Q1o3SlJML3pOT0JJWXVyUWZmTm9I?=
 =?utf-8?B?OVR2Q0xaOHJxUjY5eFFpRVhZdUlKOVV4bkpEY1FFZE8zM3JxSkgrR0JvWm1Y?=
 =?utf-8?B?Tlc2L3hTK29VRW5LZWpKbGtSQk5NTjVzb0VIMHZMZTdUcEdObVhlYzE3UDd5?=
 =?utf-8?B?dk9PWDJEZFU5S20xaHFkdS83dzZoNytHQXR2czBFR1NDeFBWZ296VVBsL3Rq?=
 =?utf-8?B?enlFY29EUFNTL3gwUUN2VmVDUVoyQ2FneSs1MW5UUWdqSXNIbzJWdHZ5N2R1?=
 =?utf-8?B?YkZEZEpCMU8rYUxkWmcvVlNWRDF5YWZVTi94R3FKTHNVeVpjN2JQYlp4N0dk?=
 =?utf-8?B?VnZPMSthKy9vWDgwdzBzZ3IrbHFBZzc4M0o2VnVXakp5MmVNR3d4TTdiY3FZ?=
 =?utf-8?B?QW1XVEpoUDB5eGNlMWRVZ3hrazQxTmN1Z3VydGRaRG14Rlh4aXczc2NnMEJk?=
 =?utf-8?B?Y3o3OXVDUXZScTBhRVpwQ0paTFFVc2l0RHRXQWFnL1dSOEoxZkoxSldZVXhx?=
 =?utf-8?B?YlF3eDJ2dUxsTnZuUlFSVXg3OXRxelJ3Wkk2SHhXVnlYNzJvY3B1UDZuRjYr?=
 =?utf-8?Q?4hEZiKqn4e4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFhJb085VVk1a0tSRXdtQnR5ZSsrNWFScTJabHA0U2NKZVllWVY3YVhLMUNw?=
 =?utf-8?B?dGxFSWdEakJCSjZScktJbHRQSURTNlMweUFjTjg3NzlJZWg3VVo1R1Vjdjgv?=
 =?utf-8?B?M0lPU2l4ZmUrMCtodGo1MmEzckdQN1duRVZGeWt5dUdNMjVyd0JPODlvOS9J?=
 =?utf-8?B?eVNzUXcwck9OSHRabnpSTUJ2UW5Ca2g1U2dJOXV1dHVhd3U5ZzUxK0dTYTR1?=
 =?utf-8?B?UTJwdmhNUjIwL1ZDVlYvQnhVZ2JoSExrOFowVVhzdFdmRmNyRGNJekFDYzBQ?=
 =?utf-8?B?RmFmTEc2Y3JvTkxpR3l4eFNUck12SHdTamppaHlXTE9NUGtiR0pHSFd6TGox?=
 =?utf-8?B?SkVjZk95d3l0c0N5MW10amI2ZXN4M2I1Y050bHpCYmRZeXFhRU5URGtqS2k5?=
 =?utf-8?B?SmdZVEJ3Wk1IMWw3K3BWaDR3UlRkTEcxU3g2UVF3Y0plNC9EWERMSkpHSEh1?=
 =?utf-8?B?Tm1FeXhYaWRLbG50TWd4LzdpRzNSdnFjbmxFK2oyQldkaGVuNkQzQ0JQcFl1?=
 =?utf-8?B?enh2MFNQRnRXb2FLT2JDakJ6Smt4OEdOWHdyZmdUaXZ3Y2dZWmswTUpPYThj?=
 =?utf-8?B?cXdJVS9OcXNURHRESHFjejZjckJsZTNLdyt1MkRWOVJZanlET3p6ZTkwMzlr?=
 =?utf-8?B?VzRhMUJselNXZW5FdjlZLzhiMWtUa3pxNDZ0TmhLYUFzbGo3dDVkcFNkNGs3?=
 =?utf-8?B?ZUgvZ05PQlJZQnRBclJUZEQ5aUNROS94Ylo0cEh6OU02NklyaUFsd2JjUGdq?=
 =?utf-8?B?ZzRyVmdLOFhnNnJWK2tBaXY1c2ZGcGMvL3BlVyt3cjVLVFhPRDgyaWhmSTda?=
 =?utf-8?B?SG05YUUvcVJJL2Z4V3pDYjBaZ0F1ajA0Sll0UXVzMDZSL3JnbTR5NHJWYk5N?=
 =?utf-8?B?UzRqeG00dmFPT2xXTHhUM3JkYmFGckljaFRIR2VjUXp6Y2pWS29nNTJCN1Bm?=
 =?utf-8?B?NnhRK2Zxd0RtZE5LK1E3SDZwZjBXRVVpdndjaG1ra29jWisyOGovbjEycHhp?=
 =?utf-8?B?WnYzNk9nTUZ6cXpDWlFnMGFFaEdDY05RcldKYVkvWVY3UmZ2R05MSmFtL0N6?=
 =?utf-8?B?Z1Vrall4UnBwOHhTbE5QVDJhaEZ4ZXhDdkp6UlpSTEJnajJkWWdRRlN4S3Nv?=
 =?utf-8?B?TVRNbTQyRmJYODBoTHJWdEhBUTBWQlpxSHllck5nY05rUWNCVmV4MTE0bHVl?=
 =?utf-8?B?ZFVsTHRUOG9vVjZMYnIxRlFYamg0cHg3bmhNTTRjRytjaWhrU2RrME81ZjMy?=
 =?utf-8?B?cUoveGdpVGxmWjdjdFFIVHA3T2dFSzQwQmJGOWo4MFFaZ0ZYVEh2b3dva0Yz?=
 =?utf-8?B?ZjRicFRUTVQ4QkExMG8zR3BDeU9uRGJVWGVjdm1uMm5ZSFZUSDRlY2NvZGph?=
 =?utf-8?B?eVhjU3BYZ25hdU90QVo5dGtrVCtaZlVpNkhMN2dGVEgyaHQ5aDNmWmlBTk45?=
 =?utf-8?B?a2hIbkk5ZkVHMiszUU5rN0JxTzE2c2xQOEJEamlOZmMwd0ZwWlFlVVVuWFNJ?=
 =?utf-8?B?NCtOc0R3Z1RMUGNyOHpYUWZDSW1FaGlxSE9ZZ3FIVms1elJUeHVwWXpUN1Rk?=
 =?utf-8?B?bzd1QjBWWEdMS1YrSzQva2N4ekV3eHNSdnZIUUl1YSsydWNKUWFhdmFOT3Jl?=
 =?utf-8?B?eksvNHZMbzVrenVZSmx2alFkUU1XbVBMWk5MYXJmZWJJVXlxTHZnWmxoeFc4?=
 =?utf-8?B?UVR2QXFMK0g3V3VFYS9BU3o4OUJaSmJaTlRUV1ZWU1JwSmNueklRNGljd0NN?=
 =?utf-8?B?cEYzVU8wT3hJSFB2c1pmM2FDOEEzSmE4UTFlRkJaR1NORXc5YkpFdTVtRmUz?=
 =?utf-8?B?M29oRW81LzVPSFZ3cFFBN0M3b0pDMG83S3FBcUpmSkFBMFMrdHgrSlBVbitD?=
 =?utf-8?B?clBZNVZhZjZ0SHVUODAzV1owR2JvTDlBSzlKL1pwL256OURMb0ZGblpoWlRQ?=
 =?utf-8?B?MFpwNW0weFlnd3RJS3VrZ2wwajlwQ3gwVC81Z0tFeThnanVVYmxSZ21PQ3pk?=
 =?utf-8?B?azhsOXFUUC8vcWcyaW9sSTlPSHVkd2t6VVJjQW14NmszQ01GY1VDeUpkNDh0?=
 =?utf-8?B?cGZoSzNDalY1dzdFRENLellNcDAxaXdhaHRQM2gxbW9NVkV5RlpMR2pGUFc1?=
 =?utf-8?Q?G9p9hTur9QBpkYuuaPrac6D/J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6529ce00-2ee3-4d60-5952-08ddba07a1c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 08:00:10.0061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YEizRvvOt0wNhWsebwdHW1BejSHniEUV7AZMqLTsdIeYfDrAJtBc7CEgNtLE43n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7931
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

On 01.07.25 18:49, Sunil Khatri wrote:
> Add a debugfs file under the client directory which shares
> the root page table base address of the VM.
> 
> This address could be used to dump the pagetable for debug
> memory issues.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 52 +++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  4 +-
>  5 files changed, 60 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index f81608330a3d..6762dd11f00c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -2131,6 +2131,55 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
>  	return 0;
>  }
>  
> +static int amdgpu_pt_info_read(struct seq_file *m, void *unused)
> +{
> +	struct drm_file *file;
> +	struct amdgpu_fpriv *fpriv;
> +	struct amdgpu_bo *root_bo;
> +	int r;
> +
> +	file = m->private;
> +	if (!file)
> +		return -EINVAL;
> +
> +	fpriv = file->driver_priv;
> +	if (!fpriv && !fpriv->vm.root.bo)
> +		return -ENODEV;
> +
> +	root_bo = amdgpu_bo_ref(fpriv->vm.root.bo);
> +	r = amdgpu_bo_reserve(root_bo, true);
> +	if (r) {
> +		amdgpu_bo_unref(&root_bo);
> +		return -EINVAL;
> +	}
> +
> +	seq_printf(m, "gpu_address: 0x%llx\n", amdgpu_bo_gpu_offset(fpriv->vm.root.bo));
> +
> +	amdgpu_bo_unreserve(root_bo);
> +	amdgpu_bo_unref(&root_bo);
> +
> +	return 0;
> +}
> +
> +static int amdgpu_pt_info_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, amdgpu_pt_info_read, inode->i_private);
> +}
> +
> +static const struct file_operations amdgpu_pt_info_fops = {
> +	.owner = THIS_MODULE,
> +	.open = amdgpu_pt_info_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
> +void amdgpu_debugfs_vm_init(struct drm_file *file)
> +{
> +	debugfs_create_file("vm_pagetable_info", 0444, file->debugfs_client, file,
> +			    &amdgpu_pt_info_fops);
> +}
> +
>  #else
>  int amdgpu_debugfs_init(struct amdgpu_device *adev)
>  {
> @@ -2140,4 +2189,7 @@ int amdgpu_debugfs_regs_init(struct amdgpu_device *adev)
>  {
>  	return 0;
>  }
> +void amdgpu_debugfs_vm_init(struct drm_file *file)
> +{
> +}
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
> index 0425432d8659..e7b3c38e5186 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
> @@ -33,4 +33,5 @@ void amdgpu_debugfs_fence_init(struct amdgpu_device *adev);
>  void amdgpu_debugfs_firmware_init(struct amdgpu_device *adev);
>  void amdgpu_debugfs_gem_init(struct amdgpu_device *adev);
>  void amdgpu_debugfs_mes_event_log_init(struct amdgpu_device *adev);
> +void amdgpu_debugfs_vm_init(struct drm_file *file);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 4aab5e394ce2..d3f16a966c70 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1415,7 +1415,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>  	if (r)
>  		goto error_pasid;
>  
> -	r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id);
> +	r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id, file_priv);
>  	if (r)
>  		goto error_pasid;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index f042372d9f2e..7e31fb5f6f33 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2527,6 +2527,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>   * @adev: amdgpu_device pointer
>   * @vm: requested vm
>   * @xcp_id: GPU partition selection id
> + * @file: drm_file
>   *
>   * Init @vm fields.
>   *
> @@ -2534,7 +2535,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>   * 0 for success, error for failure.
>   */
>  int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
> -		   int32_t xcp_id)
> +		   int32_t xcp_id, struct drm_file *file)
>  {
>  	struct amdgpu_bo *root_bo;
>  	struct amdgpu_bo_vm *root;
> @@ -2610,6 +2611,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	if (r)
>  		dev_dbg(adev->dev, "Failed to create task info for VM\n");
>  
> +	amdgpu_debugfs_vm_init(file);

Move that into the caller of amdgpu_vm_init(), this way amdgpu_vm_init() also doesn't need to get the drm_file as parameter.

With that done Reviewed-by: Christian König <christian.koenig@amd.com>.

If nobody objects I will push the first two patches to drm-misc-next now, so you only need to edit, rebase and send out again patch #3 and #4.

Regards,
Christian

>  	amdgpu_bo_unreserve(vm->root.bo);
>  	amdgpu_bo_unref(&root_bo);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index f3ad687125ad..555afaf867c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -487,7 +487,9 @@ int amdgpu_vm_set_pasid(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  			u32 pasid);
>  
>  long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout);
> -int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp_id);
> +int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp_id,
> +		   struct drm_file *file);
> +
>  int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm);
>  void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
>  int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec,

