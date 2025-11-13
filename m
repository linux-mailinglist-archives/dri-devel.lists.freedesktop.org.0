Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A16C55499
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 02:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B6510E7C8;
	Thu, 13 Nov 2025 01:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hYZHGzj0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EF110E7CD;
 Thu, 13 Nov 2025 01:41:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2a6GAH0OmMTBP4Gy/Wg0lmqKfPMhuj2NOVTmw4kvuT01Vs0PuEolHTCa2f3/5qeXssYWoEEIlECuuFyUxKIewqoz4kuXAc7BTisRnyCxQub6cDS/k7sKiY7ltldJkb3hAhFPMRBfsf475oB8REea1QMBrRYPUS1rDAw1NN5zlCqG4wchlwHKQ0YyuIoruTIWcKs8UzjDryKJ0XAglB970TCd747ZJJE1RstBzNbpOrp+RPripkut4euEHRTHLtVu8x8MyT+Lh5+C2+3060brvsKsNpYvQVOTvYw91CZFQqtuXntALkW4XxHxNOIk6Khx2l2HyXQ8asWWhPUAXLfpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DP5otf60/2STHoOSeuFVJ4Bsz8XiwqpnjDBe5nG+LiY=;
 b=YIE3Ep8AVe2NPHk2t6+VYRf/+enqu9NkXIF/jk8tk9XEOg4O2d0inPQ82ibHwhxR4dJgOm7h/+/t/rkVDQnS9+kuntPHQmaTmOkE9eB3ZDZTmBcxmmwYZY3c3r0H6OeDXPojPE3FfNJ+b5QuL9QJlWUTl1z5fIzQJKWtaqUxN7Uc2ap6oKXyIkzQQ23mF5toABSYABpGoU8+XvynXjCQYOtunoDokknhjUb2dYU0QC1hLr7jurEiGIFrFUXMbBxX3EmBi5cuX1dIYC6ugG2UANO2slUiD7kW4f6CEeImrW1RbymgO++eQ693NK/1zklDo4QAC/lDjzjqwT+ePKFL5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DP5otf60/2STHoOSeuFVJ4Bsz8XiwqpnjDBe5nG+LiY=;
 b=hYZHGzj0RCwbEIfTKEkFzlMsWeEKCN+XlGce2iSqsOHZ2vFL29JEPQ7fTIgapdFdXqso3V7EhIT/LTdADtIEBIjacF7QRTxFh5iVHb6CNaSYEGU2kcNetenRilom5QxZHynfpa5poYHdLEMsPC/GPF7RpWTtXDSTCNdb1mqY5/Av1+gTvaJXaT3CaqobWz+jiEWlqPG132StGGfd9u84Vg0/Dtq5Ut/7tKfaIOJznCt112UXsLLoo53oWVRJjEKMMoi5wHRUDB2T20DCg1ACX8+Fz6aVrMUkoQeIiZgTahcx5EbnGcgsjP9yn07W7THCyn6i9qex7jGEHxoIUhs4sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by MN0PR12MB5908.namprd12.prod.outlook.com (2603:10b6:208:37c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 01:41:32 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 01:41:32 +0000
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
Subject: [PATCH v4 06/13] gpu: nova-core: Add bindings required by GSP
 sequencer
Date: Wed, 12 Nov 2025 20:41:12 -0500
Message-Id: <20251113014119.1286886-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113014119.1286886-1-joelagnelf@nvidia.com>
References: <20251113014119.1286886-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0019.namprd11.prod.outlook.com
 (2603:10b6:208:23b::24) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|MN0PR12MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: ed9f3151-afe9-4d91-d47c-08de2255c619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3a8GbqvYnm3uoZ+QCOblZ33EZq/TALUmc5Y6pgi3K80S4toDLE//oj7TsCOB?=
 =?us-ascii?Q?N5Y8bQlOa87puUXvukZawXbnx0vzxLLzEYYm1KyPTG69HH3XBaFE7/NVhep+?=
 =?us-ascii?Q?nv24KYvAg+857v1uLuwKe1tlR0WQ1d92OiNrKX7Wac17LCe1U5vzF9ZRLkgN?=
 =?us-ascii?Q?NxML6YnUnhi8KQP1jS3x5IgIa4ke2cuDRJA6TW9k1OYlnBTujmK9ZilUChdO?=
 =?us-ascii?Q?tA9D96rTj0HTPFxpWcFSfVQ54bYTt12+DqvDnVqwH1b7ZSEDaO4DyuPzsGu0?=
 =?us-ascii?Q?74OSznjUCffZtkXiZkVcc7YugkDvCYPe6OoiW09xbEJzDAKXHeg2DZuzZsZM?=
 =?us-ascii?Q?FL6aCtdnDJwqehmRE763I1yTW9aTM73cZLafB28+KOGkSl28zYnc4Df8B1sr?=
 =?us-ascii?Q?ek70BNKkKe3O222b0qWjDV53pymP2JEvzEHQk5g2AlmYyd6+ioXWztZQ3zuO?=
 =?us-ascii?Q?2+74B3fmR+brHrIdsg+2nUi88HVAj5RairE0Ng+r+rivqzbKt8ZTTZJQ9ezk?=
 =?us-ascii?Q?uTNb1dF4KnFXed3/dzpZmx47A7/p8Xd6P+H+DQin/4iMG9bOdDSbOjekzWCs?=
 =?us-ascii?Q?7xv2BF5jYB4QlGjG+PULl3FmKDurxhKYiz5MFAbtYreQa1NRxDeT0BMh89Y/?=
 =?us-ascii?Q?WOwaSMcHX5Gcm5GbjoKss0srMtOvetYXViYKq9AGnBW1vzVtuDnneRLU8zNe?=
 =?us-ascii?Q?onkeuwIpgeuzKWTzMzHOAdZ+0STZFR7IDWVg1N9wrDxnxn+Wqxqj/xzw9kJ3?=
 =?us-ascii?Q?ckwHoYIqxTgB5gK9vPR003xxcPCAc7htly1Mp7xZcs/pZlAGs1y/AApf6woC?=
 =?us-ascii?Q?amF/zvZ2F4iORU300C+iOJdpUISyYGeK3VkCdqECJFoCP203WwHmeflCElsS?=
 =?us-ascii?Q?rZoA+VtPIqHNXHTR5Tc5eje7z6Q4MPhad1tCMrRjblHNylMM3/VAdKOpLhR8?=
 =?us-ascii?Q?BUiCA5l/eTwg98futzNsG8ctGFVWRCiRQDVTWGH8wJwk7TJ7IPsOZUZptYt8?=
 =?us-ascii?Q?EZeO+4LpXC0LwQkgCh33Ky3hv5Z3C2aHKIo8eVRLgR8NOczvAP0NOIiEzo3O?=
 =?us-ascii?Q?+CUNfx4ZzDNu/iYFckpQ8T2yVckDS7T2FT+aRXkJcO9t/mSqK0DlNmt5gLXW?=
 =?us-ascii?Q?ODFPIFBkQtbJPnj41xwMxjeUhNPGau2nsMF43KYiQSxZc7yQG6s2/cnFHFIh?=
 =?us-ascii?Q?3p4bSiCb9kHfgzrCRhsfyuiAV9YJ4hc4Z5bKCrz6NRz+wqFlS9kqvBpYaCNJ?=
 =?us-ascii?Q?+sWJnawCARSk/5bRVhdtNnLX8bxdR4n95Bq63fSfN7uEzPdEjtBqt9BomKf3?=
 =?us-ascii?Q?ce8IMEvrc4FBFVOg+6pZzvKwpL9qxjYRymUL+cFEQjXGWw3jEa3/OpykSqLW?=
 =?us-ascii?Q?7gsZqDkBBWrGWjVYfpqqXNuWVqCcpjXtHHcDz0J70Jwz4s0ic2wc87Dtl4UZ?=
 =?us-ascii?Q?TtVUyedW2pjE4n+8DnSwbHc9vGUE4Twv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aR4neDAtwh752GoK0Z0oBMfWSKiTWYGGWyz2bxfFI8AGGjrs7yKkPGPnFqQZ?=
 =?us-ascii?Q?7K0VGHM4+EOD7DeKzJ6MUI81nD1Z+6TsqPMw2KmYSVFuT2LZ8tNfB75SJFNr?=
 =?us-ascii?Q?W9oag3VecGMiyGjqnQAg0Ao8tKF5zaZWUF4/fRIqeGvh+oLiKjDQemurjiOB?=
 =?us-ascii?Q?fBWSBnDWIPTI6A77vT8uLSonhI9sJ6DhE5/sgslHdkRevnQhT/vUOaYOFuO3?=
 =?us-ascii?Q?+HZxucCF6UjJnB4t4wCX4KJqktZed9PrCzrDnPD9Fbar9Ijh/rpnf6btccTd?=
 =?us-ascii?Q?9DSO5uPbPs0G4FMJrH5twYuLgPYkWV0Ko5yecISY2iaPBxOGwjpljLr8JpeH?=
 =?us-ascii?Q?KQYGe2rSr73MN0IBAdJZ6hEUwvEdLPx2cKnD1P33mTxGjcv9Rv7XYYanmnvB?=
 =?us-ascii?Q?MwSZNDEwnR6uv1WZPmzAqhBv0Awj/if7CTKfzU5tUPM7EeYynoPqqr2Ntat9?=
 =?us-ascii?Q?aaet1JGPMjbO4AXftOiwKEKPM0om3/fCArAr1wKag6ALyvYiTGgIYd1lrRH7?=
 =?us-ascii?Q?09RWKC96WC3dwJSJl6UBeMGXtjhPIeTiarjW3y4ZzB8GDm0Rv52IvaarDPPz?=
 =?us-ascii?Q?Rykt41dq6qmXgd5SJLyNuR/MjFoQJjVMYYarkFBUUy8agJq+TyJZ1W4whHtt?=
 =?us-ascii?Q?p2Dq60DEFzjyC+sW+m4HBH607zv6j2PV7y8sjqWf7P2meoSBEnl0aoylViZD?=
 =?us-ascii?Q?US9xGI0PSolQpB8XxNMxAGzKVFgPpNjYi5geT3xOgwjgzIUBqtm8pzF5qPCI?=
 =?us-ascii?Q?5X9RKMFSX3uEkvidx1ZccH131oomu3Ov7pmkRAqyklXVs4duKL7fukqGe4kP?=
 =?us-ascii?Q?6pcPrRwqD3/TAsJB1OiRp72ntmmubC4W/4jUS7/4QfxkP0pljOrb9W6IsaoN?=
 =?us-ascii?Q?Zn/ZFICEMCgBqVE2gHbDOXubf09ZK4BoX2aXDf8fblw8dA9R/BRAMjxUpAOd?=
 =?us-ascii?Q?cdmwVOZxjPhQz33g2YQETYyuHq0ykbXQGS4Lv0GiCukG7caSsNHbgXsUPW7L?=
 =?us-ascii?Q?yxXOGpMRSOKwHzmw9yup8xtRjTU5l6saHVad3ojDlPRg24YKUhakKaqm3cFH?=
 =?us-ascii?Q?D9R6WzzOQNHij6eZDyZUhz0+Burq/3ySTlEAvovRWFpVCD/X0DZfBA0iimSX?=
 =?us-ascii?Q?XVyjgx4jtfuPXDr+N+PELGxMhRJ8vapfupTvDOiSFm5wi5EPzAXDjneX4Qtv?=
 =?us-ascii?Q?Smw2at/beJON+rC1lEteOyPLzu1RR662BQiO65zsTYB4znNDqB3AjGG1Db0E?=
 =?us-ascii?Q?Rw9gEsNK4CM+HPGdkXCdPDtc3uNUOlbCrIRRe06riVMazfg8p7WWHeTU8beH?=
 =?us-ascii?Q?1g7jHfeXzpw1Ve38x/O9zWc8Y2urM8EMUqVSW2pu1KfV20rZxKMXfDbsydV+?=
 =?us-ascii?Q?zZSFRooJiI+LybCK70bjh68XuL0TaKZP164m4jC2SaR9q7fLnhopV1YOSEOu?=
 =?us-ascii?Q?1bPkXpMW0HGjyvtzhwWy/xYG/IYSZtg5p2HsgIga9+iGRgCqagbToAToTXZF?=
 =?us-ascii?Q?ubFMyv0ogQk9Sd0JN4ABrMh5VrvFua/UGlT+NF38WwZfdMkGjNZ1GMzKtyI9?=
 =?us-ascii?Q?4L4XTUj/MO+iKCj6Tmj9Q9RZ7bAZZf3a74pPDfoM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9f3151-afe9-4d91-d47c-08de2255c619
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 01:41:32.5836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyP9nmhXYgUiFKVQoe4WpicluNzuz+CcjJqN6OizBC8fLDlomkSrigXyG4e4Z6D7DuFMN2KOBD7ACMQqREAwxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5908
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

Add several firmware bindings required by GSP sequencer code.

Co-developed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs               | 328 +++++++++++++++++-
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  85 +++++
 2 files changed, 412 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index cacdfb2d4810..05add7cfca44 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -312,6 +312,332 @@ fn from(value: MsgFunction) -> Self {
     }
 }
 
+/// Sequencer buffer opcode for GSP sequencer commands.
+#[derive(Copy, Clone, Debug, PartialEq)]
+#[repr(u32)]
+pub(crate) enum SeqBufOpcode {
+    // Core operation opcodes
+    CoreReset = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET,
+    CoreResume = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME,
+    CoreStart = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START,
+    CoreWaitForHalt = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
+
+    // Delay opcode
+    DelayUs = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US,
+
+    // Register operation opcodes
+    RegModify = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY,
+    RegPoll = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL,
+    RegStore = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE,
+    RegWrite = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
+}
+
+impl fmt::Display for SeqBufOpcode {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self {
+            SeqBufOpcode::CoreReset => write!(f, "CORE_RESET"),
+            SeqBufOpcode::CoreResume => write!(f, "CORE_RESUME"),
+            SeqBufOpcode::CoreStart => write!(f, "CORE_START"),
+            SeqBufOpcode::CoreWaitForHalt => write!(f, "CORE_WAIT_FOR_HALT"),
+            SeqBufOpcode::DelayUs => write!(f, "DELAY_US"),
+            SeqBufOpcode::RegModify => write!(f, "REG_MODIFY"),
+            SeqBufOpcode::RegPoll => write!(f, "REG_POLL"),
+            SeqBufOpcode::RegStore => write!(f, "REG_STORE"),
+            SeqBufOpcode::RegWrite => write!(f, "REG_WRITE"),
+        }
+    }
+}
+
+impl TryFrom<u32> for SeqBufOpcode {
+    type Error = kernel::error::Error;
+
+    fn try_from(value: u32) -> Result<SeqBufOpcode> {
+        match value {
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET => {
+                Ok(SeqBufOpcode::CoreReset)
+            }
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME => {
+                Ok(SeqBufOpcode::CoreResume)
+            }
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START => {
+                Ok(SeqBufOpcode::CoreStart)
+            }
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT => {
+                Ok(SeqBufOpcode::CoreWaitForHalt)
+            }
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US => Ok(SeqBufOpcode::DelayUs),
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY => {
+                Ok(SeqBufOpcode::RegModify)
+            }
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL => Ok(SeqBufOpcode::RegPoll),
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE => Ok(SeqBufOpcode::RegStore),
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE => Ok(SeqBufOpcode::RegWrite),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+impl From<SeqBufOpcode> for u32 {
+    fn from(value: SeqBufOpcode) -> Self {
+        // CAST: `SeqBufOpcode` is `repr(u32)` and can thus be cast losslessly.
+        value as u32
+    }
+}
+
+/// Wrapper for GSP sequencer register write payload.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub(crate) struct RegWritePayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
+
+#[expect(unused)]
+impl RegWritePayload {
+    /// Returns the register address.
+    pub(crate) fn addr(&self) -> u32 {
+        self.0.addr
+    }
+
+    /// Returns the value to write.
+    pub(crate) fn val(&self) -> u32 {
+        self.0.val
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for RegWritePayload {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for RegWritePayload {}
+
+/// Wrapper for GSP sequencer register modify payload.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub(crate) struct RegModifyPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
+
+#[expect(unused)]
+impl RegModifyPayload {
+    /// Returns the register address.
+    pub(crate) fn addr(&self) -> u32 {
+        self.0.addr
+    }
+
+    /// Returns the mask to apply.
+    pub(crate) fn mask(&self) -> u32 {
+        self.0.mask
+    }
+
+    /// Returns the value to write.
+    pub(crate) fn val(&self) -> u32 {
+        self.0.val
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for RegModifyPayload {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for RegModifyPayload {}
+
+/// Wrapper for GSP sequencer register poll payload.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub(crate) struct RegPollPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
+
+#[expect(unused)]
+impl RegPollPayload {
+    /// Returns the register address.
+    pub(crate) fn addr(&self) -> u32 {
+        self.0.addr
+    }
+
+    /// Returns the mask to apply.
+    pub(crate) fn mask(&self) -> u32 {
+        self.0.mask
+    }
+
+    /// Returns the expected value.
+    pub(crate) fn val(&self) -> u32 {
+        self.0.val
+    }
+
+    /// Returns the timeout in microseconds.
+    pub(crate) fn timeout(&self) -> u32 {
+        self.0.timeout
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for RegPollPayload {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for RegPollPayload {}
+
+/// Wrapper for GSP sequencer delay payload.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub(crate) struct DelayUsPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
+
+#[expect(unused)]
+impl DelayUsPayload {
+    /// Returns the delay value in microseconds.
+    pub(crate) fn val(&self) -> u32 {
+        self.0.val
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for DelayUsPayload {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for DelayUsPayload {}
+
+/// Wrapper for GSP sequencer register store payload.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub(crate) struct RegStorePayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
+
+#[expect(unused)]
+impl RegStorePayload {
+    /// Returns the register address.
+    pub(crate) fn addr(&self) -> u32 {
+        self.0.addr
+    }
+
+    /// Returns the storage index.
+    pub(crate) fn index(&self) -> u32 {
+        self.0.index
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for RegStorePayload {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for RegStorePayload {}
+
+/// Wrapper for GSP sequencer buffer command.
+#[repr(transparent)]
+pub(crate) struct SequencerBufferCmd(r570_144::GSP_SEQUENCER_BUFFER_CMD);
+
+#[expect(unused)]
+impl SequencerBufferCmd {
+    /// Returns the opcode as a `SeqBufOpcode` enum, or error if invalid.
+    pub(crate) fn opcode(&self) -> Result<SeqBufOpcode> {
+        self.0.opCode.try_into()
+    }
+
+    /// Returns the register write payload by value.
+    ///
+    /// Returns an error if the opcode is not `SeqBufOpcode::RegWrite`.
+    pub(crate) fn reg_write_payload(&self) -> Result<RegWritePayload> {
+        if self.opcode()? != SeqBufOpcode::RegWrite {
+            return Err(EINVAL);
+        }
+        // SAFETY: Opcode is verified to be `RegWrite`, so the union contains valid
+        // `RegWritePayload`.
+        let payload_bytes = unsafe {
+            core::slice::from_raw_parts(
+                core::ptr::addr_of!(self.0.payload.regWrite).cast::<u8>(),
+                core::mem::size_of::<RegWritePayload>(),
+            )
+        };
+        Ok(*RegWritePayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+    }
+
+    /// Returns the register modify payload by value.
+    ///
+    /// Returns an error if the opcode is not `SeqBufOpcode::RegModify`.
+    pub(crate) fn reg_modify_payload(&self) -> Result<RegModifyPayload> {
+        if self.opcode()? != SeqBufOpcode::RegModify {
+            return Err(EINVAL);
+        }
+        // SAFETY: Opcode is verified to be `RegModify`, so the union contains valid
+        // `RegModifyPayload`.
+        let payload_bytes = unsafe {
+            core::slice::from_raw_parts(
+                core::ptr::addr_of!(self.0.payload.regModify).cast::<u8>(),
+                core::mem::size_of::<RegModifyPayload>(),
+            )
+        };
+        Ok(*RegModifyPayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+    }
+
+    /// Returns the register poll payload by value.
+    ///
+    /// Returns an error if the opcode is not `SeqBufOpcode::RegPoll`.
+    pub(crate) fn reg_poll_payload(&self) -> Result<RegPollPayload> {
+        if self.opcode()? != SeqBufOpcode::RegPoll {
+            return Err(EINVAL);
+        }
+        // SAFETY: Opcode is verified to be `RegPoll`, so the union contains valid `RegPollPayload`.
+        let payload_bytes = unsafe {
+            core::slice::from_raw_parts(
+                core::ptr::addr_of!(self.0.payload.regPoll).cast::<u8>(),
+                core::mem::size_of::<RegPollPayload>(),
+            )
+        };
+        Ok(*RegPollPayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+    }
+
+    /// Returns the delay payload by value.
+    ///
+    /// Returns an error if the opcode is not `SeqBufOpcode::DelayUs`.
+    pub(crate) fn delay_us_payload(&self) -> Result<DelayUsPayload> {
+        if self.opcode()? != SeqBufOpcode::DelayUs {
+            return Err(EINVAL);
+        }
+        // SAFETY: Opcode is verified to be `DelayUs`, so the union contains valid `DelayUsPayload`.
+        let payload_bytes = unsafe {
+            core::slice::from_raw_parts(
+                core::ptr::addr_of!(self.0.payload.delayUs).cast::<u8>(),
+                core::mem::size_of::<DelayUsPayload>(),
+            )
+        };
+        Ok(*DelayUsPayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+    }
+
+    /// Returns the register store payload by value.
+    ///
+    /// Returns an error if the opcode is not `SeqBufOpcode::RegStore`.
+    pub(crate) fn reg_store_payload(&self) -> Result<RegStorePayload> {
+        if self.opcode()? != SeqBufOpcode::RegStore {
+            return Err(EINVAL);
+        }
+        // SAFETY: Opcode is verified to be `RegStore`, so the union contains valid
+        // `RegStorePayload`.
+        let payload_bytes = unsafe {
+            core::slice::from_raw_parts(
+                core::ptr::addr_of!(self.0.payload.regStore).cast::<u8>(),
+                core::mem::size_of::<RegStorePayload>(),
+            )
+        };
+        Ok(*RegStorePayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for SequencerBufferCmd {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for SequencerBufferCmd {}
+
+/// Wrapper for GSP run CPU sequencer RPC.
+#[repr(transparent)]
+pub(crate) struct RunCpuSequencer(r570_144::rpc_run_cpu_sequencer_v17_00);
+
+#[expect(unused)]
+impl RunCpuSequencer {
+    /// Returns the command index.
+    pub(crate) fn cmd_index(&self) -> u32 {
+        self.0.cmdIndex
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for RunCpuSequencer {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for RunCpuSequencer {}
+
 /// Struct containing the arguments required to pass a memory buffer to the GSP
 /// for use during initialisation.
 ///
@@ -566,7 +892,7 @@ pub(crate) fn element_count(&self) -> u32 {
     }
 }
 
-// SAFETY: Padding is explicit and does not contain uninitialized data.
+// SAFETY: Padding is explicit and will not contain uninitialized data.
 unsafe impl AsBytes for GspMsgElement {}
 
 // SAFETY: This struct only contains integer types for which all bit patterns
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 32933874ff97..c5c589c1e2ac 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -664,6 +664,7 @@ pub struct PACKED_REGISTRY_TABLE {
     pub numEntries: u32_,
     pub entries: __IncompleteArrayField<PACKED_REGISTRY_ENTRY>,
 }
+
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct msgqTxHeader {
@@ -702,3 +703,87 @@ fn default() -> Self {
         }
     }
 }
+#[repr(C)]
+#[derive(Debug, Default)]
+pub struct rpc_run_cpu_sequencer_v17_00 {
+    pub bufferSizeDWord: u32_,
+    pub cmdIndex: u32_,
+    pub regSaveArea: [u32_; 8usize],
+    pub commandBuffer: __IncompleteArrayField<u32_>,
+}
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE: GSP_SEQ_BUF_OPCODE = 0;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY: GSP_SEQ_BUF_OPCODE = 1;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL: GSP_SEQ_BUF_OPCODE = 2;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US: GSP_SEQ_BUF_OPCODE = 3;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE: GSP_SEQ_BUF_OPCODE = 4;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET: GSP_SEQ_BUF_OPCODE = 5;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START: GSP_SEQ_BUF_OPCODE = 6;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT: GSP_SEQ_BUF_OPCODE = 7;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME: GSP_SEQ_BUF_OPCODE = 8;
+pub type GSP_SEQ_BUF_OPCODE = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
+    pub addr: u32_,
+    pub val: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
+    pub addr: u32_,
+    pub mask: u32_,
+    pub val: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_SEQ_BUF_PAYLOAD_REG_POLL {
+    pub addr: u32_,
+    pub mask: u32_,
+    pub val: u32_,
+    pub timeout: u32_,
+    pub error: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_SEQ_BUF_PAYLOAD_DELAY_US {
+    pub val: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_SEQ_BUF_PAYLOAD_REG_STORE {
+    pub addr: u32_,
+    pub index: u32_,
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub struct GSP_SEQUENCER_BUFFER_CMD {
+    pub opCode: GSP_SEQ_BUF_OPCODE,
+    pub payload: GSP_SEQUENCER_BUFFER_CMD__bindgen_ty_1,
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union GSP_SEQUENCER_BUFFER_CMD__bindgen_ty_1 {
+    pub regWrite: GSP_SEQ_BUF_PAYLOAD_REG_WRITE,
+    pub regModify: GSP_SEQ_BUF_PAYLOAD_REG_MODIFY,
+    pub regPoll: GSP_SEQ_BUF_PAYLOAD_REG_POLL,
+    pub delayUs: GSP_SEQ_BUF_PAYLOAD_DELAY_US,
+    pub regStore: GSP_SEQ_BUF_PAYLOAD_REG_STORE,
+}
+impl Default for GSP_SEQUENCER_BUFFER_CMD__bindgen_ty_1 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+impl Default for GSP_SEQUENCER_BUFFER_CMD {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
-- 
2.34.1

