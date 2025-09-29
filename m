Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BB2BA8454
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 09:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8301D10E3A9;
	Mon, 29 Sep 2025 07:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HZ5snD6Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C5110E0E6;
 Mon, 29 Sep 2025 07:40:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6Mo9NeJw309QatemylCS8X44K2Z4UDyzKx3BmNTossxkxk4y5TyWoWSNHWt++yDl1T6kUdhNTE7SEL8AB6oQtcxvDbYhnd6NxbxErR7tW1m/qCmMY6xrK2datAW4bM3EMcXKBTDI48a5SdmaG248sSSWzmLOE/VeVTSxGflA852rvNFUSOK5FbAogpO6nPhTAFycyYXvw/FhxD2kjELwAYQ1a9hB2MjvpRx8vgWh3zkfey/2ZVZhgLT/LYW6sleFh7qV8GMc3u/kau4byB1nItA4VbZ8WTuJJh/Y1tqMJfZ8vXVfV6FdKa9uj7mHPa3oOB2kWAKUki1FzEqXuCS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYrX3c4KzIsKnD+as/XqfqaDMEnBtbqd6uekCPCI1xQ=;
 b=pxHUE8hxNVefN+1uBwVIhj72cXk7GAkZzXmkJWn1i5o5dHLdm0BfnAS45QbLuN1fesQ6eEqsHOus7OKcfDwpd6u0mw2QGovg6KmT+kbko8HLIRkLbeIzknk4NwI6pk7FVxrJVCSUhLpJbQj6mQMAeQWl+nFDoTYRM46r7+BpTHpijN/K/7GpnmVujxwNllPstFU0xwjDwk9DIB3DuH0/a1Thk/06VeHXW/7Afnzovgt8Jf7V/qOCEsnKn1VvtmtVzvK/e/m45MRS5pM/ieZvmAA5MeWUjoQDsstpo5d1yiAM9FCgKYaO9d4TzZa6rIB1cfUqVZpAx4YnbSUHpse3qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYrX3c4KzIsKnD+as/XqfqaDMEnBtbqd6uekCPCI1xQ=;
 b=HZ5snD6Yk1iutOTH6cpzzFcJSRO1BouLqgryIVdVoPJpYK8G4I+Ase7g76AZg71bYf3yzsswEw30aAxf1Lg2Ve+q+jyVgqn2pdZ2EQU6pDd6ffgGLizEgdTMYONAJGHs+s7LSclTaNNTFCzn9kGppbRjxmsjttmxU7HubXGJJ8Zz81rCWdu9TM9WXwLMk+tsyQ/XczQTcbl6NAc+fguDzBmqH2+TVaHveFNJX6HvciXtzux/oBd3atUjK31pKL6RA/8pVEC/JSawuXc8kZxlGsyng827pQKmR5FzIvZ5TEydZb1k7r5aWu1y/DvSg/sWZAppT78SqNHXCmI+ODKkDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB9532.namprd12.prod.outlook.com (2603:10b6:208:595::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Mon, 29 Sep
 2025 07:40:02 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 07:40:01 +0000
Date: Mon, 29 Sep 2025 17:39:57 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, acourbot@nvidia.com,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 01/10] gpu: nova-core: Set correct DMA mask
Message-ID: <e2twlxdothcm4vbg3vytxppdpjdocx2l54mfnvhn7dbdncbxhx@ut4kpu7qwwe7>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-2-apopple@nvidia.com>
 <7fb081e9-e607-401b-937f-f4e3a78a2874@kernel.org>
 <0dbc8f78-5cee-4741-8d33-df3358dd5383@nvidia.com>
 <eblaubjmsesi6gh64ekm74qyzvfk23vjcmotc33upkc5w6edin@rbsezy6f7bai>
 <DD2PRD2XEZRE.1YACAPZWRYLZO@kernel.org>
 <um3463eyjtecebxdgjpegankwxgezqgeiqff6xy5wducnv7ayf@pnjhxbro2sh5>
 <DD53EE5HJUZY.2EMREPXQ9P090@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD53EE5HJUZY.2EMREPXQ9P090@kernel.org>
X-ClientProxiedBy: SY5PR01CA0057.ausprd01.prod.outlook.com
 (2603:10c6:10:1fc::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB9532:EE_
X-MS-Office365-Filtering-Correlation-Id: cf25a7f5-434a-4ead-b26b-08ddff2b65cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZNGDPF3qRt0UiDCVhN/LStZIi/If8JJ3y/OzWb3LZHbXpZql0IiKNWH7g0mQ?=
 =?us-ascii?Q?lm4O6152+RHG3gsV1d/vtz1f6mSVkmaAAjMxmLPMdrCx0kAX3wQAH39D+kpq?=
 =?us-ascii?Q?Nn2qOxHYd8To6ghKvjvrM9vNdS0JGw0vFwhhP2P7ah94u5k7cs3xq8RvaWI1?=
 =?us-ascii?Q?SUVLBjbBA/Ila3bY8N5uoJavveSGIEqZsEuHKEjtQbhrZG9NPfTEOcs3fic5?=
 =?us-ascii?Q?XeOUl6D0gU0k/PGRUDSHE/pvasW3Tubw+WS06YJoBe4tFtgDDThZ3XkYj7/T?=
 =?us-ascii?Q?PDGg4kKh4k8d6y2AXQpepl3vTpc4b9/2+PS0D0hLqErTBtJLxT3/Ow9AL0Dh?=
 =?us-ascii?Q?/I1HHZXhAlt1iN42W7PTTamjmAltnOwqwKQHHiHzjX4QL8YrCq3ayZ41lt/z?=
 =?us-ascii?Q?49EDqaFmxt3hkLWPI22htUugZlkN9HBkTRhnxfvCA+t+lleXsqUjfpeVoOx7?=
 =?us-ascii?Q?ZlZXKqG/60JxewkBXZsQlFjVdJHMhWpqt7HV5eZE8Is7l4YGvQ+eQfSXB1xb?=
 =?us-ascii?Q?jNYZuci1JOOymbSp1iRdeuF77hqDjCVwxCYYrSxeB1Gtaec7P8uiKpbNjL2N?=
 =?us-ascii?Q?Xu64RMK6u8Wq9UlOEFDKMwCQ6HYNaExASEhN2oISimRkLtebtU2OpsjrS6sN?=
 =?us-ascii?Q?8wkKQ6CGf4YVgl6jucOqcSVY+pjpIEuIAYP86VgV0dCBHUPNH4ntsYuUUolV?=
 =?us-ascii?Q?xX0pmCxxbfjvn/6FOD40FkWl/rgHEHtOAfWEAckUCGe0iBhFZ9oKnJh6ZnaZ?=
 =?us-ascii?Q?rzk9jRyA/FEgibQydo2EmgaRqPRW9tgJ5hcfai6AI6shyHWz5K/84fuU0yQM?=
 =?us-ascii?Q?jTmhLPE81PDrsJSTMt7suunU0Wi3YAjUoBot/Owznt+1SXMUSKilDzyhSGhu?=
 =?us-ascii?Q?PWg2Eze+O926jfA9ZVBqlxpyELrWq8vAlt7+bz7FysOArLzDH/ME8K0ZEfb4?=
 =?us-ascii?Q?eTl+DfXzMaFSDXgWM3O+rOLucXOXJ9ZZSI6rRt117DTUDG7BdDiO79PLowsk?=
 =?us-ascii?Q?lzpHdylDuB2FTLiSthh+0r/jFB6HwdTImug4fBf0kD5+OdEJUGYtGZa45ZwZ?=
 =?us-ascii?Q?mZ1CTuOlvKU1rBAdTG3NJZ1W/t0a+ZKfSNy3N3tjVAR14wd/BFDQyZxcJTkW?=
 =?us-ascii?Q?3f3oQl7MQEUeP7x7nYYhE5Gx3pzdkf1nKk8UpFPbnP61giYp/JLKk/4gvrBV?=
 =?us-ascii?Q?j4/sXjnVz3Yxc1j+NCki2eCM8BaWTxJx9gJVNrpABIaTKCGI7i9jr4GxWfmr?=
 =?us-ascii?Q?hFbZt5Y8PAifKmJocBot9NSBTG4NwtinAqlXNAlTzAElWx12Deui3eCMmix0?=
 =?us-ascii?Q?au0gjWRvOnxJaji1JpIUY5SAr5gQ8KX/EB6LdjzpoCyMSShDvIpLJPVk7BNM?=
 =?us-ascii?Q?2HA1B6vu4bVdUBLj1iJDXVwUF82vZreCECUoZ4YVd8/l4AuV1zoruKXgRj2C?=
 =?us-ascii?Q?Q2l8wh6IE+zXPp8MUk33FN3OG/t4J6kA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?85r1ofYeKbhF0ka4b1rW+jSXFpDwcXhT0ABr+WKJNkiQekPSyCmxMjJlxP5o?=
 =?us-ascii?Q?31/bbGLVC4rKFUXdXjMgEue79FltHQj7XJQStVWr9jbot8uQhpK7DXzUHb0P?=
 =?us-ascii?Q?p5K81LivQRj5mVLbuVv8lvT2QFVltms2ILJTq1GO1xiyHjemuG2kcC8M1U0c?=
 =?us-ascii?Q?87LKOFIcv0IxhtEMDSScur851h/kMsVHSNNDsh4lllgMfhc1yPSIezDMo+XU?=
 =?us-ascii?Q?9topWlwOUmt/GmgVZwrnVLek5ID/A1iy9WVwgS452PvzPxAYr4xWtxR5akPN?=
 =?us-ascii?Q?xL97fpLNHHGtgDkQMoQbtXHARVlze5NXcWmKNS4SN7esCdU+zVT+ikPjzERj?=
 =?us-ascii?Q?Ll4c6c4jw8VXCIK1crMUm8EkeSgK0tw0ZtO9NIU8EhtIc49+X/qoqOgHsVUE?=
 =?us-ascii?Q?eXc85CAGXgLpevjRrWDK8XeAdz4Cj+k+JZq9F8C4cVxGiRW/04nNH+yZMdOb?=
 =?us-ascii?Q?2X43JIuTcnB2G21ueZMk4xD+H5yo28SymxMnDql175pKrst3v/cH+cxgI9Ad?=
 =?us-ascii?Q?2iPam2DbtVSpwrLjn+n8Z58kNNKzYt8CwsCsPh/ft0gq1geLB5w9XfBkqHIN?=
 =?us-ascii?Q?TOeeQXfW0QnneewBKZvYo1Q7mvoq0Ys9DsMPkg5XHfU6ujdDat4cqW4zgsvU?=
 =?us-ascii?Q?/T+VFO2zhS6+fs+bKo2ca70Lv9KofI7DPlubRhAAjq1X3jj1vJQ2V/ZAR4tx?=
 =?us-ascii?Q?HVaNRaSaNvIFlDkAdatn7eBPevlDrPi7vPbezNMuLtuP3hsrWFhlJ0NoBi8B?=
 =?us-ascii?Q?HG+nf4bWSxLDS3l5CbhsjYQeyHdrsi8dMHciP1EUWi0PHAOBE+w+1aui6GHC?=
 =?us-ascii?Q?kNrlId21Z5aY4Gpq+/QWDJ9K7MiK3Up1dysi6Q1XPiJZwk4nD7XK8sNWJewE?=
 =?us-ascii?Q?841zh74hQkT/6bCxwjBj5uAQ04Et1AQXfV0QGpVsVKZU796RaKeKv6BE7f5j?=
 =?us-ascii?Q?W5WQUE+1sTJIRriARZF+48QBhlcp32FbK+8V30KnHdisOVAQReCWwvgLgeFB?=
 =?us-ascii?Q?sRk1wDYzRmeaI4+X60P/UnPeiki6QftO2FfdA35fZ4nqonV8QpsJWmqufLdv?=
 =?us-ascii?Q?JCwY5WMUzFfrK6mWywm6Y0Rq8jy7RvOs/BHiDV+bMxp8pCHoyOGhG9zx6EHm?=
 =?us-ascii?Q?R4DHqBBCuIsho8enPTj3ATmnyMHE2HBaFyXXOKcnTVCNrQ000k8cRVd7SsR5?=
 =?us-ascii?Q?grIzOJVVbOOoSrpS8zo9GxOaABGbGv1KfLkWU5W7qEf/7ZhUeXAI305inDYx?=
 =?us-ascii?Q?5Mp06PzrRV4npPQCZPbqQuJv3ev93tj+xTDtHGiffePnZ6ujTPyGohf3ti/c?=
 =?us-ascii?Q?nWKhwxyajr9jXF/8cMcvXArygKQfLBKQzytimgrkhH0cxcY7qoBKelqC/7la?=
 =?us-ascii?Q?0JvdXWJQY08QmXXR98tYQS2t8CnNl8w/bGfPJb7Anb0jgZKYKTzrvILH+9Mn?=
 =?us-ascii?Q?v+EM5Cto18zBeuYJ4ZB+/HHWAgYNEkJ4V7OuhoGfHEEwFg5JQnSO30c65uea?=
 =?us-ascii?Q?igef46aIY6xZU33kpfz+XpJx6FeHhsaXjJAH0oQYELJ+9BEm+ajuUDFFnjq9?=
 =?us-ascii?Q?dtz4Wx55+wMviiwYuaWejo6gu0+CXyr7uGFE4Xs9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf25a7f5-434a-4ead-b26b-08ddff2b65cf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 07:40:01.6579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QMleFqz4/Sr9fkRu2jty9DZPQZaE+UUwIk4K6wsS49t2+LlHIdlUIpYZTVkNXI4/yEsbW6kuOEPGQ3l5AB27Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9532
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

On 2025-09-29 at 17:06 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
> On Mon Sep 29, 2025 at 2:19 AM CEST, Alistair Popple wrote:
> > On 2025-09-26 at 22:00 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
> >> On Tue Sep 23, 2025 at 6:29 AM CEST, Alistair Popple wrote:
> >> > On 2025-09-23 at 12:16 +1000, John Hubbard <jhubbard@nvidia.com> wrote...
> >> >> On 9/22/25 9:08 AM, Danilo Krummrich wrote:
> >> >> > On 9/22/25 1:30 PM, Alistair Popple wrote:
> >> >> >> +        // SAFETY: No DMA allocations have been made yet
> >> >> > 
> >> >> > It's not really about DMA allocations that have been made previously, there is
> >> >> > no unsafe behavior in that.
> >> >> > 
> >> >> > It's about the method must not be called concurrently with any DMA allocation or
> >> >> > mapping primitives.
> >> >> > 
> >> >> > Can you please adjust the comment correspondingly?
> >> >
> >> > Sure.
> >> >
> >> >> >> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<47>())? };
> >> >> > 
> >> >> > As Boqun mentioned, we shouldn't have a magic number for this. I don't know if
> >> >> > it will change for future chips, but maybe we should move this to gpu::Spec to
> >> >> 
> >> >> It changes to 52 bits for GH100+ (Hopper/Blackwell+). When I post those
> >> >> patches, I'll use a HAL to select the value.
> >> >> 
> >> >> > be safe.
> >> >> > 
> >> >> > At least, create a constant for it (also in gpu::Spec?); in Nouveau I named this
> >> >> > NOUVEAU_VA_SPACE_BITS back then. Not a great name, if you have a better idea,
> >> >> > please go for it. :)
> >> >
> >> > Well it's certainly not the VA_SPACE width ... that's a different address space :-)
> >> 
> >> I mean, sure. But isn't the limitation of 47 bits coming from the MMU and hence
> >> defines the VA space width and the DMA bit width we can support?
> >
> > Not at all. The 47 bit limitation comes from what the DMA engines can physically
> > address, whilst the MMU converts virtual addresses to physical DMA addresses.
> 
> I'm well aware -- what I'm saying is that the number given to
> dma_set_mask_and_coherent() does not necessarily only depend on the physical bus
> and DMA controller capabilities.
> 
> It may also depend on the MMU, since we still need to be able to map DMA memory
> in the GPU's virtual address space.

Sure, I'm probably being a bit loose with terminology - I'm not saying it
doesn't depend on the MMU capabilities just that the physical addressing limits
are independent of the virtual addressing limits so setting the DMA mask based
on VA_SPACE_BITS (ie. virtual addressing limits) seems incorrect.

> > So the two address spaces are different and can have different widths. Indeed
> > most of our current GPUs have a virtual address space of 49 bits whilst only
> > supporting 47 bits of DMA address space.
> 
> Now, it seems that in this case the DMA engine is the actual limiting factor,
> but is this the case for all architectures or may we have cases where the MMU
> (or something else) becomes the limiting factor, e.g. in future architectures?

Hmm. I'm not sure I follow - the virtual addressing capabilities of the GPU MMU
are entirely indepedent of the DMA addressing capabilities of the GPU and bus.
For example you can still use 49-bit GPU virtual addresses with 47-bits of DMA
bits or less and vice-versa.

So the DMA address mask has nothing to do with the virtual address (ie.
VA_SPACE) width AFAICT? But maybe we've got slightly different terminology?
