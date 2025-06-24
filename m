Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9818AE5BCE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 07:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC05810E03F;
	Tue, 24 Jun 2025 05:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LknhMYsM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8576E10E03F;
 Tue, 24 Jun 2025 05:18:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnF0+iWt3IDpGOIn3ZGxdA/Rge3080rCl8blevxtN06Kr0mkh3GDELB9/HVgjwHy3+i7gfl2P54vGMoQDswvI6Mp41sQC9P0VSvRULuJcfO42V3Sa3dx/ZgxrTgQc3F2ZPc1WEJCgVI3LEqKD6cJMVY4EEP2YVoyBFLNANjY9p+uTfb+myzdGD9Bxc3cbF0qRS6+ygi5Zc3PFdS1xpDo9PlCgNYfP4YyLXrH4ibqwZPUup8F06X3Dp6helEc+Qo052OICw6WyOXDCzxcfBVnCRhIasucLkPDYTvJzbs0AFSZBPFXkwb3GMAgmb57qBaWrmsKA4oqYwM4DfG2IAjuwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bof3z2uJ1eEmg3cP0R57aLzEcbKaHTvcAPIbs291wwc=;
 b=angbVkqF25OVV3Be4QbBRWKFrSomQlg/9tZygitUM0a6ISrzlvexNYPb7hy5BEmQ8XN0nsrb7oMMIJ4uoYbg7hWjRUWUozZ5HJrsRds3QvyNLllrk/HknSbuUr0eWbqyFM4RSVnOrB7CvPHh+8bXjNdA6yH7eL+4VKhWDYhTHPxUVO3cKlheQeZMt8TAAFY2mDL6BM+Lf0wDLiYk7xHIDsrHWjbOCcS3mIAsRk5dNkg8diNWDIEJ22nZG+zaB4AC6aq7Oz7UbZZ0Vt+4l/A8AtUgCYq4RtycWZPDugcyrLnR7JgpVUQXwuusDYoSlKaUxjj0BGxH4xXFjNBwU/GVMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bof3z2uJ1eEmg3cP0R57aLzEcbKaHTvcAPIbs291wwc=;
 b=LknhMYsMfgpBP7K0e9Ognkxj4ddWDwi2OTSXv50NNmquwz3WRuiucTBL2urJ2mCTJKCJdD32liWflW2XVqCW8YWK3BTUXxeXU4ldlsoaaOcVXfnELo4X/+qbanYN+sKwVSPsXwX4+KugdqqOiIzW61xJUIYaWBXzPWp8LYzJXuuiS+GX2i7ri8Exdo0UhVH08xaQPp6z25ljVPMeSb6VAW0cHQ8FmAtbnq8Ug9qUf0JXG3li+d8+odUN85egbU/QAG1tdC7r/oekHBgK4gyuzlNq1Gm3vPYGB1RyhZpHxw2s+2UVagDaQmg2HrhP22xi4eN/ibZg0iyAis+ypZOfpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by IA1PR12MB9521.namprd12.prod.outlook.com (2603:10b6:208:593::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 05:18:00 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%4]) with mapi id 15.20.8857.020; Tue, 24 Jun 2025
 05:17:59 +0000
Message-ID: <e8b9f61a-5816-4447-855e-9998ded12389@nvidia.com>
Date: Mon, 23 Jun 2025 22:17:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/24] nova-core: run FWSEC-FRTS to perform first stage
 of GSP initialization
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Benno Lossin <lossin@kernel.org>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
 <aFnArVIFkHCUzNqe@pollux> <DAUFC932W5MR.Q13BFD3CYEKJ@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DAUFC932W5MR.Q13BFD3CYEKJ@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::8) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|IA1PR12MB9521:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e502a4-95b6-4db2-bc32-08ddb2de7c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFBYUy9NK240NDBQU1NQRHNWSHVCR3QzakJXbVdDdTk5UkdJWU50ZjVBSnV0?=
 =?utf-8?B?NE9zcDYycWpZblNSTGZXUXNiY2xQclFhWjRMenZ1d3QvWG1pYytYQW4vV2hR?=
 =?utf-8?B?bkcyY2FLNVg0SC9lUDR3eUxIWjArR0FsVVF5MHBpR1VYK254UGcwWUZVQmlk?=
 =?utf-8?B?NVdPb29YYWdCRldOTlo1THlnV3IxZWtzRVRTQzZHOGNJSkQvblIxdEZlUVRT?=
 =?utf-8?B?RXZkcXUzSnNrdG9kcHVZbThlTng1bU4rNEdUbUZEakhLQ2tZTzdoVHArN1Ev?=
 =?utf-8?B?aHNicXpvQTNBVnpVTkxDbWdzMzBXZ0JzQjI1QVdITFIrbUhMWHpucTBaSFFj?=
 =?utf-8?B?aW9pNzlKQjBYZFZiaUV1L2RsOWdndFNZZCtIT2pzZ20wc2F2MEtXVUR3cFYz?=
 =?utf-8?B?UHV4NzNwSC9iWEI5RUFhS0dUdWlzTk5GYmJDbUc5R3dMemlTbmJRMDA4aUFR?=
 =?utf-8?B?UW04azJOVitqeHZyVXlURDY4RlVXMEF2OU8vL1pYcVlWT3BoTjJtbGJhZzZ0?=
 =?utf-8?B?bmpwbDBtRGFrdFRnSExGTzlzZ25lTlYwdXAyK1ZrazhBMTVXTGwyV3AyVDl1?=
 =?utf-8?B?SWkyQ2VoWWRseDB5OVQyOHI2dlM5T2pTQ1JzTHBwcTh6dUQ5amlZZkFhQnlE?=
 =?utf-8?B?SWlqUEZaRy9oc2RrQWloM1hYV3lzQy9YUFd5SWh3dkRkQkh2WVJWM0Foa0cx?=
 =?utf-8?B?K2tPRGVsNnR0WkFxRWJ1a01OS0txNHdwOW56cVBrbU9IUHUwN1ZzemhlRC94?=
 =?utf-8?B?cDB4blhKWWRsdUhWbGgvSUZ6c1FxTTJvOTVVdWFzU0Q1N1B0Qjc2ZTdicHd6?=
 =?utf-8?B?VVRLN1dHaUNxdGFCaTVEZjJURE04YWo1aHluQzJQM2tNREZtMjIxWUtSSWJw?=
 =?utf-8?B?d0VzdnJsK0dJczlyUDBxU0dSa0JyaTV3Sm5PNUpvVjMvNmRrV3JYdVpVWjJD?=
 =?utf-8?B?YkdlMWZlOFRuaWYxVVpwMS9jYkpPWTQvZW1iV045MWZQVVJuUUFsTWdJam1u?=
 =?utf-8?B?MUZDUEtzUjNqSUJmWUZicWluZ3FBWlVuYzZtc2tVbkd5OGtDMGN3eFdDZGVk?=
 =?utf-8?B?Z1FqanUzTm0yNFNYOGcvNzRuYnhTSnVpcjBuNVM2d3VWYklONWVLNXFCV2U1?=
 =?utf-8?B?ek9heHJ5d2Q4blNPbzBLRk9nNUN0Y1g4K1lVWDIyL1Fkc2tXc052ZFZzQlcr?=
 =?utf-8?B?aUwrQXJuOGRTQzdvV3QxcVRjQ2lROGRWaG5qc3JtdjVNNEs0bzg4L2Q4NFRk?=
 =?utf-8?B?ZzQ3S1paS25zUlg1UFdON2hWdmNCYVl2eVk2Z21pUkJpeDhoNm1KRWNXRS92?=
 =?utf-8?B?bUZjeDFqYzdWbGNxV0YwTWVvb05Ha2ZVT0pYTlg4K3NXbHU0TnhXZTB6ZU1u?=
 =?utf-8?B?aUJSeUhLVlBBd0JHeHBUQUJmc2ZvMXVKbFUzc0VKY1dlcjUwNllibWVzRy9H?=
 =?utf-8?B?MlRiQUJ2dFp0UHNwei8xeEhCNnhlOGQxb3RKYzFqRkZaM3RjUE1QNXFoTFcy?=
 =?utf-8?B?SThCakE5S01TM082OWJzVFFUeFBVdk5FK0xrWjgyK214SitpV0E1Z1pSaWpv?=
 =?utf-8?B?S3FiUkZLTHd2Y3g0N2xjczdoM3JyRWZGRXBteUFhbFRCY2wxakdBcnU2WDc0?=
 =?utf-8?B?WEFiT1FVakZ2R0xCZEVNQm56Y2hXZXErdWJjVnZyWXllVytHemxTOEtPNElq?=
 =?utf-8?B?WEErV0wvOHVTbExsY2FjM3VZK3crTVFqdEVlSDZybXMvNGpNcEpMQ1VHVjdN?=
 =?utf-8?B?c3ZaZFZEQW5mVEEzd2pMWTRWb0NqZW1Tc045NmNiMlF4clIwaXJvNUlHTGRT?=
 =?utf-8?B?RWx0SXBKY21GWGlUek1kcHRWcGpUcko4YzBEdUVVdFVvMSttM01WVE1WeHd1?=
 =?utf-8?B?Tzcwc3hheTBLTEpVU2d5Z2dmYzJpRW1kWFBlS3V4V25qSEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THpXdzJkcGd2NjViYnRKSktpeXA1WUlXWUpXOXpkci9hWXpoOHMrSEhIS1po?=
 =?utf-8?B?MlZJZXNheTFyaUVMN051T3BQaDNSMVZLS3ZVbzVOOUo4eElLbitZaXd4OWFS?=
 =?utf-8?B?U2paMVE3MmYwcDdKbitjcjRhNUt1Q2FaZGVVVU5VQzdLc3BaOFdMSUtWdDM0?=
 =?utf-8?B?VjFkKzk1VW82M0VpZWFzVnFVcld3UnRKUlpDeWp2bkRORTJXSjZwTHZCVmY3?=
 =?utf-8?B?MG4ySE5NU1h1QXpsZSttR0dma2xBVndScGZReWpGQ1RSM1BCQVpzOGI0azdh?=
 =?utf-8?B?S0JPeGZZbmIvMTFhM3JaU0RkVDBLUDVTZHVKRzF2WVVDWGZaelEyaVk5T2hD?=
 =?utf-8?B?Yzd6YzNCZER2b1hPWnE2VG5zSlBOdFROTUFUL3ZVNmt0b21wdWhCZkZpeDlF?=
 =?utf-8?B?N1lxSktrc0hZR0ZkMjlEbUxPZ1c4MExtL3hLNkUyQXNEUHZJWm1yVkEyY2pR?=
 =?utf-8?B?VklQUFVNVm5OaXNRbmxjZzIzUnFIMlJQZUpTVWhHSitxdHlrclZEdEo5L0Rr?=
 =?utf-8?B?dFpGWDB2K0laTGRJS1J3cVVIMWcvZU1SbU9VaWIvY2xmQXk3dm5BcmZ0bWtZ?=
 =?utf-8?B?ek8vQXRGQkF0dXNkUzJWY0ZFbUZHd29kYWQ3cTQwQ0dxMG84RjZFTlNnMitT?=
 =?utf-8?B?NjZ1cHpZWU12bDlnQ0pyak1rSS9UZ2FlR05tOXdVcmVMUzBncDdFZVFhUlNi?=
 =?utf-8?B?UUdtelF6azM0Q0lqbjVrTURyV0h4QTFxdEV5NG9lcFd5N2RSUFk1SVdFWEdT?=
 =?utf-8?B?YmVkR215WWVJc2NYTVJtYk80NlVONGdIMDFxL0VrU29EZW5SR1YxcFpuUU0x?=
 =?utf-8?B?R1dmZzYrM2ZObVU2Yk5Kc2dnRGFvSVhqSHhRMjFUSEllejFQTjc5dkhLSWVa?=
 =?utf-8?B?Qjl4dXdrTTlBL25sZnYxWG5oMTBGS1dXUzB0b2g0Z3VTUCtabUkxR0RnVkpv?=
 =?utf-8?B?TGpLN0xnTDZMK3BhUHk1allya2pLUm9qcG9UYitNR2RwQXg4M2FSNmlPbmtp?=
 =?utf-8?B?ZzhFc3pQTVZITU5pTGNBNzVUT1Q3bi9rR014R1IyVjVENTlTRmwxZHBBOGtl?=
 =?utf-8?B?UGlqa280cFRyR1loa0RVL3JNYXZzS3FBOGt0ejJqaTJkelM1QTFoT3RWTm9q?=
 =?utf-8?B?NUJuS1RxOUVyT1dNMHkvVkZZTzluS0labXArUVJwMEpBSVVhcjhiWDFwMFls?=
 =?utf-8?B?djc0MlJXWHJHdTlSMk9wWDBZdGZFdzF3MS8xSWU3NllmbHZiUEsyOUFESER6?=
 =?utf-8?B?SE92ZTU0L3FETDdCVDVMeXI0RFhIeWYyeEJmbFFrakVxakdnZTRBY00zVFUx?=
 =?utf-8?B?QTNHY0hQeDMxV0MvNEQxSVBaeGRabzZZQkM1VjZEN0U0K1pOdCsyakZ6WGhQ?=
 =?utf-8?B?bTQ2SDM3ejNrMHNLUXV6cFM4elc3cEZPSzdVaFpMWTNVK2hVaUFxYWhsRDFz?=
 =?utf-8?B?OHVLL1JCUUo2MWY0UmVnbXdsazVQQ203NFdPTmVWeWtCYmtzMTF6ZFYzNzd6?=
 =?utf-8?B?YTNpWHJVMmVpWCtqWXdRQW9LMThRbjZrQWQ3S2xMM2UwWnY0SEliMHNRY3F0?=
 =?utf-8?B?VzMraHFKSDBtL1M0NThxcWcvaUoyNC9xQ1FGSnEvaWllR1kvZHpUK2NjckFQ?=
 =?utf-8?B?MHpqVEN2OU16a3RkTEFQQ1AwMkxNaU9xeGRWd0k0b3o5ekVFcEJsdFFTWXlJ?=
 =?utf-8?B?R0FORGd5eGd2RnFVdnFGREpaVmg3RUtEdUpFQTVTeXYyUzRrRk5qU2hMb3hj?=
 =?utf-8?B?akhhcnpxdFFNdDhMWEFXRXNJZTQ4U0tvOERzaFdIemtPdXpMekRsRkQvVXMv?=
 =?utf-8?B?M0YvR2NISFpsb0NQa1RZbUhjV1pLZ0NnVVJ0bXNsY24wUXZhVzJERWNHQ1BR?=
 =?utf-8?B?WWZHMTNDS1FhVnAvbWcyOUJzVXVJeWVBTmcwcmhrTHU0emVFMGZ6SWtGTEV0?=
 =?utf-8?B?V01JOTA2MHhSUklOVXhwdnd1UUpzaGw2UFdaVk1IUHpySnYxZTlPazhMS0dt?=
 =?utf-8?B?QU51QkRheXJtSlNBd0RoZCtYK1dFT0JobFJZN2pRVjBTZ2owZHA3YlRMWTZK?=
 =?utf-8?B?c29uVlJjREJENUVKcFZDbjdsWnp3U3A5SWthTlAxMWt3RDQ1MWZxeTZkajRz?=
 =?utf-8?Q?YwFCb0rns0vXyxP9iTt5AZc/g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e502a4-95b6-4db2-bc32-08ddb2de7c5b
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:17:59.7450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2Rh6cqFkONugCmKP8G7Lxq+QeYzHztWL8c6KE8ct778UncgHpnjdYY5NJO5lLR3ApnObVz4f0ZRHFGIbsx15g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9521
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

On 6/23/25 7:56 PM, Alexandre Courbot wrote:
> On Tue Jun 24, 2025 at 6:01 AM JST, Danilo Krummrich wrote:
>> There's one thing that would be nice to fix subsequently, which is properly
>> resetting the GPU. Currently, it needs a power cycle to be able to probe
>> successfully after unbinding the driver.
> 
> Yes, what I usually do is the following after unloading Nova:
> 
>     echo 1 | sudo tee /sys/bus/pci/devices/0000:01:00.0/reset
> 
> and this allows it to probe again. Maybe we want to add some equivalent
> programmatically in the driver probe function?

At this point, we are only getting things up to a certain very early
stage. And so we have to reset like this in order to try again.

But I'm not sure that will be the case, once we have more code in
place to go further.

So maybe hold off on this for a few weeks or so?

thanks,
-- 
John Hubbard

