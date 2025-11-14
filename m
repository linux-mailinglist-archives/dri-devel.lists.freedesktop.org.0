Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF39EC5F22F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B179110EAFF;
	Fri, 14 Nov 2025 19:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ukUmeO/P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010002.outbound.protection.outlook.com
 [40.93.198.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D317D10EAF6;
 Fri, 14 Nov 2025 19:56:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8jwKVKQcMK2s/lExNBDsKG7e81hF8+AwUIbkJTVdkENs4O4wfD6z9mUycVA6KBBfy7fOxfOAjGr6eMG8w8LUivOWMtS3QF6rkhW5w3UR8KQrr//h8XAzg3Yn8Nwla6jkW8FFnHm407YHCbSxjQvFuH5gwD8dEAg9HP+Ag467tyjwQW5e7Xpr/M1IyzGoCvCFYmT1aru5doNPKX2rU1r6yEHLkfl8VNl3/IFXSD5hLblqp2DjDq+Zs/5M+3JDOZ+qcOsqha5ALSOpFYEfw5iD5zHQnELuy42y1vRdgkDVTzQ83oPLYoA1kZT6f8041OTci7KU7swqKPs+0dTXZelMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8ugU/+b1+pZhz5jWOrHY6cKGHJFa+RvExM78rH6F7w=;
 b=EIlzD9DOQ2uqaQqg/F6/IehxrQ1orkLwETvNkULKoxga+D5JZyt4KrmrWe8ir3s1zvyJ4R6EEolSlN9JBzqo7ey3Jvtl3EiN9GJBBtBVdWJhD/56NIo99UCdKBSq6idxOFQXBerI7aqBiAWqNB6xI7WCJJZFqKquj18asKcnxIUS52hS3ODywKOi2ez76rQF0kkLNrUIkwG0zGjUV2P4ykNkcy1qXLcwBjLymhohivkdZN+w0jA2fvJFsqq7QdFr+BgfPVZH5tnBtk2qD55jyF7u2j49BK9TesQIwa8oYKuhOB8/Lfa638B1wejq32HRdHQbm/Vgp3OYAxyj1k1e+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8ugU/+b1+pZhz5jWOrHY6cKGHJFa+RvExM78rH6F7w=;
 b=ukUmeO/P6x9YJ0t8QVW6nETZ79Fy+Cr7KGjyY07nU5SAkKX6751VqkrZD7mEer+5/3AnO7I520qTXtgz3YnUGHpMnmUoMwQ+wf8MfInokAeWupyE3l6oLCWdXwJsCDdmmBv96dtb7QmqA9iPnWERptRxYjRA/wTXDlrIt34a8XOGk6ICKzwFGmWAO+b6PpJj5ETcjPgn2EGMO+hPvJoN3NGeVkKOPNlcP2XGIFR2RVFR8gqbrckMESkNd7GaDmXsLBJ8aK6XabEXRNUB1wRYiPsqT1MUsbiVo47DRpFMmadBJRfwb2VbQXEB+R9zEvl4T6MZLPUx4Mvh/LplRTo6Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 19:56:09 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:56:09 +0000
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
Subject: [PATCH v5 08/13] gpu: nova-core: sequencer: Add register opcodes
Date: Fri, 14 Nov 2025 14:55:47 -0500
Message-Id: <20251114195552.739371-9-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114195552.739371-1-joelagnelf@nvidia.com>
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF0001641B.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:10) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: ff677005-c342-4e52-2d15-08de23b7db3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?92rxgbFAY3NI1s+zzTEibKtjAlSwnM6N2QoeYK4P1m9GW7VZ6ST1W9V9Paqx?=
 =?us-ascii?Q?GN+26KguKJS0PpWOaCvg/YXzL1eYZ9+X/dVcJ1wz2xqYhptg+vqaG3gSmRoZ?=
 =?us-ascii?Q?zCK77hpdJq4wQfK02uOujskyS69J/4/Aoi1HwMiBByakJDOr7MTi4dBxLLro?=
 =?us-ascii?Q?RyBXnnwT2RjvOQ1l1CSDrFgTKdIpfpYXRPF6oMB9C+LS9qNSMsj0kIUsiQo5?=
 =?us-ascii?Q?Xqk/yJLLA0NhzYwHjNZGuM5x+41LJ1cbtnMxcsUXy5vS3lqoVDVR+dr8tKRd?=
 =?us-ascii?Q?3E76fId0dCBaKnZqygg3rSsh1oaf350/KiBfiCavdC8i30UdB9JGAvIyH4w5?=
 =?us-ascii?Q?XS8WUvqDl3xNr0PnigsFvlZMWpZQMCC1EQdqZmzDJyAouULGsww2TMOfO9HF?=
 =?us-ascii?Q?XpmsKpD8NRxQr3CzC9/qXpXxgwSU7VHTQPFWCCmJGw1RaNGvZhHih7Fjr7vL?=
 =?us-ascii?Q?9EjiXsZsDWJWTDpAjVdUs9EkCpWRlYEdYJATdxUe6TufK9fvRDz22DWXKX4I?=
 =?us-ascii?Q?6otqYZtoaokOaz85Ox5zMU7rxROBFik1WgZaBj/PwZlZVA/eMyFgf9uxbhsv?=
 =?us-ascii?Q?3GGSLLaAHO1cQplr8Pk+dLkqvA+vcJXl7C3lPhbrPHzIyH/S/x+pSQow+Kha?=
 =?us-ascii?Q?NdfE0Cacbybjv2/yPowtM08CDpj0x0dwUj/iZt99vlF+W9vIaF6pcu1vcVBY?=
 =?us-ascii?Q?PM/dfCZQByW77Q1kA4iZubHgEzDNnz7MJpUWRZ5Aj961gq0pRapO9P27skzF?=
 =?us-ascii?Q?1EqP67zeynWU/piBKVk6hxEryXajwMAq+7zecpOL/O6dVVMcMTPyQdChCD+S?=
 =?us-ascii?Q?KbUqOHx2ywzSa8Ha+zGqQ4AmtQCAZ+fnjdmhPEiIQVERziUUI9sJtpiDMPiC?=
 =?us-ascii?Q?u1kqtjWahRRFz/CQw51jInfH4FAGIOG1JHEIe6FYUZL0Kz0QXW4GwfCOLXPz?=
 =?us-ascii?Q?k9LUUmG9CD3uAa9exZOS3FcnWbsK8lmzruastcwUm+0d4smOSdQSPYchogYL?=
 =?us-ascii?Q?PnpoEcgLNwIPvM0VajPO93OIWj2+3Hs1zvsBeedgqYjhbZBDjgyz3e6HHOeQ?=
 =?us-ascii?Q?iImo/PeOPqngXqv992saHEwbIBD6YvAd3BSyTYLz/gWJxb93RCoSVBbX2R62?=
 =?us-ascii?Q?/GsbWewrXaxX+qHeyz3iGlCMPBWW/uDObkpNFJjdHoPF1n81fc5YzkFrJfic?=
 =?us-ascii?Q?3ga57adN8zg3QKACm7boYFMyysprMIiG/2cQP4+0mbVSbQuZDsVKMBQv1YFn?=
 =?us-ascii?Q?YraxmMzzmjvecDxf/+rOoqSqAif4yngDBdYTiM78xfhCI2jACv7Za/VOIXlG?=
 =?us-ascii?Q?Jt3KS5APo7igkaDqHxtMBc26jOFav68qwSArczYmcfRxMshfBdImoX/Ai8CK?=
 =?us-ascii?Q?6rfnSuniYZLOPvUh3KjVrMwlMW5GQVTR4h66tpJsxZCGOFNiCbewecmVDg5I?=
 =?us-ascii?Q?e+2y30rKaaq9U0IG5nCuEfnYle3EFHfH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V59fgstlGJIqlssPqnnVpIoKVeePPJ/AwuMjBG2yWq0Uh9ZDtCftVrKIeiid?=
 =?us-ascii?Q?Gl0PsGUMyVBST5mpcUQgl+jPUR3/4WW2orI+5ByeDleRLX68HRiA796fw4zL?=
 =?us-ascii?Q?Y92Kk/54TIrFouBEZiAtHxQ5Hdlocz30Y3J6GgXU8i3m4o5wmPwv15iQ/dfh?=
 =?us-ascii?Q?FlqLhYCZDstGeMc5OLDbWSbbWZKwjdjRGkgN4lg9wvyMP1vITxk4wX5aYqA4?=
 =?us-ascii?Q?0VQirdRlcBHIGk1TqYXkV8LKxx7N62yZ8O9wCDUY2+dwbppHBy/kUO5M9FIH?=
 =?us-ascii?Q?Dx00KKkRVnGizGajtuoF7d55Sd7tDUnH+1CmLNGotT9Z3ezIhNCEs1evznDZ?=
 =?us-ascii?Q?mGkJ/QQlDlG1cLLz4ovKBRxfKMzxCjOanAOVJgMGMwKFgaNJj8GTxyXe4fFP?=
 =?us-ascii?Q?QJDk6Wdo+m/ryq/fRRpMalNKmDvfd3ooBaZzeJr1pkPP5XqsCyFq89iLa3YU?=
 =?us-ascii?Q?wvXf6ssAk13yNNWvyFv2SufNGWcwMhewQz3P/4zRzV0N6kX2Mocb9hB+t93J?=
 =?us-ascii?Q?dB+4q9yFpKVAmgkJ8V7J2gXz8xfD4bBcAqJvWFT6uaPRJKkiNUjIOmTFVvQm?=
 =?us-ascii?Q?yW/YrqtDCQUcvLfrw1gN1t73+Qhg7HzmRZItA0kLIDea/6vqnhz8lwN0+Dzf?=
 =?us-ascii?Q?wmdrSEkV8rbEGpTkaXbUh+ZLSrax4dZmeLGt/QJk4Qv117Wfw9wFcibzmJ1n?=
 =?us-ascii?Q?XoXueoCa9idFiM12FfjOPAmR0DmHFIGBddwcfzJqf0qStEEY2ilxHRUOB7K2?=
 =?us-ascii?Q?r5TQg7qekL8zEQcBMtuprTX0zimzyund2gMsHhb8U3/2/IjE/7vNO1UKaOWr?=
 =?us-ascii?Q?jxq33UsqUIYxXD6N8GxXx2QR7EGT5xphpTvnzPLVp+Y4C4D+1KA8VnMhoXmU?=
 =?us-ascii?Q?MV6LEXAhIEwkKhswyUV8/O1hNDvMYNO5O1Vlx7RsLsw5n67H1OeprRCyShLR?=
 =?us-ascii?Q?1fFdzGtR2dzbJt1aDjk/d72Thn8qujNVxTK/LCx0+WCfN1eQYdUpXUNO0jtB?=
 =?us-ascii?Q?RbOMFuKcT/Np8T2A0aBG4VQFPK/Ttz4pqYHv5oYu13YOiqhvQ6O87rLaJBH7?=
 =?us-ascii?Q?UZpSGShZwdIGW5AFdo5dPAP47OFyqh7cpHFPW1hc2Rq+1Er6Ict0d2EmjxZa?=
 =?us-ascii?Q?syr2o0id61hc+ZgZeP7o333Oy/q3O4ncXWh7p51lRVne8XEAklK5MtyV96Wi?=
 =?us-ascii?Q?9ys0+tpLPS5lOKKKsxqjFlGmAtRqDDs2OPMsXWiUJZr+rzNfJDMFAiRLpi4a?=
 =?us-ascii?Q?bgk2KCqMypQV9z+CrqixtMHzOUAnBjEbGNmWa3BVw3sL/esVYKIQgZdP7Bjb?=
 =?us-ascii?Q?0GHuhFGZ54co7Y1wPBXn8xgDJktFWnlvRVPcozFjdLCVS1INSOR7Su5yhD3K?=
 =?us-ascii?Q?nduo3WhVU7iNAdaSCf6MMTO0t/JzuzPIi5/YqxPLUn7+X18kk6ANU5PlRO21?=
 =?us-ascii?Q?Hc4igg/ZIDJJlV0ekGHtfzbbo1OZhRhoSzvaxnKDCcPfr9aBwnf0E8D7uz9W?=
 =?us-ascii?Q?7WQIjFY6Ba/quedROSQpU6TEo2p+ltN4mD5/UwHznC7mUBrG8wpVvP/a9lmS?=
 =?us-ascii?Q?oSyJWhbDRjbYfQeoc8ddKxAOlqvDkyhISXLcWV2M?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff677005-c342-4e52-2d15-08de23b7db3e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:56:09.8593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWRPldB07Iik9xdM6FCi6lTSKMZYGggQFAQpfBF2oT+fDm7GrO2SFhxXzxQ113kwN/EWCTIHhbAO06+DurjhQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8340
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

These opcodes are used for register write, modify, poll and store (save)
sequencer operations.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs        |   4 -
 drivers/gpu/nova-core/gsp/sequencer.rs | 120 ++++++++++++++++++++++---
 2 files changed, 109 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 6d58042bc9e8..376c10cc8003 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -389,7 +389,6 @@ fn from(value: SeqBufOpcode) -> Self {
 #[derive(Copy, Clone)]
 pub(crate) struct RegWritePayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
 
-#[expect(unused)]
 impl RegWritePayload {
     /// Returns the register address.
     pub(crate) fn addr(&self) -> u32 {
@@ -413,7 +412,6 @@ unsafe impl AsBytes for RegWritePayload {}
 #[derive(Copy, Clone)]
 pub(crate) struct RegModifyPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
 
-#[expect(unused)]
 impl RegModifyPayload {
     /// Returns the register address.
     pub(crate) fn addr(&self) -> u32 {
@@ -442,7 +440,6 @@ unsafe impl AsBytes for RegModifyPayload {}
 #[derive(Copy, Clone)]
 pub(crate) struct RegPollPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
 
-#[expect(unused)]
 impl RegPollPayload {
     /// Returns the register address.
     pub(crate) fn addr(&self) -> u32 {
@@ -495,7 +492,6 @@ unsafe impl AsBytes for DelayUsPayload {}
 #[derive(Copy, Clone)]
 pub(crate) struct RegStorePayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
 
-#[expect(unused)]
 impl RegStorePayload {
     /// Returns the register address.
     pub(crate) fn addr(&self) -> u32 {
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index c5ef3a33466a..b564523b64e7 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -4,9 +4,13 @@
 
 use core::{
     array,
-    mem::size_of, //
+    mem::{
+        size_of,
+        size_of_val, //
+    }, //
 };
 use kernel::device;
+use kernel::io::poll::read_poll_timeout;
 use kernel::prelude::*;
 use kernel::time::Delta;
 use kernel::transmute::FromBytes;
@@ -56,18 +60,50 @@ struct GspSequencerInfo {
 
 /// GSP Sequencer Command types with payload data.
 /// Commands have an opcode and an opcode-dependent struct.
-#[allow(dead_code)]
-pub(crate) enum GspSeqCmd {}
+#[allow(clippy::enum_variant_names)]
+pub(crate) enum GspSeqCmd {
+    RegWrite(fw::RegWritePayload),
+    RegModify(fw::RegModifyPayload),
+    RegPoll(fw::RegPollPayload),
+    RegStore(fw::RegStorePayload),
+}
 
 impl GspSeqCmd {
     /// Creates a new `GspSeqCmd` from raw data returning the command and its size in bytes.
-    pub(crate) fn new(data: &[u8], _dev: &device::Device) -> Result<(Self, usize)> {
-        let _fw_cmd = fw::SequencerBufferCmd::from_bytes(data).ok_or(EINVAL)?;
-        let _opcode_size = core::mem::size_of::<u32>();
+    pub(crate) fn new(data: &[u8], dev: &device::Device) -> Result<(Self, usize)> {
+        let fw_cmd = fw::SequencerBufferCmd::from_bytes(data).ok_or(EINVAL)?;
+        let opcode_size = core::mem::size_of::<u32>();
+
+        let (cmd, size) = match fw_cmd.opcode()? {
+            fw::SeqBufOpcode::RegWrite => {
+                let payload = fw_cmd.reg_write_payload()?;
+                let size = opcode_size + size_of_val(&payload);
+                (GspSeqCmd::RegWrite(payload), size)
+            }
+            fw::SeqBufOpcode::RegModify => {
+                let payload = fw_cmd.reg_modify_payload()?;
+                let size = opcode_size + size_of_val(&payload);
+                (GspSeqCmd::RegModify(payload), size)
+            }
+            fw::SeqBufOpcode::RegPoll => {
+                let payload = fw_cmd.reg_poll_payload()?;
+                let size = opcode_size + size_of_val(&payload);
+                (GspSeqCmd::RegPoll(payload), size)
+            }
+            fw::SeqBufOpcode::RegStore => {
+                let payload = fw_cmd.reg_store_payload()?;
+                let size = opcode_size + size_of_val(&payload);
+                (GspSeqCmd::RegStore(payload), size)
+            }
+            _ => return Err(EINVAL),
+        };
+
+        if data.len() < size {
+            dev_err!(dev, "Data is not enough for command");
+            return Err(EINVAL);
+        }
 
-        // NOTE: At this commit, NO opcodes exist yet, so just return error.
-        // Later commits will add match arms here.
-        Err(EINVAL)
+        Ok((cmd, size))
     }
 }
 
@@ -95,12 +131,74 @@ pub(crate) trait GspSeqCmdRunner {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
 }
 
-impl GspSeqCmdRunner for GspSeqCmd {
-    fn run(&self, _seq: &GspSequencer<'_>) -> Result {
+impl GspSeqCmdRunner for fw::RegWritePayload {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        let addr = self.addr() as usize;
+        let val = self.val();
+        let _ = sequencer.bar.try_write32(val, addr);
         Ok(())
     }
 }
 
+impl GspSeqCmdRunner for fw::RegModifyPayload {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        let addr = self.addr() as usize;
+        if let Ok(temp) = sequencer.bar.try_read32(addr) {
+            let _ = sequencer
+                .bar
+                .try_write32((temp & !self.mask()) | self.val(), addr);
+        }
+        Ok(())
+    }
+}
+
+impl GspSeqCmdRunner for fw::RegPollPayload {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        let addr = self.addr() as usize;
+
+        // Default timeout to 4 seconds.
+        let timeout_us = if self.timeout() == 0 {
+            4_000_000
+        } else {
+            i64::from(self.timeout())
+        };
+
+        // First read.
+        sequencer.bar.try_read32(addr)?;
+
+        // Poll the requested register with requested timeout.
+        read_poll_timeout(
+            || sequencer.bar.try_read32(addr),
+            |current| (current & self.mask()) == self.val(),
+            Delta::ZERO,
+            Delta::from_micros(timeout_us),
+        )
+        .map(|_| ())
+    }
+}
+
+impl GspSeqCmdRunner for fw::RegStorePayload {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        let addr = self.addr() as usize;
+        let _index = self.index();
+
+        let _val = sequencer.bar.try_read32(addr)?;
+
+        Ok(())
+    }
+}
+
+impl GspSeqCmdRunner for GspSeqCmd {
+    fn run(&self, seq: &GspSequencer<'_>) -> Result {
+        match self {
+            GspSeqCmd::RegWrite(cmd) => cmd.run(seq),
+            GspSeqCmd::RegModify(cmd) => cmd.run(seq),
+            GspSeqCmd::RegPoll(cmd) => cmd.run(seq),
+            GspSeqCmd::RegStore(cmd) => cmd.run(seq),
+        }
+    }
+}
+
 /// Iterator over GSP sequencer commands.
 pub(crate) struct GspSeqIter<'a> {
     /// Command data buffer.
-- 
2.34.1

