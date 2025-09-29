Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC49FBA817C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 08:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37A710E21D;
	Mon, 29 Sep 2025 06:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HrlppneJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010008.outbound.protection.outlook.com
 [40.93.198.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B69A10E21D;
 Mon, 29 Sep 2025 06:19:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PliDSSHm0Aspn/BkM3bNzyKEmrG+QGCNZIJqcpa1Q7OB8RHOmebpOPDD5AZ7jL+y+cq0mdYAmQhgflsDS67slKslaUzIQJHC17r6j6vF3LbC/vCksXCF68wXtxEpDPSEI6f7E7mIvraU2ps2Hgf4h5LUXHo9+iTTD4Fm36tckVGF09sZ3f/12JO0Y5YguGzkPFl7Zy02iLzVXvTWsytYGMgAoR8ny5a3aqFoB0so9lbXNxd1CM803hwviSiVw4DWjwIQP5HKl8OxJBJwyiOMkqc7dSegjI1+uMEjglsCfYZ1osCE9QnJEO2je2ZkweSBU6JinD8jM0EPALd8MezhSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rke6cfmrjNh0bKu1552A0gji2GKkc3KWi2xfesimy3k=;
 b=bCrqNvVA9Q0jN1cbaJT9KwTezVxZf86OtrXgE1GEWiRAWGdzxY43U/+Q8iBdg34yEqF8N6WZfDgIW8m7mQQM2OC1M5DjPa9fbZgWpmSN1ONap5W7wFRZnTjdxmbfGKyXYMcTPg/50UzhCGLm3CwtPPhl9YA6qPzB39AX++pUpVU4CkAXYus4cj5xReeOHmOSdrNhfVr5rEM4xDbUA4Sn7pvowCuni5RB/VFxmDVkdS7hecccKynp2jYvQf1unYA6VT+YIQWb8AN+C0OkHrzs4r5C3c0gETGHJKQXfBsNoLTKOpOyCDPcnxoRYfhSiChsVBRcubuegBoN66HFKbZ3XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rke6cfmrjNh0bKu1552A0gji2GKkc3KWi2xfesimy3k=;
 b=HrlppneJaq+mPKvDPAzsnQ45RO9sL5EKLYFDNdm6lmfpnKShlZAlv5uWLWeJ9sNgVqchd8rSzAmU551ukctTDvc/iEXDlYR+FYhIz9y9q6k0XBLEpUEdiGezBSjUo5Pa2Wp9VzdsPehX7VrBipoucwJ9G2xRZ/pcbnbT21AZ11US0Iv/Yc66d1vGM8vPoeCFGeTjOZUE8/QUU8CrDO21xI1/IwUrPuvL4tCob0celNtPpAR+6A942HkcWS33vubZTnDrU4myi87I4vAl+10/ahVN15N2CKzXewu7PskOCSkX/dGkvVBJRIBC+h9jTiMSxQ5snTM4s+JOMQneOjuBkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 LV3PR12MB9186.namprd12.prod.outlook.com (2603:10b6:408:197::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 06:19:45 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 06:19:45 +0000
Date: Mon, 29 Sep 2025 16:19:40 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
Message-ID: <7brvf66smc3ltqrw7tm7smth6wnefeqykdm2n4qahi5xnr6d5o@4l5xfdbznlp3>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
 <DD2GCDGQ7Q4W.1CSFYSETFSN5H@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD2GCDGQ7Q4W.1CSFYSETFSN5H@nvidia.com>
X-ClientProxiedBy: SY5P282CA0149.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:205::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|LV3PR12MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: 73aabbbf-c10a-4267-5721-08ddff202f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hUFS9HmnSa1UBVjEk4gxjyTVv1h0L7ROhMSGvVW9+Z7wdxskFd2HdN2/GlYt?=
 =?us-ascii?Q?7Wm1bRfPS9xTXqVSjeHRjsHnDxdnrVTS0vM+k2RFu3D13OZ9QKJdFqwaykpy?=
 =?us-ascii?Q?g5vKPPMYihk0tz4UCOHGl4qhTtGrO7xxUZXK8hQQIDXxax9BRl3wr0Nc4s8q?=
 =?us-ascii?Q?924EtdDa+JVVfhbbyNFji+9O/H4PykaYqh4GH+qvwQBgeNqtQsBIXf5ia9Hv?=
 =?us-ascii?Q?tLoS7Rs7HeKvvXAUkCcvWAAYLjhRMdrHrLCMoDj+6T65MPI3V3s6Fjs5IZwS?=
 =?us-ascii?Q?kpmYii+1fj8eaMvrEUCvKG+LAptqQA+o5TqI157GaSzfEPaDvu17MetqVYGa?=
 =?us-ascii?Q?AxNLfgtUq7yf+PuYy4nLFlp8rgaA6asZzhyAzyVZ0/UpuYcUavBOtJDTM5Dg?=
 =?us-ascii?Q?Tj4/7qsRJj75JRYPc0ujPp+5GxDWKi2Z/XjCuLkQWevdGiza0nWhGTbRTkzb?=
 =?us-ascii?Q?D1HIh8PkbS+Qc/PDuQ+FAsH425pBU7FvMXm1+rEuOpQQVMiGCIk6sgt6XYUx?=
 =?us-ascii?Q?tCGo9FI+3h/+DONVUoUrO34vXJ3o3O4oQVQTmh5mD1Tl7lPg85ktukNh9w90?=
 =?us-ascii?Q?R608gXpyddQFPro+ek/9ayO9fxjfQ2hGYMLFGchkNAbQdsjaGAemF+SImdqJ?=
 =?us-ascii?Q?smUM0lvxX1l4jT1FWHVsvqWY2AUtQZ3ftKBuRqtoBAEeVG8M8kzcV/3RzLTJ?=
 =?us-ascii?Q?eWqcjUvPNP11B7MvS0m7Sy6OI9JcZHs2HA/T2CQ9zD3tK7F2/kSJo4Pxhvfr?=
 =?us-ascii?Q?E4myhV3Noj6i0tD/9KLrEFgWk2YpGq9x+FXU/yCh4aQdXUKkdezNp6OSBrlR?=
 =?us-ascii?Q?8KyWvo+AqFfpIrtal5RCxx73cLxsk61hX1cmQm8ZtgkmRdSflXY4U5CNigAU?=
 =?us-ascii?Q?8uJsW4KWGaDnTvXckgNjZqsBRSXcG3n8wP2fLYkCkndSoDC9jmCd+ORdVLnO?=
 =?us-ascii?Q?9baB8EcvoQECJXbIhMDK2S5QtVXKAaCp59QtwWyQRB5ec8VRMj7sIUak2fMB?=
 =?us-ascii?Q?0cXvWvV+PRjVuhyigf1unk3VgTCBJKDgLKnJXPdo1k5x27yuh4E64cRreAOr?=
 =?us-ascii?Q?kBRuLnl063lSRX8LNeWiLnWNvU1oh/28fPhiPgtFlOH8vG5nfO7pa17eylSr?=
 =?us-ascii?Q?pIDmqYPqdhRx6Yvk4n/ee0zD/dx7KmYcYF8ox9P0GYMDyutJG8fK85+rf/3U?=
 =?us-ascii?Q?mV9WvysB60CiFKu7TZ7dK0/VJUSY8G3sZ6OqOzQjXw6lr2M7f+SYYzc5Xq3q?=
 =?us-ascii?Q?s679djuplddOVsunS6LQmf47M+DGJWcgho7nFnoh8uc9OFANiGGEpStpmDPc?=
 =?us-ascii?Q?GKWYvPt/Rh7NQ7ggy5FPVj4/TwqZwXwgFbJqALXSE/GKUwM9BNjtr8Q3KzF2?=
 =?us-ascii?Q?H6YeWfB5nxQ0RPrW9332amEKQgtKHP7iGo2SpE71WECuU8l4HP0kS6wlfEDJ?=
 =?us-ascii?Q?mMDwdjqvT3Z+kVsG0dwtDHcuJxk5FeGS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uSkKClDaQf7nWppoYREzF0fZ9NqxhQ/x551YihGb8FWfU5NNpl+25nHUjtG8?=
 =?us-ascii?Q?YcLEAQ+yuW96/KNh4sKevbmqjWUjr0AnD4P3HE5jbUYpsFKBJ3yDMTUJC7PF?=
 =?us-ascii?Q?fafbfgP8AN1TrX7ArzkCgZCsK2ui+hs8cEULbk1T54UkE5fHklUy5n4NGiao?=
 =?us-ascii?Q?JM/wqIYe8jNhzPAL/WZ0K3zQtE0OBYynS0SG0NRyMS17pndWYSzR8N4HT9oa?=
 =?us-ascii?Q?Qhr2gfzyuLOULhd4qDYX4kdczWEbqKDCuSeJViHpxdb5td9rzxPIt6ZVzN2u?=
 =?us-ascii?Q?WrraOe0Qu8WEsQvQaVbHrGSPb6oamgtVBCF0XQnqZqw+zksCi5CSblcNNaFD?=
 =?us-ascii?Q?PtU5t8m8jhiDqGk8B+icGePsIz9DOhk5iyo1kEBjKEU+hof+o0bghN2OU6j9?=
 =?us-ascii?Q?UdItbNPh9aBKH1jUqcyyaVTW2EMsfsyP/H2hw7/NblgYz7H/Nu0HLwx0pxXG?=
 =?us-ascii?Q?YVCDDPO7BnvmGoAHZ/6ob3D5lzPPAuyF69wEk1DjKDNpGdCp1t9HWIJB9oHQ?=
 =?us-ascii?Q?DjLhqwT1WkxWFZN3EO6GmN3CUywIA7jTvvfKcNQWd3lhkjW/+R43yJSb4lSc?=
 =?us-ascii?Q?WEjHBjOFFf5X9WGr8mQVILzYkiBLnX3bM06Is4/wFsy+l7OxBT+DpDz4kPUZ?=
 =?us-ascii?Q?3D6EIXpHlUlWweL9x2CT7JBAgg6jJ6fL08LM5er762Vlfv7oIbePxzZrAqeb?=
 =?us-ascii?Q?gHxWNRqCLeb9F3Dz5/8xM+WFHH7/+7P8r87RcA6GhdxapBBlsNaBnSTMRo7i?=
 =?us-ascii?Q?/us1d05T6zZxG3gRXqu7Uo3SC/4HT5cGjuYowTRnLPJNKbhetTkx7igh2Cyn?=
 =?us-ascii?Q?VlsihMK9FJixjhyS0UDQ5fHoJimumNNNuOZBgZ4awOvQXVkDZnsttOKaiB+a?=
 =?us-ascii?Q?XquYLmdIy4kadki0YAlElM/A5MwxfE1LM2KIKrxnhrTD4ujOEBiaIivLQ+dn?=
 =?us-ascii?Q?4yKRGHiKlo67f2fdHKyUGZNoiCoDNTu5XeSQHQuZst++gEIgiTo/Vt1se6KA?=
 =?us-ascii?Q?888Kca5beHRzpDwrCsmBE5n74ZJ+rP05yqAVVO4enEusYVFw1cXgUQq2FwoO?=
 =?us-ascii?Q?QOkh4Z+Nx6ZxZSX1T2wyTuMI0INLSHSuIJ3rNTfi4BVaYBOWEGSYc2lsB/Bi?=
 =?us-ascii?Q?IIHLHE8td21ciWEKpRiPWxMdB3nOaxoaRA/VKh/xnpT+XsHHrKbae6MsHbIW?=
 =?us-ascii?Q?vIweyUY2dot3gOluqpOybp91yNrNUTEAYW6mgvhQpG0TMK4EdX8rxS92MihZ?=
 =?us-ascii?Q?K9c/SzKwVoWRhxnmSSgzXZzlgILUs3Vz9yu0LSs+IQu7L1k2r/u7DJqQk1ui?=
 =?us-ascii?Q?MXfz+GqQZheMUFEoXdu1FlvBmLftroCDkKuV5BsD0PbmOMBRhqKYPEPjTkSH?=
 =?us-ascii?Q?TDUnW39lmwtPGhnP27zkEL/4i0Z+a36muyPrdnAUSzkq3MEW+e/R4m+aKK56?=
 =?us-ascii?Q?G+MDGqo0+mz7ou9NvXD+cDnkGa5mNYFy5Hdcm2uzw6JN09CMOli7XzQS4vOj?=
 =?us-ascii?Q?HT8B5iw2iY84IPxaQp4ZtiXpj0lNTZDlVSRtPPjUndZntNpFI74bKDR7m40b?=
 =?us-ascii?Q?KBRRsft1DVFqrTqn7X4I5gzQrRS6H3bhR7AM9PBM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73aabbbf-c10a-4267-5721-08ddff202f1f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 06:19:45.6123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLo2IRG4LTHlxvGxi19xogomA6kmpUN9+VSC347YmOBpEqqZ+pr+mvP/tpyR4vPgRQFq9NsmH1OI0o/+iTrqJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9186
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

On 2025-09-26 at 14:37 +1000, Alexandre Courbot <acourbot@nvidia.com> wrote...
> Hi Alistair,
> 
> On Mon Sep 22, 2025 at 8:30 PM JST, Alistair Popple wrote:
> <snip>
> > diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
> > new file mode 100644
> > index 000000000000..a9ba1a4c73d8
> > --- /dev/null
> > +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> > @@ -0,0 +1,423 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +use core::mem::offset_of;
> > +use core::sync::atomic::fence;
> > +use core::sync::atomic::Ordering;
> > +
> > +use kernel::alloc::flags::GFP_KERNEL;
> > +use kernel::device;
> > +use kernel::dma::{CoherentAllocation, DmaAddress};
> > +use kernel::prelude::*;
> > +use kernel::sync::aref::ARef;
> > +use kernel::time::Delta;
> > +use kernel::transmute::{AsBytes, FromBytes};
> > +use kernel::{dma_read, dma_write};
> > +
> > +use super::fw::{
> > +    NV_VGPU_MSG_EVENT_GSP_INIT_DONE, NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
> > +    NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD, NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
> > +    NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED, NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
> > +    NV_VGPU_MSG_EVENT_POST_EVENT, NV_VGPU_MSG_EVENT_RC_TRIGGERED,
> > +    NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT, NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
> > +    NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA, NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE,
> > +    NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY, NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
> > +    NV_VGPU_MSG_FUNCTION_ALLOC_ROOT, NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA, NV_VGPU_MSG_FUNCTION_FREE,
> > +    NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
> > +    NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU, NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
> > +    NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO, NV_VGPU_MSG_FUNCTION_LOG,
> > +    NV_VGPU_MSG_FUNCTION_MAP_MEMORY, NV_VGPU_MSG_FUNCTION_NOP,
> > +    NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO, NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
> > +};
> 
> As I mentioned in v1, let's turn these into two enums to avoid this big
> import and make sure we can never mix up the values.
> 
> This can be something like this in `fw.rs`:
> 
> #[repr(u32)]
> pub(crate) enum VgpuMsgEvent {
>     GspInitDone = bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
>     GspLockDownNotice = bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
>     ...
> }
> 
> Then you just need to import `VgpuMsgEvent`, and can use that type where
> appropriate, e.g. for the `FUNCTION` associated type of
> `GspMessageFromGsp`.

Yep, makes sense. I'd just overlooked this one.

> > +use crate::driver::Bar0;
> > +use crate::gsp::create_pte_array;
> > +use crate::gsp::fw::{GspMsgElement, MsgqRxHeader, MsgqTxHeader};
> > +use crate::gsp::{GSP_PAGE_SHIFT, GSP_PAGE_SIZE};
> > +use crate::regs::NV_PGSP_QUEUE_HEAD;
> > +use crate::sbuffer::SBuffer;
> > +use crate::util::wait_on;
> > +
> > +pub(crate) trait GspCommandToGsp: Sized + FromBytes + AsBytes {
> > +    const FUNCTION: u32;
> > +}
> > +
> > +pub(crate) trait GspMessageFromGsp: Sized + FromBytes + AsBytes {
> > +    const FUNCTION: u32;
> > +}
> 
> Do we need to repeat `Gsp` in these trait names? `CommandToGsp` and
> `MessageFromGsp` should be fine.

Nah, and actually they're quite confusing really. Gsp sending a message from the
Gsp. Will fix them up.
 
> (I am also guilty of prefixing type names to avoid name collisions - a
> habit inherited from years of C programming, but since we are already in
> the `gsp` module we can forgo this habit as users can just import the
> module and refer to the type as `gsp::MessageFromGsp` if there is any
> ambiguity).

Indeed. Old habits die hard and all that.

> > +
> > +/// Number of GSP pages making the Msgq.
> > +pub(crate) const MSGQ_NUM_PAGES: u32 = 0x3f;
> > +
> > +#[repr(C, align(0x1000))]
> > +#[derive(Debug)]
> > +struct MsgqData {
> > +    data: [[u8; GSP_PAGE_SIZE]; MSGQ_NUM_PAGES as usize],
> > +}
> > +
> > +// Annoyingly there is no real equivalent of #define so we're forced to use a
> > +// literal to specify the alignment above. So check that against the actual GSP
> > +// page size here.
> > +static_assert!(align_of::<MsgqData>() == GSP_PAGE_SIZE);
> > +
> > +// There is no struct defined for this in the open-gpu-kernel-source headers.
> > +// Instead it is defined by code in GspMsgQueuesInit().
> > +#[repr(C)]
> > +struct Msgq {
> > +    tx: MsgqTxHeader,
> > +    rx: MsgqRxHeader,
> > +    msgq: MsgqData,
> > +}
> > +
> > +#[repr(C)]
> > +struct GspMem {
> > +    ptes: [u8; GSP_PAGE_SIZE],
> > +    cpuq: Msgq,
> > +    gspq: Msgq,
> > +}
> > +
> > +// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
> > +// that is not a problem because they are not used outside the kernel.
> > +unsafe impl AsBytes for GspMem {}
> > +
> > +// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
> > +// that is not a problem because they are not used outside the kernel.
> > +unsafe impl FromBytes for GspMem {}
> 
> These ARE used outside the kernel, since they are shared with the GSP.
> :) I'd say the reason these are safe is just because we satisfy the
> requirements of AsBytes and FromBytes:

Yes, and they're actually old safety comments that I missed updating to be the
same as the rest.
 
> - No initialized bytes,
> - No interior mutability,
> - All bytes patterns are valid (for some generous definition of
>   "valid" limited to not triggering UB).

I was under the impression that that's all `unsafe` is really marking - code
the compiler can't prove won't trigger UB. So I'd assume that's all we'd have to
prove in safety comments anyway.

> > +
> > +/// `GspMem` struct that is shared with the GSP.
> > +struct DmaGspMem(CoherentAllocation<GspMem>);
> > +
> > +impl DmaGspMem {
> > +    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
> > +        const MSGQ_SIZE: u32 = size_of::<Msgq>() as u32;
> > +        const RX_HDR_OFF: u32 = offset_of!(Msgq, rx) as u32;
> > +
> > +        let mut gsp_mem =
> > +            CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
> > +        create_pte_array(&mut gsp_mem, 0);
> > +        dma_write!(gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF))?;
> > +        dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new())?;
> > +
> > +        Ok(Self(gsp_mem))
> > +    }
> > +
> > +    #[expect(unused)]
> > +    fn dma_handle(&self) -> DmaAddress {
> > +        self.0.dma_handle()
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// The caller must ensure that the device doesn't access the parts of the [`GspMem`] it works
> > +    /// with.
> > +    unsafe fn access_mut(&mut self) -> &mut GspMem {
> > +        // SAFETY:
> > +        // - The [`CoherentAllocation`] contains exactly one object.
> > +        // - Per the safety statement of the function, no concurrent access wil be performed.
> > +        &mut unsafe { self.0.as_slice_mut(0, 1) }.unwrap()[0]
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// The caller must ensure that the device doesn't access the parts of the [`GspMem`] it works
> > +    /// with.
> > +    unsafe fn access(&self) -> &GspMem {
> > +        // SAFETY:
> > +        // - The [`CoherentAllocation`] contains exactly one object.
> > +        // - Per the safety statement of the function, no concurrent access wil be performed.
> > +        &unsafe { self.0.as_slice(0, 1) }.unwrap()[0]
> > +    }
> 
> Since these two methods are only called once each from
> `driver_write/read_area`, let's inline them there and reduce our
> `unsafe` keyword counter.

Sure.

> > +
> > +    fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
> > +        let tx = self.cpu_write_ptr() as usize;
> > +        let rx = self.gsp_read_ptr() as usize;
> > +
> > +        // SAFETY: we will only access the driver-owned part of the shared memory.
> > +        let gsp_mem = unsafe { self.access_mut() };
> > +        let (before_tx, after_tx) = gsp_mem.cpuq.msgq.data.split_at_mut(tx);
> > +
> > +        if rx <= tx {
> > +            // The area from `tx` up to the end of the ring, and from the beginning of the ring up
> > +            // to `rx`, minus one unit, belongs to the driver.
> > +            if rx == 0 {
> > +                let last = after_tx.len() - 1;
> > +                (&mut after_tx[..last], &mut before_tx[0..0])
> > +            } else {
> > +                (after_tx, &mut before_tx[..rx])
> > +            }
> > +        } else {
> > +            // The area from `tx` to `rx`, minus one unit, belongs to the driver.
> > +            (after_tx.split_at_mut(rx - tx).0, &mut before_tx[0..0])
> > +        }
> > +    }
> > +
> > +    fn driver_read_area(&self) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PAGE_SIZE]]) {
> > +        let tx = self.gsp_write_ptr() as usize;
> > +        let rx = self.cpu_read_ptr() as usize;
> > +
> > +        // SAFETY: we will only access the driver-owned part of the shared memory.
> > +        let gsp_mem = unsafe { self.access() };
> > +        let (before_rx, after_rx) = gsp_mem.gspq.msgq.data.split_at(rx);
> > +
> > +        if tx <= rx {
> > +            // The area from `rx` up to the end of the ring, and from the beginning of the ring up
> > +            // to `tx`, minus one unit, belongs to the driver.
> > +            if tx == 0 {
> > +                let last = after_rx.len() - 1;
> > +                (&after_rx[..last], &before_rx[0..0])
> > +            } else {
> > +                (after_rx, &before_rx[..tx])
> > +            }
> > +        } else {
> > +            // The area from `rx` to `tx`, minus one unit, belongs to the driver.
> > +            (after_rx.split_at(tx - rx).0, &before_rx[0..0])
> > +        }
> > +    }
> 
> As we discussed offline, this method is incorrect (amongst other things,
> it returns the whole ring buffer when it should be empty). Posting my
> suggested diff for the record:

Yep. I'm not sure how it was working on my setup but not yours but clearly
wrong.

> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -152,17 +152,12 @@ unsafe fn access(&self) -> &GspMem {
>          let gsp_mem = unsafe { self.access() };
>          let (before_rx, after_rx) = gsp_mem.gspq.msgq.data.split_at(rx);
> 
> -        if tx <= rx {
> +        if tx < rx {
>              // The area from `rx` up to the end of the ring, and from the beginning of the ring up
> -            // to `tx`, minus one unit, belongs to the driver.
> -            if tx == 0 {
> -                let last = after_rx.len() - 1;
> -                (&after_rx[..last], &before_rx[0..0])
> -            } else {
> -                (after_rx, &before_rx[..tx])
> -            }
> +            // to `tx` belongs to the driver.
> +            (after_rx, &before_rx[0..tx])
>          } else {
> -            // The area from `rx` to `tx`, minus one unit, belongs to the driver.
> +            // The area from `rx` to `tx` belongs to the driver.
>              (after_rx.split_at(tx - rx).0, &before_rx[0..0])
>          }
>      }

Thanks, similar to what I had. Although I also had this to avoid the panic later
when no message is present:

@@ -321,6 +315,10 @@ pub(crate) fn receive_msg_from_gsp<M: GspMessageFromGsp, R>(
     ) -> Result<R> {
         let (driver_area, msg_header, slice_1) = wait_on(timeout, || {
             let driver_area = self.gsp_mem.driver_read_area();
+            if driver_area.0.is_empty() {
+                return None;
+            }
+
             // TODO: find an alternative to as_flattened()
             #[allow(clippy::incompatible_msrv)]
             let (msg_header_slice, slice_1) = driver_area

> > +
> > +    fn gsp_write_ptr(&self) -> u32 {
> > +        let gsp_mem = &self.0;
> > +        dma_read!(gsp_mem[0].gspq.tx.writePtr).unwrap() % MSGQ_NUM_PAGES
> > +    }
> > +
> > +    fn gsp_read_ptr(&self) -> u32 {
> > +        let gsp_mem = &self.0;
> > +        dma_read!(gsp_mem[0].gspq.rx.readPtr).unwrap() % MSGQ_NUM_PAGES
> > +    }
> > +
> > +    fn cpu_read_ptr(&self) -> u32 {
> > +        let gsp_mem = &self.0;
> > +        dma_read!(gsp_mem[0].cpuq.rx.readPtr).unwrap() % MSGQ_NUM_PAGES
> > +    }
> 
> Maybe add one line of documentation for these. Generally I think we want
> a bit more high-level documentation explaining how the ring buffers are
> operating.

Yeah, good idea. Something I've been meaning to do (document the ring buffer a
bit better).

> > +
> > +    /// Inform the GSP that it can send `elem_count` new pages into the message queue.
> > +    fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
> > +        let gsp_mem = &self.0;
> > +        let rptr = self.cpu_read_ptr().wrapping_add(elem_count) % MSGQ_NUM_PAGES;
> > +
> > +        // Ensure read pointer is properly ordered
> > +        fence(Ordering::SeqCst);
> > +
> > +        dma_write!(gsp_mem[0].cpuq.rx.readPtr = rptr).unwrap();
> > +    }
> > +
> > +    fn cpu_write_ptr(&self) -> u32 {
> > +        let gsp_mem = &self.0;
> > +        dma_read!(gsp_mem[0].cpuq.tx.writePtr).unwrap() % MSGQ_NUM_PAGES
> > +    }
> > +
> > +    /// Inform the GSP that it can process `elem_count` new pages from the command queue.
> > +    fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
> > +        let gsp_mem = &self.0;
> > +        let wptr = self.cpu_write_ptr().wrapping_add(elem_count) & MSGQ_NUM_PAGES;
> > +        dma_write!(gsp_mem[0].cpuq.tx.writePtr = wptr).unwrap();
> > +
> > +        // Ensure all command data is visible before triggering the GSP read
> > +        fence(Ordering::SeqCst);
> > +    }
> > +}
> > +
> > +pub(crate) struct GspCmdq {
> 
> Similar to my previous comment, we can just name this `Cmdq` since we
> are already in the `gsp` module.
>
> As a general comment, let's also document our types/methods a bit more,
> explaining at least what they are for.

Ack.

> > +    dev: ARef<device::Device>,
> > +    seq: u32,
> > +    gsp_mem: DmaGspMem,
> > +    pub _nr_ptes: u32,
> > +}
> > +
> > +impl GspCmdq {
> > +    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<GspCmdq> {
> > +        let gsp_mem = DmaGspMem::new(dev)?;
> > +        let nr_ptes = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
> > +        build_assert!(nr_ptes * size_of::<u64>() <= GSP_PAGE_SIZE);
> > +
> > +        Ok(GspCmdq {
> > +            dev: dev.into(),
> > +            seq: 0,
> > +            gsp_mem,
> > +            _nr_ptes: nr_ptes as u32,
> > +        })
> > +    }
> > +
> > +    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
> > +        let sum64 = it
> > +            .enumerate()
> > +            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
> > +            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_left(rol));
> > +
> > +        ((sum64 >> 32) as u32) ^ (sum64 as u32)
> > +    }
> > +
> > +    #[expect(unused)]
> > +    pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
> > +        &mut self,
> > +        bar: &Bar0,
> > +        payload_size: usize,
> > +        init: impl FnOnce(&mut M, SBuffer<core::array::IntoIter<&mut [u8], 2>>) -> Result,
> 
> This works pretty well for in-place initialization.
> 
> There a couple of small drawbacks though: `M` must implement `FromBytes`
> even though we only send it, and (more serious) there is no guarantee

Yes, that detail annoyed me slightly too.

> that `init` will fully initialize the command - a forgetful caller can
> omit some of its fields, or even the whole structure, and in that case
> we will send a command with what happened to be at that position of the
> queue at that time.

Good timing as I was just looking to see if there wasn't some way of ensuring
this happened, or at least was much more explicit than what we currently do.

> I think this is a good case for using the `Init` trait: it's like
> `PinInit`, but without the `Pin`, and it ensures that the whole argument
> is initialized. So this method would change into something like:
> 
>     pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
>         &mut self,
>         bar: &Bar0,
>         payload_size: usize,
>         init: impl Init<M, Error>,
>         init_sbuf: impl FnOnce(SBuffer<core::array::IntoIter<&mut [u8], 2>>) -> Result,
> 
> This also allows us to drop the `FromBytes` requirement on
> `GspCommandToGsp`! But also requires us to use `unsafe` to call
> `Init::__init` on the pointer to the command. I think it's worth it
> though, as this removes the risk of sending partially-uninitialized
> commands.

Agree on it being worth the unsafe call, especially because it is unsafe if the
caller doesn't do what it's supposed to regardless. But how does this contrast
with `MaybeUninit`? I was wondering if something like this would work:

    pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
        &mut self,
        bar: &Bar0,
        payload_size: usize,
        init: impl FnOnce(MaybeUninit<&mut M>, SBuffer<core::array::IntoIter<&mut [u8], 2>>) -> Result<&M>,

Note I'm not sure we could actually make that work as I haven't tried it yet. I
suspect I've missed something with lifetimes there :-)

> Then there is what to do with the `SBuffer`. I'd like to think a bit
> more about this, as not all commands require it, and those that do
> typically send arrays of particular types. I think we should be able to
> use the type system to have more control over this, but let's keep that
> for the next revision.

Sure. You are correct that not all (most?) commands don't need it, and it's a
shame we don't have proper bindings for them anyway. Although in some cases that
still wouldn't work anyway (eg. for registry keys) where it really is just a
packed variable number of variable length strings. Not sure what a Rust native
representation of that would be.

> > +    ) -> Result {
> > +        // TODO: a method that extracts the regions for a given command?
> > +        // ... and another that reduces the region to a given number of bytes!
> > +        let driver_area = self.gsp_mem.driver_write_area();
> > +        let free_tx_pages = driver_area.0.len() + driver_area.1.len();
> > +
> > +        // Total size of the message, including the headers, command, and optional payload.
> > +        let msg_size = size_of::<GspMsgElement>() + size_of::<M>() + payload_size;
> > +        if free_tx_pages < msg_size.div_ceil(GSP_PAGE_SIZE) {
> > +            return Err(EAGAIN);
> > +        }
> > +
> > +        let (msg_header, cmd, payload_1, payload_2) = {
> > +            // TODO: find an alternative to as_flattened_mut()
> 
> I think we can use it if we enable the "slice_flatten" feature (stable
> since 1.80, introduced in 1.67).

Ok, will try that. Hopefully explicitly using the feature also makes clippy
happy but if not I guess we can leave the over-rides below.

> > +            #[allow(clippy::incompatible_msrv)]
> > +            let (msg_header_slice, slice_1) = driver_area
> > +                .0
> > +                .as_flattened_mut()
> > +                .split_at_mut(size_of::<GspMsgElement>());
> > +            let msg_header = GspMsgElement::from_bytes_mut(msg_header_slice).ok_or(EINVAL)?;
> > +            let (cmd_slice, payload_1) = slice_1.split_at_mut(size_of::<M>());
> > +            let cmd = M::from_bytes_mut(cmd_slice).ok_or(EINVAL)?;
> > +            // TODO: find an alternative to as_flattened_mut()
> > +            #[allow(clippy::incompatible_msrv)]
> > +            let payload_2 = driver_area.1.as_flattened_mut();
> > +            // TODO: Replace this workaround to cut the payload size.
> > +            let (payload_1, payload_2) = match payload_size.checked_sub(payload_1.len()) {
> > +                // The payload is longer than `payload_1`, set `payload_2` size to the difference.
> > +                Some(payload_2_len) => (payload_1, &mut payload_2[..payload_2_len]),
> > +                // `payload_1` is longer than the payload, we need to reduce its size.
> > +                None => (&mut payload_1[..payload_size], payload_2),
> > +            };
> 
> We will want (either you or I) to address these TODOs for the next
> revision.

Yep, I'm happy to (along with any others that are still floating about).

> > +
> > +            (msg_header, cmd, payload_1, payload_2)
> > +        };
> > +
> > +        let sbuffer = SBuffer::new_writer([&mut payload_1[..], &mut payload_2[..]]);
> > +        init(cmd, sbuffer)?;
> > +
> > +        *msg_header = GspMsgElement::new(self.seq, size_of::<M>() + payload_size, M::FUNCTION);
> > +        msg_header.checkSum = GspCmdq::calculate_checksum(SBuffer::new_reader([
> > +            msg_header.as_bytes(),
> > +            cmd.as_bytes(),
> > +            payload_1,
> > +            payload_2,
> > +        ]));
> > +
> > +        let rpc_header = &msg_header.rpc;
> > +        dev_info!(
> > +            &self.dev,
> > +            "GSP RPC: send: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
> > +            self.seq,
> > +            rpc_header.function,
> > +            decode_gsp_function(rpc_header.function),
> > +            rpc_header.length,
> > +        );
> > +
> > +        let elem_count = msg_header.elemCount;
> > +        self.seq += 1;
> > +        self.gsp_mem.advance_cpu_write_ptr(elem_count);
> > +        NV_PGSP_QUEUE_HEAD::default().set_address(0).write(bar);
> 
> I'm a bit surprised that we always write `0` here, can we document this
> behavior, maybe in the definition of `NV_PGSP_QUEUE_HEAD`?

I was also suprised the value doesn't matter but this is what both Nouveau and
OpenRM do. I guess it just triggers some kind of notification on the GSP and the
actual queue head is read from the shared memory pointers.

> > +
> > +        Ok(())
> > +    }
> > +
> > +    #[expect(unused)]
> > +    pub(crate) fn receive_msg_from_gsp<M: GspMessageFromGsp, R>(
> > +        &mut self,
> > +        timeout: Delta,
> > +        init: impl FnOnce(&M, SBuffer<core::array::IntoIter<&[u8], 2>>) -> Result<R>,
> > +    ) -> Result<R> {
> > +        let (driver_area, msg_header, slice_1) = wait_on(timeout, || {
> > +            let driver_area = self.gsp_mem.driver_read_area();
> > +            // TODO: find an alternative to as_flattened()
> > +            #[allow(clippy::incompatible_msrv)]
> > +            let (msg_header_slice, slice_1) = driver_area
> > +                .0
> > +                .as_flattened()
> > +                .split_at(size_of::<GspMsgElement>());
> 
> Beware that `split_at` will panic if the slice is shorter than the
> passed argument. So we must check here that the driver area is larger
> than `GspMsgElement`.

Yep, see the diff I had above.

> > +
> > +            // Can't fail because msg_slice will always be
> > +            // size_of::<GspMsgElement>() bytes long by the above split.
> > +            let msg_header = GspMsgElement::from_bytes(msg_header_slice).unwrap();
> > +            if msg_header.rpc.length < size_of::<M>() as u32 {
> > +                return None;
> > +            }
> 
> If we have a message in the queue and this condition doesn't hold, I
> don't think we can hope that it will in a further iteration - this
> should be an error.

I was thinking messages may get partially written and we'd see this state, but
you're right - the shared pointers shouldn't be updated until the entire message
is written so this should be an error.

That will require the `wait_on_result()` function, because `wait_on()` doesn't
allow the closure to return a failure. We could just return Option<Result<_>>
from the closure but that's a bit gross, because wait_on() would then return
Result<Option<Result<_>>>.

> > +
> > +            Some((driver_area, msg_header, slice_1))
> > +        })?;
> > +
> > +        let (cmd_slice, payload_1) = slice_1.split_at(size_of::<M>());
> > +        let cmd = M::from_bytes(cmd_slice).ok_or(EINVAL)?;
> > +        // TODO: find an alternative to as_flattened()
> > +        #[allow(clippy::incompatible_msrv)]
> > +        let payload_2 = driver_area.1.as_flattened();
> 
> There is an issue here - payload_1 and payload_2 cover the *whole* area
> that is readable by the driver, not just the first message in the queue.

Oh good catch.

> If there is more than one message pending when this method is called, we
> will get a wrong checksum and skip all the following messages. We need
> to truncate payload_1/payload_2 to cover the exact area of the first
> message only.
>
> > +
> > +        // Log RPC receive with message type decoding
> > +        dev_info!(
> > +            self.dev,
> > +            "GSP RPC: receive: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
> > +            msg_header.rpc.sequence,
> > +            msg_header.rpc.function,
> > +            decode_gsp_function(msg_header.rpc.function),
> > +            msg_header.rpc.length,
> > +        );
> > +
> > +        if GspCmdq::calculate_checksum(SBuffer::new_reader([
> > +            msg_header.as_bytes(),
> > +            cmd.as_bytes(),
> > +            payload_1,
> > +            payload_2,
> > +        ])) != 0
> > +        {
> > +            dev_err!(
> > +                self.dev,
> > +                "GSP RPC: receive: Call {} - bad checksum",
> > +                msg_header.rpc.sequence
> > +            );
> > +            return Err(EIO);
> > +        }
> > +
> > +        let result = if msg_header.rpc.function == M::FUNCTION {
> 
> This should be done way earlier. At this point we have already converted
> the command bytes slices into M, which is invalid if it happens that
> this condition doesn't hold.
> 
> (on a related note, the checksum verification should also be done before
> we interpret the message, as a corrupted message could make us cast
> `cmd` into something that it is not)

Sounds good.

> > +            let sbuffer = SBuffer::new_reader([payload_1, payload_2]);
> > +            init(cmd, sbuffer)
> > +        } else {
> > +            Err(ERANGE)
> > +        };
> > +
> > +        self.gsp_mem
> > +            .advance_cpu_read_ptr(msg_header.rpc.length.div_ceil(GSP_PAGE_SIZE as u32));
> 
> There is a landmine here. `msg_header.rpc.length` contains the length of
> the payload, INCLUDING the RPC header itself, but NOT INCLUDING the
> remainder of `msg_header`. Therefore the correct statement should be:
> 
>     self.gsp_mem.advance_cpu_read_ptr(
>         (size_of_val(msg_header) as u32 - size_of_val(&msg_header.rpc) as u32
>             + msg_header.rpc.length)
>             .div_ceil(GSP_PAGE_SIZE as u32),
>     );
> 
> Of course, it looks horrible, so we want to hide this member altogether
> and provide a nice, well-documented method that returns something that
> is immediately useful for us. More on that in `fw.rs`.
> 
> (the previous use of `length` in this method is also incorrect).
> 
> > +        result
> > +    }
> > +}
> > +
> > +fn decode_gsp_function(function: u32) -> &'static str {
> 
> Once we have proper enums for the function and events, this can be an
> `as_str` method.

Yep.

> > +    match function {
> > +        // Common function codes
> > +        NV_VGPU_MSG_FUNCTION_NOP => "NOP",
> > +        NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO => "SET_GUEST_SYSTEM_INFO",
> > +        NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => "ALLOC_ROOT",
> > +        NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE => "ALLOC_DEVICE",
> > +        NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY => "ALLOC_MEMORY",
> > +        NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA => "ALLOC_CTX_DMA",
> > +        NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA => "ALLOC_CHANNEL_DMA",
> > +        NV_VGPU_MSG_FUNCTION_MAP_MEMORY => "MAP_MEMORY",
> > +        NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => "BIND_CTX_DMA",
> > +        NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT => "ALLOC_OBJECT",
> > +        NV_VGPU_MSG_FUNCTION_FREE => "FREE",
> > +        NV_VGPU_MSG_FUNCTION_LOG => "LOG",
> > +        NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO => "GET_GSP_STATIC_INFO",
> > +        NV_VGPU_MSG_FUNCTION_SET_REGISTRY => "SET_REGISTRY",
> > +        NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO => "GSP_SET_SYSTEM_INFO",
> > +        NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU => "GSP_INIT_POST_OBJGPU",
> > +        NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL => "GSP_RM_CONTROL",
> > +        NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => "GET_STATIC_INFO",
> > +
> > +        // Event codes
> > +        NV_VGPU_MSG_EVENT_GSP_INIT_DONE => "INIT_DONE",
> > +        NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => "RUN_CPU_SEQUENCER",
> > +        NV_VGPU_MSG_EVENT_POST_EVENT => "POST_EVENT",
> > +        NV_VGPU_MSG_EVENT_RC_TRIGGERED => "RC_TRIGGERED",
> > +        NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED => "MMU_FAULT_QUEUED",
> > +        NV_VGPU_MSG_EVENT_OS_ERROR_LOG => "OS_ERROR_LOG",
> > +        NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => "NOCAT",
> > +        NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE => "LOCKDOWN_NOTICE",
> > +        NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT => "LIBOS_PRINT",
> > +
> > +        // Default for unknown codes
> > +        _ => "UNKNOWN",
> > +    }
> > +}
> > diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
> > index 7f4fe684ddaf..2e4255301e58 100644
> > --- a/drivers/gpu/nova-core/gsp/fw.rs
> > +++ b/drivers/gpu/nova-core/gsp/fw.rs
> > @@ -15,7 +15,9 @@
> >  use crate::firmware::gsp::GspFirmware;
> >  use crate::gpu::Chipset;
> >  use crate::gsp;
> > +use crate::gsp::cmdq::MSGQ_NUM_PAGES;
> 
> I guess the number of pages in the message queue is firmware-dependent,
> so would it make sense to move its declaration to this module?

It's not firmware dependent - it appears we can set it to whatever we reasonably
want (for some value of "reasonable) so long as we allocate the right buffer
sizes, etc. I noticed and tested this a while back when removing some magic
numbers.

That said 0x3f is what I chose because that's what Nouveau and I think OpenRM
use.

> >  use crate::gsp::FbLayout;
> > +use crate::gsp::GSP_PAGE_SIZE;
> >  
> >  /// Dummy type to group methods related to heap parameters for running the GSP firmware.
> >  pub(crate) struct GspFwHeapParams(());
> > @@ -159,6 +161,37 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
> >      // GSP firmware constants
> >      GSP_FW_WPR_META_MAGIC,
> >      GSP_FW_WPR_META_REVISION,
> > +
> > +    // GSP events
> > +    NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
> > +    NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
> > +    NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
> > +    NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
> > +    NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
> > +    NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
> > +    NV_VGPU_MSG_EVENT_POST_EVENT,
> > +    NV_VGPU_MSG_EVENT_RC_TRIGGERED,
> > +    NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
> > +
> > +    // GSP function calls
> > +    NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
> > +    NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
> > +    NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE,
> > +    NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY,
> > +    NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
> > +    NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
> > +    NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
> > +    NV_VGPU_MSG_FUNCTION_FREE,
> > +    NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
> > +    NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
> > +    NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU,
> > +    NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
> > +    NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
> > +    NV_VGPU_MSG_FUNCTION_LOG,
> > +    NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
> > +    NV_VGPU_MSG_FUNCTION_NOP,
> > +    NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
> > +    NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
> >  };
> >  
> >  #[repr(transparent)]
> > @@ -197,3 +230,86 @@ fn id8(name: &str) -> u64 {
> >          })
> >      }
> >  }
> > +
> > +pub(crate) type MsgqTxHeader = bindings::msgqTxHeader;
> 
> This should be wrapped into a newtype that provides the exact set of
> features required by the gsp module, like what is done for
> `LibosMemoryRegionInitArgument`. For this type we just need two things:
> return the `writePtr`, and advance it by a given value. That's all
> the parent module needs to see.

Except that doesn't actually work, because we need to use DMA access methods on
bindings::msgqTxHeader which we can't do from an accessor.

> By just aliasing this type, we make all its members visible to the `gsp`
> module. This increases its dependency on a given firmware version,
> carries a risk that the GSP module will mess with what it is not
> supposed to, and introduces inconsistency in how we abstract the
> firmware types - some are wrapped, others are not. Let's be consistent
> and make all bindings completely opaque outside of `fw.rs`.

I can't see how accessors in `fw.rs` for every firmware binding we use is useful
though[1]? In what way does that reduce dependency on a given firmware version?
I can't see how it isn't just adding boiler plate for every struct field we want
to access.

We already have higher level abstractions (eg. DmaGspMem) to ensure the GSP
won't mess with what it isn't supposed to, and these higher level abstractions
also provide more options to reduce dependency on a given firmware version as
the logic isn't as tightly coupled to the binding representation. It also allows
us to access the fields using the proper DMA access methods.

[1] - Except for maybe removing some nonRustySnakeyNames

> > +
> > +// SAFETY: Padding is explicit and will not contain uninitialized data.
> > +unsafe impl AsBytes for MsgqTxHeader {}
> > +
> > +impl MsgqTxHeader {
> > +    pub(crate) fn new(msgq_size: u32, rx_hdr_offset: u32) -> Self {
> > +        Self {
> > +            version: 0,
> > +            size: msgq_size,
> > +            msgSize: GSP_PAGE_SIZE as u32,
> > +            msgCount: MSGQ_NUM_PAGES,
> > +            writePtr: 0,
> > +            flags: 1,
> > +            rxHdrOff: rx_hdr_offset,
> > +            entryOff: GSP_PAGE_SIZE as u32,
> > +        }
> > +    }
> > +}
> > +
> > +/// RX header for setting up a message queue with the GSP.
> > +///
> > +/// # Invariants
> > +///
> > +/// [`Self::read_ptr`] is guaranteed to return a value in the range `0..NUM_PAGES`.
> > +pub(crate) type MsgqRxHeader = bindings::msgqRxHeader;
> > +
> > +// SAFETY: Padding is explicit and will not contain uninitialized data.
> > +unsafe impl AsBytes for MsgqRxHeader {}
> > +
> > +impl MsgqRxHeader {
> > +    pub(crate) fn new() -> Self {
> > +        Default::default()
> > +    }
> > +}
> > +
> > +pub(crate) type GspRpcHeader = bindings::rpc_message_header_v;
> 
> This type too is another good illustration of why we should make our
> bindings opaque. In `cmdq.rs` we access `GspRpcHeader::length` multiple
> times, ignoring the fact that it also includes the size of the RPC
> header itself - not just what comes after it! Since it doesn't come with
> any documentation, we can be forgiven for assuming the obvious - that it
> is just the size of what follows, but it is not.

This has nothing to do with the bindings being opaque or not though. I can
almost gurantee that after writing ten brain dead accessor functions that the
eleventh would have looked pretty similar and included the same bug!

> What we actually want is a method on `GspMsgElement` that returns what
> we actually want (and is documented as such): the actual size of the
> payload following the whole header. That way there can be no room for
> mistake.

The length calculation can just be a method on GspRpcHeader without requiring
the rest of the fields to need accessor functions as welli though.

Take for example a structure that we will need in future, GspStaticConfigInfo_t.
This currently has 53 fields, although to be fair maybe we only care about half
of them.

My proposal[2] is to convert them into an abstract nova-core specific type,
GspConfigInfo, that contains the specific details Nova users care about.
Following the implied rule that no field accessors shall leak from fw.rs would
require accessors for all fields. That's at least another 78 lines (assuming a
minimal 3 line accessor function) of boiler plate for one FW structure. Multiply
that by many structures and you now have a lot of boiler plate for no real gain
and a very large fw.rs (note my example[2] only contains one field, but I expect
we will need a lot more if not most of them).

[2] - https://github.com/apopple-nvidia/linux/blob/nova-core-unstable/drivers/gpu/nova-core/gsp/commands.rs#L32

> > +
> > +// SAFETY: Padding is explicit and will not contain uninitialized data.
> > +unsafe impl AsBytes for GspRpcHeader {}
> > +
> > +// SAFETY: This struct only contains integer types for which all bit patterns
> > +// are valid.
> > +unsafe impl FromBytes for GspRpcHeader {}
> > +
> > +impl GspRpcHeader {
> > +    pub(crate) fn new(cmd_size: u32, function: u32) -> Self {
> > +        Self {
> > +            // TODO: magic number
> > +            header_version: 0x03000000,
> > +            signature: bindings::NV_VGPU_MSG_SIGNATURE_VALID,
> > +            function,
> > +            // TODO: overflow check?
> > +            length: size_of::<Self>() as u32 + cmd_size,
> > +            rpc_result: 0xffffffff,
> > +            rpc_result_private: 0xffffffff,
> > +            ..Default::default()
> > +        }
> > +    }
> > +}
> > +
> > +pub(crate) type GspMsgElement = bindings::GSP_MSG_QUEUE_ELEMENT;
> 
> Hammering my previous argument a bit more: in `cmdq.rs`, we do the
> following:
> 
>     let msg_header = GspMsgElement::from_bytes(msg_header_slice).unwrap();
> 
> Even though we explicitly used `GspMsgElement`, `msg_header` appears as
> being of type `GSP_MSG_QUEUE_ELEMENT` in LSP. That's super confusing and
> can be avoided by using the newtype pattern.

That's surprising. I would have hoped the LSP would be more helpful than that.

> Lastly, the bindings generated from C headers are supposed to be temporary, and
> we eventually want to replace them with direct IDL-to-Rust bindings. Not
> leaking the C types let us design `fw.rs` as a blueprint for the ideal
> interface we would want to generate - so the limited extra labor that
> comes with wrapping these types would also pay off in that respect.

I agree with this - `fw.rs` should be the blueprint for the ideal bindings
that we could conceivably generate directly from IDL. But this is also why
I'm pushing back against the idea of putting any kind of logic (in the form of
accessors/constructors) into `fw.rs` - I doubt you will ever be able to generate
those from IDL.

For example I doubt it would be possible to generate the length logic, and I'm
even more doubtful we could figure out how to generate the constructors based on
Rust type.

So to summarise where I think we're at we have two proposals for how to
treat/use the generated bindings:

1) Make them all a newtype[3] using a transparent wrapper to make the fields
opaque and accessor functions to implement the logic. This would all be in fw.rs
to stop the C types leaking out.

2) Build a completely new type based on the underlying bindings plus whatever
other logic is needed. The C types could be used within the `gsp` module to
implement the new types but would not leak further than that.

Using GspStaticConfigInfo_t as a concrete example I think option (1) looks like
this:

In fw.rs:

#[repr(transparent)]
pub(crate) struct GspStaticConfigInfo(bindings::GspStaticConfigInfo_t);

impl GspStaticConfigInfo {
    pub(crate) fn new(gsp: &mut Gsp) -> Result<Self> {
        // Create GspStaticConfigInfo sending whatever messages needed to the Gsp.
    }
    
    pub(crate) fn gpu_name(self) -> String {
        ...
    }    

    pub(crate) fn sriov_max_gfid(self) -> u32 {
        self.0.sriovMaxGfid
    }

    pub(crate) fn fb_length(self) -> u64 {
       self.0.fb_length
    }

    pub(crate) fn ats_supported(self> -> bool {
        self.0.bAtsSupported != 0
    }

    // More for every field we need
    ...
}

And Option (2) could look more like this:

In commands.rs:

pub(crate) struct GspStaticConfigInfo {
    pub gpu_name: String,
    pub sriov_max_gfid: u32,
    pub fb_length: u64,
    pub ats_supported: bool,
}

impl GspStaticConfigInfo {
    pub(crate) fn new(gsp: &mut Gsp) -> Result<Self> {
        // Create GspStaticConfigInfo sending whatever messages needed to the Gsp.
    }
}

Peronally I favour option (2) because it is more concise and allows us to
split the code up more. It is also more resilient to FW changes as it doesn't
depend on the underlying representation at all. However based on your feedback
I think you favour option (1) more so I want to make sure I'm understanding
it correctly.

[3] - https://doc.rust-lang.org/rust-by-example/generics/new_types.html
