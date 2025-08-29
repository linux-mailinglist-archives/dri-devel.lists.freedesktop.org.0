Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6E2B3C1CF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9470610EC10;
	Fri, 29 Aug 2025 17:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CxGz8VgD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533B510E1CD;
 Fri, 29 Aug 2025 17:33:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=na2Gd+Hcjc6DMpM28TxcxpMC9C2RObvpIP5xuQ6KRHu298BJM0LhHMwE+naQ7ingdPdsgZtdVhhOLcAT5BUT4dK2YU3CV2QZfsGySyA1u9S1bAr1QPZePSHreTp1wUuUv35go+/DFfvWCFj/Zv2bF0fXOdm7Wphs9XCY+WlYDKDHRbvSG+DMAowjpFKlRqcc54I0PJg1H8EPjoqywUYg5aAdjMo8sxh2y+KFovkii8uE2BfmP5cCFi/wki2h1cfMoXQ76LZmOiCjv1h77CWI1e+Azpj3pNnUv9FbsGhJqXO8nGnUTRDjoYP8u9l+Z3GKTtIlpyTwSzr2EI0159RidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1lJY4bkIY2BulyhezZmA4QX2wOzDiz8rHakBc8W4Hw=;
 b=agKuGiUqrnEugisBjWNAfP+fYd3iEp8tUhhy7KlEG5VNhoKyvJTCU8flVlO4bM0BNY8cyGcFlBqz282uW4Y/m4InjPlhVVIiSdZnwdHKqg5G/IM1DHPxDFlNoTCtr7g2vB21TFhbS8WiOkQtr1TC85zhKYP1TfvfvPpbflS5NS+gstNPNuK7c3p+dDx9daSekQitbNMZJEr9rJXRpYaCdlhc9bh9n1fWsgy/1/AD+8R6SApMy+cB7C2hZKH6BK5uSMVSYM8HPOM749P5+UiJJNJNiFpQ5gtWmZNGy53LRvRnWN9s2PxefDNqQLDdvwFSd6cBrzk7+j689AY3Fp828g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1lJY4bkIY2BulyhezZmA4QX2wOzDiz8rHakBc8W4Hw=;
 b=CxGz8VgDbtspvnRNQUK/SUKGc+7qHg9TQCef1kBouZOysg09gvvJGZi/0VCx862qHv+ktblP+wc5nzKAHwPcMP+D3+XCIbAn5ArFY7q8N/Rub4dcO1UcP/+lMwAdEeieRuVkFwMMZ6ncH4X4SQFG0v5FIwULbeI8nxQ/LzXV5wNv91eNEbXuQPTQCd2WQY6ZvQj3f2bx9Agh+Gb9leBKB7pPIlRP9fAdK7ZE8W5J3iOqFaubWZGyoQQGAAp8cFwAejhDriNcf0sWGAgBJdssHHdeQlw+o/zg43lU7mgTXgbF93Ne/DDhahAcOcMy7lWXsS6SwAN15NglZlsRTXvIgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 17:33:30 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:30 +0000
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
Subject: [PATCH 12/17] nova-core: clear MBOX0 before waiting for scrubber
 completion
Date: Fri, 29 Aug 2025 13:32:49 -0400
Message-Id: <20250829173254.2068763-13-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:408:ff::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: 58772099-060d-4e32-2a43-08dde7222b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EvShGkagurBtPcf6jmo3rBW7ExBqOjmEcNChCxWoew4z15CQl/sE3w0BPLS8?=
 =?us-ascii?Q?eKfQD591aY1NsVku10ey+ylc1w9BmqHaB0mupQ6tO/LrPVLpnVTDFrfu9GZ6?=
 =?us-ascii?Q?fnUFCyGZI4oMGsEDmdnkTMcd+b0v42Jtv1EjHKCbcz/Ybm17EKx6wxCyIJHM?=
 =?us-ascii?Q?5VMh2atMaTZB7UTpvsV4NSFhKFjtST2HJTKmi93EXdtInbdOiANiXCRQQu16?=
 =?us-ascii?Q?AkFUHBWkm/i01/vC3vL7PkJYGKaBoFg4x74sMM7Qr5VAYuXPip/6dsx09bAI?=
 =?us-ascii?Q?WnlpgAQdqP/EoxJ3D6t5JDv+hjiw6c0BbWRwnHp1Y6PD0eJCXvSNk5k7oRTh?=
 =?us-ascii?Q?bWqk74QfPtROZkxfbeBCubHy98BibAs7vVJB/29qbDfFYsTdPN9DDAl8vSLK?=
 =?us-ascii?Q?ldjNxMBd0qiz2bJ5H7+GOOtGbMi+lqqXgMF2BhkaKbpTiXyy5JngjnHpRHMw?=
 =?us-ascii?Q?EngY+LSR4xloNrar3T1zgYBou277Fd1VQcCoe4J+nZQ0ySI/nfu4JSqRY6nZ?=
 =?us-ascii?Q?LjVQNrdpOHhpryyotDJ0VQksX3mEx7iAu8MiRfwDiH94a7vEhv3kkOXPaXk6?=
 =?us-ascii?Q?Xr6ghPzIDiUJ5pA39xFhOklGyKnVsDCSGnoxvtu9TsTnXwGIEak6+GU03c/w?=
 =?us-ascii?Q?zjC52TZrsWAvo/n2p+qqSqR6/IYZrfhqzeyzbVmLp3w/Ea8OMgkD61pSyY0I?=
 =?us-ascii?Q?qTJza2+hwN4uztTjuuuveePO+hS58w0ZJmDgioCuK1aaM0IxY6xuMBMo9QHq?=
 =?us-ascii?Q?oD+mQKBa9tXLKO/tNb/0OzHxA2SxqiuLtc5jmKDXI0YLwsoo/LNPYxwDMOIp?=
 =?us-ascii?Q?A21v9mXfZZdPPGeaK25xZ+zCA4FR19PF8gdAENfxi/0GjPe9Cb+Sk4vTd24n?=
 =?us-ascii?Q?8l/8DZoPeH4uPBPiW9ClB8ip0v/+TCZLxbKfcgrBlrEA0PUBum+VVgPH/y7i?=
 =?us-ascii?Q?WwKmfpfrS/a0ek4QuZpzlOlHECirToWVuI6gSXkOECvGz5IU5fo7s+5fXj1Y?=
 =?us-ascii?Q?dpSlspRu/PE0GMTWYmh48tF9aZveAzgibY5t/I18yS5iPlzakSZSMkRbzGfw?=
 =?us-ascii?Q?SlGwOEJA2oNJ1RIR0nNLNVo3S4b/NIjLTVysecbOkQ9b+elnksIgF70lQdiN?=
 =?us-ascii?Q?AEWTMy793NYvY1KxZ/C64PhczfVgHlROhHBJgl2qxPzJxgnug1IValh0YNw/?=
 =?us-ascii?Q?OM/zluXmrHWYLc/JgzNI7Bjsv/J1+nhUGktlMPRdNIaYa/2+DyRkNUSs2asp?=
 =?us-ascii?Q?LkTMEhgn8rgYPLuyQX/fHdFhXpPNf+cVbD4kHEguUIujZnaRrQwE1t8CXBI5?=
 =?us-ascii?Q?xXx6dBv+wfUpLEMqn50gCViqYQHMPTOaaGqO0PwF5TCZJRKJSPpl0yk0HhM2?=
 =?us-ascii?Q?Lwcgzt7uWElA5FbzhhTzIeHPIZmumGZw1Q8jYAMUlqKlFRSlZFJ8DRHPa6wP?=
 =?us-ascii?Q?PFu+qO8tpw4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hIUHKQSa3LzKRwNnhb1ERdllBt8DDkRgDIL8bQbS/pSssQjaEtelAosVVNfR?=
 =?us-ascii?Q?Bfr8eqZ8+b2KgZwNN54wE1IQUKagl6s8psIOxNziYEIIkZ2s9pcWfeLyOSVl?=
 =?us-ascii?Q?bHSSWS78g146tdV04GI/Z9GnLOsfZOxQwFS5XCtLgd21DtqjUp8Cfj55LY8Z?=
 =?us-ascii?Q?FF13YRuVU9AVpVjtVGHv3pe/22EWHpNMKw7gTqjeyewPNkC0AW0ZC81ojI6p?=
 =?us-ascii?Q?SI7VMNi8y3aP94aPqzeIzZTL6k1te9le6tLYUS+FF/uLg9CZgrUgRLdgmtXQ?=
 =?us-ascii?Q?BwGD8PCo1Y1/jMX8LZWHy8pzr5Z89E+OfRyExag/GesCJIkP+sQo0yaGj/8F?=
 =?us-ascii?Q?ymF9fIeO5w9eq0ge3XlHzJpZnxQHr8xOA1KLUXPYTAiFS39VYE6nOUdVOTNz?=
 =?us-ascii?Q?AsV7OAEJXKBe6etFdJDPCDtvDFWWSraE8cJF8km/jZ6niAo0BMiAV62ixSLx?=
 =?us-ascii?Q?Z6rjV59tzuw8g2KeBFnNEMX8VlKI5w8da7oM4rDAg5CRYb0gtp35RGfVO5WG?=
 =?us-ascii?Q?cYK1ep8OMLzm1w1Hsf6QcD/Mm3TUjwbEdVkgK+InY8Ps0MznzXYiOSj+E4V/?=
 =?us-ascii?Q?mSuc8Lt+q2Df6rPDOwtRcOS12+29z3+oJu48d74wlF6hGAsuCZ5O4J2WfKb6?=
 =?us-ascii?Q?hX8m7vfEiM+Axfz2Tq3NalNb1uC+xG1DQ9LfeBku/uZq76blkjPadyNmDYua?=
 =?us-ascii?Q?krxHKiQp4/KrRdc/HE66fHk5bPNksbM+tdxR/jvC4m2n5+6hyTY9t22YrjW1?=
 =?us-ascii?Q?eBMr29fqCJHPyyehMJz0ihdXtBghGefj7qACVLbJ917dEApTxqmbJs++0+y8?=
 =?us-ascii?Q?sJaulR667KmIdMd7d6BXsmH5jcsnXyC8zgk1PHprr+gqvI3a46kYwpd365q3?=
 =?us-ascii?Q?ec0nvW2gDc1yZM96F5CAe0MGasTSmTZDTVlOng+Er2X/dRXg6FbxWYn9YjtA?=
 =?us-ascii?Q?1n9UwnnJg9FeYD6HJNHLdgM1iwv+i417YFcvKH1bwtYU9ozSoVwcjKbMG2tS?=
 =?us-ascii?Q?+Z/lozQpjTKCpZb9trIZNg+IhkzYpcTLjtEH5d3QknlcgXAv7/QJy3t7yXgo?=
 =?us-ascii?Q?450CNa0yPPLty3fasmc4fWEgsfur+K2s9+8m28+ua17ADJzeUEPxqejrz+ms?=
 =?us-ascii?Q?hfNzLjJ80mpmswh881ePL7Ath9q09TtJybaQ14xc+StXGssQwe3AReJMfbBx?=
 =?us-ascii?Q?og7O1ea1DafIztEcyVVGxNzDEg25gbJPp819ggo73gw9TUCTGBVF3u7njDGT?=
 =?us-ascii?Q?XZWg9F9cioGAo5aLe7zY2xnFsLGjJyjpYdUAh9TKsri7S9YJAK+HBqOa9P/Y?=
 =?us-ascii?Q?ACjyo7ZrRJEcu/d7IQwAdYMgm+AZgDQlSheV5EI0SnNh1W5U6GXUac/i+kMC?=
 =?us-ascii?Q?jiB/1nJVfAEsB5JUDGc0Ts8mrIN693Z6ynOqvrU6Oi59P5o+nvgCynAF+TFe?=
 =?us-ascii?Q?CSn0zCTCom36rSw+SFcErnUcBdP0RLfHd+daMwwQwjsnxHn7hK5JbG4J+SZW?=
 =?us-ascii?Q?6U+wzGMK9rkb5Rl/SNTvvas5TM0zD5C/nifCDX+YlPRx7fMZm/2638FPBsks?=
 =?us-ascii?Q?b3GUfkNWF1V2+py//FZhMVXDL8bePCM7Votva5jQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58772099-060d-4e32-2a43-08dde7222b90
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:30.3303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RS2/rbbcVVdlC+9AjbfFfrbbKJ1UsrCWwOoBNtryTEq+SinjAGFW4dArX5j+6d4FIJfu/Zm1C4s1r5Y5gBJOuQ==
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

From: John Hubbard <jhubbard@nvidia.com>

Otherwise, you'll never reach Riscv==true, much less GSP's INIT_DONE
message.

This is how Nouveau does it.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 7fbf909cae08..05bde1f161ea 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -385,7 +385,11 @@ pub(crate) fn dma_reset(&self, bar: &Bar0) {
 
     /// Wait for memory scrubbing to complete.
     fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
-        // TIMEOUT: memory scrubbing should complete in less than 20ms.
+        // Clear MAILBOX0 before waiting for memory scrubbing
+        regs::NV_PFALCON_FALCON_MAILBOX0::default()
+            .set_value(0)
+            .write(bar, &E::ID);
+
         util::wait_on(Delta::from_millis(20), || {
             if regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID).mem_scrubbing_done() {
                 Some(())
-- 
2.34.1

