Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB1BC29AA8
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9CF10E143;
	Sun,  2 Nov 2025 23:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eZUmhIJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010017.outbound.protection.outlook.com
 [52.101.193.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9835F10E17F;
 Sun,  2 Nov 2025 23:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/yoa9pPP9/Tr8fPE1LYAF/FUvoGmItnxfkVntORDZ/rCnfrMoKYR5d7kbKHgERY4kHiYAMU9UjHJGLwANVLkMNyA+psU/MKMD+MPqj455YezWxQKyE231MINuySX/NEGi/nl5OQTCN0HtLqwyQBy8Irc9wU0cTAQJzVHJR/Em43UphGr56fDjjmoSPpWMFDyHjJAaEaGydDsPQpnBrCEr59uyzeHhnLirOOIoSUNANg3SKO5NxFumEjUCbQWDAMpY+1TVoUYfhcKgamwOp9C/1x/InsdGq79kGPCfJC5eVnZZA3MgSA9LuJLORZ/c+0F3k1PS+wQVSckNUUZeK3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylrYPyJDRZ81DHD0gZW32P3VlvSuuXaveUC6LNgkgtI=;
 b=ptii4MIZSsAe6cVJzktUlsw2yYQ2wRObTnwVYqPU4kKfGsGguAa5nlD4dBil4G67vKqIiT906tLkDrDBPTOBcCjwTWZxLlCumtc9cLUrMz7DWVNSazvumbPXWN8iRd+qd3g3CdWGO1yJyLIxSkb9kWTiZ6QZmz/dWuf+DQYd1UZvbreCuzliWG/CW+NCMCb8MljXT6a9/mt+Hrnjtm+MwO085/wg+4V7+glxvmWvVS2KAxuX785GEisLfyrlaEiCpGBCAlQ9E5zYQH5QUCyVlRRFJ7XGilf+NGGDYT0B5AeHmEfYRgsSWjhNP/5wcNLwpY9Gv6cLEWARL9hpwbXjUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylrYPyJDRZ81DHD0gZW32P3VlvSuuXaveUC6LNgkgtI=;
 b=eZUmhIJplye03aOoL4H3f8xxC9zXQj0lbhesbiOht0ElFZd9mqUc952fhAsqfY/N2BQUkXRnCgcOl3kdtOgmu+I5W/s5tG9XQmqk+I9YcfZo8HVpBuL8QLly9a2b9+wj6vbF23NE43O1w6TkeeJ0Gewbn0EXUyljR2pZA+hgOfOCLfMFAZSIQ6RXA73cDnL15hOi/emgXhnQekZPCcLwS++DeljPBcFRgLRJdl0Na8H+Ao9X3zpz4gU/FmelQ9f8xII1/sgM3lPxGqVMwO0wyaeF1DEYhCZ7GZq29UliGKBTpeLnSqVdhxbmqf2WA27wpR7VI1GU6nbJM+9ATd4ZmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 23:59:31 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 23:59:31 +0000
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
 nouveau@lists.freedesktop.org
Subject: [PATCH v2 02/12] nova-core: falcon: Move start functionality into
 separate helper
Date: Sun,  2 Nov 2025 18:59:10 -0500
Message-Id: <20251102235920.3784592-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251102235920.3784592-1-joelagnelf@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::27) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: ae837283-75d2-4572-cf31-08de1a6bdd93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wa3Vq1qmBhENGhQtRG9VvLOMQO6QlEp6VnhQxnE3CxbxKwqZmkCdTZ/ugmkV?=
 =?us-ascii?Q?TeVV9R0xCVPmjgHZT8SGA5uV8oLTybLrLEdz+sYMqDN7kPkvkwEQ4rHNqDbV?=
 =?us-ascii?Q?DTW73qX8S1MSUt6m3ZVAhW7XWPDSg8AvomMNAJORPGkBLt95xhrxg7b44sGu?=
 =?us-ascii?Q?bMDpd3tjapO9Lr734z71wS1Ya7dwbJuVwrpHeesGjzUL4cQWq3FKX8p9YSF6?=
 =?us-ascii?Q?AVfMcMMr1wP6UlTV8s7cBlHRTfMzQVuaYFv0vOCqk+2pQ7ZpOQzre5LHOkIB?=
 =?us-ascii?Q?ZAI/Ycb3ReP6zRymtgBhX9YU4/Ba2c1o4J8GGPERW32M5+g7sPiGgmKfY87I?=
 =?us-ascii?Q?l3pFEmb9cbGAcN4egpJSHHa6BRGWf9kvOmdMMJxzkwGaT4RAQBo11+1HF++4?=
 =?us-ascii?Q?VNqdLbNnkAbZJRlAu0LoDJ53wl57OmUU5KYXngoKv6ZXY79vmFN4lRlfWQTt?=
 =?us-ascii?Q?Ceavo19gErnGbi6ygep6kcD0qBSrmiel9g/jjtx6981gatcd4nAKK6/94m87?=
 =?us-ascii?Q?RliIW52sPbx5eXrJai3JP6gNly5hvLWgcNa3D3KNGLWhRktHIj9m2WNRaT6D?=
 =?us-ascii?Q?0BnWL39zLplSqVb6A71f/jk5/9t9jXqqM9yLEKLZep31ctmNz0NwM2n+kCAq?=
 =?us-ascii?Q?6xD4mqAc/GGmt48DEaUW+qyI9ucSUbc96/cd2sjmvwAe7dL/65l18IybPrr3?=
 =?us-ascii?Q?LlUPaO5Tcf+6FjKOmICr9CuVh/98L4tbGexOEwtf9LLrsCx7SJqgk51dOHKk?=
 =?us-ascii?Q?KdfxTPZV9ywhP2f/KZ4+zHDs9RAc3AUzZnEWCI86p0HYGw+50Xpee4chCsfh?=
 =?us-ascii?Q?Ll1T+bZebCpzct+LtSqLdbNwpaRNDs+azjte2RPIgQ5fMA33pkCiBMKUehUH?=
 =?us-ascii?Q?AyrfkjP5nDM07U2pTSiNM79hmbojNSmiQSuaU89zcymelcR+WMKMEnyxkXVD?=
 =?us-ascii?Q?WpzDg1u6+C6KpKV0OfeRcJTbnC87mK6UogD6Nl+I5tKSpSfeu7hkfjVE1Rhw?=
 =?us-ascii?Q?kwuvc4FPUUa1ml8rcdWg354w0P0QhpDk4nEUOKtDQnHLefWswX5mZy8wdkZj?=
 =?us-ascii?Q?+90ktD24gVLbzFq47kXTp4yWOEYOPo1vDXK6GgCf9SPPP4Y/bXHOY99Js7vd?=
 =?us-ascii?Q?jRk38gVsS1hP2fp6eAph9465jgXXctCUSuZrsbek6wSlY+DNqEYwZTgeIxEf?=
 =?us-ascii?Q?QEKjnDGw1t/zw86AScUpLp0mvYcOv2Jb3w9S7DOZXJhC1P3qCmHPi0uJgHkE?=
 =?us-ascii?Q?w0aj5AmGIEMj9dTTMKoaF1eoSFXeAkNaLid2ZVKGou8H9/bbpCG/kSDZPhUq?=
 =?us-ascii?Q?08ywFOyJRo6kJYaCoZ3auXlBrfkj+5FYhJFeYDys3//VYo3tBF65nMnxDeWu?=
 =?us-ascii?Q?lku1ztUh6z8lNAI8v8T1RVprDfo27qrkoHWxfau14/SrDGFOJMcf9TEc9wva?=
 =?us-ascii?Q?m0zPV9EpQoRviWfVj+JPJ7pdju3f14V/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zWTic3ZmL/pD3CdqrSy4x83IZlp0xa8oDFfDRwCeRqp4ePKTusp/e/P/sHc0?=
 =?us-ascii?Q?wyljJg+eWVvV/UJhT+SSU9euiBDxyziDZZ1UvQjCVH27wJbWlKTpi4by3nV7?=
 =?us-ascii?Q?yAMfCBvocwwEMPwekRB5s4Q6OA8/7gH0k5KF6+FG/9GtzFYLIOYqHIQJrqSo?=
 =?us-ascii?Q?jzWYWj2/NP3VKfRmhNeU4Kz7EDJjijON3NGcgjvoSjee4+4IHGuaF5t+vZTU?=
 =?us-ascii?Q?2E2RzuhDVxV0Muz/zVzpbtj4MXoD4YnNZ9N0mbEeE4kbAES/JlUMCjiNVV0e?=
 =?us-ascii?Q?LQNOWiw7xOMR1wPyPxY0ujwLK0XCdCmRW3Kb3e5FAB2Gh6/NsMwuAXTrTmUP?=
 =?us-ascii?Q?Ch6gb4gLnYb1xey90qpqO+AfF9+B6HaOFFSBSQHj65RryHvfXGvnC7/3l7xZ?=
 =?us-ascii?Q?SfErhyhdU94sjwtyXmJ8bRqF7RhmtUJ2Jdz77aURUVU1XqIdDBhN5VyrldUX?=
 =?us-ascii?Q?vtCcSntpMLQ2Ct1qsG2uMi8D3L+D2qNoX4Wa4pbt+aWjOyS4wVbUW9hPnIdR?=
 =?us-ascii?Q?Lh5iaSo6qQ5OVh3z4ZCd24ZT0lvsb+C/rgm9RRczmNzQ6gGseNpBXWgdE740?=
 =?us-ascii?Q?Z7h+JAM/GdwqyptKaKQZJsxFjCnVzYCS6dvxZU5Tko9+T7pLIgDdKSWxaPKC?=
 =?us-ascii?Q?9P37h78RHug1xAKX2x+hgD6Mcu5Yh3w8kVQGwu7DP7Mwk76abhn1oQ2i3YM2?=
 =?us-ascii?Q?gVu+IrZwhNCulw0YFhe44D8fxe4/ndB/Z9xMzhum5RzXsQ89Jv4yhnV/3/Hj?=
 =?us-ascii?Q?nMbIATrfV1A1vnY+r9p9RFP0amiZJgchuBiEWdDa/7FAIeTUzkBZUfNDIEHF?=
 =?us-ascii?Q?oSVaTZunycD4GOR4SPsQzg228j15lVyQ3jyF1H4mAt41H67nzJhbsTQ08so6?=
 =?us-ascii?Q?+ymLpPwwBdlq7z6vif0Vc9SKYk4P41UC0LanE8WZ/+CKedR/ytroitl8R9cD?=
 =?us-ascii?Q?31fRvS3n6i3sxFoNBGcnrFBLU0qlX3PepM3DtZSGhs9Wvxz/bX4VopEgYMWe?=
 =?us-ascii?Q?mAe9tYSlzeFOcf32ASw3KIXcN6YK26UXhpbmdfbi3eQtR0yJuBkZrVZ9IC/t?=
 =?us-ascii?Q?jSdOLJH1ob+UlcqVmujzmCiGvKE+VocMFOn/S/e846PWpTfSipGuflQgrDRn?=
 =?us-ascii?Q?vnt2jNjwc5AslAKqfTTRe+TdoWZuKp+pH0WOQe/ydaUgURYs99Uz5CmtSRla?=
 =?us-ascii?Q?TV4+cobmyPAplBm2/Esiam+v5zbldpCqFU/7daeQpWwBEIie7gBhaAo5+XGW?=
 =?us-ascii?Q?GawxuBMrb1GnT/UtXlyTUixS200Drt6TM5nXgbIVXlFw2ZEpffD3RfH5dOf6?=
 =?us-ascii?Q?XZfcPH6tzNSNNAgHbrojjdQX+y0X6g+yZL5vMFiGKL4x+y+rTjo/kkRsm+gR?=
 =?us-ascii?Q?GGK+k9/Lt40SqwONdF5rlGjRkbEM0f51sK6wUBDZK0SNmC9AYHhr2wEO59Aa?=
 =?us-ascii?Q?0HBcR8M+tNoHFwfv9gWF9UI14IJJyg7lGMTskbevDduO0aOOna59eNz7wlZc?=
 =?us-ascii?Q?X3y7Hm4MdiqiKN0Qff8PaghTg7UhD3DrNrzdeCjWpmCEeA2jmKcPNl6Vv3Zt?=
 =?us-ascii?Q?SWWFkdgBSRpPoKIkg13dAaeXA6CS7f5vu2anPBYP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae837283-75d2-4572-cf31-08de1a6bdd93
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 23:59:31.5307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKytxKOXdySdlhMJ0LSK3bPfIr6oOF5DqeHeM/1BahnSCZ/Uigp1Tqq2qzs57KZ6FMKGdiqX51VQa4Ek56Tv8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163
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

Move start functionality into a separate helper so we can use it from
the sequencer.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index dc883ce5f28b..1bcee06fdec2 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -553,7 +553,21 @@ pub(crate) fn wait_till_halted(&self, bar: &Bar0) -> Result<()> {
         Ok(())
     }
 
-    /// Runs the loaded firmware and waits for its completion.
+    /// Start the falcon CPU.
+    pub(crate) fn start(&self, bar: &Bar0) -> Result<()> {
+        match regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID).alias_en() {
+            true => regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::default()
+                .set_startcpu(true)
+                .write(bar, &E::ID),
+            false => regs::NV_PFALCON_FALCON_CPUCTL::default()
+                .set_startcpu(true)
+                .write(bar, &E::ID),
+        }
+
+        Ok(())
+    }
+
+    /// Start running the loaded firmware.
     ///
     /// `mbox0` and `mbox1` are optional parameters to write into the `MBOX0` and `MBOX1` registers
     /// prior to running.
@@ -578,15 +592,7 @@ pub(crate) fn boot(
                 .write(bar, &E::ID);
         }
 
-        match regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID).alias_en() {
-            true => regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::default()
-                .set_startcpu(true)
-                .write(bar, &E::ID),
-            false => regs::NV_PFALCON_FALCON_CPUCTL::default()
-                .set_startcpu(true)
-                .write(bar, &E::ID),
-        }
-
+        self.start(bar)?;
         self.wait_till_halted(bar)?;
 
         let (mbox0, mbox1) = (
-- 
2.34.1

