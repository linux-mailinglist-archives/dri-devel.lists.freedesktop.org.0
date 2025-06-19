Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E9AE0701
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340F910EA3E;
	Thu, 19 Jun 2025 13:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sK9JZh63";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE27E10EA38;
 Thu, 19 Jun 2025 13:24:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7exh4K3gr66g2mxyx8tr2trPjS+AkPKz7d3BRkuWey33nspy9j3aLIbcHljDv2VwG4idjyPwyuxq+zPLCE9bqzreIHGQTXiALArCimqyYo1m/MdDv8vmXLiMyTeAjqPya7r2UGYRK7j7aigH/NHHet9ClYFHlEkS+EmPgqpdaE4VbGXngrwKUIwo01A+dOR+2B0goTnRsLn3BDjXwCa99sPM/WW/obfWcOcyjbj+bW6gSXkZn6gxpEeWSbdphETH/iH/h9DWP95ypGcZcgcb7TLrwXFZbxV77+iDLJbPDqu3/vE8x4HTLp+vJk/eStz1WjOokeHvIvF5eYEyKyA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ur6LR0qiyX9jMhQYyK+1znMpt01tGWciW6qyklaxXyk=;
 b=WFHOcHS0i81cgbD2mUufMg/yLGCjv/w5EahDXRihgiKuBlreCqPdz7NRwvDTvxbYbpK68zmr5J4iExnHHn/KfFB9e6aEVyZgZtpod1U2aWXocnfmCm8D+mxLDW5VCLOr33lEggwO0axvGweITbhVrlDTuTAACIXYaS6HL+v4oK8PNVY53GL3uKfCtiSYJd1yOjG3twX1Luxx8EaCZlfvOKU0CSkqLzolu0sAsF7up5sAm+uAAcosddfEc7rVrbJC6UrglIKaIb7EED/NCA5kIQQGZpGms9K5oqOYVTbA3jIhXAUIJpmfmy2PMfdyC1IJlKglJkPpIu7zoEMLg+Go1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ur6LR0qiyX9jMhQYyK+1znMpt01tGWciW6qyklaxXyk=;
 b=sK9JZh63gg6wghL+MAXq8TmS6gGYwxBLJhHjZPluRPHjfixFtoBbNha5uSP2jksm44yYrHZm2Lz1zdsR4LUAQUBjKCWmLqpmEc81ntLgoBnsR0MgyiEbxNrMMHDoQSfaocW7rWe0kGLDR0EsUNHad4eF8AUjEiISscbrmgivK+XKzzFIn8tw2+Ps0zFO7VK0i8mj/yJo6KNKXcY5FkAu0UdfI1Npm78q1+t1WWBlFtHg0zURdCbDWsqZbR7qW9L2SI9sV59D2Q3rUuMVBg2UZA+pKlbUecCBGiPSf6NKPv6Q3498ECHhmYBkLIF7+4nE+G27Yuhn01aJB88MFk4LoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 13:24:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:24:53 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:23:52 +0900
Subject: [PATCH v6 08/24] gpu: nova-core: expose the offset of each
 register as a type constant
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-8-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0074.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c587280-fdda-48a2-a0cf-08ddaf34ad46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aldVR0M1dU5QSDdCa0xyeVpBWmtHbElzSFFDMnoxSXVXUzFYMlptSVhZTW91?=
 =?utf-8?B?UHpCUjFOOEFqc2hWa3hHcC9CeC9XOWFCbG9KSm9OemdHQi8wcWNTM2dvbDd1?=
 =?utf-8?B?VVR0QUkzVW0rRlNNV3NVZnlXSW1QWUZjZ1lhRTBlbTlVd0cvNXdKVFY3K1lW?=
 =?utf-8?B?d0prOFVqT3JQZEl2Y2c1dHYyaTNWM1VqZVEySXFPUE5TQkY1ZHBneHVIUmFI?=
 =?utf-8?B?UkgvQnBRKzBuNGsrajB2V0NiRTFtbWZxT2FoZDR5LzZGdC9Ga3dhTzRSVWQx?=
 =?utf-8?B?L2hFZW9SOFFuSEFTZTV6aDVXQ0p5YjhURkFDSTFudzMwL1cxSk9oZldtUHNE?=
 =?utf-8?B?OWt4VGl3UXlVcHhWYWFvQ3NVVU5FZU5OUk9iUy9mcGxFL2VZc2JrWEVVTzJH?=
 =?utf-8?B?RTNJOGY1dW5YZTl5MzFqVFNLeUJodHhyTlFEYTdSWDBUa2ZGMEpLbmNEMXNX?=
 =?utf-8?B?MDkrS2NHeFNvUHlLMnFpZm5XRnc3Y0w1N2ZTZFE4bE93dkhYWFBya2pjOUZ3?=
 =?utf-8?B?WU9ZQTh5WEhGUWNOb2VhN0J0VmE0cEdqQVJrcWVCT2RCdGVNcG5hQ3JwbUVS?=
 =?utf-8?B?NTF5dnYvYVFvalJ2ZXN3TG1tVXlHOXR4bTFMLzhmUGFYb2ttZGxvK0hRVXov?=
 =?utf-8?B?Z0hMdWJ0dE15ekxnYWJMelQ2QzZ0UU83dC9XekNsdUxBOWpEZFBCeHJZSGlh?=
 =?utf-8?B?ZU9PV2o3SjZobTVhandRcWdTSFNvZlY1SVZQM1NUZW1uaTVaQmhLcWpYWHVx?=
 =?utf-8?B?NGVLUVpXZkZnYWJvekhDa0V4MHg1M2hoWGJRYmtXTytmTGlSaVVqeVZPSkhq?=
 =?utf-8?B?dllmaFBZZHlFbHhXVEFDeW1QOWpjVk5paGdsblVBT0IzVUpjdkdqZ3NJUTFN?=
 =?utf-8?B?WVU4Y2xNakxKZlppQU9aRVB4ZlBvU3E0aHZrUzZJMUFvWDJ3eit1OFBKSlNu?=
 =?utf-8?B?eGc1NzdHMm1kUTBDMTcvWDlaTUFjbE9rRnZodlNFcnFYTHBvaTlBbldabFhi?=
 =?utf-8?B?TndEWnNPSkdwVGpLMURwamlBRXlTNHplaElRYWIzRGs1MGxhZ0JNK1cxWlF0?=
 =?utf-8?B?MmxlLzNFelExMWM3UVY1Y2s0cjBRVlBFVDNFODcwS2gwOGJJaUpwdTV6ajFz?=
 =?utf-8?B?MFZJSm1zS29OL2NHZktOOEpDR2djem9qOTVpQTBQNzFIdzZOQlhDcHI4bWx2?=
 =?utf-8?B?K1doZ2RPSGppdGVHK09la0xSUEpFdkFZYlZTS0h0RUVLYXNTV3IyK012N3ds?=
 =?utf-8?B?VlNEaHhHdmRreDhKMVM0V2NkNWJBUkhxenI5QmhucDFyK0pWSkQ5bDNVejB4?=
 =?utf-8?B?bU5GKzRaaUxmNVJsSXM2RSs3ZGZlY3JnOTVzVWxWVjJLbUVXc0xzT0hHR3Fw?=
 =?utf-8?B?ZFFEYWF0UThwV0psdElUaE41YmN5MWFvQk1hcld6Nk1VK0lWaDlSbWw5YlJl?=
 =?utf-8?B?dm1Mc1IxSWs3WXQ0OEpWenM4dFYxY0VZN1ZXb2Z6ZEdzQ1AwTktQNzNSRFRM?=
 =?utf-8?B?ZE9kM0JwcXgyTUJwMGVTclN3Y2Riek4wN1BoVWl5ZThScG9wKzJqdUhXNVhq?=
 =?utf-8?B?dmVlTGRzcWYvYmNFTjkvT0g3RytkZmlNK3NFZ0gwMXBpdUZubFgzVTBLRHVw?=
 =?utf-8?B?dEo5Vis3N1IycU1RUkVjTXFmWVEyOFVZUjMxU0l4dzJvdnVXWWdVN25Yb1la?=
 =?utf-8?B?UWRLd3FMTWhDbGVsUDhKUmw0RXdIeUhZSUxlck5SM0h6T0sweWl4UmxPT1Iw?=
 =?utf-8?B?QkQrL3VaUGl5R2ZhUi9HODJDUm40OXIrMnhQMW5IK3BMVVIvcHBrNkwrSjFW?=
 =?utf-8?B?QjNaQ2czQzdaY245b1FSbm1lc21yZzUzK0NQQlc0cDRtWmc4Rng2QkVYQ0lp?=
 =?utf-8?B?ckxDS0dGVjVFejV1cWlNVFdMSUNGeG45a2M4bVQ0N2VnWi83ZXJjYWRMaE5R?=
 =?utf-8?B?UEF1aHBhdGVxcDVRYU1TTE9MYit4ZU9wWEJzL1hCaFNpdldFZ1VwTGVDWWFm?=
 =?utf-8?B?UHdlV3RySWZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkJoeGZ4aVg1dUZ2Ym5Pc0JWN01JV3NWT1ZPa3BBcFIwU0V4RFZ3VzZWWHJH?=
 =?utf-8?B?czluazV5MktQdTY3RUxPWHVyaW1BeG8weXZKZFNlWUxBUityK3p1MWpuRHI3?=
 =?utf-8?B?M3BwNXh6cFc2T3A5OFMzbkFSQ2ExL1FES3hNZjNxZFlQdnNFa3JhQlBpejNV?=
 =?utf-8?B?NmR0TU50RlBRalJhMVByWWpSZ3dxaWszTFBNM0RPaEY5RnlnUitWejN2RExy?=
 =?utf-8?B?N1B0NjdUcmJ1SHhvS2NQcno4WWdmcjd5bXRNbkpTQnlVbzhPZjhRTloyQStN?=
 =?utf-8?B?TEhvMXd0L3AwRk1WWmlSU2lOd1lXbTY5Wm5XTFNQNVNTVDFDVzBjMldBdjhx?=
 =?utf-8?B?VVNJTzVDSjlrbmt0dytHSjQydHlEREYyVXdJa2VNUVAzSWVQWUtiRVR2dlZP?=
 =?utf-8?B?dktpTGxlcFc4WlRYYnhsSEhuWG80dmptZXJhUW1vekZ4T2hFd1Z6ODVldVZC?=
 =?utf-8?B?NmJ5NnByWG9pMWJia2NKc0R3cytZSmhkTi9IUGNiZG16ZUZzd0pacDBSNXhP?=
 =?utf-8?B?KzFXV252ZTJhM1FBZ09VR25BZld4SW5JSXhWdld6b0ZrWEZWQkJ6OXhmdjk2?=
 =?utf-8?B?MjlRT2w0T0lxNm5wVDdudkN0QWlHMmw0ZXJSdlNHNWgybno3aGhjcjZxUlRI?=
 =?utf-8?B?Nmc0QmdJNlF5dVZBVnhqdHZNYlQzaHpkVjJBVXZ0aWZGbEprNjVXOEdnMzZl?=
 =?utf-8?B?TXRRZXlhdTZBNU0xd1FnL2FnWEdDeFBuYVhicnpDWW44Z240L2RaUkdHWTVX?=
 =?utf-8?B?ZjFRbjVLL0VKbUdCazdnbHNNM2Z3TWhFVEpXemtXSUtEcC91OVZPdFVvVkh2?=
 =?utf-8?B?RS9TTWwxL0d5K1ZDanU1aXhtNFhMK1lVQ044SFNQOU9mQ0Z5SUR0QjZuWnJI?=
 =?utf-8?B?K05CQXRvMjdMSjNPVVZTV1RjcFZjMkRCZ2x1NjE1Z0NEVVdvQVhwMTNvT0M3?=
 =?utf-8?B?STh0WVZZczRXNXc2amd4K25EMWp2d2xPNWRDbzlLS2JrcmxTYUp4dG9ZL1Bn?=
 =?utf-8?B?bzJOTzJHenJYOTJ5Rmd5Tk5TTEpmeVh4UzNmcHFBejloSFFxa3BoTnFGSm02?=
 =?utf-8?B?b0pDdi9MVEN1R1pDZmNsYnBSWkVYOTJkRWtVemFab0wxNGMwMEZWeERIYWxV?=
 =?utf-8?B?SXVRM1FhRUtOR3dRUHMyejhXMEtYeFYrQUtWUy9xSjBVdjloYmhMTjZwanVp?=
 =?utf-8?B?ODE2aDZFaEFQdGpld1U4aUNFS0dmeTJ0MWNuSk5qbFE1VW5MOFZXdDdzZW1Y?=
 =?utf-8?B?T0VEVTJuUG8yZUlacGxhQmUrUXBBMW5jd0U4eUFVSHVhQ0tuQTRvMG9yMng4?=
 =?utf-8?B?UmdTWkhKaXZlbkk4Y01BWTBJNDliSXZUU0VTc003cERBcDRoSmIzTklSdG9r?=
 =?utf-8?B?Q0FMZEwzdXRzZEh1Zmp6Q3BFQnR6b0JKZkVyck9DR2hGenV5SmNoejZZMElj?=
 =?utf-8?B?SDliS2hMY3pvOU95NElmTWpCR0VTelAvdUVaSVg0bkk1ejJRWjlvNERXM2l0?=
 =?utf-8?B?RGRoUmV2TTZJcWhIZ25KOVAxK1Nyc2ErbThCOXgrRlhUWWp2N05CMXJya29O?=
 =?utf-8?B?WDV6OVVnbHRuRnVUZWNLVW55Zy9sRkxSUUtwZXcvNVVXQ0hwR1NuWkNzT0pJ?=
 =?utf-8?B?OGJFOGJweE5wc0J0cXJqejJtUWpiSXUwY3Y0ODh1aElwV1hlbVVsTlFNdEhu?=
 =?utf-8?B?dWZoNktVVUx4bW9MWThGK0I0Nzg5Y21oTUgza3R2NUU3M2hLbDZGYUhiVGlv?=
 =?utf-8?B?Q25vc1RZKzV3aGk4cUtRNlB2UjZKYm9HSGVtb0VlL3BJemo3eVBzRzYzRkhj?=
 =?utf-8?B?NjkzV2Y4Zkl1K2hWM2hlbmE4N0FIWnpUa2RsRmtlbVNVVDJVajQ1Nlk1TjRk?=
 =?utf-8?B?MXEyb1lCaS9tWFdJQXg4YTJOUEZOU2JwY2hiTHdoR2wzMXRKc3MrNUZOVHRI?=
 =?utf-8?B?L3ptYWhoUzdrbnJERnFGdVNKbDBvSmZiaXloRUsvcjNBK0RkS2plTVlBOGlz?=
 =?utf-8?B?TDExb3ZkSjlxaHlCTVgyZGgxY1piNWxXQ3YvL3Q5bGtDYm9EN3JHNUM3T3Rh?=
 =?utf-8?B?Qk5CMkNvbmYzaWNRb2hlb2ZnSy90UmZsaXBXYWs3bDY1ejB1b1o5bDBKWTZk?=
 =?utf-8?B?ajBLZU9oYzdWSDVHUklEL3dWaTkyZTZJK1VSdjhqbGF2akd4bko5TG1EbDZv?=
 =?utf-8?Q?iCbT4q39gJvZskebWnIhkyA0ARbSTvjHFqyuXDdLQTsD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c587280-fdda-48a2-a0cf-08ddaf34ad46
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:24:53.8496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVjUqeb4e+vQiXgbLAjXw9BmJSLxXZnjwokhbBRyX0yVQT3kY8QnJKwY8ETAU7mVnjsGp2BnAf6O3aypNrS1ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8122
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

Although we want to access registers using the provided methods, it is
sometimes needed to use their raw offset, for instance when working with
a register array.

Expose the offset of each register using a type constant to avoid
resorting to hardcoded values.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index d7f09026390b4ccb1c969f2b29caf07fa9204a77..7cd013f3c90bbd8ca437d4072cae8f11d7946fcd 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -78,7 +78,7 @@ macro_rules! register {
             $($fields:tt)*
         }
     ) => {
-        register!(@common $name $(, $comment)?);
+        register!(@common $name @ $offset $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io $name @ $offset);
     };
@@ -89,7 +89,7 @@ macro_rules! register {
             $($fields:tt)*
         }
     ) => {
-        register!(@common $name $(, $comment)?);
+        register!(@common $name @ $offset $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io$name @ + $offset);
     };
@@ -98,7 +98,7 @@ macro_rules! register {
 
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
     // and conversion to regular `u32`).
-    (@common $name:ident $(, $comment:literal)?) => {
+    (@common $name:ident @ $offset:literal $(, $comment:literal)?) => {
         $(
         #[doc=$comment]
         )?
@@ -106,6 +106,11 @@ macro_rules! register {
         #[derive(Clone, Copy, Default)]
         pub(crate) struct $name(u32);
 
+        #[allow(dead_code)]
+        impl $name {
+            pub(crate) const OFFSET: usize = $offset;
+        }
+
         // TODO: display the raw hex value, then the value of all the fields. This requires
         // matching the fields, which will complexify the syntax considerably...
         impl ::core::fmt::Debug for $name {

-- 
2.49.0

