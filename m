Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HWLFCcGlWmmKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:21:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57D3152394
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6E410E55F;
	Wed, 18 Feb 2026 00:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L5ecb1O1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012002.outbound.protection.outlook.com
 [40.107.200.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990FE10E155;
 Wed, 18 Feb 2026 00:21:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6DzIMYNTbOYQH1k9Q72YJHZBt+x3k/8ctB9hw6bLvGHwEDRq7Vq9CT+7pIqBcDPbsjW/ze+kekzWkwHgXZPzrjo47+hpA4QSH75E6sSQcUSNaFYWF9Ij3G9G1FMoaUlmcguWe8XKI1CsVsxfTwH5D7fbI5MdkixHxobl68RBfawzVAhZVXEVHkZFJBzsc2xj451T3NCNaTm0/YuHkw/qpAjegCHLy9Xolqz/OLkOBEO+hLPYLHkrXKlxI/z3F3kIZCmNT8d4T1eIpg++mmqiCxYNIgLGDSxE45QjbKqM6IofRjQJpcxmT8qHdqPpVsqajoI7wbzeQiTnoRgoF7PuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDPzQ8Fx//fzyHza8UqOksJGpvl1FMg2drFmgBt9KY4=;
 b=VJ9/FXhvU8LM3vnAO7EuWoiFyYWcvicvSZY2hhBAIoTH8/MuCKURKZaKFmsxsev6iMZqz7ncI9F3SrWyk70TnNIRfd2Tk9zZ0ZbSld/lo1tCXsmxEd8GSQklX+TFZwthXlKWanuizvaYEIT8tHlFYJiFHefrh5hl4pU+sLGdyTaZnPYzUxH/elYMudKdkpmdGIoiJafBqgpzh6zFDRWwsQx5L8FpjAqKZX0l8/qbpkcVe6eJ1+HDsSWa9zvrnqJ/C5qcZnTQ6jiLFg4g6pVQDEgqkWjS1rlb2aoaJt9Q20eSOLiDCpAEV8z1uhsl8BEiYobDnAP4+JtgpwOBJHwSwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDPzQ8Fx//fzyHza8UqOksJGpvl1FMg2drFmgBt9KY4=;
 b=L5ecb1O1MMNTWQFkyQYaxeN8AQiegL76dlpYjPzrQ2QV2ivEWYI5tVILh3Xt+PzeEWc31RYUdbRKOO2zvescUvNmm70CPUxiwbaeB+zLUTssq9JkdLDArbX4jbwHEOnTtMCfldblp/gPyIArsi5uNrbTQGisPvawbleCjaIky0nattBfeF5ttHsM+YGsoSP5j1cUILP8DS9ZwhgL5rJKGkurweNm5wuiiEJtex+eL2+D1Y2kdc/PfDFfZz1LtPIzNfLJm6oFWBOuugoOCrHzc0xE9KDtn+IZwMh6XmnozdJi4Td4JASHA0qn/VwgrlYd4kUvTNSlF3FK9swghAOSQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY3PR12MB9629.namprd12.prod.outlook.com (2603:10b6:930:101::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 00:21:43 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:21:43 +0000
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
Subject: [PATCH RFC 18/26] treewide: Rename
 dma_buf_unmap_attachment(_unlocked) to dma_buf_sgt_*
Date: Tue, 17 Feb 2026 20:11:49 -0400
Message-ID: <18-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0026.namprd22.prod.outlook.com
 (2603:10b6:208:238::31) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY3PR12MB9629:EE_
X-MS-Office365-Filtering-Correlation-Id: 944ded5f-6066-44e1-cb71-08de6e83b145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ewGzED1BZXAcMgJG6PvAgIGn7646VQwEfYPWEc07BHEUNTHTQCFte+swsKKa?=
 =?us-ascii?Q?HklNNYKrWQsqwcsHeAOeZleByuFDxgZLvO9Vh8nVDSMmeH5gfQIGstyT5LVo?=
 =?us-ascii?Q?5x1XCBQId8LqHfv6b0rEOCDxGMirFmopChNMSz5OWMx8CD+Kaqpyh1CGh5hL?=
 =?us-ascii?Q?+H887Xol+WchK+aSftlcHs2Rv10FpQJ++mjrKiaDm4L0FzNrfCFVML0+XjV5?=
 =?us-ascii?Q?bTpwdvK0b7adn3uPI0eSoI3To8ZRUPfG6+MD/4P09DzMyj9+L0sSMuad9AwF?=
 =?us-ascii?Q?3hYewOSqpds2r9ClkrtUWd4AONQ8TPob++LzWW26YzUvH0UAUnPW3avbVWi7?=
 =?us-ascii?Q?8JYIpKxspaEsQ7wkIkARLElLlsYQOYSXFyUgnIa7tqOQ9NrGYdXMx7BBCmjR?=
 =?us-ascii?Q?jGB3dbcbTqnuICsJgfW29BvIVtFgALb+CcxZSbmW/9U2MBTHRI6PWj/XxxPW?=
 =?us-ascii?Q?cWcwoBshTpmgJvV3rmXBWSBdpDRkkfYFOKk7FX3Ruah6fcej++PN0Qo0myhB?=
 =?us-ascii?Q?ri9P4vQPJuK/L0DKya62gl8QWwF9HJ4y0fU4NWbi+NV1fbDwy+01r7VV9nCZ?=
 =?us-ascii?Q?gJPfv3Ej40kIm1UQXUCnRc4P3RtXrUAHLxdAuBo9JT3G+lAtDpCfzYGIGoRT?=
 =?us-ascii?Q?5r2IZ32MeVwZ5vo4bkQSpVH1Nri12MenpaoLWcLk8aCUBJwHu7MRIzbQQq7r?=
 =?us-ascii?Q?zf+45lxhbk88pg1ieaKfEra9SkVgnAQywtxjpJcsblfzYe9Sf6yj87WQ6r0C?=
 =?us-ascii?Q?T/uJH01sLV/ibCcRfpUS3xmbLCOj2pt9eH1OhuXQGuPi8pWYO2P4Y8TVujSZ?=
 =?us-ascii?Q?nU9CVvKxqnRScrcfFJlgY2Nf1pv2KW9XUVu72xqSUo81EH5MzvDFKFUgUCM5?=
 =?us-ascii?Q?anrG1dH52o7PIcW3eoi/yCTkzsLEgEX48rII7V6FegjTeQ9LoJLNXrEBQo9k?=
 =?us-ascii?Q?D794RKTFnsHh4J7HJrixPPbf804AMDd+MnJi4y8emot6tg74V+zRotpccLDd?=
 =?us-ascii?Q?ozMvctt29G+rS8XkKfMTJSsuAVPJRNvdHULpSsh5yslClev2+FTSTPwCx8W5?=
 =?us-ascii?Q?zFPGT11/tfxq45LM5ysbWbSaB4+eCI69rscBcy+LoNw07MsgQZO2Cw7iFEi5?=
 =?us-ascii?Q?j03YjRwe5at7kHlf70iMz/EFSfLe+LLIOVDxr/z4Eb1VBwpFtZZTcUpaGSRJ?=
 =?us-ascii?Q?cswecPkC7kKuBxvknyB3n9BFKYqVCoZc6XxSOP9W63yD1QfNHHgC1tHc2Ywl?=
 =?us-ascii?Q?hNpm06nWpCx5tIdtWTzvTa8Ql9k7iyYytDFwomS2qpWktP3qMVPOeQyx8G4V?=
 =?us-ascii?Q?w2FQmzSLY8blk3gUA0hzDNejoQNwbKRtcWpi+2J5wunZ263wsa+UTcx+zge8?=
 =?us-ascii?Q?cmqTAxIBYC7DKdzRDxbJGbQsH64kCY++9lUt1pA5uO+SMBb3JgAwnRgGy5lE?=
 =?us-ascii?Q?J9H11+wFs/4jJg9+7O0FzDnTcG2kS2Fx0IsZ6LEyar91EznOAPV9Z0v13oxv?=
 =?us-ascii?Q?QZg662q6Mk2GQkm7rxFKspQA1/a5I7/zYb2yfaR+l2Bi4HzxbFGTslyHnEL4?=
 =?us-ascii?Q?cIzK3xFSUuvXKx896Ik=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nkYb8q88vjvHD2AhO2TUImNzGX3ylfq2gZYkCoxJrrzUGxRFgYAFTD+uEwUJ?=
 =?us-ascii?Q?xOayQwkwIinvMY2o4b2JwM5nXgdpvPvSDn7rQUIpSO4ZVmKGzZEcF3UKx3cf?=
 =?us-ascii?Q?wxU8m4qE9ZqeKs45qCuS6kgyDIM2WOoZLyihQN6o9Sfpe93REuq+cIgG0ju0?=
 =?us-ascii?Q?B1Y25fasdeZt+zMHgzCnPhYfJCnUQRIAJ4j/TxSrSq/XlVg7KZKvTqEbqP9V?=
 =?us-ascii?Q?E8bhQ6qj3VrDCRNHtdhAtAvf0bMqLRMCwuE7Xs/stoObsQG8aKhsZvq2HcH2?=
 =?us-ascii?Q?EMSL8nlV6yq2QGpLqFjupJyp6P7C2y1qNxxqfrHgwj+a34BonPTluQAWAeg2?=
 =?us-ascii?Q?QYMU5KrOUNuRfqn7oOAQl70OQ9Xon+DNGVxY7jFaC72Wp1OeueKRyQx32FFi?=
 =?us-ascii?Q?pXbFgAeXgy/ONI/vxq4fapC1aOShrRGgGN4GcMu6GS41edoAA1SaxRqopsFW?=
 =?us-ascii?Q?uKK8yiLxoUEAIQsGgH/DLTYtls3lvW1gfE1n8OvmNTMwO1wiLgRAQcrTjaEo?=
 =?us-ascii?Q?UKHPUfT/rf/G/COoItve4JYkknz9CjEa0FdGhWt5ElaXSKOCsWPamun1/L/D?=
 =?us-ascii?Q?aSDBgp1pdHQsnT/Ko/Hts6beTOe3K/D9t/cB2WC5Su+e49ktNDmwYyO6k8Rg?=
 =?us-ascii?Q?jVNOBLgQ1qJYkW3geNjmTqKD7MPhvzMGl+9kHnerUVOg8VaxKwUYepBMiOYL?=
 =?us-ascii?Q?HaLkya/in5sz+F4HbaUwkgnmqc8s9wd6dBOL96J9LG0rN01n7qZcahdjwtu9?=
 =?us-ascii?Q?XgPZWjrnqLVdKW+HcjJ+DVq3ODEEnEtRWI6o8F5XYLwPzAMkaEenJ9YI93wW?=
 =?us-ascii?Q?ALyk82G6cxlJhLm6GNGwMuZ86LMMxA2ywowON6OImeZVmOr83h2nZb9JtXEW?=
 =?us-ascii?Q?DIo60N7BHfM9kmHevSIlMKFc9B+vmAWJHBwW2FObiNn4/DwSZRT/5txKzCP0?=
 =?us-ascii?Q?5KVP9SenCwMRRSEUPSAGyJisshnlPFKDQfB8b2XtgkzRLeFd2EbKTk5J2aTX?=
 =?us-ascii?Q?GNdfm4kx1MjC5XnDjvyoAQtW2AxJncV3eED0sZ+VBV750sd/cUWSkZdS9eMI?=
 =?us-ascii?Q?aONxa+VVmx4p2MZ9irjYG0QCN03l0TUbRctYp9d37Gnyi/i/vlVvZuwJUCUW?=
 =?us-ascii?Q?2Jf9hRikjJ+7qUicyHhR0uJxoYA7M3Nw9OQdoqVkXbHhvTYJ0+IIttZ5Vepd?=
 =?us-ascii?Q?9D8bTCarcOrRgeH39df1x8FuUhHufr27S/I99TpO9hIB/h0Zna8TFpIBgH76?=
 =?us-ascii?Q?uChlaitNZl5cuYEbxDLKBQ9ZSZLO+6L3pCPvNsxCWDKtIwq3Tdj1gqXhkJga?=
 =?us-ascii?Q?7G+ryzQpxMvFc04Ja9xhuYhWBR5ygRh4j1CvtVmPOAsEVkwQWs//KBihm5D2?=
 =?us-ascii?Q?bpFH6cFVSbwV1YoAVGZQOBDKITd0TeatequbZLPDWlNPc4B6Do5+SWipcQYD?=
 =?us-ascii?Q?uhULAbzwNMwjx7MZ1M8jKZO1WVo+uSdYcVpPu6pJkqSUHaGHMz4oyxij5qOf?=
 =?us-ascii?Q?N/sC5MfQdaZnr0n3cnUVGnI2Ose7Q42rSlxpibFO9WwoyLNwDGhJtJDVtpnc?=
 =?us-ascii?Q?idpC3HZCvsNCFGKRACzY6H96WMG5yg/l2l6/PX7wwACtXu5ULdPYSXhwZZJd?=
 =?us-ascii?Q?fFr/flrDJq7aNjMVPhnMyGSdVLWa40Qg4aih2p/1ZejAyEHULcxiuf5sxLvw?=
 =?us-ascii?Q?BvEZukk5KaNPEtUNQZMojf3oc+96FhYUJW53x8eTYn6AkmoyIONMyrUAUlXy?=
 =?us-ascii?Q?OKevlsYRXg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 944ded5f-6066-44e1-cb71-08de6e83b145
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:21:43.0785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iht9y1So3iUn1Kjj4vE/o8fZvB+kwYFtAfqITBZNZZm35cQm8lHiGohs+a/Ep2jr
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
X-Rspamd-Queue-Id: D57D3152394
X-Rspamd-Action: no action

This unmap function only works with SGT importers.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/accel/amdxdna/amdxdna_gem.c           |  5 +--
 drivers/accel/ivpu/ivpu_gem.c                 |  5 +--
 drivers/accel/qaic/qaic_data.c                |  2 +-
 drivers/dma-buf/dma-buf.c                     | 32 +++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  3 +-
 drivers/gpu/drm/armada/armada_gem.c           |  5 +--
 drivers/gpu/drm/drm_prime.c                   |  5 +--
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  4 +--
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  2 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  3 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |  2 +-
 drivers/gpu/drm/tegra/gem.c                   | 11 ++++---
 drivers/gpu/drm/virtio/virtgpu_prime.c        |  6 ++--
 drivers/gpu/drm/xe/xe_bo.c                    | 16 ++++++----
 drivers/iio/industrialio-buffer.c             |  4 +--
 drivers/infiniband/core/umem_dmabuf.c         |  4 +--
 .../common/videobuf2/videobuf2-dma-contig.c   |  7 ++--
 .../media/common/videobuf2/videobuf2-dma-sg.c |  3 +-
 .../platform/nvidia/tegra-vde/dmabuf-cache.c  |  5 +--
 drivers/misc/fastrpc.c                        |  4 +--
 drivers/usb/gadget/function/f_fs.c            |  2 +-
 drivers/xen/gntdev-dmabuf.c                   |  6 ++--
 include/linux/dma-buf-mapping.h               |  4 +--
 include/linux/dma-buf.h                       | 12 +++----
 io_uring/zcrx.c                               |  4 +--
 net/core/devmem.c                             |  8 ++---
 26 files changed, 88 insertions(+), 76 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index ab7610375ad761..ccc78aeeb4c0fc 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -444,7 +444,8 @@ static struct dma_buf *amdxdna_gem_prime_export(struct drm_gem_object *gobj, int
 
 static void amdxdna_imported_obj_free(struct amdxdna_gem_obj *abo)
 {
-	dma_buf_unmap_attachment_unlocked(abo->attach, abo->base.sgt, DMA_BIDIRECTIONAL);
+	dma_buf_sgt_unmap_attachment_unlocked(abo->attach, abo->base.sgt,
+					      DMA_BIDIRECTIONAL);
 	dma_buf_detach(abo->dma_buf, abo->attach);
 	dma_buf_put(abo->dma_buf);
 	drm_gem_object_release(to_gobj(abo));
@@ -629,7 +630,7 @@ amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
 	return gobj;
 
 fail_unmap:
-	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
+	dma_buf_sgt_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
 fail_detach:
 	dma_buf_detach(dma_buf, attach);
 put_buf:
diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 850dc82c7857e2..1fcb454f4cb33b 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -159,8 +159,9 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
 
 	if (bo->base.sgt) {
 		if (bo->base.base.import_attach) {
-			dma_buf_unmap_attachment(bo->base.base.import_attach,
-						 bo->base.sgt, DMA_BIDIRECTIONAL);
+			dma_buf_sgt_unmap_attachment(
+				bo->base.base.import_attach, bo->base.sgt,
+				DMA_BIDIRECTIONAL);
 		} else {
 			dma_unmap_sgtable(vdev->drm.dev, bo->base.sgt, DMA_BIDIRECTIONAL, 0);
 			sg_free_table(bo->base.sgt);
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 0a7b8b9620bf9a..8e2e597bc1ff03 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -911,7 +911,7 @@ static int qaic_prepare_bo(struct qaic_device *qdev, struct qaic_bo *bo,
 
 static void qaic_unprepare_import_bo(struct qaic_bo *bo)
 {
-	dma_buf_unmap_attachment(bo->base.import_attach, bo->sgt, bo->dir);
+	dma_buf_sgt_unmap_attachment(bo->base.import_attach, bo->sgt, bo->dir);
 	bo->sgt = NULL;
 }
 
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 73c599f84e121a..35d3bbb4bb053c 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -653,7 +653,7 @@ static struct file *dma_buf_getfile(size_t size, int flags)
  *
  * 3. Once the buffer is attached to all devices userspace can initiate DMA
  *    access to the shared buffer. In the kernel this is done by calling
- *    dma_buf_sgt_map_attachment() and dma_buf_unmap_attachment().
+ *    dma_buf_sgt_map_attachment() and dma_buf_sgt_unmap_attachment().
  *
  * 4. Once a driver is done with a shared buffer it needs to call
  *    dma_buf_detach() (after cleaning up any mappings) and then release the
@@ -868,7 +868,7 @@ dma_buf_pin_on_map(struct dma_buf_attachment *attach)
  *     - dma_buf_pin()
  *     - dma_buf_unpin()
  *     - dma_buf_sgt_map_attachment()
- *     - dma_buf_unmap_attachment()
+ *     - dma_buf_sgt_unmap_attachment()
  *     - dma_buf_vmap()
  *     - dma_buf_vunmap()
  *
@@ -886,7 +886,7 @@ dma_buf_pin_on_map(struct dma_buf_attachment *attach)
  *     - dma_buf_begin_cpu_access()
  *     - dma_buf_end_cpu_access()
  *     - dma_buf_sgt_map_attachment_unlocked()
- *     - dma_buf_unmap_attachment_unlocked()
+ *     - dma_buf_sgt_unmap_attachment_unlocked()
  *     - dma_buf_vmap_unlocked()
  *     - dma_buf_vunmap_unlocked()
  *
@@ -1132,7 +1132,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, "DMA_BUF");
  * On success, the DMA addresses and lengths in the returned scatterlist are
  * PAGE_SIZE aligned.
  *
- * A mapping must be unmapped by using dma_buf_unmap_attachment(). Note that
+ * A mapping must be unmapped by using dma_buf_sgt_unmap_attachment(). Note that
  * the underlying backing storage is pinned for as long as a mapping exists,
  * therefore users/importers should not hold onto a mapping for undue amounts of
  * time.
@@ -1244,7 +1244,7 @@ dma_buf_sgt_map_attachment_unlocked(struct dma_buf_attachment *attach,
 EXPORT_SYMBOL_NS_GPL(dma_buf_sgt_map_attachment_unlocked, "DMA_BUF");
 
 /**
- * dma_buf_unmap_attachment - unmaps and decreases usecount of the buffer;might
+ * dma_buf_sgt_unmap_attachment - unmaps and decreases usecount of the buffer;might
  * deallocate the scatterlist associated. Is a wrapper for unmap_dma_buf() of
  * dma_buf_ops.
  * @attach:	[in]	attachment to unmap buffer from
@@ -1253,9 +1253,9 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_sgt_map_attachment_unlocked, "DMA_BUF");
  *
  * This unmaps a DMA mapping for @attached obtained by dma_buf_sgt_map_attachment().
  */
-void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
-				struct sg_table *sg_table,
-				enum dma_data_direction direction)
+void dma_buf_sgt_unmap_attachment(struct dma_buf_attachment *attach,
+				  struct sg_table *sg_table,
+				  enum dma_data_direction direction)
 {
 	const struct dma_buf_mapping_sgt_exp_ops *sgt_exp_ops =
 		dma_buf_get_sgt_ops(attach);
@@ -1273,21 +1273,21 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 	if (dma_buf_pin_on_map(attach))
 		attach->dmabuf->ops->unpin(attach);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, "DMA_BUF");
+EXPORT_SYMBOL_NS_GPL(dma_buf_sgt_unmap_attachment, "DMA_BUF");
 
 /**
- * dma_buf_unmap_attachment_unlocked - unmaps and decreases usecount of the buffer;might
+ * dma_buf_sgt_unmap_attachment_unlocked - unmaps and decreases usecount of the buffer;might
  * deallocate the scatterlist associated. Is a wrapper for unmap_dma_buf() of
  * dma_buf_ops.
  * @attach:	[in]	attachment to unmap buffer from
  * @sg_table:	[in]	scatterlist info of the buffer to unmap
  * @direction:	[in]	direction of DMA transfer
  *
- * Unlocked variant of dma_buf_unmap_attachment().
+ * Unlocked variant of dma_buf_sgt_unmap_attachment().
  */
-void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
-				       struct sg_table *sg_table,
-				       enum dma_data_direction direction)
+void dma_buf_sgt_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
+					   struct sg_table *sg_table,
+					   enum dma_data_direction direction)
 {
 	might_sleep();
 
@@ -1295,10 +1295,10 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
 		return;
 
 	dma_resv_lock(attach->dmabuf->resv, NULL);
-	dma_buf_unmap_attachment(attach, sg_table, direction);
+	dma_buf_sgt_unmap_attachment(attach, sg_table, direction);
 	dma_resv_unlock(attach->dmabuf->resv);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, "DMA_BUF");
+EXPORT_SYMBOL_NS_GPL(dma_buf_sgt_unmap_attachment_unlocked, "DMA_BUF");
 
 /**
  * dma_buf_move_notify - notify attachments that DMA-buf is moving
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 6c8b2a3dde1f54..9e80212fb096ba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1036,7 +1036,8 @@ static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
 		struct dma_buf_attachment *attach;
 
 		attach = gtt->gobj->import_attach;
-		dma_buf_unmap_attachment(attach, ttm->sg, DMA_BIDIRECTIONAL);
+		dma_buf_sgt_unmap_attachment(attach, ttm->sg,
+					     DMA_BIDIRECTIONAL);
 		ttm->sg = NULL;
 	}
 
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 21b83b00b68254..dee5fef5eb4f7b 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -68,8 +68,9 @@ void armada_gem_free_object(struct drm_gem_object *obj)
 	if (dobj->obj.import_attach) {
 		/* We only ever display imported data */
 		if (dobj->sgt)
-			dma_buf_unmap_attachment_unlocked(dobj->obj.import_attach,
-							  dobj->sgt, DMA_TO_DEVICE);
+			dma_buf_sgt_unmap_attachment_unlocked(
+				dobj->obj.import_attach, dobj->sgt,
+				DMA_TO_DEVICE);
 		drm_prime_gem_destroy(&dobj->obj, NULL);
 	}
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index c1afb9e0886c4f..6f98d0c123dc8d 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -1023,7 +1023,7 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 	return obj;
 
 fail_unmap:
-	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
+	dma_buf_sgt_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
 fail_detach:
 	dma_buf_detach(dma_buf, attach);
 	dma_buf_put(dma_buf);
@@ -1121,7 +1121,8 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
 
 	attach = obj->import_attach;
 	if (sg)
-		dma_buf_unmap_attachment_unlocked(attach, sg, DMA_BIDIRECTIONAL);
+		dma_buf_sgt_unmap_attachment_unlocked(attach, sg,
+						      DMA_BIDIRECTIONAL);
 	dma_buf = attach->dmabuf;
 	dma_buf_detach(attach->dmabuf, attach);
 	/* remove the reference */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 92e2677eb5a33b..325442948fafe0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -270,8 +270,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
 static void i915_gem_object_put_pages_dmabuf(struct drm_i915_gem_object *obj,
 					     struct sg_table *sgt)
 {
-	dma_buf_unmap_attachment(obj->base.import_attach, sgt,
-				 DMA_BIDIRECTIONAL);
+	dma_buf_sgt_unmap_attachment(obj->base.import_attach, sgt,
+				     DMA_BIDIRECTIONAL);
 }
 
 static const struct drm_i915_gem_object_ops i915_gem_object_dmabuf_ops = {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 3f6f040c359db0..0b9ba60b59c5c6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -367,7 +367,7 @@ void __i915_gem_object_pages_fini(struct drm_i915_gem_object *obj)
 	atomic_set(&obj->mm.pages_pin_count, 0);
 
 	/*
-	 * dma_buf_unmap_attachment() requires reservation to be
+	 * dma_buf_sgt_unmap_attachment() requires reservation to be
 	 * locked. The imported GEM shouldn't share reservation lock
 	 * and ttm_bo_cleanup_memtype_use() shouldn't be invoked for
 	 * dma-buf, so it's safe to take the lock.
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index fcfa819caa389f..6b6d235fd3e9fd 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -307,7 +307,8 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
 		timeout = -ETIME;
 	}
 	err = timeout > 0 ? 0 : timeout;
-	dma_buf_unmap_attachment_unlocked(import_attach, st, DMA_BIDIRECTIONAL);
+	dma_buf_sgt_unmap_attachment_unlocked(import_attach, st,
+					      DMA_BIDIRECTIONAL);
 out_detach:
 	dma_buf_detach(dmabuf, import_attach);
 out_import:
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index 569ee2d3ab6f84..c549b94b2e8ad5 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -138,7 +138,7 @@ struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
 	return obj;
 
 fail_unmap:
-	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_TO_DEVICE);
+	dma_buf_sgt_unmap_attachment_unlocked(attach, sgt, DMA_TO_DEVICE);
 fail_detach:
 	dma_buf_detach(dma_buf, attach);
 	dma_buf_put(dma_buf);
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 4866d639bbb026..6b93f4d42df26c 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -163,8 +163,8 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
 static void tegra_bo_unpin(struct host1x_bo_mapping *map)
 {
 	if (map->attach) {
-		dma_buf_unmap_attachment_unlocked(map->attach, map->sgt,
-						  map->direction);
+		dma_buf_sgt_unmap_attachment_unlocked(map->attach, map->sgt,
+						      map->direction);
 		dma_buf_detach(map->attach->dmabuf, map->attach);
 	} else {
 		dma_unmap_sgtable(map->dev, map->sgt, map->direction, 0);
@@ -499,7 +499,8 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 
 detach:
 	if (!IS_ERR_OR_NULL(bo->sgt))
-		dma_buf_unmap_attachment_unlocked(attach, bo->sgt, DMA_TO_DEVICE);
+		dma_buf_sgt_unmap_attachment_unlocked(attach, bo->sgt,
+						      DMA_TO_DEVICE);
 
 	dma_buf_detach(buf, attach);
 	dma_buf_put(buf);
@@ -528,8 +529,8 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
 		tegra_bo_iommu_unmap(tegra, bo);
 
 		if (drm_gem_is_imported(gem)) {
-			dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
-							  DMA_TO_DEVICE);
+			dma_buf_sgt_unmap_attachment_unlocked(
+				gem->import_attach, bo->sgt, DMA_TO_DEVICE);
 			dma_buf_detach(gem->import_attach->dmabuf, gem->import_attach);
 		}
 	}
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 3dbc1b41052068..95582cfbd7e63f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -171,7 +171,7 @@ int virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry **ents,
 			       sizeof(struct virtio_gpu_mem_entry),
 			       GFP_KERNEL);
 	if (!(*ents)) {
-		dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
+		dma_buf_sgt_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
 		return -ENOMEM;
 	}
 
@@ -196,8 +196,8 @@ static void virtgpu_dma_buf_unmap(struct virtio_gpu_object *bo)
 		virtio_gpu_detach_object_fenced(bo);
 
 		if (bo->sgt)
-			dma_buf_unmap_attachment(attach, bo->sgt,
-						 DMA_BIDIRECTIONAL);
+			dma_buf_sgt_unmap_attachment(attach, bo->sgt,
+						     DMA_BIDIRECTIONAL);
 
 		bo->sgt = NULL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e5e716c5f33fa8..893a2023d66e60 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -752,7 +752,8 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 	    ttm_bo->sg) {
 		dma_resv_wait_timeout(ttm_bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
 				      false, MAX_SCHEDULE_TIMEOUT);
-		dma_buf_unmap_attachment(attach, ttm_bo->sg, DMA_BIDIRECTIONAL);
+		dma_buf_sgt_unmap_attachment(attach, ttm_bo->sg,
+					     DMA_BIDIRECTIONAL);
 		ttm_bo->sg = NULL;
 	}
 
@@ -760,7 +761,8 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 		goto out;
 
 	if (ttm_bo->sg) {
-		dma_buf_unmap_attachment(attach, ttm_bo->sg, DMA_BIDIRECTIONAL);
+		dma_buf_sgt_unmap_attachment(attach, ttm_bo->sg,
+					     DMA_BIDIRECTIONAL);
 		ttm_bo->sg = NULL;
 	}
 
@@ -1480,9 +1482,9 @@ int xe_bo_dma_unmap_pinned(struct xe_bo *bo)
 		struct xe_ttm_tt *xe_tt = container_of(tt, typeof(*xe_tt), ttm);
 
 		if (ttm_bo->type == ttm_bo_type_sg && ttm_bo->sg) {
-			dma_buf_unmap_attachment(ttm_bo->base.import_attach,
-						 ttm_bo->sg,
-						 DMA_BIDIRECTIONAL);
+			dma_buf_sgt_unmap_attachment(ttm_bo->base.import_attach,
+						     ttm_bo->sg,
+						     DMA_BIDIRECTIONAL);
 			ttm_bo->sg = NULL;
 			xe_tt->sg = NULL;
 		} else if (xe_tt->sg) {
@@ -1597,8 +1599,8 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 		struct xe_ttm_tt *xe_tt = container_of(ttm_bo->ttm,
 						       struct xe_ttm_tt, ttm);
 
-		dma_buf_unmap_attachment(ttm_bo->base.import_attach, ttm_bo->sg,
-					 DMA_BIDIRECTIONAL);
+		dma_buf_sgt_unmap_attachment(ttm_bo->base.import_attach,
+					     ttm_bo->sg, DMA_BIDIRECTIONAL);
 		ttm_bo->sg = NULL;
 		xe_tt->sg = NULL;
 	}
diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index 7556c3c7675c2c..973db853525958 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -1564,7 +1564,7 @@ static void iio_buffer_dmabuf_release(struct kref *ref)
 	struct iio_buffer *buffer = priv->buffer;
 	struct dma_buf *dmabuf = attach->dmabuf;
 
-	dma_buf_unmap_attachment_unlocked(attach, priv->sgt, priv->dir);
+	dma_buf_sgt_unmap_attachment_unlocked(attach, priv->sgt, priv->dir);
 
 	buffer->access->detach_dmabuf(buffer, priv->block);
 
@@ -1749,7 +1749,7 @@ static int iio_buffer_attach_dmabuf(struct iio_dev_buffer_pair *ib,
 	return 0;
 
 err_dmabuf_unmap_attachment:
-	dma_buf_unmap_attachment(attach, priv->sgt, priv->dir);
+	dma_buf_sgt_unmap_attachment(attach, priv->sgt, priv->dir);
 err_resv_unlock:
 	dma_resv_unlock(dmabuf->resv);
 err_dmabuf_detach:
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index aac9f9d12f0f8f..8401cd31763aa4 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -106,8 +106,8 @@ void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf)
 		umem_dmabuf->last_sg_trim = 0;
 	}
 
-	dma_buf_unmap_attachment(umem_dmabuf->attach, umem_dmabuf->sgt,
-				 DMA_BIDIRECTIONAL);
+	dma_buf_sgt_unmap_attachment(umem_dmabuf->attach, umem_dmabuf->sgt,
+				     DMA_BIDIRECTIONAL);
 
 	umem_dmabuf->sgt = NULL;
 }
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index de3eb4121aadb0..6c18a0b33546e8 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -717,8 +717,8 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
 	if (contig_size < buf->size) {
 		pr_err("contiguous chunk is too small %lu/%lu\n",
 		       contig_size, buf->size);
-		dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt,
-						  buf->dma_dir);
+		dma_buf_sgt_unmap_attachment_unlocked(buf->db_attach, sgt,
+						      buf->dma_dir);
 		return -EFAULT;
 	}
 
@@ -749,7 +749,8 @@ static void vb2_dc_unmap_dmabuf(void *mem_priv)
 		dma_buf_vunmap_unlocked(buf->db_attach->dmabuf, &map);
 		buf->vaddr = NULL;
 	}
-	dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt, buf->dma_dir);
+	dma_buf_sgt_unmap_attachment_unlocked(buf->db_attach, sgt,
+					      buf->dma_dir);
 
 	buf->dma_addr = 0;
 	buf->dma_sgt = NULL;
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index ed968d7e326449..a5b855f055e358 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -600,7 +600,8 @@ static void vb2_dma_sg_unmap_dmabuf(void *mem_priv)
 		dma_buf_vunmap_unlocked(buf->db_attach->dmabuf, &map);
 		buf->vaddr = NULL;
 	}
-	dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt, buf->dma_dir);
+	dma_buf_sgt_unmap_attachment_unlocked(buf->db_attach, sgt,
+					      buf->dma_dir);
 
 	buf->dma_sgt = NULL;
 }
diff --git a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
index 595b759de4f939..04ea8ffd4836c9 100644
--- a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
+++ b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
@@ -38,7 +38,8 @@ static void tegra_vde_release_entry(struct tegra_vde_cache_entry *entry)
 	if (entry->vde->domain)
 		tegra_vde_iommu_unmap(entry->vde, entry->iova);
 
-	dma_buf_unmap_attachment_unlocked(entry->a, entry->sgt, entry->dma_dir);
+	dma_buf_sgt_unmap_attachment_unlocked(entry->a, entry->sgt,
+					      entry->dma_dir);
 	dma_buf_detach(dmabuf, entry->a);
 	dma_buf_put(dmabuf);
 
@@ -152,7 +153,7 @@ int tegra_vde_dmabuf_cache_map(struct tegra_vde *vde,
 err_free:
 	kfree(entry);
 err_unmap:
-	dma_buf_unmap_attachment_unlocked(attachment, sgt, dma_dir);
+	dma_buf_sgt_unmap_attachment_unlocked(attachment, sgt, dma_dir);
 err_detach:
 	dma_buf_detach(dmabuf, attachment);
 err_unlock:
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 52abf3290a580f..a7376d4a07c73c 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -329,8 +329,8 @@ static void fastrpc_free_map(struct kref *ref)
 				return;
 			}
 		}
-		dma_buf_unmap_attachment_unlocked(map->attach, map->table,
-						  DMA_BIDIRECTIONAL);
+		dma_buf_sgt_unmap_attachment_unlocked(map->attach, map->table,
+						      DMA_BIDIRECTIONAL);
 		dma_buf_detach(map->buf, map->attach);
 		dma_buf_put(map->buf);
 	}
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index d5d4bfc390ebc6..a6adbd132669e3 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1333,7 +1333,7 @@ static void ffs_dmabuf_release(struct kref *ref)
 	struct dma_buf *dmabuf = attach->dmabuf;
 
 	pr_vdebug("FFS DMABUF release\n");
-	dma_buf_unmap_attachment_unlocked(attach, priv->sgt, priv->dir);
+	dma_buf_sgt_unmap_attachment_unlocked(attach, priv->sgt, priv->dir);
 
 	dma_buf_detach(attach->dmabuf, attach);
 	dma_buf_put(dmabuf);
diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 78125cc1aee322..927265ae7a5dc8 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -653,7 +653,7 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 fail_end_access:
 	dmabuf_imp_end_foreign_access(gntdev_dmabuf->u.imp.refs, count);
 fail_unmap:
-	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
+	dma_buf_sgt_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
 fail_detach:
 	dma_buf_detach(dma_buf, attach);
 fail_free_obj:
@@ -703,8 +703,8 @@ static int dmabuf_imp_release(struct gntdev_dmabuf_priv *priv, u32 fd)
 	attach = gntdev_dmabuf->u.imp.attach;
 
 	if (gntdev_dmabuf->u.imp.sgt)
-		dma_buf_unmap_attachment_unlocked(attach, gntdev_dmabuf->u.imp.sgt,
-						  DMA_BIDIRECTIONAL);
+		dma_buf_sgt_unmap_attachment_unlocked(
+			attach, gntdev_dmabuf->u.imp.sgt, DMA_BIDIRECTIONAL);
 	dma_buf = attach->dmabuf;
 	dma_buf_detach(attach->dmabuf, attach);
 	dma_buf_put(dma_buf);
diff --git a/include/linux/dma-buf-mapping.h b/include/linux/dma-buf-mapping.h
index daddf30d0eceae..ac859b8913edcd 100644
--- a/include/linux/dma-buf-mapping.h
+++ b/include/linux/dma-buf-mapping.h
@@ -102,7 +102,7 @@ int dma_buf_match_mapping(struct dma_buf_match_args *args,
  * When this type is matched the map/unmap functions are:
  *
  *  dma_buf_sgt_map_attachment()
- *  dma_buf_unmap_attachment()
+ *  dma_buf_sgt_unmap_attachment()
  *
  * The struct sg_table returned by those functions has only the DMA portions
  * available. The caller must not try to use the struct page * information.
@@ -175,7 +175,7 @@ struct dma_buf_mapping_sgt_exp_ops {
 	/**
 	 * @unmap_dma_buf:
 	 *
-	 * This is called by dma_buf_unmap_attachment() and should unmap and
+	 * This is called by dma_buf_sgt_unmap_attachment() and should unmap and
 	 * release the &sg_table allocated in @map_dma_buf, and it is mandatory.
 	 * For static dma_buf handling this might also unpin the backing
 	 * storage if this is the last mapping of the DMA buffer.
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 1ed50ec261022e..7fde67e1b4f459 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -476,7 +476,7 @@ struct dma_buf_attach_ops {
  * An attachment is created by calling dma_buf_attach(), and released again by
  * calling dma_buf_detach(). The DMA mapping itself needed to initiate a
  * transfer is created by dma_buf_sgt_map_attachment() and freed again by calling
- * dma_buf_unmap_attachment().
+ * dma_buf_sgt_unmap_attachment().
  */
 struct dma_buf_attachment {
 	struct dma_buf *dmabuf;
@@ -582,8 +582,8 @@ void dma_buf_put(struct dma_buf *dmabuf);
 
 struct sg_table *dma_buf_sgt_map_attachment(struct dma_buf_attachment *,
 					    enum dma_data_direction);
-void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,
-				enum dma_data_direction);
+void dma_buf_sgt_unmap_attachment(struct dma_buf_attachment *,
+				  struct sg_table *, enum dma_data_direction);
 void dma_buf_move_notify(struct dma_buf *dma_buf);
 int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 			     enum dma_data_direction dir);
@@ -592,9 +592,9 @@ int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
 struct sg_table *
 dma_buf_sgt_map_attachment_unlocked(struct dma_buf_attachment *attach,
 				    enum dma_data_direction direction);
-void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
-				       struct sg_table *sg_table,
-				       enum dma_data_direction direction);
+void dma_buf_sgt_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
+					   struct sg_table *sg_table,
+					   enum dma_data_direction direction);
 
 int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 3b8c9752208bdf..623fb97b8c5209 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -92,8 +92,8 @@ static void io_release_dmabuf(struct io_zcrx_mem *mem)
 		return;
 
 	if (mem->sgt)
-		dma_buf_unmap_attachment_unlocked(mem->attach, mem->sgt,
-						  DMA_FROM_DEVICE);
+		dma_buf_sgt_unmap_attachment_unlocked(mem->attach, mem->sgt,
+						      DMA_FROM_DEVICE);
 	if (mem->attach)
 		dma_buf_detach(mem->dmabuf, mem->attach);
 	if (mem->dmabuf)
diff --git a/net/core/devmem.c b/net/core/devmem.c
index ccdf3f70a4de9b..9a1393d144e404 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -70,8 +70,8 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
 		  size, avail))
 		gen_pool_destroy(binding->chunk_pool);
 
-	dma_buf_unmap_attachment_unlocked(binding->attachment, binding->sgt,
-					  binding->direction);
+	dma_buf_sgt_unmap_attachment_unlocked(binding->attachment, binding->sgt,
+					      binding->direction);
 	dma_buf_detach(binding->dmabuf, binding->attachment);
 	dma_buf_put(binding->dmabuf);
 	xa_destroy(&binding->bound_rxqs);
@@ -318,8 +318,8 @@ net_devmem_bind_dmabuf(struct net_device *dev,
 err_tx_vec:
 	kvfree(binding->tx_vec);
 err_unmap:
-	dma_buf_unmap_attachment_unlocked(binding->attachment, binding->sgt,
-					  direction);
+	dma_buf_sgt_unmap_attachment_unlocked(binding->attachment, binding->sgt,
+					      direction);
 err_detach:
 	dma_buf_detach(dmabuf, binding->attachment);
 err_free_binding:
-- 
2.43.0

