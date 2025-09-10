Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A71B5208D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 21:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A2610E9BF;
	Wed, 10 Sep 2025 19:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HTP62Ha6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2043.outbound.protection.outlook.com [40.107.101.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504A510E9BF;
 Wed, 10 Sep 2025 19:02:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4Z8RWBAZ4QyiJlIvz++w6TqOcBu/lq5oNo1kqH+uQJ7tg6WCbsOtsgz0pulo05u5oZoEliOCw5mCyScy3WmUeQ44hLx7AhvCsNb8tDJtqXpykgmb6yQVsY8HVfbtPV1f6ZqBtf6uNbOWFyh5YeI8w5XsJodRbxf0o5wlJNE8wvNlRQ/9Qogvml437JGrOkWeyIY6DU2UqETar1JIGVt9XVXtXCazGwcd8nIt1bGKgraoFfB865hVfq3dr4pEgSQqIcoWfMQUJYIRIBQlg3es8JFjM0AMPaAJUFV6o9OdYZluGoeonz1DLtA/lMqGvvy9Ofyjs3tuQHjfxOJ2eR/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rqh3Djh4LytdRXzGS64KyeCOozy9NC89Tq5fRSBPus=;
 b=PCBDbFIAXlEHYtE9zZtdTTNq2eoJROXrkalcPBuR66zY/k48K6WesZjJ4DgFNQqVN8aCLZTM9KtbhbU7F0VGuuOe15PPWCMyNwiWJ0tCugPj0udcQoK5Ci8yg+VYekXzYkXcBiJUXskn+I5J3pZPb2KnrVpLptrBCDWr8JsxXLsIQsPoVC+i9uZAY4KucPckpoyZmxM/4yo1QXfXe0zusVkxlrc/vejrCjqKcwfQ/ZH/MXlEOZ6AxiDhEw3q6UKizAsBppuTfM7KRMNGrwaAfNgSTGPG/VeHuq3wjf24OKhU8n8XOc73fgGkNPbB4FcHqkBMMLvgaYwR9njWgN8SEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rqh3Djh4LytdRXzGS64KyeCOozy9NC89Tq5fRSBPus=;
 b=HTP62Ha6Y10WvFAbrOdKXTIOPwgjHclrJK3ytE79Ha3Zdzou7YIDECsK2tcySw7nvyzRFg1mBEMAJow31T+qklXUJmFotwwJNBA5W6Nh4HLHcJhqZjtK+HutmnHhk3z2aDlhCHiC2sWWDLWUzxJccp4udAwCNLSek1WcwIyoeoJkz+I1q00pJZFlLFJPTya/nFK25rIoz5poIcxCmYxyhl8+GTdsK1xGQ/uIvxA2v8jNcx6MeoypYhgwRjfk83OxCoDnm/xr/pjTJcSYrT48wTxSO6n+ke3IGKQJTfrSngrvNCnF1LgfaoYq+YdbPBODdMBmsYfUB2Khw1UDUhZEug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by LV3PR12MB9166.namprd12.prod.outlook.com (2603:10b6:408:19c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 19:02:42 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 19:02:41 +0000
Date: Wed, 10 Sep 2025 15:02:39 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org, acourbot@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH] rust: pci: add PCI interrupt allocation and management
 support
Message-ID: <20250910190239.GA727765@joelbox2>
References: <20250910035415.381753-1-joelagnelf@nvidia.com>
 <DCOZMX59W82I.1AH7XVW3RUX2D@kernel.org>
 <20250910180955.GA598866@joelbox2>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910180955.GA598866@joelbox2>
X-ClientProxiedBy: BN6PR17CA0029.namprd17.prod.outlook.com
 (2603:10b6:405:75::18) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|LV3PR12MB9166:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d0bf4f4-05a0-418d-307c-08ddf09c9e37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BQ5oMK/DY7Jnbr+BQo+VqN9ZPPIX4XWLOGmROmNTr0QulzPzfJfN4Kq8FfJG?=
 =?us-ascii?Q?fz8JSwFkJvNOQI9cccKMioZfnB76vc/Y/PUayKmwVUrJY/FeaIdwvak5nXZ7?=
 =?us-ascii?Q?6Y6nKb8/MhUhlDMeIzwzR2B29XCgJ8flWu2XbTLBNEpzkWxkvZt1qtV0dnGl?=
 =?us-ascii?Q?jzQ3HF1iNoOTXn1X4nsydtbA4N/ax/7NmX+2VWrrprRHBtNPab3heQhoSjXf?=
 =?us-ascii?Q?3b3b//MeCLcsHmAzsVWSbpetBrbDEvwXY8RvQtztgnmjfmtDOju6JJBt7UmR?=
 =?us-ascii?Q?xD15B7ErAxBx+i1iKXeKwkRq8NPLsrS4XphDR8pW7Goenx57S+ZuB7FV99mh?=
 =?us-ascii?Q?DB3sCAhBut3xOHi19bm4aIGiC1m9GjNbxmS9Cf9qA+YnsaOhI5ajmc+8n/4q?=
 =?us-ascii?Q?JM9NyExVZSmofIn3N+AZtT439YQf7KxZyS/2nkuCjo4kw/OfmCbc6Jb1VPOF?=
 =?us-ascii?Q?ZmjH6j5qnfGNDOJESC9dl/89erpCHtYtuUAluHIU6JzAI5nCW22BsCR35qWX?=
 =?us-ascii?Q?OTvKPrvj6uS62t/oaLcjnLJNa4sqifSdTYcfSJVeYWGC/q9t+M4ZSmpwxWNx?=
 =?us-ascii?Q?58bXrfz68hvj+Rcrbsav3CneN/rtkv//2suAz02LM9NZYuXAHL8p5F/JfFiB?=
 =?us-ascii?Q?R6SHMylU40DYt52jsE84pJNZHFavP/EWa2Idf7UbA03BdVTk7ECJjZtzw6tB?=
 =?us-ascii?Q?b4xeawTK/15Q53cTNFjBBxLqjkBVZw75tQYVTdRWT2j/yJeAPwxfcDDmGfqP?=
 =?us-ascii?Q?O15KDBKgd4Tdp2VKFSDZEBr8Fc1L522WuIJ2Jy1EGqBTOyglHWvvXcmvioCf?=
 =?us-ascii?Q?W5BEtZ9QXJgkb1KCl/VacUGeSBF8EYy9U39A/33Za9a2poU/JgubrSGhUi6y?=
 =?us-ascii?Q?aNIaoLXnqrdu5d6BsRrOrLftghO4Mck+Y8dNDMZmqEeQyfrCzV1QwylQRulM?=
 =?us-ascii?Q?+wphAFfoj5e6PePmjFgPXSecWFhvEYZsR0K0226lEBZN/tekcbyjXlmAorJO?=
 =?us-ascii?Q?Xx9jJTaRBsBnFAvOoJSVif+wnIPJMvU+m6B9PNTiqv06SBccQuWPXn8xNs8d?=
 =?us-ascii?Q?Ek4s3UuBgsXQI6sdpNS2b+Pzc5LpEMHTx9KBo6Miwuby6KzxXB1TfYzwwyz5?=
 =?us-ascii?Q?0YgKE9HqijpGKhOp4j2jDxUmaYUYpuj+0KL/uBLnHblfl4G73VWfOcsXKOho?=
 =?us-ascii?Q?6EZHI2auNA7gNv+Dtlcf3G0x5CB0eb55bw4vhYn1FtjAaU7sTQQiexb9ZUuH?=
 =?us-ascii?Q?nmeBhC3/05est/IVGzb3j0yoF33iij6+ltlI7WknomRM7vmi8suNOZTT8DWC?=
 =?us-ascii?Q?izFR9lsaGWAK9o2CzEAgfHU7NAwTsNNuZu4IyNP9YGCoEPLdYgIz5ZfbQ6IH?=
 =?us-ascii?Q?JKMmHz/tLHdOCqO00gnMe2hf/jiIhETjKxSa7uECPhj5joMm4e6DkU6vuHL1?=
 =?us-ascii?Q?iinUEG8DF1Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gwjJYoM1PkJ0abFlcvKtzOzSjgibJsMvYuMQU1zkg3XoJaSgQNGj4b9+JKs5?=
 =?us-ascii?Q?jeGP7+O8stFy2GS84BJ5TIbO7Z/gjI1VjvKb9oskl/zaqxZXhXkDO23zE7I1?=
 =?us-ascii?Q?dZ5NwtejbwLSSZD/B79ZZpEiPGJ3a5p+VbNa3jpq1qKpls0y43eES7c0E4Lw?=
 =?us-ascii?Q?V2STFcN8PFPAQT+vWPLLJbYGLdKBVZi9jY6sJF6MUfwUNiza4orBZ9qBBCSf?=
 =?us-ascii?Q?RjS5gE+r0s5kz169fIBZDo5FCsxiAiO8gaY1fNIABuG9kAooFHoiWnQrtARu?=
 =?us-ascii?Q?ckw0HHaFchdeiUzbdUN6W49uCi6VOKorO/MEYScRRLZe8zLTGAh1awkaEAUw?=
 =?us-ascii?Q?9KWJmcfIKplZV1qVnx51gDN6kuqA7+YDaaTlu6Hjdtqqmn5IN60dsfTtpsK8?=
 =?us-ascii?Q?t8T3O+ipVAmOc1pXKnojJrDusrhdlrwMThgzJ/akcjvVlMsAsbTeP7gfwHz/?=
 =?us-ascii?Q?+eTXHVuIuL3wtkARZjK/+5UaLIWpQ7+PVtyw9vSW3Ga9kA9WavJ/zeESix8w?=
 =?us-ascii?Q?5C3gO1/3xeSSDycOau5Qd18A3TPTuKctvrsYNHmUBAqrzkszxyu5k7q5x9oN?=
 =?us-ascii?Q?MXRTccd5nTNfaHR3n7aZ3k2O8r1tnSpGeffrwbO+1mZ9L5oVVQrfoe2f40xk?=
 =?us-ascii?Q?NMVYjzmJrxNVTITnewJBOK63tQI/sBBf6WM8+714y7m4UBr7GCCbBd9oIDq8?=
 =?us-ascii?Q?6E2US8YH1Re7gukYK8+9N9sQRhubu+TRR7lXxaQ6uAeEnhlCqTQZBAOvZFIT?=
 =?us-ascii?Q?K8sd0aNoMIgxSVWuBoVSnFFZSTF9hPlLRBJxCecXn2kjIAOIxHtql/eO4fyr?=
 =?us-ascii?Q?ljyai1KO1qbUJixpZRHkUZSxHhQSXrMjTniEoe0eNGDiV8G6qX8eNu4pdwQU?=
 =?us-ascii?Q?1025+wNi5WAkFwr8BYofrH/2+y6Vfx087H1sIRS/xfOiYMN0dtHURfazalmr?=
 =?us-ascii?Q?xhSNm1K7UOZp23ScA/78qoycUB3TFAaZPWpz7Lv2iyDYVtO8wDd5qKxdPTiq?=
 =?us-ascii?Q?IpSwRcZ93ZTwqFfON07sweocYZ5E/AEQa8Y7XlYqH6fgHtWfcBJnaed9SMty?=
 =?us-ascii?Q?TqSNzo6uNregMWO5Yu04TNt7V9e0+t8DYJ40oeBntdaCxQCd2od/dFOKZ+RM?=
 =?us-ascii?Q?FPTIbr7j03tQBTPQ5aUhMhMs2ubWjHdZNzITKmPuoitmjp08ZLnbKPZkQ32u?=
 =?us-ascii?Q?MyjveA+493yel7+sLlU6n43CjyRK5LJrvf9HBH4c3w/SoR4QsQ22en1O/3Bz?=
 =?us-ascii?Q?ixq6QexicBjIQ52BaKPTNzoQ6LxiiT0DjEr6hUTeizUVM8OQAtxqol7/DZzK?=
 =?us-ascii?Q?JOJfduSH1Uqlnj+4YpQj23THZjSObvWTeJYogdjfALsWL/DHYiZB2loqhPCr?=
 =?us-ascii?Q?T/oHLRyYPJV7PxSxY1jrXXRzeIWXIvZuadP5Rv1QIsf3IoeBfJXduMgFItzN?=
 =?us-ascii?Q?hFORVo1JCqDBCmNIZW+jtPWIKiuWt9JlF4X8vSYi2+2Jr+YCJ4AkQ1yMn3Jt?=
 =?us-ascii?Q?CC8cxyFGxhlv8shGgbEFCWG6WTcl6qw+C80/boVRLvjvawLhWZBJ4cimT7gV?=
 =?us-ascii?Q?ekstVn7WnTzJkDbTn2Mo/Zf67Vgcg1GDaM/kHJDv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0bf4f4-05a0-418d-307c-08ddf09c9e37
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 19:02:41.8632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZbigEarG2NdnXiDxH/DGEYfCAwGWTIpt+R8tAuGc2ShUDk2+7POM4vXm+GQPZB13rlN9NhbaZ9+l3Hw+BzEVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9166
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

On Wed, Sep 10, 2025 at 02:09:55PM -0400, Joel Fernandes wrote:
[...] 
> > > +    /// Allocate IRQ vectors for this PCI device.
> > > +    ///
> > > +    /// Allocates between `min_vecs` and `max_vecs` interrupt vectors for the device.
> > > +    /// The allocation will use MSI-X, MSI, or legacy interrupts based on the `irq_types`
> > > +    /// parameter and hardware capabilities. When multiple types are specified, the kernel
> > > +    /// will try them in order of preference: MSI-X first, then MSI, then legacy interrupts.
> > > +    /// This is called during driver probe.
> > > +    ///
> > > +    /// # Arguments
> > > +    ///
> > > +    /// * `min_vecs` - Minimum number of vectors required
> > > +    /// * `max_vecs` - Maximum number of vectors to allocate
> > > +    /// * `irq_types` - Types of interrupts that can be used
> > > +    ///
> > > +    /// # Returns
> > > +    ///
> > > +    /// Returns the number of vectors successfully allocated, or an error if the allocation
> > > +    /// fails or cannot meet the minimum requirement.
> > > +    ///
> > > +    /// # Examples
> > > +    ///
> > > +    /// ```
> > > +    /// // Allocate using any available interrupt type in the order mentioned above.
> > > +    /// let nvecs = dev.alloc_irq_vectors(1, 32, IrqTypes::all())?;
> > > +    ///
> > > +    /// // Allocate MSI or MSI-X only (no legacy interrupts)
> > > +    /// let msi_only = IrqTypes::default()
> > > +    ///     .with(IrqType::Msi)
> > > +    ///     .with(IrqType::MsiX);
> > > +    /// let nvecs = dev.alloc_irq_vectors(4, 16, msi_only)?;
> > > +    /// ```
> > > +    pub fn alloc_irq_vectors(
> > > +        &self,
> > > +        min_vecs: u32,
> > > +        max_vecs: u32,
> > > +        irq_types: IrqTypes,
> > > +    ) -> Result<u32> {
> > > +        // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
> > > +        // `pci_alloc_irq_vectors` internally validates all parameters and returns error codes.
> > > +        let ret = unsafe {
> > > +            bindings::pci_alloc_irq_vectors(self.as_raw(), min_vecs, max_vecs, irq_types.raw())
> > > +        };
> > > +
> > > +        to_result(ret)?;
> > > +        Ok(ret as u32)
> > > +    }
> > 
> > This is only valid to be called from the Core context, as it modifies internal
> > fields of the inner struct device.
> 
> It is called from core context, the diff format confuses.
> > 
> > Also, it would be nice if it would return a new type that can serve as argument
> > for irq_vector(), such that we don't have to rely on random integers.
> 
> Makes sense, I will do that.
> 
By the way, the "ret" value returned by pci_alloc_irq_vectors() is the number
of vectors, not the vector index. So basically there are 3 numbers that mean
different things:
1. Number of vectors (as returned by alloc_irq_vectors).
2. Index of a vector (passed to pci_irq_vector).
3. The Linux IRQ number (passed to request_irq).

And your point is well taken, in fact even in current code there is
ambiguity: irq_vector() accepts a vector index, where as request_irq()
accepts a Linux IRQ number, which are different numbers. I can try to clean
that up as well but let me know if you had any other thoughts. In fact, I
think Device<device::Bound>::request_irq() pci should just accept IrqRequest?

thanks,

 - Joel

