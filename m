Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992C0ACDEF1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 15:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D49910E7BE;
	Wed,  4 Jun 2025 13:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g3NGz/nt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227FF10E7BE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 13:24:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izIiOYr7t3NfRjVuzsIfnXrvZuJ9DdMA6AdsH/8JnMld4I1yJEQEi55+wY7h/WeEGiGDg8L7DkusLNDqIo8ikTgOLkzLJucw3o0hKHhHlgc6U5Wh0eIh+8YrlPrCbGh6lyGK/+WbYOEMWzAXciNCg1xfyR6MpGzMkQl5qP9HhZKx3zFo/Y24NS4e+F5MkCRQqgY577YuIvfoEH2oAsZPhUAWZ0cUfxg8oYCeIzz3yxy7+0UHXIre/YK3IhGBciMKbbpeVeevJZdT9dqf8dX9VCyKltNWOKGW5+Mt5No57zpvQS/bL+hEQlvI40/GmZ99JgZJ2yzCY/8LOZudJcARgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvG2SHICR17o0VToEjA2yX5XHAAtl0yXYPUVp/pDNdM=;
 b=vOu2BHgb8JDLvDiScJ9ErC+/5HuqIL3tE/0Lptpg9cpagZDdFaLw0JslTEDsibE9yZFIxTvGHDRpyloFGuxs/RaeNw5zP8FhFHmgHKSRjtvOQdjC4C58TRcqPbtP80OWYqOGvsQW0jNbsjH5yxngm1R9Hq8huJ2nk36i1xp1wstQyT6Oq/AcFcq4ETbiR0w6w753vK0ZMP8ndV5GuyIyIWS7yGwtnOGudxzegIga6LZ3zgCySujRj7pF5arsff5+5vGSJ13x8ZYdgMJF8Ny2HPxe5b42/D6kbZNCbWXnXJd+yqCV7rdxNIOfKbI25sth7HOBptTtrndLsIzt9Q47ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvG2SHICR17o0VToEjA2yX5XHAAtl0yXYPUVp/pDNdM=;
 b=g3NGz/ntDDZqB1spH4sstXsU1JGMGQgIW5Bo+OHBEKbwXpq+U9I17Vk+rpqROFPlOdSKdjVBKy1XYMr1QmhE7ZoXFTimezyTEmgRdi+kP9rfgV23wR7uIPiEibNDofUmoSN8s8DZYd82HuG4Pvy8GJZf/ycEum6NxRQiz7oN6k6cHpw26vXuaztZLHm+wIbN7rvKZR+ibDL7ZqanY3ZpJCXz0rRMraY6hMEqx1LcyZwFIUJxPoRiO+VN2C7Dy/gx/2mnHCbPZhhOThYD/YqE0r2QnRkrfpwz4FjQHZkpKKj0dsR2x02zNKbeufx9/aKIkryPe5iZb4iZRabYnPvEiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA1PR12MB7224.namprd12.prod.outlook.com (2603:10b6:806:2bb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Wed, 4 Jun
 2025 13:24:04 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 13:24:04 +0000
Date: Wed, 4 Jun 2025 10:24:03 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 dan.j.williams@intel.com, aik@amd.com, linux-coco@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 iommu@lists.linux.dev, kevin.tian@intel.com
Subject: Re: [RFC PATCH 17/30] iommufd/device: Add TSM Bind/Unbind for TIO
 support
Message-ID: <20250604132403.GJ5028@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-18-yilun.xu@linux.intel.com>
 <yq5awm9ujouz.fsf@kernel.org>
 <aD6UQy4KwKcdSvVE@yilunxu-OptiPlex-7050>
 <20250603122149.GH376789@nvidia.com> <yq5aplfj99x0.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5aplfj99x0.fsf@kernel.org>
X-ClientProxiedBy: YT4P288CA0041.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::22) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA1PR12MB7224:EE_
X-MS-Office365-Filtering-Correlation-Id: b6578cce-7cc2-411e-8848-08dda36b13a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFNUTDJkclZKTXhWNms4a1ZvUmxJRmFvV2hMNWlxZExQbzRSN1czOEEwb3Ni?=
 =?utf-8?B?R0NhdHBEVGZnYzNLZVBPeEZ2cWZXeXlMZWFNTzN0anZOcnMzTTRneStDRm9X?=
 =?utf-8?B?cDFKamVBQlBMNlhkQVdaOTNxUU85Z1IxeEM0WXVBYkhsSmVzQ2EvMzJ2dzhW?=
 =?utf-8?B?WEVhcEtSV3diUlNIS1JMRTcyMGNPZWR3Q0c5dVNoQzNYV3pWbURNN1I1OFFw?=
 =?utf-8?B?WjJkK2E0bStxSWU0cTRJRXhsKzFTUmI4VGNTT1hpc3NGaHJjUk1tMnArMEF6?=
 =?utf-8?B?UnQ5Uk1OTXhDSkFwcG43dFVNMDJZeEUxU09jRnpLblVNQzl1RjhUbng1MW0z?=
 =?utf-8?B?VEZVTjFTbzNCUXo2VFQ3ckc5Q3h1aEpkYXNqS1paN21mdGlEVDdGM3ZiVjBO?=
 =?utf-8?B?VXpwYVZCYjRKcnVrQk9xNDVBajhMTE1lT2FnaWxXRjFobncrZHFSK0lNTnU2?=
 =?utf-8?B?WWNlYWVtNy82SFI4QnNRM2xkYjU4Y0puN20wZExVckdmMXFIYzJreWFYd2Fr?=
 =?utf-8?B?dmUrOEMwdXpwb2xRamI2T0lLOXBRQ1lnWmJ1bE02VERxMmtsSUdsZ09MNkZR?=
 =?utf-8?B?SzNrWmJDTFRKNGNZV1BYbEZmR1ZCRnBpajRWWkIwaEpTc1hYcjZSd3hiRlov?=
 =?utf-8?B?WVkvSDhjT2Eyb3d6MjhMUlJ1SXNNRmlqdDU2c3owSkNzZ2c3cFhHc0lWOFlB?=
 =?utf-8?B?a0l1UHE4RkFHRkJvMWNNQnFka3pzL1pwZGJEdTlDTEN1a2EvUjB0MGRhT0pC?=
 =?utf-8?B?T1ROMXpMWEJobThhVWJHUEx1VFlEeGZIU09NTUxKU2c5TDd2eHdnVDA0Mi9U?=
 =?utf-8?B?L25NMVM2YkF0N04rdTI3RFNuUG1TQzF1UmtkY2t5YjBjcytRdERINzF2bzlr?=
 =?utf-8?B?SGd0c3UzQ0hreW8yTkpEWjc2U0Jsa2plczVmblZzaFhxYTdPOEd1dW16WnhS?=
 =?utf-8?B?cnBTRjlJcXZQWXA4MFhuZWZIYnRHNm02cTBDeEtyV2FwMnFoZnMwOTNmSUxn?=
 =?utf-8?B?N21kZHF0RlEybktiVkp4N1ZMU29ZQ3ErNkNKYkZiMHJKeWovanQyZTVFTVhk?=
 =?utf-8?B?NlpHSUNFZDhFWVd3Z2piTGFybDdXS1hpSUNhazgwSWFzQmhTM2JjdGl2a1Fp?=
 =?utf-8?B?L3ZveGpYRDJOUzh6MlBhcEsrN2ZtNjVoN3QwVVRvSkt4MVhKYWlMaGtvQ2hM?=
 =?utf-8?B?b0M5S1NWbjhsSWlxbGRCMkl1KzErdmtVL3JlVGJBV3RkMWhDcWQ5d2x5SXlJ?=
 =?utf-8?B?YzF1bHhkcWdvR2lKK0xnRi9DN1BCbUcyYTAzSmZLZ0Jma0EvU1htUjU0eW15?=
 =?utf-8?B?VDB5VEJHVzc5R2E3eGZmWW9vSkc0clRhVnZCN0txc1F4QmhyN3ZnQUFaZFk5?=
 =?utf-8?B?cFlqd0pLQXNiRWJZMWV5eFROUG5iRTh4MzBscTN6TVQ1SDJ1MUlxTG1kV2hU?=
 =?utf-8?B?eDdPUjZFVlhReGhEajlEVTZmTm8wOG9Ock5FdWxFVHZQcSt2OXpXcWN2RTZU?=
 =?utf-8?B?dHcyM0sxc2ViTTNOWitSUXlzNlRlTjJpS1VtM3VRWVZic0lNNzNKbjBkV0tL?=
 =?utf-8?B?Um5DOXpKcFVCck00K3Btdmpac3FmUGY3TnBJL2NmRkVRTXpNOU5nSE1wUndB?=
 =?utf-8?B?MVorbWtGbUMxUWtBVkRPZnFyYTFXNzZmejFJVzhIbk9wL2EwZ2Z0cmRTZyts?=
 =?utf-8?B?WEhvd2JxWGNZc1RhK1ZON0dVTDZ6T01HOG55UVVlSG1VSGNFRmpYTXp3THZC?=
 =?utf-8?B?d3FtdnE2emczMWV5OXhYTkt6MUp2d2xTbzBLalhibGhPajBXMjJlNldXVEdp?=
 =?utf-8?B?RmU1WTh1WGE0WHdNRlJ2TWRJdE1JLzU1MTZvZElST0ozbFhRUnA0U0R1bjls?=
 =?utf-8?B?dW44YTgzNUtCZVVOc3llTE5qdHZjVE9sM1ZXS1VuSmpTb3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTg1RC9mU1RIemMwbzhENlE2RFM5YURwSVNReko0SU80L1BHVjROa1M4VVAw?=
 =?utf-8?B?ZjR0U1l6NVdvT3E3UkRWdTVwYmJ1QWNKa2FQMU5tU0lyYWdwVHFFbnFGbVhK?=
 =?utf-8?B?cmNnWmJRVWNnc1pLcUFnR3RwbzVUVTdtVEtsb0lWU1I0dUJwRGhkcGY4K0lW?=
 =?utf-8?B?VTg4TGVFY2h4anI3ODQ3Umc2RzdLdVN3cXc3RDZNVEpDTWpncTlPWENOall3?=
 =?utf-8?B?a25vOXlwOU4wU3hPemNsR0xlOWlYcktzUCs3OU5EYkdWVk9ad2tRSHlaQVU5?=
 =?utf-8?B?a0psRkNhZXg0cXhrWFhNcStvWDgvaDFvaHJrdThzUm83K2VOc3ozUTFHYjZm?=
 =?utf-8?B?dExMamlFUWNDWEhvTGF3c1h3QVkva1hzVWh4dU5tVFhsalRYaCswUmxIa1ph?=
 =?utf-8?B?UlRsM01Ob0VlQi9mM3haSm1ML2ZvTnU3MXdtS0x4aktxMTlDVnlJQXhzbnIx?=
 =?utf-8?B?Z3FJUStBd0UzMlhvRVVNTE83b1V6L2VXYmJUbGVmOExrQnlxbDZ2TlNaVktn?=
 =?utf-8?B?eFVZdk84SU1JYnJ5NGpPSHJqalluZGdtTG91bE9oQnhZdWdPdVdkb2o4azR6?=
 =?utf-8?B?VUYxZ1lpMGJTcW0vaTQ5clZzb0YzeFlEaTFvOXdwRFBtREI3M1FaOWpXM0x6?=
 =?utf-8?B?WlIyK0t1dnlSL1hYUkg4eXlNcFk2STVFYTNiQ29EOFF3eGhrZ3NqRW9HMm1O?=
 =?utf-8?B?MkxXR240VlE3bnFkNkRySmhDakdIYmh0Y0EyR0xHUndiVHpzdWVYOEJmQnpw?=
 =?utf-8?B?Z2d0M1RNTDkySW9EeTdzQlFETTBoaStHaFdwZ1NxeFJoZXFqMXZvcTRpaTlU?=
 =?utf-8?B?emh0OW83RGMwbnNyZ01PZHdiYVU2TloxN25tZHpnejR3c2xqcENNR2tXaThq?=
 =?utf-8?B?NDFBdk5WK29INFhIaUtvREJRUTQyWk5TazJmT1BNQjN1eHBRbktrUzNIcGRR?=
 =?utf-8?B?NGU4am1WSXdIemMrdnlFbzV5Z1Fsc2lOcTlGMzQ3REJCL3dhQVZ1andVMkI1?=
 =?utf-8?B?L0dmVkl2ZnczUVhvK1U5bk5VV0dHS2Npbks4TzcxWkxGM3piU2NkZGc2TklX?=
 =?utf-8?B?SWF2eGNmWHdTUkg0VWdoR2g3T2xLNUp2U1M2SmhWd214VWhrNkU3WTlFb24w?=
 =?utf-8?B?V3lpZGpwdlg4MWZjNUtGL2ZYd0tUTG9mcjFHL1RhTnZFMC96NFpyTXlxQ0VT?=
 =?utf-8?B?VDZOdUNnOGNXSnFzak82NTB3WWpoamZSOFVVanBjRHo3K2U2dWtPUitUUXB0?=
 =?utf-8?B?WUY3ZHlsaUpMWlpielRncytzWHQwSzdML0Zmb3I5SXgvRER3WUNwSGNseWVC?=
 =?utf-8?B?STFJMkx6aW5iVTd3ZVhwRmlhbUtIM1htVVRNeTBnVFNnZmtmNWFHZmk2TW5X?=
 =?utf-8?B?M3BSTWlycjQrN01vVndEVWE5aEZJMC9tQzFXelUrVkVjQ0krMHNNQk93RlFQ?=
 =?utf-8?B?aE5hbm5xVmpSMEp1MDlFbEtOWERyTWR3VlFKUkRINVRmR2o3MGRhR3A0dGhx?=
 =?utf-8?B?cXpjTUdRUWl5eFEyR0QzUGVUbkI5cllVcmUxWTF1NnIyZzBXelJReUJiQkk2?=
 =?utf-8?B?djhQeVZJQ1pTRnFkdkNSZlhWc1FEK3JxV05oNytiVnkrd2Rza1Baa1JmdmRt?=
 =?utf-8?B?UG5RNDFqRnJKRXFtUXV2cVJVV3RXd0krY1NhL3FCc01IOFlWeWgvUFUwbTR0?=
 =?utf-8?B?TWFjcElJdGFXUFcvclI4eVlpZklTdzNOSGRlL0E4SU1sYmtQSFpSeDBxUkNL?=
 =?utf-8?B?V29rbkJUR0tUWXlxdDh4Nm9HNEY3WkdPczNaaUErUEZRZTMrT2l6SnNFRVg4?=
 =?utf-8?B?L3A4WW16R1BDbHJwY1dlVzgydEF2YWRKU3l3Q0NzaEpQQnFtd0NmN3FuUjlJ?=
 =?utf-8?B?ak5aU3Y5QUlzWWpILzk4aHU0T2JwYUFaUVNyQ1Q2NFVSYXZsYjBBYXNGeG9P?=
 =?utf-8?B?eWpzR2Y3YzJsR0VjbUwyZ1NqWHpDU2V1OVNYQjRLOEpTV1N0ek1uem1xRmFG?=
 =?utf-8?B?WWkwL0pvYjVzalBleVVQRGpXV241SzhEK3VhdUFnblhZcGFXRkw1OEpBN2ZP?=
 =?utf-8?B?K1JvSDhWaUYwQ2Y5SlkzVUlHVFU5VStGVGFoajE5eW9JSDJXMEp1b2Rad3Bu?=
 =?utf-8?Q?8sHNL6qIM09kc2UDdpkv3NAjG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6578cce-7cc2-411e-8848-08dda36b13a1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 13:24:04.4543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Zt/9aOit39cxdMmt8fp1jKMWHLzV/wnIqFOBaf/ROu0QfgxAT6PBJX94SeXjm9o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7224
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

On Wed, Jun 04, 2025 at 02:10:43PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@nvidia.com> writes:
> 
> > On Tue, Jun 03, 2025 at 02:20:51PM +0800, Xu Yilun wrote:
> >> > Wouldn’t it be simpler to skip the reference count increment altogether
> >> > and just call tsm_unbind in the virtual device’s destroy callback?
> >> > (iommufd_vdevice_destroy())
> >> 
> >> The vdevice refcount is the main concern, there is also an IOMMU_DESTROY
> >> ioctl. User could just free the vdevice instance if no refcount, while VFIO
> >> is still in bound state. That seems not the correct free order.
> >
> > Freeing the vdevice should automatically unbind it..
> >
> 
> One challenge I ran into during implementation was the dependency of
> vfio on iommufd_device. When vfio needs to perform a tsm_unbind,
> it only has access to an iommufd_device.

VFIO should never do that except by destroying the idevice..

> However, TSM operations like binding and unbinding are handled at the
> iommufd_vdevice level. The issue? There’s no direct link from
> iommufd_device back to iommufd_vdevice.

Yes.
 
> To address this, I modified the following structures:
> 
> modified   drivers/iommu/iommufd/iommufd_private.h
> @@ -428,6 +428,7 @@ struct iommufd_device {
>  	/* protect iopf_enabled counter */
>  	struct mutex iopf_lock;
>  	unsigned int iopf_enabled;
> +	struct iommufd_vdevice *vdev;
>  };

Locking will be painful:

> Updating vdevice->idev requires holding vdev->mutex (vdev_lock).
> Updating device->vdev requires idev->igroup->lock (idev_lock).

I wonder if that can work on the destory paths..

You also have to prevent more than one vdevice from being created for
an idevice, I don't think we do that today.

> tsm_unbind in vdevice_destroy:
> 
> vdevice_destroy() ends up calling tsm_unbind() while holding only the
> vdev_lock. At first glance, this seems unsafe. But in practice, it's
> fine because the corresponding iommufd_device has already been destroyed
> when the VFIO device file descriptor was closed—triggering
> vfio_df_iommufd_unbind().

This needs some kind of fixing the idevice should destroy the vdevices
during idevice destruction so we don't get this out of order where the
idevice is destroyed before the vdevice.

This should be a separate patch as it is an immediate bug fix..

Jason
