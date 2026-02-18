Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Df7CmItlmm5bwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB3D159E87
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D4710E629;
	Wed, 18 Feb 2026 21:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bYORAKuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013069.outbound.protection.outlook.com
 [40.93.196.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F81F10E658;
 Wed, 18 Feb 2026 21:21:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQ9R1AqPfGFz2FZveAkYp6IX0geO5l9hfIfNNJLWhmtWNkUx/1VphLdMMVsokchOdG7ST57XnxMWGKzLmWiDih7Whz6glaRP34T2cytRLnsJaYKsAwvUcRxizZ4KqLY14RIlDwsVFqK6UVO0WmU828xuKQrVX7eODlW0Ur7oXYnk8Yp0JVmRTttLfhd1i30BraCVBNeb9rahvFulIFbEu5e6KkRLtHUnoqpcEoQ+fwVP9HuZAOl9TQtvZxaeZaYvHzhMFgZGCqtubDprwQnZ5ozEKAICPabU98h5r6kPoFxYeKX0Y+bY/MBW4UyvpQKhO2WBEaqUgLm+VOZgkS/7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MorntlvmBNvZvd7EY4OZ6Xqbpuv2TxYxtWGLHOSQlDY=;
 b=ASOzEtyrDX2/L8LPOqQxiKnoO2AEr9fH/1pHq38MvNlMw+byDmoaFYXN0IHdHWcDOtWiqzIGHO/bHl/85A27T43wt2BoMs+pKw18YWlZUSIjKjMgylZkL9gGXO4BokRfuKt6DluhJqZ9AiQPlKY6ISSzkxazBkknUAYoufb2VST6wWAe3/u6XYfPonwL0I8Uq5k2aiItrzdOes/8PfYWhrAu6lEuLv4TszuFdnG0I41RHp5li8lGynGlVV2WkIu8rdmz2NVfcOFQS+CTx8sarQuyQlzFk+PqR2KESxhVV2vCr31bg8tZiBD8VTJ/8ls+4wWgjhWDNjVqiWnQwaD8zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MorntlvmBNvZvd7EY4OZ6Xqbpuv2TxYxtWGLHOSQlDY=;
 b=bYORAKukV7C1lPDzSBmneJPzIKyIOSKN/G/Ddifh35md6kJoMipyE3BCB0heBp4eTYK87Itjt4bs3xmZZ5V0cqBQ6wr6NHrBidaWrv6/zqQtJQbyEtKAYhKKkD7rekBbGycUpAjILmmgfMsQdDTnbVv8LgiRgUsQjGWVA/AYURVEHGJRsRJTYFMSC63H+fCCBJwWL2ZpSGE3hfokIeRS5vDDcDg0oXxbR8pMME0Y6dAmX0g2ywTDJhetL/M/BNmD+3/815wbXhso/zZW2VbjaHx2z9OVx9Kno9/J66XU9Pj4KC3vaPgMM96wxJAkrlwy4vCwOelBSaa5BXAxza4j7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:29 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:29 +0000
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
Subject: [PATCH v7 15/23] nova-core: mm: Add multi-page mapping API to VMM
Date: Wed, 18 Feb 2026 16:20:12 -0500
Message-Id: <20260218212020.800836-16-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:408:fd::34) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: 8603d7a5-da0d-497e-c7e8-08de6f33ae85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VAbM8QhY+m743NB5pDIK6ianabnuwBas4DOvrxxwJ6GRF7CMMZ4mto1yHODf?=
 =?us-ascii?Q?P3cyMHYfZALY+7Noo3IPrkSQpSTKxxK7GntpmLZQlyrHZlRxPnTs2ZWjU5Ng?=
 =?us-ascii?Q?7TxqWN2SQWaPV4tFX5hGHtCUtEV+di0SgJbM5z1wg8KWqCnf2teXbVFwu+LG?=
 =?us-ascii?Q?9BLWqAhgHYPPFmkAe3wGom3WmDMJ3cPFgxRxBUuMN6IiG3RfPNdhlB5A7P8K?=
 =?us-ascii?Q?DqvMY+bIVBdLjdkvOyHR4DG3cMAbClJb7WgauKjasbcDiCpcFqxjKFgsnuwL?=
 =?us-ascii?Q?vvq/GaglK0CcqjFwDPa177xJapHpWUeotJE0szBG8fJDBFQuzdITHHj4ix6M?=
 =?us-ascii?Q?MvVIndecS/EoBCA14K8IhmMJcmvEBlx78uF8gnI8RdPY68oXuE2A9dd+N2Zd?=
 =?us-ascii?Q?JihuvXH+Jxjry/HbAVuvrLhexB7QrRzeNn48Ayn75q4wMV3yIXYmfE5xj1jw?=
 =?us-ascii?Q?g5cfF5+S1AFiAVwtj+Zpu7Hrvb0OOahywgT54eX6dTmzN851UQSfRN6kQEdg?=
 =?us-ascii?Q?2KBZVMmVOTIDzSSAdbJfh6Sglbf2Dg5+ALtz++WgvmaJd8K4K3dJf5L+pohQ?=
 =?us-ascii?Q?/ZHw/FpsObh1QKzeX6c1nK3yrnhZ9YooclksIUSZU0T1F2WtZEql8pCe84Jq?=
 =?us-ascii?Q?sJRfx8v2iI/iOS33QRyjiuyCaYzgbVgyyBa9EWCn6vgbFTBDHnXUoYyP2ycI?=
 =?us-ascii?Q?K9GUq8e23X4mRP+cRXNHaiyn5jYkWjNweiBgoq2A6ABv9/ZItCNFL4HhPYiY?=
 =?us-ascii?Q?8WvCdYTGKUcbOfsgPpIO6cEQPRk6Av4rXhIDo8DcTOB2/2K94nsndfN6Jrbu?=
 =?us-ascii?Q?HzsgiNqtprQMR1VWlXdXHxsXsSxwD+NMAGImZ0v0KFHgGzhOoD8Zyg7apy4H?=
 =?us-ascii?Q?fO6+hVeNYCdeVIEN1utlRePEAS+4kmInSf3L3NhaAzVgcstPCkXQitek/tQa?=
 =?us-ascii?Q?9+MzrmabcNtU1+5a5xNLYpvjKicJSqLXOGs9VwaPrExUxP2r8WDrq3gWUNNX?=
 =?us-ascii?Q?7D35w5f/azBPISLlx2mgmM7bAgVF0ayCDMs27d5GK6gnycLmg+XI317nvmpm?=
 =?us-ascii?Q?jImuyxZHNeY/0QCGfWryDW3V1AGPMLO4UaUdDLnMffWdmXeKC+h/ibbL5Y3j?=
 =?us-ascii?Q?wrLBb9ESXXIljK5g38UAdZnxSZZ6DPccHN7S610ENi0U5xQ2p5utfq1xxdcq?=
 =?us-ascii?Q?6K8MPammpaF8qib5CpPkuN2CVfVH+DzSOjFY1+MAEMnCxEaK8L0hrCPh412T?=
 =?us-ascii?Q?YScsY1Ofx6UzG9iRP9ABwCSopDN4dPS49fjg7M33h5sZsUQSldEEcXtSXmJg?=
 =?us-ascii?Q?IoVyvnWOm0oDflhg0jbJMY2uXNcJ+kCft2tcNFUQkPINS23KXk5zBUoYtWKz?=
 =?us-ascii?Q?vlLC8c08lgsPNxxxkoOhXHdq/c/iUsEJijvU61fQmyTp6aUTaI4MgPSNA9ku?=
 =?us-ascii?Q?eBR+LB0zZ0SgDo+l7CplJRnj3SFf5+Y/ZPQQT45qQBzJ1sLLJ+yuu96216th?=
 =?us-ascii?Q?jJWDVwxuMummvQs2gaXH7QlPOTHkFvBcNmKUxTgwM293ybmJX9WKNwi9mL3a?=
 =?us-ascii?Q?gQBsX0+Kj01frRvHTRk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nVVPWXbYvti43vXNIPyoQ3F6lLDf+66+APASPkCkOejY7yHsv/q4HRIxj3kl?=
 =?us-ascii?Q?NUUQadfjHBQTUYX/7Dg0s7cTpjXDQF4cSf7oxQkOl8/A8+9zolnB/CEIjRcZ?=
 =?us-ascii?Q?6xSvSHotiHuu3l5WzeWV59kXzUs9iipzwzu0tmRavEaMRiJUV1Wpgbn6TfVL?=
 =?us-ascii?Q?xRtaaX0VKS0+mHwPOLMFdXn1aRld2csap+EzdLdluUwpMQSAhORDsQOc0ewM?=
 =?us-ascii?Q?CMTk2TGrvHZRXTrIDYn53kx19SMhkmDW3g0bwqRCQD9RIViUrDxxYfEYEJl5?=
 =?us-ascii?Q?cGRUQdsWDyvsYrhbH7qVC0xk4mpyFScOTiVlIIp8975c72ntugR01JgeV7gO?=
 =?us-ascii?Q?b73EGrPHoWu8uje5RKKtl32Qzj7t3YUkX3PGA0D8rY0/DKqRQ1Vq5vKeJ9bh?=
 =?us-ascii?Q?gMOvSlhXWoTBGolBrCd37qpqPib0cQ5SGmVh0oKHuKNPlzmQvLx3Zl8UeiG5?=
 =?us-ascii?Q?mdeO3fm0a9d/7CipUBJPttmLXUfbACKgfCZuqRHS+oAIkgr4RGbG0uUtkrP+?=
 =?us-ascii?Q?0YsFV7EO+3yqGRTnPdynt2EKDBg6gnUTVqL4cPecoMdR6NYpm8aq/a37WW9B?=
 =?us-ascii?Q?3XNwCHs2400+UdkkucRFSYuTGKEtVej+AxOcosKgigh97fs6fIDiUMkQvLSJ?=
 =?us-ascii?Q?PR2civZqQLAy1XnvLy+DhsxgpJS6tFkJJwqPRk5o6RE9Y7b4y3gsIhaKvDDM?=
 =?us-ascii?Q?Oh2HgqeemwRWhZUB7Rzj7DeM+ohrUKS5zqY60cmu/fPKmfRgEu+6BSFTkPCh?=
 =?us-ascii?Q?ay8+ZQkWw3fABt0BWNQS0NDOfBb9Cly5Hb6IcpcF6me9Dm1n5JxN6B1pInRB?=
 =?us-ascii?Q?742TuEoRXM4YBCrJLTMtt17xJSmi8jrMslf/fOufUzpoRsJjWcBPdw/pKMS2?=
 =?us-ascii?Q?7Xm4Twoyu1TAbKRlqM7uYmJC7iv8lf/yfJY10YVYcLCMBrp3JH24gugAMXPX?=
 =?us-ascii?Q?eCwfLs9frRa/n1cYg6gxX4RbVJM4TKIDAtYxy4Mz1k2V96ehx5hA9hfV0gX7?=
 =?us-ascii?Q?sIlqEKF3gdEfDP2X6yaxawOwMW9p0FQtgaJJLpH8epuzVgusXPsi4O3qjlpr?=
 =?us-ascii?Q?OU4HS/hkSvTyg08fsmIVBsCoTihhsVOo0zV5dBHdaPoRGiRCqtijotBTpF4t?=
 =?us-ascii?Q?Sb3sitzj8eO8nRMVy1zyPEZhqHFypkVlqc3CkdrWLUGW+CGRmJD+0NQJBlhP?=
 =?us-ascii?Q?fc0+TyMmGJulZWOYrQjXQmbBep5Sh43oXxfci0bMNgznbWCqlLKfJaFnuZCq?=
 =?us-ascii?Q?tiGJi2Ab05GHKRRbG2CLF73p7PQwxGUVLlkJVrIwSFGYmS1SxaiIlTMW8nhS?=
 =?us-ascii?Q?FdRp9VdJvYBYG+dVaDeNao7aBHrL5XZsgK+TeQ6C//mlOkG3k1AcQlRXdwif?=
 =?us-ascii?Q?OnDFjuQ9rG6m/0WBwLvY/ce9lzbg6F+J+MIMt7eqlbkBuRuP6vVGKVdbb8tx?=
 =?us-ascii?Q?hsPaALiJsW8MTWTuWTGD13EXIRvBWIywcsJSmnLMLSry24RyDGu4ZiyGbw5u?=
 =?us-ascii?Q?JImhaxFb+jUpFw/uGDt7TYzHjYF0j3n30L2ph7m7cdy6XdFXTOfV3uxuZn//?=
 =?us-ascii?Q?mljDtPgUTitq4Vr0uK6GMpXBGEOC9WPMtujV7k+jLSl4ZhhQT4xbkckZYcqY?=
 =?us-ascii?Q?wLJ8lZQf6wz3yXqYU1kA/5ys86rzJoAKSsK0uPqbpfftUegJ7yU4CrR3MRmE?=
 =?us-ascii?Q?Nlbvn6UyXhbXraWWf0Jg6JC1O4RXlF3MOAyZ9LCtYyvc4C2rkLZtNgvealgz?=
 =?us-ascii?Q?3rr+pdDhdQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8603d7a5-da0d-497e-c7e8-08de6f33ae85
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:29.7208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: le028PspiDZRWDXoLjWvde41tl0SaEbhswmaZVuqyMnaZK8sbypgNEOcfcHVqvGZ5K3T8y3+BTCE7XL/QO7p+Q==
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
X-Rspamd-Queue-Id: CFB3D159E87
X-Rspamd-Action: no action

Add the page table mapping and unmapping API to the Virtual Memory
Manager, implementing a two-phase prepare/execute model suitable for
use both inside and outside the DMA fence signalling critical path.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/vmm.rs | 347 +++++++++++++++++++++++++++++++-
 1 file changed, 345 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/mm/vmm.rs b/drivers/gpu/nova-core/mm/vmm.rs
index 9e57916017ed..af3daccbf958 100644
--- a/drivers/gpu/nova-core/mm/vmm.rs
+++ b/drivers/gpu/nova-core/mm/vmm.rs
@@ -17,15 +17,25 @@
         GpuBuddyParams, //
     },
     prelude::*,
+    rbtree::{RBTree, RBTreeNode},
     sizes::SZ_4K, //
 };
 
+use core::cell::Cell;
 use core::ops::Range;
 
 use crate::mm::{
     pagetable::{
-        walk::{PtWalk, WalkResult},
-        MmuVersion, //
+        walk::{
+            PtWalk,
+            WalkPdeResult,
+            WalkResult, //
+        },
+        DualPde,
+        MmuVersion,
+        PageTableLevel,
+        Pde,
+        Pte, //
     },
     GpuMm,
     Pfn,
@@ -46,6 +56,74 @@ pub(crate) struct Vmm {
     page_table_allocs: KVec<Pin<KBox<AllocatedBlocks>>>,
     /// Buddy allocator for virtual address range tracking.
     virt_buddy: GpuBuddy,
+    /// Prepared PT pages pending PDE installation, keyed by `install_addr`.
+    ///
+    /// Populated by `Vmm` mapping prepare phase and drained in the execute phase.
+    /// Shared by all pending maps in the `Vmm`, thus preventing races where 2
+    /// maps might be trying to install the same page table/directory entry pointer.
+    pt_pages: RBTree<VramAddress, PreparedPtPage>,
+}
+
+/// A pre-allocated and zeroed page table page.
+///
+/// Created during the mapping prepare phase and consumed during the mapping execute phase.
+/// Stored in an [`RBTree`] keyed by the PDE slot address (`install_addr`).
+struct PreparedPtPage {
+    /// The allocated and zeroed page table page.
+    alloc: Pin<KBox<AllocatedBlocks>>,
+    /// Page table level -- needed to determine if this PT page is for a dual PDE.
+    level: PageTableLevel,
+}
+
+/// Multi-page prepared mapping -- VA range allocated, ready for execute.
+///
+/// Produced by [`Vmm::prepare_map()`], consumed by [`Vmm::execute_map()`].
+/// The struct owns the VA space allocation between prepare and execute phases.
+pub(crate) struct PreparedMapping {
+    vfn_start: Vfn,
+    num_pages: usize,
+    vfn_alloc: Pin<KBox<AllocatedBlocks>>,
+}
+
+/// Result of a mapping operation -- tracks the active mapped range.
+///
+/// Returned by [`Vmm::execute_map()`] and [`Vmm::map_pages()`].
+/// Owns the VA allocation; the VA range is freed when this is dropped.
+/// Callers must call [`Vmm::unmap_pages()`] before dropping to invalidate
+/// PTEs (dropping only frees the VA range, not the PTE entries).
+pub(crate) struct MappedRange {
+    pub(crate) vfn_start: Vfn,
+    pub(crate) num_pages: usize,
+    /// VA allocation -- freed when [`MappedRange`] is dropped.
+    _vfn_alloc: Pin<KBox<AllocatedBlocks>>,
+    /// Logs a warning if dropped without unmapping.
+    _drop_guard: MustUnmapGuard,
+}
+
+/// Guard that logs a warning once if a [`MappedRange`] is dropped without
+/// calling [`Vmm::unmap_pages()`].
+struct MustUnmapGuard {
+    armed: Cell<bool>,
+}
+
+impl MustUnmapGuard {
+    const fn new() -> Self {
+        Self {
+            armed: Cell::new(true),
+        }
+    }
+
+    fn disarm(&self) {
+        self.armed.set(false);
+    }
+}
+
+impl Drop for MustUnmapGuard {
+    fn drop(&mut self) {
+        if self.armed.get() {
+            kernel::pr_warn_once!("MappedRange dropped without calling unmap_pages()\n");
+        }
+    }
 }
 
 impl Vmm {
@@ -72,6 +150,7 @@ pub(crate) fn new(
             mmu_version,
             page_table_allocs: KVec::new(),
             virt_buddy,
+            pt_pages: RBTree::new(),
         })
     }
 
@@ -127,4 +206,268 @@ pub(crate) fn read_mapping(&self, mm: &GpuMm, vfn: Vfn) -> Result<Option<Pfn>> {
             WalkResult::Unmapped { .. } | WalkResult::PageTableMissing => Ok(None),
         }
     }
+
+    /// Allocate and zero a physical page table page for a specific PDE slot.
+    /// Called during the map prepare phase.
+    fn alloc_and_zero_page_table(
+        &mut self,
+        mm: &GpuMm,
+        level: PageTableLevel,
+    ) -> Result<PreparedPtPage> {
+        let params = GpuBuddyAllocParams {
+            start_range_address: 0,
+            end_range_address: 0,
+            size_bytes: SZ_4K as u64,
+            min_block_size_bytes: SZ_4K as u64,
+            buddy_flags: BuddyFlags::try_new(0)?,
+        };
+        let blocks = KBox::pin_init(mm.buddy().alloc_blocks(&params), GFP_KERNEL)?;
+
+        // Get page's VRAM address from the allocation.
+        let page_vram = VramAddress::new(blocks.iter().next().ok_or(ENOMEM)?.offset());
+
+        // Zero via PRAMIN.
+        let mut window = mm.pramin().window()?;
+        let base = page_vram.raw();
+        for off in (0..PAGE_SIZE).step_by(8) {
+            window.try_write64(base + off, 0)?;
+        }
+
+        Ok(PreparedPtPage {
+            alloc: blocks,
+            level,
+        })
+    }
+
+    /// Ensure all intermediate page table pages are prepared for a [`Vfn`]. Just
+    /// finds out which PDE pages are missing, allocates pages for them, and defers
+    /// installation to the execute phase.
+    ///
+    /// PRAMIN is released before each allocation and re-acquired after. Memory
+    /// allocations outside of holding this lock to prevent deadlocks with fence signalling
+    /// critical path.
+    fn ensure_pte_path(&mut self, mm: &GpuMm, vfn: Vfn) -> Result {
+        let walker = PtWalk::new(self.pdb_addr, self.mmu_version);
+        let max_iter = 2 * self.mmu_version.pde_level_count();
+
+        // Keep looping until all PDE levels are resolved.
+        for _ in 0..max_iter {
+            let mut window = mm.pramin().window()?;
+
+            // Walk PDE levels. The closure checks self.pt_pages for prepared-but-uninstalled
+            // pages, letting the walker continue through them as if they were installed in HW.
+            // The walker keeps calling the closure to get these "prepared but not installed" pages.
+            let result = walker.walk_pde_levels(&mut window, vfn, |install_addr| {
+                self.pt_pages
+                    .get(&install_addr)
+                    .and_then(|p| Some(VramAddress::new(p.alloc.iter().next()?.offset())))
+            })?;
+
+            match result {
+                WalkPdeResult::Complete { .. } => {
+                    // All PDE levels resolved.
+                    return Ok(());
+                }
+                WalkPdeResult::Missing {
+                    install_addr,
+                    level,
+                } => {
+                    // Drop PRAMIN before allocation.
+                    drop(window);
+                    let page = self.alloc_and_zero_page_table(mm, level)?;
+                    let node = RBTreeNode::new(install_addr, page, GFP_KERNEL)?;
+                    let old = self.pt_pages.insert(node);
+                    if old.is_some() {
+                        kernel::pr_warn_once!(
+                            "VMM: duplicate install_addr in pt_pages (internal consistency error)\n"
+                        );
+                        return Err(EIO);
+                    }
+                    // Loop: re-acquire PRAMIN and re-walk from root.
+                }
+            }
+        }
+
+        Err(EIO)
+    }
+
+    /// Prepare resources for mapping `num_pages` pages.
+    ///
+    /// Allocates a contiguous VA range, then walks the hierarchy per-VFN to prepare pages
+    /// for all missing PDEs. Returns a [`PreparedMapping`] with the VA allocation.
+    ///
+    /// If `va_range` is not `None`, the VA range is constrained to the given range. Safe
+    /// to call outside the fence signalling critical path.
+    pub(crate) fn prepare_map(
+        &mut self,
+        mm: &GpuMm,
+        num_pages: usize,
+        va_range: Option<Range<u64>>,
+    ) -> Result<PreparedMapping> {
+        if num_pages == 0 {
+            return Err(EINVAL);
+        }
+
+        // Pre-reserve so execute_map() can use push_within_capacity (no alloc in
+        // fence signalling critical path).
+        // Upper bound on page table pages needed for the full tree (PTE pages + PDE
+        // pages at all levels).
+        let pt_upper_bound = self.mmu_version.pt_pages_upper_bound(num_pages);
+        self.page_table_allocs.reserve(pt_upper_bound, GFP_KERNEL)?;
+
+        // Allocate contiguous VA range.
+        let (vfn_start, vfn_alloc) = self.alloc_vfn_range(num_pages, va_range)?;
+
+        // Walk the hierarchy per-VFN to prepare pages for all missing PDEs.
+        for i in 0..num_pages {
+            let vfn = Vfn::new(vfn_start.raw() + i as u64);
+            self.ensure_pte_path(mm, vfn)?;
+        }
+
+        Ok(PreparedMapping {
+            vfn_start,
+            num_pages,
+            vfn_alloc,
+        })
+    }
+
+    /// Execute a prepared multi-page mapping.
+    ///
+    /// Drain prepared PT pages and install PDEs followed by single TLB flush.
+    pub(crate) fn execute_map(
+        &mut self,
+        mm: &GpuMm,
+        prepared: PreparedMapping,
+        pfns: &[Pfn],
+        writable: bool,
+    ) -> Result<MappedRange> {
+        if pfns.len() != prepared.num_pages {
+            return Err(EINVAL);
+        }
+
+        let PreparedMapping {
+            vfn_start,
+            num_pages,
+            vfn_alloc,
+        } = prepared;
+
+        let walker = PtWalk::new(self.pdb_addr, self.mmu_version);
+        let mut window = mm.pramin().window()?;
+
+        // First, drain self.pt_pages, install all pending PDEs.
+        let mut cursor = self.pt_pages.cursor_front_mut();
+        while let Some(c) = cursor {
+            let (next, node) = c.remove_current();
+            let (install_addr, page) = node.to_key_value();
+            let page_vram = VramAddress::new(page.alloc.iter().next().ok_or(ENOMEM)?.offset());
+
+            if page.level == self.mmu_version.dual_pde_level() {
+                let new_dpde = DualPde::new_small(self.mmu_version, Pfn::from(page_vram));
+                new_dpde.write(&mut window, install_addr)?;
+            } else {
+                let new_pde = Pde::new_vram(self.mmu_version, Pfn::from(page_vram));
+                new_pde.write(&mut window, install_addr)?;
+            }
+
+            // Track the allocated pages in the `Vmm`.
+            self.page_table_allocs
+                .push_within_capacity(page.alloc)
+                .map_err(|_| ENOMEM)?;
+
+            cursor = next;
+        }
+
+        // Next, write PTEs (all PDEs now installed in HW).
+        for (i, &pfn) in pfns.iter().enumerate() {
+            let vfn = Vfn::new(vfn_start.raw() + i as u64);
+            let result = walker.walk_to_pte_lookup_with_window(&mut window, vfn)?;
+
+            match result {
+                WalkResult::Unmapped { pte_addr } | WalkResult::Mapped { pte_addr, .. } => {
+                    let pte = Pte::new_vram(self.mmu_version, pfn, writable);
+                    pte.write(&mut window, pte_addr)?;
+                }
+                WalkResult::PageTableMissing => {
+                    kernel::pr_warn_once!("VMM: page table missing for VFN {vfn:?}\n");
+                    return Err(EIO);
+                }
+            }
+        }
+
+        drop(window);
+
+        // Finally, flush the TLB.
+        mm.tlb().flush(self.pdb_addr)?;
+
+        Ok(MappedRange {
+            vfn_start,
+            num_pages,
+            _vfn_alloc: vfn_alloc,
+            _drop_guard: MustUnmapGuard::new(),
+        })
+    }
+
+    /// Map pages doing prepare and execute in the same call.
+    ///
+    /// This is a convenience wrapper for callers outside the fence signalling critical
+    /// path (e.g., BAR mappings). For DRM usecases, [`Vmm::prepare_map()`] and
+    /// [`Vmm::execute_map()`] will be called separately.
+    pub(crate) fn map_pages(
+        &mut self,
+        mm: &GpuMm,
+        pfns: &[Pfn],
+        va_range: Option<Range<u64>>,
+        writable: bool,
+    ) -> Result<MappedRange> {
+        if pfns.is_empty() {
+            return Err(EINVAL);
+        }
+
+        // Check if provided VA range is sufficient (if provided).
+        if let Some(ref range) = va_range {
+            let required = pfns.len().checked_mul(PAGE_SIZE).ok_or(EOVERFLOW)? as u64;
+            let available = range.end.checked_sub(range.start).ok_or(EINVAL)?;
+            if available < required {
+                return Err(EINVAL);
+            }
+        }
+
+        let prepared = self.prepare_map(mm, pfns.len(), va_range)?;
+        self.execute_map(mm, prepared, pfns, writable)
+    }
+
+    /// Unmap all pages in a [`MappedRange`] with a single TLB flush.
+    ///
+    /// Takes the range by value (consumes it), then invalidates PTEs for the range,
+    /// flushes the TLB, then drops the range (freeing the VA). PRAMIN lock is held.
+    pub(crate) fn unmap_pages(&mut self, mm: &GpuMm, range: MappedRange) -> Result {
+        let walker = PtWalk::new(self.pdb_addr, self.mmu_version);
+        let invalid_pte = Pte::invalid(self.mmu_version);
+
+        let mut window = mm.pramin().window()?;
+        for i in 0..range.num_pages {
+            let vfn = Vfn::new(range.vfn_start.raw() + i as u64);
+            let result = walker.walk_to_pte_lookup_with_window(&mut window, vfn)?;
+
+            match result {
+                WalkResult::Mapped { pte_addr, .. } | WalkResult::Unmapped { pte_addr } => {
+                    invalid_pte.write(&mut window, pte_addr)?;
+                }
+                WalkResult::PageTableMissing => {
+                    continue;
+                }
+            }
+        }
+        drop(window);
+
+        mm.tlb().flush(self.pdb_addr)?;
+
+        // TODO: Internal page table pages (PDE, PTE pages) are still kept around.
+        // This is by design as repeated maps/unmaps will be fast. As a future TODO,
+        // we can add a reclaimer here to reclaim if VRAM is short. For now, the PT
+        // pages are dropped once the `Vmm` is dropped.
+
+        range._drop_guard.disarm(); // Unmap complete, Ok to drop MappedRange.
+        Ok(())
+    }
 }
-- 
2.34.1

