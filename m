Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBG5OUstlmmlbwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A781159D59
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E48C10E631;
	Wed, 18 Feb 2026 21:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aD2ZwA9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012064.outbound.protection.outlook.com
 [40.107.200.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D0710E62D;
 Wed, 18 Feb 2026 21:21:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pg7Bhg7vX7Ri16uJ6u1AetkB+qd+PZ06wVTR1wz6X7yyqDRxKLoRac4YmjBteFKa/i/zN3dJAqUObPooiT1XyLkyGK5hXCic+fJjnmIb1HYRyJwmzyEzDTTTZAWvvY1yhk8VP3AHBO2DdqM+fRQ1+MACbmpg8azNjwnRIYFMbwsLdpqwllHsBSpYS+ENfHiGRTu9GOezqpeeSrbL8UW8TNnNSFDDv22vaY+v1tIDTD16Czr1HRinXxmTEJdmTLtmzUQD/Y/53e5rChli5ybUs0ezjz58Hlswn4riEDFynBYakVoqIIPPrWHc9vk4zd3YyktkGyOriy86HyFxNNrCGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sT4ommh7tLlwmlDD6wuE0I49nGauntTXBhDhqIqn2F0=;
 b=ZjEVr2uT0T4aS4Ue0wzg6SE8zPqpspoZCscQdgHKcOzRPeFTVALQHdxECLjFbjngd9fVKMIa9+jL2TVpnaarKsX8i/Szxf0IUP4rXcvJ6IrPREY9c8bE9yCZK9y2VDKStd/XGLVQSASXvlHQsAmEwK+znAuCeVLMSGAxxN1L/AQfLLYwBOnqwIRL72PN0w7HGSr7x7xW1uRLTnUBmwpEfRNXWx/wRp00qoiO/H800BglFeSsb2H675s64cpp1CfrIpVY3dswrGbbvEbuQPP0O6X/q83iRERYMLfzqdI1w6Kl9QL7sBC6CQMc8qAnoqehOWbA+fZG66/1hPoOJRTlDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sT4ommh7tLlwmlDD6wuE0I49nGauntTXBhDhqIqn2F0=;
 b=aD2ZwA9MKTauIs41MCrTnCayFHArXEWTe5I4qW108Wal7bPkncNGtRbf4dcZYUPiZcPll7HR9HvGkt+xKdwdr3XQm+Q/DHL3fpTT0WWDeQ42NQwJfU2RWZB4/NchrqYCCigOHEl4IiWuUBp/XjTAfRCRtfwGNb63Zv7Mxb060VvIN1pyR+5WQvoiW3NH6lZe1ZqLDYB8lnREBLxL2eWYAutTOM3gcCkjtd+MvMJXaLkOVcozKkwfD4wLSt9sgMI30RPdHUjw1nsloJt8Ml3SgZkVUQ/R8zzT1SUwm9sD0NAJIrGuzG/Xjjpog+8CAGWqq7/NvvnbB/QjvvHPDGPseg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:05 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:05 +0000
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
Subject: [PATCH v7 01/23] nova-core: mm: Add support to use PRAMIN windows to
 write to VRAM
Date: Wed, 18 Feb 2026 16:19:58 -0500
Message-Id: <20260218212020.800836-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR14CA0004.namprd14.prod.outlook.com
 (2603:10b6:208:23e::9) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: e635460a-cb47-4980-5e78-08de6f339fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?weDSbQAWPeIW5agECpvHVmfKBgQNtA1pCkhOFC7M6ogvV1MINRNnX2Smyu6I?=
 =?us-ascii?Q?A+DQMyeYD22EfOIxZMvwAv9f9wCAg7iWrn+C653bKaLVBZF57yHQDZyYNq8X?=
 =?us-ascii?Q?TOwKdLFjAnSwrxW/9lfa/kYQylhgCS95sSxC82eTBCdvOc/ojXL132VfHYS7?=
 =?us-ascii?Q?NfcMlijRVJ7aE6dvAsfW3u461fpdXndvd5tSraqAllkJ9pggtyrcVq4FMtlQ?=
 =?us-ascii?Q?8d1767Sz+8frJeLWOiS/kBM4fCeQhaLFLEu2vVk6C0oIosLTjPj2JMZN+rjr?=
 =?us-ascii?Q?DvREmOrmNf0TlVAlCCNZBc6QhnbVtrbePHeH+4A546v4R2tk82WZvl45IDwv?=
 =?us-ascii?Q?Devqa8t0NXoWVbPu78wTIgWSulSxRux/ymOxsxtQ1kmo6CnZ884kmY4ER+SA?=
 =?us-ascii?Q?1D1ml5vfvYvK5mXh5lvbTwPKxxuGQqtaqGLpPv7GhnalDRVmOPpMMRtR4Yby?=
 =?us-ascii?Q?k1sx/bbwS6q7TewHKCqXa1wzRgFnBttvqX2fEqZVD3Y19JRjkXR3N19kX1EK?=
 =?us-ascii?Q?k/13idDWjGdRiUn/QnYNB5nAEGlc5EJVgjVxwSVWfbxCC/yvshvH5c1Q3l7v?=
 =?us-ascii?Q?HZQ9eMlpUJvzrH10zxaXtleULuVHPnERQVrotIFnImEVFVeipUSMbznLYY4l?=
 =?us-ascii?Q?9JeBDG/Z6YjVRYIt+WU4TeWVzrfHVWHOfe/MFtAp4E8w+x96RoY/3OQqaHQw?=
 =?us-ascii?Q?3FbkopbX9UwZAM+lzlxCx0zdFuSn0kr5rrUbcVlUNkkRMOT6QFJbJq7A7r+7?=
 =?us-ascii?Q?7r3NjYM5+i5gV82QAlq1IpCks/DP2OdIITINuZZo01W1iu7jLsHUkJscDlA1?=
 =?us-ascii?Q?46GGRC5t2S6tGRMhuy98VnodoB0xZq3eRZZtUO3z7MlyE7PHlR6xrwtMeudf?=
 =?us-ascii?Q?SBT0O1SV4vhuuvXByLNh6FDG1tK2ur+9dSmhqEp6n4A7721vkMTLTzrlTGwQ?=
 =?us-ascii?Q?8DKioTQ3o92MQvGwZ9jRfEn9r4Fhr6sJNPuQmp3Fx5bF+rfpOcJW2p5IaZ5Y?=
 =?us-ascii?Q?QHtRW3dOj4wEwk/KfEX6UipKfRZZNDb/LH2cQMjEEdqA1jShkuckk2+/D49n?=
 =?us-ascii?Q?xOArNyiXmbyYkqFDh+Ucz4sMlm9BSgs3HY9oznNrTaq6e7AN6RfPkun0pEqD?=
 =?us-ascii?Q?fxarCeLikozTZ+krz4ft29g+8gCDTTq3ztQdSYpfZq+2k7GMmxLpbE8BL3A4?=
 =?us-ascii?Q?WdWK9MR5/Hlbn5d3JWRKTkI8xMAFsUwr/CxBl8yocxuyH6lz0zDywS4X5xaE?=
 =?us-ascii?Q?Alnn5Uu711VYhs+LRN4neJq01YSirp5sHFMJ8mA58tjBzUEKNA9QvfJ3QbpY?=
 =?us-ascii?Q?1kfGnbqVBUW+wk29DRp0mw7LyMeeBin09QB2i9VBttGKR0tfOi3vs47GH07/?=
 =?us-ascii?Q?6avMr3YnBjQLBNFonoPyr7zeeq0gg1NQuPrhZyQRdX2nMEB5geWfu1DoPCPt?=
 =?us-ascii?Q?D0fhtCRFOf4+44g5E7zcLRW60ql8B314+5Py2BCyR9JlXOPLBIG7vRjfVExw?=
 =?us-ascii?Q?TDVHh5nwHj7ExK0NsShUyCa76PpdPxc3LOoxl1QtaIdUVVJ9SHp0a6jP/kpa?=
 =?us-ascii?Q?4OvX+Ka9ZnRFWpeP0u0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G4SFl4jD3ex+PSB43V6VoaPjJ1TI7janDFlKMLjPQcrsp0rptnRKmQA1hZn7?=
 =?us-ascii?Q?xtYcr+OcsfofzSvch8mJLIqnR6xndLfgx6HvcqsrUsfMpjU1Ra7z4+1VWYMH?=
 =?us-ascii?Q?xtruypliJJWS8yXITu9i+u2TfjJc4OagmRj5mmOi5RO/S/JWCHOnc8Fq0WQs?=
 =?us-ascii?Q?eH862eJEvbsjopMaJf5/zIHdjUACbXkqu0p/HFKnYZ2Y+D0wk7XlDb2G2E0a?=
 =?us-ascii?Q?9qAl9zzlTknwelqRFDBY4L7PDl8InaHurB56lZVlYMgIgZsztvD/PpITQyxI?=
 =?us-ascii?Q?6vf3eOdUmIHBQjaEDJmJWZ5YANKjbWR5u0C45nBtuBwv+eO4eHBQGkiE/LGR?=
 =?us-ascii?Q?TL/2vcp0jJ72PAnNccpar2Gk5oHqBs3zpRx8yTPPAmylAZVzM5A1rj1ex0IE?=
 =?us-ascii?Q?TSEkpc937i0/Uf3EQbB7xbE/sNrL+0YwhFpQurs/ZfTGkD3OqVnoh2BqSJU/?=
 =?us-ascii?Q?sBJDhqjc/IMIIKCLzXc7/WsOzQ7iPq19jdCv+vErdVxQ5P9f2Y5ED6z/IPop?=
 =?us-ascii?Q?NBCsMJQwwoDfg2cpIG5RZK1nMswGvXjbCujewwv+VRUGWNDF3nBOkBsm8S3e?=
 =?us-ascii?Q?4C/Dk8MX6UI0giYF7OS1KVEB/j33+pQM7dO/GRKfzTf/1wGEEUERWHve5RGh?=
 =?us-ascii?Q?d68/B3/i/z4HHLExVjr3W5jrKqX8zCO6lytcE8Ef78hXCioBYguTVQuupuPl?=
 =?us-ascii?Q?tRyt5nph97K4VosJycHb9qm2NEn772egGGvO7ZJ3/IGFeVlgw0sqlqjRzuoY?=
 =?us-ascii?Q?bDrvA7pFBAqOg7BbxXm0CV6ueWPT9Oy30w7n37m17D8R1pxlonLi8M357gKB?=
 =?us-ascii?Q?aMG4pE9+7ddn3RLIizuhlrqvytDp9knKbuesw9r3JclatAcwgdC1Lyzae6Y2?=
 =?us-ascii?Q?Y4PvbnXoSvpMvF6bDY3rxPyev1HRleY7O7mKXVcp5Xu5+hN/UHrUOz7mfpGj?=
 =?us-ascii?Q?CXwxgiJktqgURicW4mMklLVzUpboOhnxLIMsE8EgwZNpmRCdR2BoxFOcxz/F?=
 =?us-ascii?Q?ApqEq+ETqXCX0KEvuFIj2k3h5bcPaRC8y/E8FpSRsxMopVbBexrQkuxaqoQ8?=
 =?us-ascii?Q?IuKcA+RRVnQdYwasmdO+PRFdx5574NGRl+76PZTK4dsz+LoBxg+85YBZOUBg?=
 =?us-ascii?Q?t6gV4vq911io0dculIY/6Ebw/fa16CtFmstyFyVyflYkyfJ7Q6JLOyFEFbJ4?=
 =?us-ascii?Q?1QqX1nxK6JYdhbNvhPeP4WZhaInPr6btUyPGU8SMdc0W2FK3xqvy79h8m73I?=
 =?us-ascii?Q?S6case9dgDr75uZXO2paNg2a64AZBNLVO0x1dcCoKzZW4fUrvJHqMTq3SNt9?=
 =?us-ascii?Q?KLjoF2q5VMxempjf+ZcuOz6rBcCZraeXPcUwguSJH74ueNSbZx16jf6P7MrE?=
 =?us-ascii?Q?Bm78zSPvpp6mkfdXbhTrizRq25mY1ROyHkCDIjGN4rt9qeqBJk/f7w2H9gme?=
 =?us-ascii?Q?L9ebefSpTtmjj7OxgNfNxlype+gyn4dTA46c6xf+Hzn1R1i4YrEFRa9mqQqB?=
 =?us-ascii?Q?QtSFrzr+hbqaHt0YMG6oOq84y9W2WI4fCyjHloLW4Cgts5L6LIeTUPc00Xxt?=
 =?us-ascii?Q?6uplriEtRzFxnovuMHOgiSgAOZ3Qxtwo4hGecR+h2f4zXUtgfszA7yQQRo0Z?=
 =?us-ascii?Q?d/lYiDO4Ze/GyZBDZlrRr+GeOt4/edKpZy0HIr35ZO4aBtPPKO1jyLoj+XcY?=
 =?us-ascii?Q?LWeB4ICucxHO938bhBj4Ux+PepKPYHZaoUqtuhefSRewReJH+vxU6Kd3+lvO?=
 =?us-ascii?Q?LkJApQqjog=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e635460a-cb47-4980-5e78-08de6f339fa0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:05.0642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uF7fKoVibZ0CiaK6fzYdNpTDlGXl8D+HiPrFNwwoaxy5Fn25V0J8xFyY2FTqGq6GhN0HneLn4qWSVJNcCJbqcQ==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 9A781159D59
X-Rspamd-Action: no action

PRAMIN apertures are a crucial mechanism to direct read/write to VRAM.
Add support for the same.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/mod.rs    |   5 +
 drivers/gpu/nova-core/mm/pramin.rs | 293 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |   5 +
 4 files changed, 304 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/mod.rs
 create mode 100644 drivers/gpu/nova-core/mm/pramin.rs

diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
new file mode 100644
index 000000000000..7a5dd4220c67
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Memory management subsystems for nova-core.
+
+pub(crate) mod pramin;
diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/mm/pramin.rs
new file mode 100644
index 000000000000..77916f5b231e
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pramin.rs
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Direct VRAM access through the PRAMIN aperture.
+//!
+//! PRAMIN provides a 1MB sliding window into VRAM through BAR0, allowing the CPU to access
+//! video memory directly. Access is managed through a two-level API:
+//!
+//! - [`Pramin`]: The parent object that owns the BAR0 reference and synchronization lock.
+//! - [`PraminWindow`]: A guard object that holds exclusive PRAMIN access for its lifetime.
+//!
+//! The PRAMIN aperture is a 1MB region at BAR0 + 0x700000 for all GPUs. The window base is
+//! controlled by the `NV_PBUS_BAR0_WINDOW` register and must be 64KB aligned.
+//!
+//! # Examples
+//!
+//! ## Basic read/write
+//!
+//! ```no_run
+//! use crate::driver::Bar0;
+//! use crate::mm::pramin;
+//! use kernel::devres::Devres;
+//! use kernel::prelude::*;
+//! use kernel::sync::Arc;
+//!
+//! fn example(devres_bar: Arc<Devres<Bar0>>) -> Result<()> {
+//!     let pramin = Arc::pin_init(pramin::Pramin::new(devres_bar)?, GFP_KERNEL)?;
+//!     let mut window = pramin.window()?;
+//!
+//!     // Write and read back.
+//!     window.try_write32(0x100, 0xDEADBEEF)?;
+//!     let val = window.try_read32(0x100)?;
+//!     assert_eq!(val, 0xDEADBEEF);
+//!
+//!     Ok(())
+//!     // Original window position restored on drop.
+//! }
+//! ```
+//!
+//! ## Auto-repositioning across VRAM regions
+//!
+//! ```no_run
+//! use crate::driver::Bar0;
+//! use crate::mm::pramin;
+//! use kernel::devres::Devres;
+//! use kernel::prelude::*;
+//! use kernel::sync::Arc;
+//!
+//! fn example(devres_bar: Arc<Devres<Bar0>>) -> Result<()> {
+//!     let pramin = Arc::pin_init(pramin::Pramin::new(devres_bar)?, GFP_KERNEL)?;
+//!     let mut window = pramin.window()?;
+//!
+//!     // Access first 1MB region.
+//!     window.try_write32(0x100, 0x11111111)?;
+//!
+//!     // Access at 2MB - window auto-repositions.
+//!     window.try_write32(0x200000, 0x22222222)?;
+//!
+//!     // Back to first region - window repositions again.
+//!     let val = window.try_read32(0x100)?;
+//!     assert_eq!(val, 0x11111111);
+//!
+//!     Ok(())
+//! }
+//! ```
+
+#![allow(unused)]
+
+use crate::{
+    driver::Bar0,
+    regs, //
+};
+
+use kernel::bits::genmask_u64;
+use kernel::devres::Devres;
+use kernel::io::Io;
+use kernel::new_mutex;
+use kernel::prelude::*;
+use kernel::ptr::{
+    Alignable,
+    Alignment, //
+};
+use kernel::sizes::{
+    SZ_1M,
+    SZ_64K, //
+};
+use kernel::sync::{
+    lock::mutex::MutexGuard,
+    Arc,
+    Mutex, //
+};
+
+/// PRAMIN aperture base offset in BAR0.
+const PRAMIN_BASE: usize = 0x700000;
+
+/// PRAMIN aperture size (1MB).
+const PRAMIN_SIZE: usize = SZ_1M;
+
+/// 64KB alignment for window base.
+const WINDOW_ALIGN: Alignment = Alignment::new::<SZ_64K>();
+
+/// Maximum addressable VRAM offset (40-bit address space).
+///
+/// The `NV_PBUS_BAR0_WINDOW` register has a 24-bit `window_base` field (bits 23:0) that stores
+/// bits [39:16] of the target VRAM address. This limits the addressable space to 2^40 bytes.
+///
+/// CAST: On 64-bit systems, this fits in usize.
+const MAX_VRAM_OFFSET: usize = genmask_u64(0..=39) as usize;
+
+/// Generate a PRAMIN read accessor.
+macro_rules! define_pramin_read {
+    ($name:ident, $ty:ty) => {
+        #[doc = concat!("Read a `", stringify!($ty), "` from VRAM at the given offset.")]
+        pub(crate) fn $name(&mut self, vram_offset: usize) -> Result<$ty> {
+            // Compute window parameters without bar reference.
+            let (bar_offset, new_base) =
+                self.compute_window(vram_offset, ::core::mem::size_of::<$ty>())?;
+
+            // Update window base if needed and perform read.
+            let bar = self.bar.try_access().ok_or(ENODEV)?;
+            if let Some(base) = new_base {
+                Self::write_window_base(&bar, base);
+                self.state.current_base = base;
+            }
+            bar.$name(bar_offset)
+        }
+    };
+}
+
+/// Generate a PRAMIN write accessor.
+macro_rules! define_pramin_write {
+    ($name:ident, $ty:ty) => {
+        #[doc = concat!("Write a `", stringify!($ty), "` to VRAM at the given offset.")]
+        pub(crate) fn $name(&mut self, vram_offset: usize, value: $ty) -> Result {
+            // Compute window parameters without bar reference.
+            let (bar_offset, new_base) =
+                self.compute_window(vram_offset, ::core::mem::size_of::<$ty>())?;
+
+            // Update window base if needed and perform write.
+            let bar = self.bar.try_access().ok_or(ENODEV)?;
+            if let Some(base) = new_base {
+                Self::write_window_base(&bar, base);
+                self.state.current_base = base;
+            }
+            bar.$name(value, bar_offset)
+        }
+    };
+}
+
+/// PRAMIN state protected by mutex.
+struct PraminState {
+    current_base: usize,
+}
+
+/// PRAMIN aperture manager.
+///
+/// Call [`Pramin::window()`] to acquire exclusive PRAMIN access.
+#[pin_data]
+pub(crate) struct Pramin {
+    bar: Arc<Devres<Bar0>>,
+    /// PRAMIN aperture state, protected by a mutex.
+    ///
+    /// # Safety
+    ///
+    /// This lock is acquired during the DMA fence signalling critical path.
+    /// It must NEVER be held across any reclaimable CPU memory / allocations
+    /// (`GFP_KERNEL`), because the memory reclaim path can call
+    /// `dma_fence_wait()`, which would deadlock with this lock held.
+    #[pin]
+    state: Mutex<PraminState>,
+}
+
+impl Pramin {
+    /// Create a pin-initializer for PRAMIN.
+    pub(crate) fn new(bar: Arc<Devres<Bar0>>) -> Result<impl PinInit<Self>> {
+        let bar_access = bar.try_access().ok_or(ENODEV)?;
+        let current_base = Self::try_read_window_base(&bar_access)?;
+
+        Ok(pin_init!(Self {
+            bar,
+            state <- new_mutex!(PraminState { current_base }, "pramin_state"),
+        }))
+    }
+
+    /// Acquire exclusive PRAMIN access.
+    ///
+    /// Returns a [`PraminWindow`] guard that provides VRAM read/write accessors.
+    /// The [`PraminWindow`] is exclusive and only one can exist at a time.
+    pub(crate) fn window(&self) -> Result<PraminWindow<'_>> {
+        let state = self.state.lock();
+        let saved_base = state.current_base;
+        Ok(PraminWindow {
+            bar: self.bar.clone(),
+            state,
+            saved_base,
+        })
+    }
+
+    /// Read the current window base from the BAR0_WINDOW register.
+    fn try_read_window_base(bar: &Bar0) -> Result<usize> {
+        let reg = regs::NV_PBUS_BAR0_WINDOW::read(bar);
+        let base = u64::from(reg.window_base());
+        let shifted = base.checked_shl(16).ok_or(EOVERFLOW)?;
+        shifted.try_into().map_err(|_| EOVERFLOW)
+    }
+}
+
+/// PRAMIN window guard for direct VRAM access.
+///
+/// This guard holds exclusive access to the PRAMIN aperture. The window auto-repositions
+/// when accessing VRAM offsets outside the current 1MB range. Original window position
+/// is saved on creation and restored on drop.
+///
+/// Only one [`PraminWindow`] can exist at a time per [`Pramin`] instance (enforced by the
+/// internal `MutexGuard`).
+pub(crate) struct PraminWindow<'a> {
+    bar: Arc<Devres<Bar0>>,
+    state: MutexGuard<'a, PraminState>,
+    saved_base: usize,
+}
+
+impl PraminWindow<'_> {
+    /// Write a new window base to the BAR0_WINDOW register.
+    fn write_window_base(bar: &Bar0, base: usize) {
+        // CAST:
+        // - We have guaranteed that the base is within the addressable range (40-bits).
+        // - After >> 16, a 40-bit aligned base becomes 24 bits, which fits in u32.
+        regs::NV_PBUS_BAR0_WINDOW::default()
+            .set_window_base((base >> 16) as u32)
+            .write(bar);
+    }
+
+    /// Compute window parameters for a VRAM access.
+    ///
+    /// Returns (`bar_offset`, `new_base`) where:
+    /// - `bar_offset`: The BAR0 offset to use for the access.
+    /// - `new_base`: `Some(base)` if window needs repositioning, `None` otherwise.
+    fn compute_window(
+        &self,
+        vram_offset: usize,
+        access_size: usize,
+    ) -> Result<(usize, Option<usize>)> {
+        // Validate VRAM offset is within addressable range (40-bit address space).
+        let end_offset = vram_offset.checked_add(access_size).ok_or(EINVAL)?;
+        if end_offset > MAX_VRAM_OFFSET + 1 {
+            return Err(EINVAL);
+        }
+
+        // Calculate which 64KB-aligned base we need.
+        let needed_base = vram_offset.align_down(WINDOW_ALIGN);
+
+        // Calculate offset within the window.
+        let offset_in_window = vram_offset - needed_base;
+
+        // Check if access fits in 1MB window from this base.
+        if offset_in_window + access_size > PRAMIN_SIZE {
+            return Err(EINVAL);
+        }
+
+        // Return bar offset and whether window needs repositioning.
+        let new_base = if self.state.current_base != needed_base {
+            Some(needed_base)
+        } else {
+            None
+        };
+
+        Ok((PRAMIN_BASE + offset_in_window, new_base))
+    }
+
+    define_pramin_read!(try_read8, u8);
+    define_pramin_read!(try_read16, u16);
+    define_pramin_read!(try_read32, u32);
+    define_pramin_read!(try_read64, u64);
+
+    define_pramin_write!(try_write8, u8);
+    define_pramin_write!(try_write16, u16);
+    define_pramin_write!(try_write32, u32);
+    define_pramin_write!(try_write64, u64);
+}
+
+impl Drop for PraminWindow<'_> {
+    fn drop(&mut self) {
+        // Restore the original window base if it changed.
+        if self.state.current_base != self.saved_base {
+            if let Some(bar) = self.bar.try_access() {
+                Self::write_window_base(&bar, self.saved_base);
+
+                // Update state to reflect the restored base.
+                self.state.current_base = self.saved_base;
+            }
+        }
+        // MutexGuard drops automatically, releasing the lock.
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..3de00db3279e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,6 +13,7 @@
 mod gfw;
 mod gpu;
 mod gsp;
+mod mm;
 mod num;
 mod regs;
 mod sbuffer;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index ea0d32f5396c..d0982e346f74 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -102,6 +102,11 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
     31:16   frts_err_code as u16;
 });
 
+register!(NV_PBUS_BAR0_WINDOW @ 0x00001700, "BAR0 window control for PRAMIN access" {
+    25:24   target as u8, "Target memory (0=VRAM, 1=SYS_MEM_COH, 2=SYS_MEM_NONCOH)";
+    23:0    window_base as u32, "Window base address (bits 39:16 of FB addr)";
+});
+
 // PFB
 
 // The following two registers together hold the physical system memory address that is used by the
-- 
2.34.1

