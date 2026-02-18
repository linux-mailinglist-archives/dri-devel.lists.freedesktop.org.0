Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEygCN8DlWlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85E3152189
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A598410E535;
	Wed, 18 Feb 2026 00:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uo5kweA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012004.outbound.protection.outlook.com [52.101.48.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2585510E160;
 Wed, 18 Feb 2026 00:12:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMa/uXALGiBG5J+NjcyLUBDUP/BE86AIXiThTmR1SdN8s7M41IFf7qkgVTH5AHZ5SFQOBSwM4zMrifTfn1kEA6zh2TxW3rf5aj8Bq4NvBLobQlcyKqi3EPySctSarmuZ4hqUTh42n7zelT7BEydRfhN8O+MOHavADz3kenK0155vZpntb6Sf1U9unGMOSkLBV1NaisS3nb6AKlGlHwQWA/Udc1ft1WmgIG+MI2bIl16jXKPtGjwl3ccLBK882MMCp6l+hrbjTBsVZmN7FX9ut0iOFQlVaL5bLIiTsA6U5NnCcPb6QlcijF4ATBH+pFrmreEu532PM/0BYqcHc0jbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwLoHolKWf+XyYH3NGSHyt3ff+ukpheV8pGOGnak2z4=;
 b=CTEiuQfibOfuMlVASnE1EeVtavDbQrBw/CZBDoabZfONc3503oG1ZwCckpjKpS8ovpZY95MKE6pfnjbHIRGV1BBgOGAZDcHDjKxGPh/gQ40mBnbIuN0WRPGQ7Xa9ei29y25wBzg1TRT+fU+PS7xFrSnCgGod3VqchUqlQvOEbQHccN+9JyCJ1MLkD9OLp8YCVoGLV+7OzpzXfw70UxmHKwqlWGdzS6IXjE1oAlV+Sv/sKiybWDY8Qapkm+laYaYyeNToYI6lVWsyFdB9E6Fn5vD64OCCJjuIz/I/MUzQsp+o+fOtarCpMDUc+LiuRMIeg1HAJlLnrsn42J3rybdy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwLoHolKWf+XyYH3NGSHyt3ff+ukpheV8pGOGnak2z4=;
 b=uo5kweA+C26aXqj46Btvx27kmoVK3bYR3RJCWtDCqdqKB+gdnCZ4CCausywI7S9KqlxgC47HhnFt8MMFmgZFpQzi74+ojiFiIJAoPbMTu0DVCNSzEHRh2eDvDhnRBYr9pcvGgMkDNdWeGE18i6zGOgkgWNg/7wuxzvcaZ5AMSAGBkTL8ayImI18H+wAxyPHxoJxrj97MuHPJTXGpLJCSnfSAvVUWTGHDLc2g7ZnctbaJ9QODFtOoPcht/P0bFQi9H9+FWnD845thsSAyJG+dybQlbRu1fcICJM02IZLTEXKlEO0IFWHfU2yrkqo511tybD7boyvu/7Og0RP5DcAS0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 00:11:59 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:11:59 +0000
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
Subject: [PATCH RFC 05/26] dma-buf: Allow single exporter drivers to avoid the
 match_mapping function
Date: Tue, 17 Feb 2026 20:11:36 -0400
Message-ID: <5-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0239.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::34) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: c082e0fe-2826-4758-1f9b-08de6e825511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OkyMx8WM5UFoH1S3H6TKsIh3QFwVv7tiH/vRzlcKXySqizfbKGAasyFNJAXr?=
 =?us-ascii?Q?Hs4iDs8sHxC+oT0fA1C3q4E4uChJigQhckdJnPaLS4YIgBzaXmBP5eF1QIzo?=
 =?us-ascii?Q?y4DhCz+YWMMTkwDchjD7ZOs52Vw/ezvQZG0TNY0XJWlHGgrwvu4q6FUbE+bV?=
 =?us-ascii?Q?TF1AMGVwuacGcYeFHYCaXP+ZQ7cdkOIm4hIo3GM4mq1flpvsmNJYPDhbgl15?=
 =?us-ascii?Q?IghDuzTs8ELWJoEmXiG5VwVsrgk/MusVw8iHwRKavygds0D8edxKc6isaSYL?=
 =?us-ascii?Q?6wRxQCHcbuG5CBOPe5+bfMnAHF0CFS/APgcgNFMLIznA70mHe6zdR1C3tzzg?=
 =?us-ascii?Q?o8kngOliBJfHZ1Vt/Z32WfniDWn3EzW32C/CLvtbQ8X3006q461HpyqSFhM8?=
 =?us-ascii?Q?Q+jhHpzX84ceYtvrFVLwuX1j59mvGgpyHppMNBJwbXobyEFMHZ26z5LNEwDb?=
 =?us-ascii?Q?A/CJjw5WtRYNcm7kUws9/aWQsinCkrdcYYwzPJmZX/ClNn6Wzc1aII4NEPgh?=
 =?us-ascii?Q?SfTTtAnmawCoMwSCFkmre96/sNaU2RXzbSJ0sHkaKQt2+KuPuTRuMRXhzZMy?=
 =?us-ascii?Q?u7uUw4CzogvONgu/NZUgZOGpBcENsWfFMu9xO86gwH6cBu8LKv2/kEDS8pzH?=
 =?us-ascii?Q?CJeQrCPlq3F81s5860xgC5PXpFeypGowJ9+C9LYFy566usvp7u8JGuvmDTcI?=
 =?us-ascii?Q?cqQNk55L1qUzAN5X+XBpj12egX6LAfgYyLjxZZQjp8usenCbO62QrhOm+pvR?=
 =?us-ascii?Q?Wgv7Z9J8gA/TITfYkAeX6L4TD2qIqYlAlCaPMJHikR9n/voXMOU/glyFoZ07?=
 =?us-ascii?Q?6areUDHuc2nRREGlOZMBW138qCiPHNciELm/gzbAGup7NjynFE8ByvxtB9qC?=
 =?us-ascii?Q?JAXqxEUvM9oYgENJp+dKO+AUt/lM7dTPxt6MnwLem9YFRjnvXhrjQERpNYOz?=
 =?us-ascii?Q?qf8wHvuuu+Rmf0MGYVwyzEvEzZVKTOAyWHTzmV6E4hYVZxYWV+zK55WSp+91?=
 =?us-ascii?Q?THqC6I1emrpyvkewaE9RDMYkX8s0dOE5KVF6YI3JpKSJS3eVwPa8RfMhATob?=
 =?us-ascii?Q?x46Jb3T6roqhkOlEupQj5OvhYwBopTjUV0/eN2lFXMRufMh4OFbJYfdTsQ/v?=
 =?us-ascii?Q?VLmaWRelves6S5S0qgshxumTUhAuob2mH3pn8MsXsgGwv5CXBUX71FElMX9p?=
 =?us-ascii?Q?Wz28vte6TZEQpG2/3wzdvuXBDELrjS3i7InHzivefnArK5mzvVs5DoiZhaim?=
 =?us-ascii?Q?Fo85EdsgLKuUNHc9c0pYUwx+HNfY8OkVl2+CZxozR5nDFf4o/gBCQvrK0JI6?=
 =?us-ascii?Q?c5Glnx4PlYQzOz7yv5g+CriN0X7SaWDKVbMJwavdA/H4o+TRiXjLi6E6FepQ?=
 =?us-ascii?Q?eu7XMWEx1BF4HnGg9xZ0TYtiKfRym5zB6WxHjYgQ94e2MBH6T82VBJWr1VAx?=
 =?us-ascii?Q?6poqCxEgyYDNwjlKPyBJ17Pi50sFXb5Rf7L2r2BrARzVp2r656SCY3RDgKUr?=
 =?us-ascii?Q?bzekAfzKr5iCfq/9SQhjDaufsFwyTqrDR+CSlgCqobgR0e8Vgk+Fpmx7fZzI?=
 =?us-ascii?Q?zy0o/rlHVFuK9FiZ7eI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uAw3Vi3lJd2XQW/G+hE7W+pFRv4Nn0NpwkUicKB2wRjSSqyI5qaYZlsJTvgi?=
 =?us-ascii?Q?O0loA7DOFXdSLSEh4xojkgNn5mUtUROt0Xl0v9acG54vK00H9/HTb2yAYwyo?=
 =?us-ascii?Q?GsK8SY/Nn6bCQiSc+UeUZFsw6MIwgX8B/XzVoAYnFa1kMp2NtXjFttEddRcs?=
 =?us-ascii?Q?tTIgJb8hVU0qKbw5n0h5ya0X7/9YFbW63B9Ot/mpV0h6/QBBpmrX4a/Ge88e?=
 =?us-ascii?Q?8V3xG0iDVMUNARJywK2jM5si9dudxYMyhf+nPuxVdyS7b15Psw2hpKpJkZx7?=
 =?us-ascii?Q?VA5MeljdCwRE5HaNlX7K3GCzwqK49iYz+2en6/l4cpRvvl76Xhu4rCiB13tN?=
 =?us-ascii?Q?iPeJdI7PmWlaeq68sDKXLvukpP1LqNv187p7teS1K1bjNp6OXYnYozparqY6?=
 =?us-ascii?Q?cuaNQKnvOtENrc9wbrRDAGzU7nJClVtjnIbf+5KX7Ue5KWDNmvIe8y6V5dhp?=
 =?us-ascii?Q?6irdAzWTaqc0VVBzgx9eHUiZ+K30PH7QSqUz64r6Y31MPPv9gcwL/zJmpYxX?=
 =?us-ascii?Q?y4pNAR6ktrm3SSrqLQQ46mGriHdTriA/V0Ak+jgmVJAgMIl9G5Y/HcnHRMFU?=
 =?us-ascii?Q?zSA5Kwxkefy8MgNeUq4fkRxg+ebaRkQDvBYuL2q7YRMLWQigQQxIuykxhUzs?=
 =?us-ascii?Q?NdE15DrkbZ6UxbnR9Y5Uy6t6K3lfVy5JcS3odV44rn2sgWL6zdiAK4l0CQso?=
 =?us-ascii?Q?c6WoAuklVBYdbpdybIfKcB1CFUgH1RlpietuPGT5KN3z/avgH9hOGgA2mvVa?=
 =?us-ascii?Q?pIRwWAnklUfs+PKuKAuPKXyGJDED+05jd0hOD7joBj0ZR7OuAwNkrndeOL+6?=
 =?us-ascii?Q?IkD8BKfYaFrTcgsJ7qpjT11OywfDURkvqHdsI1fU7VHBN+HVBEcms6OGgGr+?=
 =?us-ascii?Q?9QwqFPtMpanclPUo0i3ufI8ovsxeydIvmcnF4Sh0V+4T/MDBtpDIQs+E/Wjo?=
 =?us-ascii?Q?P5KqtGIGts4dTxwoxZme0Z2eZ7D8g4Fh4QgYgOpW/zmkkhGpKMV2xd8EZUTX?=
 =?us-ascii?Q?bczxyFtn1b95tP2ZV2Jq8H49yRkwtR1/3S6oFSg5hWwpOMNpO0QgIm8zuMyO?=
 =?us-ascii?Q?xSb6n3sM8ecQEDVuFcYHE/00Ez9CiD9F8Rjfw8jKnlKTuXPkmq+cP3P1GWSa?=
 =?us-ascii?Q?m1SQ4Vp44BTAhy6dGrVTSOP0ksWX9QcBy+YYp9cwTQ/clx+Oy8q1Zwxqp3mv?=
 =?us-ascii?Q?xW+sKTXJGWWxvFYxcsfPDc+TcFzLNhlrgM9wU73NmUYPoJCXIL5BWSUGd6KB?=
 =?us-ascii?Q?Rk0mpKQvuWnfet1W1OdX9JBbax+kKht796PdoHe2Use85sQihqIBW/46KdT2?=
 =?us-ascii?Q?aWRZTN6V3E8IPJQRs8cHxovJwV6nUjc1NaDXIxMep3Qd/s8vDrP6dWHpfGjY?=
 =?us-ascii?Q?y0scuv1H6FN67sMn41jdY9VEtUwL2/lTm3UATAI6uyxaHmj2ZpvJFDzaT+PJ?=
 =?us-ascii?Q?8Pz37akJoqqddNiK/wik8ZWsrXoNS1Hu8TQEjh4DtpCJBd2kfvMNsVRSwADX?=
 =?us-ascii?Q?k/jLBzSkkgMAPwYRCUlobYkqPI43Ru9eYucJNmLzMuh1h6jQEFnveY6CX7u/?=
 =?us-ascii?Q?PoTt8R/b0tPMl8f4USWNpoZB6lU6m3L7nq04c+/UrEXKZzl4/+5KQ5YPlPVz?=
 =?us-ascii?Q?hIEG9qwtzF1KaDggn1O/sy8vEubAzIBVyKqZi1v+OmUXh1PkjJ38kiFvqZVD?=
 =?us-ascii?Q?GWcZGo+wBh+unPKUPeno3rBhrKm3vL1ApT245IJSLsqGjMOu1cQjvbZTvXRi?=
 =?us-ascii?Q?Ic7NMU6wqg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c082e0fe-2826-4758-1f9b-08de6e825511
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:11:58.7839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KILkjEZxcIYFNwpfD+krzJYj47Zn0faGqjUzFekFNK3K/ptLYbwtbwWEAKXBveIV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8421
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
X-Rspamd-Queue-Id: C85E3152189
X-Rspamd-Action: no action

Introduce single_exporter_match into the dma_buf_ops so that single
exporter drivers can simply set it using a static initializer to use the
mapping type APIs. Provide a helper macro DMA_BUF_SIMPLE_SGT_EXP_MATCH()
that generates the initializer for simple drivers that don't use P2P.

More complex exporters, especially those with P2P, need to implement the
match_mapping call back to extract things like their DMA struct device
from the dma_buf in order to do the P2P calculations.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/dma-buf.c       | 14 +++++++++++---
 include/linux/dma-buf-mapping.h | 15 +++++++++++++++
 include/linux/dma-buf.h         |  9 +++++++++
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 4211ae2b462bdd..ac755f358dc7b3 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -693,10 +693,14 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 		    || !exp_info->ops->release))
 		return ERR_PTR(-EINVAL);
 
-	if (exp_info->ops->match_mapping) {
+	if (exp_info->ops->match_mapping ||
+	    exp_info->ops->single_exporter_match) {
 		if (WARN_ON(exp_info->ops->map_dma_buf ||
 			    exp_info->ops->unmap_dma_buf))
 			return ERR_PTR(-EINVAL);
+		if (WARN_ON(exp_info->ops->match_mapping &&
+			    exp_info->ops->single_exporter_match))
+			return ERR_PTR(-EINVAL);
 	} else {
 		if (WARN_ON(!exp_info->ops->map_dma_buf ||
 			    !exp_info->ops->unmap_dma_buf))
@@ -977,8 +981,12 @@ struct dma_buf_attachment *dma_buf_mapping_attach(
 		if (ret)
 			goto err_attach;
 	} else {
-		ret = dma_buf_match_mapping(&match_args,
-					    &dma_buf_sgt_exp_compat_match, 1);
+		const struct dma_buf_mapping_match *exp_match =
+			dmabuf->ops->single_exporter_match;
+
+		if (!exp_match)
+			exp_match = &dma_buf_sgt_exp_compat_match;
+		ret = dma_buf_match_mapping(&match_args, exp_match, 1);
 		if (ret)
 			goto err_attach;
 	}
diff --git a/include/linux/dma-buf-mapping.h b/include/linux/dma-buf-mapping.h
index 360a7fe0b098be..c11e32ef2a684f 100644
--- a/include/linux/dma-buf-mapping.h
+++ b/include/linux/dma-buf-mapping.h
@@ -191,4 +191,19 @@ DMA_BUF_EMAPPING_SGT_P2P(const struct dma_buf_mapping_sgt_exp_ops *exp_ops,
 
 extern const struct dma_buf_mapping_match dma_buf_sgt_exp_compat_match;
 
+/*
+ * dma_buf_ops initializer helper for simple drivers that use a single
+ * SGT map/unmap operation without P2P.
+ */
+#define DMA_BUF_SIMPLE_SGT_EXP_MATCH(_map, _unmap)                       \
+	.single_exporter_match = &((const struct dma_buf_mapping_match){ \
+		.type = &dma_buf_mapping_sgt_type,                       \
+		.exp_ops = &((const struct dma_buf_mapping_sgt_exp_ops){ \
+			.map_dma_buf = _map,                             \
+			.unmap_dma_buf = _unmap,                         \
+		}.ops),                                                  \
+		.sgt_data = {                                            \
+			.exporter_requires_p2p = DMA_SGT_NO_P2P,         \
+		} })
+
 #endif
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 14d556bb022862..a8cfbbafbe31fe 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -317,6 +317,15 @@ struct dma_buf_ops {
 	 * struct dma_buf_mapping_match[] and call dma_buf_match_mapping().
 	 */
 	int (*match_mapping)(struct dma_buf_match_args *args);
+
+	/**
+	 * @single_exporter_match:
+	 *
+	 * Should only be set by the DMA_BUF_SIMPLE_*_EXP_MATCH() helper macros.
+	 * Exactly one of @match_mapping or @single_exporter_match must be
+	 * provided.
+	 */
+	const struct dma_buf_mapping_match *single_exporter_match;
 };
 
 /**
-- 
2.43.0

