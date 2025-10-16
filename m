Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 504BCBE1B17
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1E210E942;
	Thu, 16 Oct 2025 06:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b2xeZ85J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012059.outbound.protection.outlook.com [52.101.43.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0F410E93D;
 Thu, 16 Oct 2025 06:23:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHC1peNPDGaCDxrqVK1aSLRh1dtjkI7Pr66KBk+ys03hrEo1jgiA3AR4lZnWyK2yBmmYodPkp04DTgAsH4z4H6qEuRY6PkF+W3ss+nnqB6XdTuA7c7+K5iuDjPzv+JfJQMkQacCA1Fgumu+qGLwr9NUvKVYnWtfYtW1eNmNj9wClX0nnUb381K5gao94Hs5tO3/CxJQSqvzpqLJIa6RNN6EyRdtFT7eyJ0As7z1xiKeUDgcjzjR1wStJn3RRd0k81T8hvjyk3l2Ng2dDeA02FWPKzeA5ExJ6o4fZNMKolZ+QxBZXBSYPtd2lkwNnQxVw9yP9yV56+2FVpatzYFP5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayzN5kJbKNrG3hrtuKGUsD94MwV0qMvz2WVvqvOCpY8=;
 b=TUqxj8uV9ymwclimAR8+EK/GTRv1Et735cFw5dNcXdGJWZxsp/G4xUEWToAcSGTBXRL+ewlw/vX0QMiQrNFdq/ASvl81SZhofddK7vN9063FBHdTc7XlTXwi69XgOZ/YD2qQ8mst7Z7Iu0hiDcTVWBV60IbYk8G+6cUxea4cQvj9xAl8fSfeZ91s4/QvHNt7+bRZ+rT7QJvKJOkKhNoeVtYFuffLuJgO2U7iz/05+X6qUuyGgNhUuFLj0LPw5TWEhzmY9ElIGLHBVtwnMpjferdx6Ys8VptHVEHD2J2yTYzL3XB1Rv4RcjmBZxDYJ9l2THlUV4oNRnXxyQFZ8zB2Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayzN5kJbKNrG3hrtuKGUsD94MwV0qMvz2WVvqvOCpY8=;
 b=b2xeZ85JaPPMwA4iOy2Ly4BXhl9F7ltxOUhKaczgi+18yhLiBYqo1iV99iBJ2TO/I8RBqpwHpU+0B46H+AEjirN1+PC/e9PjEqXiiVxv6o4NU9X083thcFcdnGJeeAeQR4N6Q/mX1t1b45QvB2zFyljjP9gOsNa5yjcwaBcf4pcXiINcSYsHtkTPpeGoggTKeMOeF3XhA+2D3H3A3UQuTV3Fl1ND7qrqrGPugXMmvO985Zp5jvtwtdtUKEfnagxk51pspnhgF99KXx7WSeFPL6VBMGh97tMYWLaoYW7yyKUXxf7Yx1DCEL0NiS65zL7Zk/OL8hBQzs6cPq57wEuLFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:23:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 06:23:17 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 15:23:14 +0900
Message-Id: <DDJJ4ECCSE2I.1EUAJRU9JBGNI@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
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
Subject: Re: [PATCH v5 03/14] gpu: nova-core: gsp: Create wpr metadata
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-4-apopple@nvidia.com>
In-Reply-To: <20251013062041.1639529-4-apopple@nvidia.com>
X-ClientProxiedBy: TYWP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 5520c6c3-eeb2-499a-bbfc-08de0c7c7ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFRkUGJrOUNsdGVuWHU5NkRibzRyQTFOc04zUklsaEoyVU8wRU9aaXAxcUJK?=
 =?utf-8?B?alR6OEZVd21leEcrWVVlVWp4ckY5dk9SUy9qaHRGUVUvRWQ3aTIyRVpvNlMv?=
 =?utf-8?B?ZDRlTW94RWwza3pYYTV1d0huNXgvS1ZId1h2R1pCVk9zUE5iTFcvWktuSzBN?=
 =?utf-8?B?ZG9yaEVacGREVExVazJZTmRXZ1FzS1BUNFF3a1poK2RnRzRPOGpsY2YxZHB5?=
 =?utf-8?B?NWRZTFh2Nk1xWmtmV0ZLTG9IS05QVzJlTFlMNnNaOExjWGh4KzdCUUU2dk9l?=
 =?utf-8?B?K2RkVW9EYTNaTjRIczZvbXlPelRTWjFDWFpMVjQ5eEhtaStGQitTbVo2ejRv?=
 =?utf-8?B?OU9rVzRZOEpLRE5TZk1kSWwxbU5TdU9rcmU4blpqYzZVQkxjSTlMUHpwVHJO?=
 =?utf-8?B?enI0bENYRytEZTVxL0hOV3Q1OEV5SVhEeGVIOHp0WkpFTjFqOFZzbW5URzFZ?=
 =?utf-8?B?T0VTbXp5cGZQMGVRdWErWlIxZXpBSDlsUjI4VW1UQ3M3dHhCaDcwNTBlQUw2?=
 =?utf-8?B?Y0FHMkxCRkR6d3BiSWd4WWMzdk1xVGhVSWpZb2hxOGlJTGkyK0lYL2RTVml2?=
 =?utf-8?B?WW0zMEw0RUVjQzM4RDNvb1plc0h5MllnZHZNV1lqY1JRMTJoWEEwOTBYcnEv?=
 =?utf-8?B?L2praUJ2V0lOK2hOMTYzSW9xSEhQNVJKMFY5NXQ1WUt1d3RPUFBvN2Z2Ynhj?=
 =?utf-8?B?OWtxZytybTd3dy9MeWZrOHNiSWY3UTRCTHRROGUybmpiRzJWcGJ3dXdldEh3?=
 =?utf-8?B?eDVFUEtzS0VZRkxZdkxaYlRjQ3hTOENLS2tyd3pNSXdMMUxrTVVrVDM4NmpB?=
 =?utf-8?B?d0ZFUXhFdHZ0M2I3K3FXRHhVVWM4WUxJYUJZL0NaM2hxTlRPdW5xTER0cHRn?=
 =?utf-8?B?QlpXbERvNjd6TGxxVmQ0LzlENzZYUHZtUyt0Z0U3ZDdxc2tzZndFMVlJUkdP?=
 =?utf-8?B?aWo5d2dJa21jdjFtVjNWZTJpYTJpS0YwRnJrWGpFa1k4alVCMjdmbGNRdlZz?=
 =?utf-8?B?Zk1ycmhvVVk0Um9XZktJRFhlUmx2V0RCUDQrU3BObUJpTVI2UGZPVTRLYWVs?=
 =?utf-8?B?R3ZxUEFLVVIwaDMvNFgwWFI4bDVOM0MrVXdrMmxxTXdpY1k1dkk4Ykp2MWN5?=
 =?utf-8?B?Ylg5KysxVU5Zc3E2YU1HMDNiRFJnTGM0RUVBWGV3M0dOZEVFcm9PNHhQbnhy?=
 =?utf-8?B?eVgvamg0RUwxN0w0RzdhdStsSUJyVENHUnR1ZlA4Y0lKNURPVjNkK3h0NUVB?=
 =?utf-8?B?OXIrV1dGZ0k5YkhVQjlHNXJnSHEvOHlOcEkzTG1jZ2ZXN1hXMXo3ZlVnem5I?=
 =?utf-8?B?bUk1TWZmU3JESTE0blczRUYvZTlCc1Z4VUViY0JSTEZzeFN4bUZkZ1hjZERT?=
 =?utf-8?B?RzJFb1FNRUNNOWE4cko4QUlXa2owOEdtSVpKRU1EMVNYckdHazVubm5tdWph?=
 =?utf-8?B?Q0I0dXZqcjkzTzkrUmNycDkwNVBLdDlMZU1zMURLTWFaYjVDQVhETzBlL3RQ?=
 =?utf-8?B?bnJ4K3luRGptUzlNS0pvMnJCTTVFdTFLek85S01jSDVObVZud0xpWHRnRjl6?=
 =?utf-8?B?MERhSGFpc2UzcTZIclhkYzlZend6eXd6ZjZHUDl5Q2ZuSWZseGRtaE85c3d2?=
 =?utf-8?B?Tm1WRUNxQ1luNHJyazYyMGRzTE1MdlluZlpJZjRtWEZyeFEya2tEMTZNUWRN?=
 =?utf-8?B?bWtYTkdYN3VqZHZlNDMzVVY3VGJpblFKc1AvVUVONlFSVkg1QmRPQzRuTElh?=
 =?utf-8?B?d01DSGk2cE50WUh2YmlvN1duUUhpT3FFZ0daSHpwYm56eTZsSllZQmlLZkhx?=
 =?utf-8?B?c0lteHFIZE5ONy84SmdDeFlBNTFBMTg4bUNKQkZ0M3RwRzJ0RnpISmNRS293?=
 =?utf-8?B?bTBMUVZ1WndmRUI2akpOaHNkZHNvTjdwTGRoaVlBVjQzWG10NkNQL0FnWDRt?=
 =?utf-8?Q?HPTl79dliPp3Y89k6zZPd2VQnAuANkQS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmJkQVl0RDNHWFc4bk50Z0xyd3FYSHNNZC9kY2toeHJhMXR0L21BUTRvV3Y0?=
 =?utf-8?B?Tzl4VVJFNDF5Y0JBUjk0enZzeW8vQWFDMWdVd2RYQUxuem9CbUZGdDdsR3Fi?=
 =?utf-8?B?aThQUkdQMlZwOEZ4V1Q3dUJFRlJUZm0vanFLaldXNlBGOWtJVEF2RG42QWp1?=
 =?utf-8?B?YzBrMXh6dW52by8ydlQ5T0JJNURYalFSVmR5R053RHNWK3ZuZUg4eEZmNzBr?=
 =?utf-8?B?c3RQMFIvRDRmOGhZcTBsbVJkaytHRkljbUYzRmtaN2RDd1Rsc2xEL05lVDlj?=
 =?utf-8?B?enVCay9Rekh2bW9oUEFtbDJDWVBnQkd1VnVIZHBMVS91WjVtYnVaWWV4aTJl?=
 =?utf-8?B?VnBCNXZuMXBpUlB1OGVoeGtmRUFMLzEzQ25LN3dMK2dKREg1dzJlOEpBTTZa?=
 =?utf-8?B?aWRXc280UkdJU1FhOURTYTFFTElpZGRFMmxjbk0wWTdTR0dVOGYwcTBQQ1Zp?=
 =?utf-8?B?TVFwb1doMzRlbHdBTm82MXArcndwQlpBczZDWWxQcG1jQ2lZZ2VRaUwrT3pF?=
 =?utf-8?B?TWdvbzNOVG03WHVRaUxjUzVacURUS1BCYTlydmwyS3NGQlBQMHc5aEZtckk4?=
 =?utf-8?B?em8wTmJFY3liblVZVWpNZFQ0RnNJWjBvdUhsMmFNUjc0eVh5VkhYVjB4SzhF?=
 =?utf-8?B?cWdPRDFTRkRhQVNXbEFLN2xJWVBqR3ptbFg5dHRNanhpV0hsVlRHQllPdFdr?=
 =?utf-8?B?ek54UWxDZzRuZGRucmdUZ21LQmpoRmNDT2xibFQ0TmIzL0xlcXFpVkpFYXZw?=
 =?utf-8?B?MTZLNmE2NnFteXVQWnFpV2lxTzEzb1dvS011bHBkb0FSR0tpYk9zdEtERnBs?=
 =?utf-8?B?WmtaUnVHbXZCL3p0d3NHNVpmVDk4Y3ZxS2xXanA2ak11eGpQTjNKUHAzNDNy?=
 =?utf-8?B?QzZNN3BZL2M1bkdHQ0paZFhmU0lOSkRFVENmWEMvK3pyQUg3ck1qWVNrUTRt?=
 =?utf-8?B?OG80N1JKRlB1T0J2ZEZQN285ejQ0Y3ptWmFOc0lwNFhnbENuT0ZGOGQ2ak1r?=
 =?utf-8?B?OGwzU2xpaDB1M2NXMldHSE5CK3Y0VmtUaHpWclZrUnEvdDlPekFrU1h1emtC?=
 =?utf-8?B?ZDZRQm1uY1FramMwK1g1VkxlVHlVSDZLWnVEWTNFSWZMcW8rdmlSWlloNW12?=
 =?utf-8?B?cjBrcGVucWdQTy9ZVTVkcjF4Y0NuY3J0ek5Hcit2VG5DL0dRV01YMVZMTm5q?=
 =?utf-8?B?eTNjcVpsRFhYY21zQVlzeTZ4UmEzUzhLR0U4Sm9pdjRJL2tKM0JTRTlTcmI4?=
 =?utf-8?B?YWJqZGVvT2FzdjNuWlluenE5V0ROR0VldVNtTTgzemY5NlZKenVwU2NHZ09p?=
 =?utf-8?B?ZFdXTlBieWVXVDQ0WXA1c01hclFNTkdQWTIxb0pMa1F5R2RXMDNGaWNzODQ5?=
 =?utf-8?B?SFh5K1h6RHd6aEdXOHdYK2JNZHU2dVgwdmVKT210YWNzMU9ZeHpTWk8xNnBn?=
 =?utf-8?B?OThnS2g1aUNEUjFseTlMaHA3aVNVQzFXeVVrT29kTHB6aG1ZY1FraDVOL1BK?=
 =?utf-8?B?L2VsV2I5R1NFcEVlTEVBQ0RLdm01QXdoYlJPMEEyeUJwc3V2ZFE2ZjF0bUdo?=
 =?utf-8?B?dTZlUHRGejZrS3hmVlZwZVF6am5YQitTTm5FVDMwQmYwbUJwWmVCd3VYbkFk?=
 =?utf-8?B?OWYxQTNGZU1VUjdsNkxsRmExQTRDNEpOUXd6RjIxUVJubS9uWUlIQ3BvaENE?=
 =?utf-8?B?aUo5OTBtb2RyZnRORUZTR0dZZjBsc2VqR2FjOElBRHl6SVFFcDAwSTNhQXVX?=
 =?utf-8?B?UHd5V1BKM0RFS0NWLzFqdlBDSGJKYWZnQ2ROQ1pjd2VYcFdtWUVnLzFYdS9k?=
 =?utf-8?B?VW9wMmFlOXU2UXBLU2FVTHgxSWUra2psRC95ZWFuc2FSVTY4MEp5MWcrTUUr?=
 =?utf-8?B?ckVTMXFycndLMlJuUlBVQzJpd0NKWHg0TVpYa1UyLy9wT3VMTnh2NmtGb0RL?=
 =?utf-8?B?K2dYQXZDWDdCYUNjeDZvLzBJb1hJOG04SmVtRk1TV3lKTE1ZVXI1OWdCWjdo?=
 =?utf-8?B?SUVjVGkyMFEvaG5jc2owMUZHREl4YnY1T211dkFpVXFhYWNlQTNjRlVwWGVF?=
 =?utf-8?B?Z1BIWjFjbDB0NlBwT2M5RnhVaG5Xc1VMeUhQSjUxS2t0VU8vZzdiWmFOQ2dk?=
 =?utf-8?B?VEl1WU1OVnVpRVBNdnhQQVN5b1FoU2k5UUUyRElVSlZRQlZwME1aUVJ0SENF?=
 =?utf-8?Q?WSOmBd46IxovnirfJywt8/K2/FzCbtAD8RS74ULXDXB3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5520c6c3-eeb2-499a-bbfc-08de0c7c7ec9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:23:17.7376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMO4kVJhD80d7pKQzWPDumqyH02s6gUDADBphFQqWtek8jKslGWERTYvinJJn9qBwzNPgE1WCWFP6Zl5V4bVXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603
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

On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> The GSP requires some pieces of metadata to boot. These are passed in a
> struct which the GSP transfers via DMA. Create this struct and get a
> handle to it for future use when booting the GSP.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>
> ---
>
> Changes for v5:
>  - Make member visibility match the struct visibility (thanks Danilo)
>
> Changes for v3:
>  - Don't re-export WPR constants (thanks Alex)
>
> Changes for v2:
>  - Rebased on Alex's latest version
> ---
>  drivers/gpu/nova-core/fb.rs                   |  1 -
>  drivers/gpu/nova-core/firmware/gsp.rs         |  3 +-
>  drivers/gpu/nova-core/firmware/riscv.rs       |  6 +-
>  drivers/gpu/nova-core/gsp.rs                  |  2 +
>  drivers/gpu/nova-core/gsp/boot.rs             |  7 +++
>  drivers/gpu/nova-core/gsp/fw.rs               | 55 ++++++++++++++++++-
>  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  2 +
>  7 files changed, 69 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index 4d6a1f452183..5580498ba2fb 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -87,7 +87,6 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
>  ///
>  /// Contains ranges of GPU memory reserved for a given purpose during th=
e GSP boot process.
>  #[derive(Debug)]
> -#[expect(dead_code)]
>  pub(crate) struct FbLayout {
>      /// Range of the framebuffer. Starts at `0`.
>      pub(crate) fb: Range<u64>,
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index 3a1cf0607de7..c9ad912a3150 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -131,7 +131,7 @@ pub(crate) struct GspFirmware {
>      /// Size in bytes of the firmware contained in [`Self::fw`].
>      pub size: usize,
>      /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
> -    signatures: DmaObject,
> +    pub signatures: DmaObject,

This needs to be `pub(crate)` or rustc 1.78 emits a warning (I'll also
have to fix the surrounding ones in my own patch).

<snip>
> +impl GspFwWprMeta {
> +    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) =
-> Self {
> +        Self(bindings::GspFwWprMeta {
> +            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
> +            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISION),
> +            sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle(),
> +            sizeOfRadix3Elf: gsp_firmware.size as u64,

Very unfortunately I'm afraid we will need to replace the `as` in this
method with `u64::try_from` and make it return a `Result` for now.

