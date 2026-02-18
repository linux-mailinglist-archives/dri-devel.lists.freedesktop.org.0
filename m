Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMeGCiIGlWl5KAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:21:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBFB152386
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2053B10E559;
	Wed, 18 Feb 2026 00:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mkTp93mt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C667410E550;
 Wed, 18 Feb 2026 00:21:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Geqhq9JTs3bZk71YSM0o6x5sUUCgrdHUKdRtxSzvRggpJv7vytNYP6AMEn4M6j5V2iukjzTPupJk7Y5LlF+4pP8OO5HcKjd8H/sTncXEwf51Kl+JQKoNdp5nKe8GqHtPv0O4VrRljwN5dYKR282+isUQHc53qxMj0GtZ2nz+ZdPr2jRPsofGVgmvJQgV4WhtVGWIVlN6N/yWdl35XiKQHtrRevOJJXQrRdzSVro5LG4sHkpIkqFHnhUCRZYsYE3SLJkcg2pmJ5PSLRmlOMWBDd7NoLCeasLhDsVyRvPvZ9ubFh1FBlHSseemJCXqASRFNld2l65wb4eY6ntNl4t6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiE3Lhrp3BEpDJ6YexIf2P1SB3K+NesVm63XHGr7azw=;
 b=ixLMYuEy76xanWpCLyxFPnX/zmuwNn5U+OQn25bgsCbmCqEN5T5KnK3o3Y+CxG3m3xj/eX4id4MdddtMc+bkh/FcVHMYAHSQA1qdUbx1KkArXDpSpwDW0bvfbT7TzgxMZH2YxD+GeNmLgmw1AiDxnKEmPKbOfEysTUR2LII/hJLRWuO6jmzV50IF1NuEvpPWM+m3O3Ijr83HIblmSLGUgDDsJGEHEf6rsGBf7vX3RscKyh8QrVobRZueO8SxkjGY3xsUDRmDL/Z8/5bjYvtDLSEHagpBsOidubVryOdMiqsddw5JzS8JxEEYhOnXagUkBzV75Q13xrmUyYvoaRIMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiE3Lhrp3BEpDJ6YexIf2P1SB3K+NesVm63XHGr7azw=;
 b=mkTp93mthAQTPVyXnA5sYHxEoT1hmfJDJdLIwbcggBVC+HQGnrOBb5zEL/ZFAG9/7+kaeoYBReaNuAbhsUwdZwx4SPUqGeADBbD11oSZz0RUz1xpGd6Aim9AwLY1ZbDKwgqhOxOKkDe2Sz36D+/OjxcshYcEs76jai66SiDYG8bBLIztjetLQ7J5lg1/vWvuhoZEmYuopzljizB8PAHtStvVFf0YYp3NadZHWknNY4ddwi7jDx1+dvhf1UcXx2oRTAKFqVr+YeWP4fuUkOz/xZof9c9XddhinC6sV7n/mncIaCVV6P9KI3FPfr1bgjpUdlZ2C0maMc0GIPe/0j9r5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY3PR12MB9629.namprd12.prod.outlook.com (2603:10b6:930:101::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 00:21:41 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:21:41 +0000
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
Subject: [PATCH RFC 13/26] dma-buf: Update dma_buf_phys_vec_to_sgt() to use
 the SGT mapping type
Date: Tue, 17 Feb 2026 20:11:44 -0400
Message-ID: <13-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0037.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::14) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY3PR12MB9629:EE_
X-MS-Office365-Filtering-Correlation-Id: c09ca8af-b9c0-4bbc-5602-08de6e83b00e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3YQhOw/XYgZTnjW7v4+abpdbjl1ITIFPQdP1NtL3VrqY9uvqPB28cO6R2txF?=
 =?us-ascii?Q?rvO0JmBSZwsJnkGeK4mNEB8y/YZuOscqDSDX3RY82BtEjILoh+XnJyQIFCT5?=
 =?us-ascii?Q?vDt9urWCumwsLM2xF4qYV2sqliNAKl0p/Jg/4aVAX4PvG8OzCJVlvn1jqPpJ?=
 =?us-ascii?Q?yr29UnTnYQmv7qeiYhzoAL9/I3RlmpYLXO2fjgGgFaDIO5FgGICWwnL7eFX2?=
 =?us-ascii?Q?35Fil2Rkb4xCOYwIt6XqA53jV9kSvuZP4TNm2eomjJ/t9PSXw47QMKDz2+6T?=
 =?us-ascii?Q?pmKoG0eftib1rIfP/VXZXf9YRLhBmJ7yxapl6PwplCqJpePjcQ+UApPSDevl?=
 =?us-ascii?Q?OZrsHH7VxvlVQcbNEW/2WO2ZnkG4ANoGd0RnCfdEJsha+39ezqPcjFk7d5Za?=
 =?us-ascii?Q?wQth5l4XdpR4M7MD8nxS9paUBxd1ogz8n3JZ12woCDwfLoJRiYSmZgPz6Cna?=
 =?us-ascii?Q?5v/OqOZ016q0UxSoAm3oblRhKhfLFl9mKosP5p+Ir/8AOlu7OjZ9IqsH9OHj?=
 =?us-ascii?Q?xvUgtqAWN/SqI/1dztpvbBaLMm+1XQQR2eGkR8k+UCctlRNebveAQvvQ++uJ?=
 =?us-ascii?Q?ZGhn96tYb5DJTJekR7hfnM69equWDUNqtmm5NtpULbBGnATw19/fWYshbHbr?=
 =?us-ascii?Q?WdsvO55k2MNhSosZTmC6iZ5Mo9DBicoErTTyy8PBZQxOkNH4K5J9CVMsnZWb?=
 =?us-ascii?Q?JH0wUOaAT/R3El2TcR6nsMit1KnYqGquIuWgXKD9iKbds34tVXFwakI8y6fl?=
 =?us-ascii?Q?x0NA+9iIjYzEyBjOFvxKsK1jPYTiHgtTvpqH8AXNLZBpAaXMKvLjdT908Ri+?=
 =?us-ascii?Q?ylEMEKm8xaZ2pSsYtIk9rc3p62cj3RltkxPmT6OlPEbyh99/RYmROZ5ZvS1g?=
 =?us-ascii?Q?tA2uE+Lc9CwNqpEboKbiRQ7xUyzXnxqF/Hix+mLRwMEg5pkmderW5GkXXQGX?=
 =?us-ascii?Q?UVossdVcURI5ALQHQmZoOg4EBxdXpaaiUVpzsotNJEgbG2jFir/pqH841Wm+?=
 =?us-ascii?Q?fG9wMX2eA5PTw5TTLsHof11+lWM/ssc3etCvvU42BrnD7EuGeRMVJpmDJZfa?=
 =?us-ascii?Q?t2oRO/Kxlx4bhHQrGEdeWBghay9yU3Z9jTgHgSyl5BkWkO26cD3fA825zBay?=
 =?us-ascii?Q?+zPddzVddNJ08ygStCez+XYWYZQS0tdyM4gljIy+GmLIXrodvN3D6Ok+SwIC?=
 =?us-ascii?Q?1sXFBJmAgtowUKBZ+eKrNvgVuLiR00mNBa93GKZKXr0HuWO9JBX0jTrctf7Z?=
 =?us-ascii?Q?jVKWQ9PlFruvBd7ODNNhCxA+W/NK9DZJRywcdsHt52sgni36JKtKN1CFEywT?=
 =?us-ascii?Q?h0VFzSgObcI0fUKI5sm86E4BVGxhbC9v38Uk44fi6d3N65RUYwC7QkaEEFpJ?=
 =?us-ascii?Q?QbVZ7K4615TKqVPWgnNh3eCfGwOSfe0C3t5wYK/C+ABEgIupPWsbNG69ngr4?=
 =?us-ascii?Q?jUv5z75wOkzFVKQ+STjcX5A3pltIU2rm0yXZNfZjuO3vFRR6FXVq8zYH1i6l?=
 =?us-ascii?Q?IAWwhADjCjuyqLjyyB+Ir4WR3ihlsbZQo7RKZjUTbFgftx8gBHfOxHwuBs/p?=
 =?us-ascii?Q?fK7BTtcmKZBDfOfOgbg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5wTG9zzxq/UqVxL2KlC9t3NZB+Jv7gMyGj32lVQwHt5F8D2eyDngQG+djaJQ?=
 =?us-ascii?Q?SHYMIkBMvim3gJblwX8c/9NXkI1UqnJUHaJr8fMX5NutC6fn1XGzEjbs2uMn?=
 =?us-ascii?Q?SeGK9QNXOS6NEcMiN6IetTCpmOGAdTdzIqHxyiUs0FckvViRsXV4xMIRma7x?=
 =?us-ascii?Q?H/iUw/DmsfXNPDVTlyA8oBH/bUy+49aK5P/WnR7oaBKGiAiUe09y+IzB8G15?=
 =?us-ascii?Q?gP7S0Q2oDTTZjZTquixNpVCRtkbOyK1bjasR7NyXP3AXtszvVvPrGvMRlg1J?=
 =?us-ascii?Q?amXewX4eiNJOx3RvB55+28aIsoDzMqaiHYjXRuv2tyxclAEAKcsiB5L71FIF?=
 =?us-ascii?Q?Zjoqf1rLMtPLXoUJd9zQooZStrdNQINK5P3FeAy6zlQDXOGnlPPWmvzi+F5K?=
 =?us-ascii?Q?qDjJEIIWTUMes+4lb6Ue8+D7fxd2iFlBdJ9zP+mnEjbcdcYATfmNAqFNH7Pi?=
 =?us-ascii?Q?PZ7ihHBFPLwCHNUH84Lut4QkmfFSWiU9xuP+sr/WpWYC9V66ZjXVqNlw6Jv4?=
 =?us-ascii?Q?oNUf3ytz6mwfMhcX2fNBEcwRgBFrVkHbqDjIOfweD4J5LQF++vtmCa14T/rn?=
 =?us-ascii?Q?4CgUvQYWiV1SMDgac+Y5VVacWvhFyNvAlIX9nJWRsLXGtg4qyeaY/SGTJe1/?=
 =?us-ascii?Q?dezaPpnu6WMt8MIn4Mmyn2mosrITPbRntKuBXshbf7bkDuE7TVjlq5B4mDPP?=
 =?us-ascii?Q?nrjeQk4DiTqjL2OnAfMH46H2HkIn/iRHT+R1nYOZnXFuFzHOKULKSYBRHVWQ?=
 =?us-ascii?Q?O+2epcbI3y57Kj8xuYKTzrkJLaLwYo0kGYy11/Dj5E9HDB1r7epCXPK/XI0O?=
 =?us-ascii?Q?LN8ok0GTH+ekfzEOwfP8tdwry+nAsNZaTLs5oH3jhwdRnB8XviGI/VJgEjMD?=
 =?us-ascii?Q?SUz7mIzwUuVtiqwZAJ9FToer62SakPAme+Qup43xA7XU5XClFI5oHJs9aFMM?=
 =?us-ascii?Q?QNtB6FXgegLDh6bddSTlu6mBLux+p8rC07Zd4eNvESizFVp2vcNNoUcXmj+G?=
 =?us-ascii?Q?u1yOS4Re5d/CwbKLdZDCzNk8V5OFfqq2/49x/e0n1+Gnv1H0MfZbuNuq+Cd1?=
 =?us-ascii?Q?A+4wdu3hX/RK7ecEV+VRebFoS3WKrs3DRPbCWLvD1qhrHF/1MiEdYR37leCd?=
 =?us-ascii?Q?XG1CdOXpcqKUc3S//g2d4LNWvd7fGCU6JUxRzNdbx829+soWDHneVNbN52RL?=
 =?us-ascii?Q?hLJ5iM94J4tdFy6IWROk9xa80SQpKzOUM6D3xOtd4CEEeZU0PoV+VsImUFjb?=
 =?us-ascii?Q?p00LpElltbmO0MTMjjClRyd2QpTTttHzWicP/5jmCUxkfR5PKMrGCIRUcwMu?=
 =?us-ascii?Q?0xbPI9aBgCVQ0TQxg8WDteeAIoqBvXk4szGizhnWPi1OZ7E15GvL3W5ESZvi?=
 =?us-ascii?Q?qYTpeqOU66ndGMT4yqelmqouvWsHOylnwDeF38NESNOkeIU4J8dwuFXmEO4e?=
 =?us-ascii?Q?4+Xd/Rx99E6XQ2xtPYuMWG6HZ1yZ4Q7OzCXS5QtwPAYC3HerhKCfJvZ286gm?=
 =?us-ascii?Q?jFrwSxpKyah3c7GHje5un64FeqLfWWILil0osVLH8Wh2QCxfmYBcRb3aHg/9?=
 =?us-ascii?Q?LHU0iSjLmVSnJpi1FlYnHQYHrLfAly6UY/F9MoWRTeWsI4Nl3fo2gPBvotUf?=
 =?us-ascii?Q?G0sU1eoQ/8FOaYLFDJRsXdF1y6WHcWkN/3rm5PLNtoLBuW34KoJM9uAAH1p4?=
 =?us-ascii?Q?JbA3GCdyVVIlp1jDF1VhTmSWyeUpIF+ciA8QvcnCz7oUDVMuZJR9ZAx8shu9?=
 =?us-ascii?Q?joRHzJFWLg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09ca8af-b9c0-4bbc-5602-08de6e83b00e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:21:40.8420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TlQDykHNpBehC0MDDOsMGu8sB9HgQkWgGC7KPEAqr4c7lRyEvQK32nyQ48fngJu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9629
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: CFBFB152386
X-Rspamd-Action: no action

These helpers only work when matched to a SGT mapping type, call
dma_buf_sgt_dma_device() to get the DMA device.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/dma-buf-mapping.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 02f5cf8b3def40..b5f320be0f24bf 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -97,6 +97,7 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 					 size_t nr_ranges, size_t size,
 					 enum dma_data_direction dir)
 {
+	struct device *dma_dev = dma_buf_sgt_dma_device(attach);
 	unsigned int nents, mapped_len = 0;
 	struct dma_buf_dma *dma;
 	struct scatterlist *sgl;
@@ -114,7 +115,7 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 	if (!dma)
 		return ERR_PTR(-ENOMEM);
 
-	switch (pci_p2pdma_map_type(provider, attach->dev)) {
+	switch (pci_p2pdma_map_type(provider, dma_dev)) {
 	case PCI_P2PDMA_MAP_BUS_ADDR:
 		/*
 		 * There is no need in IOVA at all for this flow.
@@ -127,7 +128,7 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 			goto err_free_dma;
 		}
 
-		dma_iova_try_alloc(attach->dev, dma->state, 0, size);
+		dma_iova_try_alloc(dma_dev, dma->state, 0, size);
 		break;
 	default:
 		ret = -EINVAL;
@@ -146,7 +147,7 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 			addr = pci_p2pdma_bus_addr_map(provider,
 						       phys_vec[i].paddr);
 		} else if (dma_use_iova(dma->state)) {
-			ret = dma_iova_link(attach->dev, dma->state,
+			ret = dma_iova_link(dma_dev, dma->state,
 					    phys_vec[i].paddr, 0,
 					    phys_vec[i].len, dir,
 					    DMA_ATTR_MMIO);
@@ -155,10 +156,10 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 
 			mapped_len += phys_vec[i].len;
 		} else {
-			addr = dma_map_phys(attach->dev, phys_vec[i].paddr,
+			addr = dma_map_phys(dma_dev, phys_vec[i].paddr,
 					    phys_vec[i].len, dir,
 					    DMA_ATTR_MMIO);
-			ret = dma_mapping_error(attach->dev, addr);
+			ret = dma_mapping_error(dma_dev, addr);
 			if (ret)
 				goto err_unmap_dma;
 		}
@@ -169,7 +170,7 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 
 	if (dma->state && dma_use_iova(dma->state)) {
 		WARN_ON_ONCE(mapped_len != size);
-		ret = dma_iova_sync(attach->dev, dma->state, 0, mapped_len);
+		ret = dma_iova_sync(dma_dev, dma->state, 0, mapped_len);
 		if (ret)
 			goto err_unmap_dma;
 
@@ -196,11 +197,11 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 	if (!i || !dma->state) {
 		; /* Do nothing */
 	} else if (dma_use_iova(dma->state)) {
-		dma_iova_destroy(attach->dev, dma->state, mapped_len, dir,
+		dma_iova_destroy(dma_dev, dma->state, mapped_len, dir,
 				 DMA_ATTR_MMIO);
 	} else {
 		for_each_sgtable_dma_sg(&dma->sgt, sgl, i)
-			dma_unmap_phys(attach->dev, sg_dma_address(sgl),
+			dma_unmap_phys(dma_dev, sg_dma_address(sgl),
 				       sg_dma_len(sgl), dir, DMA_ATTR_MMIO);
 	}
 	sg_free_table(&dma->sgt);
@@ -225,6 +226,7 @@ void dma_buf_free_sgt(struct dma_buf_attachment *attach, struct sg_table *sgt,
 		      enum dma_data_direction dir)
 {
 	struct dma_buf_dma *dma = container_of(sgt, struct dma_buf_dma, sgt);
+	struct device *dma_dev = dma_buf_sgt_dma_device(attach);
 	int i;
 
 	dma_resv_assert_held(attach->dmabuf->resv);
@@ -232,13 +234,13 @@ void dma_buf_free_sgt(struct dma_buf_attachment *attach, struct sg_table *sgt,
 	if (!dma->state) {
 		; /* Do nothing */
 	} else if (dma_use_iova(dma->state)) {
-		dma_iova_destroy(attach->dev, dma->state, dma->size, dir,
+		dma_iova_destroy(dma_dev, dma->state, dma->size, dir,
 				 DMA_ATTR_MMIO);
 	} else {
 		struct scatterlist *sgl;
 
 		for_each_sgtable_dma_sg(sgt, sgl, i)
-			dma_unmap_phys(attach->dev, sg_dma_address(sgl),
+			dma_unmap_phys(dma_dev, sg_dma_address(sgl),
 				       sg_dma_len(sgl), dir, DMA_ATTR_MMIO);
 	}
 
-- 
2.43.0

