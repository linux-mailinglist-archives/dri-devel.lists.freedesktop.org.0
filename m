Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C91A9B82C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 21:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4880C10E848;
	Thu, 24 Apr 2025 19:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pp6k5+zB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F1810E845;
 Thu, 24 Apr 2025 19:19:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSJmkF90zrJ/4H1qIe3iNgj6S8ROjvNzxaEf43qseQkBYjkhfZ1owPMcYTxt9NzIumKUocga922XyxtibJZNIvkL+F/boOmUkGNxQ650zbyp4FDDuc7jPbVJKcSXk6aSKzlBHDFCmDP45XQVSpL2wdcSTP+JAqx/RGayHhFzjb5BD/9trcIhFgYgTiTS6Be6766vpKJ6U9Y9875/sM2kW9lp4cEojBUn2fL9QNGs4cSRDVHIAZ2fWDex+9iWyZWSJn4vI6LxMSOQRlET2h2MVs0dJ6AlluGnyEqTPQGQu67/xVyZIAHs7frdPL0Hf2UZI+bK3I/erMVOy3fzB/gX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XGcZFvdkllNkhBgzuL4JIscTQDkBTw5A4uANNNrld0=;
 b=MVHlSSYWHgotaXQ/8Se+qQPbeKw8HhZVJTDtkyTAVe4cZPdrFf/ZOToSWXn6P9YyZxErRXOrQfebqLaNLU+3wJCoJmi2pxuzuvR/DXmVohzqVIpst0QwS4dCtoHIBHTEnBB0NKB/AAHiXABFbBEgtC2tTtHHynuZN3IJx/Y3rgyZBew1kemdD0mtcsgV49EdCEd9mtwoeRIaSD87cUlC+U65LP90f66UyQtnQi8nlEafVEy17fg8cmKlOQM8+Pi3ndGFU7olxV5dNSBOooSMzAYGQMrooFIL0uIwT+vWoevTVMUtGE739H+y/8jOvby4CUY1MiR845maN7i/3uuhaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XGcZFvdkllNkhBgzuL4JIscTQDkBTw5A4uANNNrld0=;
 b=pp6k5+zB3BGlIMfvKuvT8I0DaSqXuEUAD/ySEULlz1xKnuyzHrk59N8ZPwH0/ZCKp1PP+WV3ni1ZQjY1CnIrUyRZtoANyCVv3hbzAc8HYjvQtcjMXR1iQAwfyZ+vCxf6gfiRwOl8zKyIGCt7q+lgk13jJRApzXAcl4XoIhRSLT/8ax3QhHnwqBurnYU7stI0YYBHAuF7uOBkEDQ+MkTzOb/xR0zpRRg/QM5irhUGAwtJKugYkM1UCkZ8zNAesRlzWyhQ0XODZk523fxcD/Abr1rzqut0nx77pEmSrRmPJsmDpDnll83iikZiJsSPmjg8OCc34w1tmLiVbai6rjgxPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS4PR12MB9658.namprd12.prod.outlook.com (2603:10b6:8:280::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 19:19:03 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 19:19:03 +0000
Date: Thu, 24 Apr 2025 15:19:00 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 13/16] gpu: nova-core: Add support for VBIOS ucode
 extraction for boot
Message-ID: <20250424191900.GA174004@joelnvbox>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-13-ecd1cca23963@nvidia.com>
 <aAjz2CYTsAhidiEU@pollux>
 <88937e2b-6950-4c9d-8f02-50f9b12c7376@nvidia.com>
 <aAkBIvfTkKVNbdnm@pollux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkBIvfTkKVNbdnm@pollux>
X-ClientProxiedBy: BL6PEPF00016418.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS4PR12MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: dd506992-1ee8-42c8-f9b9-08dd8364dfa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c5mfFE/4hrvT9qYmIkfqz9OaZQ/BjMn2r24jJdGUYj0LiRJ7hju89IwQwwhL?=
 =?us-ascii?Q?c8YGwH/9PhoJERp5Ghs724efpl7jMe68XCGIkxssHMX8I0LpVA6fWodexTVS?=
 =?us-ascii?Q?JaCaKrkhBetrRJ4xfeWuXivn/KpYBClPFjld1uIZv8bzhPWpw0BYQKBaOq4e?=
 =?us-ascii?Q?b9Rp/bJLWw+BGtk8kTc22s9RqQEzqlqWESVHPwtSSPfUQFPm/8PDzbz5pSli?=
 =?us-ascii?Q?q9t+Hi9FlB/sWlXML2dXGos3bgfqHm7zsaCZbGGpcR6zl4oRYzuYy10kFpX/?=
 =?us-ascii?Q?Nk+0HLHEXfSXrXD2NzAsZiZw6F/1LqIOBWk8dF6z0i3Zd4kKe349Aoed0TzO?=
 =?us-ascii?Q?c7OUXY8i8MJPP6SXYcAqkVXROTfrpJER+Nzv38AMc8pZCky7QTWgdU+Ulxcu?=
 =?us-ascii?Q?5qdyJduI4O26EUGyYCH9uwg/Izk1Yk9BJJNgurbVeQ3KFY04X3gwKpq0C5iw?=
 =?us-ascii?Q?j82WTkDDywXyU/oJntzqObsHOTH9WhpFZyTv3LMUP9cwRGnThDA74dCe2/Uj?=
 =?us-ascii?Q?hHJCVDQ5OeXrMtuXOepacwFczyYmZmGAXgQTjrNLSaIE1li2awgA7iSUHDQz?=
 =?us-ascii?Q?v/J9+O5Vwcm0a6FEAdytfSGJJ8uB5x3cBSFUsmlbiTuKOSyIxOiQOEj7OqOA?=
 =?us-ascii?Q?TEg0np9WvS44gwx13j2ZIeKZS4+5PhiSMwG6Ld7t/9ryWDCUfOZAaYepHz/t?=
 =?us-ascii?Q?4RlQ9PYDfD0uNmErGZZ7FSreH6Snfp20c1vHg/BHxd4PFF2Co6fVHPOrwQnz?=
 =?us-ascii?Q?A3olIQvncjt4uz0YI5c1Rs6X0GbFtcagUSAylDB/ASbJJg7TAwmAG2vQRcgB?=
 =?us-ascii?Q?EWKiOVGuVlKYyHX1HfF8ogOgkm90OfLx2G17llkuHxIlMl1DxlqS0su4JUHD?=
 =?us-ascii?Q?O9LZ6vQ/xKxxTpwqteIgjhBLV/spXBEq3tD3zzT4hwuCQInRUOWFOfXmvcqR?=
 =?us-ascii?Q?t5ex2F5IF58Jamkgmur7YCf/D7l6A6PFvZRwUFgMsE1NVPrjLIO6w6Se/g4F?=
 =?us-ascii?Q?8FHmLS+/dVy/21K26L1okPIXsLV/mklsHkQJqy5rK+o/pgyKhc4hhAXvq0Jc?=
 =?us-ascii?Q?wGbNVWOHNpl5dmweSJKwHxIfUTycz5OoduaZcZ6VCsgz9ToGfwOn/Xfr8VMt?=
 =?us-ascii?Q?hSSbBZyhIsfPBR6n0VTd1knT4pnbJLQNZ9cHjFPDCUj+oqkx2VILrGeK1Hu4?=
 =?us-ascii?Q?uE6aEaVkfvmk2u7A6NohtdPNCmbocZIoTE5nbJbX24GfsD900WqopDHFGqsQ?=
 =?us-ascii?Q?cozAzDB6YiqQ1Uxf6g7uKZgOyn5p/Bpu+GQwYU/hZO7zlk/GDr4oPYEryr29?=
 =?us-ascii?Q?ahkak128NVfhCOMyFiQV7VqLChq8gaErEbW05oLBCJclaAnAAknIsES13QEQ?=
 =?us-ascii?Q?o78ftU2Ega95Qohl0b5wlmOtCBevO3tbGS9XE0fSQdmbQw+nJPkd2xXc5ORY?=
 =?us-ascii?Q?TuaAR3BochM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YIolb0lYFm7a6w1XwltIgare2uyZ5a7M8fwAgRh66OAwaXP7Jzed7SwLejeY?=
 =?us-ascii?Q?BqRdBn2VUPrkaNGKD1zwHFonpp/elwTeS2Wofh7Hoq/ek4NOCyGtcKf95+Jx?=
 =?us-ascii?Q?h8M1rKEkIpScrewZ1XypnMmqohzdmMIpdoHhZqwb0a6R1OSpn/JSAFFkZ79t?=
 =?us-ascii?Q?pjABCYrEQRL6BcyXc03H0PgXXhAF+MBpfsjSMoTFE8PRCBKMQ0MR8uElAjpt?=
 =?us-ascii?Q?v/bTD/wZsg2J67ejkfAvBrhwX4p/uL56j6G8H7avASpob5UUggGHeI5S/xDA?=
 =?us-ascii?Q?6oytCPiofoWBga4+lXoxwrcKEWcvmY4LcWvB8wQvhPRGuAmFVT5RCaqrsq3W?=
 =?us-ascii?Q?9Yrof3gtH05ClrQsJrq978nCRN7M4BW4TOmTIih/abJ5nejfx6nkX5pacIi3?=
 =?us-ascii?Q?RbWbEnrUNzO0/9uXC1Iewx5sKJ3t99rvtMCGZGK9zDQjAr0+OM2dvLuix2UE?=
 =?us-ascii?Q?uBGJRmaCTNHcgE3o9u50heTwpFS+wLhS6hp602Tm0k3fG9OXzdDQCF+okL9Q?=
 =?us-ascii?Q?0qC7zOgXvSDQ7xONdUvlJrJFbRDyd0s5LNrw2CKq8FyL6Ems1RKrvlHAfwj9?=
 =?us-ascii?Q?bvWQGPUmcMwQ6O127Or6Dg2rpKVuBj0AAGPQb0SK/rqbGx9/iyDo+Zaj8wnA?=
 =?us-ascii?Q?aMPfAA4LMhBygw2rF2zCxbO7lRZcHnx3D6gEjQeYDucQnPKkE6IgeEIV2T1P?=
 =?us-ascii?Q?3uwBs5kyuZXM9k/zXh22QNfm/c3k1e4OFJmzLOieWvdqhzeJn/ZhEyAoil61?=
 =?us-ascii?Q?qlckSDxzM6TtVXGDAr4QEpepjgac5NoNdSdlP0qN5jasI+amksYWDFsm0FEf?=
 =?us-ascii?Q?JzKP+utn35rM7DjHI4/lHTYSs088gJ6woSSGwflmr606zub4SRvCMhiQYBb+?=
 =?us-ascii?Q?W0EIBm4W5ynLRKwxp8Y/R6J60htqg5gMLGqSGx9a6fWrZfZ73KK9pLw3FNsa?=
 =?us-ascii?Q?H9pY52wLBlXutcq6vYpTsL/LCZu0sL/Ag6Y1e0GBtI+JZjUSlh0ZKBAThXSK?=
 =?us-ascii?Q?Wh9KVdFK642p4R6DmK1bBvyktKPPvVQKlO+za9Dp3wu2uAgv1EomsbZqw+II?=
 =?us-ascii?Q?s+MDyUIoo8ZMc7ciGVPeEuT8jbrALw2URh0Gq1lA4QDSJGM22Ba231dqjliQ?=
 =?us-ascii?Q?tJ2SchACgGqPYmggEbNdQkMmNbDPDDs7aYk7sOgGxtzSxYTCPP8wuASS9ydE?=
 =?us-ascii?Q?d3LEP0jAmPJkxwbMHJEE+4a8mTgwqYfqa0DLEQVu9SwJEzeAwMbFOIXkKxvP?=
 =?us-ascii?Q?mIoFNJxkh2foL2crAmbisWymaaT/R6dxlpDzKcfkdTbePJtRXFOtN/EB0rW/?=
 =?us-ascii?Q?bvLSNXHB9moUaIYES79brBs/2uhTA0uSTS0DSfRaOxMkx1lpmq/FLvNZxuoL?=
 =?us-ascii?Q?VkISbsTqusV3mwG6TX3WVN2tfQ96jyY83gj4LtnAI1nfaVFVc4qOqbCGIJlg?=
 =?us-ascii?Q?gXWVt7WcE05Yp06JSG5PHqJDICWyvV7HfOFWChuyTAs7FFS1QcKw+/qE2PEj?=
 =?us-ascii?Q?WOuTrXj6cJt0/pNotqP/VtP6mng3/vKHoRw2nHw7237FmuGt0fUw2RZi8T8m?=
 =?us-ascii?Q?LfaTyB+bc1ZtGUQVgNiQgZeGPng5DFR4UlukC7NP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd506992-1ee8-42c8-f9b9-08dd8364dfa5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 19:19:03.1331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTkDYORE4+/hCGdQf28ebVr/i04bnPxvK8zczLwmfewuOw9bd4hTqYhl7FlXu/Z7DYpsFVa+1y9n6xoftI/hkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9658
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

On Wed, Apr 23, 2025 at 05:02:58PM +0200, Danilo Krummrich wrote:

[..]

> > >> +        data.extend_with(len, 0, GFP_KERNEL)?;
> > >> +        with_bar!(?bar0, |bar0_ref| {
> > >> +            let dst = &mut data[current_len..current_len + len];
> > >> +            for (idx, chunk) in dst
> > >> +                .chunks_exact_mut(core::mem::size_of::<u32>())
> > >> +                .enumerate()
> > >> +            {
> > >> +                let addr = start + (idx * core::mem::size_of::<u32>());
> > >> +                // Convert the u32 to a 4 byte array. We use the .to_ne_bytes()
> > >> +                // method out of convenience to convert the 32-bit integer as it
> > >> +                // is in memory into a byte array without any endianness
> > >> +                // conversion or byte-swapping.
> > >> +                chunk.copy_from_slice(&bar0_ref.try_read32(addr)?.to_ne_bytes());
> > >> +            }
> > >> +            Ok(())
> > >> +        })?;
> > >> +
> > >> +        Ok(())
> > >> +    }
> > ..actually initially was:
> > 
> > +        with_bar!(self.bar0, |bar0| {
> > +            // Get current length
> > +            let current_len = self.data.len();
> > +
> > +            // Read ROM data bytes push directly to vector
> > +            for i in 0..bytes as usize {
> > +                // Read byte from the VBIOS ROM and push it to the data vector
> > +                let rom_addr = ROM_OFFSET + current_len + i;
> > +                let byte = bar0.try_readb(rom_addr)?;
> > +                self.data.push(byte, GFP_KERNEL)?;
> > 
> > Where this bit could result in a lot of allocation.
> > 
> > There was an unsafe() way of not having to do this but we settled with
> > extends_with().
> > 
> > Thoughts?
> 
> If I understand you correctly, you just want to make sure that subsequent push()
> calls don't re-allocate? If so, you can just use reserve() [1] and keep the
> subsequent push() calls.
> 
> [1] https://rust.docs.kernel.org/kernel/alloc/kvec/struct.Vec.html#method.reserve



Ok that does turn out to be cleaner! I replaced it with the following and it works.

Let me know if it looks good now? Here's a preview:

-        data.extend_with(len, 0, GFP_KERNEL)?;
+        data.reserve(len, GFP_KERNEL)?;
+
         with_bar_res!(bar0, |bar0_ref| {
-            let dst = &mut data[current_len..current_len + len];
-            for (idx, chunk) in dst
-                .chunks_exact_mut(core::mem::size_of::<u32>())
-                .enumerate()
-            {
-                let addr = start + (idx * core::mem::size_of::<u32>());
-                // Convert the u32 to a 4 byte array. We use the .to_ne_bytes()
-                // method out of convenience to convert the 32-bit integer as it
-                // is in memory into a byte array without any endianness
-                // conversion or byte-swapping.
-                chunk.copy_from_slice(&bar0_ref.try_read32(addr)?.to_ne_bytes());
+            // Read ROM data bytes and push directly to vector
+            for i in 0..len {
+                // Read 32-bit word from the VBIOS ROM
+                let rom_addr = start + i * core::mem::size_of::<u32>();
+                let word = bar0_ref.try_read32(rom_addr)?;
+
+                // Convert the u32 to a 4 byte array and push each byte
+                word.to_ne_bytes().iter().try_for_each(|&b| data.push(b, GFP_KERNEL))?;
             }

Thanks.


