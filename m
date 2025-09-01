Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F2BB3DB60
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB6C10E39C;
	Mon,  1 Sep 2025 07:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k8frw+VR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FA110E06B;
 Mon,  1 Sep 2025 07:46:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUMFD8E41ScYnRR762J52OybpSzBWs5Sucaxt+dhjyXZkZDYuLUSmfK5GzxJabOy26H566i6lK/h0cOEnzLvhRF1c074zCEArsf8euyXV/UdQFOjlKZ8A7+CMqIxAGWyMukKS5/D2n7PYjE7hJCvAGkgua0pre8u1C7135xlhy/K12pPRbT/JyVa+KjfCyua/IGXmGMeLO6ub1ntldgxK0/KSQqmEcKrNsQ71LCn+Qc+s93Im0q0D6xcPKG6bLYNhCML0lGNxdnCvNnc6gUQzwXjGzBzxMHshaB/m4wDYx35Wq+2v7XZwm8mkVuhmcc73qkUZBoDxeamH2vL/g7tcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IDjt5h3riiJwtfOHnD+iMxqAnIpM4ymCz7aBiJo41w=;
 b=v69HX+1QTuNxqY2+NPm57dvo4Ataspg8j2aghGc8A3v7+D8a8DiWPouYp4N3LN5M4mJUxl3yMcmRlpJ3chVXvP+tM76JJSr7NOVtA3eqHFhWzMog42YMMBnhL4QEJoW2waU8zj/n+Ku7Zzfygeve7Hrqz+O4PUq/uUCVaGvpEHa20xNFQF+cECk58Cvyr5AsSGtWLkgI4/cpaYLuMYuAqKqGNB2DD+SVGAT9ahYKXTEcDgvchG9ktfvRlQNnL7C1kBbDWM6Ip7+aeGTkCq/CBWvDM6X6LF7aMKxzOKcNB4R+qtoGjX763jEsh83w3SUy8EumVQc/3mLmvs9Wy/SZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IDjt5h3riiJwtfOHnD+iMxqAnIpM4ymCz7aBiJo41w=;
 b=k8frw+VRNa2HFeGw0Flb38Pd/XHPBTHTDTrwK/eIY+VP4wz43U+HBxQzq8y6TLz5utxk/hMup40ORihHOnDFa/1smCsmxCL3K0Lk2XDh0zMTqkk9jjaFhYcNn0b7hBlh2Qd1y1rD7Rb4QSbYZ4SZQni5wLNcSaCD6G7XGYLHtvG/PwuKS5R8lTgD9tvX2DpD3B8EfFOsPiuakeQMSjbbMJLbTnvhgeVdo0f3p+BynPTQN+wncAcHdHojVWhSpbZQfMB4CJYEJx2+6XJLCurdKZIMcIeGW09qkuPlGFlEcuMR/RrJA/7Z36ERTW3KK3Oj4LB4RUbdjhxrfCOea5JdYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by IA1PR12MB6138.namprd12.prod.outlook.com (2603:10b6:208:3ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.24; Mon, 1 Sep
 2025 07:46:38 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.9073.021; Mon, 1 Sep 2025
 07:46:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Sep 2025 16:46:23 +0900
Message-Id: <DCHAPJRPKSSA.37QLQGAVCERCZ@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 03/10] gpu: nova-core: gsp: Create wpr metadata
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-4-apopple@nvidia.com>
In-Reply-To: <20250827082015.959430-4-apopple@nvidia.com>
X-ClientProxiedBy: TYCP286CA0062.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::7) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|IA1PR12MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ffa7fc-e396-4309-9775-08dde92bab19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUc1c2dsdVMvNDB5RGRSVkNJdkJIYnBYOU01dndzTVdQeDZRUS9vTXhKZkFn?=
 =?utf-8?B?WHA4a1FtQTcyZFJGU2c3blF2UWltTzhXZHp1OWV2RW9SMmYvK04xRTdVaWJQ?=
 =?utf-8?B?bkRWcEtXTWxUUzZCT3FralFmblY2UUgwNS9oNUhvUlVuSkNRQjZSb0wwUU05?=
 =?utf-8?B?MXZQVEtsOUFvRXovOFcyS2czUHFpNVhLUTZZdVB6M3N1dVNmSzB6c2dQSTFN?=
 =?utf-8?B?RStkM0tENC9kckRqa21RbjZIWDI0Mm1ONmFoM3J3ekRwNDBTOVR2cU1GNWt4?=
 =?utf-8?B?YW5CeUFBQlY4NnpCSFJMVTJqQkM1Y0FKS2JJcDVuWCtwWWlSWTNSM3JXY0Nk?=
 =?utf-8?B?bkhCZnVTTWovYXhWZCtOK243UHMycU5ydldhenJqTjQxNUJjMUVvODducVJC?=
 =?utf-8?B?SlpoUlhPa1N6T3VVbVNpT0FnTTBvQXFmMzkxUWRsRlVuU2NoVkgzcm4rUkdL?=
 =?utf-8?B?KytOTTNjcnI2Y2gyMHBWeElsQWlaSnpJbVZUMUtHR3Q0VUJ5U1VDZ2ZIK2Yw?=
 =?utf-8?B?NjZjSkxLNEhCbTQ0N0xJL21uR3BuSytMMUtPSnF0UjUwS3ZXRjV4dHNCT1ZO?=
 =?utf-8?B?S3pONFhrbjJLdkZxZGl4MG85ZW5qZTlvV1NYWjF1V2xPQTRpd1htVy8rNW40?=
 =?utf-8?B?UnZlb09rWFEyQjZCN0IzeUd3cmphcmhlUUFMbjhNU2g0R1RQOTZiWTBJNE1n?=
 =?utf-8?B?UzJ2ZTgzRHRQUFJVdXBUKy9wNjNHM3liUzhuV1hrWVNzRmxxQ1BXYjI2VzhT?=
 =?utf-8?B?elZpNk9qYlFQUzZ3VXFSMHlUN1FWTTl4OFdBODFLb2JyR0l0Uk0ra0hVeko3?=
 =?utf-8?B?SEk5TUZveHRmS1FmVlBoM3BxU2doSm93RVlFWGR4UjVOKy9IY2N1enVCNnVJ?=
 =?utf-8?B?SFpTMkhyU3EyNWJjbFZ5ZFNDSm0vNVduWWJzeUF3cFlJdXZ1eXR3SXRvTGJK?=
 =?utf-8?B?OUV0NEdRYnFVVXF4cXhDQ0dQTmNubVByYlhaNGVJTmZBRTAwTU5tMUNVdjhv?=
 =?utf-8?B?UjBGK0JMZHVlMm1vMlRkMWF5OVQ0ZDVuVnJiUXlYbnUwUUpjUHg1bjBWOUxK?=
 =?utf-8?B?enhRTktPNlFHZDE4bGJ0YksrWTNLQTNQNHdLRmRSWVJyT2lzSllYTXFlZjFx?=
 =?utf-8?B?NDB4NisxWTFJRXN0RW14aWt1SCtNMDA5T0xpKzlRaThOcjVnb0toRE84YzI1?=
 =?utf-8?B?VFdZY0V6OS9RVWxkUnNwdWNmRHRQSEtTL2d4aXQ0b0F2L2JmYXlFNHZNT2g2?=
 =?utf-8?B?d0QxK21Gc1lmMnNadGwwSm1RdXYxcnV5SzlteXhSQk5RcDRKU0RSdjRqMU5t?=
 =?utf-8?B?RmtsZ2dxQ3NRemZvTERLR1Y3dGI0aHRiY2l4bHYvZ3BDNDR2NXUrWldwTzZ4?=
 =?utf-8?B?L3A2aUlRZ2krQlkydGZSSEx6UTJFSG96R3pVTjVXNCtqNVpoTU01Ni9IV05Z?=
 =?utf-8?B?MFZra0gwazFwYXdTbmxnK2lnWEFHWk1yRHVUaTV4MTlmdElpTjkvd0tWSlkw?=
 =?utf-8?B?cTBCWEVCaXk3RmdWUlk0cUlaMDZhTXlVMmc5YVVJSW93a1hQTEg3THl5b3pv?=
 =?utf-8?B?M1hIWmw3ZDJpNXBjQVQ2b2JqcGkwem5iQXNQYlJIT3NrbllvR2pNMjc5eEpW?=
 =?utf-8?B?d2hMMzZ0U0EwSFRZRDRoZ2FJdmtVSk9TRERBUVNiN21seEZVZnloTFBicjVN?=
 =?utf-8?B?VFRsS0VtN2pTbWY4MmtEeUlyRXd6VWFXSmE0K2ljbjZpV1pzMk93TGh0clZZ?=
 =?utf-8?B?a2xSUkpQQVo1U2w0VmVTMzA5ejAwVFRMbS9ZdFl6TUpROGhuV293OWxvbG5h?=
 =?utf-8?B?ZEJ6Y2cxWWk1TmxnYkI4OU44L0czT2RhZ2RCTXdvTHpzQVFtMk5hQkxxZ05q?=
 =?utf-8?B?c0QrOStHOEljczJDRkNnaU1vNmpIZENuSVFiZzNYNzBaSUJ1MHg0cEtUamVJ?=
 =?utf-8?Q?dib2jdRqUq4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGN5Nk5jenU1bU8wcnZtNU5RMUwrY0FUeVExdlRXc1NlRFdyRStqeVF1NGta?=
 =?utf-8?B?TmJJSUZ3R05vTHA0MEVHYkxPbXJwRlgvM3dMOFh0M0szVCtJNEZ2cHFFL0kr?=
 =?utf-8?B?K1pVay93MTF3UUl0OUx6ZjFnMzhudnczM2dDbkxMaW8zeWtIUFVBRzVmNHl2?=
 =?utf-8?B?aHZhY2xOU01vaFEvMzdTMGZoKzdlUTh1dW1rdm5adVZEWjVCYlNGNTZXK01z?=
 =?utf-8?B?RXZDRXBxOCtEeUJEd0c2NEpoamY4UHBzZjNYakJ2Wjk0dFlRc1lpNGlIVFRo?=
 =?utf-8?B?citUQ2xBbDczSEVXRE0wM0RzblgzMWl0U3ZLQWhtaVJKTlRTdlFRY3Z6dzE5?=
 =?utf-8?B?dTNMRE1sdVBHQmp0R2pDMDlPWGV2L09LSWZIWnhpZHVNNkJESzgycXRoWE9M?=
 =?utf-8?B?QzBETVgrZDQ4cWc3emhybWcvYVBHaktqY2UralJyMnh1dHdPZk9rbFkrenpp?=
 =?utf-8?B?cG1LeUR4WGlHZTNkMUd3Rlpwa0V3OTNwMEVxcWtJTmJGNDhMMUlwcGFEZjEw?=
 =?utf-8?B?NHlldHRVQ3NxMk9NaG9IeFdmQlFDSlVwVTdrVml0ZThuQUpmSlNaNy9JNDNo?=
 =?utf-8?B?VnFiNkFkcWRvNklIU1ZGTnRxQm5XUjJoVXBBTXp4NGVBM1R1b0dsa2pLN1NC?=
 =?utf-8?B?RW55K2xvcm1QYjJiMkNnZlEvZjhHaWtEU2ltRlZPNUxBRmh2eXZiMml4bzJ2?=
 =?utf-8?B?ZUFpSlB0M29yM2w0MXp3UGNFL1hmSnR0Yjc1VUpBeHZOdDZtKzZxcUJ2bExG?=
 =?utf-8?B?M3RTaGY2UFlOejRIWFlHbWhDSzZEUjgwUnFyQlp2NHhrWUVGSFlZNUxXSnNO?=
 =?utf-8?B?UjNjZkd2b3NMU3V2VzkySUZPMjhpQmZ1S0xKTmI2eHZ4Z2pqOFI2MnBhSkVZ?=
 =?utf-8?B?OFR6cGZ2R1Q0bUZKQktmRHFzQmtNTjFkRTNjZFQ4QWJmVTFvVm9IL0Jjb2RM?=
 =?utf-8?B?M0pucUFycXRoMVJha3FIRGpyek5SQkExR2JqeFpWU1VXRHpBU1VRM0VCSE5R?=
 =?utf-8?B?RVFtSEFZb2FKbGpqL2owNlY4WEJHTDdDMk44cHNLSUhNRjl5Rmo0d3BndTZw?=
 =?utf-8?B?NjVWTWZlcHZ1Q3orWllOWVN4QmNuTFB6WWRhbGJucXRIOVJ2M01jMEtaT1RS?=
 =?utf-8?B?ekk2M3dkM3RMa3VtYjZNTU1WYTA0QmRXZDBubGV5TVJNbzM4c216TTN5b05H?=
 =?utf-8?B?OFFOT25pdDdsOG5iT3JSTDZYRGY2ZU5FNG9tS0JSZFh0bThYSGxzRkh3aXQy?=
 =?utf-8?B?YU9TalRPTjN6c2x3QUQ5L01Rc1RQWHJydlArbDZScTEyWkxRbXYyMFNjZ01C?=
 =?utf-8?B?eFNPc1pTSW9OdkdDbXdwanRYdXh0ZkxUR1hWbElIT00wTDBaZUh2aldTSFV6?=
 =?utf-8?B?ZnZxQzRtSTJ4amsrTDZDdlAxTDRBWUtXemF3c29JbXBWU2E2TjB1M0hyMUd6?=
 =?utf-8?B?UU9GNTBHTVFmRmxWZUR1M3VGNE0xMlE0Wlh6c1ZHdTMxNzdQYVVFUTU4YXNL?=
 =?utf-8?B?TjlYZXJLeTU3UVo2MmNKYWV4Nmo1UklKZ0VPblJHQ1N4Vms2KzdCZnUrc05J?=
 =?utf-8?B?QTdhMXZibWk2bzREM2paYTgwV1ovQlU2V0ovU0JFcG01YlhqUWx6elJmS1lT?=
 =?utf-8?B?dE90SUoyYW1oaHoyWGdiajZzaWw0aVB3L2tRQUErMExXVzMvOHRYZUgzTnJu?=
 =?utf-8?B?akVDb2J4ZWVmUjBvb1pDQVB1dTdFUkNKZDd3YmI5c2JodU1QeXNJTWoyQ2FD?=
 =?utf-8?B?UGpWcjlUZ3dlRUZsd20yODBCVG5zZlpwTXFZUDU4WFA3WWxyTmZMaGFLTmgr?=
 =?utf-8?B?Tm04TWltSlBHbWNlNXhZMVZoaUVsWk52NDlKbEtvMzcxWndPK2ZNamo5SVA2?=
 =?utf-8?B?UnhVTElxN09KRFMvd3ArWW5tTFAzNHAyVG1yQlkrVlBJaXZBd3JYV01Sblc3?=
 =?utf-8?B?UVZPaW1VOFA5aVFLSzBJeWVudGgyY29JdEE5RDdVSGVQaGNibDZQRUl5TnJ1?=
 =?utf-8?B?d2pHQXhBdEROcGhRWk1pNEViOEx5QjU0WXRmSVRha0VnQTI2dURmemhsSUJN?=
 =?utf-8?B?eHJuMmxRb3o1aGJ4RW5DZ0xNTDZteERZaUpKQk42WVZhT0xaTW55RzZjUGxJ?=
 =?utf-8?B?T0Z5UGVCWUNLOTlzS05wQnd0TUdzWnlqNHpRR2FtWWJNMkNPNFRFdHpvV2dU?=
 =?utf-8?Q?jCTOedEcSQyu+/QJxGSewYXCKe+RUfqIdkVGLrxeKY85?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ffa7fc-e396-4309-9775-08dde92bab19
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 07:46:37.5258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDw6eOec4fNXYb0XRaF99BZha7tzsPpeAkZaF0N+m1PrHHe3Fge/lMx5k9OgELeKQTtuNxJ0q1zkxGrn8EHjEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6138
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

Hi Alistair,

On Wed Aug 27, 2025 at 5:20 PM JST, Alistair Popple wrote:
<snip>
> index 161c057350622..1f51e354b9569 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -6,12 +6,17 @@
>  use kernel::dma_write;
>  use kernel::pci;
>  use kernel::prelude::*;
> -use kernel::ptr::Alignment;
> +use kernel::ptr::{Alignable, Alignment};
> +use kernel::sizes::SZ_128K;
>  use kernel::transmute::{AsBytes, FromBytes};
> =20
> +use crate::fb::FbLayout;
> +use crate::firmware::Firmware;
>  use crate::nvfw::{
> -    LibosMemoryRegionInitArgument, LibosMemoryRegionKind_LIBOS_MEMORY_RE=
GION_CONTIGUOUS,
> -    LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM,
> +    GspFwWprMeta, GspFwWprMetaBootInfo, GspFwWprMetaBootResumeInfo, Libo=
sMemoryRegionInitArgument,
> +    LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
> +    LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM, GSP_FW_WPR_META=
_MAGIC,
> +    GSP_FW_WPR_META_REVISION,
>  };
> =20
>  pub(crate) const GSP_PAGE_SHIFT: usize =3D 12;
> @@ -25,12 +30,69 @@ unsafe impl AsBytes for LibosMemoryRegionInitArgument=
 {}
>  // are valid.
>  unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
> =20
> +// SAFETY: Padding is explicit and will not contain uninitialized data.
> +unsafe impl AsBytes for GspFwWprMeta {}
> +
> +// SAFETY: This struct only contains integer types for which all bit pat=
terns
> +// are valid.
> +unsafe impl FromBytes for GspFwWprMeta {}
> +
>  #[allow(unused)]
>  pub(crate) struct GspMemObjects {
>      libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
>      pub loginit: CoherentAllocation<u8>,
>      pub logintr: CoherentAllocation<u8>,
>      pub logrm: CoherentAllocation<u8>,
> +    pub wpr_meta: CoherentAllocation<GspFwWprMeta>,
> +}

I think `wpr_meta` is a bit out-of-place in this structure. There are
several reason for this:

- All the other members of this structure (including `cmdq` which is
  added later) are referenced by `libos` and constitute the GSP runtime:
  they are used as long as the GSP is active. `wpr_meta`, OTOH, does not
  reference any of the other objects, nor is it referenced by them.
- `wpr_meta` is never used by the GSP, but needed as a parameter of
  Booter on SEC2 to load the GSP firmware. It can actually be discarded
  once this step is completed. This is very different from the rest of
  this structure, which is used by the GSP.

So I think it doesn't really belong here, and would probably fit better
in `Firmware`. Now the fault lies in my own series, which doesn't let
you build `wpr_meta` easily from there. I'll try to fix that in the v3.

And with the removal of `wpr_meta`, this structure ends up strictly
containing the GSP runtime, including the command queue... Maybe it can
simply be named `Gsp` then? It is even already in the right module! :)

Loosely related, but looking at this series made me realize there is a
very logical split of our firmware into two "bundles":

- The GSP bundle includes the GSP runtime data, which is this
  `GspMemObjects` structure minus `wpr_meta`. We pass it as an input
  parameter to the GSP firmware using the GSP's falcon mbox registers.
  It must live as long as the GSP is running.
- The SEC2 bundle includes Booter, `wpr_meta`, the GSP firmware binary,
  bootloader and its signatures (which are all referenced by
  `wpr_meta`). All this data is consumed by SEC2, and crucially can be
  dropped once the GSP is booted.

This separation is important as currently we are stuffing anything
firmware-related into the `Firmware` struct and keep it there forever,
consuming dozens of megabytes of host memory that we could free. Booting
the GSP is typically a one-time operation in the life of the GPU device,
and even if we ever need to do it again, we can very well build the SEC2
bundle from scratch again.

I will try to reflect the separation better in the v3 of my patchset -
then we can just build `wpr_meta` as a local variable of the method that
runs `Booter`, and drop it (alongside the rest of the SEC2 bundle) upon
return.

> +
> +pub(crate) fn build_wpr_meta(
> +    dev: &device::Device<device::Bound>,
> +    fw: &Firmware,
> +    fb_layout: &FbLayout,
> +) -> Result<CoherentAllocation<GspFwWprMeta>> {
> +    let wpr_meta =3D
> +        CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_K=
ERNEL | __GFP_ZERO)?;
> +    dma_write!(
> +        wpr_meta[0] =3D GspFwWprMeta {
> +            magic: GSP_FW_WPR_META_MAGIC as u64,
> +            revision: u64::from(GSP_FW_WPR_META_REVISION),
> +            sysmemAddrOfRadix3Elf: fw.gsp.lvl0_dma_handle(),
> +            sizeOfRadix3Elf: fw.gsp.size as u64,
> +            sysmemAddrOfBootloader: fw.gsp_bootloader.ucode.dma_handle()=
,
> +            sizeOfBootloader: fw.gsp_bootloader.ucode.size() as u64,
> +            bootloaderCodeOffset: u64::from(fw.gsp_bootloader.code_offse=
t),
> +            bootloaderDataOffset: u64::from(fw.gsp_bootloader.data_offse=
t),
> +            bootloaderManifestOffset: u64::from(fw.gsp_bootloader.manife=
st_offset),
> +            __bindgen_anon_1: GspFwWprMetaBootResumeInfo {
> +                __bindgen_anon_1: GspFwWprMetaBootInfo {
> +                    sysmemAddrOfSignature: fw.gsp_sigs.dma_handle(),
> +                    sizeOfSignature: fw.gsp_sigs.size() as u64,
> +                }
> +            },
> +            gspFwRsvdStart: fb_layout.heap.start,
> +            nonWprHeapOffset: fb_layout.heap.start,
> +            nonWprHeapSize: fb_layout.heap.end - fb_layout.heap.start,
> +            gspFwWprStart: fb_layout.wpr2.start,
> +            gspFwHeapOffset: fb_layout.wpr2_heap.start,
> +            gspFwHeapSize: fb_layout.wpr2_heap.end - fb_layout.wpr2_heap=
.start,
> +            gspFwOffset: fb_layout.elf.start,
> +            bootBinOffset: fb_layout.boot.start,
> +            frtsOffset: fb_layout.frts.start,
> +            frtsSize: fb_layout.frts.end - fb_layout.frts.start,
> +            gspFwWprEnd: fb_layout
> +                .vga_workspace
> +                .start
> +                .align_down(Alignment::new(SZ_128K)),
> +            gspFwHeapVfPartitionCount: fb_layout.vf_partition_count,
> +            fbSize: fb_layout.fb.end - fb_layout.fb.start,
> +            vgaWorkspaceOffset: fb_layout.vga_workspace.start,
> +            vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vg=
a_workspace.start,
> +            ..Default::default()
> +        }
> +    )?;
> +
> +    Ok(wpr_meta)

I've discussed the bindings abstractions with Danilo last week. We
agreed that no layout information should ever escape the `nvfw` module.
I.e. the fields of `GspFwWprMeta` should not even be visible here.

Instead, `GspFwWprMeta` should be wrapped privately into another
structure inside `nvfw`:

  /// Structure passed to the GSP bootloader, containing the framebuffer la=
yout as well as the DMA
  /// addresses of the GSP bootloader and firmware.
  #[repr(transparent)]
  pub(crate) struct GspFwWprMeta(r570_144::GspFwWprMeta);

All its implementations should also be there:

  // SAFETY: Padding is explicit and will not contain uninitialized data.
  unsafe impl AsBytes for GspFwWprMeta {}

  // SAFETY: This struct only contains integer types for which all bit patt=
erns
  // are valid.
  unsafe impl FromBytes for GspFwWprMeta {}

And lastly, this `new` method can also be moved into `nvfw`, as an impl
block for the wrapping `GspFwWprMeta` type. That way no layout detail
escapes that module, and it will be easier to adapt the code to
potential layout chances with new firmware versions.

(note that my series is the one carelessly re-exporting `GspFwWprMeta`
as-is - I'll fix that too in v3)

The same applies to `LibosMemoryRegionInitArgument` of the previous
patch, and other types introduced in subsequent patches. Usually there
is little more work to do than moving the implentations into `nvfw` as
everything is already abstracted correctly - just not where we
eventually want it.
