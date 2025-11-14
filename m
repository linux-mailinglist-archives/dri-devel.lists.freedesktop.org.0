Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6F8C5F22C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F37510EB05;
	Fri, 14 Nov 2025 19:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yt5OvwJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEF010EAF5;
 Fri, 14 Nov 2025 19:56:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5eDVya61dRQO4A0Pq2bsvTIWJ265A/8STAa4rju2vAr2cAWZgqU1KpD4wS7jCwHhytCHZ+NhW2OG3UOf8+6ehvRwPAQInGmSTWpCXPEXUxXpgsLVGV03H1dnTQwhtVl0dNTNdhTfRXin5WnLioncUEUyrXBW0vd6DfYowUeB6b/SN6nnrOol6gZmSNmksuK3+oHeob8Jf9yPD0kFg94pPKT8qi2CqfciAHrzhmDQYBqU4sqTt3C2AtjTtXdYt8WQ6qhOVqPLdcTgdCu13eauCti9FF858yXc5/a+dZnuhpm8ZSY47BfUp8I9NRy3g+JCPAQ7yeDbC3JNp5szRzz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJj/22m6SZZaimATpJkYQCSaUO+ObtgwIOAtbYUqcPU=;
 b=XVSF7ejtCaFpb2/XWIsmbDMzPWq8kNnOMES+IwIicCSll7+nWWTlLbeeYCpfCH9BrzNVgMxA9fX9O7fGTvXD4oLxxehk9rOxrInDybnI546HtUdvrrOYiq/TiT5+8JhWkdwsVBzAGzZ1ke6P2CAXqzEj203LA6z5i3VICdboYLfvVndvXU7I3nBjr+9/02AzoQRp+S1DgEOxD+zrwPQLVredF0Z+rNofOP07uUMo4aZP127oXMXPD5jtxDKA+49AdVIV5wM8ms1Rw1HSlcAVJ0SylNlhZv4jHR+A6aaVmpru9PGhjw4UHkNL3c/Bdhzma06q7dBkUTqd0QmQ6DL7fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJj/22m6SZZaimATpJkYQCSaUO+ObtgwIOAtbYUqcPU=;
 b=Yt5OvwJqS5L+NsX5j4BkcmIeJnx03UPt2/gTfuLSX6yZfwGpknBjSFAkNpK8p5CNhdFVl62IJmZhcstwOGPYMY+/33hEQJ1vMs64JszgZMwWKkuLSNEY+epAHHaBVSgY7hMPH1GHotyQesibwWNDN/NHbj6rqrmDgmw/KdBt8dy1ngOsqzcxwhTCI54wBGNytqkj0VlaY1JUOdkACgACV9xEk9emiYT9YZIJTNVCDM04hlEChd0CLOmrog1uqOnnBYKYsAuh0OZo+nOf8VXA8Qa9yDM1gX1AOkmyGCP2HOun6dSXwKyki72yJeDjDzxd/JUYj4Uiw03ogiiIQ5RTNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS7PR12MB5765.namprd12.prod.outlook.com (2603:10b6:8:74::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 14 Nov
 2025 19:56:17 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:56:17 +0000
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
Subject: [PATCH v5 13/13] gpu: nova-core: gsp: Retrieve GSP static info to
 gather GPU information
Date: Fri, 14 Nov 2025 14:55:52 -0500
Message-Id: <20251114195552.739371-14-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114195552.739371-1-joelagnelf@nvidia.com>
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0313.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::18) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS7PR12MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc5f5ba-bff2-4860-ad35-08de23b7dfa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2vkiANiKJ79PRKF33Fe3/e7gsz9IqG2KsjGYaVvohO9N37IjqSDAmWs/s9kn?=
 =?us-ascii?Q?MTK2xMB+IYJaSroBKlPqPBoHHdi40JPOSukaiBkDn+rAab8GwQkV271Yglhs?=
 =?us-ascii?Q?kFh+R3YlGCFdq5IHABq8B9BN2rJVpFKH6KqxObmcV6EGTQPq0Yl1y1H5ibm1?=
 =?us-ascii?Q?LLPBNu6knj3HgL7hnAYbuPZdY532S46gwq94mMHxzJHcIeML+EPpnBAAe1If?=
 =?us-ascii?Q?9uTvA7PZ+ux8SftUj0udImSQi1hbIXdZb/4pcWSUnkZ7iFQjhcgQCaoy+U/9?=
 =?us-ascii?Q?4XHZ+L8Oyfg/sOc7NhWNjJXTswoVDMbTQ0Bd4vMKuPEe8za4JAHcrghdEDeZ?=
 =?us-ascii?Q?KJwmQ6JRZUgSSKyh5400mCL1TN7zR5y+bLmMfjU5soG139otmM79krYT66sb?=
 =?us-ascii?Q?0vYVGPj4M5K0tvWsR+dBpKDvtOPNqlELpJv2O1767JngQL+f0o+dq5ZjexCW?=
 =?us-ascii?Q?o79c/2SXTUc63b1HPS9gKSV5E7KL89TfETfVVwnmmPw45xe6Igpwcf8ag9p9?=
 =?us-ascii?Q?Y7yjPXOmOK/u7c1RraCiiexMqTVtiMSQ2sRKtaEckZC+zwrCQm8CDKrFg9Va?=
 =?us-ascii?Q?28ngxHtsgoRayEg4aJEZ4wPDqoqb3pAzE7Xhr8BYHeQibgAd3bDi3j18CCgR?=
 =?us-ascii?Q?TUc5LdryA0MHvInue27Pxa9JvzfaX7UyAag/zEpshRtg03rYcZF4Q1gONOFB?=
 =?us-ascii?Q?6Z1KvsqRoX5VYDeJIZpxSNWeABmORcVAipS5/LqTc5LFZz0pWn36tN/edC1Z?=
 =?us-ascii?Q?Iw5EOcha9sUG372783RnRyk82NF9yfRhWX1l9l4M2iSJ+NNHsTnMn1hfUnIV?=
 =?us-ascii?Q?kXQU37RIAlWfNQhiuEViAaHn8lcde0Y458bwVqMOL/Vzvtbv/k++ZHX7Thlf?=
 =?us-ascii?Q?3cMBe9kt1xUZzrdG663oQPlKHwtJXen4Om8u+IFKp4WlM6Oav7Dx/FpuwD81?=
 =?us-ascii?Q?ys17ykjSx7XDLwWcRuKaDFFc75NUZl2vLBQcEYorhG64QNtzAEUTOENJEpJd?=
 =?us-ascii?Q?KOJaYwaFUPj1j7ylNGWtO3EA6R5Rg9nuoBXRiXKLM2Kn1Y64doPQp1s98GSc?=
 =?us-ascii?Q?B0fLFKBSdJyKRGb7yJnQolPeiUbfj4y3EDCMTV/ff8mgNuyBKN7AsI+Z/itn?=
 =?us-ascii?Q?skvjmRzduRqz4RxbloH9OKHUwkRYdLnReT/OW8kuy9Ok3VqB06tQOMlJ4SH6?=
 =?us-ascii?Q?T7fgRLs1qnyG2EpCzVa/vzt27NNlw+8QKiq+sO7bTL2ScL1xQHwZzmC1hRij?=
 =?us-ascii?Q?JYeQ4mrKcSDdqMpEF1Xqqprs9qd8LdehO3B60ZSZ6EfitnOQE5BwdF52zLBd?=
 =?us-ascii?Q?gutYFqEQsyqnmy9bDJa81bSODXlX15GEqwZLmfk+PEndzqBQOUK0Asp8Ji5Z?=
 =?us-ascii?Q?ZTNOB1jH03AN+KtlrCNowhgr8GXQCqh42JJ5xEbFTmaWe84KZ+EKBcA74eyv?=
 =?us-ascii?Q?n+QypRT+SUu1kGKwKLR41GF8zPAOBPy/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0ftKvfmw6gDXDchEkCJsKMhi4HvDVaZh29laKoXcqLCvD3JFeRbLAWasPwig?=
 =?us-ascii?Q?hXbiJKuYEKzHOPO/lpSPyhZm95gpaQFxzkoPm9pJsP09UnHp8jKarTXjFD1B?=
 =?us-ascii?Q?tpgxfKA52occSnd1Ah+tFy9byone+VxYafl7LFLUv3YxwC6s/z+PMpxBGiMV?=
 =?us-ascii?Q?Ilu2njCrOrFmTZWzzB5vxJ9nIBcE0pfCTtABqoq5mcX9G1MEButluATHVVZq?=
 =?us-ascii?Q?/ga0OhOO4Jf3h7fr1ZM+sGEOTyHbnjP2dVuGc7MfsBH2MG7AuU3yqAD6FgHl?=
 =?us-ascii?Q?LNkH1mqHQV+FJee1GyX2Mzd6oVqifwYApftNwMoaWCYxRCKHDWTjo9aAQKuo?=
 =?us-ascii?Q?y1l+yhD7UTqJXpxjdVHJU0hQR9wJhlMuwnsVXcCHta66GXCAe5X7kIJMRGSV?=
 =?us-ascii?Q?RSn1FXsBq438+CmYugK+wG2zxHJrx1gh6ckPCHZ6LMNXAvJb3uP8/NZm3UUM?=
 =?us-ascii?Q?fLOZNFJjXb+iKyVcF1VyztZU6E39/a5oIlsa/S3fyRSCDz1aL1QP1yfAdQ8s?=
 =?us-ascii?Q?X0TUxZW2nzQoSjGINsh6xRZjIlYUXLqb5IrUd/RUXxlQMUjjpw08Mk6jqv+Z?=
 =?us-ascii?Q?SvLtFjxFP6HjYse2eI1NNxoUteBuGOci0iE3Vj20miC6CwKtrl1Dlq1n9kPe?=
 =?us-ascii?Q?fS907QupVESUnLtNIJrrT9trandY+fLobTRITN3/VqLsqy5HTpP4T41dSp5U?=
 =?us-ascii?Q?cs9o+Oo5o3hiaEYdf1rHJ2H6veU1ZagP1ThN1yjkLgeXGYbDylPSjtAk/tad?=
 =?us-ascii?Q?8hkx5PgEqw+w25+O2mxmUa4Qb5BQ6uSXWWbw4cw/FK2ZLvyS5hXfOj+RkXDl?=
 =?us-ascii?Q?jk5MTfbCJ2JtNDcS9MZWkJaxufltJsG5rrWOTKzyjJ0VeqMysnMfCXzwMRXg?=
 =?us-ascii?Q?1eQy+6pbtnWxh+gesVnYLIZph4nlcJjHjpZQY2u8TOSdGCMDl2h/QP+KBqhW?=
 =?us-ascii?Q?WnkjWRHSmwvHaNl0zEDEnuTjD8zX7lkqYsCL+h8HLuHk3KPO0tvxLOYZa6vc?=
 =?us-ascii?Q?CyZUlfv2V7loyTRzhBAPNfvqw1r5CtjEW66qRlryIps25BJfcvCjH1pRgpqK?=
 =?us-ascii?Q?nXHUkKXIFv0E9DlXpT+1FJV0KT5u2aUg5dN2y2kqFDJ+yOEm5qTYMw8GvM5B?=
 =?us-ascii?Q?js/5WUykPBmpGLXJRPcqERc1wYeOdAPuBVTd55Mivt9DyVmC3+JzTE2uYdt/?=
 =?us-ascii?Q?saX38ksYdn1T4lBMlQ9AqPFzMoYTcJzFWOhgmz0nYGBSQv1nhsdb15BSMG3x?=
 =?us-ascii?Q?XoBsy5gB4lGJBXxUZG0zbf7mxXHdtztj/Tx58eh1NOpm8o5RAMCFJz8f2/7S?=
 =?us-ascii?Q?Pc++NANKoH87tSCvKU6vj2miocm+60znRe3WdF81mrqXeRAM4DpZnMNFziXM?=
 =?us-ascii?Q?Fw6K8YbtTRjEe7/1z5qjp59yf8lpku3hoXx3GipFKMDKcAC5+tiKbl3mrRLm?=
 =?us-ascii?Q?fP69PVa4dKVYFJcLM6hx3N5qH/Pxffrl74+9PrtIcB0ojwNeQHDuajh/bj9O?=
 =?us-ascii?Q?Th3jGnJmOmMTkoHlyBIce9N7b6Q8bWm7VWpSxxR+p+1/5e9bIk6p0sI2bwr0?=
 =?us-ascii?Q?w6azOXXLho9XsqZlZQF3hOVyS3FVnErbxK6qfah8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc5f5ba-bff2-4860-ad35-08de23b7dfa2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:56:17.2144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mepCLNo+/EiuDSg/Bs9KYuXbq7/wYDvFb//89cs0SM/RVpMTbB/5GRZrYIDbhm0Pc09/wh+CAPHYlt2eXSoDJA==
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
 drivers/gpu/nova-core/gsp/commands.rs         |  65 +++++++
 drivers/gpu/nova-core/gsp/fw.rs               |   5 +
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 163 ++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs            |   1 +
 drivers/gpu/nova-core/util.rs                 |  16 ++
 6 files changed, 257 insertions(+)
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
index 07abfb54f9d7..6cb32e7d3436 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -17,6 +17,7 @@
 };
 
 use crate::{
+    driver::Bar0,
     gsp::{
         cmdq::{
             Cmdq,
@@ -25,12 +26,25 @@
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
+pub(crate) struct GspStaticConfigInfo {
+    pub gpu_name: [u8; 40],
+}
+
 /// Message type for GSP initialization done notification.
 struct GspInitDone {}
 
@@ -62,6 +76,57 @@ pub(crate) fn gsp_init_done(cmdq: &mut Cmdq, timeout: Delta) -> Result {
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
index 0cce54310c35..5b6a906ff5dc 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -882,6 +882,11 @@ pub(crate) fn element_count(&self) -> u32 {
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

