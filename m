Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F34BB7C7DA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33A810E720;
	Wed, 17 Sep 2025 11:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yl9L/cE9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010060.outbound.protection.outlook.com [52.101.201.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536C210E720;
 Wed, 17 Sep 2025 11:09:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaDMimkmxOgU1u3GPpF8Tta6Kjbta6FJD+zHvDDyAsYkzguRheeHWvs6HdAGSS46mfonE95pyJqZz2XzHWiM9xzGqjunfO2EJq3Tx2PlrOKwWb0yR0MbtyA/k+hz9FyHjD07V7Cfjh04KXhA2+yYRecuE2N/ozIJDSLLzYPHOc/SkGQpmLut1gdR67ASdT8HW7YO9IG3NkOPvuL2KTLqlFPvzXbtXkx2Dzk/j2El1GQojmMNGrrF9NKPIRfHQKi3nDiOlc7fhklMNphD1pFqFOfjTxyTCkd2UdZH96Zlaf2yX54M/WBq1W+rwcCZnACd/mbMh0jGHApTO3/2q9Bp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFQjmbwZuvgBLQlktU8gQrEZbnInbsD3jUSH3a6v7xs=;
 b=HNBgJzgTFGGLoESf050Mg4WYOHQwhFM0y+XcK2CsJ3Q3MLxrm2tn4IvXfGdXwFuX0hPCmV+pCTrzxwnMMx7bB5/Bm5Fq0JdCkRtDZbLZBIHlwK5INV9Crk1mZCZGe0NVnAKHs+yKdY71LRGhdIjyhzyo5X+HZfsJImwGgK2r7rZ4i/QWUvEul2fYTV94WhvzeH1jDllQDuyTqQWMmVTcveBWw1YdmdtroDNyiudEyW3vFTTKll33in/DgNavCXN6sTNS9pY4cWoOAjf7LFX75Ypr7sfdAdGeIYKgNKqouQVWnD1ZHDyAQpsbBWPvePZHeevIME/HXaljtGJwm6mMLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFQjmbwZuvgBLQlktU8gQrEZbnInbsD3jUSH3a6v7xs=;
 b=Yl9L/cE9vPIY9um2zmCBiZh88wJqfZ1UosH7f6ratSPufGZAmEYEZ/Lx60ilAuKo3Jm+7gLQlVbilp/zUK29GGiS4yNuWJWKg876MXVBhRYGfxYbYm1StBfow9sua0Y8XSYZ6RItJ1AcxdamoD99SBqKFjkDrvMFRP/bvFab5TUywD91CHgJ9ZfETuS3/4ZpaHDlCYTwuwgDdkddijQLbI4NZJiE0qK2oLEiA2PVs6Ftsc/Ud9pcTCn0GFiPJSf56YphPLA4sGRUgtepPmBFHo7vmJdfkVUgqklREZysh2ArrcMfqUZQGrL/+haAPh7QxtgpG/F2qJdM/FHUXEpU1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB7826.namprd12.prod.outlook.com (2603:10b6:8:148::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Wed, 17 Sep
 2025 11:09:16 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9115.022; Wed, 17 Sep 2025
 11:09:16 +0000
Date: Wed, 17 Sep 2025 07:09:14 -0400
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
Message-ID: <20250917110914.GA1797159@joelbox2>
References: <20250910035415.381753-1-joelagnelf@nvidia.com>
 <DCOZMX59W82I.1AH7XVW3RUX2D@kernel.org>
 <20250910180955.GA598866@joelbox2>
 <20250910190239.GA727765@joelbox2>
 <DCTA2J6Y2PSC.1B48J5ZHUQCOI@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCTA2J6Y2PSC.1B48J5ZHUQCOI@kernel.org>
X-ClientProxiedBy: BL6PEPF00016410.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:17) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4703f4-89e5-4ecb-ea6f-08ddf5daa417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SprWADx/u8ZpAEWoithsBQKLvhWbmOvg+mv6oC6ZCl92+KHf8SOqj0v7DSTz?=
 =?us-ascii?Q?+EJKbQP+aYdiSJuZYoY9cqUYcEP6ljehc8rSV48ciLhuxJVoskvy6fCa4kMT?=
 =?us-ascii?Q?j1glkcJv2NxkSo09xi9vMMnU8jRk1UsaKm9OyxZZG+gcnpgREXa7vtV1O0vT?=
 =?us-ascii?Q?mH+zpydngCQ/kxGNhCO/DTV3iXvnzMXwWNaU2Wi68QvBBm69FBjfRkTz2C81?=
 =?us-ascii?Q?LUKxPW2KFiKXd60s9I3Sc35s68KXFlq9iYnMRZroo1/rDAw2GhkhgWmiq2fd?=
 =?us-ascii?Q?4ERwlPY1YJlJ01dAmWpZNrLamnO3/nvLNpEDAY9dndLqzC1foRkokDe/ZjJO?=
 =?us-ascii?Q?UF3RKhMoLWMHzkuOFwU0Ujni3ULS2pN4NUqbZ+q5r1j1qOjOeWccrPeLNoq+?=
 =?us-ascii?Q?SNW2huXguzouvzMEOtC0Mk/NwDoBl0DQr3qec2gzN009Hf7USUejO0uEAzki?=
 =?us-ascii?Q?P/bRz5ku8goZndFvi2gUhk2YlBmj4niAf8YEUeF83FBMDJOwGNWJMd6OdlwV?=
 =?us-ascii?Q?TxpGVbTUMmI/FRckl79EjWkNHkv8NIe5oh2Ywt2TRH9gbwTWa9Hwlt0YD4OB?=
 =?us-ascii?Q?7N991UHM6PiPd5Xm2O0+RMfOpX192vJFxJFLZjnLb+jBZgGEtHF1uHQLNrkx?=
 =?us-ascii?Q?iYrlnnDD/iJXqdS010uk2q7zXBbdC8OWXerGHWxNIoqsQ+erRGgot90ZsGXX?=
 =?us-ascii?Q?uRnAF33mxEMH7kmHrMmgvi4nXKAheMnqknpiUcxaBda82X09YcyaQ1qw4fbP?=
 =?us-ascii?Q?IsYGxJoSmzXXIrK+PeLat/mw2hrtdSa9QRc8gkEPntOCYVgA9UXxyMiZS3Kr?=
 =?us-ascii?Q?cuZb9Y6E2sT/VuftM8ZndCT1RcYEGqMo4FTZ12eop4p68TR1mB38oRulP42T?=
 =?us-ascii?Q?VObVV9gRua4dfTwNDibFOLwWlHlvsFV3nEQVJvckWZh5+irFu1pQmMbimj9b?=
 =?us-ascii?Q?iFMgi4RfOd8S81sAel4sCZQuMBA5OpmZlJ0NJvV85pR0JyvW1JdALFYjE7sV?=
 =?us-ascii?Q?7WVB63Wtf010Q/z6a4sCxl0gYxLni9LvbGXS+Z8k1hCmrdeC5ExJ2IA+MnRJ?=
 =?us-ascii?Q?SASaAD4PxMFaqgIlKhiuKig26IKKn/vwORTafYDP9SZut7ZSaKCT7QvXYCui?=
 =?us-ascii?Q?VAIx4kFSEIqjOslVIDk4rzlNtBD8dhCgBLaWHBPszKrzv6laRhYmVl0urCUz?=
 =?us-ascii?Q?/He6VaY86pD4koufgdIDkhc1zodxaasW0WIRxtjQEd/ic+Rn/xl+A12a3Tcf?=
 =?us-ascii?Q?YfyIbwq8kAsKLwMoBd+hdgluudJr/5FiEsz9DtbYZruREsw3trDZcahqLhaH?=
 =?us-ascii?Q?ISTpnSJnj5XpadfCzbU0PAR6A5BivsFq+OVUXI/JYijuAOBf9tUzQDhqAQ5N?=
 =?us-ascii?Q?8LxT3XjGPqx1VLoq0t90wKVo6HMAqV6skAo6an51NyJFRaSf2v2PT6As18zA?=
 =?us-ascii?Q?k8il94QcnSA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VHp4zImKoBuzt0oKLLJbG+/INZlo+JsMTpdBohfySkDauuWALZJJoy1Q5sYz?=
 =?us-ascii?Q?BZycsJeXyZRfYJ/x0TmrTH0qwTPnQjN/NbpGlcgJaFNBfmruqNFak3TtxaSd?=
 =?us-ascii?Q?VbiCDwc+MQep6EXpvByr7hqiW37Ci5vO/acEGmRxNCIdlYdUGP7DAiqYPyhs?=
 =?us-ascii?Q?nQndRn7jA0wNs4lJh+AoySrhcJ4I3MShtvL80aiiJQ8kwaGom9hbz4qJ55Nn?=
 =?us-ascii?Q?wbqUgkTRuGgILL2tfWsc2NfIY5uxX8DwNMHCibCG307gGAqExo7Iv82vMumg?=
 =?us-ascii?Q?Bk4rVnwxktelOzpqrWR+cmXa8R5tF1GwjODb+wJPH3zuc3mkabhnPYloExFA?=
 =?us-ascii?Q?reqxcvr/4qHbSDLhWhyMFboIPSVEmADwos3VoM7UfaVm5RvcXXz1tKcmINDW?=
 =?us-ascii?Q?duJhhYCMNQ8ENuKLwB0n4biUmCwAQjz1GZcWbjWw89YruB3PqQuszCbGcsRe?=
 =?us-ascii?Q?guUJTsoLLiaxJz7MgRP1pKfCM2Q9tyntB4VaW1xgcNmTa5H1gfKeK2b8II21?=
 =?us-ascii?Q?1WFFLT/0TV0cDEKylj3OK7wVz7KvdMUqLd/R4qSVJscZ8ztA1OZDmZOH/2db?=
 =?us-ascii?Q?ewfNxan8uQ825VUfcVygJnEpZHN2CrM6ser+w4if8SNOqr5HGeQbgebgeJjy?=
 =?us-ascii?Q?LVGlrA48C7YnGJQPajjiYNsKNifiNGMy7+RA9PICLfkkmh3Gju5aQA00oLrG?=
 =?us-ascii?Q?OIWSPEocV82b3AG1Wsd7VhHj6KFlL9iY36ahv0lfrmjTYZJ/0WwHEXaQhoNm?=
 =?us-ascii?Q?ULzYy3JTGHkzA/lIv+2jocr1dDQ9dWhRfeciN6SPJOjV0feLj5Ajz7WkNs3G?=
 =?us-ascii?Q?AoLc+BaRdBLnAHnSoAm+VfPtFYfFg1bsSzl3GpWPPslB1sDvmxGgqh7nQMy4?=
 =?us-ascii?Q?s4H8wFlxfYXRX8TFgKgDoEFf4DI2R0LcJre7lfTKWLca/GZvIGtolg5esP2t?=
 =?us-ascii?Q?g0Xg3EolarN/1UsewGAzFfurUrw7wtyXM/n8RNO2rnFqUNtVRrF8Ngj39evf?=
 =?us-ascii?Q?s2K46kYw0Fuc5B8ARbtZD1m12QAuBVSAxQOZbWV+8aXODm44ft/nNbIML4ur?=
 =?us-ascii?Q?0RLWNm5REPGrtbFO9ZXwu3+hNrBQqzqmXl6EiSpsv0t8poozgnTk1tQmUE8J?=
 =?us-ascii?Q?oa0IeDh+Zq5urUmtBV0y9RhDTVKgSKaUP55lfLMo+7nACgXKq1vuRrAnxQ6+?=
 =?us-ascii?Q?I3ECK23/8BU3JKXAgACB4cuHTH9iy92xiz+fpHVNQ7mgMoTsOgO3g/E4hXGt?=
 =?us-ascii?Q?5Rst6SlHVjsZkdZebPJ7WbjKheQywXiA2o6QK7HBW79j1o6f9KfHq4gm3msX?=
 =?us-ascii?Q?h4GTbz1jzS1ZR/WCKmwA2eGG3q65AzyCdBc3kHijIpTorhW55HYjTXrscPWG?=
 =?us-ascii?Q?FvhOyddslC3b3enQjX0oULDDwwcgVRdduFtGe2C38o9OZKXMjP2KY0EA0C1e?=
 =?us-ascii?Q?cdAxw1EoRUY7SzOjBTBjx/KF5VtNA9WqC3W3lCbhx/NQ1krjfV/1cU/PhFxE?=
 =?us-ascii?Q?nYOZdqkff0Z/4kq5kRKuV2lTzUh084ovX9DI+SP12mNWG8lSL2lziwYmUQtt?=
 =?us-ascii?Q?wdkYnRg7cOKZeMo4MwTAr9NVI6avKOu80j8sfVMZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4703f4-89e5-4ecb-ea6f-08ddf5daa417
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 11:09:16.3103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/97MtssD/QLljfwpsmKp9R5sRZbYvROqP5Mck3/nS8Bwy219ny0tFRZYoLVKW3dkTdIBznyktfym+DDxDMO8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7826
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

On Mon, Sep 15, 2025 at 11:48:19AM +0200, Danilo Krummrich wrote:
> On Wed Sep 10, 2025 at 9:02 PM CEST, Joel Fernandes wrote:
> > On Wed, Sep 10, 2025 at 02:09:55PM -0400, Joel Fernandes wrote:
> > [...] 
> >> > > +    /// Allocate IRQ vectors for this PCI device.
> >> > > +    ///
> >> > > +    /// Allocates between `min_vecs` and `max_vecs` interrupt vectors for the device.
> >> > > +    /// The allocation will use MSI-X, MSI, or legacy interrupts based on the `irq_types`
> >> > > +    /// parameter and hardware capabilities. When multiple types are specified, the kernel
> >> > > +    /// will try them in order of preference: MSI-X first, then MSI, then legacy interrupts.
> >> > > +    /// This is called during driver probe.
> >> > > +    ///
> >> > > +    /// # Arguments
> >> > > +    ///
> >> > > +    /// * `min_vecs` - Minimum number of vectors required
> >> > > +    /// * `max_vecs` - Maximum number of vectors to allocate
> >> > > +    /// * `irq_types` - Types of interrupts that can be used
> >> > > +    ///
> >> > > +    /// # Returns
> >> > > +    ///
> >> > > +    /// Returns the number of vectors successfully allocated, or an error if the allocation
> >> > > +    /// fails or cannot meet the minimum requirement.
> >> > > +    ///
> >> > > +    /// # Examples
> >> > > +    ///
> >> > > +    /// ```
> >> > > +    /// // Allocate using any available interrupt type in the order mentioned above.
> >> > > +    /// let nvecs = dev.alloc_irq_vectors(1, 32, IrqTypes::all())?;
> >> > > +    ///
> >> > > +    /// // Allocate MSI or MSI-X only (no legacy interrupts)
> >> > > +    /// let msi_only = IrqTypes::default()
> >> > > +    ///     .with(IrqType::Msi)
> >> > > +    ///     .with(IrqType::MsiX);
> >> > > +    /// let nvecs = dev.alloc_irq_vectors(4, 16, msi_only)?;
> >> > > +    /// ```
> >> > > +    pub fn alloc_irq_vectors(
> >> > > +        &self,
> >> > > +        min_vecs: u32,
> >> > > +        max_vecs: u32,
> >> > > +        irq_types: IrqTypes,
> >> > > +    ) -> Result<u32> {
> >> > > +        // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
> >> > > +        // `pci_alloc_irq_vectors` internally validates all parameters and returns error codes.
> >> > > +        let ret = unsafe {
> >> > > +            bindings::pci_alloc_irq_vectors(self.as_raw(), min_vecs, max_vecs, irq_types.raw())
> >> > > +        };
> >> > > +
> >> > > +        to_result(ret)?;
> >> > > +        Ok(ret as u32)
> >> > > +    }
> >> > 
> >> > This is only valid to be called from the Core context, as it modifies internal
> >> > fields of the inner struct device.
> >> 
> >> It is called from core context, the diff format confuses.
> >> > 
> >> > Also, it would be nice if it would return a new type that can serve as argument
> >> > for irq_vector(), such that we don't have to rely on random integers.
> >> 
> >> Makes sense, I will do that.
> >> 
> > By the way, the "ret" value returned by pci_alloc_irq_vectors() is the number
> > of vectors, not the vector index.
> 
> Sure, but the vector index passed to pci_irq_vector() must be in the range
> defined by the return value of pci_alloc_irq_vectors().
> 
> I thought of e.g. Range<pci::IrqVector> as return value. This way you can easily
> iterate it and prove that it's an allocated vector index.

Agreed, I will do it like this.

> > So basically there are 3 numbers that mean
> > different things:
> > 1. Number of vectors (as returned by alloc_irq_vectors).
> > 2. Index of a vector (passed to pci_irq_vector).
> > 3. The Linux IRQ number (passed to request_irq).
> >
> > And your point is well taken, in fact even in current code there is
> > ambiguity: irq_vector() accepts a vector index, where as request_irq()
> > accepts a Linux IRQ number, which are different numbers. I can try to clean
> > that up as well but let me know if you had any other thoughts. In fact, I
> > think Device<device::Bound>::request_irq() pci should just accept IrqRequest?
> 
> Currently, pci::Device::request_irq() takes an IRQ vector index and calls
> irq_vector() internally to convert the vector index into an IRQ number.
> 
> I'd keep this semantics, but introduce a new type IrqVector rather than using
> the raw integer. So, drivers would call
> 
> 	// `irq_vecs` is of type `Range<pci::IrqVector>`.
> 	let irq_vecs = dev.alloc_irq_vectors(1, 1, pci::IrqTypes::ANY)?;
> 	let irq = KBox::pin_init(
> 	   dev.request_irq(irq_vecs.start, ...)?,
> 	)?;

This sounds good to me. Thanks,

 - Joel

