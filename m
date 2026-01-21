Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DoTLWlIcWn2fgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 22:43:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF5A5E31F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 22:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFF610E88B;
	Wed, 21 Jan 2026 21:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kZ6lzNII";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508A910E88C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 21:43:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7HT4GVqu7NSpO2JXW8/oJpQYZiwvBmKybrMsp8/7fm8RBDWB98HyjLFK6K4Ly8aJ2PJxxog2/zC8FRgBL9DpVsZq+r9wC54sqaFe2Cj2ft/ysVVmE02miBE8zKDJ2REo654RCo8Lfd5fodp/tVdZ1CPB6PU5h4UyOZLEaf3UzoZFuaJQyxHKPAuKvrSoATZ4l/Wf8zucwduK2zr7UcDf68FiV2PVZd276zISfwnCR9jXO016utrwbvkOshSkQRcRSfNIP9TrzuRIgMT9KZIU3E9E/McJrCg6lkl3HSn0Zc6cK7YIpzLMIFuQlGMtDc6SJSFrosFdAVt1kG28V3Qpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ai6RGSuoqbGWBzuRcL9yqZ2hfmG/K4I3X3Mgb04YXao=;
 b=zBHDdmzRX56QXO4IqvfTtGUUftf9fqldFr5jIwEn72jvBpqTigjQI7pzWJFOhPiUWktj2FjEbC2jwxImqmQMJ1krOwYkYYwXdTE+v32sos3IkBlaeBIozpajeizyQtCklBFcy0ZN/udwCm/GtL/Vlc0odBjYHy7iBtbkEhD8AAbKYlhXtojWc77HJOR4nSZn3IxSR8wEb5vhuF0J6sJog87sllIGokjNZVFLsxWHjpoiiq86MgkXxIh1yuZHF0aWdKw7Zz+34NgOQbymSNrVkizRHvIv3MzwQb8WqDBEOE2qxBuupFc9aj422qW8dchWyfMRECd+El7YL90+ElXQhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ai6RGSuoqbGWBzuRcL9yqZ2hfmG/K4I3X3Mgb04YXao=;
 b=kZ6lzNIIXGXK7WzdsxIUWJrEeF8l/F196JOovmnhzPMRKtdeHlJI8kHFt4iHaaR+RVEgvgzsHM7ux/FwBqOCpDHQTfuLb00J1/r2ejioi7pgrIbe+YDUQ8N99Yb91Fl43k/KESn9EbUVxakjnSHjtuAvieiWGwsY6qnXCqtikkZ7E/hHq+GY1ddggMa8iG37usRUaQRnTWfwMCq0Es5+aLj81eOezU7GvVl9+YZRy0xTqZHt/yIBl9xvgV1d4OZuBbg7sVv15LThNuOXX5+LdRYOI0FV58YPvg5Z4oXt76OhMMBLwddqeuumYHKxRsSzv9sBEZYg/zjjpftFj9IAag==
Received: from SA0PR11CA0002.namprd11.prod.outlook.com (2603:10b6:806:d3::7)
 by DM4PR12MB6495.namprd12.prod.outlook.com (2603:10b6:8:bc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 21:42:44 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:d3:cafe::6c) by SA0PR11CA0002.outlook.office365.com
 (2603:10b6:806:d3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 21:42:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 21:42:44 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 13:42:30 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 21 Jan 2026 13:42:29 -0800
Received: from c-237-150-60-063.mtl.labs.mlnx (10.127.8.10) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 21 Jan 2026 13:42:27 -0800
From: Edward Srouji <edwards@nvidia.com>
Date: Wed, 21 Jan 2026 23:42:12 +0200
Subject: [PATCH rdma-next v2 2/3] RDMA/uverbs: Add DMABUF object type and
 operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260121-dmabuf-export-v2-2-6381183bcc3d@nvidia.com>
References: <20260121-dmabuf-export-v2-0-6381183bcc3d@nvidia.com>
In-Reply-To: <20260121-dmabuf-export-v2-0-6381183bcc3d@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Yishai Hadas <yishaih@nvidia.com>, "Edward
 Srouji" <edwards@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769031741; l=17143;
 i=edwards@nvidia.com; s=20251029; h=from:subject:message-id;
 bh=dS4nMaILnRLf1h8NEebUOUUq8J2unIyvw/Nj1RlXfsA=;
 b=wA87+KIFmPcFOEFLcH22A2KXCd7zS4pNcDwRfvY91X+RzziJ1rLw6BaNPJd9zQ6AvpqWyBrtn
 rTQiEjVKxXpD+cJKT3WIKFYe/F56VpPqjNtoETFrZqiE+3TYGTyDtc0
X-Developer-Key: i=edwards@nvidia.com; a=ed25519;
 pk=VME+d2WbMZT5AY+AolKh2XIdrnXWUwwzz/XLQ3jXgDM=
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|DM4PR12MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b42ea05-4fe9-4b64-755d-08de593602e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUhORkE0NDU3NVZDN0ZPYlVWVC9wbHJtcnVIVFltbWt4TWlENkVtdDJjZE5C?=
 =?utf-8?B?T2djaXoyMTVtdWxCZkVqeEFQclNCL2tDaDdvQzdmN0dCMk4rT2k4b3AwNXBa?=
 =?utf-8?B?TzliZmFjWWNRK0tFYVBYeW5yLytXTHZKYkFGakhIK2J4TUpWN2dYS0pnNHN4?=
 =?utf-8?B?L0doZ09CZ0VsMTVhQ0NtT29RaXdsaC9qYzhwMVpSaGVkeEd1ZnJyQW45UWhO?=
 =?utf-8?B?UzNiV0l3RlZZL3VBR0xNOWxLejUvNUNkM3luWS9lTlc0V1pQVWNqK3hvTHFH?=
 =?utf-8?B?Y3NIaW96VTNPZ2pkT3lGRW1xVGZ2T25LcWd4K2xvTjBjNlhodGw0bnIraGNy?=
 =?utf-8?B?d2NIVkhYSVlLdnRUbHU1TU9udno2dnNtakVYVi93d2pKeVFlek5rTlFyWWRM?=
 =?utf-8?B?SkZoYjhDbk9jcWFTMGhPZkZHN0dkbjYxeVdKbVFhR2dVOFhhelUzcFZkTkR4?=
 =?utf-8?B?WnhLZXF2elM5dVlyczNJNVBNNS96MjRkUWxBSmtUeHJBdzVDczNnMmdVUDMv?=
 =?utf-8?B?Yk1zNnU2ODRrZnFUbUs4SlJjREY2aXhsTWgrTEpYSElhYkwwMXZRam1TQ1Nz?=
 =?utf-8?B?M1JYdWQrbXJ6SnpYZlJQQXhHLzQzaVZZdm9XOTZzNUVGbGl0blJSTW9TNW5E?=
 =?utf-8?B?bG5kMVJmdlMxdjhDUmJXcUI4ZzFyQjlvNWd2aGtSb0JENlAveGlVc3c4NkFB?=
 =?utf-8?B?eVFpSk8veDN3M0U2bHNyNlhqZEs2ZGtkQ3J3aDVtNjhjQmVmRThUYXNtVmZT?=
 =?utf-8?B?L3RRNjhhMTFJK3UzTHRtcnZORXcwSHJxbkVvWGpaVExESlZ4U3VrY3FtR1hw?=
 =?utf-8?B?Tkt4RFhOeGFsTWNSampNV3BiWisxMTRaRWdUakZEYWZLa2prb3dIOXpDS3N3?=
 =?utf-8?B?R2Y5QzFzZ2pYM2FqU3BJVDFnSWtIOGhqWnNKeWFZSno4UjBVWWxrNWxtamE0?=
 =?utf-8?B?UXl2SVM4dk14bXFxb1RYMmxxSHJxUlF5dWNZU1l2eEFkUmlyZXVxTXRvOXBE?=
 =?utf-8?B?OUhZVzBjM1p2SDFjbXZPR0pjTGtYamxmODlIV1lOd0ZmSGNGZ2l2SURuZHIr?=
 =?utf-8?B?dkZIKzNjN1Y4MGpSKzhvVnorc2V0WnlGMGtlQytxVEtCWVkwdStlYmFoQVlh?=
 =?utf-8?B?b3JWMmRtVDJrMk1tRFhtbER2NEFtakQ3TWJrUEFZMUxmdmI0K0FDbVBWU3hx?=
 =?utf-8?B?ZTJ3WDRpSFJ2RUV2MHZOV0xQRnMxNC9makJ3ZWxReHhIS3BpQUQ1dU9vM0RK?=
 =?utf-8?B?OUpvMnFyaklzVEd6OXhYWFIzdlJEN2JtSjJacDBMRTl4eEtGcm9xVktGWHF0?=
 =?utf-8?B?bVpCN09oaEpuSkdjR0FpQlNnQmYwUjZ6aWlXazZxRm1Rb2wwT2Q4TnFkdEgw?=
 =?utf-8?B?NG96SEsxdW9vczJtd3IrdWdVV2lueHM0S1BJbGV0bGlwczlEZlN3b1NQT2pl?=
 =?utf-8?B?SDlKMGZNNEVobEJJaUNBbXhvczFoenVMemJWdndhcHo5TlFmbXZpZ2RIbXdz?=
 =?utf-8?B?TDZmOHhYamE1NG54VklmR1drNWMwdDlLZjA3SnJGb3ozU3E5U3dVN1ZFY0Ro?=
 =?utf-8?B?M2plMDlJSzVSa1VrQ1RZUVpsYk00R0dTZE1qMGtOTnU1MUoxdzAwaDFPR0Jn?=
 =?utf-8?B?SGxvOVkzUGJpYk02L3JBZ3kzaGQzeHJuWTRUMkpWSExGVzRpSHVOQ05CV3c0?=
 =?utf-8?B?aktVRkZPMmhDSXNPMGN0R1AxOGdta0JwbG9rY0Rka3EzVXNVRm8wSXViM284?=
 =?utf-8?B?OXdzM1JUN29kY2VEQkJQMURaNzNMS1ExNE5FM0tDNDdUNVBMSWlra2F1dkhY?=
 =?utf-8?B?MUdja1p1b3ArSHliTlI1b3NrNFIvTVhMcVhnTzY0Uk5idEptZ1lQWW4rcjNu?=
 =?utf-8?B?Yk9adlZkeFZOeDJQZ0U3aUZXRjh5K2V5OUM1eHR2NGppcVlrcnJjYS9qNGM2?=
 =?utf-8?B?YnIrT2FHb0U3VTRBR21GMXUyS3NpOUd5ckdscFhKRjJTVnNKWFY3Q3RFWmJk?=
 =?utf-8?B?ZXZhWTh5c1hTakdMbUhVc3RxMk9qY2FEc3ovVklIUUdYVEJNOWZLWkwwOTho?=
 =?utf-8?B?RzltS2M4T05UTVlXdkhST0cwS05HYk13d0RGNkxnVmxROVFBQ2ZvZTkzK2Ja?=
 =?utf-8?B?U2JBM0xYeS9FeUU1KzB0Y0NSQ0pYaGZ0SUxtSEVWNGVTUFBGa2F3S3FOYzgy?=
 =?utf-8?B?YXBodWVXQ0pCMFFVbjNJbW4yb21MVVdFaGk4SnhEaVZtcXVPN1BLVGlaclBK?=
 =?utf-8?B?N1VYcXNDU1hRT29qRWZXVW5XelN3PT0=?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 21:42:44.3786 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b42ea05-4fe9-4b64-755d-08de593602e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6495
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[edwards@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:leon@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:yishaih@nvidia.com,m:edwards@nvidia.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:email,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwards@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4CF5A5E31F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yishai Hadas <yishaih@nvidia.com>

Expose DMABUF functionality to userspace through the uverbs interface,
enabling InfiniBand/RDMA devices to export PCI based memory regions
(e.g. device memory) as DMABUF file descriptors. This allows
zero-copy sharing of RDMA memory with other subsystems that support the
dma-buf framework.

A new UVERBS_OBJECT_DMABUF object type and allocation method were
introduced.

During allocation, uverbs invokes the driver to supply the
rdma_user_mmap_entry associated with the given page offset (pgoff).

Based on the returned rdma_user_mmap_entry, uverbs requests the driver
to provide the corresponding physical-memory details as well as the
driver’s PCI provider information.

Using this information, dma_buf_export() is called; if it succeeds,
uobj->object is set to the underlying file pointer returned by the
dma-buf framework.

The file descriptor number follows the standard uverbs allocation flow,
but the file pointer comes from the dma-buf subsystem, including its own
fops and private data.

When an mmap entry is removed, uverbs iterates over its associated
DMABUFs, marks them as revoked, and calls dma_buf_move_notify() so that
their importers are notified.

The same procedure applies during the disassociate flow; final cleanup
occurs when the application closes the file.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Edward Srouji <edwards@nvidia.com>
---
 drivers/infiniband/core/Makefile                  |   1 +
 drivers/infiniband/core/device.c                  |   2 +
 drivers/infiniband/core/ib_core_uverbs.c          |  22 +++
 drivers/infiniband/core/rdma_core.c               |  28 ++--
 drivers/infiniband/core/rdma_core.h               |   1 +
 drivers/infiniband/core/uverbs.h                  |  10 ++
 drivers/infiniband/core/uverbs_std_types_dmabuf.c | 176 ++++++++++++++++++++++
 drivers/infiniband/core/uverbs_uapi.c             |   1 +
 include/rdma/ib_verbs.h                           |   9 ++
 include/rdma/uverbs_types.h                       |   1 +
 include/uapi/rdma/ib_user_ioctl_cmds.h            |  10 ++
 11 files changed, 249 insertions(+), 12 deletions(-)

diff --git a/drivers/infiniband/core/Makefile b/drivers/infiniband/core/Makefile
index f483e0c12444..a2a7a9d2e0d3 100644
--- a/drivers/infiniband/core/Makefile
+++ b/drivers/infiniband/core/Makefile
@@ -33,6 +33,7 @@ ib_umad-y :=			user_mad.o
 ib_uverbs-y :=			uverbs_main.o uverbs_cmd.o uverbs_marshall.o \
 				rdma_core.o uverbs_std_types.o uverbs_ioctl.o \
 				uverbs_std_types_cq.o \
+				uverbs_std_types_dmabuf.o \
 				uverbs_std_types_dmah.o \
 				uverbs_std_types_flow_action.o uverbs_std_types_dm.o \
 				uverbs_std_types_mr.o uverbs_std_types_counters.o \
diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/device.c
index 4e09f6e0995e..416242b9c158 100644
--- a/drivers/infiniband/core/device.c
+++ b/drivers/infiniband/core/device.c
@@ -2765,6 +2765,7 @@ void ib_set_device_ops(struct ib_device *dev, const struct ib_device_ops *ops)
 	SET_DEVICE_OP(dev_ops, map_mr_sg);
 	SET_DEVICE_OP(dev_ops, map_mr_sg_pi);
 	SET_DEVICE_OP(dev_ops, mmap);
+	SET_DEVICE_OP(dev_ops, mmap_get_pfns);
 	SET_DEVICE_OP(dev_ops, mmap_free);
 	SET_DEVICE_OP(dev_ops, modify_ah);
 	SET_DEVICE_OP(dev_ops, modify_cq);
@@ -2775,6 +2776,7 @@ void ib_set_device_ops(struct ib_device *dev, const struct ib_device_ops *ops)
 	SET_DEVICE_OP(dev_ops, modify_srq);
 	SET_DEVICE_OP(dev_ops, modify_wq);
 	SET_DEVICE_OP(dev_ops, peek_cq);
+	SET_DEVICE_OP(dev_ops, pgoff_to_mmap_entry);
 	SET_DEVICE_OP(dev_ops, pre_destroy_cq);
 	SET_DEVICE_OP(dev_ops, poll_cq);
 	SET_DEVICE_OP(dev_ops, port_groups);
diff --git a/drivers/infiniband/core/ib_core_uverbs.c b/drivers/infiniband/core/ib_core_uverbs.c
index b51bd7087a88..b02cf9061f09 100644
--- a/drivers/infiniband/core/ib_core_uverbs.c
+++ b/drivers/infiniband/core/ib_core_uverbs.c
@@ -5,9 +5,13 @@
  * Copyright 2019 Marvell. All rights reserved.
  */
 #include <linux/xarray.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-resv.h>
 #include "uverbs.h"
 #include "core_priv.h"
 
+MODULE_IMPORT_NS("DMA_BUF");
+
 /**
  * rdma_umap_priv_init() - Initialize the private data of a vma
  *
@@ -229,12 +233,27 @@ EXPORT_SYMBOL(rdma_user_mmap_entry_put);
  */
 void rdma_user_mmap_entry_remove(struct rdma_user_mmap_entry *entry)
 {
+	struct ib_uverbs_dmabuf_file *uverbs_dmabuf, *tmp;
+
 	if (!entry)
 		return;
 
+	mutex_lock(&entry->dmabufs_lock);
 	xa_lock(&entry->ucontext->mmap_xa);
 	entry->driver_removed = true;
 	xa_unlock(&entry->ucontext->mmap_xa);
+	list_for_each_entry_safe(uverbs_dmabuf, tmp, &entry->dmabufs, dmabufs_elm) {
+		dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
+		list_del(&uverbs_dmabuf->dmabufs_elm);
+		uverbs_dmabuf->revoked = true;
+		dma_buf_move_notify(uverbs_dmabuf->dmabuf);
+		dma_resv_wait_timeout(uverbs_dmabuf->dmabuf->resv,
+				      DMA_RESV_USAGE_BOOKKEEP, false,
+				      MAX_SCHEDULE_TIMEOUT);
+		dma_resv_unlock(uverbs_dmabuf->dmabuf->resv);
+	}
+	mutex_unlock(&entry->dmabufs_lock);
+
 	kref_put(&entry->ref, rdma_user_mmap_entry_free);
 }
 EXPORT_SYMBOL(rdma_user_mmap_entry_remove);
@@ -274,6 +293,9 @@ int rdma_user_mmap_entry_insert_range(struct ib_ucontext *ucontext,
 		return -EINVAL;
 
 	kref_init(&entry->ref);
+	INIT_LIST_HEAD(&entry->dmabufs);
+	mutex_init(&entry->dmabufs_lock);
+
 	entry->ucontext = ucontext;
 
 	/*
diff --git a/drivers/infiniband/core/rdma_core.c b/drivers/infiniband/core/rdma_core.c
index b6eda2fb0911..3e0a8b9cd288 100644
--- a/drivers/infiniband/core/rdma_core.c
+++ b/drivers/infiniband/core/rdma_core.c
@@ -809,21 +809,10 @@ const struct uverbs_obj_type_class uverbs_idr_class = {
 };
 EXPORT_SYMBOL(uverbs_idr_class);
 
-/*
- * Users of UVERBS_TYPE_ALLOC_FD should set this function as the struct
- * file_operations release method.
- */
-int uverbs_uobject_fd_release(struct inode *inode, struct file *filp)
+int uverbs_uobject_release(struct ib_uobject *uobj)
 {
 	struct ib_uverbs_file *ufile;
-	struct ib_uobject *uobj;
 
-	/*
-	 * This can only happen if the fput came from alloc_abort_fd_uobject()
-	 */
-	if (!filp->private_data)
-		return 0;
-	uobj = filp->private_data;
 	ufile = uobj->ufile;
 
 	if (down_read_trylock(&ufile->hw_destroy_rwsem)) {
@@ -850,6 +839,21 @@ int uverbs_uobject_fd_release(struct inode *inode, struct file *filp)
 	uverbs_uobject_put(uobj);
 	return 0;
 }
+
+/*
+ * Users of UVERBS_TYPE_ALLOC_FD should set this function as the struct
+ * file_operations release method.
+ */
+int uverbs_uobject_fd_release(struct inode *inode, struct file *filp)
+{
+	/*
+	 * This can only happen if the fput came from alloc_abort_fd_uobject()
+	 */
+	if (!filp->private_data)
+		return 0;
+
+	return uverbs_uobject_release(filp->private_data);
+}
 EXPORT_SYMBOL(uverbs_uobject_fd_release);
 
 /*
diff --git a/drivers/infiniband/core/rdma_core.h b/drivers/infiniband/core/rdma_core.h
index a59b087611cb..55f1e3558856 100644
--- a/drivers/infiniband/core/rdma_core.h
+++ b/drivers/infiniband/core/rdma_core.h
@@ -156,6 +156,7 @@ extern const struct uapi_definition uverbs_def_obj_counters[];
 extern const struct uapi_definition uverbs_def_obj_cq[];
 extern const struct uapi_definition uverbs_def_obj_device[];
 extern const struct uapi_definition uverbs_def_obj_dm[];
+extern const struct uapi_definition uverbs_def_obj_dmabuf[];
 extern const struct uapi_definition uverbs_def_obj_dmah[];
 extern const struct uapi_definition uverbs_def_obj_flow_action[];
 extern const struct uapi_definition uverbs_def_obj_intf[];
diff --git a/drivers/infiniband/core/uverbs.h b/drivers/infiniband/core/uverbs.h
index 797e2fcc8072..66287e8e7ad7 100644
--- a/drivers/infiniband/core/uverbs.h
+++ b/drivers/infiniband/core/uverbs.h
@@ -133,6 +133,16 @@ struct ib_uverbs_completion_event_file {
 	struct ib_uverbs_event_queue		ev_queue;
 };
 
+struct ib_uverbs_dmabuf_file {
+	struct ib_uobject uobj;
+	struct dma_buf *dmabuf;
+	struct list_head dmabufs_elm;
+	struct rdma_user_mmap_entry *mmap_entry;
+	struct dma_buf_phys_vec phys_vec;
+	struct p2pdma_provider *provider;
+	u8 revoked :1;
+};
+
 struct ib_uverbs_event {
 	union {
 		struct ib_uverbs_async_event_desc	async;
diff --git a/drivers/infiniband/core/uverbs_std_types_dmabuf.c b/drivers/infiniband/core/uverbs_std_types_dmabuf.c
new file mode 100644
index 000000000000..05980f4fa500
--- /dev/null
+++ b/drivers/infiniband/core/uverbs_std_types_dmabuf.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION & AFFILIATES. All rights reserved
+ */
+
+#include <linux/dma-buf-mapping.h>
+#include <linux/pci-p2pdma.h>
+#include <linux/dma-resv.h>
+#include <rdma/uverbs_std_types.h>
+#include "rdma_core.h"
+#include "uverbs.h"
+
+static int uverbs_dmabuf_attach(struct dma_buf *dmabuf,
+				struct dma_buf_attachment *attachment)
+{
+	if (!attachment->peer2peer)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static struct sg_table *
+uverbs_dmabuf_map(struct dma_buf_attachment *attachment,
+		  enum dma_data_direction dir)
+{
+	struct ib_uverbs_dmabuf_file *priv = attachment->dmabuf->priv;
+
+	dma_resv_assert_held(priv->dmabuf->resv);
+
+	if (priv->revoked)
+		return ERR_PTR(-ENODEV);
+
+	return dma_buf_phys_vec_to_sgt(attachment, priv->provider,
+				       &priv->phys_vec, 1, priv->phys_vec.len,
+				       dir);
+}
+
+static void uverbs_dmabuf_unmap(struct dma_buf_attachment *attachment,
+				struct sg_table *sgt,
+				enum dma_data_direction dir)
+{
+	dma_buf_free_sgt(attachment, sgt, dir);
+}
+
+static int uverbs_dmabuf_pin(struct dma_buf_attachment *attach)
+{
+	return -EOPNOTSUPP;
+}
+
+static void uverbs_dmabuf_release(struct dma_buf *dmabuf)
+{
+	struct ib_uverbs_dmabuf_file *priv = dmabuf->priv;
+
+	/*
+	 * This can only happen if the fput came from alloc_abort_fd_uobject()
+	 */
+	if (!priv->uobj.context)
+		return;
+
+	uverbs_uobject_release(&priv->uobj);
+}
+
+static const struct dma_buf_ops uverbs_dmabuf_ops = {
+	.attach = uverbs_dmabuf_attach,
+	.map_dma_buf = uverbs_dmabuf_map,
+	.unmap_dma_buf = uverbs_dmabuf_unmap,
+	.pin = uverbs_dmabuf_pin,
+	.release = uverbs_dmabuf_release,
+};
+
+static int UVERBS_HANDLER(UVERBS_METHOD_DMABUF_ALLOC)(
+	struct uverbs_attr_bundle *attrs)
+{
+	struct ib_uobject *uobj =
+		uverbs_attr_get(attrs, UVERBS_ATTR_ALLOC_DMABUF_HANDLE)
+			->obj_attr.uobject;
+	struct ib_uverbs_dmabuf_file *uverbs_dmabuf =
+		container_of(uobj, struct ib_uverbs_dmabuf_file, uobj);
+	struct ib_device *ib_dev = attrs->context->device;
+	struct rdma_user_mmap_entry *mmap_entry;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	off_t pg_off;
+	int ret;
+
+	ret = uverbs_get_const(&pg_off, attrs, UVERBS_ATTR_ALLOC_DMABUF_PGOFF);
+	if (ret)
+		return ret;
+
+	mmap_entry = ib_dev->ops.pgoff_to_mmap_entry(attrs->context, pg_off);
+	if (!mmap_entry)
+		return -EINVAL;
+
+	ret = ib_dev->ops.mmap_get_pfns(mmap_entry, &uverbs_dmabuf->phys_vec,
+					&uverbs_dmabuf->provider);
+	if (ret)
+		goto err;
+
+	exp_info.ops = &uverbs_dmabuf_ops;
+	exp_info.size = uverbs_dmabuf->phys_vec.len;
+	exp_info.flags = O_CLOEXEC;
+	exp_info.priv = uverbs_dmabuf;
+
+	uverbs_dmabuf->dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(uverbs_dmabuf->dmabuf)) {
+		ret = PTR_ERR(uverbs_dmabuf->dmabuf);
+		goto err;
+	}
+
+	INIT_LIST_HEAD(&uverbs_dmabuf->dmabufs_elm);
+	mutex_lock(&mmap_entry->dmabufs_lock);
+	if (mmap_entry->driver_removed)
+		ret = -EIO;
+	else
+		list_add_tail(&uverbs_dmabuf->dmabufs_elm, &mmap_entry->dmabufs);
+	mutex_unlock(&mmap_entry->dmabufs_lock);
+	if (ret)
+		goto err_revoked;
+
+	uobj->object = uverbs_dmabuf->dmabuf->file;
+	uverbs_dmabuf->mmap_entry = mmap_entry;
+	uverbs_finalize_uobj_create(attrs, UVERBS_ATTR_ALLOC_DMABUF_HANDLE);
+	return 0;
+
+err_revoked:
+	dma_buf_put(uverbs_dmabuf->dmabuf);
+err:
+	rdma_user_mmap_entry_put(mmap_entry);
+	return ret;
+}
+
+DECLARE_UVERBS_NAMED_METHOD(
+	UVERBS_METHOD_DMABUF_ALLOC,
+	UVERBS_ATTR_FD(UVERBS_ATTR_ALLOC_DMABUF_HANDLE,
+		       UVERBS_OBJECT_DMABUF,
+		       UVERBS_ACCESS_NEW,
+		       UA_MANDATORY),
+	UVERBS_ATTR_PTR_IN(UVERBS_ATTR_ALLOC_DMABUF_PGOFF,
+			   UVERBS_ATTR_TYPE(u64),
+			   UA_MANDATORY));
+
+static void uverbs_dmabuf_fd_destroy_uobj(struct ib_uobject *uobj,
+					  enum rdma_remove_reason why)
+{
+	struct ib_uverbs_dmabuf_file *uverbs_dmabuf =
+		container_of(uobj, struct ib_uverbs_dmabuf_file, uobj);
+
+	mutex_lock(&uverbs_dmabuf->mmap_entry->dmabufs_lock);
+	dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
+	if (!uverbs_dmabuf->revoked) {
+		uverbs_dmabuf->revoked = true;
+		list_del(&uverbs_dmabuf->dmabufs_elm);
+		dma_buf_move_notify(uverbs_dmabuf->dmabuf);
+		dma_resv_wait_timeout(uverbs_dmabuf->dmabuf->resv,
+				      DMA_RESV_USAGE_BOOKKEEP, false,
+				      MAX_SCHEDULE_TIMEOUT);
+	}
+	dma_resv_unlock(uverbs_dmabuf->dmabuf->resv);
+	mutex_unlock(&uverbs_dmabuf->mmap_entry->dmabufs_lock);
+
+	/* Matches the get done as part of pgoff_to_mmap_entry() */
+	rdma_user_mmap_entry_put(uverbs_dmabuf->mmap_entry);
+};
+
+DECLARE_UVERBS_NAMED_OBJECT(
+	UVERBS_OBJECT_DMABUF,
+	UVERBS_TYPE_ALLOC_FD(sizeof(struct ib_uverbs_dmabuf_file),
+			     uverbs_dmabuf_fd_destroy_uobj,
+			     NULL, NULL, O_RDONLY),
+			     &UVERBS_METHOD(UVERBS_METHOD_DMABUF_ALLOC));
+
+const struct uapi_definition uverbs_def_obj_dmabuf[] = {
+	UAPI_DEF_CHAIN_OBJ_TREE_NAMED(UVERBS_OBJECT_DMABUF),
+				      UAPI_DEF_OBJ_NEEDS_FN(mmap_get_pfns),
+				      UAPI_DEF_OBJ_NEEDS_FN(pgoff_to_mmap_entry),
+	{}
+};
diff --git a/drivers/infiniband/core/uverbs_uapi.c b/drivers/infiniband/core/uverbs_uapi.c
index e00ea63175bd..38d0bbbee796 100644
--- a/drivers/infiniband/core/uverbs_uapi.c
+++ b/drivers/infiniband/core/uverbs_uapi.c
@@ -631,6 +631,7 @@ static const struct uapi_definition uverbs_core_api[] = {
 	UAPI_DEF_CHAIN(uverbs_def_obj_cq),
 	UAPI_DEF_CHAIN(uverbs_def_obj_device),
 	UAPI_DEF_CHAIN(uverbs_def_obj_dm),
+	UAPI_DEF_CHAIN(uverbs_def_obj_dmabuf),
 	UAPI_DEF_CHAIN(uverbs_def_obj_dmah),
 	UAPI_DEF_CHAIN(uverbs_def_obj_flow_action),
 	UAPI_DEF_CHAIN(uverbs_def_obj_intf),
diff --git a/include/rdma/ib_verbs.h b/include/rdma/ib_verbs.h
index 6c372a37c482..5be67013c8ae 100644
--- a/include/rdma/ib_verbs.h
+++ b/include/rdma/ib_verbs.h
@@ -43,6 +43,7 @@
 #include <uapi/rdma/rdma_user_ioctl.h>
 #include <uapi/rdma/ib_user_ioctl_verbs.h>
 #include <linux/pci-tph.h>
+#include <linux/dma-buf.h>
 
 #define IB_FW_VERSION_NAME_MAX	ETHTOOL_FWVERS_LEN
 
@@ -2363,6 +2364,9 @@ struct rdma_user_mmap_entry {
 	unsigned long start_pgoff;
 	size_t npages;
 	bool driver_removed;
+	/* protects access to dmabufs */
+	struct mutex dmabufs_lock;
+	struct list_head dmabufs;
 };
 
 /* Return the offset (in bytes) the user should pass to libc's mmap() */
@@ -2500,6 +2504,11 @@ struct ib_device_ops {
 	 * Therefore needs to be implemented by the driver in mmap_free.
 	 */
 	void (*mmap_free)(struct rdma_user_mmap_entry *entry);
+	int (*mmap_get_pfns)(struct rdma_user_mmap_entry *entry,
+			     struct dma_buf_phys_vec *phys_vec,
+			     struct p2pdma_provider **provider);
+	struct rdma_user_mmap_entry *(*pgoff_to_mmap_entry)(struct ib_ucontext *ucontext,
+							    off_t pg_off);
 	void (*disassociate_ucontext)(struct ib_ucontext *ibcontext);
 	int (*alloc_pd)(struct ib_pd *pd, struct ib_udata *udata);
 	int (*dealloc_pd)(struct ib_pd *pd, struct ib_udata *udata);
diff --git a/include/rdma/uverbs_types.h b/include/rdma/uverbs_types.h
index 26ba919ac245..6a253b7dc5ea 100644
--- a/include/rdma/uverbs_types.h
+++ b/include/rdma/uverbs_types.h
@@ -186,6 +186,7 @@ struct ib_uverbs_file {
 extern const struct uverbs_obj_type_class uverbs_idr_class;
 extern const struct uverbs_obj_type_class uverbs_fd_class;
 int uverbs_uobject_fd_release(struct inode *inode, struct file *filp);
+int uverbs_uobject_release(struct ib_uobject *uobj);
 
 #define UVERBS_BUILD_BUG_ON(cond) (sizeof(char[1 - 2 * !!(cond)]) -	\
 				   sizeof(char))
diff --git a/include/uapi/rdma/ib_user_ioctl_cmds.h b/include/uapi/rdma/ib_user_ioctl_cmds.h
index 35da4026f452..72041c1b0ea5 100644
--- a/include/uapi/rdma/ib_user_ioctl_cmds.h
+++ b/include/uapi/rdma/ib_user_ioctl_cmds.h
@@ -56,6 +56,7 @@ enum uverbs_default_objects {
 	UVERBS_OBJECT_COUNTERS,
 	UVERBS_OBJECT_ASYNC_EVENT,
 	UVERBS_OBJECT_DMAH,
+	UVERBS_OBJECT_DMABUF,
 };
 
 enum {
@@ -263,6 +264,15 @@ enum uverbs_methods_dmah {
 	UVERBS_METHOD_DMAH_FREE,
 };
 
+enum uverbs_attrs_alloc_dmabuf_cmd_attr_ids {
+	UVERBS_ATTR_ALLOC_DMABUF_HANDLE,
+	UVERBS_ATTR_ALLOC_DMABUF_PGOFF,
+};
+
+enum uverbs_methods_dmabuf {
+	UVERBS_METHOD_DMABUF_ALLOC,
+};
+
 enum uverbs_attrs_reg_dm_mr_cmd_attr_ids {
 	UVERBS_ATTR_REG_DM_MR_HANDLE,
 	UVERBS_ATTR_REG_DM_MR_OFFSET,

-- 
2.49.0

