Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD859B51FED
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 20:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0803E10E30A;
	Wed, 10 Sep 2025 18:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="U0kHgsVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C97F10E30A;
 Wed, 10 Sep 2025 18:10:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9H/RpwWCbwbmVeWgeF4pR8Z0IQ7caPm9hIOmtLPS75TUMEt3HXNR/hHj/E86XdjkCslwoH6DBPADVxPRIuf6bV81Yor3/a9UisPr5fsXUaiEcQc/LEAMbHcPceQwWDOP43cJlK8XRNpBbO+VKgfknatlgsBCHB/N7qztY8TyG7Fx2rszqugU2Ae8bpYR7Q7ECdcxN6J1A/9n8Ry/B2Q0zj4d/O98Lxtw1jrz5a6ruFxyepbWxAg6pnPOoAcA0ss+TuVERHThAxkcGz+X1W5eUfphIRtqLhX8LCUJS9/5HdGuM7K1MGAll6q7Pad9T7BGcKx+RwS8MbVePevQ+RS5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWiIpJWrhfDIsBu+iDrginfVPcc5u5MN4r3Avx+i1FE=;
 b=rYi385H94HL6+q1PbVqR9CaL+BUjC5rcCS6lx8bOCP7QWkPslvDXzpuDZIT9r/mxs+K7iYcUU0isPplG37wJ2Kzz/B5ohfk+tVHZt9T7CGkqXeGgJOg3CXrYrRWiiCem/15txOIQBQAa/na5Vu3P7m13BZvQ2LGplyV2FQu474dog0F1uWsnpRq1C+E2INNYBgXqf64jsaXEFGAP5ZqZfj7bxmY2WXcwYh3nq1iocq01cZUjMM5DMjeGyGcKG3PlsjtiFOHFmVg3OGrkji/rwumvdGIQ/V61Ewg16wmY4U/VmmIrgp2h3Q6qCP4rFREJrEcY9GKJKu5p/B9yal+YMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWiIpJWrhfDIsBu+iDrginfVPcc5u5MN4r3Avx+i1FE=;
 b=U0kHgsVBjfMmXa3+4TriERio9evBIKr1tIXgIxoZdcqLNw/oZELK9WWpGqHFbyl/uocxsG3mslJRe95PkKwEJVJofg7YpACSIbI6ryLI+b2mNud9TXZuWbwedw4Hvnmth8R4eKa5q3Jl0y6qmb+muIl8a7qJWhDoyr8x6Iy8IrUxxIVfQ/9TW3+S5RVMzaiT1nJ8St/xD1N/SbNoECiPUMt8BO1POd2RYEBsa6tfgNxGWf/Xtrew37qFe8BI0A2b9rx4jbl51hEqah6sguZ02ueQ7r5GY06FQPEE+qgQfI5tf2C+5S2mheG1Jex4j49m2T/4R+472xElmQy9KkGetg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MN0PR12MB6367.namprd12.prod.outlook.com (2603:10b6:208:3d3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 18:09:56 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 18:09:56 +0000
Date: Wed, 10 Sep 2025 14:09:55 -0400
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
Message-ID: <20250910180955.GA598866@joelbox2>
References: <20250910035415.381753-1-joelagnelf@nvidia.com>
 <DCOZMX59W82I.1AH7XVW3RUX2D@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCOZMX59W82I.1AH7XVW3RUX2D@kernel.org>
X-ClientProxiedBy: BL1P223CA0040.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::13) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MN0PR12MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: fc526f58-867f-45a0-e81a-08ddf0953f9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fGMbzt2s+iYQSijQsHlOERfRT0/TVCmWKmxkb5SeUKbZpQn6ygooNcnkM9ob?=
 =?us-ascii?Q?BmBAV6QTsqEVuY3ITxoQmo654+UVI6UL++I0yVHZEoHsvocw8Ho7MtGBda+R?=
 =?us-ascii?Q?KOihNrX2xlXn0vh2012rp9y4npD1gnmbO/rabaRcDW02DWLQYGmI8xvoDLGZ?=
 =?us-ascii?Q?vj9LP7yTmS0eMe0zGXxsWUt+2wRFMtIiV4y7GL2ls1uddszu6WBoZFzipKsy?=
 =?us-ascii?Q?VfOJJ04w1WLKmUX/Ts5Ze4J2aGOtaKnZh2KGPn9rtl7jMPQNYV2KHxBshV6J?=
 =?us-ascii?Q?VE39+NEWQy0tR+AHP7IrJL7GDGa8OtEjC12eBC+R1TCt/7MjO0qXDEbUuvJm?=
 =?us-ascii?Q?7yb+/7g9XiqRfAfOn6FgdSIQN/ikmaQQ7iPHWpLdq9rG+nhp4XSvQ1P0sA1v?=
 =?us-ascii?Q?WeSN4Sz57si185Cz5lH82m7rjri4rg0jhkbRQM3U/F5f9GyA+mKs6Sulz8li?=
 =?us-ascii?Q?1rS21sALKLqLET4HloJjyBf2eOgivnPa7KwqEVfFrr1v1CYi/iwagwgFzJU9?=
 =?us-ascii?Q?MeDYVVqg0iPg7520lEO3+9016xsMZrBY2CaogfY2OpoK7g8qNzLQcwVCOGNP?=
 =?us-ascii?Q?0fsWMKVhdDtqEkj4xDlZIhsdR/rH5q8ScBQEL/3tMDCbu/J8BY+ptRHIahES?=
 =?us-ascii?Q?qGRv7AMNFhPg7CeJPxXEm5XW20ZKHVdvObXLT0RsPCIBLdBCoIrSR8roR9/E?=
 =?us-ascii?Q?4n4yaqMg3HJAcOFksa4OltGKC5bEl6kbOBV4Acy9ESEs3rrd8WFOyVs//i+m?=
 =?us-ascii?Q?6G4WwEXAma/+Q/LOBMM+1M3GPl5Edg6XwOVzbmaf8EaXRlCKjlquCJskOuck?=
 =?us-ascii?Q?XEqdLIqjEbOi3kaLI+ZFwFcYULe00MktuYzZOrJ/D7MET1FwtWGN44+WSYa2?=
 =?us-ascii?Q?3nlSXAJuEUdxqc6dusL+Ak9dtL3Ofj0Hyf7avIbQQOVmV7l4QLt697Lk4PNy?=
 =?us-ascii?Q?5WfJaMD6W9b6CkZRvXunPcK4QTTFRDahq/AlIwBn+o7Z5fhXZWYe6cJvkoAt?=
 =?us-ascii?Q?kIU/cMVTTT2U3V4y4DfYZha0eAp4vEZvtTUMWZdUU/HhVWxqCDhivAkVtA1k?=
 =?us-ascii?Q?FiORy3T7KJhrhKPafB1T+r90/Gf70tCB81Aq6vw/xXn7jagK+1OlPB6DhViK?=
 =?us-ascii?Q?9I3qysP2MdvTDA0Z2362VCz5H6GIR8jva6Gr686RdIjhXOJ2em1Bwc3H85Is?=
 =?us-ascii?Q?W38Kuf/1+ss+BgQyV7muJWmu4e9ZNPUYnF2MyMjO/4s0YO+TH3muuvEl7Qw7?=
 =?us-ascii?Q?1ss5o+OeKonxXQYankTZJyMQ0GhAj6IavLXKhTWhF/Tt9wKZ+xzFspq+LzLU?=
 =?us-ascii?Q?IAObDOWCI0vTPjF7KCORSnS+U3Gk+5aT8jZbDvsB0oZaqqDx7MxrFcEX6ZUK?=
 =?us-ascii?Q?WXwvpblALRj3tHgOrTpI6OYO3dPIwD1zZTXIyJsR8iMVElbfUx+NDRcVGoeL?=
 =?us-ascii?Q?XY+W5N6Mnzw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h99G/PSxpznkHxSIXlF9W8zAqGNDIJgoR9mYasCxAuL9RacpvGVtr2xz4yO1?=
 =?us-ascii?Q?AYbNFFvzQLA1LF+10fiD5iczN9LdLJ/WugK08SVHrtOUT5GWOjouQwk0REu4?=
 =?us-ascii?Q?6YTO2gcvky/cs/GBDE+8VLoNd4kFWuETG43EMg/lyTdmdmnZhf8CxN/0f4X0?=
 =?us-ascii?Q?HVawCshg/Ch4l2AUVJWODe1cEHqLcrd1tZbb8h+i8UBpTglctnWKseAiLHR5?=
 =?us-ascii?Q?njd/OHuEN+pTFj3y5ipoB05Xq0p4Vyl10yV3G4MYoA0r3beTA6QimcNxUJU0?=
 =?us-ascii?Q?jBeoXKOYISK7O6+wXl5IcuiFS/c7u9sJ+dN5PRrnfGXI7LdrgaTA0MYYYUb/?=
 =?us-ascii?Q?mGYfmMJR69kz2iVubIxSHqiTJCUud0VrOiaBWK2D0cYo13s4vXlsjMseVujr?=
 =?us-ascii?Q?68DkHli5hH8qDBF5Lc38Ork7bclXhf8bXyqFM2u1L8VpDvkxKNK56nE588EY?=
 =?us-ascii?Q?FVVYDp9yOBeLzPZJxVwF4lQX4dVT0QE3jKBBkQkC2jQhgesJEsw4IeTKDkX4?=
 =?us-ascii?Q?X+daWpTxf8X4wqMD+ayM76snpr6X9ziHid70TF94ljyoKla/u8VTuUzx9qO4?=
 =?us-ascii?Q?C9s3pAF54Ytr2tcTRR30MJJgBW84j5s3OQK/n0dyTMHE4xtLhvBIJbB95dBu?=
 =?us-ascii?Q?ivflSHEkd5vNH2eNgHUkU/CgSx8kYCmgeP+RFyk7wOGbdxtWAdeHWLRjKacD?=
 =?us-ascii?Q?ma4q55TBhPkyKSAReLmhyrCJA+VGwcxKIwTl0aiNi4CZODHlEqSugssP5d4R?=
 =?us-ascii?Q?OD5lsNiJ+PNcZddyZKUpRGShoK09KGWdvYPQoKNeITF38YDqjmxqHgvrcqR/?=
 =?us-ascii?Q?0Jp/fN7jlSrEQyYhQnI47RSvhPgSjUHwg6TLmA8JSUUAd3D3bNexqbW7WVYC?=
 =?us-ascii?Q?uJASFKVhtetnrLANM9+GJmQ0YSGbDBl3D8rYcn9uF7ZBROXMVMj3ACd4F3uU?=
 =?us-ascii?Q?Wxf1D8NocUnxI4ZfdgnR5ZepCWPXd/bTY7CrO1o4zW6M+LuRMlZombdbzsyk?=
 =?us-ascii?Q?neUvR//qZ0hpOEDMBVzfFv7sq+pRijDUbx0PnGK7Oa/MtOf0coOF4THm85vH?=
 =?us-ascii?Q?X0JJ+ipP5uT1D5+mFRMBateFD9csh7m8b5HpQ5ly7ASr2bpUO81odjvCEF7V?=
 =?us-ascii?Q?ptiWpPKj8usOrRPO+80AOFLX7Lxv3/qm5AYR0jShutnGt+pZPFfUAlfMyv99?=
 =?us-ascii?Q?SoZBrHZGjKrFd4TGV9gdR3OvZhQuiLgbPSeSqcBEm3dA3mEDl/+uPeCLA+aQ?=
 =?us-ascii?Q?pBrppuczrAkIeoAo9Wwne4OOARp+9wVuzhG29+ml52X0yLXBr6W50yYGSwlA?=
 =?us-ascii?Q?F20DXXO2BSfG15iNk8533vgytog+kkD7iN4ebWYJhYHVhtmGJtVSEOPud5wD?=
 =?us-ascii?Q?u72SAiUNVXodsMUbBW+bRAmHA35/bKLWSV/ioAcCgTf7CX5ur/nv0ybrvo3D?=
 =?us-ascii?Q?u2b0UcgZPjjYjWW9ppcsbFSS0Ws5BTmagQapyveUgV3MXNtr4NJUTYfZY2Ot?=
 =?us-ascii?Q?t7tsebitTPKvAKYA2lJKoqniidOyIT/dfYaBbMa7yu8Zs8jzi0m+7n6kzmuR?=
 =?us-ascii?Q?dEU4ETDgx8pZ1b3dF99UcS3bF7mJ8/Tf3Cf4TqGZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc526f58-867f-45a0-e81a-08ddf0953f9e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 18:09:56.6115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //n0JNta1c0gREpagwcG8oLLVPx+coqHty3lElsdvpI544a/9BxuRI/678r/rLhz9IuB4971qNYIj6WxD2qBjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6367
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

On Wed, Sep 10, 2025 at 10:47:05AM +0200, Danilo Krummrich wrote:
> On Wed Sep 10, 2025 at 5:54 AM CEST, Joel Fernandes wrote:
> >  impl Device<device::Bound> {
> 
> The Bound context is not enough for some of the methods below, some of them
> require the Core context, more below.

Actually my patch already does that, the diff format creates confusion. Some
of the below methods (like alloc) are in fact added to the device::Core
context.

> > +    /// Free all allocated IRQ vectors for this device.
> > +    ///
> > +    /// This should be called to release interrupt resources when they are no longer needed,
> > +    /// during driver unbind or removal.
> > +    pub fn free_irq_vectors(&self) {
> > +        // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
> > +        // `pci_free_irq_vectors` is safe to call even if no vectors are currently allocated.
> > +        unsafe { bindings::pci_free_irq_vectors(self.as_raw()) };
> > +    }
> 
> This requires the Core context, but we should not provide this method at all to
> begin with; it puts the burden on drivers to remember calling this.
> Instead, alloc_irq_vectors() should register a devres object with
> devres::register(), so this gets called automatically when the device is
> unbound.

Great idea, thanks I will try this out.
> 
> Note that a cleanup through devres is not in conflict with the Core context
> requirement.

Got it.

> > +    /// Allocate IRQ vectors for this PCI device.
> > +    ///
> > +    /// Allocates between `min_vecs` and `max_vecs` interrupt vectors for the device.
> > +    /// The allocation will use MSI-X, MSI, or legacy interrupts based on the `irq_types`
> > +    /// parameter and hardware capabilities. When multiple types are specified, the kernel
> > +    /// will try them in order of preference: MSI-X first, then MSI, then legacy interrupts.
> > +    /// This is called during driver probe.
> > +    ///
> > +    /// # Arguments
> > +    ///
> > +    /// * `min_vecs` - Minimum number of vectors required
> > +    /// * `max_vecs` - Maximum number of vectors to allocate
> > +    /// * `irq_types` - Types of interrupts that can be used
> > +    ///
> > +    /// # Returns
> > +    ///
> > +    /// Returns the number of vectors successfully allocated, or an error if the allocation
> > +    /// fails or cannot meet the minimum requirement.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// // Allocate using any available interrupt type in the order mentioned above.
> > +    /// let nvecs = dev.alloc_irq_vectors(1, 32, IrqTypes::all())?;
> > +    ///
> > +    /// // Allocate MSI or MSI-X only (no legacy interrupts)
> > +    /// let msi_only = IrqTypes::default()
> > +    ///     .with(IrqType::Msi)
> > +    ///     .with(IrqType::MsiX);
> > +    /// let nvecs = dev.alloc_irq_vectors(4, 16, msi_only)?;
> > +    /// ```
> > +    pub fn alloc_irq_vectors(
> > +        &self,
> > +        min_vecs: u32,
> > +        max_vecs: u32,
> > +        irq_types: IrqTypes,
> > +    ) -> Result<u32> {
> > +        // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
> > +        // `pci_alloc_irq_vectors` internally validates all parameters and returns error codes.
> > +        let ret = unsafe {
> > +            bindings::pci_alloc_irq_vectors(self.as_raw(), min_vecs, max_vecs, irq_types.raw())
> > +        };
> > +
> > +        to_result(ret)?;
> > +        Ok(ret as u32)
> > +    }
> 
> This is only valid to be called from the Core context, as it modifies internal
> fields of the inner struct device.

It is called from core context, the diff format confuses.
> 
> Also, it would be nice if it would return a new type that can serve as argument
> for irq_vector(), such that we don't have to rely on random integers.

Makes sense, I will do that.

> > +
> > +    /// Get the Linux IRQ number for a specific vector.
> > +    ///
> > +    /// This is called during driver probe after successful IRQ allocation
> > +    /// to obtain the IRQ numbers for registering interrupt handlers.
> > +    ///
> > +    /// # Arguments
> > +    ///
> > +    /// * `vector` - The vector index (0-based)
> > +    ///
> > +    /// # Returns
> > +    ///
> > +    /// Returns the Linux IRQ number for the specified vector, or an error if the vector
> > +    /// index is invalid or no vectors are allocated.
> > +    pub fn irq_vector(&self, vector: u32) -> Result<u32> {
> 
> This method is already staged for inclusion in v6.18 in driver-core-next. Please
> make sure to base changes on top of the tree mentioned in the maintainers file,
> driver-core in this case.
> 
> The signature of the existing method is:
> 
> 	pub fn irq_vector(&self, index: u32) -> Result<IrqRequest<'_>>
> 
> We return an IrqRequest, which captures the IRQ number *and* the corresponding
> device, such that you can't get the combination wrong.
> 
> Maybe it's worth looking at improving the index argument with a new type as
> mentioned above.

Ah Ok, thanks for pointing this out. I will rebase and reuse this.

thanks,

 - Joel

> 
> > +        // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
> > +        let irq = unsafe { bindings::pci_irq_vector(self.as_raw(), vector) };
> > +
> > +        to_result(irq)?;
> > +        Ok(irq as u32)
> > +    }
> >  }
