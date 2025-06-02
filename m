Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393FFACAD24
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 13:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B0A10E4FF;
	Mon,  2 Jun 2025 11:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LruZqRnn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E4010E4F9;
 Mon,  2 Jun 2025 11:21:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ls0PWCtzUJxWMNMyCtDeJThp9ATli7PLH/xz8a+9PsfLdPOR2nv+6aPdV/ecB3iV9xN9npT5iwRCqZOXeOULGctuEl7USRPauH05fGGT8WcdXgkwnsDL5wTDj0gVrYJtRBKTjxFtOCfG1X66RlniZGPRIhsRBCmqFOUVSCTvq2RMlceliaIbyq+/QLJu4SD8fv+Am255Iarvw3Sxc7T4zcmusWF9NOHa+WCOdjpgPlm763IV+dD0RayIiWDY+3GTsXGdh+srFp+NxJFvBanz8HUmtGGLBceGXtqx1E9zzPnwqxmJOtLzFO5VRBtvSAuJGDtkPQVkO0trXbjhJVZ8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TH7WUjJ02MHkCk4TSsvTMiSe51NkDB85kJHaYZCdwsw=;
 b=FmWcAMWoW5MM4k3jHjjEJEIRy6wJS2ewodqfE0ZWTgZEJBRlmeY4uL6qYo9c+0jE/AGEYsifRhiYBPskf5WmiykxD0Lm44G19o2WtPuX/Y7j5I8vqcXjKMKaUBlYLvLASSAN4wCbBhq7S7m3EeTFZHEW/pd/ZiS8QehU9OrA71ZxEXtYoczmoaoVaS6zlph4b1tfb6nzfhSDMbqx46qeUC7CFDAKoxNoPEFieLunsYUpP77d49UBZ0wpJ7wF/1efmyjunHS/wOFYI8dCQpagnr3iZKpyXUKqgJzelDv7DNhS2CMFa0A6DoJPrgcSK7zuIRyNP5qDPI0V6Ad1BoWA8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TH7WUjJ02MHkCk4TSsvTMiSe51NkDB85kJHaYZCdwsw=;
 b=LruZqRnnxiG2v+/V1GsZyI93e6p3DymOuCUAelGTuy4UlgDlL8zeD2xXONorSWxXis1IlG8KR3igQ0xMdzj9/RK/3p2W0DadCvt3KVIAciCiweCxgHvQhDggQUnwrQ80v4kexj1bAUnGnA8QQbbutjWQzG8wWe1dJtYEWJlF0xpJoOqRjMUv6qKJN6DXbTRYkmXGj9kZopet70MDTBOZCiXDasmLnHSA6IYApKlOaD1Qpq6dDLUHQOjlzPowEBHKH8TXhnvm9Rs+3GXt4/Ik8SiKAt6d5ZpRkqFKdqCcgZRgmFu0p7LiC7fi0omCd8nW7KlCIYEvnE4gUOB9LVM0CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7250.namprd12.prod.outlook.com (2603:10b6:806:2aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Mon, 2 Jun
 2025 11:21:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 11:21:24 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Jun 2025 20:21:18 +0900
Message-Id: <DAC0AJ11ES22.1Y79LA44FCFX7@nvidia.com>
Cc: "Lyude Paul" <lyude@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 11/20] gpu: nova-core: wait for GFW_BOOT completion
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-11-05dfd4f39479@nvidia.com>
 <adbf5fa1104978df76ae40705e5df13dfbe59bb8.camel@redhat.com>
 <CANiq72n42hbKPmED4PnzCADsy8iM-i0R2dizypTd_Vui5GctJg@mail.gmail.com>
 <aDsUGGrjbJ_8KyrP@pollux>
In-Reply-To: <aDsUGGrjbJ_8KyrP@pollux>
X-ClientProxiedBy: TYCP286CA0111.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: b48dd634-9d06-4542-82aa-08dda1c79b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlRiQWdlaDdORXBNV3hIR0FQSnNTNmRVR1pkT04zcXQwUE9SL1ErMGVMblBY?=
 =?utf-8?B?bkpVczRHU2p5ditTaFltK01kaVJ5bi93eTlNT040Uk9PSmkrV0hBc2cxamJE?=
 =?utf-8?B?aFNQa2c2SU9KRHlnZWZYdG10Z2JlNVRHQWhQUkx4VmxFd2hCa1FoOXZFM3Rs?=
 =?utf-8?B?dmMvWCt3WnZjVFFtVHg2WHU2NkpKZGdDV1lYcjJKcjVRV0hDRUo0VHJncnIv?=
 =?utf-8?B?MEN3SlVJUWJvdjhOV2U3bXcyNDJrVU8zNXdaS3hXZUxXZG1DeldMTCtlRnUz?=
 =?utf-8?B?MFMwV0tWcjI3VHFZZnhRUjJRREdsbldPZldFZWx3MHJvT2x5bnRuVysvV2cw?=
 =?utf-8?B?azU2a3pFaEwyc0JQejRqRlZkWFo1SmVKcDRlVUZpc0dsczk2SmxhampuSHdL?=
 =?utf-8?B?UW1tRlo1d0R2RzFmeFNZODI0NGNNd1ExUXNUMDRMTU0wbFZTckkwRVV1NG1O?=
 =?utf-8?B?K0duOGJjU2wrMEpKRTlMYVdyamdYd3RDMWZXUDhqUCtUVHVodHlBdWpDekJK?=
 =?utf-8?B?NlhmYmNVSjZya29UeXd0U0c2a1hLYytlWUR5ZDQ5M2JHRHpSZ2hQVi9kcDRW?=
 =?utf-8?B?Rk9GMnFZdWp5OFVBQVVqZFRhdnlNWUFKNG5MSWtxQVRXdjFncXYvTlVlZlRN?=
 =?utf-8?B?RG0rUGxvYUpkbFR4OVJiMHIrZ05QOVplVFRDd2hJa1BEbGs1alRQZHNQK2lw?=
 =?utf-8?B?allQbmVKNnA4bVFkZFZJa2ViN2FYTGpvOHdNWGtHZTdsd2VpWDZOR1dMOFNH?=
 =?utf-8?B?amt2d0doV2hwVWZmcURjRG9yK2trQUcrSDRzbWg4bXE5eVNabUlLVGFXOEpt?=
 =?utf-8?B?RCtLV0I0TS9ndTVlTUdMcmJGK0JicG5tY21hUEZRMi9seEVmL3RjUWlweC9w?=
 =?utf-8?B?cjE5K1A0LzJmZE5WcVBucjN3cGhIOTN4eGNNKzNLQW16ZnlKd2NpR29YRTZK?=
 =?utf-8?B?SVRSMExTWmRxZnNKTy9ud2hNTDFGR3Ztd1hEOU04czlEaFdKamJTOXFtcDB3?=
 =?utf-8?B?aHBwd2FCK0hIaDhXV3E4bWtoMzZ3NFZJQ29uSkRSNXUxeThySWRNc0NFdlRi?=
 =?utf-8?B?MG9wYit2eDlhblAvMWozeDBtR3hvRUNFZUtWNk9xdGl0bHlpeDZJbE8rUmRl?=
 =?utf-8?B?WGJlclBUUGNvZXovb1l0eTQ2K3JKeXF0dGNwZTZ0QVF6M2tVSW5hYjVpSENV?=
 =?utf-8?B?V3g1NXdWZElJVzRNT3VzY2NPN2lSWklWY1Y3VEJqaCtRbjhkZVFWTXBTSmNO?=
 =?utf-8?B?TkZheUdIVUhQSUFpaDExUmVwaU1jNGhmanBDNEIwUXBnbGtwd1dLeWdHSi82?=
 =?utf-8?B?OWRUcUZ1akxaTEh4WFl2cG9sK0ZJQU5aeUc5K3BybUF1ZHluT2tQKzM2VklE?=
 =?utf-8?B?dHk2a0RETG15R0pJMlV2TkpBNHJTdi9iUEdvMFlmNitDRW5PYzQwcXhmRHha?=
 =?utf-8?B?ODBFRVVVUnFIT2hIaHhUbHNzcWkwUzMyMDRTTkk0WTV2OEI3STUwT0U4TUN1?=
 =?utf-8?B?ai9pYlZKamZoUGxERDZDNHRyTmt5dWViYjRLb0c3eUlQcllWZWVkRVZTMWxL?=
 =?utf-8?B?TUVQa3UrU0FBMGljb29FNFVlbjBQdFo5MVJyNVpzdnlrN1FHU3NNdWQwS2E0?=
 =?utf-8?B?SHhiZTgvcDNCakVmZUVBbnVNUTgwYWVvZFMwSXpqM0twZE1JZUMxM2d2aWRu?=
 =?utf-8?B?SmxqblA0N3NyZklmVXR4M3NCb25raWNlRVpPR2xvNVpzeUhJYkMvVXNRQ2pk?=
 =?utf-8?B?ZjlyUGMvNnVsTm1hVEpCRGp0dmpXVHB0aGVXODlneG8rOTBnQjdwUVBxK3lk?=
 =?utf-8?B?ZlRPSTZPUGMzUnlWVS8xYzhleWtxSnlEYm41a0orekJENzJPZDlUTjVLQkRM?=
 =?utf-8?B?K2VoV0l1SjY1Uy9JVXcwcHYrTExyVU1BS1F5WFRJMTZLV1YyT1czc0NqUmg4?=
 =?utf-8?Q?pTU30GQwIlQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmdVdGpYM3h4ZFpTUDJKMmZ6dUVEajYvTkNnbzFXakFKTUZtV3gvcnJUWVZx?=
 =?utf-8?B?Uzh0cnFUWTdydlVFODNHTW02bVVQVFNrbUlOVTVhR3A2VW5ISDhNLy8yM3NN?=
 =?utf-8?B?MFpIUzQ0cTVnQ2FaRENCd2R0bSthcWxBaUl3b3V4TDhMYUJ4MnhHWUZmUDV5?=
 =?utf-8?B?Wm9ZOFdwblFONWdaNHFCcDVQeFlrUWlBcTdONU9TRktrV2Fib3V2bG5ESWdu?=
 =?utf-8?B?RXVJaXBrb2xmTi9waFRSQ2FWVUxUZTBZV2tUSEk0WGgwa0xJbXM4VzVTYXB3?=
 =?utf-8?B?VW1KMWJrVCtPN0swb3RESndQVkRwV2xWcVlOSXl3OVdlWnVMeGxyN1pudzVz?=
 =?utf-8?B?QXVJd3RHTjRFSmNtZXhKZ1RlZEowbjQ1THBJQk4vTU5zRGswSDZlbmpqeG9Y?=
 =?utf-8?B?VDRHZWgvWXgyWHdIWkFaVXUwMHBCODFHUHJ1WXlQMjJwYytSU2t0bFdGeG5s?=
 =?utf-8?B?bkQvQ3ZmWXBzcDRkalowYitqN1RjT0NwVVcrN0xsWnJrc3luZ3dhdVg3ZXdH?=
 =?utf-8?B?R2tvVnJ2NzV3ZXBoSVpQelFJTHg4R0x1YWlMSHVkU2Z2WXlmWVFQM1c2YmxP?=
 =?utf-8?B?VElsRmVpelkvZVIxakNpeTh0OFhzbzJkRHArVmg2bzVxTldxTFNiYU9IWjJK?=
 =?utf-8?B?ZW90REFyVjh1LytUSG9mZjVoSWdueWNoQms1OUdlYVhzOG1SVjdZajM5cEph?=
 =?utf-8?B?akRxUCtIMTNCUkRJVTFnWEVKdjlFTjkwcGY3VWw0N3RSTGM3b0g1aWtoVU1r?=
 =?utf-8?B?VFZPR1lheFVIVk9tVWpESzZrRmppK3pqU3RmbHluMTZGMkQ1WE5TQ280U1NW?=
 =?utf-8?B?TkI4aEdpTFh0QUtjZGduU3ExRGo4OG9XMzEzR2tkL3hTZHdRbEdpMlgremhI?=
 =?utf-8?B?R0t0MlA1UEREUDVFZ0dXUU9id2JCc2g5b05EcWJEZHJBWmFvaVk4K0tOZjBw?=
 =?utf-8?B?UWcvbENGL2JFM09tRzFTdzVUUnpVbEpYMGpKa0FiNTZRRFVGdWFNTVhKRUVH?=
 =?utf-8?B?WnVVQ2V5OGNOMk5CamFUdUg4MjZZWmc0Rll1aFE3VzMrcGtmVkk4UmpuT1Vv?=
 =?utf-8?B?a2ViQ0NEbldxekFOSDlEK1VSdmNrOGxNNGxsR2N1a3pPT3c0eitRekZzYkl3?=
 =?utf-8?B?bDFVMXhLVDVvN2twUkRGTE1MQWRaRVFBOUovK3Ntbkh0RE1Rc1p3V1VKMXlL?=
 =?utf-8?B?cXpVN0VGS3dvVVo5K2ZZQTRRKzBGL0NhNVY3U01PZ3ZVdmUvV0ZqSmpyaWdI?=
 =?utf-8?B?K0VjY3ROd20vWUJNMjc1bnVqc2kzbW5tS2JWZDh3bUQ4Qm51UEFyeU01MXl2?=
 =?utf-8?B?TTRBbGsxMzAzOUZlRDZJSWtpSTNJcDBwaEhhMkwzYWRoRHExazd4U0FNcjVI?=
 =?utf-8?B?NFhIQ01FTXlHeUhUZEFmbkdDN1dhTEFOemZuSGg5b0d1dVltOWkrSFIwK0Y2?=
 =?utf-8?B?YWsrd2xDUW8zVjF0ZUhUZHRVQUVYMXo2QmU2dFN2Q2JlSnF6VHNUZjloQjV6?=
 =?utf-8?B?TDdjZ1plOGs3WjgxajBkTmJrVEFNR05VNTIzaFNON2dOOUZ6NFY3cFgyclVt?=
 =?utf-8?B?cVNKeFlKK2cyTEYwcGxydFlMZWpTdm1xUys2M3I4Z0MvN0RzcDJKQkVpb0tv?=
 =?utf-8?B?dzZ4Y0cwcUgwby8yeUx3UDF0cTRPbHFiOVFwL3VQYzFHczlIaUt6UDFuVmdi?=
 =?utf-8?B?bGJtV01uYkRCRWRKb0xqd2oyditjZ0ZPZElQaGdFVC9CM0dJSTljZk80MThX?=
 =?utf-8?B?aHdEbndsVlpTWXR0QUNFZFo3YlRZakxSQ25VeDRKZDFPWVBsMGRlZlFPZ1Zs?=
 =?utf-8?B?WGZaTXFOTzhyQ2NrU0ZmZm1LY0NwNVFJcnRnNWQ2VGw5Y1hENFhNRDNTRHFY?=
 =?utf-8?B?MVp2dnRCL1p6TFF6UmxpWmg1K1JzZndXOUQxQzdlUnBpQWlEYVVodGdqVEhx?=
 =?utf-8?B?SnJEU1FiOGZiSlFtem1NUlRzWFBxUTVNaWV2c2c5VHg4Tkd6SzZhbmxTcTF5?=
 =?utf-8?B?cWphOFZycmJhd2RERzRjZ1ZRSjl6TWZ6dDhoSU9RTUlJZExQSFVVb3YxeGhF?=
 =?utf-8?B?SGVtVnRHWTdlYkorWUlPNXJILzlFaWNKbFBwYlNHTW43WHd1YWgyVGhsdUNj?=
 =?utf-8?B?MVpXL3pPSHlmeStESlJ5UFJPd2ZIV3QwM1FTM2h5QS9IcThuZzdVUCtlcHdy?=
 =?utf-8?Q?dJW5nI7KKTFkFER0ThKQGjO2Lr2++43wlg0JP0+U0+aR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b48dd634-9d06-4542-82aa-08dda1c79b94
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 11:21:23.9819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pJ1LYLHyNXj2RFUH9LtOSgyUa1trcbdPg9L9gH5uSUm2S6lAujs0Wm54leGgBj7ZGExjfm6hxt/wkXtiYOP+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7250
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

On Sat May 31, 2025 at 11:37 PM JST, Danilo Krummrich wrote:
> On Sat, May 31, 2025 at 04:09:29PM +0200, Miguel Ojeda wrote:
>> On Fri, May 30, 2025 at 11:51=E2=80=AFPM Lyude Paul <lyude@redhat.com> w=
rote:
>> > TBH - we should really add some safe bindings for sleeps instead of ca=
lling
>> > this unsafely, I'd be happy to review them if you do
>>=20
>> In case it helps, there is:
>>=20
>>     https://lore.kernel.org/rust-for-linux/20250423192857.199712-6-fujit=
a.tomonori@gmail.com/
>>=20
>> I think that is the last one -- we have been going back and forth a
>> bit on it (e.g. we had `coarse_sleep()` in the old `rust` pre-merge
>> branch), but, yeah, let's try to get the abstraction(s) in.
>
> We've already discussed this on previous versions of this patch series, w=
here I
> also pointed to the patch series linked above.
>
> I agreed to take this code without waiting for those abstractions, but wi=
th a
> TODO to fix things up once they land.

Added the missing TODO for this.
