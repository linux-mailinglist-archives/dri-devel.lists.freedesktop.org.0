Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E14BBE03E
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 14:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B888610E095;
	Mon,  6 Oct 2025 12:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="StnkxfXW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011042.outbound.protection.outlook.com [52.101.62.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B0510E095;
 Mon,  6 Oct 2025 12:23:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOoFKZf0w9jHyhVVKYg3035KmakBPNYcZ0j2833VDcXPY6LCtT+6frW8aXkOgmhIy/us9gIvA4pwVg6ujYyLijoYHmrrrod+AUAct6mZ4ag/qJKehhytg0dny413W38fsbyX/elXHsTQx9XRr/QOUh8r/rqNSh3x9y8Z16UxOsqdaPzZtQCISWhPsBatVWe/DnY6AfIhhi2h+aD0QYYoWTUjPhfPvT0msjxzFlXgP5NdYRG5tpSPN0vufTSRrzLFo/hn2zI9OxIdThYxXLmDh+/qe+BCWlOlj5zYtvxIcZkbG/KIddtSLzAKa1seb1fc3t7xPVKjBEXVm6qjc77MLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Ygn5fHCdx2XW0lnzgqEG49sJkZrQf0+4p9qBQnVR7o=;
 b=FXVrGiEK1O90A/BG6/fRmF0I9/xEDr7teaBl5lYqghCKipW9xLdTFpNUwnK5XkVSyiA+CE275IcT+m5I2HgBEn3O/yxEPxRQHN9CJjk2OspuhqzzVRDo35Z0DxU2GrlfGhyFy2KKgU6cEOp7/8XNI3Vw9B/tmyxTpezK+Sr9CJWsn+XIe6MO1/uN1gbpfmofthwWdYkc7ktU4NHDyi9hEm0E5AJHmVa100L++P9Z5GXVXHKlEfJ/s8JcOt8MfPX/X8EqqvLtHwz0YW9tfK1qa/CXDr430fW6HB4eaZaY9QUYpZSB45jy1d+iB/YMmrwT8ktLL4TSpF1dLAGD+hxFiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ygn5fHCdx2XW0lnzgqEG49sJkZrQf0+4p9qBQnVR7o=;
 b=StnkxfXWhJ11ElkV+ABQT01sqIdn4un4tYpcO3AdaszYIxnx2DYYCKjjyGf89kK8mT1Ouzgu8Sik090n6RdmkFBWHd3fvLCgJYJBcLvLx/OXlLPTcZt9l0srEIRRCGjVZP1SbjiOKq/pX6hJw0d8t+3xffEJzXIuX7w4WHcNxzRSnD3JMbad46N8/OOEBNVwUzIchsfsLNSKIjnNBVKsoazEM1AJ8JHDCsIbFjImtkDaeXYA4/Mg8Ck8frgaMVJc11ql6wWJ3oOB78YAJBn8glHln+xNiVdWOWGuUPeMTNrQetACWOUbT1lFaFTrsxC+T+9crohqsL2m0B3LvzZslQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by LV2PR12MB5822.namprd12.prod.outlook.com (2603:10b6:408:179::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 12:23:32 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 12:23:32 +0000
Date: Mon, 6 Oct 2025 08:23:30 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH] nova-core: vbios: Rework BiosImage composition to use
 AsRef and traits
Message-ID: <20251006122330.GA2205242@joelbox2>
References: <20251005220847.805405-1-joelagnelf@nvidia.com>
 <DDB0EGNAS7N8.X5GFDGYLHUPX@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDB0EGNAS7N8.X5GFDGYLHUPX@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0654.namprd03.prod.outlook.com
 (2603:10b6:408:13b::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|LV2PR12MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: ee6fa2cf-76a1-4639-0150-08de04d32a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O+sNuoA3syux/K/o46MfT1cjju5vy3Rpb5FkpjdSjBMfPMUy10edTLtM14+s?=
 =?us-ascii?Q?fU4G92dmDBRxgg/j2mNiGpnbs/X+S5lkDHyblLg7GwqKZQ/pjqppHOiNHTgL?=
 =?us-ascii?Q?qFHUuTvvE6uNDLyakC3r+2xvfnrK4g2fMDpp9/1v6D6cI7Iquu5VEBruRZD1?=
 =?us-ascii?Q?C4EqJHLLdwiF3+wBKMc9mhUI6GEe5ddBcXJ+ab0PO/VV1H0Iuk7s2VWKujkF?=
 =?us-ascii?Q?sErT9KskZYcaERLKVey1kzEz5OsTJIDnBapGkQfDBaZSG0vneNHCPRjHojg3?=
 =?us-ascii?Q?ara22Je4S/xw6h7TvswdA8JsgMGBDClXLva5K1g1FGeBMXsg3NJl35ckU5IQ?=
 =?us-ascii?Q?6xG+9wOg5jzslwuSIM3hI3ZTLCOwl1GkMYy3g0X2ibqHfwhTeptnhyXobWNq?=
 =?us-ascii?Q?/4d/PR+XGgn5NmlsiEA9G0J7SRN5+WimxtfOm7PpxONyQ1XOOqB2Wwezvv9Y?=
 =?us-ascii?Q?8w0cUQVP6My0wluqxsYOChL4Nb2cMVin1QK8r4VNP058WTHaSK7fTMzhqABP?=
 =?us-ascii?Q?pguSWqqwS15DYP/5zn/lNE/bsbngeSpkBbeWZ3sQtTIaoZFvK50OxGwHLqYx?=
 =?us-ascii?Q?Hzeg9DwKvdjo0K1ReRPJKuMS4BUl+YBvV78OywxadVjc/PQpnBrsSni9LU0n?=
 =?us-ascii?Q?E9HIhUYkgC2gxjY5Gzy64+OvGjhOrm/Egd02NICYP0pN2hdy7srQdsEKA4lP?=
 =?us-ascii?Q?Sg4bZFsbzVGmvisQkNCT6t+FN/X5/SciqDE7o6ZiNRMtmoZIEiHwFd7GJxnb?=
 =?us-ascii?Q?CFK2AsVgR/j/DB83iuJFYJ92Fl0MOWrN3aNXWyo+NLEO8sgjfOW/oySRlKXs?=
 =?us-ascii?Q?h+Xk+kf0UchL1GWyu3mhfO4u5k5GynLZwlChKUpOovTXBQFgNqztzsHrEu7E?=
 =?us-ascii?Q?eT4uELdS+T3YP6IXzCf37J2ngvIjzIBcZa6SNosKQZUxS3fS5QBobVDJT8DR?=
 =?us-ascii?Q?Xh8AUJtjYx3GryHb8yhOwrV69bkJgqRHGoXzBhpOQI6q3TH3YAU/6O3KnWy2?=
 =?us-ascii?Q?Z80o2iwmRigcx5mCJb+z7vRbHeUro1EbXHnW7Mm+y5G/5wKdR7IeOymoRIPe?=
 =?us-ascii?Q?Bw+nmpF6RS8JwE5l1EQnx98Jt2hufZ6ElMrMjXSlhluonNuzLPlDXK3nSIr3?=
 =?us-ascii?Q?9OsWR1GrPp6pynziD/EUaInIsVQpDpSsj6QxDsJyB2kNCGxgOEtFHTI8C1Ja?=
 =?us-ascii?Q?7/gRYU3KEgwmzRJ3IslBUiZRkN7JPXF+788VbU+d/VufhMpuvdUOuD7vWD6k?=
 =?us-ascii?Q?ro5LGuDX31yEkfAsp9NPXPcgR43hYbvhyNYFRL/umjDEbR+9K2Dxt1x3qUFz?=
 =?us-ascii?Q?9JI2vuTP9ocdRXlzGaQDXVWMUNfPhkyJGy1CMda+PnAepmLFVYym5Hhun4Yw?=
 =?us-ascii?Q?S3Pmyu50SOd6avvC7XAul75wmr36ZebF0e73fkMbpg2YWPQ6nnuzqvuFemIY?=
 =?us-ascii?Q?GMHcD5nxkMi3+a7O/PInWnGyshzmQlXw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DJ34gxFLZ8fE0ur2oU5F/TQfN76Eirws26+M13q+YDYe+w4eFEVRCUcfuHlI?=
 =?us-ascii?Q?KwEEGqeaIhwNzbDzPIULC1ayXrmvfqZfmMsI2vcuIIJy2I+UaTak4mdOxw3R?=
 =?us-ascii?Q?2Fq/nBRZo01cA183AY8Ist3Mfl1l2aoiL4OGRo2GTXEXXAlCed7qacfRlJGd?=
 =?us-ascii?Q?3o/JJZwNquPlq1Liy0NvxjFYiSsbjKRPfdXpTU+6CpHNDdFK2rUd2JnH/Zqr?=
 =?us-ascii?Q?yrtSfgb34wftmtwdU7RCMNZ1BU+/To/mmyAZzg3/gzIYqy6g075ZurhmYYYj?=
 =?us-ascii?Q?KOp17qK73mfKkWmjKJMxmylkV7AxfLpzN/ZCHSUoZ7Rrr5scvzgOvLPFnaPX?=
 =?us-ascii?Q?vUrzwYO3xqV4XfPg+4GOfhjqANMZAEo8UmoNkSHeJ0PJsgdxzqat2y6mWmtI?=
 =?us-ascii?Q?Fsx7YEwo5b/dnYemLmKYJfPUwkQ3Y1fCaH9mKCbGUf5HyUzRjK4QSBozD1Mp?=
 =?us-ascii?Q?bYxLAuqASc5OnyxYWgU35dLtcMydn9qTjUpK4YSatmvh/T02/1cUv2bn7dLx?=
 =?us-ascii?Q?9IcXfO+NgXO+ahKgQQF7rbUZhnplTkT0vp4J33cqRAuMIMSXVHVGpRkW7kCe?=
 =?us-ascii?Q?XxxUMYewYcOwomnTpvXPDRi/tRdPOahqpsNbSrkojrzdQ+WoRRr2glg42v8b?=
 =?us-ascii?Q?Xfo67XBtWE4B3Evv/nNAALlWWNiArHna6zwpeBI7TeTD5/dIDp2KJvgWm8bb?=
 =?us-ascii?Q?++92MrgmS1SrJhgTHoP1yRMGKXMIDe5SEV8TsVlEdr1xNqGTYrJnkQv17BIa?=
 =?us-ascii?Q?JsJhz8l2dvF6aVG+CJtHXqOCZatU3nZI10fh5fyL5xpOwVCnPau7lH5f0QEZ?=
 =?us-ascii?Q?OBjhxnCQgABxH/RgbE0Mzr0g3P307n0O7zAVlXdMs3m6Opk7zw/5/dfEDoNZ?=
 =?us-ascii?Q?xQOgMR5baJ8bDNwWi06OJhO47znwkCsY9R48Cf3+O8qh1JFyG+D/o0qfnef/?=
 =?us-ascii?Q?Yx+gImWY/tr/LwGujlTKGcrC1iIo6efqpjXDpr6k7ISpDlSpCAqRGB1BpsT3?=
 =?us-ascii?Q?sjxC9zRPnRsrYf5AEcI2oFgJDakpTggFQHFQ6X/uQB3EXvHwLEjsorOPrv6p?=
 =?us-ascii?Q?fkfIzmE+De5Oo7IO9z5FsDoO3awi4Q/vKoaS7uozHoXAb8SsAlKhPFuf52un?=
 =?us-ascii?Q?2ZFpfnmKiJsbdOINEWA91wM5xdHkNYO8KMB9dTkWpcQ/aqAZR49giakonwK0?=
 =?us-ascii?Q?Z+M+ZSSvdhUtp58F9dT+gTT4buTNr6/hFou58NxnFVEfmujo8xirjoh4XZY4?=
 =?us-ascii?Q?JMRBcMSunhYOgqGGEUBJKm4Kcm+YJOz/DXjOK+DRDZf7RP8PK+8V8mYzpnM+?=
 =?us-ascii?Q?69v2GM7YMvMN0L9giOyxpOaRjMljO5K4Cnr8gsFIg2sgURLu7tx9ZrClTc7S?=
 =?us-ascii?Q?diUn0OfjBxpLggpCGY7XSD91rMVP1iFkEyBuSAPkhOuSjCoesCO3hMOS7mnC?=
 =?us-ascii?Q?RBcpomIETRwtf8jivZ+trykCQzFGhUjma9CG7SR01u/G7YhYriQ//bdKzfiq?=
 =?us-ascii?Q?KX65p7Dq/D0puignRXaWcrNuLS86mdi28EEuj9Q+M4W0BvOdeb/P0oTrT7Fa?=
 =?us-ascii?Q?BTGvPVdz+cEk6lLpSI8Xj5M6Vd5y44GUfe981DkL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6fa2cf-76a1-4639-0150-08de04d32a05
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 12:23:32.4461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuuLEEAPOqqdTSInZxOupDF50qslW2S9R9ghum3KXRwAE4pHLXHtI6B161XjQwKZFmjAUgZFcWwvhuFLrbI3sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5822
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

On Mon, Oct 06, 2025 at 03:01:42PM +0900, Alexandre Courbot wrote:
> Hi Joel,
> 
> On Mon Oct 6, 2025 at 7:08 AM JST, Joel Fernandes wrote:
> <snip>
> > +/// Trait for all BIOS image types
> > +#[expect(dead_code)]
> > +trait BiosImageTrait: AsRef<BiosImage> {
> 
> I see that this trait is implemented 4 times, but it has no user.
> Actually I can remove the trait definition, its implementations, and the
> `AsRef` implementations added by this patch, and the code builds just
> fine - only with 50 less lines of code. Is this needed at all?
> 

Indeed! So in the previous edition of this code, the pattern was: iterate
over specific image types and then call the common methods, from the main
loop. Now the pattern is iterate over the common type and firectly call the
common methods.

So I inadvertently simplified the usecase thus removing the need for the
"function routing" in the first place!

That is good news, so I will just submit a new patch reworking this without
the new traits and AsRef.

That will result in 50 lines lesser as you mentioned! So please discard
this patch, thanks! Should we need routing to common methods, we can always
add that in the future.

(Just to note, we can discard another 20 or so lines once we have the support
to generate the enum TryFrokm boilerplate).
