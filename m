Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOZLFkydp2naigAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:47:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B89C1F9FE8
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D506A10E935;
	Wed,  4 Mar 2026 02:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="M7fJMxhB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011063.outbound.protection.outlook.com [52.101.57.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A363410E92C;
 Wed,  4 Mar 2026 02:47:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUrOPAJh+8evO08EzgHB7kW4K/0+4sYWo/+qxQlkBDVCkFWCvLLErJdk0vvkPyoYBnBmBq1t/QpGD66EE4pCkIy0Mjp+rtFcfCCBVSvUOVNJunU2KCv98duAMTr3v5zAg5j2RrH2vCj9PKLmRqmkd4qAMUXrjB+/YOhJNPnuNrqGPt+NST3ENYy0XLocOid3mcvz9qaqEOr4HCxXko1uyyzAhZ5FHaHjiXXR+2YMY9lx0fOG1LsfIeB6k1nb9H9mi6O0xFoqELUWwGPPTsHNLAzUKrbqGg7pa+iLLBNsh2w6Wne1RYilhltpoE18+F9k+Zmy0sR8T8Mtf0IpVSVUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94A+j0/LXULY7HHiYTNJCP5c4BJvL/vC9jF+CvfZKIs=;
 b=VDoDBgyWLPvxpD9mVN/zdCvaue6KAhwuNpNQrg7qcG1mTAgXpMOKiTrBPujhC3kFJD2xN6C3vSOGMzldr895H2BRnhm59chHLJ+guo8sQGySrKZFszAvIXLKp7A53FkxO9dZCKVq+G/VAYDoJhsH7xCbXqC/sOnzUne9QPoGCLz/4X8IWHaI/lT9YuxnyQ9N378yYoJoRQATPnWVs+RZaWMxZ86QdbOfF6K+/EdWEdT0vsCH2OAQRh9COTIjIcAGeacr1hyAm05nrsaUGCG8uveTzQ/OMEL8vmDUomFNJd9iTXKLCRYv7/T3887YIiPWalcJLk0PgrLep2Xujr5xUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94A+j0/LXULY7HHiYTNJCP5c4BJvL/vC9jF+CvfZKIs=;
 b=M7fJMxhBwvF9/E7GoA+xWKs1rQVw2C+8kd27H/MsUb3z1xHhKFecP/yM3fkfv95ukOBF6xp0MUfdLI9b/Ay3V0kpGSOL/Gbl+aZOCahzAg0XIPurecD8FVYDAE0I2QB8o8ZG42Nz+DY5+2WSAV33Zp71PUhUl2GQrskbhoXIkGBgHX9cN8GXFuO8cr39ZztZs+g2KZzrkofGJKtlYd+R3OgwlNrcIhtBaUmbJetj3EpfJesnhF6wJc3vuwncfOTm5SihnlTrTya3IYryWm2fCRPDsFJvdO3NY/Oo19a5PuE0ZszGX962Hr2ZrJo1GSJ3Fj7h00QGUHFF737wqEyDkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Wed, 4 Mar
 2026 02:47:29 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 02:47:29 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 04 Mar 2026 11:46:39 +0900
Subject: [PATCH v3 4/5] gpu: nova-core: gsp: make `Cmdq` a pinned type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cmdq-locking-v3-4-a6314b708850@nvidia.com>
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
In-Reply-To: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0096.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: db537704-edb5-4d78-e2d9-08de7998604e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: YR3MLLyRJYZoEjNZ4jYgmn8YdN+3oKVpQxjAqeTV3KtN9W9x/qbEcwZrKu0ILgcqfyY+9JZURd7/AokoKomGYgqT4rbMsWarVWpwTvg745QHjlUH25XoLP22GQCMMQmnhhcYHWVNsUDyQ5mgxwrLKJZVjhNeGIraPjoF2AiGXcQLI1OgLUGhOov4Ez9xdfMLpncmkNtpaXPEdedOvbbpsiLoH+v4rm6C0pcXjBG/RM4WlC9dTUwpzeKuRInEg5y2QvNl0XQ/ysdmkQwQxj8Hf7aQTAX4bJ1JVGStNqNDtaSJBvJs7ey2Ah8hkWpI8kmAokxLbejd2txIpML0GC71svoT4D54++MkO7stGZ4K1JfIFzaA6JB5y0YL+Fs1GK7dBFuSJqitcHEUSeZlrh86k+FR9VCvMjYIHwZ65817AUsp/JZASHipgFaasZWvq25cepIuyFk6ohT7d6FOUZ7rF5Eh6J0pfJCgbciOh6PbhaOuywkDA/ys8QXI6bRqRrxGzAxIJUrfqykNMR1Ms1P1w/i7VHqBO0Z9K6DmWMhv9ERWzLJn1ww6oMgksjN8sAIKj/CR4kEctP5AHED+IBzzZQ9faPsVHieeqn6fBqRe6k76NQOUpX4fuLE4WpxZmngD8s/J1UzYKbMMjFg/xNqRU+gixQwXyVQUqvo0/edI4rpWefWRuP9vzyyRhSsJabXT1jhUO459Scobdn0SWJGVJ3QLpluDPxEHF6noQbMIaGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3dVMW5aOWtNcTZHOFlTbjJkSjR6b1psb2VTNmY3RDN6Z0V3cEdDREtjRzE2?=
 =?utf-8?B?aVJzc2EwZTYxYlIyeG96eGZpd1B1RU1hdnAwZG1wcWdtWmZLdVFKWTFpd0NP?=
 =?utf-8?B?RjR2WXo2bjEzYUtybW95eDRvWndxRmZXQW1iVkFHMlBUQ2lsOGpkdWYrQkQ1?=
 =?utf-8?B?Tk43SFJiNnJoUmtIVG0vU0JLamVuaWlueFB0dlk4WEsreEtmdndQeW50YS9m?=
 =?utf-8?B?ZmQ1MnBSOUcxL1diYko3NGMxVUhVUE1zQ3cyTzdkQWpFSE4yYTFvbmx0cUJu?=
 =?utf-8?B?Wks0NHFJVE9iWXdpWHRpVU1zTXNWRmdLZ3d5RWJSeDVZaGRRU1dVVjdELy9i?=
 =?utf-8?B?ZnJ6d0lETVEzWG9FZWNJTkEwWlhyU2VsQUIwYk5hcUJIWnF4NC9JYTZiYWYz?=
 =?utf-8?B?YjVidFpEUnRaK1NRMGI3NnV1MHVsdjhSWkdPdEt0Q0NIRnp0NlNNdU1TWUxQ?=
 =?utf-8?B?VTVLQktGUkJZUWZrdTFWS3FxK0M0QUt1aG5rYU1PRFBpVTdXMW95NE9hSW53?=
 =?utf-8?B?ekZJRGtIbW5uNWZtRWl6aG1mMWdrNzFxYWN6WkMzMDFrNDZwZFJLQWYwbldr?=
 =?utf-8?B?ZU54dVgzNjJmNzdMSURuY3cwL1FkbkZYeHlNTkZRdnZPWCtaWmlFQzFCdHVp?=
 =?utf-8?B?YnRrQ0xvRlBUUWxsLzM1U2RQVzU5RDhuNUFIKzBITG5vMTZEdXlHZkxzUDVT?=
 =?utf-8?B?ek53SVozQ1J3WHg5VnJmankzUWNnTzR2Vzh5eGlVaDMyWllhTHNvNFQ4NCt5?=
 =?utf-8?B?ODR6eStrdzBaeDZheXVLT1JVdmFOeFNGUGJJU2lQK0krYUpUckZseVZMSUNK?=
 =?utf-8?B?VG1MTFkvTzNrQng2T3lqMUhSTjFQWW5sVUwvS0tUVWV3SEYwemFiTGxGWWZP?=
 =?utf-8?B?OW8wTlIzYnkrUk9HUTBhWXNlRDJ0RUJPeFVLTjlkOXcrZ1N3RXllaE9veDJn?=
 =?utf-8?B?cHh0OE1QT0FleVc1bTJuNWpqeTVNTThqL3htUm5FWFFKL3RxaVpkN3dmTS8z?=
 =?utf-8?B?UmRpMllGeWNTTGVTUTFaTndBQTRWUGZ3WFh0UVB2emdQVUVLK2pyY1JXR3No?=
 =?utf-8?B?NHZTOWw3TDZmWmZZQ01uVkFDY3hEZTRQWlRiTytKZ0ZQWlVHc3V4ZnZrZzZo?=
 =?utf-8?B?UlVrNU1ncS9DdXBFcVprYkQzT0lOWEVFZ0pNeFVybXl5ZWtsditxS245aERH?=
 =?utf-8?B?aHN6OUNicml5V3daZGxVUk9uK09VS2xZUGlQWjVKOFl1bXIwd1JwaEVnbWpK?=
 =?utf-8?B?TllOa3lvN1QwWDFsenhVNEhablhHeXVlZlVKWXNWV0VtMjNDL0V4NnBURTBk?=
 =?utf-8?B?Ui9nS1NCa3p0Sld3TFZyOEpuTlkyNXFvT2pCbCtJWXNiZ2lpUDNiQVc2dWt6?=
 =?utf-8?B?MXdDb2FPY3NNV3ZNOEwwTnRoUHorbXhBRTdwZmpXdWZ2V1JWa2RuMnV6UHVJ?=
 =?utf-8?B?WnhPaUxuZ2hoREUrSVkvejI5L1RvQnFEZjlqT1hvNUhMVXJVZVZVcHRWeFVq?=
 =?utf-8?B?c0RDWmowVEJUUEhxTDJ2cWJNSUd6SjJtZDBpcWwzT1EyMnNPK1h2c2VxVWwx?=
 =?utf-8?B?amFKMktFcUtrd0ZPN2cvenF4NVpONXF4TEtwa2N1amYzNkdxSGZyb0VCN0tD?=
 =?utf-8?B?c3FyT2cxKzRFNEs3WlFQenVyMWNCTEJZMi9VNURvLzNuQWNncmN5Y1pmU1ZK?=
 =?utf-8?B?cEpjTnRTZHlZdGFWQWFrOVlZK0ErS2FsdFFZZzkwdnZTMUdhZXI3MC9YeHFy?=
 =?utf-8?B?ZDRlNVYxNEh1RHhOSWYzcWpodjRBcEJvVFZjcmppcEVTcmtYeWZuemYzVTlh?=
 =?utf-8?B?L0FyVWxLblRnUEtpNGFpdU8rNi91eXhyK2ttcGRJeEU1R1FyanJBMHVYR3VC?=
 =?utf-8?B?bUxtK0UrUUF3K0xDeks2UDVSd3hXeVA2b1BSMkpGK0lSWm1iQXp4Mys2NG5E?=
 =?utf-8?B?VlVCMUlGWFUxbDV4NS82d0Q1YU1EN3o4OWlDbU44RFl3RUdpMEpNbVVZeGd3?=
 =?utf-8?B?Mm1SVjZwTTZhT1RkSzdLQWE4THhJenc0a3BEeXVvRmdWbEt0bjczYk15bFo4?=
 =?utf-8?B?OFBUZzYzby9Xc1ZMbEt5SHkvOTREQko5WkpaSm9SWW1QSFhMaTdBc0lSc3Bq?=
 =?utf-8?B?YUpFcy9wNGREd25qeHBwcU5UTWRZTXZNTTFTRnFuZldoWlhGcGtaRUdPV3pZ?=
 =?utf-8?B?YUZnVlJBU203SzgySGkxeXFobVI2Y3I2WVNhcUJHOU5TK0YvSmVxOXlyQ3VG?=
 =?utf-8?B?U2dJNituclZxOExaNEIrNi9ScmxEUXlQNDk5NGE0T3VDQmxySUhBTUJRWThh?=
 =?utf-8?B?U2hpYk9RTVYwWjBsOS9vTlRRbm80bi9oZXV6ZjNLbDZYUzA1U09VM2RVL1pM?=
 =?utf-8?Q?an6LE5YHOnVN78+RrtYgWwvSVjgXCBwj7HUpPAr5ZBbW8?=
X-MS-Exchange-AntiSpam-MessageData-1: 8AWJZA/Nbr7a/A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db537704-edb5-4d78-e2d9-08de7998604e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:47:29.1883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oo7RFpzdt51hpOb8yCDPPbTm5WgX0uCFud8DGQdYr0azpoE00aDXSyzSUS+arPtTS3OrCNKho/8o1cJUn65EmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9574
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
X-Rspamd-Queue-Id: 0B89C1F9FE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Action: no action

Make `Cmdq` a pinned type. This is needed to use Mutex, which is needed
to add locking to `Cmdq`.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs      | 5 +++--
 drivers/gpu/nova-core/gsp/cmdq.rs | 9 ++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 174feaca0a6b..a6f3918c20b1 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -112,6 +112,7 @@ pub(crate) struct Gsp {
     /// RM log buffer.
     logrm: LogBuffer,
     /// Command queue.
+    #[pin]
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
     rmargs: CoherentAllocation<GspArgumentsPadded>,
@@ -132,7 +133,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                 loginit: LogBuffer::new(dev)?,
                 logintr: LogBuffer::new(dev)?,
                 logrm: LogBuffer::new(dev)?,
-                cmdq: Cmdq::new(dev)?,
+                cmdq <- Cmdq::new(dev),
                 rmargs: CoherentAllocation::<GspArgumentsPadded>::alloc_coherent(
                     dev,
                     1,
@@ -149,7 +150,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                         libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
                     )?;
                     dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-                    dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(cmdq))?;
+                    dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(&cmdq))?;
                     dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
                 },
             }))
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 7750f5792b21..de84a298909f 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -475,6 +475,7 @@ struct GspMessage<'a> {
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
 /// area.
+#[pin_data]
 pub(crate) struct Cmdq {
     /// Device this command queue belongs to.
     dev: ARef<device::Device>,
@@ -508,13 +509,11 @@ impl Cmdq {
     pub(super) const RECEIVE_TIMEOUT: Delta = Delta::from_secs(10);
 
     /// Creates a new command queue for `dev`.
-    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
-        let gsp_mem = DmaGspMem::new(dev)?;
-
-        Ok(Cmdq {
+    pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
+        try_pin_init!(Self {
+            gsp_mem: DmaGspMem::new(dev)?,
             dev: dev.into(),
             seq: 0,
-            gsp_mem,
         })
     }
 

-- 
2.53.0

