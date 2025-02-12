Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB82A33357
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 00:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2514710E317;
	Wed, 12 Feb 2025 23:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ffQN1dD3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587F010E2DA;
 Wed, 12 Feb 2025 23:27:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcqlawlN2GB9w0yr7sZuxTCIJze7qHZJCFSHcQaI29dTe6s4rzkRvDHBCrk3BpAW4ABa9Pl6T8KzYhiQtlxS0CqR3j9nU5MiTpVTkwA7B4Uj2yeeooaWatxTxTkeTicm/MJ11dV5h+3Al0Wrf9zfEVAavX7pcb4p8/AG36XS/MCF9QSeDl63tJvCoJlu1sCDvr/GG9L0Kqz+Jg7+4vwXTOEGUumc2X4zWgNU+pwpKICgG/aIxmNL9WrEg+ICPu3t9T88h/WHAUy5xBhqXN8enguETjZm8kBZTcFhA4hVzEnSa3plbrPIkEcxT3jCyCOnNG6MFlzq33szEP9/LW2eZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGlbJQYDNTixszmPwhf3NFyiMcRfvDKUXvIoiwpKqF4=;
 b=MD1lIp7l/rIMyDwMEFpn+4BvT35e2kcnO6G1FTg40ErqD5wrx79Y0BeOlxPWm7cmN0pcZ761B+X/trP6xEokkne278rs4l5uEPOrVbNncZVJZSQHGICEb8FHLnCOdL/SL2PQcbzAHWVDd1rH6UeaCAt/bl3Z0F9aNAEpG/aYl3FRGz26M2J6M7UprHk6+pvAigl4kZEOa1qCL1LDv1lxRkxS5ywbtcXxHDxUW72jdmQVeO1WXGZLcfsauetuNR7x5xR89Zpa9e/uIHXP5f4W8ycgIJNpcYY0rbKBAqc92eRhT/frIR9PWwyiVqTn5cGO8GIBQ17qlrKviO7W8Mg8dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGlbJQYDNTixszmPwhf3NFyiMcRfvDKUXvIoiwpKqF4=;
 b=ffQN1dD3HYJQH7917O6x7O8npCdikGN8t7j6rTgxcwr+8aO66AVM5aasqOQJoIiCNUYtAa+FCt/41h5CZ+jmlispcIK4dk5H5gm6dfza4XBeb1SQtNDMtJaqE+p+MbEu2rStwZqQmVhvf0T5sgxhkzbdAZpMlMzcqzC6bDgWRob5sbU7SGlWZrdWD6a4btirfITtoqyNP3/i+ED2wGkk1ibdMj8GlJTWpawZle7Bbqvo01NEtQB67c8whthFZUwCbkFsUkeOBVhI83RTe9bPNWoEbR7qSTroEoY1IlR/8x+nneqwubX9ipd4xo7UnAPxmo3hN9kNEwyXJgx2/zeUyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 23:27:07 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 23:27:07 +0000
Date: Thu, 13 Feb 2025 10:27:01 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ajanulgu@redhat.com, 
 lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com, 
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com, ojeda@kernel.org, 
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, 
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add initial documentation
Message-ID: <xaj6mg4rgm5teesapw5d2npkr3oagaon5baqiplhzjag2fwv2j@kscfzjg3cfbv>
References: <20250209173048.17398-1-dakr@kernel.org>
 <20250209173048.17398-2-dakr@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209173048.17398-2-dakr@kernel.org>
X-ClientProxiedBy: SY8PR01CA0006.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::31) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|DS7PR12MB9473:EE_
X-MS-Office365-Filtering-Correlation-Id: dfbdb689-828c-44ec-9f0b-08dd4bbcc3d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GMGkix6/3YZI1I7gtY94CFa31PR/0KVEBLMbD0JPYkH00BS1/tSeNBzRxUB8?=
 =?us-ascii?Q?xN59cDO7J6gD+7XUZS3KW6wA1Zh4fqKBKe4yPPT5BI7GqZdRFbt7p43Cq+ua?=
 =?us-ascii?Q?Bvi3Onm4v5Kd8FU0bwNzddzR0L+H9/gj/w6uI4Jg09j2NUvKhIrHFQ416Yaw?=
 =?us-ascii?Q?Dd9WhdW8/aWc/kBOX/AqZzgSjIeURb6gXoytLCxh8GxZFSgW/P9YFFCf/Sk9?=
 =?us-ascii?Q?3fUcwPoDXXJQIO86limrsJcBNqGia7uMrKKQcUy/8PJeZX+Bqkb8WpQ5dPwf?=
 =?us-ascii?Q?xCLbp94zOnJ9H/opGIfWXLjPlpw7J5E9ISrgDezrE9rMKlhnGyysfvwIZ3wx?=
 =?us-ascii?Q?NjTsdzMbKmGXfrOLvN56YjesrzFNQcul1YT0Bu84uSvUtWzbgl9kG16HNBQB?=
 =?us-ascii?Q?HjEWvbt5HS86tKHJCpORzG7eaxLc5JnIT3YcjnTE4B7u6CIYqv9/pzWMWSZm?=
 =?us-ascii?Q?/BmG3ffLolhykT1EoGpGMTrmayhJrjTaDg0Dq3zPqHEIQelQ5rvu57ePva5G?=
 =?us-ascii?Q?hbOt6Ivf79FKE/w+iUJJveSqXeQp9nz1P56P/3wVnVKTXuspDuCUh+KwLMoF?=
 =?us-ascii?Q?itxvvp03T3CMM1KdFVZAbcn5rzBN6ysdBR+w4373xP3Ba59ciF61g1vQe2nJ?=
 =?us-ascii?Q?ih/g0VbL3VXGzY8PMRsS5NaLurVc9ggrVVYgTGpA33BmxzZ1migC2EUCge7t?=
 =?us-ascii?Q?/udDk7Egm6w/NZqsBcgzOvuf7JHm0I591uuZK0EhiIEJQl2Hw44s20jn7AVj?=
 =?us-ascii?Q?A9cu5c+9IHLTU/yJOEeoyg+2P3R9BhdWcVNxEi2oUahj7iTQTolYorLp9sLW?=
 =?us-ascii?Q?B5MQ8xxYcgYZMFeqbpgfWYIWOPTkmO4kXaMOe2NVbpV0AIoMjzj4lpTzWDSQ?=
 =?us-ascii?Q?6Az7wcY068sZ7ywOM6xAVAMtdJC2ofcWPYkG4b/CNvWCY3Qrhy5eDqW0x5+9?=
 =?us-ascii?Q?Om/OeMrAXQb5iXeugMPG+JGZZ62mgaSUtetUPeJQQHK2EmrR2iK2gIDGLFTf?=
 =?us-ascii?Q?MO7YTF5qyOAhAVJUQIE0aiMZjG4GGAyPTkbRjA8fOACMpSqQVh4fQoyEj69q?=
 =?us-ascii?Q?X6K9M1pYKLpio4sTl6AYckeT9VsHm78XB6qkqVLbjCm1r1PYfQYuC0Gql57+?=
 =?us-ascii?Q?nhyKMiEghUbTvjiPJ2tl7yfdyT/Lm1N9zz5CWVjfNDixZZNocIjee2DBujwx?=
 =?us-ascii?Q?9GnYyw0N8RDSafnj/2mHBe29mCPjqECYYZ7wbO5ZW0gmxgI2avkgH+GbUNRe?=
 =?us-ascii?Q?yFMReqc9SrlEZez+9UnVMO0ydHaFi7V1DYRvJQVTcWEcQDTvpa+TGhVlor8S?=
 =?us-ascii?Q?2zttp1COj8I8VOG7IzxK5/NM/y/6K+aQDBU6QsggEZcZxjaFywMOuIoayXdS?=
 =?us-ascii?Q?ZR9BcxQOoS4d9dZIQOmO8LIxJtV/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7705.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V/pNU8jEjE9MEvvRDFLmCocIHhaQzyn6ft9zsJQHIYmWrV6GMWwgD9EE2ryZ?=
 =?us-ascii?Q?CFbvrz5G8OuLoyN7Q0BbUUbC4CVDL4xbAdswpU1uFBHFkn4/gcBuuieYznzs?=
 =?us-ascii?Q?h3i7zaeqnHMOxdNkUYr3b2ioOwIsjVIRlbCwq85h4VwurFQQPe1Ls6YrHzLU?=
 =?us-ascii?Q?F1Ypd2fAnVh0XRnA0mB8FIQl2q9KvjMOYmRL169o9y2TgjIYFeZurQ/l4R2x?=
 =?us-ascii?Q?PpZDKxfdLWp0s0HWT8RbBpxQc6f7fGTBoGslYhWxXN3BgMpCA/5pS3XdZvcj?=
 =?us-ascii?Q?iYtkPNOCyuFGpXX33uQD2hLh2u3BtHY3339e6gGPZz7r3CKFcvIFP/VuGkKI?=
 =?us-ascii?Q?4GRSAa4wZJxuR7EczGFpPCCBtpsa68LzMvifbclS/C+v2ir1R6q1BlUBHH9H?=
 =?us-ascii?Q?nk2Ew3ncA8xbUbQ5YT6GTUBuS60EMYGH1yqYAffkxAgK76SOTWa1DbpmoGyf?=
 =?us-ascii?Q?mTAjha4xa3HLTuCwQLnRi2kSLtLi9url5dLV288UP4pffFSS1+IXGwgYepf/?=
 =?us-ascii?Q?a1RH3GVv6MgLDQFoWg7snrb0pUDCzdpk3RA8ZV8dMBZ3l3m2IaF6p5nBmzLi?=
 =?us-ascii?Q?XNwQ7JIezQxo7F8PPoCgrYtliiW6CqkYosz7gXfdiyQScK1QjTpsGCsWjzGw?=
 =?us-ascii?Q?9x5AugVtyVFFiaJJipv/c81QaG33iwG8MiUlMiMWwkRT/5jUEUmPd1Zo8cmM?=
 =?us-ascii?Q?1E0+yGgqFzLyHKy7m6xhJhlDIJzpBjGBLU7at5ozI2d28aX3dAyEdLoq6Bnd?=
 =?us-ascii?Q?C5WxWnC4rKv7M4VFJpZjibxVIskXfAAm25tgcWIZ9GCYpRPsPo/F12y9v1mg?=
 =?us-ascii?Q?s7aLaJEIM8I9uwjeCNmsKjR7KX81Pr+oZCDEDleNohYSdnsTT6vDj1scE96/?=
 =?us-ascii?Q?nfA9yc3KR66SI+LbYmYt7rzouvE7/zeBD3BUJAg0YFzq7ARg/GEgLS+wmUzN?=
 =?us-ascii?Q?o9I2IL0GtQ2/+kubFmltsUGzyvDCvr0M2W83IaYHUW1hgimx0IsqLWbnTJZ0?=
 =?us-ascii?Q?eRvF+++ZPhB/WOCpSz//Xy4SM32MoSfZTcIADcLj/W+tPBbf0xcADCSe3v9+?=
 =?us-ascii?Q?e1bQFMjIg0kjdY0psuq9U/azX2oHbf/Uc0Dw5NCuddHVHmZpiojiMZAi2oFQ?=
 =?us-ascii?Q?yZPjZsP+s0C6ITDaOM2mJxlEW7OAFIkm03UTgIz5Owq8B6IVQXNq69tOGnf5?=
 =?us-ascii?Q?S4Yvqy2j1FEgrWoFDxAAZmUQta65Bm4ogCmyX7WE7eXsnM+WhsJvrve6rZwG?=
 =?us-ascii?Q?kk3po80DM0eG7l4iCLAT0jf6L3AjPshC6nVKq0vFGSx/smBtSGt3NDgJEpZ5?=
 =?us-ascii?Q?f9VZ8isZcaEXsbOEOtvWxyJBAEMxuJm8OMphP0PnrvLltvbzXMlHYIoQCQph?=
 =?us-ascii?Q?Q/LBmZJkl9Sq2cKYDHRbgkLPpbOJcdKnWkeckTa5kKmtuQYBQ7t9rIBz9PcZ?=
 =?us-ascii?Q?xrtE0SLXD70Jd+bAq/LPCYxpaAqC6QdLS9FCzo61wrcU8HFRI+KgRBdHJ+Vn?=
 =?us-ascii?Q?2iCbOb1SkPd4QH8pEHNTdNeS4yCHn5dby65YBepL6q86JPiMywURtaBy0mEM?=
 =?us-ascii?Q?LbzWcHz9Z6nuLfuKWEL9nl4MyJu9TIgvq7G4Q9Sb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfbdb689-828c-44ec-9f0b-08dd4bbcc3d7
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 23:27:07.2898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvc9034ua9X4zatyIzAwpJacL8Ge45kCbWdTM8S5TE5pZMj8q0iATdHhCRSR193tCJSMN06w7vRGJALWCiVuqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9473
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

On Sun, Feb 09, 2025 at 06:30:25PM +0100, Danilo Krummrich wrote:

[...]

> +FromPrimitive API
> +-----------------
> +
> +Sometimes the need arises to convert a number to a value of an enum or a
> +structure.
> +
> +A good example from nova-core would be the ``Chipset`` enum type, which defines
> +the value ``AD102``. When probing the GPU the value ``0x192`` can be read from a
> +certain register indication the chipset AD102. Hence, the enum value ``AD102``
> +should be derived from the number ``0x192``. Currently, nova-core uses a custom
> +implementation (``Chipset::from_u32`` for this.
> +
> +Instead, it would be desirable to have something like the ``FromPrimitive``
> +trait [1] from the num crate.

I took a quick look at this, mainly to get more up to speed on Rust macros.

It seemed to me that bulk of the work here is actually in getting enough
functionality added to rust/macros/quote.rs to make writing procedural macros
pleasant. That seemed reasonably involved (probably beyond beginner level) and
not the most pressing thing so I'm not currently looking at it, but thought I'd
drop this note here in case it's useful for anyone else that is/wants to take
a look.

 - Alistair

> +Having this generalization also helps with implementing a generic macro that
> +automatically generates the corresponding mappings between a value and a number.
> +
> +| Complexity: Beginner
> +| Link: https://docs.rs/num/latest/num/trait.FromPrimitive.html
> +
> +Generic register abstraction
> +----------------------------
> +
> +Work out how register constants and structures can be automatically generated
> +through generalized macros.
> +
> +Example:
> +
> +.. code-block:: rust
> +
> +	register!(BOOT0, 0x0, u32, pci::Bar<SIZE>, Fields [
> +	   MINOR_REVISION(3:0, RO),
> +	   MAJOR_REVISION(7:4, RO),
> +	   REVISION(7:0, RO), // Virtual register combining major and minor rev.
> +	])
> +
> +This could expand to something like:
> +
> +.. code-block:: rust
> +
> +	const BOOT0_OFFSET: usize = 0x00000000;
> +	const BOOT0_MINOR_REVISION_SHIFT: u8 = 0;
> +	const BOOT0_MINOR_REVISION_MASK: u32 = 0x0000000f;
> +	const BOOT0_MAJOR_REVISION_SHIFT: u8 = 4;
> +	const BOOT0_MAJOR_REVISION_MASK: u32 = 0x000000f0;
> +	const BOOT0_REVISION_SHIFT: u8 = BOOT0_MINOR_REVISION_SHIFT;
> +	const BOOT0_REVISION_MASK: u32 = BOOT0_MINOR_REVISION_MASK | BOOT0_MAJOR_REVISION_MASK;
> +
> +	struct Boot0(u32);
> +
> +	impl Boot0 {
> +	   #[inline]
> +	   fn read(bar: &RevocableGuard<'_, pci::Bar<SIZE>>) -> Self {
> +	      Self(bar.readl(BOOT0_OFFSET))
> +	   }
> +
> +	   #[inline]
> +	   fn minor_revision(&self) -> u32 {
> +	      (self.0 & BOOT0_MINOR_REVISION_MASK) >> BOOT0_MINOR_REVISION_SHIFT
> +	   }
> +
> +	   #[inline]
> +	   fn major_revision(&self) -> u32 {
> +	      (self.0 & BOOT0_MAJOR_REVISION_MASK) >> BOOT0_MAJOR_REVISION_SHIFT
> +	   }
> +
> +	   #[inline]
> +	   fn revision(&self) -> u32 {
> +	      (self.0 & BOOT0_REVISION_MASK) >> BOOT0_REVISION_SHIFT
> +	   }
> +	}
> +
> +Usage:
> +
> +.. code-block:: rust
> +
> +	let bar = bar.try_access().ok_or(ENXIO)?;
> +
> +	let boot0 = Boot0::read(&bar);
> +	pr_info!("Revision: {}\n", boot0.revision());
> +
> +| Complexity: Advanced
> +
> +Delay / Sleep abstractions
> +--------------------------
> +
> +Rust abstractions for the kernel's delay() and sleep() functions.
> +
> +There is some ongoing work from FUJITA Tomonori [1], which has not seen any updates
> +since Oct. 24.
> +
> +| Complexity: Beginner
> +| Link: https://lore.kernel.org/netdev/20241001112512.4861-2-fujita.tomonori@gmail.com/ [1]
> +
> +IRQ abstractions
> +----------------
> +
> +Rust abstractions for IRQ handling.
> +
> +There is active ongoing work from Daniel Almeida [1] for the "core" abstractions
> +to request IRQs.
> +
> +Besides optional review and testing work, the required ``pci::Device`` code
> +around those core abstractions needs to be worked out.
> +
> +| Complexity: Intermediate
> +| Link: https://lore.kernel.org/lkml/20250122163932.46697-1-daniel.almeida@collabora.com/ [1]
> +| Contact: Daniel Almeida
> +
> +Page abstraction for foreign pages
> +----------------------------------
> +
> +Rust abstractions for pages not created by the Rust page abstraction without
> +direct ownership.
> +
> +There is active onging work from Abdiel Janulgue [1] and Lina [2].
> +
> +| Complexity: Advanced
> +| Link: https://lore.kernel.org/linux-mm/20241119112408.779243-1-abdiel.janulgue@gmail.com/ [1]
> +| Link: https://lore.kernel.org/rust-for-linux/20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net/ [2]
> +
> +Scatterlist / sg_table abstractions
> +-----------------------------------
> +
> +Rust abstractions for scatterlist / sg_table.
> +
> +There is preceding work from Abdiel Janulgue, which hasn't made it to the
> +mailing list yet.
> +
> +| Complexity: Intermediate
> +| Contact: Abdiel Janulgue
> +
> +ELF utils
> +---------
> +
> +Rust implementation of ELF header representation to retrieve section header
> +tables, names, and data from an ELF-formatted images.
> +
> +There is preceding work from Abdiel Janulgue, which hasn't made it to the
> +mailing list yet.
> +
> +| Complexity: Beginner
> +| Contact: Abdiel Janulgue
> +
> +PCI MISC APIs
> +-------------
> +
> +Extend the existing PCI device / driver abstractions by SR-IOV, config space,
> +capability, MSI API abstractions.
> +
> +| Complexity: Beginner
> +
> +Auxiliary bus abstractions
> +--------------------------
> +
> +Rust abstraction for the auxiliary bus APIs.
> +
> +This is needed to connect nova-core to the nova-drm driver.
> +
> +| Complexity: Intermediate
> +
> +Debugfs abstractions
> +--------------------
> +
> +Rust abstraction for debugfs APIs.
> +
> +| Reference: Export GSP log buffers
> +| Complexity: Intermediate
> +
> +Vec extensions
> +--------------
> +
> +Implement ``Vec::truncate`` and ``Vec::resize``.
> +
> +Currently this is used for some experimental code to parse the vBIOS.
> +
> +| Reference vBIOS support
> +| Complexity: Beginner
> +
> +GPU (general)
> +=============
> +
> +Parse firmware headers
> +----------------------
> +
> +Parse ELF headers from the firmware files loaded from the filesystem.
> +
> +| Reference: ELF utils
> +| Complexity: Beginner
> +| Contact: Abdiel Janulgue
> +
> +Build radix3 page table
> +-----------------------
> +
> +Build the radix3 page table to map the firmware.
> +
> +| Complexity: Intermediate
> +| Contact: Abdiel Janulgue
> +
> +vBIOS support
> +-------------
> +
> +Parse the vBIOS and probe the structures required for driver initialization.
> +
> +| Contact: Dave Airlie
> +| Reference: Vec extensions
> +| Complexity: Intermediate
> +
> +Initial Devinit support
> +-----------------------
> +
> +Implement BIOS Device Initialization, i.e. memory sizing, waiting, PLL
> +configuration.
> +
> +| Contact: Dave Airlie
> +| Complexity: Beginner
> +
> +Boot Falcon controller
> +----------------------
> +
> +Infrastructure to load and execute falcon (sec2) firmware images; handle the
> +GSP falcon processor and fwsec loading.
> +
> +| Complexity: Advanced
> +| Contact: Dave Airlie
> +
> +GPU Timer support
> +-----------------
> +
> +Support for the GPU's internal timer peripheral.
> +
> +| Complexity: Beginner
> +| Contact: Dave Airlie
> +
> +MMU / PT management
> +-------------------
> +
> +Work out the architecture for MMU / page table management.
> +
> +We need to consider that nova-drm will need rather fine-grained control,
> +especially in terms of locking, in order to be able to implement asynchronous
> +Vulkan queues.
> +
> +While generally sharing the corresponding code is desirable, it needs to be
> +evaluated how (and if at all) sharing the corresponding code is expedient.
> +
> +| Complexity: Expert
> +
> +VRAM memory allocator
> +---------------------
> +
> +Investigate options for a VRAM memory allocator.
> +
> +Some possible options:
> +  - Rust abstractions for
> +    - RB tree (interval tree) / drm_mm
> +    - maple_tree
> +  - native Rust collections
> +
> +| Complexity: Advanced
> +
> +Instance Memory
> +---------------
> +
> +Implement support for instmem (bar2) used to store page tables.
> +
> +| Complexity: Intermediate
> +| Contact: Dave Airlie
> +
> +GPU System Processor (GSP)
> +==========================
> +
> +Export GSP log buffers
> +----------------------
> +
> +Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
> +(even after failure to probe the driver) through debugfs.
> +
> +This is also an interesting feature for nova-core, especially in the early days.
> +
> +| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
> +| Reference: Debugfs abstractions
> +| Complexity: Intermediate
> +
> +GSP firmware abstraction
> +------------------------
> +
> +The GSP-RM firmware API is unstable and may incompatibly change from version to
> +version, in terms of data structures and semantics.
> +
> +This problem is one of the big motivations for using Rust for nova-core, since
> +it turns out that Rust's procedural macro feature provides a rather elegant way
> +to address this issue:
> +
> +1. generate Rust structures from the C headers in a separate namespace per version
> +2. build abstraction structures (within a generic namespace) that implement the
> +   firmware interfaces; annotate the differences in implementation with version
> +   identifiers
> +3. use a procedural macro to generate the actual per version implementation out
> +   of this abstraction
> +4. instantiate the correct version type one on runtime (can be sure that all
> +   have the same interface because it's defined by a common trait)
> +
> +There is a PoC implementation of this pattern, in the context of the nova-core
> +PoC driver.
> +
> +This task aims at refining the feature and ideally generalize it, to be usable
> +by other drivers as well.
> +
> +| Complexity: Expert
> +
> +GSP message queue
> +-----------------
> +
> +Implement low level GSP message queue (command, status) for communication
> +between the kernel driver and GSP.
> +
> +| Complexity: Advanced
> +| Contact: Dave Airlie
> +
> +Bootstrap GSP
> +-------------
> +
> +Call the boot firmware to boot the GSP processor; execute initial control
> +messages.
> +
> +| Complexity: Intermediate
> +| Contact: Dave Airlie
> +
> +Client / Device APIs
> +--------------------
> +
> +Implement the GSP message interface for client / device allocation and the
> +corresponding client and device allocation APIs.
> +
> +| Complexity: Intermediate
> +| Contact: Dave Airlie
> +
> +Bar PDE handling
> +----------------
> +
> +Synchronize page table handling for BARs between the kernel driver and GSP.
> +
> +| Complexity: Beginner
> +| Contact: Dave Airlie
> +
> +FIFO engine
> +-----------
> +
> +Implement support for the FIFO engine, i.e. the corresponding GSP message
> +interface and provide an API for chid allocation and channel handling.
> +
> +| Complexity: Advanced
> +| Contact: Dave Airlie
> +
> +GR engine
> +---------
> +
> +Implement support for the graphics engine, i.e. the corresponding GSP message
> +interface and provide an API for (golden) context creation and promotion.
> +
> +| Complexity: Advanced
> +| Contact: Dave Airlie
> +
> +CE engine
> +---------
> +
> +Implement support for the copy engine, i.e. the corresponding GSP message
> +interface.
> +
> +| Complexity: Intermediate
> +| Contact: Dave Airlie
> +
> +VFN IRQ controller
> +------------------
> +
> +Support for the VFN interrupt controller.
> +
> +| Complexity: Intermediate
> +| Contact: Dave Airlie
> +
> +External APIs
> +=============
> +
> +nova-core base API
> +------------------
> +
> +Work out the common pieces of the API to connect 2nd level drivers, i.e. vGPU
> +manager and nova-drm.
> +
> +| Complexity: Advanced
> +
> +vGPU manager API
> +----------------
> +
> +Work out the API parts required by the vGPU manager, which are not covered by
> +the base API.
> +
> +| Complexity: Advanced
> +
> +nova-core C API
> +---------------
> +
> +Implement a C wrapper for the APIs required by the vGPU manager driver.
> +
> +| Complexity: Intermediate
> +
> +Testing
> +=======
> +
> +CI pipeline
> +-----------
> +
> +Investigate option for continuous integration testing.
> +
> +This can go from as simple as running KUnit tests over running (graphics) CTS to
> +booting up (multiple) guest VMs to test VFIO use-cases.
> +
> +It might also be worth to consider the introduction of a new test suite directly
> +sitting on top of the uAPI for more targeted testing and debugging. There may be
> +options for collaboration / shared code with the Mesa project.
> +
> +| Complexity: Advanced
> diff --git a/Documentation/gpu/nova/guidelines.rst b/Documentation/gpu/nova/guidelines.rst
> new file mode 100644
> index 000000000000..13ab13984a18
> --- /dev/null
> +++ b/Documentation/gpu/nova/guidelines.rst
> @@ -0,0 +1,69 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +==========
> +Guidelines
> +==========
> +
> +This document describes the general project guidelines that apply to nova-core
> +and nova-drm.
> +
> +Language
> +========
> +
> +The Nova project uses the Rust programming language. In this context, all rules
> +of the Rust for Linux project as documented in
> +:doc:`../../rust/general-information` apply. Additionally, the following rules
> +apply.
> +
> +- Unless technically necessary otherwise (e.g. uAPI), any driver code is written
> +  in Rust.
> +
> +- Unless technically necessary, unsafe Rust code must be avoided. In case of
> +  technical necessity, unsafe code should be isolated in a separate component
> +  providing a safe API for other driver code to use.
> +
> +Style
> +-----
> +
> +All rules of the Rust for Linux project as documented in
> +:doc:`../../rust/coding-guidelines` apply.
> +
> +For a submit checklist, please also see the `Rust for Linux Submit checklist
> +addendum <https://rust-for-linux.com/contributing#submit-checklist-addendum>`_.
> +
> +Documentation
> +=============
> +
> +The availability of proper documentation is essential in terms of scalability,
> +accessibility for new contributors and maintainability of a project in general,
> +but especially for a driver running as complex hardware as Nova is targeting.
> +
> +Hence, adding documentation of any kind is very much encouraged by the project.
> +
> +Besides that, there are some minimum requirements.
> +
> +- Every non-private structure needs at least a brief doc comment explaining the
> +  semantical sense of the structure, as well as potential locking and lifetime
> +  requirements. It is encouraged to have the same minimum documentation for
> +  non-trivial private structures.
> +
> +- uAPIs must be fully documented with kernel-doc comments; additionally, the
> +  semantical behavior must be explained including potential special or corner
> +  cases.
> +
> +- The APIs connecting the 1st level driver (nova-core) with 2nd level drivers
> +  must be fully documented. This includes doc comments, potential locking and
> +  lifetime requirements, as well as example code if applicable.
> +
> +- Abbreviations must be explained when introduced; terminology must be uniquely
> +  defined.
> +
> +- Register addresses, layouts, shift values and masks must be defined properly;
> +  unless obvious, the semantical sense must be documented. This only applies if
> +  the author is able to obtain the corresponding information.
> +
> +Acceptance Criteria
> +===================
> +
> +- Patches must only be applied if reviewed by at least one other person on the
> +  mailing list; this also applies for maintainers.
> diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
> new file mode 100644
> index 000000000000..2701b3f4af35
> --- /dev/null
> +++ b/Documentation/gpu/nova/index.rst
> @@ -0,0 +1,30 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=======================
> +nova NVIDIA GPU drivers
> +=======================
> +
> +The nova driver project consists out of two separate drivers nova-core and
> +nova-drm and intends to supersede the nouveau driver for NVIDIA GPUs based on
> +the GPU System Processor (GSP).
> +
> +The following documents apply to both nova-core and nova-drm.
> +
> +.. toctree::
> +   :titlesonly:
> +
> +   guidelines
> +
> +nova-core
> +=========
> +
> +The nova-core driver is the core driver for NVIDIA GPUs based on GSP. nova-core,
> +as the 1st level driver, provides an abstraction around the GPUs hard- and
> +firmware interfaces providing a common base for 2nd level drivers, such as the
> +vGPU manager VFIO driver and the nova-drm driver.
> +
> +.. toctree::
> +   :titlesonly:
> +
> +   core/guidelines
> +   core/todo
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d5b7ed7da9e..ed618e8757a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7454,6 +7454,7 @@ Q:	https://patchwork.freedesktop.org/project/nouveau/
>  B:	https://gitlab.freedesktop.org/drm/nova/-/issues
>  C:	irc://irc.oftc.net/nouveau
>  T:	git https://gitlab.freedesktop.org/drm/nova.git nova-next
> +F:	Documentation/gpu/nova/
>  F:	drivers/gpu/nova-core/
>  
>  DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
> -- 
> 2.48.1
> 
> 
