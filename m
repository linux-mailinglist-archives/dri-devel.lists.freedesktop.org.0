Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDuBCNsDlWlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8BD15216A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3C310E2C1;
	Wed, 18 Feb 2026 00:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LuICg9gY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5E610E2C3;
 Wed, 18 Feb 2026 00:12:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpQmu8xYrtYuoshHoNfRdggBXEyd4jaNI1orIAYaOyI5NTG0NCVV4ARzGPhip2R9c1wtf3kfpuSuxBSBarXxMUOg2QQycBw3MNUkx8obVCtDO0QsBvt2RptnosgwSAzx1zNb4x0z/9k9pMlHnuBdEsZn10Xo6PbmnFJ+vjfLPXp4okdeQ5Nv0k7djob4+C3yaF4IDVBDkWV3Qd1qWYK9Pk8JmRkA0keT76KLe4+XAkZgLsLnS/ZlrAWMdiHl1qlrzdV+bVzy0VYGzAsrbRgYx9rh9WLoWLVoTphUoIWFw7WdvQeg2+3Oi3sPl2t2WBiLOY7uHh5ja5VY4Okg9k7ApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h69o3kZ/ETs7WHA10urYEvMBGO+2WPQ96De84fZ5xRk=;
 b=hARlLtChU/vEM58YCVrbxWqhiX88qi3VfUhb+3wcYy/IaWCbTc/YdS6iY3qrj5SSGx15114RD6NovkK5MnH3orJ/CI+nHvB75ThW9pbyj1ZNXo416aVu3lLtO0bEDFuOXarD0yxIjd7YuIOayqGieOtQfvcXH5TZYUXvTecZFXdkK5ht/6PNkGRMbGOKo1mxv/CUODTqWsDsZTgMPlShJqReaU2+t3Kvfy9j+qUauWbWU+YyYKuW7a9/hB+XIcK27v5t/J3Bk0mCjjgnPRX0QYF0SEjwoEdIfetG52P4lA/JGVH6IkDtkbNOoKsBIRw5g1L3iB0UiyAxGSU6M27MsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h69o3kZ/ETs7WHA10urYEvMBGO+2WPQ96De84fZ5xRk=;
 b=LuICg9gYRtFYFM9aNL9yFOzwICX2Zd93K5f+b5bS1o2m0FFd9subxCPPSKbtwLgMFXHYJRZhziJcfyQ/iTAIOtmbymHRQJd/i80fq0zvYkJiOeomD2fezRw5cRtB19l+CGL99CjU0CCljtHYv1DL8icXM1CrX6sJ5GvnfDMR9IWZ1gDvLAViOpSOqOCAw6dOu96zYzWPSQeZOrbwMREtzev96WAtwNKVxo0sFY32Na9g3JZl+x3bwLLSg3sAAGtmUlDATu5E8oX6OmhKTc6iePy20gn7uEKeOanF723JnYZWPEX2uYaY6Lo6KAQpPzUKKqFXgpS19MNIOwHPxFFg9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 00:12:01 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:01 +0000
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
Subject: [PATCH RFC 14/26] iio: buffer: convert to use the SGT mapping type
Date: Tue, 17 Feb 2026 20:11:45 -0400
Message-ID: <14-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0189.namprd13.prod.outlook.com
 (2603:10b6:208:2be::14) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 594ba1f3-9746-463b-b3f5-08de6e8255a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GuouRn3gjQPapCP0w4CV962OY+Liy0giaPxbK9f3nRdguPb2GGdgkQuZklDW?=
 =?us-ascii?Q?TKyUmQAYBTX927yNs49gMR0cnnDKsXuNlhuctVRSeRFxLOiVVF/UNmAADhyQ?=
 =?us-ascii?Q?/V5joe2bUDGZ2leXZHd58xvhkfN3ox3YRnVJjclAgsN0PV+Gh/TP8/wxXMEg?=
 =?us-ascii?Q?tnaF9cxiTHLyjam5y5S19f5Nq1r7Of1PtrphnXQHAAojehGzycKpxcPSnuP3?=
 =?us-ascii?Q?i12dGrWLp+/UfAjWa22xGDV0P7ffkfiQF21cwXhZQ9bMvbcskYOmeRDWlace?=
 =?us-ascii?Q?FUzJWfaw5Hg7iRyXaddE15K4jdCejkKQ8fWSmBlb0uIgVwccTNL1bnvEBcEx?=
 =?us-ascii?Q?FrHQzcY7KyXJlUu4tYEX/nhKtwIGfu75EASomTFbeZoWoYJBGUHhSYx5FjmD?=
 =?us-ascii?Q?l+qYoVQzjCHms2B88xIXhDsFTEyak69n4lCtjFkqkM5BJpB86Bo5Xipy9eYx?=
 =?us-ascii?Q?rR2ucxmarIlxMQG3hdX+dTYUGMCb3M6n9Bod+locwhnj3NzP/RqxE3FeLuls?=
 =?us-ascii?Q?QHI1D5FeJ3C0JHgzlega6OUwWBYMdk/hzZSodN3S2styMxy9KnY0aBANLKIR?=
 =?us-ascii?Q?FkAkjJAe1Q8H+gxoQT3aZdoWd6RzNebroy4qztnQR445mwtygdmIPnyAQw2z?=
 =?us-ascii?Q?yTpfqa0+P5kK6E7R9+lWxZQtuJ8EyFrz8zvJ+P8YAy6LFO8F3QYaP64GvSpC?=
 =?us-ascii?Q?2lfcXhO5Fk9vFRMzszRti4jeW/1T06hy3bhAfusBFczIP0+4x7hroA23oiXz?=
 =?us-ascii?Q?/wpLW2ArlyXQLIif3+0DTneBX95gtsTAp52U2GJbURkv8cHsKnA3+HItVSJ1?=
 =?us-ascii?Q?XydFPxrtE8pksTVKbrh/EzyXMld8qtD7lklngTdwTLZhMwIuNDD/b/LG1nbe?=
 =?us-ascii?Q?HnIekff48jXp64pCa+vx0oRSj7aJjHAtgAjsUF0B56rooryIJbzc09DTuYg1?=
 =?us-ascii?Q?QhRyZlg6lt2SWdcWalfBTooVRqg57GuOteuktdMXX1cY7fTC4QTCUJmJp/Gx?=
 =?us-ascii?Q?EBoHAR/0xAdoxHYouU/HboPTM2tSMuPIbItU4s9YBUM4mNxFfKL8XuThHxzQ?=
 =?us-ascii?Q?zmoiy9rJg5wp123XlcCu5vsJHPFagz1BcJQ6DmIT/LoxsdsWVcNT40QDVQfA?=
 =?us-ascii?Q?fvtZ61JJI+Jj4UdJq/VaHckicIXqGjwLDNgCS5nnXhHu9kn43esxbyk3UDM4?=
 =?us-ascii?Q?56CAkfTfq//OOSSpJ6qw0mxhcaIcmvfWS4VoL4QoQQXwGWH+X5AYi4ZmdA7T?=
 =?us-ascii?Q?UbrZVe2ojSNOK+sWVn6LvRRaAfd3+y3Cpby2MMNOuTtcmmq9P3j5q+vZ+OMW?=
 =?us-ascii?Q?ZbHR0xotR4u8R1LQW2QVmOR45hkoRzJ95Hw1zJwON3EW1JZhjpTLaTL+bJp6?=
 =?us-ascii?Q?G5b+RMRsU3Fu6ZS9cuaunkgJL72DpsFarjnV6Q1y1UkX4KvnCzxTo+77tn1V?=
 =?us-ascii?Q?7/QYVuTS4yTjpEbRammoFRFTBS6dxZ1lficXl6ieazvzZeo1stzh5L5gbP/u?=
 =?us-ascii?Q?PjmapETuiYbbAYJonE0u8y/dPWTBDb5wluxhdFfTbX4JwdyWp3QlMQKwbQwN?=
 =?us-ascii?Q?qH7jW8bW+QX5xFiX00s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vCU2K7zzl4SWp6/VskRF3Se/OiCD/cLEwL2KQEOc2HrO5JA4f/o5zJv/87Nv?=
 =?us-ascii?Q?X7zPyROV+7T7PYHtufPmIrRRfUF+Vx7t5HdHsrdiINOZ8If9S7TuWv5LBWe8?=
 =?us-ascii?Q?ze6ZsavDsxQZiCfwGXaDSCFBdnFVcIXaBuoOd66TOfU2TudFLAJXs1LJazpy?=
 =?us-ascii?Q?5A9o8e76J3KiNI59pTEaGCjnA1Peg4dGH87OqBrTigA3ZmPiRK7GdyP9P9TG?=
 =?us-ascii?Q?skpZ+Ui5S2SsvHC0I3ykZ/ozWGWgbqrmPDmt7PD6WXJbSDdSI9JHIHPygbfD?=
 =?us-ascii?Q?IrdM1qgwAp0j/ySYz5BqVw9+2z6WNAftFXTSMNu4DeraV2uaSQVqV3nssrbK?=
 =?us-ascii?Q?Nve9fi15nx4Bygj/eZdghHMedm7QshjtUdAPhdr7fWY5GlVz/Z5jz3QUc8iu?=
 =?us-ascii?Q?V+JG+PfxFwoDKGAGFiMAVxbmXnar9aK7+ipp0G5kUUG0apnddIzdPqFYWCFY?=
 =?us-ascii?Q?bguvM+EsVxcepRb55deToeAtbfHgnox5BnNoIO4MNfVu21VdFLoVbmsBw+8F?=
 =?us-ascii?Q?pEwdw8bIbnFT5nGJs49gJJHqW3dy56sRg7wcmuMPISDALVVURRUG8Cn+jLqc?=
 =?us-ascii?Q?kb7K0JOoJEArLmxs0skDiCVF7J+HagXb0WF5blOq4F8IIcErbN7qxPw8qDoi?=
 =?us-ascii?Q?TgzM/yuBhoGWw/QkYebCfNLZPVp7EcVXmW3kEjJ1TRGxrH9lPT9OtBKNz8f5?=
 =?us-ascii?Q?YX07rIIvikcaty/zETJ5hcoYZcoX/TLz38RSk+kX/uY2OOoMiLylhWsBevMv?=
 =?us-ascii?Q?A+vHYjSvBa41VNAYFOcnYJ37Z0f/txBhRZXxOIhjzDKinYh1b78nwvk5vNk8?=
 =?us-ascii?Q?v0c4EP135icv/PWehr5wqetQ6xd5+0OYkCf6jISg45MH5rhrbj4SUZ7943FJ?=
 =?us-ascii?Q?yv3yAHw8IE6rfDQhNE1fbVzhEkVewAmqFjCBlT33Tf4lVr8ZvVNn25Z6OgSb?=
 =?us-ascii?Q?TJTVtTlrL+XGZkmiRRmO2qler6kAYWBpmtCWjoIomVz+Dc1/vUfEO6hnc1x7?=
 =?us-ascii?Q?B4UhCO0p3VWyPlSmzigr7Zy39+VFfPDAMpsUZ/u0UoCCOqfhe1Z+GZe5ucfA?=
 =?us-ascii?Q?bNuv+VPGF3lnxNwB0tHtl+aYi2q1xTvMiFkdzUJxOaL5Stkh3AldfR4oHMtB?=
 =?us-ascii?Q?a1NaHaBECfBndvFxOr/l+8bEQ+Xxoe4i7S5xR2JhL8PgGtCa+iG4kwFzpoJV?=
 =?us-ascii?Q?M/S22PW0PKbMAD1igxtpVaKHMq030yMiyb8Ig+caNC1zvwDRK0iZwQUimaTK?=
 =?us-ascii?Q?HLBjrgmTo5RKJ0fD1hCVSEUH26xYo3UhWLyxY9AuECE3ifATf7PbpStxxkuG?=
 =?us-ascii?Q?IEVuo9XPAXmRArx7sXG46T+v8ZGHHc50M6RyHETzScmFiMBv8V1AHlx+vTY5?=
 =?us-ascii?Q?kB0CkirqiQuU+Y8AYN1jiqILsoA5PWGww6Lveo2JCeSzBiO34rQplKU6Ynq/?=
 =?us-ascii?Q?HVBxFYqTFtdA/uVWr5Ni/nX7Fc9QIpwZGI+sTg6NTwYkwNQPvfg+bu7bcCVY?=
 =?us-ascii?Q?pVDk5XGoy+O5ZKBnFRDf2fKSJB85erm5f1gTeQQ+7BkQE3mh+CF7l+XbnQDA?=
 =?us-ascii?Q?8UVQoqvMcUA1ZYMpUYsTQDu1L1gb6r+nYiVpbmbPIskARWKTMVf09fQgZK4G?=
 =?us-ascii?Q?kpv68iuxGdvmTAgi1e9kRVsWn60D0UcyBwGo51qtgIgOkUGfAttnPkRynGEG?=
 =?us-ascii?Q?gR7H5wEAkuiIES3WDVgzU93MJOPleLM1y4GiRnnnfFZbzTJVForTBN7mrxM8?=
 =?us-ascii?Q?ZI+kKFDJ8A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594ba1f3-9746-463b-b3f5-08de6e8255a7
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:11:59.7094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APJmaOIM3LSzvJ4GBmAux5spQuI70Az4FX1zy5g98hZo14Ur9WXk6SmovITP7w4Q
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
X-Rspamd-Queue-Id: BE8BD15216A
X-Rspamd-Action: no action

These importer helper functions should call dma_buf_sgt_dma_device() as
they are always working with SGTs.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iio/industrialio-buffer.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index c6259213e15035..7daac53c502e50 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -16,6 +16,7 @@
 #include <linux/export.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/dma-fence.h>
 #include <linux/dma-resv.h>
 #include <linux/file.h>
@@ -1642,7 +1643,7 @@ iio_buffer_find_attachment(struct iio_dev_buffer_pair *ib,
 	guard(mutex)(&buffer->dmabufs_mutex);
 
 	list_for_each_entry(priv, &buffer->dmabufs, entry) {
-		if (priv->attach->dev == dma_dev
+		if (dma_buf_sgt_dma_device(priv->attach) == dma_dev
 		    && priv->attach->dmabuf == dmabuf) {
 			attach = priv->attach;
 			break;
@@ -1727,7 +1728,7 @@ static int iio_buffer_attach_dmabuf(struct iio_dev_buffer_pair *ib,
 	 * combo. If we do, refuse to attach.
 	 */
 	list_for_each_entry(each, &buffer->dmabufs, entry) {
-		if (each->attach->dev == dma_dev
+		if (dma_buf_sgt_dma_device(each->attach) == dma_dev
 		    && each->attach->dmabuf == dmabuf) {
 			/*
 			 * We unlocked the reservation object, so going through
@@ -1781,7 +1782,7 @@ static int iio_buffer_detach_dmabuf(struct iio_dev_buffer_pair *ib,
 	guard(mutex)(&buffer->dmabufs_mutex);
 
 	list_for_each_entry(priv, &buffer->dmabufs, entry) {
-		if (priv->attach->dev == dma_dev
+		if (dma_buf_sgt_dma_device(priv->attach) == dma_dev
 		    && priv->attach->dmabuf == dmabuf) {
 			list_del(&priv->entry);
 
-- 
2.43.0

