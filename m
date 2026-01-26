Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPBUNTrNd2mxlQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:23:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1678D02B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79EF10E487;
	Mon, 26 Jan 2026 20:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ont6mIPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012035.outbound.protection.outlook.com [52.101.43.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEE810E497;
 Mon, 26 Jan 2026 20:23:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVjgWB9u7tpob0YquNgNV5q60SoMSQRHRqX8GY6DvsYWOhnxO1FEQKZWFaoSpnvNSpQRxBF9BxhKNy9/Ivt+t3sdxhoPNSQrpuOzArFy9/br9Uk/nEO2RAu2HqMfq8XAiAIhxft/5f1MkoCJqsz8jQL+RhJ+Ti9wWv3q/u71Xx5UukOAzdnBowdJmJvwGz+QBOF3UFz6iK6bH3dN7tTcAtug0V3xFDgMcdZRPIRWyvMkfNAxkr09pQp7XIU3dWGkjJcv007CUKdDDH5ggMxs/JU6o8KZItPX/L9rfwEEt4TytCFOoKzUlKwdJeNRu88rDOZa9vecy9BDZT0geZh6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNv0Onnck5c0tq+xq3hg2s+92j4SJEOni/Mx6b12OW4=;
 b=LX74GruD7OFu1BgeeZa3IHOKym10CADIqat+NMRxAalsLtwbdcPZX0Ky7LRRx9Ccc5oMFk/P80hY/FuucFOlB+ob2kTAaMu7UpNGi0NpNUEkruPJX+ieLAamUiuAh9+OHvy+bw5J2TlJIDIgPPu2576AZILwFXo7ILroCecXg5MsOOmDAtfflp6uQjkHwvi0lCnHGIFsTWsoSkstLJGEtGjnQjuR6GckMoNDkxnFqkOobEZ2bYaTC+i3Et57b0I5jyag3JAZSqjlSZYJrKv8epi0SwXPX+VKsKaDeghUM5YoHAcjF08lfv22RMeqX9ogh0N+9dxRYv6EaEq1u7Eb1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNv0Onnck5c0tq+xq3hg2s+92j4SJEOni/Mx6b12OW4=;
 b=ont6mIPeU8crpQka1RndtOobxFhNMCZxXX6JMFmEjOPEMfaFStEQCRA5nu7kcwSTGPOZU6ZXuhCTouRppvWkW2Pvmt9Rq8Yfba2cNg/JhXElhnkNm/nmhI+4E//kumuJIyObD2R5Cpp1QgSXFCBPMKA17sQ4QwFOn+aVZBaykAiFdCrkElulbVmYPzyjYzeNUxjbmoWrhPfZoK0mdTqrIxGmPxxJ6swnD2dasWcCfJ8Myy9nWKOx7yy0yj10Y5iJO3ExTv6/g+7v1BEXRnQTRsoGC/hp4JmL5RSXpdYkv1q6ETiZdWeqqzrj4ZM/PyqjFc4rPmj8cEkBR76wR0P/BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 LV5PR12MB9827.namprd12.prod.outlook.com (2603:10b6:408:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 20:23:13 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 20:23:13 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Dirk Behme <dirk.behme@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v2 2/5] gpu: nova-core: use checked arithmetic in Booter
 signature parsing
Date: Mon, 26 Jan 2026 15:23:02 -0500
Message-Id: <20260126202305.2526618-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126202305.2526618-1-joelagnelf@nvidia.com>
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:208:23a::18) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|LV5PR12MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a28dcb-4ccc-4f9c-5e33-08de5d18baf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zF3MDgXFqxCytvmZBM7b9lQ6qBhqoFF9JrumDIejK1bMnMCHG61ueLiI9iEJ?=
 =?us-ascii?Q?SDXQSfKRdC2tVFvRUsMWLNWEtnm0US7w9asfcol/VO9Zmy5hEWhmDTIex9Qc?=
 =?us-ascii?Q?w34iAsiDBQ/iACHgUnPLvG3X4IGn8zPFv826S20azEaPjHaUObg/BJZtyjcN?=
 =?us-ascii?Q?7Qw7+e9pWQX697hRWS2JANRWLfnngh1P3MQfMGNQWkmZF+P7e84ItjxqJiNP?=
 =?us-ascii?Q?IV8io8RWVCGPsNh/K+JlvD4OxuaZaDj0aVFPHweuTPtPVLqASUtKD6ZLrHag?=
 =?us-ascii?Q?4U9nXQcAA4voeIvlQpnzAUTjw0iyCVw52clu7Qh4KAhcpWbW2oqIUNeLzbxx?=
 =?us-ascii?Q?G2a4I9b4j0Xyah/k1FsPsmEpZJtP66hoE/eyIqDKg3cxACZ+WG8MO1tcIHD5?=
 =?us-ascii?Q?HPOoHBMooTVjggn8N5F6Rt7fEWj+qLmLfNlPXRS7MF88pwx6Fjh9qpXzpNHG?=
 =?us-ascii?Q?9s7kfO1T/2HxIm9ymmzBFlQsZSIHZlxDeDGF9ERyjpT7HthA7fvPNLHSOqAY?=
 =?us-ascii?Q?FdyLVJ5qL3MV6NZAa5twUntGOBoacBYcmyZ5fGjhG/SSLF9/1R2iph4X7SWB?=
 =?us-ascii?Q?xpMdKA7XVswoI2tUqwEQ1zOKZqmzWgrok0M+2DUzCxtSlFCp7zjlMYX829xZ?=
 =?us-ascii?Q?c5UeyKT4C59Qxshossc+tRTsqyYSblUaZJjD+2KIXBkYfLzEQfWpLMKbPHK6?=
 =?us-ascii?Q?FIgvhCPWmwAHLH878zLzImK4ly9pwYxtOKP9qAASYfY97evOLCuZVCwo+SwC?=
 =?us-ascii?Q?zbQlvtFgWj38dIa32YEfqev6l3PmgZla2DBNy+kLMRmWiVdcIUFVrOZ+PlWK?=
 =?us-ascii?Q?/HRnIu6tqkj3BbN1iCUY1p7BVPDlE7/UjA7gUSONkKhStkiLGesmwtj1KjJ3?=
 =?us-ascii?Q?h3c78UlIm+TVDwq8VHGkqLV7vFfZRNZElQbegV7jm4uumec5jUTxtbbzVmJD?=
 =?us-ascii?Q?u1djsj+eM+ThIDqxx4Oj6/6bQEgDGMtrLpAWNTnViIb055hlFSXdtGucFYJ9?=
 =?us-ascii?Q?QJ/eE5DlNiMSUyigT4ak6R3UZvI+dc11W2zwQTaqRQm7RXNFWnBiBBQW/lKp?=
 =?us-ascii?Q?/QKknxJwsijsPfiOYC0Jks6xrdnVCK9YSaqE30imoruVRYQrb0Jjh7/yjMaW?=
 =?us-ascii?Q?BwRP1tjqcczZDo8ZZVT6tpF0uwWRY320P161fZEGdWazCYh4p/FuARTs2Llc?=
 =?us-ascii?Q?LUNLDlLPcAJL+EH6boLdy3y1qbynj78WS0pLlZAMOkTy9xGk5oQY06Db1qMy?=
 =?us-ascii?Q?bfwx24MzpZluG6jvK/a+M4mB1DZ2b+Sw4MmnCkDAqsMzvk3Yz/7LfCKIvdi+?=
 =?us-ascii?Q?Mf2RhR+fa++uKg9Y/GFN/1DwGPHnhPuMgfDRUSxrOZHkcUAMwoF0PlOn9iwg?=
 =?us-ascii?Q?jClb5dIuk2cws9yFNcLUaT8gdzIXMYwbRrmB+ZGWNkrGsGGo36Kd3YrFiHJV?=
 =?us-ascii?Q?Xi7b9ST7Pbl2vle+s8nP60bwZDNTENQylECTIqcBKaIr3dTavSpZ2n3aERcV?=
 =?us-ascii?Q?+n0Q1sjCrk1kMDR2zylnjE0en7yjiCZSd7Av2RJ0h8kQvcdDkftttM3UCgbF?=
 =?us-ascii?Q?wiLtIozfOLVdOXarmPc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P728xREyq6hP3VDVacb2SCOKV0nnfeWis4HVuOIjRbWJ14qI2KVCtBDXuAp2?=
 =?us-ascii?Q?e0QdRtCoFa5tOJzS0O9iTlHZy3suVll3vojsrLzoYmVSHdpL3NvtDlVBREPq?=
 =?us-ascii?Q?6rl9w6QJipkOK6bsOpCo5qgTaWHShNLiu23xByV7g0/tAtZftLbqNn/HiArJ?=
 =?us-ascii?Q?0ke/7ClIpSE2zVFoCHSM80jE615s4H2/tYOBEhPYifhMabS8xRnhAba++kwI?=
 =?us-ascii?Q?cmbVd6L4MuCVuDCa3v74zIKuNivihiDqRVpQENSIRPpz+EkrwBJfIr3E4Sw+?=
 =?us-ascii?Q?Y//hCOvJeZAieMaUuaJq61pBYkN8vmUkiDlXoxzcdNha9mVMn2t0TSW2BQb+?=
 =?us-ascii?Q?6OEXfpSc24LnUSk/M6ti6296pY/FGC/++rdqNRfCYLNC7aoryEXesswqF9iK?=
 =?us-ascii?Q?ZAlm37hSn7Lq0G6rSNbvkExuw9aleoXzoMLtKUkqw+WgYCAMG6xqpNYz1k94?=
 =?us-ascii?Q?aMR7XhSBwZM+SX+s7oGU8+gY3c8DRRLiZ9CmDN+R0pnMis8aUUksJu34fb9k?=
 =?us-ascii?Q?Cv9ToOQI3z3iEVwZ8q5rtG3GpCjL3wfTfJFceIRyOuCTxYDTe1qMkMk2eXbz?=
 =?us-ascii?Q?v9AIkjOFJhF+KV5MMRvPqUZOI/Vob0FRJz/oaAa14Rj9QryJkQbI1H8e/GiD?=
 =?us-ascii?Q?zBy/+HVmexVk7ry/xRIfKAyFzF6mxT0Xqyv3E2MVz3P7223BbiDTBbMxKQhA?=
 =?us-ascii?Q?BdrkeNgEAni6kLSe/pVU4Rr11FY8XKt8mHF8YbcFJ5nxo1r00JJMnf83wzV6?=
 =?us-ascii?Q?zZz5BH96VQcyqjQ/PnSX2MOd8TbFNX7Tq1WCVcj14Ajyh2qzosQd7ozGYQA6?=
 =?us-ascii?Q?fOjwRYKUbM7pn/kG+4gwgFHUgTj5MTpRblaRz6fZLipgv5Ipg0quf9kYIOWe?=
 =?us-ascii?Q?g0jk+CxqHBfOw27pUUFdqubskC3LGCEzhwbni6z68hYO1i3Za8LYIImJnxVQ?=
 =?us-ascii?Q?gtykq8AJUqgVsstn/Oh0cxXtdNvML6gVbTIyH/QIwXuaLQJ6T/RACr9CErgg?=
 =?us-ascii?Q?A6npXqi9JAxa+EcbP6Z6Dyl9G/qjzzFi815BE+O0j0P2AyRACKmrUKaSI1YW?=
 =?us-ascii?Q?+omvQGB66HfQiDCkXf2uA1JQDN3BmqNTJdAcIlTcrT1pI+1mALsbo1FUmoT2?=
 =?us-ascii?Q?hxrLViwY74lnT7VLQZ67QTiN75tbGBGIWSa17NXIIgmz8L+l+NyWE8bYyjR+?=
 =?us-ascii?Q?R4xo0J017C2doSw9RIMxAQTfM5T5avmN7akE9FpAR45UhP0wrs9qpImV2vh+?=
 =?us-ascii?Q?gZ5+yzBO83xjmMdo0TKbZe/M2/MhlgNktm9/2fFlxSgjDso0JGRm1LzFMB2h?=
 =?us-ascii?Q?2NuXUzPiKAROk3R1BWksse7uG87WxB8fnvNcfKbKmkyjf9qFkNkf42CFEthk?=
 =?us-ascii?Q?DfVrqyTlFBAXstSlxeHCbRXo4x0kva6x/uhf+GkLf530a7QQmSY8pBO9c3Ca?=
 =?us-ascii?Q?TLrXN2oaF3iT63qRVO3dqVZInExpL/j2VeKmrSSaFZeRLcrdjlno3qJYPScc?=
 =?us-ascii?Q?zQdcEWrgUoBDq7obciyxGZHAbDJvnuHmEpXtEW1zNMywFqoe9kpKp/DwkeWy?=
 =?us-ascii?Q?dYgu+LAtzbYFuLEZVUjYSYdM/BVL00xmG/dx2Bx4mrlg20hGpQoXxrKEL4C6?=
 =?us-ascii?Q?ZDJyGeJVd/k6qkCeahFeCSruSZdFggy3rbIYy9UIFzWv3uTg3yuNZBCn8ghv?=
 =?us-ascii?Q?LAD7kZcdsWmZy1kJfnFBuHzHczOrYPr0TNvDInh9K7hbwUTb/XZO37+lyvdj?=
 =?us-ascii?Q?vilxGGxh7w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a28dcb-4ccc-4f9c-5e33-08de5d18baf3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 20:23:13.1594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wqyUm1zsBu4DCCdLkNqX7dsgNG4uhpsI55PI5zsOOOo+JLatNTNeajPUVCAv9Col33xr1Diq1Uw4JU2Lc94bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9827
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.988];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8A1678D02B
X-Rspamd-Action: no action

Use checked_add() when computing signature offsets from firmware-
provided values in signatures_iter().

Without checked arithmetic, overflow could wrap to a small plausible
offset that points to entirely wrong data.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 86556cee8e67..40ac7e66d228 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -119,14 +119,23 @@ fn signatures_iter(&'a self) -> Result<impl Iterator<Item = BooterSignature<'a>>
             Some(sig_size) => {
                 let patch_sig =
                     frombytes_at::<u32>(self.fw, self.hdr.patch_sig_offset.into_safe_cast())?;
-                let signatures_start = usize::from_safe_cast(self.hdr.sig_prod_offset + patch_sig);
+
+                // Compute signatures_start = sig_prod_offset + patch_sig.
+                let signatures_start = self
+                    .hdr
+                    .sig_prod_offset
+                    .checked_add(patch_sig)
+                    .map(usize::from_safe_cast)
+                    .ok_or(EINVAL)?;
+
+                // Compute signatures_end = signatures_start + sig_prod_size.
+                let signatures_end = signatures_start
+                    .checked_add(usize::from_safe_cast(self.hdr.sig_prod_size))
+                    .ok_or(EINVAL)?;
 
                 self.fw
                     // Get signatures range.
-                    .get(
-                        signatures_start
-                            ..signatures_start + usize::from_safe_cast(self.hdr.sig_prod_size),
-                    )
+                    .get(signatures_start..signatures_end)
                     .ok_or(EINVAL)?
                     .chunks_exact(sig_size.into_safe_cast())
             }
-- 
2.34.1

