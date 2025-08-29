Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CB1B3C1CC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5F510EC0D;
	Fri, 29 Aug 2025 17:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="idVua+a6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B0710E1CD;
 Fri, 29 Aug 2025 17:33:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VM5hVfj2SCx5ihGCb4zunfGuhtSZqJrLg4csOwsvou6PtF16uxmMoD+pkz8bAJyGo25nFi88/mBNmaSvSEvVW4xMtALzteuDD7sl7a7Lf3zvEuxZGxWW9jnuTZIUJ9UMzayOw6dv5+3IYsixkTI7zCDar/3O+XfqJEyurAg+mD0Te3XAvnF06QEYaX5+6UBK7WpoR6+H51B8QpWzUnqivqggRn6IGOePebKHq7BZJmt3kmW0w5Xpgj3bZlRljrbTafevkb/+erps/wFxOOjFyR7m3rM7IqkYiN9BdGArxfA0QxmFIupI0/hJWloMp/UW5xu1ti3r7W9wPT3x55op8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrggebE8OHYH2VjnkgDLCRp3WLNRkTkOoehOfiLUV9A=;
 b=Jrc7+udF4uPwwHy4ceyAjhyKsDdd7jL6hTMKVKWalrbjZWNCgk+h+n25FSFR3zy+4k4IOeoX7loFiIU91ebEANkS2dF1k3blEoG1jIU7/N1T7wW0hhMVsVamvL5qw0S+R5lCRiSOIyCro6MT94mGbl5qikFU4CaqLFOc1180i99F0hlF3gV9+MKBtGW1Wb678Iwb+VE98+f7AOMREhzTAk46OC/UVQmtqImo3MC4kHusZbu7Kokdi1wHp6jsYEW2Wmr3kjo+K1vvQEGKQvq7+5ua76HDM+zpKa253jEKnLPYxVCImbEnHlyxDk+qpLS52AnKtkip33cxmYthd8HRtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrggebE8OHYH2VjnkgDLCRp3WLNRkTkOoehOfiLUV9A=;
 b=idVua+a6ReI+u7udk32IEBAsl5PP5xSzjbHIVDJlFY1+E5rJfo3wTF+i8xFe7aW/Co8C9HsDiAmiVEbRbhorCmdDOEBfdXivUFbgC3cnw8RZybATlkokZc0av07DByk8Rva4fmqT+iNj5442lqMvUUxSxuXTMghCde595Aw4fS5JBV0jc14AZpouRllss2w79VMysuaoGHKTohQ1CK9NWbkO5MzEbP4EEgUd52wLUtSn4t2v+0mB/5C6BFA8AAKUT9OjY3wKX895XIL+u623GncuoUTfkz+57lN6QhMq30OMRNkQQbutunikz75po1fZ55JPdsl7bvxHO5D/vwlE+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 17:33:34 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:34 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: [PATCH 14/17] nova-core: remove an unnecessary register read: HWCFG1
Date: Fri, 29 Aug 2025 13:32:51 -0400
Message-Id: <20250829173254.2068763-15-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:408:ff::22) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f47b6a7-7973-4872-64e2-08dde7222df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ll6l347/hGSJ+JhkJzQuezgsbdT+8Rp3b0meTbuL0Xh9ukk4ThzkIvTg7ke0?=
 =?us-ascii?Q?aV0uuvp/kTEFxzczCuuhUeqm/vdccmL33wAet4sqYGktu0jdN/9RMLKjCWXO?=
 =?us-ascii?Q?4ON4A16FaxXdgbgexBUx0KJPg/A9nvHJiCMD7uy8A5wUic48GwWuJbI0eJuT?=
 =?us-ascii?Q?2+yGSAmJ4A3mGWtp7xELwTBuBypWubHJ7VAc0VG1ri3a4aIw3ttXgQaoXCNV?=
 =?us-ascii?Q?7FdtU3yCAcNdTrq6r9JudrnuTd1EhMVyndeq1y9EXO25t1rhTO9IuUK7D9Wm?=
 =?us-ascii?Q?qq/Jbv6LJ43wD1C+MRYSY8bvZFWs32hNjjAUNbVTBQffYIDDtisHH9E88iv6?=
 =?us-ascii?Q?rKGqz3Ufk58UQCxePADNqLlypTCb0Yb838Gn4aRjkuvjQreLYBlkDRiVkQZc?=
 =?us-ascii?Q?c7UhM6FIY+nxrN8bpSnw9tHnDkPM9sFgooova7bVvkts96EEoJKtpic7+2np?=
 =?us-ascii?Q?jiqpBCcZQ33C4TsJ/g+eyn3JzcpgvvFMI+WaBwiel4incvnobyN5mLUSbtXW?=
 =?us-ascii?Q?Q/iBEZKP8EZMFF135nGJXjh4JxuBIbTFpDTKTnQYEcD1opfyiAOV3u5I9Zm7?=
 =?us-ascii?Q?l1FxfhQSVYpG+CVhZ7B1fSgg/5GOT50nEPh78/RxP6cbT+/fXuekYwlBVG/e?=
 =?us-ascii?Q?XjlkXQC7BUqjrDQMj89D8skMVzgoTLC1E2bxEbBiGz0VJnjPFGd4n8ENPLxU?=
 =?us-ascii?Q?bCB+hZTkazF0jrnm1c08szm26Zb9XoszILxWeoOWsIrXyk6a5oOXadzv7Giw?=
 =?us-ascii?Q?EBmf0PmlFrvtLXrBWIxc8LW5RwPMolSEULFKD2OtK5OnFcdhy20fy1UHxy3o?=
 =?us-ascii?Q?535SI84fsT0tc/a5OMnqbWduZiy9c6pvUyjQTOh3/MwaYekbPijLE8wjPLc4?=
 =?us-ascii?Q?sjSAiK5em7GBuQen4UPpioSUvz65r5GuL9iXWCstd0GuiW18vVlP8kDT7mv3?=
 =?us-ascii?Q?3uI1KsTeBuf+4mgPHYA2EOwTB3XkhRoluuU5Te5htd2Bdp6z2qQqQ0tolNWA?=
 =?us-ascii?Q?981FOX1PYCHaaG/blLgImgSGVmLyMdKQRFYKZUrML+QHC7c1WeIhHcKd5NcB?=
 =?us-ascii?Q?+ERNLcLYnhh/G9RqXx+Fu4lhDS4hLTz4AV7wLyYcA8pyFrPYBDy0mGxGtgWq?=
 =?us-ascii?Q?ceeUdDyf1a3P46Jq9nRYaGjDE5yRImHSu0DTnsxBHGUr9d30MxUEdthB5mM2?=
 =?us-ascii?Q?2U013ilvv7hMRRn/0NIA+w3rHKqD1acSZjO44cUdtqJfhH9FOFc/rKV9S9wm?=
 =?us-ascii?Q?voaHtZzegMQdC5m7Goej4Ipwt8SlDwu0PULbvid2dBnzb3jTgR8ThyAcb55d?=
 =?us-ascii?Q?eKYgZQIp8oNf8me/P9xjzFqXNwpAn40GPf7HvvX24hPjy0A+7SiXANept/xP?=
 =?us-ascii?Q?r2A9iHfgeP9JtBm2crhO+m8HxSZgkrMCR0nEmR4qIxmnwr6Vdg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VuWeLv2mWr1pjjvKpHCZ4CbxZ7ogFOIyFXw/C62+aQSW01zjP/KXmQCxi28d?=
 =?us-ascii?Q?VXt4ZFcYjEKoVEC4GxeP2A9nB/QBj4BrxFLrriVpS0v+XawDZ8FsxACmxpzI?=
 =?us-ascii?Q?WQKndaE9n4GXphPOwsuzyzpATKhF6qmwoQqriD0UmkFs7NMp0hPSMBq/+aGl?=
 =?us-ascii?Q?C4qFUcFk17u2zFM/IAwj4DJOaiz7IKpIE3IHcFYEYogiAZYVL9BgmIUds2fI?=
 =?us-ascii?Q?PT5A6n7W6thvWkVmYsCOWJaByEHnvISprTuo9T8O9nADjGZwFUCKZNxH9Pis?=
 =?us-ascii?Q?cDZvo3P9CHAxMYWJ0Jx4FUolpVH0OuLk2EvjMqWt2+QDM4BER5Cra0KI1Jeo?=
 =?us-ascii?Q?o3844r8qRxp8I29JStWdfnpVuxEeDKmzv0UIZJE133zTfIaWj1rnW366MV8Y?=
 =?us-ascii?Q?JKyLCfmofc6WizZ/lLQdAVtWfD8XlXPUQq/9plJcyVKhBQqYbXNM5xBPJE+O?=
 =?us-ascii?Q?Ena9F2ns0v8zRXX+rvGXmkrmKKV5BSsWIENbkvApeDkV/kbegaIjj4B5O4nW?=
 =?us-ascii?Q?UT4aWQ9O2m9sutSCXgvuyBJhk4RaXHDx1j6aiadh99Bh0xtFSV80OkndHc9k?=
 =?us-ascii?Q?KrWhWTdgEcOXzDHmlye0svov/AjaZeGloDWWn76a0yDD+bs1Ezvq7+g978lO?=
 =?us-ascii?Q?K6aXg8mLVrNPtmgnKS8Scgtryi+XkyxLk9uEfQGyucttWorhbQE/+I0ascBb?=
 =?us-ascii?Q?3d79Tv+zAXnL7w3Xnlnz+5rdWUCZkXgQzmgu/m0+GpLvBDOdDAJC3jjVFKlo?=
 =?us-ascii?Q?voErlkaYfsFPp8rq4ANxXVyJ2aGAMr5M4DbDs8IKSnakJocYAlsn/ExMQ6Xx?=
 =?us-ascii?Q?wgMVW4GCgqpmirna9Waz5YGE/MMrKX9ZIWTZz6YGACe+yW4USM8fokPCy7Xe?=
 =?us-ascii?Q?xNKbqXz2+/OdaC3314z2SY9jmi0tyKAINa7xDgzGNgSiTinCeBemd5RIUlsR?=
 =?us-ascii?Q?AE5feZ5hhd3kdocaRBp0IHZ95LIiLoCRXJmRUxTxsgATcRWWLo6vgq2ifyxJ?=
 =?us-ascii?Q?Tl05PVXTG2IDBhDgKZKtk/Nxm6UKp7+6UiQUHZB+zqqESU16HRKe3F1AbViB?=
 =?us-ascii?Q?RS6BwbxhkvLGiM82W/LRcv++rEJkkGEQwKlP3CPz6AiXAusIu71SMTcRDdJW?=
 =?us-ascii?Q?5HSEC8M+njUv6YPS3XKR6OCxRMS5nb59XytMuxpRWvu+qVg4j0fvdPC2WdaS?=
 =?us-ascii?Q?lb6CxbXiOwl6uEe8rx7pOuectYYP6SvK9Ez/k1Dm3li6yUw7M78m1lLYwD7B?=
 =?us-ascii?Q?t/cUzSZ+9R+ql88idiM46G92dNhlha4XtkAMxN04KmsjNQSR8ror35LH2eMe?=
 =?us-ascii?Q?v+raRfIMwlWLGwZTE2N/LJrJw9fAkF6I7FU0KCmNubhU8ebxxVmYwd+UCsEr?=
 =?us-ascii?Q?TWAjHpFduOvkh4GbQaYYwIpsjHdkcujxVOuIXfvKKaIUrngvEmGpJRgenLCD?=
 =?us-ascii?Q?DPS6jpwitizmz7+zy8yZ7iI0QnTNxEF325Ps8q2M6wQqLkoOyxaHbJ+ssQS0?=
 =?us-ascii?Q?WLomuVuZSHqhdAs1hjDPrbiklVC3EMW3iqJB4v/UcjwRZPUN9vW6yuo7RWp+?=
 =?us-ascii?Q?HP1pX1qhP2fYiCjR25/ChzTLNDzwQ7FvXTnhmddE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f47b6a7-7973-4872-64e2-08dde7222df3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:34.3422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvsEzMmIjNe90yBrdpPHCbKkIhD5YoXCBvwlqaJ1p8UHEO1Xa0ijJndEDymagdw0nM2jYLIGme6OQXAbvLMJnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4069
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

From: John Hubbard <jhubbard@nvidia.com>

This register read is not required in order to bring up any of the GPUs,
and it is read too early on Hopper/Blackwell+ GPUs anyway. So just stop
doing this.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 05bde1f161ea..023f9b575a5d 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -355,11 +355,6 @@ pub(crate) fn new(
         bar: &Bar0,
         need_riscv: bool,
     ) -> Result<Self> {
-        let hwcfg1 = regs::NV_PFALCON_FALCON_HWCFG1::read(bar, &E::ID);
-        // Check that the revision and security model contain valid values.
-        let _ = hwcfg1.core_rev()?;
-        let _ = hwcfg1.security_model()?;
-
         if need_riscv {
             let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
             if !hwcfg2.riscv() {
-- 
2.34.1

