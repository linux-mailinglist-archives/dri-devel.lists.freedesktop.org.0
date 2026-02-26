Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJXzFa9eoGmMiwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 15:54:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E335C1A80BC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 15:54:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F12610E978;
	Thu, 26 Feb 2026 14:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jeS5Q1xE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012061.outbound.protection.outlook.com
 [40.107.200.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791D110E97D;
 Thu, 26 Feb 2026 14:54:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWGKaTXF8G1bdC9xV39363cZ1Ost0uHuymf0hWLXx0K3G5uS7Xa5LV97h2hCjf2hC3BPbP6bWUDq0aC0YmAzwYc33bYleK2zDbOKauEFKcedyNq/IUMd6ah5QqV40Yvo3wRKz+IeVaX6y4cr3+gjr67efZIgdtqWzNf8HQiwz4Qr3hYUGSW/w8pfaK0DrUX6kTEfRc4c0+Do5D91OGVCLl2bDqUqBJOASo2Tg2t094Yvzil28JMSzmEURyLZumZFND+T5Mj0flMjsiY2jab1OvWUelV/RlzHeDMzAVdHUtUB0xRzm969UVgYqNVwTsX7nlop0j4DWX1UJI9VxVINqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpxaSbRKlOV1SmbEkgnpBAe8uAzratSOMH+dAZvsRAM=;
 b=Caa5heu+jYEOXJPmm03UDeYRjjWQLZ0voPyeKOFPwWZ4gtTjJyA+mCT7nrUuaBipu2EqDBlVKJKnvpoWWMfn5cPKloeynbvbQgulsKvy4b7QdOa/rPQoiLcoQr1tY9X5acQapx8PqTww4D6oOkMYWywK4ZamOJf1kMM+Y18yXqx0I7LYMgTGOLuZ5WSJhmMBh2bCA3G1+O3IkVYUGuDydNUQr+DCauLYqWr04ijXefx7QNwVRs7pCSx0oSBoI9JjYvYqR0dZ5bbFvM1Joy6vGeNA6qO7GkW6yY8rJKO4MDD/ap4KOwzYVEZ59cWKin7QTx/tHOmWwXEm26vTumn3nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpxaSbRKlOV1SmbEkgnpBAe8uAzratSOMH+dAZvsRAM=;
 b=jeS5Q1xEzhcEv3VsoIKbIL6XElPqfp5uRPlQ+I5drt5lGntSfmIFyjKZUnhK5IR+VO24c6xGVF/MyKHs8so1TOQiVPH5t2PDbg2vyDyTz3PNdzNyTjhR9EoyBzM7Do81JyPFAl7EFoxD2EIMtCH1CMP/sZZuGmgVv1FOCs13nMsOrz2GVY72cGtoESEGYULzdOd/mcmOYnwLSxPJiLNWhk1/ZDJRijOmw0uK4QZzGYmBkAz8XW65aNE81/+cCwCrPL3Aqw4u+AXj64p/BdcjF7aVxtxLhLAF+7PHNx+6xo09XXUsh5K9xK9HJ4H/Tj+z/Z7cxk+uz2YGhojylrQQuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH1PR12MB9598.namprd12.prod.outlook.com (2603:10b6:610:2ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 14:54:28 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 14:54:28 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 26 Feb 2026 23:50:26 +0900
Subject: [PATCH v2 4/4] gpu: nova-core: gsp: add mutex locking to Cmdq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-cmdq-locking-v2-4-c7e16a6d5885@nvidia.com>
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
In-Reply-To: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0110.jpnprd01.prod.outlook.com
 (2603:1096:405:4::26) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH1PR12MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: 73fc561f-a514-4424-e91d-08de7546f0b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: +urbPeR66aOlDPw12oB8Nlkq+/KQ2F7fDwissFj04EkoCQ1qmsASzfl9BIHraT1liIXG4xwX9UGdCwGZsV0lLyUwhhAeM8rU6pNYV9drRWq1XwYaZBCkb/OFITUu7RW41Xtuc9JJmxThtHnO8ovCQK6b+0grtjEy+abJ3pMcVaDMsYKon9uKikkW8EHYN8CiYb7ADd2pqozXjsiSP+lJHFOPCBGv4R/Qh+ZWCSsaelWzIb0QRiAhjupgxzeCxKY5UIgtCSEAnCyyUXfE5SaMqzNpSAT6LhQG9CIjZ7xFUaGFQlFPvdhzSigwPhqb6+JznmNli9kl5SXx19cc3Fy9Jr2P+0m0PPm2THDdXpLqrajj9y7Bf88rYbfawsNHw+sprWzU1Xw2/BN8noIOznPmoq3xc6u/wIKtbFVjRiBEBUMRhiSYP+jp3vhIL0By68+6OKR9bOvlNbwFI6vFpQdakcvMNJCvP1TrnPwdZeuZliBYysKt7nWoPKXGFBLkkFvoxS/6Y3rF1OW9c8IZtB2xGctsMm6DwiVh+NNumhue3qnUIoGy9jrEKPGk+XgfF5ds35BxO7k+TjV5NZSy4LSIo40VzJ2HnsSghKqpyKH8icym04E1LwKFtD2p1gKDN7zCAbJyGxYyagBYRWHhd5sk4U3wlFyyc3RZIZ1cJVkn6DDExKa7Mz+Xm4pFyB1jlyi9Tqbyh+zNb4JsgQ1IiZNXo34IqGod0lIZlkKrQM8Ijug=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTFUVnlmRTQzVkpvS0xoUXlseTVMWkhmc0V6azcvYmZ0SUp6L2pKY0NzY2dr?=
 =?utf-8?B?b01hNkpBSUhoTXNVaGJvMldwNnlrVDFKbzRaYmpiL0hWU3N3RGQ3MTVHVGZL?=
 =?utf-8?B?NHZVZ29hc1NocGJJTHJlcmppdXlPNVp3SE9OQ2dFby8ybm5xUkUvaFp3MnlX?=
 =?utf-8?B?WnZxWFMrT0tIbFJmejNKZUFjakplSmF3K1FiclpiZElkV0JkZU9OVzdDa3hJ?=
 =?utf-8?B?NjIvS1lYTEhFTllUem5MWUhDM1g0YW1rR2gzUXlORDU2Q2ZQUm8vT0FRcjBl?=
 =?utf-8?B?SWpOeVBZTEtvT1BIdU9RL0ZOdzMyQlFVMmZ3dlBhVmlHRXFOZG1ma05WVXZZ?=
 =?utf-8?B?T1lPaC9nRDN0c0VxOVFXTm1tVzNIbWVnVlVody9wUDJOTXRBSWs1TFB1T3Nq?=
 =?utf-8?B?SE1GUlFrNmVFdjhNMVorem1lSG1udTBpOFJKbGliS3ZFcXVFS0dXaEtsU3Z5?=
 =?utf-8?B?R1VqMFZ6VGJtYU9VQzREd0tObCtaOU11QWV3WkJkZGZzRFR3emhvU1h0N2I5?=
 =?utf-8?B?NnE4VFpVVjVxWVVjdG5vVjNmSDNqRGQ3TVpUYzB3a1RmNmQ1ODNSaVBqN0tX?=
 =?utf-8?B?akxCWlFtWTc0YTduYlpYdWcvK3Vsb0Y3WUhlcE9jczcyeFIvZFVXUEJ2c0pT?=
 =?utf-8?B?MmJLUjdKRFhJY1ZocHNoSHUrL1hBNXlQV1FXNUdQOFZPWnFzVk0rZ2R5bHVJ?=
 =?utf-8?B?RGsxMUREbTFvTzJocmc1T1dYTGZjckM4djBkSTJxY1p6cWZpWjhWMDFBRGJ6?=
 =?utf-8?B?dHlxNjEyVGZwa3B4c2xWMHRTMmY3VzdkMGZVVGd5UjBzcDl3VEhvYlh2U0Fo?=
 =?utf-8?B?SXh2N2dORGduTTZwZmxLVVpCN2RKcnlGQlZzeHl6cnlaeHR4Z2ZSY1pvcGNJ?=
 =?utf-8?B?WWdoc1RnTlE1WTN6amJFZW96WUZMMC9MWElNRENRWlVxd0NpMTVwMWZsclo1?=
 =?utf-8?B?U1BNOCtJNFloc1lPRmFJMnpyUWZod1ppUGtKNHNmUENHcHhmTUwrdno5WHdB?=
 =?utf-8?B?T2lqK09uTkV6bDY5VjUzRmk1ZXBvNUFWVHAwZmRwU00wdFUrL2oyRmVTWXVu?=
 =?utf-8?B?VU53MldpOWF0UHZJTE9rWlZ2cENGZ1BHdkRhOHRYZVJ3aGE1ODRQcklKS1pn?=
 =?utf-8?B?ZnBlUDJYT1Z6Y3dsVm1KSVVlV3EzVE5YLzZLb1A3Q0NXSUMrOXZiR2FwNzNr?=
 =?utf-8?B?eEdYS0laQmtMck9hcFE5akViQzZZUWo1Z0lZLzRCd3pDQVdNemRGRkNLUEFT?=
 =?utf-8?B?M1FTMElJWWtveE11UURMU3Jjak52ZVdWQm9wUWtaWTJ1SDNNYkpiQldROXJO?=
 =?utf-8?B?M1RHOFA4MzVSWENZS1RXYzNEdnR3c05uVXdRMmUxTlBPWEdadE55dU0rYlU3?=
 =?utf-8?B?ZVpVdDNLdTBCa01CNmMxT2xISGdxRmQreElsRXVVSFE0eTRubHBKVFhueVZ3?=
 =?utf-8?B?OE5iMUdrdDJONzRvMHlvb3MzS1VpMWpOVk1jN3ZmMkoyRE0rOEZQSzZnU3U4?=
 =?utf-8?B?MnAxS1pBYjFpQmxKMHlWeG5FY0JtdzM1WVJsY3N2dkdBbDVzTDJNQmxkVHI4?=
 =?utf-8?B?YVE2cU5yOG9kRFFkb0tYWVp1ZzNMYmZuRmwwcWJTMDJ4cnVNNGhUOTNMcTVI?=
 =?utf-8?B?K1RZd2MwamRaYXcvaVJtNVdlNmpxVGhJR0hKby90RTVPcTJUZTRZTFM1TWpL?=
 =?utf-8?B?SUtuNkJvU3YvZnJOZnpyMEdlUUxQRDEydkl2TW1SSmJLMURKNXpYTkliM0gv?=
 =?utf-8?B?SUl0c3Y0UEMyeTZKckovQmtPQ1Q5VUcxWFhIMkp1bDV6aGZGbVRaWVNxamNu?=
 =?utf-8?B?V3l3eDZHeGtuM2lBaXI5dmZzR1VZR3o3VWIvTW1OQ2VSMnBXR0ZaSEQ1YlVF?=
 =?utf-8?B?UE8zL3FwaTlIanlIT3FCY3U5ZXZrdG9YZHhFemFPdmljS2NnNm1OaitnbXZG?=
 =?utf-8?B?cU44VTJlZjRQZU9mY2FCeGp4bVUwN0pHNUJQaUI4Ri9TdDB5T0xNVzBJY2hW?=
 =?utf-8?B?ODlnVHlRWklJSVNwWWpmYW5pUWwzWUNUSDdibXh5R2V4azMzbEZKSmROczRS?=
 =?utf-8?B?bFkybUNuWjk1MnV1bWthRzk3VU55akxqUXRla05IM1RBYXlSOWU1bVdaWm5X?=
 =?utf-8?B?RjdyQXZ2Vitna2ZZQjB4NXEyS1FLSFAyaVlPUUd1cStsR2FqallJY3lncEJN?=
 =?utf-8?B?c3M4MlBPU0Y2MGppSEhJZ2IyUi82dVdZa1ZnVkpkaVVGTnVsZmtJOS9wOFEr?=
 =?utf-8?B?cm44NnhCcXQ5WlROUVhEdW13aDU1aGhZdWZkZlJ6RFF4WVhPMUlGeGozblht?=
 =?utf-8?B?cCs4dzViOGZjMDlmUHRqVGg0NUdFbEtSRHRadmlXajIvM2o0UlVaWmRuZytG?=
 =?utf-8?Q?bomaM4SBqZo8zekLmtOOhfGQ03exQNxl090Jz2t7OxsxY?=
X-MS-Exchange-AntiSpam-MessageData-1: qAQXDb0ADvurtw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fc561f-a514-4424-e91d-08de7546f0b1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 14:54:28.2395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bv7Zy1jbzUOSBIaqH+/gc97+6W6rGxccrAKcYUemEeD/9zmPKdrPc91ovyt6IYW2zyTdP+cN1WObiPr91YxLDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9598
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: E335C1A80BC
X-Rspamd-Action: no action

Wrap `Cmdq`'s mutable state in a new struct `CmdqInner` and wrap that in
a Mutex. This lets `Cmdq` methods take &self instead of &mut self, which
lets required commands be sent e.g. while unloading the driver.

The mutex is held over both send and receive in `send_sync_command` to
make sure that it doesn't get the reply of some other command that could
have been sent just beforehand.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs      |   8 +-
 drivers/gpu/nova-core/gsp/cmdq.rs      | 266 ++++++++++++++++++---------------
 drivers/gpu/nova-core/gsp/commands.rs  |   4 +-
 drivers/gpu/nova-core/gsp/sequencer.rs |   2 +-
 4 files changed, 153 insertions(+), 127 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 55899eba75db..d12ad1bd2cd8 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -128,7 +128,7 @@ fn run_fwsec_frts(
     ///
     /// Upon return, the GSP is up and running, and its runtime object given as return value.
     pub(crate) fn boot(
-        mut self: Pin<&mut Self>,
+        self: Pin<&mut Self>,
         pdev: &pci::Device<device::Bound>,
         bar: &Bar0,
         chipset: Chipset,
@@ -214,13 +214,13 @@ pub(crate) fn boot(
             dev: pdev.as_ref().into(),
             bar,
         };
-        GspSequencer::run(&mut self.cmdq, seq_params)?;
+        GspSequencer::run(&self.cmdq, seq_params)?;
 
         // Wait until GSP is fully initialized.
-        commands::wait_gsp_init_done(&mut self.cmdq)?;
+        commands::wait_gsp_init_done(&self.cmdq)?;
 
         // Obtain and display basic GPU information.
-        let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
+        let info = commands::get_gsp_info(&self.cmdq, bar)?;
         match info.gpu_name() {
             Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
             Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 6bb1decd2af5..5010587c96f9 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -16,8 +16,12 @@
     },
     dma_write,
     io::poll::read_poll_timeout,
+    new_mutex,
     prelude::*,
-    sync::aref::ARef,
+    sync::{
+        aref::ARef,
+        Mutex, //
+    },
     time::Delta,
     transmute::{
         AsBytes,
@@ -54,8 +58,8 @@
 
 /// Trait implemented by types representing a command to send to the GSP.
 ///
-/// The main purpose of this trait is to provide [`Cmdq::send_command`] with the information it
-/// needs to send a given command.
+/// The main purpose of this trait is to provide [`Cmdq`] with the information it needs to send
+/// a given command.
 ///
 /// [`CommandToGsp::init`] in particular is responsible for initializing the command directly
 /// into the space reserved for it in the command queue buffer.
@@ -470,66 +474,15 @@ pub(crate) fn command_size<M>(command: &M) -> usize
     size_of::<M::Command>() + command.variable_payload_len()
 }
 
-/// GSP command queue.
-///
-/// Provides the ability to send commands and receive messages from the GSP using a shared memory
-/// area.
-#[pin_data]
-pub(crate) struct Cmdq {
-    /// Device this command queue belongs to.
-    dev: ARef<device::Device>,
+/// Inner mutex protected state of [`Cmdq`].
+struct CmdqInner {
     /// Current command sequence number.
     seq: u32,
     /// Memory area shared with the GSP for communicating commands and messages.
     gsp_mem: DmaGspMem,
 }
 
-impl Cmdq {
-    /// Offset of the data after the PTEs.
-    const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq);
-
-    /// Offset of command queue ring buffer.
-    pub(crate) const CMDQ_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq)
-        + core::mem::offset_of!(Msgq, msgq)
-        - Self::POST_PTE_OFFSET;
-
-    /// Offset of message queue ring buffer.
-    pub(crate) const STATQ_OFFSET: usize = core::mem::offset_of!(GspMem, gspq)
-        + core::mem::offset_of!(Msgq, msgq)
-        - Self::POST_PTE_OFFSET;
-
-    /// Number of page table entries for the GSP shared region.
-    pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
-
-    /// Creates a new command queue for `dev`.
-    pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
-        try_pin_init!(Self {
-            gsp_mem: DmaGspMem::new(dev)?,
-            dev: dev.into(),
-            seq: 0,
-        })
-    }
-
-    /// Computes the checksum for the message pointed to by `it`.
-    ///
-    /// A message is made of several parts, so `it` is an iterator over byte slices representing
-    /// these parts.
-    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
-        let sum64 = it
-            .enumerate()
-            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
-            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_left(rol));
-
-        ((sum64 >> 32) as u32) ^ (sum64 as u32)
-    }
-
-    /// Notifies the GSP that we have updated the command queue pointers.
-    fn notify_gsp(bar: &Bar0) {
-        regs::NV_PGSP_QUEUE_HEAD::default()
-            .set_address(0)
-            .write(bar);
-    }
-
+impl CmdqInner {
     /// Sends `command` to the GSP, without splitting it.
     ///
     /// # Errors
@@ -540,7 +493,7 @@ fn notify_gsp(bar: &Bar0) {
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_single_command<M>(&mut self, dev: &device::Device, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
@@ -583,7 +536,7 @@ fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
             ])));
 
         dev_dbg!(
-            &self.dev,
+            dev,
             "GSP RPC: send: seq# {}, function={:?}, length=0x{:x}\n",
             self.seq,
             M::FUNCTION,
@@ -610,73 +563,27 @@ fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_command<M>(&mut self, dev: &device::Device, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
         Error: From<M::InitError>,
     {
         let mut state = SplitState::new(&command)?;
-
-        self.send_single_command(bar, state.command(command))?;
+        self.send_single_command(dev, bar, state.command(command))?;
 
         while let Some(continuation) = state.next_continuation_record() {
             dev_dbg!(
-                &self.dev,
+                dev,
                 "GSP RPC: send continuation: size=0x{:x}\n",
                 command_size(&continuation),
             );
             // Turbofish needed because the compiler cannot infer M here.
-            self.send_single_command::<ContinuationRecord<'_>>(bar, continuation)?;
+            self.send_single_command::<ContinuationRecord<'_>>(dev, bar, continuation)?;
         }
 
         Ok(())
     }
 
-    /// Sends `command` to the GSP and waits for the reply.
-    ///
-    /// # Errors
-    ///
-    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply is
-    ///   not received within the timeout.
-    /// - `EIO` if the variable payload requested by the command has not been entirely
-    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
-    ///
-    /// Error codes returned by the command and reply initializers are propagated as-is.
-    pub(crate) fn send_sync_command<M>(&mut self, bar: &Bar0, command: M) -> Result<M::Reply>
-    where
-        M: CommandToGsp,
-        M::Reply: MessageFromGsp,
-        Error: From<M::InitError>,
-        Error: From<<M::Reply as MessageFromGsp>::InitError>,
-    {
-        self.send_command(bar, command)?;
-
-        loop {
-            match self.receive_msg::<M::Reply>(Delta::from_secs(10)) {
-                Ok(reply) => break Ok(reply),
-                Err(ERANGE) => continue,
-                Err(e) => break Err(e),
-            }
-        }
-    }
-
-    /// Sends `command` to the GSP without waiting for a reply.
-    ///
-    /// # Errors
-    ///
-    /// - `ETIMEDOUT` if space does not become available within the timeout.
-    /// - `EIO` if the variable payload requested by the command has not been entirely
-    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
-    ///
-    /// Error codes returned by the command initializers are propagated as-is.
-    pub(crate) fn send_async_command<M>(&mut self, bar: &Bar0, command: M) -> Result
-    where
-        M: CommandToGsp<Reply = NoReply>,
-        Error: From<M::InitError>,
-    {
-        self.send_command(bar, command)
-    }
-
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
@@ -695,7 +602,7 @@ pub(crate) fn send_async_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     ///   message queue.
     ///
     /// Error codes returned by the message constructor are propagated as-is.
-    fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
+    fn wait_for_msg(&self, dev: &device::Device, timeout: Delta) -> Result<GspMessage<'_>> {
         // Wait for a message to arrive from the GSP.
         let (slice_1, slice_2) = read_poll_timeout(
             || Ok(self.gsp_mem.driver_read_area()),
@@ -712,7 +619,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         let (header, slice_1) = GspMsgElement::from_bytes_prefix(slice_1).ok_or(EIO)?;
 
         dev_dbg!(
-            self.dev,
+            dev,
             "GSP RPC: receive: seq# {}, function={:?}, length=0x{:x}\n",
             header.sequence(),
             header.function(),
@@ -747,7 +654,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         ])) != 0
         {
             dev_err!(
-                self.dev,
+                dev,
                 "GSP RPC: receive: Call {} - bad checksum\n",
                 header.sequence()
             );
@@ -776,12 +683,12 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// - `ERANGE` if the message had a recognized but non-matching function code.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
-    pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
+    fn receive_msg<M: MessageFromGsp>(&mut self, dev: &device::Device, timeout: Delta) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        let message = self.wait_for_msg(timeout)?;
+        let message = self.wait_for_msg(dev, timeout)?;
         let function = message.header.function().map_err(|_| EINVAL)?;
 
         // Extract the message. Store the result as we want to advance the read pointer even in
@@ -794,11 +701,7 @@ pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Resul
                 .map_err(|e| e.into())
                 .inspect(|_| {
                     if !sbuffer.is_empty() {
-                        dev_warn!(
-                            &self.dev,
-                            "GSP message {:?} has unprocessed data\n",
-                            function
-                        );
+                        dev_warn!(dev, "GSP message {:?} has unprocessed data\n", function);
                     }
                 })
         } else {
@@ -812,9 +715,132 @@ pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Resul
 
         result
     }
+}
+
+/// GSP command queue.
+///
+/// Provides the ability to send commands and receive messages from the GSP using a shared memory
+/// area.
+#[pin_data]
+pub(crate) struct Cmdq {
+    /// Device this command queue belongs to.
+    dev: ARef<device::Device>,
+    /// Inner mutex-protected state.
+    #[pin]
+    inner: Mutex<CmdqInner>,
+}
+
+impl Cmdq {
+    /// Offset of the data after the PTEs.
+    const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq);
+
+    /// Offset of command queue ring buffer.
+    pub(crate) const CMDQ_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Offset of message queue ring buffer.
+    pub(crate) const STATQ_OFFSET: usize = core::mem::offset_of!(GspMem, gspq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Number of page table entries for the GSP shared region.
+    pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
+
+    /// Creates a new command queue for `dev`.
+    pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
+        try_pin_init!(Self {
+            inner <- new_mutex!(CmdqInner {
+                gsp_mem: DmaGspMem::new(dev)?,
+                seq: 0,
+                }),
+            dev: dev.into(),
+        })
+    }
+
+    /// Computes the checksum for the message pointed to by `it`.
+    ///
+    /// A message is made of several parts, so `it` is an iterator over byte slices representing
+    /// these parts.
+    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
+        let sum64 = it
+            .enumerate()
+            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
+            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_left(rol));
+
+        ((sum64 >> 32) as u32) ^ (sum64 as u32)
+    }
+
+    /// Notifies the GSP that we have updated the command queue pointers.
+    fn notify_gsp(bar: &Bar0) {
+        regs::NV_PGSP_QUEUE_HEAD::default()
+            .set_address(0)
+            .write(bar);
+    }
+
+    /// Sends `command` to the GSP and waits for the reply.
+    ///
+    /// The mutex is held for the entire send+receive cycle to ensure that no other command can
+    /// be interleaved. Messages with non-matching function codes are silently consumed until the
+    /// expected reply arrives.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply is
+    ///   not received within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command and reply initializers are propagated as-is.
+    pub(crate) fn send_sync_command<M>(&self, bar: &Bar0, command: M) -> Result<M::Reply>
+    where
+        M: CommandToGsp,
+        M::Reply: MessageFromGsp,
+        Error: From<M::InitError>,
+        Error: From<<M::Reply as MessageFromGsp>::InitError>,
+    {
+        let mut inner = self.inner.lock();
+        inner.send_command(&self.dev, bar, command)?;
+
+        loop {
+            match inner.receive_msg::<M::Reply>(&self.dev, Delta::from_secs(10)) {
+                Ok(reply) => break Ok(reply),
+                Err(ERANGE) => continue,
+                Err(e) => break Err(e),
+            }
+        }
+    }
+
+    /// Sends `command` to the GSP without waiting for a reply.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializers are propagated as-is.
+    pub(crate) fn send_async_command<M>(&self, bar: &Bar0, command: M) -> Result
+    where
+        M: CommandToGsp<Reply = NoReply>,
+        Error: From<M::InitError>,
+    {
+        self.inner.lock().send_command(&self.dev, bar, command)
+    }
+
+    /// Receive a message from the GSP.
+    ///
+    /// See [`CmdqInner::receive_msg`] for details.
+    pub(crate) fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
+    where
+        // This allows all error types, including `Infallible`, to be used for `M::InitError`.
+        Error: From<M::InitError>,
+    {
+        self.inner.lock().receive_msg(&self.dev, timeout)
+    }
 
     /// Returns the DMA handle of the command queue's shared memory region.
     pub(crate) fn dma_handle(&self) -> DmaAddress {
-        self.gsp_mem.0.dma_handle()
+        self.inner.lock().gsp_mem.0.dma_handle()
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 47ca31611927..4740cda0b51c 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -170,7 +170,7 @@ fn read(
 }
 
 /// Waits for GSP initialization to complete.
-pub(crate) fn wait_gsp_init_done(cmdq: &mut Cmdq) -> Result {
+pub(crate) fn wait_gsp_init_done(cmdq: &Cmdq) -> Result {
     loop {
         match cmdq.receive_msg::<GspInitDone>(Delta::from_secs(10)) {
             Ok(_) => break Ok(()),
@@ -239,7 +239,7 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
 }
 
 /// Send the [`GetGspInfo`] command and awaits for its reply.
-pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGspStaticInfoReply> {
+pub(crate) fn get_gsp_info(cmdq: &Cmdq, bar: &Bar0) -> Result<GetGspStaticInfoReply> {
     cmdq.send_sync_command(bar, GetGspStaticInfo)
 }
 
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 0cfbedc47fcf..f99f4fe652ba 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -356,7 +356,7 @@ pub(crate) struct GspSequencerParams<'a> {
 }
 
 impl<'a> GspSequencer<'a> {
-    pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>) -> Result {
+    pub(crate) fn run(cmdq: &Cmdq, params: GspSequencerParams<'a>) -> Result {
         let seq_info = loop {
             match cmdq.receive_msg::<GspSequence>(Delta::from_secs(10)) {
                 Ok(seq_info) => break seq_info,

-- 
2.53.0

