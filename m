Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17987C3DC05
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5818410E9F5;
	Thu,  6 Nov 2025 23:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oNv+KDw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013060.outbound.protection.outlook.com
 [40.93.196.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECF310E03F;
 Thu,  6 Nov 2025 23:12:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n49bzD7r9qrM5d7qiuBnANwv7v7fYTdiUxVvVwpFBkaAT1AFoZKrsYq7UfS/aZ1LnKjeIg7+0B0VL7nYwceUGkXNNXWAiMQi8Xda9VwysxzW6zfhRPqJMOBUSoO6//C5FlSHvZCNxErRbXIDWoEAoNPxg4oNt2GaIb38r1jDO5Ef0EwA+RwVBcrUE0lm8acnJXicNNWnrOnYkEUgsINyQGlu24rM3l4fb62zwhDaiuxV7WuDiAyJg7uZ7W3WtFfz+pEeZ+1jzZI+Sx7CMZNC6hf4JCCxgsdZ5t0ZraLcgUhxz5dwpjhorqMQpyaQfhkCWVi0OhuBJKUuv/XkGe9uyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIYWy+mC0lNnj1/80hqyYzIm96H2ezwjzA+s1p9HpOw=;
 b=VeSg4ydQ2xWelnpfHe++Hy989y1nC8qOYOtXU2zzeaplYOTzNUG/x0hOdFL+IrTJtt+BjnLszHiR5IfdTFBg6jD64AnLJoYwoKyomVs0ID2MQLzyxiCnpDej+ieG2G0tOLAAeTueSeRAalrxTbDAwRJB+pqPw1wOIHfXIxsuXSbU1+lip7PyxltpOr0Rxu5Q0usQaBRQuW/x9ECKVS44p9gmGSu9AkkCIKu0HfWSPUOdzOiRi/TQKvrAqxHaJvlqQM3CcHvRQTEEMnaMwOFXglGttU9CaPzmYrXuSiFhqTgRNXGEiUnFg6IkF9xXtPojBFcAJtqhzvooUUTIGqaQGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIYWy+mC0lNnj1/80hqyYzIm96H2ezwjzA+s1p9HpOw=;
 b=oNv+KDw2i68BpIJ+3bH1Tp7hLi/F9kuq2G77qEZ3uGCjx795ZnO5Rj95LSsjy7EhYrYIN1y9VUMPuMEjZKtVkpupIMM2lrwE4ldKWpL1qGHk96ttpWgcvzOcjb5B8Ts4BJlo6HRF+wY+vQbVaeSDm+Dw70za6dxjHfE6tmllPTEGjUncvcnGafSJdAkV2/UEnbHUl2suMXYvC1fG5nRt/3qGAVDAVNq7kLiwo3jlBwhzOodEzeNza6um0hQXq42fidw9+K5+uv2tC9FI09/kRcTLE8gYaCvnF3YBAUq4k+3IBdDHjz10Ew2iQAIGOCOmnIO+ugnsO308yqi1T78Hlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB8014.namprd12.prod.outlook.com (2603:10b6:510:27c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 23:12:06 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 23:12:06 +0000
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
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v3 06/14] gpu: nova-core: Add bindings required by GSP
 sequencer
Date: Thu,  6 Nov 2025 18:11:45 -0500
Message-Id: <20251106231153.2925637-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106231153.2925637-1-joelagnelf@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::16) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: ce93d827-f4fc-4d11-f451-08de1d89e732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UKKWYzGzK6QXwQEu1x15dxdWmgHJ6PS9Oo+/GzOFuTKLvHELgaE6e+XgMUtW?=
 =?us-ascii?Q?uyTHZ7xVYAtjqHuMWmG3QF4WnX56Xw3yw14WuZ9CKcAxokYVEh+ulCEt31tJ?=
 =?us-ascii?Q?3DVee5JWn7N21tpdaRcl7l84dJcclRAMJA0ZuCQ0AayVs7bwOPc+HuffA//8?=
 =?us-ascii?Q?e+oxxyTyIHtiIO5GI4r0Q7EffH5Ik8mlenoKzZ6fw/1q7mhCkd4qstx4Fxgk?=
 =?us-ascii?Q?9VyybsMQgOWIfBAIHtsogMApflIDtM2EqiHHqnmrC1RqmpJcFyLX7yBO5QlZ?=
 =?us-ascii?Q?eRT8NRniVnAsc+drH6eBExG7/5DM0YeDG3TkfLix06Ao/DkFET8I0Q5UVSt1?=
 =?us-ascii?Q?fQK/+WIa59Pvlb+EWEOLkAVahl28vqbsyTuN7NODsDp5D1mncU01oGiSYSbT?=
 =?us-ascii?Q?PgqRlDwX3RRCv7yhxQZr9AFVf4lVgsGnP9OCIsUv38GpxVK5bhgIpDHvdTA2?=
 =?us-ascii?Q?qnt2C8/x90uIBOZUgKcEE6/7hlekFczw6DFn0PeHs4iRu7SC5+fUnCHrc/Ek?=
 =?us-ascii?Q?XvJcGLPxanAuo2VXGg02ZqrcWp+98naSTqElI1YvO/YVUbEXp3OJfrJ6GZka?=
 =?us-ascii?Q?LiOBUNElFqY85ldrUjj0jjcKp11f2T98YC9TBYvbQMTh5ni5rEnqo1QuK4th?=
 =?us-ascii?Q?NFGv9sgP5U7Z6M4e1zTIQjeBvIkMq2QTLW9IsCJLcToc7OjQTvahWRGlmP+7?=
 =?us-ascii?Q?BxLOgW5m0FU8jP7F5MuZ73qrBkZ3OHBWNSnBM2vltFcR6OTjVgpD+Sa7+def?=
 =?us-ascii?Q?cQpDaMSbQD4cymB4IzGe5sroUONQAFF+CxZwfwGPEBneagAUVUGomuiDXPtH?=
 =?us-ascii?Q?6Ya95DV44aht8ggJJnLXOX4Fk6FrzwwpVyE9ya9vvd2OkLpeTrvy/er5WC/W?=
 =?us-ascii?Q?yhGiN9+qC/i16hKOok+O9iLdlD6NCugpeWzEUVJdW0qiiUrDrazLhwZs9OI6?=
 =?us-ascii?Q?UCm+LiXOyeSQ2y+IyeIpLAHqGzycANhKnuz1FfNd4HgLz8zdS4PodeqC4Ewd?=
 =?us-ascii?Q?OLCEYDXXiD+EVfGka0/tv24vSCbH9OOVJ3/+NZvaK+/rV92ZtE5g7et3FwQW?=
 =?us-ascii?Q?vpXPH27PuJ0Jsee1c6lPrcW6tVWaYM+GXQBQzIdG6hvGN7+FwrFv78x+EVB1?=
 =?us-ascii?Q?7GbbJXQHGf/TXaB0n9ChQtSGKGeGaWgvOPROaG47k7a0oovt5+55sPCcBj4q?=
 =?us-ascii?Q?bR99BAzAcdiY/ocl2q2x9y5u35NmCT05B+iXBvj3KK9pcSFr2ewPXwOofdW7?=
 =?us-ascii?Q?/EW2fP5c+4sTANMOxsnIEx80MTTz4amuvY+kgFf+0Q0N4tHJkfAK0ekterP8?=
 =?us-ascii?Q?A0ZPh18PdR003SzAwfVfwPeee7J9XzY8e4ZVGRRhghM/5Zy+NCvMeOr/Nzuk?=
 =?us-ascii?Q?w8wE2UVg7R1kj62btwMxnp/ZKZNmQGfpK4sYr8bOF/NUE+XK9poa0yO7r4LH?=
 =?us-ascii?Q?3wB0nM29lK2vNWkKPn6VfLf0IZxQtn56?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b+pF91FKQj62tNd+IZedvSt+vBG0OEtIhdJQM4Zcl2m8nMYiFjN9yhA+y6E4?=
 =?us-ascii?Q?j41U6jlpmCCf4BoWXoVeLKVoWW2OlgNz8/+02KlmIJKoya4KxA0Z26RJ8CVM?=
 =?us-ascii?Q?8+37G/VaqjdMhxIkQHEbPd26012QA/RPF3mL1yprTpkmIU3ji2CNrGc07JBe?=
 =?us-ascii?Q?eQQebSh2cam1OphQVL9eLqRUjLv9VmQ/js7sFvsDfLvJlLCgS1xS9u+w0WXQ?=
 =?us-ascii?Q?mXbgC9ZFgg6HgkajLSCIfXMUvHc71Y3KIygcTHmtMs/3awtKEYN8s1mlQRRN?=
 =?us-ascii?Q?ntJ9BtO9iFut3Ek9Zfd+RPY8hDLsoisF9yO/DSDzwRPwxkclZUOpq08Xi5PT?=
 =?us-ascii?Q?iLmrVfo81f6PfB+dvi56uSpyLj177nO51tNm0A9AQm6fZzLNmOSHrFvans/t?=
 =?us-ascii?Q?XwvGEhcxcpzOGTbYDHa+ZQLl3DaepxPgUyNlTT6RlPTTPgExHaDXLPmypUsm?=
 =?us-ascii?Q?jM4D3qxoW2l9YUhh/EZ2LCN717l6YaenSVROxbR/xfpSMk2VZmGYEn3e8R60?=
 =?us-ascii?Q?zyeIBn+rC+zDY6DaZqPVqEBsqSeWnkQOBMiX3qiiwyIYDC5vxPTeIa0M/eBw?=
 =?us-ascii?Q?8OAgySpXABG/2/0IhG0AmC/bZDeK4kP5ayf5DS/OafwFAPddE4Q2gVkQIi6r?=
 =?us-ascii?Q?Yl0M1wYlc3ZT4+/P5ILJvECm9YNHuLHSp5XJz8vuL9CgGNkYtzgzJL5gpbLt?=
 =?us-ascii?Q?+3tz2pZ6EMImIpujOsSXjGaYmibX1OJiWV+GzuOnb1WRPorS6wI9Y61JnUnv?=
 =?us-ascii?Q?9q7LhHmcxoYUwGEThk4SnAFWjfRCI7dcms0r1c9zWy2kTDkEy59p9gCK6aVm?=
 =?us-ascii?Q?MC4sMBbhX7xp7Uv+avadDFuvxP3evzWM0SkZvj0SlOstcLEcQuAGBZFzx6B7?=
 =?us-ascii?Q?aSordMjCfuvl/B9mCTQJdjb6gtv8tG131RKjltsguAJOt3AKskkf0Aw8BAD2?=
 =?us-ascii?Q?K08ei/hDo1Jm88941pNfzAZdTkNyITgd/N6MpJlKERuZ1/gqUGrUEGQgt8mH?=
 =?us-ascii?Q?xpREYBZnHw5ZFvPSV/kfH7ScrSXLgsHj6Op1tNYFCOgROPezzLUjQftlySgz?=
 =?us-ascii?Q?KmxKIUR8sIkmO3DHtWnf+9IDNjI7iSbD7omc4XyxEtc35UwjPe9IYdbH9XEx?=
 =?us-ascii?Q?XgLi4WQlQqI6cU8tHpDzn2b83gTa5rpQRH7TQJNdCSl6W866KnTztPp2c9Vm?=
 =?us-ascii?Q?4WhLM5oKSrHsYpsmRlOaRfpzZhECCdFs47cVuB3wuABpUIn5HiZPNxxb9W7D?=
 =?us-ascii?Q?aSQX0TJ6hUrlDl265gBLGeE3U5t1AmGIYtEwV+n0fgtkMwF/IFidHju5VXcL?=
 =?us-ascii?Q?0K08DA37UkTD8kAf5b+W3L345di2YjKmZyVYpNIbIvX8JvOt4nTfnYjQeUWt?=
 =?us-ascii?Q?M/L6XrQ3VH0KhbjMqe2MLqXNox7LcEDJMyYLt9qdAAAihtRT6TsrvX24BK6Z?=
 =?us-ascii?Q?VIDKmKf3x9sE2fcFPilt2sFVGV2DD9S+5CrQ4BoXeM4ZF0OalUWJ+Gahg3Cv?=
 =?us-ascii?Q?Z7uJyfQ119DsF3jkIlkLbmQAlqXMDBj/xvNiR1j+GJhS8s728H4pMdEOu6Sn?=
 =?us-ascii?Q?acp2RRCoCDD7Gvn1vV1S7Vt1KI0vIElUQALT/h9A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce93d827-f4fc-4d11-f451-08de1d89e732
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:12:06.1414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xo2K/5W/Yaw8NBn6BlalG7+ZkAzS+0BgY/fjZ/MWyhs6saDyPW60anPKxGxM16WCaAPuMjsJqNdgfN22x+xIIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8014
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
 drivers/gpu/nova-core/gsp/fw.rs               | 45 ++++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 85 +++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 687749bdbb45..53e28458cd7d 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -543,6 +543,51 @@ pub(crate) fn element_count(&self) -> u32 {
     }
 }
 
+#[expect(unused)]
+pub(crate) use r570_144::{
+    // GSP sequencer run structure with information on how to run the sequencer.
+    rpc_run_cpu_sequencer_v17_00,
+
+    // GSP sequencer structures.
+    GSP_SEQUENCER_BUFFER_CMD,
+    GSP_SEQ_BUF_OPCODE,
+
+    // GSP sequencer core operation opcodes.
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
+
+    // GSP sequencer delay opcode and payload.
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US,
+
+    // GSP sequencer register opcodes.
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
+
+    // GSP sequencer delay payload structure.
+    GSP_SEQ_BUF_PAYLOAD_DELAY_US,
+
+    // GSP sequencer register payload structures.
+    GSP_SEQ_BUF_PAYLOAD_REG_MODIFY,
+    GSP_SEQ_BUF_PAYLOAD_REG_POLL,
+    GSP_SEQ_BUF_PAYLOAD_REG_STORE,
+    GSP_SEQ_BUF_PAYLOAD_REG_WRITE, //
+};
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GSP_SEQUENCER_BUFFER_CMD {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for rpc_run_cpu_sequencer_v17_00 {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for rpc_run_cpu_sequencer_v17_00 {}
+
 // SAFETY: Padding is explicit and will not contain uninitialized data.
 unsafe impl AsBytes for GspMsgElement {}
 
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

