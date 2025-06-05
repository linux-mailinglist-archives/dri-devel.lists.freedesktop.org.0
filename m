Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D6AACF46A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 18:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED5710E30F;
	Thu,  5 Jun 2025 16:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SQ0XXtIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597CD10E30F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 16:33:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiawvG/Qu59L3kyBL4Sml4OdA6/p8YLIrIdrWstf5e42CNiJbVjEJwfcgob+hWGvaBrF6kXSS3Vf0klGIRfioc/i7wnDD8ghIgoCvaGGRsZRBlhsOFNHffp8KP/Ex7RL+KX6oknyqN8E92IfTk1Pn+65qGeP9Qyry1djypTsWZkPvPvg62MMp+LuGIZ95UHBrtqwHZNfdIOujGULY6zVza0VOYGm+/5cWX1s5pKdOR34qNWAFsfsK61OybjCDJZRJzSPC//u/96iswgS3rWDaSWC47uHoq5QeQ7CIZcV0A7tWo1jez/bOJRLLVUlCTYzWB/bVdR7fIVOA59CXhd53g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5Tb4cwPCnlzYs3BJhczqqnWDXqOrnSISnzWIPbqO1Y=;
 b=CMhlWBdpHutK9RDgzeqUw+xSv61wYzoZfrrIZpUK5QpWMqWVeVgvzywAN9eMPblYavooHHC+/RHRfimZiIlEABVNJsxTKDQfmwFHK8wyGsj+Oc3k1u6TGYpgmoUi0VQcyttrFslTfpQk+lD2Id8A19Cov9NniGkJydiLovVB8uHZtJWqi0mMiBuidFI/TSvmxzt/EjgqOx1zHNs3e7qG7vhLSNhcy9MgZL9crVweORZ1n6+bN6yioq7SDrqKjSwkOfZemeqCyc5JdK1Yj2kq78hk7/1JkIAiidO1Og6acmBgzcuoeIDKzGlaZZutxZQxQS6peSrIuMCyq58ArH9ufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5Tb4cwPCnlzYs3BJhczqqnWDXqOrnSISnzWIPbqO1Y=;
 b=SQ0XXtIKK+qt+GHAgKfXYvQdMVKPwuB7lY47Z7NnPQJap04ee6RaEB7dGPFmd2JebmtshiVltzfVL0lk3JdVAn9oWjKO7C09yj4PnIbJUGHLi928ZBASgwfTUfIxxyhMtUWrEXJ5/hpY8+XJLgPtqu1IEiobJm+JAtZqPW7r3eWACt4/6xzkD3sth8XL4krWxGBfI6O5057suCiZimdT+UjIGVXzZr55PYAlEPOdCMdWnI4A1x/y9z2xlfCvZZinFHMGVrozV+FZ+5tcSbHVOe487VKeZprZ2IrZThQbkEFX4TjlS0yFpLc62DJECsNQWEwjfbNPU1gHgSVGAnTgpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB5877.namprd12.prod.outlook.com (2603:10b6:510:1d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 16:33:41 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 16:33:41 +0000
Date: Thu, 5 Jun 2025 13:33:39 -0300
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
Subject: Re: [RFC PATCH 19/30] vfio/pci: Add TSM TDI bind/unbind IOCTLs for
 TEE-IO support
Message-ID: <20250605163339.GE19710@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-20-yilun.xu@linux.intel.com>
 <yq5ah60u8kev.fsf@kernel.org> <20250605151029.GC19710@nvidia.com>
 <yq5a7c1q88oy.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5a7c1q88oy.fsf@kernel.org>
X-ClientProxiedBy: YT4PR01CA0313.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::23) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e799e4-00e5-4983-2b52-08dda44ebaf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjM0WDQ4VHgxNGJOM0JEOWdqUTRYUVJZY0pMM3FQUzQ5a25ZNFV0VjRKMk53?=
 =?utf-8?B?T0VHZzBlR0EyS1F4OCtkM0gwTE5nYlMyNytWTTh6QkU0MEdRVDV0d3hramt2?=
 =?utf-8?B?NTdjem81Sk01UTU4OWlxbmhaa2Njckxobk8wVnkwbWRZak1VbndhVFRzMHdp?=
 =?utf-8?B?UHlsRUhuVHV0c0crM0NlOHR0NThYTXJ5emdVcURvcHdxUVNydjFHNjU2YXpW?=
 =?utf-8?B?RzkxOVQ2dnVPdGFpYk5kNnhtQkszSzl3QlNoa0s0YUM1aWxBRUpkRnY2dXZR?=
 =?utf-8?B?ZEdlRkVVbVlmbFRMK00xNzlxb0libVN1VzFpYnNvOTNMT2ZGd0RUTGZJbE1U?=
 =?utf-8?B?VTVIejRNVVBvcXM4RjNJZkFEaUd5dkIxZy8vSXRTMnZwbnFmMXRiUVJmRDVS?=
 =?utf-8?B?ZTJrbHBmbExIVERnVW42bUdBanRjbUtLZDlBdmpjWjdZNE9jcEhwUEQwNWlt?=
 =?utf-8?B?T0RnOHR6cC9qM3N4Tit3Tml0aDRtVlFkd3J2Tll0SHFKSVB4Z3BTVUxOUkEz?=
 =?utf-8?B?QlN6V2tiRkxuKzR3L0t0WGdGQ0p0YXRkSkY0UkYwVXNoMXIweklIT2NETmVD?=
 =?utf-8?B?b044Q3NEMzNqVElkckxWdFJsS2R1V2ovZW0zbHFoSkJHTFd4SXBkQTdyUXk1?=
 =?utf-8?B?TFp0SU5sQkNkZU1OR3lpZmRkT28zQnV1S21yUm9UNm1RbHhucC82dkxzZ21y?=
 =?utf-8?B?Y25VTkNBS3hFczVMUFY3TGdoaDFZb1RTOENuY3ZGRCtLd25oTWZvdzZLL3Fw?=
 =?utf-8?B?NGxjZll0aURZNyt3ajBmM3VIVmNrVlVQbktmdnZTc1FnZWdzRFFHMGZIMm1E?=
 =?utf-8?B?Nmp0SlF0bzVKTDhjZ1paY2pEZGplS2ZLMGVrNGNYYzJ2Mk1PV2tWL016SjZE?=
 =?utf-8?B?Wis2RzQ0SlpGam1raENsdHdCcjRBWW5Nb0pCREpPTkgvUzRGUmlIZUlRcy9R?=
 =?utf-8?B?VWVHeXBRWXhxSm9aYW5sQjY1WjRGUWFYcExVSDBwTW5QbHBsT0pQUzBBSWl0?=
 =?utf-8?B?cSt4UHE1L1JWRlpJOVRza2lJRk5JTlZDTlRzbkg5dUNGNnU5S2lrdDlFRHRZ?=
 =?utf-8?B?b1AvRDcyS3FHeWkySGtmdzNFWS9HdVhtNFk0ZnlSeU9WUUdxWWpDazZwd2hs?=
 =?utf-8?B?eFlkWnBOT2JIYkU1ZFp0eHFwdHpKNlB6dXhxeVMwNHF0ZVVKREpvSWJVVlJP?=
 =?utf-8?B?dGxYTUFvb3NUMVQyQTNSNmNtL3lnMzJkNTQxZVpEQ20xZkFTK0xEVVN0NEZ2?=
 =?utf-8?B?S1FobS9JZkliTHFYbTV6Y0t6UGZXOEFlb3RsaFBPNmk1eWRyN1l6VDdxSEFa?=
 =?utf-8?B?VXRBaENYblFWS1B1aGR1Y0VmbW1QTjBTMEtMTW5aY1RtVXJ4a05SWDFPMFk3?=
 =?utf-8?B?V3Z1R1VXK3RKQjM5cUNudDBQY1dJcG9QMUt3QnJuNnkzL3JuQWpPVHdYdjhZ?=
 =?utf-8?B?QlVkaFVWL1psdGNMS1pXUncrb1VoM0tTZXFCdlUybHF0RjUxenFCcSs3TTVt?=
 =?utf-8?B?YyttOHY4YlVocFJwcFF3Y3pNVDhNck9jL1dacTRjYlBqZThnUVYzb1ZHUlhJ?=
 =?utf-8?B?c1dxS1VObmE4cjZYWVNpWW9aOHM1NS9JcDlZbXp0dDlaNDZUZW5OYy8xZ0dV?=
 =?utf-8?B?ZUdXODVyNUlZVmhmTm5VbUV1R0ViTUtSMExDNS8vaWtOd3Y3Z1FmcnNCb3Fa?=
 =?utf-8?B?TVZSalVPYkFNUjlhNUx1SWwrTWR1Q3VDWXpsWld1ZDgzV3N2M2dNeWk0MXk4?=
 =?utf-8?B?bld3V243MDJMQnJJTUlEUVBKMjR5YUV4VzBMVUI0L3NNT2g3ZVRvOFFwUzBW?=
 =?utf-8?B?TUlKUnp1UkVVNi9uUFFSZHZCUzRJWklpenVZL1QzeWt5VldGTFUrN1ZKVkI2?=
 =?utf-8?B?QTYrUXJIWDVMK3NLRXJkbHcxSThUK0JselA0L0dkdkxWWVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WS9hcHJ2dHBSQk5aM05ncEhMaDhPY0hBTUk5blQ2UFBwN29mSHNoWUtwS0p3?=
 =?utf-8?B?Z3Y2YlNGMEJSU2NZVVF6UllEWVdsaGJVS0Fic3JxUkg4SWRUVzlPNG1VdmhO?=
 =?utf-8?B?OGZnY2tpUkZTVXhic285YzE2dTEyOFNoNmdoeE9tV0VwdUY3dC9UU2psOExa?=
 =?utf-8?B?WER1M3RYYzhWZ00wUDNvSlBoNStuYjVIajBvMjg2V2RFVEgyeFJIS1ltYU5X?=
 =?utf-8?B?MCtRU3RGdHlqVE1qaFpRbnMxL0tPSDJmaUtqMDFUVHFVVDhOQzYvZFYxUitj?=
 =?utf-8?B?MDU3a01NNGkzMDZtb3VaUWloazlGM0wraGpzUXE2clZiakJheitLSkY4bElx?=
 =?utf-8?B?dTRFd1dFYUJ4TldjT0tVMWpiM1hFa1ZkTU9YMXU4dmJ0WEFMajU3RVhGOEE5?=
 =?utf-8?B?NDMvZHZSUmlPN1l0VXZXVWY2NExERlVrZURSMUlVckZ1aEtuZzVKV2N5QXJD?=
 =?utf-8?B?OExLTTdRek1TRUYvODRxKzdhSi9FaFVrenFQS0g4VG9QT0lhN2VMaU40bFN1?=
 =?utf-8?B?VnNpbk40c3UvNWEwa2M2bXJkL0RhbzRzRzF0a08zVm12bXl0V0dyZU9FWVM2?=
 =?utf-8?B?ZmlsMzRXUGQ1U2YzZ2tFcFpSMElOT05oQXhGTytWTEQ5YjNCZWtXYW1qN3ds?=
 =?utf-8?B?eGlxaXEwZ2Q3d1EzUUpYc3lMVzhCdG1pRCtTZDQzbGV1TEU5UXdJQjI4ZFlw?=
 =?utf-8?B?bDVWcFpPUDF2T05PZDFhT0hlWCttZmdvWjJyaGIzVEx6b0s1eUxJUnIzazQv?=
 =?utf-8?B?eHhsU2x0K0pBaktJV0VPcW9WUDRjTEF0UTB1dm1xMitGOWxId1NJZU4yR1E2?=
 =?utf-8?B?QmozOHFoKzgyZU9GYitHTW5tRCtYV0dzdWVCSitxZkg3cHpTdU1INnZmVnVW?=
 =?utf-8?B?NGJ6K0dNZTVtb2VuU2NCeVNMRG0vbmVscERpSG1Da3dUbUlkQlRIZkZTTnAy?=
 =?utf-8?B?dmhtclR3OGRidVZmNW0zT2VXSHRrUThyZzZFR3g2WHBpRDBDaCt4cWhkNFM2?=
 =?utf-8?B?MmF6aTBUaXg0ZTNTS2RVTGdoK2JFdkpLK3lTa0xHUXVjaUdLVjM2VmVkSklv?=
 =?utf-8?B?TTA0V2FzbUkvaGxnVEdESmJnV3ExdUN4UTIrU1Nja3BzTkY0R2tnZlhyYlMx?=
 =?utf-8?B?QVJYNWZMbkN2RjlpMGJMOENpelFDTkxBR0FtaERFYTBzOEZ4VlVra2pCWnJW?=
 =?utf-8?B?b0tEQkpDRmppVExVaitBMy9nc3BRRHNLYzJDYTRSZ0pOcXhLd0w0alZOY3N3?=
 =?utf-8?B?QzVmMDZ1QXpHVk5vNnVpTW1zUmxQWXJ6RmhPZ0U1MTJFQnJreGFiRmpZVWI2?=
 =?utf-8?B?Vy80Uk9SWjFFRDg2SXhPRG5ydkZrZGxGMkhFMkdiaERqOFI5OVhjWk5yREJX?=
 =?utf-8?B?bHlKMDN5S2hRRVl4aUVmM0p1OEZKekN2RC80VWFQcklHb3crbmJHTGdtUkRs?=
 =?utf-8?B?NXpzNlEzaUIzRlB2VGd0V3kzdE5QRWhWS0RWVk8xdWp5d1ZZbXQ0MVFiRStm?=
 =?utf-8?B?anZIUmVtNEZnN1hoUU5lM0Nuekt1T2IxS0dpckd1UnNXZ2ZFajUzTmlzN1Uy?=
 =?utf-8?B?UjBEclNWdmtaKzdLaDJVYjI4M253QTZTWDlSYVJDNGxSTVhSNW5TclFmVDd6?=
 =?utf-8?B?eTB3WXdtK1BEWHJyUVIvOU1kRVEyQVNQcndWNnltR202bERjcU04VDNXVkp3?=
 =?utf-8?B?SEg3Rk5kU0Q1bWV0MzR0L2NpR295ajN0TE90c1R1MVc0czRmazdPMEVIejJK?=
 =?utf-8?B?aDg2T3hLUjlrTEJUU0RZVXo1OXE2aDNBS1ZCcVJ4VHFIOURyOHBJNVE4OWJY?=
 =?utf-8?B?dmpOcDR2VTN2QmFCTFBnYVpxeXM4Q21YVmg1cWluLzUrWmp3SlZ4UmRKZFV2?=
 =?utf-8?B?bStxQXd1dk40ZVRFSDNoQnNMY2lYVFJmT0VOcm5DYjFKZEtMWEI1ajc2SVU3?=
 =?utf-8?B?bmp2UE1WUjVqK0owcm1jTmlXTWxzYjVCYWJJbFFUTjREcXp5NWlyalZlQ294?=
 =?utf-8?B?Q1NrQzAxSGtOSVJWQXRTTno4U1NtK2lXVmhQZlF0MEZ3M09LelZZZGxDaWlP?=
 =?utf-8?B?eWdXQlp0R25aVUszZ1NRQWJOOG12MHFabitnSU5YTFNzSFU2RE1UK1pZanpN?=
 =?utf-8?Q?1/oTF4E5ifFHHZduri/uJNmVY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e799e4-00e5-4983-2b52-08dda44ebaf1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 16:33:40.9033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kF2cMeVP+8Q7Z8UXKgG22mbbXYK8Z2MGFkElzpUHa3ylGOQw9pLc/+9u/jdDhsXj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5877
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

On Thu, Jun 05, 2025 at 09:47:01PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@nvidia.com> writes:
> 
> > On Thu, Jun 05, 2025 at 05:33:52PM +0530, Aneesh Kumar K.V wrote:
> >
> >> > +
> >> > +	/* To ensure no host side MMIO access is possible */
> >> > +	ret = pci_request_regions_exclusive(pdev, "vfio-pci-tsm");
> >> > +	if (ret)
> >> > +		goto out_unlock;
> >> > +
> >> >
> >> 
> >> I am hitting failures here with similar changes. Can you share the Qemu
> >> changes needed to make this pci_request_regions_exclusive successful.
> >> Also after the TDI is unbound, we want the region ownership backto
> >> "vfio-pci" so that things continue to work as non-secure device. I don't
> >> see we doing that. I could add a pci_bar_deactivate/pci_bar_activate in
> >> userspace which will result in vfio_unmap()/vfio_map(). But that doesn't
> >> release the region ownership.
> >
> > Again, IMHO, we should not be doing this dynamically. VFIO should do
> > pci_request_regions_exclusive() once at the very start and it should
> > stay that way.
> >
> > There is no reason to change it dynamically.
> >
> > The only decision to make is if all vfio should switch to exclusive
> > mode or if we need to make it optional for userspace.
> 
> We only need the exclusive mode when the device is operating in secure
> mode, correct? That suggests we’ll need to dynamically toggle this
> setting based on the device’s security state.

No, if the decision is that VFIO should allow this to be controlled by
userspace then userspace will tell iommufd to run in regions_exclusive
mode prior to opening the vfio cdev and VFIO will still do it once at
open time and never change it.

The only thing request_regions does is block other drivers outside
vfio from using this memory space. There is no reason at all to change
this dynamically. A CC VMM using VFIO will never use a driver outside
VFIO to touch the VFIO controlled memory.

Jason
