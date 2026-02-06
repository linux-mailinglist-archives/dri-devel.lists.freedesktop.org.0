Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBwtEXiYhWmUDwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 08:30:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4418FAFAF
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 08:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC1A10E3A8;
	Fri,  6 Feb 2026 07:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hE9wGL5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013053.outbound.protection.outlook.com
 [40.93.201.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE9410E3A8;
 Fri,  6 Feb 2026 07:29:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntbVqXnsiiCKyk66Hk1pIGCm5Y92Z25wr/xZhllrR2E139it57jy3rnyE/UzeadOugL3oFfvX2J42Gv2meYNi86dUUooZNhdxZkP0p02pY0TE6Z8cRqdO7NMMkbSLLsc8vnF9rSq0d3uNTcyiuGQj7dd002qG+WpxIATOPU4XS2p9AdEVUCYFd69GsJ7+X/xcw4MGncJ8iB4T6jS8Y4eZ/MQ+4AzESMbwSIUdb2dXffXrASZXLYGkJvEA4+RpJdk99Lui53aVKY8iD+WoK5j2J5c5ixfaKaDUJc+lKowu9MDqwbflT1+uKHRhlZvHhjO2gKkxRfI7BHcEZag+bA7jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7ayB4b3wYijqsOLofkroOVXI+swL5upV7LN/deRjsA=;
 b=dp3T0EXK8N/GYojb1T4F8cdE9GoDXB/OzxMNYfGuIi/m4lJwYZVW+XuMy4cQpP+dZkYZxP2feq1/ptry7cZkx30b0jw37iXinMhx48+zw/Q9F+l8cOy8FlEiXtpTQR3gKIdXUOTNmHlqHWFUh1eqd3fcT8NDVZW642+SJokbm01sXbxPHOBgddvZ5TK53yeDrt/Q3pl/DCDbsaTqw41Mnpii/t4xR3FuVESex04fqcqcBJnuA/h2t4aL0fQyUwFgtGKFGbCivX3Es073xDO1095zZha/DbUE3dDT4tJ1okdYBauXRIoReyIhdsKT1RJIuGVCe8fjZ+252rEuZFEZHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7ayB4b3wYijqsOLofkroOVXI+swL5upV7LN/deRjsA=;
 b=hE9wGL5HSAFxFnVawfj1Ng9dE1UyEMU03f6vY+DZfnJVmjhe6Q3C8XL9AD0IglSXPpDolo1AnHJZB0pIt2FKubpfZwjWsXUg88QuDweqDA+l+VZsZiUotxXhq0f//RnKeu+IkSSrlgWCugmPAMF2Yt72RDzpH2iPCpmhTXRr5SrKDn5FuE6sZCZhGPqyJzweEztBoK6wgPdnR8bFFbxvxXnIxK/h1ezyOxJs1r4YRvxUqg4wuIzF3Kr1K0MBTQwOvfA0sMon6l6BnPDi/bGn1Uq5u0MeBP9pkLmiUGAhpKg+PDkmoVUClXm40CMOnVmQLaUNce+8m/YldQDm0WMokQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PPF934D73F2C.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::61a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Fri, 6 Feb
 2026 07:29:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 07:29:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 16:29:46 +0900
Message-Id: <DG7PAWIOZYWA.1S53TGBSPWGVW@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/5] gpu: nova-core: gsp: fix command queue ring
 buffer bugs
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
In-Reply-To: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
X-ClientProxiedBy: TY4P286CA0084.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PPF934D73F2C:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f2c9c0-d668-4ae6-2427-08de6551836d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWZDV3FKRXlEeU5xMU1oRXZqN0dVcE51ZEZWS3gvMCt6VGQyZnhidEF5bXRG?=
 =?utf-8?B?Q2M3NVUzZmJ5TnVUNFRUNmRuN0JvZ0liQ1F3ZFA0ZC9EZlc1c3ZrSy82ckFR?=
 =?utf-8?B?ZlNhd0dhVDZTSlNtK1VEOXcyZllUVkpVZHVoUkdQbDBkdjVCU1dsNHY5V2cw?=
 =?utf-8?B?UTFEVlpHSGtvSnRZYkRaOHVPZkovR25TTTA1ZGRZMUJjaVU0UVJremJHOER4?=
 =?utf-8?B?NnR2MGtseFc4eFEyaG9CQk9pNlF5UllBY0NMYmprQ3Y0dzhvSzhXMmNMcDZY?=
 =?utf-8?B?L1R1dkt2VFhjVktXTTIxazBVeXByMUFDSnlnYTVjSTRlOTBSMUFCdmpDcGxm?=
 =?utf-8?B?SjlJNTNpV0o5eFpIQitaakthekNKZHk3ZWxnRk9xU3lUVFF4NnlZeEtjanlD?=
 =?utf-8?B?WWYweGx6QkJ3bnhjdnRWZndJWFVTenZRdzAvOVRUS1NLbGJqbWFXV1I1TzhX?=
 =?utf-8?B?Y2swM05Kb3VmWXU5aEVaRUZra3VKZFJMUFo1SmhDeEVjdE5ZVmpQRW9ZN2hH?=
 =?utf-8?B?K1YreVJSSUpXbGxhS0NTSmRhSUZhMnI3TjhJMlBtb0xuY2xiUS9QZzczRUdH?=
 =?utf-8?B?am9aUXVYU1FBTDYvSmtuaHZMYW1iS1c2OEg0Y1Y4T3FGc2RiZm1rci9LWXBM?=
 =?utf-8?B?a1M0UVF2clNua3JHa0dHUVpGcFJFakFEWXJ1UUg1RUs0ZklYT2RYWGIwREdx?=
 =?utf-8?B?MXpnd1dCT0VGbzhxR096alJiaEk3eTZGbEpRcWhXbXZRblFDT0NpbFlUazBo?=
 =?utf-8?B?Tks3akpSTzV2Skl4blZrd1E2RFhNVkNYVzErcTdqZGZZYlRtQ3Z2WTFaVFZR?=
 =?utf-8?B?a05mM3RYK3VLQUE3WmpYMVR6WmFHZGcrUHprbjZJcHZtUEp3dHRQVERaNDI5?=
 =?utf-8?B?a1hZWGNYc05pWm5jZTlrZXZWSUlac2J5M29HbGFlY2JoZThCMGtVN3lGY2Rj?=
 =?utf-8?B?QUVsbjZjd3NMOGZWQ2l5djFWMU9tR0NvNEFURnJVVzdFTG1aWm1VV2hiaDFO?=
 =?utf-8?B?LzE3VU9zcnc5MFpCM0tUQ1dsODlTMitSRVhXNHJ0MWgxTllZRWswZGt0NGVX?=
 =?utf-8?B?ODBFQlluOUJBMjJqdEptNTRscGZkQ3pYWnVjbm0xdm9FMnlsazM0eURhUmtB?=
 =?utf-8?B?aUxUMkErdGh5a09ScUxycE9pa3NQaFlKZ2YxZk15aXFpc0tURHNTL3doY1Vj?=
 =?utf-8?B?b3NUSTduaUlNL3J6TWQ2dm5lMTd1eS9KQ3l2WFAxcFpIalVqMXBaT1JuTlZ6?=
 =?utf-8?B?bnJyZVJ1SHFWZ2Vjb3B0R2t1NGRrTTFTd09lUEk4aGV3Y0Z5ZUN3N3oyS1RR?=
 =?utf-8?B?OURUajdCNnNDWVBPb0FBOWhTNGUvVTg2V0xrbWRKM0Fra1NDeW9UQW9iekpp?=
 =?utf-8?B?MTMwSWw0Vml1eE4rb2FCT0ZITE1ZS1RBOUs2Z0lDZXBvbXlJbjNEZ0NITDBv?=
 =?utf-8?B?VnE5UkVPSUs0eTdGRlBxcFN0TUt4M2dJaTdhTUx2RVk4SFNQRlZiRmJnRGlX?=
 =?utf-8?B?a201Y1hhdUEwL0FqYVM4OXdwT2h2T0V5OWdxSmo1TFVXWHU2WCtnS3pOTW9l?=
 =?utf-8?B?L1Q4a2hXblBFRVB0b1pSUDAxdHk1aUl2WVVOVnd3NWdiU1ZybWExL1MzT2h2?=
 =?utf-8?B?N2VXU1NZdEdlMit6M0w2RjdvOFVoYUtKcGM2aHBqTGlBU0lsbWl2WWhyUVZr?=
 =?utf-8?B?bjMxTWR5bWVOUkdpa0t2S0Vsa3hOYmd4Sy9Vd255VkhKSjlZMGVKRHIwSEto?=
 =?utf-8?B?YTQ0QWxpd1h1VTBOcHByR0pxVWlOK2RzWnpqTTUzREcvazRvSkFiWkpjbER0?=
 =?utf-8?B?ZnVMeDhOd2l1ZTJyRDZaNmpCNDMyWDJBay9PN0d0NDVHWkJBeU1zUlgrSFF0?=
 =?utf-8?B?TVRiRGNHOW5MbForZXJXeklmRnZ5Y0IvWDAyK2lqK1dTSTgzYVN0RlY3WW5P?=
 =?utf-8?B?N3NTYzU2ZUhZVXlMWmxDdU9UMXlMdTBONDE0SWorZ0JWZm53RVRVZlpDUEZt?=
 =?utf-8?B?enl2Sm9pVGFuZk5aZlRKaWlQamJ1Mkl5eEZ2dGVJRFlWck5pbGdLOGJQRkh6?=
 =?utf-8?B?NHZFSWJKZk9Uelk4YzlCREp6N083SGZEVzk1SHBiNS82eGo1ZzZZcXdMNmJ5?=
 =?utf-8?Q?HFTc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eENmZ2FRZnhiYlR2eXF1di9oL3ptS1BMUVhDODB4ZzE3L0xoMmxhTlcxRXNQ?=
 =?utf-8?B?bG41dm80K3hiN3Jtb2FDbW1malFyTHowYm9mcWMzcnh6eWQ5cHFmUHUxRHZj?=
 =?utf-8?B?S2x0Nkw2Vjg0VEdyRTVTUTgweFhmRStLWW9NbzI4Z0JHNGsxZHk5Z0xLVUln?=
 =?utf-8?B?dURzT0dsZXVNMy9vdzcyb2NKaTc5dHpvOE1PTm5ONFh0dkoweXkyM015MUR6?=
 =?utf-8?B?NEh4UFZWMGowUTBJejRpVGVDdnV6K2NxVTh3V1lYTENSQUV0d1Frb1Fkc3Mw?=
 =?utf-8?B?RUJVTDZDMG5ubjMzVXIvaTUzT3hwR0liUGFPSS9mTDRTQ0srR05vci9Edmxp?=
 =?utf-8?B?dWZUdVJGZFFsT3FCL2VjMVI4eE5QMjBHV1ZXblVRandhREs3M3Y3ekJ2dHJY?=
 =?utf-8?B?VDNubDRpSmpBSkFqMUVoZWpMeTNPTDdlbmswOS9pdnY2VWpLd0djWnlWclB3?=
 =?utf-8?B?d2FlYWVGZWYrZVkzSWxKNHpMZFcrQlltVTQ1a3Bub0VPQlpYUXRjMnJCQUV6?=
 =?utf-8?B?QUtOVHB4TVJOaFpGR0pWRWNubFJBM3MrQWZibk5XaDZnVHUwa0tzNFpMVGFW?=
 =?utf-8?B?c2FsamRvQk12SHJBenNMaDEvdXF3Q3RQbTNST1UraGNVY1ZnNExFbDlXenpz?=
 =?utf-8?B?SkFCQ1BzVGZ1b3hTcml3b0svUlh0dEFEZHltQkhPS0JESEpvdDZ1ZzJBOEpW?=
 =?utf-8?B?ZGFwWGFXZTF1VWwxTFluUTJaMFVlZHJGeHBvQ1NrWTJCM21mTnQ4L2k3QjM5?=
 =?utf-8?B?Z0gydWlkemplbGhUZGFXd29BbzYzNFpjRTd6VVh5YjlRckpEM3lGUGxvblgz?=
 =?utf-8?B?Tnk2aHZ2bVNtbHg0R2tQNFJwQWF2UzNtRjZiV1hOQWtFYWY0ejVyUW55M1N5?=
 =?utf-8?B?U3BMSHNDS2dadXZGSVRVbVZzcy9MMElEMnp3alhMQmhTSC8wL05CcVc4K2sv?=
 =?utf-8?B?UVBTRnlYS1pWRVY3YU9XM0FWN0RQS0lhVUc5d0VtZDYxMkw0MWt1Y00yb0gw?=
 =?utf-8?B?aDJnMG15QlRwczNPYWtCL2dSdmQ2a3pwWmxlUjVKNnVJZUIvd2NOcnZuS1kw?=
 =?utf-8?B?WU9sMURWbk1DV01OOVpsVWFIeHVjeDBhRm9BcndTbGhVUGw5UHBEeHJGYTdL?=
 =?utf-8?B?ZVdmd0xYOWdhb1d4L0ZmdUZmN0lKZ3hHU0tqa3d4R00xdEFZNVZNcVhjWS9B?=
 =?utf-8?B?Q2VCK2ZybzFsS2JLZkYwcUdiSVBTR1BrejZvR0xIUDhrUGNBRTlBZXFTTUdU?=
 =?utf-8?B?TUZuNStzYVFXSTJqeVJuL3h4S1hzelAxU1VRdE54VVRkaE8yYXpIRkRMSndn?=
 =?utf-8?B?MEZ1ZDRyZUpJdE42dktrSTAzcmhlTFdoYXBxbnYvTmtoaytUdnZCNWZwdUQ3?=
 =?utf-8?B?cGc1TWxISERobWJaekdUQUVWSEdZQzFVdGpvV1BFOEZuUTNwMVQrU3NIWWVr?=
 =?utf-8?B?UDl5SWNOVnJuVTRlbXpTM2ppZjdITmlQMmRsaFV5U1kzcjJUQW04OHZOOExQ?=
 =?utf-8?B?YjRDenh6MkZ5VkRmY05WUGFYYzB1Zll3RW83VWJSdXBpNElCOHovUXFQdTdC?=
 =?utf-8?B?cWo4Ym8xK09TbktJd3FySVFTT1ZSeEN4M2N6L0xrZjViY0d1c0VTcWVsWnZy?=
 =?utf-8?B?eStDTWgyOTdQejhGTExxNkVzQW9LRk83T2p3aW1tMEVzLzJDVi8xNWRWTnZa?=
 =?utf-8?B?TVlDeTdqbTNWcHIrVWJPZTdwSnNIS2l2UFlMVmpEZllndGhuLzliWFZteTNv?=
 =?utf-8?B?WFBxMHVzZTFDNkZMcVNlTmhjbkFuWUxOSkJKOG5PMUcybnVla0JJV05YcHVK?=
 =?utf-8?B?M2VFNTJDRlhUNVUxanVmSzBSMzJOVk9aRTkzdWZjSE9vVjZYcWNIeHp5clc1?=
 =?utf-8?B?UU56QlljM1hQMFp5aTU0Tk5nSDM5VFZMSkJMOVNEUFQ2cU84bTJ2b2EvNXIw?=
 =?utf-8?B?cUVXK2V4QS96b0huek1ZMzJJYWRlTDEwT1dDVllzdDQ5VVRZOHNzeUhvOTZ4?=
 =?utf-8?B?ZlgzWCthekNiNU9LV2Exb21WY1haMVN0d2JwYWVNcThQUjJ5ekpqS0xtYUp5?=
 =?utf-8?B?aElHNEZFcXhWekhOSk5pMnF4dng3dld2djRQL0llaThxa3BZWlQ0RUNrYzh5?=
 =?utf-8?B?cWxqZWM5bDljK2ZLTXR1UEU1MDl1VkthYWNjUjV3ZUJHdlhYdEVxVVBqVTQr?=
 =?utf-8?B?MU9odEpiWU0vRlJ3aE1LL01rUlNTNm56UmpkVUFuTHk4K2xUaHhtUUhnZ2tW?=
 =?utf-8?B?RzJqUmdlL0pFMFhZLzlzblJOaDdZYW8zM3pPZHBEUDdHOEZPL3cvQ25IckNM?=
 =?utf-8?B?SFQwUk8yK1Vqa2ZObXl6S2JTK1JwWnA2M1BzQ0ttV3ZESEtmYS9QVkNQQ1pJ?=
 =?utf-8?Q?IFrp4GZum3qpp9uRo0asOEYqlN8ULABOkcGokAnwUbBWA?=
X-MS-Exchange-AntiSpam-MessageData-1: G3lY4I2NPog35w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f2c9c0-d668-4ae6-2427-08de6551836d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 07:29:50.7087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JqRv5HfoVQWsG7PZIgiUVD6Qv1JNxxPR71JMXYNIyiVL8HT4SKLNsVCV789xj3V+XTVJC6lkHOWwB1SadC9Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF934D73F2C
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A4418FAFAF
X-Rspamd-Action: no action

On Thu Jan 29, 2026 at 4:44 PM JST, Eliot Courtney wrote:
> This series fixes a few bugs in the GSP command queue ring buffer
> implementation in nova-core and also clarifies some of the comments.
>
> The ring buffer uses read and write pointers (rx/tx) to track which areas
> are available for the CPU vs the GSP to read/write into.
>
> In the ring buffers there were some indexing issues which could end up
> causing panics, so I fixed those and added more rigorous proofs of
> correctness in the panic comments.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Staged the series for pushing into `drm-rust-next` as soon as it
reopens. Thanks for these critical fixes!
