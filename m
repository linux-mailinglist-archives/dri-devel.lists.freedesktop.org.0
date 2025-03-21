Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C53BA6C1D9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 18:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CC410E1E1;
	Fri, 21 Mar 2025 17:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nBKV3R5s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C185810E1E1;
 Fri, 21 Mar 2025 17:49:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Clp6sYvjaa34jHRDCFGn2GNZQnrL9XwApsKNtvcAHp5BzpPUrkxtnrVL0Hd7v2gj8aR0mUqw2ppdEBSsU/2ysjE1nNWuAuH+SKCVQ4+fCfIN53MO/j1haKlfJVuUxPjuXM6+WphU5kACH/oaVnA3lmIh+UMp8lNKZZ9cTesE09AbxFMJix4pfPeghq/wZjsS2qIYYx2rcBMAT3TCWG9l/McqnK0Y6Er8vo6pJdGBF3dIb5/80FSNw41WLGu/rksYoPeTXagCQXENOdZ30rrGGQn80GxhMviqPG/qUgsURZ4xni73GFr1kz6t5eornbMqVuQBIfTpj81ALEhn3eK3uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVpQClKhLGaymu1VSTr4BCZtErlqLeKc5yHQaa+nhCQ=;
 b=yo7X3jYwnrS+au73b8wngR7g2HFGbUx/+Z/N1Gh3DmD6W/MOefLZhJ6X0UH4H10yynL4Dk+bNF6Vieo8FLNk0TNfAq6AhsoljbS8xyR23VEa87QOLJSnP4Jax/IW96Z8TxfCEWQYsjAdZ0s6d0wuZf/jo4CaUqMEbutZVF8XiRBgFcoSpEpU81bNo2ayGvCaxW7K19xuCi311GKiOCSmlyeow7+j9CUjdPHx6vbM9tbZTk46r/V0VDajBD8IJyhHVfo01IRt3qbXIAXdzbTePZYjN3bfWVVQpVINtymbvvw7ajw5Hy6rCHhZ5gQJlRVK/12XXb5fG9kwX3DbNBVwYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVpQClKhLGaymu1VSTr4BCZtErlqLeKc5yHQaa+nhCQ=;
 b=nBKV3R5smaIhHYpgFrQ4+T6S4881UPFgcO2snSh+jfvYx77OdjKHhOXQHUEh9AOIfOzxMJRI0XPePlCUWu6K2uZAJGfzqbVEnjuBFfdszUe02rj6kDz9mZXbSjafv4/Gy5WBoPkp2KRdnTL8fD8jU5LjNk4Btd1E2cxmA6gV7oH+w11+WPkCdS79OF8UpgrqI0o+VsmSm4EgK6K1noJRwJkcthLv7XXORwW226HZRclFpPQOdDje5ifNcReOVnCHsEh71tvQJAlOSdtKqtfKv0BCs6i1+5vW9AGrSVXLoXNCX31t/tDJ0MoOKcmuEbRmPXVh8lPDBPMRItBJTcm5gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by LV3PR12MB9354.namprd12.prod.outlook.com (2603:10b6:408:211::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 21 Mar
 2025 17:49:21 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 17:49:21 +0000
Date: Fri, 21 Mar 2025 14:49:20 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250321174920.GZ206770@nvidia.com>
References: <20250306153236.GE354511@nvidia.com>
 <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
 <20250307123255.GK354511@nvidia.com>
 <Z8rv-DQuGdxye28N@phenom.ffwll.local>
 <20250307145557.GO354511@nvidia.com>
 <Z9LsbhzjI-P3-edQ@phenom.ffwll.local>
 <20250319172132.GL9311@nvidia.com>
 <Z91A_Dz-nY2iFqYb@phenom.ffwll.local>
 <20250321120416.GX206770@nvidia.com> <Z91XrltJYtJdkLUS@pollux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z91XrltJYtJdkLUS@pollux>
X-ClientProxiedBy: MN2PR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:208:239::35) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|LV3PR12MB9354:EE_
X-MS-Office365-Filtering-Correlation-Id: b97cdd80-6a9f-4950-4d40-08dd68a0b5e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zes6DUxjXvmeYGX1WIK0sEy/Ef6dkgmrCyfUhHKNvtkYZM2BuWyh1Qy5GOXj?=
 =?us-ascii?Q?Yl8NpGZ1F5X53G1fRdVUJJdkWFLZjC6Uqbz64Eq0bZJdieTQdL/vzuVTdFH2?=
 =?us-ascii?Q?Wl2hq96dUlavqZyjeHurIm0lthEsrBwLVm+xu+otTKQZ8PH6Xy0AFp4f6fj8?=
 =?us-ascii?Q?ozLUFTa4dNG6yf1N2iIRhxT8144gDKFSrJA8ohBpuKxbCoebC0u01LKwPhhH?=
 =?us-ascii?Q?O/m4cEfDNOxciy6kmH0TYxi5HAov0+zF8LwFDc4KLQW8sT18WcJq+oGCyvnf?=
 =?us-ascii?Q?z3+m81a5U8a1Rlaelja+SedLHVTvAlputTSBBjpuVO/DTlczcbUUtiAyH0s6?=
 =?us-ascii?Q?8Ibz3cDeeVpTiWc9sZGqQ/U8gATGaEyvrcvl7KfdfLbZo2l4k4ksyvWYaLj3?=
 =?us-ascii?Q?wWLUwCixax5EB88GcyRBlhvn0YsCbkzp7aazqfa7yUCPzMVW8ypeOIUUAoPA?=
 =?us-ascii?Q?ZOX2eGdus6nNq2lC+HymVqMoFu4/QKzmbMfBX7E8y7x0VPKGjvT1HZx25aOL?=
 =?us-ascii?Q?oPp3VvacDdOmUJo7/4Fayn5FxqvI0pqNrOkmxbs0dUqk2/eGdy2ipmuYivIG?=
 =?us-ascii?Q?XQbq8U3Art6EjLvY/Nc1Wp7EfgV2IaO9Sv1KLL1QNDQrwSHnnWemM6JVv1Yh?=
 =?us-ascii?Q?ua0bfFzhPEiJ1fo1g1ZXVNSG5MqqOuh+y479996RE8Vlphxr5YPB54vo2gOX?=
 =?us-ascii?Q?IVWOqlTjnmXf8TknEKBSuhGRUEqRfCVhWgRTENndm4qxFQy2+NzmfAIKoKm9?=
 =?us-ascii?Q?kJGfivoNnYecfEbEgNOaxYGq+48EnJxnNa64hV60fk1yVA2Af9ukrmt7A62/?=
 =?us-ascii?Q?QRR7JhiP92KlTh7NK4Q0yRzHn8Qco8waoGUdyzKAtDACQumdRTzu17xg+b0t?=
 =?us-ascii?Q?EVVvdhNxAWswzXx0meqmTKx7KDvkBdS6nSoWyT5oaY2KABUvDQHd2T+gaONR?=
 =?us-ascii?Q?z4YIWg7pDG43AwqkMUfEkrVfuTedaBr3lMTyxLI+hi/utJbEoCFeNcRAk7kx?=
 =?us-ascii?Q?TxDqhhNz+451zqd+/bvI1HOiwf7XZJcZ4QwZWrIG3Yd2zQhy/BD7d4U0cV3k?=
 =?us-ascii?Q?uveTOGMYyVPtP/fVcFqmrXVjSk+lPdRZM5LKXd5vXhoT+LGR6UZuEvxc9o0B?=
 =?us-ascii?Q?T6jgnr6Ipf603D/2WijMFWnAUGnUfQhcmIUb9SpqlGBRYsH+s2+EOKV7wvpz?=
 =?us-ascii?Q?qQ+9wfD4+VCp5rX67LsgP238tLjHjhsle6/GrMS/Dzpp0m4BJWo97Xcder0p?=
 =?us-ascii?Q?Rtjv/hWR93PzumJXbVxBrXMqQdkXxj+pLgaeBL/mBbyAbI7lqS/fA20/cESD?=
 =?us-ascii?Q?4fNRFmAqIrIwm/csKgwmQg2Qnw0AMyULqb8Ct52+u/OsjNdIsbBVIcMGzRwC?=
 =?us-ascii?Q?faMawoQi7LLgmlyWbF4QnAFqmvIa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7z4o93BwFY9H6A/yobi/KCXsTY+uZ5hykyPt1iAKwHc0/8nuN8Zv6w8bg/3h?=
 =?us-ascii?Q?VzmFQOO5ObyWC5TS7Kq2PtoX1jmFyk6p79vxflzNPDwG+BVC3o90R2aqSOzq?=
 =?us-ascii?Q?NjsoFpFswWxoVkBZvWQHq8gF92eYyz//uL5JeMsCHgsqfu7qqbnNpyhmvSHI?=
 =?us-ascii?Q?Q2auEzTbc1LzqPNlIPaTgfkrPvu1B07SIlBvoPVwOCCouscbkHTwyKkKt8pa?=
 =?us-ascii?Q?oLpTPEXVHLRrpnaES4RBqnShoVMoWpJISvvBy7VdwQ8Cvw9tlMeRNxKJCJtV?=
 =?us-ascii?Q?3FBHII79JYbptakvnIl8vPZ76oQvbN2XcTWSGdvAo4Asrx2L86A34NrkGO3v?=
 =?us-ascii?Q?wTPuxULJpTgF/9JY8WMXFBvBENpsYdaRDzdTwahF6ug70fTJCfz+3ySz9JBj?=
 =?us-ascii?Q?D4R6svpp6C0MM/WU3+o79n+txHhDOUAk79aUaZe9czMGL9vsPx+V8inDsylm?=
 =?us-ascii?Q?Ray9LY+Lcz69Zb23Uq39uLioRvjxvjjmwc1/1eXTXGT9GsEAlKwRlaRzQXWT?=
 =?us-ascii?Q?N/8zPXw2loG4Y7Zrcye8ZcPc8QrN/lCRU8pQS8oR6Tg3CAjiSPP9e2+9XU6Y?=
 =?us-ascii?Q?I+y7eTOXnqjSBF4Y8RKe1bXbaO6gvRfRc/XBuekJYH269KEJW2c2WiHoa3W2?=
 =?us-ascii?Q?00pizUqCcpPnCJCCOeNDTt+ZIKnDikdcldZyCig92MqRQSM2Me7OCBBdIMhL?=
 =?us-ascii?Q?YSl9+5VGuwEmF2ThhKv0kBBPd2pp+Xba5estQQTfpZPg5QLbujwho9fSK8a0?=
 =?us-ascii?Q?iBqCROs9twp6JcX3VUWy88XZ2nX1YlNwFWL3b7MW1JJF0BkjAGtcoNO0Kc3y?=
 =?us-ascii?Q?stdFsjnP+dq5k3WJ1fH+kqmuNwaax06GoqGpqcrx9sFnfcD+hkigHk3R70iW?=
 =?us-ascii?Q?Cr95wE/EMzwDbx7iyxVnBrzczLMfkHSzD1kxeRSE0P3Yeg9gSJqa3Bh4cepf?=
 =?us-ascii?Q?gTNIopBtUnmHOavH3i1gIiWCRs+ciLdW9aA8KI7kHSxzrpw4YF0PwXn2OeiG?=
 =?us-ascii?Q?626GB84wTOTfD8PA1CNLuCesxLeJPgIRBcNlZGgXdbVpWU5xvxbkBePkhYiz?=
 =?us-ascii?Q?ACNBS6OX6EcdJXTCndDrTL8yK0eKU+ul8m+sQz3Q69+XMJMDedWE/dKb0/Ll?=
 =?us-ascii?Q?/A9NVmf2FbQFjj2UkrBBngHdesFsVDx/6hgQ59JHbt40mY3qGczpG0NZxXYU?=
 =?us-ascii?Q?wg4akZpR7AVcj2zbch/M2jrYrXDXYqIW77y4Vesnda2KivSjChxT7WCVmzDF?=
 =?us-ascii?Q?aqXx/ds9+mnftw47DyqRN2zF/UvS0x5cTI2923sjvfFDCF6NkiJdu/8iEEpK?=
 =?us-ascii?Q?as4yztaa/lxIfKrhxoMMpoPxw+Hp00XDtoR8ohNv8G3g6d7qBk4oUN2Tp9+6?=
 =?us-ascii?Q?WFrmCqZmERL1+GrEQFDRzOKprrKM73AyEkJgl5Jw6yom5/ru5wmBgKGLwzpW?=
 =?us-ascii?Q?gu0Y1xKW3r1lYUojGI8h3tP8PxMqrYf/Izd4s485/03hZWfDI8Ev5RRaLYiL?=
 =?us-ascii?Q?RZs4NfKiaVzgRFCJq8OUhAYQoEI1QeaxI+49onC12L+Fp631Tm64FgZmkUAJ?=
 =?us-ascii?Q?AcAmIZ5ZjkdKX4Ne5MzVONXLTxeaJh/KSvdW9lQF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97cdd80-6a9f-4950-4d40-08dd68a0b5e6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 17:49:21.5516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9w/xAWh5i1TkRqs9SKlEaXzMV8Vw7IKFOlzThsvD/6osKwiZDc+q1799Pa8fW117
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9354
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

On Fri, Mar 21, 2025 at 01:12:30PM +0100, Danilo Krummrich wrote:

> Not all device resources are managed in the context of the subsystem, so
> subsystem-level revokes do not apply.

They could, you could say that these rust APIs are only safe to use
for device drivers with C code providing a fence semantic, eg through
a subsystem.

> For the DMA coherent allocations, please see my comment in [1]. Revoking the
> device resources associated with a DMA coherent allocation should hence never
> cause any overhead for accessing DMA memory.

> [1] https://github.com/Rust-for-Linux/linux/blob/rust-next/rust/kernel/dma.rs#L120

I don't know what to make of this. You argued so much to support
revocable for rust ideological reasons and in the end the proposal is
to just completely gives up on all of that?

Not even an optional runtime check? :(

And I'm not sure about the comment written:

> // However, it is neither desirable nor necessary to protect the allocated memory of the DMA
> // allocation from surviving device unbind;

There are alot of things on this path that depend on the struct
device, there are two kinds of per-device coherent memory allocators
and swiotlb as well.

It looks like there are cases where the actual memory must not outlive
the driver binding.

So, I'd argue that it is necessary, and changing that on the C side
looks like a big project.

Jason
