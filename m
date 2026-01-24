Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M/MJ1NTdWnoDwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 00:18:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0299B7F336
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 00:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8792B10E144;
	Sat, 24 Jan 2026 23:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oGoljl/x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010066.outbound.protection.outlook.com [52.101.56.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF9710E144;
 Sat, 24 Jan 2026 23:18:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l82ZVZ/VI0kbu29TGg+8ZXOmWG4T54btv9HILVOjM0Mp5ILBU+zPuvKB1yHEKONrHx/6sLhnmPEGcD3WPLRstekoKjjfR2EMokPhpY6AIPpLfO3hPTzijdT+ThyRHKdd4pOuusvddIcWlm9x1aGFAiOGspwN+TOA/wN5aVs6bDbh06fv6PjsHqNFbP0WYeBTetXHqErSz7oHO60AmESsWl+8HnvV5qVjYM7HcHzoOsQ22HstszMfTZtwjY2biyx/lihLK55Ulg4U3VX24vx68oECqaXeIjTGEM9SMfspziMywvRhfCSX/8x6ICHKEbaAXs4q2C3ybdRzbnrCxe3hyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HT9+3BOcRv3841WFHXL7XPLgN9f8gFOTyvlscZsulX0=;
 b=FPhWIHQiOKbwjDm5GScWFOSb+6+HV/ZxIc3wkpjYXwPoLgLQX86ImbCQtwAdWF1b4iYlT7ZLSDWvCjHAQ4samQjc/u/YtttgGKTJIccgyxjIC+MKSeaSDgLZQrTmDzkWtK27Nl32uV5RLpcC95KQ9PVQoqZg/q+Ko1/73Fl2o9/bJq8dyop5j5vMDWOUovj5BBNtXxhVWIR26sTVY50++bOEX8Jyp/3QSM1BZc+dFExIzwnNEQ59hTBpoOlfGV5vNPidAllFGEffBoLDhzAJDKAbUZMOdKk9GWk4ai1IFU0ONVOLcrCYGPQFsA/Xv/ijXq+TkeLq7c0EAycqwWyxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HT9+3BOcRv3841WFHXL7XPLgN9f8gFOTyvlscZsulX0=;
 b=oGoljl/xRZcTMBRRgvW+hsGGjG7YVtOb8YZcH7phWxoMMYIB6fmPYVTS9w0ml0xwcwyqb2p4ExkCQPKKMb6WlnAe3xAAc1QJC7pmb+VFZVkA3X3fpMpuCAvqRxV9s57nOZ5VHNs9YmeMyo1DCEq7rdOpqibKB5Y4LkmmM8sksaI7ih6AQmfKIdj4UVnzQqPPr8JiJ1uXZIvrYtH629sMc1/codvmuzN5V1ui2csONMlvH2+l7fsMnzy0QqONb2XJiVpHLxvL70vO1+MfcWRxf7LS4I2kr7fAsGLilcDGcattNXAVEY5zgqvpQ+CYDfuheEhbhbxDd3er2mvoYVdy2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB5734.namprd12.prod.outlook.com (2603:10b6:510:1e1::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.14; Sat, 24 Jan 2026 23:18:34 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 23:18:34 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/5] gpu: nova-core: use checked arithmetic for firmware
 parsing robustness
Date: Sat, 24 Jan 2026 18:18:25 -0500
Message-Id: <20260124231830.3088323-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0026.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::36) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: ad90cb78-dc30-41ca-111c-08de5b9ee501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5HIKmSgbbg4tQilPQAz3zDScawyUoBMY1osPkJ6OX+fCcZBFZDpg7NMQ3SH8?=
 =?us-ascii?Q?plASj1z8QUovhdKuMMOkpkUUoQPI4iSD26YrhLCfzcawqUjj6MhV9W6SREuE?=
 =?us-ascii?Q?6EsLu76S1PAx2aVQqh/d2AslBlMCczWlk2ndphixu6amdHzvw2KpKa+FdQ8I?=
 =?us-ascii?Q?AhCccH10Kb7pUlZ5D9Xlp2zD7wCFpwzzZ/DFv0DtGiiISTqGo9haYUUUWe1Z?=
 =?us-ascii?Q?uhGyTEpjy1js1hCmeWv2HeEMvKB3Y0BZTBSBjWczw0i996bm0ii5IJUchT73?=
 =?us-ascii?Q?2IMCP9C46MTI0U8cxrPUl90QdhnfkuQ83zTAH83Cr1nU8datxslA3rsxkjrg?=
 =?us-ascii?Q?UjQZxvm9ocw8Bd71bhifKq2XDIwE++1jTGM3W8OQA61pwIl8/UNK7C+Nmaqp?=
 =?us-ascii?Q?Bt0p6GMZJHudBHx7n6YsfoFXatD9V/yO4SYMANF14KBoK9uDxDycYCm3D5D/?=
 =?us-ascii?Q?gfWcDRMBiructdvkFsuGa80M5Cyu3mTXOS664TeacDvJda9gUC5QcNkB5qYa?=
 =?us-ascii?Q?BfeTXVAjEuX0BKhTypT+LxAq5lFWGn3U1B8ZUlM4w//r3Il2vtMsVpO6sszi?=
 =?us-ascii?Q?Rgr3nzJUtHGDgqadSlLhDtz0Nzw1Z39/brp+XwK+gGJNhGTn9ZIER/xW6f5m?=
 =?us-ascii?Q?3R6wZ4suXKOREwTQDI4brsNeSpJgYcYk1JcEU3V7CAG8Dhy2UD+vBjdwhvdw?=
 =?us-ascii?Q?6Tp16IIUJW66JpYSMPFo7utaMSVYap9pbUbEf6uAL/FnuOKVUPvFNb+Lzj9E?=
 =?us-ascii?Q?kKq7FHV9hu7boOqQ9tHfkJn0SzLSbjX/Bj/U+FTAmaAgWNhUfYd6EJrRFIYL?=
 =?us-ascii?Q?lvc6KtxyYHAYedGtzFFUITfINzW9H1A68Qlj8QrRJZYNXRGAz2eSaGaHN31n?=
 =?us-ascii?Q?lzKYz9Ke/tHtNnQBYCXXi2ITse3uatBxL8UDeAn2TzLmEDUnqyYKjvAOVFIq?=
 =?us-ascii?Q?mWvB7x9T4p6N6qDgxnQwYuz8AwNdhbPu3EiB7TaKzrCbuUA4p8e59YRi/EXL?=
 =?us-ascii?Q?8PgToWFIQnzE2SLs90CZbo6W8BKSJ5CmOTimTzAIwRRzIySpSVxegrFpVMXs?=
 =?us-ascii?Q?6Hn/uENqxnSfNyPLdH4KbeqzygyBP5CEIOLrEbosM8jcVJje15qQq0QOO7Xx?=
 =?us-ascii?Q?vcePdOIh29PAgGFP0tKXing1dmpDaj32EldgM5LnNyxsSRubWQV4JRzHCpHs?=
 =?us-ascii?Q?rly62g4p9GPaUG/68l4N5omJFT9btePvNzCHhPFSLnV3PYvPs8xYBckF9Tkg?=
 =?us-ascii?Q?whhIgRX2EHMW+NAvwHio65KybOKZI5L+PifyTrRo/ZaI2pIK90TNtWYiKyga?=
 =?us-ascii?Q?rPVOfOau61Tm6XFHO28vrJPr4QEuco+lw50foT/mKi+XX6FIHGpYurceqvdP?=
 =?us-ascii?Q?JN05vTVKfoqmHG1BAVvDddK4pulwoMTkPZBDr7fC4vDbTMABPOlZ8wzt00Vo?=
 =?us-ascii?Q?QK/EwOGCJJlPh76fEgFM3t83PDrVtppmh3a4BAjWDYAJCbTusZbcATDXf0BK?=
 =?us-ascii?Q?aaVWZx/rN+MzwFpCbOCsxFjsSx59m1o21vBU8ThOL3GLhgljU2tjWpPuDxQD?=
 =?us-ascii?Q?S7gPtcLEwahAgs0h5sU+ypvwwiZBeKgBLW8fekFp+CdFtp+u0kQl9Sm8wo9b?=
 =?us-ascii?Q?QQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PFM33cGFoVpKXgMAACSYm9cnT7bxStm55zt10/Odt+k1oQKVyjeDWJHoaHmT?=
 =?us-ascii?Q?lldj0xTQoq7Vjo4dNJmoZe57byA+ESPLUUp5g7io1vs+XljhiQ8yyiPMlON3?=
 =?us-ascii?Q?ZPX7a5wto65NxPIMauyPNiEXvvDL73AdpnHs7ZiiLPVU6jYuOiO/WCCj1nBf?=
 =?us-ascii?Q?8sAOLPoL75WtxslE4NPi6+ehNNFA+ElES9qmsjagQlIIAKaqH6uHwHfQSaOP?=
 =?us-ascii?Q?9Qu4Z386hCNqw9MbP58bHnmS9hOYWETfjJfXoaoWkn2nenodsAd1bKxO5E0b?=
 =?us-ascii?Q?ou4AEDq+yAQre67UkSoSjt2NjOIfwTe6xYCAEzLXi9XqTayvW+d67kAcba6B?=
 =?us-ascii?Q?BEbZbf/78jQBB7OnX7A4Y7NYEb6Uj6vOIrNcmwkah5cH61dSUwIpvCIqZrF6?=
 =?us-ascii?Q?jfSLPMOTecGXtjPD2PCmXocnqD3zvzeiILdKGD9pjdxv+0mzJjRUoR01mo7Q?=
 =?us-ascii?Q?z7fkAUBEm9/LzLxu9Nbx/TR2GEH6JXUfcUY/NUc9Nz8hKorppeI8HG9Wy2hA?=
 =?us-ascii?Q?0D3XlRWV/sUmYR4TxXxkhCcIWQ2MrTx4ONDL7IM1maYoYy7O2FghyUK4coNx?=
 =?us-ascii?Q?JBR7AikXRAUUUcXE77ime6irOcEZeQJpyxGlFlDdOFNPQUjT1d8M24doKl/I?=
 =?us-ascii?Q?hXKBFBeOJfOD1ZJ2yUEiHwKWfQFzBRF7sZ1Gue29RhsXbCFSzL9KBiXq8At2?=
 =?us-ascii?Q?whF0PkD5bTBY1tXJfDGWUKPIQV+U3UqE4avDsMzQZHVACy2WvxEzvL0HVJ+s?=
 =?us-ascii?Q?/+NDDK2EbJnWY9EP6OGM71OzIITQwbRK4jfTHpSjnsc4rFs49w0YCBsVXUIf?=
 =?us-ascii?Q?mLUgt35Ouk8OF+JayypB8/v3A9Wt8MRxxZIs7a6cq+d8NW2GrU9O+q3gHDIq?=
 =?us-ascii?Q?Pcdug3YqYRgG8XgCvgEjX0k1r4TBcAKzFPzV55/y5dZMDAZG2CvyqRsp36KY?=
 =?us-ascii?Q?FcuqmXhJBTCobKaE1KJMi1tPxXcyD8OKvmjsPiH783q4eUCPMZJrhGj99qOY?=
 =?us-ascii?Q?wOsj84G33na4qH5JNMFRGP/FTuBLpZu6RWlzL72ycaBFJBIr6X1dgQy7yiI8?=
 =?us-ascii?Q?YpEPFFBho0+8ALvmHl4k+qiGylg7IhBNpezDRrY90k4FFUylciKUxuMShdUo?=
 =?us-ascii?Q?OAAhSh1sh9r7vcJQU3nlJF7g4WapMlsj8iAK66JVCTl69+nLNE9YF8HRp8zO?=
 =?us-ascii?Q?Nt7l0ZA9ABIuUhmp5P3GL3m065HWytbHwoKG53/PFu9YNeiIfhSoBtRcx59K?=
 =?us-ascii?Q?Bp4/wn2eltUdiUSHexSiuFCAF2Mr/Vmc4Q86KdeAfgnM3HSudSXocbgI+13N?=
 =?us-ascii?Q?YEL51b1594VIKPuKB5dmKuBVpxKL/1ylUIcrwi9Qm7+/25ch5lkQR4/J/euR?=
 =?us-ascii?Q?6v5mdVxRRiJGFYY1eAiK7Cwfxh9kEE4h0b2871T05ugvAcPx1HzKAjh5TW1B?=
 =?us-ascii?Q?IKw2kK3eCevC7bwiYHhxdXI1mcPE1az4r7/ZKTxwF0ssFrB8le6pJ2E8PIgd?=
 =?us-ascii?Q?I4kk7xJaTB2Z1GLhZyMoEHv58zrW8wubLf7xxZpXjRaL9ZvX4weRHYLra5+X?=
 =?us-ascii?Q?EavR8O5UNjM1Z6+cNKR2NWpmFEel1FUf93hIpZX1GRFTY8+iBfod/k8mpuEG?=
 =?us-ascii?Q?olrMfmcnji3UlB54B/KPws/oGPOd71OUDNZ5HRHsIDRNWY71qj/UXp4Hf+45?=
 =?us-ascii?Q?/Vj8UqqIkqvvVP9hiUprSF7dAC052WqAd+zIEGgIAqRiNX7Pqc5X8ZBJQc2v?=
 =?us-ascii?Q?xa8irUS5vg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad90cb78-dc30-41ca-111c-08de5b9ee501
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 23:18:33.9525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Peukkan/01yCjvcyujFgqA4vCFTxRyCUFDUMK6L/smHJTa5nEmcqT5a7s6TpQVTLDXcoEO9e0RgZw9KyxqVpEg==
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
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,ffwll.ch,google.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0299B7F336
X-Rspamd-Action: no action

This series adds checked arithmetic throughout nova-core's firmware parsing
code to guard rust code against integer overflow from corrupt firmware.

Without checked arithmetic, firmware could cause integer overflow when
computing offsets. The danger is not just wrapping to a huge value (which may
fail validation in other paths), but potentially wrapping to a small plausible
offset that accesses entirely wrong data, causing silent corruption or security
issues.

The series converts all firmware offset calculations to use checked arithmetic.
This has been rebased on drm-rust-next. I would like to consider merging for
the upcoming merge window to avoid future conflicts. Tested probing with GPU
name printed in dmesg on my GA102 (Ampere).

The git tree with all patches can be found at:
git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: nova-checked-arith-v1-20260124)

Joel Fernandes (5):
  gpu: nova-core: use checked arithmetic in FWSEC firmware parsing
  gpu: nova-core: use checked arithmetic in Booter signature parsing
  gpu: nova-core: use checked arithmetic in frombytes_at helper
  gpu: nova-core: use checked arithmetic in BinFirmware::data
  gpu: nova-core: use checked arithmetic in RISC-V firmware parsing

 drivers/gpu/nova-core/firmware.rs        |  3 +-
 drivers/gpu/nova-core/firmware/booter.rs | 22 ++++++---
 drivers/gpu/nova-core/firmware/fwsec.rs  | 60 ++++++++++++++----------
 drivers/gpu/nova-core/firmware/riscv.rs  |  6 ++-
 4 files changed, 57 insertions(+), 34 deletions(-)


base-commit: 58d26d42818c0f8c9b334cc7cf318b43046e675f
-- 
2.34.1

