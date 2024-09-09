Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E70F971337
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC35510E349;
	Mon,  9 Sep 2024 09:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="NiWByeHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2047.outbound.protection.outlook.com [40.107.117.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F37810E34D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:19:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHPW++6oKlcI7COgXYAYa//6Zvr3YpM3dzsjiTmvWAm4Sth2dgolpkkmmr+7QcP/Fi5xFwUHfprArPPKxExRIGSqzec87QVlye7s1B4eG5Q5uHxO7xkE6veKwuoG7sLLjlUHABkC/aSqkEhgb7PZG8MsIf4wTbOtNL3mvOsBopsv1//iGqxOS3cU/8gOzdjyMao4KZl3cy5lpULbzT8fK4+QtTd7Zdja9qeXZTnbvtL3pAauLhNzaGESYXbBuLQirQvkxmkEliomS6LqosRUgIB7kmRJ/uFLGG0xa/iw8rndaXzU/OqqwZrkfge7zE5w6aNXGOg/PS9xtVYI0iZFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lqv0NS7+29FLPoKDiiUKJxTlVu9rHwr9umC/2I4bD1k=;
 b=s4zQ9f091/NgRtiFdYSIFToqh3R3wdIklz+/3y+UI9PWg21HbBZZIEXoEu4NX/cNYdLcRN2Fqi+ludJAAdoHWuoTm5xm+jsboy6/EVWwE65g0musiEwQPeG74LoaLsaLc7F961sXOL4Jz9AispRbIVThPxD9Lo4QxWHoHEjvXf+TSXwy2UejXlq8G9UKOb4iBeOtoS7FVNSnzK9yj9qo/onfj1TzVGTU7iaQFBIL/nROFUtJM7aa1EKGEeW6ETr0EAz7wkd6qZA0p8lgW98ZKIwv5kjCmiCYfBCu+JmKmkVNTlcxPIPciZ+w3jBjha9KJlJN6dVMLiPQkbwsW425bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lqv0NS7+29FLPoKDiiUKJxTlVu9rHwr9umC/2I4bD1k=;
 b=NiWByeHWdM//gNTqAeZKC4QenAZnl45XKyDVpFT+42HWvVJMtSkfRhlM5Eg853Alpn+XWAA4M85Dv6f96F3ZOcqBKEQGe4zkRIakYaCycAnd9HF+xOompkv9yZK4ZsDKRMVmqqXlb9uXHRjgbKWwjlYmDl2B9w/c/5LwvO3CtCnSBs1suMk+ShCyJiPPBCRnKZaX682VWudlpJJPmsmEvA4zTFFJiArvznDYgFC584C2slXoFVSWKFmGrPG7TB5r6ZPix9WqMHTT5/cBU3ewMordyf5uPY/umAQQ/db5c9ZMel8El5LX4EsTuMWCj1zrRoSSxfbIw4ECpD1yg5Hevg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYSPR06MB6292.apcprd06.prod.outlook.com (2603:1096:400:42d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 09:19:21 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 09:19:21 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v6 6/7] udmabuf: remove udmabuf_folio
Date: Mon,  9 Sep 2024 17:18:44 +0800
Message-ID: <20240909091851.1165742-7-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240909091851.1165742-1-link@vivo.com>
References: <20240909091851.1165742-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYSPR06MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ecb63a-84d9-4b05-5786-08dcd0b07cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DRS8lprmR7zShZS9JCA6ImQrzrQBQ0Mivmk1sKsagP8sUESDye9EILczyaoz?=
 =?us-ascii?Q?nrRO69LSpZkVT+NfKhHnsjCwltlT1gN4ZoYCCAg9813cR7xwetrhL4nz1p+B?=
 =?us-ascii?Q?kIV6uyKoXbaTQNIpcjJcyfHaIaTsSOa9VA28gNVDdEKVe429M52Qvip33Tsg?=
 =?us-ascii?Q?EpBbF+Dq+ZqOJoH7JShIYM8ZCdOSfbQKN/fVswI2mgpjWbOU6Swmn6Q6Ek/u?=
 =?us-ascii?Q?QmjQ6hs8ECDHjemVCCJQLU6wwEHkV1LbZ6qIk1PAiVIm3YmsLF9oxb8gl9tI?=
 =?us-ascii?Q?sz+jDoo7c5RRtAYZ8q0KdDP8T9gMfVEymCluCKSpSC9p0uA65i6opJNnCLBe?=
 =?us-ascii?Q?BBi0y2Bq3RK/eQn/Xw3aO6vRH5gbre4nzte0OU+MN0q//AmEAEhfFEFbWIfy?=
 =?us-ascii?Q?5a752XkKjNB6QeU8TGKNgQmnJd3nyFCLC6MYE/IWUxORo+Mf5IQTNi6/67dd?=
 =?us-ascii?Q?RLn00JAVzvWpAFa23JrA1+WzxRTuL0Ocez3fcaC7zH6ClA187gPMUmvQGfjM?=
 =?us-ascii?Q?32+9/X80OdomMzAh+0SNQ104NyIUiwftUeEZl765mQ/un9d7dRi5MUsp73h9?=
 =?us-ascii?Q?0urJuNwmihPi+IShwUiVCY9SiLPuSiTmxUUuh94qRrw4er3zQTBlPgy7Mhma?=
 =?us-ascii?Q?zl0+D3+lCc2wKEYT9QN5qag5EWUlFg86qeZPY04jPm5P7y9eLCTCNwngYhSE?=
 =?us-ascii?Q?GVy66LB9eYhHjy9N3Vybfwz57SxdRK6JCzTMY8NeDz8ISrX26OGtRzWSscN6?=
 =?us-ascii?Q?zUEECjVWWI6m4mhkTQz+ze488B4QZsQw6yTwc2ep0YpewoTZiYiR9PJRck0z?=
 =?us-ascii?Q?UWB4KJKKPPLAuyYMY2gC6Vk1JpswmaCH2F3yxD0CWe861hIF++Ql+JzQFwEV?=
 =?us-ascii?Q?v0uUjbF90vczEyTthGLKrNxTQsq09sANCzurmzu1lO9YsScYvAq6fWPU8GsL?=
 =?us-ascii?Q?vjRQ4ve3qlDKM7XfrGeyeejlTepmmWAZp608KqYhvQuyyfVTsAfaxaqCSXtu?=
 =?us-ascii?Q?KsER3RlUZuds6uc1Uv9H/+Ys9YXRadQB0Jxhpgc7VVyJdFmStmb+T9RKbc0s?=
 =?us-ascii?Q?G+xK7cro8kwrxhDJQzNPSKdiKrkciOQSXuy+AFRZdCXSf/m0tbx5SuqYTWSo?=
 =?us-ascii?Q?EQ26hMM27ZasCc7YWWBgL2v7LfVktJif4ZehLamtIWTjFIq5eXsUuTfs4CPT?=
 =?us-ascii?Q?lh96LpUXyxZOBYUPqCzhp6XjyWJKheWjVDqQ/0cuVCEYL50pBaMhHU/Ep7AD?=
 =?us-ascii?Q?77nMlCvfl83xXRD9VcI6auZSGo5djFWLVoFVFO2oXQxzNTbUVIjB17JFKvK9?=
 =?us-ascii?Q?ItwUeqxBNUE57e14U4vTHra1LPH1si9TFdIucO2qFKUH8LCdUOLnewN2TtS0?=
 =?us-ascii?Q?bME1Nbtav/UhNXVU05gx2K2uNTWjNpdgYQfDcUhLoJp+ck8fDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GPCiCwBU4dj/M/jdv0rwSxDmtF6q45rNxtJhbqmh06Kf/nvVGAJWuMPy9kcg?=
 =?us-ascii?Q?XkxvrdteDozrd81qJzPT5vw59ZDQpSqhzfheZI0zcWLFQ2GK9vsPZlUcOvNH?=
 =?us-ascii?Q?6wIszCMtjHCjD8B7Svuv03QZxJLjzQw6Ao22jd2EuZ0YS6vJca2ekXmmaRgb?=
 =?us-ascii?Q?uCG8NXKcOkhg8sBdc/9sxEspMOUDAAri0QBNA2jUuCYBhw1vXIMMiZ2r5aCD?=
 =?us-ascii?Q?ue9c7O6ELQT50INsRkmCuPv0y/kN5ka220ztuEwGbVehkRKZz9wb8ofvtWQX?=
 =?us-ascii?Q?RYK/RrxdgmdpqqZHK8aF+FXX34E2TIw3WjNZk/0lZUjDfnZ9shT5MJ9X7uyb?=
 =?us-ascii?Q?zbcED5x6bS4k5o3aks0l6d6oMgrhrnY7M0zVs9eEmsPH6P4IsuXnpb7ZGBHL?=
 =?us-ascii?Q?ScOHvaUYKQpq7KnHvtw8qQomEj/VfDjPtT4eeGkZwvWmKkLKh1h4apFVHF/U?=
 =?us-ascii?Q?FQC5jBKwCL5Re8xnNPP81bbvbxkB1F58AmsJx6WDc0fibn6cxAid7lO54nnY?=
 =?us-ascii?Q?W4UtP0jqrIyAM8xl+MXxTDKKqh5usqriU+ratZb56RTsbvxofjTTS3xDMtjF?=
 =?us-ascii?Q?MWPq7tRbl2nmSyRK0YdqgRRMN2I0k47GQDoMbnAgYvmujoD8uXSOMhtJtP1D?=
 =?us-ascii?Q?L5gpqFLQA/Jrulx0OD0uV+a4MGt8J/ucpt7o0Vb/vC9tlZpmW7PSKuk7zj1h?=
 =?us-ascii?Q?FmUSq6VK9E8lfaQlNeD3YcyIjmlE8mGHypar9BOSkn50BVF/j7FnquPy/7CO?=
 =?us-ascii?Q?1gRDPb79ppO5dLVchYera9rWxAk4KRY0uSk7KlBR3doHGwv8wQcbOV3HJ6BK?=
 =?us-ascii?Q?rtooyLnZqzB+dP/kltsiJs1WabY80UKn3nDy8kqt5GzgrkgGe/IWMl6i49wJ?=
 =?us-ascii?Q?Fy072ckalpYE8XmC2NWtvFY3kHGQZ4zoSHBG6ufkEWX6jqx7guxn7QL72WKu?=
 =?us-ascii?Q?/04oLUeHVXFkY0M9GMLqa7901usvrZTwxv/oKovSL1p7QOd8zAHBvrhyas3Z?=
 =?us-ascii?Q?YnAXoMN7wW2Ig2et3RgzgTskLP2StGpj0c0/sJ6lDuxiXNWTMFDC4lriIrf8?=
 =?us-ascii?Q?SQ92SfBJpMsWv8XtMtDxvvR0FtbtKq/sV769/xmB5GGLaWQEdnEpLXs0IUzN?=
 =?us-ascii?Q?VRYOSymm/plYyG6UXe2n260CpczzVOEca/RNFmddy8tX93MY/WXppsJ2gKhF?=
 =?us-ascii?Q?o9FTx2JDg8dMX+KHMmo+N2dYUdeekg/6n8qbDjcZGdMwi3ZQ9JKIKSTdF5ww?=
 =?us-ascii?Q?4yXp+dcbF+Ie5gTZGIRhoC9ra6wk9k6Nv+5dgWHr4Zdzh/wbI9oWC3AMoTkq?=
 =?us-ascii?Q?RzgvxqhHTlwbrC96ubVm18yI4F3kHzOkThD79PsuBp5Yu1zUJBgseemP3Dcj?=
 =?us-ascii?Q?518snhfVa0jnOqisFZhivX/YKeFARbQVwdXv2twQdpcSmwE0yNhL5KyGnLov?=
 =?us-ascii?Q?dE8XtiWlDj76vLw+92je7zczuoqmHJDnX5AYA2sNa0DDfCtHB14GGvlxxhzv?=
 =?us-ascii?Q?kc81G7odkBIOrfaQhcJU8iCn56wNi3fruTdqY0wvtdrQJNVN+PBbOHXVVmpv?=
 =?us-ascii?Q?y+rChK1zewgKeLkPcl2U4dBvy+eKSU59c3E/hyTb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ecb63a-84d9-4b05-5786-08dcd0b07cf8
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 09:19:21.0890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvMxfGvHMJ8MxZuN6LG6Am9ELAuF23BZEeVJY0tZcgFvFOgUMcTl5QIH14mPtl/iIF4qAhkcquuLnjAMI3Jv8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6292
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

Currently, udmabuf handles folio by creating an unpin list to record
each folio obtained from the list and unpinning them when released. To
maintain this approach, many data structures have been established.

However, maintaining this type of data structure requires a significant
amount of memory and traversing the list is a substantial overhead,
which is not friendly to the CPU cache.

Considering that during creation, we arranged the folio array in the
order of pin and set the offset according to pgcnt.

We actually don't need to use unpin_list to unpin during release.
Instead, we can iterate through the folios array during release and
unpin any folio that is different from the ones previously accessed.

By this, not only saves the overhead of the udmabuf_folio data structure
but also makes array access more cache-friendly.

Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 65 +++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 36 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index c2eda960aaaa..0e405a589ca2 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -27,15 +27,21 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is
 struct udmabuf {
 	pgoff_t pagecount;
 	struct folio **folios;
+
+	/**
+	 * Unlike folios, pinned_folios is only used for unpin.
+	 * So, nr_pinned is not the same to pagecount, the pinned_folios
+	 * only set each folio which already pinned when udmabuf_create.
+	 * Note that, since a folio may be pinned multiple times, each folio
+	 * can be added to pinned_folios multiple times, depending on how many
+	 * times the folio has been pinned when create.
+	 */
+	pgoff_t nr_pinned;
+	struct folio **pinned_folios;
+
 	struct sg_table *sg;
 	struct miscdevice *device;
 	pgoff_t *offsets;
-	struct list_head unpin_list;
-};
-
-struct udmabuf_folio {
-	struct folio *folio;
-	struct list_head list;
 };
 
 static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
@@ -196,38 +202,18 @@ static void unmap_udmabuf(struct dma_buf_attachment *at,
 	return put_sg_table(at->dev, sg, direction);
 }
 
-static void unpin_all_folios(struct list_head *unpin_list)
+static void unpin_all_folios(struct udmabuf *ubuf)
 {
-	struct udmabuf_folio *ubuf_folio;
+	pgoff_t i;
 
-	while (!list_empty(unpin_list)) {
-		ubuf_folio = list_first_entry(unpin_list,
-					      struct udmabuf_folio, list);
-		unpin_folio(ubuf_folio->folio);
+	for (i = 0; i < ubuf->nr_pinned; ++i)
+		unpin_folio(ubuf->pinned_folios[i]);
 
-		list_del(&ubuf_folio->list);
-		kfree(ubuf_folio);
-	}
-}
-
-static int add_to_unpin_list(struct list_head *unpin_list,
-			     struct folio *folio)
-{
-	struct udmabuf_folio *ubuf_folio;
-
-	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
-	if (!ubuf_folio)
-		return -ENOMEM;
-
-	ubuf_folio->folio = folio;
-	list_add_tail(&ubuf_folio->list, unpin_list);
-	return 0;
+	kvfree(ubuf->pinned_folios);
 }
 
 static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t pgcnt)
 {
-	INIT_LIST_HEAD(&ubuf->unpin_list);
-
 	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios), GFP_KERNEL);
 	if (!ubuf->folios)
 		return -ENOMEM;
@@ -236,12 +222,18 @@ static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t pgcnt)
 	if (!ubuf->offsets)
 		return -ENOMEM;
 
+	ubuf->pinned_folios = kvmalloc_array(pgcnt,
+					     sizeof(*ubuf->pinned_folios),
+					     GFP_KERNEL);
+	if (!ubuf->pinned_folios)
+		return -ENOMEM;
+
 	return 0;
 }
 
 static __always_inline void deinit_udmabuf(struct udmabuf *ubuf)
 {
-	unpin_all_folios(&ubuf->unpin_list);
+	unpin_all_folios(ubuf);
 	kvfree(ubuf->offsets);
 	kvfree(ubuf->folios);
 }
@@ -351,9 +343,11 @@ static int export_udmabuf(struct udmabuf *ubuf,
 static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
 			       loff_t start, loff_t size)
 {
-	pgoff_t pgoff, pgcnt, upgcnt = ubuf->pagecount;
+	pgoff_t nr_pinned = ubuf->nr_pinned;
+	pgoff_t upgcnt = ubuf->pagecount;
 	struct folio **folios = NULL;
 	u32 cur_folio, cur_pgcnt;
+	pgoff_t pgoff, pgcnt;
 	long nr_folios;
 	long ret = 0;
 	loff_t end;
@@ -375,9 +369,7 @@ static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
 		pgoff_t subpgoff = pgoff;
 		size_t fsize = folio_size(folios[cur_folio]);
 
-		ret = add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
-		if (ret < 0)
-			goto end;
+		ubuf->pinned_folios[nr_pinned++] = folios[cur_folio];
 
 		for (; subpgoff < fsize; subpgoff += PAGE_SIZE) {
 			ubuf->folios[upgcnt] = folios[cur_folio];
@@ -398,6 +390,7 @@ static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
 	}
 end:
 	ubuf->pagecount = upgcnt;
+	ubuf->nr_pinned = nr_pinned;
 	kvfree(folios);
 	return ret;
 }
-- 
2.45.2

