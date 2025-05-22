Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7099EAC0402
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 07:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FAAA0979;
	Thu, 22 May 2025 05:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PfurQ63x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20657A08A4;
 Thu, 22 May 2025 05:29:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czxqXm3F7mve1SkWOHAIZDK+eVGICHVNu2Q7H0h39LhtcuudCfVao5h6/Sg1ub0xjOAZkSu44k8pFACkKu/o7VKViLesBXFB3nHS2FSiUMegIFmDj3i5TFyiIYxUVJ51tjnajZArAfCG9J5BcltielE8QH2b4DoKrdAOr+FaIo9ZATM3/Yeuusyd6emwBf63kbLgGx2IybqY/LlX7wscAtp/mepZqHj6R3XAuNtKNrqr/k5RQD26kdnEJ4rH0rF5yNK0ajwRYUP06RiDZZuOAHYVazfRMek5CsJ6C+KGNGiQayjoCvaNymtmimi2mRIgCIKh+0ZAAwKzEWq5+20URg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmnk97MJ0O0Bf8aIMmwoUsqlbaVaEGu8xj4mPctVwGo=;
 b=OQaCJ9KJGBN9EGzz7EjvKtyuUWpucvzkHZqSuV+pLhnkqty7YjDYANEPyNnDgZDFFi0oXlM/9nX9v5E8vLWGAnLBHIk1H8/y+6nf3UBAIWLshMSvRRjCVW+m43EUdcT3k+IzbxE+6JTri8LPHnsXg0B4nmFuxkgHR4VvH9Aj+pFY612SeDCFmsGxRU3/CZ1ss2gNVUqmcCIw8+5uUbD+7XeXKwtEbv/mwz6heQSwXusoYsT9Tb0K3QY3GnPQ8+rulOED1/7Ls35OQL2Lbn9m2rfUR3VT8qElPs3WclQYwHpxBVDIs4gBrWHVPxTTu/UjwX5kzIef6NrrLXCSBPCVBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmnk97MJ0O0Bf8aIMmwoUsqlbaVaEGu8xj4mPctVwGo=;
 b=PfurQ63xeGaxpo2T+c3JbNlqfZJVHqe/V0Ear/zwdCWmTzjiV2aO/1zfjgT2gQ3fTEWMeEm3RDZX4iS/lMP0USHWWb9VICLcntZ89482mN+j/+8CMiMdmDrg6PB/zZ/uZs9L04O7D3rZ0xL6AyJrdx9FdCBR2wEhyh978gusuMn01ddew+iSN2xBd0eBB53Ajv8ucFRfK6SNEElzcCBFHAHXgkfXU3qNgXF7XiYGKuSSL5/WokAf43MIqrOGbP5TNjY3TAImXmgj3fzQ5Rrg2ZLgWPXJXJr64uFdnTK9688C4yYzOga1RmT3MNjWG1N4BPYpfAgpHYb1OYxkBxocGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6536.namprd12.prod.outlook.com (2603:10b6:8:d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 22 May
 2025 05:29:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 05:29:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 14:29:35 +0900
Message-Id: <DA2FX8C1HZ59.13SM6DQ1JVFQ5@nvidia.com>
To: "Boqun Feng" <boqun.feng@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 01/20] rust: dma: expose the count and size of
 CoherentAllocation
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-1-05dfd4f39479@nvidia.com>
 <aC3KbKeEVlHggi5l@Mac.home>
In-Reply-To: <aC3KbKeEVlHggi5l@Mac.home>
X-ClientProxiedBy: TYCPR01CA0098.jpnprd01.prod.outlook.com
 (2603:1096:405:4::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: 458ff2f0-eb33-4820-fc4c-08dd98f1a4ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGhGaHVGSDdSYm9PSU5sb2ZsVVhtUHA1QnNrTW9lcU03dytIVGcvOWtKNnhv?=
 =?utf-8?B?b2xLcDNnY0NlOXdTU3drZW56a3F2bStzRUlUbWx0dFIzMlhDenI1N2xZL1Ux?=
 =?utf-8?B?MUpLOXBkK0ZXdmd4SmdYdVpaMElleXpFSFV5aHltaXQvS0ZlVWlVNGJFKzdx?=
 =?utf-8?B?UUNycG9FVHZXdkxNaXh2VTRUbzBJZWhBZzR0Uk04UVUySDJEbGY1MjlLMGdt?=
 =?utf-8?B?d1NDZlk2YkpvZ0laZjJvei9mMDQxWU5zV0pCTHZSRTZ1dEhjcGRMVWxYRlJv?=
 =?utf-8?B?UjhrOHE2cDVVVk5nL0FlS0cyakxxMVVoOHlWSi9IeUd6S0ttSVNpbFVOM0tl?=
 =?utf-8?B?QjA3OEJQQWZsUFFFeHJ5ajU2QVEyVGFNTWg2aHh4MHFoQTNEbmtUME8zcWNi?=
 =?utf-8?B?NnpRckR5VGhoUTNGVzVJSzkrUzkzS1FnNXljVXdGVFQwT1BXS1YwbGdFU1NN?=
 =?utf-8?B?TnVGMDhzY1hFS2VPWTZRYVdlVmdNdHVpNEprMFlKRC9QaTBQYy9RdlhiNjQz?=
 =?utf-8?B?U25QRWNhTmg3RHQrWUZra3JMd2hyNXR4ZkU0VTJLdFlBaTlqditSRXdZb29Z?=
 =?utf-8?B?OGlmSUgyVTBkUkgyS3ZNaGZ0OWlnWWQxSk1IUTdOOWp2T1NwRmJuM09yckxN?=
 =?utf-8?B?d1BZNklqZ083MExteHVCbkM5dFNQcmU1SU1lOGhsYTRyK05SY2RZbVRaUFU1?=
 =?utf-8?B?MWs2U1FzRE9IVzlZdC9KNkpMSm5NV0pPWnZ3K0ppdjl1dXNCZUUzb09tTzlo?=
 =?utf-8?B?cHJDbmdxVlExUUdIQlZkODdXakUwQ3d0b0RLb0x1a2JSRmlDK2ZGY2RQeE9Y?=
 =?utf-8?B?Tk5mVy9zWVVsVGw5L1FuRGVvUHk3b0t0RWNjVEp3U2taNXhEY1N2QUFpQ1Vt?=
 =?utf-8?B?U28zbzNIeHA3c3R3RzI2UjkrdzM3TTV5WVlHRlo4Y3ZnQW1xNFNQRFlPWlpn?=
 =?utf-8?B?WlVtNjUvMXdDVDZKVFJoT1M4elI2WVVaYzVyZzBNNVJLWDk1MkYwYXpiODNy?=
 =?utf-8?B?V3BGbStwOXJ4eFEvNWx4bkhydWdXT2JkY1V4RWxqdThiYjE4UytIMXQvS3Rm?=
 =?utf-8?B?b01kQ2I3ZmllWTNnMEpId2kvS2tVanFBSDV4UG5GSGV3NVFXU29YWVFMS280?=
 =?utf-8?B?RlJBWkJpYThULytiMjlNbkM3ZG1kRjZ6L1V4VU45b3Zva2NqR2IwZS93cGNr?=
 =?utf-8?B?MytLYkNSR2xwZ2t2dHI5L2dHK1JVWFMzdHZlZHYvL3JRK00xT1RLbW9ESlgz?=
 =?utf-8?B?Ym15SW81cGYrNW05dWdPeWNzdDcvY3A2S3V2amVrdDdOQ0xoMnV2UXkwZW8y?=
 =?utf-8?B?TkpQcjZ0K2JubUVyYUpPcXcvODczdi9WeXoyeWgxTHZNMVAxanVCdXB5eUVs?=
 =?utf-8?B?OGdSZ002ak9DM0tDQkhFSmFndHZ5UDVGZCtPb29QVEZsanhKbHJlUDRvT1pN?=
 =?utf-8?B?NDhzZ3RXRkoxcDQ2dmJyKzRQbXdWcXI4U2o2UTd1c1pqaWpJeCttZkI2Q2dW?=
 =?utf-8?B?bExxd1FiYUN6SyswY01mRlo0aVpaSWU0TU1KbWF2ems0RG5NcU53RWlIZXdW?=
 =?utf-8?B?K3ArcG9CVnlFSjdSZjF4dkU1NUo1MFdTWnJic2djOFFWV25Bb1R3c29UdnRC?=
 =?utf-8?B?QktZejFYUUpuWjFTUG9jL2RVdzJxc2tBaGdBdElOcXlaM2F5aHNNMG9ORXQv?=
 =?utf-8?B?SHBraXoxTUVSemR1MHhVUnFRSlc4VHRiNkhIdFVWVmhVdlJFZ3RXYnBnclVP?=
 =?utf-8?B?M1hGaHBFak9Fdm1ZaFBBdDlrbDkxbU5yMWM2K1hmVkI5VzdwaFlhNnFxbGZv?=
 =?utf-8?B?enBWKzZZYkJkN0I3MUkva2ZhNkl5cGFPdWdZWDdQMXRJSEZVOUpyT0NWZUEz?=
 =?utf-8?B?QmNmSjFidG94WExiQU9DNUxZV0ZvTFNkM2EwQVIwYWpDbWNJZnc3bGdDbHBp?=
 =?utf-8?Q?tuI4cDnnA2g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2c2eTlqVWtWK1ZmMzZ0aVRpL09iR2N0bEFxL3ZyanZUTXYwbXRPV1VNNXo3?=
 =?utf-8?B?SEZzRlVnOElQRlhoclRGWkR4RXNuRXcrT0FWb2tOcFU1WjZWUUlsVjBLckFI?=
 =?utf-8?B?ZnFaWTNsZkQyWG5OY3NIZU93M1E3Z1pIY1dTbWVXVktQQmxybVQrZTYwSlFO?=
 =?utf-8?B?UFpQYWhscnMzNE45L01wQzBmK1JCbWQ5UUpEMEhscTFTMDZHQnNYbVRjbzNz?=
 =?utf-8?B?blY1QjNHSEdVdjY3S3RhUFJIRDYvdW0wWXRzeWFJd05Ha2VvelZtZll3WUFk?=
 =?utf-8?B?cnR5MWl1NHV6b3VncFVnbm50UVFBcVNMYmRSbWtyY0pNMERBK0pFcnRyY1Jm?=
 =?utf-8?B?OUZLajJwZFdmRVRYZnFNYUEvczZxSk50YjZtaVdjQ3VwSUI3UHdwOTdYUlJj?=
 =?utf-8?B?bW9QeEQzUnRBeFJXVWp5UXU1YmhUMk9VWnhmVC9iNnVXZkFmQXBpOWU4c0gx?=
 =?utf-8?B?YjJtaFdqblMxY2huY1lpbXNwZVRHVWx5clNUQTRCY2lHdnV2R1dTaHFyK3du?=
 =?utf-8?B?cUtZV3M4eGs0RHdDdFc3L05WeW1ZMHNjT205bFpNMC9ib05ONThoK2RPUWdI?=
 =?utf-8?B?VWNacTh2TkVIOTBTZXBIdWIwZ21uZWhYV3dHRkx0NkVGdW9DOWlJTGx5UjhY?=
 =?utf-8?B?WFBqNEJWaVkyTlhvZWxVMVZpRGFJUDI3WEZ2ODlIK25ocEJyZnVPTUNZUWV3?=
 =?utf-8?B?VGlCN1dHN2xVQlVYY2JldUtqNlQxZWc2NmI0eVZJdmlkQzdWaUhKK01JN1pZ?=
 =?utf-8?B?S1lFVDFwUDBJVEs0dXdkeFZ3Wm5NZUI1ekV2TGI2UHRCNHJ6ZzFBcTJaQytl?=
 =?utf-8?B?VjBxSmlkd2xEbmxrSjRMdnNUTnlsOHV5bG0zZmYyd0R6blA4TlhQa2tmeFFK?=
 =?utf-8?B?S1djR0JnZEt1dlRVVlhmeTlKOWJjcjRsVlJpN1Z3NVRKeUpKR0R2UThhR0pu?=
 =?utf-8?B?dVg2SERMVlY0c1VKVEl1b0NNSUo2SFZVS05DL3RrVVlCN2FPTUl6Q2tSZHNY?=
 =?utf-8?B?L3ZoMlN3OEpVbklWQmcrMUhvYWx2b3VTVUNOZmlTbWV3OWZETHR0d0RGMXl3?=
 =?utf-8?B?ZGRSUXB3THNPMEMyRzcycG5kSFZFOWZDMnN1TWRjTG9SUWc0bHZDbk9Sb3lG?=
 =?utf-8?B?MGZqdjEyUjNIQ0ZnbEg5WG91cWk1STg1SUNpc1VobjdacVJTMzI2NVQxOGh3?=
 =?utf-8?B?NWovOUdsajJHTmJua25GanBmZXlXNEtHVEwyUXk2Z1NzUUN3UnU5NGNjZ3A4?=
 =?utf-8?B?Qy83R3RZNXViNWkxVndRZDVKZWJEcnJ2dmZ3VEQzNVRHVldhUENrNjFPL3kz?=
 =?utf-8?B?WkF5VFRGa1NscFNSeFU5U1Q3bHl0Mmk0TlN3MHV2MUdNaDRYM09LL2ZCVFdC?=
 =?utf-8?B?T1Q5RklnVnN6Q20wT1VQSnYrRy83L0paQ2pwNXRCQWQ5K25XckdVUGNsNkNH?=
 =?utf-8?B?Qjh4SEhMeGRYQWVUc3U0bm0yM3FuNVVJZGhpcnZwQzJ3M0I2TXhlbFNFZ3kz?=
 =?utf-8?B?dEwxeUNtWlZybkVTcVRIVjNBdit4VjdQUThGa2VSUWt0eVRsbk1BWnFRVlg3?=
 =?utf-8?B?QVYvS3dnK3kxQVc5b0l5SVMyOUdUUHFyNXdkOGd5NWNZdzVmQW56MGpZYW5M?=
 =?utf-8?B?UW45cFhQWjZ1ZjRhV0RrY2lSR1U4R0JRMjRpakhGek53Y3puc3A0WGdxYUFu?=
 =?utf-8?B?TExtWWhGM3dMclZhdDdLSVhUVkVJLzY2ZU5WSkpqbFVOYm1hVWZ3N2JpTFg4?=
 =?utf-8?B?U0Yxc2YrRWxXZlA3a2dLd2lUOThlMkpSdWZLSGlwUEkvZXdEWnh2N2RYSFYx?=
 =?utf-8?B?eFdsL000M052L1g0c2xoT2hreTVRNFcxVjN6a2Iwa2dyZ3JOT1VrbkhlRkxB?=
 =?utf-8?B?NFNuTjRqQklaUzFFRnFXcXBNZVlkNVNvTlhoYWpXQVlUdWhZUmQyWVNXU2cy?=
 =?utf-8?B?UGU1TkpLVkpIZUozOFNNNlp1dHhtMmdmRWFXT1V1UGRNNllFVFJaVW1FM1l4?=
 =?utf-8?B?N2NaK0g0bm52WU1OTFE0MjBxVk9LMmVyaHVFMVJUMHJ4cTF3Q00zdWJJOEpu?=
 =?utf-8?B?OUlCUnV4NUJyZys5MHhMTWNZZGZXVU94RzZaMEhtUWJMN1JveWRmKytZb0JE?=
 =?utf-8?B?TXNNTEhWRDAwMlZ0TjBRczNVQ0xoQzFSazhJWE1QU2VjaGF1TFVKcFNFNm1P?=
 =?utf-8?Q?Iu64a1U41Hq8GSL290RDNA6jgKedxqjyCSD/q7sPYilf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 458ff2f0-eb33-4820-fc4c-08dd98f1a4ff
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 05:29:38.1364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9IQy/CBUcIjxZ54KF98XAWeLPZ8d2AmELaQNBO2MOBjgV+3l3P+Jy8Owh2L4UnrDblcqaNnocGXfXKD+tkf7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6536
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

On Wed May 21, 2025 at 9:43 PM JST, Boqun Feng wrote:
> On Wed, May 21, 2025 at 03:44:56PM +0900, Alexandre Courbot wrote:
>> These properties are very useful to have and should be accessible.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/dma.rs | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>=20
>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>> index 605e01e35715667f93297fd9ec49d8e7032e0910..2a60eefa47dfc1f836c30ee3=
42e26c6ff3e9b13a 100644
>> --- a/rust/kernel/dma.rs
>> +++ b/rust/kernel/dma.rs
>> @@ -129,6 +129,10 @@ pub mod attrs {
>>  //
>>  // Hence, find a way to revoke the device resources of a `CoherentAlloc=
ation`, but not the
>>  // entire `CoherentAllocation` including the allocated memory itself.
>> +//
>> +// # Invariants
>> +//
>> +// The size in bytes of the allocation is equal to `size_of::<T> * coun=
t()`.
>>  pub struct CoherentAllocation<T: AsBytes + FromBytes> {
>>      dev: ARef<Device>,
>>      dma_handle: bindings::dma_addr_t,
>> @@ -201,6 +205,20 @@ pub fn alloc_coherent(
>>          CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0)=
)
>>      }
>> =20
>> +    /// Returns the number of elements `T` in this allocation.
>> +    ///
>> +    /// Note that this is not the size of the allocation in bytes, whic=
h is provided by
>> +    /// [`Self::size`].
>> +    pub fn count(&self) -> usize {
>> +        self.count
>> +    }
>> +
>> +    /// Returns the size in bytes of this allocation.
>> +    pub fn size(&self) -> usize {
>> +        // As per the invariants of `CoherentAllocation`.
>> +        self.count * core::mem::size_of::<T>()
>
> I think we need a comment or even an invariant saying this multiply
> cannot overflow.

I'll add the following invariant:

    `size_of::<T> * count` fits into a `usize`.

and refer to it here. Does it work?

