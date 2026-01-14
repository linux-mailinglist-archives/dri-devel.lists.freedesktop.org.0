Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A70DD1F1DE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 14:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2974910E2C6;
	Wed, 14 Jan 2026 13:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sOBfpz5c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012021.outbound.protection.outlook.com
 [40.93.195.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C97510E58B;
 Wed, 14 Jan 2026 13:43:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIZi/VDuuX1LYKdUCsCLHpMUClBMtxttnIvaseqyy85wd+aKtYzCrl59YSNyI1Y2sWRNDw0/EQah1/2vXSXDaGQVmxsQ07swCxvf2ptpucZ5xA70OYzukjg5qqFFwFHim5gM/GQgZjnPuN371b9fGK6WML5rSD7EQSJ2iMZbxo6Vucc5C7AaE7l3b43zD8KnNMKSSHEnTSKd5uttbx4aJk0e0v53fvzet4/IBioVSnxrpU7tBDjnQL/44eMOzb0k5d8eD0cgggc5ZgWei2SIx7edeHhFkU9JZNqYJabihjyfAXS6jqMNvgNilnMVXLYd+ZgR0BxKZo0rUfuFP51qaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9yLXNYecLIY8u6RexEsAcTV9Kh/lEG+ceh9JvF44MM=;
 b=gvJPKbdzHNJbTBRTwYCl87p58BxPqIgsfKp+FytfE2lgBJSK3UY4/vwBsgnWF3Y6z7LbNPWzBCy4VEmALp6OQ94bHmDl2j9/n18tuMyFZIdOKCSd2pYS64qEz+1GlqExLm8+Y3v4DIOj9jHoPJRUYl2KAr0CCLG5Zo8CTyOwfcHgNkfoNzdM6xie64CRkyv87VzPV3vP3A7TTHMr+H3i1BOdZtuN+NnP6PYpFmXkb6/9SUPTbc27urWZkZkQhpnNG/EsBmCnCT4G/UIxmLNW8IM1cLIa1MQS/BfQUreSdI2lpLxTRFjbd3b4CPldHk08Im6jn+Pm8YjJ+rYFAk2M1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9yLXNYecLIY8u6RexEsAcTV9Kh/lEG+ceh9JvF44MM=;
 b=sOBfpz5cZoIr7v3sVeJfbFgsPmZ3qnMPlaXj8C9CLDHGD6OsP2l9+3/hZ2LWI8iu/h/l8887McW2ZT9JGP6ERnczULEOgDTrOwMTRS3TvG58sXwVWpMK4Is+f1QlPnJLmz6sKnB1Nw+RSRvjtdX4PXG07o/RuELeKYBDCRRo6sT0F+3wIR+0Xonv3liYzmAprm6jHZqTxPH53/eNNOB2BJFT+E3jsbnIbAv9E/LqbH1NXrqMOEsNphdPFBfpaTCAUMJrylAPDYilWKt6VOh8Qp1UaczMHnt/9nqFIUGQlTz5w9c6/yCRZX/HA77n5KBjx+Ww09VYA92xUvrijg0umQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6358.namprd12.prod.outlook.com (2603:10b6:8:95::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 13:43:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 13:43:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 22:43:06 +0900
Message-Id: <DFOCU7UV5475.1SM345TIQ642Y@nvidia.com>
Subject: Re: [PATCH v2 09/10] gpu: nova-core: simplify str_from_null_terminated
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>, "Alistair
 Popple" <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-9-dc7b42586c04@nvidia.com>
 <9c153278-c334-4649-8f73-ec5676ad25b0@nvidia.com>
 <DFEVITW4O9DW.P4ITE1PWIDY6@kernel.org>
In-Reply-To: <DFEVITW4O9DW.P4ITE1PWIDY6@kernel.org>
X-ClientProxiedBy: TYCP286CA0340.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: 63fa1758-056e-4a49-1380-08de5372db12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2ZmaDNNUTdVRGxrSW95bnllazU4Q3JOTU9ZNzVzclZFaWRCS3p1UUU0anNX?=
 =?utf-8?B?YUNGS3RZZ2tFMFc2TFlTL3FIa1FWV1FYWXBWMEVxQ2hRazVyTkJ4alhMOHc4?=
 =?utf-8?B?WW5SeEpnWTkwNWo5bzNQMTNYTjcyY2xOQUxSOE5wd0NNbHVsSGhOQXdDTk5V?=
 =?utf-8?B?MkUybzY5VGN2NE83SGFxYUw3b21VZEY5UktoZkdDT1F4UzhkejVEYkxuMHBF?=
 =?utf-8?B?ajBrYnptM2tKRHRvNElXUFBYS215eTBEcWxQbDQ3Y3BRMkUyZ2xjaGNRUXRL?=
 =?utf-8?B?RlRMRVJHQW14ckxyMnd4dTd5UkErVUJqTTlPYzJuN2hhanc3UzVCNXZ3T2JO?=
 =?utf-8?B?MjdzY0R2VVIwTmE1YUwwV3kwQm83eFlGVkhkRE40ZFY1YTNjU09uMnZxNW5O?=
 =?utf-8?B?MTA2RjdwTm5GWWI2WDFnNTBFNkwvT2RaTUJLWjQ2elNWYUpoT3lnbTNDY1M1?=
 =?utf-8?B?d0JHaExkWjYwYUs1ZlRBdkx5UldOZVQ4NjBLMU9lYnlXdW5kcTFKcU8yTm5s?=
 =?utf-8?B?VDVxWUVpNCt1UEg5UllqM2VVNzBwT0ZPaUgxeEdHbmIxVUhQSVlHZ0tSV2dT?=
 =?utf-8?B?Mm9jTVZsUWhiZTA3SjNDRWpsL2lZOCtVUkF0S3BvNHZJTDdtWFBEQ0E1QWlV?=
 =?utf-8?B?cExyNXY0amIvOTRoSlU5Rm9iN0JBV0lLWTBvTDJzQk5kbUpTazQvTzRVYUQx?=
 =?utf-8?B?Rk14dlVzcVgxSmdGTW8rdmhKUTczKzYzaFNqQVBxWno5MklCWHd5WTROUmxj?=
 =?utf-8?B?UHBXV2g3UjdYaUcxWkh5K05MN3VLb0h6Wlo4OFVIR1hYRHMxaU9laWVPUmdv?=
 =?utf-8?B?SHloWVFEUi85WUV3TERNTjdEbVJhVnd0SE5KRVZ0T0t3SXkwbWRCTVRiMzZu?=
 =?utf-8?B?Y1BvWjVpQlJ4UDNLZENIMTN2MVlnd0RVeWJ4NWdMT1RCek9iVlB2VEZnUWpv?=
 =?utf-8?B?Z1ZlUC9MSm9PY0o0c252SDZjeGlBWFpTbGkyRDhZQkNIaWJLK0IvVWVHYlpH?=
 =?utf-8?B?UlhNVnVzemNGMVFmVHFNb2ZPT0htYkZEN3ZyS2EwTmpNay8yRk0wVWUwa1FG?=
 =?utf-8?B?b0xmL05SZTlSVThJb2d6dlRvcTl3UnpuZjZLR2RydE5uQXc2emNYUGpHb25Q?=
 =?utf-8?B?QXk5eEV0dTYvSTM4RlQzUXo0K0d4bVhVaVVCWUdRUWs5VEE3bGJYSjBrQnIx?=
 =?utf-8?B?OU45TkxQY1lVclJjYndVOG1aV0FTdWtyZE84djVjSjVSNWVnVjYwNEtzL2c1?=
 =?utf-8?B?TjJIeXQvTTNkcHkyTW5JdWF0VDJETitsRjAxNUpNdjUxdXNsWTVGRldDUVZM?=
 =?utf-8?B?M3d1VXUvbjNOWVYzMHlQMWR6c0hCd08yMGNzSUJCUlI2YlZTc2J2Rmxxa1RN?=
 =?utf-8?B?c3BRb1FFV3FhVW1tcnp2cDJ3djlLdGxXY1Z6TEFWM29pSElkUGdydDNMbUdT?=
 =?utf-8?B?MDFxV1RCS0EyWjgxS0pTQmcvd0Zhb1ZhSTZlUnJDTVhRQmVxbDNBRCtacU9t?=
 =?utf-8?B?TUtielR5ZWlCK2JMb3I0cWxmWUhWdm1jRWh5NVhZZmlxL0JEK3R6MkRiZlRF?=
 =?utf-8?B?MlFLRytVcytBeDV5ak5teFZwTEtINlZvRERVL0FzaVdQckJEcWVnMy9za3Nh?=
 =?utf-8?B?TUpHKytYNStzZjcveGdwN2FjL3lwTUxaNjB0TDd2eG5lR2NYVEVQbmx3aXdZ?=
 =?utf-8?B?dFhpcldwSzUrUG84c0k4bExBa1NHY0RxS0x1YytiRmcwUnVpd3dLUFdTSzNu?=
 =?utf-8?B?WnlQU2VpdGJCZmk5Z1ZuL2xQT1BtMHhnN3ZYYUpIZmswQkRNWXEvR244UVp2?=
 =?utf-8?B?RGgyQnNuSGlITjk1ckIwNkxLaFR5US9Na0VqNEZaWm84VytKSGp3WWd3RVpE?=
 =?utf-8?B?ZEdrL2RVdDVTUW1Fam9vYnY4VnZZQ0Z2UzNrY2lpUlpRR3FHWExBY0NoMVg3?=
 =?utf-8?B?V0dzT1k1djdGVWJmZG5YWTV3WGZhVGZWLzY5RFdKNzMrYmxJZEZyckt1MWJR?=
 =?utf-8?B?YXFXaVFrUnN6b3YzS29ZYzBVdDdtcXVRNmZXRFdTOWtnVTlKbi84SGpVWlB6?=
 =?utf-8?B?bHIwNkpsVThKc0U0NjF4T0IvYWRxQTAxN3prd0NwckRBRzR4RkV6d0xBY0RN?=
 =?utf-8?Q?ASDg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0xuamJka1c0VjdGemtLK1FoUFg5RzJNR1lJa3ovazN1elNqK3NZd2ZEUG8v?=
 =?utf-8?B?MkhManB0cCtoNC96dHZ2MzdUdlphNWZ3Nk5Wc0UrN1BFS05GMHNmRXFGTXZT?=
 =?utf-8?B?MlJHT0s2aFZicTdKRjFsUWIxMWNDWUhPTS83VjAyOUNHNDlnUHU0RlM3NmZP?=
 =?utf-8?B?b1VKd1IxRkdCaXc5TFZ3K3pHYXB3STZYektkbG9VRVhlbER5Ky9pY0tZc1ZP?=
 =?utf-8?B?YnkzcmV4T0ZLSUpBV1BYZnB5TUJRQ3RRZGlKb3dCUldsVFJ5VzhJSGpsNGY0?=
 =?utf-8?B?djFkdFE0UlBUM3hUbkZyMzhYTjdSUnVJWFZGL0hsMGNnSm8rMHRQZnFkSkpQ?=
 =?utf-8?B?c0tTd1JaVmRuS3g4OTM0YWg3bStxK3VQYXVyVW8rUXJ6NnV1ZW05QVBKZXFw?=
 =?utf-8?B?eGRBSkNDQys1S0U2ZkVRRUNMQ1Q5ZkxjTUhiRWV1VlJWWEE0VkYwTWlIUGZQ?=
 =?utf-8?B?bjZwTWJQdHlyUEROekZPTzNaMStUZUJZZHFURTkxcmttNWVaU21IandCbWxM?=
 =?utf-8?B?Zmc0ckl3b3BlZjNPN3RwTWJTR1RPSVNFK0xxdFVnaldyU09FNi9NUFVBQ1kw?=
 =?utf-8?B?eEpMc0dyVFppeGNwZnJObVI5NlRESGRvNmpZamRtdVFrZG80THdXL0sxOEk0?=
 =?utf-8?B?UEdkcS9VS21MZ1IzRVVIOWg1aEo5M284R01RbVowVVVrLzRNbmpTSVVzTzJE?=
 =?utf-8?B?NHVCOHN4UGErTU9vTy81ZlllMjNiZUhuQndCMU9kYm5JNEVFejgrK0VONmpr?=
 =?utf-8?B?Zk94bkFFRkRJdHE3Yms0Qlg2QzEzWnc2WkQ2WXErbjRlTTcrdE84RGx6Y3Nl?=
 =?utf-8?B?Ynd3Uk5GVDVaektiSUQ4MjF6VXhYMUVERTRKY2I0eFNSUGtodnJuYjNWSTFi?=
 =?utf-8?B?V1lGU3BGWVdyZDY1azJWU2RMYzY1Y284MmtSemhaZ3czdWRKdTJDZDlXMk1q?=
 =?utf-8?B?RHdRbEtTa2grYVFLV21SbzYzT2JhdG1LS3F5QnhmMElBcFFmeWVqQmVKWDJm?=
 =?utf-8?B?cmM2RURzQTBPUmFlWG9sU3Y1RTFZUndtV002cEp4ZzlpWGE5SmNablJPMWEw?=
 =?utf-8?B?djFXT1VqUStFd1p4dWJoUUNEMWRlWTA4eVJHK2tkOHdjYVJpdVdGUnFaRmxq?=
 =?utf-8?B?WHV3STY5MHlsaWpCZ2xiSHNNcWNVdGN0bnhmL1g5bVVlRXNjc3ZHc2dhUXR0?=
 =?utf-8?B?YXFOaUF3L3JlR2hiSytmWTF2WXBHbnROTGRPMjcrTDUvS1FvaDZwRHMybUlw?=
 =?utf-8?B?WUE0TzZZVHFSajNuZU9ESlNpQ29RM3BjR0orUlFsWW10cktVWnNGK04yN3U0?=
 =?utf-8?B?cnJsckt5NWtGaXdkNGV5NlBGemdkMDdwTWl6TDdFRHdaQkFQcHJtaTFjbDhV?=
 =?utf-8?B?TUJuUElNWWkxR0E1b0Fxemh5aFMyZC9MY3ZoUE1ZZGcrMjdYd2xlazNXTFp1?=
 =?utf-8?B?SjRidDQ0SngyaDVVTUh2NEJNRVpFbkhXOU1VNXBqOGlyR3VtZWZiZktlWjd1?=
 =?utf-8?B?Z0xLb1BoSlV3OWNtUjJiUFp0SG5YK0k4a2svWTRCczU0S21BeS9Wd0xoRTND?=
 =?utf-8?B?QVhLcXNCeWo4YWVvc1F3bDJlRElKTWV2VkoyTlBiUjlyUlEzNFBkVitURU5O?=
 =?utf-8?B?MlQxWHhGdm1QRUZxcWpLeHFFU0pMUEhRbW15eS9XbEEwOFVjRmZTNXdnN2N1?=
 =?utf-8?B?NkhUZjAxUU82L1hCeWhlY2laRi9tdjFDanlxa3BuOUh1anpkSVpySDFvOTQ0?=
 =?utf-8?B?VXhmc3JEWW5wZ1Rkd29EVzByaTNHUitDT2NqM1FTM08ycWFuS3RPS0x2RjhT?=
 =?utf-8?B?SEJ5MkdWRGlYVDFHMnlRZEJscXJnZWRRdDVJZGxhUGtKSjIwWnVxdk5ZOEQv?=
 =?utf-8?B?dUI2VkNpaDFITXhEV25CWlkzbVJUREZnK2g2cTArSHAxTk5ZVVNRWFRIMHBn?=
 =?utf-8?B?V012VmVjblZ3K3FHc2tVT0V6SGtSaFEyaW1tL1V1K244R3Vqd1F1VzNBTGZK?=
 =?utf-8?B?amo0dTcxTzcyamFHWDhkeldqYkNpWWZWN0pNb0ZQSm4ydGk5Q0NoL2k4dEty?=
 =?utf-8?B?YVRacVBwUlByYzFmZlcyeHZqUEFjR2Y5TVBaSmc2VUZ6MG4wcXhKNGdiY0l2?=
 =?utf-8?B?WmxXNklITThVT0xybERUWWZCSFMxUnNQckc1aWc3bjBQRWtWU3U0eHJWTlUx?=
 =?utf-8?B?R3h3MXBzSTh2S25QYUdYLzZmZnRiRnJIMVVXS0dJejJyT0k5ODhWT3lvWm1t?=
 =?utf-8?B?RWVKbFFNT0NlVU55MC9ZTCtzS3BYV3Jhb1ZJRUhqM1lTY0ZTVVk4SHBOZlZO?=
 =?utf-8?B?dTczUUhzTWtKTlU5RUszZEV5SmN2cUYzY2NvZHRBNjdNSW9oZ0xITDRyQTN0?=
 =?utf-8?Q?6dvWoKdVowEe9yyTdN5+zGOU/cB3+TtB96CDqAeW7GMnQ?=
X-MS-Exchange-AntiSpam-MessageData-1: pyrBX/3hFZUdCA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63fa1758-056e-4a49-1380-08de5372db12
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 13:43:10.2282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2hxpgpVlwP3d7i5LiYLrQUxkYS5lF94rrce6SAH7S2gT3fbyx+wvZIGzlIdJNUftvOTnJYur2+q/PadOX8d2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6358
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

On Sat Jan 3, 2026 at 7:14 PM JST, Danilo Krummrich wrote:
> On Sat Jan 3, 2026 at 4:37 AM CET, John Hubbard wrote:
>> On 12/15/25 8:27 PM, Alexandre Courbot wrote:
>>> The core library's `CStr` has a `from_bytes_until_nul` method that we
>>> can leverage to simplify this function.
>>>=20
>>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/util.rs | 9 ++-------
>>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>>=20
>>> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util=
.rs
>>> index 8b2a4b99c55b..2cccbce78c14 100644
>>> --- a/drivers/gpu/nova-core/util.rs
>>> +++ b/drivers/gpu/nova-core/util.rs
>>> @@ -2,15 +2,10 @@
>>> =20
>>>  /// Converts a null-terminated byte slice to a string, or `None` if th=
e array does not
>>>  /// contains any null byte or contains invalid characters.
>>> -///
>>> -/// Contrary to [`core::ffi::CStr::from_bytes_with_nul`], the null byt=
e can be anywhere in the
>>> -/// slice, and not only in the last position.
>>>  pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str> {
>>>      use core::ffi::CStr;
>>> =20
>>> -    bytes
>>> -        .iter()
>>> -        .position(|&b| b =3D=3D 0)
>>> -        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=3Dnul=
l_pos]).ok())
>>> +    CStr::from_bytes_until_nul(bytes)
>>> +        .ok()
>>
>> I guess I should have reviewed this patch, before creating my version of=
 this.
>> I went so far as to delete this file entirely, see if you prefer that, i=
t's
>> otherwise the same core idea, but with more cleanup. [1]
>>
>> [1] https://lore.kernel.org/20260103013438.247759-1-jhubbard@nvidia.com
>
> Yes, let's remove str_from_null_terminated() entirely.

Removing that method is perfectly fine IMHO, it was only using in a
couple of places and is easily emulated.

>
>>>          .and_then(|cstr| cstr.to_str().ok())
>
> Additionally, why do we return an Option here? While an error can only ev=
er happen if
> the given slice does not contain any NULL byte, I don't see why we discar=
d the
> error code.

I guess I didn't want to change the function's prototype, but yeah this
is sloppy and another good reason to get rid of it.

I'll respin the series once the patches in -fixes are visible in -next.
