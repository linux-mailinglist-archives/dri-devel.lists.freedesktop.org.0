Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD0FB3C1D1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2D010EC13;
	Fri, 29 Aug 2025 17:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pe1rQr+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB7B10E1E0;
 Fri, 29 Aug 2025 17:33:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRyx2sn5UDOGvyY70r1jdvIHNHow6AythWQ3EWI8Avm3iCxcF5HL0HyN0PEIbDHv2d0Hkt7yCUrZf+LRUFd3zMOidtIoazsfgspXcdc4SXi+0jesrBv4MtGFvE0Rv8xoOuLDvYb/v1PM1PUIzDaX9cLpmXsrCRN6f4I0ekkbna7cJJRfBLdSJum3Ta/z1xkbxH7jEb3NP5KuOl2+MlNd5K74xX5WJmwT+bmlyCIDBVZM9Fsm1DW3KlsHYJ0rMfwyfHqcoFGBLcnPa5ddvQgJjm5vmZ1/e7HE5034JgBNzasdNA1Wc0DZ79XRl9w3gLQt+TTgcvAmPi8koXyUI13uNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0AnTk/3rbN29du8ofGxiJYhTDDKxYoOF8E8ttxOHY4=;
 b=PgLAT8h3j2X7NjDVUO2vb1m/vomCzb7RWnE8bO0JYOZqe0zTcbU13vYM04Rw3tffHFMbcgR4R39kmtrPyH6SvH+radT1Ur6hHtBSWiesvZBotvux/r6LT4iNdj4JvCHJu5+nV9nk15iVu7nNP8nEJUpyllWuUiUGRNI4sjDqq0SY3VyqaKBjuznE5m77qotVeZ/shOuyLptKEAZkrCCNuTJfoyVj/tsI3O04HanDHwNmNAzPzy5d2eAb3VEO0H7jXd0Op9ubjN0UHZt4DzKBUxuPxonybh1ULobwjMCwMAAvkcfkRl6JzsjFLr6+17nhaRZaQr5dMxUsj6mb7LBtZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0AnTk/3rbN29du8ofGxiJYhTDDKxYoOF8E8ttxOHY4=;
 b=Pe1rQr+wUGtzgGZ/iks1SajL80k9rNjG+ipCO7G3RWHEtw/HWoVli9SLLZPaxn2nYY1yaJOKyZxKPg3O9NZrpTpp+ugVqVlKiyVpkKRNDjPO8RUt88HtxbnQPVGSgPQxSLsf4aeVEtUfNXLnb2GV9QeATQSwyffbRB3qe+iXi2k8VisUHuRVG304BlDS5KtL5kLlBx9LSvjrOR4R5BD43mo+6t1bb56cVyOoAlJEc9lIP1x0tJ1rQUbfXwKkloHxIx80wn0QBKOE7ZFbSIuRGpOV2dknzdbcfu1YiWVix1gB58qvKTZdYfegPKUeL/EE0YkXYIMTdI4mzVSCttmyiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 17:33:38 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:38 +0000
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
Subject: [PATCH 16/17] gpu: nova-core: gsp: Wait for gsp initialisation to
 complete
Date: Fri, 29 Aug 2025 13:32:53 -0400
Message-Id: <20250829173254.2068763-17-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::24) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: 82046004-c444-424e-ebff-08dde7223017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pF7QwFD43lkKgKE1v01OjmIUmrlm+uXk7LW+r4fnVoXLH+t6Sid4EHjNkOC6?=
 =?us-ascii?Q?esMxuvv63vKEI4F980t4Mq94QmamVYAkgLHpTW34U+PghYCZZUTFMD+MNsAi?=
 =?us-ascii?Q?E7MGEwOvEKVz4Ko9E5E/Z5CjgIFHFuKVu5lnTmj46YtPCfMXUWxQGBA+lsKP?=
 =?us-ascii?Q?aTf9JYZRC8UeF1YICuWFrOENdsnvM8Rqe+7pBW6bcDf/t+22q2hqNQmshGU8?=
 =?us-ascii?Q?AETPcJ9GtdLvS8W9TUa3Wt6cid0zrvuU4KInH0dmAsISF+k7j9wz4rYNqmbu?=
 =?us-ascii?Q?lIVuRjD0TRcE1GKmhLwccfrRmqPc/6kNeh30ooiDhTTASE7+Zevk40ArvRn6?=
 =?us-ascii?Q?C6qEzTVRpxg49RnJLLMdGUDtgIHwdr+t8k1e0MV8vMydzKUQu2DcH5EjKwiG?=
 =?us-ascii?Q?CPvv2qnyYAO6bl0Onzu7XBPYuGkGN8SOIwYKjLW+80rVfZ2sDSlcWaGhRQz2?=
 =?us-ascii?Q?prl6Dl1JuoJlVCToEKXx4iPLjE7FupPTTX4X4uJj1OmYEKmXguner1aOQmJu?=
 =?us-ascii?Q?N5I/sybs7EfGVRwgdXYMJVmmAQmpesgU4+v3bBizOJ/YTq5z+yRMmmOOlsSM?=
 =?us-ascii?Q?0YNOnvXYK+hn6ykI5JEKg73pGcAWtG83PI+jIJz6hPAJ/J03hobiGRVXprJr?=
 =?us-ascii?Q?w2y/h9DhTLbSzuhpbwWzuEUXz5uQa2tYQYehE9n5UR4+smsRijEdlUr9YfQ1?=
 =?us-ascii?Q?FgIiGWtz6bkMP2fs+Zi2kICbUuuQdhKbd8KNNVxnNiG+qlKsYkB1U5ygsFrB?=
 =?us-ascii?Q?o+V8+1mFblly0lxmzH7DG3ZF9ZUfPTJqHLFzY+gFih1cEligP4misTs3fBrb?=
 =?us-ascii?Q?xyvK6MMoUqeOu/++aflXEdVl/DrGiw/I+zsj3oF80lH75xiZSZ51HJzUS/Gn?=
 =?us-ascii?Q?tYQ/Okoft2vjEJ63ufJDLaxN8bJfEUOoO711Vf5Bc3DxOGEdysjOsVfc0wZe?=
 =?us-ascii?Q?2nFYf6loe9VG7034GuKwUW+YWw8BFLpBlWeth9Xs7OXLGap/tnqcyQIrc6wA?=
 =?us-ascii?Q?JT5u92Km+IFHAE3DN14/1TNNFwVPvpjGoPa8yazc/8DyEPmGqnMwjLC0+yqi?=
 =?us-ascii?Q?3v4oNhwI7ZoWOwmpsFxj9FKqxGqnWocIUoI7YlmuA2Xfj7lHJzIjx8ZV8Cos?=
 =?us-ascii?Q?5k60obyz7RRslVsA0ldxPraKrBr4xTpVhTHkcn7vCQ62dm8M6WTHZv34d4zq?=
 =?us-ascii?Q?LwQZOksM96DGNba7XbJPhZfRVk6soNFwL4zY436Y7luYI/HzCLnARLv/qH5G?=
 =?us-ascii?Q?y/OrVEl+Mf+GSM4mkroR8pIEhZ8nD2m7nFiVwd2EkVWX0Y2UiDSQkEcSLkWA?=
 =?us-ascii?Q?CLWn5o8iUyVfQWz9s5/A0CRrYM1nMu+oZSI6Kci+hhR8tM7Y8TaAEWzkOA9y?=
 =?us-ascii?Q?H5QAQ8BTvjVdmnun5Ii80k2uRT42WMxBRh9OsKBJO8rNUQtDkt3Y/RPjMaGS?=
 =?us-ascii?Q?gFJpcoHtsa4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nQuh0n6bpQMsi9AxUItEKktV3PxBXqLeaWrY+Z20glHPFt/Us3yCu4yO67Um?=
 =?us-ascii?Q?L0kAb5dMDQmdYiH6s++F0s/WhJ9v6bkuvJ+m3DrlMYM78qGBz2BoBuHPgI1w?=
 =?us-ascii?Q?XbDgUAAMyzziwi3/3hlv8ODEXS1LW6Ohxjst8lzMXgHfLmKydDytlYMoxlWm?=
 =?us-ascii?Q?MRJrRk2haXcfnanydk2cv8g6zpqigCfHTVI2iLGSRr6UnlDjqSmeILYbf4eN?=
 =?us-ascii?Q?fG/JN7s+NiKBpP9ddFcys1MXp2ReKylhpngHRn3ptuPu4CLPwDuS102lApAp?=
 =?us-ascii?Q?3usMBgCChu7Cm1jFHtLRzt2HrPOJkV09gP4jNeyb1UMsWc3qaedDqMpr7Nto?=
 =?us-ascii?Q?CxX5CBI9DqIpUnmxReeNhw0O/nXOfyFspTbKgkCuBQ/Urmp9ATBZ1PZVSsfw?=
 =?us-ascii?Q?CjVLiLq4dZa4f1J6lNGjgCQbBcwKc661GYlGNu98lWmPxsBVMggrMp8VH4pj?=
 =?us-ascii?Q?RbWOOP2aXEshjVCbboGmKR6Cvz5GuwtVjli7YYjrn9rV1W4DOSV4aXU48dSz?=
 =?us-ascii?Q?H8Ht/4wg+IKi6tUEB3N7+4Vcgm0/1DmKgNxChYPcfqNBm+A98Aw+mizV+S/J?=
 =?us-ascii?Q?6IUEOFjFJwP/fZLnG+utRcGH9E+N4sxCRqoLy5B1j8Wz9HQaZuHyB3vxM0OK?=
 =?us-ascii?Q?bM3T6I9fHKCHZzfobJPJ+R9vIGIFTzHxvn2J327jGw5Y0Pp2aLwTm0lx1acJ?=
 =?us-ascii?Q?Wl1w2BrmPAmXcOD7/vNNoeZnfb2+19ZaX0PRCL3BPbKVnpdr/KxycZth8wHv?=
 =?us-ascii?Q?xHmtBli3LS81kXHlFgMbdkhoMxStJrKJhy2Eezlp2nLH1hkUCPtyB/sFPgc9?=
 =?us-ascii?Q?Z0DI66hpSYdqkE4BVBeOTSXp3CuBusGTC1rVTS6bkoFla8ZvBBBfAisvYekT?=
 =?us-ascii?Q?etNQO24ACgsUkIJhG13fxTb8jD2TC8TDX96Yq24ot0+GB8xdno9vy8DrZeAm?=
 =?us-ascii?Q?ITmFo0Lh3V/0B/SkojacsiBO3tSMZtvuM7JzD/4F0UgLs15SyrTdQMjpaf/p?=
 =?us-ascii?Q?nIU5IKNBjJOBCoXqLirwjVl8JkaVUkhz3z1EyiY4NQv82xFgPFKP6uIf2BA5?=
 =?us-ascii?Q?k4Q5RP4nKvdkY4kwjdXWjoDsG7ecwP/Nh60/8OanyNFWUwpBSCfxsPpQ/4BW?=
 =?us-ascii?Q?SqC4jfZsZPL7GJsZWXQh1SFxxTTTG6Pk95RlABlETnOabMgPOAEVglbLHnoZ?=
 =?us-ascii?Q?vE3iXWuD7Duc+PU6nWiZAPX6s9Dj8cK66zTlKkEFe1JgGhR5ugpuSDIfvU9W?=
 =?us-ascii?Q?xuLdsFjJ1tgVNflnYkTVFZeXc60P71J3K+DGfrDYn8hT9Jb59meAWaZVOg2Q?=
 =?us-ascii?Q?BVC2ZDNhhMTlFx2v8rOZ3scz9yGj7dDJMJbd7coZNA6OgoH1u/E0AjZLZuQB?=
 =?us-ascii?Q?bTVdGbaMfcL490rlPnjxHPoOWqkop/51JplX8gnbGRs+FST/A1RdE4TW3S2F?=
 =?us-ascii?Q?eakJmc3uBAKMW41YY+JmvjudsihZ9LZKYSuZ7wlKkobqRa7eBOIixQnrk7Qe?=
 =?us-ascii?Q?JhJHWEW5LjbCoPIp1YI7gzvKUAaaOPkM2Os3aQQ32bXbsetNBG6FtGX9Yicq?=
 =?us-ascii?Q?sBBGCKPzNfITkVr8g6X/UGDbTNpozpVCU6thd1J6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82046004-c444-424e-ebff-08dde7223017
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:38.0248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvvrI7tyMXrClCRE2MDolED2vena8QGhKmIr66t9wBSqFCdLzWuw3OoIOHJ0wxWrBb+aCmDpDY+Ol8MBUijkUg==
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

From: Alistair Popple <apopple@nvidia.com>

This adds the GSP init done command to wait for GSP initialisation
to complete. Once this command has been received the GSP is fully
operational and will respond properly to normal RPC commands.

Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs          |  3 +++
 drivers/gpu/nova-core/gsp/commands.rs | 34 +++++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index c2a9cb32837f..023bafc85f58 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -10,6 +10,7 @@
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
 use crate::gsp;
+use crate::gsp::commands::gsp_init_done;
 use crate::regs;
 use crate::util;
 use crate::vbios::Vbios;
@@ -375,6 +376,8 @@ pub(crate) fn new(
             Delta::from_secs(10),
         )?;
 
+        gsp_init_done(&mut libos.cmdq, Delta::from_secs(10))?;
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 12ea8cdec21d..9f858aedf853 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -8,13 +8,15 @@
 use kernel::device;
 use kernel::pci;
 use kernel::prelude::*;
+use kernel::time::Delta;
 use kernel::transmute::{AsBytes, FromBytes};
 
 use crate::driver::Bar0;
-use crate::gsp::cmdq::GspCommandToGsp;
-use crate::gsp::cmdq::GspCmdq;
+use crate::gsp::cmdq::{GspCommandToGsp, GspMessageFromGsp};
+use crate::gsp::GspCmdq;
 use crate::gsp::GSP_PAGE_SIZE;
 use crate::nvfw::{
+    NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
     NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
     NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
     GspSystemInfo,
@@ -32,6 +34,34 @@ unsafe impl AsBytes for GspSystemInfo {}
 //         that is not a problem because they are not used outside the kernel.
 unsafe impl FromBytes for GspSystemInfo {}
 
+struct GspInitDone {}
+impl GspMessageFromGsp for GspInitDone {
+    const FUNCTION: u32 = NV_VGPU_MSG_EVENT_GSP_INIT_DONE;
+}
+
+pub(crate) fn gsp_init_done(cmdq: &mut GspCmdq, timeout: Delta) -> Result {
+    loop {
+        cmdq.wait_for_msg_from_gsp(timeout)?;
+        let msg = loop {
+            match cmdq.receive_msg_from_gsp() {
+                Ok(x) => break Ok(x),
+                Err(EAGAIN) => continue,
+                Err(x) => break Err(x),
+            };
+        }?;
+
+        let init_done = msg.try_as::<GspInitDone>().map(|_| ());
+
+        msg.ack()?;
+
+        match init_done {
+            Ok(()) => break Ok(()),
+            Err(ERANGE) => continue,
+            Err(e) => break Err(e),
+        };
+    }
+}
+
 const GSP_REGISTRY_NUM_ENTRIES: usize = 2;
 struct RegistryEntry {
     key: &'static str,
-- 
2.34.1

