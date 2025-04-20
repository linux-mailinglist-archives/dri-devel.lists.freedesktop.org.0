Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495FFA947A8
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 14:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9990D10E2AD;
	Sun, 20 Apr 2025 12:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NsZS4q+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F282810E2A7;
 Sun, 20 Apr 2025 12:20:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3P6shgQadg6MHaG9wBQ8TXFvFpqq/98ZIVa1W6y6KC/5I3RxChUx6sDpnYDS2bpObW9qLWswZeMsz4CmutnENNddb2F3ifEqKddZdVqBfZ6R9Ald5gp0UjK8rHNAj4R5P76YEXANXoP3yZGc4hOUpvViDvAnG7MCKT0z10dfNNHa+nWmVncXWazz6k7vU4NJB2NV4tMmt6IyzPTRpyFTsNdkYqbgRusyh38tCqTcWyudJT0Gb4ARs0FKCnCJQ74Lc8Lnn233/PTVYI0WSp3AirHSsH7KpFQNy0Gieeotx2shJreiq8LHk7h9yZzvpIUof4Jb3LjmvW4Zu5XEF/d2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPTmwN0glf7WjhUerrKyJMaFvWRXWDbnYc+uvGNFom8=;
 b=EQwAAM0hMmluruulJjqeHRF6q4UbXFfRnMkttrnIlXTeZVMFRKNZMBhh4eZsOMKQutXL5zyUcywQR30Zx/b0qI22y3yqYccCFNaPZHVSxNnMpngO2ZlMQPgRMdvAl+4nOjQIi1JcsIvKYI7Vhaxus+Z1enOzJxGOsIQ3ng4ILNxY5ApY7ARBNkf2XgK4eI27soycw+XgxAprWfwZScPYztnxKcyuXdrErkbMCrh8hi6b81GW9+rW0FzZZA4zciauM0FEwapxI6hO0mnsMjDR1goeawdzUeA0h9emoEJZBh0qhk/H+3CXgG4p+c31m7/K5vwq8KOotqW7ESNdL9SyLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPTmwN0glf7WjhUerrKyJMaFvWRXWDbnYc+uvGNFom8=;
 b=NsZS4q+ki+I4uYHf6tsLAm9IxQNugy7yo4cjs1zinTQ6kNWsjXTulfXZ84dLcB+i8emcZq+XnTtVw662Pgq9DOBkslX8q5035neM24jBFQNu+4aheH31xi5YrPPWc2RRmN6kD4jKEXWlP9OcNd+zJ7eWjNI+LvLdztLPwwTrgoszy+IWBFRgQdecxXg9M+/0AgsopIrQYGBW9qCSPyV6CGeIuqnLAq7lIEz2fWE7r+8s3kfmSzLMk7xCniRzJL5ykUsrIkGx7bj5GWzqxRNTt7jkq5JShbPmM9WaB0uiH03BhPFEJmivg7xiNuQh9Vk1WAp6sqGqkC01/xzv6oB+qQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 12:20:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.025; Sun, 20 Apr 2025
 12:20:01 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 20 Apr 2025 21:19:35 +0900
Subject: [PATCH 03/16] gpu: nova-core: derive useful traits for Chipset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-nova-frts-v1-3-ecd1cca23963@nvidia.com>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
In-Reply-To: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0196.jpnprd01.prod.outlook.com
 (2603:1096:404:29::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f624cf4-21bd-4c19-e01a-08dd8005ac91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWF2MWNJV0ZPNXBQUGd5SGN6bitqbHhvSklabmQ5aklCWWtDYlpTbW5LQTli?=
 =?utf-8?B?Mjg0YlFEMEVzUWJMRHMxWkNaY0h0OFVTYVhoOXNnTDN3SVlIZ09HamdGaksx?=
 =?utf-8?B?NGNESzBHek1qYW9Od1B4d052VEhKYTJjSTFhRmk0WkdhVXJlQUJzd1FhTFli?=
 =?utf-8?B?RUcvdXpQMDcyWHpWSHIwWm83Q0lXZGhURDNIR01kMWNtaHV4NUt2QUdsS1ZD?=
 =?utf-8?B?MXIzaERiTVk1cmFkekJjWm4wdWV3Y1Z0TEQyZU5KUkxzNXFEVU04bkN2VHBI?=
 =?utf-8?B?bFozTGFVUVMxdm1VdzRPNU01TWVocm1DbzA4NXdxRE4weXdESW5RaVZLYWow?=
 =?utf-8?B?MjNFelRNQkFmbHFLRHh5SDdNbzA5Y1QyTFpDTWgrOUp2MVk3a0ZVMnRrcGZa?=
 =?utf-8?B?R055MGx3RzdPT25FVlJ1bTN3bXk2TjBtQThPWWIxbjlRUW5Mdk1JRHpSNm1x?=
 =?utf-8?B?c1BxWXJUY3Jpa2lHTm9kR1BLb2tkeEVaQkFQOEtucTVwcUpTb0NVYTdpZzUz?=
 =?utf-8?B?MSt2RUtrYUtNOVoyK2xCc1hCWFg1ZXc2S1dpcGxnU05sWjhVay9YWGZ2cjJQ?=
 =?utf-8?B?UzdXWVY1VzRVRnA4YzY3R280OC9VSTJmdlZxYmVvMXltSmU4TUVESTNDNS8v?=
 =?utf-8?B?bXlyUDlzVDRmQk5RaWZrdXc2Y29xVnk3bEhROStNUzRmMnpGWEhVMURrTStv?=
 =?utf-8?B?cWFNdW90WFZUWGxxckczajY2Wi9UakVHUDc1emovVnIxekQ2WjZWSTVBN04r?=
 =?utf-8?B?VTJoMlVFQTZVcU1KaEZES1d6VjdUcm5Ra1laK002Y0l4Z0w0ZW15eTB3Q0xE?=
 =?utf-8?B?UENBUlFucTRQR1dhN1Bua2tsVU1aTFVVdUhUU0VpU1NMSnk5YXkrSElUV2tO?=
 =?utf-8?B?cVRWaWxBU1JVMUw2WGZQbDZHVmpBZHh5eTR6Q2VtcUVHZEdBU1JSOXMxOERT?=
 =?utf-8?B?azBkK2lTTVRzQ1BxU3JFZkRYVGhwRGRzVC9kdll1d0JSRlIzVlhPL0pGLzFm?=
 =?utf-8?B?bzNFbkF6SkhsSnJtdlNjRGU4dmlNZUFMRERjZ3hUbGdjM1drVkM1dnE2Yngy?=
 =?utf-8?B?WmdreHl4djBsVkpaMzlUbkJlNklGVE94N2NaaGhKQk9ERlJSeXBDekdpY280?=
 =?utf-8?B?VVhIdlZCODQ5Z0RXNUZFTmNEakNHTUNJN3M3b095d0dSWldyRWhTTXJDMmJW?=
 =?utf-8?B?N1dEYzdTbzhxS21iQWVHTlQ0TGdublNhOUpaYktmVmNxZTkyekVDUzhiOWFN?=
 =?utf-8?B?YlI4UTE5c0lPQTkxeHZDVm5LZ0RhK0lLaEVqandiSGJBc1Irbmk3c1RqNnBp?=
 =?utf-8?B?MGE5RldmRU1wR0hNeWNWMHUwVEZqWTBKRWZQckRwci9iWUpwaGJzdEJMem9i?=
 =?utf-8?B?dVZIcnZkZmV3Z3VMZUh0YkQrbXI3VmZVMHNrSmcxME8zaHBheHRYbEtnRnU3?=
 =?utf-8?B?YksrYnlaaWNJOVBqTkxwSGNGcnBNK3J1dG1Uc0pFWGVhdUNDTzJZd0kxdllt?=
 =?utf-8?B?NXhJV0pZK1JVdWlReXdrWVNmcEtjeU80SmExby91a2FQQkgrV0xvZFBaUkUz?=
 =?utf-8?B?K3JoUng5ZzNPU0N0c2JFYnNoV1A2Uy9ERDVnZjdCY2s5ZHpSVGc4aENGVWV4?=
 =?utf-8?B?N0ZMdXU5aE11T2tqT2U4eG1YeGVKV1FZdDRBMDVGUzUvc1ZsVFJDckRkQkdz?=
 =?utf-8?B?SEFzTVgwc2RNMVFhT2Jld0FCWkZuM3p3YUJPZ0loNUtXUmxBWGpCVUJ5eURY?=
 =?utf-8?B?VHdUeXZOQWd5Y3RuZnZpaXp1eDgyeVMxcU5odGRaQTlESTFhQkZoV1k3Yk1t?=
 =?utf-8?B?TFVORDRPUWY3V3lZYUptRGcyb1p2L3VxeVc2NU4xRkV6TENmb1BUM0l1T3BY?=
 =?utf-8?B?NlVIY1FYeXJNT3pQdVphU1VjdnZnK3RLZDZwcUIyZnZrK2ZycGEydTJvQzBI?=
 =?utf-8?B?VFNOMXNQUGZRdHhOSmNrb1VrcWNXWElUc2IzbzdXR2IwTjFHUVl4dGFUVEdk?=
 =?utf-8?B?SEZYcmpXOTZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2ZoNCt0ZmhoaHZGTU8yVTJSZHQ2S3hzNnpQb3dwaWIwcjAzcjdkR1NEQzdx?=
 =?utf-8?B?bW4wN0hkV0I4YjZvaUhNZEYxTUdrL1F2S1o5NWkvVUlyQnpVc25LVXN2OWRi?=
 =?utf-8?B?b2tjWmF0MTZUWnhCM0IrYkZGeXRmWkRPd1hrZ1VMK2lWTldaZ3FQTlRUY3Bx?=
 =?utf-8?B?Q3lBY1BoWnVhbVJMRVdjNExXRVhvTVNhOFRRenVUSTh4N0F3ZGNiRWNFNFV3?=
 =?utf-8?B?SDFDYk41WW85TGJCTXdUYmEwUGxEZnhmd0p5UzFpbTV4OGFZcEh0QlRzLzhs?=
 =?utf-8?B?Z2dBenBGcTlUL2VUSU5EVEkrQ2NzaGdCRGVsUUxNejdwTXNMVytxUzZGbU9S?=
 =?utf-8?B?emtLeE1zWElEWVZyaDhMTUpZRnVEQzVuRE0xc0ovcXMvYStHT1NSUUhDMC9V?=
 =?utf-8?B?bDEvNDlTdjJDYy9JSlBXd2pkRmJPUE9QMm9TYXdpdzlnVFZhenJyTEZDMHlI?=
 =?utf-8?B?bGF5RlMwekVKcnlIME9wd2lWWUdpYld6cFI5U3Z2OWUvMzUrWkZPZnc5dHFq?=
 =?utf-8?B?ZzVyS3B5aGlmVklFL1E3VHl1czlKVkJ4d0w2TmY0djljc05WamdYMUtxVlVH?=
 =?utf-8?B?Q0wycTMrQWxoVHhmMWliTlBWQ21VQzVyT0h5SXNVYXRWN2RydGFkVk1HMHp5?=
 =?utf-8?B?SkJVQ3RhTkNhMVBzRGRwWlRwVWNHdU12RFN2MXpFUE5pd21zNkpUTk1POEhw?=
 =?utf-8?B?MmZjWTAwZjhFQjNwV0FmemJ4WXNZRmxIY09LR0QxcGxmdjExMzNNRGx3ZzVx?=
 =?utf-8?B?cEZ6bVk3NXhrSm9CNUNlbGMyWVNYdkJvVERGcDkyWDRzOUJlaXVxMW16ekR1?=
 =?utf-8?B?cHBQcHB2cFU5VksvcWF2clZmb1VHU3NVR0s2TkR5N0ZMMHVzMVprUGxtSUtp?=
 =?utf-8?B?QlNVT3ZWdkRzWUNEZHJRNDRjenBLUFpmQlBJTG5WWkw2MmlXSWNOa2JselZU?=
 =?utf-8?B?VWFlMG1pVXR3T1ZBbWVNL1RxZFM4OUlmR3FkSFdFM3RmV3k5MnZReXNjaGZw?=
 =?utf-8?B?d1VrTGowTTVmekxTTlQ3YmRXS2tHaWJlaExlbDg5RlowblpBVStEbmpaU0o0?=
 =?utf-8?B?MkpIYzFWbUxZNnNHMzRpajdHRk5CR3NvTUNLbjZlQzVSRjFiV1FGM3NUaEVs?=
 =?utf-8?B?OXpLbkphditrMFZETjdDRXlGa2VycEpUbHhQTW5hR2YvRVR2dFBZeW92Q0My?=
 =?utf-8?B?T3VlcEdjVTVyZFg5WUNScStWOHpWR0pSNnd6Vi91SFpZdFY4QU05aVUrMGtL?=
 =?utf-8?B?blN5QWR2Y0lFaVoxblY4MUlLQ0c0SnhRdGpFU0gwNFg5RnUvQW1oZXhPMUEw?=
 =?utf-8?B?TEM1RTdsSElkeTgrcVFGR3kvNkVERWxIQ3pvWXJVeVNRKytXdjhwSmZnQ3VR?=
 =?utf-8?B?UHMxeDdjQitQREtpUDNEaVBOaFNpajFJM0R1aDJ1M0h5djNURjNGQW1tZ1pi?=
 =?utf-8?B?c29BcUZnUnV4T0FETjBGUW5PTHVEd1hyYkZZVmlMM2w0bHYzbDJ4amlGbllM?=
 =?utf-8?B?Qnh4OUdlQzZZOEZqUUY2WlI4amVRVlhRNU5kK3FTYk42Nm5sUFpTQ09vNnR1?=
 =?utf-8?B?bXJZSXd0TzVGSERxWm51SEsyUW1LQ0lGaS9CMUZnMk02WjRFWTVUVldSTDBh?=
 =?utf-8?B?TDI1b0ZYRENyWEo3M1Flb0l5cWFSWjIyeDZzSW5RSHFzZ1l3eFNiNmJZTmov?=
 =?utf-8?B?TEJVZ0FXUVIxNThrV2kzKzhCUk12bldGMlNNQjJVRmNQOStWVHQ3ZzB3U2p5?=
 =?utf-8?B?TnlDRjFvUk53dVExb0lKS0Z4UnQwWmV6OFBPeGN0eEdFeXdlaU5xM1BkNU9Z?=
 =?utf-8?B?VGQvdGY0bFRVemhKa2N2TjRnSVYzZ3U5VXhwWUFEVnA5cFpFQVJ5bmpFTzFp?=
 =?utf-8?B?anExQk1jT3pqTWk5Q1I5L2dzZEcwYTZQR1UzMk5vdzVzNFQ0MmFmWDRPanpw?=
 =?utf-8?B?Q0ExR1ZINk5ZNjI5UGNTSzQ0NnZ0MW5jN3NFRERJQ1FUOUpxb1Z0eUdlMksy?=
 =?utf-8?B?TTVHb3Z2ZG5BMjV2UXE5MnJ5QjVZU2ZScmNWdWF2RTBpaStrbHhYZU5zQ1ZG?=
 =?utf-8?B?ZzE1Q1ZPRXJySkRwNU5JdTVmeUgrU3FBUmN4cTZvZlRpRzU4cFBTWGpSQndl?=
 =?utf-8?B?U2VOZ0JCS05SV2NPTnpjdW1YZ3lpbXhrV3p0N0RBWktsQnRhWS9Ba2hRb3hC?=
 =?utf-8?Q?MINNFOx5ZMPv5Z2Fyvl5aXYaBRxRaOQaqFPMaVpaO5cy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f624cf4-21bd-4c19-e01a-08dd8005ac91
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:20:01.6086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPkr4BjPlE8TYrLiQ4BYfPBh6A70VcNO6t3ZnVqQgO/BUkVD1tFxJSpLVdOACV1CVUOzZSb0/JVw0LLkMVX1Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
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

We will commonly need to compare chipset versions, so derive the
ordering traits to make that possible. Also derive Copy and Clone since
passing Chipset by value will be more efficient than by reference.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 17c9660da45034762edaa78e372d8821144cdeb7..4de67a2dc16302c00530026156d7264cbc7e5b32 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -13,7 +13,7 @@ macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
         /// Enum representation of the GPU chipset.
-        #[derive(fmt::Debug)]
+        #[derive(fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq)]
         pub(crate) enum Chipset {
             $($variant = $value),*,
         }

-- 
2.49.0

