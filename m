Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED520B505DF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 21:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BA310E7C9;
	Tue,  9 Sep 2025 19:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sGeZYxCh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D3C10E7C9;
 Tue,  9 Sep 2025 19:05:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0zBefa6OMxWtA6cE7cafAbU6B1NhfYvtthobYrIn2NIsZpbB6C0slgKdDQmqa+ivKwnCw6c8EAu5DTWunAIpNQGqun7WNfiW/KfHs09FjnxnlLgdNl44/PycTcgzeG47HqgTF4k8KZ/nV7e2YVj4ybwV2zS48X/a+dnw9o86Dw2VijjtI3r5cWhEZfFxEFYpjHZOXcCtBNdwTOxnnHgfjvUvwZr4hyNrgW92rX9QGDSPEoO1J4OKnwmsXzqV379bUzVvwiSpC283F9P55SbUuuWx+kFNE+0ufLjhkxDALDwI0SFRbsYTmG6ZR7YLjXWXj4vtjnvhIvPICDAa5wisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q01bBRQWyla6j6LwMtplcL4DN+NvT8yVX7Rz6JVUp2Q=;
 b=HUjAgRHFj9gRQ7tHBFMFckxLImpXK047RM63+ov3ngTA82gNifaWael26Q5mgz+g7B5xgU8ck0zp7xYDIKNPlqxp6kFADHU1jf3JZ6uYINMPjkxzZWFDMm6Io/SX8DeK3GflyGElqPn//XSFMA6PxeATipc6xi0Lc/cxylFvLFTqiBOmXsUQV/7PK7q4lVJq++nIJAVazwIPSYgJNL45dliB2uCO+AB/mqUaYk0wOjBcL+Jfsc6z8Dko4ghE8y5McBhvkEF6CdZANoRKmoHhGD9BjRnG7OfSSLQjumJ+Lhj/ybkoibeSKDJVMCY3zCSx+OXaNgRk5eR9GjM7KDS+hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q01bBRQWyla6j6LwMtplcL4DN+NvT8yVX7Rz6JVUp2Q=;
 b=sGeZYxChsQAEX12CUNMLT59GjCr7LOb3owOV9yjBFvX6/jtN5CU8siZCcHgiVwttGQMo4pp+LDqfJMzuuJiywzApVtJRjV91QaUO3bWj3sIrSjhhlydkU9hsizGcdv/9PC5aE2LqLzTaN/IwLSjh7ISX0ZA1BglWmylVfg051YRY7UM88vyPx/ejzJ9mjVAyb1mohqSyo3iFVj7poKVzXD5Pl+F3ffa6cKt8xSYPMzL3qdZl41BpcCWnlTore2ONA8tRFKaI+o5S2zyJ8YzIlhpx/4G+3WWvrZoX6k9DCoY5EDQwP9B8Ld31I97E4frnx3fk+SemKtoNMd5v89Dz1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14)
 by DM4PR12MB5723.namprd12.prod.outlook.com (2603:10b6:8:5e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Tue, 9 Sep 2025 19:05:52 +0000
Received: from DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515]) by DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 19:05:51 +0000
Date: Tue, 9 Sep 2025 15:05:49 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, Alistair Popple <apopple@nvidia.com>,
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
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 3/4] nova-core: bitstruct: Add support for custom
 visiblity
Message-ID: <20250909190549.GA4175002@joelbox2>
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-4-joelagnelf@nvidia.com>
 <DCN3UXK0EQ1Q.KWGM7NKTCS13@nvidia.com>
 <DCN401FF9MY4.EPGZDZIMK1VI@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCN401FF9MY4.EPGZDZIMK1VI@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:408:f8::20) To DS0PR12MB8044.namprd12.prod.outlook.com
 (2603:10b6:8:148::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8044:EE_|DM4PR12MB5723:EE_
X-MS-Office365-Filtering-Correlation-Id: c6591ecb-599e-49d8-4dd0-08ddefd3e489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3Dp2pIwWREOyrR9VWnxOxF2aINGzLzDiN2l1wClYyPHUGl6CKKzwCi/M/7qJ?=
 =?us-ascii?Q?ArC5IOiTFhcZt87UP6H+JUlbl7IjOpg1YLxFGKrea8skTFCwXlxOdGrak+AC?=
 =?us-ascii?Q?gWr4Dry07xWtRfN1AHbBd+JVqjD+ISg9zr5rkHug+nP3ZBN5k/As87ZGJ95h?=
 =?us-ascii?Q?r5jHuXOKnWLnoCWFM86DoyJ2SzNo4roZkeOxBGzOFQjm8f+o/GMBnLY9VCu8?=
 =?us-ascii?Q?ZyjX9VodY+Z7fmB9qg+1rB9EzWWX3NKxpElEfoB3hFARozfvI4VTvzahRSYL?=
 =?us-ascii?Q?IOdNkqPE5P0tEr3OV9bjTreV5pbEZM115klao8R8Bw6QHB3nvisnmR2H5CjO?=
 =?us-ascii?Q?VmAs5o/zSZRzNuY/9jwN9WkxS7WAcUVodCJd0ZY3AAYu6EA95oOFLpEd+Zhv?=
 =?us-ascii?Q?mNQSZHR9qlPsZkP4QrG1fKMGtxfGGLE7aJAwNeaEqU66DjyN8r93/MJ/91ga?=
 =?us-ascii?Q?6xPAODefCaIX3OJHqBGCKZp8dSuwozvh/4MLc3bFR1tWQnf33fFQiCoISc7n?=
 =?us-ascii?Q?Ovb4pDTfaGnce+ezF687LR+VutqV/hVACZrEVuFObE7Rab9gIKs3pqj8AhyE?=
 =?us-ascii?Q?+IHddS9fsy/OqyErn1Qvlie5EU7lfTVABxjlkjcNeqsdJqI32Xk28n0aGutN?=
 =?us-ascii?Q?Idss0PK1HMYyRqEp00qF2iYQW7vhqoMb5jP4L2EAndZqZpb7e5vNyD1gwgFw?=
 =?us-ascii?Q?KBkQd9oOoqaG3eerlKJSZnTSp90Pu+2DCeCO84W8rf2/UGJj/JRChNLMjqjw?=
 =?us-ascii?Q?B1ZpmnmqJpPCMpqm9G2iKeRSZRKYRTyMwBMSiNVXKANlIOxzGyBtS/lJXS2d?=
 =?us-ascii?Q?2sG6jPcjVq0WQDJaSSPgATyb5aEyKr2RUgvqD/3AhoSUdJZ9TQ/s3crAD1pC?=
 =?us-ascii?Q?1I+hzYD8Fms0riPHHBQ7wYxRUNhrj+3VobRKnpIsuc2oaHoOYVmAb3yBYl1B?=
 =?us-ascii?Q?PgYDI0vaJEF+sVefJjO+Fg57HlwAdzyT3dquAcHI34QKEuyoFiY30YstcZjw?=
 =?us-ascii?Q?66Muf0a5/Bzhe1wKQfORsyh0uW1ZrSkKno2OwfgtnlYyD4dcC/bx9aeOwljV?=
 =?us-ascii?Q?TRr4+GNo2ITuAW7Btn8JhQnv0cvWEQx4l4vRH1h7ixiON2XZnsd1Ffpoguer?=
 =?us-ascii?Q?zxpiT3w1q9TuJx6mDGZnDb9SamZO1frdfU+muZr6BT5YkvnGK/RHrD6mwlvf?=
 =?us-ascii?Q?pDMgH2FoTk+mj5Io0xWYVbjTJNz8luanA98kuJtZluaoQseNM3Hpl0kYvpss?=
 =?us-ascii?Q?tsD30eE9BnPjeyXiNU74EhorwZ2VCvPmq5wRHszsJXnX9Bl8DY7nVlTe7ckI?=
 =?us-ascii?Q?+akoacdYv9+W/i7KvAxWGoqXIqUPJRs8uRORzSmQkQKIvEZWDpRp6ybdttx/?=
 =?us-ascii?Q?t1g84gCurR+0JjTmG6W7Gfi3aCt3L3ckR71/f2Bs7edVPXJMM21ms2ZwlGfE?=
 =?us-ascii?Q?4NGJLZKhCmc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8044.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HaBoAJcYlFFTcazvzsrN1SAcNYEMqqV07wqtAFY2zZimApq40THfgP7r7CbH?=
 =?us-ascii?Q?A3HlBcaYjHRV2DdSp/0GohiH81/1igXGQrHQKNEEkTDNEaXCpGbI+/3d+9SN?=
 =?us-ascii?Q?8SHqojoR8dXjjjzpFMotYu8Tcbdi40/O8vuV6JMJ/q4Jye/gb58Akfu5MudS?=
 =?us-ascii?Q?aWvArQJcjmB4bzGxYLruyUFlcaGNTvCPFkk+a1buLA/KzLDeh0bjjT4GHKwB?=
 =?us-ascii?Q?4wReEHdP70rU4a+yudQ4qc2pIS2Ei6uqNngK5spleg7tz5vgqfXZZ8qAkfXd?=
 =?us-ascii?Q?IPOD3Qf5luwmM2fANYeD8NnLg74oIHxUZE+IGWlQlS+XgfJdim2kkU7fsn6l?=
 =?us-ascii?Q?f/NIe4m+1Q7zBkC2McR7xvQ96dZz3cL/jcn+TfYECrXiTZ4rXDe8WNyfzoEg?=
 =?us-ascii?Q?dRbKE3qqivsKmEsUYUPEwzrheDWl/GnGhyKYM84bC6jj5abXOPZDuLyaVKb/?=
 =?us-ascii?Q?NuaIWf1Ig/qw7IKadVXT9apDlpqbC7U5N+SMwUgvff9oUXxS5SBT7jwdsvZ6?=
 =?us-ascii?Q?sHhAMDK1tOyRKHZg36xP8h20tuQWMtbVu+DsBo9xDlShFnCTftAdsVyDp/14?=
 =?us-ascii?Q?r+hJaK2o6U1RnOTpLeF4hqfUb4QmjAgEWmqSNMmVp8bRsGwe34SFGBn9VN6b?=
 =?us-ascii?Q?C0rmnifcGObVqj2WRVN4e8naYGnHAcxD4kXSu47GfSNPXrnT+5HoR1NC8/ao?=
 =?us-ascii?Q?9DPhan/XJKZ5bEOMs8aI5XD9GWUXGyxVUEsrfqhHM7v+43inlRMD/LNfu0nV?=
 =?us-ascii?Q?gOiMAzpqrIu8rf/SQGtEp6Jy/EM8bZZKSWXnpwMZ3bBISKg+Wd9NHkxtzEaM?=
 =?us-ascii?Q?OHxEKc3VZD8yBhrrtghyphvsRpoCyHVBje+uBg8Lt5+NpGn3RwgqSYr5IMlI?=
 =?us-ascii?Q?uAW9GUTh9aL7xbD6ZWKxx+7kAeD3XF5N+tIt1zU66TO+Y5odgNFTwHoMrx/f?=
 =?us-ascii?Q?8XsYwhWdCkibOmpLZ2J/gz2062iQ/aHrQcST9KNcQUXt0syrTE2ldZXLo/Gz?=
 =?us-ascii?Q?BV+RZJxr139eVFeupQakHVzex21Z3pa4DcyJvOiCwt7RuUwbx/CvxWmTogLS?=
 =?us-ascii?Q?oKztxOwGSegOMOrh+hFWUMoDFjbVJZ6CvZs5i3ItjWqk/YeXL+zWdQksbRpo?=
 =?us-ascii?Q?TW+CvPYk6HL9noGwGp6oMV3mgmXn8U4VmalD357HH1NDBGeXLGb78l6UOMCl?=
 =?us-ascii?Q?zvnWfXYm1BKOuskyg9uuGx0yQZXmgm47qX7q7IamLbzJrzh58i8CYUoA1fOq?=
 =?us-ascii?Q?mjnczc27EYJW2toWeeu7nWCFmqrsjErPLDy7Vt+a5wLj6Ixe+sh6Vmqbnibx?=
 =?us-ascii?Q?U62e/extcls7aDCHLQXDGhrb4cZovPLNA7X7phQm6sZPB2W85V4QDU4W55YC?=
 =?us-ascii?Q?w6Ya4uhyNcTV3CAZ/L62SXmxvcTrBWyCoHU3qIxXNOMy2JKYQb+vJLyiBsMU?=
 =?us-ascii?Q?+wwTREajPzkKTfKc59WJ0B1lOrICf6UeSVFXqzHwWUZteKcC0WhGs3+LPXxj?=
 =?us-ascii?Q?oOzyOXFSUoydWRd/qMtTObBUiY4qD4dHAyygbWTU9OhPLPz1AiCxHhhSTC2l?=
 =?us-ascii?Q?zFpmF//JzyHaG72dzSMp8X3Qfb5scshkZnNK7Hgr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6591ecb-599e-49d8-4dd0-08ddefd3e489
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 19:05:50.9840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8A6E7tBOkBCOxZ/VgP0jwdhjGYjLrPFfDTeKhanTRBBY2Tj9yi5TieCzHF3SYw/X3sowE85/8qYmJ5rnUZmkAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5723
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

On Mon, Sep 08, 2025 at 12:46:57PM +0900, Alexandre Courbot wrote:
> On Mon Sep 8, 2025 at 12:40 PM JST, Alexandre Courbot wrote:
> > On Thu Sep 4, 2025 at 6:54 AM JST, Joel Fernandes wrote:
> >> Add support for custom visiblity to allow for users to control visibility
> >> of the structure and helpers.
> >>
> >> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> >> ---
> >>  drivers/gpu/nova-core/bitstruct.rs   | 46 ++++++++++++++--------------
> >>  drivers/gpu/nova-core/regs/macros.rs | 16 +++++-----
> >>  2 files changed, 31 insertions(+), 31 deletions(-)
> >>
> >> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/bitstruct.rs
> >> index 068334c86981..1047c5c17e2d 100644
> >> --- a/drivers/gpu/nova-core/bitstruct.rs
> >> +++ b/drivers/gpu/nova-core/bitstruct.rs
> >> @@ -9,7 +9,7 @@
> >>  ///
> >>  /// ```rust
> >>  /// bitstruct! {
> >> -///     struct ControlReg: u32 {
> >> +///     pub struct ControlReg: u32 {
> >>  ///         3:0       mode        as u8 ?=> Mode;
> >>  ///         7:4       state       as u8 => State;
> >>  ///     }
> >
> > Maybe mention in the documentation that the field accessors are given
> > the same visibility as the type - otherwise one might be led into
> > thinking that they can specify visibility for individual fields as well
> > (I'm wondering whether we might ever want that in the future?).
> 
> Answering my own question: it could be useful! One example is
> nova-core's `NV_PFALCON_FALCON_HWCFG2::mem_scrubbing` field. It turns
> into `0` when scrubbing is completed, which is misleading. So to paliate
> that we introduced a `mem_scrubbing_done` method that works as we want,
> but the `mem_scrubbing` accessors are still present and can be called by
> driver code. Making them private would force all callers to use
> `mem_scrubbing_done`.

Sounds reasonable. I actually ran into this myself for the inverted 'valid'
bit in page directory entries in Nova. So what I ended up doing is calling it
valid_inverted. Though, agreed privatizing it is a bit better than calling it
mem_scrubbing_inverted, but that is another option if we don't want to
compilicate the macro more.

> Another related feature would be a way to make some fields read-only or
> write-only through an optional parameter.

Agreed, that would be useful.

> I'm just mentioning these for the record; I'm not suggesting they need
> to be done for the current series. :)

Sounds good. :)

thanks,

 - Joel

