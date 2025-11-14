Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1617DC5F229
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E6210EB0A;
	Fri, 14 Nov 2025 19:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ncn9hBZ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010002.outbound.protection.outlook.com
 [40.93.198.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC32F10EAF7;
 Fri, 14 Nov 2025 19:56:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vhs2WtkabczrMB1ThksfR+Qvq1BSq+0Q4XhmglQggpNElhlS/S8J83u/KbFVLxFknpLWPntF01a7L6yFxyLltYPeFI8g9Mj9dW9oRunYscL0x9+1YixLCEmCc/E0KPIpGtVAmUgCsu79FwjqhG5iyl14Xhmj5uyt8MAQMYfaoVNi0lhc11sxH/RvqXv6c6P31gH3EGFlyiDeuhZgJf72r7cI711pMQo6umbmnt6TLc/AoKkRdc9Za8xPOucg1oFwe7a5mqYl4iIElFrdZ7DpYdH8/cCxhOz42Mx/W4THrPM1JuUyienlMTVT6Qo0kxP8qhA7FffrgxgqlpamT21fdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Q8wFLRWV+0B1anFQe1l0RBuHskl5cQSAM6Yus8ELAE=;
 b=MS6l71L3B7wNEQPS4cvbhlo9LmzUJXOZskrTLaqpORypjgd/s27bf9o3GZnoxNHIxbWudVQdq5M2fYdOXKCctBDcs5TS0o28DwZmX7EHOHEB38g2Qdl+H5D3w1npPkVdDZrmsR/jULm8+DYqn2HK2MnYGE7ExojYvfE8ewk7ef95zp13g0kYSkRfllYaXGmB2w2nhQg5xg2ZxPvHcL2GKH/XW6I2mg9+dMVrk7OWRD1Rqdo3yAN86BZftMEb4fttnmjZpGrcyBfLtJ3rIPqfGv//MvF5j1vAG2yNwMkwXl/ddSVeXqGC4ty+8p1bBqzI06mQDi8W/cdQXqSm5kTxfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Q8wFLRWV+0B1anFQe1l0RBuHskl5cQSAM6Yus8ELAE=;
 b=ncn9hBZ+GrEVX0B/ldhdRY9lxrQvvVIABjLUE80Nxf4A56jFjUxwiiJTdMhljhfUQs/wG0zf/dOS/mo+Dpp+sepzQ3NzS59nXFO5pLBKZXJCu6V2M0Nmf3EJeYgwv2mR8kkTs93e6er+WSY+P1WfRTlwUyxR3qmnGexx+FhvDgvPp5+G1P56QQy3Q4zUO99CkQJhD0bou4NBfTAXId2qZaEllhhc/G8gwMaLmk1fB7dJRunnHkxUAljRlYvfnzyZl50ShjkRnd36rzn3F03ymPXbMdVXt7zy/XT8zyPaCNIryOawegvedoHKKuA+XBq/rJX2kYEMOWQvUFrrJ+ncYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 19:56:08 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:56:08 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v5 07/13] gpu: nova-core: Implement the GSP sequencer
Date: Fri, 14 Nov 2025 14:55:46 -0500
Message-Id: <20251114195552.739371-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114195552.739371-1-joelagnelf@nvidia.com>
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:208:d4::30) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f4e9f7-6200-424d-1a49-08de23b7da65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2yeVtE5WxlO9X+JoQuS1rqfpgeW5jiOZmHMIl97/Ijnl0txTv6eeDDZXQt7L?=
 =?us-ascii?Q?3WuHYOJVOWP7v9Ll12BULCidfHk1C1bYQvnRXTBy6wIoV/BAjgTPE/S+w4tk?=
 =?us-ascii?Q?1fL2mT++twhkc3J9lWLtqGOiMmc+3ffyndEkkqfoknFyhRcSUhdHLOBggnbR?=
 =?us-ascii?Q?ib+KX6QhTZap00Zz57NSLRWapT9dknhnYayjjHmY26Hh3Ih81Ugch/1avxZ4?=
 =?us-ascii?Q?XecKD3N772wi60owysjJ0OFkji3D+cWjD5xus+dB7Uma/2kiIpvWW6Oik4e0?=
 =?us-ascii?Q?pq08jcpR4j0Vaiyipf5V3ohrn9SzibXONRANFnCYBvJLO11wyIqhQdoMk6xl?=
 =?us-ascii?Q?DY//cFXI+SYhvE1CuwBwO457AZUwZbquxRUc2KKX/ho7PTI5k0+TbUV2xseF?=
 =?us-ascii?Q?2UaQbiqOwDKqpu5Gd9K2K3Po1rMoy0nNBuEoZwbieesBVVHcl9IdfwiH2CII?=
 =?us-ascii?Q?QCzPVXY8zPUQpgOXEf2QT8cGPcaGKrvW8OV095JFUtRgV1mZi1vioACTHiWC?=
 =?us-ascii?Q?PaGRRX/KBvT0YVBnwJ1VBQpH98RtrbPaB7Vs9ka/oxWWcgcScFFI26uCgtKi?=
 =?us-ascii?Q?9mmDGE+Uu5l82fi2XKOwWlSM3XyJEPBJx25q5ZuwkwQU9mJkL9ouPW0L/OkE?=
 =?us-ascii?Q?MP57fk1AIAmaW4JVox6e3q2raFjOSZDG880qOQJfxMYYIiOMr1yqi81fq3UI?=
 =?us-ascii?Q?BUggKetUTq8KR9R04w0lMFkKyqrFsceqlRHea56SFetOT49lvilTZ44i1a+i?=
 =?us-ascii?Q?F9Nk83i+8HBc+lVbZE28mlvjYJonrkQUn92XczHnuIMUpcPpS/ZeVH/rO1o1?=
 =?us-ascii?Q?d/AvqbG7dFXg1f3NQuVIH0cna1hHLMPaHAl2axpH7tviP/migqKXiJRbY9cS?=
 =?us-ascii?Q?DB+v2yuPzYLT6yCkt4lR7/jJt6smn72TDG/QvQ3tBLvB2Nfw7LDR05BBVKxu?=
 =?us-ascii?Q?padGYIvHqwBvPTaU5lmgHGPm2HtTgHHRZbYo020FwU2xeOj6QdEDHVZtTn9e?=
 =?us-ascii?Q?RtZsUAdGtRy4fSdJYcb80mp/m8XKxIRAYDnj2frz21pBn6jyHPAGsZ5OYlhO?=
 =?us-ascii?Q?gbDjbn/mztMy/+KO3Otnb2BFN1oRVmGkkUJwypisgBrKuRgG5KbDwjezs/q2?=
 =?us-ascii?Q?HfUcghZfMaVsfRXmHXyZrs5hKnCXpLA6axjS8PomqJ/Sul22SAEahEGBKfsB?=
 =?us-ascii?Q?uA9z9rAsqMqcpJpY4gpX5b7woEfFVdhgE/pgsFpNBElczvx04WPuxVLLEod5?=
 =?us-ascii?Q?wiEhXNcH2G3pMlNf/cTFeGXuCd7quO91Y2q/qYJrGADGESmMqGfKowmUoDS0?=
 =?us-ascii?Q?2rMT0uhnpzTGfaHoiiKr/1PksoERR3QHelVvIObHmx7rq+gz1nobVer/NnCJ?=
 =?us-ascii?Q?zJb1t4BBAO334apj6N0CtWfXKfVFHuQ7804CzBiWSxRlKUyDnZxEjSpsmebA?=
 =?us-ascii?Q?LVXRbfsgKFjOo+P5b/vYXENsqHtCC2nj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aS2WgUSh00kXfNw6O89awpXfY6MPljAnZotVnZeOumlCX6R7VDDtE0KoQ8Vb?=
 =?us-ascii?Q?RNWiZchnXQFANmyFAhlpXMrTtKJcd8UfVMaBHM2AQ72B+pU7FMaKhuHQmmVF?=
 =?us-ascii?Q?70PBvAIEjRlPvLIEXNEvL1AKMvWxl3Ld58iCCiS/Qgq+C1TT8PYcACEBUfGg?=
 =?us-ascii?Q?TGdCn4JIUeSkH/gHxS/aFheYMpWMcoY+qZZfyZkUHvXS45TK6rp69aVFjzR6?=
 =?us-ascii?Q?Rh1g/LMTI20pj9yByTL5Oj74y2IiKcfqq5+6QZaYKqeVL8Tfh3C6rlBncqXb?=
 =?us-ascii?Q?8DTnZexWDEcJy23rmGhyeqgLJ8aQ17WvzvGSQvFP5J8Wr6+zEaLcOQq1yq/2?=
 =?us-ascii?Q?NpnNJ4hwJyog7VdeEoq1HzCcRIZDIupugarwUlMMEIrwCtD8C1jGkaaeN1zD?=
 =?us-ascii?Q?5WYst/OpWCar4bW9YpteZyMUcAJJ2G2Ajuaw1xeulGeo5HCgWnN84Lsb5DYU?=
 =?us-ascii?Q?unz76BoSw2MAhR/7wsbrK+wQNi6U8FYbCCLOGI1t7H6k8/hzxudISVkUeATz?=
 =?us-ascii?Q?LFvdqlXZ1ydzEm/zPO9hkGXimPM6Yr9xOLtM9h/RmXItR4AzqG2hMj1u4NaJ?=
 =?us-ascii?Q?LDrbKa12YXzYwebYmOpDQjTbUwW0C+PJB2pegr6tDzlFOnG4hxlUNJB/71bV?=
 =?us-ascii?Q?DgdLwRqAljfz05+02+I1xDB11B7p7W3+jHVKoM6J5XWs5q3dGTgaebv7K0Km?=
 =?us-ascii?Q?zxWqlX3UhiKNYdF3EvMzTatRZclGMbsDT2kjhXzaPBKbUlH++Av3xHBfqq9v?=
 =?us-ascii?Q?aTFiogewOQP9a3CX7jh9ZVWPlF+0aV4AV6Yt6jO1RMMD/KxR0yThMZhLcNtM?=
 =?us-ascii?Q?Zm+yORdJX7UiI9sLPS6X4rY/N37R2ZPNeYY/zwi1HeRi+oh/m7EevD/vyz9z?=
 =?us-ascii?Q?31LGpf72jhhHKASftm6ZD2BykbnXMAfQvmaPy4l4cFWWW4kacz0doxTlZBzl?=
 =?us-ascii?Q?sMUwCjWBZRPnoSME//sQZMO6WL5RMp2+Fvv2hZ38NA3daZE0mpgqzSpWJeoo?=
 =?us-ascii?Q?c52ZaTxOUcsfDuhp97+ZOTCpeBVmNXlEZmsKxweOS4RjwF4zqaKzhV4Aq9EI?=
 =?us-ascii?Q?nNX/JvlYI4J5xrFyGmOWiOUokaEpJIR/YguFKbUMpXhJNhx9D2CNU+LPfy5T?=
 =?us-ascii?Q?hRMU28s35ESSOBzD5xqhOx8EEmzkm3J2N6MMwIaig9VdQg0OPH0JZYK4O1eC?=
 =?us-ascii?Q?l2cQSuV1c/9uxTvAGBPA8+DVkDfEYaOG6e5WgP/VPdFGsi+4hDDal+VURMna?=
 =?us-ascii?Q?ug0dCQrznrrXiUxh6Sxvw5wdGhvRl3b0GJYh1VH+VRY9yuUi66SDd1oGv1d0?=
 =?us-ascii?Q?ivgCvvKDgfrwbAqPGEWFRB5bmsCgyYd7mtaqKPSu2ZEh0QKijmnw1VhqL3pX?=
 =?us-ascii?Q?pbca4KN4RZGD0Md7xNk8qv0pLYeKvYQ9lwktpTA+CQsWcuOLpmEPgzHeva+3?=
 =?us-ascii?Q?W46GXfaJUOfb8DL9dRDtEOGd7cL+E+B0lrnZsT7dzPPDXVsK/0VrcPDJR1nE?=
 =?us-ascii?Q?KESWQ8GADx3vpBRvZ+QfF31Imj/6QbrieDU2k3Yyw6VkY9nXSKT+90w/D7uY?=
 =?us-ascii?Q?UPbIsPdx6ASPFXCqCXwodhPFn8o6v7MYKBNXm3jA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f4e9f7-6200-424d-1a49-08de23b7da65
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:56:08.4341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FsNrBL3/3ib8H0ca6siX7T2W1bNLrIODuciT5IQ+tGXR1nDLVFM2CzGVtB+vOxWyIHmcoHU0JxAN7b15CZZJyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8340
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

Implement the GSP sequencer which culminates in INIT_DONE message being
received from the GSP indicating that the GSP has successfully booted.

This is just initial sequencer support, the actual commands will be
added in the next patches.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs           |   1 +
 drivers/gpu/nova-core/gsp/boot.rs      |  15 ++
 drivers/gpu/nova-core/gsp/cmdq.rs      |   1 -
 drivers/gpu/nova-core/gsp/fw.rs        |   1 -
 drivers/gpu/nova-core/gsp/sequencer.rs | 231 +++++++++++++++++++++++++
 drivers/gpu/nova-core/sbuffer.rs       |   1 -
 6 files changed, 247 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index e40354c47608..fb6f74797178 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -17,6 +17,7 @@
 pub(crate) mod cmdq;
 pub(crate) mod commands;
 mod fw;
+mod sequencer;
 
 pub(crate) use fw::{
     GspFwWprMeta,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index eb0ee4f66f0c..e9be10374c51 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -33,6 +33,10 @@
     gpu::Chipset,
     gsp::{
         commands,
+        sequencer::{
+            GspSequencer,
+            GspSequencerParams, //
+        },
         GspFwWprMeta, //
     },
     regs,
@@ -221,6 +225,17 @@ pub(crate) fn boot(
             gsp_falcon.is_riscv_active(bar),
         );
 
+        // Create and run the GSP sequencer.
+        let seq_params = GspSequencerParams {
+            bootloader_app_version: gsp_fw.bootloader.app_version,
+            libos_dma_handle: libos_handle,
+            gsp_falcon,
+            sec2_falcon,
+            dev: pdev.as_ref().into(),
+            bar,
+        };
+        GspSequencer::run(&mut self.cmdq, seq_params, Delta::from_secs(10))?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index c0f3218f2980..6f946d14868a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -645,7 +645,6 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
     ///   message queue.
     /// - `EINVAL` if the function of the message was unrecognized.
-    #[expect(unused)]
     pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 69c5996742f3..6d58042bc9e8 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -621,7 +621,6 @@ unsafe impl AsBytes for SequencerBufferCmd {}
 #[repr(transparent)]
 pub(crate) struct RunCpuSequencer(r570_144::rpc_run_cpu_sequencer_v17_00);
 
-#[expect(unused)]
 impl RunCpuSequencer {
     /// Returns the command index.
     pub(crate) fn cmd_index(&self) -> u32 {
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
new file mode 100644
index 000000000000..c5ef3a33466a
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GSP Sequencer implementation for Pre-hopper GSP boot sequence.
+
+use core::{
+    array,
+    mem::size_of, //
+};
+use kernel::device;
+use kernel::prelude::*;
+use kernel::time::Delta;
+use kernel::transmute::FromBytes;
+use kernel::types::ARef;
+
+use crate::driver::Bar0;
+use crate::falcon::{
+    gsp::Gsp,
+    sec2::Sec2,
+    Falcon, //
+};
+use crate::gsp::{
+    cmdq::{
+        Cmdq,
+        MessageFromGsp, //
+    },
+    fw,
+};
+use crate::sbuffer::SBufferIter;
+
+impl MessageFromGsp for GspSequencerInfo {
+    const FUNCTION: fw::MsgFunction = fw::MsgFunction::GspRunCpuSequencer;
+    type InitError = Error;
+    type Message = fw::RunCpuSequencer;
+
+    fn read(
+        msg: &Self::Message,
+        sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
+    ) -> Result<Self, Self::InitError> {
+        let cmd_data = sbuffer.flush_into_kvec(GFP_KERNEL)?;
+        Ok(GspSequencerInfo {
+            cmd_index: msg.cmd_index(),
+            cmd_data,
+        })
+    }
+}
+
+const CMD_SIZE: usize = size_of::<fw::SequencerBufferCmd>();
+
+/// GSP Sequencer information containing the command sequence and data.
+struct GspSequencerInfo {
+    /// Current command index for error reporting.
+    cmd_index: u32,
+    /// Command data buffer containing the sequence of commands.
+    cmd_data: KVec<u8>,
+}
+
+/// GSP Sequencer Command types with payload data.
+/// Commands have an opcode and an opcode-dependent struct.
+#[allow(dead_code)]
+pub(crate) enum GspSeqCmd {}
+
+impl GspSeqCmd {
+    /// Creates a new `GspSeqCmd` from raw data returning the command and its size in bytes.
+    pub(crate) fn new(data: &[u8], _dev: &device::Device) -> Result<(Self, usize)> {
+        let _fw_cmd = fw::SequencerBufferCmd::from_bytes(data).ok_or(EINVAL)?;
+        let _opcode_size = core::mem::size_of::<u32>();
+
+        // NOTE: At this commit, NO opcodes exist yet, so just return error.
+        // Later commits will add match arms here.
+        Err(EINVAL)
+    }
+}
+
+/// GSP Sequencer for executing firmware commands during boot.
+#[expect(dead_code)]
+pub(crate) struct GspSequencer<'a> {
+    /// Sequencer information with command data.
+    seq_info: GspSequencerInfo,
+    /// `Bar0` for register access.
+    bar: &'a Bar0,
+    /// SEC2 falcon for core operations.
+    sec2_falcon: &'a Falcon<Sec2>,
+    /// GSP falcon for core operations.
+    gsp_falcon: &'a Falcon<Gsp>,
+    /// LibOS DMA handle address.
+    libos_dma_handle: u64,
+    /// Bootloader application version.
+    bootloader_app_version: u32,
+    /// Device for logging.
+    dev: ARef<device::Device>,
+}
+
+/// Trait for running sequencer commands.
+pub(crate) trait GspSeqCmdRunner {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
+}
+
+impl GspSeqCmdRunner for GspSeqCmd {
+    fn run(&self, _seq: &GspSequencer<'_>) -> Result {
+        Ok(())
+    }
+}
+
+/// Iterator over GSP sequencer commands.
+pub(crate) struct GspSeqIter<'a> {
+    /// Command data buffer.
+    cmd_data: &'a [u8],
+    /// Current position in the buffer.
+    current_offset: usize,
+    /// Total number of commands to process.
+    total_cmds: u32,
+    /// Number of commands processed so far.
+    cmds_processed: u32,
+    /// Device for logging.
+    dev: ARef<device::Device>,
+}
+
+impl<'a> Iterator for GspSeqIter<'a> {
+    type Item = Result<GspSeqCmd>;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        // Stop if we've processed all commands or reached the end of data.
+        if self.cmds_processed >= self.total_cmds || self.current_offset >= self.cmd_data.len() {
+            return None;
+        }
+
+        // Check if we have enough data for opcode.
+        if self.current_offset + core::mem::size_of::<u32>() > self.cmd_data.len() {
+            return Some(Err(EIO));
+        }
+
+        let offset = self.current_offset;
+
+        // Handle command creation based on available data,
+        // zero-pad if necessary (since last command may not be full size).
+        let mut buffer = [0u8; CMD_SIZE];
+        let copy_len = if offset + CMD_SIZE <= self.cmd_data.len() {
+            CMD_SIZE
+        } else {
+            self.cmd_data.len() - offset
+        };
+        buffer[..copy_len].copy_from_slice(&self.cmd_data[offset..offset + copy_len]);
+        let cmd_result = GspSeqCmd::new(&buffer, &self.dev);
+
+        cmd_result.map_or_else(
+            |_err| {
+                dev_err!(self.dev, "Error parsing command at offset {}", offset);
+                None
+            },
+            |(cmd, size)| {
+                self.current_offset += size;
+                self.cmds_processed += 1;
+                Some(Ok(cmd))
+            },
+        )
+    }
+}
+
+impl<'a> GspSequencer<'a> {
+    fn iter(&self) -> GspSeqIter<'_> {
+        let cmd_data = &self.seq_info.cmd_data[..];
+
+        GspSeqIter {
+            cmd_data,
+            current_offset: 0,
+            total_cmds: self.seq_info.cmd_index,
+            cmds_processed: 0,
+            dev: self.dev.clone(),
+        }
+    }
+}
+
+/// Parameters for running the GSP sequencer.
+pub(crate) struct GspSequencerParams<'a> {
+    /// Bootloader application version.
+    pub(crate) bootloader_app_version: u32,
+    /// LibOS DMA handle address.
+    pub(crate) libos_dma_handle: u64,
+    /// GSP falcon for core operations.
+    pub(crate) gsp_falcon: &'a Falcon<Gsp>,
+    /// SEC2 falcon for core operations.
+    pub(crate) sec2_falcon: &'a Falcon<Sec2>,
+    /// Device for logging.
+    pub(crate) dev: ARef<device::Device>,
+    /// BAR0 for register access.
+    pub(crate) bar: &'a Bar0,
+}
+
+impl<'a> GspSequencer<'a> {
+    pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>, timeout: Delta) -> Result {
+        let seq_info = loop {
+            match cmdq.receive_msg::<GspSequencerInfo>(timeout) {
+                Ok(seq_info) => break seq_info,
+                Err(ERANGE) => continue,
+                Err(e) => return Err(e),
+            }
+        };
+
+        let sequencer = GspSequencer {
+            seq_info,
+            bar: params.bar,
+            sec2_falcon: params.sec2_falcon,
+            gsp_falcon: params.gsp_falcon,
+            libos_dma_handle: params.libos_dma_handle,
+            bootloader_app_version: params.bootloader_app_version,
+            dev: params.dev,
+        };
+
+        dev_dbg!(sequencer.dev, "Running CPU Sequencer commands");
+
+        for cmd_result in sequencer.iter() {
+            match cmd_result {
+                Ok(cmd) => cmd.run(&sequencer)?,
+                Err(e) => {
+                    dev_err!(
+                        sequencer.dev,
+                        "Error running command at index {}",
+                        sequencer.seq_info.cmd_index
+                    );
+                    return Err(e);
+                }
+            }
+        }
+
+        dev_dbg!(
+            sequencer.dev,
+            "CPU Sequencer commands completed successfully"
+        );
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index 7a5947b8be19..64758b7fae56 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -168,7 +168,6 @@ pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
     /// Read all the remaining data into a [`KVec`].
     ///
     /// `self` will be empty after this operation.
-    #[expect(unused)]
     pub(crate) fn flush_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
         let mut buf = KVec::<u8>::new();
 
-- 
2.34.1

