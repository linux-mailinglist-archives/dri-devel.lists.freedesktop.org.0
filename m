Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8230C3360C
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 00:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A4410E0CD;
	Tue,  4 Nov 2025 23:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oIboMO5p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8DC10E0CD;
 Tue,  4 Nov 2025 23:26:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJo/UuXmPBk4uLgjBp0ZqytCF99pEhGW64FMS4pJOdiAoOboNscdgwqmZsf6j20ZTm1PWhIvO/hCJVZ6gmsftLpIftKvb2Pws/cWXKwf+KuQ5Wtu4OSMN1jBT/No2cFyJWXmERtA5f1yst8y88lhHuTzclc1dMyJZIXo/TWH2veloitgF8caSrMjoDMWEp9iJtr9tBCl9lDA14yTgQBQwe1L/493sctqmsut+uX0fDnmSdbwe9l8MxYFNGnJfWFtwiexFJAMARkVQgJPp/L86FnTI58zmtD+o5mUkMQDwcl9Lb7OApq1Hz3UVT6HY3Kw+UQMRBYrlmjVEmQLey3SCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6/fUj6Ke2Gb1QIN0d4shDtlvdJyrqLDXaOtbwx08Pw=;
 b=Vm5GB/FhQElEtLBhTZUyJfC5t/vsi6NY2w6EgIvy58Q3/9KYcdmzc/z7VfkzqS2TEHepCsdpk5dwAsmq2FnorUQoFwscvmBlqrjiC9QLV/8RphtBnnSZUmyxB7JUy6HCmTAt+qMjAbbKEGaDt2AZ3ZVQujuJqXwxvNc8yLNNtoGnA0eYkWNYjwFKz98eugeHBfaCyUHv50xrRbbmHw+AkGMxXPRu7OReNSzX4Lvn0ldzj8HvPvj420mhM8AR01ws2WkSC2K6ek0XwMW7DGaX6p5bZ88gQC7DzN5YWI7LOnC6zD7+JepajzhpdrfDQqf4H4/ZlBNSM8Mm1NuqK6Xbmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6/fUj6Ke2Gb1QIN0d4shDtlvdJyrqLDXaOtbwx08Pw=;
 b=oIboMO5pJdQQSnOVjOlQPWFhKUw4xBvccwYQalooQKUET9jSHbasOfATKe1GVlQk6cEdiC/OKkubUn+p3lSrQnfUflkQ6Gn2xcR0bQrY07Dp3zOXXiU0YkyuAPGf2x9nMSz97I8CCEe7WMTN7E/7qycm4a+0CwzTz/TqpxJ42ytHXhQa2XIlf9iPH5RnsMqHJv/+jzdCp3+mnuh0WFTESQuL1IpeDhKmIVrKml97jR8+QYQXOVIVPUH0sfI9ejmOovPL+GsIA4iXSWn+zt/uD1UdyCfBsjczEmku+LHD5XX3tgyrH1d3wUCQxB5IrgMkzSPgl0qDmx+rX0HSuSrTuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS4PR12MB9772.namprd12.prod.outlook.com (2603:10b6:8:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 23:26:39 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 23:26:38 +0000
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
Subject: [PATCH v2 13/12] nova-core: sequencer: Refactor run() to handle
 unknown messages
Date: Tue,  4 Nov 2025 18:26:26 -0500
Message-Id: <20251104232626.2277008-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:408:e0::34) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS4PR12MB9772:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a984682-a20c-481d-916f-08de1bf999f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Yb6ecwOwE+/4IkZyWI+RGyXZ1nh+Vt+VXHA1fntfvhSlIdsd9oF05a8jyjdM?=
 =?us-ascii?Q?SqOxEHuReDilxq2EqGHGC3RPzZwSVQmR6XwPFeTenbS7eJK5IbWzUxEgqwh8?=
 =?us-ascii?Q?yf/xIIamVTfV7JKv8odsxoTqSZzk4sk7gI4Osfu8azddiUjyFpekgezmL8+m?=
 =?us-ascii?Q?BXz+DSUoRMAHomYAzKuwcfYvYDaKBw+L6wZf5goMZHtdW3q6+2WBC+rXlio1?=
 =?us-ascii?Q?5IRLmutIcQR7pa5r2H5WwVlHldmw+TmHT5m8PXYtJBhZ/iUDbZ91HVxrDAbR?=
 =?us-ascii?Q?FBIUND8y7tZ3y8/moWOr3VaL1O4G6Buriz9nE6Magc3WVnriHemJAs1z64Ns?=
 =?us-ascii?Q?hJXMjeyGzJMwFZBhgtHl1VuRIZ4ubVoPYTTYbrPLU5VN0bsUHq+oVWu6zztD?=
 =?us-ascii?Q?5kItxXxPhl/axBRKQDvnVODfS7UEyjhcm1GHznqVPolM1pT+SZ4rWWv7ZQ8E?=
 =?us-ascii?Q?rAeHVuAmut0BqvwcDYyViPVi/T7ciNKZ79n5vLzZs9lw0NETanb0PZT1uy0j?=
 =?us-ascii?Q?r46N+TNdEyrrFVmxGYrSuouCrvfPI+8L2FQemLI0+viqbBh+O3T/E510HEng?=
 =?us-ascii?Q?UQC9ZyyUsLG0rL+rRfS53GgKdHXzX98ITHAd0lRi581N9ycTgcMQBTwEFIt6?=
 =?us-ascii?Q?YADoUFmaFR4iBSBcvG9UZKihjX9dvnxMazPyplQbPXqtaaMImHAL8BNme+2k?=
 =?us-ascii?Q?WZeGwNMeYAttxz+pHs95GkcMQziRQEgOahFyy0OLxlxsrm6cMUmWobn+4DZk?=
 =?us-ascii?Q?Fd5XFxrEDbnjmXTXaCcTu/ROPahMwcYyn75uN1cdROebInR4h8JycrD/qFKY?=
 =?us-ascii?Q?6O8WKLeThZA3XLiArszAhPnTxUGeg9yaHdcitSu7dx8P6p4IETxDnp5in6Fh?=
 =?us-ascii?Q?BmAZoj/NTBt6h2mVumI7ycnAgxsmGZ5z/G0WTeUoN7J1d0M5ItjQEncKlLDP?=
 =?us-ascii?Q?UxJyOa6Kml2y82tDoHXYNERVTGQ5Ply1uVI2/st+AfAmOwpL2fr4AvuiZQt9?=
 =?us-ascii?Q?WGMgKBibBIS6Gf44uKSFBBl04G8DMGZ4pj8JFDcRYoqfnQCXfnBvAUENHfPL?=
 =?us-ascii?Q?Lc+a1Hq8QBHTIVbBMZwA/A6u9//K5tpF4gkZIJWs+PmuQD+2EYnvnJcNcuEU?=
 =?us-ascii?Q?lX3elIhOsiv//iZTMRGjI8VlBQL/N1SL4JTqzgCgj12QxxpwPlDcYO2MZxKn?=
 =?us-ascii?Q?vmiW7FOWXop4uvq6s6UIrSZfQgFM3D6/KKyL7SlL+IaM6Ax/BAQ9Ooou/SFx?=
 =?us-ascii?Q?GsXsk5ZWBmcChRkU1QuTwVenqEf0a8OL9skyYal/g9vtdBEb0YJ1CF2YtiWv?=
 =?us-ascii?Q?YHbV+Rq6WFbP8R+s4uTyfeq1/9WZm7rj7jQwhyjzcoJ7FTJtvwpbct9uApnZ?=
 =?us-ascii?Q?5DK0da4x8z4hryRdJV2ehsJhoGGgupbtJ90nL1CtFG7PkqxuigX2BogJvFzZ?=
 =?us-ascii?Q?ZmLKhXeQy4vughwhf9628JuKyfbyOKtu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kudWyNJtrcHWiamWJhFJt+BTxxH9K1t1PdnkCOnQ3uHPTINtRGhhHhnnzmtA?=
 =?us-ascii?Q?SxvI83ZcPqIYWW92We+ylEFtl3DqUrv4rkV1ny0v51KHwqr+Azv7n/kZ5EWw?=
 =?us-ascii?Q?FknfG0h32dRHPLQnJ8DjZd7YKW68d1x/cgcS3HnT9mHtd1gcdrPKcc77YroQ?=
 =?us-ascii?Q?8HowRewWNTuysHHKO12+Qp41T9E7aUhKJxXPl10lzt8L+RtfJcRske9mB9Iv?=
 =?us-ascii?Q?KRuUI0hHpmyZj9BQDnkkHYTkLrpdnBouAAEow+4kcAdO8DE9J9GtBOYw0Rj5?=
 =?us-ascii?Q?Q9dAXjN3zKnyj4osira7sjmh4dpAGuMpQDfe9jZr4UKvbUATz+rEF3rPDHSn?=
 =?us-ascii?Q?zny96ab+kMil4e983aJeihTYg77rHEUFtgo8oolILHcFx1BpsAwaF/ciPAou?=
 =?us-ascii?Q?rZI0MH3yklS7Vu278BI2aGg9Vr5CJxQTkVOWkltb+5sGAgfklrYi84zV8ur2?=
 =?us-ascii?Q?zx8H13kIYvSL2tmNcUkFgkKQWQ58svekoHwcVwId7B469urpc6PRUEmG/FSb?=
 =?us-ascii?Q?sAhKWU3SsHZbbO/0zd/hQmereWkT6ceu/ZI6xro3KSnsN6R12mVQQWa6grPX?=
 =?us-ascii?Q?HKpEF0GsVcVSOmoWwKIWcRcRrLiiMTXBOCYgbyDRW+21u1zun+on6t3nF+tJ?=
 =?us-ascii?Q?8hYN7O4TGNYbvfbGWv9MXTEoAs+k8Ie0xvNlggxYb67TsgvUCf9oIORMzKVm?=
 =?us-ascii?Q?tjZHQ/sQmAAFCpgiPEQY14cqqwHVEyIHx/uZWY7WlFqAkP+bSsXfDXzrMqcC?=
 =?us-ascii?Q?TgZQ/CBikhGUsm6Fnx/filMbHhQQ4czE59XeRDbIh15jBcWixbEGONJCLAim?=
 =?us-ascii?Q?x66BqZ8BUxUx5RZ1cPtvOcLmyDEau+el/Y8ZJDQKx6wloijkKWAipCyPL3to?=
 =?us-ascii?Q?tMypS+ABibgRwhvGfTz3f+mPnxyqWRnZdOyrnnMnzAuhktyoIsddeRul/eSM?=
 =?us-ascii?Q?kt3SrqKBeCG6Hw8R1O8yZR+fANZ9YvfbI5fQ6H/jPaDt2h4zFZRRtbt5dcdo?=
 =?us-ascii?Q?aEr350kkpqNjfhNWulZbkpDs4sB4rpLrLOR91hg/AYezp/BDvgqYM5RacRRW?=
 =?us-ascii?Q?Jsy5wIJJwozVfFP/aWLliwzdLp1Tzamrwxugv3E5Ih5Q1HgbWwhEGBtO2wSs?=
 =?us-ascii?Q?0tf7vdomJOvtaghr+soZnibL2V5SQ9ovJDz/AYJQe9NkxxrtBzKvayyd8wh0?=
 =?us-ascii?Q?12jHnIMtuHgMSSuVEKmBqbQ0BDqSzgxSUOZuXXps2bV80w2ON8BSJTU745vY?=
 =?us-ascii?Q?7ryWqFu/iG4yI98mYrC4VyqgSBsdinh4rwtsD5nnmuvTeSI1uoNna5vG61PU?=
 =?us-ascii?Q?Of56OK23st5ZL9Qa4qG59l/TYhoJbf7E2KzFBchplKsk5sOyAJmqzmHoNfY7?=
 =?us-ascii?Q?G/XDxilzORQOwMeyDoctiq+lYq6KFsUVIoG+VZAPz8bn8jGLT3tWsbjIGfKe?=
 =?us-ascii?Q?/kH9hJFCHNSkg9eMmZcUOb72ayOL+Qbyb1dokoTmpYWGCmO5WiR9Jmt4D4XD?=
 =?us-ascii?Q?TqxonN312DuyIQPC1mTE8AhI3+fpG3jVAbn/OGdpJhNUfu1dOZ2CIWofHqwS?=
 =?us-ascii?Q?junofYaTJedXsVJ+Cw0TjEdGOaqra1NXBEDkdWs6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a984682-a20c-481d-916f-08de1bf999f4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 23:26:37.9402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRLnXpmZeLodnjFUwj6d2kRiAv4nhJx4Et3mGyub24+q4hfBlazwdo5jClTZRjdMecoxt5FCnMorNh/3JOJ89Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9772
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

Refactor GspSequencer::run() to follow the same pattern as gsp_init_done()
by wrapping message reception in a loop that ignores unknown messages
(ERANGE errors).

Suggested-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
Additional patch to cure probe issue on Timur's GA102 (which happens to receive
too many NOCAT records).

 drivers/gpu/nova-core/gsp/sequencer.rs | 86 +++++++++++++++-----------
 1 file changed, 49 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index ecc80f668dc8..b98e5146abd8 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -35,8 +35,8 @@ impl MessageFromGsp for fw::rpc_run_cpu_sequencer_v17_00 {
 
 const CMD_SIZE: usize = size_of::<fw::GSP_SEQUENCER_BUFFER_CMD>();
 
-struct GspSequencerInfo<'a> {
-    info: &'a fw::rpc_run_cpu_sequencer_v17_00,
+struct GspSequencerInfo {
+    cmd_index: u32,
     cmd_data: KVec<u8>,
 }
 
@@ -125,7 +125,7 @@ pub(crate) fn size_bytes(&self) -> usize {
 }
 
 pub(crate) struct GspSequencer<'a> {
-    seq_info: GspSequencerInfo<'a>,
+    seq_info: GspSequencerInfo,
     bar: &'a Bar0,
     sec2_falcon: &'a Falcon<Sec2>,
     gsp_falcon: &'a Falcon<Gsp>,
@@ -368,7 +368,7 @@ fn into_iter(self) -> Self::IntoIter {
         GspSeqIter {
             cmd_data,
             current_offset: 0,
-            total_cmds: self.seq_info.info.cmdIndex,
+            total_cmds: self.seq_info.cmd_index,
             cmds_processed: 0,
             dev: self.dev,
         }
@@ -387,41 +387,53 @@ pub(crate) struct GspSequencerParams<'a> {
 
 impl<'a> GspSequencer<'a> {
     pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>, timeout: Delta) -> Result {
-        cmdq.receive_msg_from_gsp(timeout, |info, mut sbuf| {
-            let cmd_data = sbuf.flush_into_kvec(GFP_KERNEL)?;
-            let seq_info = GspSequencerInfo { info, cmd_data };
-
-            let sequencer = GspSequencer {
-                seq_info,
-                bar: params.bar,
-                sec2_falcon: params.sec2_falcon,
-                gsp_falcon: params.gsp_falcon,
-                libos_dma_handle: params.libos_dma_handle,
-                gsp_fw: params.gsp_fw,
-                dev: params.dev,
-            };
-
-            dev_dbg!(params.dev, "Running CPU Sequencer commands\n");
-
-            for cmd_result in &sequencer {
-                match cmd_result {
-                    Ok(cmd) => cmd.run(&sequencer)?,
-                    Err(e) => {
-                        dev_err!(
-                            params.dev,
-                            "Error running command at index {}\n",
-                            sequencer.seq_info.info.cmdIndex
-                        );
-                        return Err(e);
-                    }
+        let seq_info = loop {
+            match cmdq.receive_msg_from_gsp(
+                timeout,
+                |info: &fw::rpc_run_cpu_sequencer_v17_00, mut sbuf| {
+                    let cmd_data = sbuf.flush_into_kvec(GFP_KERNEL)?;
+                    Ok(GspSequencerInfo {
+                        cmd_index: info.cmdIndex,
+                        cmd_data,
+                    })
+                },
+            ) {
+                Ok(seq_info) => break seq_info,
+                Err(ERANGE) => continue,
+                Err(e) => return Err(e),
+            }
+        };
+
+        let sequencer = GspSequencer {
+            seq_info,
+            bar: params.bar,
+            sec2_falcon: params.sec2_falcon,
+            gsp_falcon: params.gsp_falcon,
+            libos_dma_handle: params.libos_dma_handle,
+            gsp_fw: params.gsp_fw,
+            dev: params.dev,
+        };
+
+        dev_dbg!(params.dev, "Running CPU Sequencer commands\n");
+
+        for cmd_result in &sequencer {
+            match cmd_result {
+                Ok(cmd) => cmd.run(&sequencer)?,
+                Err(e) => {
+                    dev_err!(
+                        params.dev,
+                        "Error running command at index {}\n",
+                        sequencer.seq_info.cmd_index
+                    );
+                    return Err(e);
                 }
             }
+        }
 
-            dev_dbg!(
-                params.dev,
-                "CPU Sequencer commands completed successfully\n"
-            );
-            Ok(())
-        })
+        dev_dbg!(
+            params.dev,
+            "CPU Sequencer commands completed successfully\n"
+        );
+        Ok(())
     }
 }
-- 
2.34.1

