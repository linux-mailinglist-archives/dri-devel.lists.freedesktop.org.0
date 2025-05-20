Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76318ABE25D
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 20:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7A110E553;
	Tue, 20 May 2025 18:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CBF/Nt8L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9246C10E553;
 Tue, 20 May 2025 18:13:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPdveHJN2JcOj0evtuOgs7mfPyPOsLzm/lNosnDB803SmPyTzA0R3gOA03n5vLSoggxdmE848meiv3R2dSPNNcZftozhx5jRCbePO5hNArqyWjBxOBKdTvKTuGqOuyQdBkjbNOu9ZpJ4W5NEnrUcv9nAv/G7OD9N+niQYt4W7OzDcLKz/LEnZLYSiMEW1E4rR40CBzjBMEBGdv+YxkqF2aa/c0UvRWlr5u3Gei437IvT2w1+I9RGU8KipOZiorF4sZfbRw7lBoNtvZixLpuHn3aOFjB2FChuKMyXTkoHmycq+rOxTX3PpLeG9iB6E/U4kp40EPu4LhcKmBfm5qXMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IFpPAV1Lq3ieazxYxnIVsAYEu/iZNsbKNXbLqezNM4=;
 b=Z0O/a2Sz1qN0OH6muauVJ1CJ51tVYMOLUFx0YIj5CjPSGlqqiNob/HI4bTJ21QFx3SLFBtJuTM6aCkSGKH4jXtCQ2LzGWH7QhdHGTLYHcWp0ouDoIAQI4H0HXUDk0aMt4uLt62UvGLioJKaWAvwzCh4YfXkiQH2PBIdVXlP/JHyIc7v2NirNaUVYDPLyA5sKKveMUFyeKmIymtjPfRc7HTAI4HvGJ8El1dDAScjq3eIC1gbWFWr3X/XjBLu9KWSNrr7wYh3/bIttU9ihV6+N0WSUzeGB/cpySIB8PC+Hs04CSILPtuqC0tnHNvPkRYvWkMSfezZef/dHfXnwqYbCYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IFpPAV1Lq3ieazxYxnIVsAYEu/iZNsbKNXbLqezNM4=;
 b=CBF/Nt8LkDMAIyowe6D7xrHpLJ9Fjags8lqei+5MVi05EpXDUJaEgBvJqRzaOX+Sp5T0JKWeKL3Cx4QyDaIy1iZonj3ocIdbyxPBOUzW1+QTuLY2kQ4FcufcrfQ50CO8xe/G6oVpyXsWGd8wP6M468J/hAJ0x/HMD2Sqj+MGb7GUlgh3KIEEOQgK2RWTXSfNLlrONL/4iLvDFeO9WEFRn/hzjYgdpMFqe758CnxW2Vb9dd9gLd67sIDq5hNYlLlgtZJkSktREjSzB0iIBnSF30NawQCYHuYWDAVZXtAl9jgMZr9VOolL0ORfCF4+tvcdI+5j2cT80rb0oi6DHQ4Rwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9139.namprd12.prod.outlook.com (2603:10b6:a03:564::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 18:13:07 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 18:13:07 +0000
Message-ID: <dcd249d6-7e99-476e-b216-8ca9e1a936e5@nvidia.com>
Date: Tue, 20 May 2025 14:13:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com> <aCN_PIYEEzs73AqT@pollux>
 <4fee85be-a8c5-4a99-8397-c93e79d72d15@nvidia.com>
 <aCxLyxcERNHKzfvI@cassiopeiae>
 <3cfb7a8c-467e-44d0-9874-361f719748b8@nvidia.com>
 <aCyZPUaPSks_DhTn@cassiopeiae>
 <bdb290d4-b369-4b8e-b78d-8c8d3cc07057@nvidia.com>
 <aCyhkiBTXV86P_GF@cassiopeiae>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aCyhkiBTXV86P_GF@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0166.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::21) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9139:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a40b91c-5762-4240-11f5-08dd97c9f845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmVtZmdHVzR4Q1BMMW1vK1BTc3dZVkd0SGg3Smdyc3VUQmVYYnRveWtGVVR6?=
 =?utf-8?B?dVhYbDNIWmo0SkpqcjZmUkxjV3Q5RXUySGhneDBJdWt3Vnpzd0VMR3cxcStC?=
 =?utf-8?B?RmU1cE8zTkNJNWY3WThFbjZuZC9YbXpIekdwY3dCdjFSQ0NMaW5BcG9kMXBR?=
 =?utf-8?B?OWhDQkkxdE04RGZIbEl0aTFkRDBSMVh4b3VyUi9QMXZrb0d3UUFpS29sUHhO?=
 =?utf-8?B?TWorQzh0R0U2dm4yUUdHa2wxRHJnMElkdFF3N1JsUGFWbHYvZUFIb0FROWVN?=
 =?utf-8?B?NXVDMktBalpGQkRPalI5YUl5QS9HT2VHcFBJWmhmckRodTVDcUNiNFM1VStQ?=
 =?utf-8?B?aWFYdmh6NjJCSy9VT04xMVpSakR0M1BBU09yZ2RaWDJJb0l5SEJxanlDWW5B?=
 =?utf-8?B?YmxHWkZBNWNWTmxTcjdGSUhSaE56MVN1T1RlWHRLS2pJUU9RclBmd3daRkpF?=
 =?utf-8?B?L2hwazFKU3gzbWUrOFl5T0RmZWZlcVJORGhrU2EvaldFSTNYOVhQTWVqc3E0?=
 =?utf-8?B?TzJBOTZ3ZnVQSTZVTFN6ZHNhQWpxZ2hOSld0RjlJUjdNb2NvUWJDOTRsWFdD?=
 =?utf-8?B?VUJTR2hDRTgxS1N5M2JuaWlYQWJoSUpsSVNtWm1rbmJzZHIwVFBFUC9LeXhB?=
 =?utf-8?B?VDJySGIrUmJPb0Rua0diVVVEdFlNcGd4bXVEN1V6eE5qY3g2NmZXZUQrbjEw?=
 =?utf-8?B?TWdBZGgydDZycjlVN0xHblhNeGZ6ZitwbmFVUXAvU2RuS0gwNk1FS29XdkZa?=
 =?utf-8?B?SXltWnM2WVNuMTFWK213L0NWY21Sc0FEYzdmM0VZcThmQnhsZUo0L2RGcndz?=
 =?utf-8?B?T0VXR0NJQUNWMFNYTVBqM2g4OWFRUk1jbVhDeXVNVHlHWUlLVUFhdFZFMC9K?=
 =?utf-8?B?N01jVWMvTzNYTnhvWmhGTGN3U01HMGd2ZktYeExVOEpKa281c0pjdG1tL0Q0?=
 =?utf-8?B?ai91Z0I4dm9FTFJjd1NKZGtiTjQzNEVWblBXeUk4Q3VhSGVmdUtieDNxT3Vz?=
 =?utf-8?B?Q21xdlJsc0w5ODVZVE1IQWV0QVBvWXpFZVZUM3pzaTlhdGxUTzNUNSttcWtF?=
 =?utf-8?B?bkpZWFdoZjVWbnRkZDczcmZUQVFXZElpTHJKMmhGYkdRNm9CcWVBci8xKzV4?=
 =?utf-8?B?Vml1djYweXV4WENrYkxuMVdFbkZ0R0k1aCtNbHZ3c3VTejdNNlB5dHJmMkdU?=
 =?utf-8?B?djgvU3BJMCtxZDZhQUFuL2x6OHlYTjlWUnBSbDVkOFpOME5Qa0FSb3MwL1JR?=
 =?utf-8?B?L1U0dXpGUlhYMEl0Vjg4eG5lWitrT0p1dFpGRmU5Vzl3em1BM0RmZGwxK3VX?=
 =?utf-8?B?NnpOZzNKWkVnMmtmYXQwcVUxbTQxVzBhSmxReVZ1c1p0TStXYjZzaktmSEpW?=
 =?utf-8?B?NElJbVFHcW1CZ2UwRXlSVC8wZFQ4SkRUdWJ2eUF0enlHaGxYWlY1M0FVdSsy?=
 =?utf-8?B?UHo3VjRiMldESkx2TXdlZTRqTTNZaDZmb2NkY1p2Y1pFUEVrNkNEZWNITmNt?=
 =?utf-8?B?eS9VbS90OStvNkV4b1lWZzlyd3FlU0UzYXhOZkNDcWdoSEgyVk9CTW9GSWc3?=
 =?utf-8?B?ZHdxTDBhdFFIL3p5V1lpWmZQMnNKY2dlWGN0b2hkYXBrS284cjFUZnBPWEZk?=
 =?utf-8?B?djhTMmtGVzZsazh2VFVkNEttb2Rrc0I1R1l0VUQvZ2VqR3M1a0w4Y2o5cXV6?=
 =?utf-8?B?YXk4UWZkOTdMOWU4TitIa0pXVURjMGZ6dnpqT1J5UjhKMjVxY3hVbCtWMm5l?=
 =?utf-8?B?WjFNclFRbFZoUHVKbFJpUE9nNTd4WGxpeVNROVdKbXZFUEJIOTM3V0VRU0w0?=
 =?utf-8?B?VDhPQ3VkNUhpYlplM2ZYTE5Xb1YxSGl0dDN6bjU4bURnQlE5Z0xVSmhkYXdx?=
 =?utf-8?B?MzliM3NGVm5RSE9lK1l3K2pWVmY0cVNQQXFLV1FvajFodHBFL2JUK3ovZlB2?=
 =?utf-8?Q?nK/tkLybYwc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEtxb1ZPSFZieVpmbW5oSEc2dWFES1R4MzF1UFJDK3g2ekhocU5WeWttTDFJ?=
 =?utf-8?B?MlgvaVRmdXdPS1JyT085S1VGQ253Y0JyVHdYM0JyRTJMRytncXM3M3R6d3BB?=
 =?utf-8?B?cFNZMmhZRXd5anNUU291VHhyNWJJR3NVZWVXUTlURzRHYTVyT2V2cE8wS3di?=
 =?utf-8?B?dFBvT3FHdFRVSVhmQm9pVEhlVE9HVHdKc3NlQStIREwrL1lRWFp0V1VBK3VI?=
 =?utf-8?B?NHpjb0NrMHNNMGJFN1V6aXNPejg4T0drdjBjZHhBMmNOWm5abGgxRUVhWllQ?=
 =?utf-8?B?Z25YSldXaXljZjZIaFlJSE8vYUZzaU5uR1JPSzNibUxHSjhETCtvY0FmdUhq?=
 =?utf-8?B?REh2aWxNMzYydkFESXRDNWNLUlM0SEJqaEZ1NlBWR1NtcFVYbXFCeCtSWnhK?=
 =?utf-8?B?UjJZaGJqeVRpQjZ0TEZwMjJVR0Q1aUZ6RE1oN3RxN0FlQ2VoMmNjaU1sQVQ1?=
 =?utf-8?B?U0s3U2xXbTQ0NG90UXl0RjNqYlFhN2hNSEQ2amgzd2FkQlB0SER5R0Zsd3h1?=
 =?utf-8?B?cytVKzJ4V2RySFdmdHRmaC9BdlJBOWpSYlJoajlzMDRRUHBLdjJmcmpuZzlY?=
 =?utf-8?B?aHAxbVNwNnlvOS9qZzFrQVV1S0d4eFRkQnA5Qk56bW5YOEUyZDhQb28yTWxj?=
 =?utf-8?B?VTZNUytnK3YxZG9KczRCdXZKNWUxc3ZBKzhpLzBLMnZ4S3hMVTNmeW5VOCta?=
 =?utf-8?B?bGMwZjlEM0pmWW5qVXVmRjNya3hVUXlvL3dJQlR5SVVIT21ZZ3lOdzRLY3BJ?=
 =?utf-8?B?VzlDZU04d3FJQ1h5OUd4UXhUWENYTFVJcVg2R0JzdGdHcTdDa3lNVytReEdY?=
 =?utf-8?B?SVdnVE9PUFdnd1ZMNFkvVkJrN3E5VVFsb1Q4YXA0clNscWgwT0VHbXlSc00w?=
 =?utf-8?B?Yy84TlNmR3p2enU1N0Y4bDFIbkpPeGI4dTNBbW91MkVXRXpTTUVFNkRXNVNE?=
 =?utf-8?B?MW9ZT1hyMVNkRVN4RnNDVlRKc1EwWWx1WFdHb3djVTZEL1ErSC9wRDVnUGpP?=
 =?utf-8?B?WjcwT1dUbU9NMlBsU1pQOXZNR3dEZXozRENtWWNEcng3V2o2OVN0UEtIYlJm?=
 =?utf-8?B?RzMwVk9MVEx5Q280anlFMnMvbm1YbzFYaUxVLzFkTncxN1JWNGJJY1FpaTIy?=
 =?utf-8?B?VS9UK0syUStmM1BGVVdNRERKTGdrWlBkR1d3MHc4VUJINEEzdnhXcWVaam4v?=
 =?utf-8?B?Q2NYMjdNNEdsVVdQaUxOeXhGTitiUStndXNGdUxNUVZpeDFxSXZsQkhxNkNa?=
 =?utf-8?B?VFBrekw0SDRtWkNMV3RkUlFpZ2piMUYzeDAxZEloQW9paW0xVXl3ek0yOXU1?=
 =?utf-8?B?dVNTMmZkeXQwWTFTTUJHcVkzdkZWRm1jZVdSOXhHKzVJNE4zWkhoMUhNM3ZL?=
 =?utf-8?B?aVd4TjVSNHdBNFNWMEsycm9tUlBKa296K2s0UENleTBheCt4c2VqWVByaUho?=
 =?utf-8?B?WnUyMkp6QWtqd3BHL2NvcmxWRm1UbVYzZGl2M05SV0dEQmphSk5PL3JMdmwv?=
 =?utf-8?B?MzlSNEYzamJoUks3TGdORC9abTZiYWlhbm5lekd4cWtBL080eTVsa1A4ZnRM?=
 =?utf-8?B?aVplWTREQnNmcE9FOHhITTFEZVpEK2plai9TYk91MUEzTGRlOEZTUkcxcm9U?=
 =?utf-8?B?UnRDVVFSQ3Y1bS9GZkd0QWNYRE1scERLdnVnL1BoeWV5dzBKWXJVRnBubmd4?=
 =?utf-8?B?bCtCVktHb2syZS9mM1EwZUtlc2tkOG9Zd1RNVEhEZ3dvTFpYMXhYVFZHbS81?=
 =?utf-8?B?aFVQbnUwZUJZM0Z1RkJrZktxVXdTTUM1NUx1cHQrNi9IY0pBdThIcFBkcjhx?=
 =?utf-8?B?c2wyNzJDcTdsZkYxZHBweVY4d2Jyb3FMNGx5aXJuQmlxbkY2RlFFYkJ4QVNB?=
 =?utf-8?B?UHQ4U0Y4U05kdC9ocDZWbzdOUHdoWWQzTjhLYjlTK2FRK1JVemZQdFBqOW1u?=
 =?utf-8?B?RUJBK2MrazllRjliVWdNZ0VyMFRCbEIvVG9ubXpCaGNRRWg4VUs0RTVKakdS?=
 =?utf-8?B?TnIzZnAvd0tZWnZNdFRCSkUrcDZSQlF4ajlPeHdCaW1ia01McU1DdlQ5YmJt?=
 =?utf-8?B?RDdXNXNoN0RXdnNia0k1NTRpWCtscGtLVDB5QWZleVVKOS9vR0M1eTZKTzhz?=
 =?utf-8?Q?sWG8cG0PUiMLa1AbuId6oKaxa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a40b91c-5762-4240-11f5-08dd97c9f845
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 18:13:06.7915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6En+HW251+bSTgCZNTYOgF6VJ/yjkXWsL9Oix6nJ9ej/DcMsTanYeoN/uBh3znUQFeDFXjRiP++vMC3cdxSBcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9139
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



On 5/20/2025 11:36 AM, Danilo Krummrich wrote:
>>> If you want a helper type with Options while parsing that's totally fine, but
>>> the final result can clearly be without Options. For instance:
>>>
>>> 	struct Data {
>>> 	   image: KVec<u8>,
>>> 	}
>>>
>>> 	impl Data {
>>> 	   fn new() -> Result<Self> {
>>> 	      let parser = DataParser::new();
>>>
>>> 	      Self { image: parser.parse()? }
>>> 	   }
>>>
>>> 	   fn load_image(&self) {
>>> 	      ...
>>> 	   }
>>> 	}
>>>
>>> 	struct DataParser {
>>> 	   // Only some images have a checksum.
>>> 	   checksum: Option<u64>,
>>> 	   // Some images have an extra offset.
>>> 	   offset: Option<u64>,
>>> 	   // Some images need to be patched.
>>> 	   patch: Option<KVec<u8>>,
>>> 	   image: KVec<u8>,
>>> 	}
>>>
>>> 	impl DataParser {
>>> 	   fn new() -> Self {
>>> 	      Self {
>>> 	         checksum: None,
>>> 	         offset: None,
>>> 	         patch: None,
>>> 	         bytes: KVec::new(),
>>> 	      }
>>> 	   }
>>>
>>> 	   fn parse(self) -> Result<KVec<u8>> {
>>> 	      // Fetch all the required data.
>>> 	      self.fetch_checksum()?;
>>> 	      self.fetch_offset()?;
>>> 	      self.fetch_patch()?;
>>> 	      self.fetch_byes()?;
>>>
>>> 	      // Doesn't do anything if `checksum == None`.
>>> 	      self.validate_checksum()?;
>>>
>>> 	      // Doesn't do anything if `offset == None`.
>>> 	      self.apply_offset()?;
>>>
>>> 	      // Doesn't do anything if `patch == None`.
>>> 	      self.apply_patch()?;
>>>
>>> 	      // Return the final image.
>>> 	      self.image
>>> 	   }
>>> 	}
>>>
>>> I think the pattern here is the same, but in this example you keep working with
>>> the DataParser, instead of a new instance of Data.
>> I think this would be a fundamental rewrite of the patch. I am Ok with looking
>> into it as a future item, but right now I am not sure if it justifies not using
>> Option for these few. There's a lot of immediate work we have to do for boot,
>> lets please not block the patch on just this if that's Ok with you. If you want,
>> I could add a TODO here.
>
> Honestly, I don't think it'd be too bad to fix this up. It's "just" a bit of
> juggling fields and moving code around. The actual code should not change much.
> 
> Having Option<T> where the corresponding value T isn't actually optional is
> extremely confusing and makes it hard for everyone, but especially new
> contributors, to understand the code and can easily trick people into taking
> wrong assumptions.
> 
> Making the code reasonably accessible for (new) contributors is one of the
> objectives of nova and one of the learnings from nouveau.


I implemented the Data parsing pattern like the following, the final
FwSecBiosImage will not have optional fields as you suggested. It does get rid
of 2 additional fields as well which are not needed after vbios parsing completes.

https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?h=nova/vbios&id=8cc852fe5573890596a91a2a935b3af24dcb9f04

Hope that looks Ok now! I am open to naming FwSecBiosPartial as FwSecBiosData if
that's better.

The full file after the change:
https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/tree/drivers/gpu/nova-core/vbios.rs?h=nova/vbios&id=8cc852fe5573890596a91a2a935b3af24dcb9f04

thanks,

 - Joel


