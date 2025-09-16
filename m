Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76227B592D1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 11:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A8E10E771;
	Tue, 16 Sep 2025 09:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kc0uQTjN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010059.outbound.protection.outlook.com
 [52.101.193.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64EE10E771;
 Tue, 16 Sep 2025 09:59:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fW/vubzFzTV4FNq79GNXzjr6GZkQ0xri6+h07DSdwodIwLz/4bNZdgO8Z50EmppvuIiLR2kM8rTI686chsnvUlXO2crIGgxQ3gDVCCcRi92W7tReOrNCUWKf1HUb3xzBsX2//XEVyVgVCS21f4Ttdt3yuOWOQOos5pENX4Mq1ZjxbvgYoCdC1Qp9NhWcPckrWVXvxT1z1uheYJr+D9ceslJQ1rpIUyIbiHAwNUERzFNhKCYP5pc1hj/aWSl9qZc8ckrj8iABXHlxfOqJ22UzG7kB2oQORHYSmwmRUC7zCuuldeRnWtKx4MUCUskoXKf2gCL3gPfEgCBp74P+ZMSsjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fPf6ew2r2gTyG1Te26ghIKQq23sD9F6YIh9SCIJANc=;
 b=PMXixRljL2isXR3HZmfwW+H+6Y0fqX6mVQZpGXL1B82RcYZFWqK4It7mWpkr7O1oAMU0seaHcm8nCU9EmxJkBsWmBuIsL8W0sRbYR5+eLJFKb8mU5mUX+RMOILZAl1e+y26j8NI9MfF+PM4d+a84LLSk185RdlLx8cN7dIoAKzlbDfOV4KrD9elwY5SR5kO3nOXJR0LQR9D/nJLurNiwrFzxeIxQrhPc7+ZepkLJZ3VG7YKwj9jaOK0ULnf/IEFAxLPhsYoyy5gwUcxvNJuVmlDMnlgn5r3DwWon7i9sNuPHQYpz5U9Mms2oprOt7NOsurcuiFYLGdo3CvpufCz74w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fPf6ew2r2gTyG1Te26ghIKQq23sD9F6YIh9SCIJANc=;
 b=kc0uQTjNGg5yf3A5c8ToZXLCOYTaSN6bJAxNN+mzpkENexd3uq+YE3tLy16tf9gdHib70Oe1wxhzwMhJunZFvkSRcENxXgOCYhZ4ZMh1MsmNUzBIypNY40NJdWPjHKMiGcJ0YQ/1ulkUvH4YMHGWB7uTYJ4fJFfaFtEk/mEFexdLf7sAhr1PTwa983COOJrSQdr5CZCrOrp4PrJQgn85ZA03JnxZsWRo94fzaOFcQEQcfTEijxOmeEOC7VBEeNZJVNLZ4Klp8T/MTwEsr65cBwIkyhj/lXW43teqFkgZcNsK0F4OhSV3Aw2IxBg9nvj2/JUko7lmiyhuwE4eXR6Fdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by PH7PR12MB5950.namprd12.prod.outlook.com (2603:10b6:510:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 09:59:20 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 09:59:20 +0000
Date: Tue, 16 Sep 2025 05:59:18 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
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
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 5/5] rust: Add KUNIT tests for bitfield
Message-ID: <20250916095918.GA1647262@joelbox2>
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
 <20250909212039.227221-6-joelagnelf@nvidia.com>
 <aMDq2ln1ivFol_Db@yury>
 <bbd6c5f8-8ad2-4dac-a3a4-b08de52f187b@nvidia.com>
 <aMIqGBoNaJ7rUrYQ@yury>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMIqGBoNaJ7rUrYQ@yury>
X-ClientProxiedBy: BN9PR03CA0974.namprd03.prod.outlook.com
 (2603:10b6:408:109::19) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|PH7PR12MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: d8349468-d5b1-47f4-a671-08ddf507b4d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vqCHg2uA9MOMOXHanXW7DNwsbw61Hhg8Sz0Q02gAOy3tDf4qjPnYdvFsXsGE?=
 =?us-ascii?Q?/q/JxAhqb0dT/Qu+/YQrhhfIuxMvU0XNLpyzk+VSPQVCQCGFkAlirCRUGEF3?=
 =?us-ascii?Q?oMq1MWZ3zK+FyYGoYzp7XQRw9ny8RBKj2m2n34Ir/cr2lfyF8kAph4RUija9?=
 =?us-ascii?Q?+EuGZSlktOjLEvFLgsKLDx11AsQtU7HfWCtH7IyWbaA+0qoVC01BMzr+2muM?=
 =?us-ascii?Q?eLTfMJIUpupCcxH3owbZ7kwD9j3/uBn2AY0+WtLAFg9QWm7Az8zoiY5fO11u?=
 =?us-ascii?Q?1CYkNYXSGYOA5PxQsW2DTeallFTI18T80+1xIqwSq/4wxxc391fsSXwU/8lP?=
 =?us-ascii?Q?sf3c4iczVil2kGtR3bxONDEj38axUf36P6suE8dusuJkYNGe10HljUDNJNvT?=
 =?us-ascii?Q?a6OZ7/nYNiuMU3hbH0/9RWXmPANXe4veKtFG0WDlEidb0+mH9pXRHQ0UtrAT?=
 =?us-ascii?Q?zAlFGjqqMwJYxI0BUQaOZH/UhOlfRhG7nqeJ8Wykd8RHgGSKfsLeC9vKypFR?=
 =?us-ascii?Q?hK9XKlEvEPvEpcnNHDATdgnPtdZhLTJ0Y/1B6Z3ob7jeukdwo1HZiv5BtoRb?=
 =?us-ascii?Q?ZAl1bKRCtkqRshIWZk1MhZJ+NypVN447BK6XwaIThpkvydII3xGTlytDryYn?=
 =?us-ascii?Q?YXeJUe8Vgiqe0EG5ixDin1P6AaOBNzNOYlQpRWGW4cx6CZQo+kUmEZNIG4xE?=
 =?us-ascii?Q?wkOENRgBnfp41ln8ELCGTteSpUVZI38J/d7la+UWxUscLoeG797PaVxATA31?=
 =?us-ascii?Q?XfSHpVNctS66bmMR1ex8FU6soAudHlezPYptwnBIkpaUI5miSvBXskMT1/UK?=
 =?us-ascii?Q?ow/iEalo+PX8G2lYfOmKxYidvU8p59E7k4lfF8hFfPOXp0WYoVw1xXZGZFBp?=
 =?us-ascii?Q?/KQPN768ZYlwW6rZ1FJXXTB7u4g2nzv6tA5KvaVPrxp7dzzaAGs/aJpTQ9w8?=
 =?us-ascii?Q?1VmkS8FWzjdiLQiKxlT9BbgpJ8jKCHw+s7K4TdU8STlo1Ilaub9OrAo+LlTZ?=
 =?us-ascii?Q?OBWqk2T3D6968O2ejZjJId7wP3nDwEjajQyFMY0AgTEnIguQFtVVWMuYrpNj?=
 =?us-ascii?Q?w9ipdQ7XzWqACQCYTbE4ve/aOZIMYClM4bddZkNF7H07Ud3zKJ3jkT2ItqJp?=
 =?us-ascii?Q?FBLD5ob2i/8t/6vNjWo+GQfVzO53wXTNc+yKxpqHx90NBgIRDJ1t1hJjEAll?=
 =?us-ascii?Q?IJT9/kf8L4LQNv1A4Y/lFWOlJmb1I8/TwhjX5j9EgKTC0KnqlflHzl9QQRlK?=
 =?us-ascii?Q?3gS4tNw0EVhGhd3UNqY4xERPykCxSEvb3aN3i/AGRlC/ClUAIAcWejfYjByB?=
 =?us-ascii?Q?oe7w8fMxvBKGmm5BcfK9TblN9usim24IjyWkc/HwIgHpy/Auf/AE6QbDO+aG?=
 =?us-ascii?Q?mgu56Awp7IqAyJHt9K6SuMh4cV+Yqzbt5FDl7jeorSsHejg6xdGb1R1hTepH?=
 =?us-ascii?Q?p3pX0xYkAlE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F067gDTJd3EOhXJWrsWHfm/s4hhmlHZDtQ870hx5cWU6uguquit/+NGyGMM5?=
 =?us-ascii?Q?rAZDXChvRblZdrce+FfnZpIe/GOGkmVmWakiK0Tv4n9allbkyaPJkDZzJFjv?=
 =?us-ascii?Q?iCNGFI4CWdO1XXoNvXY+li0MHxlzts6qANZgKR/wRLxOYcxyPRe5SSsJXHuX?=
 =?us-ascii?Q?sfNBgbNG6JoaFQMVtmd1tLaXHJeBwEP+lkbLdo7JLXRYNeN9/OJplVFtRf30?=
 =?us-ascii?Q?LNEeaxvEvdnq4o+tOdmVtmcgXqTEY1U7bFyAd3jiqJIIhB4KZbJK7gCQssfI?=
 =?us-ascii?Q?Y0Q2LDhoW5mLtJUZ33vdwEq3PJ7tFzzJw4ISqGM+o/JCbXV/op3b5hYfNoXr?=
 =?us-ascii?Q?4PlbTlYic1RslPeS9a8IIrKkt8ST1LTo3k+cTqk0q6AlXgMg4YSpRK0mMqWw?=
 =?us-ascii?Q?bKEi8xfuxU3OSHfHagb1bb0aRP8Dved33Puc6C3v84ZJzmaF5S3/kEzXhPaj?=
 =?us-ascii?Q?tTrEHwBpQussbwu3di+WLe3mBwviuIwRAr1mugnHOEgxLs1pk2EKC4G6H9MO?=
 =?us-ascii?Q?Y2tgCp/zW1yiEgz2JvIC5XCieabe66zsTOjFKDg+vF6gsWJGGw0cr+OKKP0E?=
 =?us-ascii?Q?xWlZq+ApIkr3oybScI1qQMeMSIjW+OuAql4hGa1n4vpO+9F42FoJO5EY2qlK?=
 =?us-ascii?Q?w08IDB3pj09NbU5gixSR44Keuu6oj/zO0coYPPBsBLxyMsMI3pC6vpFkpYnZ?=
 =?us-ascii?Q?L28tfbf1wgCGfvlv5OZyaRN+7sf6aUJZ4a0nhW5hzJgXP0A0xkiGpbKmdFmb?=
 =?us-ascii?Q?bNG7/akZYcTZDCxdGKnHD755/lmdMyI//YiTNI74Qyr8kVdlOSQGyY1/2wuA?=
 =?us-ascii?Q?1ITe3Gqh6Mkp42T05u95iN/iz8T2LcsAwj8GotqzsN+tiZxTq0sICLD6r8p1?=
 =?us-ascii?Q?E1wqnrzSS/JEKv4Afdxof6xiEZ0hzAK7e17IrzLNqee/2MJAuVmCu+XYdYRw?=
 =?us-ascii?Q?Hr1BRUsn3LVZCzda3YY8tEg8whwRfrw12GtKvgWNLAV4KfV/u1ZZ9dy0s16p?=
 =?us-ascii?Q?qWYSowyYeC1MkewW8NBaGEcE7lAqoJLHPV7Kw7b8rlQqbGfds968yuTRraiC?=
 =?us-ascii?Q?mnEwxWp4YRcvBmq1nkDQd4A6XLtc6eaAPGIqcNGTjkcd9/lgL05r7Zf8eTxY?=
 =?us-ascii?Q?3q9Bu9uyQ4rlikWbnHVyY4C0a3EMgiVg4WVTe/tmi372jzi+tJ9rZFvWacTL?=
 =?us-ascii?Q?p3Y/6wLJXIiOZwyFaS9UoF7n9/LZPnvGqm+sYIgtT+o4+0SqQJ8TRUYq2w4Y?=
 =?us-ascii?Q?rLQ4ZKnuaWDhpAqfxDH0ntzgA1H2n/tkIX63ZDSJQOUzLQj8ak60XPBrA2DJ?=
 =?us-ascii?Q?GinuLQSleY/Rys7voZryYcZrnWWUWSuCeYZt/fRsNjVc5DxiheMCgeYrhFfH?=
 =?us-ascii?Q?b0DZmpGyuKibwlDU6m26t6Eg1DJV/jEAuav2NnJnVrjpSX2AIC305F7P8uug?=
 =?us-ascii?Q?rYHW07dnFjTrqoQUPwNR4T65vT8GSS1ESuhX/S6AY6qSsHzNOaTrLa+81RBq?=
 =?us-ascii?Q?FKK5yfn4L+INMxLBhFRNtYlPeopaNh0gE0YFoG9cpnTQEp5qKR3s6ua8NWns?=
 =?us-ascii?Q?DRzJqqiAkRnjk9dg/dy/3kLYb0HO5SFWAgFU8M3R?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8349468-d5b1-47f4-a671-08ddf507b4d4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 09:59:20.7212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKibaiIdEcb1BevX2r9T6LASHl0OdJMUWYlZMHsqIgID85UfgzD+EsCzv4tpF3ScukTSwmWTeHWm5TDPS0oJ7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5950
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

Hi Jury,
Sorry for late reply, I was busy with conference travel. Now I found a 3 hour
break before my train journey. :-)

On Wed, Sep 10, 2025 at 09:47:04PM -0400, Yury Norov wrote:
> On Wed, Sep 10, 2025 at 07:08:43PM -0400, Joel Fernandes wrote:
> > > You've got only one negative test that covers the .from() method.
> > > Can you add more?
> > 
> > Sure, but note that we can only add negative tests if there is a chance of
> > failure, which at runtime can mainly happen with the fallible usage (?=>
> > pattern). Also just to note, we already at ~300 lines of test code now :)
> > 
> > > 
> > > What if I create a bitfield from a runtime value that exceeds
> > > the capacity?
> > > 
> > >     bitfield! {
> > >         struct bf: u8 {
> > >             0:0       ready       as bool;
> > >             1:1       error       as bool;
> > >             3:2       state       as u32;
> > Here you mean 'as u8', otherwise it wont compile.
> 
> No, I meant u32. Can you explain this limitation in docs please? From
> a user perspective, the 'state' is a 2-bit variable, so any type wider
> than that should be OK to hold the data. If it's just an implementation
> limitation, maybe it's worth to relax it?

Yes it is a limitation because of the way the code does mask and shifts, it
requires the width to not exceed the width of the struct itself. Yes, I can
add a comment.

I think to do what you want, you have to write it as 'as u8 => u32'.
Otherwise it wont compile.

Just to note, the bitfield code reused the code in the register macro, so it
is existing code in nova-core. We can improve it, but I just did a code
movement with few features on top (sizes other than u32 for the overall
struct, visibility etc) so I look at such changes as an improvement on top
(which will be other patches in this series or later). We can certainly
improve the bitfield support now and as we go.

> > >        }
> > >     }
> > > 
> > >     let raw_value: u8 = 0xff;
> > >     let bf = bf::from(raw_value);
> > > 
> > > I guess you'd return None or similar.
> > 
> > No, we would ignore the extra bits sent. There is a .raw() method and 'bf' is
> > 8-bits, bf.raw() will return 0xff. So it is perfectly valid to do so.
> 
> So I'm lost. Do you ignore or keep untouched?

It would be ignored for the field, but kept in the struct. So .raw() will
return the full 8 bits, and the field will return a subset.

> Imagine a code relying on the behavior you've just described. So, I
> create a 5-bit bitfield residing in a u8 storage, and my user one
> day starts using that 3-bit tail for his own purposes.
> 
> Is that OK? Can you guarantee that any possible combination of methods
> that you've implemented or will implement in future will keep the tail
> untouched?
> 
> In bitmaps, even for a single-bit bitmap the API reserves the whole word,
> thus we have a similar problem. And we state clearly that any bit beyond
> the requested area is 'don't care'. It's OK for C. Is it OK for rust?
> 
> (And even that, we have a couple of functions that take care of tails
> for some good reasons.)
> 
> So the question is: do you
>  - provide the same minimal guarantees as C does (undefined behavior); or
>  - preserve tails untouched, so user can play with them; or
>  - clean the tails for user; or
>  - reject such requests?
> 
> Or something else? Whichever option you choose, please describe
> it explicitly.

I feel this is macro-user's policy, if the user wants to use hidden bits,
they should document it in their struct. They could mention it is 'dont care'
or 'do not touch' in code comments. Obviously if they decide not to expose it
in the fields, that would be one way to deter users of the struct from
touching it without knowing what they are done.  In that sense it is
undefined behavior, it is up to the user I'd say. Does that sound reasonable?

> > I don't
> > think we should return None here, this is also valid in C.
> 
> This doesn't sound like an argument in the rust world, isn't? :) I've
> been told many times that the main purpose of rust is the bullet-proof
> way of coding. Particularly: "rust is free of undefined behavior gray
> zone".  
> 

Since we only partially quoted my reply, lets take a step back and paste the
code snip here again. The following should not return None IMO:

     bitfield! {
         struct bf: u8 {
             0:0       ready       as bool;
             1:1       error       as bool;
             3:2       state       as u32;
        }
     }

     let raw_value: u8 = 0xff;
     let b = bf::from(raw_value);

Maybe I used 'ignore' incorrectly in my last reply. The above code snip is
perfectly valid code IMO. Because b.raw() will return 0xff. The fact that we
don't have defined bitfields for the value should not prevent us from
accessing the entire raw value right? If we want, we can set it up as policy
that there are really no undefined bits, everything is defined even if only a
few of them have accessors, and '.raw()' is the ultimate catch-all. Does that
sound reasonable?

> > Sure, I added such a test.
> > 
> > > The same question for the setters. What would happen for this:
> > > 
> > >     let bf = bf::default()
> > >              .set_state(0xf)
> > >              .set_ready(true);
> > > 
> > > I think that after the first out-of-boundary in set_state(), you
> > > should abort the call chain, make sure you're not touching memory
> > > in set_ready() and returning some type of error.
> > 
> > Here, on out of boundary, we just ignore the extra bits passed to set_state. I
> > think it would be odd if we errored out honestly. We are using 'as u8' in the
> > struct so we would accept any u8 as input, but then if we complained that extra
> > bits were sent, that would be odd.
> 
> That really depends on your purpose. If your end goal is the safest API
> in the world, and you're ready to sacrifice some performance (which is
> exactly opposite to the C case), then you'd return to your user with a
> simple question: are you sure you can fit this 8-bit number into a 3-bit
> storage?   

I think personally I am OK with rejecting requests about this, so we can
agree on this.

> > In C also this is valid. If you passed a
> > higher value than what the bitfield can hold, the compiler will still just use
> > the bits that it needs and ignore the rest.
> 
> In C we've got FIELD_{PREP,GET,MODIFY}, implementing the checks.
> So those who want to stay on safe side have a choice.

Ah ok. We can add these checks then for the accessors, I will do so in v4.

> > I added another test here as well, to ensure the behavior is as I describe.
> > 
> > > 
> > > And for this:
> > > 
> > >     let ret: u32 = -EINVAL;
> > >     bf = bf::default();
> > >     bf = bf.set_state(ret);
> > > 
> > > For compile-time initializes, it should be a compile-time error, right?
> > 
> > Yes, since the struct in this example is u8, this wont compile. Yes, I will add
> > a comment.
> 
> So, the following would work?
> 
>      bitfield! {
>          struct bf: u32 {
>              0:0       ready       as bool;
>              1:1       error       as bool;
>              3:2       state       as u32;
>              ...
>          }
>      }
> 
>      let state: u32 = some_C_wrapper(); // returns 0..3 or -EINVAL
>      bf = bf::default();
>      bf = bf.set_state(state);
> 
> That doesn't look right...

I agree with you, a better approach is to reject anything great than 2 bits.
We do agree on that, and I can make that change. *Currently* what happens is
we mask and shift ignoring all extra bits passed, instead of rejecting.

I hope we're on the same page now, but let me know any other concerns. Just
to emphasize again, I moved *existing* code out of the register macro related
to bitfields, so this has been mostly a code move. That said, we can
certainly improve it incrementally.

Thanks!

 - Joel
