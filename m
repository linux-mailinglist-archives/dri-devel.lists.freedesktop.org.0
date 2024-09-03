Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ED0969773
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D3610E3C2;
	Tue,  3 Sep 2024 08:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="EHIPtM9x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2048.outbound.protection.outlook.com [40.107.255.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E34E10E3C2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:41:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nle11Vm9Bod4tsd5/kHfEUXC6GsdqVIiwV/12SjavF1OizJMIw1UsXmOQJs77P7QjD2V6HTVTBtv/XWW18suphh5lkPci88FjYqZStt5SSou/cnMqPqHhsysIKlPPulB6vtY1qT53iUIgtlFTyn0Sk/25nIN21W1VYe06HuZ9D5wHsph26BFolATTlWtFMeIQfeT9TfzqX0oGKlzGX0nfCsEaauV6CUrCYwR7YjLWAlpexBKLszg6/ZWYbJBuix8x1vHR9U+KD9hdPHElgSW9NK6JxU/RqlCM1V6XNqaHU9JJn1y2MX9gGUxtgNJHg+GZ8FY3MET0YbgeKizhFwpyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2w9ISoNQ1TCRixOf5sLn0DMvJi7b12W4RPHtDUCStiw=;
 b=FS6I4mVkCTIv/nMkq4nckItnc0IWwJA266V8F51FNCNxhitHpib5wm0Erg9G7O5cHEb+SL9uHjRkdSkulmTTWq/JURbMaok8TWQNx5YQExmjtoRMg8JtHNRV2VWUV5lQJpAO2uVQb4K3XMazzoYzguJ0qqZH/qyIxsy8ZBSja+7ZQ7TBBEhV7CFDJWtN+YB7anHgOXcHIvWmBIHh/R++il9MZIGEoiBjOmsg1CBbkph4Bi0QUDBBrviZBpgGFEIKZeSbVFbVazoLvK0mEc8d2xBl2fIYlZpL36A+B8SljvyyCOJmT4RdrSmqqKDAQxPseKEts3qb6rRmQfI3k8OxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2w9ISoNQ1TCRixOf5sLn0DMvJi7b12W4RPHtDUCStiw=;
 b=EHIPtM9xQiQPONc11ouLV0nXGwx2PTMr5f+VCu68inahk2iWOisvKvo+fvOUa/+2/oTTcHOtz0DZTW1Q6ixAKbu6gBWikGVCc8NJG7/wv6vJAMTv24QYuaTiPo/HKVyX/I+SJyB38LW824XE8wg+Xh43Z9QJGophbW+ndNGZut6cxsW7or8wxZvz746smRxxprVvqFH/tkMrO+PRB2/QftICv9UFH2QKeoFTgMGHBq7tFg/Krmogat1Ypn1nUgD7JoGd47jBkmriA6VaK5xVi1PC99G9qC2x+1OG2SupEh2H6DmwoizVKPQ09IdWY/dy8iyNhlw6LQs3H5BS3SiyCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SG2PR06MB5359.apcprd06.prod.outlook.com (2603:1096:4:1d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:41:52 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:41:52 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v5 6/7] udmabuf: remove udmabuf_folio
Date: Tue,  3 Sep 2024 16:38:11 +0800
Message-ID: <20240903083818.3071759-7-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903083818.3071759-1-link@vivo.com>
References: <20240903083818.3071759-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SG2PR06MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: f25467ed-1eca-48a1-e229-08dccbf44219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D57RObyxoOlSOocTFfzsVAo0sVRHkAdZUGEtrcvwqINfk10nulEN6B3nwQxC?=
 =?us-ascii?Q?bPwx7Ub8aRMRkckYkyxkW/nxztxbb0y8Ac5ClrLZTD0U2yqdjET+v0n0m5xo?=
 =?us-ascii?Q?79lSw+S/m4m4m+4w7AXVzrsjDn/d9o9abfxYRFC6Lgan1KwhdplBQG3LMSMx?=
 =?us-ascii?Q?BPkKj1ipc+8LDvbhpUP5++CdNkMqCZM5fxscUGjrc9KJNmYW4QKLCZIfr4FJ?=
 =?us-ascii?Q?YeZlNAN0gdIKjGhGjh9edHzuQyxthtlZpZqv4EoJO7r+HaU3fzVSaGlj+dgD?=
 =?us-ascii?Q?2lfPutvlQ4oynAsymZPucNkyH4jzoW7IupBIxTqMHMl5URGDS16xVsvu0E3s?=
 =?us-ascii?Q?FmjtFp1GTAXu9LTWlYfwvp5Gf1zq5ZFGw+iJ2FGqZo0mpDjIWpPBCGu5kR6E?=
 =?us-ascii?Q?5zOBa19k4if15GEBxcZhXJE8jeVaOYaB8NIpks1qoykF6HbVRkWc6+OFkgWG?=
 =?us-ascii?Q?28h2gKb7gRwo0P7MnK0U31b/XoRgEDR+6lXbYF98GbCLbTetfZEWZEIwCHRM?=
 =?us-ascii?Q?rXpyTEGGm3HVasSOX9F5IivX2FBbf8Og/9nC2ldjxR4YZEzjXkG7prBJ2Qez?=
 =?us-ascii?Q?y76I27COeGbCHknAAAGhTYVxLnaqnfYHQ+WBXpHH7/bircakOCurobi31hz6?=
 =?us-ascii?Q?JnlHs4ZwbAiFHXNLuZVWul2kltMiuF9YhM4ircw3CZ8kIaztuEsr+f+deUOG?=
 =?us-ascii?Q?9Y85rndwFtbSU5f7zNcikfa48mi/WnUwTEl1nHWw+GAUcUcwC1hifq6UK8y7?=
 =?us-ascii?Q?/03HDJpjHEYXDWTFOXrndYwU2JdUXvw3FrYLGMHf8AfncHCTlYaK1dTSrfFm?=
 =?us-ascii?Q?cAp/66Z+7HP+WCJbn+bKZp4UOMZjfiPG9NFsEszgNbNB0kNfoiYvOQRb+IsB?=
 =?us-ascii?Q?27AuzdZiWLO5GrrZs9YD9JTHEO1xPcviyiTZoB/HpT59Cq+4tV13b/XYy/Gl?=
 =?us-ascii?Q?aQaFKpVcvnsfWKMpeXIwIAijwmPxyicvTZF7sENZ8VZMMa428uGwKjSUtzhv?=
 =?us-ascii?Q?GK29R8y6UizRGdd6Ew380jybfjCxanpEZZLqjCM3Wg7SJ12UtSjXWzUwrty8?=
 =?us-ascii?Q?ZcGqrofyAOdMCtqnvrI5l+y1UjUydZxXMudUzsMaLUKdnPeClUYdCj680bev?=
 =?us-ascii?Q?3mqVLPbbGB1FYrXVzpoQSlHBwvta7A3s1XOSdHP1GAOaYBPRa3u+Nm1mkAVl?=
 =?us-ascii?Q?Y3Afkz1gKi9PRk25f4nl/NbfUFatEt6PsctLLuk8NumArl00pmkNP5eHD8jz?=
 =?us-ascii?Q?BaWnKoGa2kXXDe7Q1pq8O0TQ1bGs1XB5+Bg8tjgVz90Dr6rsjxuIbFUWchMG?=
 =?us-ascii?Q?S2FpetkOpgjDM3K/WbsdpXSIyhAZOmntPUhTqQrDLJ8ZcizPaoLRKoaUfOTF?=
 =?us-ascii?Q?ylDdS3R85hE3V0qhWHbdNjSJfmwgPVkl5qbf73zqyyx9QW5BGQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?USTIxZZq6cMXN4G8MbZtah8/MEF8JEXQ7oQ5JR2L0h7CGDPTEGhdWgPtSn5v?=
 =?us-ascii?Q?rT0W3AavUXencKlmV3krMfmjlh3xB7NdjDb3+DcVe5gGmtjr0WGwEK+xhTsh?=
 =?us-ascii?Q?ZFnowzthTuvINnbXs8jxU6geFk8IErADWKkOIoCK2j8m3isoqrHXyM7UsMH2?=
 =?us-ascii?Q?jD4n8aORO53qUTLEpxdt6GwUWNaveom/v2RBIERDk44eRrTnNmgRvpN6JO6W?=
 =?us-ascii?Q?oKHrVnCGCE+7DBOls09pmUimH5gbfJBDcvm/NLKZ1QwU/I+r3XU9vbfLnT4N?=
 =?us-ascii?Q?ep8hWluw+5GoEuLWa5D1BrZX8n7KtczW6hqfKUOOiYCxnhyQTXq0x/xgAJuE?=
 =?us-ascii?Q?VN+aoyXqN0Rn50P+0aUnzrQuV83ezTR+VvrBtaGEy9mo0yx1c6YuJD2ipkT/?=
 =?us-ascii?Q?P0UekLHiqS652TQFVwNAIi4FnR41L23ATelgIqq5FXa4rBHM3yWU7hxMCsS0?=
 =?us-ascii?Q?KuOte5d/wtHb7mge91jD/LiSDm3D8ETp2VYs+YVR69FyjUg+9zJvfcZUfpLv?=
 =?us-ascii?Q?pnW2qHFMqLhZ5TwrisiuPwaOkz2UtCc6TotxUm4T6ovrF3sRImS7Kjqw+nqN?=
 =?us-ascii?Q?qcPlnfBPqMkIYYunDGVFV7dceRYVqW/Ki5V+TqMA/+uDzx0dp5dkofttqFSl?=
 =?us-ascii?Q?0Bou5Ome3HQI7v4r7jj+iHfbCaPfMNluOHLo2gcY8yiWIg2HjPHNkCBiGuW/?=
 =?us-ascii?Q?9NBO3KpXtoAb5mwrrYmmWaHZezE9Gj/N7DOVExcPPdMW9MHQK+6qrx6XEZBK?=
 =?us-ascii?Q?v3xFDcZ3KX8i2l/dPdecd0ziFj/80WRUl4Wg2eVpswP0PibOneD+z63KgtaZ?=
 =?us-ascii?Q?NC9Ai1jnLB0Hwk9QpmjuOvPAjIzCvqO9clMyzdD6lQxHXTvKia6zE41+wBT7?=
 =?us-ascii?Q?5G234MDqkt+kX0b7aVgH3j3q0mvLxISU56EGFKguTuy0k/PTXXXeHy93Cw1e?=
 =?us-ascii?Q?2yDtojc8QP5QR8DkgqcKaMo096+7ZAjQaqRjsaUc3jLj8yvw92eoZZcZ/37Q?=
 =?us-ascii?Q?X6z0QUYtLnwef9GrDmwYBlan7EgT5r4G2aoW6yPK0Jd3u3RMweNmLxKMSP8A?=
 =?us-ascii?Q?NJRuDU6tt2eGBj/xaqn6C+JQn8uA33OVuhZR5Ha1NSbCDqwb3V65s8b/VpFs?=
 =?us-ascii?Q?MR+bCOBFFGvHtoK58TOlWLMHwV541ODWSMGuNxx5uxJm4J120UTGay8emqMc?=
 =?us-ascii?Q?GrjIA0nSsrie70xYOMfoZuew1WvVTrMYNgAt2Q9eDhTmWPCbKuQUWnBLg0NK?=
 =?us-ascii?Q?2aTvIVyQorrZOsBhdtCtDdzoXk/e27/pMRFGHolo7hJZo1gcKE8HaAZ5gQtI?=
 =?us-ascii?Q?IjT/HWMVOFmZUuyLeRtp0ui2FwXvveh0Yt/izRC9v7Otf3fBhi4t41JQFyyU?=
 =?us-ascii?Q?ol65rESBOI4yMWAZsLqtb13ZWRc0GKW8KsfomDVtEeLbe/pFBZ4rEwWibAnz?=
 =?us-ascii?Q?IbLB9ybKc1VtDg7KKiBi6V0RSEVnw5VW2VcKXIJ1R/qG8oSrh88To0XRPQwI?=
 =?us-ascii?Q?JjEXP6flPGL1RhI4TBAJTt0WXiLM8jYrIhac0LG0ZkfR7XcExxOsH66IR+CM?=
 =?us-ascii?Q?HzQxaXDb56KMgprA+jvxfnxq8/mruRdqUxvAXxn6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25467ed-1eca-48a1-e229-08dccbf44219
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:41:52.2579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fZMt5zDK8qC+CCNcWzpx5ydeJohsc67KhGiYXZ2zH5+ISHTljGqpEum4bzih0G8TJci8uE3/83oGmoMc9wR3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5359
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
---
 drivers/dma-buf/udmabuf.c | 65 +++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 36 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 254d9ec3d9f3..d449c1fd67a5 100644
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
@@ -198,38 +204,18 @@ static void unmap_udmabuf(struct dma_buf_attachment *at,
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
@@ -238,12 +224,18 @@ static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t pgcnt)
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
@@ -353,7 +345,9 @@ static int export_udmabuf(struct udmabuf *ubuf,
 static int udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
 			      loff_t start, loff_t size)
 {
-	pgoff_t pgoff, pgcnt, upgcnt = ubuf->pagecount;
+	pgoff_t pgoff, pgcnt;
+	pgoff_t upgcnt = ubuf->pagecount;
+	pgoff_t nr_pinned = ubuf->nr_pinned;
 	u32 cur_folio, cur_pgcnt;
 	struct folio **folios = NULL;
 	long nr_folios;
@@ -377,9 +371,7 @@ static int udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
 		pgoff_t subpgoff = pgoff;
 		size_t fsize = folio_size(folios[cur_folio]);
 
-		ret = add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
-		if (ret < 0)
-			goto err;
+		ubuf->pinned_folios[nr_pinned++] = folios[cur_folio];
 
 		for (; subpgoff < fsize; subpgoff += PAGE_SIZE) {
 			ubuf->folios[upgcnt] = folios[cur_folio];
@@ -399,6 +391,7 @@ static int udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
 end:
 err:
 	ubuf->pagecount = upgcnt;
+	ubuf->nr_pinned = nr_pinned;
 	kvfree(folios);
 	return ret;
 }
-- 
2.45.2

