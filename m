Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15727B3C1D3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4187510E1CD;
	Fri, 29 Aug 2025 17:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sUlmT8X0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7862B10E1E0;
 Fri, 29 Aug 2025 17:33:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmUR8fQk2oNZgm+/ml600W58or/mHCgCXcdnWu/avpbs0Lq2BdgKYH6XXcG5To8lsupIaqeyYqFCZGAtOh5Kb9gw1M60TNzj9vJq6e0+EyhTbGpn0LPQl9PGfmRSWW8+RG1C/Ba9NRWTlHs9jc7+dOnfuPw3DpFb2dGawfflFzEHyUnNfPWGgmUuLsYUV9UDlsi9xufgbkgWY6ES/EmXiZuMPWTFEtiDB0aXrKSAaLf4DOKDSQIH7hL/DUq5l0zGOUL4UYupzLWbP+Hn/b3PRDAKwoCCtc1z9e3kgKmRH6b2I5/pGUE3kCQ3nstBVjpc2g0M0/DrC0zkExCf6nZzow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3QKz3IEFDPdEB5zzV6/37NKQDkIlXA/e5oExKOgZR4=;
 b=xvbD1eyGcCRMGyfgtRcLR0jA/pRO3+MyWPAD/Fl+Okve+9u+nWGtjeuWYp7gAqUFE+LggG+wqt1il+O6L8AzDwyBCAIXOM8GzZnMZ5oKbDDrjReujvGvHDxLARsmm8twth/mqNpq+1XYedgiiWRNdBhRhpoiwpFJC9dgTnrKUOa1UNwVGT9KeFr+dC7imuD0x9P3sCW0BxObF2I63QiYzLelfP73Nn/M3NxqtlJ2Iv1fa2DN8aC1n/y+gWXoL5v7fmiv1yaOhpp4KvN0grjZ4pU7z89Y927q3xEo6hmCHOvzddUZyvfJ5fS3RRqsj9MVukdi5uMYPvypYKf+NK5xrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3QKz3IEFDPdEB5zzV6/37NKQDkIlXA/e5oExKOgZR4=;
 b=sUlmT8X0AvB0+W2HEIHTpBW4hDnJE1iYDWpDtbroBKQs2VrXz+f1wrvEgp98K48z4zE30sOx8gDKwPbQdp5t26iE3KJnI6DUSDOk+GUBw3yeN7zCXaz33OmLXqzeYchiSyc7OjPxia8Kz8HtRKH33duWbjJ9O2ptOaNLhdnRFvZbYcG/FrniGhdt3EQhU93yIi+CKbk4zO924DqQ1KvZCOxkMx5f9+eTVwmLctVd+AcR2nHTn940Jz44j1h1M0YMUFoVMnvr6mgrDzvS+yBPCz97Yu3gbo0UIr9QBKzxnOldTv8L7mtK0x76Z6tsLy4LPpYfgQSjV/cdGXp4AAhWIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 17:33:32 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:32 +0000
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
Subject: [PATCH 13/17] nova-core: Ada: basic GPU identification
Date: Fri, 29 Aug 2025 13:32:50 -0400
Message-Id: <20250829173254.2068763-14-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::17) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f10c14f-b640-4bb7-47ff-08dde7222cba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3KsWeW4U/GTlrBgMHKHZD0FMTgwETMsP83yCiK3HzUwLHaSBihOBSq1q9idS?=
 =?us-ascii?Q?opTXWl6UtfTVRbPIHmvPriPTe+aHuZ2pMeU9lnA/sDpOR7oxZJ7u6Nipj4qY?=
 =?us-ascii?Q?3e0n3ijTWR4d9k7eC3X5ZVG/L1d2WjlyBcjVoGxideBzygfJRQSaUOTxAFva?=
 =?us-ascii?Q?byUQYVfpeZKNM0cmZcE4sxgV4amWeqYguN1R3AjxgZ57Mx/gxAHq9M1TpU6n?=
 =?us-ascii?Q?8Mr4qpKKd7vtSPMD+98gEIChmGECFE2TnHe5oI4d8M+qTSBr529FoJ1gl0J+?=
 =?us-ascii?Q?GSwxTIRultg8KnZHTITB+EyFbEUA1kQIn2h9zXkTdj01tB/nhEaZZnn0HSev?=
 =?us-ascii?Q?Vs7qhf17VpCGubF0q26FKnYPfcCWgCS8XHsdIhNczS7ljoKDbn4RB0LeyYVn?=
 =?us-ascii?Q?KVSlYt3oyn3Tbt5XVBGO6+76JduN1fc+n0aFkiowStOFyrMUUfEufbTHxCHg?=
 =?us-ascii?Q?OtnQV+EjId1PhPC+W5FoI+o5sgRD5kyMx+6HaRWctpTAhVh8a0Xbm0+xm+KY?=
 =?us-ascii?Q?TBOf2xaecTPszXSh0yyb6a+SgAvFMeKDbkM9kbtpMunhmBoqaK40kSjVJCpw?=
 =?us-ascii?Q?8bXXM8xhEYdocyNw4Spvb85fGFsqz3sOYGoFDs1cE31ZEiPUfLyPH8y8PQiG?=
 =?us-ascii?Q?n9on72UN4CVMPUoC0hDUHe4sqUbw9QKhsH2RFiGCRHOGtGTFRJHmxG/4wHu6?=
 =?us-ascii?Q?x997HcwO2LcBN+74cZMDbESPc7EGVB8ccqZ+izLtPLyLR2yxFSKyaQXETemv?=
 =?us-ascii?Q?ZXiGXED8DF8oeGkf6EaxcwdRa/k4jYQ/x011fdjv3xzGLzt7WMdFdr0/jjCR?=
 =?us-ascii?Q?TB8BCafdM6/wNifIkp5i1TmClAUomMdQlwjsWV/W2Hod747kwH6+zFuYuHk3?=
 =?us-ascii?Q?FsdyQUn7GZQzMVc6y/RnayMsCd1I/SuKjA9Db04O7+s7rI/J8CEhtQChKkTm?=
 =?us-ascii?Q?QAfaNIoeDNPxQBVGXXfzGyAvRMEw8IIWI2TGqha2CETZ6//x39ZUQ/mBsT9v?=
 =?us-ascii?Q?OWTC2OoYWGjXQPFM4daarm49/GsavCF+Ttl3Yn/JEH8pfSZWd3vdQglVrr+W?=
 =?us-ascii?Q?fBjlv5/lE9diJtgf+LTSaMe6TMMFqgfxCnAVLa0aHkA4yIe8GHfm7qX+nux1?=
 =?us-ascii?Q?FZoTtSPJtx9R6/IFKseUsUxTSx0BJ1xg+sGTokOD+gspXnKlN5wFK2SRFk0H?=
 =?us-ascii?Q?Y1ahBTladeODmMPtkRYFK7cqyAdbdz5S+3ga38n32tDydfqJMoYkhKbsYmDy?=
 =?us-ascii?Q?oXiURZA5KptrB+ZJqp+jTTsGXtA1OqO3AMXYIpKAkWkVYU+IayO1w0ectXJB?=
 =?us-ascii?Q?P9QESVt+KE8U3KnXDw1CYFACP3I/XLEBFaC9z0j03unevY64/NVzZdNOGRcD?=
 =?us-ascii?Q?yXZsuuKLooq5nvUIGANppux7/W9uHWDPNTRTL+xVL8DcCre4hbEN/7bHOU60?=
 =?us-ascii?Q?glGEyoDO5qI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n/2Xv7n0+gRC4F8rKnmLXsfpxSS3UxrWceOTMZbjgSOQdN1vuSqHRneltf8R?=
 =?us-ascii?Q?FehkE/7uqJyKU67SNye7/g6EgG2fcPqnh3LW/z0dnGPWdktekUl1ATqu9pPF?=
 =?us-ascii?Q?355IUxy/fMagx9GyL3ITTXjMngLjPX+/qh0OnqFjpAE7Z3rpQdK+fkncZaAl?=
 =?us-ascii?Q?PkDx8fLWABx7HlhTzFaB3fDJ1cChjwb1G6e02J1v2wFXrz2fazYfRnBBbVdx?=
 =?us-ascii?Q?OL4OQsOkyn28lS7XkgK7Lv2nF2BCGw9g18MkDOYUfRXB/Ij5Ao06xBwhIx5m?=
 =?us-ascii?Q?wakXclySDXEa+1jOfT2GLac+VoiNb57ZRYHPJiFGCnj7/QfAVvGm2A4dWyfL?=
 =?us-ascii?Q?FpMwzbxGlw0IOK03Vr+zGxDk7h/zVcJw444LIObt9WjdYdqthzDPos5WTPFc?=
 =?us-ascii?Q?4/mElVhhqJy2nSxmQeoYNGHmcXvQNfa8ifSVHKQ4rPeU8K3UlZKrm4u9BbN3?=
 =?us-ascii?Q?s14WFblm/X1m2Pi+zRhY7Z1WjxZwRIPNuHaUbL8gHwGkrK8CrulphoMVBLBZ?=
 =?us-ascii?Q?Yb/9qHrFWsAVzHpr9/H6OXlsbnJ6bO5FFzN4dTMXwApoN9gty/vPQXsytNlX?=
 =?us-ascii?Q?dIH90VN+0a2YkdPr/dsj1f+Nb3xdQtHXd02nucWvLHiGkF3/jsqjkAJkqirM?=
 =?us-ascii?Q?WxsISNYtsfIvk3/+f+vsr24VrR78jVUyl4MN72yWsrwppClLCHh3Oaub6uOC?=
 =?us-ascii?Q?+f1KI9qymUiBAPDvvqmjhA7zTPgEi6PbIcf9pwKwUgFs5FJRt2hMnOVK8/6H?=
 =?us-ascii?Q?shkjWsWG3IjS6bRD24lHpHb79+dROpO5QF2LbI7fhYdZSAqt/XMt9uBHCOIw?=
 =?us-ascii?Q?NV9azALuLsusqSGoznuNVuoAX/wJTjkvn6ahBe6d7RbVUziCbkaE6aDXaokr?=
 =?us-ascii?Q?qCp1E8D8OB8AbqZ9KTSWSSW0WBgF3GfBazBIXJ4ATf3APHD2ubGTzf19jtYk?=
 =?us-ascii?Q?7emgsTZDAFTjuJowns2yi8I2735OWQZyWXDeKIMxD1ddyUHO/jpaFyhgrynL?=
 =?us-ascii?Q?NqbWL9+vGELmBMqr8mKJrfTo2MvvQ26+rL++LhT+Gpgc0ZEuXJsmG2x2GgKr?=
 =?us-ascii?Q?MirvGIrwPXeOjfGePAvgxDCRQnWhx5cFuHKmMawf+nEWAegVP9VS9lwjvxoN?=
 =?us-ascii?Q?IvWJMGLRC+ipRxwJFfcsf0iO4XBbAcfR1SxNHXrXhRcxZnkhnnCR+/yVX9PO?=
 =?us-ascii?Q?wtxcyrBVoMRSIFFEH07uwLlbc6MGA0Ad9P7MTnRLCyOaYRQAJv1+CimEuSof?=
 =?us-ascii?Q?moxFOXOfNadxEI3xzcTd3XyC9Gg4yESLHaorkptsEX42yW3Sv+NwT/sVf63s?=
 =?us-ascii?Q?k9ssh57CoNWecs9egmjzpZE5ndFjr5ZW0LlVkGeQC5JZFsC8z45ke79FW1Io?=
 =?us-ascii?Q?EgmbypydjYhCzCkMqxgGeUvsWTZvIIUgUDJD3ggz6BFfLTTB8nNGEUINBzJW?=
 =?us-ascii?Q?4N0kWTL9wXa+RXJVBcbNrI17k4IuFD0FhQFI9EgX7oTE5da6Eu5lEo1wvJaN?=
 =?us-ascii?Q?/v9TC/Zxbp1q84KnBKtsD40JOxnkgnvGE4DV4/gIwoE/+64+YAZdu/+bG/gR?=
 =?us-ascii?Q?BiCqalPe2GDJBmhjTlMb0ANf64xMhikqyBDv9MiP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f10c14f-b640-4bb7-47ff-08dde7222cba
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:32.3335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+QbTnSDdPrifuqk+7FSfoUsM741oupYxBt6jfVFKnmbERi/LHi6c5onzExx3WF27MpeolraKxyF/HsvFPwlQA==
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

...which is sufficient to make Ada GPUs work, because they use the
pre-existing Ampere GPU code, unmodified.

Tested on AD102 (RTX 6000 Ada).

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs | 2 +-
 drivers/gpu/nova-core/firmware.rs   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index b233bc365882..f061f67f1072 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -44,7 +44,7 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     use Chipset::*;
 
     let hal = match chipset {
-        GA102 | GA103 | GA104 | GA106 | GA107 => {
+        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         _ => return Err(ENOTSUPP),
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index d35f1affaa28..4da3c94f50d0 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -153,6 +153,7 @@ pub(crate) fn new(
 
         let gsp_sigs_section = match chipset.arch() {
             Architecture::Ampere => ".fwsignature_ga10x",
+            Architecture::Ada => ".fwsignature_ad10x",
             _ => return Err(ENOTSUPP),
         };
         let gsp_sigs = elf::elf64_section(gsp_fw.data(), gsp_sigs_section)
-- 
2.34.1

