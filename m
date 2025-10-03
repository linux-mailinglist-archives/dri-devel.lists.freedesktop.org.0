Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB82DBB75E2
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 17:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666F110E17F;
	Fri,  3 Oct 2025 15:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fwh3vvQy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011003.outbound.protection.outlook.com [52.101.52.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396CC10E17F;
 Fri,  3 Oct 2025 15:48:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljHhzbKQOZiySuBz4XCdNyfrAlmv/Api8hn9TdLqe87r7JG5y4brUHoZkB0AD1XpqQvOVYy7lSQ/wOdnmtMnumSvaOT5k93GWu5W9TwpOprdge6F9tXB5zLjMw5iRqCtS005iGk1l9zPxy4dLClXXaEOJZsdAM6dVgrIVTo99cMGWOmD0XSnlqw31jrWAFLH8fs3FSQFZODlCueCbrJEj6wTAJq1VoXSyQ8Pd6Le7KWvjMz3cIuxZFr2S2Po9pJsP6RObOUiKAY+V6An1VMdf3YQdJ/WMrseSSTiKytyRcBDSoLFoeGGNxcaujK5vTgA5FTcjcZs/sLD09i9+FtNgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfPeTsJorz2Kyk1AUcC74jgCvotfWHhzxUQiiCODM54=;
 b=Pix7T7foKFCArGJu9Hh1eis/L3murcIiWXveAeG8AppDcbGSliPlenr2T2yPmXOwvNwm6DfDpV+AR84pxlM/PM2UXsZtVhuhVr5/sr+0G9YNaToK9Wzq+n5XjeUqZx7SnciIWvPaumHNF5fZY0z5X+niQ5Q3yo8fjDwZ/+GUhdsGOAulhl78yBeBRJHoKjfB3l5tRnztjEFMBfZw+qaJWvellLZ8eL/OvnnYECnBmP/fq0bTXTBfyg3RYfF/qkeo6Opq32TfbLk1Dec+tr2+iQzFJ3KKH17gXEP7W0WfDlhIjl5HSImn2evW0jstIKGVCA6OSqACSyKYXpA9sNUvog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfPeTsJorz2Kyk1AUcC74jgCvotfWHhzxUQiiCODM54=;
 b=fwh3vvQyYpwt7hNRo4aGblSVs7H9bhefPxnuGXxzh6Ijxkl7QDxPk9WAdGfQmBESPu6LZPxSLdn/HDnFno2HMx+mpn7XzARcl+hDouSShgJw+7RzmFJD02kmVTcDKrv+f65kIHA3YkwJATdRBINP7je20RymnL7bQmCYNFyrxS2snKJHK5/pfKA4FUaDI8b7hadXQJE7e3ojBCbVPenUlq+YiKH1gOMog5mSBMW0QrsB0+VBLmMEMjqH/707nRe7hvpRaS1H/xXIXl0SbXdG02f5JPqugbOUHEEBPvZJuVQLJc4c9hjRRXjuIq8JyTKwepJVdOFdXeGe9Q+wCK4tNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH0PR12MB8152.namprd12.prod.outlook.com (2603:10b6:510:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 15:47:53 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 15:47:53 +0000
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
 Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Date: Fri,  3 Oct 2025 11:47:43 -0400
Message-Id: <20251003154748.1687160-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:408:ee::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH0PR12MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a85ef50-36cd-4a67-6289-08de0294369c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i0SUVV5d3zO3Oo+0vOCkh4i4BdioHVbm1mTN1mVicVaxzWq1zcbYcy4LaYs3?=
 =?us-ascii?Q?tOMratMUb1My+cFV+Er6BD50EyzipLF8aa8N4/lM9JvbvnnTgQw2UgfZWTb2?=
 =?us-ascii?Q?Z5Sb40fN6Ae3Pzla8Z5J2EkvpMV5vlf4jzHVesAxCfkzBTjCVWv9if6dHghD?=
 =?us-ascii?Q?fPEJelezIBJvHtRzLIFWI6YDv0Q9UcFHLPD1c8kPtD8fPrMQHwL0wBrpB0lX?=
 =?us-ascii?Q?GCgcEvbwLTngWNhjdWqFUxiZQoNwIpfwzfSWF9fOd+XP/FuktQav8jMqxogo?=
 =?us-ascii?Q?13YDrkj7Mfi1PmlMUC5tg8wqykkzQz6vaG/0ay+R0FdQLUpe86VxO9dR7dJC?=
 =?us-ascii?Q?MN/Ax+O+UTw3K2hx6wFE0EH4uGzzlTzjnh8gmta3yDQx4AjJmuCv1dRnTK3V?=
 =?us-ascii?Q?5cCJRX+UippVZ5VreqF1iy05ePdRyuYrsWCwrMRImRpQuMWM77gjEctV8uRn?=
 =?us-ascii?Q?XmPuB7tY/TEjpH/dDiH+YR2dgTOmwFZr7h3e3PzXufb2DaCc82x5GMKZn5Uw?=
 =?us-ascii?Q?nHkq61CCh4cNj6w1ZMQmetGHAdaqTFjCNKaHXIB9rjnbxXYtR7dAUkxjMRWe?=
 =?us-ascii?Q?tfRmlIevLpZVvC8zvXK5iShBRYNTOLKFYDp6ZkAgntBSc55quinKEAFZhaQE?=
 =?us-ascii?Q?+I9nhnkf1n1Nje1ytzGdIEhJMqmJi7ggaN9w8ULvn/V96S0SKXT1aqU375CD?=
 =?us-ascii?Q?sBkNyAYNs8kDfVqU++/D1brSgImJ6h2vlVUbpKo5tP1/a7igsRA1LYKK5BM5?=
 =?us-ascii?Q?3rb6TP9GSzSGZRA669UENW31D/Wx0UR13e5wNzlRtMjdtu64dGwAjr6GfZ2d?=
 =?us-ascii?Q?eZiRaJVWB+5CdDNTPEma892MBc4iiWgi0bwaTvst79/wUg1U6Sxl8dOT7nzm?=
 =?us-ascii?Q?OEliPKLoYc2mA2qmJrvhYtObfHSbhCzb/5NDSysRR82rnJRj+eyBfOsMJC5g?=
 =?us-ascii?Q?rutwH/hztLmprIi8mrEt0KhoC6kYr/r/vmO+rMKRcO2T/IL0xoPzpJi10FDP?=
 =?us-ascii?Q?4Fo+ud5bCViHZV4Kno6weq3p/20AUq3e9x+GiKBTj+LJWublB2tHhRrbl0wW?=
 =?us-ascii?Q?Ctm9cyIqrPjgjnnbMtKiOBgg1lcKbGokH6Z1A/EVUMr7Pq6Gch6tpzyEK4Di?=
 =?us-ascii?Q?e+Ov29Ul/6Zddmu7vOgrzxc3sVlY7KWSEUYj/q/atLVUxj6e0538urS1/6F3?=
 =?us-ascii?Q?HqgBXof8/mWR1nPfeuQtESwDaMyerYrcfweJbA3nnp4KbbkRaxTKe0ba9ArG?=
 =?us-ascii?Q?ruT0177aulH1QO9FVLo5cqEBi64zKVncF64Vrkx+xxHbSyoe9eYoSkq3TmC9?=
 =?us-ascii?Q?k7wNH9tCkuNY5lhXT0rcYnZD1Jnf789E3VrCtDn53IOEE17Y16RWE9tbpiU6?=
 =?us-ascii?Q?UkeHbvPwcekCyD1liOr07XQgnHUCHLF10tdb0BKG+SyvSmmljqy6ZLi9lbEj?=
 =?us-ascii?Q?Caq90fiKTlmxhfjpVknmmgXHDni5i7Vh4QBQBRgT/FmL9rPTItIEiQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AXR1YUgE87CJYMERB+E12EgmBAehTWwhkSRCVmnJN1vMyzmpYzWmmMUB78nf?=
 =?us-ascii?Q?AIUYq0UUc2TEH/rk34gWGzKyDn62MKGLTtPbv6jvuJoWj6CZoFkgqPptCcAW?=
 =?us-ascii?Q?UiyD/jM0QMG+WTbVHWeN6uvbS5ePfh2rcXeMuaAl04l/xFNnZ41nKKRlq7sm?=
 =?us-ascii?Q?GhsjWvWqsZ8VhLMdcAJWlrBGNNd2Ujm5su7LDX2cza4lEUvgfWhlFRNfcYo9?=
 =?us-ascii?Q?iJOoDou0zgtivedk6FHePyBWQ/f2EdgFgO7jjbonowWZX1dXDldNapy+T+wZ?=
 =?us-ascii?Q?dJoqfkhpNfZ9d+YG4IfkJAvzos37cVH3L652xa53pEm0vk8bfREKDKE1BOK1?=
 =?us-ascii?Q?cIHMHlK3b0RzahBdxEXqotSLHC2JWtO1w16l+GiDBqZNImhH+4illQHZUC/6?=
 =?us-ascii?Q?qcha64GMeXLCkHFuyiEWIQlekJpJBfWCl8iX60u/8+VE3jczs0OhsmimoSyu?=
 =?us-ascii?Q?VWejuRGT2VIaiGAjKAMQznTP7oAxr++xkweP2UmxA5/8igKB+uiKOYfKdVbA?=
 =?us-ascii?Q?Bb5AEWl63CYMXuNzdDdu+OfvonVEGvIbpyv7IK7KC4VsSydif7a/760aoMSx?=
 =?us-ascii?Q?XnhTwWLPfDSI6fQ/8ZH1p8rfBvAppsmdn9g7XomXXfJYJaMZn1gtlnXpKJfD?=
 =?us-ascii?Q?V11Yr2Ha6jDNRuVjr9iP+drnraCXAih6TUjgQIWBIlclZpU9nr4lySJtOkT3?=
 =?us-ascii?Q?apPeBvdTG50RBilv/KAAGSlwBdi87sj9m51hIdwYLq0y2HoNB4tnML4EVUQY?=
 =?us-ascii?Q?hQEycVg1nfkmOqZ8UqNDULn2ZSR+Y7ReYZ2tdswfC3seKjQ978pdQE86kFgV?=
 =?us-ascii?Q?ymsnLMt4zrWLu1WGANiG9BUx2N70Lf9KoPkftW9oSXmRnKZieLa7vt9rnksY?=
 =?us-ascii?Q?7suNxDJpa4oP18DYoQtG1tvFOI/pIUTMvVeYyF2hUDJF0X9V+uKulNPXr47G?=
 =?us-ascii?Q?biH+bdk+E8W2GhfcTlOtgXpsoJYCHHaFj6RG+pPfpZX8TFSyhRiskbkbcBRn?=
 =?us-ascii?Q?Ws8DN0U7uEE7emqPGjZld3qgUqyQ7o8SwYUwErXmcErD8pRGR7apa5XHp8eX?=
 =?us-ascii?Q?bcoPSg6O6F/FJSJKzIvhI1MHSPOA4FNEZVEoivbLyVDldU11+/BnTvX82ZAU?=
 =?us-ascii?Q?gUx0j7k6G7C+9ROq6Z3gPNQXtqUBpz3TVePj6iHvLoPF6D7rQNGBCJbcJgNB?=
 =?us-ascii?Q?dfUV/6AZgNt9+RffhVT3uVGnNqxYRApfV8JrcqCbHcxQ83dF/1iDVeTYTvNJ?=
 =?us-ascii?Q?ea+k3f6HtNTl0yppz8KVBxTRzkehHQy/oL405cmWD4bz+dtX1l/8pjvIZjVA?=
 =?us-ascii?Q?llzIxuxaVrPCv2ZmoAHddnN/vNHlhsvlhPjJBpe0gPSTVhYcLuXBqImHSf2I?=
 =?us-ascii?Q?MgAJblzMJFlBWeyaGGYeMhdVH/h4qTy+VfFZRFwHG3Tbcyl4gyHEULF0b62l?=
 =?us-ascii?Q?DwADyHpuawluvFii5UtIVgS19KgpAlfwCacCS0OHjziYjDY1j6yhCjNKtuCS?=
 =?us-ascii?Q?0bLUCS3Is2Ys6gj8yIFCBNz35GQ6QQ60cW6co51C7N0mns5dLI1UTzkEXFM1?=
 =?us-ascii?Q?PxuTgNuaku5aYirwKod78NMts1wmdZEVFJPYQrst?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a85ef50-36cd-4a67-6289-08de0294369c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 15:47:52.9315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzF+phfyXeYd94UUTbegpsTOC7DqF2T7G1FkG9NA37mvIRQe9clrhKQ8RcyRub57pU3IFPIPGYsOSwIGB/bdWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8152
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

Hello!

These patches extract and enhance the bitfield support in the register macro in
nova to define Rust structures with bitfields. It then moves out the bitfield
support into the kenrel crate.

Since v5, I dropped several patches and only kept the simple ones that do code
movement, added a few features and added a KUNIT test. After Alex's bounded
integer [1] support is in, we can rewrite the dropped patches.

I also dropped the MAINTAINER entry for now, pending more clarity around that.
I am happy to maintain it, but I need more input on who all will co-maintain,
now that the last 4 patches were dropped. Perhaps we can maintain it was a part
of the core rust-for-linux? I suggest let us create the maintainer entry once
Alex's bounded integer support is integrated but I am open to suggestions.

Here are the v5 patches [2].

[1] https://lore.kernel.org/all/20251002-bounded_ints-v1-0-dd60f5804ea4@nvidia.com/
[2] https://lore.kernel.org/all/20250930144537.3559207-1-joelagnelf@nvidia.com/

Joel Fernandes (5):
  nova-core: bitfield: Move bitfield-specific code from register! into
    new macro
  nova-core: bitfield: Add support for different storage widths
  nova-core: bitfield: Add support for custom visiblity
  rust: Move register and bitfield macros out of Nova
  rust: bitfield: Add KUNIT tests for bitfield

 drivers/gpu/nova-core/falcon.rs               |   2 +-
 drivers/gpu/nova-core/falcon/gsp.rs           |   4 +-
 drivers/gpu/nova-core/falcon/sec2.rs          |   2 +-
 drivers/gpu/nova-core/regs.rs                 |   6 +-
 rust/kernel/bitfield.rs                       | 654 ++++++++++++++++++
 rust/kernel/io.rs                             |   1 +
 .../macros.rs => rust/kernel/io/register.rs   | 301 +-------
 rust/kernel/lib.rs                            |   1 +
 8 files changed, 696 insertions(+), 275 deletions(-)
 create mode 100644 rust/kernel/bitfield.rs
 rename drivers/gpu/nova-core/regs/macros.rs => rust/kernel/io/register.rs (73%)


base-commit: 299eb32863e584cfff7c6b667c3e92ae7d4d2bf9
-- 
2.34.1

