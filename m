Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52CDB52F33
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD8D10EA9B;
	Thu, 11 Sep 2025 11:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kPtVUtS6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2042.outbound.protection.outlook.com [40.107.96.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6FC10EA93;
 Thu, 11 Sep 2025 11:05:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pW1maR1iQ1hbXZc/rvGFM5Brwk/QXLSVVh+hVZsn98Si9CTZ5dAdgupNVrWNPxIr4BEp8RMvhkd12klSydPv8xcYlNtpVParSemka1A04JzgFWH8j05ZHCeD4RSRzORjcOvyXGwYJNhqqJ0dZxosi5WHuhD+InujqYHfgTy76s4aIz8d8ASZz7sK/zzgxjBEK6MMMUb2Emz5BFT6ts3rk/OjhXK46gmd0UTPlmGBt5wnM1CW0T3RPqsZ5HibfWvWFPxqyuAPIEHMjs/ElKBVyMwSXTNxP+LaXZkt43rmjG/WnumktgLX0A9l123N6qVg+QBAPBOZEIg19ppHbTwPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHCHQ39XMwc1+tTTI2NbUleQVE30cfYUlik2eft4e+M=;
 b=ZQ2Iqb6SUJ+Eh7JyZg3lXucpFCXoFmjqUoVLKjAFEcmW43D2Nj4xfNwprckqjrOxbS8CWLXdU8TvCPbpzhAu2tNsgxYGyN0gpzfawRtip5xKoB3w3jlUk2qMy6Oo6Cjdo+r4rUrF+ZWBmxPFOTPvsxp/s3RfXnrQtngTSTB3EIGEQWFWQWRkJv3g1Wp2/rR4qWHszAPovh160tn+UYKWXwlysE8k0iAkQdWnASZQ6MroP/74kaDjZy8Ketpz61KD7X9OmD9hSmTWC7xKqE9fxDhzwSheJeuznfzHWVKiE5gXA5oaKWXyax+Jcu4MoTaO0P4hxbAqgvRKl6Bkhu7Bhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHCHQ39XMwc1+tTTI2NbUleQVE30cfYUlik2eft4e+M=;
 b=kPtVUtS6J1YdqlIlR0tckope2kRp3Xi97efFkb2/MZdS1p++4+vpSopdFdRlhsWshF2vrJoNmaK60eEhmDHJ3/C+6OhjPEqFnTlY76sCVrW74CrHUUSxy2KVcXMP7dzQMB7jzzKtAIEua26Z87IGFYFBVsr1bPQGAZwHaWj1Ntj0V9akuaCbjwYl5fDwScOZTvdmJjB1JpMSHQm6B7SknDi82V96Xb7k+qwmbFgqsNfYac4vWx1aXciEhYpNx0r0d73quADIqODUXVsBQ3TOQdQgUyb+UIc87HB9M+2hhO7XtaXawHlTg2MCJDcE/DSPYaUtaDGuGkxisX/qTpbq7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:05:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:05:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 11 Sep 2025 20:04:34 +0900
Subject: [PATCH v5 09/12] gpu: nova-core: firmware: process the GSP bootloader
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-nova_firmware-v5-9-5a8a33bddca1@nvidia.com>
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
In-Reply-To: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0200.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d9405b-de65-488f-add6-08ddf1230f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dm9sT083TEcwOVNFb0pxNzAxWnY5T2tZWDNtWkRVT25kUG13N1lEMzRaaGNO?=
 =?utf-8?B?S0p3N09CQnNyRUdUQ0tyVE10WVhxakVBQ0VWWVV0RWZkeStVL1Vrc2VXTUtV?=
 =?utf-8?B?MFA5WTJlNkNVMG1aN01oOXRHQ0tHbnNxcXRVbys5SWhyam1KWmZMTXo0WGZD?=
 =?utf-8?B?M3JvdzRYWmdBcXJNWmc3VzhreFkrRXNTTXpuSERCS1V6L045TTRXcFpxaWgx?=
 =?utf-8?B?TVRpMnpKakl3R1poc1JMTkFsQ1ljNzg5NlJGWTU3b0dQb3VrSjdNVTR3aEdv?=
 =?utf-8?B?SExJbEMxcGcyeTZXM0EzeGR5OXlpc3BNWGdHa0t1UmI1L3o0aEVqRHhQdU5Y?=
 =?utf-8?B?NVJpZS9uSUhMbnFNYmFuQ2FNR3Y3dmNXMXBzQmNCMGVNaFlSdFpCSXNzeUJ2?=
 =?utf-8?B?dGw0bHY5MUI3OHBXbGFGbnpKbXlBVWFBbVJzSzNzNVRyNHY0NHFaWnc3d3lK?=
 =?utf-8?B?MWo5STY1c3RCRnNFN0tnQk1hZVNoRGxaYVkzZnpha3g1NEJmQlBQc1J4YnFB?=
 =?utf-8?B?VlFrWFd0TUJpS1BnSUtGenlyZDR5OTFxRGZHY2tYSTNUeng2MHZxd0U1dmJH?=
 =?utf-8?B?NDQwS0FRdit6NGp5citCQ01wRVFzUTBIYVV2OUxwVitEZE1MSXRvdmNHWXZn?=
 =?utf-8?B?OGZpMGF3T1l6US9wRkZtZnJWNDdHVnFpYVVHQml5RVZiTjJUUXAxS1dVeU15?=
 =?utf-8?B?Q1c0R1ViM1FTMkV1OFhIbnAvWEp5czU4TFlweXBzSGRmKzljWkY4SndwVFFZ?=
 =?utf-8?B?SVV6WVY4S0VMMklEVVpKOHdPbCtTQnVna2NneDNEaTIrcU5GbXRob1M4Vmp4?=
 =?utf-8?B?cmwyZit4U2QwNjgrOFZwZCtMdGF4RXZLNFZaL1cwNUh4NVMwMjFFUlI2cXh3?=
 =?utf-8?B?NiswZGgwOTRjN0FBQWwwNWtTQVBzWkVNemxQTFRVVlBKOFFCOHJhUjFjVXhB?=
 =?utf-8?B?QkpHZXFWZno5UE5DNUpnRmg1clZRNDY3bXI1SkJWTUd1WGl2VUtJdVZuYUsx?=
 =?utf-8?B?Z25YMlNmWENhZktYMUROOWlHMWR4NExqbWZBOEZodTJjWUhVTlU0clg5NWdH?=
 =?utf-8?B?U1V1R3FrS1VLSDNzZUNaVGNrL0QzTmNxM01sSzZ0VTBGRzdtWXJ2OTRjaEp6?=
 =?utf-8?B?OXdLR2hDSHhtcm0yUXhlYXZXOWdLWEN4eG1wUDZ2VGt2SVl2bjAvckRFczhp?=
 =?utf-8?B?empvY3p0SHBXQTBDRlRLZXFJMHJSMGxVbnJVelRQQlZ5WUZGTklyM0pRaERz?=
 =?utf-8?B?ZEdBT2FCNzhoWWF0bUxWUjdzOTJZdDZZQ2JoaXRjdVZFZ3g5LzJ5ZUo0eVRa?=
 =?utf-8?B?QjhtM3NDb3R5YldrYlBhbTE3cnNIYllETlZZR1FoM3Q0YVJvYkx6S0JEZHUx?=
 =?utf-8?B?QVZmakdKMlVIbGs0Mmp0UkZRdzNHcm9DR1pCOWcwMDd6WUh4dHUrRUdJT2po?=
 =?utf-8?B?aldKMUxDTTNjM005eFVRcENNTTkxcEhuZVVGNTNGM2w3UlpDdGpGZitJS0Vy?=
 =?utf-8?B?dzRCdnFlRUVkc0Z1dGdMZUQvK2JEY0N2YkY4NmFoTitYbXV2SkZORWgzcVJU?=
 =?utf-8?B?VjhWWm0xZHdZbUI5TXVoUkxnK0JRSmdFb0NLN2pJR2t4bllmK043QmN2blRQ?=
 =?utf-8?B?OHNnMUFjUnJJcVpsN0RXaTI2TmRONmwrQ0lhNVZlZ2xTajA3U003bWQrM3ps?=
 =?utf-8?B?dndtRFIyaC8wVFZwMjFPZHR5a2FwMGZmRGt2MmJpNC9TbEI3RnFKQlVZeEhn?=
 =?utf-8?B?YnJDaFVnVlZlaXEyZHJlRE9va3RMV3lJc2M5K1A5dWJkbGlEd28vMkhPVTUr?=
 =?utf-8?B?N1VNcUJNbzVXM2ZYN1hUc0NSb0tUS3FoZWdUNWE0ejBEUUNvamxQaG5Sdmw5?=
 =?utf-8?B?NS9TaWN0RlpXRlhFam9sek5jM1ZyUmNLZldMbFIrS3I3Tm9pYUU0YmlCZklK?=
 =?utf-8?B?bHlmM2NvbVhUSHBqMjRCcVgyZUR4T0pQQkJ0NklVc0x5V2FtdzYxdTRxTFBt?=
 =?utf-8?B?Wm5xV0VMZW53PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUt1Ky9YWGo2dTluMlh5bGwwNzBzbHZZRkVuOUFqRUxSYmIrZFdqM2VGWjU3?=
 =?utf-8?B?TkJ4aDhyTE1rMWp0bzZnKzVnS2dLVlhaZkpiVjg0cXNxZlZ6eXk4QUh0NlJW?=
 =?utf-8?B?ZFBvL2kwYkV6QnExdXFGUlVWWUVjcVU5dHdKT2JmZjltUkllcDZ6R2ErRHha?=
 =?utf-8?B?M29MMGxlYWYyVjQwQmd5eVZJWk4ySlBUU2tmUGNmbHBlbDdUNlFBcVpadjYw?=
 =?utf-8?B?YS9IS090ZVR5K0ptWkRqZkQrSnNFdzNUSzJJSUJSYll3WE1FQ2xaSjBQd3J1?=
 =?utf-8?B?c2FzSzczU1I3NlZ0QnhGQjN6MEJEbm8welZQaW01S2VXbTdIYXZpZXdwVFhN?=
 =?utf-8?B?L2x5WHVzK255QmxZb3pTMENDSGxTbms1ZDlWVzhiSStYVllKMFdXRVBJbUFM?=
 =?utf-8?B?KzRJcVBFcU0rNVMySUxvUU1RNUNDc3dWVE41M1FMa21PZE1TQXlnM3Z3eUJ0?=
 =?utf-8?B?dFdLNWpOV2tEdWQzVXNqQmhHM3J6TzZKcTRKV2FYVUdZR3dXYlJyei9ERXhG?=
 =?utf-8?B?NUR6ekJpOGRmbzhaVUIxbEhsNnBuSm93d1pRbUZPWmprVmgxL1N6dUdLUGNj?=
 =?utf-8?B?Smhpd05USmRjWEY4U1k3Q1haTXQydXhCYTlpZkliYnkxWmpvcUkyUDJKZGpn?=
 =?utf-8?B?MlMrM1JTV0hiZHZua3ErR1NyZXAvUnhVWWJ0S3BGRi93YkJqbGtCanpQUHkz?=
 =?utf-8?B?MGZTWXhwWGRrM3dUZXZ6ZjV1Zi8xeU5uT0tGc1FxUmxMOUxjeE5xajBWWGtp?=
 =?utf-8?B?cW1ZeDgvTGo5Rm1yU0pjVnZNSW9ZVDlZMXN2L2VZTCtwWG0zcDN5bDdJU094?=
 =?utf-8?B?VDAxVllWcjQxVVl6d0R5V2ZiQ1J6Wm9LQ1RDVE5nY3NyUFE4NkFmTjNDYjNW?=
 =?utf-8?B?NzdlY3lIc3l0WGNRUEtUaXluTHVoS0pvbk1yc05PMDUvU3VQVGE5dnBocXF0?=
 =?utf-8?B?SFBjQkNqNVhUaVJlR3pCaU51eFByTUt2c2NCMzBmblgrNHlpa3UwN1EwbDJY?=
 =?utf-8?B?THg0enJyZUxoMTJOc0VmbWZ3RlpSVWZVRFRrQlBESzV4Qlg1Ylk0UUJyWUhx?=
 =?utf-8?B?ZFFmOGJNMUVjQ1AxRnU1STZ0aExxaDExQ3pCdUhzUVVkRUF5Y3BQSnd0VUpR?=
 =?utf-8?B?NXRrZEJhYnp2MCtvY1FQNG5OWU5tcU9QcCtSZmM5djBROC9OQmVLdmh2djc3?=
 =?utf-8?B?Yng5d1ZCQ2kxcnFrTUlDS0VJbEp5eTZYeGY5K28yQnRDUnh5UFVNMjNTbytm?=
 =?utf-8?B?bWNHVHBTQ3NOYUk0eVpXSG4xdVRRbjZqZ0J5YlJseUJ4aGZtZHJlK0Y2VVZv?=
 =?utf-8?B?ckdpdnJXdUM2WFJFcGQybzFJZEc3NWFhU2ZvY1JHSm50VDhEaDA3MVkvQnhR?=
 =?utf-8?B?cDJHQXBCZEJoWnZvY092SHVWaG9zM0puNkRCUWZwM0RJczZ6cTN2R2VHWmRv?=
 =?utf-8?B?b3JwYTlKdWdTem9BL1dxaDY5b1ZlNHYzMTZrL0Jidi9mTDRUTGF4S1h1S1h0?=
 =?utf-8?B?QXQxNVp2cWoyaUg0V05hMkxxaFJiZUFXWEUxcW1icHN0Q2F0eWxnSmZWMGlx?=
 =?utf-8?B?SmNQYlVvSERZaUJsMUVCRjNScEljeEJNWEZLVDdYT21WeU4yc2RmOElYUmFy?=
 =?utf-8?B?dmYwc3JIZHRaL3BiTFlMSUNzOU9RVnFsZVpxN05lbDZTT1lQNTBxK1Ricm5k?=
 =?utf-8?B?Y1o0T0pmb2M1SjUrMkhVMTkzNVpUNXRBeDZQRU13UGMxWDQrL2N5VFlhRUhV?=
 =?utf-8?B?T0NJbjlYT1ZndHM0TGR1TE83TVJTbVlhZDZ6SWNIbDY5SGlMUGsrckxXTURi?=
 =?utf-8?B?emc5ZWNuaVRaSGdmaS94bVBWTGtjTGJFb0o4TFRVRlRjRjcxeDhnd3ZGaXZ5?=
 =?utf-8?B?UkJscXluSi9BeFlPNGVPZ3Y4ZVR5WmVrZVc1UGRGQm9tVlZIZ2t3RFJDL0Np?=
 =?utf-8?B?T1VabHhoUWRQUk5pYkdYSml6UnJHdThiU3dyY3ZobEZmUlNCK2RYSjYrUm02?=
 =?utf-8?B?NnlCT1l3enc3Tkc1eTlXNGtjUDNnWFNJdStnTlZOeEJuUWFSTGNPUUtwc1Zy?=
 =?utf-8?B?VHA3WGlaS0lLNUJvaWgvRE9RcFpUcHMwU0QydWxmZVNGMFNHQk1ySjI2Q1Rm?=
 =?utf-8?B?TFk4ZHE5QnhQdzhBYjdTdzBTeHFFWUVISk9TRXhNNWJ1L3FMZ2xXeEZWNlBG?=
 =?utf-8?Q?lVaMXJCnwZOBgN4dqvzqhoa3VGT5NNI9qYQmgdguPMQj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d9405b-de65-488f-add6-08ddf1230f55
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:05:04.1114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnuxzZ49/u24gsbE3p1P9fUk7JrK5WeTkBkObyWzKmc31OERm3qroz6fG1SGG/lnjEQpVrzLsara7gM3iXr5ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9840
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

The GSP bootloader is a small RISC-V firmware that is loaded by Booter
onto the GSP core and is in charge of loading, validating, and starting
the actual GSP firmware.

It is a regular binary firmware file containing a specific header.
Create a type holding the DMA-mapped firmware as well as useful
information extracted from the header, and hook it into our firmware
structure for later use.

The GSP bootloader is stored into the `GspFirmware` structure, since it
is part of the GSP firmware package. This makes the `Firmware` structure
empty, so remove it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs       | 18 +------
 drivers/gpu/nova-core/firmware/gsp.rs   |  7 +++
 drivers/gpu/nova-core/firmware/riscv.rs | 89 +++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs            |  5 +-
 4 files changed, 98 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index cef910a7c2dc360139fafc2a01a050a9df40e45f..af7356a14def2ee92c3285878ea4de64eb48d344 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -15,11 +15,11 @@
 use crate::dma::DmaObject;
 use crate::falcon::FalconFirmware;
 use crate::gpu;
-use crate::gpu::Chipset;
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
+pub(crate) mod riscv;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
@@ -36,22 +36,6 @@ fn request_nv_firmware(
         .and_then(|path| firmware::Firmware::request(&path, dev))
 }
 
-/// Structure encapsulating the firmware blobs required for the GPU to operate.
-#[expect(dead_code)]
-pub(crate) struct Firmware {
-    bootloader: firmware::Firmware,
-}
-
-impl Firmware {
-    pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<Firmware> {
-        let request = |name| request_nv_firmware(dev, chipset, name, ver);
-
-        Ok(Firmware {
-            bootloader: request("bootloader")?,
-        })
-    }
-}
-
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone)]
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 9242e8ef6a0183cbfe5e75a3d6552ff528a2cedc..d25a21b42fc8b3987c861965e6ea56d929570b70 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -7,6 +7,7 @@
 use kernel::scatterlist::{Owned, SGTable};
 
 use crate::dma::DmaObject;
+use crate::firmware::riscv::RiscvFirmware;
 use crate::gpu::{Architecture, Chipset};
 use crate::gsp::GSP_PAGE_SIZE;
 
@@ -127,6 +128,8 @@ pub(crate) struct GspFirmware {
     pub size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
     signatures: DmaObject,
+    /// GSP bootloader, verifies the GSP firmware before loading and running it.
+    bootloader: RiscvFirmware,
 }
 
 impl GspFirmware {
@@ -160,6 +163,9 @@ pub(crate) fn new<'a, 'b>(
             })
             .map_err(|_| ENOMEM)?;
 
+        let bl = super::request_nv_firmware(dev, chipset, "bootloader", ver)?;
+        let bootloader = RiscvFirmware::new(dev, &bl)?;
+
         Ok(try_pin_init!(Self {
             fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
             level2 <- {
@@ -202,6 +208,7 @@ pub(crate) fn new<'a, 'b>(
             },
             size,
             signatures,
+            bootloader,
         }))
     }
 
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
new file mode 100644
index 0000000000000000000000000000000000000000..b7eef29956995c49ab1466bb6a71a756731bf78a
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for firmware binaries designed to run on a RISC-V core. Such firmwares files have a
+//! dedicated header.
+
+use kernel::device;
+use kernel::firmware::Firmware;
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::firmware::BinFirmware;
+
+/// Descriptor for microcode running on a RISC-V core.
+#[repr(C)]
+#[derive(Debug)]
+struct RmRiscvUCodeDesc {
+    version: u32,
+    bootloader_offset: u32,
+    bootloader_size: u32,
+    bootloader_param_offset: u32,
+    bootloader_param_size: u32,
+    riscv_elf_offset: u32,
+    riscv_elf_size: u32,
+    app_version: u32,
+    manifest_offset: u32,
+    manifest_size: u32,
+    monitor_data_offset: u32,
+    monitor_data_size: u32,
+    monitor_code_offset: u32,
+    monitor_code_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for RmRiscvUCodeDesc {}
+
+impl RmRiscvUCodeDesc {
+    /// Interprets the header of `bin_fw` as a [`RmRiscvUCodeDesc`] and returns it.
+    ///
+    /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
+    fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
+        let offset = bin_fw.hdr.header_offset as usize;
+
+        bin_fw
+            .fw
+            .get(offset..offset + size_of::<Self>())
+            .and_then(Self::from_bytes_copy)
+            .ok_or(EINVAL)
+    }
+}
+
+/// A parsed firmware for a RISC-V core, ready to be loaded and run.
+#[expect(unused)]
+pub(crate) struct RiscvFirmware {
+    /// Offset at which the code starts in the firmware image.
+    code_offset: u32,
+    /// Offset at which the data starts in the firmware image.
+    data_offset: u32,
+    /// Offset at which the manifest starts in the firmware image.
+    manifest_offset: u32,
+    /// Application version.
+    app_version: u32,
+    /// Device-mapped firmware image.
+    ucode: DmaObject,
+}
+
+impl RiscvFirmware {
+    /// Parses the RISC-V firmware image contained in `fw`.
+    pub(crate) fn new(dev: &device::Device<device::Bound>, fw: &Firmware) -> Result<Self> {
+        let bin_fw = BinFirmware::new(fw)?;
+
+        let riscv_desc = RmRiscvUCodeDesc::new(&bin_fw)?;
+
+        let ucode = {
+            let start = bin_fw.hdr.data_offset as usize;
+            let len = bin_fw.hdr.data_size as usize;
+
+            DmaObject::from_data(dev, fw.data().get(start..start + len).ok_or(EINVAL)?)?
+        };
+
+        Ok(Self {
+            ucode,
+            code_offset: riscv_desc.monitor_code_offset,
+            data_offset: riscv_desc.monitor_data_offset,
+            manifest_offset: riscv_desc.manifest_offset,
+            app_version: riscv_desc.app_version,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8505ee81c43e7628d1f099aff285244f8908c633..507af10502d5d3a073f220cce0a2e5fd0cc938b2 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -9,7 +9,7 @@
 use crate::firmware::booter::{BooterFirmware, BooterKind};
 use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
 use crate::firmware::gsp::GspFirmware;
-use crate::firmware::{Firmware, FIRMWARE_VERSION};
+use crate::firmware::FIRMWARE_VERSION;
 use crate::gfw;
 use crate::regs;
 use crate::vbios::Vbios;
@@ -179,7 +179,6 @@ pub(crate) struct Gpu {
     spec: Spec,
     /// MMIO mapping of PCI BAR 0
     bar: Arc<Devres<Bar0>>,
-    fw: Firmware,
     /// System memory page required for flushing all pending GPU-side memory writes done through
     /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     sysmem_flush: SysmemFlush,
@@ -331,8 +330,6 @@ pub(crate) fn new<'a>(
                     .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
             },
 
-            fw <- Firmware::new(pdev.as_ref(), spec.chipset, FIRMWARE_VERSION)?,
-
             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
 
             gsp_falcon: Falcon::<Gsp>::new(

-- 
2.51.0

