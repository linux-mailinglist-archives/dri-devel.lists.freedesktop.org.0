Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BB495B0CC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 10:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625AA10E56D;
	Thu, 22 Aug 2024 08:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="axLBeTRH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2071.outbound.protection.outlook.com [40.107.255.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFF010E662
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 08:44:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxrBc7cFz6PkPDITB9ZNCmg9jRT/ITE9ZSCjYNMFG3zUqZEgEmDdQk0e5HajHBjszKM+yZAJE9VdohlRr1SaCuIU+tJ0PPZ2BsfGGdI4NH6WS1umdMMXMXCvx5e3pJFZd4SS+ly9H0WKMIxA7SiqK/gHegNlaGn0DiJff6EAVbx76TIHDrgn0oIZmmPUKSIzulWAhA3W7Hr8IBDiMG40sunLMTCzDACec77ITkJcmsZj8BCflwezxFauSt//3pg8oUJnbV0sny3s4xTPfznBhytMPP6TxQSzWDQihNBSBr5PokjuVlR6aU5jhteTka16+hrmJ/e5qAGyhi9QRPvBig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLFgEfNid5pqAAh2hdZjcwk6nug8D9sWkT5ooDyspuk=;
 b=DF/asdkz6bZ6eXbSlfgNFZTLiuM0y8grATCV28vDcPQ6Mc4rBGqUe9BsMaYFyjYZZnvEzxz5laAePj0sP9jHlL92x7tYS0VPfmaj9kuCC1TiXLpq0ZUVgwlde+r6krkg0K9g3JAIsV50m0z1XF9F+pAXo6Jcy6srbcb6mVOGUsNkYjaYlrrGutwwoM4WXoTaKqGR3ru19UGOg+6cl1LVP2kBWUYcnUBv2vp7aY7vBSAQTMEBJY4OJ5Bp4QZ9Qq1RuXYzeHGavcLg5jGN4f196J9daFjrKTs3m4hOg9AfeLVN5Dv443fJWg4MrlI78L6FgLJrJsNUpWzKP7YFMIZ6Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLFgEfNid5pqAAh2hdZjcwk6nug8D9sWkT5ooDyspuk=;
 b=axLBeTRH21ZEYj+v/ZcLSI69/wtaxt2fmcOTOfqUg0SD3638/izS99/7pSrkGBEVzcHYYxGdQtjxaEe3FfAA0I9OwHAvp1MEXk94cFA9lhySL45/YNq+jkqq8FMe7WK3rivwy96IwaRgT75p9rXcmXRybmx+n5TK8ALG4X0yNM2Xo7v9dSaPFkTM4ys2JTI3nD8iGxiF4Xx6phBerwgZdOwDYFxN4tuU4xBOjf3+PXzZnIjcYOy3KUxq9Bh7DE3+EpSv+e+XTNgT9UR/BDqNJ/mih2toOfYoZpSMIBkGZG5XDtaJcglJJ+F1oIFtGZemGP7uzaycEZORZinxz3z1iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYZPR06MB6402.apcprd06.prod.outlook.com (2603:1096:400:425::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.27; Thu, 22 Aug
 2024 08:44:49 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%5]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 08:44:49 +0000
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v4 4/5] udmabuf: udmabuf_create codestyle cleanup
Date: Thu, 22 Aug 2024 16:43:36 +0800
Message-ID: <20240822084342.1574914-5-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822084342.1574914-1-link@vivo.com>
References: <20240822084342.1574914-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYZPR06MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 978bb938-e095-4fe6-7b85-08dcc286ae9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xh9eE7ZgaU0YOTypFPOA5RO5s0hcRZC6p1MZkbfU2Jar0/qEnR6TZjzWnNDl?=
 =?us-ascii?Q?atHCSuJFYtEeGP/VvX4m3ikiplBQ1mR1ZUqTEDf3fYjr/1cWYXBbkGZpUS4P?=
 =?us-ascii?Q?5jjMkEFdFY5ET1kvlHQ1Zi76h4a9QWqYlLeYRJO/IqyslAHEqZvTpWln7jQ4?=
 =?us-ascii?Q?Q4ed+BOJ4BS9GdtgbZ5bj92mApepwioRSU6CdFUKsSbVZgWntzEtRjcJ4QjA?=
 =?us-ascii?Q?Ac2q1PbgEzud79vCSM7V6OorS5vEPyIgK9i3ThQLf/4bBwh9402vE9VEKLLc?=
 =?us-ascii?Q?e/WpX3eI9GLcA+xjxfgdWZmvvcHwia3jabBB+8xX33sUwVqAzqSnTw4K8Mx3?=
 =?us-ascii?Q?PYuqiKLyPvP7uvVSb5DmuDyvmLsXq3uP6KUyBPQFcZAOHBdqOPQT/BMiIklI?=
 =?us-ascii?Q?aylY6wRBk5E1jKbApeAvMBpFYezmvzICYxWLqIOs3eqXExW33zgPBSmYzclI?=
 =?us-ascii?Q?mS3AbOvl0SZHmjU9UtyjU4rOB8CzB+Zsau+LsdZeV4wk7+Qy+jT2DkA1cVa7?=
 =?us-ascii?Q?cynCXJ2ZlPJCC0+D53TtDJvRCBXChNzVjlalwcIu50CxbmTbKog9F0UzngBB?=
 =?us-ascii?Q?hdYDjaq8G+UJdatW2UsAmZRbYrks/+RZ+PjStthY6lW7tFViEMbHSkXcJ4Ys?=
 =?us-ascii?Q?tzTCMHPP/m2xaBSWuFC8DgfNqTj7ngXAG7OlyWrq9c+MBwy8/xSP5UFBu/1F?=
 =?us-ascii?Q?jahUJ+4202ISnMfiC8diO+qNFZe6ZyGSQUdipqvt00FvhYULHoI59iy+Cb+8?=
 =?us-ascii?Q?autOww0cJXaVI0+6j0nUkKlmkpbMzlDGpWv85serzqLuci4LglAUpE3ukE1w?=
 =?us-ascii?Q?5lX3XZh4hNueGXyfepIbU9fXVM68eY7YVsx3EJD+rTGmc/jIiRAIAagptki5?=
 =?us-ascii?Q?fN8T3JLvJMKc2ziHLH0OUXr5BfPJBF7qn89OzW+Hp2p5T/TDvWAf8odhAa5b?=
 =?us-ascii?Q?Iv4QccfLdHFvZOta2tIJfTlzetLk3T6rlowIFmx7TrDCbCWeeMw3wnHfkBB5?=
 =?us-ascii?Q?zxuUK5POuzGLSc8ISIh/bNlea7j3YEMKPfyKzTrlxI2x9DKKj3OlsM2E3A2v?=
 =?us-ascii?Q?0orSkkeEFSB2jO+C4SVc+RF4IMS4saYTL/MKYhXA34D3iflot7XMLUA4C0M2?=
 =?us-ascii?Q?muheekALFiXQ0AjfmgMCsQ6fuDNEl7BKk5jvTU8t7CwYZq0PYHPAXndl06W5?=
 =?us-ascii?Q?0So48CfnLP/LFo28j0KhdJqrhqScxYD/AmmDfoQNhH30noyS0ddH0U3FeerK?=
 =?us-ascii?Q?6C21zurJL85vv7oF89htpxtHPw9vDuuQ297g0kI/RBy2FGJsk23EoEcHehSA?=
 =?us-ascii?Q?vnCDeDwjewlwJAd9al3icDlPH4udErV6rTJCBnRgdV6F4UaVjaUfbQ7vqDHC?=
 =?us-ascii?Q?FBcnoT40zbxMg0ijKcrtVWDA5jQmiz4eU6UtnN9RQ3j3ALHRpw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eXLg/F8rKdFDQ+nk84OczwlHJhQKeTUsIi049Gw1E3gM541QAEcBXjxeRQ3C?=
 =?us-ascii?Q?HyKW6/LznaaKJFWmO/ctgAq7rWzRZ50suqwWAMFIg0zswxXOPFPpPZqCHmyD?=
 =?us-ascii?Q?MzcuvfAj/m4Q2OuEaQOUvd43NBexEIrlX9z9z+t88jDHPewh+VltTw9+vU93?=
 =?us-ascii?Q?gGzqyncsn1Jv0a3TlLE0gMCdqgBV8FXoJApcsNNFTusESwQ5jgta3uuWU6qm?=
 =?us-ascii?Q?uvh53/si94AevI2mWlvadxyxlYTk1IhaFi4/6BdvgHee7nxfmWYDav3tceRm?=
 =?us-ascii?Q?OsazrfXnGApKVPyPd6Stz2xmvYl5sUyAE3vWZBGbTqHOMmO7gk+b+rWsOfTQ?=
 =?us-ascii?Q?WGFwALar+YGFyKyXZ3uPXGvWkNqOqaiBXuR8uey0uqHUa3fz8f1SBDR6Qx7D?=
 =?us-ascii?Q?tXDwGIz9CWZodvl+jZ4iqzfQsnTAqMoqrQSoDC7XECS0H1e49dPdIu7O9M46?=
 =?us-ascii?Q?TnLvV6c6TZpU4R4EDtYX5mmbXBaG2UHYeOYNlAuDbujQKZP3R9My61PA0ZOq?=
 =?us-ascii?Q?08PkoMdeXzoj0N7dl4WMDMBO41McZBpFMVoODMYOQgHxHPWDYiM9CEK5tAd9?=
 =?us-ascii?Q?K/xqzUcBRwOveqLO1HuiPjk14IqV5GjE5MAMllIXfOvbgo9K+a7NBNbzWVVS?=
 =?us-ascii?Q?gPThL+0stEQWXb7tbMvGsCtm4J0+thDLT0PiwsxpmdCocviGORfz35rOjrcL?=
 =?us-ascii?Q?avT80fmyjjjgC5f5aVTpDCpuPpL5j0uIxBeDs6XnHEZa08nUvUCaB3N3JUbi?=
 =?us-ascii?Q?7DDyBoyFuMNHoponV40t9zjQ3RilsRp8Wn7iDHQC+pImPU7Mj2DBfFNdhTQI?=
 =?us-ascii?Q?3nq8Dx80uyqv7d3Yey8MNTZHloQ9svVGE3MyIpRsJOqIBBHzDBD+U+ICsOYA?=
 =?us-ascii?Q?KM1q1FAKCAhJLn9/jqwd2uklcqYZq1xuUE88/aQn6HagE+y9aseRj/zH8gra?=
 =?us-ascii?Q?WSpZvut5oPRc4+REV3dEOn35tJuLQdzujW0H17I+fAU5dGh5jmal4i/UopAv?=
 =?us-ascii?Q?PyHUvfjBO5V39Thxsq6UtBw8Cr6hdXYzamKSnb7/xrZ+nAm/9bF8Gb0V4grv?=
 =?us-ascii?Q?sldoWYFOB9y9/eQ3J6k3SlwsNoxByyGaWwZH7KNaj+X2RlvdxYwdzCGj39/w?=
 =?us-ascii?Q?drGmFsCqpzdiFj2Y/hRZlBKyy31iIuR3E/O+eSKkcMtLaFhtI+7CbYRFXq+Y?=
 =?us-ascii?Q?XtHWlfsHJLzDk5woRYml2IkBPfwKiLmcjCEqv85HA8gCyuZKlIjbYVM1OYlo?=
 =?us-ascii?Q?NyD8nj+LfSRbI06HfPTBsoqX5gGQ1F4sHnHgwBqPJ4ZwRHPa6zDy9+Tsrmr4?=
 =?us-ascii?Q?Dr1wx8LIIfnuPv34kmCj/47gjFax/r1tdWIF5onnMsUP8yjxrrloQIJyOAxq?=
 =?us-ascii?Q?Xbs/RtkK+SsEYGtOhmsJzExrSDE8PSJG6My+fkBZuc3T+WQ1izteCwKHCrxb?=
 =?us-ascii?Q?zferMOmyHCcQM0yIqQ7fNzBnfqVBO+yl9CDPBI2G39bVDfuRm9h9Cfp0TywD?=
 =?us-ascii?Q?ogB2dezwLB4/54RIW32vvqlEzTQZx1KeBivCWDvAnrS+ctoN4favX3HJwYJI?=
 =?us-ascii?Q?MKxMVVigoIZAKUyrtRg2Wx42mi0mi77Lp38yOOcQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 978bb938-e095-4fe6-7b85-08dcc286ae9c
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:44:49.2046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oarDdgCnLLu1bD0YNdAgpPGtiN5V7zz7B0iUSxDUTG5R+/2H6xOuZgBM2/gEIBX9BNqLVEb6aS7vL/9feVYqYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6402
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

There are some variables in udmabuf_create that are only used inside the
loop. Therefore, there is no need to declare them outside the scope.
This patch moved it into loop.

It is difficult to understand the loop condition of the code that adds
folio to the unpin_list.

This patch move item folio pin and record into a single function, when
pinned success, the outer loop of this patch iterates through folios,
while the inner loop correctly sets the folio and corresponding offset
into the udmabuf starting from the offset. if reach to pgcnt or nr_folios,
end of loop.

If item size is huge, folios may use vmalloc to get memory, which can't
cache but return into pcp(or buddy) when vfree. So, each pin may waste
some time in folios array alloc.
This patch also reuse of folios when iter create head, just use max size
of item.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 165 +++++++++++++++++++++++---------------
 1 file changed, 101 insertions(+), 64 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 0bbc9df36c0a..eb55bb4a5fcc 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -321,17 +321,87 @@ static int export_udmabuf(struct udmabuf *ubuf,
 	return dma_buf_fd(buf, flags);
 }
 
+static int __udmabuf_pin_list_folios(struct udmabuf_create_item *item,
+				     struct udmabuf *ubuf,
+				     struct folio **folios)
+{
+	struct file *memfd = NULL;
+	pgoff_t pgoff, ipgcnt, upgcnt = ubuf->pagecount;
+	u32 cur_folio, cur_pgcnt;
+	struct folio **ubuf_folios;
+	pgoff_t *ubuf_offsets;
+	long nr_folios;
+	loff_t end, start;
+	int ret;
+
+	memfd = fget(item->memfd);
+	ret = check_memfd_seals(memfd);
+	if (ret < 0)
+		goto err;
+
+	start = item->offset;
+	ipgcnt = item->size >> PAGE_SHIFT;
+	end = start + (ipgcnt << PAGE_SHIFT) - 1;
+
+	nr_folios = memfd_pin_folios(memfd, start, end, folios, ipgcnt, &pgoff);
+	if (nr_folios <= 0) {
+		kvfree(folios);
+		ret = nr_folios ? nr_folios : -EINVAL;
+		goto err;
+	}
+
+	cur_pgcnt = 0;
+	ubuf_folios = ubuf->folios;
+	ubuf_offsets = ubuf->offsets;
+
+	for (cur_folio = 0; cur_folio < nr_folios; ++cur_folio) {
+		pgoff_t subpgoff = pgoff;
+		long fsize = folio_size(folios[cur_folio]);
+
+		ret = add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
+		if (ret < 0) {
+			kfree(folios);
+			goto err;
+		}
+
+		for (; subpgoff < fsize; subpgoff += PAGE_SIZE) {
+			ubuf->folios[upgcnt] = folios[cur_folio];
+			ubuf->offsets[upgcnt] = subpgoff;
+			++upgcnt;
+
+			if (++cur_pgcnt >= ipgcnt)
+				goto end;
+		}
+
+		/**
+		 * Only first folio in item may start from offset,
+		 * so remain folio start from 0.
+		 */
+		pgoff = 0;
+	}
+end:
+	ubuf->pagecount = upgcnt;
+	fput(memfd);
+
+	return 0;
+
+err:
+	ubuf->pagecount = upgcnt;
+	if (memfd)
+		fput(memfd);
+
+	return ret;
+}
+
 static long udmabuf_create(struct miscdevice *device,
 			   struct udmabuf_create_list *head,
 			   struct udmabuf_create_item *list)
 {
-	pgoff_t pgoff, pgcnt, pglimit, pgbuf = 0;
-	long nr_folios, ret = -EINVAL;
-	struct file *memfd = NULL;
-	struct folio **folios;
+	pgoff_t pgcnt = 0, pglimit, max_ipgcnt = 0;
+	long ret = -EINVAL;
 	struct udmabuf *ubuf;
-	u32 i, j, k, flags;
-	loff_t end;
+	struct folio **folios = NULL;
+	u32 i, flags;
 
 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
 	if (!ubuf)
@@ -340,82 +410,50 @@ static long udmabuf_create(struct miscdevice *device,
 	INIT_LIST_HEAD(&ubuf->unpin_list);
 	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
-		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
+		pgoff_t itempgcnt;
+
+		if (!PAGE_ALIGNED(list[i].offset))
 			goto err;
-		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
+		if (!PAGE_ALIGNED(list[i].size))
 			goto err;
-		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
-		if (ubuf->pagecount > pglimit)
+
+		itempgcnt = list[i].size >> PAGE_SHIFT;
+		pgcnt += itempgcnt;
+
+		if (pgcnt > pglimit)
 			goto err;
+
+		max_ipgcnt = max_t(unsigned long, itempgcnt, max_ipgcnt);
 	}
 
-	if (!ubuf->pagecount)
+	if (!pgcnt)
 		goto err;
 
-	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
+	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
 				      GFP_KERNEL);
 	if (!ubuf->folios) {
 		ret = -ENOMEM;
 		goto err;
 	}
-	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
-				 GFP_KERNEL);
+
+	ubuf->offsets = kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
 	if (!ubuf->offsets) {
 		ret = -ENOMEM;
 		goto err;
 	}
 
-	pgbuf = 0;
-	for (i = 0; i < head->count; i++) {
-		memfd = fget(list[i].memfd);
-		ret = check_memfd_seals(memfd);
-		if (ret < 0)
-			goto err;
-
-		pgcnt = list[i].size >> PAGE_SHIFT;
-		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
-		if (!folios) {
-			ret = -ENOMEM;
-			goto err;
-		}
+	folios = kvmalloc_array(max_ipgcnt, sizeof(*folios), GFP_KERNEL);
+	if (!folios) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
-		end = list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
-		ret = memfd_pin_folios(memfd, list[i].offset, end,
-				       folios, pgcnt, &pgoff);
-		if (ret <= 0) {
-			kvfree(folios);
-			if (!ret)
-				ret = -EINVAL;
+	for (i = 0; i < head->count; i++) {
+		ret = __udmabuf_pin_list_folios(&list[i], ubuf, folios);
+		if (ret)
 			goto err;
-		}
-
-		nr_folios = ret;
-		pgoff >>= PAGE_SHIFT;
-		for (j = 0, k = 0; j < pgcnt; j++) {
-			ubuf->folios[pgbuf] = folios[k];
-			ubuf->offsets[pgbuf] = pgoff << PAGE_SHIFT;
-
-			if (j == 0 || ubuf->folios[pgbuf-1] != folios[k]) {
-				ret = add_to_unpin_list(&ubuf->unpin_list,
-							folios[k]);
-				if (ret < 0) {
-					kfree(folios);
-					goto err;
-				}
-			}
-
-			pgbuf++;
-			if (++pgoff == folio_nr_pages(folios[k])) {
-				pgoff = 0;
-				if (++k == nr_folios)
-					break;
-			}
-		}
-
-		kvfree(folios);
-		fput(memfd);
-		memfd = NULL;
 	}
+	kvfree(folios);
 
 	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
 	ret = export_udmabuf(ubuf, device, flags);
@@ -425,9 +463,8 @@ static long udmabuf_create(struct miscdevice *device,
 	return ret;
 
 err:
-	if (memfd)
-		fput(memfd);
 	unpin_all_folios(&ubuf->unpin_list);
+	kvfree(folios);
 	kvfree(ubuf->offsets);
 	kvfree(ubuf->folios);
 	kfree(ubuf);
-- 
2.45.2

