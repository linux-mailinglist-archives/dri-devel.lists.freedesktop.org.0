Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAE6I1Utlmm5bwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E287159DE5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B9310E65B;
	Wed, 18 Feb 2026 21:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fzz06Yj6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010058.outbound.protection.outlook.com [52.101.61.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6C010E642;
 Wed, 18 Feb 2026 21:21:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ov0PQchxbBFPKA4Tr1iGbxhu/qovxjh3zMeITXk06dl+5Czz62XGLBl+ErQ4BxUs9ZvxjFRMv1kdameQI1PQA5TCZ0g9OskWTkX2ThN8LvBoE5UCAeeKHIiOU8AD6SD9GEZLcAHuJPOs22hLplr/RaazeM+eyXgIIaTY6XXsNFFMZ0r07mPYKRTcYZ9Cay8JzwfwMfQ1TpdlGgKIb8hV+4LGNNhLBRVTy3sjf3Z08dWiIQTxYsWZ4jtFoVXI557szYYkHO0vE2x+Zd5lUATk4zGP8EI5VlXSgYFQpiXZ9eK9YTvT6Zu8UK1SNGTQo+3ScsRvvMDsAlJ5qH1idctCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dm/Id0L+bMN976rAe/4bSH1D21ThrIBCdMG6+znLh3c=;
 b=H1YuaRGTGSjaliivQ4Nr6O1dtbyKPCL346WC/ydS10etA/0VDA6gil+f+LndhPhPoKOBDvZrVc+IFII5qEjImejFiColcsfVYadG+XdrvdLgZnEqcD8L1MjOb2qOq0Z0YPGL3b3XI3HyMh7oVFboJYY4XqyI8KedA/icCDCLfoHJKDDConyjzragFbG+COeTo3/wuMq9U//G5SIOvdOFHVJVHLJKB3LharDxmgH5joRTLuBZ3IL0/I31SxpOeueP823OPfnu6Ko+/uO7tTpcg57yMkx/NlmH1CnNqTENZs0e+QL93tBMggE1HzixASM9b6KKC7ECSUfsmbpG9s/7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dm/Id0L+bMN976rAe/4bSH1D21ThrIBCdMG6+znLh3c=;
 b=Fzz06Yj6AHiRONwaal8IXyqcS7uaCzTHXG45jDhdU6ge8Aa7q9kyyh/jOdM5MuZRbygysjKSzeRbdUH7cvMS6cSWdkxQJvN4UNEz88JL6uI51wXn4z3s5kYQMGYvYEyDZugDT9aHn6sTdbF3EHYWD5ygUoUhadtSGFBrQv5foE27X69mFx8vbQUHMVfsfTc2bkpnFDmIb/UNGol+CKUhIp+3Jy54fqADs/Zz/STI/a5Hb1y4A3+/Uw4tN0Z8A4VWMDwN22bxoOBbKOEv6odn4CFvJW86deXHYVJQhvQ178cij2WE88r9p70accKDUYddFzG6iyEWgcuFaChIxDMMwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:10 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:10 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, Nikola Djukic <ndjukic@nvidia.com>
Subject: [PATCH v7 04/23] nova-core: gsp: Add BAR1 PDE base accessors
Date: Wed, 18 Feb 2026 16:20:01 -0500
Message-Id: <20260218212020.800836-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR14CA0001.namprd14.prod.outlook.com
 (2603:10b6:208:23e::6) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: ffcab90f-b61d-48f4-3c20-08de6f33a32a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6r6Fym6s73vFdNF2uYKYQ0mFaTt5jeRSYOgXjLGzgjUz05TPDJBlsIATHAae?=
 =?us-ascii?Q?iQXErxKcbyfo7jI/qTPedi0JjDSmgrBx4YKVF5wFzghMrgd3pcx3waDsyWhR?=
 =?us-ascii?Q?WWKatU2ln1QpHlDoD9EObG6aRrnw8Z1mdesp89TQ761QkU1PiJf23wWG6KiM?=
 =?us-ascii?Q?AEHU7FhAbxbNjytuVvN22yhMGr22IVpLMPuv19nJlQGgIt1hHXmLEi+seH0/?=
 =?us-ascii?Q?RKHT0Znboc/fyWCnnQ2eVdK3X4aj6IVL906TtcTl/4sUrCbAtFDiFP+hK3XO?=
 =?us-ascii?Q?LutI1IWC1795fTYL0cLYRK39gAVVaAMh99Gy88gaKJBw/yG1TeAp1MRNR+bl?=
 =?us-ascii?Q?QyfK7jFnelQNrvi6CpJlPqRnMNVMVQlh8E7pqxItory2WW0F/lgDLZyBZuGy?=
 =?us-ascii?Q?JuFrGe5WBR0eyvW30wyJcrvrMcUB/bmi72+Q01+jTqSmZ9zXAka3sby9btCV?=
 =?us-ascii?Q?lT8O8x6p1H2HztSAMcDoqQ2CQ9S5GcQmJWgwhd//ttcQHWJbN9ME1S+JWwX1?=
 =?us-ascii?Q?lEXYGU/4tibllovH9wr0/Q6H1QhVfb3YSwHD3yOqRBDNxSACs5pAK1aMOMzz?=
 =?us-ascii?Q?yFEWcPf+ojFa51RnyEqTdiBknUpD9P9zxHqCSuJo/ixnMzUyd1AuzO5kyOaJ?=
 =?us-ascii?Q?vrH9USdMSAH8Uy/Jfv08t49ust8m2nw6nsI8HmWYcgbTFtVTqajaWIdyXlwB?=
 =?us-ascii?Q?6xh7nZKxFfpSKF2iHr6FkLaKh8LCp4t9xS1wVBOq+vCK4oWCkFF04aO3czG+?=
 =?us-ascii?Q?/c7JvD+WM1SnETcDjnenfRDBSOnop+fJAoxC/S66yHaEuz8zNVQ7k18nNPxN?=
 =?us-ascii?Q?GEzZK6yRbd/DMOXsycbDGlLxpLK9oHbR26MbUnCL9Y8kH/5jWwhYJqdTLG0i?=
 =?us-ascii?Q?uUCnHRIALfgqHe/Hv/qLRdT7HmfhaKLPAV8olC4oQPGMDy2BCtbd6z/RVzBW?=
 =?us-ascii?Q?/rXdWpHbWaBzhnpU6EyLWtIxM/TLv0gio8i5liMzFMq9YkKp5K2WpMjFzRCg?=
 =?us-ascii?Q?GFUgS4ej3lbjtwvV1SZ7FJei2zmSFfyASB/a2cJ6PZkKfi1JZXSvZyWtwIcU?=
 =?us-ascii?Q?h+J1A0hB2Guk7SkK7t5RitBlZZk9+6+QWxg5bbaR2eRryYTXt/nPsnEQ3QsA?=
 =?us-ascii?Q?sRBRMDneZeuV7MQNjRZCjVDaqGCLbKvY6Z12wUjY7XCTmGHNaL8HBfstG4zO?=
 =?us-ascii?Q?Smo5Hd7vluEnmB/JU+B82+h8Ky7t58bLF2XGbHthuvBENJo4wE5MY3sdQ4wY?=
 =?us-ascii?Q?RxbPSgse5f2HDEQEEk5/iW1knZSqP3qo4oZ2Q3upm74AIHHFnOLBgqCn5PGu?=
 =?us-ascii?Q?yhj5YSy7hSBDvE8dy3kj/8EH7ErVJ9JrjYC5StouBku8JZcPQPIDChV9Y3FF?=
 =?us-ascii?Q?LwAdIUVd5FYBqzzbWGO0VA85zmjfdhrZQ3Iizy7YfEMOXlDcG3c7XVMgGL/T?=
 =?us-ascii?Q?ad9hI2cKYgKuA5337qTzl+UeWMFeXvpLtyEP4EQfO3873iX7B2PLyKyHcQna?=
 =?us-ascii?Q?BygXIbSPrbkgKOYoow/hWzQr7GRTiB3TJ99cDFdTKTJnQbnXv8ro/1960JOT?=
 =?us-ascii?Q?+HY+qfXYM2idCpFm18k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WY0tP6MtjGewwWliitXsbNTVcYNHutA2f9Sq9Pna/pjUlpQw1oQYmJO0g1FI?=
 =?us-ascii?Q?ccTu3jvgp5SHeebLYR+8eo/SVQRzDod7Cy/ItH27NdMdletjlerPOUvrB3ti?=
 =?us-ascii?Q?wnAjGLtBoym4UfHrYDjD2OL9EBMEhQLRgOaHjQvAbPc/9QZ9PSx72hp0IT8k?=
 =?us-ascii?Q?cPmyn0xrNc/NlfdqzLkdau/v/LOWEaemKZ+H1NF72r/1t/j7V4R2Qe6OEp3T?=
 =?us-ascii?Q?+LgJPXvpsrhVevxGsGybNoVI89/J1Qn4Jr9nc2tWTH77G4DAscjj6OUuoCoP?=
 =?us-ascii?Q?C+UBvighlnFT7rnHeWejqNU8H01VTUaL7/kqAfvONwXnRDCUGc6Rt4t2PHeZ?=
 =?us-ascii?Q?3amtR6xkPDmIj/EyVRhx5mV0kc+Gzng9dfI5LqiTCi678X1TpKlatyaaQBgK?=
 =?us-ascii?Q?AizPOFXlTvfR3BG2XqcHdabnbOuEPNRo1klaMaI5R6uahc920xazvsRlE7pp?=
 =?us-ascii?Q?eyAh7dnnhCHi5/fyCeSbwhYxhMWGsNpQrqqidnz7rRgPWI/DRbbtfVoiWW6J?=
 =?us-ascii?Q?Beox2du7FiwKvOrrFtqyc48kze6bn8mhPv4sgZmKT/ZaA+DkAchm3JM6zxn4?=
 =?us-ascii?Q?NGg4NT9G0rpT4o4RKTs64Fd95wywsE9sKb6QHBF2G7KgAQiBBtdZCXgSkmJz?=
 =?us-ascii?Q?yyq3hhq9JErslbyhdCkB7psCo13T/7no10Q1LxraGiaue8vLrVVF9qKEm+1c?=
 =?us-ascii?Q?DOWSZkfzEzkOspFlMnEa7okQOsmVXmedXLnQn6i51/eqFFv1KI9ADNm+yhgc?=
 =?us-ascii?Q?AxJdTargNjcucU18lrvB8pmP0xkiGE8lFCgLYOAV0PhNUPHx2dLLwgHvGRPc?=
 =?us-ascii?Q?5A1zwHuCHXFLYgXJIwnJlYBNvNP1l3B0dbwhQPRb+enRw8GnJVAuZP5+MUdT?=
 =?us-ascii?Q?9bjsY9pSdD4SXEeEO9BGO5RKGw2At8hR01eXiHL/viA9Pv27qn/pdmD1fB9T?=
 =?us-ascii?Q?0iDJ8gYBiNJNgsSrv/w/cx+tqr+zKUtzWQKfwonU0YG1lBMUwM9EQII+ox1H?=
 =?us-ascii?Q?a2lWYBVmCQsUd6RRAKGecPit1Daq+c3qDeaWEey1vqQvZ1/QPMSkHVTmJtAN?=
 =?us-ascii?Q?4GvuX8awiohHrXkxid+tWpwZsbWfefvkvxEN2IosCR3R5wLRimJxP80MXo+m?=
 =?us-ascii?Q?E3GXoV5nMUi8mLC7RFmnrYjZnjCQxnR7ReQV0EtBarIeprOtciaPisfaSX0J?=
 =?us-ascii?Q?ImeE9kgQ3cicyJ+3KaX2rqTirEqeUoW1KkQRCmdK5Wch2e7FscAUA33ACTqI?=
 =?us-ascii?Q?aEQs6m2QHuUaiufQfMBPA7d5s1ljaAebSGqHvtNIdwi80RC6qUL5BLaLZV1X?=
 =?us-ascii?Q?oznmGInjvoz7wuLZBXJmGiuq1Ef13mFzMRsq0nhL26s0EvwP1doKvsdN7YCS?=
 =?us-ascii?Q?HyHNkTKcgwMZjHd3ZN1I8EijnbxoJ10Na9mgiZVuAAU2XybXcRLkbJCj9JjR?=
 =?us-ascii?Q?+1PDE+dHfFzT4Z84vvoYqmgJBqf17WuOhDryEcOMX8xAI61B77GeCnF/aeHG?=
 =?us-ascii?Q?TEtfTalruwsnQYAAEVz0RwrDEW5TCHGtUzBSqLeWJd3fB1m4DMRkeuvOFVpD?=
 =?us-ascii?Q?0KYFr/GtUFOWVJ/GgQV4dyS7tuFIE4U2aF/j9sV8CuxlgzY9RApc4NmX920H?=
 =?us-ascii?Q?aO/sf+rjVjganntsVdah7bB19QGF1K4f9pcphIXEUNvB/BTL3vwDjrlgIwe1?=
 =?us-ascii?Q?nnGG8/sCPvPYDmKzmZDEvS2KZ8ZIPalLgoNwscy0vr66Piy76hfSpCsPekHD?=
 =?us-ascii?Q?c+f+AI/RjA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffcab90f-b61d-48f4-3c20-08de6f33a32a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:10.6633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PD2lnk0KWUzzQJX3jf/ON5Q/3cQ4GaiJNzcpZTvJywvz5TiTKF8lKW5vXRYPJG3c70ZJduVkPhz9tAyYVs8MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999111
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[53];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 3E287159DE5
X-Rspamd-Action: no action

Add accessor methods to GspStaticConfigInfo for retrieving the BAR1 Page
Directory Entry base addresses from GSP-RM firmware.

These addresses point to the root page tables for BAR1 virtual memory spaces.
The page tables are set up by GSP-RM during GPU initialization.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs          | 1 +
 drivers/gpu/nova-core/gsp/commands.rs    | 8 ++++++++
 drivers/gpu/nova-core/gsp/fw/commands.rs | 8 ++++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index d8b2e967ba4c..f30ffa45cf13 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -42,6 +42,7 @@ pub(crate) struct NovaCore {
 const GPU_DMA_BITS: u32 = 47;
 
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
+#[expect(dead_code)]
 pub(crate) type Bar1 = pci::Bar<BAR1_SIZE>;
 
 kernel::pci_device_table!(
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 8f270eca33be..a7778d5d9e32 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -189,6 +189,7 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
 /// The reply from the GSP to the [`GetGspInfo`] command.
 pub(crate) struct GetGspStaticInfoReply {
     gpu_name: [u8; 64],
+    bar1_pde_base: u64,
 }
 
 impl MessageFromGsp for GetGspStaticInfoReply {
@@ -202,6 +203,7 @@ fn read(
     ) -> Result<Self, Self::InitError> {
         Ok(GetGspStaticInfoReply {
             gpu_name: msg.gpu_name_str(),
+            bar1_pde_base: msg.bar1_pde_base(),
         })
     }
 }
@@ -228,6 +230,12 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
             .to_str()
             .map_err(GpuNameError::InvalidUtf8)
     }
+
+    /// Returns the BAR1 Page Directory Entry base address.
+    #[expect(dead_code)]
+    pub(crate) fn bar1_pde_base(&self) -> u64 {
+        self.bar1_pde_base
+    }
 }
 
 /// Send the [`GetGspInfo`] command and awaits for its reply.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 21be44199693..f069f4092911 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -114,6 +114,14 @@ impl GspStaticConfigInfo {
     pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
         self.0.gpuNameString
     }
+
+    /// Returns the BAR1 Page Directory Entry base address.
+    ///
+    /// This is the root page table address for BAR1 virtual memory,
+    /// set up by GSP-RM firmware.
+    pub(crate) fn bar1_pde_base(&self) -> u64 {
+        self.0.bar1PdeBase
+    }
 }
 
 // SAFETY: Padding is explicit and will not contain uninitialized data.
-- 
2.34.1

