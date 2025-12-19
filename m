Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA694CD1C73
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 21:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0B710F0BB;
	Fri, 19 Dec 2025 20:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hqz2fUNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010028.outbound.protection.outlook.com
 [52.101.193.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDC110F0CC;
 Fri, 19 Dec 2025 20:38:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFT/Pk7Y8CHaD4HFIxw80YsOTV5FdLBYOdSQljg59i4V+RdPeHy9X1RHChphReiZAydzTssg6NNQzDrbC3mxnt/73LhDk804+YNSPvFqC8JxVo3s4BzD3D5qQJ8jXOIxRdc1p3mfYqUyPz/Z1bV/ijqgvyD49G6z9G32qUrBP0l6JaeBNxYgkErsE79Nnk945QAiTlpZU9NUeQ5XRcTSKgYH/nnHl2IHO6nPop1WH0TPb/D3YKB7v0/KP3X6tnSMDWx8DiF8/RpUdM8gnboJiPikpACU9IKwDcR8pymf9taerVxUyYqVySvSW/vaAhWHlp18F5XSN4SiHAODBmccgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lLiZUeYPn/js39AiTKJRSj8gMeB3+hvMowM+2efJOA=;
 b=v+YAK8rxA+jDravRiFfl6kL6S1Xt2F9/UDqltePq4i3wrt+2kLG8AW3OYWgfangOaw+VbcIyfmHkeooQj8u2vZV3tLVsD9o/4dCGr4eVJYJdAZNYTbCziG8vCryHy6YLXLqQRBrPSe/GNR6/V4WQAyQcHaWMZDk4c57aBMZ0goREQMR5sQZr9F7z0eE38mZcFMTztC98z6vjYhtupjkiIuFvAdIGcjozLJYS4H3WH/fkr8c9+LxztGhYIx/VbkZzo/QuQaTIcvTWVL4w6G6aC6WEJuhMmTnmK30VkpBoOE1FQY5SkLk7Bl01+1lK+jDcxpPv3hrbfBYajM71D8hlzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lLiZUeYPn/js39AiTKJRSj8gMeB3+hvMowM+2efJOA=;
 b=Hqz2fUNz1xrcTrMSq3i4T1hAzlJzrKstk+/bkAdUjzhhZlmGYIEFH5Us+1JhujDJ9EzIULL039zPg1q2AGCICTD8scZVTHiEPrUbinYIsiu7tL8NoGGly1I87djIdi1KGNo/8ISXQaIDdZE3Iqgiji35jACObvXRa8TAlHLA4o8nmvSQWozyd1UjRX+vNPDzbjpRT0apGB10cBRArWz7XX7afUDzRKT9Kco8+0A7aKMA9+h/h3INiDbr0MZPpz3l/LwdAuYz8Wa9E2lSMp1Rsn1K6pKh3R5e/go1zAzSLVxUmCBYQlfaLzH0eNFcKMhBZC4HYJMMMjNT1vdn9OSkkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4248.namprd12.prod.outlook.com (2603:10b6:610:7a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 20:38:20 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 20:38:20 +0000
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
Subject: [PATCH RFC v5 5/6] docs: gpu: nova-core: Document the PRAMIN aperture
 mechanism
Date: Fri, 19 Dec 2025 15:38:04 -0500
Message-Id: <20251219203805.1246586-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219203805.1246586-1-joelagnelf@nvidia.com>
References: <20251219203805.1246586-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAP220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::18) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4248:EE_
X-MS-Office365-Filtering-Correlation-Id: bc7002e2-f6d5-4b25-a9b7-08de3f3e8bd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OnINF2ao2PxtLFvsCJwAptGEvrp8UjOIPbPNQYCqgpXGVs4oyvSBrfjcdI1Y?=
 =?us-ascii?Q?l/SJM/WHSfmnSTE27JCNpgH78aJcwz5/sJOe5Q0dfqoaQHMNHNK6Q32G4bzo?=
 =?us-ascii?Q?AnhFaLqsIYc3oNlc1DmdtZ4FL23WtqUUmrfqLSP12e1ovYxm3Of39OLRcJvh?=
 =?us-ascii?Q?pp40dmKNQ0vH7wyLxCAFA9Bo7qYV8zSTgqhSSq4MFfCE4NfinIrN/FydJLAU?=
 =?us-ascii?Q?GrLmhOWybyiSAxhpfFZJzL/EeOeROL7m0bNWAFVAXbRhlp/bhX00YskPglHs?=
 =?us-ascii?Q?M02m7xIuh8v5Lc7Vpn3QTn1Rvbf6g5llDL36fsVRFaFlMq169uUEJdKEK1Mk?=
 =?us-ascii?Q?HzQMadir83nVZxq2amyq7f3eCekNBije4UVuEqQmc6GpRB548WuFb8LtV9fS?=
 =?us-ascii?Q?Dz3a/2vFEYlpkLmIp/C7YHxUD9VoaO4tV5A4WKT2pJ8CvJ0UiXVHT2mWZ2z3?=
 =?us-ascii?Q?yd4gMcZyXLzLPby+56av+u3sdj7GDA+331l+djiZibdrI5zsC84ZyAbmGkwa?=
 =?us-ascii?Q?/uiXHeTsXowBP2n1YQcdEo1v01MXGejpY/KD5PWDL3Xy+lFkJcEoRBziSknN?=
 =?us-ascii?Q?+4NmeSppPWZrP9md1+vGTaedb0SfIYxcujhlzmTAkS/j3e351TEY3/IIa+Ui?=
 =?us-ascii?Q?t3WfzjCdNA79mA2VF3HtUb5NIuQE0ZoskMOLR2pKerQQ1ZU+AIorUNaLzhBy?=
 =?us-ascii?Q?KE+NcmCs7A0GHho9XZwAC3DqBS/n+8YMs53+lFLh9mcAsoYLzDWSR41SBEQB?=
 =?us-ascii?Q?pYk4mUTv/Ur0CIGAlqLBnPGufK2WEKax00QCSrN+08K7Z0FGw6qvmhxKdHB5?=
 =?us-ascii?Q?7XNjmOO2ms0BnEPpYPfH4oceGW6HMKZI1O3SPn5b79XnQO6Azbugsphv74Yx?=
 =?us-ascii?Q?YLNlVhmAFoE/fqC/EEs0Bv0yhh6wpfIdXLVVVUX6EQI+lQFedCUZg08kvxgp?=
 =?us-ascii?Q?Z7im2+2ZDMYre5kx02cmxvu8RJ0HOnka2Z18ly6URcxKXutmVywzpQrT7IN1?=
 =?us-ascii?Q?PHfZKxkJJQgaHjIf8PfMFpTnNVAVTJyTsIjlheVPLpYfffoFc9SCxJRZwgY+?=
 =?us-ascii?Q?JQhak68C3CmCAe/+7SzfFovfT5wZ26pbp52louGrfHrzGBBmuNa4+TGH8RwE?=
 =?us-ascii?Q?F3xk0BPb7uX23KFyGPYJXPwOKr4vuOCDJFpLExrxGDo28nrIs6x0gI/9UzzZ?=
 =?us-ascii?Q?Db9URWaix0YFvQHNvzfGEJRvqmEBQRvCftaq5IpJdrYm14GO/TSmTY8pKBg4?=
 =?us-ascii?Q?eH0jQnrof8WYYdvD2MePdtpuJ7hXl83MDN1wYXempsrKumZxnJtQ5qK7SE12?=
 =?us-ascii?Q?GW4mZ9q8tcZJRaxkQoKGlht6UgwaZG9jPlqfd9XLF5hdU8rpQCekOq3hc6K7?=
 =?us-ascii?Q?98XZ/Ket8cTTyijtToMOOXu9EmdYd7Q71ewGXnKUdy+JDKQ4BcWIEuYgTY2l?=
 =?us-ascii?Q?/ORsd4vqSDHkhLo7VIycvPt3oa6lxkwvDHVBJB+nvrrKRn8xr29ZYMxAX8/4?=
 =?us-ascii?Q?fIxuorBMpXkHyFo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?090Onx0rcL/VefXWnyn78MltJlvffwcvf6K4T2dgqIqsUGUOmITZPrEElhqz?=
 =?us-ascii?Q?YK8S7gjVC8I+Pa8PBORAdu297h9jY5ZkZea8Uma1hE2+qeYC/heU6va4JLV6?=
 =?us-ascii?Q?90cNYnG6vX6OUfGkMcnFAf664CSIyzcE7k0bLUXqTaXyXmz0TZm9tiWzs6GK?=
 =?us-ascii?Q?ht5bPYuO01ohkCrWPBHpoG5pSIUT/qtMVLP3cOiJ7ahe7EcFLii2ZRM5TVGl?=
 =?us-ascii?Q?/HjRe0hCh+6x7CQvvIlfk+gH43PDbuXGC5LFRH4XPi+AaXvWVESfX/sJxwY2?=
 =?us-ascii?Q?QZ/OIslWNwUSNe77qg3Bzym/7M8L9y2Nswi8mPNup+a3bEg5zPIjNSWdYgrV?=
 =?us-ascii?Q?ZRr0s95SGFl7g+AvyDEKWhG8dK3+FGkeTCFm1Xn8sWq1Oh1hE0aHKuF/z6ta?=
 =?us-ascii?Q?9wY65il1QsrHyf6j6ij6gcoX2w40dIGSGDGsURzbKFs+jTV2gRzLv8JQiPa3?=
 =?us-ascii?Q?hrsLababAoUVVdWnSzzTEQi1PUkyFP3Fp78jVLFIcBoLchKfcRncwvpVgUow?=
 =?us-ascii?Q?KuVsV6AP/CjwB7oRvfLHOIo7Qpnf+gMCHCYjsI6viMnpO6BPnbHvDIAYIdZh?=
 =?us-ascii?Q?wKR4NJFAlr8Gelub791pXwDxY1kIWG0C1CAZ64layprV9jWY0Zz0miY8tLN+?=
 =?us-ascii?Q?dTQoey8w9zys/aJgHoBpgZcOw3A7fzk+WGtdcWOz+C1JTDz+9/IFyHwu+RYE?=
 =?us-ascii?Q?jFka3xCJMWC0TpFOAtx/K6gMRB8bp2HDzfxkz4ur5p+eDyUyQfdTM/z7QsNN?=
 =?us-ascii?Q?4tOmV4U3rGhrBN1tBKGg8pNiotKmgJNXcka6/wDbeLd//39td7/6+PzXRrh7?=
 =?us-ascii?Q?hueHbZJeRnDhuBp3HgpWGGl7piXZikkQ9c9GEA3uQC6urj6Z5G0WKY/LwN4R?=
 =?us-ascii?Q?Gric0HVCcSY4mQ2x+cXt1N7yyphnBvHd1yHzoBzXzAQnc9gCqLfbgjgqRIXo?=
 =?us-ascii?Q?0YU3kzIpUjAp96fG1KvwvH+Xf7a3VTLyc+Vz7PN48DYs21YBNmsPne8YiWY9?=
 =?us-ascii?Q?mHgPgTdOi2jGvYV6pbJeS+TVSDDCY+oECUuJQOKSMlVRPQ/OBRhAlXg3TrbP?=
 =?us-ascii?Q?bEFiUSzYbe1zN+j+wKYEq/NHdQPBl2Y4Oc/4sue4tECHk7mK+cggSQ5VFVT/?=
 =?us-ascii?Q?NHpf0OkUbMCWra9h60KE+9AMRkBkzqN+bhK5ln8LDwnf3fWWcyjMWcDSqvWY?=
 =?us-ascii?Q?FJDW+iXWV00emVjG+aNq/c3wnDq9cR7XIepdq2+buZNY1zNsymTwiLBkM4nM?=
 =?us-ascii?Q?lBgdNeD3Kwpn2XDlEo75uv3r5yuApiJrHU8IpiIK1TWHMsDiuzKK7PHb5gVb?=
 =?us-ascii?Q?WxXv9kUecJLcFL56wnXEfOXc/Fyilnspu4OKFKpd5HmD/HPsYyBZ4u8+lYtg?=
 =?us-ascii?Q?FYoO0CmtzmPRRNe9usnLHpEQjghsIF5QRVByjCcaA8ZZ4LmW72NeM57HmIi2?=
 =?us-ascii?Q?scNM1e/IwGYwkZTaLrCXhY68ih7O4i9urcBZygufBFnlYEaMQAePdF39fPa9?=
 =?us-ascii?Q?tOQBpfo4Oxu7z3eF7oL9LsazC+t+oBNerwEHk8svIhBjaZ0ibfxPfa2Vs0+o?=
 =?us-ascii?Q?IeQLyVfDrTtrZVat4vWHgvweXX4Mk5eCpcELIK8ZEteuG/lE+cl/nfVWwomM?=
 =?us-ascii?Q?EgVQecF0N20AjI38Km0yUdr53EpNHhxXMx+lRwBzrwfjB3XvcvA43La41O2N?=
 =?us-ascii?Q?zY3Ezh5fXA8+dGdOhEMlHT2xeF5JnO39BXgF25jQdL4/i8gNY69hjofMg9IA?=
 =?us-ascii?Q?D9CrQTCV/Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7002e2-f6d5-4b25-a9b7-08de3f3e8bd8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 20:38:20.0816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjLhs0rHeM/AiFRscGtAJRUvIOJdkycYNgtnxJua77PR/IbhCJb/enq57aAHEqO1YggBymYPmT1DH2lGFBKGhg==
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

Add documentation for the PRAMIN aperture mechanism used by nova-core
for direct VRAM access.

Nova only uses TARGET=VID_MEM for VRAM access. The SYS_MEM target values
are documented for completeness but not used by the driver.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 Documentation/gpu/nova/core/pramin.rst | 125 +++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst       |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/pramin.rst

diff --git a/Documentation/gpu/nova/core/pramin.rst b/Documentation/gpu/nova/core/pramin.rst
new file mode 100644
index 000000000000..55ec9d920629
--- /dev/null
+++ b/Documentation/gpu/nova/core/pramin.rst
@@ -0,0 +1,125 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================
+PRAMIN aperture mechanism
+=========================
+
+.. note::
+   The following description is approximate and current as of the Ampere family.
+   It may change for future generations and is intended to assist in understanding
+   the driver code.
+
+Introduction
+============
+
+PRAMIN is a hardware aperture mechanism that provides CPU access to GPU Video RAM (VRAM) before
+the GPU's Memory Management Unit (MMU) and page tables are initialized. This 1MB sliding window,
+located at a fixed offset within BAR0, is essential for setting up page tables and other critical
+GPU data structures without relying on the GPU's MMU.
+
+Architecture Overview
+=====================
+
+The PRAMIN aperture mechanism is logically implemented by the GPU's PBUS (PCIe Bus Controller Unit)
+and provides a CPU-accessible window into VRAM through the PCIe interface::
+
+    +-----------------+    PCIe     +------------------------------+
+    |      CPU        |<----------->|           GPU                |
+    +-----------------+             |                              |
+                                    |  +----------------------+    |
+                                    |  |       PBUS           |    |
+                                    |  |  (Bus Controller)    |    |
+                                    |  |                      |    |
+                                    |  |  +--------------+<------------ (window starts at
+                                    |  |  |   PRAMIN     |    |    |     BAR0 + 0x700000)
+                                    |  |  |   Window     |    |    |
+                                    |  |  |   (1MB)      |    |    |
+                                    |  |  +--------------+    |    |
+                                    |  |         |            |    |
+                                    |  +---------|------------+    |
+                                    |            |                 |
+                                    |            v                 |
+                                    |  +----------------------+<------------ (Program PRAMIN to any
+                                    |  |       VRAM           |    |    64KB-aligned VRAM boundary)
+                                    |  |    (Several GBs)     |    |
+                                    |  |                      |    |
+                                    |  |  FB[0x000000000000]  |    |
+                                    |  |          ...         |    |
+                                    |  |  FB[0x7FFFFFFFFFF]   |    |
+                                    |  +----------------------+    |
+                                    +------------------------------+
+
+PBUS (PCIe Bus Controller) is responsible for, among other things, handling MMIO
+accesses to the BAR registers.
+
+PRAMIN Window Operation
+=======================
+
+The PRAMIN window provides a 1MB sliding aperture that can be repositioned over
+the entire VRAM address space using the ``NV_PBUS_BAR0_WINDOW`` register.
+
+Window Control Mechanism
+-------------------------
+
+The window position is controlled via the PBUS ``BAR0_WINDOW`` register::
+
+    NV_PBUS_BAR0_WINDOW Register (0x1700):
+    +-------+--------+--------------------------------------+
+    | 31:26 | 25:24  |               23:0                   |
+    | RSVD  | TARGET |            BASE_ADDR                 |
+    |       |        |        (bits 39:16 of VRAM address)  |
+    +-------+--------+--------------------------------------+
+
+    BASE_ADDR field (bits 23:0):
+    - Contains bits [39:16] of the target VRAM address
+    - Provides 40-bit (1TB) address space coverage
+    - Must be programmed with 64KB-aligned addresses
+
+    TARGET field (bits 25:24):
+    - 0x0: VRAM (Video Memory)
+    - 0x1: SYS_MEM_COH (Coherent System Memory)
+    - 0x2: SYS_MEM_NONCOH (Non-coherent System Memory)
+    - 0x3: Reserved
+
+    .. note::
+       Nova only uses TARGET=VRAM (0x0) for video memory access. The SYS_MEM
+       target values are documented here for hardware completeness but are
+       not used by the driver.
+
+64KB Alignment Requirement
+---------------------------
+
+The PRAMIN window must be aligned to 64KB boundaries in VRAM. This is enforced
+by the ``BASE_ADDR`` field representing bits [39:16] of the target address::
+
+    VRAM Address Calculation:
+    actual_vram_addr = (BASE_ADDR << 16) + pramin_offset
+    Where:
+    - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
+    - pramin_offset: 20-bit offset within the PRAMIN window [0x00000-0xFFFFF]
+
+    Example Window Positioning:
+    +---------------------------------------------------------+
+    |                    VRAM Space                           |
+    |                                                         |
+    |  0x000000000  +-----------------+ <-- 64KB aligned      |
+    |               | PRAMIN Window   |                       |
+    |               |    (1MB)        |                       |
+    |  0x0000FFFFF  +-----------------+                       |
+    |                                                         |
+    |       |              ^                                  |
+    |       |              | Window can slide                 |
+    |       v              | to any 64KB-aligned boundary     |
+    |                                                         |
+    |  0x123400000  +-----------------+ <-- 64KB aligned      |
+    |               | PRAMIN Window   |                       |
+    |               |    (1MB)        |                       |
+    |  0x1234FFFFF  +-----------------+                       |
+    |                                                         |
+    |                       ...                               |
+    |                                                         |
+    |  0x7FFFF0000  +-----------------+ <-- 64KB aligned      |
+    |               | PRAMIN Window   |                       |
+    |               |    (1MB)        |                       |
+    |  0x7FFFFFFFF  +-----------------+                       |
+    +---------------------------------------------------------+
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index e39cb3163581..b8254b1ffe2a 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -32,3 +32,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/devinit
    core/fwsec
    core/falcon
+   core/pramin
-- 
2.34.1

