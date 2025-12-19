Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7A8CD1C79
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 21:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DB110F0CD;
	Fri, 19 Dec 2025 20:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WPxhpFWx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012060.outbound.protection.outlook.com [52.101.43.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08BD10F0C3;
 Fri, 19 Dec 2025 20:38:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8fJC1Neg1ClxahSjT2n1eAf2N/Rz5XooPFalCC05hUiNWF1x0rRrbGEpy3yAqy/J2n+lBlhoXPcnv5IVMgb2JYr1pQwrrB70J8wU5K25vg8+3P8wfTgoV8DiM7iZs8/vRKgmZo1iEI4ctlLeLj5Q0VBfw5jelLDJuvZTeWJuDbEy6RZoEAbeyfidVQyxDzJq4LifTPUT0cDF+DIFHaW4WcusORElVYQuOpbCGCmqsNr2oc+9DJ5VZA91x7sJjINVjqEFKc8fskLfXw+sQ0TBxjcGNQ+pn42dBye9k+7+b88Mt7po69flc2V/ox2ttMifTey8gIaUcwZqSDLXxp4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Bw9Y9t81RX85yPCVF1AILpQnKQkeDIUks3h8hK944w=;
 b=yOHWcdLr/dkBE1ikEHjN6J4t35B0ssKFBsSj8e9IZ24zlq1nRCY4lNBw2tc5uADgGG75fAuvM5r8Zlg30Hc7uH+m7PwEP45Y968ldWSLxndHgwNbj5byNfVtmFd9A8qwp7hTD3gccEfphIEoDV113DkD+IHRp2IsY80jU5HjvFPJlCc5XyiDUq38SBXuhNXIVMkFCmXmNNPUrIisM+iHAmlJp2xaZFYXoL0J/2JxOnXcT5aE7VoC9xPBsx3tCO/GUjvJcyt4wdY0w2+sMMVCuUMCyc61qL/qObtHi+mpTa59XLO6Hxs3l/Ex2rL5DD7IjdcFzwk89rvLu9B1ebyuRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Bw9Y9t81RX85yPCVF1AILpQnKQkeDIUks3h8hK944w=;
 b=WPxhpFWxEioqbxSfBT85pXGoLVnmdN6aro41ywpEpP9N5DZVvj1bkfQKOqJY0j6jv8iHYcdCiMMuBTYqOEBnBZKSr7V/OlZLkANKUEZArfjxHcVY3abVA3TAFFsDsc73PGDesGtFexfq+EImxOMcDMFxIeUbeb3q2EQXjGSqB+7jfvWbCZGTAzqiMFeAnE/zOlfAkIHhVcWDH+hgVS0P55+pFVLjd6XYseSj7RgMiN7fkkv/3nBDR1XsWB52UC3TIWBkUW9cyReP9zS6iEyM562xkc0WC9qUj3iKQoKWWD26OSrrarP/JKeKoJEOex9kEs0B/YsYYBA8jKuUcSd6QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4248.namprd12.prod.outlook.com (2603:10b6:610:7a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 20:38:22 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 20:38:22 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH RFC v5 6/6] nova-core: Add PRAMIN aperture self-tests
Date: Fri, 19 Dec 2025 15:38:05 -0500
Message-Id: <20251219203805.1246586-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219203805.1246586-1-joelagnelf@nvidia.com>
References: <20251219203805.1246586-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:52c::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4248:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fcdb99-dc15-4f5f-12a7-08de3f3e8d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r7Jzjxzgs2hlHEU3My2f+/9tcKBQQmA7e/UVwG9+oMxVue5oCBq8yKX7nNC8?=
 =?us-ascii?Q?ZxGJDbt6wv4U1PjKRIuSgFF8TNiZjEEiGDdB7TBY5rpt8AjyoKJb+2W1uITT?=
 =?us-ascii?Q?XCf8lb/Ehx+xXClQ8q9DuBIx+yiC5OiLPWt/XBxjDsQfZBtSQww1dl28SL0/?=
 =?us-ascii?Q?9rMqed2cEjKq9YrLBKeJC8Aew+qVYfYmXHHwVF1wFVJ0sDtc9rd7chcs6p4P?=
 =?us-ascii?Q?A8hik7KJXNr3buKIo1KH0952LOrnT1WEZ1e4cJ9GvXpGk/u1kjeYnDJap6mE?=
 =?us-ascii?Q?udmeOpDN+sqHfF8zCyTYNAev2fRoMkafQnLuzxX+Ta87OkS9gKLlABItrRrb?=
 =?us-ascii?Q?m0UD2Zo5FsII2aB3XyziieRP0AEquIQLrkETIUKJDj+zgg09QXK6aZ9EKLE3?=
 =?us-ascii?Q?FK7S64QpxK3SFqrxhK2ka3nwI0TT6OibrNvq5sZ9SUQH9wwkyRC6IKsP9Kzc?=
 =?us-ascii?Q?beAZ+G/8BcvukWi1X00pBXXKWHYPAtJnbZfVI94jHsSvopk7rpPZvx8HGMEZ?=
 =?us-ascii?Q?SYsKiqkO9I6z1MF3jhNQKa8LYLC2sc5KIDIsiFZlYk6cEPw1HHnrVpM1MPgC?=
 =?us-ascii?Q?S2zPVx5B8rDY7cQ5PpROzbgOcBE53afDS1qTM8bLF320V2vqY731Sldg+Wi6?=
 =?us-ascii?Q?IsjE9vDLKKQtL22wwwzzUvHGmN84wQGSgG0lwN4eEpfSVLQFDzxyOaXK4xoP?=
 =?us-ascii?Q?oxdYhzIH5aqKHDMSZaKgSh5fziJ6A8F7wtLlZJN6rpP62gQzGf2m8xIkYjHU?=
 =?us-ascii?Q?+nsQIGpV+3L7KHZnnw/A2btBpI9Eebdz4v/EBzPWuVI+LGe7myoMdEZvUrj+?=
 =?us-ascii?Q?Gr+IsYVtnBxyomyzfiQMfRym6s/dK8vbIlz/OvYjTzIJtI1TuQjzsl8PZZx8?=
 =?us-ascii?Q?LDHaZPV73PXGRmtTcWnVgaGylqy4Go5e1W6JOdrxQ4PoJiZB9XwbSRPbn1qX?=
 =?us-ascii?Q?Wla0dgJwg12/L1a0d9ZM6MkM+ecQO/TN3HWrVjEJj1a29Kt3I52kwA/SisJc?=
 =?us-ascii?Q?1itdL4VtGxg+NmBEf6+FejxeaTP3U2scEFSoZED9hJk7p4MZvSk8GYtUa4mz?=
 =?us-ascii?Q?vM/2e19/hhw9IE6MM4f+bIx9DTyOhQRGnkzUb4CB4LhkPn0u95aKA2ETO+pd?=
 =?us-ascii?Q?KXGl2UiNPBQ9XNbPBsR62ZYq1fuXspM+usdLZPqIo/7XeVe6Lb314xb5h2mV?=
 =?us-ascii?Q?nFlgodlFhNEomnIGhIu1q5wzcHxBCeRqFPtmIR2abCd97bVMmaTi60hzFVCA?=
 =?us-ascii?Q?HbCj6NEZB1rz3DhGglt5eLugSNUI4g9lk0Q8AM+vfHtjojERFfuaX0jsBR0G?=
 =?us-ascii?Q?URRDX1X/7f2HcGjPMqHC5yL9Ac5t6fd7jgMj8upjdW/A9NdeTfdWZKka8CEu?=
 =?us-ascii?Q?RDLlyFwuXhI0pUL9TSXRXwPQ8dY1B2YOrx1HMn0/yeEhC2hkjVTEbTQIurPG?=
 =?us-ascii?Q?aUNevEfdQXccvzG/Q9MUAFA6NHUt0/dqz3qlhMQyeW8Y/dguxgOo8BZQtgRq?=
 =?us-ascii?Q?rcE1T7dH9w6QZRs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ynfgHgSTbU2F5W6H5CbnueZMjQ/byZA95sGwjDUR10/xl/qfpRhhUz0zbEFS?=
 =?us-ascii?Q?zSnu6uv4+Gfotly4J7+Si74TTeupmq6cYMBX351/I7QlESeyAMTduu9hNfum?=
 =?us-ascii?Q?HB486OxBwPnVZehB2oead4KkGjACTdWAbgBuH7ITOVAZKNvBrSN/n9kwl6ZX?=
 =?us-ascii?Q?1167NIIY3Ti2rJHmChEY4ZuZf4tq5qqKHqwe89/XnTs4kNUEMLqVUNrqKp21?=
 =?us-ascii?Q?MaJRw/s3a+doty9auTsy5zvdSn/rCgXJLfPjTP83L2QyvZt6OobajSJ4sfw6?=
 =?us-ascii?Q?L3O3l4MIfnaaCGzJS4Bmbms2SGIRwdvKb/MyTDTEZ/pylYA8MlloMsB8kfE3?=
 =?us-ascii?Q?+jL0nvNWQbUFxULv5Vf8nx2cBfU4X3qTgbAwn3aG0PuVQM3+8FMCS8OtaCVh?=
 =?us-ascii?Q?J2crUS0dAbmA7notQHgqVs8G7fV/qNBY9RkU7Kpv2UzOpClfYHqEKwDiNeGt?=
 =?us-ascii?Q?yOzR7UU3zIuW6zQOERXCjntCADy0nTXyqZjtP7za2P5g+yUcyTSvlh/gBWRT?=
 =?us-ascii?Q?r4SBub6A6juzF5SwXKnpVkzaw2V6xnASPOGN/rcjode4MYF/wqo6uy3MtCf5?=
 =?us-ascii?Q?ThC2N+P8V2rMYGak5ibERdLrHfI+/8HCAJ2mmYRqAC6I45pmTjvZKUgEK/bA?=
 =?us-ascii?Q?Fhvv8OiE9ec0JIHXshMfEua/ic1t+SAV+0lyJ8F8I04p8IcsHkxAIW+a/T92?=
 =?us-ascii?Q?LXG0CFSJvnaiGseQH4+BHx0xES011WY2NlN6xrnIADCayMfkymvxE6H+m26j?=
 =?us-ascii?Q?hpQzPfR5obuDDFsUXctL8Srizd/ht0AILEpL/ihGww/Nv/ysnlmMZdmoNURy?=
 =?us-ascii?Q?vMQmuXJUQDeY2IADiQynx5zK7rd6ND+/sHEI7JuK0YNMa9kLy5+w1ki+y9Oe?=
 =?us-ascii?Q?PrFzD/l+F+qC+Pu6UnrxCuuPR5xiUueEcvVA16f19zRo8S85iSKofw42LIMS?=
 =?us-ascii?Q?DgzZMhLkUqmFPispNrZ/HMw7qdqdJX25mRSpaQ+Qjp0XcNXBLvMrvExSSA1r?=
 =?us-ascii?Q?OZY5/n3ZrGLpmUWC8TaU+pP98DMFxUKm5s2hJplhSlCHLH2r9miogwULMuDd?=
 =?us-ascii?Q?vqKp2RMqkvB4I+9+3JpBZPne6uv7mBy2bbIb1rHkJyIcAF1VsfS56ZxzcARy?=
 =?us-ascii?Q?KvjeUyd/kirO0E/CILfFdjq9IR8zAGEfJWe87SthfJEh/SM+DyMW4xgExA2v?=
 =?us-ascii?Q?+8v6OlViiyEMy1hThei0IFpKMgOr/gAVC0u7Hej1mvQToc9h+CRvlb185xwl?=
 =?us-ascii?Q?xccwEO5kVB/uzXV3ncLutDCLfDpcKC/3zqj1454CRJHFkV0Ado6RBXtXHYXs?=
 =?us-ascii?Q?5DAtmtYQr22xXw6IWG8jPPVr8knk19HYCsnKqd332z6VFKExWT/CvMw1uRmG?=
 =?us-ascii?Q?C/CyR8dN8z0gS1OkvGZTK9rIWOf0BQHHMekhmKtuSJIczzh8FHpubnqS9aq6?=
 =?us-ascii?Q?XuAXyUu8h59ZVYD4OcaxvNJvRwa8uxT1Xvsw4KbeWhZzwCokLOeZLn8muf4g?=
 =?us-ascii?Q?Ex0MtOJdsqQbmwgFP98r732m9DT+M/7+TICJi+FfH6nC0Xs4kklFEfdZkuBp?=
 =?us-ascii?Q?gtddjWVlOiSfj9ZKRAUMpeXiv8+M8/K/0lAS7RFeCwWFFiWNYlpM0uWmPYRE?=
 =?us-ascii?Q?Ya9qEvELi4FQZojvUpzKFIJ95GHwlrxizIU8i695gCy1BDTun3DXpkgQsSTi?=
 =?us-ascii?Q?MWca2lHIKZEBzT5mOvxoWEgzhmyrM+OUuoxgNUPwD6h336Ud1QIrOO/i8SsW?=
 =?us-ascii?Q?3n/ZZrVd1g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fcdb99-dc15-4f5f-12a7-08de3f3e8d0b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 20:38:22.1143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uyq8tAIDvH49o64Q6xU2vKpaHKkVbFAhnXclh3HRuPBJ10l8WoqXDWda609ESfG5HiIZbOyakzfKa2wB1VDP+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4248
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

Add self-tests for the PRAMIN aperture mechanism to verify correct
operation during GPU probe. The tests validate:

- Byte-level read/write at odd-aligned locations
- Word write followed by byte-level readback (endianness verification)
- Window repositioning across 1MB boundaries

The tests are gated behind CONFIG_NOVA_PRAMIN_SELFTESTS which is
disabled by default. When enabled, tests run after GSP boot during
probe.

Also remove the unused lint suppression at the module level since the
PRAMIN code is now being actively used.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig      |  11 ++++
 drivers/gpu/nova-core/gsp/boot.rs  |   4 ++
 drivers/gpu/nova-core/mm/pramin.rs | 102 ++++++++++++++++++++++++++++-
 3 files changed, 115 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 20d3e6d0d796..a37335e3381c 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -14,3 +14,14 @@ config NOVA_CORE
 	  This driver is work in progress and may not be functional.
 
 	  If M is selected, the module will be called nova_core.
+
+config NOVA_PRAMIN_SELFTESTS
+	bool "PRAMIN self-tests"
+	depends on NOVA_CORE
+	default n
+	help
+	  Enable self-tests for the PRAMIN aperture mechanism. When enabled,
+	  basic tests are run during GPU probe after GSP boot to
+	  verify PRAMIN functionality.
+
+	  This is a testing option and should normally be disabled.
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 54937606b5b0..b9750c86b6ed 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -239,6 +239,10 @@ pub(crate) fn boot(
         // Wait until GSP is fully initialized.
         commands::wait_gsp_init_done(&mut self.cmdq)?;
 
+        // Run PRAMIN aperture self-tests (disabled by default).
+        #[cfg(CONFIG_NOVA_PRAMIN_SELFTESTS)]
+        crate::mm::pramin::run_self_test(pdev.as_ref(), bar)?;
+
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
         dev_info!(
diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/mm/pramin.rs
index 5878a3f80b9c..483832b8f87e 100644
--- a/drivers/gpu/nova-core/mm/pramin.rs
+++ b/drivers/gpu/nova-core/mm/pramin.rs
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#![expect(unused)]
-
 //! Direct VRAM access through the PRAMIN aperture.
 //!
 //! PRAMIN provides a 1MB sliding window into VRAM through BAR0, allowing the CPU to access
@@ -56,6 +54,8 @@
 //! }
 //! ```
 
+#![allow(unused)]
+
 use crate::{
     driver::Bar0,
     regs, //
@@ -198,3 +198,101 @@ unsafe impl Send for Window<'_> {}
 
 // SAFETY: `Window` requires `&mut self` for all accessors.
 unsafe impl Sync for Window<'_> {}
+
+/// Run PRAMIN self-tests during probe.
+#[cfg(CONFIG_NOVA_PRAMIN_SELFTESTS)]
+pub(crate) fn run_self_test(dev: &kernel::device::Device, bar: &Bar0) -> Result {
+    dev_info!(dev, "PRAMIN: Starting self-test...\n");
+
+    let mut win = Window::new(bar);
+
+    // Use offset 0x1000 as test area.
+    let base: usize = 0x1000;
+
+    // Test 1: Read/write at odd-aligned locations.
+    dev_info!(dev, "PRAMIN: Test 1 - Odd-aligned u8 read/write\n");
+    for i in 0u8..4 {
+        let offset = base + 1 + i as usize; // Offsets 0x1001, 0x1002, 0x1003, 0x1004
+        let val = 0xA0 + i;
+        win.try_write8(offset, val)?;
+        let read_val = win.try_read8(offset)?;
+        if read_val != val {
+            dev_err!(
+                dev,
+                "PRAMIN: FAIL - offset {:#x}: wrote {:#x}, read {:#x}\n",
+                offset,
+                val,
+                read_val
+            );
+            return Err(EIO);
+        }
+    }
+    dev_info!(dev, "PRAMIN: Test 1 PASSED\n");
+
+    // Test 2: Write u32 and read back as u8s.
+    dev_info!(dev, "PRAMIN: Test 2 - Write u32, read as u8s\n");
+    let test2_offset = base + 0x10;
+    let test2_val: u32 = 0xDEADBEEF;
+    win.try_write32(test2_offset, test2_val)?;
+
+    // Read back as individual bytes (little-endian: EF BE AD DE).
+    let expected_bytes: [u8; 4] = [0xEF, 0xBE, 0xAD, 0xDE];
+    for (i, &expected) in expected_bytes.iter().enumerate() {
+        let read_val = win.try_read8(test2_offset + i)?;
+        if read_val != expected {
+            dev_err!(
+                dev,
+                "PRAMIN: FAIL - offset {:#x}: expected {:#x}, read {:#x}\n",
+                test2_offset + i,
+                expected,
+                read_val
+            );
+            return Err(EIO);
+        }
+    }
+    dev_info!(dev, "PRAMIN: Test 2 PASSED\n");
+
+    // Test 3: Window repositioning across 1MB boundaries.
+    // Write to offset > 1MB to trigger window slide, then verify.
+    dev_info!(dev, "PRAMIN: Test 4 - Window repositioning\n");
+    let test4_offset_a = base; // First 1MB region
+    let test4_offset_b = 0x200000 + base; // 2MB + base (different 1MB region)
+    let val_a: u32 = 0x11111111;
+    let val_b: u32 = 0x22222222;
+
+    // Write to first region.
+    win.try_write32(test4_offset_a, val_a)?;
+
+    // Write to second region (triggers window reposition).
+    win.try_write32(test4_offset_b, val_b)?;
+
+    // Read back from second region.
+    let read_b = win.try_read32(test4_offset_b)?;
+    if read_b != val_b {
+        dev_err!(
+            dev,
+            "PRAMIN: FAIL - offset {:#x}: expected {:#x}, read {:#x}\n",
+            test4_offset_b,
+            val_b,
+            read_b
+        );
+        return Err(EIO);
+    }
+
+    // Read back from first region (triggers window reposition again).
+    let read_a = win.try_read32(test4_offset_a)?;
+    if read_a != val_a {
+        dev_err!(
+            dev,
+            "PRAMIN: FAIL - offset {:#x}: expected {:#x}, read {:#x}\n",
+            test4_offset_a,
+            val_a,
+            read_a
+        );
+        return Err(EIO);
+    }
+    dev_info!(dev, "PRAMIN: Test 3 PASSED\n");
+
+    dev_info!(dev, "PRAMIN: All self-tests PASSED\n");
+    Ok(())
+}
-- 
2.34.1

