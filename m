Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD89AGAtlmmlbwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E4E159E68
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4CC10E64A;
	Wed, 18 Feb 2026 21:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qHAuJUpq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011015.outbound.protection.outlook.com [40.107.208.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66B910E667;
 Wed, 18 Feb 2026 21:21:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwvB/LT9nxuBz75BhE6Y1wqClc5fHG+nj7nZFdeJGkGXV+idyk6aOYdIH14vOdLjvOAMyzUnCSU1xN+naud4owm1GWW4LGuE2LcS3DZaH9r1ZrP1IH866QhFJJjF2P0zUxW+6bIxTIk+16TjkKzSb55qIZXv41dqTUEkjJOqkXU1QEDBKKcDTXtfdOxv5uX7ck2Mgmr/tiEgg40G62zC0yEdx/aEdktOn7IlDZsl1Le/k0L24Er7UbAdVcZC5xDhWSCzFpUW8b1KkT/xpwEUZNwB681ShxZii35ed8EtA32xRgoR+2OXquWiYp0U2FLHD7c4tn2C3iSmoxplZ1WJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0eQgoKrxz5ZXvwJVRrum/Jwni9qdvqlTq+PSX4Emr4=;
 b=nuMt+kTcbM+4urGscEXoNosk+QzdIqHTA6FXmUb0sYtsH4xi4JerPfv68+zr3J1/tPKD4l00+2tf0rzKooRdXmluHo3bXhEelZY+lCdbcLn3/CutP/QBvJlHkc7mtEviq6eMuJCsD+F2xCoI0cBjLkjqIxXJ/lMhxGr7PyBJXT7EYvXgxDNRVe/naheCiXl37PdsvMBFzeDRxN8aNkiHoitH81Pg1vjsy1xAQv/oCNm2IJ6lUPYv3wnfb8NEpd6KDaSQxtKJ/2Atug9u2wH2hG7vb/wgckRGfLgC4FRXqf+JOQSWDB/s02G7zZNpir7vSglk/Tjzxu3xHcEGwioVtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0eQgoKrxz5ZXvwJVRrum/Jwni9qdvqlTq+PSX4Emr4=;
 b=qHAuJUpqc3VmufPdQx598rclx9L114D+rEIx9A2RGYItyPUKitJ73IeBEMFaMQXg//aokEZaHbF4+Xc9rOfwaUn4ej1Mk/FIfOdA3p3P64IPasxt2uIHkzasOFn5H3CbFkahXALLUwiceoKRlMrUn3oDfc1aHKVLeNU1FwWlGQZp6leyouC48iNZDG+LS6PCmc68mhAIg25PKMivEE5rf68fHMRVV4KH2y6GQX3ZnPuRs783WHituKt0WoTJTSB8f97niua/inm9mh6nvBcZtpt3C7Phan/i/Dc77wF27FIey4v2oAv4fwckVI+coseUVuqD9QGq0ZzzFCNSL/sHrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:25 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:25 +0000
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
Subject: [PATCH v7 12/23] nova-core: mm: Add page table walker for MMU v2/v3
Date: Wed, 18 Feb 2026 16:20:09 -0500
Message-Id: <20260218212020.800836-13-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0132.namprd02.prod.outlook.com
 (2603:10b6:208:35::37) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e279c6-8153-4574-d49c-08de6f33ab98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k/EeWkxRzmr3TnJxFNF1iGybbdRyJmBR6EMrTMgNYrFcPgs0cHgqyLP5AqED?=
 =?us-ascii?Q?XBY+FfuLsbZfScWwyTqgZ0mU1XHI/vI/IxUnkdjPzMB1MQb+4OtQK138/Bhb?=
 =?us-ascii?Q?inaE4OBl3d2jOvYwQ2hfE+kCNJDnmcdhGe4a6cFzKfY8cAfpidjcIfHQ3ZM3?=
 =?us-ascii?Q?8t82tkTDu3uZDHVLOSjWBkvy6QR6MD0fLxnglXhhdEsFTwXk2ZIUxHSFe6vx?=
 =?us-ascii?Q?97clPS+u7ZsAXpR++1dVbNW2EzZjw4f/hfarZKkadyI859SqbuCF2KNfpBF8?=
 =?us-ascii?Q?BZVaIBiuhbZm0irDLsVBrkCXpM4GaBsZm4zA5zLpMAgd7Ex+8kx9VJNYjvhu?=
 =?us-ascii?Q?i7dy2I9/6HNan2wqDyFCevYp6feeg2rAytGYLYpI1Euz2Zsfh7c3USVqWPv9?=
 =?us-ascii?Q?GJFDVHbfofzF+H5+jfgV4kALsN1vrj3LiDjIbh0HckFJPrAmtqwHfyvP41XE?=
 =?us-ascii?Q?qPKMJP1QR9Q0IfaJiy/LJG65GBELq5oMU83SZUzFqFU1ShYBbXvVQc9mKkgU?=
 =?us-ascii?Q?R/1cimZNGaCxfdL/KbGKc1aIwySw8ui0rLIIsVue7YgaF51alVm42geOwyrV?=
 =?us-ascii?Q?NrVQ331lfqhGTdPjPbht0HEqt7jgww+Q+A8klLc5H8R//ugXhFuJpaAnZD6b?=
 =?us-ascii?Q?beZ0kjxeqQGWh1VcI1BZshFi6rUomMrgRjoqwQEhnTN5vxmbirkjO8k5ZJu7?=
 =?us-ascii?Q?1zhJ07Hz/uG2OeivOQKrM0XZBFKEAdIjs9vsWZn4JLfb7+EL+JPCaC/E3mYF?=
 =?us-ascii?Q?+tM13Bq1UguKXjn+At6ZR5/c5dKARJQcEYogrV/chKSiSwCQeKCgXDeG5UJ2?=
 =?us-ascii?Q?nqs+wKwptqu2EXhVtLvQYpkTBakRpa4TKiLAU3ixhGpXMeKrYxhO5ox5DF6j?=
 =?us-ascii?Q?J5k3RJcgGmIlrDywURacpe6iWSdsBWfEcPW/9xvVvzZEFTisYBzsOdSGjmGr?=
 =?us-ascii?Q?sNhd96Czxivsf2qvmaDIn1ahO+oj1ckEBDBNgBcpa8hODCRy7p85vpWC47kk?=
 =?us-ascii?Q?5pH06CykQKu5va0tzemnVfkqKU2dKItvjElRPaOVF0J0JZVeYfnUJU1zqTvY?=
 =?us-ascii?Q?hTqvQmuN+yTfRy8/PTUD/neDC8fTEGFvvE4iErDJOa/4RIgYDnuLSPMM23IO?=
 =?us-ascii?Q?qUUK0prx4i8uBBdfstdu6/MG3XxcHLFKcjCEaIfxKDEj02h+LVGGm088FnmC?=
 =?us-ascii?Q?4oMWEvC2wSpNVsxoEMcmk5kXs6x5RWx5CWd4WAJIniEBl//M2lwmtoV2LPHk?=
 =?us-ascii?Q?TsF2Rj7sTig4XTRxqNM0VtrxxvKMAHgppjh1mmTpkzqp7U1l1FPpDJgD+wNJ?=
 =?us-ascii?Q?jEzX/QmIr4L02wu3mW9HswHlQLLNww74VryEuXaqcQkI1jubcA5G97ZwxXqm?=
 =?us-ascii?Q?SUp3yPpnbGuqZzUB6FKtMzF76W1yG08zyqAoCG1hE2Q8TDJmq+ZGyBifpFsC?=
 =?us-ascii?Q?5B4DCwWWQiMfJU7WDeDPDFE4qrGJR+S3D+iMgu95LHXs3O2MSXfxMLNoxLAb?=
 =?us-ascii?Q?hOaJpOKGYarlOW3QJnevd0C5N+3puP+qIcex9gjTpliufg3vyyZfdkf1UszR?=
 =?us-ascii?Q?dIiFksYM3yI3sFwfiN4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0ESd40R9dkRvDXoaUfEUqFE+Bj1rjotMQolLQNc/qF9cUS9gUUImgjfmIOzr?=
 =?us-ascii?Q?9vQNNC8HSFHKIndP5SXRpGQ5hJUhISNh9078XGF2A4mcJ8v3BLQQPO+ZLMJ+?=
 =?us-ascii?Q?TFK1z6+32H73QVF/4FmFrU1E6t+YtkHbQIQxox5Z+3QPt1mvVq2tXshQFVnB?=
 =?us-ascii?Q?LSFlL0m8mfWLzNtaX4trbzmU2z7eDpbQcaPLhTMt8oVFAvY890hFyGt0vQa5?=
 =?us-ascii?Q?RtCGV4BYXlT65o8dgDaPxYZ1oLREEOqKw5+X6TWZGBbDqkCL5mYLQ23iiGgj?=
 =?us-ascii?Q?hFasXOZTQBYwuU0p9hWkvg5aouCk4+vqX2sftwbFsPOMjZXwkhyt7SdUnWD0?=
 =?us-ascii?Q?1vRPoXd42uNgQtZUCzqcX3JAV5xd/ybV8PSfHYpT+xa8WlJVYWQ848+k0Hwn?=
 =?us-ascii?Q?n3Ouu2bLtC1q7B0hlB0CgW7oX6FKr0gNRTw/qC9778lHT1SxA04J4ew7XpZ7?=
 =?us-ascii?Q?N6yJydq1mqHVYown6sl2+rzEDh8ohLNLIVaof+uS7WzZkL/Iuw99Cr8gfqmL?=
 =?us-ascii?Q?aRJNPujYZjkwg5CSlAexJ08l8lpcyw61Xyz6UrDUTCGYUejt+FEJi91hYyUM?=
 =?us-ascii?Q?+uhd46Tx/RraZb5KUO02UIMcbOlyxlQ+8n3Ey8UPYxumFsXPZXCe/7Bv4xjB?=
 =?us-ascii?Q?w/WOa1u5wpXmfvbW9ewuQQdwlIvtLZiko4vK84xP6EuacMzLWtb6X1iXwfU6?=
 =?us-ascii?Q?LI+zSFAjgflxTrOIcT+vuetEagReLW8EJWwZ+VUWxzlCcX+vIvy+kMxS1Qni?=
 =?us-ascii?Q?yKWTgccLxGnPcWepq/5IQewqlOY1MIeNRHuupRuw3ZKCTl5LPeCEENpZRqx8?=
 =?us-ascii?Q?9aJRujDyHuI5HMSrwM7pCre1hPIrSqRFnUYqDAefzaKokcAc/2pJq2EZD69K?=
 =?us-ascii?Q?wXbXGG2+hGvuqYImMptCuDFhJ73MJQ4xJfhYdLgNL1+PulrJKjZsW0Ew5Vv6?=
 =?us-ascii?Q?62WtHpUz88asqXx+ikcPxU66h8mqml9BnHZvuQOBXSHiACjlyU9jXQ3ApSTa?=
 =?us-ascii?Q?KNVsyfc7SBawQ2AYZv22Ur5PpyieHE+fTtfeksfWjCDLfeTvJOSyd6zps3MR?=
 =?us-ascii?Q?k1IEv5MH1dCVYq8VCWXAc3OK4Awjw+e2+zKnciXQ+fS5RD4mbEzRgLaI8csz?=
 =?us-ascii?Q?X4Wh3aMYRrFtIsKtYEws6QZhXxhynwpO5z8vZefz9niy0kV2utAJ+mONUfsw?=
 =?us-ascii?Q?2JPdJCyylTpTVsoriozSRlvmhOUaLgyDVOPEEGX1aUqX1ZBmsvGCg5tnNER2?=
 =?us-ascii?Q?cvqNfmciMJq2K+LJ5C19xOr7WsAGYhETlK3qsTTRMWXY/YMCMOabEcfpElF1?=
 =?us-ascii?Q?OCre0MrPzK0Uq/pdZ6S/xRv/v5HSnIt9fzyp7zW9fuk3vtIz4FhjZdl7q/AO?=
 =?us-ascii?Q?Ab2v014Bx8yVxlWyBrM9AwEzngMcoq7vDbd5NE++SgZ7L2+/nCtRoxhOjw9/?=
 =?us-ascii?Q?Kf723J7qxQNqAh1z8ItUyFB1NIaP30w9v0GGSoDycqERdRVHcATDFb7B7zCa?=
 =?us-ascii?Q?Tj84OGPmjecPCVucNSJ8GuS3PHFLqo1v3HbFAVgpAtgW03bRUluSQFqZsx8l?=
 =?us-ascii?Q?J2DZRvXFsTWYuQgmZYyHwE15dCzYSkIn40Q46iet+TOP5ETT/TzYLNwuchWc?=
 =?us-ascii?Q?YauqRMROSAXK4iUzNuB6NBBN8Yj3XhR+eFi88vDWbN/XXiswlKhpILuRCWON?=
 =?us-ascii?Q?EEiwOvw8vKuJGzesc78zyKH0khNeAkrExP7pSK/KxAERN8kTJuOf+aQ2c1kE?=
 =?us-ascii?Q?Up66BGkB0A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e279c6-8153-4574-d49c-08de6f33ab98
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:24.7854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1n2JyJXai6HFaReH8l7f5zyFySmb3/B/zpVyeOyfordXNE9Q5dhsPWt8PdtuyroUELrBuKmdSEmo8qlDAs9xQ==
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
X-Rspamd-Queue-Id: A1E4E159E68
X-Rspamd-Action: no action

Add the page table walker implementation that traverses the page table
hierarchy for both MMU v2 (5-level) and MMU v3 (6-level) to resolve
virtual addresses to physical addresses or find PTE locations.

Currently only v2 has been tested (nova-core currently boots pre-hopper)
with some initial prepatory work done for v3.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/pagetable/mod.rs  |   1 +
 drivers/gpu/nova-core/mm/pagetable/walk.rs | 213 +++++++++++++++++++++
 2 files changed, 214 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/walk.rs

diff --git a/drivers/gpu/nova-core/mm/pagetable/mod.rs b/drivers/gpu/nova-core/mm/pagetable/mod.rs
index 1f783261a30f..2b9fc60fb167 100644
--- a/drivers/gpu/nova-core/mm/pagetable/mod.rs
+++ b/drivers/gpu/nova-core/mm/pagetable/mod.rs
@@ -9,6 +9,7 @@
 #![expect(dead_code)]
 pub(crate) mod ver2;
 pub(crate) mod ver3;
+pub(crate) mod walk;
 
 use kernel::prelude::*;
 
diff --git a/drivers/gpu/nova-core/mm/pagetable/walk.rs b/drivers/gpu/nova-core/mm/pagetable/walk.rs
new file mode 100644
index 000000000000..4ee343734d72
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pagetable/walk.rs
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Page table walker implementation for NVIDIA GPUs.
+//!
+//! This module provides page table walking functionality for MMU v2 and v3.
+//! The walker traverses the page table hierarchy to resolve virtual addresses
+//! to physical addresses or to find PTE locations.
+//!
+//! # Page Table Hierarchy
+//!
+//! ## MMU v2 (Turing/Ampere/Ada) - 5 levels
+//!
+//! ```text
+//!     +-------+     +-------+     +-------+     +---------+     +-------+
+//!     | PDB   |---->|  L1   |---->|  L2   |---->| L3 Dual |---->|  L4   |
+//!     | (L0)  |     |       |     |       |     | PDE     |     | (PTE) |
+//!     +-------+     +-------+     +-------+     +---------+     +-------+
+//!       64-bit        64-bit        64-bit        128-bit         64-bit
+//!        PDE           PDE           PDE        (big+small)        PTE
+//! ```
+//!
+//! ## MMU v3 (Hopper+) - 6 levels
+//!
+//! ```text
+//!     +-------+     +-------+     +-------+     +-------+     +---------+     +-------+
+//!     | PDB   |---->|  L1   |---->|  L2   |---->|  L3   |---->| L4 Dual |---->|  L5   |
+//!     | (L0)  |     |       |     |       |     |       |     | PDE     |     | (PTE) |
+//!     +-------+     +-------+     +-------+     +-------+     +---------+     +-------+
+//!       64-bit        64-bit        64-bit        64-bit        128-bit         64-bit
+//!        PDE           PDE           PDE           PDE        (big+small)        PTE
+//! ```
+//!
+//! # Result of a page table walk
+//!
+//! The walker returns a [`WalkResult`] indicating the outcome.
+
+use kernel::prelude::*;
+
+use super::{
+    DualPde,
+    MmuVersion,
+    PageTableLevel,
+    Pde,
+    Pte, //
+};
+use crate::mm::{
+    pramin,
+    GpuMm,
+    Pfn,
+    Vfn,
+    VirtualAddress,
+    VramAddress, //
+};
+
+/// Result of walking to a PTE.
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum WalkResult {
+    /// Intermediate page tables are missing (only returned in lookup mode).
+    PageTableMissing,
+    /// PTE exists but is invalid (page not mapped).
+    Unmapped { pte_addr: VramAddress },
+    /// PTE exists and is valid (page is mapped).
+    Mapped { pte_addr: VramAddress, pfn: Pfn },
+}
+
+/// Result of walking PDE levels only.
+///
+/// Returned by [`PtWalk::walk_pde_levels()`] to indicate whether all PDE levels
+/// resolved or a PDE is missing.
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum WalkPdeResult {
+    /// All PDE levels resolved -- returns PTE page table address.
+    Complete {
+        /// VRAM address of the PTE-level page table.
+        pte_table: VramAddress,
+    },
+    /// A PDE is missing and no prepared page was provided by the closure.
+    Missing {
+        /// PDE slot address in the parent page table (where to install).
+        install_addr: VramAddress,
+        /// The page table level that is missing.
+        level: PageTableLevel,
+    },
+}
+
+/// Page table walker for NVIDIA GPUs.
+///
+/// Walks the page table hierarchy (5 levels for v2, 6 for v3) to find PTE
+/// locations or resolve virtual addresses.
+pub(crate) struct PtWalk {
+    pdb_addr: VramAddress,
+    mmu_version: MmuVersion,
+}
+
+impl PtWalk {
+    /// Calculate the VRAM address of an entry within a page table.
+    fn entry_addr(
+        table: VramAddress,
+        mmu_version: MmuVersion,
+        level: PageTableLevel,
+        index: u64,
+    ) -> VramAddress {
+        let entry_size = mmu_version.entry_size(level) as u64;
+        VramAddress::new(table.raw_u64() + index * entry_size)
+    }
+
+    /// Create a new page table walker.
+    pub(crate) fn new(pdb_addr: VramAddress, mmu_version: MmuVersion) -> Self {
+        Self {
+            pdb_addr,
+            mmu_version,
+        }
+    }
+
+    /// Walk PDE levels with closure-based resolution for missing PDEs.
+    ///
+    /// Traverses all PDE levels for the MMU version. At each level, reads the PDE.
+    /// If valid, extracts the child table address and continues. If missing, calls
+    /// `resolve_prepared(install_addr)` to resolve the missing PDE.
+    pub(crate) fn walk_pde_levels(
+        &self,
+        window: &mut pramin::PraminWindow<'_>,
+        vfn: Vfn,
+        resolve_prepared: impl Fn(VramAddress) -> Option<VramAddress>,
+    ) -> Result<WalkPdeResult> {
+        let va = VirtualAddress::from(vfn);
+        let mut cur_table = self.pdb_addr;
+
+        for &level in self.mmu_version.pde_levels() {
+            let idx = va.level_index(level.as_index());
+            let install_addr = Self::entry_addr(cur_table, self.mmu_version, level, idx);
+
+            if level == self.mmu_version.dual_pde_level() {
+                // 128-bit dual PDE with big+small page table pointers.
+                let dpde = DualPde::read(window, install_addr, self.mmu_version)?;
+                if dpde.has_small() {
+                    cur_table = dpde.small_vram_address();
+                    continue;
+                }
+            } else {
+                // Regular 64-bit PDE.
+                let pde = Pde::read(window, install_addr, self.mmu_version)?;
+                if pde.is_valid() {
+                    cur_table = pde.table_vram_address();
+                    continue;
+                }
+            }
+
+            // PDE missing in HW. Ask caller for resolution.
+            if let Some(prepared_addr) = resolve_prepared(install_addr) {
+                cur_table = prepared_addr;
+                continue;
+            }
+
+            return Ok(WalkPdeResult::Missing {
+                install_addr,
+                level,
+            });
+        }
+
+        Ok(WalkPdeResult::Complete {
+            pte_table: cur_table,
+        })
+    }
+
+    /// Walk to PTE for lookup only (no allocation).
+    ///
+    /// Returns [`WalkResult::PageTableMissing`] if intermediate tables don't exist.
+    pub(crate) fn walk_to_pte_lookup(&self, mm: &GpuMm, vfn: Vfn) -> Result<WalkResult> {
+        let mut window = mm.pramin().window()?;
+        self.walk_to_pte_lookup_with_window(&mut window, vfn)
+    }
+
+    /// Walk to PTE using a caller-provided PRAMIN window (lookup only).
+    ///
+    /// Uses [`PtWalk::walk_pde_levels()`] for the PDE traversal, then reads the PTE at
+    /// the leaf level. Useful when called for multiple VFNs with single PRAMIN window
+    /// acquisition. Used by [`Vmm::execute_map()`] and [`Vmm::unmap_pages()`].
+    pub(crate) fn walk_to_pte_lookup_with_window(
+        &self,
+        window: &mut pramin::PraminWindow<'_>,
+        vfn: Vfn,
+    ) -> Result<WalkResult> {
+        match self.walk_pde_levels(window, vfn, |_| None)? {
+            WalkPdeResult::Complete { pte_table } => {
+                Self::read_pte_at_level(window, vfn, pte_table, self.mmu_version)
+            }
+            WalkPdeResult::Missing { .. } => Ok(WalkResult::PageTableMissing),
+        }
+    }
+
+    /// Read the PTE at the PTE level given the PTE table address.
+    fn read_pte_at_level(
+        window: &mut pramin::PraminWindow<'_>,
+        vfn: Vfn,
+        pte_table: VramAddress,
+        mmu_version: MmuVersion,
+    ) -> Result<WalkResult> {
+        let va = VirtualAddress::from(vfn);
+        let pte_level = mmu_version.pte_level();
+        let pte_idx = va.level_index(pte_level.as_index());
+        let pte_addr = Self::entry_addr(pte_table, mmu_version, pte_level, pte_idx);
+        let pte = Pte::read(window, pte_addr, mmu_version)?;
+
+        if pte.is_valid() {
+            return Ok(WalkResult::Mapped {
+                pte_addr,
+                pfn: pte.frame_number(),
+            });
+        }
+        Ok(WalkResult::Unmapped { pte_addr })
+    }
+}
-- 
2.34.1

