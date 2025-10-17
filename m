Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57247BE6060
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 03:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6BE10EAE6;
	Fri, 17 Oct 2025 01:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F8pos+sZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010066.outbound.protection.outlook.com [52.101.56.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C5E10EAE7;
 Fri, 17 Oct 2025 01:15:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8L3Fy+JRHNaWeMjLAwAHT9+LwlHiz45gN5SZEz8eJIc7YWyK36PJ/flVa5pp+LKGbbkIGwuqWxKpZPdzqo5ymRPW92prJ2NO6LNFYCOyRR6sKLG2pyG1vSdsZPEoL1Dk1/5jl8ClBo+dfQZJ4/Lug37dtZHCE29/vxBn2UlDBsyt3jRny3QLT/YznBnj9ayvg8egxXRGdUWc9m/5e9JsIzadPujXKz69VhoaWnrFNbWH/QkAUoRa/Gg9JPeCK+QgdjEBYr5x8H4ry0HIu9H138XofhIKiOnt7dahu5d6EVruUUOGz1UIG52ztYdC2CXcQ/IRs+0Cm9WbCylFxk1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QQQLZ6dx2PN7Ppr3TdBg30rT2sqaQjDzGXVqSDFqD4=;
 b=Jiiu4Nhn96MUsOiP/nlfrMns88nQ+fx9Hx47pBprf6BOo66GmNbYoxlMe00/ZrYKwjV00cBSz64m4dSNIDuWPdGe4wPLRfReGnrya51vELoaN0oNzObQuJaTlQPCGIsVSa8obKCoT0Og2zF3QbD3aJ15nMbpdUNnbMVKZCOKX1374wXFcIEOmtMXAOMH1p6XMR1YCFmVt7xOcx6MPxV8F6G13EyCdx0BBWOA+GZgb16lGTXPNY+K4Gp2x5XpZQ3rY7ixE0oAvmtPF2Myu1fkQ8htupSsJYLojUHzFuRGcnDsCF1dNxmR2C6ESIIQvv8+jizBkR3iWybDBlTPKbMTIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QQQLZ6dx2PN7Ppr3TdBg30rT2sqaQjDzGXVqSDFqD4=;
 b=F8pos+sZ93S3fPHd1VMiSRomeN6IFBQ2erOraXz9EGBfd8PNHHmOYfXQumOS3wsUJP4w24jzNiVo4sdrq8KbZm0KITvsh/m+SfVxXGgxNVdb8qN+6xjEM/TSAPjMx8QTrfYeKQUiD4Wbgrq2zb2O/floGx0LzWeMc4rnmEe1C44B2BRwKRBvuPNRaMbEynEouqQB0Q0CAHDH1PY5jSxOa/lUzxsAonILAp1uG25ETguzGS/p72rxCAQv93nwjBFZLrosy0b0hKYeb1An9/o5jUYyTkbO5QvLMrNg4WmkuMg/X+LN1yEs239kTB5Poh8b3ukvB4JftXxjFKZ+F+l06Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ5PPF1C7838BF6.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Fri, 17 Oct
 2025 01:15:39 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 01:15:37 +0000
Date: Fri, 17 Oct 2025 12:15:33 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v5 03/14] gpu: nova-core: gsp: Create wpr metadata
Message-ID: <ckwuxk7ohtkbpqk345kzypkafu6bkshwbgshie2bq2vzwhj4pv@5wu4u6htkcuq>
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-4-apopple@nvidia.com>
 <DDJJ4ECCSE2I.1EUAJRU9JBGNI@nvidia.com>
 <zwaefk62to77b5nyakeiboyj53fge3lysc3z7arp54tyyherdo@nsqhuig7bmbc>
 <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
 <DDK6IHKS13RS.3UVIM301BBFUP@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDK6IHKS13RS.3UVIM301BBFUP@nvidia.com>
X-ClientProxiedBy: SY6PR01CA0129.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::20) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ5PPF1C7838BF6:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e547945-de93-43a3-6f6b-08de0d1aae40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?amEmtps60vvpnYTncoKxqDb5i3ZjzJu5bqBCTt/rl9WUyX2KlQriy/ZHfHp3?=
 =?us-ascii?Q?Ew3leCwmfu5NRtth3PQNE4q+lxL79fwhl5mQW8Fyh6i9A8niROvUb5r2LXIM?=
 =?us-ascii?Q?lMpu6xGbtsnfkxzQPJnkQJW9YOIYjJQ1K9bji9Y/ZSPdAjeZpz9x8dbD7MkM?=
 =?us-ascii?Q?pJTMcGvcQt1F2xypUYzgp81SA/iF7qWZxnJraDoMOwP05kW0NEmQIENTGfg2?=
 =?us-ascii?Q?npXHV6Zwgriq8Bzrp4S0Qt0N4+ZbP0YCXBA05LwZLeF/k20J4l6gNoXVDBig?=
 =?us-ascii?Q?giYisFDsVCaAYBtT9s3Dq1E+rLkkvtK6AloeSCPWirYvmdAt4rNAcCvIbncj?=
 =?us-ascii?Q?A8XsE2wEcl0jvOTAPTMyLuVVcYJ5VerdykwPCisS7vqqQXX5FAtYCKalvU5s?=
 =?us-ascii?Q?0S9Ezye0n3hpuAzvlRAqQxwW4K94uD9LFtphlPep7y6FHabeLAdcPKhXL4aE?=
 =?us-ascii?Q?QRWFKJXpDDYzURE5xa1oHxsYHF2xc4rVHIvAKP5a8czxu0dcHX+78TEf+vtj?=
 =?us-ascii?Q?h0bbNet5o6LHArTt2mU+OMTtL/M0y/5vqu/NANfm8+IU1gD+E/BoFMqMvfzI?=
 =?us-ascii?Q?Xcu3DJElWjFMtObNjXecj0+Oiz+sIXPmKD7Wx+wL6pIRq07RHjD3iKYv8Bh4?=
 =?us-ascii?Q?EXkv21MwNfSdwNJwUJ51GoF3KbKkHv/3yI7IxAxGQTh1w1irbfeDbcvMKhKQ?=
 =?us-ascii?Q?7ZwIhKLc5LWA2bIhs2Y6cOFI4UJsZmsMmI4bCBksMqATk/3TBRwzxdBSHFSe?=
 =?us-ascii?Q?X+5ddArJq7ZNZXnLKUaObVHtNz8gRYkXjvVvfydY+Yiov723qBqjFkUrkkAN?=
 =?us-ascii?Q?DcRhfWpKnyZcF8e1cITLa5DurAcZIuiXP0hev1BzZ7NrfFtZXRSV4ZXmRH/h?=
 =?us-ascii?Q?BR1+oP9V6fbHvVUNycM5KXHHM3jVy3bsWtLy0S5P1AR6qATjIDebuS4csEK+?=
 =?us-ascii?Q?YG1K/iwPGip1eRg62+46GgK1LIIkUkLLufppxD7iifJzYzhKPNzQv1STB/eU?=
 =?us-ascii?Q?UB0RF1L2mq2OVaT3T4jP7n5Ss4HzoBnv/Hv1xQoo5AIbwbAL23uKWmkgA+8B?=
 =?us-ascii?Q?G93apeOsx7FB59yZtJQdbZGI4zF+MdYW6PBrhW5bVSOgQqP9JOvS4fF5wc+7?=
 =?us-ascii?Q?yBX8NTmTjDe2+Q8atmpa8H6RnDHnVM0z9FjfvE1LE8QI5t6+3XiyeYi4fqei?=
 =?us-ascii?Q?MRQ0yPAQo6u6nH8FchYx0zy8wGgG6QUsPhRkkOS+Le82BqQNi8iIv9CEvcM3?=
 =?us-ascii?Q?QmcuTFOsnMZB1K8/ukbB86bF+f6DBFQBr0FyA79rL6AsJgmCRN9gMyydxV3x?=
 =?us-ascii?Q?RfuwalxZUfBekEeVH7CXjNOWK1xMj23gmTuVS/h1250wc+GDYr67xjVzbxyc?=
 =?us-ascii?Q?HCkIe796qw2Vq6qqa5DAnMGT3pXvFQFUTan9D6/MfqA74QGx7ZQyZLW23v1/?=
 =?us-ascii?Q?8LU0VEaQil36rvjsPJyjIEOlrEtEhZSp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YFjPQFVRuQjyd6rmNj43YBEijIjX6foSKgnJK2OPvXVPUFa5N2WpMCOwycL/?=
 =?us-ascii?Q?ONkZ9QZRnQ8U43XqI9JFGart90cPx2i9AIO7/DazF/mPoFPagyQ55q1orTTX?=
 =?us-ascii?Q?3YSnkF2UUBNEWHdPkV7nHND1+ugKaHoniP0cHhQXgmIlDV0Xpr/ByD/d4ijt?=
 =?us-ascii?Q?JSoCkLxZ4h5tRMQi+ulHHvbBW2HIrByJWxTzNuG0s7aE5fuh+g/OfEOEB5R/?=
 =?us-ascii?Q?qnk68SHyme5pSbpXsdQZlfPE09Ce0HCahxm5z93chqpIbd5q0ccIFj7N9pJa?=
 =?us-ascii?Q?tteT30xEtFbvVTzPBQv7bfbVEsQSqN8apNoWqytViS4WFtMsHpDE2lGCn4cn?=
 =?us-ascii?Q?nd57HI4dGCsLXeBrh7/AoKqUpiss7c1Q6niAWTyCmucdltw019ChfWdwKUqy?=
 =?us-ascii?Q?U9mjk8F0D/pOKKeBX+drL9k3Df58CP9MbP+hZNZbz3pUVuIcJY8xhcCip1fO?=
 =?us-ascii?Q?gGGNZPoB2ReN6nbx22ewGmOVRzd2gJdhgSqbfzi5UdmWto52W035mlNOgBKO?=
 =?us-ascii?Q?DJuoHqdV0i0U7M1MPEvtW++I6hABWyDE98Q2Vb0MxSoOV3kyUY5gL/Kk3Slq?=
 =?us-ascii?Q?ZgewNDqU0Mjeb6zT4y+o5oYQNV4oj7YdvIRGo1QUgHsCzJP2gdM1HeFQ7rDa?=
 =?us-ascii?Q?JRtTz8x03TxFfDgRqCH6Wsjz3mzmBefrnUyhvXJuCKTl38nmmBZz0F5KBRXS?=
 =?us-ascii?Q?iPj24lXWnUifOj3yDV2vksMz5R4yhexFMS9JuhCjEYaotRZnzDT02tHh5uOu?=
 =?us-ascii?Q?PboOfFtsQRA5YfV0m+B6J83RqCrnQYVWkfVERdF+g5HbLNaVDdiuAPldhhMf?=
 =?us-ascii?Q?IY1V2Sz3bXLBu8DrVdyDfgG5j7ONP32MFqlGm+lQP8IH8REz3dq64+5nhMAJ?=
 =?us-ascii?Q?zLno5Kyfouz4gUPfe9sAGPCH22NHKPwfnf3N/7NhahxN7a6zPBjEi+b5y/I/?=
 =?us-ascii?Q?z5h8MvWjem/Fc0JHPkq41yXadRN9EY57OoXNYNeicxRP3rRXlylpV8tMcc9+?=
 =?us-ascii?Q?L7/v29aym5ycvEGvUwKmiCAT80WoNHb3XumRRiSs6Hn0MdD9go77FOAJk6k9?=
 =?us-ascii?Q?aDgxkbmHBASQJJa9jKe2bahuLXR4eI8u1Tk2B5G82DsADvs86HSVsKSVbWA0?=
 =?us-ascii?Q?M1UwN1de6m/1Ks1ZjPG6Q+vMlFTtEqHKQAqO4kcLjgI2N0LZy3VSXXnxMVCd?=
 =?us-ascii?Q?JNPD3ZWuC8TBXitYuE2oSva/yqGIH7p3Y+qEFu9SELAKDAuplS/l/hFh4S0L?=
 =?us-ascii?Q?FsX7a33ZJ4q+I0H+jEydZwVqgF8peSQSxC4N+FJoWac3Ok6XxNhA6PFgoj8o?=
 =?us-ascii?Q?mDaW/OO0kkTYJErZJjcfWwZ2+zm6kamvujsHnYgsbONrfGcSSPy50FdIKx04?=
 =?us-ascii?Q?f0kZqcyi20mSJaH5y/WcE6k5XQczwySMGbeDW656XOhVgQ7FFbXM2Mcbk8gU?=
 =?us-ascii?Q?O5nC3frKHB8QuwoCHfUeqQ5JDVwRy3eT9jEyUrYcfW0j9WAq5KS79m5FqYrn?=
 =?us-ascii?Q?B01eKKwZTLBB9icGg3Ie/qJ2zaXDjjNLFduAN6AlWlHRjszOOUPFKJn0dc4H?=
 =?us-ascii?Q?Z2mmvGg6IRF9V2sdNjF8a5vG8yeEb0cpIADC9Kz5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e547945-de93-43a3-6f6b-08de0d1aae40
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 01:15:37.8668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGeylo1643eFVOgdH3+7lvBY76iHDBvt9lrIAiRFBlYQRxaL4dG7BMfQ2XCO6Zp0QO74tw+mCVYF5vgaB5K/WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1C7838BF6
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

On 2025-10-17 at 11:43 +1100, Alexandre Courbot <acourbot@nvidia.com> wrote...
> On Fri Oct 17, 2025 at 8:11 AM JST, Danilo Krummrich wrote:
> > On Fri Oct 17, 2025 at 1:03 AM CEST, Alistair Popple wrote:
> >> On 2025-10-16 at 17:23 +1100, Alexandre Courbot <acourbot@nvidia.com> wrote...
> >>> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> >>> > +impl GspFwWprMeta {
> >>> > +    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
> >>> > +        Self(bindings::GspFwWprMeta {
> >>> > +            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
> >>> > +            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISION),
> >>> > +            sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle(),
> >>> > +            sizeOfRadix3Elf: gsp_firmware.size as u64,
> >>> 
> >>> Very unfortunately I'm afraid we will need to replace the `as` in this
> >>> method with `u64::try_from` and make it return a `Result` for now.
> >>
> >> And presumably most of the other `as` keywords in this function dealing with
> >> usize as well? Have made the change but would you mind quickly explaining
> >> why this is needed? Is the concern that usize might be more than 64 bits or
> >> something?
> 
> Indeed, the concern is that `as` performs a lossy conversion without
> warning, which could catch us off-guard if e.g. some type changes in the
> bindings.
> 
> >
> > Since nova-core depends on CONFIG_64BIT, I think we want a helper function that
> > converts usize to u64 infallibly.
> >
> > This helper function can simply generate a compile time error, when
> > !CONFIG_64BIT, etc.
> >
> > We can do this locally in nova-core, but it could also find it's place in the
> > generic infrastructure. nova-core clearly won't be the last driver running into
> > this inconvinience.
> 
> That would definitely be the correct way to address this.

Sure. Although I don't really have a problem with the binding constructors being
fallible as plenty of the others are anyway.
