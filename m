Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86D2C3DC2F
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6300010E9F2;
	Thu,  6 Nov 2025 23:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ViFqeuIs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BFA10E9F6;
 Thu,  6 Nov 2025 23:12:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLGqVGBRiVQ0lDSZKc6riof1nxuMbQdJp5KUAjVSTJdyYs252B/P7kogV0HXNAjYU6DZoX/K02OWzxrGPwWlY5Cz4c712hLpKiGLWk6a/LzPQZk3FSh9hFwUiO7+EeUnVKAjbBv6H24qJR5cVaT2q9INYNeQeij7Nitz8lepqko2MK1IqlV6DU1MZ3Jg6MljfoZfmkOGgqMky6gvrqYCQy0xiV129pGsNXXhWMCal+AnHT7O2ybc6Y99jALoOES1z7eaHT/+Rfbj8bMoNvrB6WFi9Ro+MEWLkZlD7pfZAVmMyXHpFTn0589oA4D/t8am9MhoONTnJJWyR4pzcdRL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPPO9eRjXEejcREJ1vM57xGhXti6IWGp5k7c2LW53aw=;
 b=woAKSMDLwDMC2DNh6zdR2C3HWD2Iai3MksJE/lk7iFtII6I3vsjXwwLQWUq/g77O7B6sOzsrzCOMeQecb/szba43CBNHsdT/1TrG35KlLao2nhtvMndPRpvoRMV3HO0Sq2tnSgPrjROOjs3/tZj6B7ZQh5XNn8yChFlSIbFICyGgzSDTwnKOVzUB4o0o2Cr6E7XMavmrQwxgDBg6+8K+t0bLxEeotcV8qk+F/kGaAd4cMEME03YLkfdSVLOpN5s4LWNuVHWhgl8sKVnk0FkO6Yz0bjUtgNMkUQ/WAU2wfzg7ngGtaJnSTFvEBvAN+8eklzJgMmcA4sUxk1A9xFRijQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPPO9eRjXEejcREJ1vM57xGhXti6IWGp5k7c2LW53aw=;
 b=ViFqeuIsc8lMZ4mCLmJFl7WPQgakSuyZrBNlM3lcGA7FlC8B02A6AzN22P7jnSgiIBnKe5byGNjA7JTdfN83/+SjJWFABeSM1y2FeNoe2bb8HUnSINmFj3zxgQ8LehQEAWD72vjsmasEwNS6niuJEPn5Yipa4FZuvzMGpaJL9+Gaj19DkgyHlUZPqKI0TmhGg93S5TlHA2PDOXSTOPeBYJo69x+0t3Qf2uOB/bgtqsBzkGod90l1a525xWZ6EAdbyg5cDIZRwO5z25urSCJUopUezz7CPpp4L9UBRf7v1Rucb7qlCpXyUiAxmpSk33AMMI3vr7llvugNAuKGFH2KLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BN7PPF62A0C9A68.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 23:12:13 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 23:12:10 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
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
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH v3 09/14] gpu: nova-core: sequencer: Add delay opcode support
Date: Thu,  6 Nov 2025 18:11:48 -0500
Message-Id: <20251106231153.2925637-10-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106231153.2925637-1-joelagnelf@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:208:530::34) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BN7PPF62A0C9A68:EE_
X-MS-Office365-Filtering-Correlation-Id: 3375472a-ed99-41c6-8ef9-08de1d89e9cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iOx16Xz0HtssUBmFhPfl0G2Ya1qDYWD887+ccXU7j148yMxReLk+vNlmDsEX?=
 =?us-ascii?Q?4A3qTIstPKI5gXEZKitxVjBtPIzkdM4qi9P+Pd58tgCKVrXQnvm9WRcp3e/F?=
 =?us-ascii?Q?gyy01D5R++EcAtfVB+pRH72nMlvlZPOctstM5fpxDkFzrKJkL6f8NaPQG53L?=
 =?us-ascii?Q?xIX06hunRVLW7M5MLah8qSKpXI9k6knzHfbBQSsdoExSaZnaCSfXErJTN1rE?=
 =?us-ascii?Q?mVRtkyeGrn4MlhOVjkNjQB45o6AaC2MbG2O5WAHWMerIQnxdYk5nTdEeHNKH?=
 =?us-ascii?Q?uF6+jYxuZXmlrb4rd4+bt7d1NP17ZMMV5H6Pnq3r852GVe6O1WUvZEVkT0hA?=
 =?us-ascii?Q?rSrUnSN6lntHEBvMYo40i7MEib0X6uVpZwAfw9FlgncBtP80NRv+k8t/EEHg?=
 =?us-ascii?Q?vsWTY5gKrYEyXGdjKM9nMMUjcBxzFEwOGqlHOy0eBhkik9y1LLtJ4cp/2ho3?=
 =?us-ascii?Q?DgDRgcTEDxeJGhirv63RmbuP821LkkHelKf3/zpKtnq03JaLJmR1UVEFHYp2?=
 =?us-ascii?Q?cb8MULGGtbnVggQ1926Xpw9ZICu6amKOQlqorHkThw2QGBI6Hn9X+jqG6VXg?=
 =?us-ascii?Q?AZIhOk8v9kk7HQ0DzQRIwhwfr/4iHVuw18q2fbDyiFLHY4ukeWuQ9mMJ6tte?=
 =?us-ascii?Q?6mdZEIYDw+zry3hgDZ3O0hfEk3ytMgTqtKWy7CDMeD0zHlu7sJCrxtJLLdUP?=
 =?us-ascii?Q?Dit8nsZdjhJ15Sx9JYD8hP21sgvMDvoyyHZE0vdhDob17aPm/9L0GobBrJtb?=
 =?us-ascii?Q?7TUHjO/wvQmzFifhaLKq6rHpacH9IKvBw4fsyQnJonSZNL2aiXv4T4c8AKRl?=
 =?us-ascii?Q?Rf7pVuwnT3nM/TK+WTw5ENmbBu0FVAl0BqCBf/e/Kz4+2GJCE9mRZsvcja6d?=
 =?us-ascii?Q?UXWTMJkDZRfXjy+HslllIZlbjr0CY2UqczXUodq4fmlvBFi/uWQZet+CL2+F?=
 =?us-ascii?Q?f2mvt7Ktw/Nxxcw6KiSQWpjzm+HQH1leiqRW7ZGu53eRDYUOaOYJ2vXDm8EM?=
 =?us-ascii?Q?V0Xb9kQ4pW4ulLyPZ6lYJpPsh+0rOBsC1N7dAFUsSe2OzpeYt2mDIAx0oIA9?=
 =?us-ascii?Q?jpFa/bnw6hKfI2DS1bcHjFhlOxYSSBYy8fMvngcwlfkgnFXjDR0RASWypUMh?=
 =?us-ascii?Q?d35BJj5SssjlHTLiy2E0CDnDhLhsfeobgo4Rbb4CfZbshSrNG8GmmqzK5qXB?=
 =?us-ascii?Q?DB4cQjuiSeDWELhAL1tw5jlpzHOjvnt4llK92EEaXFtPG3yxtAAcq5GpCZza?=
 =?us-ascii?Q?8bPyU2b/B02NHGCxuy4bwa8bhlvQjsg1w9UjSnDNnWKjGPDZSYuwl0CdBc+m?=
 =?us-ascii?Q?vOicL3XEW48XXh1jX4HAWbfyMssoHZl3M4EhsDHjfqAbhUUvzwx085wXWyG+?=
 =?us-ascii?Q?ZBLs25tNdARtXH8VeUzWkqIh9YZiLVpuQIaagUVdnNhE5nsSAtO7pIeorJSu?=
 =?us-ascii?Q?oDXnAgafeey6klylIflhuEgRrjYtrtCg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oIutuLE23OdMzyB4ZnDVR6ObIp3rf2lzrrC2exid0VezxpIjHrnoWtCX1v0k?=
 =?us-ascii?Q?tiDUyxiTsu1s21CCSzGroNtrdNqkAXf3XLh5TgSK3igVYbKUhprjsQ58PfXf?=
 =?us-ascii?Q?km4IVYjWzf8zm1BT0EzLQGJ6u62bjsLz3UeqmHjaYwiTcnp0weRWN5o2UgWY?=
 =?us-ascii?Q?562RiW+KA1qYyTL/OOv5UhD9jjCKk2utIEbYsjTx5sKGnwwWbeE1rcvM9fJV?=
 =?us-ascii?Q?uCCFQZXjPAbTS/AwS/y06ExtiIKKR3Qv9FD6I1BByeAajGIfa9r5ZWDH15Lo?=
 =?us-ascii?Q?IC0XiWW5mOPzBwyoVIRo1w9QvLPUiR0M1MFtZCevuiiJwxkY37adYdvd6X5X?=
 =?us-ascii?Q?nRP6WVVWlyCr2AXJV1rRacyw8HhWphieK074hVdhbb7dF9Twn3wuYFsZ/8o9?=
 =?us-ascii?Q?r68yLhcILf1Ohp8IFpI17PRMy4qen9XJz9uoOqgZ5s97NWVZK6vehh29U+Ke?=
 =?us-ascii?Q?Ax0QIb5K9i6BjvRz5wCE2aPIho6j7asbaSsAF0ndpDDVfs65h2sl61R3nAqd?=
 =?us-ascii?Q?Kl13/lHv3OWMG+jfKabYIKySJHlxKlXqUQS76yISCBgwek1uDkdscFEBhjL/?=
 =?us-ascii?Q?e7htR6iUu5+Ep4O0V0jQ9liJRtOlN1Htfrzt4YlXv6UZTxXcqviegOrW/Gyv?=
 =?us-ascii?Q?FgeRd2+chhn374ee5cm7p1R3sePkXWxZE2czJ8EGTFyBNwo26CMY67c9KU6k?=
 =?us-ascii?Q?t3LNXNkwIRNVgAqNgT0c/pKRtvkcv0AvVXTYp6boYM4pfPs7O78U1vdeMuw1?=
 =?us-ascii?Q?eyjWVysrN4yoej4WtzGZ7InXFgthbf6a4do7yR7RJn/45BVFMmXcBuUwCyGq?=
 =?us-ascii?Q?Z692bTu+K764qQDLrZDNDxLoWhpKoxlok1E1ZcilXapXb2zWSSz4cBavVFDa?=
 =?us-ascii?Q?x/KP3Ta01dOfvgsSQ16E84mTuNi1hJN7wFeRQjVq7Cyu4lb9dqIdjZxlTJF/?=
 =?us-ascii?Q?8YjUkVhT5+lxOwp6eNnAHLddRlmU73B4xfZ3Glswdj4IlPUYFlCrcPmv5EdA?=
 =?us-ascii?Q?h0t7YOuPhusLyT0+g0Omwpiz3ZTMgtZa7jKq38gWm7n+nc7Q0WdBxHtaWm7G?=
 =?us-ascii?Q?MkKOipEP5h/6QQldxf3vsbX10qt9XtFpd3zXyi075JGn9y5/LNmG2bWHUnaV?=
 =?us-ascii?Q?XY1xbprD5Z0UQFqtKyTJPB6G78HzUk6CYUy3W/g3Snhmbj2GoVIMyvd3nbFf?=
 =?us-ascii?Q?VFMpHRFQHKUTGeVbjixRnuTTylTtuz5toIGxXh3mSAOXbo0NU+zH0Xiq7Xva?=
 =?us-ascii?Q?683O76FN7LpHTHNRefvrQh8j5JBdrcCO52lOPmkyvStkP10awuzreZpxCISz?=
 =?us-ascii?Q?IWCuXy2BRwY2VFzfWng/skUQvJd1JfLeECoreC29mUM8+Y9UOeSEh19n/fbA?=
 =?us-ascii?Q?lg6AE93Obovk2tTv8KjQTrmlpxGJzxchF5g2i5sJCNBkUNcQYgbInFUnL9m/?=
 =?us-ascii?Q?d7lorIlAvztfWkVJqOeZHB36OHlY5PzZp7EatpS7DBgORAbJ9AReA5v8qwZx?=
 =?us-ascii?Q?6frkBxCqY1XJ11wFoq4Q/ZPKHigBiNRUIiM0VtNx3KPuuUXsQrmltoyUXh+2?=
 =?us-ascii?Q?0CNqKYETdPiq7dyuZHvGUuZbL3An7sQV7JlOmFa0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3375472a-ed99-41c6-8ef9-08de1d89e9cf
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:12:10.5196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPyTJgS6Ikrg+mGmxJ19NJlM07MKO8vy9CA7hUV0+DjVLqjYcOc+D1BqfZSRCiBtDYhmYIEbL6UBhlP5gNuVXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF62A0C9A68
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

Implement a sequencer opcode for delay operations.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/sequencer.rs | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 32a0446b8c75..17118967a8d4 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -4,6 +4,7 @@
 
 use core::mem::size_of;
 use kernel::alloc::flags::GFP_KERNEL;
+use kernel::bindings;
 use kernel::device;
 use kernel::io::poll::read_poll_timeout;
 use kernel::prelude::*;
@@ -46,6 +47,7 @@ pub(crate) enum GspSeqCmd {
     RegWrite(fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE),
     RegModify(fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY),
     RegPoll(fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL),
+    DelayUs(fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US),
     RegStore(fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE),
 }
 
@@ -65,6 +67,10 @@ pub(crate) fn from_fw_cmd(cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Result<Self> {
                 // SAFETY: We're using the union field that corresponds to the opCode.
                 Ok(GspSeqCmd::RegPoll(unsafe { cmd.payload.regPoll }))
             }
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US => {
+                // SAFETY: We're using the union field that corresponds to the opCode.
+                Ok(GspSeqCmd::DelayUs(unsafe { cmd.payload.delayUs }))
+            }
             fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE => {
                 // SAFETY: We're using the union field that corresponds to the opCode.
                 Ok(GspSeqCmd::RegStore(unsafe { cmd.payload.regStore }))
@@ -96,6 +102,7 @@ pub(crate) fn size_bytes(&self) -> usize {
                 opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY>()
             }
             GspSeqCmd::RegPoll(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL>(),
+            GspSeqCmd::DelayUs(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US>(),
             GspSeqCmd::RegStore(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE>(),
         }
     }
@@ -159,6 +166,21 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
+impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        dev_dbg!(sequencer.dev, "DelayUs: val=0x{:x}\n", self.val);
+        // SAFETY: `usleep_range_state` is safe to call with any parameter.
+        unsafe {
+            bindings::usleep_range_state(
+                self.val as usize,
+                self.val as usize,
+                bindings::TASK_UNINTERRUPTIBLE,
+            )
+        };
+        Ok(())
+    }
+}
+
 impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = self.addr as usize;
@@ -176,6 +198,7 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
             GspSeqCmd::RegWrite(cmd) => cmd.run(seq),
             GspSeqCmd::RegModify(cmd) => cmd.run(seq),
             GspSeqCmd::RegPoll(cmd) => cmd.run(seq),
+            GspSeqCmd::DelayUs(cmd) => cmd.run(seq),
             GspSeqCmd::RegStore(cmd) => cmd.run(seq),
         }
     }
-- 
2.34.1

