Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D461AB9163E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 15:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0F110E4A9;
	Mon, 22 Sep 2025 13:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e8t4qBXx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D80F10E4A8;
 Mon, 22 Sep 2025 13:27:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mn1V9DTUFvQH99Rdgo1/Aonv2Nfv5lkcfRELLNPkcCtajpxHSy51stwspYsHu8ivoD91NAQDZwtdFfuNEIJL2M0rVupbin1DOT3jgrpkXez/MlAVDdnTna4IkzxZ1Q0MIExLufzcfuYsaTab+6ohwcTn+HGfpqwOXSdzuGmlqfp8fR69emFNh09ST9i1Z06LYQH5KxD89FUszdZXdgAeL7NrjHaQ6TlQ3F4Khqv42q2aznpdECJkJkR0luD/Mh7+ZKcR7wdkNm9vD+hvgwBwCy/jLs9+kkaFV6xYu3mcLD3GuB9ks6Ni8+yxiRdYkBvFQrwkFBGEIAZbjJQINEKUOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i03Ufk6ZMk+Ul6craRsOzxiwCFefhJd+pXGvxvb+Z18=;
 b=Ns5IkxC60EaMpN+kNhQQE67mf6tBoSVQ62DK/XF2p8GICf+0qfgoY41CGru6D5qIuYGDszRjVOEgjaWs+sJeJqqNYJunAtZOF0dSEAqrvgSq6JHWsBBs1rXtXkATPw1E6PYx5NVTb80wQTp/fUV+8ZpytBF9VB9M5/LIjmpEETmQlUvpDbMYK3ZWVd55Fw0J9XodIV64IiobZA/ckrZSAbb4FjREpIA/oLDf96mc2dSwvt98EBYE8iDchvTc8Ej6mRANC1Njr1sxYSb4BBw32W2lfxiXs0wChMZubXL4RUjgqn9+NZPDyvbP9TBZJbiJpk5ucRnPdAIc8M+vogvlbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i03Ufk6ZMk+Ul6craRsOzxiwCFefhJd+pXGvxvb+Z18=;
 b=e8t4qBXxNb9XMQ9dtZmB9GvbpeYLKc05b5OUHg/lgd/GB8rK9Fu8dFhp98PgNR6gmmrVF0OPalbGTXhIGE8qMjwZMUALuFIalW62GzJTZuX7OFHtUc99afsChVKY4JCy7EhnPHL9303eC0VemunTl8Znm+/GW2/WHOIN+KkoQbuLkVOX8Yp6oDLaJeKZ+v0ndUXg5F51mFQQBgXorH5nfewMG351/1eyYBBmjohloWcbCVE6wKH116imNJrMuSkJK8mKko+E3tgHONz+Ux4+pRxrFXWdHlz6pquLQ4ZVQbXEDJg1vwIUsEbKSZLaKKcN8/HjM/jQow7MJfyQHltBvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by CY5PR12MB6274.namprd12.prod.outlook.com (2603:10b6:930:21::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 13:27:22 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 13:27:22 +0000
Date: Mon, 22 Sep 2025 10:27:20 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <20250922132720.GY1391379@nvidia.com>
References: <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <4e3919c3-3d1b-4f34-a1e4-5e9e7a5e6e14@amd.com>
 <20250922122900.GV1391379@nvidia.com>
 <fbb6bbe7-8141-4532-812e-2b93cc2fcb1b@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbb6bbe7-8141-4532-812e-2b93cc2fcb1b@amd.com>
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|CY5PR12MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: c39e1591-39df-4903-5766-08ddf9dbc340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXA2QWZRWnQ5czV0YStDL0hEWWtvbmtxcnJWejBKd2x2cUJBMEhGMXVDSUtJ?=
 =?utf-8?B?bVdlRllTSUxLdWJBcW5RY2dXZ2JCQ0tHWnBNZDZyTnFLQytGTWRaaTBTYU41?=
 =?utf-8?B?dDU0ZGlmZ1crWnc0VWowbDdreUNvMlZzblVyclZ1N1Q0TGhVejVUcW5Obkh0?=
 =?utf-8?B?ZFJ2WVFLWWFGemJXdktnQmIrWUVmOHBzTVYvM1ozZ0sxaGFYK1c3UVR4Nzg1?=
 =?utf-8?B?ZTJYTmdqSTBNUWlXQ0ZJYmcwWElscitrZnRxR3Z3bEZwcjRvQ05DdUtvenNq?=
 =?utf-8?B?MTdNNGtkOGJVMTUvK3R4KzVmT1B6eklLMDhJTUpjMEliazV5K0lpa1ZQY1JU?=
 =?utf-8?B?djVsa3pLdmFyK2ptaGxDbEFDWTY4c1ZpaFQ4c1BwTU42ZkMzaHJCenY4cDdx?=
 =?utf-8?B?V1BaeFdDUHR5bnZhLzFWQnRvRjVZc0xvMUtXYk9tSnFFUTN4MnJJLzNXU1A5?=
 =?utf-8?B?OG9sQTI5WDhsay9TdWVTWXZXVzNWU1AzZ1V3RExMQThxbHY1a0FhQVYzOXNL?=
 =?utf-8?B?aktXa0g0L2l6NWpuOUZpVFQ2UkYyV090Yi9La0hYa0Q2aU1qanQ5OFhoS2Ry?=
 =?utf-8?B?TFpZcGNUbHJoNWxXU3ZtR1ErOGNKZzQ3TXBPciswVHVzMVBPQ3NUajM1NzN0?=
 =?utf-8?B?akhVdmpIYkczc2R2UmJrdEQxOTlzRE5XYmxLdUJrUDRqS2NNZW0zL1RmUVkw?=
 =?utf-8?B?cXlmMVFsbnlFM2pXNVVUcG15V0lobkVwMW1jNFc4MkNIcTJsQ1BpNnF1cXpD?=
 =?utf-8?B?aTlWTEVHQXFpMVlybUFzeW9mUStaUC9NelRUYUZuVlRRa1N2UlFxQWMxcU1J?=
 =?utf-8?B?U2FNQTNBL1FFY1hOT1FZV0VveUJkTWtUUUZoSVBYN2ExRzNNc1duOUVTOEpa?=
 =?utf-8?B?MHh5VGs0eEExSWdXbzhqSjdWUEFDdkdud2FJUlYvK2wzc1duNFBjTDJqdWlM?=
 =?utf-8?B?K0FiQmttQWtBeU0xaEZ1Nmd3RFgzMndFL01JMDRMOElxUHVSbWlnWlJmS2g4?=
 =?utf-8?B?QkNCME5CN2R0RFVSVnhDdmJOVjBRbmwrZHBBcGNaTldsK0dTUkhKb3NQM0Ro?=
 =?utf-8?B?RGlxb0hXN05RemlXR0RYQ0JncnNaWjljbUgvNmovSUhpbXFmVittNUdiZS9m?=
 =?utf-8?B?M2xFb3V5VnFwaFhubGF1cHBBNHptK3EzdjB4cVlZQU0rSjdndFZwd3JxZXJn?=
 =?utf-8?B?U0hPVlNCYlVUNlRLbjAreFQvTWZIQ2xjcXFQSzZxRnBqSkhMSm81K2dSSmox?=
 =?utf-8?B?dHBQSnVUQzlQWk9pN0hmc3B0dHB5TzZEVGZqQTExcTVFcVpJaDI5M0w3RlNC?=
 =?utf-8?B?THdUaUxBVEwrWmlvNkNEYzRuSDRQWjZYbTI2WDdUYlpFa2l4cHhqNTQ2cGwr?=
 =?utf-8?B?T1JqMVE5K0p1UlhtbkZYUWw1dmFTekxCM0VWUjFLM2RheGxNajd1RlF5Rks0?=
 =?utf-8?B?eGpsdXQvUnR2Y2RvSmFTZVVvT1B0S3RxQ3hFb2xyRFp5OS9iMWgwRFJkM1BW?=
 =?utf-8?B?UDNDSllSMVRqVlE0eTVUakVaSnIzT2JVQ2NLemRoZzRiSjRKL0JmUVBtY2lz?=
 =?utf-8?B?VWlvYldDdEdzZENWYVpaYW8yOTZiRyttc3IzdUZLT0tZL3krZlJFUHltRmZK?=
 =?utf-8?B?SUxVVXRTcEw3dkxaRTBQbnRCR1NUMzQvRXBJcFQ4dU96UUJSaFpXMVRndVR6?=
 =?utf-8?B?NHhWL1BUbTJqajBuWW9NdFhPakM4SkpXcEUzKzNSTzhWa0VKOEJVeURzdFcz?=
 =?utf-8?B?bVY2b1FCMkFzREgvSnF5MU1QYkNVdDd4ZTBndkErUUphY0s5RkQ4S2t4NFEx?=
 =?utf-8?B?Z0Z2MjJiNEcrSnlUc2liL0Y5MUgrN2llR2U5TzBWWVI4d2VCcWNJME01K1Bl?=
 =?utf-8?B?bmZmUVhHdUZtc2twRVNOTmcrZzhkaGErb2F2ZjFFOFI2bEp1YjZXRFlQeURU?=
 =?utf-8?Q?OtvborxoIY0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dS9GQjBpemdwWHo3OHI5amJUS3pvaVovZVJ1V09GQVA0S281aHJRd1JUVUVv?=
 =?utf-8?B?R1Z3aDY0SWJhL1Q0bFM1MjJUTUtiWUJldEtMWXFxb01HNUFIN1BMNGlsZnZK?=
 =?utf-8?B?bFZnZXNxd3oxeE9PU1ZFRnNpNHJOcVFXZmJIODVER3dkSy9Sc09YVWxhOHBT?=
 =?utf-8?B?ZU90UVVldXZPaDlDMTdxYVMrMkhyNWlvWXNaMGpPZ0xFWjQ4anJ1MjNrSWo5?=
 =?utf-8?B?eThmaDh4OVk3M29ISWpvTnhnd0UrbU94RnNpOENnaXNjeDhrWVJBa0d6cmhW?=
 =?utf-8?B?K2QwZXVUdGFOdU05ZGs5ZmlIVi81SGFXTGpsM05nK0plaVRWZG4wMlVUQklM?=
 =?utf-8?B?Mmd6S0E2YzBMa3NxREsrVWJ5dlpBb3RQZlNxU0FTL0IxQ2UyWmM3aXp0VXR6?=
 =?utf-8?B?d003TFpwMXRMRXlXMFpYUTBBZE5CaXB3TFF5MXNHOXFVWW00dlRYeGRhQ1lm?=
 =?utf-8?B?Rnl2OU9Va2M5Q1NQT1hqQkl3U3VSNERacHlCZTBRdjZiWnNzNDY1VUh2SFhW?=
 =?utf-8?B?S3hra3FoejdSVVNmN092ME0ySEJuUnNHUDNCN3V5Rm9NWUQrNmsrbnlvV05X?=
 =?utf-8?B?T3NIRFZzZG9paFp4dUloVWNnK1lEMHBFcXplOHZIa25TbGxqTW5VbjZmU1pD?=
 =?utf-8?B?MFV5UGVtQWVwcjIvcWEvMWtCaURIR3JSVlovUlI1Z0YvRnhKd0lhdkNVdkJI?=
 =?utf-8?B?ZGJqYXNvT2htb01oQWdWbVRFQVc2VHBFbXpBa1JZMkFJWFRHUnlOOFBpYWFz?=
 =?utf-8?B?VUp4TGVCOXdjVmZaMkNQbjlYRzJ2MDVwRFZqU2hhUzI5VjNXV0MxQzUyakZP?=
 =?utf-8?B?bzNBaHA5dkxBblBleUd5WVhMTUszQ2xTTC9IKzNWL1Y1SUFKWWdJSXNUYmlB?=
 =?utf-8?B?Rk83d3Vnd2dXRlkxZlozNngyZEUrUWlRSGFrSHozcXQ5OFdtWEVpWFFBNkRS?=
 =?utf-8?B?dStmb0lwS3JFWGsrclBSSFNXUWFKbW1NMTRiN043M2JqQU9SSHQ0VjJXLzRq?=
 =?utf-8?B?Slh6dHRLMTJSNTRNdm1RZnNRMlY0TjBkVjNyL2x0WUJOSlY0WUxIRHp5TnE2?=
 =?utf-8?B?NkQza0E5aEZYVWNlZFo0ci8ySVRScDJkK2lIczQ5SFBnQk42MHl4SElCSXhk?=
 =?utf-8?B?ZzRGcENkbjZCemVLdUlKMURma3VVN1V1VGppVlgwREFvQll1QXg2UVF6Zkpk?=
 =?utf-8?B?NGFJZ3VxQmlLNHhzc3pmSUhUV0V5eE0rWnJjcEdOR3V2L1lVUVUxSEcvNVJR?=
 =?utf-8?B?VFRaK2hGbXdnODVkSDJBU2VOb0tQV2lFN1d0b0FSTTI5Q3oxSkoxblRZNmFo?=
 =?utf-8?B?YTMvb2Nvd0VNMEJGZUdaNWVVYWdJSlQ5R08vOU1vM1lDQUVORDZCWVZxSXJN?=
 =?utf-8?B?ZitNcVI1UFF0S2hnMjliRjVraGdZSE9SSW9lcUZ0U2ZvRTg1U1I1dWZjc2pt?=
 =?utf-8?B?OTZuUXFXRll3K1NCNXFhek1LUmdsbjNuWFFMNUR5Q1dzN0Jmb0cxcVFJM25Z?=
 =?utf-8?B?WCtiQUNOK3JnUnpPSlBmUEdmZk1pZVBqaEhJMDR1bnU4K3JoOU1TengrYnZF?=
 =?utf-8?B?amdlblhmVGV1aEpWNWdYZ0dqSGl2SVRBTnlOZERQL24xcnNQUEpEUitpNlZR?=
 =?utf-8?B?YTVZcWZZRnB0RHI4TTg1WU5tQS90d2daVlM1dGg0bkZKNnJYUHR2NldYY0JJ?=
 =?utf-8?B?ZUNxcUpZVkdsekVOZW1qOVB5MTl2dkUxR09JK3MrRmQrSExnakFnMmhMNFVM?=
 =?utf-8?B?eFFQMDZycXV5dUl0cjY3YWFCVUVJZDdNQkp6a256MHI5SUJDYjB3UG83TXpE?=
 =?utf-8?B?R3oyYnEydXpyVXZUeWZlQndyRmcvdzh2Zkx2dVA0SzZtRE5ySTRZUmhXQ2pL?=
 =?utf-8?B?Vmo5clVWek9ycXBFVk1HN2c1OGR4S3p2Z3h5ai9QU1B2RENzb01reUpVcG1S?=
 =?utf-8?B?c0RiTE0zNmhmYkl2aVA4MkVRT1g1UHJSYkVOTE5hd1NpRFJ5MktjVDBTaVJw?=
 =?utf-8?B?L21wNXc1VkFsVlBGb0tFQWNhZmlPMGEwWXBQZ1lhVmRkRFRPY2dOUkdYZkJs?=
 =?utf-8?B?YUU3QVpWYldNdzM5dlNScWdBSXYydVQrajc5NVREUjJwdGZMMEVxMTd6RFQ4?=
 =?utf-8?Q?xEAYU2ivoNHnc27mlfRiHUS8z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c39e1591-39df-4903-5766-08ddf9dbc340
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 13:27:22.6936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9ew6jP5VdpQmHB9Nc3dshQOpS4H7GRCp0J6Ec+J/BrVxguVAgXH+gRqjnhG/YLi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6274
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

On Mon, Sep 22, 2025 at 03:20:49PM +0200, Christian König wrote:

> At least on AMD GPUs when you want to have a DMA-buf for a specific
> part of the VFs resources then you ask the hypervisor driver
> managing the PF for that and not the VFIO driver.

Having a UAPI on the PF to give DMABUFs for arbitary VRAM seems
security exciting. I'd probably want to insist the calling process
prove to the PF driver that it also has access to the VF.

Having the VF create the DMABUF is one way to do that, but I imagine
there are other options.

But sure, if you can solve, or ignore, the security proof it makes a
lot more sense.

Jason
