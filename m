Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73E2AB7DF7
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 08:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F355F10E761;
	Thu, 15 May 2025 06:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mzG1Uzep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CC110E762;
 Thu, 15 May 2025 06:26:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIaKH9uK0Y7yo+3G4MEMtXVjc1zcYx5q8U7BisQocItcdY2X2C495HLHWdPzjF7tEiwzbk5bK0f6YPxKwMgZ7yOmsVAoHbAW12oSwdbGaczHihA6JaX7MoKwdkQYbf4ZLns/lRk2cpofSdIscMXSUCTnw1X8yo2r64icUO1cvVPZyqRlN9pANhdOvn5Q1pMXd5MzNvAG2Og8PoxsLo00K8uS1ZigoUHV0oMoqx5n4aw2oLeV7/aDZ4IK7FkVHkc1DreJmssPW/YRLrClWGrheqXFWQr+Au+GQ8vfr9/rUNey/ly/qK2in0ImvYiUeDsiBgPJvlL4l0eJ3BIu4+31ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnQqMLdgkjb8IzoAHEf74bHj1cW9xFZSkGr0EPkGUPw=;
 b=vWrHG+fDUlTjWrPDDTXrJNRGDI7KXe9bbBOZZ23tx14nExfskohJpUr8pj6Fy8CPpIvNi4qKlix3vFl4Tlz+gqbNsEa4iPijZt9ioZPixrVlOTGJnk/nnt4tX2lLcczJpvNaucM+Beu8tZKoIaIXZrvMFKHa69K4iXxWBh7FtftzpPuUlQwXdM9rTRYwD5jd9tUdJrX52ScLQkUx7Nh1Pd7MBxxQbCJzk19ZY2ICgG7Uu/6IFOphh1DmrikNk5b0OGFdcbmig3Px5l0bTFPW2rkcdSGVSoXawPNr0sl80S4t9OEO+axpZgK5/z6EyNtB57QTe0QGPst9j2m/zaKe2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnQqMLdgkjb8IzoAHEf74bHj1cW9xFZSkGr0EPkGUPw=;
 b=mzG1UzepggPpDxUKgNaX87nFxXMbEbt94gEZzgNTmfnP9TLzCTPezz5mu/0D5/oq3gBmb4p+G/xwfApUJV/3v9qUO8tKm+r07L+9XNByr+F8UVGFjxNAEdkXcv3E7SKILX5t5QuK3EUhWQU19G2foBYuFqZ4Ek6aoC77dKj2HmbrZNHdyN5dO+xKe45/o/qLhm6ZlxJ+TQ6mVSjcEnzhfQ7ZisoluV8pn9Rax1mdAZdLbfNakGdsj7drP7O09w0EoMLzp7hnMRI1Z7a4ALV7p+6CZUCsRHYtQ1m3W16uhuP5QYeWveWs+n5T6IA79WEG6s+6luuaZFXrMvMa8FEzww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8709.namprd12.prod.outlook.com (2603:10b6:610:17c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 06:26:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 06:26:28 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 15 May 2025 15:26:15 +0900
Subject: [PATCH 3/3] gpu: drm: nova: select AUXILIARY_BUS instead of
 depending on it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-aux_bus-v1-3-1781b54424e4@nvidia.com>
References: <20250515-aux_bus-v1-0-1781b54424e4@nvidia.com>
In-Reply-To: <20250515-aux_bus-v1-0-1781b54424e4@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0277.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: c031c44f-04b4-4e76-212f-08dd93796c9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnJXdVV0QXpNWVJsS2dIM3BhZXp5OUdMQW5RTDY4Tm9Oc01JTk9BcCs3Vld1?=
 =?utf-8?B?dGRLWE1DVS96QnlXQ1NzZ0xXMGRkTkVPZDBSVFRYOFFycVdHVzBUYUR3Tm1Y?=
 =?utf-8?B?RGR2eVg1Zi9VQVMrbjlzSGhTNzRDbHIxMHFLbXJRdjFjcFcrcVJCMXZScHlo?=
 =?utf-8?B?eXJkZ25YR0VrUHp6cmdoYjFCUGRPZTU4SG1jT0kwK1lCUWwrZ1pLRDhyam41?=
 =?utf-8?B?Y3lYK0tvSzduN0pXV0dmRk5SN2RqYUJpbWtsUmVTbjJFYzIvSnZrTk9yeS9i?=
 =?utf-8?B?Z0E1eTYyc0JkRmxYRGpSSENIdzBEK01oOVFDRFhnOGdWVTFBQ2h1MVhmc1Fv?=
 =?utf-8?B?cGROVkdMc2w2SEsvVVVoVkR6QlIrZ1JZRTlpc3dNOUxCZlFVZHN4aDJuanlp?=
 =?utf-8?B?Ymh6L1Y5NDlzZlFwUEN1dVdwWGtpQlQvTVQ1VGR6UzZ0TjZjY3p2dEFDWjdo?=
 =?utf-8?B?THJYcW1qUUFVUjdLNVJLbVVvSGRxQlZITGpjaGdPVG9vaDNKZlc1b0xHUlFn?=
 =?utf-8?B?QkhWWDlwdjFCTlFIelZVNENYeFg0emFuT055MllSNEZTVDdQZTk5c2ZkZU1E?=
 =?utf-8?B?R3BOZHZRVGkvOWk1ZTE2UW1tVGxlVU9wYm9rbWM2MW4yNVI1K1IzdVNiY0NX?=
 =?utf-8?B?WmpocE9KdUs3K285bS96UldRbWdzTFc0Y1dZbkJBSk1hQVg5OVhSSG9ON0M0?=
 =?utf-8?B?Q2xKWkVRVVhPckFTbytSRFY3cE1mUnBBSFFMOEg2TlJwY2p3RUtQcFNWeU5X?=
 =?utf-8?B?d2dvaWdvWHRjM3ZUQ0ZLUVl6SjN4MFNaR2dNZVdDSUNzUXFEOG5Ld1NBazlp?=
 =?utf-8?B?bytFcVZSdFJhcTFsUXUyL3FLWGRURmNnVE1tYUxFeEg0MExLeThxMFR0RXdV?=
 =?utf-8?B?VVNlVmpJcHREeVpzTndibWJsK3AyaVdTb1lHTkNPWmxwNWhaandXajhZSVlF?=
 =?utf-8?B?eXZ1MHNLYW5JdmEzNk9TY0xyMjdJa0htNnF5WU4vd2NYTUI0SVh2cjU4aitE?=
 =?utf-8?B?aG12N2NrRDgxVjVMU3JvSmVCVlpWZk1PcGFOWTErcnhUYXM5UG9GRXRkc2R4?=
 =?utf-8?B?Sk9RNFN5NjhEWlRtSmFmZlI5QTdJQy8xeFNnMEIxYlp2eC9CUXVGWXhiTE9M?=
 =?utf-8?B?Vi9JT1A0elZkRndnSDFDQnY3NC9lZXh5eHV1c29RZ0FXdUFiazBMalJtSDgv?=
 =?utf-8?B?cG8yaVU5blZVQ2V0eGxHcWt6MGRKQjJpUUVSUjlNRFBMMklqamJYY0h3WGZR?=
 =?utf-8?B?N1ZTQlA2Tno3bnEwcG1WcTRpZnNTR1VXbnBtNWlZVnRzYXZKZ1JpYmRoWFdN?=
 =?utf-8?B?WnJpaHQvUVhPaXhXU0tQY25aUEVXU1NISm05SUFWa3dKSW5xZVJMa0NGM3Ez?=
 =?utf-8?B?KzFXby9uYkQvYkkwZElkc3dDRzcyZ0ZiVGlWVnkweWJCTVJXalZpV0ROaGw2?=
 =?utf-8?B?Y0hmcDZIYmRKZGRrL3EraWJ4cXZUZTVWSzRPbnhwb3NKQk1lR2oxRzA1M0xJ?=
 =?utf-8?B?SnladElYR29sbEZCUmFIeEg3UGF3NnRlY1NwV1VBb0FITnpydXZYalBGa1VR?=
 =?utf-8?B?aDdNc3hLNzdYQXA4a0lFUFNXYVFMTGlzMEVONjJNd0VoMndkcGVwTlBFeVRS?=
 =?utf-8?B?S2lLQ2tpanlEVUcvUHNtcndJemJaT2tVanF4N1k3RDV2UWZNY0FzaW1uRVNO?=
 =?utf-8?B?L2QrUC91amdGdEZGZ2U0Rk0zZnpUL20xTldsc1BzZ2E3VG10bzJ5cVlEY1Jz?=
 =?utf-8?B?WEtYTVF6QzhyZVowaXNtVllydlZQeWNZR2RhM2t0OEE0aDVVSFhDM1BVT3Mv?=
 =?utf-8?B?VDJHeXBTL0pvM1AwODVWOTlTN0hlZTJOQU1jYlFaQ3gvck9wZHFQcjU4V1ll?=
 =?utf-8?B?YlA1UTBGdUk3Q0F0bnJpaHc0MDV6azE2eGpsSFZYUjBDMVEzL2JkYUhmSGdp?=
 =?utf-8?B?cW4wV3R2UU9JQjNDRU9ZV21FR0FFVWhzUWh4b2RieDVLYmM4a2szdFQxeHM1?=
 =?utf-8?B?UUgxdThlb3hRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?empRQTlvS0NRTU44VG04RTBiRHI0RCt5SlVaM2MvOEh5VlA1T2RLWHhwNG1C?=
 =?utf-8?B?b0dZZ0NpSDJKL1ltTmxxWEx1aU8yeGlQamJ1UG9OVWxKVDVpTkJUQWo3bUpy?=
 =?utf-8?B?VmtpU052K0J3c0Z0UlF0MlhQWjRSSDBpellaQWhvYmZjc1FPdkcwTEN0ekdH?=
 =?utf-8?B?V1pNdGFFNnM4WmlLcTdBeVJYaHJzQTJxTUorOVRYVjZ1UFozdzhpVmdVNlNz?=
 =?utf-8?B?WGJIaDM5c3Z2bUNBckJUbkZOUW9vUVJLUVZuQUkxZ1hjeVVGZ0wzYU5JWXZs?=
 =?utf-8?B?M2w0c3cwdkVlSVp4QzNLSmQ0WjZveUVQT1RVUE0rL3JBejRPNzVON0p1ZzFX?=
 =?utf-8?B?YjNvcnZLN3VTMGxuZit2OTIxcUw0cFFuaEFOOVV1OEw3Yk1Cb0JnSVVOcDlG?=
 =?utf-8?B?Rmx4Z1N4RjM4bUpwek5pbm1xVEVpVEtndk0zcFZuN3VQNmtSM3I5eFY5ZEZa?=
 =?utf-8?B?K0VVQUpsajdrRHVBdEw4UEtHZXE1QnJ4SjcxeXJTaUlYalFpRCs0czZmYVd6?=
 =?utf-8?B?M1hnTm0wdXFmYTdGNWZ1RjllUGZqQlpIb3R1VDY2KzNQSGNQRnJPUE9yMjN4?=
 =?utf-8?B?YWd3Q0hiVG1Hb0VGZGN2ZFBnRDN3bFJWcGRObkx0SmtTT01BNHc1RldnaHh4?=
 =?utf-8?B?NnFNQ0ZCaXFuakw3TXNIL0xsNFRNcUVqZmJJbm5GbUIyZ0JWQzRwNjBKak1l?=
 =?utf-8?B?UGh2VU5GRUM3UE1qdTErUVZrN29aRmpVaWQ0ckFnNzBzb2Z6ZlE2aHRTVWN4?=
 =?utf-8?B?dktnaXRJV2xicTRkd2krdFNWejhXMkFkM2hVUTdCOUZsRnlNZUlTQ0E2TUdE?=
 =?utf-8?B?YWdIYUYzOW10UEcvMUphZVZkMHVrZ3N1QUdCbVRNbTZvQWJ4cnJnYllTSCtn?=
 =?utf-8?B?Z2FFMnVxa2hDb1RuM3JPTVRpU1V6OVBpRXczbGZLL1IvbWpoZkdLNzAzQmV5?=
 =?utf-8?B?WkVkVk80NjAzVUNYTFhPMjFMd0xoRmVOdW9MRjg2UzFIWERyVVAxdDVPb0VV?=
 =?utf-8?B?YUNQY1QxZEpxWnUvUFdlWjhjcmN1NmpCWGc4TXhzLzc3SGRRRzN5L2ZaMTk5?=
 =?utf-8?B?TUlWdGpNOENaZzBCd1NSR1U3cUprV0gyOG5MblZkY0ZvZWdXdDVvTHczMkJC?=
 =?utf-8?B?SVFBWmRWQXltWUk4NkJ6ejYzMjEzYit0MHBaUXJUL213ckhRNk9xQUVKUXl4?=
 =?utf-8?B?OFhRbHlJbTRsRnBRbFQ4K25hY0FwS0ovd3luZTQyY3U4dlkwL0ZpeWUwaGVG?=
 =?utf-8?B?SzQwT25KazhsNERWSUNSOWJrMFUxQmFrQ3h6NmtYQ3Y5MWVMYW8wcm16aE9K?=
 =?utf-8?B?d0JPV2FRbjMrSU5Wa09VVFBQdGgwSWs2eWxucDcrUE9xQjMyZnJ1YjBWaElW?=
 =?utf-8?B?L1VNdXMwa2Q0V1RWOHc3U0l4alNmSzNiU0pqM01MRmdPVG11S0NIYXFSUVBP?=
 =?utf-8?B?TG9EL1Vtc2dmZFQ1WDY0aTFCYzdFLzY1WEQ1Tm1KME5vbzZRRmgwWDd6ZWNN?=
 =?utf-8?B?dXBVWnhSd3BMN3liZGVpOXpkbTlKVjJWakpjZkZsbFZJUFc1ckNnOHFRVWcy?=
 =?utf-8?B?R0J5N1RKUVpQcGxwUlJXNi9hL0RzUU9qL3UvbE15aFFnWmZBbU1DYXkyM2Jr?=
 =?utf-8?B?WTRoUFJxdWQ1dC80SlZESTdBOSs4K0oxZENkbkJONWwzTmpyUjVMUytjazVC?=
 =?utf-8?B?aG95KzNMZmpuUFZnVjZhOHlUK2hNR1FqZ01tOGtSVzFWdnpkeFJkbHNLUlR6?=
 =?utf-8?B?TldwYzZoenZIMlpScjQ0ZE9OL0c4Sy9ucTNlOWJKdEVqeHF0SDA1OUUxRW1W?=
 =?utf-8?B?cTdOaTRzWGdvWkhoeWg2TVhzVEVBdlNOSDlubkp2UlBuK0FZdUN0WnVtZFZR?=
 =?utf-8?B?WitMT2Y1Y1FNOHhKODBCa2daK2dlR2t6WXFHcVQyWmk1Z3ZFbDZUL040bWs4?=
 =?utf-8?B?NEptWDF5ZzJJbE83ZG9aanR3WU8zQldtT2RBbWpEUDFMTXpDbXh0NXl1VFBM?=
 =?utf-8?B?STFCL2ZBSlNIUm56dTRkaGlNSTZwRXJ5emxVMFAybnE0QU9QaDlnTzgyaW9R?=
 =?utf-8?B?T242clVVVVIzYkp4aVpjVnNnZFVxMy9xZ3dHZ08vcE1IcFZxY1lCK3FaR251?=
 =?utf-8?B?M3VzTmpaUFZaZ3BuNXFGY2wyYUlaWTFvUWVqSDRPRVJkL0ROb0thN0EvWGsr?=
 =?utf-8?Q?5PpEwwqz5cll6vb/hX9L2MdptynanuntaFWtAtiEn738?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c031c44f-04b4-4e76-212f-08dd93796c9b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 06:26:28.1462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4iaXCJ6DWapfdSRRhHLO39m+We1jvFt6LiyJMY6WXHyKpaINcSwye64f7CSLSgZMa1WQVdi4lpA5h9/ORpLEzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8709
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

CONFIG_AUXILIARY_BUS cannot be enabled explicitly, and unless we select
it we have no way to include it (and thus to enable NOVA_DRM) unless
another driver happens to do it for us.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nova/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova/Kconfig
index 123e96788484ad05a77a5827742c0c88255b1f2f..cca6a3fea879b81c38dd7124942cf2aa09874efa 100644
--- a/drivers/gpu/drm/nova/Kconfig
+++ b/drivers/gpu/drm/nova/Kconfig
@@ -1,9 +1,9 @@
 config DRM_NOVA
 	tristate "Nova DRM driver"
-	depends on AUXILIARY_BUS
 	depends on DRM=y
 	depends on PCI
 	depends on RUST
+	select AUXILIARY_BUS
 	default n
 	help
 	  Choose this if you want to build the Nova DRM driver for Nvidia

-- 
2.49.0

