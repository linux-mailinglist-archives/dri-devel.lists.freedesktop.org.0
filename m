Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88445AE0606
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 14:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2910F10EA1F;
	Thu, 19 Jun 2025 12:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TgXLY6Hh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC3610EA21;
 Thu, 19 Jun 2025 12:36:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFEBqHlbSiNzo7xNeyCUiEwAV8wlFA0sHkdY9ksYXPW6+T2lNEtSHeNgBrhz8StiVeGQgkdJYh1fgZRz7Ii8hhwrspwgtYDSEBHZ+vQZcqrultIipzh4Iap8wKy4dcjvq42EBU8VNZyRAczZ1k9BbdAnAOFj4QY70W2NP+XAaWVjOAe/rewEPCnw1U4FBZgXUrYUQ5SSbXGxVv5lNXmY4iGRLPid6hoOKHwiFSm1nzPxHQp99FlNz6qWq0+yduuPbmoJyzFz0tJZq/6j/Qx7sDslPcoVHArmjpo5EsrVzpTlGFt764BP5aPLxI4ogGOFrM1pONJrKxTr3vnqF5YLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muTPgAEav9CLAfkQGutAMs7lEBpUrwF1EoZ28f7WwbY=;
 b=RRk5rzo9zRP+7S72MjuRyc7uJ86ZfjyYEQV92jXcaHi52MEGQ0gCshPock2no+PmhJEDclTsDundr0nZaRqUsE7mAnmajg5GEWeBouxshe5WMhBXk5gxD5y29T8gHJOVU2YuPMb18iK/RJjyxwF9ZiV+HWkR8sqU6aooVC0k+ogEeN6I8sj7vtVKGCe0ijASFjlmekQzCzmlyXyIGW076iyCEdMnKfiyi/X+ABR1W97PEDWgYwMN02mdFBYof0ORblLtO0HdAOIcNTLwLrZRyjuoSkvT8K37lvZL61KwJJqkhcXTjoiQvoj5LVJzYDGGvfE5/i5dLyEdjAXcHzwLUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muTPgAEav9CLAfkQGutAMs7lEBpUrwF1EoZ28f7WwbY=;
 b=TgXLY6HhzpHgnKfFcWio7WG0okYe6QwHgQjQQXYch/kwo4cCAUFRvNO5UHJm+PpEo+KQ7td5Ubs4g/VcX3bSt6KpkxbAwJaWqg4US86OYgGMCDqBJwIPBG0/MWD8JG9bccqI5ZZS5lLwRCoAjJZ8g2QBbMiHG09ZYXF/pBAKa0tPQCl8AmeOnsqoK1rcCDt1k0CI6+DOS6MI/dvVUDwmgFioaDRBjJnjUBM+rS9UWfXp5Y5i/UBt+jaad4zJXRUqF8izXAvimFABG5Mg97O1ufOsR7m9c93NgrNrRDZ1VQ0QDtegKy5VJe6n99TK7pSa0O+zfAJjs3C1amLmKS+ymw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB5997.namprd12.prod.outlook.com (2603:10b6:510:1d9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 12:36:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 12:36:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 21:35:57 +0900
Message-Id: <DAQIIXV4SHGV.11VXZCUNADMX9@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Benno
 Lossin" <lossin@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>, "Ben
 Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Lyude
 Paul" <lyude@redhat.com>
Subject: Re: [PATCH v5 23/23] gpu: nova-core: load and run FWSEC-FRTS
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-23-14ba7eaf166b@nvidia.com>
 <aFMgLDfNKWPsSoD1@cassiopeiae> <aFMgiYzDXwHXVn8X@cassiopeiae>
In-Reply-To: <aFMgiYzDXwHXVn8X@cassiopeiae>
X-ClientProxiedBy: TYCP286CA0328.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: ede7b734-3340-49f9-5f5c-08ddaf2dd945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Unl3ZkR2dXd6cHZlQkZTUzZNMlRndFZMeGpBSDZmUlV1RzA1ZGpXNjRJTzAr?=
 =?utf-8?B?NFRER0RoSFFHSXBWUXNxWmdZaEdZTThoOS9acjE3aHNCdWFCcSt6NDJQY3hE?=
 =?utf-8?B?MnFzdlFZQXBQVlFBd2plMXc5dmFrenE3ZVduSVR0UFV2M2RkMjVrOHJqaDl6?=
 =?utf-8?B?VGYyemROSEpJMjdNa0hndHpBUFZ4QzJsTUhabm83NkdNU0U0SlQ1amphSVdE?=
 =?utf-8?B?UlpMVk9lV1BCZkpLeWlIWkp3SFJvTCswUE5IVWk0Mk9IRk12TEt4RGQrZzh6?=
 =?utf-8?B?c2xRTjhTOE9mQU9uQnVKZkZ3emY2QXFDVnUyV1FTeEhhc0dYeUh4NEYyYnFJ?=
 =?utf-8?B?YzdHNDF2d1JKWU8vUzFzamVCUjN4djJQTDlIdWpQNUdpTXNvWFNUcWNFK0c3?=
 =?utf-8?B?V3hwN3Rzb0tFVExHOTFIaWNjakNuS0FCR1FNeHRYRnZCVzlKcDVPa2xJazNP?=
 =?utf-8?B?NnNIanhKajFpcUxOYkFFZUp4YVZWdVhYUlY0SVVoUytqaXNpVE1rN0tIcFZN?=
 =?utf-8?B?M3k3TFhjVWVvcFlsVHIyOXhzNVdJRU1aM2xlOGdxT0g1bmJxYXZpNzY1MTB5?=
 =?utf-8?B?T29xeDcvS1FmT2g4Q2lzZjBNVVZaV3FKUXZHRVIvVmtzZWRLT2RaUnJaeGJm?=
 =?utf-8?B?Y0ZndlljYTRVcTdzZUZmNmFwTUwxSTZOQU0rZHJ0TUhzMlROMGN4emVqVUJ0?=
 =?utf-8?B?U1ZPNTgwVGswUUtCdkt6UkhwcFVVazhJTFNkd0lhTExmQnpIOTRKK2JUTHlJ?=
 =?utf-8?B?RkxicEYvYkg5QzJBZUY2VzZzZVVzVktrRGtCK3ZpZnRIMTlsWjdYWitDRkUx?=
 =?utf-8?B?TG82TEFPdytHMTlGNXJFSzZTWkxOdno1aGcrMnQwWElEM1JEaTQvaTBjYmRL?=
 =?utf-8?B?UzdKTGxBZUc2dW9KQ2o5UmlPcVZiQXRkM1ZxRWNJSHFCTTlSbGxJOXU2ZHFq?=
 =?utf-8?B?WEQvcXVybUloRmI3S1krQVJiK1grSWEzMjhMNm1ORHdESUFyOGhtVmZjZTda?=
 =?utf-8?B?K05xUmlNSzZubnRZSWdsSTJ2dHhuUzU2eHFQTjBkbGR1OXE2ZE5ibEtyQUJN?=
 =?utf-8?B?R0RZaU9aM3FWMjdGUlVJWWtKdWEyTW1UaHFvVUxKdCtoUll6NWswNytjYURZ?=
 =?utf-8?B?MzZsUnc3cVZ2ZU5yUFJEZE1pdThCSUc5Q3VYUG14eXpNWFZKQjJ5SXJTWHBC?=
 =?utf-8?B?ZW5NRlZQT1Fra0VFdlV0MjM3QjZWNkRjN2kvalBtRjJ4eWhmc0JJVHdBWmtM?=
 =?utf-8?B?RFNETEV4eVBxa1dKSmdRbENMUE9xWUxZZFdVVEkvUk5BaXYzc3Joc2lFNnlL?=
 =?utf-8?B?TXM1Q09aeXQ5bzhlR3ltS1V6RjZyQkJIZU9QekJBUGpOU2tRemVNd09uZHhr?=
 =?utf-8?B?YkovNC82UVZLRHFOSnRQY0dwL29Hd0h2ZExNZEVlUCtJRWJNZGtGMVh2U1B5?=
 =?utf-8?B?NXVYUERNa0N2RlNOenVNS0ZPWGxNUi8yRXo4bVVIUzJzOTFyK09CdnZCampH?=
 =?utf-8?B?M3J0L3B0MHA3eFg3cFg0NGxiTktEV1dnbjQ2Qm16OWtKSG5EZDVUTmtnc1hR?=
 =?utf-8?B?dmx3MFRvT0wwR2JhMGZkMDBQVlNaVU5ybUFiREM4enNXVFIwWWpNa3RSNzJM?=
 =?utf-8?B?SnJVVlovNnh4Z1BOUmNzQS93Uk1rN2xZT2trSTNSS3hVVDFaSGhHZ09PUnNI?=
 =?utf-8?B?ZjlORjFzS1dQMFRFakJwQktFeWppODFlcHo0RjVJQWNpMW5VK1ZNVHIzV0lD?=
 =?utf-8?B?MDJHaGlzaDRXRzgrQkVOYWFoTUtLRGU2TjBtSTdiZ3M5dVU2Qm1WTUxEZGtQ?=
 =?utf-8?B?MTJ1YytQVDJ4ME9OZ1MvV0VWRC83WExhUjRHekNzbFJxWEFuKy94cmZ2b2dR?=
 =?utf-8?B?MzM5KzE3NkxRV0licDc3U3c2Sks2cWV5Tng3Z3VRNi9JeHJkZ3JJcUM0NG43?=
 =?utf-8?Q?5j8ZBCakDTE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkNQM0VoZ0pTaTQ0SUVETmQyYUtoajRzMExoVVdOcUhyT3c1clhIKzJKNkdN?=
 =?utf-8?B?RUk2VGtGTWxSRU41V1dsY0Y0QktnNndkcUlkZ0FGNjU4MURQTjcycDBJNDNQ?=
 =?utf-8?B?UDYwbjRpY0dmQ29qOFJGdFFyaWVpdFQvcDI3NmVEU3N6VHpxaXZoRjlJcHJR?=
 =?utf-8?B?d3FVUFdTV2lMSjBUOE52UEZ1SmhUS0xhQ1lER09Ta1pBVFNhRzlyaStvRDNr?=
 =?utf-8?B?dVpQdjJCN0Y2K3BYcytJVkdnaEU0cFdsRnVVd2hsYzBQZHl0Q2pldjNlWEFY?=
 =?utf-8?B?eXhacXFDU1ZTUkRJWlhhWE1TT1ZnZmJVL2FyK0R5WGhLem0wUnI1eGQ1UWUy?=
 =?utf-8?B?TW9QUWt1dC9LMjlrL3VzSmZOQVEwY0x1ZFRkNE9MSjJGWTM1aVoxSmg1UXI0?=
 =?utf-8?B?T0hDRldlejNJaVpwUnl4SlVXalVBaldXNUVYZ3lTc09FWGFRa0wzdFgvYi9G?=
 =?utf-8?B?LzNyY0s3dFYyZlkyajArYXF1UmplbUIxQ3NYZzNFUDBFY1JHYW5uWWZEQm9o?=
 =?utf-8?B?bEd0MEpuV256YXBXaFVVU2VBWWxnMzQ1MHFNbUZZbGJaaE1CK2VrQ0lTRGhK?=
 =?utf-8?B?dDA4aXh4MVlSSFdNY0ZJblRpaVRIMDJwWkNyMUxKeUJJcmx5UXNGYlJycjc1?=
 =?utf-8?B?U1JGM2tWSUcvblk1WURPTXBoUWw2NmdsQ1hnVy9hWHUwL0dNRU5US09DWkxN?=
 =?utf-8?B?M3dnU1ZpTk5leThhMU1aalgvZU9Cc2Q1dDlyeHE2MVlxdFJYUThXQVRTT0pH?=
 =?utf-8?B?cW1zd1ZzaW1xaGFwck00eUFvUzhrUzgweDJMcVVyWnVFWDB1b1FLL0lReWlC?=
 =?utf-8?B?SzlKZk5pOGlIeFRLS3c3YmVNZU1DbS9IRVBKTllaQjh1cC9lM2JNSkRFUTB6?=
 =?utf-8?B?KzZzZWFCRWJCZkNrM1VMVFl0ZEtiOVc4VHRuRlBhTmRSVXAvbTlPOG5QOWxv?=
 =?utf-8?B?YjFGbzRQakdCdzQwVXg3UDU0TUlKN2xaUlk3VllrdjBQMWtSQ1J6alY5M2ph?=
 =?utf-8?B?cElIaGFnZVAzVVRJcTh1R2FOS3VVWk1ucVRiM0ZmVTR1MkJNcHhJeGNyUnlX?=
 =?utf-8?B?NVJDSFNpbmJzakhkYUl2a2cwRzVPYjI2RU5mYTU0N3A0cFcrSEoraXE3YUdW?=
 =?utf-8?B?Q1RZay9QTExYcE94SWpmTXRoL0tPRWwxVnR2aGYvV0ZxZmZpaW5pT1ZhQ0sx?=
 =?utf-8?B?aXhUSU0yV1k2eEIwb1ozZzFXekorNjBrUlp0ZmFuR1g5dlI5YXFhUUlVS244?=
 =?utf-8?B?QU1KSW1qaU9rMC9YNW5IMmM0eEtLNFo3d0RnUm1kdU1NeE9sTmp6ZkVCWTlB?=
 =?utf-8?B?SEVCT2pxdk9uRWlibmFDb1lwZTFZK0pHOHA3QVBMbUk4WTdzN2xsaHpFYzc1?=
 =?utf-8?B?UStOOW5tYzZ2VGhuelIzODJYN3A4R0g2aTVESmxLeTRRTE1MZ3VwWit4bFpH?=
 =?utf-8?B?bno4ZFE4V09xTE05a0NtNDJyazBVeGllVUFuelNBaUdGanJEZ05USHFrS2Nu?=
 =?utf-8?B?RGhvZDdlTnF6b3ZndjZIU3NPMGJtaUpXVEt4Q0VMYjA3RUhycCs4eldKZzBo?=
 =?utf-8?B?dmJLNU1YQjJnbkx6M3ZnOVJseThZSVN5SHNBSHU2K3lkeGJMaTZwSUdobEF3?=
 =?utf-8?B?M0QyS3NUSnRXSkZZRzJ4c0pOZExtc0thOTIzdjFkaWtwbnJaekEzUUppM0pZ?=
 =?utf-8?B?dVZtNVpkOUN4TW9pMmVMV3RFdlJiSVlYcGRWeEVUS3loN1FZek1lNnpNQUsy?=
 =?utf-8?B?OWRvSlM5MmhISU56VytFVTV5cG5xd1Z4blFGcmdVNy9BNU1MbUt0VWRiMUha?=
 =?utf-8?B?Wlk1dDZ3ZDQrNXpVczJsbEF5NjcxMTFIallpK0IvOFdHbEIzd2F2RXF6YmZH?=
 =?utf-8?B?TE92V1FsSEZaa3hDeUxqaVJDa3FRT1NTd1pmUG5oaHNYZ2ZKZVhmNTR0VDk0?=
 =?utf-8?B?YlBzblNRakxuTHZqWEF6aXpvV2R3Yzh2MHd3Y0ZsbWpvM0EydHJCdjZPandu?=
 =?utf-8?B?UHlhejZnRk5NMU9WcUhCV01ya2k2MTZzdVoxcEJ5NmRjUW4zc1RkYVRzVXR3?=
 =?utf-8?B?S2ZnajdZei8xeTJnZE5NMXBJSmR0RnNtdHM2WEczYTFzNDhDbTVtR0dkNTAz?=
 =?utf-8?B?MTdvMGhWMW1IdWRrL01aVHQzS0VaM2pZWDAvVHA2VkhvVm9mRXpuT09VUVlp?=
 =?utf-8?Q?dXC/Essk6X3+9Q9fhoriZ9g9RcA5CKn+/nl3ZwI0Bwkl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede7b734-3340-49f9-5f5c-08ddaf2dd945
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 12:36:01.2314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFOy1CdVxu4eoNK+hj3kGGoGhdoLqc0a4+TDpDrbWt0LM4RQ9UqAEvPoz8hg9aPQADgsfA726PlqJhwel3l82A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5997
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

On Thu Jun 19, 2025 at 5:24 AM JST, Danilo Krummrich wrote:
> On Wed, Jun 18, 2025 at 10:23:15PM +0200, Danilo Krummrich wrote:
>> On Thu, Jun 12, 2025 at 11:01:51PM +0900, Alexandre Courbot wrote:
>> > @@ -237,6 +237,67 @@ pub(crate) fn new(
>> >              },
>> >          )?;
>> > =20
>> > +        // Check that the WPR2 region does not already exists - if it=
 does, the GPU needs to be
>> > +        // reset.
>> > +        if regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() !=3D=
 0 {
>> > +            dev_err!(
>> > +                pdev.as_ref(),
>> > +                "WPR2 region already exists - GPU needs to be reset t=
o proceed\n"
>> > +            );
>> > +            return Err(EBUSY);
>> > +        }
>> > +
>> > +        // Reset falcon, load FWSEC-FRTS, and run it.
>> > +        gsp_falcon
>> > +            .reset(bar)
>> > +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to reset=
 GSP falcon: {:?}\n", e))?;
>> > +        gsp_falcon
>> > +            .dma_load(bar, &fwsec_frts)
>> > +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to load =
FWSEC-FRTS: {:?}\n", e))?;
>> > +        let (mbox0, _) =3D gsp_falcon
>> > +            .boot(bar, Some(0), None)
>> > +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to boot =
FWSEC-FRTS: {:?}\n", e))?;
>> > +        if mbox0 !=3D 0 {
>> > +            dev_err!(pdev.as_ref(), "FWSEC firmware returned error {}=
\n", mbox0);
>> > +            return Err(EIO);
>> > +        }
>> > +
>> > +        // SCRATCH_E contains FWSEC-FRTS' error code, if any.
>> > +        let frts_status =3D regs::NV_PBUS_SW_SCRATCH_0E::read(bar).fr=
ts_err_code();
>> > +        if frts_status !=3D 0 {
>> > +            dev_err!(
>> > +                pdev.as_ref(),
>> > +                "FWSEC-FRTS returned with error code {:#x}",
>> > +                frts_status
>> > +            );
>> > +            return Err(EIO);
>> > +        }
>> > +
>> > +        // Check the WPR2 has been created as we requested.
>> > +        let (wpr2_lo, wpr2_hi) =3D (
>> > +            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO::read(bar).lo_val() as=
 u64) << 12,
>> > +            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() as=
 u64) << 12,
>> > +        );
>> > +        if wpr2_hi =3D=3D 0 {
>> > +            dev_err!(
>> > +                pdev.as_ref(),
>> > +                "WPR2 region not created after running FWSEC-FRTS\n"
>> > +            );
>> > +
>> > +            return Err(EIO);
>> > +        } else if wpr2_lo !=3D fb_layout.frts.start {
>> > +            dev_err!(
>> > +                pdev.as_ref(),
>> > +                "WPR2 region created at unexpected address {:#x}; exp=
ected {:#x}\n",
>> > +                wpr2_lo,
>> > +                fb_layout.frts.start,
>> > +            );
>> > +            return Err(EIO);
>> > +        }
>> > +
>> > +        dev_dbg!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_=
hi);
>> > +        dev_dbg!(pdev.as_ref(), "GPU instance built\n");
>> > +
>>=20
>> This makes Gpu::new() quite messy, can we move this to a separate functi=
on
>> please?
>
> Actually, can't this just be a method of FwsecFirmware?

Yes and no. :) FWSEC can run two commands, `Frts` and `Sb`, and some of
the code here is specific to `Frts`. The code that is not specific to it
(loading the firmware into the falcon, booting and checking MBOX) can be
moved into a method of `FwsecFirmware`, and it makes sense to do so
actually.

All of this code is going to be moved out of `Gpu::new()` eventually
(i.e. the follow-up patchset), but we are still figuring out where it
will eventually land. We will need some other entity to manage the GSP
boot (GspBooter?), and I am still learning which parts are common to all
GPU families and which ones should be a HAL. So for now I'd rather keep
it here, modulo the part that can be moved into `FwsecFirmware`.

