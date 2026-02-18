Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E6LK/UDlWlbKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9CD152224
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7743910E2C9;
	Wed, 18 Feb 2026 00:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="reJVKQBn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012053.outbound.protection.outlook.com [52.101.53.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB2D10E556;
 Wed, 18 Feb 2026 00:12:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAkc4aakQdyObcORL0nJYshEFdpI7HIa5cioOWRbPGhnMrl6+PIr9MmMbCju9pDU2OAC7/quYFLjf7LUWUQAVcvMzD8DbYBrUiPeQUsVIZPDiKw+7niQQgBzUt2nMdr+bSPvzzi5ljvSvm4iBLLfRYAH4VSwAcfcVgCB5LvF1RR9KTfCCVeOSEAt9Dg+bskwPOSkg6DqFeWVLMl0SY436i1EM4SQPWuPCpanPyJX/8NWoo43b6BwZH1OucHgha4gFJMw0s1QfaR0uqlEaLOh1NHwHJS06OUW+sESn5fetCt0VEUjULRb/QTv5+ErUN+dL67sm/YbOVrTBXLYTIqy0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5f+CLnGfcFKbQi1kagHlzVy/X+smTIkCD11ZY7RQWjM=;
 b=u+YRDggsKK9HVwo7IQ6BUsEkG3jmsUhRqUgWnYBgerdm0vcmWSdUS5O8dO9JbyPMkebJVaGeoBLTQnGL6YSxAz6wqT7j0Upa/ZhA0uFjFggOfC5RGIWMglXMtsrvRon/W0ejmguMnZVqXZ9JBShnHbtrSF7v8zKTPUlfIckl8rBpSvQdFHBL7abfI93W78k0nNkH9HZOuE8cD8j5nSZDujQoLe+qdWq6Sx3uKKgyNC6sPKmOyPloxIN4cm7rwztc5lJRDkXcQXQLoF1xEvqKChYQ4ubeeZBdOpXutX0ZeXKUXDvvueU321n4fG59EpCnBoLzjKDmi5LlAmquUjJLNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5f+CLnGfcFKbQi1kagHlzVy/X+smTIkCD11ZY7RQWjM=;
 b=reJVKQBnaaszqW487KUcR3m4t9BS6g/RE12wJqPEbZFsJncFsUVT0NWXeP7VX0rmC5u1l4pXEfkf+CY/9V7z9orIZWE2sWg9njrk+oVYgLrag1Ls19Zl7r1Aj1YEytV69fTlg/VTWlPz+fmIMojYUoiAQcQASo6JNFtOl9Ux5FDRUTgaIcvKSWSgSAGVxFW7QtdZ+52lJ+wFcYtbzsszdWbP2gQrAP6Datue5oZe7ssl/uDPL1ZvG3SUNToLoyeNDX63OgvF9VerPQbc60M0YBuTduX3kzO+SbDLg8N0g9AVrbOUPN/kQNyMiZo4aeJOZIFINWys546ZxopTA7rfbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 00:12:08 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:08 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: 
Cc: Christian Koenig <christian.koenig@amd.com>,
 Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH RFC 07/26] dma-buf: Convert all the simple exporters to use
 SGT mapping type
Date: Tue, 17 Feb 2026 20:11:38 -0400
Message-ID: <7-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:208:2be::27) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba97d4e-8081-43b3-f0cd-08de6e8256c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3hRSDJXUXAwRWxLYU1rR3Y2ZVBVb3R5SEFNNHNuc1hsU0FILzZXWUpPNHdh?=
 =?utf-8?B?U0NOU3lnQVhnd2Zwb0gwOU1JUTlzdkFmdEZRNXRlcUVTMW5KdnNEWnp3Q0sz?=
 =?utf-8?B?RFFxT0JmWURIRVNvTVFOUmxad2xBY1ltVjVxdG1xNzRqc1VQQy9nWE9Yb1lJ?=
 =?utf-8?B?V3J4bm1qZ2xDV3Q0QlkrTWRMbXdMa0VaN0t3NTJSVTR4aDhGZ3JXTTczQzUz?=
 =?utf-8?B?U3hlYVBvV0FFUmUxOFFvUVh4dFY4WC9NZVY4d1FGNFhUakp0TzNQd2I1Ykha?=
 =?utf-8?B?MlY1NEgzRCtaR2d6TDBBdkdLSFp1dDVpRXBlQ0dQUldlYjBiTHp0T1JVTHVz?=
 =?utf-8?B?d1VzcFN4Z1EwMm93TllIaTNTSzNVRDJpVVBqRFdUU3JBRkJhQlB0c2R2UnRv?=
 =?utf-8?B?ZFBtaXBzajE3NWVRQ0JnRCtrdVBMaldrWldsbkM3MDRyWGVreTZjajhHMHA5?=
 =?utf-8?B?cExvTG1WU1dHckMzYzVnSHgwdTF3cGxTenpPYkRQb2RqTDhGZGZVMkU3WThv?=
 =?utf-8?B?SVVwN2JJdmZlWkhaTlNDL0k5YXR1OENUK01HVU9seEN0T0VYU2xwcjNFelU4?=
 =?utf-8?B?c3J3SUlMUlNCWTNEOFM4S1A4UW81aTNLL0RpMjYxUkd3UXM5TWhDWjNYOHZt?=
 =?utf-8?B?Zlh0RllQZWl4TE1CdGVPYkFVQktRUVFjbEhlK211WTBRVGtwaW1UOTZuc1px?=
 =?utf-8?B?aFNrTmxDNkFabXM2TmRQOVZmWmJWZ2ZtdTk3a2Q5a3VTclVZejVwMi9HeEJ4?=
 =?utf-8?B?RWZtdE5PU3MrL3MyVmJGdGROSDV2NDlTTkJvaG55dTNUeGE2YzNyWkRRZzFj?=
 =?utf-8?B?OGx2SWk1QlZUY0VKWFUyVkY3WnVKSE1QWWN3cDVFNG8vdkttRTBDQ2o0Yk5I?=
 =?utf-8?B?NjhVYnFjZXMrMlFTeVRpL2t2T29WZHdxYmRhUWJhelZyVGdyZFVRNlA2ZkVr?=
 =?utf-8?B?VmhYNmxYZ3FLaEUzZWNTMFgwK2swWC90S1dhK1VaRzkyeWRzWkJmS3hrVThq?=
 =?utf-8?B?RFhKR0xTRFRNd1l6ZnE2MStnbFBpaHYrTWgxRHQwa1ZVcHJoNEgvQVd6K3Nm?=
 =?utf-8?B?M3ZHR04yUFNLNjZ6UE0vV0hsWWFUYzY4OStpbEJ0cENmTTR6TllOUkpIMkZN?=
 =?utf-8?B?V1JGRkFvUmQ2bmNJN2EwZ3d4c3VGZWFJeTlGUHZnZFdLUFFIY2JpSnBSRDZK?=
 =?utf-8?B?T3FESXpSYWRGNjlvUHk0c2xTdW1uWEczdWdEQzJ5RTZOUUs2V1E5YzAwVlF3?=
 =?utf-8?B?UGcxUVJFbHg1U05BVlpzY0I5amM3U05nZnVSRjVQblRlSUt1eHpidGFLclJ6?=
 =?utf-8?B?bGFBbG5TSzNWaFRJayttWWhhaVd6OC9tTjJMa1pocDZwRGtWWmIxczArdjVQ?=
 =?utf-8?B?MWp4TitVL0NINU1NVWFmMTVnVjA2SkFpaUJ1cmo3VE0vd1RoU1VaRkpOaHIv?=
 =?utf-8?B?WjFkZTVnUy9PRTFMNVpSMWVENkZTMElFbTUvMEZKNkpHcE1ueWxtRzI2b1Bh?=
 =?utf-8?B?d2U4aWlMenJLYms4VG5aczlnWTV5Y1F6RmlPazA4dWNoUENiNHhhc3JTcGhV?=
 =?utf-8?B?QkJRbzBnWG51YmFpVmZxQkl3TmtMUU1YTkxTM3gvdzZnYm5TQi9XejFYWnZH?=
 =?utf-8?B?OFdsWk1wSnJQZEIrdU1vQUJyWmpDdVZhSzNOQWRKTmdqMGlBVzhoaElYbjR1?=
 =?utf-8?B?Y1BXY2hlbGN4ckN3NVM2R2JPQ0N4VlFiRWpINjUxcU84K1JaL2wxVnVOMW9i?=
 =?utf-8?B?OVdBdWxCWjlFM3p2ZGlHamtDczNZMTFTS292Q1JxSGJjYUszNUtua21uTXBO?=
 =?utf-8?B?b1lNUUtoS0hYY0pZdGVidmFtVTJEWlFtUHczb0EvTjhVNTFvRmRvVG1NYkUw?=
 =?utf-8?B?TlNUaVBPNldtZUl6Uy9KeDN4N2hVcXZ1WjdvV2pPbGN3cldkenpXeXNQMEZZ?=
 =?utf-8?B?eE1RVDROWDhVQnhQMURkdXF1ZnBUcTN2YldFTFAzdlVOeC9xZ0NpWlZEcEhY?=
 =?utf-8?B?cGhScUJNemR0bklSSkMxNlZiQXpZbmdoK3hlWlhvckhjdy9sVWZNSExvV0w4?=
 =?utf-8?B?QVdXSC9TYjZ5YXlIOGdIa2FXdjBrYnJ6R3dWa1R5SmdaZ3E5aG9CSVNVZkhm?=
 =?utf-8?Q?1KnQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDdKMVJQdmVseGJqeW5GRVJPakVqSkQvKzVhbEFSMGFhS0lrbkxkU3RYMnY2?=
 =?utf-8?B?ZElVV2V2SjEvR3Bva2c1YU5EdHplNDNiR1B1eVFrUTF4SHJ0QVNCZzZUU0pG?=
 =?utf-8?B?a2pBR1VPSTdlSkdKSGtHSXhuRE0zVkpLMTFpOUFLTWIwNnBubzU3ZE9oQlM3?=
 =?utf-8?B?Qm9uTlptOEsrQ05MREs2YTVyVTVweHpjNU9NWnlBZTlVcnY0R29JQnpHWkxl?=
 =?utf-8?B?S1dQNCs2SVIvSVo1RkwxSktRaDVvcXpTcjB4VWlsUWpOT1FqeWo5S0xBNEpx?=
 =?utf-8?B?VExMbFNpWm00UFd3eWt5NTNTMzJCRGw1QnU4L2xYTE9GTEdRdkNURGxhaVhX?=
 =?utf-8?B?eU14OHorVEcwWDR1KzFxNjNlTlkwV1Y3MENlS0NEWENRNVo3eXR4dmlLWjBS?=
 =?utf-8?B?UU5ucVNOd05mWVBJaXRWN1lCRlU5QXdFQ2FVNjVIVVQwWTZWVDJjamxqUHBC?=
 =?utf-8?B?NmNzSzlDby9xL29lRmpHQWxYa2NlSmdMTDdJQXZpQkN1NUMwdnV1bkdFejdh?=
 =?utf-8?B?UG94ZXQza2pKNDFUMjg2U2k2b2tOM1lISFgzOEVtWDN2VkJXZEduWFFzbnZv?=
 =?utf-8?B?NjhqTmJCMzVobERzVXBHYzd6SVlLb0pkZWxNZTl3d05Pb0tYcktCWnR4YmZM?=
 =?utf-8?B?UjJkWmkrY1pQRGlRWjdWUWJNM1RoOUFEZDFOeCtBR2NJZS9aNGxnUlYyQmw2?=
 =?utf-8?B?azJhRXRvY1VyTDJwMUZLVHljSEI3MWRmRVBJOFRCQVVvbzJUMWR5SXVoUjVQ?=
 =?utf-8?B?TmZnUlFsOEM5RWNkTk9DaVIxdndZaElzWGhQWGl0M215NE1pb2ZOQzc3MHBD?=
 =?utf-8?B?eGNLZ3QrdEpPNk1YMHoxUDV1emJRMm9QbEFieGNKRFRDRmE3NERjVUM1eFgz?=
 =?utf-8?B?VHhXK2I4VWY4V2gzRThnU0Z0a1RBSFpEV0VSbDVLdnFlK0s3cjY4dHN0MVFu?=
 =?utf-8?B?TE5nMzhqeWdZQ3FTbDJRZ1RpcUFNc1pqQW5hazlPcXhoNjM4akdNbDNZTlJs?=
 =?utf-8?B?RUtaQU1XRFMzTVVqU1pLSWN2VWxQaENkanE3aXRJWHNRVXdqY25qOHZKQWRH?=
 =?utf-8?B?UzZST0hCWkpkT3k3UVVHa25KaWF2UTJCNnpZMmVLOUNYaElSS2dZcHhYNlYx?=
 =?utf-8?B?WTN2eHJXVm9VNHRRSjBoUFFCazRPY3drYzF0Tys5aEdRSmlNcXpEREgzNThS?=
 =?utf-8?B?aFlSQzhaNVFZbmo0aVZiRUhVeU5IeERxaDhxdEdrbEgySmZ4N0pVa0tBKytI?=
 =?utf-8?B?clIrUHlFZSsrUEVuUVo1VjNSUzJ2MDhIUTlsK1Jxb3JOcVFGUmNDbTJMdTVk?=
 =?utf-8?B?N0xodFJWNXlPV3hndWVvV3dsK0drMWl1SHdpOEhCNFFoUER4ME5iUnJ3cTYv?=
 =?utf-8?B?alVIaVlGcWpQamQ1YVVIb3B2YlpxOVBJaE0wQXB3TVdmazMyczg3Um5qV3Nt?=
 =?utf-8?B?QlAwRVZESlhwMnN6aG0xL2xJaDcwWnlCNndubjkvOWFPYis5ZWt5d09DTm4y?=
 =?utf-8?B?Wm0vVTFULzFoYkZjMVh3UHRZaDFoeGZaMFdLMXJGYmN1S2g4RTBqSmwrT2NX?=
 =?utf-8?B?RnNaakxEZ1J2dElWOTZUY2NLLzhhSGEyRnFvVXh5M0ErL1R6QWMwK2ZZWENx?=
 =?utf-8?B?RnBFbEoxU3Y3SG5xdDJhQkpzQ1RSTjBCWHJXNFBOdW9wZFJGYVpoWFdXei9w?=
 =?utf-8?B?RnNWWDZUK1BoRzJxSnZxMUtRU1dFSjh3QVBrd1hwRU9QVVB3MFpKMEE3TXVk?=
 =?utf-8?B?M1lJRER5aUVHK3AxYTdqZG5vUzVzUk1uYWJ4ejhoWUZrTkQwRW5BaGZNYVMy?=
 =?utf-8?B?a2xHeVRSMHNpZFhvd3pFYjJscUV1UXFJT3VaU2FEQjVDdzlXWmdMSlNNVjFo?=
 =?utf-8?B?MmgvZnFsODhXM0pIdDgxRXBEbU43cmtTaG1QMjExSmRVcE55TWdNY04vUzRt?=
 =?utf-8?B?cjF1eFplSlJkemNtUEhWTzFCb2JMb0pTMndSL0tvaVVwV0hKME52aVB6SXV2?=
 =?utf-8?B?YnVNVkpYWVNhSmJJTFNqSUpQQTJVVDg1c2pGTmdWcUVTQXQwMFdLTlk0My8v?=
 =?utf-8?B?NW5wNmFhV0ZoY2lRZHV3cW1KQWFNRG4rd3dpd3p3VmZucG5uT0VrMjhUNmFZ?=
 =?utf-8?B?OHV5dkgvd2pzTmFqUlo4eU5IYk1UNitraHFuNkUvOVFRcUE3U0dCeU41ZU9J?=
 =?utf-8?B?c1p0VmVnTXFiWGF2VDVHUHM3NE9heHZGZXVqcXRXaDFTM1pvdEFhWEtqRWI2?=
 =?utf-8?B?OG1KZTBhWHRmaGlpVjZQUGUrKzJ4MThrZjNKbXc3dFZuZmdPQ1J3dDZoU3Zx?=
 =?utf-8?B?S2k2ZktpaEFQUGxWb0N4Ym5vK0VYN0crNXZUVXVidHpKV3RWd2tkQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba97d4e-8081-43b3-f0cd-08de6e8256c5
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:12:01.6343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G223mB0V62YerF1Kp7YeOh2WI7OvfvccGB4OqEXp8bOGTjZfb58/r/3PiJaoZ3do
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 3A9CD152224
X-Rspamd-Action: no action

Update the exporters to use a SGT mapping type and the new style mapping
type API. None of these exporters do anything with attach->peer2peer or
importer_ops->allow_peer2peer and they all follow the same pattern.

Change all the places that need to get the SGT's DMA device for DMA API
use to use dma_buf_sgt_dma_device().

This is all a mechanical change of moving the map_dma_buf/unmap_dma_buf
into DMA_BUF_SIMPLE_SGT_EXP_MATCH() arguments and switching
attach->dev to dma_buf_sgt_dma_device(attach).

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/accel/amdxdna/amdxdna_gem.c           |  5 +++--
 drivers/accel/amdxdna/amdxdna_ubuf.c          | 10 ++++++----
 drivers/accel/ivpu/ivpu_gem_userptr.c         | 11 +++++++----
 drivers/dma-buf/heaps/cma_heap.c              | 12 +++++++-----
 drivers/dma-buf/heaps/system_heap.c           | 13 ++++++++-----
 drivers/dma-buf/udmabuf.c                     |  8 ++++----
 drivers/gpu/drm/armada/armada_gem.c           | 12 +++++++-----
 drivers/gpu/drm/drm_prime.c                   |  9 +++++----
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  8 +++++---
 .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |  8 ++++----
 drivers/gpu/drm/msm/msm_gem_prime.c           |  7 +++++--
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |  5 +++--
 drivers/gpu/drm/tegra/gem.c                   | 12 +++++++-----
 drivers/gpu/drm/virtio/virtgpu_prime.c        | 11 +++++++----
 drivers/iommu/iommufd/selftest.c              | 18 +++---------------
 .../common/videobuf2/videobuf2-dma-contig.c   | 15 ++++++++-------
 .../media/common/videobuf2/videobuf2-dma-sg.c | 14 +++++++++-----
 .../common/videobuf2/videobuf2-vmalloc.c      | 13 ++++++++-----
 drivers/misc/fastrpc.c                        | 12 +++++++-----
 drivers/tee/tee_heap.c                        | 13 +++++++------
 drivers/xen/gntdev-dmabuf.c                   | 19 +++++++++++--------
 samples/vfio-mdev/mbochs.c                    | 10 +++++-----
 sound/soc/fsl/fsl_asrc_m2m.c                  | 12 +++++++-----
 23 files changed, 143 insertions(+), 114 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index dfa916eeb2d9c8..fb7c8de960cd2a 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -11,6 +11,7 @@
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/dma-direct.h>
 #include <linux/iosys-map.h>
 #include <linux/pagemap.h>
@@ -385,12 +386,12 @@ static int amdxdna_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struc
 static const struct dma_buf_ops amdxdna_dmabuf_ops = {
 	.attach = drm_gem_map_attach,
 	.detach = drm_gem_map_detach,
-	.map_dma_buf = drm_gem_map_dma_buf,
-	.unmap_dma_buf = drm_gem_unmap_dma_buf,
 	.release = drm_gem_dmabuf_release,
 	.mmap = amdxdna_gem_dmabuf_mmap,
 	.vmap = drm_gem_dmabuf_vmap,
 	.vunmap = drm_gem_dmabuf_vunmap,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(drm_gem_map_dma_buf,
+				     drm_gem_unmap_dma_buf),
 };
 
 static int amdxdna_gem_obj_vmap(struct amdxdna_gem_obj *abo, void **vaddr)
diff --git a/drivers/accel/amdxdna/amdxdna_ubuf.c b/drivers/accel/amdxdna/amdxdna_ubuf.c
index 077b2261cf2a04..ad3c9064f5c5cd 100644
--- a/drivers/accel/amdxdna/amdxdna_ubuf.c
+++ b/drivers/accel/amdxdna/amdxdna_ubuf.c
@@ -7,6 +7,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_print.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/pagemap.h>
 #include <linux/vmalloc.h>
 
@@ -37,7 +38,8 @@ static struct sg_table *amdxdna_ubuf_map(struct dma_buf_attachment *attach,
 		return ERR_PTR(ret);
 
 	if (ubuf->flags & AMDXDNA_UBUF_FLAG_MAP_DMA) {
-		ret = dma_map_sgtable(attach->dev, sg, direction, 0);
+		ret = dma_map_sgtable(dma_buf_sgt_dma_device(attach), sg,
+				      direction, 0);
 		if (ret)
 			return ERR_PTR(ret);
 	}
@@ -52,7 +54,8 @@ static void amdxdna_ubuf_unmap(struct dma_buf_attachment *attach,
 	struct amdxdna_ubuf_priv *ubuf = attach->dmabuf->priv;
 
 	if (ubuf->flags & AMDXDNA_UBUF_FLAG_MAP_DMA)
-		dma_unmap_sgtable(attach->dev, sg, direction, 0);
+		dma_unmap_sgtable(dma_buf_sgt_dma_device(attach), sg, direction,
+				  0);
 
 	sg_free_table(sg);
 	kfree(sg);
@@ -117,12 +120,11 @@ static void amdxdna_ubuf_vunmap(struct dma_buf *dbuf, struct iosys_map *map)
 }
 
 static const struct dma_buf_ops amdxdna_ubuf_dmabuf_ops = {
-	.map_dma_buf = amdxdna_ubuf_map,
-	.unmap_dma_buf = amdxdna_ubuf_unmap,
 	.release = amdxdna_ubuf_release,
 	.mmap = amdxdna_ubuf_mmap,
 	.vmap = amdxdna_ubuf_vmap,
 	.vunmap = amdxdna_ubuf_vunmap,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(amdxdna_ubuf_map, amdxdna_ubuf_unmap),
 };
 
 struct dma_buf *amdxdna_get_ubuf(struct drm_device *dev,
diff --git a/drivers/accel/ivpu/ivpu_gem_userptr.c b/drivers/accel/ivpu/ivpu_gem_userptr.c
index 25ba606164c03c..32e9a37a15191d 100644
--- a/drivers/accel/ivpu/ivpu_gem_userptr.c
+++ b/drivers/accel/ivpu/ivpu_gem_userptr.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/err.h>
 #include <linux/highmem.h>
 #include <linux/mm.h>
@@ -26,7 +27,8 @@ ivpu_gem_userptr_dmabuf_map(struct dma_buf_attachment *attachment,
 	struct sg_table *sgt = attachment->dmabuf->priv;
 	int ret;
 
-	ret = dma_map_sgtable(attachment->dev, sgt, direction, DMA_ATTR_SKIP_CPU_SYNC);
+	ret = dma_map_sgtable(dma_buf_sgt_dma_device(attachment), sgt,
+			      direction, DMA_ATTR_SKIP_CPU_SYNC);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -37,7 +39,8 @@ static void ivpu_gem_userptr_dmabuf_unmap(struct dma_buf_attachment *attachment,
 					  struct sg_table *sgt,
 					  enum dma_data_direction direction)
 {
-	dma_unmap_sgtable(attachment->dev, sgt, direction, DMA_ATTR_SKIP_CPU_SYNC);
+	dma_unmap_sgtable(dma_buf_sgt_dma_device(attachment), sgt, direction,
+			  DMA_ATTR_SKIP_CPU_SYNC);
 }
 
 static void ivpu_gem_userptr_dmabuf_release(struct dma_buf *dma_buf)
@@ -56,9 +59,9 @@ static void ivpu_gem_userptr_dmabuf_release(struct dma_buf *dma_buf)
 }
 
 static const struct dma_buf_ops ivpu_gem_userptr_dmabuf_ops = {
-	.map_dma_buf = ivpu_gem_userptr_dmabuf_map,
-	.unmap_dma_buf = ivpu_gem_userptr_dmabuf_unmap,
 	.release = ivpu_gem_userptr_dmabuf_release,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(ivpu_gem_userptr_dmabuf_map,
+				     ivpu_gem_userptr_dmabuf_unmap),
 };
 
 static struct dma_buf *
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 42f88193eab9f8..a1ac415bbc512c 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -14,6 +14,7 @@
 
 #include <linux/cma.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/dma-buf/heaps/cma.h>
 #include <linux/dma-heap.h>
 #include <linux/dma-map-ops.h>
@@ -87,7 +88,7 @@ static int cma_heap_attach(struct dma_buf *dmabuf,
 		return ret;
 	}
 
-	a->dev = attachment->dev;
+	a->dev = dma_buf_sgt_dma_device(attachment);
 	INIT_LIST_HEAD(&a->list);
 	a->mapped = false;
 
@@ -121,7 +122,8 @@ static struct sg_table *cma_heap_map_dma_buf(struct dma_buf_attachment *attachme
 	struct sg_table *table = &a->table;
 	int ret;
 
-	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
+	ret = dma_map_sgtable(dma_buf_sgt_dma_device(attachment), table,
+			      direction, 0);
 	if (ret)
 		return ERR_PTR(-ENOMEM);
 	a->mapped = true;
@@ -135,7 +137,8 @@ static void cma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 	struct dma_heap_attachment *a = attachment->priv;
 
 	a->mapped = false;
-	dma_unmap_sgtable(attachment->dev, table, direction, 0);
+	dma_unmap_sgtable(dma_buf_sgt_dma_device(attachment), table, direction,
+			  0);
 }
 
 static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
@@ -282,14 +285,13 @@ static void cma_heap_dma_buf_release(struct dma_buf *dmabuf)
 static const struct dma_buf_ops cma_heap_buf_ops = {
 	.attach = cma_heap_attach,
 	.detach = cma_heap_detach,
-	.map_dma_buf = cma_heap_map_dma_buf,
-	.unmap_dma_buf = cma_heap_unmap_dma_buf,
 	.begin_cpu_access = cma_heap_dma_buf_begin_cpu_access,
 	.end_cpu_access = cma_heap_dma_buf_end_cpu_access,
 	.mmap = cma_heap_mmap,
 	.vmap = cma_heap_vmap,
 	.vunmap = cma_heap_vunmap,
 	.release = cma_heap_dma_buf_release,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(cma_heap_map_dma_buf, cma_heap_unmap_dma_buf),
 };
 
 static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 4c782fe33fd497..18c05d2fe27f0b 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-heap.h>
 #include <linux/err.h>
@@ -87,7 +88,7 @@ static int system_heap_attach(struct dma_buf *dmabuf,
 		return ret;
 	}
 
-	a->dev = attachment->dev;
+	a->dev = dma_buf_sgt_dma_device(attachment);
 	INIT_LIST_HEAD(&a->list);
 	a->mapped = false;
 
@@ -121,7 +122,8 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
 	struct sg_table *table = &a->table;
 	int ret;
 
-	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
+	ret = dma_map_sgtable(dma_buf_sgt_dma_device(attachment), table,
+			      direction, 0);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -136,7 +138,8 @@ static void system_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 	struct dma_heap_attachment *a = attachment->priv;
 
 	a->mapped = false;
-	dma_unmap_sgtable(attachment->dev, table, direction, 0);
+	dma_unmap_sgtable(dma_buf_sgt_dma_device(attachment), table, direction,
+			  0);
 }
 
 static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
@@ -305,14 +308,14 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
 static const struct dma_buf_ops system_heap_buf_ops = {
 	.attach = system_heap_attach,
 	.detach = system_heap_detach,
-	.map_dma_buf = system_heap_map_dma_buf,
-	.unmap_dma_buf = system_heap_unmap_dma_buf,
 	.begin_cpu_access = system_heap_dma_buf_begin_cpu_access,
 	.end_cpu_access = system_heap_dma_buf_end_cpu_access,
 	.mmap = system_heap_mmap,
 	.vmap = system_heap_vmap,
 	.vunmap = system_heap_vunmap,
 	.release = system_heap_dma_buf_release,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(system_heap_map_dma_buf,
+				     system_heap_unmap_dma_buf),
 };
 
 static struct page *alloc_largest_available(unsigned long size,
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 40399c26e6be62..e1b75772df168f 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -2,6 +2,7 @@
 #include <linux/cred.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/dma-resv.h>
 #include <linux/highmem.h>
 #include <linux/init.h>
@@ -185,14 +186,14 @@ static void put_sg_table(struct device *dev, struct sg_table *sg,
 static struct sg_table *map_udmabuf(struct dma_buf_attachment *at,
 				    enum dma_data_direction direction)
 {
-	return get_sg_table(at->dev, at->dmabuf, direction);
+	return get_sg_table(dma_buf_sgt_dma_device(at), at->dmabuf, direction);
 }
 
 static void unmap_udmabuf(struct dma_buf_attachment *at,
 			  struct sg_table *sg,
 			  enum dma_data_direction direction)
 {
-	return put_sg_table(at->dev, sg, direction);
+	return put_sg_table(dma_buf_sgt_dma_device(at), sg, direction);
 }
 
 static void unpin_all_folios(struct udmabuf *ubuf)
@@ -277,14 +278,13 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
 }
 
 static const struct dma_buf_ops udmabuf_ops = {
-	.map_dma_buf	   = map_udmabuf,
-	.unmap_dma_buf	   = unmap_udmabuf,
 	.release	   = release_udmabuf,
 	.mmap		   = mmap_udmabuf,
 	.vmap		   = vmap_udmabuf,
 	.vunmap		   = vunmap_udmabuf,
 	.begin_cpu_access  = begin_cpu_udmabuf,
 	.end_cpu_access    = end_cpu_udmabuf,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(map_udmabuf, unmap_udmabuf),
 };
 
 #define SEALS_WANTED (F_SEAL_SHRINK)
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 35fcfa0d85ff35..bf6968b1f22511 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/dma-mapping.h>
 #include <linux/mman.h>
 #include <linux/shmem_fs.h>
@@ -387,6 +388,7 @@ static struct sg_table *
 armada_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 	enum dma_data_direction dir)
 {
+	struct device *dma_dev = dma_buf_sgt_dma_device(attach);
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 	struct armada_gem_object *dobj = drm_to_armada_gem(obj);
 	struct scatterlist *sg;
@@ -417,7 +419,7 @@ armada_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 			sg_set_page(sg, page, PAGE_SIZE, 0);
 		}
 
-		if (dma_map_sgtable(attach->dev, sgt, dir, 0))
+		if (dma_map_sgtable(dma_dev, sgt, dir, 0))
 			goto release;
 	} else if (dobj->page) {
 		/* Single contiguous page */
@@ -426,7 +428,7 @@ armada_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 
 		sg_set_page(sgt->sgl, dobj->page, dobj->obj.size, 0);
 
-		if (dma_map_sgtable(attach->dev, sgt, dir, 0))
+		if (dma_map_sgtable(dma_dev, sgt, dir, 0))
 			goto free_table;
 	} else if (dobj->linear) {
 		/* Single contiguous physical region - no struct page */
@@ -458,7 +460,7 @@ static void armada_gem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
 	int i;
 
 	if (!dobj->linear)
-		dma_unmap_sgtable(attach->dev, sgt, dir, 0);
+		dma_unmap_sgtable(dma_buf_sgt_dma_device(attach), sgt, dir, 0);
 
 	if (dobj->obj.filp) {
 		struct scatterlist *sg;
@@ -478,10 +480,10 @@ armada_gem_dmabuf_mmap(struct dma_buf *buf, struct vm_area_struct *vma)
 }
 
 static const struct dma_buf_ops armada_gem_prime_dmabuf_ops = {
-	.map_dma_buf	= armada_gem_prime_map_dma_buf,
-	.unmap_dma_buf	= armada_gem_prime_unmap_dma_buf,
 	.release	= drm_gem_dmabuf_release,
 	.mmap		= armada_gem_dmabuf_mmap,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(armada_gem_prime_map_dma_buf,
+				     armada_gem_prime_unmap_dma_buf),
 };
 
 struct dma_buf *
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index d093a888b0df8f..94ec2483e40107 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -693,7 +693,7 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
 	if (IS_ERR(sgt))
 		return sgt;
 
-	ret = dma_map_sgtable(attach->dev, sgt, dir,
+	ret = dma_map_sgtable(dma_buf_sgt_dma_device(attach), sgt, dir,
 			      DMA_ATTR_SKIP_CPU_SYNC);
 	if (ret) {
 		sg_free_table(sgt);
@@ -720,7 +720,8 @@ void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 	if (!sgt)
 		return;
 
-	dma_unmap_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
+	dma_unmap_sgtable(dma_buf_sgt_dma_device(attach), sgt, dir,
+			  DMA_ATTR_SKIP_CPU_SYNC);
 	sg_free_table(sgt);
 	kfree(sgt);
 }
@@ -840,12 +841,12 @@ EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
 static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 	.attach = drm_gem_map_attach,
 	.detach = drm_gem_map_detach,
-	.map_dma_buf = drm_gem_map_dma_buf,
-	.unmap_dma_buf = drm_gem_unmap_dma_buf,
 	.release = drm_gem_dmabuf_release,
 	.mmap = drm_gem_dmabuf_mmap,
 	.vmap = drm_gem_dmabuf_vmap,
 	.vunmap = drm_gem_dmabuf_vunmap,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(drm_gem_map_dma_buf,
+				     drm_gem_unmap_dma_buf),
 };
 
 /**
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index f4f1c979d1b9ca..a119623aed254b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/highmem.h>
 #include <linux/dma-resv.h>
 #include <linux/module.h>
@@ -52,7 +53,8 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attach,
 		dst = sg_next(dst);
 	}
 
-	ret = dma_map_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
+	ret = dma_map_sgtable(dma_buf_sgt_dma_device(attach), sgt, dir,
+			      DMA_ATTR_SKIP_CPU_SYNC);
 	if (ret)
 		goto err_free_sg;
 
@@ -203,14 +205,14 @@ static void i915_gem_dmabuf_detach(struct dma_buf *dmabuf,
 static const struct dma_buf_ops i915_dmabuf_ops =  {
 	.attach = i915_gem_dmabuf_attach,
 	.detach = i915_gem_dmabuf_detach,
-	.map_dma_buf = i915_gem_map_dma_buf,
-	.unmap_dma_buf = drm_gem_unmap_dma_buf,
 	.release = drm_gem_dmabuf_release,
 	.mmap = i915_gem_dmabuf_mmap,
 	.vmap = i915_gem_dmabuf_vmap,
 	.vunmap = i915_gem_dmabuf_vunmap,
 	.begin_cpu_access = i915_gem_begin_cpu_access,
 	.end_cpu_access = i915_gem_end_cpu_access,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(i915_gem_map_dma_buf,
+				     drm_gem_unmap_dma_buf),
 };
 
 struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags)
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
index 5cd58e0f0dcf64..93a091280baf9e 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
@@ -4,6 +4,7 @@
  * Copyright © 2016 Intel Corporation
  */
 
+#include <linux/dma-buf-mapping.h>
 #include <linux/vmalloc.h>
 #include "mock_dmabuf.h"
 
@@ -29,7 +30,7 @@ static struct sg_table *mock_map_dma_buf(struct dma_buf_attachment *attachment,
 		sg = sg_next(sg);
 	}
 
-	err = dma_map_sgtable(attachment->dev, st, dir, 0);
+	err = dma_map_sgtable(dma_buf_sgt_dma_device(attachment), st, dir, 0);
 	if (err)
 		goto err_st;
 
@@ -46,7 +47,7 @@ static void mock_unmap_dma_buf(struct dma_buf_attachment *attachment,
 			       struct sg_table *st,
 			       enum dma_data_direction dir)
 {
-	dma_unmap_sgtable(attachment->dev, st, dir, 0);
+	dma_unmap_sgtable(dma_buf_sgt_dma_device(attachment), st, dir, 0);
 	sg_free_table(st);
 	kfree(st);
 }
@@ -88,12 +89,11 @@ static int mock_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
 }
 
 static const struct dma_buf_ops mock_dmabuf_ops =  {
-	.map_dma_buf = mock_map_dma_buf,
-	.unmap_dma_buf = mock_unmap_dma_buf,
 	.release = mock_dmabuf_release,
 	.mmap = mock_dmabuf_mmap,
 	.vmap = mock_dmabuf_vmap,
 	.vunmap = mock_dmabuf_vunmap,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(mock_map_dma_buf, mock_unmap_dma_buf),
 };
 
 static struct dma_buf *mock_dmabuf(int npages)
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 036d34c674d9a2..ed7a9bfd33c288 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 
 #include <drm/drm_drv.h>
 #include <drm/drm_prime.h>
@@ -54,12 +55,12 @@ static void msm_gem_dmabuf_release(struct dma_buf *dma_buf)
 static const struct dma_buf_ops msm_gem_prime_dmabuf_ops =  {
 	.attach = drm_gem_map_attach,
 	.detach = drm_gem_map_detach,
-	.map_dma_buf = drm_gem_map_dma_buf,
-	.unmap_dma_buf = drm_gem_unmap_dma_buf,
 	.release = msm_gem_dmabuf_release,
 	.mmap = drm_gem_dmabuf_mmap,
 	.vmap = drm_gem_dmabuf_vmap,
 	.vunmap = drm_gem_dmabuf_vunmap,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(drm_gem_map_dma_buf,
+				     drm_gem_unmap_dma_buf),
 };
 
 struct drm_gem_object *msm_gem_prime_import(struct drm_device *dev,
@@ -132,3 +133,5 @@ void msm_gem_prime_unpin(struct drm_gem_object *obj)
 
 	msm_gem_unpin_pages_locked(obj);
 }
+
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index 30cf1cdc1aa3c8..23beaeefab67d7 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/highmem.h>
 
 #include <drm/drm_prime.h>
@@ -69,12 +70,12 @@ static int omap_gem_dmabuf_mmap(struct dma_buf *buffer,
 }
 
 static const struct dma_buf_ops omap_dmabuf_ops = {
-	.map_dma_buf = omap_gem_map_dma_buf,
-	.unmap_dma_buf = omap_gem_unmap_dma_buf,
 	.release = drm_gem_dmabuf_release,
 	.begin_cpu_access = omap_gem_dmabuf_begin_cpu_access,
 	.end_cpu_access = omap_gem_dmabuf_end_cpu_access,
 	.mmap = omap_gem_dmabuf_mmap,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(omap_gem_map_dma_buf,
+				     omap_gem_unmap_dma_buf),
 };
 
 struct dma_buf *omap_gem_prime_export(struct drm_gem_object *obj, int flags)
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 6b14f1e919eb6b..244c01819d56b5 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/vmalloc.h>
@@ -635,6 +636,7 @@ static struct sg_table *
 tegra_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 			    enum dma_data_direction dir)
 {
+	struct device *dma_dev = dma_buf_sgt_dma_device(attach);
 	struct drm_gem_object *gem = attach->dmabuf->priv;
 	struct tegra_bo *bo = to_tegra_bo(gem);
 	struct sg_table *sgt;
@@ -648,12 +650,12 @@ tegra_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 					      0, gem->size, GFP_KERNEL) < 0)
 			goto free;
 	} else {
-		if (dma_get_sgtable(attach->dev, sgt, bo->vaddr, bo->iova,
+		if (dma_get_sgtable(dma_dev, sgt, bo->vaddr, bo->iova,
 				    gem->size) < 0)
 			goto free;
 	}
 
-	if (dma_map_sgtable(attach->dev, sgt, dir, 0))
+	if (dma_map_sgtable(dma_dev, sgt, dir, 0))
 		goto free;
 
 	return sgt;
@@ -672,7 +674,7 @@ static void tegra_gem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
 	struct tegra_bo *bo = to_tegra_bo(gem);
 
 	if (bo->pages)
-		dma_unmap_sgtable(attach->dev, sgt, dir, 0);
+		dma_unmap_sgtable(dma_buf_sgt_dma_device(attach), sgt, dir, 0);
 
 	sg_free_table(sgt);
 	kfree(sgt);
@@ -745,14 +747,14 @@ static void tegra_gem_prime_vunmap(struct dma_buf *buf, struct iosys_map *map)
 }
 
 static const struct dma_buf_ops tegra_gem_prime_dmabuf_ops = {
-	.map_dma_buf = tegra_gem_prime_map_dma_buf,
-	.unmap_dma_buf = tegra_gem_prime_unmap_dma_buf,
 	.release = tegra_gem_prime_release,
 	.begin_cpu_access = tegra_gem_prime_begin_cpu_access,
 	.end_cpu_access = tegra_gem_prime_end_cpu_access,
 	.mmap = tegra_gem_prime_mmap,
 	.vmap = tegra_gem_prime_vmap,
 	.vunmap = tegra_gem_prime_vunmap,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(tegra_gem_prime_map_dma_buf,
+				     tegra_gem_prime_unmap_dma_buf),
 };
 
 struct dma_buf *tegra_gem_prime_export(struct drm_gem_object *gem,
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index ce49282198cbf6..d7e1f741f941a3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -23,6 +23,7 @@
  */
 
 #include <drm/drm_prime.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/virtio_dma_buf.h>
 
 #include "virtgpu_drv.h"
@@ -53,7 +54,8 @@ virtgpu_gem_map_dma_buf(struct dma_buf_attachment *attach,
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
 
 	if (virtio_gpu_is_vram(bo))
-		return virtio_gpu_vram_map_dma_buf(bo, attach->dev, dir);
+		return virtio_gpu_vram_map_dma_buf(
+			bo, dma_buf_sgt_dma_device(attach), dir);
 
 	return drm_gem_map_dma_buf(attach, dir);
 }
@@ -66,7 +68,8 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
 
 	if (virtio_gpu_is_vram(bo)) {
-		virtio_gpu_vram_unmap_dma_buf(attach->dev, sgt, dir);
+		virtio_gpu_vram_unmap_dma_buf(dma_buf_sgt_dma_device(attach),
+					      sgt, dir);
 		return;
 	}
 
@@ -77,12 +80,12 @@ static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
 	.ops = {
 		.attach = virtio_dma_buf_attach,
 		.detach = drm_gem_map_detach,
-		.map_dma_buf = virtgpu_gem_map_dma_buf,
-		.unmap_dma_buf = virtgpu_gem_unmap_dma_buf,
 		.release = drm_gem_dmabuf_release,
 		.mmap = drm_gem_dmabuf_mmap,
 		.vmap = drm_gem_dmabuf_vmap,
 		.vunmap = drm_gem_dmabuf_vunmap,
+		DMA_BUF_SIMPLE_SGT_EXP_MATCH(virtgpu_gem_map_dma_buf,
+					     virtgpu_gem_unmap_dma_buf),
 	},
 	.device_attach = drm_gem_map_attach,
 	.get_uuid = virtgpu_virtio_get_uuid,
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 550ff36dec3a35..7aa6a58a5705f7 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -6,6 +6,7 @@
 #include <linux/anon_inodes.h>
 #include <linux/debugfs.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/dma-resv.h>
 #include <linux/fault-inject.h>
 #include <linux/file.h>
@@ -1961,17 +1962,6 @@ struct iommufd_test_dma_buf {
 	bool revoked;
 };
 
-static int iommufd_test_dma_buf_attach(struct dma_buf *dmabuf,
-				       struct dma_buf_attachment *attachment)
-{
-	return 0;
-}
-
-static void iommufd_test_dma_buf_detach(struct dma_buf *dmabuf,
-					struct dma_buf_attachment *attachment)
-{
-}
-
 static struct sg_table *
 iommufd_test_dma_buf_map(struct dma_buf_attachment *attachment,
 			 enum dma_data_direction dir)
@@ -1994,11 +1984,9 @@ static void iommufd_test_dma_buf_release(struct dma_buf *dmabuf)
 }
 
 static const struct dma_buf_ops iommufd_test_dmabuf_ops = {
-	.attach = iommufd_test_dma_buf_attach,
-	.detach = iommufd_test_dma_buf_detach,
-	.map_dma_buf = iommufd_test_dma_buf_map,
 	.release = iommufd_test_dma_buf_release,
-	.unmap_dma_buf = iommufd_test_dma_buf_unmap,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(iommufd_test_dma_buf_map,
+				     iommufd_test_dma_buf_unmap),
 };
 
 int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 7123c5fae92cee..7a3bc31699bb90 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/module.h>
 #include <linux/refcount.h>
 #include <linux/scatterlist.h>
@@ -372,8 +373,8 @@ static void vb2_dc_dmabuf_ops_detach(struct dma_buf *dbuf,
 		 * memory locations do not require any explicit cache
 		 * maintenance prior or after being used by the device.
 		 */
-		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
-				  DMA_ATTR_SKIP_CPU_SYNC);
+		dma_unmap_sgtable(dma_buf_sgt_dma_device(db_attach), sgt,
+				  attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
 	sg_free_table(sgt);
 	kfree(attach);
 	db_attach->priv = NULL;
@@ -392,8 +393,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
 
 	/* release any previous cache */
 	if (attach->dma_dir != DMA_NONE) {
-		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
-				  DMA_ATTR_SKIP_CPU_SYNC);
+		dma_unmap_sgtable(dma_buf_sgt_dma_device(db_attach), sgt,
+				  attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
 		attach->dma_dir = DMA_NONE;
 	}
 
@@ -401,7 +402,7 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
 	 * mapping to the client with new direction, no cache sync
 	 * required see comment in vb2_dc_dmabuf_ops_detach()
 	 */
-	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir,
+	if (dma_map_sgtable(dma_buf_sgt_dma_device(db_attach), sgt, dma_dir,
 			    DMA_ATTR_SKIP_CPU_SYNC)) {
 		pr_err("failed to map scatterlist\n");
 		return ERR_PTR(-EIO);
@@ -462,13 +463,13 @@ static int vb2_dc_dmabuf_ops_mmap(struct dma_buf *dbuf,
 static const struct dma_buf_ops vb2_dc_dmabuf_ops = {
 	.attach = vb2_dc_dmabuf_ops_attach,
 	.detach = vb2_dc_dmabuf_ops_detach,
-	.map_dma_buf = vb2_dc_dmabuf_ops_map,
-	.unmap_dma_buf = vb2_dc_dmabuf_ops_unmap,
 	.begin_cpu_access = vb2_dc_dmabuf_ops_begin_cpu_access,
 	.end_cpu_access = vb2_dc_dmabuf_ops_end_cpu_access,
 	.vmap = vb2_dc_dmabuf_ops_vmap,
 	.mmap = vb2_dc_dmabuf_ops_mmap,
 	.release = vb2_dc_dmabuf_ops_release,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(vb2_dc_dmabuf_ops_map,
+				     vb2_dc_dmabuf_ops_unmap),
 };
 
 static struct sg_table *vb2_dc_get_base_sgt(struct vb2_dc_buf *buf)
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index b3bf2173c14e1b..03a836dce44f90 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -10,6 +10,7 @@
  * the Free Software Foundation.
  */
 
+#include <linux/dma-buf-mapping.h>
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/refcount.h>
@@ -416,7 +417,8 @@ static void vb2_dma_sg_dmabuf_ops_detach(struct dma_buf *dbuf,
 
 	/* release the scatterlist cache */
 	if (attach->dma_dir != DMA_NONE)
-		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
+		dma_unmap_sgtable(dma_buf_sgt_dma_device(db_attach), sgt,
+				  attach->dma_dir, 0);
 	sg_free_table(sgt);
 	kfree(attach);
 	db_attach->priv = NULL;
@@ -435,12 +437,14 @@ static struct sg_table *vb2_dma_sg_dmabuf_ops_map(
 
 	/* release any previous cache */
 	if (attach->dma_dir != DMA_NONE) {
-		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
+		dma_unmap_sgtable(dma_buf_sgt_dma_device(db_attach), sgt,
+				  attach->dma_dir, 0);
 		attach->dma_dir = DMA_NONE;
 	}
 
 	/* mapping to the client with new direction */
-	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
+	if (dma_map_sgtable(dma_buf_sgt_dma_device(db_attach), sgt, dma_dir,
+			    0)) {
 		pr_err("failed to map scatterlist\n");
 		return ERR_PTR(-EIO);
 	}
@@ -509,13 +513,13 @@ static int vb2_dma_sg_dmabuf_ops_mmap(struct dma_buf *dbuf,
 static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
 	.attach = vb2_dma_sg_dmabuf_ops_attach,
 	.detach = vb2_dma_sg_dmabuf_ops_detach,
-	.map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
-	.unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
 	.begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
 	.end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
 	.vmap = vb2_dma_sg_dmabuf_ops_vmap,
 	.mmap = vb2_dma_sg_dmabuf_ops_mmap,
 	.release = vb2_dma_sg_dmabuf_ops_release,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(vb2_dma_sg_dmabuf_ops_map,
+				     vb2_dma_sg_dmabuf_ops_unmap),
 };
 
 static struct dma_buf *vb2_dma_sg_get_dmabuf(struct vb2_buffer *vb,
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index 3f777068cd34b7..b98d067acffe5d 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -10,6 +10,7 @@
  * the Free Software Foundation.
  */
 
+#include <linux/dma-buf-mapping.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mm.h>
@@ -261,7 +262,8 @@ static void vb2_vmalloc_dmabuf_ops_detach(struct dma_buf *dbuf,
 
 	/* release the scatterlist cache */
 	if (attach->dma_dir != DMA_NONE)
-		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
+		dma_unmap_sgtable(dma_buf_sgt_dma_device(db_attach), sgt,
+				  attach->dma_dir, 0);
 	sg_free_table(sgt);
 	kfree(attach);
 	db_attach->priv = NULL;
@@ -270,6 +272,7 @@ static void vb2_vmalloc_dmabuf_ops_detach(struct dma_buf *dbuf,
 static struct sg_table *vb2_vmalloc_dmabuf_ops_map(
 	struct dma_buf_attachment *db_attach, enum dma_data_direction dma_dir)
 {
+	struct device *dma_dev = dma_buf_sgt_dma_device(db_attach);
 	struct vb2_vmalloc_attachment *attach = db_attach->priv;
 	struct sg_table *sgt;
 
@@ -280,12 +283,12 @@ static struct sg_table *vb2_vmalloc_dmabuf_ops_map(
 
 	/* release any previous cache */
 	if (attach->dma_dir != DMA_NONE) {
-		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
+		dma_unmap_sgtable(dma_dev, sgt, attach->dma_dir, 0);
 		attach->dma_dir = DMA_NONE;
 	}
 
 	/* mapping to the client with new direction */
-	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
+	if (dma_map_sgtable(dma_dev, sgt, dma_dir, 0)) {
 		pr_err("failed to map scatterlist\n");
 		return ERR_PTR(-EIO);
 	}
@@ -326,11 +329,11 @@ static int vb2_vmalloc_dmabuf_ops_mmap(struct dma_buf *dbuf,
 static const struct dma_buf_ops vb2_vmalloc_dmabuf_ops = {
 	.attach = vb2_vmalloc_dmabuf_ops_attach,
 	.detach = vb2_vmalloc_dmabuf_ops_detach,
-	.map_dma_buf = vb2_vmalloc_dmabuf_ops_map,
-	.unmap_dma_buf = vb2_vmalloc_dmabuf_ops_unmap,
 	.vmap = vb2_vmalloc_dmabuf_ops_vmap,
 	.mmap = vb2_vmalloc_dmabuf_ops_mmap,
 	.release = vb2_vmalloc_dmabuf_ops_release,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(vb2_vmalloc_dmabuf_ops_map,
+				     vb2_vmalloc_dmabuf_ops_unmap),
 };
 
 static struct dma_buf *vb2_vmalloc_get_dmabuf(struct vb2_buffer *vb,
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534a8..2ea57170e56b3e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -5,6 +5,7 @@
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-resv.h>
 #include <linux/idr.h>
@@ -652,7 +653,8 @@ fastrpc_map_dma_buf(struct dma_buf_attachment *attachment,
 
 	table = &a->sgt;
 
-	ret = dma_map_sgtable(attachment->dev, table, dir, 0);
+	ret = dma_map_sgtable(dma_buf_sgt_dma_device(attachment), table, dir,
+			      0);
 	if (ret)
 		table = ERR_PTR(ret);
 	return table;
@@ -662,7 +664,7 @@ static void fastrpc_unmap_dma_buf(struct dma_buf_attachment *attach,
 				  struct sg_table *table,
 				  enum dma_data_direction dir)
 {
-	dma_unmap_sgtable(attach->dev, table, dir, 0);
+	dma_unmap_sgtable(dma_buf_sgt_dma_device(attach), table, dir, 0);
 }
 
 static void fastrpc_release(struct dma_buf *dmabuf)
@@ -691,7 +693,7 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
 		return -EINVAL;
 	}
 
-	a->dev = attachment->dev;
+	a->dev = dma_buf_sgt_dma_device(attachment);
 	INIT_LIST_HEAD(&a->node);
 	attachment->priv = a;
 
@@ -739,11 +741,11 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
 static const struct dma_buf_ops fastrpc_dma_buf_ops = {
 	.attach = fastrpc_dma_buf_attach,
 	.detach = fastrpc_dma_buf_detatch,
-	.map_dma_buf = fastrpc_map_dma_buf,
-	.unmap_dma_buf = fastrpc_unmap_dma_buf,
 	.mmap = fastrpc_mmap,
 	.vmap = fastrpc_vmap,
 	.release = fastrpc_release,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(fastrpc_map_dma_buf,
+				     fastrpc_unmap_dma_buf),
 };
 
 static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
diff --git a/drivers/tee/tee_heap.c b/drivers/tee/tee_heap.c
index d8d7735cdffb9b..48948d39b94961 100644
--- a/drivers/tee/tee_heap.c
+++ b/drivers/tee/tee_heap.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/dma-heap.h>
 #include <linux/genalloc.h>
 #include <linux/module.h>
@@ -104,7 +105,7 @@ static int tee_heap_attach(struct dma_buf *dmabuf,
 		return ret;
 	}
 
-	a->dev = attachment->dev;
+	a->dev = dma_buf_sgt_dma_device(attachment);
 	attachment->priv = a;
 
 	return 0;
@@ -126,8 +127,8 @@ tee_heap_map_dma_buf(struct dma_buf_attachment *attachment,
 	struct tee_heap_attachment *a = attachment->priv;
 	int ret;
 
-	ret = dma_map_sgtable(attachment->dev, &a->table, direction,
-			      DMA_ATTR_SKIP_CPU_SYNC);
+	ret = dma_map_sgtable(dma_buf_sgt_dma_device(attachment), &a->table,
+			      direction, DMA_ATTR_SKIP_CPU_SYNC);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -142,7 +143,7 @@ static void tee_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 
 	WARN_ON(&a->table != table);
 
-	dma_unmap_sgtable(attachment->dev, table, direction,
+	dma_unmap_sgtable(dma_buf_sgt_dma_device(attachment), table, direction,
 			  DMA_ATTR_SKIP_CPU_SYNC);
 }
 
@@ -160,9 +161,9 @@ static void tee_heap_buf_free(struct dma_buf *dmabuf)
 static const struct dma_buf_ops tee_heap_buf_ops = {
 	.attach = tee_heap_attach,
 	.detach = tee_heap_detach,
-	.map_dma_buf = tee_heap_map_dma_buf,
-	.unmap_dma_buf = tee_heap_unmap_dma_buf,
 	.release = tee_heap_buf_free,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(tee_heap_map_dma_buf,
+				     tee_heap_unmap_dma_buf),
 };
 
 static struct dma_buf *tee_dma_heap_alloc(struct dma_heap *heap,
diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 550980dd3b0bc4..91a31a22ba98aa 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/dma-direct.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -242,9 +243,10 @@ static void dmabuf_exp_ops_detach(struct dma_buf *dma_buf,
 
 		if (sgt) {
 			if (gntdev_dmabuf_attach->dir != DMA_NONE)
-				dma_unmap_sgtable(attach->dev, sgt,
-						  gntdev_dmabuf_attach->dir,
-						  DMA_ATTR_SKIP_CPU_SYNC);
+				dma_unmap_sgtable(
+					dma_buf_sgt_dma_device(attach), sgt,
+					gntdev_dmabuf_attach->dir,
+					DMA_ATTR_SKIP_CPU_SYNC);
 			sg_free_table(sgt);
 		}
 
@@ -258,12 +260,13 @@ static struct sg_table *
 dmabuf_exp_ops_map_dma_buf(struct dma_buf_attachment *attach,
 			   enum dma_data_direction dir)
 {
+	struct device *dma_dev = dma_buf_sgt_dma_device(attach);
 	struct gntdev_dmabuf_attachment *gntdev_dmabuf_attach = attach->priv;
 	struct gntdev_dmabuf *gntdev_dmabuf = attach->dmabuf->priv;
 	struct sg_table *sgt;
 
 	pr_debug("Mapping %d pages for dev %p\n", gntdev_dmabuf->nr_pages,
-		 attach->dev);
+		 dma_dev);
 
 	if (dir == DMA_NONE || !gntdev_dmabuf_attach)
 		return ERR_PTR(-EINVAL);
@@ -282,7 +285,7 @@ dmabuf_exp_ops_map_dma_buf(struct dma_buf_attachment *attach,
 	sgt = dmabuf_pages_to_sgt(gntdev_dmabuf->pages,
 				  gntdev_dmabuf->nr_pages);
 	if (!IS_ERR(sgt)) {
-		if (dma_map_sgtable(attach->dev, sgt, dir,
+		if (dma_map_sgtable(dma_dev, sgt, dir,
 				    DMA_ATTR_SKIP_CPU_SYNC)) {
 			sg_free_table(sgt);
 			kfree(sgt);
@@ -293,7 +296,7 @@ dmabuf_exp_ops_map_dma_buf(struct dma_buf_attachment *attach,
 		}
 	}
 	if (IS_ERR(sgt))
-		pr_debug("Failed to map sg table for dev %p\n", attach->dev);
+		pr_debug("Failed to map sg table for dev %p\n", dma_dev);
 	return sgt;
 }
 
@@ -339,9 +342,9 @@ static void dmabuf_exp_ops_release(struct dma_buf *dma_buf)
 static const struct dma_buf_ops dmabuf_exp_ops =  {
 	.attach = dmabuf_exp_ops_attach,
 	.detach = dmabuf_exp_ops_detach,
-	.map_dma_buf = dmabuf_exp_ops_map_dma_buf,
-	.unmap_dma_buf = dmabuf_exp_ops_unmap_dma_buf,
 	.release = dmabuf_exp_ops_release,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(dmabuf_exp_ops_map_dma_buf,
+				     dmabuf_exp_ops_unmap_dma_buf),
 };
 
 struct gntdev_dmabuf_export_args {
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 64ea19253ee3ad..c2eaa14b9ddd64 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -32,6 +32,7 @@
 #include <linux/pci.h>
 #include <linux/dma-buf.h>
 #include <linux/highmem.h>
+#include <linux/dma-buf-mapping.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_modeset_lock.h>
@@ -872,7 +873,7 @@ static struct sg_table *mbochs_map_dmabuf(struct dma_buf_attachment *at,
 	if (sg_alloc_table_from_pages(sg, dmabuf->pages, dmabuf->pagecount,
 				      0, dmabuf->mode.size, GFP_KERNEL) < 0)
 		goto err2;
-	if (dma_map_sgtable(at->dev, sg, direction, 0))
+	if (dma_map_sgtable(dma_buf_sgt_dma_device(at), sg, direction, 0))
 		goto err3;
 
 	return sg;
@@ -894,7 +895,7 @@ static void mbochs_unmap_dmabuf(struct dma_buf_attachment *at,
 
 	dev_dbg(dev, "%s: %d\n", __func__, dmabuf->id);
 
-	dma_unmap_sgtable(at->dev, sg, direction, 0);
+	dma_unmap_sgtable(dma_buf_sgt_dma_device(at), sg, direction, 0);
 	sg_free_table(sg);
 	kfree(sg);
 }
@@ -918,11 +919,10 @@ static void mbochs_release_dmabuf(struct dma_buf *buf)
 	mutex_unlock(&mdev_state->ops_lock);
 }
 
-static struct dma_buf_ops mbochs_dmabuf_ops = {
-	.map_dma_buf	  = mbochs_map_dmabuf,
-	.unmap_dma_buf	  = mbochs_unmap_dmabuf,
+static const struct dma_buf_ops mbochs_dmabuf_ops = {
 	.release	  = mbochs_release_dmabuf,
 	.mmap		  = mbochs_mmap_dmabuf,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(mbochs_map_dmabuf, mbochs_unmap_dmabuf),
 };
 
 static struct mbochs_dmabuf *mbochs_dmabuf_alloc(struct mdev_state *mdev_state,
diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index f46881f71e4307..fef6a57fc7354a 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -7,6 +7,7 @@
 
 #include <linux/dma/imx-dma.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_runtime.h>
 #include <sound/asound.h>
@@ -411,6 +412,7 @@ static int fsl_asrc_m2m_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 static struct sg_table *fsl_asrc_m2m_map_dma_buf(struct dma_buf_attachment *attachment,
 						 enum dma_data_direction direction)
 {
+	struct device *dma_dev = dma_buf_sgt_dma_device(attachment);
 	struct snd_dma_buffer *dmab = attachment->dmabuf->priv;
 	struct sg_table *sgt;
 
@@ -418,10 +420,10 @@ static struct sg_table *fsl_asrc_m2m_map_dma_buf(struct dma_buf_attachment *atta
 	if (!sgt)
 		return NULL;
 
-	if (dma_get_sgtable(attachment->dev, sgt, dmab->area, dmab->addr, dmab->bytes) < 0)
+	if (dma_get_sgtable(dma_dev, sgt, dmab->area, dmab->addr, dmab->bytes) < 0)
 		goto free;
 
-	if (dma_map_sgtable(attachment->dev, sgt, direction, 0))
+	if (dma_map_sgtable(dma_dev, sgt, direction, 0))
 		goto free;
 
 	return sgt;
@@ -436,7 +438,7 @@ static void fsl_asrc_m2m_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				       struct sg_table *table,
 				       enum dma_data_direction direction)
 {
-	dma_unmap_sgtable(attachment->dev, table, direction, 0);
+	dma_unmap_sgtable(dma_buf_sgt_dma_device(attachment), table, direction, 0);
 }
 
 static void fsl_asrc_m2m_release(struct dma_buf *dmabuf)
@@ -446,9 +448,9 @@ static void fsl_asrc_m2m_release(struct dma_buf *dmabuf)
 
 static const struct dma_buf_ops fsl_asrc_m2m_dma_buf_ops = {
 	.mmap = fsl_asrc_m2m_mmap,
-	.map_dma_buf = fsl_asrc_m2m_map_dma_buf,
-	.unmap_dma_buf = fsl_asrc_m2m_unmap_dma_buf,
 	.release = fsl_asrc_m2m_release,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(fsl_asrc_m2m_map_dma_buf,
+				     fsl_asrc_m2m_unmap_dma_buf),
 };
 
 static int fsl_asrc_m2m_comp_task_create(struct snd_compr_stream *stream,
-- 
2.43.0

