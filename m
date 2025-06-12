Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCB3AD68C7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 09:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C4010E75D;
	Thu, 12 Jun 2025 07:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a2VgogBy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2058.outbound.protection.outlook.com [40.107.96.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124B610E758;
 Thu, 12 Jun 2025 07:20:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ev4pAHcisj82edRPeGUozRzAJZHGqp1YkN/Oc7FJPfQD+e6E+eAnelXuyWzJ8eCNF2Q15pFyghGxfF7C9AXlUcvFLKP536hWmvoiNtuT9c4qNDKQ7zAeOp9JJDjxdSjHRbNNFq5xthIUxgg8EqLLVJRDE/PS4b/tRVsts9ie44ZGElPWS42KqQKw3HrEQwHV/LUnfOIqAq3PsbpodpW14n7Ed9EZ4KJKkiKKoUmZ3oxmFsNCAglzXzJr/Uhh6zL/7f7psQFqFeARcuEfOCXb16i+yNZ0lIj3vmbqtnmc50itwM03BtBjc5kPebmczxr09UxzaXQMKQ6LYrsQo6CIjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSSFN1Y4QMKPuaGtpUSC4EiYRNrvmfroy5YPQ1G6Gig=;
 b=n4I74cnURRX5KAgK+gSPPXanVzUe6ndp7NPU0sLmaY6DtV1Pre5TQFEBFZtgZZTVEeWkRretUH4lnyX0YjNJ7SG845iKpt7OSggeVP8zjnvKxNpiHbWFKijmzAA1yqM6YOu3R2aE9CC1ZclQRBbo0EutGeFkHBqWI9pCZ5Zf1g55zD1l6QShsYHSVGfzjwuP/r0MtzhVN/zHJatcmgUQJw0a6eagxVMyI88N/1Lq5UAeVqepmPClWbJCMIqOljkZNCfmPT92cfpl6lcto6PW3LNV39ZCyXX3GFgG1Si6IMTS2xdpaov0fB/esTfLcwMAUcHr2WpK+Ny6HS6NiGNASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSSFN1Y4QMKPuaGtpUSC4EiYRNrvmfroy5YPQ1G6Gig=;
 b=a2VgogByaMaKAPU1TS4kjB54UdxSkfWKOZtdW++EleQ5pPAceNUtAZys5SU2gFOzQwGzJkQoeJNpiR4mL2Ly5t7+S82yB0LdBG7CxYkmMXIAWSLA6zhMpJMSikjYzIJAk1DIAMxKQhmEDE2Fhiho4y/m+Vsk5Ha9C7qgLvqtwyrp8KdUWDWqu/pxd5hmpQ6bqAjRHhDzm3lq3tjxa8dQPm6RLcFv5IAcC15Rnt9vg+F1uHs2+3SDAEmhYN96Nvt7+IQSAOFtjC6r++XV+AxCPTtJvOk67jJVe3R6d8EwCPC92BT5A5AgrEW66UbwXXq90DrpnQfILWPQHXbTqTgJRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7632.namprd12.prod.outlook.com (2603:10b6:8:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Thu, 12 Jun
 2025 07:20:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 07:20:17 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 16:20:14 +0900
Message-Id: <DAKDFE2ZH4PL.3BGYOZUID5CNF@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
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
Subject: Re: [PATCH v4 19/20] gpu: nova-core: extract FWSEC from BIOS and
 patch it to run FWSEC-FRTS
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-19-05dfd4f39479@nvidia.com>
 <aEAjASkf9t4s4RsY@cassiopeiae>
In-Reply-To: <aEAjASkf9t4s4RsY@cassiopeiae>
X-ClientProxiedBy: TYCP286CA0359.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: b76bab20-1ad9-4e25-d53e-08dda98194d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUI5d2ZSaVJBRms2clJjWWpRZTJsWTk2L3NvSzdCempBSlBMRjA4OFpBWm16?=
 =?utf-8?B?bXBRNmhnelJ2WEtDdW5MbDE3SElFSGk3Y2wzUVp2Q05qT3F6MGRkdXd2QUdY?=
 =?utf-8?B?Sk9qdzc1eGhJek52NDVXay9WTi9RRnN2dFFwV1dkbkRRcjNRd3ljT29zNmw3?=
 =?utf-8?B?YitzTXY1UENneUlZYXFITnBJVStjTkN4VTRHVjBlY0dZZGVTbk5UWGxKQmRH?=
 =?utf-8?B?akUvWGtPY25mMTM0Y2xqUFFpemZGMjMzNm53WWNLWHYxeTZVNTArSmxCMjFT?=
 =?utf-8?B?Z3o2Q2dwcmNFQzgxM3dQdkh2aVU0SjBncC82MEtiZlc4WER1T2gxYW5EaHVT?=
 =?utf-8?B?L08xNDhjbnZNQW53cFRHRWNKK2l0em81K3huczd3dXY3VEZoZ2IvQlpaV2lM?=
 =?utf-8?B?RS8zNkdhVzRDMi9pUEl0RWVqNHZySmN1dUJtdUFFVXJ4MGhHMGhad01nMG9k?=
 =?utf-8?B?alhpd29KMHlxbzIvZnVTaFo1QytUTkUvaG5Iekl5Y2g4SVJ4L2Vnd0F1bWY5?=
 =?utf-8?B?Z1BrWFlwMUJLakNFNktZUmNRdzQzVWVMWk5kOU1MYUFRYkwyRFJMc0dRbEFR?=
 =?utf-8?B?YzN2V0tGOHNVcmppOVBTdmhHRURBVE9WL2duS2ZsMTdXMnVjSEJOMTBPRlR2?=
 =?utf-8?B?ZGliVkRjOWdLOHlwM3R6MzJpRmhUMFY5aTA3bWM1UStVT0w4cWFLa3VPL2Mx?=
 =?utf-8?B?aWpnTjZUN0s1Vi9Md1F0c3hWZzBGaWVueTZRYzVFK2VteXNaS2pEdTdNb094?=
 =?utf-8?B?bWpRS2lBbnBRNWJxQ2YxV2hISy9OZWg4SDlZeWRyQUxDWDNDVkQxMkQ5MGpD?=
 =?utf-8?B?WC9qRHRZWXM0Q1JadmhTeC9oR3RsTUg0ZHlkMjYrTFVGL0RQZ1JGaVBHOE1D?=
 =?utf-8?B?ZVBweXBvS082d3Zkc1lqVXZhVkRZeEFWdnM1eDRNaEMyaUNXMk5sUVM5elNZ?=
 =?utf-8?B?UTBHTm1Fc3M3Z3UvazZ5dksrQWtScUlBdzV4VEd1YU9BUU9RZDJiVk5DNW1N?=
 =?utf-8?B?am1mek85V0twc2s2UzNJMFVEcDdmTlZYOG40M3dlK3VNK0o3S0hUOUEzc2c0?=
 =?utf-8?B?NVEvRWdodm96Nkd2ckZiRUNqMlJKQVJGeWcxaGFiZ0Z1bGMveHM1VVFtMnFy?=
 =?utf-8?B?b2NHbGZjeXN4Q3ZOb0tzSXJ5QzJFQXl3NDdtM0JqWlk0cjVyMjJkMEhYODRm?=
 =?utf-8?B?L0VDdndBZUxYdDFFSGFHbGVzOUtMVC9ZK3ZPa0swUUpmcmgzZVlEVW5RT2ty?=
 =?utf-8?B?UE0wV3YxV0ZiYjlhVENqQmIvSTVkRm9hdlloTWhnSFA4b0V5MG5UUjJKYksz?=
 =?utf-8?B?eFovdkJHVFZZYUdCanJlOWVDM0VSNlhjbW1Lb1pPSkh4bjdZSzNqU1liMTVU?=
 =?utf-8?B?Z0lTZThRSTZYVURYV3dqWTRabEMyWFl0VDdZNjlVeGhTazhFbFNzMWMrRGFP?=
 =?utf-8?B?Ry9YVXQ2NlRGY1lWZG1DV3NBSG1TclFUdkJlTUV6SmhhSEhFWkxYa1lVSEk2?=
 =?utf-8?B?bUk5K0huTW1tS3JPcXdDeW1LRlBIYWtjOWVSWDNsNEpFZ09RdjUyYndIR2F0?=
 =?utf-8?B?eEhhT25raURpR2QzYk5rUzdQbHgrczdPYml3UzJCTnp2aW9RYTFJeFBsUmpt?=
 =?utf-8?B?cXZhYUdPQjdtd05XWE5NejNhbjVmR3pKZEErc1VSUDFQWHE3TUsxZ3ZlcTVB?=
 =?utf-8?B?WW9ZUThFUkJONEdKNEd4WEs0NkxnSk5uR3djdnQxYkdwRnBsMEMwU3dsdEhr?=
 =?utf-8?B?MUt3YzhaL1d1cGNhcUZwTW5lYzBsZUFGYjRRVVgxZ3B3ZE5PVm1lNksrY01K?=
 =?utf-8?B?QWpBYk1GampmRlByVmg0bEwvUEw4WkgxL1Q4UGkrc3MyVlRJQ3lHZzRVbkEy?=
 =?utf-8?B?VU1LcFNsdlIvSm8xWExSZjYxdzZJSjQxYjFhdGMvWWNHUXhHWEpPdjMzQ3VH?=
 =?utf-8?Q?5gyanzVFU2M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTFncVRLTEpBS2cxRkJmcXExREhZWDVmQ1FBWmFXWk1nSmRYOG1HSThSL2k5?=
 =?utf-8?B?aW5COFltazhUQldVN2ZRWVk2d09HOC9IS29RT0tDY1Z2UGt4dGVUeDVJYVlX?=
 =?utf-8?B?TnZvMXpkMFFLemw4UTFPZHZtQXNVRVk5RTI4eHN6U2J5R1lBRGVPZkJBREhD?=
 =?utf-8?B?RVZDM1lXYkVBZHY2MTFhR0FTNnllODlYUjVLQU5kYzNvS2FieXpuT1ljMzY0?=
 =?utf-8?B?TGZjQWFTL1JCWXpYTlJnZ1dSK1FCcXhQNDVLREVoU0dRR3pPYUpRbWxKbG82?=
 =?utf-8?B?REhlV1lvRmkvQTYyWUpwU0tRK2RncHZwK0k2MjFUdlNZTnk5eWVKMzB2aU9H?=
 =?utf-8?B?eDRGeU5URnJkeGJHVjVXeFV1cEZTQlhERnh6SDQ1S1lQRmxWOGRJdUpHZDRj?=
 =?utf-8?B?UVhxMnRNbGt4anp2bVFHbExDV0xUWUVOSkQ5MHBxQVlnbk1nVnl0QUFCcmFY?=
 =?utf-8?B?c2N3VlptaysrR3o4WWY2NGVxMURldVh1YXJ3M3c5WExrclBiU0pQdzN2Ymlo?=
 =?utf-8?B?T2dWbUd6MDliMi8xQnY4d2FsMkw5RDhnRi9NanFtdUJVUGZhUm9LSzhPMHA0?=
 =?utf-8?B?MWFvMXc1amtXMEtHQ005ZTVTdHlEUzlObVh4QlpUaDViRVE1aXZ1UmVIZGwx?=
 =?utf-8?B?MFBSNU5yR1NEcFo0eG1zRUYrTlc3MUlRcnZGLzdJY3ArKzRjR3NQY3VMZVgy?=
 =?utf-8?B?cDNPV2E1SWU3MWVWZmVTdVFBLzZqRGFzZzZsc2EwamJrT3dYUzZIZVFqcEJX?=
 =?utf-8?B?Z05JbXpQQ2FNVXhEMFJkWDB5MzlqeVVncHpiWE8xK1UrSEo1ZlBOMzY1NVNW?=
 =?utf-8?B?bVlCT3dhSTR4bVRyZlRJbnVWREdqRTNvNWpRbzBWN2M1d213QTl2bGlxUU5v?=
 =?utf-8?B?L1FaQlNSOHlTWWRxRkpWekhucTVJbkNXWVhGa2V2eUNQWjJEVlZSQ2thalVo?=
 =?utf-8?B?bGplU0kvcmNuNXJMRzZXM1hJUmEwUnVaTDB4YmpCS1ZqSXJkOU1wa09vcktQ?=
 =?utf-8?B?VzQ0UHR3QjRVNGpDUy81RHhIWC8xaWZvaFZVMGNNU2xJR1h4d25rUGtDblFv?=
 =?utf-8?B?dnZrdDJ6dVNoNEF4RngzVkczbGgrVEtmMVp6NEtXc2dycEVXdVAzcjd1VEsz?=
 =?utf-8?B?VGRSOU41c0VDU1pWdUZnMCtUL2dFQjkrWjlYdzRKY3hPSmluWXpKdHB2dW9S?=
 =?utf-8?B?V2E1cFh1Y1JrL1lONE0yRWNYWjR1VHY4a3dBWE1takFPL3lPZitZUzlZUW9O?=
 =?utf-8?B?VEpxTXBTSm9ydEpBWHNFSGdLdDlBRE5XbzNnMUg5WG5mcFIzQm5SeWNkcDY4?=
 =?utf-8?B?YWtrdmE0eWVITHhpZXN5VE1GbGVnNU9KR2ZSUzg3VWNDMkx3QWtnejNYd2Uv?=
 =?utf-8?B?UzVyUkxJZDkyZkRIdjdLcjRCMXdCbVN4L3pjNE9NUTdTNU9VT2E2SklRVG11?=
 =?utf-8?B?VUNTQUw5WmtieFhwWk5FKzZUTTM4aE9TUFRQdUZub0E2ejkzNUlrYXVObDF2?=
 =?utf-8?B?SjlSaXIxZ0RhbE1QdDNvbDBjTnM3UXJoajRlUzFPZWl2ck5Mdmt2L0F3UXh0?=
 =?utf-8?B?NGV5R2w3V2JBNW92aDZRQ1BQM1o1cXZwcWdLTFBEL0kxOUEzOElXTEJzM0lp?=
 =?utf-8?B?ZmNwcmdQQ2JBRko4UVdrdlFPV0NZZnBka0FLQWw5VDd2TDd6d0F4M21YSEVs?=
 =?utf-8?B?MklQcVRqcVdncC9MdXgvVC9MWGxmTWFSc1RCZHdkbzJucng5ZVZ0cU1nL0s4?=
 =?utf-8?B?OStET3ZCN0ZIL3dWc21nT3Y2dE1TajF2MkM0K3B3T2RhZEllWU5sNzJCRDBQ?=
 =?utf-8?B?dW14ekFyYWpLcHlUNHVHM20yUkxMQ2lTQUNvYUhKMURHdkVOM3JLMkRBOThk?=
 =?utf-8?B?cnQ1ZzcyWG1rNUg3ZXp3VmMwME5JUE0zS1ZIS0Z6TjN1QWFVV01QNUpVRWFW?=
 =?utf-8?B?NjFZTDNUOVoyQXRhdWNFMDZhL2hTNk5CK1Y2WXREVWUwTzl4QU1MbnM4UEFB?=
 =?utf-8?B?N2g1TVA5TnAwbFpZOFJ2L0NyTWxDcjJsRndLWjNaN1d3blFOM3NCTHN4WWIz?=
 =?utf-8?B?SWhkOUhmTlZKdmhucUVoYStzYk1Mb2tjZFlic0tvZW15OHY4RWZaS2d3REcw?=
 =?utf-8?B?VWxFZkl3TllwdUlMRTRxKzVwdndaamlPSDZLV2t4eUxCZ3BQR0lDV0xjRVJV?=
 =?utf-8?Q?u0u1Kaj39546v6yr4u25ff0wkmfJH7ZMtRGqASg5gWbE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b76bab20-1ad9-4e25-d53e-08dda98194d4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 07:20:17.0866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0jqjbNN3pBb0IRX4WACVWIZHa05j7HMR+s4THiucK4NGgZx/73Z+yOQ8WeieVrETCEQcWZ850D2p9duSl6P4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7632
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

On Wed Jun 4, 2025 at 7:42 PM JST, Danilo Krummrich wrote:
> On Wed, May 21, 2025 at 03:45:14PM +0900, Alexandre Courbot wrote:
>> +impl FirmwareDmaObject<FwsecFirmware> {
>> +    /// Patch the Fwsec firmware image in `fw` to run the command `cmd`=
.
>> +    fn patch_command(&mut self, v3_desc: &FalconUCodeDescV3, cmd: Fwsec=
Command) -> Result<()> {
>
> Same comment as on the previous patch regarding patch_signature().

This one can be easily fixed, contrary to the previous one. The
constructor now takes the command to patch and does it here (as it makes
no sense to run FWSEC without the command patched in).

>
> <snip>
>
>> +    fn dmem_load_params(&self) -> FalconLoadTarget {
>> +        FalconLoadTarget {
>> +            src_start: self.desc.imem_load_size,
>> +            dst_start: self.desc.dmem_phys_base,
>> +            len: Layout::from_size_align(self.desc.dmem_load_size as us=
ize, 256)
>> +                // Cannot panic, as 256 is non-zero and a power of 2.
>> +                .unwrap()
>
> There is also Layout::from_size_align_unchecked(), which I prefer over un=
wrap().
> I think we should never use unwrap() and rather the unsafe variant, which=
 at least
> forces us to document things properly, if there's no other option.
>
> In this case, however, I don't see why we can't just propage the error? T=
his
> method is used from Falcon::dma_load(), which returns a Result anyways, s=
o let's
> just propagate it.
>
> In general, we should *never* potentially panic the whole kernel just bec=
ause
> of a wrong size calculation in a driver.

Good point. In this case we can do something even simpler, which is
use the `align_up` method introduced in the `num` module.
