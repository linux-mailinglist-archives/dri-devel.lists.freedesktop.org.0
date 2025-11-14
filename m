Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB81C5F1EF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C336810EAF8;
	Fri, 14 Nov 2025 19:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="elriiKqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012000.outbound.protection.outlook.com [52.101.53.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF97C10EAF3;
 Fri, 14 Nov 2025 19:56:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4TrTqI54fj5NHZw8Jb4kOXZbLLGUWfBY1V7ZUEUk+nTDL593YGCziyqCTtNJnalaQPxfC6MaMIwMYNzEJ/hQI6Wbi6WXHjAuj8WsIbBKgj4YjSiTC0Trfr3NW9rP8+/AjKvdmKdC6HlupzeMfWVK0KJQNvEJNPYWbMR8AA0B6U0uHRhd0Qdot7b8E+SAOCds6x5qdch3f9PIRnD4ou/8+IEViUcdhxAXdOoirqwq6BuFlrab32laoWEyj4o9V9okt2e5TlaKBhRdmnqsa9Na8GKh59muYTPmPwaxrFsGLYbWZiy5hlqQtkfwf1AijNTU1vLc4bc9suyg13g5/kodQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/hvaSNHC4bPtuuj8lVto8lopzd5JopMTiTYLyMVd3I=;
 b=g00KnoXnNVsfC/AySlqV3JCC6Ey/QHUaRwgg1U7KwDIDAwL+j+iMJL2Hq1KXAvnVl23uUb1vjMEpvnKfcIYd0hU1kR2KEEnngBB70uBXDpy52odp6hxhMuRmhV8Z3qjdUngwHJDmnYbTHvSSPKOIZSJ0XesV+2zSCP24biUj6h4ZAY4rZX3PjNZsRSwKElg2C6LQDi7hX2gSiDV6A8/b7p6L8Ht0DtLRmdcgYPJgrBme2sV8WRSCxf47L7Byuftx/VSyQOdpg+pOoc6+E3OeI4E7sqQ1hJEdKN7UB6Jhb3z8uvB456aIdXzB9MwcipSnGTRLyhfbcDdkQim4xD5AvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/hvaSNHC4bPtuuj8lVto8lopzd5JopMTiTYLyMVd3I=;
 b=elriiKqUGvLY2sbiCYme137UhqN5Hf0BS+1Se7IBNnLxQ6GUcLrAPa/jlE6OKARGsZ25OlP6ZjF9llePQ/ZyzRl2RdG6He9D/YA14aV8ao+A5XKYoUP28V1UtcHqhnSu8INPw8CNxNw4KYU/UPBBsR3dE1AfyZGqkY1l3eURaicraeFBx6u2HKGAfDrIJfPmEvBwLkiyLOm228WhPUBvy4baNDAAfmS3Tsy1yKIvPmQVo4i57pwX5o48kl8PfSnD8OEgzJKHlvN/zVDvE1b4PC0bL0EFeE6jlg2ui/GEL7uLSMJXV+K91uNtAe8JeqBtTitxTOglB68lsUbBq9FQ4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS7PR12MB5765.namprd12.prod.outlook.com (2603:10b6:8:74::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 14 Nov
 2025 19:56:01 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:56:00 +0000
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
Subject: [PATCH v5 02/13] gpu: nova-core: falcon: Move start functionality
 into separate helper
Date: Fri, 14 Nov 2025 14:55:41 -0500
Message-Id: <20251114195552.739371-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114195552.739371-1-joelagnelf@nvidia.com>
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0041.prod.exchangelabs.com (2603:10b6:208:23f::10)
 To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS7PR12MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a90345-e752-4ef1-b4cf-08de23b7d5c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V6vHrbNVQEiGz8CHax3IvrhvgWvPCYdoT0MEGyuZ9wbTFdJMBt2t+6K9/OZt?=
 =?us-ascii?Q?PRXCIB9Rak5knCpFG99NvvzlsHl9ALY63A0SU2lctZktILc5EPzzN0TQjJFd?=
 =?us-ascii?Q?GRAcMahRJ4GzCLXGcRq5rzBGiTwgn8y6Uyqy6Bzpp9DR43x3SBWYL6wDAiGN?=
 =?us-ascii?Q?6Y3DL4PvpCxVZ/+xd3jJA1t7Ngm/7LZ7bb6Fu7mw9MGV+1fEEpHGJJIDuNrM?=
 =?us-ascii?Q?z1fOXldMe1EtUnYby3GFFpBrmUVemsZGmKkSh0OhxCIJmZTTph7qsboJ0s9n?=
 =?us-ascii?Q?Jkj/NwxNhhAB4Y9suvNydgjRBKdhSblC3YtIMqYuVohd/KVi6aDTYRNWDt4u?=
 =?us-ascii?Q?xFT49ox3iKeORKOAp3DVHQJxkdofcCwnZZhAMESWE7OElYslgHyadT2M0isY?=
 =?us-ascii?Q?25VoiaPilwDxXdQho9CEh0gM/cpT6UaEzrs7p2v4R7DeXny51bPDNM4LVzvK?=
 =?us-ascii?Q?MiYfRjW2Y2Dk3/zMktOthiChlbQWt1NCdoLKmxljfEsRPa4ASkn9VFsEgNTW?=
 =?us-ascii?Q?tAztulGw1sCHn0O9oCfw1NH0CgNbl2aEd++e89TLMdw5VKeJb+HroKvqul7c?=
 =?us-ascii?Q?I8ek6Wau8i92wHcqTOm5voYv56hXlrfLsRp27nGXNtIHPKG9xrNtNPwwmbQn?=
 =?us-ascii?Q?IygFODXx7JScFCxznZ8Im0kfdUvTNdAVwXhuqDYdD9EWEg8HAN6qPS61DDnE?=
 =?us-ascii?Q?SKpLqOcty8QNGI5PoshnWwSNMbdSgd16FSZRmObRNr7SC0Uody2svgrA21qR?=
 =?us-ascii?Q?28rV1dl0/xc0liG9Frji7s1RCMhBGofJdnmgzsF+ZqIbfao/HO8RhSS7Egiv?=
 =?us-ascii?Q?4iMb+RbCYeexqEwfDevTozpVD7ZKRhs2tcJX1oNpA3xaeIDRq/uOCvrCPSB7?=
 =?us-ascii?Q?jwbasswePQpFTXCpX3kvWb/zlunbWzCZt95mCJ+nDN0B7ImhOGP/O5gXVPKW?=
 =?us-ascii?Q?+u+5c2QKx5X0CErXIh5Ubdxh87AyerrhjR9drcbdIrOw8L3lrV/u0yQ+CBX3?=
 =?us-ascii?Q?56To87r67+OKDisTGWnD134dlwzwM9ktGRBaev1al8VN/nXfgdfXxIiQg/Ay?=
 =?us-ascii?Q?CCkD7OMVx09ojMWgZTuxKy8n4I7TFljYxizPx4xWjFMOFsB0klngZNtkuszN?=
 =?us-ascii?Q?yvvGN844iV4qzhlK4VgQLk2R+OWMKsVSFV/WM1+EFa8ydGPclCkARCyha562?=
 =?us-ascii?Q?T/A3POpMc4/RnrHcZ53Cx5HCnwqEpjiSNKs/XCmyEsk14Yv2Dx/Ri7GBFsU8?=
 =?us-ascii?Q?y4Zk5j1QnuxLyFjAQEa5RUxqOtjSS3AxR0rhLSMejDmkKgibM4M8eyoarOOL?=
 =?us-ascii?Q?UQZ9xNQ7IhD2DBcBVhxDl1Vx9/r5pzyoK4mYErBfVelIyfn4vfiEVke7g2EW?=
 =?us-ascii?Q?SASsPg2Y29lUzLBg828g8xgPH2OrSta5Clvw+moqlUlvaQ5yXGsYTZqUFnvS?=
 =?us-ascii?Q?NkoJ+EHpRMTE8LktI4JMCv6UckYGAJZc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iTq5eMDlpnUU3o9YJN7egGg+gfeULzrOCbhxlHJGr3n5b7jUHCfyN4KKnL5P?=
 =?us-ascii?Q?lJcHfysBPCaxK+4KVpkpxqhh3MXlFlwMTqCLP4402F6AA2E/rads+xfnQaJ1?=
 =?us-ascii?Q?xsXN3sE0fJ+uU/HTVIAhIiDZ148GAhdyBmiyC8f2YVKvH9uneqvqyCrRexYG?=
 =?us-ascii?Q?0dzbfX79CpdiUGEt2faUHd0DBguOj2AuvelsBf5MfWO/Yo6J9TNUchmyQkEa?=
 =?us-ascii?Q?GcpirKYT8m8RH3cuSYvH/+ObB5fhkO9uojwaaP+0BvGji8ccgPfia9H8KIHd?=
 =?us-ascii?Q?cYA+5TEkY3/DUnEetw6Wqy2H5L80MEyul148oYz97Kf6kzg0IyL98qV6btBR?=
 =?us-ascii?Q?ylhP2g91kVpswBGCh60jVttfHd3qYV9zjATt6dAaVmnAQ1QZjT8+7q7a56h5?=
 =?us-ascii?Q?HjYKuOasr1wEOKiKDVjUbkbPR9Xxx4th0QjD0uKCzZfWuJ1NFwJk9tcpSwzJ?=
 =?us-ascii?Q?DTnMk7QNWQovatkLjGZhtHxBv1aq566S3AHzOAqPUhXhXq7BmueJPrEWGEUy?=
 =?us-ascii?Q?BYSM8FnJnmLTgXYUv8XnGVd2sdjk3+uymlwgeQdG3+dOR3/Ld42hFdurjYm4?=
 =?us-ascii?Q?UfDWWqscGyUOtGfpDTD7qWthiSjg59Dzw0m/X0PCsZG5eQaZjLEOys9LXXAP?=
 =?us-ascii?Q?j65dq6AZnOm0rso6l3UjUCLH+fVOsQhMKqd4LiJZdYL34c3g4tNJ8OFV2PrF?=
 =?us-ascii?Q?/v8NrXS68Kn/gPeQFVDfzt8IEFeadu4JZx5OKy7+TGo/L7c6lG50nJ6NUOET?=
 =?us-ascii?Q?FQ8B1VdC0SHTuO54NYbEcVyt2guh/mAvRk+wbawQgeVA8CKSoYr+d9I54uDK?=
 =?us-ascii?Q?juqp+lQGi/JA9QiAo8Op6GgxPFZWFr9ZfCkjMsZ9JXPPZKUNujlSnrkft8Es?=
 =?us-ascii?Q?m8wuQWI8+qN5tLrDqHLELHm/eTt8T5Wyam8RPGvlrZDQ9ceB8SHLiuWid0+L?=
 =?us-ascii?Q?XsR54BHf8kXPMokwmsSR3I+PH/1Nb/j6Q8kJuD4EknOnxCGCghVFOyIsXUaX?=
 =?us-ascii?Q?pG2uEHiFpECnmhxQHYg2HvWDwKUQ8nTKOk/DuuS6dboGKE9SpjVTEaDbS6ef?=
 =?us-ascii?Q?mZNG0cVHB4TaDP7wmBuhFT1wktzFy0yMl7YcQXZBe23K41Q5OySEUrDjd4PK?=
 =?us-ascii?Q?ZllXzpI6JUBkanF0EaWKoPqcXJxInfqWVrO3a4u5BEZIYkttARUf77vt816J?=
 =?us-ascii?Q?pAPFe4SJTgYDE3ZxrtRfR14ZEPlPnkoeV67U8IK+/W3ZcZMnt7F8mU1yzDFl?=
 =?us-ascii?Q?tcyEtH4hJSRYZAvKCeTQCcTAXqSTkjKYUneb3F5O8I2HXMghrU7Es8wAFBDE?=
 =?us-ascii?Q?TkgFwlKxqXBWLoELvMHTi7ybV+ySZLB/ABgjpXi5AYVJI+kmaeJuz5lRG+Nx?=
 =?us-ascii?Q?xP7E7kH2FU+Xas5usRdilBOpHsg0Vz6njdGGohuZmzh00+ShWdRJrlHPHfF/?=
 =?us-ascii?Q?ozfweB68ShjhmPicrqZt8v0imupE+K05osiBWJq/8YG5CZoR9qK3KpolWTMy?=
 =?us-ascii?Q?4mo6/piASy2lYyWHK/ApGQ3zLP4o7on+UYQzPwF5SeugwROGMhwzwT0H9a/8?=
 =?us-ascii?Q?1iAA3GK2S0fEHiRC+ncob8MUw8u/lTD2PbfUApZb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a90345-e752-4ef1-b4cf-08de23b7d5c9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:56:00.6729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwIlO6UB90hpICNA1aSx4MopHT/h1g8g07HGRfW0e80iN3t9bOBqxR32mNoEYK5H4xCw17bLxN/oJ4/QDn+yEQ==
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

Move start functionality into a separate helper so we can use it from
the sequencer.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 1e51b94d9585..30af7fc2814d 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -564,7 +564,21 @@ pub(crate) fn wait_till_halted(&self, bar: &Bar0) -> Result<()> {
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
@@ -589,15 +603,7 @@ pub(crate) fn boot(
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

