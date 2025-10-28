Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1696DC1748E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15C110E6A4;
	Tue, 28 Oct 2025 23:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hjDYPLWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012054.outbound.protection.outlook.com [40.107.209.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056A110E69F;
 Tue, 28 Oct 2025 23:12:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ph1/3N95tpvjkjPOE0VC4EMnS9dipbuW7eXvHvq74JAwO0NL5b9jvB15TVRJ+3+KYP/B+9fDyd1FrpQikczewahmsD0AEOVeJySpjWSa08VuFfzi7S1QfC8pJknHfvYyQP7aObOFAnoQzsEdYRLMi11JrZNWI2x/qgZt7/8PhEmOL2JORGD623vDOA1Ov7sEtuZR2DnVVotvIznEIl55YYoptfBsv9GQ5N+jvQlCYqAycVIx2E5NlwQWOMp/3vn4EVYNN4vjv0TsN6ij5UI6PZSshKMZeb+lUBTE4UcxJqyRHyTzFmg6AxI4DNvgEoZ3WEQ/zKuvCGMqpg/s6qI1Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVOruXX1UtjSiHzSpnyE8ZA9GbiJ+E4Y1LtbQtuB3qE=;
 b=g6KNLMzrx6ubdoez+yFxednfxmnYB6WiBSW/FlnPJ0IpzroEHG+6XJrJpN1XzgbAUIBF6RZ9SNHRIeRSVMxd1wRrbppyy9vSNnezQJWbQqCvuq1oUrkSID3B9pg7bSX/fnkuqPA1Xbz05udFlLngMhgZYdB75PbNJUyzLSmrjq+/S50IwuDMqbcnf5pCzdv93EBd9yWB8skjUOyqXUHZlLpi7bcjyf9XF3KeQvGEh+fBKUco9TVKH0KnO6v1DeEeKQhBd2YkQ7hpRvZq82UxktLSP7NNvln8eNM2YpVUCIgjKYhKu7/homfSI0HAGkqWhFRg9WxOBItXz/643uhocw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVOruXX1UtjSiHzSpnyE8ZA9GbiJ+E4Y1LtbQtuB3qE=;
 b=hjDYPLWtTgzp8G7O2Dqgi71fXIP1AYlV0fbzRpDQEyscHyaZ0B0nDhmxRhgKhQITzGYRaMDC3WNlyUnbH5xOMd/2BqiwMwebPL53PqNK1tniNaTI/QaVAmWLEsSytoy7EFg5ei+N9JHWis6AD418g8b/WenKaN79AQVqvX5m2abliyKFK/LRBbLRmUHeG9vd7IXf4Qw2+JcWG6FK+Yu1Ly7ONIapiTVTmvDgSYyccMwUyp4Wk2/jfrPbNbgPEG907XIuxYRn/lbJWHkbGUzEgPsmyJT8c+7zXNpYrdtZSUHJk3HlAzVfiSEqhq3VrONrP2LbTimVjwl9lTuX2Q+b0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PR12MB9646.namprd12.prod.outlook.com (2603:10b6:610:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Tue, 28 Oct
 2025 23:12:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 23:12:20 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 08:12:10 +0900
Subject: [PATCH v3 2/6] gpu: nova-core: vbios: do not use `as` when
 comparing BiosImageType
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-nova-as-v3-2-6a30c7333ad9@nvidia.com>
References: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
In-Reply-To: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0209.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PR12MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c2cc61-d720-48cb-5dd2-08de1677722b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHo0dk5PTklkYUZhMFNhYkpTR3lCSGcxUWVZYzcrUzEvNllYc21HSjY2Mkg2?=
 =?utf-8?B?cUFPcUQrcDlsSCtJL1lqYjg0WW5PQXVjNGVNZ3VhbUtMWTIyaGVqVnNhNmFu?=
 =?utf-8?B?elZkWVQ1TENMcXFTREVacTN1aS9ZNTNjNTRSQ2NBL3oxRnFVbmdubDh2VGdt?=
 =?utf-8?B?Mzc0WkxjaUYrUk1tRjVmdWZLWVNDaThnaWgyZXFMN0RVZE4ybWtsZjNuaGdn?=
 =?utf-8?B?SW82ek9DdEJtRmxBRXRnR1NEVkVPcjZ5NHBWMzJZdVp3c3J3R1dzWlFYU3l6?=
 =?utf-8?B?QmljK2tqRzk3ZFFrUCt5MmZPVzBvTzR3Z1pFS0l4cEdrc2Iwd29GOXFCa2JH?=
 =?utf-8?B?YTJHaCt4TldLcm93N1A1ZlNnVnNyZUtVelc2L1pKTk1hdnFBNzJXeFZXUW9u?=
 =?utf-8?B?TXZmVTdTdXgzMnZjUDVSZ2dKSHM2M0ZCVEdSOUJSa09BL25xQTRYWXA2VStV?=
 =?utf-8?B?UlQrVENKeXY3c0hKbmNhTmE1OEZZajZVb1JBd3NYUEJ5TXp5MlJoSldTSGpU?=
 =?utf-8?B?K3YrdkdWeXJMNW9kVVIraEwzdSsycGEybXlTWndwcGJRUS9hQ0FISEJ0UDFH?=
 =?utf-8?B?ZzdhU3lJYk1vWVpLWHp6YVdrc2hVRnBiS3ZWV0VDYk02NzdkN2hBd2RpUWN4?=
 =?utf-8?B?TEpmVjZ0YWp6Nmd5WkR4dFRJVTFraXRCWVhQd05idHhPS21HMkJSQy91S0F3?=
 =?utf-8?B?QkVNSi96ZHc4M0plMjhZUU45SWU0V1NsS1pMU1BKcGM4Qm5EOFJUWlFQUFFX?=
 =?utf-8?B?UU52Yi80K1FzMFFoaWc1L3I5TTRVNXcycXlYdXhNUGluYlRjM20rb1F5QnNs?=
 =?utf-8?B?cVdGaU50UTI5RmVoeFJuSFdQM3FPbnhrMitIb3NPV3o0RlBVMW9jclMyQ2w2?=
 =?utf-8?B?M1hpVjB4TTNQNmZVK092OTB2WkZIbmxXY3BjMU5ZOGhMS2s3Mm5lN252R2Yv?=
 =?utf-8?B?QVM5WktoL0s2RFp1OHR0UmhzaFZIcUQ3VTIxRXNmZ3VjUHp1V3YvS2ZIZ0xN?=
 =?utf-8?B?OWpDMEtEVDNnV2t2UUplZmoyTldvZU1BNmsxelM3MEw2ekx6T2tKbHcyTzAy?=
 =?utf-8?B?eWIrZjVEUjE0WFZQRUF4SXQ2bFZ4SEZDUnJtaitxRm9ROUZ1bEs1NXd6Nmx2?=
 =?utf-8?B?ek1RcjhBUzVwNUxtd2FZTjcxc01Fb1ovRlozS2pvYmVYRVd5WVlMSFdPbTZC?=
 =?utf-8?B?amFlV2hMdk9FQmZhQ05BRHJBampMWjhaMjViMTJpaFpXajgvODRZN1RSQXJa?=
 =?utf-8?B?L1U3QmFQazRyYWtIdXNtenB0Q2ptQ2VEM0ExeHVlbXorZEs0TWRRbkJqaFVI?=
 =?utf-8?B?cnMyRzJ6aWt5Vk9sVS9nWGVBdlJpVmZOb1BZeENMYkpmRkh2WWdydjM4cGsr?=
 =?utf-8?B?UGpaUmNpYW1URTRiT1Z4VGhTZjJkajlaQ3FTR2VicGxDUG92dkVqQkVmTEpI?=
 =?utf-8?B?MFd3QTI5RU50RUlOTFlWRXdRN2RycmhwSVF4K2ZVdCs2QXppVEpwNm51cUVK?=
 =?utf-8?B?cmRWTVNoT0dUSE1iYjRhN3FjaUF0Y21oblA3VG1qcVVxcUo1RHROQnFpM1dG?=
 =?utf-8?B?WldrQlMxYWFQN3dMTVRxTDJvZC9tVjBIK01DZGs3Z0pvR3NxSnpzOVN1SVFh?=
 =?utf-8?B?Z1BzVE9OOFdRTG81OWRlL3dxUlJUN3pEMjgyU3l6SGVTTGs5N1NsN1phZC9S?=
 =?utf-8?B?RFIxRHo1b0t0ZURVTUx5OSs5TUo3NW5Va1ZRUkZ0NUdoaXpUUXVqQzBlV3pK?=
 =?utf-8?B?cUhxMTY4dWdTK2FJVVFBYXY2R3JneEhIVzJ0ZUUxc0RZeWh4anBKVzJ6a3dJ?=
 =?utf-8?B?dlFPSURjclFoWWJmdDZhN0ZQOFdsSS8vcUVIVmtpYkpnaDcyRVJkV3JCWXYz?=
 =?utf-8?B?V1pCL3VaMU5tcTljRUhNdGc0aXQrZFJZVHFsaTlGV1NTdTMrQzlPRlRDbkl6?=
 =?utf-8?B?ekNoeU5zWTJIZVhab25PaXFnWjAvQzJsMFRsbVM3V1A2MVNVVGQ1cDVrRlk4?=
 =?utf-8?Q?t6m27M+/8nGUsCvXQUvZBp5dnrWTy0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXBiWElZTFpqQkZLMCswTDZVc2Evek1URU4zMDVqckR6RDYwNEIySGNIU3A0?=
 =?utf-8?B?T09JUHhWN2ZvUDhLS2RycEcxM1VldERpenVNckZTZmtoaEpPZEdNcE91Y0R5?=
 =?utf-8?B?cFFoMTlhaXEwNmF6dlhhS3c0YkFCd1hiQTJFeU9ZbHk1cGtENG85c3RYdHd2?=
 =?utf-8?B?N3dkQnNxNi96ejN1S0FNWndOcjByaUhpbUVYWGlYendzOHlPQU9JTnZwK1hJ?=
 =?utf-8?B?VzZhRGtKUkdwekJoOTByZTlORGdXYXRRRTUyL2RwY2JZbzhnNHdhWmlUVHR6?=
 =?utf-8?B?b3ZNeEYwVDVzUlhLb2pGOXJKbHhOY1lNM2FEcm9XMkJyRGxxaUZyUTdKVlAv?=
 =?utf-8?B?RnMyZ1c0TzdkOWN6RU44L3FSTDVZRmhqdmRGNFFmSXh4a3RGVVRtMTgwQWFl?=
 =?utf-8?B?MTM2VmFuLzI3SU9VRkdTRDdkRFZZTi9TSUtjU2dnMXgzUE0xR2VqVS9ENm5X?=
 =?utf-8?B?UXFTQmcweXczbGNBQTVCKzlvQ21odHFTVWV1Y2ZmSUVnY2V6cjR3RnorZU5M?=
 =?utf-8?B?b2FBNDUyL01VT2tZbzA5cGpkdUxSUTZidDZDOXNabmtBR1hNcHpNbzM1ZGNh?=
 =?utf-8?B?NjBPVUEzTmNKR3NpSHBsL05GSGNVcEFRaEZxUmRYRkswR2hyRjdjbm1TUjhF?=
 =?utf-8?B?MlRnNHVBWFE4Nkx2YklOSGZnVlVtVHdJaU9mWFVPWk1sMWpmWlNRQnd0Mkta?=
 =?utf-8?B?ZWJYTDh3OCtsRWY0YVpBTGNHQ3A4RTRtb0xCWVR1YU9XaWkzMHdtb3o4YmtV?=
 =?utf-8?B?TjZmMG9GOUhIaFVMeENQY0lRTTdrZGRvQWE2WSttd0x1U1VKekxFZklidU04?=
 =?utf-8?B?Nmd2eHAxSWcyNHA2STFKWEJkaHBkVlhjVnZqWm1vYlZWK1hZcnhobjNGN05v?=
 =?utf-8?B?cjJPbTNoWEdOamRidklFU0VOZkQxMGtwSlBpeVU3d0xFdW04NERRQ1A1Ynk3?=
 =?utf-8?B?MWFqMVFYZ2VDMFJZZ3JxRUVWdVVHUVhYSEp4a3ArVk83bW11aTlFMDh3VGRH?=
 =?utf-8?B?TVR5VVJWYUFwRjFrc2xzWW9jOElBa3BIS25LOHN4V3U0MU9CdEt1SlloeWdN?=
 =?utf-8?B?UGFsVnNUR1FZYllzd0RKVnNSMUptbHhYQlN2cHRVS203czNnY1dLTk42S09y?=
 =?utf-8?B?MnRoTEVobW43cFJPeEZhRlg4ckg0azB4RS9ORExNTmFpZWZCKzFVWk9ZRUxq?=
 =?utf-8?B?Nmc2QkRrc3RKY3Z2SWxqY1pWSlBEQTRlSHdXV2hSSWVaTFozUWdFSU9ZR2RO?=
 =?utf-8?B?bDlaSW01MFdaSEpkK3Jjd1huUXJXTHJZSTQ2RksveDA0aTRGNUhMQXN2MEY1?=
 =?utf-8?B?VGNQSWU3UGgyM1B3RkorK05Dd0Yvd1hERVFTL3hqMVpkOGduTFpGT3pKVlV2?=
 =?utf-8?B?Qm5vT1RrYVZrZFYwd3N3UnpDWGgrbmVtL1NGeWkxWTBhL3paRXREMjlnUC9C?=
 =?utf-8?B?azY2S0t4VWMvcjk2N0ZkUTl3eGdqNzBRRDV4YnZhdXpBZGRwc0RMc3hHWWVu?=
 =?utf-8?B?NmRobUlvZExnNlpYSlB5dEtqdW4vRHJSdnk2R0J0dW91NzJPcXNYWGtLcENq?=
 =?utf-8?B?OFBkNTBtbHlqbEdnRHdoZzNpNUV3SzRZV2FWWUM3T0dwRVpkV3lKRzdmZ0Iv?=
 =?utf-8?B?RzZYNjBmR3VOZ3Fvb2FZRzhTQ2FTRURtelBTc1BFSEc4QkxlK3ZmbzN1Mytj?=
 =?utf-8?B?dVFZdDF2d28xQU45N2JsWGJseTdsSjZ5UnlVQTF0UE4xN0RmVjZyY1FLelQr?=
 =?utf-8?B?dnN6aTZQNXI1RWwxMzhQdGxvOXZ1WUxPNXBjYkNqaE9JK3BEMUc5UkNMdFVj?=
 =?utf-8?B?eUxpV3JCMjhsNU5EdzBIWEl3enFiUEZjZFd3cVcrV3ViUUNXeGsrS1MxVmFo?=
 =?utf-8?B?UEY2TFpDOE9zMG9tYlpGL1FMYW1HOU82dGpKaUdFMXpob2RFTko5MFl5UmJx?=
 =?utf-8?B?djBBbkp4UVNsR2R4TkRhdi9hWE9CWXpZdXMzSmZURHFXY24yRjFjamNOSlpo?=
 =?utf-8?B?T3EwMldXQ2d2T0lVc3grb3NSVHR5WHM4MXZITE5TL0t6aXBuSCtwUXg1UFpR?=
 =?utf-8?B?UVZ0Z2RCb2lRaXExTmhWb1p0NmxVOTBRVmg3Sk9iWkhxZkFUd2dENENqbHQ5?=
 =?utf-8?B?a2R2Z0tHaTNWRCtPTkt4TVN2b2d1NHdNRUZheWdKd1U0ems2TkgxWlVuNWVW?=
 =?utf-8?Q?tFK+BUERnqs8uMyglabnrQqT5GvjxUNnu28fprYrTAVS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c2cc61-d720-48cb-5dd2-08de1677722b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 23:12:20.7190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geOOTlliv6rm5+LRFnY7sX6Y7UErI4Va1TSkzVkyKuM+eDdZ6kyuhBxd/voSnQjYbNEZFn9JYSy85aFkWxMLIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9646
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

Use the `image_type` method and compare its result to avoid using `as`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 74ed6d61e6cc..7c1bf10b2eac 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -709,9 +709,8 @@ fn image_type(&self) -> Result<BiosImageType> {
 
     /// Check if this is the last image.
     fn is_last(&self) -> bool {
-        // For NBSI images (type == 0x70), return true as they're
-        // considered the last image
-        if self.pcir.code_type == BiosImageType::Nbsi as u8 {
+        // For NBSI images, return true as they're considered the last image
+        if self.image_type() == Ok(BiosImageType::Nbsi) {
             return true;
         }
 

-- 
2.51.0

