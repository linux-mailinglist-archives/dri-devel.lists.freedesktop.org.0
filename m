Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEoqOkB9pWm6CAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:06:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03B1D8124
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C6910E4B1;
	Mon,  2 Mar 2026 12:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AzwX26nW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013037.outbound.protection.outlook.com
 [40.107.201.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DF510E0EE;
 Mon,  2 Mar 2026 12:06:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGLbJYDYBGc46RCMp47Vd3pDUXoErxtewm+wAeygw4iWxyMNaWp7DJ+lAG8HH8j/PcurnUN97XQurRJeAx4qi1eCueKT92+cg2seE9ApJJ9v5m2byAkO/QRjmjdof8PmReiMF/K5AWEbbd3R3inqFKuk13SPO5y+L4/8uPMiDu5fvPPUg8DMz53YL/5golMI8VsdBmag9LKqpZj3mCyzqBhOxlrj+Ay/UN6S7iBGO+HDfd9OZLbANGC4heTgcJdsops+kAkwWlxEVTkKx0K3zMBBxnRXYRxlHxIbAXDsBQoSbkzPfTlmP6ExjNSyvqRYaTF5zaB8KZ7ivlTLlDSbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wDG2F4FP4t9vr5XybLEbUSjzlw5hd5DwJRQ/AONEAI=;
 b=N0OU0COouT1Env+O+kmb8XqTEOjcDSnMUCn1+AXUUId+qAhe+Syxfyptk/65beo2/yyBSQwbjM/S8zClnmTyjyGeO/Lk9+AxY1HsU8sN32eVc4ftmXQlMYx/8CV5NIZ3ov0czcEpsmE3cftpYAoAd92ItRgr+AaVVG7s0iXYTYAcZpdQ0WBbuhSIGq3A2A3ZjRZbf6l5fs2tYesKBV0HCLUFF7xelM8mQ52NoMt9F44UFXjVTpNe7BjQRbBA7F6zdvbox0kaBGe366NwLrYmy/wfbmxaHLjdY2IkXzBTCdZ1uqr75t5KST3lT9vwv47qpBSM6ErCvy6HZ1CSjNiEtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wDG2F4FP4t9vr5XybLEbUSjzlw5hd5DwJRQ/AONEAI=;
 b=AzwX26nW1Lv+ND4tYpbLMpi++q6pYCMlbj9bBOlLhH+E44Fe1NuPyckYrJkvxwQcoywydo5K8L64F8NWomkJgokS/N93z5QTfVuKTQyWgWhBh1VQzWc1zrX6L7VszH1sNHtQODQ7OoGRKKxifwOqeQ8ffJG8HUm5w9eMpVXMVe6/xpv45n8Di9YG/nSdFrHtrhtptDZJciqtbO4kFOF58ZgFSnHPZBX1xr2HINWxQP/D7FBRLg7YGwUi/qHB8MsGozIKCEDC/L4VoWw06Mn0zKgzze46ok74OrX0XvyCO/SVNal0ayQXRjWKDDuULahkUFPYWguuZL63JRY7OQfV9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6083.namprd12.prod.outlook.com (2603:10b6:930:29::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 12:04:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 12:04:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 21:04:07 +0900
Message-Id: <DGSA61C5BMSB.1RFPQAR3NFHKB@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Dave Airlie" <airlied@redhat.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, <alexeyi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <joel@joelfernandes.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v8 25/25] gpu: nova-core: mm: Add PRAMIN aperture
 self-tests
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
 <20260224225323.3312204-26-joelagnelf@nvidia.com>
In-Reply-To: <20260224225323.3312204-26-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0107.jpnprd01.prod.outlook.com
 (2603:1096:405:378::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: dc491496-bbaf-4e2e-1bf3-08de7853d093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: sYDAsPoXH5ct2j9EDLjrxM8W8joJSHap7oaidFDfTTOOTKXnIlo1oDMqZQbxulhwH4QlqhWbSKlcgzdrYVnM/Jojp3Bm3lYAWHVvuZ2rhRxJQ/WqVesZ1FIQ1z2Srr17I3i/S1ThKYj5Y9BIC8B0Mg/yg5DJ/XjWjqosRqFEpwAui8Lls3foBG3T0YS8+3PAF6NQOoDVi3XeQCwVHLXTftL0MvyPEVesaq4OwlpHCPBLpZW188OD3makArcp9r3doeG+sF5PFSeXCq5LmJiS49Nwf7N9D8Lxp1q0motAJ344tEKFTecqttsOA2lQHaZMNfZzpgCE0CYEUMOymCG1F2TbBhsU3btZl2Ebz2qBE16niHqY0lxUxNQ/1S+x3blNgOgqCLtN+sEvm2gKS30kLhhFosd9eAeqyAQ1J8i87yk5D5Yl4ExWpCd/ZnyGF+wavnsQl+z6jKNf9MQr6OzufSH1jd+MtcgnAum0K1n1TAGA3j7GJNYeZCIoHH8roEY+qn91ILnUts6sc8FUuMyBnNUP/GMQ8puSf3EeLwN/jHEq91+S+oV6sZPcizAzj/KgPIkRGjj70O7cD0A4GsXkv0mqgqVbjj9eCjP8YkxS/bGUmpbmG8EFzP6tvGTkAjn27A38X73aOLeE0gC3cJu4Y6bUOnNd70+q0JxmKy45yBRp8MYaFQ10AGwxNQhSkdV8SYueVD416zkPjN1/2anqFq0s2gw/WezM00GtprqYepA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXlBeE43WXNGUHVuZ24xdWpKRW5QU3Mxc3dxTW5WYzRYc21EbWh0cVNUeXdG?=
 =?utf-8?B?RjF2NTYzTGNVUU5ZWjVmdnRNWkp2YStKdlB0OTFYSUwzQ0ZWU1BkdWV4d2lW?=
 =?utf-8?B?Smg4dnVrY3NuOVk2dGhBVlp0WWtaV0lXb1ZpK1liUWttUnEyM2FoSHJxdXhD?=
 =?utf-8?B?Vk5Wd1pGZ3hzS05pV0d3UHFjS25HLzB1L3ZJZEF5SWZJaGZpR3A2OGVEcUkw?=
 =?utf-8?B?czR4NmFxcnMwNndLOTVPdm9VUDNubHNaQlAvWkprSFAzNXlaUDlhOVFKdlVk?=
 =?utf-8?B?UFlWQVVaZ3VMZVlTaEdUYTR4OFlJbXBrQ1FiMEpKbzJ2Tk1wM1I5bVF5TVZO?=
 =?utf-8?B?cjZSWVllOHpQanN0Z3VnQ01WNnlGWHZPTmNpTGRsbXAwelZKRkd6MkpNTXEw?=
 =?utf-8?B?UUQwTVJiYlF1THVQLy81N3dJbGV3MzNtVlQ4VHRuYVM3OHhjSS9nTjFWZWtZ?=
 =?utf-8?B?cHJjcUJpNWxteEN6dnZVd2xncjNvUlVLVDJxS1NDRHdhOHNLa0s4OXcyTHkr?=
 =?utf-8?B?aktJd3dKZHB4QVo5dzU0dlkvNGtheHJNY1FJTnpMWklGNC9TZmVmODZPb1ox?=
 =?utf-8?B?aFd3Vmd6K2Q5UFpUd25KZEVxcHdnQ2FqVzZMdTh3UUp0OFFEc2dUK3RibDc1?=
 =?utf-8?B?b0VqWEUyL2x3YlRHTTRzL0ZoYU85MTZnOGlTZVdWdG9sNVcvSHI2aFcrRGxH?=
 =?utf-8?B?SXdYTW00bGtWVWxwMUY3NDlmTTdFRDFsTUM3UkVScEl1V2N3Yzdha3JHajBM?=
 =?utf-8?B?ekJRZWdEejU4M2xQNE9VVnF4TisvZlBTR09GZCtnTGhMUi9PZDdxazdUTmRQ?=
 =?utf-8?B?Mm8rSHpsSjJRaGNueXc4OXFLK3J2eHlUNFc5ZENKcXlDMTlRak1pN1NVOGZm?=
 =?utf-8?B?aU4vN0hOWTZuSXN1YVh5Nnhhb3VISmJyR0RzTVNTRVpPZEJNRkZGb0QzKzZu?=
 =?utf-8?B?cHRuOGlhS3gyMFJrYi9HL215Y250R0MwVlh2dE9STXZvcTBVYTV0SnRma0t2?=
 =?utf-8?B?LzVTR01zaGZvZlM3Z0Z4T0JlZ3JoTmhrYi9VcW5qRnYxMWxSTDM4cVYrcFpO?=
 =?utf-8?B?Ymord2xMbGdKeG9MVE5FM1NWMkdOcnpVaE50L3dlUzlXb0V0RTc3cGJoUC9p?=
 =?utf-8?B?Z3VvVkF6NHlYWkVEay80ZnFGU3Rubi8yM0NZRk9GL0JHaHhBeE9QVDhlRnZ5?=
 =?utf-8?B?RVZRUnlrQURDVE5wM2RjY1JVY3FoNytIUmxSaG5JTjFCNGpmTEVzOEF5SC95?=
 =?utf-8?B?OUY3ZTFwaVFVNitzTm5QK0NrWDdZVkZlMGZFTTZ4WEU4NVJKelE5NjVSZzln?=
 =?utf-8?B?SUlsTXpyVVo5QUx4VU9UaVdVeHJxaGwxM3R5OWw1eGE2aEJmeHNsUmhZbWFi?=
 =?utf-8?B?cTJRYVRPY090MTZ4RnpHQUhId2VDcmt0VXRGaEhyYkMxZnkrckR5K2Z2c1B6?=
 =?utf-8?B?cmFjdkU1N1cwQVRsSnBnWE9VcFRQYnZ4Q2FncEhxT3UrNWRwajJlYk4xdlFt?=
 =?utf-8?B?U0V2R09PVUJaR3FOLzRvMVJqTVRIQktZSVNsNlhNMnpRODRtbUV3OW5sNTcw?=
 =?utf-8?B?YTRRUnJZK2ZnclJBcVlIdnpKQisyWkxzeTFLRmxVZml3UXFwbk5VZGtwaDJE?=
 =?utf-8?B?UElNbE5sa2k0UitTQWgvS3BYOUk4cUtreVZubDFVcWs3VUhZZFp5ZnlOVDVL?=
 =?utf-8?B?QzAxbWxjYTFTVko5K05GRDBZNi9Qd3lkRU14RDc5VmJuRXRTV2RtZEh3SCto?=
 =?utf-8?B?WmlOQXZ5VEY0ZkNxS1owOVlpWlVMcmJFNStvaVRWQUN5OTJ6YkovT0dmZkVT?=
 =?utf-8?B?Y0Q5VWpjVG0zV2Yrb1NTOXNlNmhpaE93UUZveWs4TSs0a1lHU2FnZi9RSnRL?=
 =?utf-8?B?bW1nd2xucHFJUUVJMFBXL1JxelhsZjlSMDVnQUVQT1o1aHV6SGJiRmNPUHN3?=
 =?utf-8?B?aDgzMm9oOEY0aWgwaXdwYngwVC9ISklyKzZmanAwSWxoN3NaaERmTzN3MktH?=
 =?utf-8?B?SEgxUU1Da0lBaC96TFArTjFvak9OdnBGb1VBL0owMVBXOGhodEFFUGtoZWtF?=
 =?utf-8?B?SVJENzVyMEhOdmVhNnM0cFd3b2RUR0EvSlVabm1iY2w3Q2h0QUNpQlNVdmQz?=
 =?utf-8?B?Uk8yTGxrbHZOOUhnNlNKTDFwTWxqc21pelR6UU03WTY1c3c3dEgrcjZYM21C?=
 =?utf-8?B?RFljV3YwWHRBZ1lBYW1DTTBFYWNWM2lKTG1GRHdycTVlRFB1dGZacG5kS1Jm?=
 =?utf-8?B?OTQ3Tk1TTjFvbG00Uk56OU1mYnVJejQ4K0RJdUJkMlhiYURGbFNLSTZvckNa?=
 =?utf-8?B?WnltNnlDclNVRDhDQzFGalRxLzh5U0NtdUlTdWVDQ3V6VnhnYVFiOS9SdDdN?=
 =?utf-8?Q?HDZalEDhcJdth5dcb2WVKkU+ikadneMJjq0rlx+LjyPWD?=
X-MS-Exchange-AntiSpam-MessageData-1: SjdiZ2RI8LSbrg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc491496-bbaf-4e2e-1bf3-08de7853d093
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 12:04:11.1767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXOPW8KV7fAX/JQTcXSYQGlng5gCuD80ASG/okzzgkOOpPpOGfXRbuxlFSQ+zD7V5Xl00Mq9cfLXg3oYWUweVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6083
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,gmail.com,weathered-steel.dev,joelfernandes.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8E03B1D8124
X-Rspamd-Action: no action

On Wed Feb 25, 2026 at 7:53 AM JST, Joel Fernandes wrote:
<snip>
> diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/m=
m/pramin.rs
> index 04b652d3ee4f..30b1dba0c305 100644
> --- a/drivers/gpu/nova-core/mm/pramin.rs
> +++ b/drivers/gpu/nova-core/mm/pramin.rs
> @@ -290,3 +290,164 @@ fn drop(&mut self) {
>          // MutexGuard drops automatically, releasing the lock.
>      }
>  }
> +
> +/// Run PRAMIN self-tests during boot if self-tests are enabled.
> +#[cfg(CONFIG_NOVA_MM_SELFTESTS)]
> +pub(crate) fn run_self_test(
> +    dev: &kernel::device::Device,
> +    bar: Arc<Devres<Bar0>>,
> +    mmu_version: super::pagetable::MmuVersion,
> +) -> Result {
> +    use super::pagetable::MmuVersion;
> +
> +    // PRAMIN support is only for MMU v2 for now (Turing/Ampere/Ada).
> +    if mmu_version !=3D MmuVersion::V2 {

Why is that? I thought PRAMIN was also working on Hopper+. Isn't it
orthogonal to the kind of MMU used?

> +        dev_info!(
> +            dev,
> +            "PRAMIN: Skipping self-tests for MMU {:?} (only V2 supported=
)\n",
> +            mmu_version
> +        );
> +        return Ok(());
> +    }
> +
> +    dev_info!(dev, "PRAMIN: Starting self-test...\n");
> +
> +    let pramin =3D Arc::pin_init(Pramin::new(bar)?, GFP_KERNEL)?;
> +    let mut win =3D pramin.window()?;
> +
> +    // Use offset 0x1000 as test area.
> +    let base: usize =3D 0x1000;
> +
> +    // Test 1: Read/write at byte-aligned locations.

Let's split each test into its own function for readability.

