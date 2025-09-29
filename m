Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6015EBA9995
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739A710E23B;
	Mon, 29 Sep 2025 14:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X3QxsOSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012028.outbound.protection.outlook.com [52.101.43.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3580110E23B;
 Mon, 29 Sep 2025 14:34:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2aNr+6PHVE47alco0jyqMONeaNXzXc5/fNHY5+3LrTE1Guh6ozBSW0dcBEu7LN7PYib49F9nzXxkIfFVz8v6KaFvlsZTgxS0QnPSk5ZOI85/WpNmCmdkyMV+k08kmSoIETzdf6ZHqIweKAJjvyibhAxD521F8EB++WxUrPSLMmc07YGwzbURavWTG/roAaJhNWqIdHWhQZCPCYiL7lUUJtO8Y8twYtn2SaNSFakjhcpbsVudiS/VpWUHHRA5Sx5ShLlxyr4Po/BRyvz+tVskvUf9E9+hR9ZIwdCj47SUyqG7ZYjR2eV2IuMuwyuivj35idaoEKx1rQBzq6OXevw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/MeirHNjFCI/w52SrvpFv+ro8lcsLIZnxAV0bP0zeU=;
 b=Sz6EcXNghNTD4GtWWkl2PQdO4OJs+XNNoI0P6gZY/Ii3OHdjwrZ8zEtVTVg2VkQQ/q+iXIbadNLw0PpFiPFNy2CUjIgo/r2b/LlV2GjOOiO1SBIE3j9afAKkciXc/xRCf1Z7KEKgQAC0uQ+yXM8dpehXUFFeZXCcX4QurPe7NE7jonxxMvkzMXaE8PoOs+dYbwJa7ubDtr3KJmhki/MSvNtLu/R+wfP3u4rETYJvTXplsFymQZx8kBSKDYF+wrV3IuEPBhuoMb/oO8AcpiJOXwNsM6j2rtXMeyfjsrP/x1XpVwfoceXhd6BcCGWzbfXnJwi+1880ZaX63di4H5Ph7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/MeirHNjFCI/w52SrvpFv+ro8lcsLIZnxAV0bP0zeU=;
 b=X3QxsOSZtropNBAliaiUpLJKf/oLtffAo6rzz5+TtpI9+SZwGA6e7RkLcKwzePKmIWzPaI1i0JmL2ArZ5Mej//A8GGeJhD7iNvDWJOvb8JyT98DWvyf0znMVArzNTQDjqNII6HubmDrzUbZ/FvjmlEiJyJzuU3H44GOp3Hs12wQ2TE5ZqlVwfA3PT0REOQrZf54hpIMVEZB41eWlepxMUnE79AGu7ZUbnbHI2NW39wF/GtQiZq1mijrsKgw30QhjmpUe0NlPKw0+CyU7VLNFkeQAPmsYlzU6oYLp/9iFyC2xmS559PSBtP17TjJGLBWKUMxit2/y5Le66wer3Jr+WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9455.namprd12.prod.outlook.com (2603:10b6:610:1c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 14:34:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 14:34:42 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 23:34:38 +0900
Message-Id: <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
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
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
 <DD2GCDGQ7Q4W.1CSFYSETFSN5H@nvidia.com>
 <7brvf66smc3ltqrw7tm7smth6wnefeqykdm2n4qahi5xnr6d5o@4l5xfdbznlp3>
In-Reply-To: <7brvf66smc3ltqrw7tm7smth6wnefeqykdm2n4qahi5xnr6d5o@4l5xfdbznlp3>
X-ClientProxiedBy: TYCP286CA0226.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d02a06-cd66-450f-234e-08ddff65538e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjNJTW84VmZOVkVNOGF0SVRDd1B3Yjk3U01mMDdVZlNWZG9aWTFyMDd5WnRn?=
 =?utf-8?B?NzIrc2owL2gxMndNUFFGWVRDTG9abFQ3TGxVaW5ycmh0YW4xamdLRG0xK0p1?=
 =?utf-8?B?OVRjekd1bFdKVUtQV05OdHM5ZFBPWDdwVDh4dFhEQ0VZK0FoTCtrbWVOSFJP?=
 =?utf-8?B?dmVPUWlmeXZIK2tiVWdKTHFlTmZIZWJtRnpyQXpGUjVtTEhWQkp3d0dsa2NT?=
 =?utf-8?B?a0tVZGpUNVJFV2x6WWhuREFZSCt2MGVyV2dDVjZkVUtjclZmd1VtWVR4YUpK?=
 =?utf-8?B?UVRhKzU0MHkrSkJuWlhWN0RmdDNOejk0Z1c0blNXVVRUS2pwVzZmWk9wTFNP?=
 =?utf-8?B?TjdEdVlScnE3ZmoxYlN3MDFkVzduakp0OW8xQ3MvcjdtMHR0YWV5eVhhQWtp?=
 =?utf-8?B?QVBrdlNudUE5OXFMZVo4UXJhanR3YVhQdXlWSlEyY0I1NFpudEUyaTlnRm1Z?=
 =?utf-8?B?MUF4dWxBanhUQ3FvZU5vOGwwOW4rakxkN01uckpsajAzUHN5NEdocXFRTmh5?=
 =?utf-8?B?WDJteE5RNE1hWmY2ZklTR21sU1NGeXZBdFFNOTdHaUpUNlJQZ0xmZi9sZUtH?=
 =?utf-8?B?OWVMVmtSRm1MbFZvQThSQUh4UDhsZDJ2dG42SVlPaGRQdlh5eUVHenRxYnA1?=
 =?utf-8?B?Y1M5ZWZIcUNyWUI2b1psa0R5UlBJdGJRa002Wm5SZGVPYysvWldnQ3VxVFlx?=
 =?utf-8?B?My9qdGpmL1pPNTRNbzQ1SVU1SnQ4am40MzU1TldaMjBrRnJJVlFlcGxMTGpY?=
 =?utf-8?B?RXkzRnlGNk5KVUNxNHBBeWc1NnA1V1duSDgxaWg0ZWxzU1RJMkoxQ2pKTHNr?=
 =?utf-8?B?MXBQdEN5dUhXUFkwQnEyM0JhazJuNHZZRTJUYzlJOEp0azA1T1B5L0NOcmxl?=
 =?utf-8?B?cjNsOGNuMjhBU2lQV3k3bkVYU2grcEdFaklzN1hXS3FZSmtEaW9CQWVwTkFP?=
 =?utf-8?B?cC8wUTAzempqSVZkODhQdzRSYzYyZlBPMDlURWs5SGo5cVJtT2tGU3pVSjNv?=
 =?utf-8?B?OHRjTnFET0lISEV2ajE0bk9zTVU2YVBQcHhEbnhBREwwb25wazc0WmViSWpQ?=
 =?utf-8?B?Rktrd0FVaW50VW9yRWhteWtSWTZSQ1N6STNXand5Wmw0UGJ5a0tZUytKNlVw?=
 =?utf-8?B?R2dIeFNyaUlOUHcyb1pMdllEeUJ3SE5ubmpjWmNrbUFpSFFzdVhDTUpXV2Yx?=
 =?utf-8?B?aWxHbWRvWUJ5ZTV2MDFSYWU4RlpHTWd1WU50YXVQb0NjVzNVZXJyY3IvRU95?=
 =?utf-8?B?bk9DUE16TkFpV2xsakFsTFRRQmdndUN5c0xneWlnalRQY0VtSTFQZ3FqN25u?=
 =?utf-8?B?Q292L1JZMUE3U05GekRmV0xWancrNS9Pa0xrUUNXdHQreVhRcjVXMFArVjVZ?=
 =?utf-8?B?Z0NsQnp3V0IzMGF2SGJRV2d6QUhTbDZSRHJyQ3JDRk51VDFGK3Z2RDVFRFFJ?=
 =?utf-8?B?YXBzVmNhSXBjRUtXbzhOU1lHalVEZkI3T2N6VmRka3pnWjhqK2doSndSOUdy?=
 =?utf-8?B?UDJ2SlM0V3F3aFJ4aVMzd1NTNDJmVzUyYlljNFZyaHU1TDNxSmg5K21QN1pI?=
 =?utf-8?B?Z1hXN2JNQzJGTm1ISTcxcXF4WHl5bDRyU1pNYitqTG8yMldsSHV1VVp2dVVG?=
 =?utf-8?B?NEFUcFBtbmFPeFJNQllBYVVQN283SG50SGdCL1IvYTFqaXdDQ3hmSUpWWC9u?=
 =?utf-8?B?V3NQOUw2dzd2R0krZTZkcW5XTXc3bmYyeUtyYUd1b2xPYXZMWXpLV1ZnRWxl?=
 =?utf-8?B?YUQ3ck9pR1FkTWJwSVZFN1JMellmbGtEM3k0RFBURWMxRENkdGdiZlFrSlAv?=
 =?utf-8?B?cDgxd25JRlFTQmpOdENmWlN1OUlzY0lpUjVvTE8xaE1OQnJOMFhVREZsc0px?=
 =?utf-8?B?UEF4NFVRRG5VbGtXY00zTGhYWVRYY29DbFAza2RDT21JZzFkVUlubElTc3N3?=
 =?utf-8?B?OXZxVWQraGsyTUpzbCtnVk9nK1JMT28vVzc1dTVMSWJEdmpod05DWUs0M1lH?=
 =?utf-8?B?a0tZR2dWQVBRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eldRZXVyNjQ1eDNzVnJHMHlleHNlVmNnSllJcFp0SWdSRXhYUmMrcVRCZG5j?=
 =?utf-8?B?QUx3aVI5WEs5a3ExRTdiYUNYZDB2cWRIYnJrNTFqTVdvUHhQNXh6RmV5a0ly?=
 =?utf-8?B?R2xaLzJVSVJZTXhLNEVDNWVJWUpSS1RHRGhKcWExeEt4SHFNbTlrOGdpMmN0?=
 =?utf-8?B?bFRaTVIwZjQ3QjgwcUpoZVYrSnVhd3BVNGNtNEtZTE9nWCtDZEJvK1YwdlMw?=
 =?utf-8?B?SVJKUG9CQkNPTDkxYVdMOWUzTEUxYU9uWW8zVm9EczBqajR5OXg3Uk5sTkpU?=
 =?utf-8?B?OEFWZjBKWGlYdXMxM0VESnZKLzZWSnFnMkxYNWRLekJ3aE1NWVdDd3JSWitT?=
 =?utf-8?B?elAxQjZZdSttVEtDSm1IYUdtKzFELzd2S1R1dU5pZmtmR2xUS3k5N3B5aVV5?=
 =?utf-8?B?TnZjUmM2ZFVPNGo1S2hvaThLZWZyMGc1NjRiVUtxV2RYMldlZVpHbVMzNWs5?=
 =?utf-8?B?NCtuVVk4bUs4aDNvMlBRN01LU3UyMnpSM3pRT2xwdjhMd3NuZVFxdTY3QVQ1?=
 =?utf-8?B?RnR1ZGlXUHZHYjdmcnE0VVBCTmlFNFlvTTZpRFBGRGxscThIckdDSjBlTkVw?=
 =?utf-8?B?TlFZWVJtSTgwQ3ZQRk44RmQvVGt6RHFxZyswdmlSeU1Gdm1YdGY3L1VNamZs?=
 =?utf-8?B?SVgwaDkzcXc5NVNadnZSMkRCUnRuRGFjN2QvaG9kbjJ3SHBlbmhrTklmdUhO?=
 =?utf-8?B?UmZ0eXZpODJra3ZscHowS2RyL0s5V280ODdhbjR6djdmZ0VzNnFWWS9IZDhx?=
 =?utf-8?B?Z3k0U00za0hGbXFHc1dSaXJzYjN1US9yeUdpR1ZxUVFCV2lHQ2MzMUlQM2VK?=
 =?utf-8?B?RDFCWE90UEFyQVZQbFgxM0UrMGdwUXVmU2c0UnhjSGN5a2FwU0doVUFsK2J1?=
 =?utf-8?B?RDdYdXd1T3N2TW1EZTYzWUtYNFBCNlgzVFhsNmdQWjA4TjlnbFNRbnZobUlC?=
 =?utf-8?B?aGpsbTZRRGJGcnJHSVlzbnE3MXA3ZzRWTDNoY3JqWkM3eEg0bm1xcDZwZEJx?=
 =?utf-8?B?TkUvUDZIa0V1SGlUdlpSTWUvNHN0SEJONWNHbnhMTmhGMG5JWGE4MitiMVY3?=
 =?utf-8?B?djJNM3JvV1dTWk91ZG1RV1B2SkpCUGt3OVVNUDB2WjdvTzI3eWhjbklQblJm?=
 =?utf-8?B?bjNkTllTMStOQkl1SHQwdG9Vc0poTlJNTU56RDlzTGpCanowODlYWDdaa3Jv?=
 =?utf-8?B?UzdPaUhZN25VSVNQaHYzM0Fvd0ZDenV0bVQ1STZtL1VwdFRVQmYyMG1DQkI2?=
 =?utf-8?B?Wk5xZFNzRUhYcnh5MW1MMTRTeGJ1RnNqd2hRR01vWFp2Vm9pRG5MZlEvZjRz?=
 =?utf-8?B?ZkhvUG1kUk1NR1p2U3RTUWlCcDlIaVNPdGFSSVZvdGRRcDdpUEtVVHpzSXAv?=
 =?utf-8?B?WTYyZTN5QnhmS3NxY25qdjNpZDBObXlwQUY0cHJtcHE1WGUyK254MnhnR2p6?=
 =?utf-8?B?L3RhVnlBVEY3YmxzajFOVzRieVhvNVUyRmh2UGhnR3RrTWJHcFc5Uk9SMVZh?=
 =?utf-8?B?K0lWT3BDTUVjcU9xR0xlekJ0ZFNhNmlqUE80SVdib01UVEpMTHlGeXJNZmdL?=
 =?utf-8?B?WWp0ZkoxaU1YeUhxV3dhd1hpSjB5QUowaEJNL0UvTWtXVlk4Q1FTN2FtYjk1?=
 =?utf-8?B?V0tHSWg1TEp3MzJxamNqbmlWT2dYa0JOYk0yNUZSWGw1dEFYSnFxNndFcm84?=
 =?utf-8?B?RktoQXRwQUFzZExTQWxnRlJ3dHpvMDdkbGkrcW5CTUZSTXVRU01FZURmOHVI?=
 =?utf-8?B?ZEF5L0czUktFcTdiQnpPRHNlNW9McnVjd1lVdzVGOUttSEhsT1ljb1ZwT1lz?=
 =?utf-8?B?Rk1GWExROFpleUo0eFBNNG4zMHRtSm13d01HMWh1cVBEQTU5OVEwL2pHc2Zt?=
 =?utf-8?B?VXVOc0M2SVJjTUU2bW81Z0hPVHZhVXZZK3NEYWhVSFhGOWlVY251WWd0RnNB?=
 =?utf-8?B?NGVZTGhDWXBBUFFGeW96Rkgya2Q2Z2NjVnNPbWxJeFpCSGJoUzkxZ2lxMWsy?=
 =?utf-8?B?cmFiSFBidy81UFBVVXducXlZMy9HVGpISG9TVURjOTlOQmdwRng3SE5Ca2Qv?=
 =?utf-8?B?VE10S1g0K01yUUxJODltVnRDc0pESE54R2ROQnN4TW16YXFVVEduT1UwTTgw?=
 =?utf-8?B?aTVHUVp6M2RDRTB5K3Q0TUtuS0M5eElWdGcxOWRWMlozTWNmdDEzd1kvbVht?=
 =?utf-8?Q?OUyLJnuA0/RLTE5hWCiEkAguxKb2ih+fKzihwKWDVpVO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d02a06-cd66-450f-234e-08ddff65538e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 14:34:42.0744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8J2F7lhQyCyQiIx9ACtEbIZ2GFA3wwssYrKAm/s7r7dMfiB0/+kxkqn3cNp2zjBwgYCcrWHbPiUMAXKLkAVyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9455
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

On Mon Sep 29, 2025 at 3:19 PM JST, Alistair Popple wrote:
<snip>
>> > +
>> > +/// Number of GSP pages making the Msgq.
>> > +pub(crate) const MSGQ_NUM_PAGES: u32 =3D 0x3f;
>> > +
>> > +#[repr(C, align(0x1000))]
>> > +#[derive(Debug)]
>> > +struct MsgqData {
>> > +    data: [[u8; GSP_PAGE_SIZE]; MSGQ_NUM_PAGES as usize],
>> > +}
>> > +
>> > +// Annoyingly there is no real equivalent of #define so we're forced =
to use a
>> > +// literal to specify the alignment above. So check that against the =
actual GSP
>> > +// page size here.
>> > +static_assert!(align_of::<MsgqData>() =3D=3D GSP_PAGE_SIZE);
>> > +
>> > +// There is no struct defined for this in the open-gpu-kernel-source =
headers.
>> > +// Instead it is defined by code in GspMsgQueuesInit().
>> > +#[repr(C)]
>> > +struct Msgq {
>> > +    tx: MsgqTxHeader,
>> > +    rx: MsgqRxHeader,
>> > +    msgq: MsgqData,
>> > +}
>> > +
>> > +#[repr(C)]
>> > +struct GspMem {
>> > +    ptes: [u8; GSP_PAGE_SIZE],
>> > +    cpuq: Msgq,
>> > +    gspq: Msgq,
>> > +}
>> > +
>> > +// SAFETY: These structs don't meet the no-padding requirements of As=
Bytes but
>> > +// that is not a problem because they are not used outside the kernel=
.
>> > +unsafe impl AsBytes for GspMem {}
>> > +
>> > +// SAFETY: These structs don't meet the no-padding requirements of Fr=
omBytes but
>> > +// that is not a problem because they are not used outside the kernel=
.
>> > +unsafe impl FromBytes for GspMem {}
>>=20
>> These ARE used outside the kernel, since they are shared with the GSP.
>> :) I'd say the reason these are safe is just because we satisfy the
>> requirements of AsBytes and FromBytes:
>
> Yes, and they're actually old safety comments that I missed updating to b=
e the
> same as the rest.
> =20
>> - No initialized bytes,
>> - No interior mutability,
>> - All bytes patterns are valid (for some generous definition of
>>   "valid" limited to not triggering UB).
>
> I was under the impression that that's all `unsafe` is really marking - c=
ode
> the compiler can't prove won't trigger UB. So I'd assume that's all we'd =
have to
> prove in safety comments anyway.

A good rule of thumb for writing `SAFETY` statements is to look at the
`Safety` section of the unsafe code we call (here `FromBytes`), and
justify why our calling code satisfies each of these.

>> > +    dev: ARef<device::Device>,
>> > +    seq: u32,
>> > +    gsp_mem: DmaGspMem,
>> > +    pub _nr_ptes: u32,
>> > +}
>> > +
>> > +impl GspCmdq {
>> > +    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<=
GspCmdq> {
>> > +        let gsp_mem =3D DmaGspMem::new(dev)?;
>> > +        let nr_ptes =3D size_of::<GspMem>() >> GSP_PAGE_SHIFT;
>> > +        build_assert!(nr_ptes * size_of::<u64>() <=3D GSP_PAGE_SIZE);
>> > +
>> > +        Ok(GspCmdq {
>> > +            dev: dev.into(),
>> > +            seq: 0,
>> > +            gsp_mem,
>> > +            _nr_ptes: nr_ptes as u32,
>> > +        })
>> > +    }
>> > +
>> > +    fn calculate_checksum<T: Iterator<Item =3D u8>>(it: T) -> u32 {
>> > +        let sum64 =3D it
>> > +            .enumerate()
>> > +            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
>> > +            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_=
left(rol));
>> > +
>> > +        ((sum64 >> 32) as u32) ^ (sum64 as u32)
>> > +    }
>> > +
>> > +    #[expect(unused)]
>> > +    pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
>> > +        &mut self,
>> > +        bar: &Bar0,
>> > +        payload_size: usize,
>> > +        init: impl FnOnce(&mut M, SBuffer<core::array::IntoIter<&mut =
[u8], 2>>) -> Result,
>>=20
>> This works pretty well for in-place initialization.
>>=20
>> There a couple of small drawbacks though: `M` must implement `FromBytes`
>> even though we only send it, and (more serious) there is no guarantee
>
> Yes, that detail annoyed me slightly too.
>
>> that `init` will fully initialize the command - a forgetful caller can
>> omit some of its fields, or even the whole structure, and in that case
>> we will send a command with what happened to be at that position of the
>> queue at that time.
>
> Good timing as I was just looking to see if there wasn't some way of ensu=
ring
> this happened, or at least was much more explicit than what we currently =
do.
>
>> I think this is a good case for using the `Init` trait: it's like
>> `PinInit`, but without the `Pin`, and it ensures that the whole argument
>> is initialized. So this method would change into something like:
>>=20
>>     pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
>>         &mut self,
>>         bar: &Bar0,
>>         payload_size: usize,
>>         init: impl Init<M, Error>,
>>         init_sbuf: impl FnOnce(SBuffer<core::array::IntoIter<&mut [u8], =
2>>) -> Result,
>>=20
>> This also allows us to drop the `FromBytes` requirement on
>> `GspCommandToGsp`! But also requires us to use `unsafe` to call
>> `Init::__init` on the pointer to the command. I think it's worth it
>> though, as this removes the risk of sending partially-uninitialized
>> commands.
>
> Agree on it being worth the unsafe call, especially because it is unsafe =
if the
> caller doesn't do what it's supposed to regardless. But how does this con=
trast
> with `MaybeUninit`? I was wondering if something like this would work:
>
>     pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
>         &mut self,
>         bar: &Bar0,
>         payload_size: usize,
>         init: impl FnOnce(MaybeUninit<&mut M>, SBuffer<core::array::IntoI=
ter<&mut [u8], 2>>) -> Result<&M>,
>
> Note I'm not sure we could actually make that work as I haven't tried it =
yet. I
> suspect I've missed something with lifetimes there :-)

The difference with using `MaybeUninit` is that the unsafe code would
need to be *within* each `init` argument - IOW, within each caller. It
also does not provide any guarantee that the whole `M` is initialized,
we have to trust each caller for doing that properly.

I've tried implementing using `Init` and it works even better than I
thought. Each type actually automatically implement `Init` on itself,
which means that instead of implicitly calling init!() as in

  cmdq.send_gsp_command(bar, init!(MyCommand {
    foo: ...,
  }), ...);

You can just pass an object as a stack argument and it will also work!

  cmdq.send_gsp_command(bar, MyCommand {
    foo: ...,
  }, ...);

Of course in this case the `MyCommand` instance is first passed on the
stack before being copied into the command-queue, but for small commands
this is pretty convenient. Larger ones can use the `init!` syntax for
full in-place initialization.

>
>
>> Then there is what to do with the `SBuffer`. I'd like to think a bit
>> more about this, as not all commands require it, and those that do
>> typically send arrays of particular types. I think we should be able to
>> use the type system to have more control over this, but let's keep that
>> for the next revision.
>
> Sure. You are correct that not all (most?) commands don't need it, and it=
's a
> shame we don't have proper bindings for them anyway. Although in some cas=
es that
> still wouldn't work anyway (eg. for registry keys) where it really is jus=
t a
> packed variable number of variable length strings. Not sure what a Rust n=
ative
> representation of that would be.

For now the best I could think of is to have not one but two traits for
GSP commands: one for commands with payload and another one for commands
without payload. And two variants of `send_gsp_command` for each case.
That way we can at least guarantee that we won't pass a payload where we
shouldn't, or forget one where we should.

I got a prototype of this working and along with the `Init` thing it
feels pretty right.

>
>> > +    ) -> Result {
>> > +        // TODO: a method that extracts the regions for a given comma=
nd?
>> > +        // ... and another that reduces the region to a given number =
of bytes!
>> > +        let driver_area =3D self.gsp_mem.driver_write_area();
>> > +        let free_tx_pages =3D driver_area.0.len() + driver_area.1.len=
();
>> > +
>> > +        // Total size of the message, including the headers, command,=
 and optional payload.
>> > +        let msg_size =3D size_of::<GspMsgElement>() + size_of::<M>() =
+ payload_size;
>> > +        if free_tx_pages < msg_size.div_ceil(GSP_PAGE_SIZE) {
>> > +            return Err(EAGAIN);
>> > +        }
>> > +
>> > +        let (msg_header, cmd, payload_1, payload_2) =3D {
>> > +            // TODO: find an alternative to as_flattened_mut()
>>=20
>> I think we can use it if we enable the "slice_flatten" feature (stable
>> since 1.80, introduced in 1.67).
>
> Ok, will try that. Hopefully explicitly using the feature also makes clip=
py
> happy but if not I guess we can leave the over-rides below.

I think you will also need to explicitly enable the feature somewhere -
for the kernel crate it is in `rust/kernel/lib.rs`, but Nova being a
different crate I am not sure where we are supposed to do it...

<snip>
>> > +
>> > +            (msg_header, cmd, payload_1, payload_2)
>> > +        };
>> > +
>> > +        let sbuffer =3D SBuffer::new_writer([&mut payload_1[..], &mut=
 payload_2[..]]);
>> > +        init(cmd, sbuffer)?;
>> > +
>> > +        *msg_header =3D GspMsgElement::new(self.seq, size_of::<M>() +=
 payload_size, M::FUNCTION);
>> > +        msg_header.checkSum =3D GspCmdq::calculate_checksum(SBuffer::=
new_reader([
>> > +            msg_header.as_bytes(),
>> > +            cmd.as_bytes(),
>> > +            payload_1,
>> > +            payload_2,
>> > +        ]));
>> > +
>> > +        let rpc_header =3D &msg_header.rpc;
>> > +        dev_info!(
>> > +            &self.dev,
>> > +            "GSP RPC: send: seq# {}, function=3D0x{:x} ({}), length=
=3D0x{:x}\n",
>> > +            self.seq,
>> > +            rpc_header.function,
>> > +            decode_gsp_function(rpc_header.function),
>> > +            rpc_header.length,
>> > +        );
>> > +
>> > +        let elem_count =3D msg_header.elemCount;
>> > +        self.seq +=3D 1;
>> > +        self.gsp_mem.advance_cpu_write_ptr(elem_count);
>> > +        NV_PGSP_QUEUE_HEAD::default().set_address(0).write(bar);
>>=20
>> I'm a bit surprised that we always write `0` here, can we document this
>> behavior, maybe in the definition of `NV_PGSP_QUEUE_HEAD`?
>
> I was also suprised the value doesn't matter but this is what both Nouvea=
u and
> OpenRM do. I guess it just triggers some kind of notification on the GSP =
and the
> actual queue head is read from the shared memory pointers.

In that case I think we should definitely document this - or even
better, if it nevers makes sense to write anything else than 0 to
`NV_PGSP_QUEUE_HEAD`, to add an explicit method (e.g. `kick`?) that does
this for us. Can you try and go to the bottom of this?

>> > +
>> > +            // Can't fail because msg_slice will always be
>> > +            // size_of::<GspMsgElement>() bytes long by the above spl=
it.
>> > +            let msg_header =3D GspMsgElement::from_bytes(msg_header_s=
lice).unwrap();
>> > +            if msg_header.rpc.length < size_of::<M>() as u32 {
>> > +                return None;
>> > +            }
>>=20
>> If we have a message in the queue and this condition doesn't hold, I
>> don't think we can hope that it will in a further iteration - this
>> should be an error.
>
> I was thinking messages may get partially written and we'd see this state=
, but
> you're right - the shared pointers shouldn't be updated until the entire =
message
> is written so this should be an error.
>
> That will require the `wait_on_result()` function, because `wait_on()` do=
esn't
> allow the closure to return a failure. We could just return Option<Result=
<_>>
> from the closure but that's a bit gross, because wait_on() would then ret=
urn
> Result<Option<Result<_>>>.

We can now use `read_poll_timeout` (from `kernel::io::poll`) which
separates the acquisition of the state and the test of the condition
into two separate closures - the first one returns a `Result`, and its
error is propagated as-is, which is what we want in this case.

Actually this reminded me that I should send a patch to remove `wait_on`
altogether now that we have a better alternative! :)

>> > diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/g=
sp/fw.rs
>> > index 7f4fe684ddaf..2e4255301e58 100644
>> > --- a/drivers/gpu/nova-core/gsp/fw.rs
>> > +++ b/drivers/gpu/nova-core/gsp/fw.rs
>> > @@ -15,7 +15,9 @@
>> >  use crate::firmware::gsp::GspFirmware;
>> >  use crate::gpu::Chipset;
>> >  use crate::gsp;
>> > +use crate::gsp::cmdq::MSGQ_NUM_PAGES;
>>=20
>> I guess the number of pages in the message queue is firmware-dependent,
>> so would it make sense to move its declaration to this module?
>
> It's not firmware dependent - it appears we can set it to whatever we rea=
sonably
> want (for some value of "reasonable) so long as we allocate the right buf=
fer
> sizes, etc. I noticed and tested this a while back when removing some mag=
ic
> numbers.
>
> That said 0x3f is what I chose because that's what Nouveau and I think Op=
enRM
> use.

Ah, that's great and makes perfect sense! So I suppose the
`pageTableEntryCount` member of the `MESSAGE_QUEUE_INIT_ARGUMENT` is to
pass the total size of the message queue. I'm starting to think about a
version of the command queue where its size would be a generic argument,
but let's keep that for a later patch, if we ever want it at all. :)

>
>> >  use crate::gsp::FbLayout;
>> > +use crate::gsp::GSP_PAGE_SIZE;
>> > =20
>> >  /// Dummy type to group methods related to heap parameters for runnin=
g the GSP firmware.
>> >  pub(crate) struct GspFwHeapParams(());
>> > @@ -159,6 +161,37 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_=
layout: &FbLayout) -> Self {
>> >      // GSP firmware constants
>> >      GSP_FW_WPR_META_MAGIC,
>> >      GSP_FW_WPR_META_REVISION,
>> > +
>> > +    // GSP events
>> > +    NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
>> > +    NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
>> > +    NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
>> > +    NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
>> > +    NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
>> > +    NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
>> > +    NV_VGPU_MSG_EVENT_POST_EVENT,
>> > +    NV_VGPU_MSG_EVENT_RC_TRIGGERED,
>> > +    NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
>> > +
>> > +    // GSP function calls
>> > +    NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
>> > +    NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
>> > +    NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE,
>> > +    NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY,
>> > +    NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
>> > +    NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
>> > +    NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
>> > +    NV_VGPU_MSG_FUNCTION_FREE,
>> > +    NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
>> > +    NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
>> > +    NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU,
>> > +    NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
>> > +    NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
>> > +    NV_VGPU_MSG_FUNCTION_LOG,
>> > +    NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
>> > +    NV_VGPU_MSG_FUNCTION_NOP,
>> > +    NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
>> > +    NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
>> >  };
>> > =20
>> >  #[repr(transparent)]
>> > @@ -197,3 +230,86 @@ fn id8(name: &str) -> u64 {
>> >          })
>> >      }
>> >  }
>> > +
>> > +pub(crate) type MsgqTxHeader =3D bindings::msgqTxHeader;
>>=20
>> This should be wrapped into a newtype that provides the exact set of
>> features required by the gsp module, like what is done for
>> `LibosMemoryRegionInitArgument`. For this type we just need two things:
>> return the `writePtr`, and advance it by a given value. That's all
>> the parent module needs to see.
>
> Except that doesn't actually work, because we need to use DMA access meth=
ods on
> bindings::msgqTxHeader which we can't do from an accessor.

If the accessor uses `read_volatile` and `write_volatile` then I guess
it should work? These are unsafe though, so this is not ideal, but at
least they would be contained into the `fw` module and limited to one
getter and one setter.

>
>> By just aliasing this type, we make all its members visible to the `gsp`
>> module. This increases its dependency on a given firmware version,
>> carries a risk that the GSP module will mess with what it is not
>> supposed to, and introduces inconsistency in how we abstract the
>> firmware types - some are wrapped, others are not. Let's be consistent
>> and make all bindings completely opaque outside of `fw.rs`.
>
> I can't see how accessors in `fw.rs` for every firmware binding we use is=
 useful
> though[1]? In what way does that reduce dependency on a given firmware ve=
rsion?
> I can't see how it isn't just adding boiler plate for every struct field =
we want
> to access.

While the main point of this remains hiding stuff other modules don't
need to see, it also allows us to choose stable method names that are
independent from the firmware.

>
> We already have higher level abstractions (eg. DmaGspMem) to ensure the G=
SP
> won't mess with what it isn't supposed to, and these higher level abstrac=
tions
> also provide more options to reduce dependency on a given firmware versio=
n as
> the logic isn't as tightly coupled to the binding representation. It also=
 allows
> us to access the fields using the proper DMA access methods.

`DmaGspMem` is a special case - it is in shared memory and requires
volatile reads and writes at runtime. And yes it also provides a
higher-level abstraction to access the driver's readable and writable
areas of the ring buffer - I think these are at the right place in
`cmdq.rs`.

But we also have other types that we build on the stack, even if we move
them to a DmaObject afterwards. `fw.rs` should provide constructors and
simple primitives for these, on top of which the command queue logic can
be built. Right now we are initializing their fields in `cmdq` and I
think we can agree this is not very portable.

To clarify further, our sole business with half of the bindings types is
initializing them to some value that makes sense and put it somewhere.
For this we only need a constructor. We don't need to know the names of
their fields, and we don't want to know.

Other bindings types are message-related, and we need to access their
contents. You discuss these in more detail below so let's address them
there.

Then the last kind are the types related to the command queue runtime
operation - namely the Rx/Tx headers and their read/write pointers, and
the message headers that we need to read and write. For the former we
only need to poke at their pointers using volatile accesses, which is
two methods that I propose to have for that purpose. For the latter we
only need to access a handful of fields, some of which can be tricky
(like `length`). In any case, we are talking about a handful of methods
here to keep the abstraction opaque.

More on messages below as you make an interesting point on them.

> [1] - Except for maybe removing some nonRustySnakeyNames
>
>> > +
>> > +// SAFETY: Padding is explicit and will not contain uninitialized dat=
a.
>> > +unsafe impl AsBytes for MsgqTxHeader {}
>> > +
>> > +impl MsgqTxHeader {
>> > +    pub(crate) fn new(msgq_size: u32, rx_hdr_offset: u32) -> Self {
>> > +        Self {
>> > +            version: 0,
>> > +            size: msgq_size,
>> > +            msgSize: GSP_PAGE_SIZE as u32,
>> > +            msgCount: MSGQ_NUM_PAGES,
>> > +            writePtr: 0,
>> > +            flags: 1,
>> > +            rxHdrOff: rx_hdr_offset,
>> > +            entryOff: GSP_PAGE_SIZE as u32,
>> > +        }
>> > +    }
>> > +}
>> > +
>> > +/// RX header for setting up a message queue with the GSP.
>> > +///
>> > +/// # Invariants
>> > +///
>> > +/// [`Self::read_ptr`] is guaranteed to return a value in the range `=
0..NUM_PAGES`.
>> > +pub(crate) type MsgqRxHeader =3D bindings::msgqRxHeader;
>> > +
>> > +// SAFETY: Padding is explicit and will not contain uninitialized dat=
a.
>> > +unsafe impl AsBytes for MsgqRxHeader {}
>> > +
>> > +impl MsgqRxHeader {
>> > +    pub(crate) fn new() -> Self {
>> > +        Default::default()
>> > +    }
>> > +}
>> > +
>> > +pub(crate) type GspRpcHeader =3D bindings::rpc_message_header_v;
>>=20
>> This type too is another good illustration of why we should make our
>> bindings opaque. In `cmdq.rs` we access `GspRpcHeader::length` multiple
>> times, ignoring the fact that it also includes the size of the RPC
>> header itself - not just what comes after it! Since it doesn't come with
>> any documentation, we can be forgiven for assuming the obvious - that it
>> is just the size of what follows, but it is not.
>
> This has nothing to do with the bindings being opaque or not though. I ca=
n
> almost gurantee that after writing ten brain dead accessor functions that=
 the
> eleventh would have looked pretty similar and included the same bug!

It does very much have to do with making the binding opaque. If it is
not opaque, and the original `length` is accessible, what is preventing
code from using it and repeating the same mistake again?

I don't quite get where the "ten brain dead accessor functions" would
come from. I propose we write one, that returns a value that makes sense
(contrary to the original member), and most importantly is documented so
users can know exactly what it does. Tell me what is brain-dead about
that? This very patch misused the `length` member on at least two
different occasions, isn't the benefit clear?

>
>> What we actually want is a method on `GspMsgElement` that returns what
>> we actually want (and is documented as such): the actual size of the
>> payload following the whole header. That way there can be no room for
>> mistake.
>
> The length calculation can just be a method on GspRpcHeader without requi=
ring
> the rest of the fields to need accessor functions as welli though.
>
> Take for example a structure that we will need in future, GspStaticConfig=
Info_t.
> This currently has 53 fields, although to be fair maybe we only care abou=
t half
> of them.
>
> My proposal[2] is to convert them into an abstract nova-core specific typ=
e,
> GspConfigInfo, that contains the specific details Nova users care about.
> Following the implied rule that no field accessors shall leak from fw.rs =
would
> require accessors for all fields. That's at least another 78 lines (assum=
ing a
> minimal 3 line accessor function) of boiler plate for one FW structure. M=
ultiply
> that by many structures and you now have a lot of boiler plate for no rea=
l gain
> and a very large fw.rs (note my example[2] only contains one field, but I=
 expect
> we will need a lot more if not most of them).
>
> [2] - https://github.com/apopple-nvidia/linux/blob/nova-core-unstable/dri=
vers/gpu/nova-core/gsp/commands.rs#L32

I am not opposed to having a nova-core specific type, and in the case of
GspStaticConfigInfo_t is certainly seems to make sense. Actually it even
does what we want here, since with that design this type should not be
visible outside of the `fw` module, right?

Now to be fair, one needs to also consider that this new
GspStaticConfigInfo type will also need its own boilerplate-y code to
initialize itself from the original GspStaticConfigInfo_t, field by
field. But in the end we would have a type that provides us with the
abstraction that we need for the GSP module, while making the bindings
type invisible - this fits the bill, and looks arguably nicer than
having too many accessors so why not!

One can even argue that the wrapping pattern is just a simpler version
of this - we create a new type to hide the bindings' internals and
provide us with the right interface. It is just that for many
commands/messages the payload is so small that it is actually less code
to just wrap it and provide a few utility methods. GspStaticConfigInfo_t
is certainly an exception.

>
>> > +
>> > +// SAFETY: Padding is explicit and will not contain uninitialized dat=
a.
>> > +unsafe impl AsBytes for GspRpcHeader {}
>> > +
>> > +// SAFETY: This struct only contains integer types for which all bit =
patterns
>> > +// are valid.
>> > +unsafe impl FromBytes for GspRpcHeader {}
>> > +
>> > +impl GspRpcHeader {
>> > +    pub(crate) fn new(cmd_size: u32, function: u32) -> Self {
>> > +        Self {
>> > +            // TODO: magic number
>> > +            header_version: 0x03000000,
>> > +            signature: bindings::NV_VGPU_MSG_SIGNATURE_VALID,
>> > +            function,
>> > +            // TODO: overflow check?
>> > +            length: size_of::<Self>() as u32 + cmd_size,
>> > +            rpc_result: 0xffffffff,
>> > +            rpc_result_private: 0xffffffff,
>> > +            ..Default::default()
>> > +        }
>> > +    }
>> > +}
>> > +
>> > +pub(crate) type GspMsgElement =3D bindings::GSP_MSG_QUEUE_ELEMENT;
>>=20
>> Hammering my previous argument a bit more: in `cmdq.rs`, we do the
>> following:
>>=20
>>     let msg_header =3D GspMsgElement::from_bytes(msg_header_slice).unwra=
p();
>>=20
>> Even though we explicitly used `GspMsgElement`, `msg_header` appears as
>> being of type `GSP_MSG_QUEUE_ELEMENT` in LSP. That's super confusing and
>> can be avoided by using the newtype pattern.
>
> That's surprising. I would have hoped the LSP would be more helpful than =
that.
>
>> Lastly, the bindings generated from C headers are supposed to be tempora=
ry, and
>> we eventually want to replace them with direct IDL-to-Rust bindings. Not
>> leaking the C types let us design `fw.rs` as a blueprint for the ideal
>> interface we would want to generate - so the limited extra labor that
>> comes with wrapping these types would also pay off in that respect.
>
> I agree with this - `fw.rs` should be the blueprint for the ideal binding=
s
> that we could conceivably generate directly from IDL. But this is also wh=
y
> I'm pushing back against the idea of putting any kind of logic (in the fo=
rm of
> accessors/constructors) into `fw.rs` - I doubt you will ever be able to g=
enerate
> those from IDL.

`fw.rs` should contain the minimum required to build the logic on top of
it, agreed. Doing so might require having another type on top of the one
defined in `fw` to implement said logic - if you remember I did
something like that for MsgqTxHeader and you thought that was too
convulated. :)

>
> For example I doubt it would be possible to generate the length logic, an=
d I'm
> even more doubtful we could figure out how to generate the constructors b=
ased on
> Rust type.

Where to put the length logic depends on how our firmware interface is
defined. If we agree that `length` is "The size of the RPC header, the
following command, and its payload but oh wait we don't include the rest
of the message element which includes the RPC header so don't forget to
add it" then we can just return or use the member as-is. But it's a bad
and error-prone interface. We can document it, and that in itself would
be an improvement, but it would still require some mental gymnastic to
use and is just a giant footgun.

What is safe and useful is the length of the entire message, header,
command and payload included, because that's how we use it in the code.
It's also trivial to produce, and if we do it here we only do that
operation on one place instead of at each calling site. So yes, it
belongs here, as part of the firmware abstraction, and if we have to
write it by hand then so be it.

The same goes for the constructor. Of course there will be some manual
work needed to include a new incompatible firmware version. But if you
don't do it here, you will have to do that work somewhere else anyway -
probably `gsp` or `cmdq`, except without the elegance of a method
containing that code. How is that better?

>
> So to summarise where I think we're at we have two proposals for how to
> treat/use the generated bindings:
>
> 1) Make them all a newtype[3] using a transparent wrapper to make the fie=
lds
> opaque and accessor functions to implement the logic. This would all be i=
n fw.rs
> to stop the C types leaking out.
>
> 2) Build a completely new type based on the underlying bindings plus what=
ever
> other logic is needed. The C types could be used within the `gsp` module =
to
> implement the new types but would not leak further than that.
>
> Using GspStaticConfigInfo_t as a concrete example I think option (1) look=
s like
> this:
>
> In fw.rs:
>
> #[repr(transparent)]
> pub(crate) struct GspStaticConfigInfo(bindings::GspStaticConfigInfo_t);
>
> impl GspStaticConfigInfo {
>     pub(crate) fn new(gsp: &mut Gsp) -> Result<Self> {
>         // Create GspStaticConfigInfo sending whatever messages needed to=
 the Gsp.
>     }
>    =20
>     pub(crate) fn gpu_name(self) -> String {
>         ...
>     }   =20
>
>     pub(crate) fn sriov_max_gfid(self) -> u32 {
>         self.0.sriovMaxGfid
>     }
>
>     pub(crate) fn fb_length(self) -> u64 {
>        self.0.fb_length
>     }
>
>     pub(crate) fn ats_supported(self> -> bool {
>         self.0.bAtsSupported !=3D 0
>     }
>
>     // More for every field we need
>     ...
> }
>
> And Option (2) could look more like this:
>
> In commands.rs:
>
> pub(crate) struct GspStaticConfigInfo {
>     pub gpu_name: String,
>     pub sriov_max_gfid: u32,
>     pub fb_length: u64,
>     pub ats_supported: bool,
> }
>
> impl GspStaticConfigInfo {
>     pub(crate) fn new(gsp: &mut Gsp) -> Result<Self> {
>         // Create GspStaticConfigInfo sending whatever messages needed to=
 the Gsp.
>     }
> }

To make a fair comparison your Option (2) should include this:

impl TryFrom<GspStaticConfigInfo_t> for GspStaticConfigInfo {
  type Error =3D kernel::Error;

  fn try_from(value: GspStaticConfigInfo_t) -> Result<Self, Self::Error>
  {
    let gpu_name =3D // extract gpu string from `value`.
    ...

    Ok(Self {
      gpu_name,
      sriov_max_fgid: value.sriovMaxGid,
      fb_length: value.fb_length,
      ats_supported: value.bAtsSupported !=3D 0,
      // More for every field we need
    })
  }
}

Because you are not only going to create this type from the `Gsp`, but
also from a message you have received as per the code.

>
> Peronally I favour option (2) because it is more concise and allows us to
> split the code up more. It is also more resilient to FW changes as it doe=
sn't
> depend on the underlying representation at all. However based on your fee=
dback
> I think you favour option (1) more so I want to make sure I'm understandi=
ng
> it correctly.

My constraints are that I want the binding types to be opaque and
abstracted in a way that is portable and makes sense for the higher
levels. If Option (2) satisfies these constraints (and in the case of
GspStaticConfigInfo_t I believe it does), then I'm fine with it where is
makes sense, and for large types with many fields I think we can make
the case that it does.

I also think this really only applies to messages received from the GSP,
as commands NEED to be laid out in-place in the format that the firmware
expects, so there is little room for using a temporary type where we can
have an in-place constructor that is just as convenient and will use
less stack space. Still, in theory we could also use that technique for
e.g. very complex commands that would benefit from the constructor
pattern.

But for messages from the GSP, why not. There is an additional cost to
consider related to the conversion from one type to the other, and that
will require extra complexity like an associated type in the
MessageFromGsp trait, so for very simple messages a wrapper might be a
better fit, but otherwise, I think it's fair game.
