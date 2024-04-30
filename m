Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1F58B7E78
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 19:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC98D112D74;
	Tue, 30 Apr 2024 17:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lg0QTygo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C6E112D73;
 Tue, 30 Apr 2024 17:30:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJ1mtYrK3vJUDF+UuF17XzVnfpESBmSqHWVlgTw2o5jUCJoHlRf8gXVfD/6lYnsEcVypHH3+KLSQeOQtXSK46PaxCjvEoV1Vjg2pm3Agyz3Cvcq3NmbpgF87k7xapx3f6oEnLBOJngvF2f/sEjBX38Fb8FFLMjeskLkHZXwbAZAvvqYMRhi2/kc4GXhyKlyrs6dy5N0vL0cTbpmDiHeJJnIsk+dDObEHFnZkFBs5qwEdp4b3E6DkCDqrkqBW9aOUNbwQ33kq4+h0tusBObeI/1IDk2BplwNEvek9CEoQT20SdIuTT11G/mrKM86Srcn0MZb4tXy/nD5sXA0LNLRTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+YY0vSnAWyeLWSEONjmztRZfoM6vG3i30vMac29pH8=;
 b=dYCVm4I3drW/prp4F4neC6q/6NvrL+vj8DZBYWyilZVFoppqI7nRE49KxFd5HeNaaws1KhYAn+D2gYBl/nFCEnhgi0HLD8EbLgXs45vBjRWBc74xAYkvPT1UYz1EJzdxRidQnDDlu91XzfL0lH3vbZ4BqkrB1ZBLwcv9DnsBJ1u4UltCwBlKYqzgm9qW6Ga9mC9rT+m3fx0sCyQf6WEybBZYbCI+jQLxo8rHyL+PZhQ3Sklwf+MCi52kca6DZUywwcePh+K2l1YizbEcOGVm+Hwv0Y4Bzu6fdBIyHJ4KVN38bwNty9a7MCiTjd+1GxY0dDGfTJHBXg87utB3WCCHPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+YY0vSnAWyeLWSEONjmztRZfoM6vG3i30vMac29pH8=;
 b=lg0QTygos1IEVmZBapAPN+lK5vQJEhmhLjUiOJTNsagCplIQe23prxUne1zv55UaH14EZlndBcaHxtAyCSSiHValbGiIU10IqRVLLbcdByALCe0DPntVgJZ45055S7rbTpaA+I/4V4YTWXhPx89Q8R2oU4FUemUmXYhiatJqSn3cYjWTUAJLr+Uh6cT3VoI3oNbExin96eah7+Q7dr1RuVBT0qvb2xZ1mBN/QW1l+uxysZ3QS4FJidfGDsyQ0nE7BaP7KPXccwauB0Px73L/tGBDWMexgIgEhgFh2Y8mpO+fRt8Q5RU8uhKOR0doCCGjrsA+tkT4JjE9AOI3kbcCmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by DS0PR12MB7701.namprd12.prod.outlook.com (2603:10b6:8:133::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Tue, 30 Apr
 2024 17:30:03 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 17:30:03 +0000
Date: Tue, 30 Apr 2024 14:30:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: "Zeng, Oak" <oak.zeng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <20240430173002.GV941030@nvidia.com>
References: <20240409172418.GA5383@nvidia.com>
 <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240424134840.GJ941030@nvidia.com>
 <SA1PR11MB699102978E72F21E6C803D6392102@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240425010520.GW941030@nvidia.com>
 <65cb3984309d377d6e7d57cb6567473c8a83ed78.camel@linux.intel.com>
 <20240426120047.GX941030@nvidia.com>
 <ad82f95ee29ada403459416d4c97c2b9083b5a0f.camel@linux.intel.com>
 <20240426163519.GZ941030@nvidia.com>
 <f938dc8f7309ae833e02ccdbc72134df0607dfa4.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f938dc8f7309ae833e02ccdbc72134df0607dfa4.camel@linux.intel.com>
X-ClientProxiedBy: BLAPR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:208:329::32) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|DS0PR12MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9ea2ea-3e6d-42e8-191e-08dc693b2b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|7416005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzhrMEluRUJZSWpsbE1LQW1VMHpibm11N1dna3ZlTGgrRWhyYUtEWmo3OFls?=
 =?utf-8?B?V3VTVFVHbURzTkJVcktQOHJWZktnZXZST1BRMnhKekdaQ2ZwbVRsL1pvM1FX?=
 =?utf-8?B?Y2xZcm5VVHBWcGFEd0lGR2pCVXh5Y0s2eGRVd3NpazI1QzVqcXI3TTdINWtO?=
 =?utf-8?B?MkVJRkFWTmRBcHlLLzk3M3YxaFJ6MU9mR0JDU1I1N1oxak43b29WT2EvM1h5?=
 =?utf-8?B?UDR5cjdvYmZodnJFaUN6TDN0cHMrNnFIaHhaR2tCQU4rczBFZ0FQc1pTSWx5?=
 =?utf-8?B?cWU0V3RNdmZVYVNYVlRnUGMzeUI5RTdEbkVOcWJyVUJIUzFLQTFzbGh5WVIy?=
 =?utf-8?B?MHJwQUlPT0ljL2pRUStIdCtJSzJGVTE3QmxkendpaXJ4ajEzUFloS2pBZFpO?=
 =?utf-8?B?MVBiR1R3ZEpzVCtDdWk0ZnBtbCtTYWVDbWcxSnE0NUgrZ0R4U0tFVGZYaER6?=
 =?utf-8?B?ZGxWZ1VlTTlsdVF1akpQdk9DWnRIZmlIL290dnJneUF4QTM2KzF6cHowcGFT?=
 =?utf-8?B?M0lHc2gwQUNWTHJNMVFwWVdRYmw5ajFpL2EwK2JPYmVGdE1CQXVLdE1Za2ZK?=
 =?utf-8?B?TjZKWk16UFBLcWtkZS9YeHFtb3pSSTdNQlZ3elcyZU42UjZNYjM3T0NOaGpG?=
 =?utf-8?B?STVtZjRvNkV1WkhWaUVVaURwZ2dTYzdUa0MrWGZUcE9PYU83SDJmYTdsWUZ6?=
 =?utf-8?B?ZDAyY1ZFYXNOQ0N5VmRhWk1mRkxKejFrMUwxZEdBUTY0bFVTWjFtS2NHVWds?=
 =?utf-8?B?elJWdldYamhETVJHcS9YZFVCcERoM0VCamlSeXFGblIxWjZCRHVFTjMrUVRl?=
 =?utf-8?B?NGJrdk9odlNUazVkbGJiMDhXMEtyNmNXNC9xTy84b0lvNVhDRWxmRFVFZEJ3?=
 =?utf-8?B?TXVwUXEwOTlwQWM3ZHlSZzNpMCtoZjRROEEyWC9XNk5ET2dHejR2VkRreUtN?=
 =?utf-8?B?MW1ZVUx5U1FUaEFBQWdBMVpZbFlseUpyTlFEK2dWMmZGUjYyYi9rRFgwUEEz?=
 =?utf-8?B?L2FjazBQdnlyaXRYdkNzcVg0S3FWK0dxSGJreWdhbVUydm9EL1BjTm1Dd1g5?=
 =?utf-8?B?bGk4Q2ZwOFlQMUlBaE5mREpRb2FUbVFYVkhwQTlMTGo5eVRqeU5QTFlZVGtH?=
 =?utf-8?B?SHZNSTlVREdPcmpGSmdkcGFCTnV4amZ4QzlQaE9wNTNiQ0RKc0xSRHdYZm50?=
 =?utf-8?B?ZGptYitXVUQ1YlNpVzczT05FWnpKQlUrSDgvejZiOW02NHo2ZjJLZFQ4VlZI?=
 =?utf-8?B?Ym1PRjNmb0lJbDV3SGpTSVBDWXcyYVBVWTNyTHVqdkFSRW5FWjUvVUdOdWps?=
 =?utf-8?B?NllwYjlZbE5tMGVvS0xqanMrTHk3dTc0STNaVzFGNkpDNitDOGRHOEc0a3la?=
 =?utf-8?B?NHNFYVE0UUlkWDFvMTkvSkNrQnNXWXpxSHFMcXRodHpFb2VzbTc5eUljSS83?=
 =?utf-8?B?MXk2ZkVvWHpSTjd0ZlVYMTgyZ0I0YlpReDNUMWxkMTFodHViY3g4SFd5cDBw?=
 =?utf-8?B?QytRYWE4OEx6ejhwTDhuc2Q1aTc4MXZWaWZxZ2V0K1ltYkovN1N0QTRaU1BE?=
 =?utf-8?B?Mi9tNE1FRG50R1FuRUJQUDgzbXNOU1d0dlR0UkxiVXllamRRQWlYazFELzho?=
 =?utf-8?B?dVVNS3lwbkVxS3BBS05aQkF6TDhYUWJLN3VyL1FUN3pXVXVRZ0drdkVjL2Qz?=
 =?utf-8?B?VXZLN1pPTkN3UDBHcjJoTXI2VXoxWS9JcGY1dUtRaTlWTElBc21JQ0ZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3diMUpLWGRnbWZRNFZYcG5SYWlwSjhYUzZoZnhJbi9vbVVTeG44eDViTVk3?=
 =?utf-8?B?VUNjWVJDWnA0YkxudzQ2YUYyMnZoSTlwZ3hielNpV3BXcStRZDRzejdZSTBl?=
 =?utf-8?B?R294MHB2K25EQmg4cmxqSis3Z2g2QVh4amtnTG9qcTdqeDY0cTA4K0pObEVu?=
 =?utf-8?B?bEFjRHhRcDVUUUovcVFxM21SYVZQWmI3Qi9IY0Y4RVpuMXRoYUZBZk15TE8z?=
 =?utf-8?B?NWpZdWpUZ0dHOEVKNHNldDhBKzgwdVJNM3NjbURhTDIvejhOS2xkWU5jKy9Y?=
 =?utf-8?B?K3p6Qkk2ZS9aNkRKOVlOdEhlM0J3ODA3b0p3dXBlK3Z1TFRBcUMwZ0pMQlpI?=
 =?utf-8?B?RFJxOCs3cjVMVVErNTZIbjIzbUNjd3FCRTdHb1huUENlUlQ3QUo4K3ZhZUU1?=
 =?utf-8?B?UEhaK1N3YjlSbGFKak1kNGVUTElNTmlneVhBYnByc1JuaHJsRUFUL3cvUlpr?=
 =?utf-8?B?SDZsVnlvQkhMMmtUOExpcWJnR0h3VDFqRTBEaHFMY3B2OEErNkwrR2ZyclRj?=
 =?utf-8?B?YWM4eUVZNTVrZGs0VE1KNW8wWXRXeFFTZm5lVFd4YTFhdEJ3MkJITXVtRGhR?=
 =?utf-8?B?UC90eXdUb3VVenFCdkZtYnd1RHVTbE5JYU9LNmFuclpnMDhaWGhkTW1FcGxW?=
 =?utf-8?B?em05YmxQZ0hCZ2l0bHVBa3hkcndkdTUwOE4yVlB6MjB2ckx5dzFlaHJrVmxP?=
 =?utf-8?B?UTJuKysyU3VqalRvbFQ2NlQ1ZFVSSnF5SFVkWnBPMzRmWUx5eVhmeVpYQVVI?=
 =?utf-8?B?ekJic2NrYytReTg2SWplSWV6UGRubVBsR2RHcEZTR1ZUSTVRdUtYV0w2VG94?=
 =?utf-8?B?b1EvTlVrWCsvOHBVUTNmWHhyc042NVFGcGVNRTJyTFpiYVBrUlpuWG9zMkJM?=
 =?utf-8?B?Q1M4TFd3T1dDZXVLaFQrYkFWanZvMWR2ZzFKSE1XVVhwcE53WDE3RndWZUpH?=
 =?utf-8?B?N1pKN1lESEdBTUt4WWpHK2h6akk4OGlPQ2wwdDk3a01RdXBEYzdRZ3IwTFFV?=
 =?utf-8?B?VjE5NlliS3JCN3haQ2VSU0tDcnU3YnJCNXJsQitSQXBGc0crNVB2LzRtcWhn?=
 =?utf-8?B?MWE5aXVDeFNUVFAvS3VEc1ZpbkFPT3ErN3E4TVdCWVljcm5BT1lvRjFaMW9G?=
 =?utf-8?B?ODdKM2tXY25JU3hIb0NoYW9zendqYVIrOS81amxoREhXSm14Mjkxek9EQmNS?=
 =?utf-8?B?MkFiS1VFUk1XbmUxOU00a1BtVmZuUFExV1g1dEhYamlSYUpoeGl3Ui9WV1hR?=
 =?utf-8?B?Q3hLNzRqcmNieWVnOVA0TjNSSW82RmpVK0RWcTMybmhqaUIvU3hQc0crbWdv?=
 =?utf-8?B?bmRFbEVSNUJhWFZzWi9mdVY3UTNUR0xlL2MxUkhEbUl0TkhRNUc5VDRkelQw?=
 =?utf-8?B?UTBsTHhKempmbGVUZm52a0tIY0NzdFFWT3BLVDc5bzlUVkJVWVBiVThFMm54?=
 =?utf-8?B?MFVSbmlaTDRydXZNY2VWekozakNGWHc0VmNLK2gxOGRST0RWSHc0S2RXNkRF?=
 =?utf-8?B?bWVJVldtb3lvazk3Y1p4amc3OUUrS2llelNNV2F3L3I0MGhtNmg3K1Vvb2FS?=
 =?utf-8?B?Vm5uanNYNHN3S25qcG5PaTYzUGxCSU9JZVBUNVJReDVCdVlzOFVBUUpxamE2?=
 =?utf-8?B?Q3haQ3ZnOHc4VUVKUVo0eFd0Y3RUZHlnM0FTSm9mR1V2VHRRZTFpeEF4S3Q2?=
 =?utf-8?B?ejNLUEczdzhiMUM5Yzg4bVNVTzY0U3FxclZLK2NNSm5GME5wSlhobkVXbERQ?=
 =?utf-8?B?cm1ST1lyT3grbU16U3d3MU8zMnRCeFdCdGMvcWhicDVGWmZQcjB2Zk5GR1lR?=
 =?utf-8?B?QUJCckpUallGNGo3Nko5emhCdUdmVVlGYUxLdWxJcnV2MHRMaENjODdCQVNZ?=
 =?utf-8?B?MXMzYTl6MHBaaS9LSU9mTWNCSXFLWVQ3QitWengvdHcvbHFMVDZsQ05pVHBk?=
 =?utf-8?B?aFRpT0c1QlhIQ0Z2WEJ6SVQ4MWxLSFVnZzRXSXV6OWt3VVhUa1pZUFFyRTlW?=
 =?utf-8?B?NG9PQ2x0MFBHa1ZROXJhZjM3Um8vNUViNmVZbmVldElnWG1RTGVIZ0dqWDJF?=
 =?utf-8?B?Y01Qdm11bUx6UFhEQjBjcXRsbW5ieGlIZlRJdHZKcUtQRTBzSE5DU29sR2No?=
 =?utf-8?Q?MtKIS4/2lgzZs4FqPnWaa0BDh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9ea2ea-3e6d-42e8-191e-08dc693b2b4d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 17:30:03.1872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jJI97DkpmbiZfCxn6EIPuR83HXz42ogqfiVUqD5V6vei88dwH33yaL8Z+HqDioG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7701
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

On Mon, Apr 29, 2024 at 10:25:48AM +0200, Thomas Hellström wrote:

> > Yes there is another common scheme where you bind a window of CPU to
> > a
> > window on the device and mirror a fixed range, but this is a quite
> > different thing. It is not SVA, it has a fixed range, and it is
> > probably bound to a single GPU VMA in a multi-VMA device page table.
> 
> And this above here is exactly what we're implementing, and the GPU
> page-tables are populated using device faults. Regions (large) of the
> mirrored CPU mm need to coexist in the same GPU vm as traditional GPU
> buffer objects.

Well, not really, if that was the case you'd have a single VMA over
the entire bound range, not dynamically create them.

A single VMA that uses hmm_range_fault() to populate the VM is
completely logical.

Having a hidden range of mm binding and then creating/destroying 2M
VMAs dynamicaly is the thing that doesn't make alot of sense.

Jason
