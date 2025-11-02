Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A712BC29AB5
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2358110E190;
	Sun,  2 Nov 2025 23:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tVzOmevE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010000.outbound.protection.outlook.com
 [52.101.193.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0102810E182;
 Sun,  2 Nov 2025 23:59:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2YlxDwitunY2/jhzsr5IXuYqfBdQOFaJbWX//zB/deNzLxd0t7pAuoT+sBMGXS4e7CPskctR+nQ+x0C9nKWKurceW/C87Iq7znQme/EwFGb7SbrmVEeaWeBzuRZo8jAIDLqqOjfdYNBeHpkcxGhFZan0CdPHV/MgD5c4+dbg0K+IcfxCOPP0bUcnjHx2j1Oir7E/MBFXBM0/YM7vf2rGBCGnu8JSpOwXCy1q3TQ/NvwlmkGMcBMURkXAbBgTn8A4XWI+tKBkTdrJ1/hCCFdlCcoBVyJjYwVwD59QGJ22y+wsWnkK4aUFjWJLQZmLrbJ9IWiIlzuC9J6wnsKJ4ryjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vq/EBawKTvk53H0a4F9O/C9+jNh93rfk70XAQ2xCN3w=;
 b=S+anVBExsjeZdbAistYFdB7lmBFJr+mSCTrzAi5KS8G/SlQmPmOMHtzkp/4OMhNlLU5uzG0rVs6kDQ9/XmEB9yZw9bp2Q8GLcxK6Tg0kn2pHSO+Z3G7xDjKOvtYk8ABOO2YufCtQETo5HFXlKrOjHagK/oYBbo1vZjKGOtXW0vYymZI7wMNvMBpQ3/HbhbSkj5bLPmnPWeYvu5iUisGSE4mq6DZL/jrBmd3EiF9IPHiuPIfYT13BfeKsn+Y2oQhybTDRXWpLkyiBUt0JMoqlYgrmqd42AnHylXVwu8eMEoW3Ybaj8Vr1SL77DPDxtYmSQ5uLmnx/aywA9m5fFtCYRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vq/EBawKTvk53H0a4F9O/C9+jNh93rfk70XAQ2xCN3w=;
 b=tVzOmevE8xDtB/upr2xxamEuW2RQF9mgDKxUUjwGAHnbqtV4pToRf5yqwduW7tNkw9GE08qniUiKOmGO6T0CyW/UwXvXCNpVtlgbDGMj4NjFeY8qkXKYbGyC01cNIUCJIrsAjzsf462d/ul5P417VT1qvMCZOtodfbt7bycHIP4MqB/MxW1ShsYVXWH7bhjzes9kHbIO+P8G+asgCC4290S1PtaYISwfhoaKT8v4UGoBezaccLxo01gLyN4ai3BI+yvQMNKRjWNBxm8zPdCJ8IsLSW2nINRxwS4MmS/7V+xU4uUwXIjM1g/ilgtlEorgO1o8a9NXa5sFFHuh54F4tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 23:59:34 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 23:59:34 +0000
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
Subject: [PATCH v2 04/12] nova-core: falcon: Move dma_reset functionality into
 helper
Date: Sun,  2 Nov 2025 18:59:12 -0500
Message-Id: <20251102235920.3784592-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251102235920.3784592-1-joelagnelf@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::14) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 06e02e15-ae33-4d98-5c36-08de1a6bdf67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bnv57kP0HKMcTizuEW3wzEsnqFC8WgtbsCzGrdXHjr5Yweqcm6kowpUgNsGt?=
 =?us-ascii?Q?BX5EorbFoEMxncfHVeAfvSREqTqDjt7Bd4MvqvBbDzg1Wo75gYr+DVaNtKGg?=
 =?us-ascii?Q?8gOF+DKlFZpGJn/tQDwwZiXFdrpgDuAkp29pmzP7mXiX2IlBiNpXfgsZJ++s?=
 =?us-ascii?Q?XVBB6og2IcxjCYPX6fyPn0gzY3ivWZjTSkWGkx5NuRo2H2rHvYSchbCuuNLf?=
 =?us-ascii?Q?wMXFnKdGtRkqz8Zd4xt2oSpUiNdzG4kx2DL/L8HgXtKdoOeWtFyP7UvOll6S?=
 =?us-ascii?Q?8MZz0FuR2hD9hUhrrPXZNGZ5ucg9pTHKoJUlCgKozDwLjdPrerLdAtKSN3gw?=
 =?us-ascii?Q?bCUPUwRgQmDF0dcYSYGQ/qfkwa4y4EXjaRHBErFNYFs5hVGS9a3TUfD+qb9u?=
 =?us-ascii?Q?rD7Den4Bn1puY2qttLtNrOwoysn0BWBbPlx5xZO9+hxO6GSN5JzpLnA/zH9y?=
 =?us-ascii?Q?VS+UFzKLbRMTjIPV2ox06cN30v0Ow4VF1o8MlvT36Bj3gyQNH/nxusPfUGYj?=
 =?us-ascii?Q?7A3vgjxrOX+9k5SqtIxR9vjRywWJCZAyDcD5bGuDmD7IBnX1aZFcA2tBFAsm?=
 =?us-ascii?Q?GbrcPo8S4sGKZsiL1tHaIFor3yHs20k+e/JA07IsujJJdpK3e6lcxhSZI6kz?=
 =?us-ascii?Q?6cJPT+DpgBN++XjxVHjNiYeKuB/CVTj64X7xgYXtDbJowclOr21U62Tue9Oc?=
 =?us-ascii?Q?FX3gBVFCWV7HZs/YbAkNKsYhIZP8Q0GgM5PLFedT8Q+LVc4GCe2+DNxTIEr5?=
 =?us-ascii?Q?u2hvwGt/i9SqR2+uBPAfZK20cxsIFd2W6xWq+eWsKGvlEd1OhIZo75XEBTGJ?=
 =?us-ascii?Q?bYY083YsSQPyIzkkRVUfAx1dMGFClf3H5F/GM4taT/TDPR8rpKq4HgO5Q8z4?=
 =?us-ascii?Q?/WqIhgJQQmRQFKhHe22a1DcP1a4O3ZklCkpIg9psxCkXwjQHpCDJyf2segHQ?=
 =?us-ascii?Q?rf7iGez1O+XGQcLX+lBYyV/ZF0sdWx2K8ljexQSwTnwkejG4Dn94WPZeceQo?=
 =?us-ascii?Q?pFqwVDtKFSOh+mJq0LV9xFpwAZ1vYU3+ZiwHJRZ5IQxU3AayV5lRNRpq+T3+?=
 =?us-ascii?Q?SPzAtHa9mCdYwwmTDnLNbjsHgtF2Z+6WtmA2efWo6QstADGNzy5E0qnny42+?=
 =?us-ascii?Q?B0+TjUWiBdzXndG/+JTgP90s5Np01m0klhBQZ5qKk5eRP4ari21ByKrp6IVE?=
 =?us-ascii?Q?HoJOWJ0wXrYpqdRPLgJxKS+XbD4S2ayqE2K1lxPONSE++Gxz9y41KCkIQDOj?=
 =?us-ascii?Q?zY8G/t+/C+ji98j2csLF4Ry67yG2ElNj1W62zNO0Glv+JlpKiBDpRcTe2Dct?=
 =?us-ascii?Q?g4S48b+VmQfIN7VojkPMHS7dNO7p6pNENy/ropY5NsxwQQX3wu4xrv2H1Bei?=
 =?us-ascii?Q?Wm8QCHXQCliCeLB9nDpMxJ5ji0tMRqOn9kZYXzrS61gGsiY/wfg0Jjjfw6+J?=
 =?us-ascii?Q?KNwC/5peohs55i2Dx99OzPToW4BHOq81?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y2iMSqEjgZ22D6AQ7V0MYkt6BW3Fb0NTqdXz+SKL74Zb6iFu+ABvDNLsGHus?=
 =?us-ascii?Q?89fdp53gHgr1sV+7fuAz2YHa/Ox2bBtmaSJt2zcQxkiZcEQcYcneH+pRDmZc?=
 =?us-ascii?Q?rMvybwcyQRuuit/mJ7GNYaHa8LiZMfsoJ0zHu+pYgiXSUtIYREL5FBoUzcBN?=
 =?us-ascii?Q?8vf7PyiSOGl7wrNDePSBbYgsWt/r+1djqmP5088mjKP4y+Sdjz5FFm86FM/M?=
 =?us-ascii?Q?iZ5/Olpqe/NXjcW+WUoQmXxWG1gnY0Yv0l+KH4TNewVK04CQsWaSscF/MiFq?=
 =?us-ascii?Q?jWhptR4FYjF+KW0J6Tafa20KyLyBOA+jYZiAvtKa/RGUSeJYJmptrIxdLk8d?=
 =?us-ascii?Q?cqSZcH57jt/uq0HqpNZX+Hb2Dfg9CHSdviommZtmPlFzY8zHgTxc0dFdm6du?=
 =?us-ascii?Q?jKAx5Qor0kb9M82R/tTv18mlbKfgfFbFe/twwGUFC/H/xKIlTWjK+IwAqiMt?=
 =?us-ascii?Q?fWikVU3AFk6dAmYk79SZqD451DNr92MNLi54bQB4h8i51IHWXzYMv7T6wwu4?=
 =?us-ascii?Q?w5QJy+jeos78/RyMSdfKXzgWV8FtgqSY/ewOZOqaTycKk2rqp/Qp7zjQTdHc?=
 =?us-ascii?Q?ua9s8y7T4+dHCUL7MLpK1nyb3akX6qnQ2JAEP6vumyydrV3L1Wi/AY9fmRcT?=
 =?us-ascii?Q?zBQL+8n35HHObipts9wZWBSSwbQ0/LDnsAIuKBqsMI6YpnOqPzfCNMrmrKAW?=
 =?us-ascii?Q?clxJL66oG3nMbqT8K7EyPLbm/zwfsD6NK7iS4Yr0Yo4m3vrDTMx4lQkuNUq9?=
 =?us-ascii?Q?qvaiJJDHViBNccDMFJ9jkrQ7EHjM4MgxgZkjqpbMvWlyjLUKnGWvlL+yjQ17?=
 =?us-ascii?Q?UNrCaIgtgdVxkgfCBgTFel2/Xu8Wi924hTUdKlcMnPAYoJzJ2Yo6G8iVdwhQ?=
 =?us-ascii?Q?PG/fjHIdcpUF3p56rwE/nzhKZjbYD/pDIRMKvSHSU15DcrLPaDnF1G3qBX1I?=
 =?us-ascii?Q?ditpD9N2JSdI3Tp3MyaWCADTxyxM8C1xGYXP+dkMOfLSNK5oMDK/ZMzyB+tN?=
 =?us-ascii?Q?avWeHNILj3ojz9d6vaAIc9OBtzEYv94WycJYRXQI3HanILNp4uFhU8Ogjvg7?=
 =?us-ascii?Q?IWa7AahSbxQ7gxMahH6dMOJ3kivbFxa+vDUbVBP9i4txW0Z5ea+a8Mq6oIFV?=
 =?us-ascii?Q?Xj6Ophr53gTQPJDPyjN74FbTkujqkPOZ5rS5wFIFtwV17I2dZVDtm9MCIVd1?=
 =?us-ascii?Q?U7m3K34+XQ6e6CqaK2ZQ423Wbt9GvTYxj3DplRebznQSwa3ajEI4Us3yKIvt?=
 =?us-ascii?Q?iEwlF9k0holhWAcilQVtIaB1s+r34Wmj1WT0wpKxDUz6tqGnjm9/jlkAhSIv?=
 =?us-ascii?Q?+tuPEmPJqRVaRWknJJHg6VWbJFDKa7VSxpWspXGfRUxIusy8Lvo2f6pzAQTF?=
 =?us-ascii?Q?Cefzw9Us1I/X8BCeJ9ezios4GR9RnQWNE5G3UNEoQsNuccawAxa/F1L9S0uh?=
 =?us-ascii?Q?aSHRi78UeVvlsmgpPiUDqYfrQEMX6jv/u2E8bqW6BHTssESnYifzQHAkUgJE?=
 =?us-ascii?Q?YSfxXWmZynBjQ1gFyYdwYIXMfkiqj4sdMQcgWmkEmy20lc+FCC/P/75PBGHZ?=
 =?us-ascii?Q?j6/+DFxH3Xz37McmGmG/2klg5ydJcWK6doHZxFa3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e02e15-ae33-4d98-5c36-08de1a6bdf67
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 23:59:34.6100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uGCVXrHmzqIJvww9TSdwHswt641bIdHQgHJSol85WV4NCmiGQkTfReuBxcJuG4Wzg5p2RiplyKQL2uRR0qbqA==
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

Move dma_reset so we can use it for the upcoming sequencer
functionality.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 181347feb3ca..964033ded3f2 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -371,6 +371,12 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
         })
     }
 
+    /// Resets DMA-related registers.
+    pub(crate) fn dma_reset(&self, bar: &Bar0) {
+        regs::NV_PFALCON_FBIF_CTL::update(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
+        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+    }
+
     /// Wait for memory scrubbing to complete.
     fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
         // TIMEOUT: memory scrubbing should complete in less than 20ms.
@@ -520,8 +526,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
     pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
-        regs::NV_PFALCON_FBIF_CTL::update(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
-        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+        self.dma_reset(bar);
         regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {
             v.set_target(FalconFbifTarget::CoherentSysmem)
                 .set_mem_type(FalconFbifMemType::Physical)
-- 
2.34.1

