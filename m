Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB2AA98A50
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF5310E1B6;
	Wed, 23 Apr 2025 13:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dy8MG6qp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E546710E1B6;
 Wed, 23 Apr 2025 13:03:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiGnHRb0E/6sbXA1pxm9Zg1QCBQU+mEQ2wyaUMOk+K9RShPBSCNefDNLPk2JG5dqBAgtFsOXhZGX7yMLaEBwf4lux9uP775KH3acVT6Kmu5mEESEdI3YTNd6ATiyf/da2PnAizlwxSJCSKBk4kzm0hOKXHTo9xJnKnzGhKO4iuswLx0sPuSdabJiKyVCRC5IwinVef7yyn8AxLFL6LsAJ6yXOUtwuyhXbRbxW+o+y7E5TRRxRkOGsp8aF4qW3k2t1Sc+tOGVx5m0JstRvyu94vxn9zSVq8/XnHZrg4hdjzvCxqf+fVL74VUbj9STTb+LLM5QIrS7v9UsxX9hXIiQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjmTT8X0NMrBmBNON/YJ7swB9z/zQmyCfg2p5WJdQN8=;
 b=IIo4mFntiE1RbIB+p4J4bnKgpGJhqKzPza+o+R0UhYp82FzUdT8w31K5qUq0dOt6FM+hDpAQP9Ij2C9W8pj2JcHAok0Uq6tkWkxk1e4kJHpwSInLw8CSnYJXSAoYyhV9DelpN4RDBuNj7qUOas8dKVwV70Nx9kR5w8hIAo1rUMKDPkQj8bTQsFjL8K5exj/tDjhfgBJVoVkkAf5QRhAx3VmlDNg9qPeaqI+vHN5uPRQTh8Y8Ek9P19Ic9vl5xchTZKa48S4AoK5D27Ub8aIe6W1fu+HkzsMkvAiUjusdE7Ppg7xMDe6c2CE0aQeIeziWX8s1pR13nzhMJX3xGzPKUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjmTT8X0NMrBmBNON/YJ7swB9z/zQmyCfg2p5WJdQN8=;
 b=Dy8MG6qpfd23dR0rgDaHa0VB6rtKwZnZZrkDZa498GZHsjiuI52U4pi7wTCy+0fsPFmcGlce+RL5XNrBYy6PPKxu7FnkIWzjabuBq5ZA/IWs+HlkWeHNNrrzAtxEhqXYlrtKiKMn2l6b7ZTFX2L0iWWL/MR8bN2SBeQfV+jvUD6ZtIb0SdfLpZMrkWld6/6DmK+dMNMMNXlYJANBdXSRUBHk+Q5P4bP45WKtneGlVfPLgS4niykWrUt1uwmUv641hQzttt39n3qpz1KycIcthY1VzjZJZ+F+eYVjQvVjlAWWQGL7MS658Q8HFkmRypQ2XQe6MzQhL+ZZPRbBvQ4gqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7947.namprd12.prod.outlook.com (2603:10b6:8:150::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 13:03:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 13:03:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Apr 2025 22:03:30 +0900
Message-Id: <D9E1EZA9E2MF.RMVBUAANS7EW@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 09/16] gpu: nova-core: register sysmem flush page
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-9-ecd1cca23963@nvidia.com>
 <aAeBQ1aCQSrGFqCd@cassiopeiae>
In-Reply-To: <aAeBQ1aCQSrGFqCd@cassiopeiae>
X-ClientProxiedBy: TYCP286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5ecee3-9a27-4327-872d-08dd8267405d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2daOXJIcVAwL1ZYRnBjd2NoWjNPTnFWZWswa3RKLytVVEhjZGFNUTlJNkt5?=
 =?utf-8?B?R3htOTZaV1lvYXlGNTZqK1pTeUNveFQ0YWcxR3VsWEJKMWg4aC81b3E1Nlc0?=
 =?utf-8?B?ZEZJZmxyL2JrQnFFM2lqTGZtQ0pzcHlTUWEwemd6d01qczdOSHlWR3JzZ0x1?=
 =?utf-8?B?VjJOaEg3Y3M2YTBvT0Urc2NYZ2l4S1lJNnh6Y3BZaUxQMVNYZ09JNW1uRVpt?=
 =?utf-8?B?Uk0yU3VjRnIwUTUyZVdvTTQ3dDljSDVwNHA0S0trYlVpUk5ZenB3Z0RHeUJj?=
 =?utf-8?B?aDBlQkRpNlk4VzJSc2xCN1NLSzZiZnZaVHZmSDBGbVNiYlUyb0xMNzlPMHVy?=
 =?utf-8?B?U1crUXd2cU4vWGEvdEd6MG9lc3RkdExCQ2JGK0hmT0xnSjN3UFBlTGNHN2hC?=
 =?utf-8?B?bEt5UTB2aDlNYVpkM0xhMXpyajV2R0hVYm9ZYkp4ZnoycTBvd25ET3dsOXJB?=
 =?utf-8?B?UC91b3FGOG1jR0IrQnFDVU4rdjV2YjQwRTcxSW9zMWljMTVZR2JJYk5HSWtT?=
 =?utf-8?B?TGtSRUl4NjcxNWJoS041N3h4MHZ4Nm9wZkN4SE4xRStyY0hqMkZUNjBwNlBh?=
 =?utf-8?B?Z2NCU3VtMkxNdSt4elk4TjJCVVFSUktXakN1MnV6aUpGNnNXOEE4WVNOeVJ5?=
 =?utf-8?B?RWhrNEh6R3F6RExhUmtHdXlPTDdlRmk0dzB1MUt4V2h4OGlZQVd0ZmQyTndZ?=
 =?utf-8?B?U1dtZWxVSHpzb3Rib0hFM0NhTkZQTzdOVUFWZUgvU3lFRVJIWWpYRG55bEJV?=
 =?utf-8?B?cExKb2puRnp6ZW1TNy9yWTYvQ05SMkc0b2Q2RmRXclA1T2U5T05vNzRPcDJj?=
 =?utf-8?B?NGFRa3Q0RXVubkgrK3kveWgxbm84YjBCOUcza2JTQXZmZGt0eHpteXE0a2N3?=
 =?utf-8?B?RVlhRTdjbzNrYmNsR2ducFFGeUY4Nnc1ZERVbldMWTRWNXd0YmpNd2FhWlVF?=
 =?utf-8?B?eVhKQ04yRTRSMXljQStPZDJpVzVvQ2x5c01vRGZQWWQ4aTAzRzF2VlVaNjZZ?=
 =?utf-8?B?Nm9qMmVoSmMyMkk0dFRlSWZGNGMyRFpEejlwUW56ZWtHZHlLczZScEpQUUFP?=
 =?utf-8?B?UWQvWk1XSVFXVVJFTVRLSzBHVVQzNEx5Q2J4T1QrUFFsaStWT2dmdUlaTTFC?=
 =?utf-8?B?azJpajcxbDdNQ29KTENXcFo4QjNnNkcyTXJHeEttd0NrQ0tQU0dlOUE3VjNP?=
 =?utf-8?B?VVJjc050ZmVTMjAwcThzSmlibGRtYXV0dUVUaFlwTnkrOGQxbVVNRVYxcmho?=
 =?utf-8?B?NUdHWXlNdDVjWDE4UFR0QTlKZzVYNXNIajR3eEJoUnN3K3dMaHdEWUxKWkxq?=
 =?utf-8?B?elFxREhSN1FFV3lLNjB1QlliOTBiR0NSWFlEb3BGNnZCemVrNERkOGh4TjZq?=
 =?utf-8?B?NGVVeHN4cTBJODZLYXd5Q3hPLzEvMmQ0Mk92RGlRVklpdlhWcXlMRVZHU3hy?=
 =?utf-8?B?WWdTcytQWjZmVTdFZUxzb09GMnJjelIvNHVmMW9qaXA5V3NOUnZvMXgyRHI5?=
 =?utf-8?B?U3BSeE5LL0lDaGtEZFZROXpUZ2dLdTRPZ0hJVGJIUXhvOUZ3M3N4d0drUU1q?=
 =?utf-8?B?TTUxQlprVStjcUJ2dlJOWmd6RVdQSjRVdFNUbGNGZW4wVUU1SVRBN3BNNENn?=
 =?utf-8?B?ZDVBakQ4OTBLejZHQTFhNGxVYUZBVGRGMENJcllGRUpIWVVtZ0toMWhpck1r?=
 =?utf-8?B?U0s2MWRROHNRWnF5UkNqK3JqMjU1Ly94bURPckFiTmhIcEFDTlBESUt2QXJ5?=
 =?utf-8?B?YWJxejR4RWtHbUxtVXhhaU80WFRTekw1eTZDQnJ6SzlWZVlLcGlQeUwrYUxG?=
 =?utf-8?B?akJrY1YvdkRMSjdRQ1ZaWHVvRjBiYW0vWmJzQkpYN1A2VVpaZ1dkZitTVlMy?=
 =?utf-8?B?bnZzWDBud3B3S0lneE51Y0ZFZG00U1N0NFBRZm1wdlA3aEVHMVpBUmZaNGRn?=
 =?utf-8?Q?/pbTxg0ZkCI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mkd4UkdtUjZkVXN4UEZMWmtSaUs5UmJpTkdSVzBiMnBjY0hjeTVnZittWURx?=
 =?utf-8?B?OVFoVkVsVUZNTk81Q0RPR2g5NWd6Z3NLMmRGM2FIK1o0aG4wNGlVS29QQ2NX?=
 =?utf-8?B?L1J4azB5bGM2RG9IRnpGNmpQb2lMK3dxeW5EWDlVVXdjU1UwZGxTUU5OMm9i?=
 =?utf-8?B?aE1oZXcxT2twQ3Q4UC9pd1V1UU1LempHNlFHVmVuOVltd09WNnN6dmozR2Yv?=
 =?utf-8?B?am1QQ1NTNTNIanNpWmI2WG1RQTR4TThsUElxeXFpajJiY29lQnFQSUtLV0ZL?=
 =?utf-8?B?djdEUW80RVJLM0wyM0pTS1ZwcHI2cTc4aHYwejh2ZHFtSFhkZzBDVVFOeUZx?=
 =?utf-8?B?U0w3SE1HYTloUXl0bTBIWlJJVFd1SkJzUWY4TTF0K1J4QkJrRVUzMS9WVVZs?=
 =?utf-8?B?ajNqRGtsaWNLdGpTQ1duR0tpZVRrZWJRN1U1VE0wa3JDTnpObEg3ZkplZFQw?=
 =?utf-8?B?MkUxUER2dkFUdkNES2RmNnRYaGVRNzV6M2pXVGpuaXl5SnhsS24wUU1OWXBS?=
 =?utf-8?B?MlRNMldnR01lRk5mbjdRTE0xdEFkZmI2bzE3Ly95TlF5YVZxMHFLd0hCUXU1?=
 =?utf-8?B?QjgrdHR3V0puV0dkL29OWEVYdUdLaVpCa2VUZFdWNm10c2RNMWlRL2M0K2tx?=
 =?utf-8?B?d01xVStkTHg3bjFWOXZXK3hIZTR3MGFleHVGY1laaTJBcks1QVdqOU5jQmdr?=
 =?utf-8?B?bkJmYjkwNHBIMUUzQ1hTZUIrMElud3RNdE9xeDdQdXZibDZTdHh5a0tnNUZI?=
 =?utf-8?B?bHp5MFNsMThoK2dyZTZNYVk1bGZkT2k5Nnd3bU9pRHQ1cmhYN2tDdjUwMWQw?=
 =?utf-8?B?Z0w1VUg2cFBOeEhqTFB6bG96YUVuMzFQcHlFUGVYVkY4ejY3RzZoNkgrb0Zy?=
 =?utf-8?B?MERrM0haNzFSZnpub3V4TVhNL1JYYVFueDV6bFh5V3lYWFQ2VlR1WnJDOFJv?=
 =?utf-8?B?eGhScHJpNnc3UnBGUUJGTTJ5bzJVYmZJTy94Ti9rZjc0aTBEL1ZPQ1Znajk1?=
 =?utf-8?B?UElmUk05M25KMzJWRXAwTFpqRGlRaCtuV3c5YW5OaERFWW5sbmhreTBaNy9v?=
 =?utf-8?B?V1ZpUVFUT1RieEJoMGtDekZGbmZiMVpSYWFKRnlxci84RG4rak9oTUtHTjZn?=
 =?utf-8?B?eEw0bzk5R0tLTUZFRVk0TCtudHJQaURFS3h0aVpXR01hbnlicDk2TjRRQlNQ?=
 =?utf-8?B?NVNjTXdON285Zjd6MEVNbzlMQTRUTitkNGxXWEdxMVdPWjN2U2RhSURxSTIx?=
 =?utf-8?B?RVdVTnR2dVNxNHNoTEkxdVFaeDJOQjRFcGlxZjcwbHRsUlVFK2JBdDZlSldM?=
 =?utf-8?B?M2FKcVpiSGI3c3pNU3h5Ym5CTDVmY05Nanc4U0twL0V1STlCVWdseW1WcVFP?=
 =?utf-8?B?c2NuWE9ISGpoeTZuQ2duNkk0Z3BCc084TzMyL3dqdXVpVXl2Y0RhSkJDQzN6?=
 =?utf-8?B?a3I1RzRmbWpicUxweHhFVnFjQzNYQURMMFEwL1FpV3RPSFhyd2xVSVYzYTBi?=
 =?utf-8?B?MFVGK1g4R3FjN3ljaWdHc2JqMXI2alNZV0oreGRwUnpPdjJYVjhnL0hRTm8v?=
 =?utf-8?B?YU1UU3FCNEdCdURPNUYyd2E5MVBKOWhFMWFJMi94UFpUUFFZa0t3Y01NVWdK?=
 =?utf-8?B?TmtuSUQydlBmQSs1Y2JkMlBXSjdpSmlEeEtFenYzaXF6aUEzOVp4ajhDd3pl?=
 =?utf-8?B?QU80N2VmRE4rajFmL2EzU3dZOXhqa3BUa1dCMUw0eTRFRjN4c3p5UjFiY2kw?=
 =?utf-8?B?Z0hGL0hHRGlseTQ1T2F4YUJJWWlrQ1VQMzJ3YmFBaEVJNTRnZEpiU01mMmNN?=
 =?utf-8?B?NERnZWZiVGkxK2V4T0JsQytMZ21ZTWYrVHJiTHJmMy95ellOQXZPam4wZHp6?=
 =?utf-8?B?WGZMcld3d2tudFo5cFdrUEpaM1RHRXNhbHJkRk5GeWJnZXZheTdwYzJETVRR?=
 =?utf-8?B?VTNnYVVRU3N0bWpnUHFLdFJZckFyaFRaMTBXY3JONFoxUVlVWWpBWUNBcG0x?=
 =?utf-8?B?bTNmRXliR1NUV0ZVMG5uQ1VZWWxQYTAreUY0QTBGT3R2Q05hQnRBUGpWUHlG?=
 =?utf-8?B?Zy8yWU02OVo4MlFsazJlcWh6Y3lNVW9RU0FmejAxMGUwUTNRT3crSDlWVTV5?=
 =?utf-8?B?T1hjQlQ3bTY3Umk5U1ZCTVR5VlcyaHNYSWpaODMzcHVtd2F2SWxwNXZQSDNC?=
 =?utf-8?Q?MxSXUd6LRR6/BYP9U/LHrnRAOqDsEXyfwzMmi9uk/qOK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5ecee3-9a27-4327-872d-08dd8267405d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:03:34.3706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76lxySC51U0AKhSggsz9ZAZYbKUClCWGu0bTyn+IZysGDn7u/ihSJ2MHM6ex6f3uqthBlmG/qXFHYKRSgv7Pwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7947
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

On Tue Apr 22, 2025 at 8:45 PM JST, Danilo Krummrich wrote:
> On Sun, Apr 20, 2025 at 09:19:41PM +0900, Alexandre Courbot wrote:
>> A page of system memory is reserved so sysmembar can perform a read on
>> it if a system write occurred since the last flush. Do this early as it
>> can be required to e.g. reset the GPU falcons.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/dma.rs       | 54 +++++++++++++++++++++++++++++++=
+++++++
>>  drivers/gpu/nova-core/gpu.rs       | 53 +++++++++++++++++++++++++++++++=
++++--
>>  drivers/gpu/nova-core/nova_core.rs |  1 +
>>  drivers/gpu/nova-core/regs.rs      | 10 +++++++
>>  4 files changed, 116 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..a4162bff597132a04e002b2b=
910a4537bbabc287
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/dma.rs
>> @@ -0,0 +1,54 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Simple DMA object wrapper.
>> +
>> +// To be removed when all code is used.
>> +#![allow(dead_code)]
>> +
>> +use kernel::device;
>> +use kernel::dma::CoherentAllocation;
>> +use kernel::page::PAGE_SIZE;
>> +use kernel::prelude::*;
>> +
>> +pub(crate) struct DmaObject {
>> +    pub dma: CoherentAllocation<u8>,
>> +    pub len: usize,
>
> This should be covered by CoherentAllocation already, no? If it does not =
have a
> public accessor for its size, please add it for CoherentAllocation instea=
d. I
> can take the corresponding patch through the nova tree.

`CoherentAllocation::count` is currently not accessible publicly. I
agree that exposing it would make sense, let me add a patch doing that.

>
>> +    #[allow(dead_code)]
>
> Please prefer #[expect(dead_code)], such that we are forced to remove it =
once
> it's subsequently used.

Ah, that's indeed more suitable, thanks!

>
>> +    pub name: &'static str,
>> +}
>> +
>> +impl DmaObject {
>> +    pub(crate) fn new(
>> +        dev: &device::Device<device::Bound>,
>> +        len: usize,
>> +        name: &'static str,
>> +    ) -> Result<Self> {
>> +        let len =3D core::alloc::Layout::from_size_align(len, PAGE_SIZE=
)
>> +            .map_err(|_| EINVAL)?
>> +            .pad_to_align()
>> +            .size();
>> +        let dma =3D CoherentAllocation::alloc_coherent(dev, len, GFP_KE=
RNEL | __GFP_ZERO)?;
>> +
>> +        Ok(Self { dma, len, name })
>> +    }
>> +
>> +    pub(crate) fn from_data(
>> +        dev: &device::Device<device::Bound>,
>> +        data: &[u8],
>> +        name: &'static str,
>> +    ) -> Result<Self> {
>> +        Self::new(dev, data.len(), name).and_then(|mut dma_obj| {
>> +            // SAFETY:
>> +            // - The copied data fits within the size of the allocated =
object.
>> +            // - We have just created this object and there is no other=
 user at this stage.
>> +            unsafe {
>> +                core::ptr::copy_nonoverlapping(
>> +                    data.as_ptr(),
>> +                    dma_obj.dma.start_ptr_mut(),
>> +                    data.len(),
>> +                );
>> +            }
>> +            Ok(dma_obj)
>> +        })
>> +    }
>> +}
>
> The DMA wrapper should probably be added in a separate patch.

Sure.

>
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 1f7799692a0ab042f2540e01414f5ca347ae9ecc..d43e710cc983d51f053dacbd=
77cbbfb79fa882c3 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -3,6 +3,7 @@
>>  use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
>> =20
>>  use crate::devinit;
>> +use crate::dma::DmaObject;
>>  use crate::driver::Bar0;
>>  use crate::firmware::Firmware;
>>  use crate::regs;
>> @@ -145,12 +146,30 @@ fn new(bar: &Devres<Bar0>) -> Result<Spec> {
>>  }
>> =20
>>  /// Structure holding the resources required to operate the GPU.
>> -#[pin_data]
>> +#[pin_data(PinnedDrop)]
>>  pub(crate) struct Gpu {
>>      spec: Spec,
>>      /// MMIO mapping of PCI BAR 0
>>      bar: Devres<Bar0>,
>>      fw: Firmware,
>> +    sysmem_flush: DmaObject,
>
> Please add a doc-comment for this DmaObject explaining what it is used fo=
r by
> the driver and why it is needed.

Will do.

>
>> +}
>> +
>> +#[pinned_drop]
>> +impl PinnedDrop for Gpu {
>> +    fn drop(self: Pin<&mut Self>) {
>> +        // Unregister the sysmem flush page before we release it.
>> +        let _ =3D with_bar!(&self.bar, |b| {
>> +            regs::PfbNisoFlushSysmemAddr::default()
>> +                .set_adr_39_08(0)
>> +                .write(b);
>> +            if self.spec.chipset >=3D Chipset::GA102 {
>> +                regs::PfbNisoFlushSysmemAddrHi::default()
>> +                    .set_adr_63_40(0)
>> +                    .write(b);
>> +            }
>> +        });
>> +    }
>>  }
>> =20
>>  impl Gpu {
>> @@ -173,6 +192,36 @@ pub(crate) fn new(
>>          devinit::wait_gfw_boot_completion(&bar)
>>              .inspect_err(|_| pr_err!("GFW boot did not complete"))?;
>> =20
>> -        Ok(pin_init!(Self { spec, bar, fw }))
>> +        // System memory page required for sysmembar to properly flush =
into system memory.
>> +        let sysmem_flush =3D {
>> +            let page =3D DmaObject::new(
>> +                pdev.as_ref(),
>> +                kernel::bindings::PAGE_SIZE,
>> +                "sysmem flush page",
>> +            )?;
>> +
>> +            // Register the sysmem flush page.
>> +            with_bar!(bar, |b| {
>> +                let handle =3D page.dma.dma_handle();
>> +
>> +                regs::PfbNisoFlushSysmemAddr::default()
>> +                    .set_adr_39_08((handle >> 8) as u32)
>> +                    .write(b);
>> +                if spec.chipset >=3D Chipset::GA102 {
>> +                    regs::PfbNisoFlushSysmemAddrHi::default()
>> +                        .set_adr_63_40((handle >> 40) as u32)
>> +                        .write(b);
>> +                }
>> +            })?;
>> +
>> +            page
>> +        };
>> +
>> +        Ok(pin_init!(Self {
>> +            spec,
>> +            bar,
>> +            fw,
>> +            sysmem_flush,
>> +        }))
>>      }
>>  }
>> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/=
nova_core.rs
>> index 878161e060f54da7738c656f6098936a62dcaa93..37c7eb0ea7a926bee4e3c661=
028847291bf07fa2 100644
>> --- a/drivers/gpu/nova-core/nova_core.rs
>> +++ b/drivers/gpu/nova-core/nova_core.rs
>> @@ -21,6 +21,7 @@ macro_rules! with_bar {
>>  }
>> =20
>>  mod devinit;
>> +mod dma;
>>  mod driver;
>>  mod firmware;
>>  mod gpu;
>> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.=
rs
>> index fd7096f0ddd4af90114dd1119d9715d2cd3aa2ac..1e24787c4b5f432ac25fe399=
c8cb38b7350e44ae 100644
>> --- a/drivers/gpu/nova-core/regs.rs
>> +++ b/drivers/gpu/nova-core/regs.rs
>> @@ -14,6 +14,16 @@
>>      28:20   chipset =3D> try_into Chipset, "chipset model"
>>  );
>> =20
>> +/* PFB */
>> +
>> +register!(PfbNisoFlushSysmemAddr@0x00100c10;
>> +    31:0    adr_39_08 =3D> as u32
>> +);
>> +
>> +register!(PfbNisoFlushSysmemAddrHi@0x00100c40;
>> +    23:0    adr_63_40 =3D> as u32
>> +);
>
> Please add some documentation for the register and its fields.

Ack.

Thanks,
Alex.
