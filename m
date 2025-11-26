Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C75FC8C3FC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 23:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9621310E70D;
	Wed, 26 Nov 2025 22:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uRS2oSDL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010025.outbound.protection.outlook.com [52.101.56.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E6D10E70D;
 Wed, 26 Nov 2025 22:47:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LejOx4qMETidujcSVy6pT+WJMC6X78W2Wn2QAhGXqfDgeTWtpe/38+qMtDlzAUeWFg4nIv8wmMbIfNJfY/rzJVY7LabLWbnVc/JU08rM6iGi7WbBOPAHDrxaEcLA9X5cCQRTwlxFHW896igDPC+HMXwlQGvLB1KCvBH3JFLThfiGYtJHTRN417y8KrfSxivchG6FaAu/tiPNwtRuHgTiHDCP31aabQb6ZliJjVatEgwxYy8gRDrUmkGO/DZ2UJTafPTYua4pCSIVluUsitdQHw0V4vT2BVFoF3EmllCjmeZbVAzCC0D4DLJr7DG+xU0dMXMJ7+ycYa/b4m5kDoAQwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSOSocDqSEr4IIQPK5Bzz/dBN4JhPQ09hDogTWYC0jg=;
 b=qbq8SBbnit8Y/R5IfLS5tJ17xPURw+iHd1bnEEIQ5bK4XbvfRHz0zT51AKRp5QAipWoDblzcjb4VhfPKYgDN9TxE5aYkEh4V8DBwtnr4xMzUuHTVywUTEQU+uEcVW1LiYrbkHqq4BZsU6eVJQ+KrERcMHy2JhGCL0XpYqUX4F+qDUruEE7nr30iahEjSHXKNOt8GEuVj1SwE4+bltOQH4e9vMqPN9oMvqjc1DwpGbABGpHfFNhfgXpeqPUxNAoqR5kE2WpKJ3rX8dENFY0W4zRkIvAT8AbvTrHru6+sMD3m0uMnuzxYUgM/p7gt51N2qhHWi8eSH5Keyfuv20cyycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSOSocDqSEr4IIQPK5Bzz/dBN4JhPQ09hDogTWYC0jg=;
 b=uRS2oSDLXCYcOXHGQiaY6QQyMBxDXdxKSHThPB2LT9d3a7P6qAHm4Qrtbhjhph6eeXch1eJpHanLKjR1/eJSwyaqfN0U5LstY5kjGEbCU1YWJ/seZs7s/IhXlAbR5/h4xaEhlmRJdS+9nPk5BlZnioy8HuF4ud7302QpeKB8N6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN7PR12MB8101.namprd12.prod.outlook.com (2603:10b6:806:321::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 22:47:12 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 22:47:12 +0000
Message-ID: <d9126a8a-9517-4263-ae92-4df279e16938@amd.com>
Date: Wed, 26 Nov 2025 17:46:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 00/51][FINAL] Color Pipeline API w/ VKMS
To: Simon Ser <contact@emersion.fr>, Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, xaver.hugl@gmail.com,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com, nfraprado@collabora.com,
 arthurgrillo@riseup.net
References: <20251115000237.3561250-1-alex.hung@amd.com>
 <cbe00ac4-a535-47d3-813a-e2eda7e9b991@amd.com>
 <d8360e9c-502d-4003-93ab-9afd8d716c49@bootlin.com>
 <cb13dd25-82b6-4d8d-a8f2-a9a31ef2e73d@amd.com>
 <ecf54c45-4b45-4fb4-a102-46ce9e1de3a5@amd.com>
 <2270bad3-8634-438a-aa16-2092398e271b@bootlin.com>
 <6QY5Z1orPMIPt_9Gn1wlXHSZHCPaaFuECJl_lVkAAdMUaBxGELZdG2NTHjg7vRV8MaKa0EU1MO9DOnuI4Pzsjej4GuC10FsnqdaVTvWFWBk=@emersion.fr>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <6QY5Z1orPMIPt_9Gn1wlXHSZHCPaaFuECJl_lVkAAdMUaBxGELZdG2NTHjg7vRV8MaKa0EU1MO9DOnuI4Pzsjej4GuC10FsnqdaVTvWFWBk=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0099.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::32) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SN7PR12MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d48a09-1b86-4a53-a29e-08de2d3dbd21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2wzNjFjOUY5Ry9nUUtIZG9rbURXTGxOcHNoYjY2SkFaam5uMWM5RFNXR2lO?=
 =?utf-8?B?ZS9oQTUvRUViTG5QbkxONXIyRmZVWDNqWWRSKzRwR1BEcFF4dmVWQW5BbjBP?=
 =?utf-8?B?aDVqMzkyM1FkL0RpcHVGeFV4UFR5b1VKTElCUlFsdjdRR1prRzg5NTZZMFdN?=
 =?utf-8?B?aFdwZkRoYkY2NkZsbmlEV1dEWVNJem42TDdiejJRVGtpQjdiR3RGemVIRGRE?=
 =?utf-8?B?ME5FTkNFWGwxS0V1MGVrMEo5ZVUyM3BPTDhaOWhYczNBRjhmZ2Z2Mnh0WHNl?=
 =?utf-8?B?c3lYbnJIY3JzRzkwMEJDNDFOTHBUa0F6dXpabk50QkorcE52UkVpSXgwNDBM?=
 =?utf-8?B?QVlOUjhHaWwvekxOdDUxRW1PR29DTDJrM3dDZzh4ZWNUd1h3eGx2Nm5OWTdn?=
 =?utf-8?B?aFdlTUxiSk56LzJkSzJ3aXhSV0RsSmQ1alY5STdBdnlqRjJxLzVQS2ZXeXMx?=
 =?utf-8?B?NVFldGwyOGxBVXhUOUJzdmdJUWkwS0FnYkFLSVptaUk1QkhQZkFmaVRHTlo2?=
 =?utf-8?B?ZEtUVTYvWTZIL0JZZ1Q2bjU2Qlc2OVZGU1lPcGJrL0xLbTFlSmNwU1BDeHIv?=
 =?utf-8?B?TlprSm9KK0VVN2kzMVEzQ2VTeHU4Zjl5RTNSVXVsbFFBeVI0ZXpockdFZ0Y2?=
 =?utf-8?B?UVJ2TDBCa3o1THUxYVVLc1RPYzZHK3EvS3gyTk04bXRPUzdmNW9wR1RHZkt0?=
 =?utf-8?B?VzdIajRYZDNINlEvdEo5cnA5NlJDNEUzQWNjUjczWVBTVUgxWlkrUWc5WkxK?=
 =?utf-8?B?M0FNSm1VU1YzVi95MllnMGpyMHVkK0IxMThMV2llTzdONlBqNGV2bEZEM08x?=
 =?utf-8?B?MGtxenNhRDJIKy9MbCtyQm5TUXA0bzZBMkhsakwrbHc1azcwWWE2dW4yTjEv?=
 =?utf-8?B?c2paSHhhdFA3NWVLb2EzMHZ5RW1JSGRXbkJiVjN6aXV4Y2NOYjNZZWd5SVRH?=
 =?utf-8?B?bTcxRGgwUGVYb2tnWDlnUU1FaWV2REZVaDFBRVFBT3E1ckxlUDFTWE1pcVQw?=
 =?utf-8?B?T2ViaEQ2NGRuekg1bU95ZUk3SUc2SXNrL3hmTXkwaTk4bTlZVFZPQ1lQUStO?=
 =?utf-8?B?UVFURU1iRkJqWmgxWXVpNHdXeFlpTU44aGE0QThCZ012VlRRY3F1MmlQcks5?=
 =?utf-8?B?dW5hMTNkYTNqdzMyN3FqWVBLNCtDa1R2MThsaHZJdUluYUlnSUJOb3JGdFdN?=
 =?utf-8?B?c3dQRWI2dGpkNm1KUzNKaERtTm1KOVBiV0pFRk5PMEdEMVlyQ0RndnpMSTdt?=
 =?utf-8?B?RFNrZVJSTFJqUXNGQWZabWpXMy9SYjhSb21Nelo4eS95dXpPQ0UyQUtxWC9J?=
 =?utf-8?B?RkE3UWt4TThybVFVV2IvWHZyV01iRUZNMjNqcXRXZytsY1lOUU10VWJqTEFm?=
 =?utf-8?B?UEdRcW1ldVFSWGFpNUQ0Y2R3UXprbWJvc1ZPam1ZZTV3MG9xUXdtMzRNY1Fr?=
 =?utf-8?B?aGVkRkhONFFVc21FSGVWODhrLzczZzhNc2N5SjNsRXlyVW1CazZNK3FQY2c2?=
 =?utf-8?B?RlhYVFk3VFc5NXlkaXBkOFBmTkJhTktKdXBCYmd0dEwrWndrSDZkV1hJN0M2?=
 =?utf-8?B?WmlXbUVJd0tDbnFSbi9rL2sxZHZjaktwUHppWTNVZi8xT3VwaWxVQzVlOHRR?=
 =?utf-8?B?eFdrQUtwZHJmUC9sSzFCeGZwNEI5NTNxWWg1cE83QnVWTkVobTVsck1JMWlE?=
 =?utf-8?B?UWFmejdORU5iOUJLM01TbVlVOFZ2OXpnVFkxM1pXSWtQMWNRR0UzS256WFJC?=
 =?utf-8?B?aURIMjZVUXVwK0w5ZkhIOUNaMm9pY0lmNEFVTnVqekJ3cDE0SHNERXMzN0tP?=
 =?utf-8?B?czd6SnlBb2JRamlDRmxRclJaRlhGWklZUkwzS0ZGRzRraDlSQUpObEtIOHUr?=
 =?utf-8?B?dlljN1lNTHlkQ09YTVFBV1hCd2c3ajZRSmQvYVdWcEJJZ3ZWMC9XRjYwazhE?=
 =?utf-8?Q?WFoL0LQsgXKsM8z6XOEc4ixOeUX2GerK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXJNRUVEMDFRSGlVWXp4aVM2VkxlblVUeTdZWmc0N0lOczVzS2VzZWcvR2V3?=
 =?utf-8?B?REgyY3dXVEtDdmRwNkFjNndtcG9HbUVQTW4yNTU4Y0g2Z3RxVk14VllnZ1hD?=
 =?utf-8?B?MGh3UnlnOTJvUVJxSHFscVlWRC9NVTN4MVUwTEl1QkdVYytjNkJtMlpYMTR3?=
 =?utf-8?B?Y1NtdDBKOFNnVSszbi80cjI2SGpsTW9kb1RJZ2tQMFBRNjdBaFUzbmxJRk5v?=
 =?utf-8?B?Q3k4ZUtMa0FHdVVEeTluSUlnQ0ZvNUVkbk1OMktFYUVmWUFjL3Bwak1QMi9n?=
 =?utf-8?B?Smc2cGJHMU9PYU85dEE1QTl6Wk1YQmIrRG8xU3ExRlF0bFpGdXNzeFNCUGZW?=
 =?utf-8?B?SWs1Nldib0V5YlEyUXIwRGZnRHltYTJlS0NyeDBEVmhOdFJ4elAxUlVndW03?=
 =?utf-8?B?UGxaY0RITm96eUJjWXJhUFFrOGp6MUY0WFlMNml0T20wc2MxbU0wVDVtMCsw?=
 =?utf-8?B?dWlPUTJUL0VuVUVCT3AzamxjM2NzVGNjUkJncXp1U2JYMW11QU4wT3ZRSkIw?=
 =?utf-8?B?MUk3M0oxOElwVUpRUEhFQVl1TFhiMmpPbzhNRHgwRG1Qc2pxUjVTWGoySGdC?=
 =?utf-8?B?MVhmVFlPRmRkaWhoWng4YjJqZlJBVmZNbld6cm9KOENIc3FDUWNpL3k3R1FV?=
 =?utf-8?B?cUkyZFg2dFk4SXJRbVByU05EZzhBd01Xc2dtRDhtSWphTnB3MXFNRUFkM1N5?=
 =?utf-8?B?cE5hbHl4MzJDZ2hoV3NtREVadW5xVXVQSFB3RS8vQTd5K0hiL0x0a3Y1a1dZ?=
 =?utf-8?B?Q2NFVHZ4MUJaVkVLY0pwclg3UTVqUHhoYitINnkwQnRtM0p5dTlRV0tVWFBR?=
 =?utf-8?B?Z09QemRNaWQ0WjhDam94cGsrMUU5Nlk2cDVVaTBuVktyWnIydEtVOG1ady9h?=
 =?utf-8?B?akRvWmtBdXJrVHNKNWUxWnR5NE1FWE1KWEt6OGVKa1AyQmZxUHEzakREOFJB?=
 =?utf-8?B?V1A4MWlqeW5HZUhCQVZFOFZsOXAwOE9PNUZYaUdvTEhWWncxdmFjcDl4RDNo?=
 =?utf-8?B?Y2FHc0xXNlFZK1NNMlBtRHJtZklGazAzNnI5QitrS3ZHbWxtU01sK0ErRVpu?=
 =?utf-8?B?clRjWDBJUTFOMG5jZ2hBTlJvSE12UFRkR2RWMFNTUmI0Yy9PS1lhSVpzMUx4?=
 =?utf-8?B?cW5Jc3JhWXB5ZGJwVUhaak9wOXp3WG1xcjJ3UWswQ3hUMXRURythcHFCWTM2?=
 =?utf-8?B?Y0R5dUZVUERUNGJKa1JqNC9DM2s5RGxnS0QrR0lQdzE3c1FoZVpYSmtOWmdh?=
 =?utf-8?B?dzRWM2tudzdqQWQ0aU5sZnE5UElYcG50WFltQXNiMURGNWF1RXdBalNTVnZl?=
 =?utf-8?B?OWlWYUcrTThhYk9JZUdjRTliMVlJb00zRVNKd211Y2hhemg2dXhEb1ppUW9s?=
 =?utf-8?B?YUpqd09Idyt1YW54cERWbDZURk9QTzIvaHBSc1hJdlNsZ3lHSysxQm5GWTlX?=
 =?utf-8?B?OURrUnUzN0hmeWNlRHViQ2Z6ZnowZXdFZW5DS0FCMDRudTBNWlc2bzFKa0dt?=
 =?utf-8?B?NDBPQTM2bzFoZ2xIRlVDUytFbXBoRDQySURKV3hRdVJmZ1ZUSU4yQnlBeEV4?=
 =?utf-8?B?NFdRM2Y2TGdyYVZZKzFGVjc1N1IrTmRGTmIwMnpuc01ZSFJQVFN6YWl4NzF0?=
 =?utf-8?B?Wldid1NqOHVhc2ZPUXNFZkNBZ3V3WGQwWDhnajlXQ1NDc0VjVy9vMkQybHdZ?=
 =?utf-8?B?MHFaYnBKK2NUaGFLVlpGK092SHhJTU9EdkJJeXU4T01BTXExaFRLMDQ5aWRX?=
 =?utf-8?B?K211Zjl3WHZKUld4SnQzR0MwaDZ5dEZGbC9CWWlPaE8vOEt4cjdJa2REbFJI?=
 =?utf-8?B?RWRPSmJZZWNQYWtXS1dVemlELzFVMTladUY3eU9Ybm9RdDdFYVhFTGhJRFFx?=
 =?utf-8?B?K3UvSUM2ZWJ2Wmp5WWJRbXFvM3VraHZwQUg0aGt2eFJNMGZVeDBLZlZyWVds?=
 =?utf-8?B?TWc4Y0NpV05ObjRVNXp6RkU4Qm9tbkZNdFEwbUpxTFI1VytDY216V25QN2hS?=
 =?utf-8?B?OEJwenZ4S0t0MFkrS2pUZFBVbTl0SkV5aVljZCtZcFBJQ3RBN3FTa3RhdzBo?=
 =?utf-8?B?TG1tWkFJbTdFOFI4VnIyaWxpWUQ4WUhUSnFCWFRjbGxDdlgzNDVqNXh6Q0s4?=
 =?utf-8?Q?1pn39t32PGSdjOymszv5UQYjE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d48a09-1b86-4a53-a29e-08de2d3dbd21
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 22:47:12.4853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5VRpxUZYcuFq4dD3O8GVVm3puXoWsrQyVXJ5C7QzhnXIcROPmjVfQkBeGF87MBoMsleAL/O6rPDnuKc7US8VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8101
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



On 2025-11-26 17:38, Simon Ser wrote:
> I've cleaned up the checkpatch warnings (mostly whitespace changes) and
> pushed the series to drm-misc-next. Thanks everyone!
> 

Sweet Thanks. :)

Time to celebrate and then work on the next bits.

Harry

> Simon

