Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEiuJlxTdWkMEAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 00:18:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0D17F375
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 00:18:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF8310E360;
	Sat, 24 Jan 2026 23:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k+ZzUlz/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED25E10E346;
 Sat, 24 Jan 2026 23:18:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sdy/Y46Yn1vfwm2EmCxhzqrtedVGSxqVfnYvTaKQ4GWUfZqZxdjv0zl0IcWrNLDXppRINdagIFLWy8NkbAOQvZYFenAjLH6oDWmH94ndoacN1N7mRcdPvB55WSy6H627A+DfMpPOQquElWvdx7cSjcFNG6KqOAInQq/Co7puZfdFJg6fw0g79XFcM3xNwASJHzTwkkzVqihY0GTOBOmJ9lJoqZKfIjDH1Brlc7XHW9ykmo3rJHsw/oU+P9+lGtrYa5JyG8NQG2Vj2YFU0qjR6pM6Th2IcTiZcHWuWqDO7OC3atOo9fMX431tLTtg7/008SE5iXFc8ansQaq48AJpZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TFhm7IjfWFoSii9sLWhfXwM8sVY3OHm60hxo6vB0BE=;
 b=ahmsUVNEnyVLo5reuYL0iJ3uXACdxsQ1rdDVV/hbAO0AxlSm77aJQdmeQAy7kya1eFrlXPBgidKmZy8MXyW4VwvFsRqrpGoLhdJ6xV4t9gKZaINMCCTZXfK3dpMsuIryWEjF/ZE8AsoxpYAe2FnR/geFSbtmQ+L483or0kCXWzrkCmT5pIhG+uW8YP2TQtph9d1lTtNK5pGiA6hyjR5eHAJnFYyGE6euLCteWA7boIhz8a/L17K1Bu3brNavR4xDWKuTRyFnGpbvo6glnjnuLm7Fk16Vk1wZ+dWU1uMkN7XyD7W04s1u9gvSX+gBecYiztetz14sRlM6OJc2vEk8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TFhm7IjfWFoSii9sLWhfXwM8sVY3OHm60hxo6vB0BE=;
 b=k+ZzUlz/YQS3u2NpHCLgnH4+u09MIOEeOUchXZU4XPslY2uaNjIftDjdxbrBOqQ08QcdarZL3e293ri9QaerJOMQK6ENg0XqWsin+8jg7g56zifj/YhMwIaQjWHwvKxAnfsYjG6mhorPI72ize70acfR6HF9wlpqOgfBQSUb37oukh1WqOU/DXxFhppD7ik0MpT2iAMB94hz3DD4NDjU7+qkZrg2njxu8aWP9IkQm3rI2MUuQZbWp9iOfHskg7RCdkWrj1W3D0nO7z97KuYqdGa386ennvi32Y6w86Kmm4zRjou7om5qeMtYMymLmdxUJH7ruhXo4MisEH2ccZ9HUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB5734.namprd12.prod.outlook.com (2603:10b6:510:1e1::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.14; Sat, 24 Jan 2026 23:18:41 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 23:18:40 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v1 4/5] gpu: nova-core: use checked arithmetic in
 BinFirmware::data
Date: Sat, 24 Jan 2026 18:18:29 -0500
Message-Id: <20260124231830.3088323-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260124231830.3088323-1-joelagnelf@nvidia.com>
References: <20260124231830.3088323-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:208:32f::31) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: f1879395-e9ba-4a71-efc3-08de5b9ee928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bULeOwLjW/ZCiQJMD8cs4RInzQ2N5pC3zT0wJ9KltEt2xre+nWCADxGOnqLc?=
 =?us-ascii?Q?SBiWNiEGqK4jNtmUr25syvdKtqQe6ac1M8uUDkMe4GdKMXoS4OqECVeyFGW3?=
 =?us-ascii?Q?Rt9Arw18jBDuYFgT+5+KlrLJhBa4ruTUmOaiT1+073w6Vbw5Sa2FtkNNi4lt?=
 =?us-ascii?Q?/RwFAmPdqPCqHzOCoOG3KXenx5VS/WFNiQc78xnp9NfXFGhw/wIovpSerOeO?=
 =?us-ascii?Q?DvsEfF6rQdKW0xn0b2ZIYkpJX5OQ0Kqw8IUi/YzZFAq6QbEeahZdEUZEh+l8?=
 =?us-ascii?Q?hpx+4W5BQS9VzBcYWDNJ3veNZGHt6UOJP8aISeeFf38zLZ3583Dbuk0Ovpo5?=
 =?us-ascii?Q?d/8OWgIj8idomFzdCU58u4T7/R36HsTVdA0ZjE+MVXv+5oYbYzfacxbVOXTI?=
 =?us-ascii?Q?2jxqt3h7t+xmtqwWkGoX/KiPyS7bnIygL83mK2xBk5PgyMkPymICqMnMFEo+?=
 =?us-ascii?Q?z37txIwmtj8/hpXs4PnlVfr3rxHy2QhI7Zrriiwqz1Y5uTzQ+KmGiS5a//FE?=
 =?us-ascii?Q?cW2xZQrPMaiNhM4o3KAGrLYeh59S8Ltq83roOjiNwmrOspoP7jyZfzZcBXHp?=
 =?us-ascii?Q?qfdN27RKRUma8FToopnO9yzJv8ZEix4lc69yBm/RFRPGbpyDwH2qw9s+uszz?=
 =?us-ascii?Q?v2pK6oXlZpd3SfS5KXvhx4KuvWwCwYw6qlz6FuGXEb2wip5remPG2PchLiMl?=
 =?us-ascii?Q?cAtbCAOhftbU9RNz56zOJG8Gxw9p4Io3ibQCkNfwbuujllvIPtbpY88v83Rt?=
 =?us-ascii?Q?55tDYaySV6DWcxMfbeoiUgob1VBPrJS5JIX972WH/m0zRcUfaTnIxDEaoCPK?=
 =?us-ascii?Q?Uc7HqMBcGCHUD8MllBmm6KEWD/Ht0qcr06X+Ec6EKpsP1exjCuneixGIkcM9?=
 =?us-ascii?Q?+CE2xgOuGXvDwMkbR83PnEh4H0ykfR74Driux3wP4QKjNMIembFMUzdTaBRP?=
 =?us-ascii?Q?G/TaEx6qWMOAuuak6TOImmoSV4rkYfweXGWeXvhc5zp0BzVTufkEbJg1jh5S?=
 =?us-ascii?Q?FbeQKMTW18R5xNsPqoZhBJoM8pXEFajsodAX7/Ysjm3qCQgew/OeQBUQwglU?=
 =?us-ascii?Q?3Kc49rYDgQNxR+QgAJnKd2v36irPnRFBDA7i5FpzBkg5QLnNBJWjmJdtRzdX?=
 =?us-ascii?Q?i9zurWrDuB5RG1yFRm/4/H7c5OCS/vIbY8VyBl1giUkKBM67gwG3UdqsS389?=
 =?us-ascii?Q?nm+l3TZGAgc8O8zzcUs04WKiwpDatWSdXbI/ZoUl+ev9OJ70aFVaQO1xf2tN?=
 =?us-ascii?Q?1tK8iC6FCRxP6xVuiM4TkqbkH85oleEH7Am+F9f1AsKpb1i17ap071kqhLd1?=
 =?us-ascii?Q?ImbjBIn7QRBcsZj1bv4MpOVceEdgR1k2O7hwQ4HCKKPLww29nB2yQjWFv2Q6?=
 =?us-ascii?Q?9yeWTwYPRKlEDUKl2eQrUoMQVSJZMv1uKxKkEuh2xCI6BpyCjuLAo8wOW1gk?=
 =?us-ascii?Q?hP/0v5l5BaQJu3LsEbs1n/rOtAUyezozPtwOcDDXpZd+XCjA+PAmUY4Shb2V?=
 =?us-ascii?Q?PaUYZVCz2CDX94jpPrO4eOJRgX5QMZm7dfbi5Y4fzOCtBej9gJqRNd33uPY8?=
 =?us-ascii?Q?cuhmo7mslPYs0NiSots=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m4Gju/0aKgdIHaRZkOZXtLKt0i3pt+sAEDUzYXqkn2mgRcO/n1ohAd58fKT6?=
 =?us-ascii?Q?MYJuE8J1oqtBFMZkjERA68XqzgxL/YcTqW2ZiVm9WUtALP3NoMGui2wmY73V?=
 =?us-ascii?Q?yJpKbbhx0UtPwVtS/hSks4a/l5SxiZ5JDCnxgSnDBcCvJ28OCqxwYPqDWEU+?=
 =?us-ascii?Q?Zg7xFZbcLidTWxmhOQNiyuYQzxAog9yTBXH4AJITbiffdNQqruKGVZqMnsr0?=
 =?us-ascii?Q?UX/vqCfnnjF95dfusp8YgLLI/hrrwp594t6f0nqSXvSG4jXI6QZTe8a6KcYb?=
 =?us-ascii?Q?kkpzKGk/oYuF3TT3APN8WuQAyg6ydbnqa9MtzU5iPaIUYQM+q07Y7mVo2OnU?=
 =?us-ascii?Q?TGSL2fZNCc0P+msE9kuUGtUiWivOzMPfKpEg9dA/pceK7NYT37EEIY4ZM4Q7?=
 =?us-ascii?Q?1jkhB9/WuZHLlinv7kAWZS/Hb47883/vXUfw8fj6BEZmszg0pUWFhaoH234X?=
 =?us-ascii?Q?gVaoGgaHBDjXlW+56ig6GfTj/mMiuUEpE0oHLZR/r8LbBT9t29x+CHnFnb5j?=
 =?us-ascii?Q?iHeyalB03BLvtVy8tSYxfFfYla5haapf13w+oQNrUWKBy4thEPCKVLoU0zUg?=
 =?us-ascii?Q?hiPEouqylgaogCLNI6G304XHEcMpTY54Iy7IYm/GxYFZrVNnkD4qKPHDY5qG?=
 =?us-ascii?Q?YGjhtteNp/dboU+MyEpL0tCycpneagXDcE3VXcMMgzHKKWgpfnuCZUrZUDZz?=
 =?us-ascii?Q?3Zj8U/aJ+h1vF1mtcgMUuehr0Qv2A5k7KvCN+Xg1rrhZMdlzXB6b1Iq9yUCr?=
 =?us-ascii?Q?l8XAqL2G/K/w1d4gTYRQ0JTEraNNnaQO1AimGJybyMQxoozgS+bKo7zevon5?=
 =?us-ascii?Q?heci4UXjpdDlXA7XGl6MIjCQc8pN0iQTglRmlEkXnmdBdthjYuVRm90HUMiC?=
 =?us-ascii?Q?JTdVLSOnnidjpW9M+SZekdJ5WyA3GEuuPvr+iz6r9pBJKgPzEndQDrXdZ+8S?=
 =?us-ascii?Q?H4x48mw94UdMo0e/EQ2D/jWLPbG3ELKZ0B4l4aVNicN1EbCAnAIDVmyVeyxd?=
 =?us-ascii?Q?RCxN32sEilLi6BnKd9Kd+J2Uij0hYTFG2zmOCz4PCCcaMCeaJ9HwSaouFiuH?=
 =?us-ascii?Q?+v/BfcrH82vpN7nYpQtEsRazxt1pSMkHDu+JksD409tJCankgeGK8xxgjLn7?=
 =?us-ascii?Q?2YHdgL9Kd+t6dtd4csW0AifqICnP8ZEiEcAAtpFCv2x2xvn828I0RXZjkfy9?=
 =?us-ascii?Q?fNx/trpeLYOQxvZ7rxwp9EJWcwAZFVmoFykh2gEqkrpIyLER6LSPf8teql5N?=
 =?us-ascii?Q?W2cz2dF7PLMETTWoP+y7nQlclRY0u4/Ae4OjeT3Kik7E+Co1Atx2OSSxddLP?=
 =?us-ascii?Q?7L9VOXQEh0JFkP91qVxaw2FTMp5/A0cNI8djuVYWyzwzjtYGXWEkfKjH1OiY?=
 =?us-ascii?Q?/9YDJK4L6D2j1hfK8vbAqNwSGcH5gSXkSkhJ6eDLm9/a7EvwVYMuxZjfF+HZ?=
 =?us-ascii?Q?IO90Pz9650xp0Sg/IN8uVXGStbVV70QD1J5HgSyuOSYZlzU1oI9TdGucs1yS?=
 =?us-ascii?Q?1Qu2REq1C61M6FQTmguPfeAQ5Z3cc7yYuhfwZbJDtY1xdh/xu+ktvbROXk48?=
 =?us-ascii?Q?QmDQBHZxmwkFDfE8SeGrW2Zad2bIKDEQ54DtNmFhg41RfeJVD0vSQMfeZVdO?=
 =?us-ascii?Q?kFEcxxbVSQ2U7//60usF1Lz+Y+G8etuIL1nJIfgVRAbdwv7BHwpCk7lxOA02?=
 =?us-ascii?Q?SE0Ed+0qqeeS9KVjAs4+eFFv+v95quKtCRTeYlRY+qivPJskIWmg+u13AFeD?=
 =?us-ascii?Q?AVL5uhHClQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1879395-e9ba-4a71-efc3-08de5b9ee928
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 23:18:40.8919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: as1QLUoL7xuqoMaWoktbaB0lQw5ku4CQIVevkXCBiuVyfkwZDkM5DYv/m+lyfuORBNHv9Vs+t9GtFlWHnDEHTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5734
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,google.com,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 4C0D17F375
X-Rspamd-Action: no action

Use checked_add() when computing the firmware data end offset in the
BinFirmware::data() method. The data_offset and data_size fields come
from the BinHdr structure parsed from the firmware file header.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 68779540aa28..4f57a270e142 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -394,8 +394,9 @@ fn new(fw: &'a firmware::Firmware) -> Result<Self> {
     fn data(&self) -> Option<&[u8]> {
         let fw_start = usize::from_safe_cast(self.hdr.data_offset);
         let fw_size = usize::from_safe_cast(self.hdr.data_size);
+        let fw_end = fw_start.checked_add(fw_size)?;
 
-        self.fw.get(fw_start..fw_start + fw_size)
+        self.fw.get(fw_start..fw_end)
     }
 }
 
-- 
2.34.1

