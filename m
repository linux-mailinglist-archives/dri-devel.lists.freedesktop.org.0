Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id A0nMMgGBlmnugQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 04:18:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3151815BDA9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 04:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A08F10E0B1;
	Thu, 19 Feb 2026 03:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BiaIMCbn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010039.outbound.protection.outlook.com [52.101.85.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0D810E0B1;
 Thu, 19 Feb 2026 03:18:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLMGcU3PGXStv+tXn0Kt5xotMIIUaGpff/B5yFbeDZKgxRldsw/HTEGhhyt2To+5LDk1CrCy6Mugj7g5sUpgEaJWjgyXc4Vpo+EAjyt8mnZG2kAGUpnvpNpMpQbtRBW6q+iyfygQcB2Kle3wzxjT9udcm9j7Eq+Vz6oVW4vs+slrnrJEs8zBLKZywlEy4pRp0RxkXjOu+j9g5dyR2cnxEcv2dI73ryxGlG4zR7o/V2jLvc/aIUVj7c/cOt3AiBlqbbKqla7Dz4cRjmjegrIFKFoY+Xi0W7JOW6Ht/w+Z5MM1VndrG+C3QtKg7X7r3TTNxkN4JgrAbgKJkfatqSAUJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaAEM99kRoBoe8Nq7CO+id58H5ftAH1z2e1QO2ZrbDE=;
 b=Z/YigowlOq28k0Tqqz/3Yras+y8Rwmds1ovxNdugFLMZp5cr2/mglWbUUGjKy3Znydb8saYMXKRWeUwRrwmCsczk3PAesVnzBsuRDUiY7Echs6Ha8GKrNPCP82LgiE0egUDMWN9yOAf7RIktYXacfwTztvYZjPothGW4h6RHk2U8YvaHATzR4KHNjphXwbFlB3RFzp3flQkEFC3Q/AWlNqa5Q/k7atS+cvq4DeHd16naQnoXbtBY81lsGv8nTZN5Cypm98CtTRBAV0TO7Kfa9n6DVTSzdGsEVrJAagNHGpf1ASaJiuPyAtGQoPX1csxM6sp4NWeiUbOQ9oTsZF3TOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaAEM99kRoBoe8Nq7CO+id58H5ftAH1z2e1QO2ZrbDE=;
 b=BiaIMCbnqkE7JLfxP1Od8gQsrAZxqnl8J9EftP5HRIzaa0J9bNd6XIKgjwahkEZxYYgqPJ6kDHowOEQXKyMMuICVQVmMGkJagafByXgYvqNwICPrxeCtZfb93CJBCfDQd8vz4otrees+Hj61gtlCbDrGZbX6TUlRPU9MZ9eQU/zpaRGdwNrDJ3mgkGbOyJ104MIE1/U/3gYQRximiD6Z860jfqHt5zDZfe1zLK14YdoCi2NeBzpvzFqRbEcrh6Van+6FWoKsDq65ROfUNviRQ0KfHvwQKvzN63xfwfWZZpvp6iBjrzlw3cvV1qr4ySfg5QcpZEulktKNqB+ijrcTXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6282.namprd12.prod.outlook.com (2603:10b6:208:3e6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 03:18:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 03:18:11 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 12:18:06 +0900
Message-Id: <DGIM3AE5HMTB.1INPUXJQ5GQ4P@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Matthew Auld"
 <matthew.auld@intel.com>, "Arun Pravin" <arunpravin.paneerselvam@amd.com>,
 "Christian Koenig" <christian.koenig@amd.com>, "Alex Deucher"
 <alexander.deucher@amd.com>, "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang
 Rui" <ray.huang@amd.com>, "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Danilo Krummrich" <dakr@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Dave Airlie" <airlied@redhat.com>,
 "Gary Guo" <gary@garyguo.net>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v10 2/8] gpu: Move DRM buddy allocator one level up
 (part two)
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-3-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-3-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0263.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: 140deb67-2558-4e50-ff9c-08de6f658244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d29LcjBtUEplbGhTSG9WM2ZyME9Mb0VPcTZVaUpRL0N5Zk4yMzIrN2VxWFk3?=
 =?utf-8?B?dGhXMU5rL2RDcWNkRWZvRThUU25uK0FHTzJtMDcvWU55bXFCVXplY0N3KzhE?=
 =?utf-8?B?d04yTDNpU203cWxvbjNGVkEyeVhwbjhGY0FSbjJJTGR2ZGUrQ1dLK1VlOFFN?=
 =?utf-8?B?anpTbk81b1FFSDhtc08xZEhVODFVZ3EzK2Q0S2FvYnc1MVB5dDRBZjMrMzRm?=
 =?utf-8?B?ZVd3eFhteTc1NXdFVXhlaW5JeC9TUTNsMTlnL2oxRmxnQ0JMYUhxdHNVRzNG?=
 =?utf-8?B?a251U1RzNzdwems1VmxnYU50aVZzSkpobzVocUFmSStMbUxLQWhXc0t6Snpp?=
 =?utf-8?B?K3VDMXlnYk50UzFJWXIwcDRDeHpJb0tkVW0zYVp3clFjUmdVbUw0ajgya3ps?=
 =?utf-8?B?RW5XdU1HdUE5MHhnSVpQd0oyeFE0VWFOUWNiVlRVWjRWdUZiSlpkbE9wUG5r?=
 =?utf-8?B?TUVTTXBraDdhWUtzTzhDWjA5M2F4NzBkYnhkakhpRUpQTlBQeFNBWGl6NmEr?=
 =?utf-8?B?VytSaWhCd0VrQ2JxUmtMZVhNUlZiMzZBT0pubFJERHNoblRVbXZXYWhuODZ0?=
 =?utf-8?B?bXpaUlgyMzJBYXEzcGRVcms2d2oweXNIazlnd0pFNW5NWDhiRkQxa1VXRDMv?=
 =?utf-8?B?ZFlzTFFrdTcvc3JhRTlMNkxBWFQrL0d5VXJweExiRjNYdWdGRVVUSm1sY3Ar?=
 =?utf-8?B?bnhmM1c1OGZ6bjFHdG1nazVUV3NlaEZCeE80U1c3SEErd2JuSUkzZ1hTWVRJ?=
 =?utf-8?B?WXEzQWwxK3RBb3o3Z3h0R0V4TUdtdnZTOHBNK2hqcnZEcHBDS3g2MFQwWVI0?=
 =?utf-8?B?VHVzUVloUmpkZ25seGwvUnZaLzhHOFZXTUwzZS9IWEJvQ2tXMEhkR3M2Zk9M?=
 =?utf-8?B?dE1INmRTakVyai9NZHBnWW5aQ0VBbDRFdURORERiUlBGVDU5QStGTWhFNWVk?=
 =?utf-8?B?b0xwWksySysvVEk4V1RoTmp3MTYxTUx5aHN3M1QvNDAzdm54dWhsY3dab1Vz?=
 =?utf-8?B?eVhsNUdHODNMalViNlJyQ2V5ajlFdm1YSTlCdzZscWlxclB4VUlYdXRaOEUw?=
 =?utf-8?B?UTdldVA3OE11UXBRaEN0UnN4dTk5aDRLVFFQbUpFLzRMRFdjYVJNeUYvUTQ2?=
 =?utf-8?B?bDd2QzFMYnJBbEZBbnhqbitLSkhIZHMwNEpkcU5ySzlZdGpCOFR0STBPTFg2?=
 =?utf-8?B?dE5hazhMQmxqRUJnVUhocHJPd3VsOFIrRWFpTHBzOXpPdmR1Z1hrdTNaWVZJ?=
 =?utf-8?B?Y0hzKzE3bEwwdDB5Z0pCYUF0TEZKdnN3Z0FDK3F0N05ZT0RoVCs2ZlhsSkUv?=
 =?utf-8?B?NVNUOTllczhjREdZTjY2cEVHdHVicEVSNXdtRDJoTmlnMm9lNEdtZCtQR2hl?=
 =?utf-8?B?WFhOYmJlcDhZRVFtY3loQ1JhK3Mzd2hWd0xQOGhwaStTSS9kanViZ2Q5blEv?=
 =?utf-8?B?U3pBMFF6OUxxMWUrbVdXV3RRbmYwN2FXWURORFlJTnlFeTVFUmVEVkt1K1Yx?=
 =?utf-8?B?eVh1N2VGVmo4dXJwRk1pT2Mvay9QNjNkbzN6NlE2RGNFc0syOHl2OVVXbDd2?=
 =?utf-8?B?NVY5UXhFYlk1RSt6ajZ0aG9xdDNRSVAzd1llTnQ5cXp3bGdVNTVHZFp0cUdJ?=
 =?utf-8?B?aWpUN1hoakJKcmN0SitCaG5vOUVKWXpOQjY3MC8xbTJxb1IvSlpsRTdsMHlY?=
 =?utf-8?B?SERJcFkydWwzTmZtU0s2VXFzcnBCNVdZUHFqNXh5RkVNMUF2WnpTWCtkTVMr?=
 =?utf-8?B?MzI5Q3ZDTUFMYjArSytqbFA0TTEzZ0lCUHB4YU5hdVJlSE9vWWROREpQanBv?=
 =?utf-8?B?c3RhVmxOZGpvaEdPY0pNUG94R1JDL0dVMUtIRmFWb3lzMDA2WEFESEk2KzFD?=
 =?utf-8?B?ZTk5cXp5MkE2OWxsNTdUVCt2TlJzaW9UMkhHUkJ0bHczSXJqRHBsdG95a3Vt?=
 =?utf-8?B?RCtjYUpxcWd6anFqcmRvMjV5eHJzajVrT0V6ZHJoTVB6aGFXbG9NZ3NsdHZo?=
 =?utf-8?B?Skg3cWNJaVlXTzhQT2o3ZXgra0d6YjY0amlpQm5Qem5MUkhmVzJONTF4cGh1?=
 =?utf-8?B?K1JnTkF5eUk5bXNMY0pWUnhmc3JnN1hETk1yZ0hublNiZTV5ODlZU0ZBaEIz?=
 =?utf-8?Q?2QpI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1I4T3JENDJ5RWVId3RRZnZwMnRrUi9lWXlvSzlaaTFiNlplUkZIZitaZUI0?=
 =?utf-8?B?RE5KYmMxYUM2aFRiQXhzTE13Uk9WNysxSjFnbGwxR1kvdUthaENYa3pYME9G?=
 =?utf-8?B?MjBpYmUvZ3BxRVZ6UW9NVFdCYlRtTzJPaE12N29vUFRmY3lXWmFMYkNQVlRX?=
 =?utf-8?B?ZlV2WFRRR3hCTzcvTWZtc25YSGlBVVZvL1lQdkNVT3A1RGZ5OTRNYlh1RjFl?=
 =?utf-8?B?cVRhT0dybTZ0bm9aUXE4QVI4K2lCYnU3dTIzbzArZHEwQnpoWTN3VE9zcnhy?=
 =?utf-8?B?cEE4RXdCNW1PbzFVbHVQQ1JOa3pHTWVnOXRQZ243QzhDQ3RWcFNmZ3JzejF6?=
 =?utf-8?B?QTMvalFzOTNNSGVMa0ZoS29XRWZzeWxmSDJQMVQxeksydU5WWnNoQ09sU2xh?=
 =?utf-8?B?MDVvczBOUUZHSkdCY21ld3RQR3d4VG9SSDF2U1o5bkllRUdiSVdnNVFSKzJ6?=
 =?utf-8?B?VjFRWnZHUW0xL2MrRHZoeUVBM0dVanZwMWw2by9TUFhZUDZ5NDhBa0NRU2R2?=
 =?utf-8?B?eHdRYnQ2czBnd3VaUlJhRWhWVGRjYjNsd1FoMXZIYTY5cFVtUUt4RXI1NWgx?=
 =?utf-8?B?L252dDY0d3B3NFJsNnRuNTV0Vi9hNDllSEtuL0JTU1VRMXlSNXVNdHNpelYy?=
 =?utf-8?B?by9uc1V0UWhWTmpiUGJoS1JzQUwyYjJxSlVsQlhwbG8yZTFYZjRmYXZheVVK?=
 =?utf-8?B?RHR1OFRxYU8vbktyTDMxZFZZOFo1anVxZjRtZ0lxblBXVjluTXlCeEY3SlpF?=
 =?utf-8?B?RHZCQStFSkE2SEpMTjQrcDg2QiswYTgvTFlwMnd6aytwb0hDVDVDVTNQd29m?=
 =?utf-8?B?MUE3bzlEN2VTTDNtZ3dJSFp0Q2pCTDZnMzVwQnFRRWJHcExFaWJDb29GQ05J?=
 =?utf-8?B?REM1bCtIaS9YeFNBTjA4c2l0YmdNWUtqM1F6Qkw0UitHODZLenFFOU9nTHZu?=
 =?utf-8?B?MU5VcEVGKzBCRjhlTldUTjZsbE9YZytnNjY5c3V0b09BKzFRaWN0TWZQSHhx?=
 =?utf-8?B?WGlBblBhSWRuQngrYnBLWnVFWmp1K3dPOWFuTy9XMTR6bkpYc2RHSW15NjRT?=
 =?utf-8?B?cGV6M3FIaW1NRXhtN2x4NlRHMG5aYWJaWGZWOHNhK1VrNFEvMGgvVVliZVRt?=
 =?utf-8?B?ZDFnZTZ0a0JkcjVqeTVWNENNMUt6eVVuZkdYZlJkV3lEOHl1NlhJNWo4bkV1?=
 =?utf-8?B?SWZsQURpRnNmTk84MkZXRUMva0hkWW84QXBXZVBhdytXRjdSanVQa045ekZI?=
 =?utf-8?B?cm1ZZm1zUzV6UVIybzRLZ3lMR2YyUGpVT0drTGR3YldZcTA5VTJQd2Y0dFNF?=
 =?utf-8?B?WDR3UldIN2l1eVZuUUI4T2dNU2ZSYmd3QjJiTWFVN01OYnRVRk5zbW54bm5X?=
 =?utf-8?B?TXg3TE5rdzBQc3Vtc1JMdmd5MEhseDJ6by9RcllRK2l5Y1VDOHlzdG1Mcjh0?=
 =?utf-8?B?eHVOblRFUmFqanJudUNpcVRYWUZqS2JBK21IMnRneDZUM29DZUtqTUluaU9Q?=
 =?utf-8?B?ZWFtYU1iWGI1eCtIVnlIZzR2bnVGWXdNM0wreGp1THAyNmNpUHZEMm9Wd3NO?=
 =?utf-8?B?QzVZSmJzcjA1b3RaS3IyK2pHRFNyZE9VcytmUUxpck5vZlBVR0pxN1RWbDVM?=
 =?utf-8?B?K251amREN2ozZktybGthQVJXdEwxMUJ0WkZCM0gybDhCV0Z6SkppL3dOMU80?=
 =?utf-8?B?ejRmcjFGdG5DaTdEVTRHbVlJekR3NkZRN3lzblREUWxKOWR2UDZOUjF5Nmlj?=
 =?utf-8?B?TTI4SjFwZG85bFFjM3pZbXNtRWozMDhtMWFLVHVVWTFZZ25GNjU3Z1F5MWp0?=
 =?utf-8?B?RGFrRW8wcFVoc3lVc2JVeWRTM29rR1dTQTJFcW1TWnpJK1ZzazFkUjlaQ3o5?=
 =?utf-8?B?ajBGUjQ1bXRZVEhqVTVjbFFmZThoTnY1amFpWW0zeU1zc1VDaEszclpXd09n?=
 =?utf-8?B?VG1RSnhqZHVGajVOM21aUXJQYUFwdGVkYmxub1VKUmgyTWU1WUZmOGVFbkpx?=
 =?utf-8?B?RDA2T0x1SEpyQlR1Ykl3ckYxMTJBKy90UzdsRWYvc1hhc2pTSHM3eXhPN3lC?=
 =?utf-8?B?T0s2V1dEbm1JM2xsYllVa2FuVjVCcWFCZlQ1aFJTQUpnOExEbVczSW5sSDM5?=
 =?utf-8?B?V0ZLRGlyaUozQUQ1NVI0NXl0cmo5RmNXVlQ4UHE2NjUxenhMdG00QXFqMVdH?=
 =?utf-8?B?L3p4VWhWM1FUSmRpRFVtNmUycm5jS2V0cjFjQmI5NkNab2VyUkFhL3VLcW90?=
 =?utf-8?B?Rm5aazJCbWNESEJRVXRlRkJ5RHMzdk1pYWs4SElFeUo1NEJ0YVU1akVhTFpI?=
 =?utf-8?B?UHI0VmFsaitBK2NSZVRUWlNPMzhQZEI5LzNmbHI1MjZPMjkzWHZnbW16UkdH?=
 =?utf-8?Q?lEIKm2eRRG0QkGSMzZoCcovSJh4oaoUWo0JyEDWnQBBVF?=
X-MS-Exchange-AntiSpam-MessageData-1: qKu+ryuJZeOXzw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140deb67-2558-4e50-ff9c-08de6f658244
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 03:18:10.9590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2OBbpipRZ8MCuyqVZT+r/6EtL2vksYy8jpV8kjzA1mFfi2Uw7vF4TtX8h5T4tOfmy/EWCRL74pW3YwAQbe8ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6282
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,intel.com,amd.com,ursulin.net,gmx.de,redhat.com,garyguo.net,collabora.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 3151815BDA9
X-Rspamd-Action: no action

On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
> Move the DRM buddy allocator one level up so that it can be used by GPU
> drivers (example, nova-core) that have usecases other than DRM (such as
> VFIO vGPU support). Modify the API, structures and Kconfigs to use
> "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
>
> The commit cannot be split due to bisectability, however no functional
> change is intended. Verified by running K-UNIT tests and build tested
> various configurations.

Patches 1 and 2 have the exact same commit log, but each one does only
part of it. Let's only keep the part of the log that applies to each
patch.

>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Reviewed-by: Dave Airlie <airlied@redhat.com>
> [airlied: I've split this into two so git can find copies easier.
> I've also just nuked drm_random library, that stuff needs to be done
> elsewhere and only the buddy tests seem to be using it].
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  Documentation/gpu/drm-mm.rst                  |   6 +
>  MAINTAINERS                                   |   8 +-
>  drivers/gpu/Kconfig                           |  13 +
>  drivers/gpu/Makefile                          |   1 +
>  drivers/gpu/buddy.c                           | 556 +++++++++---------
>  drivers/gpu/drm/Kconfig                       |   1 +
>  drivers/gpu/drm/Makefile                      |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |   2 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  12 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  79 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  18 +-
>  drivers/gpu/drm/drm_buddy.c                   |  77 +++
>  drivers/gpu/drm/i915/i915_scatterlist.c       |   8 +-
>  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  55 +-
>  drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   4 +-
>  .../drm/i915/selftests/intel_memory_region.c  |  20 +-
>  .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |   4 +-
>  drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  |  18 +-
>  drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |   2 +-
>  drivers/gpu/drm/xe/xe_res_cursor.h            |  34 +-
>  drivers/gpu/drm/xe/xe_svm.c                   |  12 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  71 +--
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h    |   2 +-
>  drivers/gpu/tests/Makefile                    |   2 +-
>  drivers/gpu/tests/gpu_buddy_test.c            | 412 ++++++-------
>  drivers/gpu/tests/gpu_random.c                |  16 +-
>  drivers/gpu/tests/gpu_random.h                |  18 +-
>  drivers/video/Kconfig                         |   1 +
>  include/drm/drm_buddy.h                       |  18 +
>  include/linux/gpu_buddy.h                     | 120 ++--
>  30 files changed, 853 insertions(+), 739 deletions(-)
>  create mode 100644 drivers/gpu/Kconfig
>  create mode 100644 drivers/gpu/drm/drm_buddy.c
>  create mode 100644 include/drm/drm_buddy.h
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index ceee0e663237..32fb506db05b 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -532,6 +532,12 @@ Buddy Allocator Function References (GPU buddy)
>  .. kernel-doc:: drivers/gpu/buddy.c
>     :export:
> =20
> +DRM Buddy Specific Logging Function References
> +----------------------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_buddy.c
> +   :export:
> +
>  DRM Cache Handling and Fast WC memcpy()
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dc82a6bd1a61..14b4f9af0e36 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8905,15 +8905,17 @@ T:	git https://gitlab.freedesktop.org/drm/misc/ke=
rnel.git
>  F:	drivers/gpu/drm/ttm/
>  F:	include/drm/ttm/
> =20
> -DRM BUDDY ALLOCATOR
> +GPU BUDDY ALLOCATOR
>  M:	Matthew Auld <matthew.auld@intel.com>
>  M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
>  R:	Christian Koenig <christian.koenig@amd.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> -F:	drivers/gpu/drm/drm_buddy.c
> -F:	drivers/gpu/drm/tests/drm_buddy_test.c
> +F:	drivers/gpu/drm_buddy.c

This line should be `drivers/gpu/drm/drm_buddy.c`.

> +F:	drivers/gpu/buddy.c
> +F:	drivers/gpu/tests/gpu_buddy_test.c
> +F:	include/linux/gpu_buddy.h

These files have been moved in patch 1, so their MAINTAINERS entry
should also be modified there.
