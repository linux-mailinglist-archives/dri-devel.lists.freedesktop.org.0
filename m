Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9094EBA7A0C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 02:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF00410E1B6;
	Mon, 29 Sep 2025 00:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LJTG/8EV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB68E10E1B4;
 Mon, 29 Sep 2025 00:39:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1FVW6g8Mk2CcVLF/g6wZRNnZaLI+Ixt+0P7D2JeKTn3o9gYh2PEhWI35PdLp9NCBn3PVjjxQ5POBFsvN+jid7XKtdqRhH7dOlpb5FJ9vh8CJNlgg/nYQLU4irOCJv9/wXywAw2upe8KHVZve72J/cjzpHmNX+F+tpYYXVHOsx+SOyDv1FabmNK8bBjHPyrN3aOHCymNrZNe8F6nYLgrFqG4UBiFlOSKutwiFkEDREqFwWsZ4VS25wec/qzkiVdyJZ80c/SELKVY/ZkMZCH3udjk9vIW3Ye+3iFCK9KD/MSOO2lYgJn23JiyazUp1g8G3T0VtTp5QHz9qwR/LdUrMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnG3U+AY76TkPjgs4akdPcPBR4+w8yNTLcLBpse4Afo=;
 b=C9Jyp77eSXQnyeWqsoSoxd5PkPY2lM/wsNxE5/hORTNkPTJNBlCFUrYUCgqThPuPsXFT7CjZeP2GjMPQyBs7rXTQ1QtBe0aVo5wADt54m6v9QGZM1Js2J/i1qyVwYRQvoWSd2QlqPpP438qWjo3j47D7FWfWMtzp1mwNPwmm7jJkKZU2j/1uJ5dEuFX6Wz11G9WXOm4iDBhhDpLEWqXcEzxJ0xOEncbcoLFjdl+OFmMfev/D1xWDdoOdtSk3IK/Sq8Tp5bhA7Z7aXXimTk0OS8biMEOLIx4QUNg7VqnRqk9gz1a3AzA/MSErFwQfBxwmbHgFIqpqfI+2NR/y/CNYcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnG3U+AY76TkPjgs4akdPcPBR4+w8yNTLcLBpse4Afo=;
 b=LJTG/8EVkoK27rYEKMmFdyEmQKgKdgGKh0eBSxFkehPKprjpkSp4fKhjElIORcuNtttOACgVFcKX1MDwhXg1qtxeMPSBFI7/yPP3CFC1JS4z8XIfTKhddhKQoP7vRoUYv+j8CGQAdT5ew+Awqbl6cBBfYiN3tEgBQlWicAqARO3iF8oPvXmA+AtrnrPRJrBa6+A29GpB7EXVfOPa0cy4Y4qao7s0hcHFloz1wdRCbMDEZUK9Z2/RaspWD708y1EQQ/2WE5GV1GTzbCsgfFm9KoK4dtU6EBXqk61KBfs2DWpazR4CWHDlREUrkEkwwwlywiYUfady7RP472Dh/GOkHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB6933.namprd12.prod.outlook.com (2603:10b6:510:1b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 00:38:59 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 00:38:59 +0000
Date: Mon, 29 Sep 2025 10:38:53 +1000
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
Subject: Re: [PATCH v2 03/10] gpu: nova-core: gsp: Create wpr metadata
Message-ID: <cy27ylj6tsnareci3fudbzdpitik3brenxux4llexah2c7hscd@d2eayj7rtku7>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-4-apopple@nvidia.com>
 <DD2C8WLZ0SKN.VEB4AXG4I0UZ@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD2C8WLZ0SKN.VEB4AXG4I0UZ@nvidia.com>
X-ClientProxiedBy: SY6PR01CA0106.ausprd01.prod.outlook.com
 (2603:10c6:10:111::21) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d24b2f-3432-484d-3043-08ddfef09463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A8tGNIPwLIvQiC16oeWRy4hkOAA+vmIq6eNm/tBlEWUKq5zY7kTIzm3bPG62?=
 =?us-ascii?Q?H35G2C2jitBAGg6Dx6qmqrpF4MGqc+8t1TJ+q+HdiXN4IJtPB88SNz2z+NyD?=
 =?us-ascii?Q?Dk0elrg4sBuSV+pQN5/ATWBMD30mljdEbH+M/lrX93nJuXFjENO2srCn6/y2?=
 =?us-ascii?Q?H2bfzP7EUMPuFjfF3qnXd5ZFZOK528tA0QmOWLxHjAyuJrQugcMwpSKPij1K?=
 =?us-ascii?Q?9Y5vpRnjcJ7Rk09mRavP3ImnvV3/02c9vni2ArI+AWt/RH9emILnNFuWxAxR?=
 =?us-ascii?Q?TeXsl3VTSQY8mWsfocfdRd356TeLK/k1pDNA47oBqIt6doFICvfDlqYTc0v9?=
 =?us-ascii?Q?4KJUv2lqghM+u4MxXtXD/gnpHFjyzKMpPFqx8MLztWdHLp/LEse5fdq4HAu1?=
 =?us-ascii?Q?SeEq0dag3H1sbpTla/OAy9rg/3dn99VEI9tip6L7WyWMv9kZm+qzpO7a+aXs?=
 =?us-ascii?Q?QyN+ugUsbIGjgyWBc79uiyMh7k/JOYWe2OxpqJWrsb0GJ3XK8UI/6jByfbHG?=
 =?us-ascii?Q?OotaXzk2t+ikb99YC2Hr3Mk9mzNWBwjezwe9Cjpoh8yOv92j+uukyNacHzia?=
 =?us-ascii?Q?WDG1sUS3pq8ryncqj0bObwxyiswLs0KBdNY3tXRYtu1tAz4jkoN1fmFrIxri?=
 =?us-ascii?Q?LYrg5JDMvYnh9Q4qe+3Mqk0RLWxFQnjqQTlACR+2VwG6T37bCP7sTZqJ7uds?=
 =?us-ascii?Q?NKs6TH/jYrMt4VnfGUeFtoK4sp+jCeixhR+yy4fhMnA9Inl5g28a9rOGAwz/?=
 =?us-ascii?Q?l6hCGGTTaUBmfxT5yI2wLgZXVMDVqfZHm8OJowQmnRq9pDcfx0NTwm6ozdBM?=
 =?us-ascii?Q?56yWOhQwMRRbpfaJsIh9DAEe7+JYPEtIEQYuC6vubpm3ZWaUMyOUSvJUqZBJ?=
 =?us-ascii?Q?EOi99rXzqXHwXwbmYP5mWxRP4UKP7kbfVE/+KF/XHugrpN5u6TKUfwfGzwd2?=
 =?us-ascii?Q?KqDo8MPpzqbCJMkvnJPZP5WpvI7VbBYH1iIBh2va0YPYgtagUPdqs30tnGVs?=
 =?us-ascii?Q?K0EhkOIENOLqXZQuylTTrJz+j33pmQ0RbKvFpHZzw1RYPKjj+dSXxje/moU+?=
 =?us-ascii?Q?uXJe+MLS+KwZyZIqIil5RcS4WzbRF7K7QD3E8AzSc2bhgpuXywyvu1vrdvKW?=
 =?us-ascii?Q?cA8ODZyEUhoTqHoG9rzIQMsYX5lJh6W2D9oJWK5RHc+hW3iHYU+kp3efTDCE?=
 =?us-ascii?Q?q7+gQvyYvrGdd9qaBecY5WJcOz9iczTvjhwBoIvW4T2u2/+jwBZKBoxWcIN+?=
 =?us-ascii?Q?GWyHFQB5/gdLaDVZcMGJ0BAbZ/OwC55qVYaW7dwYogY8hLWrfypLoR2rowIF?=
 =?us-ascii?Q?AQvPtkiwk/XHI9hvCeyZl6HP+WVMsMVmMq9lQmimjeJvlKFAav8Hdl0EgxBd?=
 =?us-ascii?Q?q+mqVZZqJaK8qEmoAZspPoaaqevu6Ix6/0cNSHz5Fd2kEJaYwoZmp+ujh77t?=
 =?us-ascii?Q?wsBxHJD2CZkwO3a7ROztEYxF58/JzZJj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u6rfknGTxw7tqNgwQFTGjaN5CrfqttoaRSPRfb34Xf4TrAgPXBX2KrpQQ8Ht?=
 =?us-ascii?Q?r/F8Yu7UUaX3QkcTJb6nZ2gbHTfPdtM/YAfROFzgpCriSem4GZucRthpgTOK?=
 =?us-ascii?Q?6N9hYpo9WdGDsU83/DFMYYtDC9QTBPNCTM9EnwLFTDOV/vT9ylwM8zGC/1yj?=
 =?us-ascii?Q?n7A0/bK4Jr8PvGs3WlcTm4bYJ2dlL3yj9AjSessLFFnXQ/BilE0bg3rmx1fG?=
 =?us-ascii?Q?+nq6iDrAgRf4HkO1imkSoTMUbu3q4hnbYh3bRsawJK3mWs62SgWzft3XxORW?=
 =?us-ascii?Q?1AXCzh9qH90UOG+4v+C/gQW79GTLHYEm1pd1AthJD6zGiZFvb3s4rst35B4D?=
 =?us-ascii?Q?h2a6aHigUZyQSerbATHPBCa33b39F05Ov5gtq1Ju1MQJjcLC0VAktZXFr5AN?=
 =?us-ascii?Q?SRQJ2bMf0e6V93lhFbO1VJvWV8n0gdkdSg9f2TUmD1m+rj5Uk53VIes1jVYg?=
 =?us-ascii?Q?yagqLJ70mMl4RCegIUhnUZ4FeU1GxGCS0zG2zPgTq+CSDNLS8RBMRoywanre?=
 =?us-ascii?Q?2POtLABJfvqvVSpHw2B08I07k8zXxx3BsptCDgWvIaOQDrhyCCA/qeFnyzmu?=
 =?us-ascii?Q?6bg4q6QUHC96oYI6NuSqJeXjRLheKDflIz2E7LgiYrT+nikPj2hVF5liRJru?=
 =?us-ascii?Q?ehONJxgfZuucdqInFpoSAu8yj+DoquV/E+iqwRfbYjrI2K0BR0SIlopZxA6z?=
 =?us-ascii?Q?KFtPll/8im4qXqQDI1M7aAnsqP691SkRCZl51ldFUBwVgwE/Bq1kwxS7IZkF?=
 =?us-ascii?Q?9M4ljxJbvftO9Fh7Wf5shkCH3Oa9OKdaPEtPZA8plNevGXwm9Mbreu/ICc7v?=
 =?us-ascii?Q?arxXHOOQeYG9SfSyue3jW7eWTF1M4zLBtGMgG/AT8mPaneYCkGF2ZZ3pABHq?=
 =?us-ascii?Q?5iaZmEk3M6d2lH1bjSHqtptVFGd66NO5VA6ZMurN3+MPn0qr1LGKGQZfcpL1?=
 =?us-ascii?Q?quuM5gU9ZSZBj7GQW20IWh3BlwukUIL4UqbfHNNWCmXmTXiul24vIpfGzSfC?=
 =?us-ascii?Q?IImaMO3UmIXlUKeJ51VLmndXlmEirH5k1DUch4ew+7WXLfVHmx2wL9RvG8qt?=
 =?us-ascii?Q?v2lGPKCYI2SMLZKSudZNHwfVGGELMJ17Y7yzFy/DqccTG/tH7d/7k/s81SaV?=
 =?us-ascii?Q?TAOCCQwBh4G634YHAiLnLx+9LxU254CjwLlg+oyEZWNQlCtrsR4aN4fR59vH?=
 =?us-ascii?Q?XSNeRttKpCPpjPGBgZkdOco+2ul2yO5Do3rs60xWxai6xvEN3SdZPS5GOgQD?=
 =?us-ascii?Q?lnsy5b+jo5LyR4DlQZlw3KQIM0mlnIpTT2SA6pP6Fn0hUZqGNqEHmDL1wgZ9?=
 =?us-ascii?Q?dnyQwI9XyYHVFvs006aGieHSwj1xmLmhp82l13NO+STd6dHd395dx/PJelSk?=
 =?us-ascii?Q?xV7KVE5n6SclabrAvQ0Z4QDBXM5TpOnX6ErpjwZBPGpuofmsNCKbVf+L/tlJ?=
 =?us-ascii?Q?a0mgJMO8nXAG1qdJkw1Q/vgX+YR3dRG33aKBuiz4Boa6uL+8St7RB0EoQv5a?=
 =?us-ascii?Q?xqwGt/r6ot2gAGlqREOnBGMS5+IXw12Hr4ZxcseUe0CgQtDzUpDxEJ8LrGPq?=
 =?us-ascii?Q?sMn6p66y7HCISE2yNUWAiLajJhckl/XhfMiyiMzY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d24b2f-3432-484d-3043-08ddfef09463
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 00:38:59.3359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cp03CrzVJn/MCF/Krwtm5FNd9tmNCxJwk2HBq4X+QxM9zNa3lP+VCRJPCSihRNWpB2Q2dXETpsIXxcjNWqsK9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6933
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

On 2025-09-26 at 11:24 +1000, Alexandre Courbot <acourbot@nvidia.com> wrote...
> On Mon Sep 22, 2025 at 8:30 PM JST, Alistair Popple wrote:
> <snip>
> > diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
> > index dd1e7fc85d85..7f4fe684ddaf 100644
> > --- a/drivers/gpu/nova-core/gsp/fw.rs
> > +++ b/drivers/gpu/nova-core/gsp/fw.rs
> <snip>
> > +pub(crate) use r570_144::{
> > +    // GSP firmware constants
> > +    GSP_FW_WPR_META_MAGIC,
> > +    GSP_FW_WPR_META_REVISION,
> > +};
> 
> Why do these need to be re-exported? I don't think we are using them
> outside of fw.rs.

Thanks, they don't now that the structs are constructed in fw.rs. Will remove
them.
