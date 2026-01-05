Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150BECF4989
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B4410E14A;
	Mon,  5 Jan 2026 16:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="JOcwwgMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022141.outbound.protection.outlook.com [52.101.101.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B239410E14A;
 Mon,  5 Jan 2026 16:11:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+z+pSWA6WFVbfFonj02y+ect/QAS3SEv/OeoRYTRvlnfNtanxpJxftf7xJ2+G2WS+OMnbKOXeiLx2YonIzT6arbHHEy7p/5Org99mUqgw5ziKcrx7jYC/MT06wLp63tFn9bB9M0k1lsWIn9fJBTXGtAHFz51h+ptha7tcA5KJ1OzRORZosXumz8pfAV62wYDP/0U+mhGd4w+CFO2gQitBGOq1ujhjMl8ZjxcCnJTJ31VTCsr0uP2fL83/SObZ146cLmjNbXjMEFWbW9B45ntZF9A7u36u1BPNsI7UH7PAspBF1OzHWtWe1rW4KSiKA/JSn93BUhm+xCYOb3PKE2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpiTEAo/Wv4ppl4Rxv/TGckRIp+5dSDliQlERHSmGsI=;
 b=uHjlPIvGjz6t/8GywWvytJ7i8NRYaU65RTEtEfP5A9NU0chvp82g1eayD18TJwqnb9z32ryW4OhgTngiMman5s8YClxgj72ZjRsKGsGp7DUTGGhi5fgn1jiJJu32UjwAXiOVtISSQh8zMoAvbqZtXzADVfAvbzykh7wxcKYLj/X2zLnSPFm+MYDpt4H0WhUeUDdn56zdeA8aFTeB/PeJioJ9lRYi6Ebb2s4Dpn5vkktZE7OVQcpWGCdwkfChSdgAEM4xPh+nf6U/vgoRGnqVuUDARpz4QEB+zWRQySZVe/bOZ1fQsadC9XRFE+kWx2Q5AdLATVwH2uvpsjy0hY/B7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpiTEAo/Wv4ppl4Rxv/TGckRIp+5dSDliQlERHSmGsI=;
 b=JOcwwgMAjHUwz8I8ocgJtau518ALQ3kd4fnM/qI9zJlx6UlAau2oDY+fCfe/871sQFyevjGmjgsIoPTwOFknxEDPPxN4kiPekJsweb/m4esWicvB4Nh03f6J++U1jx18cRFhHuTb49TiAV1f+52BZKMCRViB4tR67YF8YgGGeNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3058.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 16:11:12 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 16:11:12 +0000
Date: Mon, 5 Jan 2026 16:11:10 +0000
From: Gary Guo <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Benno Lossin" <lossin@kernel.org>, "Maurice Hieronymus"
 <mhi@mailbox.org>, <aliceryhl@google.com>, <acourbot@nvidia.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <ojeda@kernel.org>, <boqun.feng@gmail.com>, <bjorn3_gh@protonmail.com>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
Message-ID: <20260105161110.5d1ab548.gary@garyguo.net>
In-Reply-To: <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3058:EE_
X-MS-Office365-Filtering-Correlation-Id: 587a6465-f759-4a9a-8a41-08de4c750bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q862y3c3myUji1/KNfaz5cMydICT9Tpjla3rpuutLqiVlA3pwq9hAyVqDNZ3?=
 =?us-ascii?Q?ppj2n2ynd9hPOfkMdi5LsnaBzW+jTWZdc8ktq8npXdXv2UYoZSayBkNrCpt6?=
 =?us-ascii?Q?Ey8GXyiKZTMe165pnvXL63kjPRY5fjqtb8qZch6PPd43QnvCdjTGJaG+f2pN?=
 =?us-ascii?Q?HM8WpnK/FRfy17Cc07Yxe9OTpyhH4pbAdTsTbGT90ET4693BQZBzNGWm/kYh?=
 =?us-ascii?Q?GHoNQA47Ta+4qldrbjYPoH3M6p6KdmwdGdYtPMAptD61hacCdpWJyCdKqpK+?=
 =?us-ascii?Q?OYPZyaaeP6Umflp6zWZNRTy3wRcV8Jv16cpFTzVW0Ghr7yOa5Zf/cKrZsSBC?=
 =?us-ascii?Q?l0tecHcCG/Hk3vf1ocmRJ8lUlJlhiKWTgPpL138QZUgwU5t0B04i9rF4j/T+?=
 =?us-ascii?Q?1I24ryP1aGa/z6tdtkqF2QUcvzc3KQO4AFwxEM8n4ydEMhThXpYt7p6jwcB7?=
 =?us-ascii?Q?rcq6CIdj/IjanQxucjMXWPqPjNgUgiLWsgip/+QtiSMNumnyGZ5AwoM6hBo5?=
 =?us-ascii?Q?O66O+hdzSpOZ2W410D7qX7DxIzi5KE1iMSqJvg9T5wjSsAmy+YPSddNq0McZ?=
 =?us-ascii?Q?U2ZxKAHtK4GtI4MqVjfjEuvu2Cx3YThzc6ybtOIJ9P1JlgtyUpPU/120bajW?=
 =?us-ascii?Q?ukqS2tROl+pT6QiuhabElTVdI+NV/8eAUliAvwEQXDblpmrAuDenaFQCA5Qv?=
 =?us-ascii?Q?oEL/FU1fpxbSa+cC4LqrA3PWW3CGYAOpND1kiciXmstywXFsoVr7mRtJOonw?=
 =?us-ascii?Q?REWbvmEuwiJTS8UZGkUqv9cA7v/92/6klSVMiAaBjOj4nbokr6QD6Sp4ws5P?=
 =?us-ascii?Q?M05ImQ/nvT4JnHye6leZ7jIxMKkh3e514xNoamD5viiwFO1veM84I5o+WSDL?=
 =?us-ascii?Q?A04u1BvGt6BKt8n+LdM/8K9k2zUmbncVUGQ4POq68XXBS63IlAuCgU3Ji+sh?=
 =?us-ascii?Q?RhcqIvwyfIDkF8XlvqXU5mU3L72dy3FXAZWXYWvrz13GBMVEizTqXp+ZCOHp?=
 =?us-ascii?Q?63OI2+p/57P1GaYQHKIx64uspD81iYAAIu6eV/MPegUpKKL11zwb4zcYQhps?=
 =?us-ascii?Q?1FA05dywfTQ3D7Vy5FeLUK5pKXTlGU7tAoLIRK0RbzJzJu5KRW8YjHcbZmIo?=
 =?us-ascii?Q?q1Ue4OHo4EkUSPR0qpy+s7J8hq4FFpCesO93PQT6Wmw/GtNdqHzH6V541hl+?=
 =?us-ascii?Q?aX/N+Bsm1xFfoAE2lRHgIf37rodnB8jSEoaf69cbbyLTucVsX/2n9k7STb+B?=
 =?us-ascii?Q?IoN4jPhEsGSJYR3HcwIMDCzLiyuhCVYbQmz6jeKSSyrILdk2yKkLhHarD2BB?=
 =?us-ascii?Q?B1nKixyvXCal+ObT2Xn9VoscZtdpbD3kSfLE/LdlzIXfm2FdqrSv0lne2bXg?=
 =?us-ascii?Q?F4pb2VFPPMaSXX3Q9gGBN/SvPZjbVbVc7zhq+QFZJZf5NW2DVFCsngzEVPpl?=
 =?us-ascii?Q?vwte7khlrPxKvcdse3wmVFlEMnEsp+we?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VVk5pFF2iuuxwKEjbf7HE95sOglzgIjKG16eW5HkiCsTA2VXMYsMC8ne5LQq?=
 =?us-ascii?Q?Z5hDp9PerzU35UTah3s+bODu0Z/AVcOeHiOOCrXW34c9S6DB2axGVny82VdF?=
 =?us-ascii?Q?OhmXgveK6dsEypH+CAhWhmCNI+dq+zDjl2jjxsPepcdeW/UdEs72kzeDJ868?=
 =?us-ascii?Q?CIqMaMECdIc5LZmZoKiErbPaE6YAj39k3AIXG3Y9LsQuigrhb/Ci1mDxbjdE?=
 =?us-ascii?Q?jj9Ev3WNjlG+OBQ9nVV1ntaexrkxZWgvxUzcVyEy93wAfNgGnYo7nhIgQ+D4?=
 =?us-ascii?Q?zkI0jeiaYtDvujuCVKui2wgkY78WgNjlRNxcIfkyBMLhUwL1HxIzRDMJV/64?=
 =?us-ascii?Q?v/dZMeYv4NXpgUmU/keHAq1HPVzyVElMbuXaI9awHTe+8HlLYVUXwOyGBRtM?=
 =?us-ascii?Q?HkNwjLZVtUzpw3525MwsALVl1s6YXfKcDzrjBgfvcyEyWcxQE+NxxsdTtvTU?=
 =?us-ascii?Q?ftwI4xRuUP8mhYAKAZCk6aQ5uZRUX+YSd7aVYlG2bEk/lWnptai+LNRsRXUf?=
 =?us-ascii?Q?1tUWt0CTRqs6gwUCNHaRPXu50yq/IZGePK/RMfWkj0ft3uoocpM93WSDzo00?=
 =?us-ascii?Q?zeDJvZW48wY8uRloR0E63eimafHiEpMB7DAhqAQsRQXPcA5dozNoxVRf8jyJ?=
 =?us-ascii?Q?TXWik32CyJ6SCy4FMlCkXY5UjKp8877H+bfPHuQwFKWP9U8lv4diTrm1cQvb?=
 =?us-ascii?Q?C4rIt9tFbF9d8OXrClYZC4cCKDdOp1FYuiCrefFMus9VfifWXxtDq+St0Gno?=
 =?us-ascii?Q?sbzlOF95dm8kGq2C4VQcMIZ2I0R7h9ulVzbv+wcy+1w4jR9LaFGKRoEsUsdp?=
 =?us-ascii?Q?Px62xcQ1HcTgVxfZV08N/i3a0/JTo8J1MtXOBlATdFAwf/1cZAkIbupHwplB?=
 =?us-ascii?Q?fxcXYwo4DrI7RjyuPMxN4EjMYTqI4NfauqTRBLYMeBz9V2ODFDXdyMDvy9j0?=
 =?us-ascii?Q?9AvAc/5wOlWApT0tHirNVMlS1r+DMv+sf2G/hNbI33+SNpJmnJF4ETir73ZA?=
 =?us-ascii?Q?gqSozqZZ63t2MfV7xClCxYjom+Evm00CywV+wMbvjHIQ6rXKYkzLx7LSVCxe?=
 =?us-ascii?Q?BBCkWrLQQDdxh6+waM2TvBBAHTrvvcviAOVOiB7RmwV06wEHxKzDIuPZEVO2?=
 =?us-ascii?Q?+cORSTLAjzaAv91YKS2Q7IRf8E/tSsGDbC90/bFg9OtC++46UO/ZSSe95LTu?=
 =?us-ascii?Q?PUnM5M3VKe0bSlRAeVU4tY+vpFhZzwZQiXqNPYaxe2ZswAi41CEh+HKeeyVC?=
 =?us-ascii?Q?zjxJ2vhRoImV5iv80EvcJ/Y50FtGC2hI4n4S74IT3ljz2E9fHbBJvzLUJqXD?=
 =?us-ascii?Q?Fzaaj1BDAMxr+XmJJPXF/Fr9Ai4I23LPSsL2I+CNyNTIY1q+XV9qFLVEkkg+?=
 =?us-ascii?Q?6LBEQ70O/Knu9LjDfrgGQNzNShDDrzjyG3JKO0DbtECP8XzgUWCzYXxm30AL?=
 =?us-ascii?Q?0dRs5cdAKntzPbcEnp+sw54GKR3rjvchBH20U7G/ZJI3c0CKlcaYkUoiAkqV?=
 =?us-ascii?Q?t5c867Cmdtua/ms+InOy/LFgV1qwIYhmo7FXQXWd86QTQBVBDSmkUTFQzFOw?=
 =?us-ascii?Q?Dd319F62HTwjRzEnIQYDAuBkFKlVkVD4HfJm6Pr206S4ksbXDKyUCeQ9IGOg?=
 =?us-ascii?Q?z9qTHCVSGBDXC/NC2o5csk/cY5cIfXqyVLE36zOjZu0z7fop+gpyDT0FYwdI?=
 =?us-ascii?Q?K1N3yDd5gbqbN6JhxSVlWnBUk42sNAbmD+4bH6hYLHGslNo8qWpsaiTXlGW+?=
 =?us-ascii?Q?sgonozo7Sw=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 587a6465-f759-4a9a-8a41-08de4c750bae
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 16:11:12.4947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNxKXc2EGuSs95GasHp+I40NMmZ9+mPC+v81zZFAgAboUzGxA9J1pxtKkcdnx7yau2WOBa71IwML5Hd3r7yWDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3058
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

On Mon, 05 Jan 2026 11:29:04 +0100
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Mon Jan 5, 2026 at 10:02 AM CET, Benno Lossin wrote:
> > On Sun Jan 4, 2026 at 9:07 PM CET, Maurice Hieronymus wrote:  
> >> Add a derive macro that implements kernel::fmt::Display for enums.
> >> The macro outputs the exact variant name as written, preserving case.
> >>
> >> This supports all enum variant types: unit, tuple, and struct variants.
> >> For variants with data, only the variant name is displayed.  
> >
> > I don't think we should be adding this. Display is designed for
> > user-facing output and so it should always be carefully designed and no
> > automation should exist for it.  
> 
> In general I agree, but simple stringification of an enum variant for a Display
> implementation is a very common use-case and it seems pretty unfortunate to have
> to fall back to either do the below (especially if there are a lot of enum
> variants) or having to go the declarative path of doing something as in [1].
> 
> Especially in combination with things like FromPrimitive and ToPrimitive it gets
> us rid of the cases where we need such declarative macro mess.
> 
> Eventually, drivers will most likely implement their own proc macro for this or
> repeat the declarative macro pattern over and over again.
> 
> Maybe we should just pick a more specific name for such a derive macro than
> macros::Display.
> 
> Maybe something along the lines of macros::EnumVariantDisplay? We could also
> have an optional argument indicating whether it should be converted to lower /
> upper case.

I think the proposal is reasonable.

Being able to print enum name is very common and this is why crates like
`strum` exist.

Perhaps if we want to make user having a thought about what names to
expose to users, we can have the case conversion argument be mandatory, so
they are forced to make a choice rather than blindly stuck
`#[derive(Display)]` onto their enum.

Best,
Gary
