Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFFFA1A675
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 16:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6A810E0D5;
	Thu, 23 Jan 2025 15:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CKBnXyMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2064.outbound.protection.outlook.com [40.107.212.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD5A10E0D5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 15:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poCj68Nz+7xNPOA/jgTby0l2/lPVwjyuuceTA5XH1SOhcXWoBMwo7SyBrhsI9ISjHQMP2HZXh4x6pry0HbqYSOkIEszFUjLtIE5mNwaxnhJ9JbHCTPzIiDjV+task/7WyDCtnyXZMIowVEMOoi0CMivamyBDLNSeCDZ28ElohREGC9OyZ2GjlHUCDYvcPTJ1HVse5wZA5IJ6lhRckRGlNCudEiU9WNgVUtyzsLsVyL1W6JEdm4Xu2Q8evNv2volUT4C65YuZiKqE+1O+fxBJNL2i0CcvB2A54gJLfdCpYpFBnvU6rnPOp1qZZS9k/7hFkuyF7yg3z4T4lS/3w5x8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9X0zY1PirsxozflNWtomch701uE8KASJnn7kUGAlNx8=;
 b=YME2nf4uLKLT94GLIwgreUNmCW/VXtb+asJQxr+0rx+1q2UAOqnBrqSzj5S7HvQVLvdLgiQWsxJqoZsVnrTGofTt9oq6HfI6qYiys9+f0ocr2uY9l4ZDZU8LmAMhlzyBq+xH8UxhGFbJc5cJim22tzFEPld+DrhkSyaNcxQkj59LzhluMVuJvIxI3+a8eyUb0ARmINpa3M+rsVE4NFzgk55M5sTFLZYNoeSzqeEcp1NluTrWKs5Ju+mCsscWQ2EKJH5gg9UNInrDd5kqDh/bY/qEd5HVudTEw/PTmGhO2CT1j688oZKwvyeLyL6oqrGDGzea2aCI7/aeoEw0xI++fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9X0zY1PirsxozflNWtomch701uE8KASJnn7kUGAlNx8=;
 b=CKBnXyMnJqB3xk9x2yuOa2cDd9Lb9WG70n0f/G7zKcYivHq0OjSQRAyDmx4w6Y0sRh9sPqORSXSk7vbYt3nE3LeXY3v8SMKqkOXKVDmI+Ve1xGEPTHnAROmNem8BjGC+Bqk2A2S1vLmJ/4ofLtJnuyvP6oPZrY6V72RzCv0pAvqbsKsghPliuWEnzpSI/cDnw/B1GFhub7Rh4gNZ1Tf0kBMtzpoCMv9vW8xltOGROfgiY3wTGLDxJtkeg2sPtB32QPKxnevCMjx4wdCYpDkvb0W/5v4SNzF+dQBw15fjOetsCPChR9XS2kihcBhLYLnxO1Ux+QWYpb/XN54bESnXtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MW4PR12MB7239.namprd12.prod.outlook.com (2603:10b6:303:228::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 15:02:14 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8356.010; Thu, 23 Jan 2025
 15:02:14 +0000
Date: Thu, 23 Jan 2025 11:02:12 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250123150212.GR5556@nvidia.com>
References: <20250120194804.GT5556@nvidia.com>
 <Z4_HNA4QQbIsK8D9@phenom.ffwll.local>
 <20250121173633.GU5556@nvidia.com>
 <Z5DQsyV0vwX3Iabu@phenom.ffwll.local>
 <6612c40d-4999-41a1-a4a5-74d3ff5875c3@amd.com>
 <20250122143744.GF5556@nvidia.com>
 <827315b0-23b6-4a39-88eb-34e756298d67@amd.com>
 <20250123135946.GQ5556@nvidia.com>
 <9a36fba5-2dee-46fd-9f51-47c5f0ffc1d4@amd.com>
 <97db03be-df86-440d-be4a-082f94934ddf@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97db03be-df86-440d-be4a-082f94934ddf@amd.com>
X-ClientProxiedBy: YQBPR0101CA0210.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::21) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MW4PR12MB7239:EE_
X-MS-Office365-Filtering-Correlation-Id: 134183e8-d63b-4cb7-cf99-08dd3bbeeb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0V1Rjh2VXg2YWdZK2ZSSmxLVjZYUFlHY1IxRStYcm84UXdkRmVLN0VTTFVQ?=
 =?utf-8?B?N1AxUmlZRTVxVERGT0ZINU0wTUFXclNTTlVUM01sWjBmNGIwSlozdGtJSWEz?=
 =?utf-8?B?WUxEaElyUE1BMkZNVGMrTW9ZbDRxemdMd20rWCt0UDh2QnZYUGFVdGVpL1dk?=
 =?utf-8?B?QWJud1hDTG9qdmpja1ljU2NkaWdLWEkwQ1E0NDZ3SHFHQm10L1RId1NIbGpG?=
 =?utf-8?B?VjRaR0RESWpueGpjNFVCdVhVU0ZSb09GK0NoZURGZ0hWZmY0NnhXdVlJUVJq?=
 =?utf-8?B?TFA2MlNpcFJ5M1JqU2cwVWJ1WEo2NHVqdWNwTzhDdkhPdjM3ZmFRc2x2ekYy?=
 =?utf-8?B?L0FpV2U1UzQ2ZlFoMUFlTlBKdlRVNUlvb3BHQUJickxjRFFMSUNoclpqWmlD?=
 =?utf-8?B?QUlGT054a0ZKQk5LVHhXZklzeXJ0cFdiQmJjL2hWM0ZTUFk1Z1U3MVVrZ3ds?=
 =?utf-8?B?Y3Zrck9MVE1zS1VBUEdCS3hrSjNqM0VLWGRYdktSTDZvbktnL3EwVlZldlNJ?=
 =?utf-8?B?R0FvblpHcXMzNmNLMkYvZG5tNDBsWUtQOFRnZzdLaHdWYzg0MWRIT0M5Q0Jt?=
 =?utf-8?B?bUJVT0ZEaGcydlIrU2U2OXMvRDlNa2w2b2kxOU5LNXQzT2VrcmNhOVZrNVhY?=
 =?utf-8?B?aEpRL0pWdnIvVURGVmRHTnh1NEZ0U2thY0FyUUIybS9hVW1XaU9oMW83RmNk?=
 =?utf-8?B?T1AxNjR2SERYYzVWQUZZVU9wUTNNRkgwRmJmRy96RjlFb3ZZOXJmbmltMm13?=
 =?utf-8?B?eUpBUEM5YUNkejZyWG10NW8wUmhwK2hacyswV0pxSE9BTlZ0ZHBBVTBZK0tM?=
 =?utf-8?B?a3ovcDBIRGlJM0NSZ1ZNY1dDY1JFeEFpcEgrbjZZVzh5NkpqQ2NUM1JIdkpW?=
 =?utf-8?B?V0k5ZWpTSS9sY0p4UkdLNnloOGd1OEQ2RDhjYlAzREZOeUF4NmtpUHV5amVN?=
 =?utf-8?B?QzZaVHozZTJwcEVKeTRDMVNDOXBFZWVMME9XbXo0cTV6T09reVltQ0Y1SXoy?=
 =?utf-8?B?SXl5aVlnNFozRTI0WDZSVG9qc2xKWjRBcVh3dEdBTHB2YU5jZUJ6d2xrTlhn?=
 =?utf-8?B?TWRmbjNTcEEvSDNlS3hKUjJ2SUw1aEN0M0F1OFlsLy9yR2M1d0dFYkNGSVlO?=
 =?utf-8?B?ZUx2aXhPb0NrOGU2VW5xV1pacVdrVkNFRjhiMjZqcURocTJ0RXkrZ2hhd1NL?=
 =?utf-8?B?WWlPcFNleTdRcUFmU3lZaG5LbVoxWE5oZHNHUDhobGIvRXZCNno2Y296SFlx?=
 =?utf-8?B?OS9iWWpOcVQ4dmIzZG5uN2lIVUVMM3NvUzJOaVNnWkt3VXFEbGtYeVJyTUxY?=
 =?utf-8?B?Z2tEcGFwQlNlSzNLYTVPYnROeFUvd2YrcUJUV0Nna0pEMk5nTHhyU3gyMGNJ?=
 =?utf-8?B?ejNVVmZPRHdDSE9HMW0zeHViTnlmSDhyL3dPU3ZGSHNiUzJRdTMrZ3lwRUx3?=
 =?utf-8?B?VkVjYXpzN25QQUxEM3VCcG1uMnpsbGxrQ1UxcEN4SWlqaTd2WVI3SjVMYm9a?=
 =?utf-8?B?S1padDZROHhqTzVPb1ZiUEU3QUprODZlanF0QXYwOVZrVkJhbElUMUZpbWJM?=
 =?utf-8?B?amptNWZwZnhidUxiNUhJYkIvY2hrVnJtYkVJeTFKMitQeG90M2lOM1M0NGUy?=
 =?utf-8?B?MEpvOXQ3MEQxb3VLdTFmU0tyNzFmcUFkelB2TGp6b2gxazdmdEVaYWVwS1dh?=
 =?utf-8?B?MWNPVTIzSzBnYzAxRTdIalNzSGsyVGRrSkE1aXdFVlYwZVUrUlo0QVdxSDA1?=
 =?utf-8?B?SFdTS081eHZNNmU5Qk1jT3ljT29iZVFydTRSSjdxRGdldGY2aTF6Rjhha28y?=
 =?utf-8?B?OWlqb1RVbk95SmpDTks1c3NDM3ovWSs1cHlZcSs2bFdudTlwT0IvR2syL1kx?=
 =?utf-8?Q?kmKLHIMWK3251?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFdSMlpKNTRQWm01TWVhTTU5cFdHWCtlWExSSWlxM2twZ1VXM1dLdlJ4NDdx?=
 =?utf-8?B?cGFhRnpwbk5lTmJENjE2MHFnOUc0UXlFQStwUmdDZTFzSUZwcVpNY0JzWnhp?=
 =?utf-8?B?RmZXVkh0NStoZVViS1dxZ1MyanBmTUdtUkdYNUU2bkdQNE1UUVczOHlGRWJC?=
 =?utf-8?B?eE1TNGxCK0lneHh0WS8zcEQzVjdKQkV1bFRYMjFqWENrSmZjbmlxZ3VhUTJG?=
 =?utf-8?B?MGpndFNFdG9zelY4ekhkeGJyRFhIR25iRmQrbkttUUlrdFJEdmtHbVpiWjNZ?=
 =?utf-8?B?d0lQTGJNQzJ5MjlGYUhlSkdXRlBSR3Q0WkhhQk1MYWJzTDZTSWh4S3lNQlA3?=
 =?utf-8?B?WUFPOG43N0NIZ1g2amZoZ213b3dDTEZWOE5Dc1JiUUR1TGJpcTlPN0tLZm92?=
 =?utf-8?B?c2hvNVVjZnVKdjBSRjRWdjAzVzM3WGZxNEN2ODBCNWx1QUlWb3crOEpLdGFC?=
 =?utf-8?B?TXFlck13ZEY2aUdSb2t4QzhRV0JxSjVhakpOSzRJNDd3QWxwT2JvM0toUEZk?=
 =?utf-8?B?THNCMkNTbTFkd3M0VUpxemtJQnQ4M2NxTXQ5RlVVOXRaRTdXVWN3MVdIejR3?=
 =?utf-8?B?NTFJc2lRMWY1enJWSFhSNVoxM2FuL2UxNzk5RktWTEt0ZitXempiMDFNaStG?=
 =?utf-8?B?RmVuL01tSnZMb04rdy81eTNEUDJOcFJKd0diaVBVYkQrazY4V3hiTFFpbHZq?=
 =?utf-8?B?NnFnYlhTUDltd1JYVnk0UkI1MkR4RWNMMXMzSGZxbDN6OVhHaFE1NXErdEh0?=
 =?utf-8?B?emZ4cGlPTkh4QmxrYmxiZjVsNTA1L0RGMi9ycjBBeE52YmpySWlLOWZvYXlu?=
 =?utf-8?B?eUpSOGJmeHFaa3NMS3IycFpaeDdKQmRhRDJydENQQml5RitNZG5PSTZleU1G?=
 =?utf-8?B?cUxFT3lpNzEwaHM1UzcvblBadjVDcmdtVC9ua3VsdnBXc0g2Uk8xc1ZaenNh?=
 =?utf-8?B?Z1VQRlVEOUNROUNpVXMyVkZET05sSnVxc2ExN1g2a0ZoV2Q1bXA0SEl0OVNs?=
 =?utf-8?B?Zk5xamdpc2I1b3VHK3puYzVKVEJWU01IbVp1cHJUc1JOYUdqcktYaUx2U01n?=
 =?utf-8?B?NVAvSVJXNWVFWXM3M3pkV0Nnck55cSs5dU1yOHFtejhSVVNKWDdmeTlKTmta?=
 =?utf-8?B?aFJFYWt6SFl4eW15MEpQdnNoU24vcmtYRDFnK1llTlRxUTR0Y0FlVklVUFl1?=
 =?utf-8?B?YXNZQlNQWURXbUxXbVlqaVdkT2VHMVdtUzBBZWdWaGwzbXEzNDRQSU5TWUVq?=
 =?utf-8?B?czBZRWl2SmVCejAweGw3UEtGNkd1cWt4dlc3NzhHL0dNOWFSRjE4Qi9PbFVW?=
 =?utf-8?B?am1HYVdxaTUzNUJ3SmxvaVh6RFoxUnVWYVBzcDFuOGFZSG94d1d2cmV3TTlR?=
 =?utf-8?B?SU1YRWtlUG9WK0MrRXEyR3c4TVZzRWpHN0xVM3JCWGNsWEJjcXRaOGVrTEpv?=
 =?utf-8?B?aEtYQmpmKzRNWmU2OVczZTlERmt4ckpiYTVJMSs2YU1UcjM3UmJYMlFxTEtV?=
 =?utf-8?B?a0UrY0Vwc2c5dG1EZGxLUlVwcCt0enN2Ynd2NDIxRDNzaFRNeWhpNGQyNytS?=
 =?utf-8?B?Zmh5bWhpMHRDR1RycEplTldnMXFnQ1RLM3JENHNBUkJVZ0pISHVGaC9mUWxE?=
 =?utf-8?B?dDAxQVJSNVFnd0E2RG1MVS9YNTR4aVQzMG0yc0ZGMzNRbjNGTHIzbFBHSmll?=
 =?utf-8?B?ZjJ1WUlWbUlCTXhRYkRRb0Z0RFVwb1ZPYmxvYmg4VFBLRkFMYU5WZVpFL2xn?=
 =?utf-8?B?WTJSL2UrY3ZMbktDOXU5dVdHN0ZkR1o4aGc1aXlNUDd1cGpJOTR0b1Yva0Yx?=
 =?utf-8?B?NmZNeHpWYVdTK09Zd3FXc1lueGd2VnhjMDNoZTlaMEdEbnNXSXlRSkxyZ3lL?=
 =?utf-8?B?YzZLS01WWUZLWEh5dHIrYllCa1V0SVZMU0M4dE9BdE9OZS82ZUdjZE1nK0w2?=
 =?utf-8?B?Y0Z3REFlcUhOdmkvRklGZ2IwelY3V0Q2RWZ0SEU2UTZVTzl6NWdpSlptOWQ3?=
 =?utf-8?B?d2pZcXN1RW45Yzc5QmU0bnZocVF0Tkh3MGw0eGhBZEVRT2doLzVid3RpT2ov?=
 =?utf-8?B?VGRLb0syOG16RnF2MGl3ZUIyZy9sVXFVbHJGa21GTzh1cmN2a1hjQWJ3c21N?=
 =?utf-8?Q?jhZhi/LcyDymuAj0knGdxI048?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134183e8-d63b-4cb7-cf99-08dd3bbeeb88
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 15:02:14.0054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYoMGucttTUnGRvoUdgsaJZY8KEv7mtbxt/x6NXWYE8kRZMSKldPwzGKJMwHyt4s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7239
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

On Thu, Jan 23, 2025 at 03:35:21PM +0100, Christian König wrote:
> Sending it as text mail once more.
> 
> Am 23.01.25 um 15:32 schrieb Christian König:
> > Am 23.01.25 um 14:59 schrieb Jason Gunthorpe:
> > > On Wed, Jan 22, 2025 at 03:59:11PM +0100, Christian König wrote:
> > > > > > For example we have cases with multiple devices are in the same IOMMU domain
> > > > > > and re-using their DMA address mappings.
> > > > > IMHO this is just another flavour of "private" address flow between
> > > > > two cooperating drivers.
> > > > Well that's the point. The inporter is not cooperating here.
> > > If the private address relies on a shared iommu_domain controlled by
> > > the driver, then yes, the importer MUST be cooperating. For instance,
> > > if you send the same private address into RDMA it will explode because
> > > it doesn't have any notion of shared iommu_domain mappings, and it
> > > certainly doesn't setup any such shared domains.
> > 
> > Hui? Why the heck should a driver own it's iommu domain?

I don't know, you are the one saying the drivers have special shared
iommu_domains so DMA BUF need some special design to accommodate it.

I'm aware that DRM drivers do directly call into the iommu subsystem
and do directly manage their own IOVA. I assumed this is what you were
talkinga bout. See below.

> > The domain is owned and assigned by the PCI subsystem under Linux.

That domain is *exclusively* owned by the DMA API and is only accessed
via maps created by DMA API calls.

If you are using the DMA API correctly then all of this is abstracted
and none of it matters to you. There is no concept of "shared domains"
in the DMA API. 

You call the DMA API, you get a dma_addr_t that is valid for a
*single* device, you program it in HW. That is all. There is no reason
to dig deeper than this.
 
> > > > The importer doesn't have the slightest idea that he is sharing it's DMA
> > > > addresses with the exporter.
> > > Of course it does. The importer driver would have had to explicitly
> > > set this up! The normal kernel behavior is that all drivers get
> > > private iommu_domains controled by the DMA API. If your driver is
> > > doing something else *it did it deliberately*.
> > 
> > As far as I know that is simply not correct. Currently IOMMU
> > domains/groups are usually shared between devices.

No, the opposite. The iommu subsystem tries to maximally isolate
devices up to the HW limit.

On server platforms every device is expected to get its own iommu domain.

> > Especially multi function devices get only a single IOMMU domain.

Only if the PCI HW doesn't support ACS.

This is all DMA API internal details you shouldn't even be talking
about at the DMA BUF level. It is all hidden and simply does not
matter to DMA BUF at all.

> > > The new iommu architecture has the probing driver disable the DMA API
> > > and can then manipulate its iommu domain however it likes, safely. Ie
> > > the probing driver is aware and particiapting in disabling the DMA
> > > API.
> > 
> > Why the heck should we do this?
> > 
> > That drivers manage all of that on their own sounds like a massive step
> > in the wrong direction.

I am talking about DRM drivers that HAVE to manage their own for some
reason I don't know. eg:

drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c:             tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type);
drivers/gpu/drm/msm/msm_iommu.c:        domain = iommu_paging_domain_alloc(dev);
drivers/gpu/drm/rockchip/rockchip_drm_drv.c:    private->domain = iommu_paging_domain_alloc(private->iommu_dev);
drivers/gpu/drm/tegra/drm.c:            tegra->domain = iommu_paging_domain_alloc(dma_dev);
drivers/gpu/host1x/dev.c:               host->domain = iommu_paging_domain_alloc(host->dev);

Normal simple drivers should never be calling these functions!

If you are calling these functions you are not using the DMA API, and,
yes, some cases like tegra n1x are actively sharing these special
domains across multiple devices and drivers.

If you want to pass an IOVA in one of these special driver-created
domains then it would be some private address in DMABUF that only
works on drivers that have understood they attached to these manually
created domains. No DMA API involvement here.

> > > > I still strongly think that the exporter should talk with the DMA API to
> > > > setup the access path for the importer and *not* the importer directly.
> > > It is contrary to the design of the new API which wants to co-optimize
> > > mapping and HW setup together as one unit.
> > 
> > Yeah and I'm really questioning this design goal. That sounds like
> > totally going into the wrong direction just because of the RDMA
> > drivers.

Actually it is storage that motivates this. It is just pointless to
allocate a dma_addr_t list in the fast path when you don't need
it. You can stream the dma_addr_t directly into HW structures that are
necessary and already allocated.

> > > For instance in RDMA we want to hint and control the way the IOMMU
> > > mapping works in the DMA API to optimize the RDMA HW side. I can't do
> > > those optimizations if I'm not in control of the mapping.
> > 
> > Why? What is the technical background here?

dma-iommu.c chooses an IOVA alignment based on its own reasoning that
is not always compatible with the HW. The HW can optimize if the IOVA
alignment meets certain restrictions. Much like page tables in a GPU.

> > > The same is probably true on the GPU side too, you want IOVAs that
> > > have tidy alignment with your PTE structure, but only the importer
> > > understands its own HW to make the correct hints to the DMA API.
> > 
> > Yeah but then express those as requirements to the DMA API and not move
> > all the important decisions into the driver where they are implemented
> > over and over again and potentially broken halve the time.

It wouild be in the DMA API, just the per-mapping portion of the API.

Same as the multipath, the ATS, and more. It is all per-mapping
descisions of the executing HW, not global decisions or something
like.

Jason
