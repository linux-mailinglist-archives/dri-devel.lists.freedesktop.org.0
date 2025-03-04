Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94CAA4E093
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C50E10E5E8;
	Tue,  4 Mar 2025 14:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fazd0Rxd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F21C10E5EC;
 Tue,  4 Mar 2025 14:20:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fV9ghaBKNZE9ythebxYv4PE74zjzeIhjSTf/CLMXH7s1hZdOeSa/YdtKUp0+a/90sn3GfZYpFdJ/qDXGaxxnKauMGyGUNoWb2ssN1xFQVa1mtd9NrhURaFDYCGAdWtjaq1HxmimxPaTAkPeQnEpgrv0AlxASE5gjFm0HJ8L1KG4dFin6uUqevK96jxFXMDTVH0tm8ArSUHQL/Cr6BzUo3uomXOLSjoWRzcJUAvUSe1nIvCrc5PF+cniJSXhOqJQ9C1q/TE1/F+SnztbZX0waMZYLUj1S0646pIgmlBZjup0Dml6rBS3QUs/P+uZE1zE8XgusH9e2D+/gkXvlvzxXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iyHDYLJLyn8bTBMJF1eV10qxvvZoPOieZ3vveJk11w=;
 b=ChGZ0sUzfsk/ky1feJX2o5/ISDKbmePPyX4jsPYieKvZe0/6yGunVjJditvZnih++bG49lY7+xXsST3jYAM/gDaMXQvVjI0BFaaJFq4N9hDb3g/iJmGavbR6JQfPEY2P1QoAv9pibPQTlSRxxpj6cO2gxQr27kl3HA3cL9kvJRXO2a1ZUlCL7v5uUHkiGvwTGI8aXTceb+zWePhNccMujQwXGC//TyNYCGyZlsRphqdyGVeVFoXYWm3VrE+LHsaNxr5QIAQNcIPFlRE77kms3CIbmRxpLbnWGi/YWc7JftbqPxp0LJsU4F0/eYZ8lci0HzBO0XZje2hTFnI8eYjC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iyHDYLJLyn8bTBMJF1eV10qxvvZoPOieZ3vveJk11w=;
 b=Fazd0RxdCwGWs4uwJB8/Jc+09BdvHMemJAgDfFzj5bSnYPpeXejW53gAaGyJHfPbLyW3GC3pPVkcVIUzKvfiF/if0V8McUydrl2kL93IqZ+Ajg/f7Z8+6Ldfh4XWPAlGm5gz3DU5d8UZM4bM+u7Mfu6Sf0U3iu4smCjf1wNk1qylMcH3FR/pGJfQM+Wjz0s7W89/jCsBlqF0MaWLKR1CbwITIQNpanPN/PebpYH4El8+CGgq7Cf07CpvL9ajVZLZRkGvQN1EOt/4/YdR8Axw1MlGB9V07lGoAiSr6ESqdf3z554GVagxcKVpa9XbKKmIWrwJbiWcVAcTbsmgT1RKgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by CH3PR12MB8281.namprd12.prod.outlook.com (2603:10b6:610:128::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 14:19:55 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 14:19:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Mar 2025 23:19:49 +0900
Message-Id: <D87JQ69QA6F0.184YR2BTJB0IT@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <corbet@lwn.net>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <ajanulgu@redhat.com>,
 <lyude@redhat.com>, <pstanner@redhat.com>, <zhiw@nvidia.com>,
 <cjia@nvidia.com>, <jhubbard@nvidia.com>, <bskeggs@nvidia.com>,
 <acurrid@nvidia.com>
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <mcgrof@kernel.org>, <russ.weight@linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v4 5/6] gpu: nova-core: add initial driver stub
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250226175552.29381-1-dakr@kernel.org>
 <20250226175552.29381-6-dakr@kernel.org>
In-Reply-To: <20250226175552.29381-6-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::18) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|CH3PR12MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: 87693dfa-753c-4fc5-1851-08dd5b27a18b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STZBYzVlOWlCaG1QRkg3c3ZlUGFkbDk2QkdFSldkZnBPSWVMcURCTHV3TjUw?=
 =?utf-8?B?SUJJQVVTQ2t0QUFmWU1majlCRTJOUnM4K0VQdEE1UlZIQXlOaGZUbDNRZkhm?=
 =?utf-8?B?OXpMcW45L3llaTN0ZUNOalJtc2Y1ZUlrQ1Jxenk2VGJaWHExZlNDQjg5TnNS?=
 =?utf-8?B?NGFwZmRrTDloUkJ3OGRWN1NCN2pMWmkzREZiYmxsM1hxWTF3QnVPMnczZG83?=
 =?utf-8?B?dnZRa1VhRjZsaDN2b2JPMHowOTJsWHk0N1F3eTNVaTZZUUFpdjQ0UzlQN1g4?=
 =?utf-8?B?ZXd3a2JGMVRHeWplTzhrT0RQM1lzVDR5czQ0OFZoaGd0ZDB2aTAwS2hmbkpm?=
 =?utf-8?B?RTVHdnFCZmFUdThtN1lTR3ZZc29FZ3VLcEIva1NwVE8rL3pmRmV5RS9DbVl6?=
 =?utf-8?B?RlRhY1RodTFTdUtUSXdyNTdTNG5vMm5aR1hkSTVhOE12ZkptcDh3cVNmSmUz?=
 =?utf-8?B?czV2MTJJWTkvcmM4ME1YOVE4aVBXeFM4dGlZTjI3MktKSWd1TFFTRVdtb2U4?=
 =?utf-8?B?MDdkeDh5cVBqRmc5UUlkbk56RS9EREFnOW1zci9yZGR3SUEwVHlZY1lqYTVx?=
 =?utf-8?B?Y3dvT3FQTTZDOHBJTHlvcWk3cmlhYnZnVHlnWC9iNDlpN2trcHJMOHVXOXh4?=
 =?utf-8?B?czBBYUlVN1BPUUs2ZkttV2FQaWlERUZKOEJxNG9pU2EyVDZxSXJzTVczUmhK?=
 =?utf-8?B?bExxN3ZHSWRhc1ZIam1pRTUxZDdiNmxWSWlFTzVERXpjbmVzejlETHNlRXJZ?=
 =?utf-8?B?a2VGbWYxdytTQ3NoV1NmdmRlNnpoQXdXdE0yTURQSlFlaTVLTGVKZ2JSZVdP?=
 =?utf-8?B?em51eUExVzl1clZIRUhhRlFTejlQUWZaMU1QY09hL0JwSENVS0Z1SDBPVndN?=
 =?utf-8?B?YzJhaHFldHFQZUJXV3hGczFQRkhjSGwwZUU1cUFKcUFvTUV5MFhza0JjS2lH?=
 =?utf-8?B?aWl5ZmxFT1VoWWVMWGZQWGFYTzA5TjlETnBFTzJiZ0NBeXJmeCtLRlhndXFM?=
 =?utf-8?B?UXlxMHJCZHBpNnJGejBzT3h0Mm5tZXg4dmlPeWJlOUIvM29wNlFRdmxNbm5l?=
 =?utf-8?B?Y1VMQldPd3VFVVRvRUsvaGd6YXBVYmJvRG5LQTRuTmRYRTVlV3NFZGZzRDBV?=
 =?utf-8?B?ckxHK0FJczNGVzRhd0g1M1R0SlFpQ2tLbjkxWUtNM1NaamU2U29PMHVNVXho?=
 =?utf-8?B?dWw3Z0NlTWZZckRRMTFLdXVUelNlU0NZOFpDdjR1dytrY2s0VUhsNGxmci9y?=
 =?utf-8?B?dDM4aG9VbVdwbG9heVVpY0ZkdTFlNG5RdE9WbWhHajZ0Q0tKY1M5NXJ6aGZD?=
 =?utf-8?B?b1NyWXR2UzVrUmJkYXdsbjExYmlxeWZPOGtVYWJhMkNyYlJyblBjQWdUNUZl?=
 =?utf-8?B?N2V3QzlyeWtnNkFjQkZrdzBTOTJuWWZZRTFzeE9VNFFFVWh0RmU3SHZKVldF?=
 =?utf-8?B?dFZwYWpvTjJMR1VZb1hzc1RJYTBqREhMMkxaRkZDd0FFU3IrQjRycVFoNFFv?=
 =?utf-8?B?dTQzNC9tcEpDNldlb0Q2Sm9rb1FCNVJhVDRheEJrQmpHY1ZxeW1TdVVvazk5?=
 =?utf-8?B?Q1h3M1gwd0Y5ZVFMNkVoOWIwRVI2M2E1TDFhcTU5cG9kS0RXMUgwYmJKdWR4?=
 =?utf-8?B?dXBDRUo2aHdUcEFXckhRb2NaQzFpZWZwNFNWWVhWWGttOUdjSTFIb2gxMzh2?=
 =?utf-8?B?R0RDa1U3T0liSVp2TFJLNC83b3U0QnAyeXVaemYyRCtjQlYra042YkRialNw?=
 =?utf-8?B?UG1hc0ZaWS94SXljam5NeGFhR0ltNzNSL2xDSGExYzJndzc1VktnWlVzb09V?=
 =?utf-8?B?dWxkZDN2WHlaTzZ1TmlEc1lrZkxhelM4bkdSTVhuK1pJaDRUaHl1dzRiR1VB?=
 =?utf-8?B?TW9lS1UwTm1KTjRnbmlrNjZLZlJtVU84R1E2bGtHRHBEUXJDTm44d1Bkc3ly?=
 =?utf-8?Q?W5+VsIMUr7o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnJpMnpVdXpXUUptcnE5VFNMYWp3WU9sVElScklERDdQbm1Mb0t4bFNISGp1?=
 =?utf-8?B?NEQvWU82YkJ6bnp3RXR2VjBMS1JBTkpSU093V3NWUkVYUEFlTkJiYi9YSWRh?=
 =?utf-8?B?eW1rSjdSMmd5ZlVKekt6dzNTdzM5cEc1cGRnQlVaUHZvZ2ZPdTJOamcwT3du?=
 =?utf-8?B?LzlKTXF1SHlGZmpVdjREbEtJZi9rKzZidW1oTmt5M1NuUkxOUGx3MXFWcmps?=
 =?utf-8?B?Z0pzT1lWOVViK1RmZG54QWRqMHk5eFFBdmd3cnNrTVVURy9IdGZzVjdrc240?=
 =?utf-8?B?WFM0bm1PQVN5Q0xGcWNoeXhNOHlNVTIwdmVBc3NidmFvUTA3RzZmb1NJb2tI?=
 =?utf-8?B?RVlJOElyY2ZHUzBBeFErbzhTQkcrVDJaMlhrOEFmVGlydS9LaTdKZzRYamhn?=
 =?utf-8?B?NDRsZWtsN0djd2hiUUhlQ0tyOWY3cndIUkQwQjFKbVBTYTc3dzZteUM1Nndk?=
 =?utf-8?B?VkwrdUhOOCs3ck4vL08rd0h6c1YvcmFlUTZvMDVLa2JDcXlLVmRuN1NTd1ov?=
 =?utf-8?B?U0JKMDZrVFp3QVpiV2tVSmRJUlJMMUlmRE5KWEliaFllYmQ5bE93UmlaQUpv?=
 =?utf-8?B?cmM0NkV0bURTU2dFWnlmdnJIcnRSUHZzMFFhUGdHMlRIRWs3VUtqWUx2aDhj?=
 =?utf-8?B?eXBBVzVibFQyRGVhbW5UTDVwVGNPeEVLYmFCNjBrZDZPK0NneWlSNy9FS0Jz?=
 =?utf-8?B?N2dJU1lyTklRb0NLbWVVaG1mbkoyMnE4eEdxRi81YlNuVytpYTBUVFY2R1RG?=
 =?utf-8?B?VDFkYjhlQm5ZeWc5bGxvYnZiR2ZWWCsrM214RWIvbTNYcnBWOWZXQTVwWVY2?=
 =?utf-8?B?Rk1BVEZhaUZYUkFpTXgraTZqZ3lENXlCaDRpa3QwZHhrQW9hMzBhQjlmYkpk?=
 =?utf-8?B?QTUvb0Z6M0xHMWZaSW5TQ2plVXROSjRNcWpac1Fyd2paVEtZeDBySXNuVExN?=
 =?utf-8?B?bVNJanRxR285a2tGYWh2aEtZdG44cE5EUWtabWkwc1dPWUtWVlJwYXVIVFF1?=
 =?utf-8?B?N0pDcjQ0ZjJvaFdMVTJxNHBicHIrRGc1c1R0aysxSGFMSkpUb1NXRW04VmFz?=
 =?utf-8?B?YVk1cjFjaEYzYlRWNjFDYUdkVWdJaE5pdXdML0t1NmowWjJpNCtjazZUbXNG?=
 =?utf-8?B?aGR0SmxkV2syOC9ESnBwc2d5K3JEa0Y4cGNIVFkvOWdhYWUyL0NNOEpRdnNp?=
 =?utf-8?B?Ym95U0RJSHVJdGtuL0t3YTJDVHpZYW01YVl5OGhaUVpwSWZsaXc1ZXAxalhY?=
 =?utf-8?B?SmJyNDdkWjRBUWUvdUVwRFl3dnlVM1lmekZOTUovcm9FcUFQbU5OYkVkNHg3?=
 =?utf-8?B?bEpCdUsrRU14ekRKS3M2dWNGOUtBcGhwVG4zZkExREx3RUo3MXl1WUFNWnd4?=
 =?utf-8?B?eFdkU3VUK1NMZVB4aURIaENHUFFvNERZNkhFYU41eE1kOGxVRGV6d3VjblJF?=
 =?utf-8?B?YkFWN1Z0MjMzQVBiQUNyM1R6WjBZd0NvVWRQK0JZdWg4dmh0Vnk3UWt1S1M3?=
 =?utf-8?B?SkVlTFl3ZHZFaHVvTS9EUThpMk9HbjF5eGU4enZyTS8rZmNWRVdaaXcydTVz?=
 =?utf-8?B?S1A5QWJxaW8xNCtkakxHSG5DYlFNSjdNeG1DVkNzcCsyM0lqR2dBdysveXJV?=
 =?utf-8?B?blgrY2RUeUVWK2grUjFZTWlzSS9kNFYzTHd1NTNBRUxjOW13b2xSTXMrTlVu?=
 =?utf-8?B?elp4ZUFHbTdEZjVvV2lURlZEYUc5Y3VKSUNBbWxwWk1MK1lYeUYxRkFhQ3lX?=
 =?utf-8?B?MnI0Nng0bGRyVkE3MzVYNDEvV1NCUDhaZU1WNjY4cVVHMzcyUjIyejFENzht?=
 =?utf-8?B?QmhQRFp4SUxvaEtzSGcxN1cwWDFuZ29oWFVzRXVwSmNhb2Juc2Z0T2xXZndw?=
 =?utf-8?B?eTk5Y3dzT0xvN2ZqVGJyUENUL3hiZm5Rb2ZBbGNnNDhFQUtTWUlPQ2dtN2pK?=
 =?utf-8?B?eFpHTTNVTWJXVU54MGhDVVd3Um5JY2pGaEpHd2VBeTBQQzBwT1NDSzJMVVhK?=
 =?utf-8?B?dFNYSUMvbGt1Y3BmWEEvUU1QTkQraUVnOW9DZklySEhIR01GUUxFK3ZwOUNG?=
 =?utf-8?B?WEMvY0R0R1pnRnorWDBEelY4SkZBeC9ITlNBMGwvSzg4ejZmN3o5ZjJxNWFH?=
 =?utf-8?B?alN2cCsxQjcyMnJkUHo5cVcyby9NT09BK0UyQXVkSlV1ck5UNWNmSTFtQ3VF?=
 =?utf-8?Q?grNy47P8glLimpI0taejTvHK3rZ/bvpH0UhHXDsEVqBJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87693dfa-753c-4fc5-1851-08dd5b27a18b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 14:19:54.7544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XM1ztgtJ8eIQg9dWtfIM+DHAfoJ7fzjo5/G/8jFIf+KdIk3QoNm/a77RgXezwI0sDm5S/xAwetJMJ1umZoIcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8281
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

Hi Danilo,

On Thu Feb 27, 2025 at 2:55 AM JST, Danilo Krummrich wrote:
> Add the initial nova-core driver stub.
>
> nova-core is intended to serve as a common base for nova-drm (the
> corresponding DRM driver) and the vGPU manager VFIO driver, serving as a
> hard- and firmware abstraction layer for GSP-based NVIDIA GPUs.
>
> The Nova project, including nova-core and nova-drm, in the long term,
> is intended to serve as the successor of Nouveau for all GSP-based GPUs.
>
> The motivation for both, starting a successor project for Nouveau and
> doing so using the Rust programming language, is documented in detail
> through a previous post on the mailing list [1], an LWN article [2] and a
> talk from LPC '24.
>
> In order to avoid the chicken and egg problem to require a user to
> upstream Rust abstractions, but at the same time require the Rust
> abstractions to implement the driver, nova-core kicks off as a driver
> stub and is subsequently developed upstream.
>
> Link: https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u=
 [1]
> Link: https://lwn.net/Articles/990736/ [2]
> Link: https://youtu.be/3Igmx28B3BQ?si=3DsBdSEer4tAPKGpOs [3]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  MAINTAINERS                        |  10 ++
>  drivers/gpu/Makefile               |   1 +
>  drivers/gpu/nova-core/Kconfig      |  14 ++
>  drivers/gpu/nova-core/Makefile     |   3 +
>  drivers/gpu/nova-core/driver.rs    |  47 ++++++
>  drivers/gpu/nova-core/firmware.rs  |  45 ++++++
>  drivers/gpu/nova-core/gpu.rs       | 225 +++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs |  19 +++
>  drivers/gpu/nova-core/regs.rs      |  55 +++++++
>  drivers/video/Kconfig              |   1 +
>  10 files changed, 420 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/Kconfig
>  create mode 100644 drivers/gpu/nova-core/Makefile
>  create mode 100644 drivers/gpu/nova-core/driver.rs
>  create mode 100644 drivers/gpu/nova-core/firmware.rs
>  create mode 100644 drivers/gpu/nova-core/gpu.rs
>  create mode 100644 drivers/gpu/nova-core/nova_core.rs
>  create mode 100644 drivers/gpu/nova-core/regs.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1b0cc181db74..3c8a3b61af38 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7438,6 +7438,16 @@ T:	git https://gitlab.freedesktop.org/drm/nouveau.=
git
>  F:	drivers/gpu/drm/nouveau/
>  F:	include/uapi/drm/nouveau_drm.h
> =20
> +CORE DRIVER FOR NVIDIA GPUS [RUST]
> +M:	Danilo Krummrich <dakr@kernel.org>
> +L:	nouveau@lists.freedesktop.org
> +S:	Supported
> +Q:	https://patchwork.freedesktop.org/project/nouveau/
> +B:	https://gitlab.freedesktop.org/drm/nova/-/issues
> +C:	irc://irc.oftc.net/nouveau
> +T:	git https://gitlab.freedesktop.org/drm/nova.git nova-next
> +F:	drivers/gpu/nova-core/
> +
>  DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
>  M:	Stefan Mavrodiev <stefan@olimex.com>
>  S:	Maintained
> diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> index 8997f0096545..36a54d456630 100644
> --- a/drivers/gpu/Makefile
> +++ b/drivers/gpu/Makefile
> @@ -5,3 +5,4 @@
>  obj-y			+=3D host1x/ drm/ vga/
>  obj-$(CONFIG_IMX_IPUV3_CORE)	+=3D ipu-v3/
>  obj-$(CONFIG_TRACE_GPU_MEM)		+=3D trace/
> +obj-$(CONFIG_NOVA_CORE)		+=3D nova-core/
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfi=
g
> new file mode 100644
> index 000000000000..ad0c06756516
> --- /dev/null
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -0,0 +1,14 @@
> +config NOVA_CORE
> +	tristate "Nova Core GPU driver"
> +	depends on PCI
> +	depends on RUST
> +	depends on RUST_FW_LOADER_ABSTRACTIONS
> +	default n
> +	help
> +	  Choose this if you want to build the Nova Core driver for Nvidia
> +	  GPUs based on the GPU System Processor (GSP). This is true for Turing
> +	  and later GPUs.
> +
> +	  This driver is work in progress and may not be functional.
> +
> +	  If M is selected, the module will be called nova_core.
> diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makef=
ile
> new file mode 100644
> index 000000000000..2d78c50126e1
> --- /dev/null
> +++ b/drivers/gpu/nova-core/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_NOVA_CORE) +=3D nova_core.o
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> new file mode 100644
> index 000000000000..63c19f140fbd
> --- /dev/null
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{bindings, c_str, pci, prelude::*};
> +
> +use crate::gpu::Gpu;
> +
> +#[pin_data]
> +pub(crate) struct NovaCore {
> +    #[pin]
> +    pub(crate) gpu: Gpu,
> +}
> +
> +const BAR0_SIZE: usize =3D 8;
> +pub(crate) type Bar0 =3D pci::Bar<BAR0_SIZE>;
> +
> +kernel::pci_device_table!(
> +    PCI_TABLE,
> +    MODULE_PCI_TABLE,
> +    <NovaCore as pci::Driver>::IdInfo,
> +    [(
> +        pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_NVIDIA, bindings:=
:PCI_ANY_ID as _),
> +        ()
> +    )]
> +);
> +
> +impl pci::Driver for NovaCore {
> +    type IdInfo =3D ();
> +    const ID_TABLE: pci::IdTable<Self::IdInfo> =3D &PCI_TABLE;
> +
> +    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin=
<KBox<Self>>> {
> +        dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
> +
> +        pdev.enable_device_mem()?;
> +        pdev.set_master();
> +
> +        let bar =3D pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova=
-core/bar0"))?;
> +
> +        let this =3D KBox::pin_init(
> +            try_pin_init!(Self {
> +                gpu <- Gpu::new(pdev, bar)?,
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        Ok(this)
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> new file mode 100644
> index 000000000000..a94caa7cf8d3
> --- /dev/null
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use crate::gpu;
> +use kernel::firmware;
> +
> +pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilde=
r<N>);
> +
> +impl<const N: usize> ModInfoBuilder<N> {
> +    const fn make_entry_file(self, chipset: &[u8], fw: &[u8]) -> Self {
> +        let version =3D b"535.113.01";
> +
> +        ModInfoBuilder(
> +            self.0
> +                .prepare()
> +                .push(b"nvidia/")
> +                .push(chipset)
> +                .push(b"/gsp/")
> +                .push(fw)
> +                .push(b"-")
> +                .push(version)
> +                .push(b".bin"),
> +        )
> +    }
> +
> +    const fn make_entry_chipset(self, chipset: &[u8]) -> Self {
> +        self.make_entry_file(chipset, b"booter_load")
> +            .make_entry_file(chipset, b"booter_unload")
> +            .make_entry_file(chipset, b"bootloader")
> +            .make_entry_file(chipset, b"gsp")
> +    }
> +
> +    pub(crate) const fn create(
> +        module_name: &'static kernel::str::CStr,
> +    ) -> firmware::ModInfoBuilder<N> {
> +        let mut this =3D Self(firmware::ModInfoBuilder::new(module_name)=
);
> +        let mut i =3D 0;
> +
> +        while i < gpu::Chipset::NAMES.len() {
> +            this =3D this.make_entry_chipset(gpu::Chipset::NAMES[i].as_b=
ytes());
> +            i +=3D 1;
> +        }
> +
> +        this.0
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> new file mode 100644
> index 000000000000..7693a5df0dc1
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -0,0 +1,225 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{
> +    device, devres::Devres, error::code::*, firmware, fmt, pci, prelude:=
:*, str::BStr, str::CString,
> +};
> +
> +use crate::driver::Bar0;
> +use crate::regs;
> +use core::fmt;
> +
> +const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
> +    let src =3D s.as_bytes();
> +    let mut dst =3D [0; N];
> +    let mut i =3D 0;
> +
> +    while i < src.len() && i < N {
> +        dst[i] =3D (src[i] as char).to_ascii_lowercase() as u8;
> +        i +=3D 1;
> +    }
> +
> +    dst
> +}
> +
> +macro_rules! define_chipset {
> +    ({ $($variant:ident =3D $value:expr),* $(,)* }) =3D>
> +    {
> +        /// Enum representation of the GPU chipset.
> +        #[derive(fmt::Debug)]
> +        pub(crate) enum Chipset {
> +            $($variant =3D $value),*,
> +        }
> +
> +        impl Chipset {
> +            pub(crate) const ALL: &'static [Chipset] =3D &[
> +                $( Chipset::$variant, )*
> +            ];
> +
> +            pub(crate) const NAMES: [&BStr; Self::ALL.len()] =3D [
> +                $( BStr::from_bytes(
> +                        to_lowercase_bytes::<{ stringify!($variant).len(=
) }>(
> +                            stringify!($variant)
> +                        ).as_slice()
> +                ), )*
> +            ];
> +        }
> +    }
> +}
> +
> +define_chipset!({
> +    // Turing
> +    TU102 =3D 0x162,
> +    TU104 =3D 0x164,
> +    TU106 =3D 0x166,
> +    TU117 =3D 0x167,
> +    TU116 =3D 0x168,
> +    // Ampere
> +    GA102 =3D 0x172,
> +    GA103 =3D 0x173,
> +    GA104 =3D 0x174,
> +    GA106 =3D 0x176,
> +    GA107 =3D 0x177,
> +    // Ada
> +    AD102 =3D 0x192,
> +    AD103 =3D 0x193,
> +    AD104 =3D 0x194,
> +    AD106 =3D 0x196,
> +    AD107 =3D 0x197,
> +});
> +
> +impl Chipset {
> +    pub(crate) fn arch(&self) -> Architecture {
> +        match self {
> +            Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self=
::TU116 =3D> {
> +                Architecture::Turing
> +            }
> +            Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self=
::GA107 =3D> {
> +                Architecture::Ampere
> +            }
> +            Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self=
::AD107 =3D> {
> +                Architecture::Ada
> +            }
> +        }
> +    }
> +}
> +
> +// TODO
> +//
> +// The resulting strings are used to generate firmware paths, hence the
> +// generated strings have to be stable.
> +//
> +// Hence, replace with something like strum_macros derive(Display).
> +//
> +// For now, redirect to fmt::Debug for convenience.
> +impl fmt::Display for Chipset {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        write!(f, "{:?}", self)
> +    }
> +}
> +
> +// TODO replace with something like derive(FromPrimitive)
> +impl TryFrom<u32> for Chipset {
> +    type Error =3D kernel::error::Error;
> +
> +    fn try_from(value: u32) -> Result<Self, Self::Error> {
> +        match value {
> +            0x162 =3D> Ok(Chipset::TU102),
> +            0x164 =3D> Ok(Chipset::TU104),
> +            0x166 =3D> Ok(Chipset::TU106),
> +            0x167 =3D> Ok(Chipset::TU117),
> +            0x168 =3D> Ok(Chipset::TU116),
> +            0x172 =3D> Ok(Chipset::GA102),
> +            0x173 =3D> Ok(Chipset::GA103),
> +            0x174 =3D> Ok(Chipset::GA104),
> +            0x176 =3D> Ok(Chipset::GA106),
> +            0x177 =3D> Ok(Chipset::GA107),
> +            0x192 =3D> Ok(Chipset::AD102),
> +            0x193 =3D> Ok(Chipset::AD103),
> +            0x194 =3D> Ok(Chipset::AD104),
> +            0x196 =3D> Ok(Chipset::AD106),
> +            0x197 =3D> Ok(Chipset::AD107),
> +            _ =3D> Err(ENODEV),
> +        }
> +    }
> +}

I know this is probably temporary anyway, but since there is a macro now yo=
u can simplify this implementation by making part of it:

		impl TryFrom<u32> for Chipset {
				type Error =3D kernel::error::Error;

				fn try_from(value: u32) -> Result<Self, Self::Error> {
						match value {
								$( $value =3D> Ok(Chipset::$variant), )*
								_ =3D> Err(ENODEV),
						}
				}
		}

