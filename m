Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD1FJl1TdWkMEAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 00:18:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ECB7F383
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 00:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943A310E351;
	Sat, 24 Jan 2026 23:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="agQhG8jo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7C510E355;
 Sat, 24 Jan 2026 23:18:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VY8TWGfr7JHZQCwmgCEAuIEk2pbr7YWDvUBoDz2y1yFBKXzWwttupUVYNjAM2vEYV5u4jIeaEthli3yM76A62yF1QaprUi+T1EABUBhAqK9cmSHdyIEP0jRKqKMLDRdo4lRgHfFMJfSKuO78xX8grrOlBK20lwfz0vjbe2dw3bMT8zDPm5CWdO9UcqblxIYUfuuCL1+9M3MvEZEhKaJEiYA+NUMZZkA+maWDhjrmM3JD9VDSZbTc37RnuKLq+LsPxcvRt3f2ZnEZPKkTKoZoetYc8+xxxlEKQv+TKWUz03dZfWvDyaHPFyOkxVaUGvtoxx5934tYf/2lwXqCwETwhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9JkVqePk0p4SMlF6/nB9oQrcWzdjkLxl0KHSQkSf5k=;
 b=nhDeLG+BWHuJf0ntl0iDH2GwvvAqhg9KZFQUCe/xQWqsFOTbg5F8UEhK3b7STQP64+AJ3/lXzeDbA3zvR71wovwIOS5hfm9PwNaK18gEIrQu1sHWklNibaimtY7TNXyES/t/xyqHbGzMji9zRNi46USMnLKhR8RuTLnzj91M6558fOXY5s1slD44D9iJtBoZERmVl+mEgy+Znme1jbhs+KQESdHy09sIDDypekJu50B/IxFWn2jNmAW0p5tPv4hS0uTgiPOr2n5p9TWDBBG1IyJdkkY59qPuOGLS1xCn8hudPpisTqZDxPf8yYycCfG6bdvUIr7Fy7kazmnve8Exeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9JkVqePk0p4SMlF6/nB9oQrcWzdjkLxl0KHSQkSf5k=;
 b=agQhG8joT1lwtINPYCIBTMyfmeV09GF8gdFGNjmOsz7mYJGI2AWQe5N9bk8NStG6+0jy7PIUCxDRfIC35scWo555f44dfG1KfOKj0b1xfG0x16etHFHGcctk262Aysp7qCRvhilrZG1ef3KRRVoxWLZAICAKxbMkvdOTRGKMr+/eVTliDmhYZxpNLWzHvzPeKjh3f+qPLDJyPw5UXeOsI8MnQ0vbbCV0zQ0N5F0NyNuEoHFTBEKT/4nBJEbVSidYmS22AD5LZo3Gntu64UhJxDXGYeEgUKKn6gvZIqqRYLYGNjjoKFG0wdMyIESoIIX5QM3wyxicFhXb2E2GSCAj0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB5734.namprd12.prod.outlook.com (2603:10b6:510:1e1::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.14; Sat, 24 Jan 2026 23:18:42 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 23:18:42 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-riscv@lists.infradead.org
Subject: [PATCH v1 5/5] gpu: nova-core: use checked arithmetic in RISC-V
 firmware parsing
Date: Sat, 24 Jan 2026 18:18:30 -0500
Message-Id: <20260124231830.3088323-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260124231830.3088323-1-joelagnelf@nvidia.com>
References: <20260124231830.3088323-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:208:32f::22) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: ce35bc7f-4f0f-4ab0-bbaa-08de5b9eea24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DrSyecaD33SQ2moPS/QpV4aGFY5Slm+B7q+4h8OiI+t+O2ila/S2a7JIJ1y+?=
 =?us-ascii?Q?yoOSrjrwedilxE15B17cmvIlm6CFd6zYxHsxBL7lxis925BfqvMG5SPbvxMT?=
 =?us-ascii?Q?9/0YUOW+4wEm1oYPs6cF85mebJS5znMiujR6LRd0HDkjjkIcSdMCbIeDmrrg?=
 =?us-ascii?Q?s7WsQkWSSShV1/fD4ORQG0Jg9ONRiXdxdLRIY9hMFD37a27sNMts1t6rRPfE?=
 =?us-ascii?Q?YeOzaARhZDfWBDMGhn82vehhnhxrNhQIbpnEsQU3zlKYmHKVt6/+W90lL2q2?=
 =?us-ascii?Q?drccv6/ukYTC9Q604Tc3VrDWJ7SlMeyQdrY+v0/xSnlxkHzf8alGVlgZH4+E?=
 =?us-ascii?Q?5rqbi/NYCuWZmjcI15AEAE6uc76aD4gtpCounZ+nGbrA9s0sFdxbWpB7czbZ?=
 =?us-ascii?Q?jQAOLWJeWeJJDEKKoYs5cEJ8YB7DrWQ1yn6pYeRVIHFh1VRkTKYYy7oBq22h?=
 =?us-ascii?Q?Wx4WIJTwv7y5DT0TXjnD3AFFJ6xp3K2TF1qGh3GUbqyNBTZI4thpJTcN6ax7?=
 =?us-ascii?Q?NA7ePPXnmjVrqG5IrGwxcycaXmFSCn+JVd3iTAVP8bVWAZsmaRzlT2exUdXP?=
 =?us-ascii?Q?z2Kd7M4xE4e1fTZghDUZGxDiZs4m+3X/DM9BtW9V1fwTilETXTb+jRICOwZC?=
 =?us-ascii?Q?+wlYWhB744J0/Ntc2Ego7U17iEfeNZzKzRdWs5zoqa3uAS7YlHYNdQ6DzQXm?=
 =?us-ascii?Q?XCFK4NF5JvOPgVtdd4ioOn0zG6mSY5kXdXQmALvuMhiNjBaGlmBUc+eOdv9Z?=
 =?us-ascii?Q?Hw5Cyja2QVCHvaK5RrKzQZEdZK7I6I8m9vQcxWsbRo8pyOulaIoyZkkqy8cL?=
 =?us-ascii?Q?3nx9eA63V1BtUonxfvFvyt28fbn6xSHxirMBK8MtDF2HQYMjdUQ7pXplPjU3?=
 =?us-ascii?Q?FsiL0hu8QWks3fi1dgHTlWmXvq/FageV0MxZpVTdNFXcDICDSCZVSq+Pe3VW?=
 =?us-ascii?Q?wN1BGXDtW3lkufcjb0N5UBislWh8MMfc6n7yfdH/ba6+B6HIvL4MdWXbjwAg?=
 =?us-ascii?Q?f+p8xh2EoJ4wIIq4u4/276FsFBVZg/XbWqN0OmVzr0iY5JHycFNQWbRRPteO?=
 =?us-ascii?Q?7o6PVzJuntm5he6W0s1gZtHPt9rkWvQGQUvX8rehm4k/6Gt7SdZ2pROFqQCU?=
 =?us-ascii?Q?9K2k65cacsvrdqXu6ld5Uvnm1L/nGG1pWLpOVLJkOKxk9jajk+GQql3EUw1l?=
 =?us-ascii?Q?XAH73fcQn65kb6QXaYTowQd7dWvB46gagt2w4ybGdbeZa2EYHtMnjmr0Fu/V?=
 =?us-ascii?Q?Zv9J00LzihLHDnA2ogh3K8iZDuHpAWuSz3Z4BbUmk+QQTwWszo59zbXjCA4x?=
 =?us-ascii?Q?152KT+LbABiNnZ4H4mNuVx0xdtO5w8f+VsYUSxNcoouLJDNc0SyoSSIiGSA7?=
 =?us-ascii?Q?AOQpn3t3AWsZJ1TQSrBARNgeisQSDgGheJwxYn4Kz+rwXa29H5a52ZeB7GH0?=
 =?us-ascii?Q?uj+UaWl9UAAtxrgEj4gsu/7YBgB3JNvwnZaHM8dgMZsfDfsnklZj8A9QqzJM?=
 =?us-ascii?Q?xfiTwXY3GOILbYnYlVcwIevqGa42fXrYOaMPwA2/11oyGpSCvvgPZ68sCn1S?=
 =?us-ascii?Q?ywLUiBnXT8mqq8F08aMjNFj82sHoUzh06vDYuzR7mZrYeJ3miPlfbOWr3Nlf?=
 =?us-ascii?Q?Ew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5wgIXmpeBWZCxR7x5vPqMlXiWKOI30qEvGPkKWLPRwuRMKV3JEQfPJ2L1PEQ?=
 =?us-ascii?Q?ilz7O8RI1bSw/CQUJL2VgA2KbYoS7wVRS3aqNX13riulvt9ztsoVnKraalmS?=
 =?us-ascii?Q?bDrHNab0DlXUYGobTOkaBzKCDNOg5wuob7ELoNHH7hnYL9eMBibpl0HOt4G/?=
 =?us-ascii?Q?GvzNka4HbiNDC/JPb2sBKVsu7QigGL5lZio3pGieVbBXkeHFsQAoC0dEgp9t?=
 =?us-ascii?Q?v71nB5supLe5IGOe59lwZ5mSTAW5/Y3/2FX8UrTKqCPmdWJXCE0H1goFfKKU?=
 =?us-ascii?Q?SPZce6fhPK8obJhduu5ZKzlSPobVMI/+7jHPmKO9IIpzu5PLJkXoUQhwGX+z?=
 =?us-ascii?Q?ibeweZzA0/uM0mawm+mAFsRYSuSyrTXAXINSwUsarQHOvEJN/yIry0lN4fMS?=
 =?us-ascii?Q?/oqeDt+seal/llux2PCDuPxRLevgVNHBR91T0/4N68+lm3xk/77hcHSyOwtx?=
 =?us-ascii?Q?PC7yn8ZmAIDyDM4Lvp983L5PFBnj/TVdsSfG5wA2lYiWZ38KhzmGPmBcqJUm?=
 =?us-ascii?Q?AHDdFBOM88mySv3oNzoT/B0kksYhwX0AOHM/rJvv+prixNzMYATiI7/PlaUu?=
 =?us-ascii?Q?vTdIFAxZEK61AqC+gfK7eeClcUuqT82dKZNyh31+friVAfFIuEQ6iDwIsPFY?=
 =?us-ascii?Q?OH7Et3etRh6XnNXEpnDoTQHHPjhYvZWO+eVA2T3WscSz1xFYEfb2xdkOG1I5?=
 =?us-ascii?Q?kFzdqJGi55x7U65O5TL3sOmLii7dX4jSCzGivvzz+GT+ApbnA3DVfJ/J/ssT?=
 =?us-ascii?Q?99qjWvhOwE3jo3LkmKD6SpKEnjytJ/rzOHMsMJeed9u4SFjslGcFMqfxcDQA?=
 =?us-ascii?Q?FJz0rWMXq/JYBVvYOzqKsqHJTEOPZSMC8liZPS5XN4kq18t09yAbPTiXdYlV?=
 =?us-ascii?Q?fdBBnp2EXko27YZAYaVA2hkgsnxsbn7wu6/uxo9sa37STDj8m8X6BpJ0QDxz?=
 =?us-ascii?Q?HIdIxLKLiNawT0e5rHLOBl//qA+i9rWAXHw5V431aAmNJu2eaIHT97WdGqB5?=
 =?us-ascii?Q?ThS9QZrlfLkBmjGxv3xondX2qs0qCjicdubi5pjXFJpx7eemlJkoHro+LExW?=
 =?us-ascii?Q?bE+AWrgq4KKWqhTkh51Iwory/6X2DxTuiHAYuSvjCuCFnZEKJgTSZ2YIAaJ5?=
 =?us-ascii?Q?s340GMNc6PsIvMNEjE0RV0BmO/0vvjYW8NzyLjiEpHBhI5EPsr1RVCfCG95p?=
 =?us-ascii?Q?KEqA6fQEVXDRzRudkGx5kX5ev8LlNOiiAuyvmNt7ZolMLYUf2VDjwEB6+mNQ?=
 =?us-ascii?Q?Jd8R3KSvNJE119gjWY/3hOmtAfoi9EnBPdamVG/HIgee1TixQrPduasij/Oy?=
 =?us-ascii?Q?ELlA0zorZ1CCuCGkepvMjfJlCwxlAnjg/jTCWQPwp6m6LPbGSrHFwzWvS89M?=
 =?us-ascii?Q?8sDkxuZmVneRkZxXeY+2OvXLdlzjFDwtfLi6IQlSAJtd7J0LWs5zwE4i9A0w?=
 =?us-ascii?Q?+XS9QlxFp5z8/LGDB/hh6EChHkMVQwbyUsym9cqxC389DvRfOftQa1FRuiX+?=
 =?us-ascii?Q?6pXCtZFVUtU1VXbgF0nz4/IeC1HeA02/lvkfFojcs4wjy1VQ9d1sg/Nh6HF+?=
 =?us-ascii?Q?BXlIxAMkVifnKRnYBiAfKpky04csCNajywOLuqTL3Jw9/NYB7j6MssA3QpgM?=
 =?us-ascii?Q?1PxdYHHrWvKvR6/gtO0L2JNVko1Bttvm81xx582FIjSRj8iioOsyfBHg/hIv?=
 =?us-ascii?Q?86sQkdoBl+5uW7l0JDfBIdkGOorvjj028Ms/8UOKGT6YBIK+TwDaaK1Lxh0v?=
 =?us-ascii?Q?U2CRqNPUDg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce35bc7f-4f0f-4ab0-bbaa-08de5b9eea24
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 23:18:42.5291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12/9MptU47jvOaTFPUrSBrENRmO5dq/ufYvmcs8I01ok5SbKriQdwqjmQ1yI5pmNHFu5VlkkXzESvJA7ok3FYA==
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
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch,dabbelt.com,eecs.berkeley.edu,ghiti.fr];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,google.com,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 49ECB7F383
X-Rspamd-Action: no action

Use checked_add() when computing offsets from firmware-provided values
in the RISC-V firmware parsing code. These values come from the BinHdr
structure parsed from the firmware file header.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware/riscv.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 28dfef63657a..97030bdd9991 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -47,10 +47,11 @@ impl RmRiscvUCodeDesc {
     /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
     fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
         let offset = usize::from_safe_cast(bin_fw.hdr.header_offset);
+        let end = offset.checked_add(size_of::<Self>()).ok_or(EINVAL)?;
 
         bin_fw
             .fw
-            .get(offset..offset + size_of::<Self>())
+            .get(offset..end)
             .and_then(Self::from_bytes_copy)
             .ok_or(EINVAL)
     }
@@ -80,8 +81,9 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, fw: &Firmware) -> Result<
         let ucode = {
             let start = usize::from_safe_cast(bin_fw.hdr.data_offset);
             let len = usize::from_safe_cast(bin_fw.hdr.data_size);
+            let end = start.checked_add(len).ok_or(EINVAL)?;
 
-            DmaObject::from_data(dev, fw.data().get(start..start + len).ok_or(EINVAL)?)?
+            DmaObject::from_data(dev, fw.data().get(start..end).ok_or(EINVAL)?)?
         };
 
         Ok(Self {
-- 
2.34.1

