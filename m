Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B8pKeUDlWlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590CD1521C2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D02410E53D;
	Wed, 18 Feb 2026 00:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DywOaTUA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013035.outbound.protection.outlook.com
 [40.107.201.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C1410E547;
 Wed, 18 Feb 2026 00:12:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCv4nLeV4NlGD8CYO4pkas7Np49XZdVn2/o9MelwSPHyD41wBE6ueNfHjljUEwtrju5Xr2DLq9a0uR3LEBnTwCTkYonnOByTetGSo86245v3cMFsmIUdcEy48nfTYN7SS2FvDjwBZQ7JhdXgPC4F0+Nbp/K8DqjS5zpy4epK54OffQYiE8wMcaJeDBhiBu1hbFPeIK5mEuYK8DF6Pr1g6SJYK3rqfB7I9y0k78pjNu2KQMSNWKu1hwmorDR9LnT3xOV453GiJP59/8UUVX1yfzUd7RgpiukQgYeeeAjlEqqK088412tAlBY9xF08dBEj624vT2L0RUNTBkuvZ95LoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scabgFcrbGZU5+yARLqN+ndhrayoDRG+4pQ61pBvRmQ=;
 b=IGDOyEnXEfNmypCusq5FNhxa5m7jTfRcQNjOeiYmDf00Nv8NORndbsGy7XGVqfUqi1jNOcJcVSOb1i4GcZWf1vGFnqr4vNlRPMKrU2TeWblGKmU6IvDnv9Lsc9hpI2IR7te4Mp0LNTksoF8iJeu6vCg58SXN28QAHMMMcvkGb8Xxo16frZwroc1FR5bQ4uflwpLNe306TcMXH9pY/tu/sCiq+WnHwFSPWrudvxntirhhZD/hN7flVPRhbBgrVMoNXSwtVFHDp4MLqQk1KE/vjfZH66wPFMhaaYqQCzdkpILHGY7kUBq7deuUl86D2hXQemi29s1y2K+M4WeJw86kLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scabgFcrbGZU5+yARLqN+ndhrayoDRG+4pQ61pBvRmQ=;
 b=DywOaTUAotxkS/9BjSLZ0eneGOjtWUvSlFqoEW+vxxYvZquPhzZ6Cfc0Hxx3QfCdionzoB/sA845oFpsWnC7LGPVtft4ff8jqX8ll0zpgsZfsJnDW0vB3eTSFR5yV5PQYO95fpAGDfiVYTWE6JKeKBu+DThrR1LQ+JOpWJhE7STveN//L3N2gkHtIb3VbEvKpM9ZuS9z+j6NwHg0RkwL4t4L81evzDqTzUtdt/ebm6y8MJfR2Uv0uwMJynQD+CAuEgRDaYyNCFA7FokiK1EYTKzU0niFnX0fdGRdnl0bxxoPcvOsMDsBsMA0aAnmGKmfzaU0EGiGObfL6AOo+ctX1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 00:12:05 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:05 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: 
Cc: Christian Koenig <christian.koenig@amd.com>,
 Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH RFC 04/26] dma-buf: Route SGT related actions through
 attach->map_type
Date: Tue, 17 Feb 2026 20:11:35 -0400
Message-ID: <4-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::9) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: cadac6e0-be8c-4f6f-9bbb-08de6e825655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nDAnk7PpOEYAGnsKTnOj1LUTlGSwlpf7LOWoZhsi2b0to8alFBEGOW3ffUBy?=
 =?us-ascii?Q?zByisE31xdOP2vS9cOpSekVFNdjvx5HFBnrGZj9FZypEjJYYCC9LmEU/zMFN?=
 =?us-ascii?Q?bkRD/4oqbEWqAY+9EYlrLGWGcgMC3+FiSKm7s9yeymeZe/xdpGqLn98tdUdl?=
 =?us-ascii?Q?Pz/15zDTRQfB/ZI/lDBlvGVmmEAFP4iJytVuT3oGa1H4kUdJFjxWErdcAC4P?=
 =?us-ascii?Q?JmpL74nURtxsA3QUWDOC68t0VoBV6OCBS1qZ/CuqLTsFxc/FUP0hoaGzXUWu?=
 =?us-ascii?Q?DHofifkLxj5yG3Aa+wkBM+XLOAeCUxXwonyqPTsit8JXqhQ7OTbAoT0//aNT?=
 =?us-ascii?Q?Binj5nSAN/7JSyJiGxISdIkKuG5LptwWrsb7067cAgcmJTqACrmeLZMjrO2i?=
 =?us-ascii?Q?KFEuC7JlQHpXnyuzs+hdhCH/By9PzaBN7t9RooryV3Lp3Rw9/STsr1WMR90x?=
 =?us-ascii?Q?cUexi1BZahPXSPi2y25eAdZIEAWsBQQ7eXIZXKmCgSwkrCgUFQFcVQOw2tWB?=
 =?us-ascii?Q?61UiPdi5yq8OCggQsolQPof2/6gccF2Qudy01DVu35F9rPuICy4EUF9thS+f?=
 =?us-ascii?Q?82l0From/QEArDcYp2dC+3q1ssAQLaZtpwdDMNQ10/zqur669z5qp1Pi9D9T?=
 =?us-ascii?Q?dCr1NPahIrxAt1Xgbdd34jGGRLWtWMJTBjuklQVXsSrQ4L2sP6w+jgQwtlFU?=
 =?us-ascii?Q?OH2twbIQzt2arTozOgmc6ezM2kTc4Wwg+C2LZZzMALYiv/N8I9aeSwk8DkL2?=
 =?us-ascii?Q?bULH8Hi3s8IePPi/BKsU1MNnkYfyRJVJYLUMVYF8VDKJIvZLmacXloDxdNWb?=
 =?us-ascii?Q?ekybY7zD3++GMggO+wI75Y9G8iVP6csKXhd/I9f5+42MGgqPorR+4YmwMOFq?=
 =?us-ascii?Q?cKGt57azXZ16rZE2wwcBeMxDNa5k4rHYVTuF8oSvBnJFUgdnvE6qrRu6lJWS?=
 =?us-ascii?Q?urQ/yV4kD0a7AmgNnmsNc2K37wvr8EVYeSRHkD8NHuGoXICB7vbXgMMAH+S2?=
 =?us-ascii?Q?Ike+2DGiyijKKUiCTGsp1uFpzQRmb0LHDMj2sKbxNvHTSOJrXX8h1lZByGpn?=
 =?us-ascii?Q?DssxTQXu9RC+WkHsagg8xP7PDDJANoy9kniiXxTBV/JNqB3x9I+wOcB+gq2D?=
 =?us-ascii?Q?aOuOcEJRKQrzVc9PE1fivaQDu2h6mVZMrRJp+cK5+UIEYOvftwO49T9oecra?=
 =?us-ascii?Q?xlDFwMOIdxJRr1UapRC0jruE8Rrc7qY9wUgW9XHKFSXl8EMb+kIeuS5Ps41u?=
 =?us-ascii?Q?IHTUKzHsJsJNslNaUFNoRkMQo1IELgMSIQCHvKPhXDjjH4x1YfPpO6+M75Rf?=
 =?us-ascii?Q?itT/lnFWK7KWhxNaFNRvM0+pwv0pSCcFl4pXvUcIHjZlWah5nd8sIdQG+Ms4?=
 =?us-ascii?Q?kuETHH2xNFjZK8mAc7VS0OM3QWgV5Vn59T1g7mxVgwnIfumPRmQq4cKupPbb?=
 =?us-ascii?Q?cDrB47NB/oqODDyYkT1dcnq+FiEo33calpNqteZEbXziiiZErLzeSM1lsIeF?=
 =?us-ascii?Q?Yafseqtd7nIWmdKztipIzsLJYL/8DqyHbk/iIL3kdS27M9/vzfchakB4hGm/?=
 =?us-ascii?Q?mEYbXqDHa+smIdxG6j0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HmWhbHuWDYzliOElnRTPjriGtHNSdn894TvXAD4SFO9ZTMIs83Kljtk+UmwP?=
 =?us-ascii?Q?M0SUa8TgtiXeiiiRWmzeGHN5gIxDhgNJLlbemgrVrlSEER//r/XjrhtTKjT7?=
 =?us-ascii?Q?IzIMnX6K9L6oyFDQNmPCPYqLgGeu5t+OnUao/KoWsY/y4L7KzotP5h5PzzWO?=
 =?us-ascii?Q?v8++z+xCvBklFsT9Tm5VmjRDJC5lsn9KEGnfKvV9qtnmUOEZ4vFKSCua8Tpi?=
 =?us-ascii?Q?/zNi3s3s3ZE8Ot6TruK1eJAGNwyhD8EYnqhwZPFnra9rDZD+piIvTG91h+Mi?=
 =?us-ascii?Q?C0EfHFwDuwRGYM3xgiEK1VEkEgldxdG5pyzZsND0qCalLcn8Nwd/NReokl4N?=
 =?us-ascii?Q?1nkVbhZQmz2yqCak4rkWz8rxDPt3asMDyDBFb/bZVNg+/Y4+UGIP7ig1DOgg?=
 =?us-ascii?Q?6/yyPAPNB6Sw5kQDtzEumQCfzskUVa8w4fVm6O9YRmlqY4yYT3HSEqdM3qOe?=
 =?us-ascii?Q?452YGLg/7fiJSnH2pcBiEA3WdNySAtVi7+H5xAMMgqn0hfPpJdl593p32rtL?=
 =?us-ascii?Q?w3q8AeucUi40cRQB6krWibZ/rIqGH2QgO9dBfP8c8DNfq602xCv0CRkAlypC?=
 =?us-ascii?Q?svQSuV0RHfTUUlCBOtpbPCP9CRiZHGN9ix4h5fEWvMLjGqPiqEQQxoPudINK?=
 =?us-ascii?Q?fZZPLdJAQI3tcXw4ngCZgDkWc1VnfZ5TyiWugAw9tVcD7JIZPJ3J/tUoJ/ck?=
 =?us-ascii?Q?z1ZPAALUyVnOo5HkT/9/V+QSNDu9RydfjM9aJjOe6X1+1KsCqMQfGMrACDzy?=
 =?us-ascii?Q?Hz79OBZdmYZWdqBQwr7xGwEbVNQlnSkf9iF+IjyDtleqdnCmqvVyWiHCTpFk?=
 =?us-ascii?Q?RWic3TzBppZNt5FYUlBNbxV4nqd3+Pgfwu8TNlcm1vLmrtjSM6tsQCiPOb8z?=
 =?us-ascii?Q?2Bz0AvZoPd8xxENJSxBuGJhcLUVFht1WySdVnRSLhwCM7J159kOUc+VpIRpe?=
 =?us-ascii?Q?59OX8oWHOdJBfAbcWOCq9qwlHAm9xN0WL4KEzesVt7T3blddGsjHpoC3FfUE?=
 =?us-ascii?Q?Pey2Mhzp79sFs8vPJIeEpBXMYrD16BWBK5op7EzpP45BhDtmQVs3+LTw/Deg?=
 =?us-ascii?Q?GpeKBzJowClpxfd8PG64iu+SPrmpf2i0kViHdnzK1KRkcaI/Bu11PySVFxKx?=
 =?us-ascii?Q?+xgX3sdH5mPkuwc9eFN5LARZsKxXtoTxxNjc2tYV4K770fQWN/nzYRJJ8x/C?=
 =?us-ascii?Q?Vmo7BJZ9ztm/KL1DjZgOnbvN63kwLpoc8NxXAG6HqoyvaEEa+SWlTVmHxDNh?=
 =?us-ascii?Q?uKamYsXHy/C87FDwJTlHKCnb6Teptmfh3fKvEKT7pOcdu6nYglbEaeGeGThn?=
 =?us-ascii?Q?cGyAH7IGwd0aWrLMw6zre05EQ5CwiFcZn4P4tga7lPN19c8kOJaq4nRpQk0j?=
 =?us-ascii?Q?dLPKXXpNv8TSGHNorc7k7jNNMWstyIUu8CILiBCO5SgD4va7FovdDsWM+6ef?=
 =?us-ascii?Q?UMr3Zmt9F076xsL7EPooTS+PFFCrTc4ILLtToFu4a32z2b4l4UV8CiL4Ngsz?=
 =?us-ascii?Q?u5OtMNybwuoREp+MBSs+4nlRxykcetB6SLb5nSCvySIoGq3YwYuKRxSGrlq/?=
 =?us-ascii?Q?wuR73L0D1e7SySrJWHTWzZgLTANHj0xdNXUm8U4XG/ip3DnQEy/ba7bPDOKx?=
 =?us-ascii?Q?JHAb3Pi5vHrP8L+bzhXhZDrtFCqk1oYYEnRU+u/0hr7B7YclG2dCFaawdvmi?=
 =?us-ascii?Q?jVbLRZfQR4+3rYwZDDwGYrPV+g4+f+XCWyEyg2OUKd6GMNfOhn2AZG5uCkep?=
 =?us-ascii?Q?VC474YvVdg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cadac6e0-be8c-4f6f-9bbb-08de6e825655
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:12:00.8026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ty0iT8gBChFT/ihRji/I7//jDt/lxCWUANBZMqYfHoKHNLA73kp+p2TJ+kqEum16
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 590CD1521C2
X-Rspamd-Action: no action

Now that dma_buf_mapping_attach() ensures a mapping_type exists, even for
exporters and importers that don't provide it, route operations through the
map_type.

For map/unmap this will go through dma_buf_sgt_compat_map_dma_buf() which
calls the same attach->dmabuf->ops->map_dma_buf().

Move the debugfs processing unique to SGT into a callback too.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/dma-buf.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 6e89fcfdad3015..4211ae2b462bdd 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1149,12 +1149,14 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, "DMA_BUF");
 struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 					enum dma_data_direction direction)
 {
+	const struct dma_buf_mapping_sgt_exp_ops *sgt_exp_ops =
+		dma_buf_get_sgt_ops(attach);
 	struct sg_table *sg_table;
 	signed long ret;
 
 	might_sleep();
 
-	if (WARN_ON(!attach || !attach->dmabuf))
+	if (WARN_ON(!attach || !attach->dmabuf || !sgt_exp_ops))
 		return ERR_PTR(-EINVAL);
 
 	dma_resv_assert_held(attach->dmabuf->resv);
@@ -1170,7 +1172,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 			return ERR_PTR(ret);
 	}
 
-	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
+	sg_table = sgt_exp_ops->map_dma_buf(attach, direction);
 	if (!sg_table)
 		sg_table = ERR_PTR(-ENOMEM);
 	if (IS_ERR(sg_table))
@@ -1208,7 +1210,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 	return sg_table;
 
 error_unmap:
-	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
+	sgt_exp_ops->unmap_dma_buf(attach, sg_table, direction);
 	sg_table = ERR_PTR(ret);
 
 error_unpin:
@@ -1261,15 +1263,18 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 				struct sg_table *sg_table,
 				enum dma_data_direction direction)
 {
+	const struct dma_buf_mapping_sgt_exp_ops *sgt_exp_ops =
+		dma_buf_get_sgt_ops(attach);
+
 	might_sleep();
 
-	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
+	if (WARN_ON(!attach || !attach->dmabuf || !sg_table || !sgt_exp_ops))
 		return;
 
 	dma_resv_assert_held(attach->dmabuf->resv);
 
 	mangle_sg_table(sg_table);
-	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
+	sgt_exp_ops->unmap_dma_buf(attach, sg_table, direction);
 
 	if (dma_buf_pin_on_map(attach))
 		attach->dmabuf->ops->unpin(attach);
@@ -1700,7 +1705,11 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 		attach_count = 0;
 
 		list_for_each_entry(attach_obj, &buf_obj->attachments, node) {
-			seq_printf(s, "\t%s\n", dev_name(attach_obj->dev));
+			seq_printf(s, "\t%s:", attach_obj->map_type.type->name);
+			if (attach_obj->map_type.type->debugfs_dump)
+				attach_obj->map_type.type->debugfs_dump(
+					s, attach_obj);
+			seq_putc(s, '\n');
 			attach_count++;
 		}
 		dma_resv_unlock(buf_obj->resv);
-- 
2.43.0

