Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8463C5F21A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD15F10EB00;
	Fri, 14 Nov 2025 19:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q+Erlb+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010002.outbound.protection.outlook.com
 [40.93.198.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3C410EAF6;
 Fri, 14 Nov 2025 19:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjZXEv6uU/HGzeZMWG0DjXjvZigzYU+b2KY+eeYio+SuD47yfZuMBagmP/XssWCyzLYqr17Ia4sb16LbTbJZzFjWgPIrDOPJYHVi90eId4Kkg8gON4cnCP9YwXupayQ1dH5ICp4Folj68SvO0Zvg9CrD4oGz3TxzXT2MFB0XgVnz+eon/J3lqkEdrJ5waAsNLRHrTbtjnLBaGc0QvqCE55gyYgADmkHjzP1JkiKnNV4if47x2w++51NhOdn1wI230lLKIR0oRHJBuNinb9MwbiIGzPAQ7+HiRQV+RtkTwXYxfPvjsOdsVLOLateLEsdZZw5pBJlx/1xan1Ym9EX6oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXbwEjt27+9nmJLErqIUmKEat4vLv4m4UfDWd1uzRRA=;
 b=efPoNdedvwM7bTeiYRNboqz9YhckbfBlzdDXdtL3PG+NK/D8usvCqGkrNQ5W/i5GTus4zc3qDM/t5KaYGM6d2qgS2WivdvL9EfbsIBvaz2mNPKFXkNvun5ks9YAZiqZminAYzb35Pau/B/2vv3szIL+SZFB8NBPPV5h49t4xHFIqiqzClZ6F8kjDf/ZzGL7kFTSZYHKdEbQtBjn5KkvgkgBxXv7P7sZ2T6dgiaoFq8oJcGP7J2hc2HEoMaG88DqEyGUxvo/NTw9rEziDYhXILfc9ueW0Z3xy3yRh/eRdTTYr50710uoP+iAbkhpw+JDWRtS5L7kxHdTQDypRT9weSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXbwEjt27+9nmJLErqIUmKEat4vLv4m4UfDWd1uzRRA=;
 b=q+Erlb+JLZpcI7pJHGVUr8zmULYGxKnk+glxgknBaQkjh7dDyYS5kJ7IhgJ5gPUFTYgCx8Nx8Mojy+xHUPwVZ4MrPLRE8n91rmTuYcyuW2tXck93OkJq9n9loQz5ncHYj1tZVxhmeRH4N/02m6rdEq8Om7D1b506nrNWKVD8LrQKG1oxwyZOiU2q6JW80iypq5Ng9+jAQavdvNAxASGBmdgCH6mUgONEq2v20IRvx7YG/3YC9PpZxIPNWfFu1mOP6IwqMckyq8f/Z7QWoRXqS6/edGiwX8ne73MjOP9yXbephq0A3+aFLgZA/F9TAOym5LsDEXMTxIPB5JXQH1T+4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 19:56:12 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:56:12 +0000
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
Subject: [PATCH v5 10/13] gpu: nova-core: sequencer: Implement basic core
 operations
Date: Fri, 14 Nov 2025 14:55:49 -0500
Message-Id: <20251114195552.739371-11-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114195552.739371-1-joelagnelf@nvidia.com>
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P221CA0017.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::28) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: e7439baf-cd16-4e07-23eb-08de23b7dce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oNkvLshvplfx2Y+TUpEQON0v2PNBlA9oF4Kx9AA1XGwUE2uqIaFvb/XNpY2j?=
 =?us-ascii?Q?G0kFz4aZomtt2BL2BrRMgDP82GmQ6J02oM7V8dxJudm07LJv83rqdYPb8srC?=
 =?us-ascii?Q?Lm5fdyYyox0rQbmatDMM9GWS01I5CG3z9xK4iDhm8KK7DQJVPn5koMI5wN1f?=
 =?us-ascii?Q?S9R1qwLMelwDgqaIrtCrZ/xV98l3tb52x5oxGjx5oyHnc9lKu3881YIu36J1?=
 =?us-ascii?Q?uXROcj7rSi0vEY0lFZWJ6ZbevdxspIoAEALnz+ibB6xwkLnZX9kql8HPB8fa?=
 =?us-ascii?Q?cCFz/dzy9o8AQP+gHwM6lKnIRkXV36tFN/uDFJI9h2RivZ4MosDpGXiD1xc9?=
 =?us-ascii?Q?b+VBnHB0gi4FFH6ui2/+mQ78VY6tu5NSHM31O6aJ6A7Kr/r1e3nwV39jvSaV?=
 =?us-ascii?Q?TFZKAOnDBCx9o5qhe054VZ6aVV9MwNJIYWGcaM9Hrm5MktTA0kXBKYYGTSkE?=
 =?us-ascii?Q?HQAEM+MSkLmY4UyjKB0mV6x72hwjm+JICSKCC9Uk+axJqPvGaZhqknpZsF//?=
 =?us-ascii?Q?KG+lwUGxJxOb3DHwdUaRY0KkBBr7Cs5QUEFMSATEs7TXjvyIng97uIt4Ju7/?=
 =?us-ascii?Q?vvyobPg/IHS7suYT5vrUBqguDr8MSjb67bhaRbqqmzfm9YRUypGYlgoLiWVH?=
 =?us-ascii?Q?nmK/Ag+MLNzPt8VpS/b6idxiV4qTwIwmxBKG6gG3pY9SBPL1mcAHLXz8LSuJ?=
 =?us-ascii?Q?yIrLH9tJnlE4zIUENd2gr+e5V+mpWbwN/7xCEoadZtzMqzf4j+8asKLWcmPT?=
 =?us-ascii?Q?NbZ9o0QNhLTSX+suXGJMmdYLF7OmobwiWh0dCgoX3F/7mCIrLDV5bt34hLha?=
 =?us-ascii?Q?juR+/6OYGcG5vWtgUgoGE/8GIYnty+U3V3KvJvXTPojpOVwbk5YfYqVH7DcQ?=
 =?us-ascii?Q?iwwIjoRaUNGgCEAx8JLfEeEfvsAQcjruFLXaNrF0rSVhcOtDpwesEj0mpDLj?=
 =?us-ascii?Q?+uOnUSZIBtTok5JvKdBfPruUkFgEi9W/Pt9O3IuTQqsoDp7UaIc9OKSV7bQY?=
 =?us-ascii?Q?uUEVOgkY1LP/6x2ukdbGgSbVsXmWVwr+9mtM8HsGfivNSW3GFRD7D/oA7Hgq?=
 =?us-ascii?Q?0Va+Dx+lmhKQ9pESh8XeRHDjbtsU3LnvXQxifzij9SDKRFcWfrmttwVj+yY6?=
 =?us-ascii?Q?M1mcgfwOIHN/+bVm3sM6nFzcxfC/nV/fF0r9zG3GDbqaxZGVfe0KesWju/5V?=
 =?us-ascii?Q?YeUPXaNundk0L2hfQoejjlgE3AQChxlHyQ9J3QG45Vd6p+7tEMqF3aSB5jWm?=
 =?us-ascii?Q?+qr87RWbG7CJqMluB3L7oDOBFWWiohik9JmwJwKOnXsvNAdj2fQabgY/0KYB?=
 =?us-ascii?Q?xlbn05KrvfPrcxvdbB2CzoXjT3PerSWteX4iLMgfXopK97MT+gTN7chG4dbZ?=
 =?us-ascii?Q?t7ETVenaLhIYdbJl7/McGt8iIMEJL4gEZBh4Gl7TrX+BLtjnNH4aPFawyGNp?=
 =?us-ascii?Q?WywyRaMHO0XjxkJOkEXitXZiP6lM4A6j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ez/eg5WSHU2e9Kfpfw7opjCrQvVuxJqzjZBA01qP7nsrGhbjTPzSy+9LV9T9?=
 =?us-ascii?Q?oH/3gbmld7GkVx4R5Lo/vPcy+X3VEW2wRHxIM861lamSGmKmbHJTjzfvUjCS?=
 =?us-ascii?Q?LU9fE+t/yDJJRp3VM/Pgj2r6rWKBmtk9B9YYoRZqBiOcNulnH/r9s06fS1MC?=
 =?us-ascii?Q?EVi0CeLMADv9vGxQwSCAqh5FFcPozFV1PiMEid/YWqTIYhmhA+f2klUcIQYM?=
 =?us-ascii?Q?ZpcxcGYYqv9/+410iqXvoNvJJUiuU3X40f/C4gb6lhl4zwa0E7uF90rgQGn4?=
 =?us-ascii?Q?lMltitLa44jZ+uMTucukujX0QYqPOZ2YEEa6OOmRVgTS+HXWEFij4l9497UH?=
 =?us-ascii?Q?Fe9sghQQaUamSfOdD7H1OqE6kUne7S2HyFcmthZycw8Gax1g12+VDixs2kvd?=
 =?us-ascii?Q?Bca550wZZOzIwQIG7F7fmEI0U0gLMlIUWSswSAyC04VkHyv/Q0SdsI8OO9D4?=
 =?us-ascii?Q?76WfI8BtOPzxm8cZNrlN6MDuscEYrkpfO+H4KN9RQFJTW7eWE01M604pvvHt?=
 =?us-ascii?Q?vAEAiQoH5zAt+7WXbJABmZ7Cx5lP4OdbBLrPU6vR6RYl11fGSlWgYFUI5nIY?=
 =?us-ascii?Q?VxJTgHoYPfdX47tfWyKMlEudLAILqAo9TVeoTJKLfIWGZrSw9Mn//PU53/ON?=
 =?us-ascii?Q?kjUnTqx+mZI2aIff//YenGbE560jbmTyjemezaVWMiPiH8MIvPhWwRbjeUX9?=
 =?us-ascii?Q?tRi+q6nR4k2E/in5OeK78DQkueVctFeR0oDgLcH2Kt0WvYoVCai7nxKXTjQG?=
 =?us-ascii?Q?r3t8LfVDo9rVNq39kDAu64NurFsWn2YJg66tgI3WioEEMvuUYi4CMuPg4weY?=
 =?us-ascii?Q?2x5Hz+MzgN6lV6cE0CIyymUcHLptUPx7RC8dwM51wvUhhNE+vojEwSPpwRl+?=
 =?us-ascii?Q?A+y3cnaEKXzsbrMkeD75noejmhCYb3rpFQuKVvXRxkBXq/VF/pQZlVnSZtvB?=
 =?us-ascii?Q?fPINb7KyFMnpPiJAYkOqKHiM7Fxmwt6qydkJiyNPJqSXN3GJXGrkqLKdCOQT?=
 =?us-ascii?Q?y067EoDasX7U4rtt8W77S1b44OE41919EzLVVbXOS6Rde5sz3cyoRa5cbIkz?=
 =?us-ascii?Q?2kmBm/Dt1U6G6ICqMUEiRxH0zpVIH6ybSoJWhVMkChlMvgWfWx4qTsWS+S6a?=
 =?us-ascii?Q?k14CODwRIVZZ2JyReySi47bQAjWTSqU4T9N5JTBC5LqMiVc0VtPKFevgmxlA?=
 =?us-ascii?Q?KNEDSFVyxykCf3Havnn1kG4WAAmcLb/NdlxdSGvBGEiBb3H7GW7MidXPHmz0?=
 =?us-ascii?Q?uf7Umf443WL27HMnieEZtl/ZvOxJgm9q4vF9BQN9DuVeJnN84L055ybq6YDs?=
 =?us-ascii?Q?Rt/y1TQ8XDxpHTeBMlmLrElpYpVwD1jTT+XPRtZzAUSYE32Jfu3OuMMyTubq?=
 =?us-ascii?Q?coqETApP5eQEFTTEhLu4V2aKF9/0u8FVmbWPXEyA9ygjLYosD725oS4OGayh?=
 =?us-ascii?Q?wDjB7IOZLRbxBg5PtR+/KribNFMIBIwDHZd238YsTUIjjfYKCgMdYwTOZJrY?=
 =?us-ascii?Q?/cei0xuMhxR11F0wTQZMNdEkMQUjbLmdA5gV1adwrFg6OLtd5rvO1oizcOuL?=
 =?us-ascii?Q?JcSz7xDt55pSRoB9GwYRRO96L7J90yYuNNW1tb7q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7439baf-cd16-4e07-23eb-08de23b7dce1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:56:12.5678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jWXyC0HHbSNOsgSpyufWdW4kPLSzmHCm6Rl1+i2wo89y5x5vXVJolsaWrkyv4f/h5VDA5ZLhVab0NyREkTUBQ==
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

These opcodes implement various falcon-related boot operations: reset,
start, wait-for-halt.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/sequencer.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 19bde9b8bf1d..8d996e5e71c3 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -68,6 +68,9 @@ pub(crate) enum GspSeqCmd {
     RegPoll(fw::RegPollPayload),
     DelayUs(fw::DelayUsPayload),
     RegStore(fw::RegStorePayload),
+    CoreReset,
+    CoreStart,
+    CoreWaitForHalt,
 }
 
 impl GspSeqCmd {
@@ -102,6 +105,9 @@ pub(crate) fn new(data: &[u8], dev: &device::Device) -> Result<(Self, usize)> {
                 let size = opcode_size + size_of_val(&payload);
                 (GspSeqCmd::RegStore(payload), size)
             }
+            fw::SeqBufOpcode::CoreReset => (GspSeqCmd::CoreReset, opcode_size),
+            fw::SeqBufOpcode::CoreStart => (GspSeqCmd::CoreStart, opcode_size),
+            fw::SeqBufOpcode::CoreWaitForHalt => (GspSeqCmd::CoreWaitForHalt, opcode_size),
             _ => return Err(EINVAL),
         };
 
@@ -210,6 +216,19 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
             GspSeqCmd::RegPoll(cmd) => cmd.run(seq),
             GspSeqCmd::DelayUs(cmd) => cmd.run(seq),
             GspSeqCmd::RegStore(cmd) => cmd.run(seq),
+            GspSeqCmd::CoreReset => {
+                seq.gsp_falcon.reset(seq.bar)?;
+                seq.gsp_falcon.dma_reset(seq.bar);
+                Ok(())
+            }
+            GspSeqCmd::CoreStart => {
+                seq.gsp_falcon.start(seq.bar)?;
+                Ok(())
+            }
+            GspSeqCmd::CoreWaitForHalt => {
+                seq.gsp_falcon.wait_till_halted(seq.bar)?;
+                Ok(())
+            }
         }
     }
 }
-- 
2.34.1

