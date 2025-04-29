Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC0AAA03B4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 08:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA4C10E2DB;
	Tue, 29 Apr 2025 06:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Sbu+rArW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF5C10E2DB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:48:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NItV65fQZ1QkwusC6Kicc+Rrg9+vaJDb+Jy4LVfYg6MRGGG3ia2AB1IR65hkhDzvO6OZlk2ifISyM8v7uR2m6qOlnYNXU6n64XjQFcC0cjzjtCus9mnsr66BerNUwHAdWITq8uvUVOh3Xm77jwCSD59HM2xCbsVXbUn7lHOHC1vz0LibUjFy1uQD7lHFAY7WfPgmYSI4uU+VhzmH44qpl7hipPgfQ0eMiKb4NatxuTCE94LadraukmkKkcEHd2zxtlk9jIqZRs4yRSTcmEzEidsC4vqn5UrJOt9/+4lqCVjzKzMch5LD3eDGc6c5YFmTQcvvlaFCXZPjFs3mS6Ny7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePa3DOxPZwyemNHnmq1BPIbYnr7EAyi2ytpycp3V9hI=;
 b=gNX11wQ15K7LPyhORF71GWzAr4Kv4kNGLJK8men8HvAfiJKBe7aMMpyZWcJDFaBDCtOv6kid1wtEbqEe/0OE3T7iK8zE1Xm2oruNJtOEMY+UoMSs5p84CKm00TlQtXuq/zfoUurvAQ0c/Y7I1vzif47u4PKCvSE0D9q+82JvTZzZujzv0mHY+w4H/LkY4siRV6fy3DzrOerjNz7O6RsSRb8CkIEjeYwyKkc5gnRVn/McKRdnUnz7/9JYVIHp2kujTllGroZYyc7qSKJuRvpmsW+aSu1dMKJ85CC3P6X6/b7ShEnMpxWFkQ5x6HuSilRn1OoAco4C5rSo3eZVbvjTvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePa3DOxPZwyemNHnmq1BPIbYnr7EAyi2ytpycp3V9hI=;
 b=Sbu+rArWe6NK+0cwiEU7aokNh3Y9RP5juCaYpl41/qhViL0wLJ5YijlKG0dPzbEhDc81NynoJKhjsyAG7rTNuM9TtcI8AmgZlkYVrwqfrpWVve6XOAzvXY2vYZJo60kIbI4wZGf5cv+Y1KEUICSjJOcrVGJjNrvWO2lqI5FYlKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by DS7PR12MB5911.namprd12.prod.outlook.com (2603:10b6:8:7c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 06:48:36 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 06:48:35 +0000
Message-ID: <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
Date: Tue, 29 Apr 2025 16:48:27 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
To: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, jgg@nvidia.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com
Cc: yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <20250107142719.179636-1-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::26) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|DS7PR12MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: 8161b116-fc61-4128-c30a-08dd86e9dd52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlZUL2o0UENxaklrMGxqcklod0lEMDBvaDV3Q21iL2pydlJYcnpiZUxieTZt?=
 =?utf-8?B?RXBRSVlBdmNKQ2UwK1RjSFBiRUZmbWJrQnpPVHFzSXR3TEtWaDdJTFNQTTl2?=
 =?utf-8?B?NU8zK0xoamlXSWs3M0I3RVgrOUg4aU5ndVJiaFo2SmpRMWJjanVPSlVjYjVv?=
 =?utf-8?B?dTY2QTJyMDc0cmFhY2VpeFkzWnRLcXBSanI2Z3BPeGFGL0JVUkpiSFd6bVdH?=
 =?utf-8?B?d0srZHhoNC9aamdhbTdPS0Q2M1dSaEFWWXZRNUZSbzE4L2dVbFhhTldDWk0x?=
 =?utf-8?B?eWhQTFA0Y2R0VUxKNE9ERE0weU0razlhd1g2VlRpK25RdlRyYUUyMjhVelAz?=
 =?utf-8?B?VU8xWDZya0loMThpTFIydjc5Y1FrVldkcUJtSnB5enF5Z09sOTVQbzEzMk14?=
 =?utf-8?B?TndhY2ttTzRaSGt0MjBNTUliVlFLSDdKcU92a2F5VEFPY0ZUNDEvbnh0UHIr?=
 =?utf-8?B?MzUzbmpBWVhRSXdyUStVaHpLbVpOMVd0YlBGZVhZUXU2ZW93SnVlN2dGMlJq?=
 =?utf-8?B?Q002MHE5S0h5OHh2U0ZKSnlsUXpZQVlPdlBqMTVGMU9URm5NSFo4Mm5WNDBw?=
 =?utf-8?B?c3B5eG1Pd3piUVNVS01kelM0a1dnVEtXdDFXRDh2aHNFSUk1dmhqUmdkNnpS?=
 =?utf-8?B?Qk1KTVE3MlZGMVVML0thRW40bGFobkNjSXduSHJidG1BS1RGWXd5bFZXNXM3?=
 =?utf-8?B?eWNlK1RRUXorbUZCL1ZPU2tENXNWWGVDTlFKeHRFN0ZXREdoek5rNFR1Rm81?=
 =?utf-8?B?ZTY4ajdHcGFndkZQN2R6Z0REek9CTUxCY24xbjRDS3MydExMekVMQ0swM2ph?=
 =?utf-8?B?bkgvWHFkY28vV3dYdkJuam5xZXkrWFBnUHcxazl0aHBWSm9MNUlYSU41d3NG?=
 =?utf-8?B?c3pxdGsrZGNUdWhWMmtNdzQrQ2FhN2pTQ0tTeFVIbENVN3JqRHlSdnJQdFQ4?=
 =?utf-8?B?ZjdOMFF0SFIvY3FEMDRFYXlZS0Q1RUlIcDVZNk5BT0tJTmJKa0lYeE9SWjhr?=
 =?utf-8?B?SGd0ZDNuNEZqSjI5UGNPdTNHZlhVZUQvcWU1RGtTdUVtREcxWS9qMWFmNWdC?=
 =?utf-8?B?TERHZXRuL1FpbEJtbEZRZG92SkF1bTBVUWIyNFRRZ3JNYld4TUVlakpmMTN0?=
 =?utf-8?B?LzVWMis0Tm93ZUU3Rjh1Kzk0QzZ0TEpMWjM5TEtMTGpkOXhnU1RVQW5YWC94?=
 =?utf-8?B?VHpzVWcyWXY5MU84L3pBTU1oR0JWRUhIb3psWlpWNGRoSS9aVXR6Ly81cEJh?=
 =?utf-8?B?U1BkMFhpaTlNZDF5U0FhWUZnc282c1Z4WHg5R0VjWXFvV3U1ajZuTUl1cUdH?=
 =?utf-8?B?dXh6d1pHZFErc3cySHc5U25WR1ppUDJyMVdraUxvak1RZHB6eFVmS3FlbS9o?=
 =?utf-8?B?UFNSY0xUcXBNbThINU11SkFnWGp4elRONTN6Ym9aRzgveTNhYkZtWThKa1JO?=
 =?utf-8?B?NUsyYWpLYnd3SmtyaHpHblJ4bDU3ZnZEeXlYeVErNXJ4YmhZNitYRllncWQ1?=
 =?utf-8?B?L1NkTytVcGNpYWpjNzlCZHc3cXg3R2JDa3BZNzRPYStReTZHa09MbkE5dVJG?=
 =?utf-8?B?Qll6TzdCbEFYc0ZSbWxuTjN0L2ZJNVNxODJGMkV4dDlQVldtSWpmVWNNdms5?=
 =?utf-8?B?c1QyU0xYNks0VFBlSFFBK05Xck16ZUtWT3JsTDZQQlk1QXVrYXVrUE9GWHNO?=
 =?utf-8?B?SW1hSXBjRXBQV21JRnQ2MmdhWGlCeGxmVzdpcHR5Yk9qcFZQWWdHeEJIbmd1?=
 =?utf-8?B?MDdMNjArV2JCQzRCWFJRSmVaOExSRDNCeEp4MW1TN1BMSzQ4ZEljNUJTd0Iz?=
 =?utf-8?B?L2U0dlQrbXg5RUVWb1RZOWdOK3o1ZGdSMDR2MEdDMWZzN0w4NFNGV1JHYUwv?=
 =?utf-8?B?QzJpTiswMXRUa3ljL0VmQkVka3d4R1FsNHZrcVplMVliSDZEaW5lcHExYWVK?=
 =?utf-8?B?TnVIMUlvc1J4L0pGaFhYZHgrMmNZdXRHaGM3YVRveTZVMm5nMkNuOVJpMUN0?=
 =?utf-8?Q?LK7+2vEr/nSrayz2txGCtNw9rk6k2g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1QwMk1qamVlQjZNbTNqY2YrK1BJTmdsODd3SEJ2eE92enAvVnczTytJWjg1?=
 =?utf-8?B?QTBVa0J5NmkyVktaVVp6SVQzL0owY2tkTVBoYjNkN0d1NmZ6bEJYdHVkdjRw?=
 =?utf-8?B?MzFEaGtXdlZ3UjBuU3pqZ2NGNUFIbWtEWGp1Q1YzeEpGVFo0cFp0REptcEhV?=
 =?utf-8?B?ZjFrRUY3ZmNMUG1ERjJJZmVtZ3ZoOEtwNUpkWlRIYmJYSzVkcUlhUEMvTy9o?=
 =?utf-8?B?Qi9IcnE3SkhZaDBtOEFjV1d5VjNnWnFZUUhxQkpESnRkZDZsUllicm9tV1pC?=
 =?utf-8?B?K0tCWnVxYXh3Z3d4VGFDazI4bzlMcGRoM1FaVW9ZUUlRRWpKVFY1cXFTM2sx?=
 =?utf-8?B?cG9LcE5Md0pLbTJma3g5alpndXl4WkJ2SzFpbjhIRGNRWTFnMFhRMitrQTZi?=
 =?utf-8?B?dExkVGtGdmNWMFlZeDFuNnJBNDZCdXNDSmpGRWIyc3I1anRSVHk1Y0t6UGtI?=
 =?utf-8?B?Y2hpb3pKNW9vdHZ0YzkrQUhFZEhvTFR4eEhrVDV6eFJ6cEhxQTZGcjFNWXNG?=
 =?utf-8?B?dEdVeXBHVUJ0NG82UVVURUhXWndKMDhZTnZ3am5paVlMRTRyZWdPSGRsYWt3?=
 =?utf-8?B?NExOYkZZdVdQb25FampJZEdmZkZER2I3MmNiU0ZWaE1NRE1pYTBMM2tTZVd6?=
 =?utf-8?B?SW9mU2xrdDFGbnJGSVRjd3pvcXp2dUpnblJ4TnVrZDJjbkhRaFkvcStyS0kz?=
 =?utf-8?B?ZVJ2K3c0YjZVa0pydkhiamduUndOYnBTWFJJNDRocWQ4ZFMvbEZUb1NYMXJS?=
 =?utf-8?B?UFRINDVGR1ZNY0kyT1U3TUs4TVY2ZXRpRTlmTFlTR1RiWVVPdFVBckxlNm5y?=
 =?utf-8?B?QzhDQ1JyQjRucnBNajRYWGFzWkg4ZDRNdGEyaTdEMkxPWTlrUm41eWRmSnJj?=
 =?utf-8?B?bGNJaVdyWE5Sa2lYVFFtcDcyVTV1N1V3cENDK2NLdHBxd1lDMjJKa2J3WDgw?=
 =?utf-8?B?M1RMa2R5bElmNUJEeXBFY0NTeTZ1UC9lZHY3QnBxRUtmOFh0ZDJ1WCtEOWZH?=
 =?utf-8?B?SHNNWWJYdmQ5emZJbFVTNzliZm5pMzJvMDNFam5SVlYxQmM3R05hVGhiSFFt?=
 =?utf-8?B?NHVvRXp5aXRGSUY2bUVLNHF1VDdNdU5yQXRNNlpXS2xUV3Y4eXdYOXZPajdl?=
 =?utf-8?B?anZmbkc5L2pSTXNxdnBZemRRUHhZZ1JKN1p3ZFRiaWtVRGV0VXdnaXRvbFpp?=
 =?utf-8?B?emZma3M0QmJSbmlrcC9YVGl2VlNjMGR3OWk3Rmw4NFdrd2VmSlFkTmNJWU5F?=
 =?utf-8?B?MUxnTUFMb3U0ajBGQlRuWi9CUWdhdStpRkhFUHozdGRWYzVhSkx0M0lYUk5L?=
 =?utf-8?B?MHE1UUxXbUR0MHVQM2hjY2lJQzFYWno1dERaWUtSM0IzWmZoK253bnNZWEcz?=
 =?utf-8?B?MjN4SnplUzFvQ1RxRzN4THlzZTloWVRsU0NhY2hIUEVSTzlOS0V3WVZTUml6?=
 =?utf-8?B?U2NydFdaRmhnUXFDUVErY2VQSytzZXBZWkRYWDRQS1ZpT3lvWmtaMjlDYThJ?=
 =?utf-8?B?VGp0L09vSG5sTUpmWFU2SWJlNnhzbE9NUFllV2FyRVBIamt5WHI2SXBpOHdW?=
 =?utf-8?B?NHJUcWhGMXlaQ3cwWlYxNG0vUlkveEtnLzZabGtEUEl2OVVaWUNvQW1xbUt1?=
 =?utf-8?B?Vm5zaTRjQ2gyVnR4dGQvaUp0ZDBnc2FaaTNrbE8zTm8yMFR0WEErR3RVNE91?=
 =?utf-8?B?UE9UR2VGM002V1VDOUhzVS9WWjFCNHg4dHJYanczQlY0WFpOR2J1enQzeHBR?=
 =?utf-8?B?WmZudzVVaHlqazZmTm5HbnU5WjVPd01rVDV0TGw5M1cyOWpGTWNlN3JiaENH?=
 =?utf-8?B?OHdkSy9DSFhBSEc4SEJsdW5nTTZMVEdLY0x3djFSU2ZrRkVZZjkydUtPU3dm?=
 =?utf-8?B?Tjh5U0g5ZnJWcDBuR29Xd3h2K0IzVFc3K1lXUWhBeXJQR3lHSGdrUlV3VS81?=
 =?utf-8?B?MW05dHJ1Tnd0OTUxYzlzMzJ4cHN2Wk53YnZId3JjaXdGN0c0UVFNRW9maVRi?=
 =?utf-8?B?a2xNMTk1QVo2ZUpndTZzTUZodXFSNDBxVWVUSzdYenErbi9rZ0pIYlZuZWJr?=
 =?utf-8?B?NVFUeW9vSEJ2Sk1HRHBDTStlNzZxV2Z0bEJrbmlOK0NDZlBFay9HSU9JYWU2?=
 =?utf-8?Q?IQyydVT9ITQ65F5V0V94r274Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8161b116-fc61-4128-c30a-08dd86e9dd52
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:48:35.7815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqviLQc/u0wJ7NlXIM1DDH+hIGt7QmeqIPeVc7phLsTKddw5+KHnisWiPX/tEiC/gqJB4oA6E4Z3gvZus2IQzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5911
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

On 8/1/25 01:27, Xu Yilun wrote:
> This series is based on an earlier kvm-coco-queue version (v6.12-rc2)

Has this been pushed somewhere public? The patchset does not apply on top of v6.12-rc2, for example (I fixed locally).
Also, is there somewhere a QEMU tree using this? I am trying to use this new DMA_BUF feature and this require quite some not so obvious plumbing. Thanks,


> which includes all basic TDX patches.
> 
> The series is to start the early stage discussion of the private MMIO
> handling for Coco-VM, which is part of the Private Device
> Assignment (aka TEE-IO, TIO) enabling. There are already some
> disscusion about the context of TIO:
> 
> https://lore.kernel.org/linux-coco/173343739517.1074769.13134786548545925484.stgit@dwillia2-xfh.jf.intel.com/
> https://lore.kernel.org/all/20240823132137.336874-1-aik@amd.com/
> 
> Private MMIOs are resources owned by Private assigned devices. Like
> private memory, they are also not intended to be accessed by host, only
> accessible by Coco-VM via some secondary MMUs (e.g. Secure EPT). This
> series is for KVM to map these MMIO resources without firstly mapping
> into the host. For this purpose, This series uses the FD based MMIO
> resources for secure mapping, and the dma-buf is chosen as the FD based
> backend, just like guest_memfd for private memory. Patch 6 in this
> series has more detailed description.
> 
> 
> Patch 1 changes dma-buf core, expose a new kAPI for importers to get
> dma-buf's PFN without DMA mapping. KVM could use this kAPI to build
> GPA -> HPA mapping in KVM MMU.
> 
> Patch 2-4 are from Jason & Vivek, allow vfio-pci to export MMIO
> resources as dma-buf. The original series are for native P2P DMA and
> focus on p2p DMA mapping opens. I removed these p2p DMA mapping code
> just to focus the early stage discussion of private MMIO. The original
> series:
> 
> https://lore.kernel.org/all/0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com/
> https://lore.kernel.org/kvm/20240624065552.1572580-1-vivek.kasireddy@intel.com/
> 
> Patch 5 is the implementation of get_pfn() callback for vfio dma-buf
> exporter.
> 
> Patch 6-7 is about KVM supports the private MMIO memory slot backed by
> vfio dma-buf.
> 
> Patch 8-10 is about how KVM verifies the user provided dma-buf fd
> eligible for private MMIO slot.
> 
> Patch 11-12 is the example of how KVM TDX setup the Secure EPT for
> private MMIO.
> 
> 
> TODOs:
> 
> - Follow up the evolving of original VFIO dma-buf series.
> - Follow up the evolving of basic TDX patches.
> 
> 
> Vivek Kasireddy (3):
>    vfio: Export vfio device get and put registration helpers
>    vfio/pci: Share the core device pointer while invoking feature
>      functions
>    vfio/pci: Allow MMIO regions to be exported through dma-buf
> 
> Xu Yilun (9):
>    dma-buf: Introduce dma_buf_get_pfn_unlocked() kAPI
>    vfio/pci: Support get_pfn() callback for dma-buf
>    KVM: Support vfio_dmabuf backed MMIO region
>    KVM: x86/mmu: Handle page fault for vfio_dmabuf backed MMIO
>    vfio/pci: Create host unaccessible dma-buf for private device
>    vfio/pci: Export vfio dma-buf specific info for importers
>    KVM: vfio_dmabuf: Fetch VFIO specific dma-buf data for sanity check
>    KVM: x86/mmu: Export kvm_is_mmio_pfn()
>    KVM: TDX: Implement TDX specific private MMIO map/unmap for SEPT
> 
>   Documentation/virt/kvm/api.rst     |   7 +
>   arch/x86/include/asm/tdx.h         |   3 +
>   arch/x86/kvm/mmu.h                 |   1 +
>   arch/x86/kvm/mmu/mmu.c             |  25 ++-
>   arch/x86/kvm/mmu/spte.c            |   3 +-
>   arch/x86/kvm/vmx/tdx.c             |  57 +++++-
>   arch/x86/virt/vmx/tdx/tdx.c        |  52 ++++++
>   arch/x86/virt/vmx/tdx/tdx.h        |   3 +
>   drivers/dma-buf/dma-buf.c          |  90 ++++++++--
>   drivers/vfio/device_cdev.c         |   9 +-
>   drivers/vfio/pci/Makefile          |   1 +
>   drivers/vfio/pci/dma_buf.c         | 273 +++++++++++++++++++++++++++++
>   drivers/vfio/pci/vfio_pci_config.c |  22 ++-
>   drivers/vfio/pci/vfio_pci_core.c   |  64 +++++--
>   drivers/vfio/pci/vfio_pci_priv.h   |  27 +++
>   drivers/vfio/pci/vfio_pci_rdwr.c   |   3 +
>   drivers/vfio/vfio_main.c           |   2 +
>   include/linux/dma-buf.h            |  13 ++
>   include/linux/kvm_host.h           |  25 ++-
>   include/linux/vfio.h               |  22 +++
>   include/linux/vfio_pci_core.h      |   1 +
>   include/uapi/linux/kvm.h           |   1 +
>   include/uapi/linux/vfio.h          |  34 +++-
>   virt/kvm/Kconfig                   |   6 +
>   virt/kvm/Makefile.kvm              |   1 +
>   virt/kvm/kvm_main.c                |  32 +++-
>   virt/kvm/kvm_mm.h                  |  19 ++
>   virt/kvm/vfio_dmabuf.c             | 151 ++++++++++++++++
>   28 files changed, 896 insertions(+), 51 deletions(-)
>   create mode 100644 drivers/vfio/pci/dma_buf.c
>   create mode 100644 virt/kvm/vfio_dmabuf.c
> 

-- 
Alexey

