Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50962C5F1F5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FF210E25E;
	Fri, 14 Nov 2025 19:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cJpl/+9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012071.outbound.protection.outlook.com [52.101.53.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F0710EAF7;
 Fri, 14 Nov 2025 19:56:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+lO9xmsFT3tjwt4aN1zLK1DzEfdAKXt9RT2qUhvkuwTyW5vfEL/IDJDH00qQCPqf8GWsvS0muDqHa6ZFLfwotaVMtjYnVM1bg9fDgcJY0LOjI7fy5vt7hBAPqa9yRhKfwZdJ3kL0aPbYRqF9S8FrqM5lA4QEkxnmkpsMUZsw6Js2RXKgwiw4UFD1oCmUatLp2JmVz+/VKcBnMRRONBMH3kqk42y7e6RomDc21V9M4FX6m3Y1UKevfAUo/gHnJW72Qp4kDK5FQ8Sa4LgwPTC23csmR7brYMhlrxIOcOykA1X2iWIyzdeoT5unuYfcxcGLQFPQUYnisdEu4kP0Aathw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEBi1k5SgLHkTKuoOqb9XpFTy/pWVE9M3JAtmRSOuB8=;
 b=yKdjYG6T08mumHFpqVSG90QPO/PruUjZxikF6cD+ix9tpoX5NPfvu4VKL156yzXgSpl4Kl7FHLhzv+zHI9ubqCo009xH5vqNIil1bvJApjK4Yv0xh6akd3JDk9KY8pNXKnXWCxUgMr0+5oBD0NEXX9fIoJtq3gtYNKbS3gpygx1vIS+ycRtseKvWT9BBVqm6coaqcLfSBRFHf7OwRnDPG5nL/Hr8P/EerqnUB2iF4/iByn6DGBguBpV3Fsq/LP6AmM3oCpcuxyHJF9MkuvQlHvh0t1o2UFyqaRfhCzUzaPpddqVtVlvxq7YrN1YZ/4uCQa7EO+a2JcLMxzQoALJ7iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEBi1k5SgLHkTKuoOqb9XpFTy/pWVE9M3JAtmRSOuB8=;
 b=cJpl/+9JtkKupNHjGu085khDnQ/lG4uSbhS9AA8EwC+aH1WE07MVka8opgyj47osUHNxH4W7uUXv/Kuv6sIBpYHO6sPiWU0d/yCgTXqHVJAFpbIBKifB0nbZ2C0k8Xi+6/L+Npguf6ewcXay132Zwt0MYRZNv79qtgcoNpDvQzUig8xJgu4YpC6/bVSfaBW6gygPNXMAf4ldeVPgteIUTIotjCQKQRU+2H9lReROoclwSmOSdrdB52PGTenzbGLgaRL/Df1KQ5YS9o1wb+BrXDNX4YVhwLSShldiypmYG2d8LIwfJD+3D1I1SRYVydGeGmaVOUdsU9t5s84taqE4vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS7PR12MB5765.namprd12.prod.outlook.com (2603:10b6:8:74::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 14 Nov
 2025 19:56:03 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:56:03 +0000
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
 nouveau@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Lyude Paul <lyude@redhat.com>
Subject: [PATCH v5 04/13] gpu: nova-core: falcon: Move dma_reset functionality
 into helper
Date: Fri, 14 Nov 2025 14:55:43 -0500
Message-Id: <20251114195552.739371-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114195552.739371-1-joelagnelf@nvidia.com>
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS7PR12MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc8bbed-0672-4863-4bf9-08de23b7d792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FN1QyLXOM/YW2JkLWa3uNyONTK9RzRLFNDO7Pesc0GVdd413tSlli5Md5DrE?=
 =?us-ascii?Q?ECvMniSVmiKpyytdRzOCztEOk8twW+BYH6ADjO1GT/mVrBCWovtz7ke5R5f2?=
 =?us-ascii?Q?5Lgxcl9btmIZopvYY1GUWLEqyYeXQ7OJ7JmZiWUCC49uzXVMmXg54sM/DpNy?=
 =?us-ascii?Q?za6ojdf//GrRlE8mCBJsVDFKvqaezQ3WwjmP9BynpnOgCSPk1+gCPeaP3Hie?=
 =?us-ascii?Q?7ZrVKhL4ezKbgRNh6TLwvkSCFKwZMCOU6M0a4Ov+xpBOfs/h74WhNdHLIGvh?=
 =?us-ascii?Q?PJM3ye6bPuHUAqsr5xqlpIlFQtS06Ynavp7F4GhbDyUHQHPtaErOobeQzYkF?=
 =?us-ascii?Q?D2naIooV1uISyRIL4GbBgoH3dL6cKjO+UUeEGN3slrcEv46lnotmqNoTGPmO?=
 =?us-ascii?Q?SBLDLoqUuzpFGcleXKjTgStBNXCpfjD7oeBvQLYpRKErbV0KR6YckDoUl4ZG?=
 =?us-ascii?Q?c4DD5yeGmv1GS15AVsdp1CEg5o5T2u8lbKXFD2s/vn2bVMKdUXT/DflLz92G?=
 =?us-ascii?Q?baEvbuUp6qWxSH1JWACfZmTnJCuXnuxD/Ep4ERJoEpdt9zD89ZxvXpbsRxRr?=
 =?us-ascii?Q?wrJoJ2rH5z/2F37J8rGpNrzrFB3Lj+htgf75DS5DLPV001OGgny6bL20GPty?=
 =?us-ascii?Q?yazNq18Kv6U6cIGx0hTOOw2vAxZtwT4C94XK0LkH9aDFuCKfZo8MnpY3S4+b?=
 =?us-ascii?Q?27mD3hB3M+ElBgAf9X2cIgrn19kdCTwjfg1noTAkuqtRh2mJ0lvLOxMHFFcE?=
 =?us-ascii?Q?hn3K1CzUGZrpJLuRVag3ECoqqJb+afxo6hQysXuIaWjuPAy/caoURI6Tyemw?=
 =?us-ascii?Q?opNMAQBD0vkY4fgl5tLWHRngA+vPwtLqGAk6UyI9lKyvbYSO3FJMLJq4IPBv?=
 =?us-ascii?Q?W9qiRExG/CC/2X/sc6HmCPaTICCsOJE8e/3srGU9n3mPa1LdHQjzGNq4qQ2V?=
 =?us-ascii?Q?ypDhrSU++ylBHtaeQIMcZYRPJwio5zTjIpOIbt3qzSGuZTFHJ0efCUZzs1+n?=
 =?us-ascii?Q?DsUCX5E0FEIfhenFO2C8oJh8V4FWQmyDbeUklZDwCFvdVo8rcKpYamjcmsiM?=
 =?us-ascii?Q?zPaEO0NmVb5f3D+otgtAxYylk5bj93ZNSBDcZMgbwKY/sn1EPblNtZ4KuFtS?=
 =?us-ascii?Q?NEeEiGkGN2/tmqslmWunZRXziJfHV4jz7wGwUMubPbWGMMGbXjpM+4lDR6JH?=
 =?us-ascii?Q?NEcNBlMaQZJX9R8R3DxgFgiLIGdQiQU5+qlSFSWfzmOyCkb9G/idXmJQYw8e?=
 =?us-ascii?Q?dis/2nwE1KQfK63lMEOoNAsv14/C/DqkcLYLOHeSQB/er6+q5wJ7/Oqdc/oJ?=
 =?us-ascii?Q?Xikw7U8rID9GHTnx00HMXRkRnayxjLvbqgyjPGd8C+R/Mp8QfHXg9u0si3Vu?=
 =?us-ascii?Q?IjN+t3HXzTbYUOiVf8gWNBUd/7RURQIID2Ykwdra50s3o78mQhivRy/a0F/g?=
 =?us-ascii?Q?rT84/mqP0kn/WbdORrTQOnhQuAvdAoRS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qq6Y3+N+v+trwEzIjx+y7p+MeRWKBgAQPlkBjErinpiTlUqANmNyuKjRTf7q?=
 =?us-ascii?Q?JhtQ5z6I4x5pXSsaR42u/wzEap8vimrIUhfCB0yFXfw0iRkQ4ZTuVprjUxIm?=
 =?us-ascii?Q?zgcYJ/RM9BcIt2jv9gbgOSLo+fZvqcDLq54DTW68MIbPu0ytWA6BrdhJN1jJ?=
 =?us-ascii?Q?/QLK0a47MgiAkVON3EqXPP2oJoTDEH6jBhjZz4HYDQSYdM3wyHKls/d5Lmvv?=
 =?us-ascii?Q?CajnjMHGjvlWtr3fNJIxZMyvV6lJGnC/Hi9kpOtxEQcRBEs2qykCAT8Is9Y2?=
 =?us-ascii?Q?/H5tu9ldeuBz7kGwLuQ6IWwWGD0N3QsFeW949KVpknEy635Kp5/ePfkLGqWt?=
 =?us-ascii?Q?9A6JAIPPBQVeQNrLgc7Lhd7PZWwJFXQGy6GLuOGYZVhp6b+33FrzUoQFj6Oa?=
 =?us-ascii?Q?94G1/l7dE9eY9osYBm5sx/m84HyPpZwpQgzCKv3QBleYgE7IxpY6o7urgPOG?=
 =?us-ascii?Q?dCNN7YDwnZcEQu1YggP/WV3yY0KTTwTyxc4UYAtXrHfbLikhKj9M2IyME7Oj?=
 =?us-ascii?Q?H7sg+1xUTd7zI7of0fyB8wjdlt7t4xcSJ37w5MiYntAhATbS59UnFMjhEEFY?=
 =?us-ascii?Q?Z29fTQDCYJKbeOBqLZ2fa4crvb+AbEJIOnsUTrqfVN3Fy3pXwzoRb0T2cH8/?=
 =?us-ascii?Q?ASx/pgo4sn+Qf3k0YIO79cbk0tnn+UVAgdomVV0tYa24LPQsXeZyn/oD/MBf?=
 =?us-ascii?Q?JFpZxRGGv7o+v7Ba927479I04P/sGrNy0NUpdZ14cVD6TTcHiqPidBI+btrz?=
 =?us-ascii?Q?ZpqJd2sULSbL7YahK/FSn+/83t4CIqAqy8Hzp20nSTggBotF7B7D/9k4yh7b?=
 =?us-ascii?Q?kmovEA78L3SC8AyxJzV3mzsg7v0y9W/jwEfnbk4W8nLvLcqhcQFRnc7GO9Jz?=
 =?us-ascii?Q?9fzovIr0LGBf8bZmxSUptqOWEkxYJRqu43qyMWkBwtaU4ZcvCSVMM3pAqEit?=
 =?us-ascii?Q?0/Z2T6o4eg3NIhUWQ2tolOW0zahF0d1jdh+JYcfNjqvNr007ZtQ1kddyzW3j?=
 =?us-ascii?Q?6ARlSca/Q0WxXKpc/xLoFy/J7hw4YVnrWJK6CQ0nATZHF7XE8vC+z5tMehWm?=
 =?us-ascii?Q?fo+kTWO75a3ddH+zuH3ILEiDrR4TMRRwnHFzSv7+PTPKa7EUpOiN0isZdR29?=
 =?us-ascii?Q?abnkdgBiIHwm3JG52lWbZMIkLR1JUUBlrJ/Vz4cEAHXgjFbTz/ychQH8Icp5?=
 =?us-ascii?Q?EXM4AwxoSHH3lfhrqwPjU6vPgIb6kd2UYoLJ/zn7MQf3x3+ZMSP5ESWhAyEu?=
 =?us-ascii?Q?+43y0bJKMD7bp2SDpg/j9Yt7jU16gRMwqq0CNYdcmK1Dn2ZvHZvrMqUs/iEr?=
 =?us-ascii?Q?wswGadHobyNnro3XHvYaUkJWJa36CscN9CK8IXrg5eZlwW/zqoQ7gsOS7nTB?=
 =?us-ascii?Q?ihH4tbN0heDRnU7rbA40s82lLgJz7LSZPdZqYh9K3qwqyFee8wZ5bZq7QDB9?=
 =?us-ascii?Q?Jlhx3R5B9S84S/0UD9+r4xQGpX7XiGHqVZMJdJmUMP9HyCg4k1E9JwcfcEP1?=
 =?us-ascii?Q?O47RSukAW9FSQMWvMoVemD5AVQFQ6vwGtQLyY1bvCycb+2e5IB4uTletnzPx?=
 =?us-ascii?Q?UWPwZrgMseYffMXDYHr00GhpGjCSprCFPys3uVwB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc8bbed-0672-4863-4bf9-08de23b7d792
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:56:03.7020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIexaZO+EJp9Q7Iryn+OAF3pzKnoQsS8bSno4gzXMP46wMMtDBH55xrS6gtCTjL5NbVQ3bZi03QtwATbMiMRmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5765
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

Move dma_reset so we can use it for the upcoming sequencer
functionality.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 5c9f054a0f42..695e87370cc7 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -382,6 +382,12 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
         })
     }
 
+    /// Resets DMA-related registers.
+    pub(crate) fn dma_reset(&self, bar: &Bar0) {
+        regs::NV_PFALCON_FBIF_CTL::update(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
+        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+    }
+
     /// Wait for memory scrubbing to complete.
     fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
         // TIMEOUT: memory scrubbing should complete in less than 20ms.
@@ -531,8 +537,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
     pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
-        regs::NV_PFALCON_FBIF_CTL::update(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
-        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+        self.dma_reset(bar);
         regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {
             v.set_target(FalconFbifTarget::CoherentSysmem)
                 .set_mem_type(FalconFbifMemType::Physical)
-- 
2.34.1

