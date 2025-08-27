Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD41DB38F55
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 01:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C91610E91B;
	Wed, 27 Aug 2025 23:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fhsVcj9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0625510E925;
 Wed, 27 Aug 2025 23:42:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwq7uv/2FnlfQW6xyFw6OqpOczfk64FLGGc4JDKtC2HRuVYS/CMi+mC/zccIuN4gC6H7KIHWVZesu7n0iBPKAo3szcVnYHpbwc3nuva2AuGgOg7x7/ali/jq77KvZSNTlCn5J6/WQ1MndNGsJFR+W102jOidWv1QVeDb8ziFRc2vsej33btncnG0riJ6Dd0s/AR0ta4EqW9cWn/xW0/RWgM4rG7iSDismWLabPPLFWCTPKdbCmgmx/T89zHv/a6JFIICfxGYRhmFx7IchANhUzBtECRMUdgfc3KFkJiW4o52Ij/403AKi2TyTjKXWkFlcOavABv5f1bIwOnQoJoDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHYW5dckjaxx63GQZo/EYQRtQDpMbTMYSUuSYIXt6xs=;
 b=X62aPmEn0retykD/YEQaTiJCcpbyDtCsctCY4DLKpUK3ihmG6pA42z8ipsWN9zTC78JWwTmvTSJNY0t9DlhQ2/wgRKTzmvbokzl54X9o3vMLcsSvJXIz1AzRihgGtYr5qSuCQgBuZBWvrh9pj3unXiYDuoa52QfnVsElVSnm+6sAVi5slvfbcdmFAAjcEPy9h4wM8ghbVj4LY5Wupur82+a00iYyDCG7b/Jn8HQtcbzB+ArEpABcXcR5+ccN3/B14XoSYkGigN0uZUPZy6LtUvlnJyON5gmQhPVtnZvyYmSXGsjmq3kjDMbI8z1N0RQWChzjzk133picA8SMgkpQhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHYW5dckjaxx63GQZo/EYQRtQDpMbTMYSUuSYIXt6xs=;
 b=fhsVcj9pGzrTfuB0nPLOVfFgBzwxR+8Eesr5wbyL7PYxORS0wITsGYl5ox3IoOuyRw7cQfcDNVKpBL4pNR7kH9QIsv16hSJaGSPLch8de4zFLfVtlnmr20nC8qIR7LNS7Xp51znZxTX99xBeVQL7HOKW8dMS8LMD46Aa9j7UeOW+H2Wbn7pzew6fcQBi6XUE7ZzkWHbCW9qMezGLlxrgtFUDDz3NmXiXv5yNkuoE+u5ixJURxD0MILVcNSiogpbX4hWAVbed4EzrJ0ErLzOZPmlDsg7sGLmZKbJvTU9sdykzV/BgvlRv849Im0UKp1ANHpUl6Hp3yoNr1lR8Bnqj3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15)
 by CYXPR12MB9388.namprd12.prod.outlook.com (2603:10b6:930:e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 23:42:47 +0000
Received: from IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31]) by IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31%5]) with mapi id 15.20.8989.018; Wed, 27 Aug 2025
 23:42:47 +0000
Date: Thu, 28 Aug 2025 09:42:43 +1000
From: Alistair Popple <apopple@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 05/10] gpu: nova-core: gsp: Add GSP command queue handling
Message-ID: <66sugjsmvv5wiyvw3t7zlu2n736q4crwgvukzgbg2gjm7pvg2i@vu7c5zy2c44h>
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-6-apopple@nvidia.com>
 <b95522a8-3d92-47dd-a130-b0a85ea841e9@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b95522a8-3d92-47dd-a130-b0a85ea841e9@nvidia.com>
X-ClientProxiedBy: SY5P282CA0100.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:204::14) To IA1PR12MB7709.namprd12.prod.outlook.com
 (2603:10b6:208:423::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB7709:EE_|CYXPR12MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: 96dfcb7d-5d93-4e44-3df3-08dde5c36d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rjk4AneuO/Z584a1+5bC0VeWOn4VhoTLJG6Gd1eUfDLUFm+wFQpF7v3BWrRx?=
 =?us-ascii?Q?vfO04ewiWZG2mQuR6G++vZbzyArlK4pZiNFV+W5+JciEcRRkxQmV/l93G2Hn?=
 =?us-ascii?Q?CpcOXBtaeO/QAzWTk3Xh4NmBJghLzQ0EM/DdmG7X4I/Cujf/au4jtTJaYVc5?=
 =?us-ascii?Q?hf3DcpuWH6Ho/PS56WjnRGYWloI6DINVGCTzjPIkBVmJyCJ/fQrSyqu//C+S?=
 =?us-ascii?Q?EzrD0FeKJZxn0N5GBWGbCA/JejNttDSLgMDWxSo/kaLwPHFOoiHKeZnrfsMJ?=
 =?us-ascii?Q?A8zzYpJeJkhDb0sNgqn29GakiJvWeaSc7UzlntfHDE6jiDyQBeM/3PH/EG4k?=
 =?us-ascii?Q?4KcXOnSg7P8/GoIptDtWD1mVm7+UUiec/99AYanauSTpvTPUj26QJoc8cHA9?=
 =?us-ascii?Q?oDqOjTOg5WSkpXi6zQ6fNJlB2wNK4douv6C9aojBC2JY+a9ah/WdrfamtePH?=
 =?us-ascii?Q?nzhGqCWHrUmDVYIZae96/xgqK7fKpKzjFkhSWOvhl4DKgLEwIXeoj3D4HiHr?=
 =?us-ascii?Q?bwAdYZ7R/0la4Dyfj9p30hGbOW6g9EIx7SH1uMVwwtfhrO1gOWU/M7AEBsRu?=
 =?us-ascii?Q?Zqb4Xvo/36x9P458KP8MUZNRRj3V5Z4BUUhLxoYc7BnK5O325X9FzDPi61C5?=
 =?us-ascii?Q?EG1amq06/w/LApOvE88dmaT58+0Ojz9x9Z2X1c6lS2O21NbjBX+KXApNXEOg?=
 =?us-ascii?Q?df7eAhXqR2wjQOwIakbADBj1VvC4JjTy+6qOtbN0cpVDutEvRzeb89zzU/Kt?=
 =?us-ascii?Q?FOAZAguTLxeus+egg5+mybKfqSoqU8/V0+ZBfRuOC2nA5vVqEpOGvp7aJJ1j?=
 =?us-ascii?Q?p/brd72p9e2MPNsgsHgKvNzHXeu8fsUt521xY/QLCXTilIxVjw2z7qxNPu/w?=
 =?us-ascii?Q?HoA2uPGZADynHSrUR+WdNymV8EY3D8oMkYTndZ6/UuPXkJIWZcvjUK+IqGn/?=
 =?us-ascii?Q?SVPY4ML2AS6i0xgy5lV5QqNb96j0H/BGvsy9Y6DqrVgFEXAJ0BhtFXuepg3H?=
 =?us-ascii?Q?HBgFIcSreFzW9b7eP9x4d0O6jMz1ylkWmUUD9tGv8CKy3a76YfkKrOYDyxr1?=
 =?us-ascii?Q?kSLJh9E1cwL5ouF6Img7gFbcK2Hdm7AcxD3pMM5gN9Wen1a1/nbsRbgGQ0cI?=
 =?us-ascii?Q?GbTPZm0lrDlm6r78+3psrgpBIV5x7E+7mCOgDCBQXLHWPT+/aO0DV+bCsUjT?=
 =?us-ascii?Q?TNlMs4QgqiBH5ZIK4JRykP++XN4WdNOo6Zp8VZiiW3uc0Y1VAK4r0gzncYDR?=
 =?us-ascii?Q?Dhryt1qnzeg3dkpIw3t7POIWT5b6FF5cVn126XqmPEhhHdAjdfRsavoKzTzE?=
 =?us-ascii?Q?m1xJSDEy5fTNi0HtX5C1cclqQ8wFg/5o/QHnMIvT7w2g9cBfWnm4G2QqfW5m?=
 =?us-ascii?Q?jws6V05UxtyBP+4nY+/JUIGcj1ETyHRnqTHtD6uUe4ciZ11L+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB7709.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?++Q3hn4pfr+Cp1ZemA1WkKVoFulYab2SUnmstEnacclNc+gkJN2X6cFmji2f?=
 =?us-ascii?Q?frtgqKz51dYLu1TZQkXVwj5Do1LfammzBaTWDbkE66GAEralSOa8nsawZ6Mh?=
 =?us-ascii?Q?7zCTjBMK9JIi7fAC5kneGDleUgMJ4WcvjiGvDPG6Yu9Pt0JAVYfqB5KdXNZP?=
 =?us-ascii?Q?5L02h9zMlYSDmgmIU9ylOiOa/kkFgFnJbOLO5VAjYbXo+YbAby/qG9y6fiGj?=
 =?us-ascii?Q?qqbZU8Zyirv6NDTd4QGAh0vrbaMAsu8z+uhtoJzrsLa6jI5w92ErdMvwrWu6?=
 =?us-ascii?Q?CJjziKQOQPZFFdavfbsZU++DIn0iUGF/Oyf2ysLUygBYit+WgyrbYa+Y9U+b?=
 =?us-ascii?Q?R7GdNmyiM7An1WcauivJqb5HCBMCcRnd0vwo9Epuw3//eIyGx7tOUM/l295h?=
 =?us-ascii?Q?LmHNXjlMouJMn3BnyjABsXNoG0uD5fdkavGTLSuGpS9C8KDhsWh7Gmdvu3Ky?=
 =?us-ascii?Q?AEof5gPBHzwG7WE1U6YhhpN1GIO4t2FVg+Zgv046mUEWLKS6X0lCoq+TzLVU?=
 =?us-ascii?Q?g5EdbJQhMsMgeJmYMDDZ5+8U1/AmGF55IdxLfFKMiHdikNR2eOyKlSApdH5+?=
 =?us-ascii?Q?58Sy7JAV/DmALr79UxlxvrqYmpEvzIYVevAeQQCygo63O7e0ZXubz6xU5WpP?=
 =?us-ascii?Q?y144gHkDliYr7pBQZr/fvydWJjpWZQXl/Mia3vFn3qtPsBgSBlsM4JVAQx2g?=
 =?us-ascii?Q?2UUpRuRMauCSixFVuJgQV8Dchut8zyyCLK7PKI6LY1KuFLPAQt7sN0DqRp/b?=
 =?us-ascii?Q?+dU5jho4J5wZmjCazEwpawxddK1eu+w8Yi+jRB/rs7Sam6XYWcepbsTTLYYy?=
 =?us-ascii?Q?0Z+uyRWVp4KJ3WXldR1H2UsbGoYaqGCOHtbsABhStSBOAJQtAWkPJZpfmTGy?=
 =?us-ascii?Q?9X/DUH9WJRQF6LWvDkVntOrx9mQx1DlX0BvdD34QKikvKF3EnTzuRksio/99?=
 =?us-ascii?Q?Bx+H5y3FXMmnAMElcGXgZ0g2g/Ow+Ca4TDugFrNvvDHuK5cdLl1j7WagMy1W?=
 =?us-ascii?Q?z7Ryfz1mR+EqwDIjmXtmx2k14LEl/kfma7DbtHwNUfasIY8NBRGLJ1+iUsK9?=
 =?us-ascii?Q?DB3vpGVT5c/n50MoyapmLU4sY1NxwOjGgA4somfeQ+RPAfW2riRrp1OdMg5i?=
 =?us-ascii?Q?H6fBClZUN1QS/m/rurzidX/yihiZ9I2TwFhyO0MfxH1d1xTk7Dklkz0mfRsY?=
 =?us-ascii?Q?R1yEbbxgPJjZXX3YO8brOiSosldsZ4Ji3DVsHce8QteL/At7TjnbNlIZ22Y5?=
 =?us-ascii?Q?H/bgDRjgzw/yDuGCNwGGiO5l8WmbsqU0vQZ8ZW1huvsO7Oq9bF/1B2KFWbXA?=
 =?us-ascii?Q?JHJ516ag8xA+RYuiPhuIyFFbESZv+jezAuMHgkqG0CNrhxpxFhk+eO+Eu4kK?=
 =?us-ascii?Q?Sl94qwny9EeXlZpcXowXCtXhO1KY9E28EMSsUxt/R1OpEWJyHomqM1h00Tre?=
 =?us-ascii?Q?BI9BPH4pFl0DxPNttMywK98Mb5lDPOak610IO7lNIvmcFfplUujdHTkOJZqF?=
 =?us-ascii?Q?p3wDTiOVwzGoyTgkC2GHnISb2qFgqc1Ak2+bIGCXZuThWdm8D9YYDpNf+hO/?=
 =?us-ascii?Q?Vzqrh+ngm37+YlfJuhCfF4V8VFu/Ye0DlYn0xtN/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96dfcb7d-5d93-4e44-3df3-08dde5c36d82
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7709.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 23:42:47.7366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/bNpBBlXupwByEbP3beHTeJRSYHKV9NrwgUtGiLW/iBTqKg5OkmDigED0Awir5tVK3hnBezTW/AcWgghfnVYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9388
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

On 2025-08-28 at 06:35 +1000, John Hubbard <jhubbard@nvidia.com> wrote...
> On 8/27/25 1:20 AM, Alistair Popple wrote:
> ...
> 
> Hi Alistair,
> 
> Not a real review yet, but one thing I noticed on a quick first pass:
> 
> > +    pub(crate) fn send_cmd_to_gsp(cmd: GspQueueCommand<'_>, bar: &Bar0) -> Result {
> > +        // Find the start of the message. We could also re-read the HW pointer.
> > +        // SAFETY: The command was previously allocated and initialised on the
> > +        // queue and is therefore not-NULL and aligned.
> > +        let slice_1: &[u8] = unsafe {
> > +            core::slice::from_raw_parts(
> > +                ptr::from_ref(cmd.msg_header).cast::<u8>(),
> > +                size_of::<GspMsgHeader>() + size_of::<GspRpcHeader>() + cmd.slice_1.len(),
> > +            )
> > +        };
> > +
> > +        dev_info!(
> > +            &cmd.cmdq.dev,
> > +            "GSP RPC: send: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
> > +            cmd.cmdq.seq - 1,
> > +            cmd.rpc_header.function,
> > +            decode_gsp_function(cmd.rpc_header.function),
> > +            cmd.rpc_header.length,
> > +        );
> 
> Let's please make this (and the corresponding receive) a dev_dbg!().
> Otherwise the driver is too chatty at INFO log levels.
> 
> I suspect that I'm to blame here, because I recall pretty-ing up the
> output of these, and I probably set dev_info!() at the same time. doh!

You probably took "inspiration" from my original pr_info though! So all good,
I'm sure there will be a v2 so will clean these up then.

> ...
> > +        // Log RPC receive with message type decoding
> > +        dev_info!(
> > +            self.dev,
> > +            "GSP RPC: receive: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
> > +            rpc_header.sequence,
> > +            rpc_header.function,
> > +            decode_gsp_function(rpc_header.function),
> > +            rpc_header.length,
> > +        );
> 
> Here also: please use dev_dbg!() for this one.
> 
> 
> thanks,
> -- 
> John Hubbard
> 
