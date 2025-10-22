Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F3EBFB95F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 13:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB5D10E756;
	Wed, 22 Oct 2025 11:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WUZZPhzK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010055.outbound.protection.outlook.com [52.101.61.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0037410E176;
 Wed, 22 Oct 2025 11:16:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpamofq+LWyGEMsworP/5jG4bv29gfttYA6EiAtVzWS7fAbob+E37Pfw/NOog2o7fAO2PGL+YPCBwhDh90l0i/N76USGbPZhxTvIPqfCm4lMTH8+zcmq9x+mVf2qY73Z0rGZm8Ax6B/hZwsToFdXPdVZIW/BOAiB9uq3c2rfXvfHVIVq4mEXuQEQBZMhT7X0ZjzdiChW45SdrPc4al2OaoRkLw4C6glKfjfWgpV5zIjEKiJvvUMEMy+AvFjNuWefsAMh2X4LIIc9GNJiOsSbrznWzzxah6IYV16/3YR/8ayK6l+hqNxJoizGIaHa/HhhXumVoOx4S2tZSrnmTpiooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioEdcxcoLryFFf1Uk5t8PgdyjXEIn2tIntUyLo1i5cU=;
 b=FN2phYk077dRmY9RtwJTGf4KrgU9oBQ3LtJGkhzHKVB2dz9TR4eIPxuE6rPt6cJKRA7MDpRqY0Z2HNBom8uoEzfRVvPSzjNvuYQYh4c9+I2D5I/3kHcandmPGKFfCJip68zZzEW1blhoX8WFJdz2NMTqsIAojmg+6yY8je2SMeAcV30i4x/PAtig5kRVqgd9il7dPhF6kYVqfADuHuLKFelTKI+fKPRVmk/TQ4B20o+ZvzdPv09NVoCo8LDxMUiO92LH4rZlWFDfqBvl9B6d18uucUjVtQr1H785cFAoOFeFIfGL8F4RF/kYnBXpCNusi7xQF+8DlF3J6YvVL1Yjsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioEdcxcoLryFFf1Uk5t8PgdyjXEIn2tIntUyLo1i5cU=;
 b=WUZZPhzKgjiVdrd1eOeL/DVSFhkj3r8XAOHXrxdRkp8/GutLKdtxdWetTO34REaTY/KcAFuc0NFrerg4GQRODLTj0Zav1Vdc+HeE2UFz/p9v3cNmMdj1LaVXW/0ej0ahzylDLHkE5YRsz+XtuVzFumSMt/KVBBgiL1agqHBmyaUn/byvhntnBlQLdfZYWMTiIxJXqhNfHJcgZ3Nq1SbKWKLNxWuXZ12w/85ewjocbz0PCA1U5AwnGvBqcDIwqweBqjP0WZ4gG06TAU57RcyM69bhYVYAtC+nMQe6GQ5xwsEQejrj/oJuccI5IOsIqg7/KBvmqu9Jms57LWJxNgzQMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7294.namprd12.prod.outlook.com (2603:10b6:806:2b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 11:16:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 11:16:52 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 20:16:48 +0900
Message-Id: <DDOT4FSDBO47.31HWROO6FZXVB@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 3/7] docs: gpu: nova-core: Document GSP RPC message
 queue architecture
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-4-joelagnelf@nvidia.com>
In-Reply-To: <20251020185539.49986-4-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0091.jpnprd01.prod.outlook.com
 (2603:1096:405:3::31) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da2eee8-8251-4aef-6bf7-08de115c8032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEVudWU1bUlNT2hvWDA3a200b2Q3U1dCcFFYVzZxSlBaQmo3d1hpZ1RtZlVS?=
 =?utf-8?B?d1lKMlZDbzBBR3ZWNTV1K3FoUXhybnBVVnBXWmpFdEExWlorYXlWRVRYcENw?=
 =?utf-8?B?V0E0cVpHbUR2eEJYdVdvVDRNS3ZrSG92a3NRVXIvVkhKOXlpYzNPZk42QnJa?=
 =?utf-8?B?UDFQWEZ2M2JNckJmaVFMUlZOL1F0WHJrUTc5aVhLS1dVNWp2SDE3OHdZV3pM?=
 =?utf-8?B?dUJrR3YybjM1bDNVZjl6NXZoQ0VYWmNrY05oQjNweERZbXBBODJFbncrcWxB?=
 =?utf-8?B?VHFHOFhicGZ3NXorcDloTEdEMzNFMFhrWDhFTVRBSkpWcCsrQ204TFh5QUhr?=
 =?utf-8?B?NW9Yd21YS2lXK1pWRWdkaS9paEoxN1ViU0c1aHFtVDQ0NjZFR09GWnV1U1ZD?=
 =?utf-8?B?R3hEVkxOb0k1THZVVzlXbWxIblU0WTZ1bVlRbTFQaWtmVHAzR0Z2ZW96M2ts?=
 =?utf-8?B?UzZtV3k3b1o3SWRWTkpCUnFGM3llNVVjM1Y0THNSUGYrNGZ6bW1idUx5emJr?=
 =?utf-8?B?aU9pNk9Zb2FIYmFPbUJUSlUrNFZwWXEwdnNQL1UvTS9jRWp1dUFiZHJyTnJX?=
 =?utf-8?B?emVnNDhROTlnMEVKWlk3TFpkV2RBR1lybVBsaVA5QTNrRFJBLzc0VGs2TGNl?=
 =?utf-8?B?OFBQUHczNytMVzdaTktCNm9IckFKZDBlNmpOa2VFUFdNMTAvb3JFazBCdnVn?=
 =?utf-8?B?bHhWYWRRUjVqOUJGRTVnNUJSYlByeDRRZlBqaWNwSkxEQUV3T0lKNWlndW8z?=
 =?utf-8?B?MkVLSzY5VXhhVDJqT1J6OU5PVkZ2bkV5S2MxMVRUUjh2L2FXVU1IS2ZnbTBz?=
 =?utf-8?B?R0F5VXFwNGhlZC9UTUpnSmIxNmpLZnN4Yit0R24zbGc3WWtOZEZzSGxyV3Ix?=
 =?utf-8?B?RmFHZ1RRN1dEVk5uY3VzN0Z0akozMlBZMm1yVlJaSnhhc1F1ZjFwaDErVlk4?=
 =?utf-8?B?SGUySHN1NXloTUNKQTliUTRwZVdTbUhER3NteE4rSUNqOUtZbDkyZTNJaGMv?=
 =?utf-8?B?S01OcFEremtZTC9aSGxndlhpVTJhRGtFOVlyajRRVnZPcVpRZ09HbkQ5K1FV?=
 =?utf-8?B?ZUVNcFhoeXZ0VWpiN1c3K1F5NlZhSllBU1NJdlBTMlFzdm43VDBLTFUxTGxq?=
 =?utf-8?B?R0ZUV1MvZDVQcHM5clduWkUvci80TVJxZUdIQ2lGR2kzeWNOM2h2RC9uL3Zv?=
 =?utf-8?B?RmlpMlB6RU14Tm5vSHdSMmhLRFptVFliakxZZGZYeEIzeWhkVHpPVjlHV2JD?=
 =?utf-8?B?d0VoT3hnS2NyVnNxMmNDVnN4bVVLYmJmMkl3YXFJdC80OFZ4WThRV1lPSjNT?=
 =?utf-8?B?MzU0aHNBNEtJUjBlZ1YzcDI4Y0pMZVNzUk95ZmVaVTlBUkcwaGt1NURPSnRF?=
 =?utf-8?B?Z21LZmpSNnB0ZTljVzk2SUI3clAxdTZZU1U1dGpvNzQ2ZkRjRTlScU1UZ09X?=
 =?utf-8?B?SlpIa2tmRS9IVW9oVTVQR2FyanhEZGljem5nWERyVWl5L01hek51d21jTFkz?=
 =?utf-8?B?bXpZVEV4RzdrYjZkcnJ2T05DTUF4cXIrMmkxQ2tUZjlQR1RyakFmNzlUQnZ1?=
 =?utf-8?B?RzZ1a3NRNnAxdzN5UEw1MWJMTTl2OUh5UWFjMXlHU0xNcnNGMkdDVlh1WW9D?=
 =?utf-8?B?OGlUZTJjYlFhM2N3MHBRdHFNRW5UZlZhUXFJbXppRTFPcktnSm9GRDZhTTFW?=
 =?utf-8?B?R2pnQkNYWnNFa3VHSDZmWUVzRjkwTWdKSnh1L1h1anpKU09qRlBPczVCNWcz?=
 =?utf-8?B?Qm5Pa1dYdE9ZRDUzOXRoZitGc3lhVDJubWJqRUQxaXp2VkNTUHpjaGxDWWJR?=
 =?utf-8?B?V0I3KzI2SHJIc3JkZ3RpNjIyNWg1OEYvWFpSRDJSTmFwT1ZyTGZtTEdCaHk4?=
 =?utf-8?B?bEl6WTFWN29mQzkrYjliWlkwVXoyMncxL3pEMHo1K2ZYQWZZSWpuNVdTN3FV?=
 =?utf-8?Q?UHMiERST8hp7iQRdy2n294pCAZzeMaM7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmpXOUN0NmswNmtEbzdLMDlMVGxDbkRyK2xxTkN2ZEl3N3cza2gyL1dHUVNz?=
 =?utf-8?B?VlRSaFVSTmNHRnJheVp3WlJkQy90a1UyRHBnMkI0MEZaUEpaZDNUNVVtU0ox?=
 =?utf-8?B?S2d5Zzd5WUY3OE8xNCsyNFpwWmk4M095WHorcWZiSWJuRFcxZkdteUVIME9k?=
 =?utf-8?B?L2JiclVPd0VUWkhlTW1WRjhwWXFqK1R2MTV3cGNPYWlZL25JMFVGMTlpRHhx?=
 =?utf-8?B?a3NiTVRSMHVHN1BRaVU1OEtycEhXU0RMRldzWHRpSGJ2Ly84cVord3FFMFd5?=
 =?utf-8?B?TmpvTlZwQWhsaFFid0I4aHJqdzkwanJIcHMwTFlWb1N2VWtXUys5WWJyUm9j?=
 =?utf-8?B?cFZrcDNRbkN5NTV5TkJER2ZPMnBKSUQ3WW9yckI3RGdteDgvMFJibU9oR2ZH?=
 =?utf-8?B?UFloWnErYjVxY2ZFRzRwZnV6NWliUCtJUE9FYStpcEcyV2gyRHphbm5vZ0lt?=
 =?utf-8?B?S2owNGU3bzhncE9IR2dkMDRkU3pKUkVyMElTNkdTM09jOHJUT2tGQ0ZLa1hw?=
 =?utf-8?B?b2ZCditsb3NPaEhsWDVFblBMSlNCWEhwdFdOZzZ6SkpPb3piNTJUbmYzQjM4?=
 =?utf-8?B?SW1NaFB3eWxGWG1vUmk5ZFVzLytuZ21OVnhSNDgxSFBKaThZcktZeWhLYzB1?=
 =?utf-8?B?b1NGMng3Q0g4Yjcvc3VaM3BLclJDdXN1SFprL1Y3MVhjZE9QZ3dwUVowU0hp?=
 =?utf-8?B?QkxvSEQ2blNsdU53RkYvZkN6dHpJTEJGTWlZVVVJWS9kTUFWMFlYSjJoOTVP?=
 =?utf-8?B?WHRqTnhMbWdzUnBhWVpYS1NiRTdLVVp2NGc2TjEza3BCUSt1NGoyc1pqMGEy?=
 =?utf-8?B?Uk9kR1ZINkF6TXRFdkpwbXM2NmdoZG44T242OTVRdXYrbXd6eXNLZTk2RThB?=
 =?utf-8?B?ZU1BaXhLYWJacnBCbkRiMGxjREJTMU5lbUVSNXFmT2lPNk9ocFljMmZiRGZC?=
 =?utf-8?B?M3lxcitLSzY3dVNQcDFjUjI2VUJINmJoNkNsZFI2SFNMc3NpZEE0K1d1TEF6?=
 =?utf-8?B?aXd2STZLNEVQSkNHQTd3MGJEaDYwSmNsVSsvZnJpRzhQeHFtZG5mRzNLeE12?=
 =?utf-8?B?dW9KV1poWDZRUzIxcXR4emdHblRLbHk5YXE1d21kRHFhM1hpT1JjSFJTOHE4?=
 =?utf-8?B?a2tHeC8xa0lWSVRtWTlqYkRVTUtROG5RNmxmaDlDMHNpTXBGT0tMamo2RVVP?=
 =?utf-8?B?am1qT1hKdmNYa3V0d0FkdWRkKzJTaWNGd2dqc0tGSE5iM0NYcm9Sbi9uY2J2?=
 =?utf-8?B?WC9FalNEeDQ5aTZneG5oMHVYQm50dlYxK3NrV3IzVjQrT0tudFZVMzNLOHNK?=
 =?utf-8?B?TmFndGdKRHJvY3NqNVBmeWtNbzdTS015bjNZNEQrYXBuNDhaT2VHMXZrSEV0?=
 =?utf-8?B?UVExRGNRSjE5ak1HQlRKN0hEUzBDYnZNMjFvRFpQTkdPNm8ydlo0NUhYbVRl?=
 =?utf-8?B?VDF4MFJGUEZKTjJsZnJZWVhXUFN5K1VDVjdYOFFicmR5VW5WMlJDK3NvK0Fh?=
 =?utf-8?B?RzJTNU9uYnVXeTlCeUNnejdwNFlXanVDcEZudHFBYytldS9aSVcvUVpCV3dw?=
 =?utf-8?B?dDB1NXp6Uk1EajFWSVBsR0RMNDU1QTNKSnBEM0lOa1Y3dEhrSHoyZnpOVUtV?=
 =?utf-8?B?a0k3dkhBeWdOOFZHR1RoMmcyaURHSXNrZlFwTUpUS3E5NHUrQzYwMXErM1Rh?=
 =?utf-8?B?UGdvaTZuSHhNaS8yd29EVXZibnhiU1JWbkJSeWtOemg4dnY4enIwMzJ0ME5l?=
 =?utf-8?B?ZUV3Q0M3WjFSczhMV2N3U1lYVEcvaFVCc0ZGNitEbmtaVlVtREJhMVBzY3VT?=
 =?utf-8?B?OVF0c2hJU3NoOFJOOFFncG5xTWVwL1ZmNzVWMVNiZzAyTlVtTFpPalpYU09U?=
 =?utf-8?B?bzA1OFgxeHNab24rSWpndW1aaEJ6QTFDaWIwRk1tc29ma0pxVDNaOGUwemlq?=
 =?utf-8?B?L1hSdGl1b1Z4ZWU3WVRRVUpqbnVpVzhqb2JZUGpWaFUveHVwdlUvenN4cVJB?=
 =?utf-8?B?MzhCbDJ1bTdHajRBQWZKcG42MEJXSjN1d1A5NllxT1N4YlFXN1BNVWp0SVhp?=
 =?utf-8?B?cGxobHV2R3RQdldZenFER01tT3VZcldUUHpVM2lpY3hkNllNRzFYWXhhRUNJ?=
 =?utf-8?B?dDdtWUE2TnBLWTNKZjBWZjI5Rm8yNUV1d0ZOa1h3UFpnS2FqTVdlMTF4YVJw?=
 =?utf-8?Q?5Y6rg7g4VnAUD6/zLMcRcM1Q0bv4F+qUElcSi9ZJBqgV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da2eee8-8251-4aef-6bf7-08de115c8032
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 11:16:52.0437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9zJcir24zR/ucOgD1tuyFizYGYKKl6SvmpsXu918BAW5q2Am6k4jQrqiePEZbi6zSbfBCxM+/7th63QLpXDiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7294
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

On Tue Oct 21, 2025 at 3:55 AM JST, Joel Fernandes wrote:
<snip>
> +When the CPU sends a message to the GSP, it writes the message to its ow=
n
> +queue (CPU queue) and updates the write pointer in its queue's TX header=
. The GSP
> +then reads the read pointer in its own queue's RX header and knows that =
there are
> +pending messages from the CPU because its RX header's read pointer is be=
hind the
> +CPU's TX header's write pointer. After reading the message, the GSP upda=
tes its RX
> +header's read pointer to catch up. The same happens in reverse.

"The same happens in reverse" doesn't seem to be the full sentence (I
guess you want to add "when the GSP sends a message to the CPU").

> +
> +Page-based message passing
> +--------------------------
> +The message queue is page-based, which means that the message is stored =
in a

"means that each message""

> +page-aligned buffer. The page size is 4KB. Each message starts at the be=
ginning of
> +a page.

This last sentence is a repetition of the first one of this paragraph.

> If the message is shorter than a page, the remaining space in the page is
> +wasted.

I'd say "unused" instead of "wasted", since this is by design.

>
> The next message starts at the beginning of the next page no matter how
> +small the previous message was.
> +
> +Note that messages larger than a page will span multiple pages. This mea=
ns that
> +it is possible that the first part of the message lands on the last page=
, and the
> +second part of the message lands on the first page, thus requiring out-o=
f-order
> +memory access. The SBuffer data structure in Nova tackles this use case.

nit: enclose type names in ` (i.e. `SBuffer`).

