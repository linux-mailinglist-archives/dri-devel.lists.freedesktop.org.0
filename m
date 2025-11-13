Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8D3C554C3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 02:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7A710E7D8;
	Thu, 13 Nov 2025 01:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="owbWP3BB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011039.outbound.protection.outlook.com [40.107.208.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEEF10E7D7;
 Thu, 13 Nov 2025 01:41:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUnxcby6xAFqk/yt7plFtXqHxpaSBd7RdPB6+NBe9nv3PCVnaX7w0Po9JRkiaf8m85CES0nFXomxFw/K4Kd23x6qWj+xPjDW/YlHrzbBhgeZk+849I1PhkWnyA3UkyeCbPvHxHLSBrTRt0X3F2TCMOT5rq/Zs3CT28Y5F2XPU7u5zggVz426hwyoeK4RDw4DLqz3XkD6i+GPZ2QRrlDa22igMy1gt81/xP7GblzTWQ8VcDqq5IUhc4lsZqn0tc1sfVaJFzs4h4JP5w/qOvaBaUq2tozo5iprb/8YB5o5FzoRPF5/O6G/0tIU7UhJyv23X+ztcKEuBe7AI/uujrfWTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9NmFC0N/iu1esBSrdIf4Io6f+p9SS9rMPx691ZtSi0=;
 b=mUgeQ3VnZStVe8NEMy1SFw4NDoqOFbJRuETSvk8z5FG2bEME6NKo5W6p7ejo6Fen3wALZ2/+Z5mc7KQQs/9iTX1Igzhql6UiE3F6TrGbGP4WZrLXb6Bu23eYc1ulz3Hs0Jw67VrqTOZse8DZCSyRk7lK9v1zT1WghZw53NrxR+wpBc7wBwrMYWlwxw1qSc6qDojzh/4jIO5eYjfPeKI8vQZmOWEZGWkhgQVwB7fMPOsKDoIYhMOJJjMMn7Yc5I+7lIUf8bZGIMGm/suQMPVT1xYS+GqUO/YLubYYzqgB8n9w/n6QNRmF8Si6YqSbZFgiCg2CcD1Y0uFFvjk5EThU1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9NmFC0N/iu1esBSrdIf4Io6f+p9SS9rMPx691ZtSi0=;
 b=owbWP3BBAIArD08rE0PellPmoQiyt6Ks1I3L9WTS9TQVGUB6Lri1kdbL+BaevQyuKMVZekr76Is2Dvea4ImyUyUPHOTEdnnv3VZRxJiyAnQj1mpoDaM26Ko9G7NbAr8dGppjEV2Cnp+NE09lalcChlsOzOrfVi9JEmJbC3N3r/2z8Qy1ZTkXD6YtUZ/zpW5RvOYandVhFIf6K322nbSAB7d4BMsh+TBDB4ptVD3iN+u5PPBPf/xkouoB56GVbIxAQ5oSCZdJbMxOgN62wrFf/NPjJ5+Tx/sy0vIUO8V6AX7uV5sK1bivGmFtfD9SAWKD74ZumrEkXmy9Cx+1SqSOfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by SA5PPFD8C5D7E64.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 01:41:43 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 01:41:43 +0000
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
Subject: [PATCH v4 13/13] gpu: nova-core: gsp: Retrieve GSP static info to
 gather GPU information
Date: Wed, 12 Nov 2025 20:41:19 -0500
Message-Id: <20251113014119.1286886-14-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113014119.1286886-1-joelagnelf@nvidia.com>
References: <20251113014119.1286886-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:208:256::14) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|SA5PPFD8C5D7E64:EE_
X-MS-Office365-Filtering-Correlation-Id: 6239a811-c5ae-4016-4950-08de2255ccc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oORnyKyE+FjSR2woVEfdGk38WrYVUBNvMQgcbaKRpipLduO3YHV1G98Jokxe?=
 =?us-ascii?Q?srtqJ320GZWHfpx03RHz1brPu46tKKyZ2KlC/3hYAvoBQTdCmggbtov4o67M?=
 =?us-ascii?Q?5h4fTTelJb5Yfn749dFHmQNQ4Va7TW+Td+nDspOOmY2y4uCj6Vhe/LDA2UA/?=
 =?us-ascii?Q?jw+TT0Icvc4y/ffaLPpMGhYWSmGYCZIbajFB31DYDOWEOp8wqXvjrGn4Eewp?=
 =?us-ascii?Q?XwWudgjLrzgLirr9JJEl57KLeaA/amjRIsD+yWrxDomRQoJrEpDgNlTsPXPj?=
 =?us-ascii?Q?wIEhzEBhoDod8kkqVAsSWceZp87I35rqQX0nJW6pswIubQXNKgxKtlu4Wyl6?=
 =?us-ascii?Q?Ayn7WCHRdHCQu/xlAR5IriyKP66q8EI9jYB3ZfGNId9UEedcoPeXdq6C5Us1?=
 =?us-ascii?Q?avL+QjzqeaK2nyKBIG0E8iIcYEKx4ZgvbG7mop1sYhE7oNtKFKoRFYsoYa8B?=
 =?us-ascii?Q?P+xN86D37OjYoRK/5mLTxQRHXW9obcEa/q+2Y1GDZr0VfAEWJrtAKIEAASav?=
 =?us-ascii?Q?CE+DI+SIzO0+F7UpjBEpSloSgCS4pn0NCqt4l59gedPiTXm3f5ky2FsfcKlu?=
 =?us-ascii?Q?VKWovNmHkoBK1AJJlrmr8pjxFqBAEum/ttGtv7fVLdHX20sSF0a6lZfKs7wO?=
 =?us-ascii?Q?VrLG3FWv8sRwb7xe5vyPjDNxiCtpfZE5efsWrysffsGMssmf2V3CznHF/M0f?=
 =?us-ascii?Q?GtBqCK3MRu7nXXKS9FND4bav+d1vb6TuS/E8dSh52iEDr3mJ3ZJM/wEM3S2y?=
 =?us-ascii?Q?LLRnILNoByzL+oOqPZDSU+3KV2K1v3N/hITLHIET7IqXR6U79AplL2AYV/1t?=
 =?us-ascii?Q?/62tbxXg4FhHiYpPGnQP4UYlNZgugkXEdiTJSQZBICRQLq5qYMYNbIfYSMmm?=
 =?us-ascii?Q?IwMLtahp3rJ/fS/YjcFjqn0Acv27xqIm9Z/iWXYfkgydf+MtazSy73KK4sPw?=
 =?us-ascii?Q?7MKNyLzE/CcVjDJu0+RyJnhC27EigodhbXsKfTBh5fU/TixAPsthUAK4ANAR?=
 =?us-ascii?Q?3jD90unXLvl5G/KPgnIQnfIXVUkzyvQSR3RX2RdchjjnSS5MeZ8FiJrExW0B?=
 =?us-ascii?Q?AHpzG+/TKKqFI6mi+bwhYq2mwtP8PPazpvEvVb2pGUdyQQqSnLSDBXZGtZ5M?=
 =?us-ascii?Q?ki3O7YkCDHJk5B8dYEPoG+6ETvSGh7vFPExAQCcJgFA60azctLISul5ZiBwz?=
 =?us-ascii?Q?+3PHmKJw87DrvHkWo+IBnt054LkIEdqjX/ljYXNUYdiRv3VtcLHx9BuaRwSV?=
 =?us-ascii?Q?HJiZo2DTBCns5G9PDUvN6hHdlyAfnZzS8jYkq4fQI2N4Vr2Md2ILXp9lj54W?=
 =?us-ascii?Q?ybvyKsNAPUHMKzUafkhVWWAQAQ5+reGo2ehF1DFyI7hfdJij7UdXCYSo1sdp?=
 =?us-ascii?Q?aBXgbEtLidsvpQXsQv8r+gvkeRZoNJ4Qew5OLP8M5AjPB0ikjQG4TCdRp6qI?=
 =?us-ascii?Q?7rW1PVfbLSajRcDt7KO0LpGAZf7BpPH4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vAJcvHDn8yGR11CZ+uxaAIH9twd2tygb+pEed310Y/CRdkJcf0htwGm4uuYN?=
 =?us-ascii?Q?AOc0j0rlFwRkBggGltGN3cvRVjUKivcYU0u/vYOSnJKcil/5yDeUXOotolF4?=
 =?us-ascii?Q?BSP/oDWqIj7NjzJy5P9psTq+erd9V4nu/EqlaFNgobaFvTpYofNUGt5eg/FT?=
 =?us-ascii?Q?F+BnUEBgh/ZAXYC9tGz5EtWN4sU9HWtfrRhhqxXBe86iajOgiW50Z6oEyXil?=
 =?us-ascii?Q?yVWLLQz19JgWKj89KQXA4m1Nlz6cJwIhd4gksJsqx0hQisKaESkbJkXDQzrw?=
 =?us-ascii?Q?mEQQRBgqC192BBlw67tYNgC3SoVJHPHUfroJDGzzNoLLA3gQ3tj9FK2PN1yd?=
 =?us-ascii?Q?OMc9k0zEpdD7O3vK/oWPP8/eVIRCpIcRnAL2JeJH3MqpAbUrcbsSktTKmwco?=
 =?us-ascii?Q?gVeWbJvz76QO7H0nXca3yg2RKkHFTxD8Vi5Zj2aVGj6usym9nWnJb/7X+vN8?=
 =?us-ascii?Q?0IUPS2CmSyKOeVRb1YIfaGwJKWA7E50MVHflnElzjiVOBqnMmhZKfDUI6Exx?=
 =?us-ascii?Q?diOI6E+uZcM5ohfM0yQVNRiVp+4eVYPvcT8QUc4iWS7zzPcG/QkJZa0VZ32z?=
 =?us-ascii?Q?uUPzQXMxki/uMblp9AhXxVhe6u7+IG4K1wm1a1aapVH8zvHh7OfOOYGEnD7i?=
 =?us-ascii?Q?em+nFiS2tdKxATdPxHBYZnoQv7GWR/dHmW9TQPlAI0BTyqDU3ykVCJ/J9BwC?=
 =?us-ascii?Q?6efWEk6GfFXp2M86xL1+r01hG8w6rrLtG5ztR4ih1q+DWTGWl+gxQ6/BGtQ/?=
 =?us-ascii?Q?nmgMPJEoHrWeMHdzdA8B0DkE3u5cMPwI2eno7ILeuxQIkNp9ywbw8j5SJtVB?=
 =?us-ascii?Q?beX4jGpRzSZP7ZfhvOkRF0L7iQ8lP4xiUkJrU11USV2FCsZKC5aUn4jX5Kwt?=
 =?us-ascii?Q?xUhP2wL1WCH+MZgcYALhnkLT1onSw6y+SDKCOyhbBCzm/+3Sq3QPQM4pLOlF?=
 =?us-ascii?Q?Pr0k5Eiy5EGtzbHoChDnHYvySmc53Y4+DQxEUoQRSTMdmFhlMMSpmFyJrXPu?=
 =?us-ascii?Q?GkppLeYy/0jhb1zKZnfO3HHEv07c+6st3mKIEGYiXCFvyA+Cu8vg6bpobGGS?=
 =?us-ascii?Q?0CUsgl+QSIg+o/qLgUWOMV8a9NskRzfi9YqrEW+36LkKyTdd1s6TbfxNdyI/?=
 =?us-ascii?Q?+bFagM17Sg9U9h2S5ZAtsRnO0i2IjropG6dXxf8qnywGFt/z2LAu409ZFNKQ?=
 =?us-ascii?Q?8Ommzm+70z4KWTgI0ZYQuieb1U6L/XmFwk0eyGeHzN9msLoLN3OMlVrQQ+E0?=
 =?us-ascii?Q?mtz98VOJ7m4P0P2K4UXlSG0iGzeYdq7G7yKVff21DCPZd8rG+/CXh6KpJ2Zf?=
 =?us-ascii?Q?dcH0GozeiNYdRJZC/329EpSLQOHRpFZkJkmp18/7+tXkLLO94Dtpt+KODM7F?=
 =?us-ascii?Q?V4H1PmscEaQQJY3zkvtxT+6gqTSXEgEymcQXUnpKLS2PSw8vEqnGrdmYLtLS?=
 =?us-ascii?Q?rtHVycvFSnvCYqmIRQwA4Pbrx1UCS6uHGEaEIWBnIMgVKChu4cGe0kj8jn9T?=
 =?us-ascii?Q?5uaQrZGwdV4TFTb4mSbC3h0hKObGQk7z25eqN008iJwC7BS4arinKFmS+SzE?=
 =?us-ascii?Q?ZWcSOsjbULXdQKbJXc5dCqQtBYzKOLjo6cWM53yO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6239a811-c5ae-4016-4950-08de2255ccc9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 01:41:43.7338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HReF1OnpZ42tLDYMPULPFrthwkB2F2GJWSu4expqXtTl3kqAjNkvqYjT7MmfHEP6iG4iiPa+i+7Dw/rTWABT/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFD8C5D7E64
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

From: Alistair Popple <apopple@nvidia.com>

After GSP initialization is complete, retrieve the static configuration
information from GSP-RM. This information includes GPU name, capabilities,
memory configuration, and other properties. On some GPU variants, it is
also required to do this for initialization to complete.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs             |   7 +
 drivers/gpu/nova-core/gsp/commands.rs         |  67 +++++++
 drivers/gpu/nova-core/gsp/fw.rs               |   5 +
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 163 ++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs            |   1 +
 drivers/gpu/nova-core/util.rs                 |  16 ++
 6 files changed, 259 insertions(+)
 create mode 100644 drivers/gpu/nova-core/util.rs

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index c0afafbf35f6..42a3abb9243d 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -40,6 +40,7 @@
         GspFwWprMeta, //
     },
     regs,
+    util, //
     vbios::Vbios,
 };
 
@@ -237,6 +238,12 @@ pub(crate) fn boot(
         GspSequencer::run(&mut self.cmdq, seq_params, Delta::from_secs(10))?;
 
         commands::gsp_init_done(&mut self.cmdq, Delta::from_secs(10))?;
+        let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
+        dev_info!(
+            pdev.as_ref(),
+            "GPU name: {}\n",
+            util::str_from_null_terminated(&info.gpu_name)
+        );
 
         Ok(())
     }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 07abfb54f9d7..dcbd8a3da89e 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -17,6 +17,7 @@
 };
 
 use crate::{
+    driver::Bar0,
     gsp::{
         cmdq::{
             Cmdq,
@@ -25,12 +26,26 @@
         },
         fw::{
             commands::*,
+            GspStaticConfigInfo_t,
             MsgFunction, //
         },
     },
     sbuffer::SBufferIter,
+    util,
 };
 
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspStaticConfigInfo_t {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspStaticConfigInfo_t {}
+
+/// Static configuration information retrieved from GSP-RM.
+pub(crate) struct GspStaticConfigInfo {
+    pub gpu_name: [u8; 40],
+}
+
 /// Message type for GSP initialization done notification.
 struct GspInitDone {}
 
@@ -62,6 +77,58 @@ pub(crate) fn gsp_init_done(cmdq: &mut Cmdq, timeout: Delta) -> Result {
     }
 }
 
+impl MessageFromGsp for GspStaticConfigInfo {
+    const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
+    type InitError = Infallible;
+    type Message = GspStaticConfigInfo_t;
+
+    fn read(
+        msg: &Self::Message,
+        _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
+    ) -> Result<Self, Self::InitError> {
+        let gpu_name_str = util::str_from_null_terminated(&msg.gpuNameString);
+
+        let mut gpu_name = [0u8; 40];
+        let bytes = gpu_name_str.as_bytes();
+        let copy_len = core::cmp::min(bytes.len(), gpu_name.len());
+        gpu_name[..copy_len].copy_from_slice(&bytes[..copy_len]);
+        gpu_name[copy_len] = b'\0';
+
+        Ok(GspStaticConfigInfo { gpu_name })
+    }
+}
+
+// SAFETY: This struct only contains integer types and fixed-size arrays for which
+// all bit patterns are valid.
+unsafe impl Zeroable for GspStaticConfigInfo_t {}
+
+struct GetGspInfo;
+
+impl CommandToGsp for GetGspInfo {
+    const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
+    type Command = GspStaticConfigInfo_t;
+    type InitError = Infallible;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        init!(GspStaticConfigInfo_t {
+            ..Zeroable::init_zeroed()
+        })
+    }
+}
+
+/// Retrieves static configuration information from GSP-RM.
+pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GspStaticConfigInfo> {
+    cmdq.send_command(bar, GetGspInfo)?;
+
+    loop {
+        match cmdq.receive_msg::<GspStaticConfigInfo>(Delta::from_secs(5)) {
+            Ok(info) => return Ok(info),
+            Err(ERANGE) => continue,
+            Err(e) => return Err(e),
+        }
+    }
+}
+
 /// The `GspSetSystemInfo` command.
 pub(crate) struct SetSystemInfo<'a> {
     pdev: &'a pci::Device<device::Bound>,
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 538bec7d7c2f..6f7afd18f25e 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -885,6 +885,11 @@ pub(crate) fn element_count(&self) -> u32 {
     }
 }
 
+pub(crate) use r570_144::{
+    // GSP static configuration information.
+    GspStaticConfigInfo_t, //
+};
+
 // SAFETY: Padding is explicit and will not contain uninitialized data.
 unsafe impl AsBytes for GspMsgElement {}
 
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index c5c589c1e2ac..f081ac1708e6 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -320,6 +320,77 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const NV_VGPU_MSG_EVENT_NUM_EVENTS: _bindgen_ty_3 = 4131;
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
+    pub totalVFs: u32_,
+    pub firstVfOffset: u32_,
+    pub vfFeatureMask: u32_,
+    pub FirstVFBar0Address: u64_,
+    pub FirstVFBar1Address: u64_,
+    pub FirstVFBar2Address: u64_,
+    pub bar0Size: u64_,
+    pub bar1Size: u64_,
+    pub bar2Size: u64_,
+    pub b64bitBar0: u8_,
+    pub b64bitBar1: u8_,
+    pub b64bitBar2: u8_,
+    pub bSriovEnabled: u8_,
+    pub bSriovHeavyEnabled: u8_,
+    pub bEmulateVFBar0TlbInvalidationRegister: u8_,
+    pub bClientRmAllocatedCtxBuffer: u8_,
+    pub bNonPowerOf2ChannelCountSupported: u8_,
+    pub bVfResizableBAR1Supported: u8_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
+    pub BoardID: u32_,
+    pub chipSKU: [ffi::c_char; 9usize],
+    pub chipSKUMod: [ffi::c_char; 5usize],
+    pub skuConfigVersion: u32_,
+    pub project: [ffi::c_char; 5usize],
+    pub projectSKU: [ffi::c_char; 5usize],
+    pub CDP: [ffi::c_char; 6usize],
+    pub projectSKUMod: [ffi::c_char; 2usize],
+    pub businessCycle: u32_,
+}
+pub type NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG = [u8_; 17usize];
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
+    pub base: u64_,
+    pub limit: u64_,
+    pub reserved: u64_,
+    pub performance: u32_,
+    pub supportCompressed: u8_,
+    pub supportISO: u8_,
+    pub bProtected: u8_,
+    pub blackList: NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
+    pub numFBRegions: u32_,
+    pub fbRegion: [NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
+    pub index: u32_,
+    pub flags: u32_,
+    pub length: u32_,
+    pub data: [u8_; 256usize],
+}
+impl Default for NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct DOD_METHOD_DATA {
     pub status: u32_,
@@ -367,6 +438,19 @@ pub struct ACPI_METHOD_DATA {
     pub capsMethodData: CAPS_METHOD_DATA,
 }
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS {
+    pub headIndex: u32_,
+    pub maxHResolution: u32_,
+    pub maxVResolution: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS {
+    pub numHeads: u32_,
+    pub maxNumHeads: u32_,
+}
+#[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct BUSINFO {
     pub deviceID: u16_,
@@ -395,6 +479,85 @@ pub struct GSP_PCIE_CONFIG_REG {
     pub linkCap: u32_,
 }
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct EcidManufacturingInfo {
+    pub ecidLow: u32_,
+    pub ecidHigh: u32_,
+    pub ecidExtended: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct FW_WPR_LAYOUT_OFFSET {
+    pub nonWprHeapOffset: u64_,
+    pub frtsOffset: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct GspStaticConfigInfo_t {
+    pub grCapsBits: [u8_; 23usize],
+    pub gidInfo: NV2080_CTRL_GPU_GET_GID_INFO_PARAMS,
+    pub SKUInfo: NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS,
+    pub fbRegionInfoParams: NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS,
+    pub sriovCaps: NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS,
+    pub sriovMaxGfid: u32_,
+    pub engineCaps: [u32_; 3usize],
+    pub poisonFuseEnabled: u8_,
+    pub fb_length: u64_,
+    pub fbio_mask: u64_,
+    pub fb_bus_width: u32_,
+    pub fb_ram_type: u32_,
+    pub fbp_mask: u64_,
+    pub l2_cache_size: u32_,
+    pub gpuNameString: [u8_; 64usize],
+    pub gpuShortNameString: [u8_; 64usize],
+    pub gpuNameString_Unicode: [u16_; 64usize],
+    pub bGpuInternalSku: u8_,
+    pub bIsQuadroGeneric: u8_,
+    pub bIsQuadroAd: u8_,
+    pub bIsNvidiaNvs: u8_,
+    pub bIsVgx: u8_,
+    pub bGeforceSmb: u8_,
+    pub bIsTitan: u8_,
+    pub bIsTesla: u8_,
+    pub bIsMobile: u8_,
+    pub bIsGc6Rtd3Allowed: u8_,
+    pub bIsGc8Rtd3Allowed: u8_,
+    pub bIsGcOffRtd3Allowed: u8_,
+    pub bIsGcoffLegacyAllowed: u8_,
+    pub bIsMigSupported: u8_,
+    pub RTD3GC6TotalBoardPower: u16_,
+    pub RTD3GC6PerstDelay: u16_,
+    pub bar1PdeBase: u64_,
+    pub bar2PdeBase: u64_,
+    pub bVbiosValid: u8_,
+    pub vbiosSubVendor: u32_,
+    pub vbiosSubDevice: u32_,
+    pub bPageRetirementSupported: u8_,
+    pub bSplitVasBetweenServerClientRm: u8_,
+    pub bClRootportNeedsNosnoopWAR: u8_,
+    pub displaylessMaxHeads: VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS,
+    pub displaylessMaxResolution: VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS,
+    pub displaylessMaxPixels: u64_,
+    pub hInternalClient: u32_,
+    pub hInternalDevice: u32_,
+    pub hInternalSubdevice: u32_,
+    pub bSelfHostedMode: u8_,
+    pub bAtsSupported: u8_,
+    pub bIsGpuUefi: u8_,
+    pub bIsEfiInit: u8_,
+    pub ecidInfo: [EcidManufacturingInfo; 2usize],
+    pub fwWprLayoutOffset: FW_WPR_LAYOUT_OFFSET,
+}
+impl Default for GspStaticConfigInfo_t {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspSystemInfo {
     pub gpuPhysAddr: u64_,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..b98a1c03f13d 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -16,6 +16,7 @@
 mod num;
 mod regs;
 mod sbuffer;
+mod util;
 mod vbios;
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
new file mode 100644
index 000000000000..f1a4dea44c10
--- /dev/null
+++ b/drivers/gpu/nova-core/util.rs
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/// Converts a null-terminated byte array to a string slice.
+///
+/// Returns "invalid" if the bytes are not valid UTF-8 or not null-terminated.
+pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> &str {
+    use kernel::str::CStr;
+
+    // Find the first null byte, then create a slice that includes it.
+    bytes
+        .iter()
+        .position(|&b| b == 0)
+        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=null_pos]).ok())
+        .and_then(|cstr| cstr.to_str().ok())
+        .unwrap_or("invalid")
+}
-- 
2.34.1

