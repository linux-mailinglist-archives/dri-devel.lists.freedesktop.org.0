Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPK/OvvFoGnImQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 23:15:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD2E1B03F7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 23:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBF910EA09;
	Thu, 26 Feb 2026 22:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="jAK5Llk0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061BA10E97E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 20:31:28 +0000 (UTC)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QH7RIi1891443; Thu, 26 Feb 2026 12:23:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=Ipxihht3rtz9Tq9wOD86jRBR0utkMeevU4ePkGLhZLs=; b=jAK5Llk0qYpV
 CZJn6avQTWfS5A1ZnTGjr1ZjBl+rcDXhGdjiv0xfNFgNwIIYg6QFemLoLmnHwsuj
 645X5vJx2JntNTMmsF7GnqdaSI9rW99y6n9bF7GtpCEQlsxT+5X888LNcJKzCVwn
 rO1ZR0wEfCH/HqjJTdtyroRJY2ueQY5VMcADYX2KqwgUUohoPCGQ1kzPpsEfDiJX
 F/ty1gStBCHTHNwUJCnZIxLHaUIZ/ao0wDTsBQh9CYZIVP8Xk9TEolInOW3JWvbf
 WgmmMKhQGtMeuaAi28ToVQrs8hLjkP+omDS8z9xRQYgQrIXDyyj7zfrw8qI8nVjV
 hQEtrIlv7w==
Received: from maileast.thefacebook.com ([163.114.135.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4cjmp9dnms-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 26 Feb 2026 12:23:03 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 26 Feb
 2026 20:22:51 +0000
From: Matt Evans <mattev@meta.com>
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>
CC: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
 Pranjal Shrivastava <praan@google.com>, Alistair Popple
 <apopple@nvidia.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <kvm@vger.kernel.org>
Subject: [RFC PATCH 4/7] dma-buf: uapi: Mechanism to revoke DMABUFs via ioctl()
Date: Thu, 26 Feb 2026 12:22:00 -0800
Message-ID: <20260226202211.929005-5-mattev@meta.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226202211.929005-1-mattev@meta.com>
References: <20260226202211.929005-1-mattev@meta.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c0a8:1b::30]
X-Proofpoint-GUID: 3U3DcNRGCAe6_3BsET19AsMQ1cy24XLl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4NiBTYWx0ZWRfX8lmNm/Jl/UBZ
 vDCn1uiQX5OuErzlyFJYljwghvJ3HU6ZIrVIYEXf1k5ehQSurN5dCQe5oe1HtquJulGkb6YdbId
 rDNl4rvY8+rrwZ3isIymDRmTMf8F3L5LS+GE2LtTWwC2cxuV7k5QEP9M5Xhp60JlH9r4/CzwWO5
 1wQgry6CgYt3uxuLm0OuOYSJPrhh4zkPtTRRyuP/SSB2O1/ugQkmMfTSaKsO49tClVnTvqu6G5W
 S8sP0TDyDpRzUqheqWyWy0P4MGMZN9NrmwtCVHObi5Ynk25rgwohKMKrOwJNWKbAeK44VzeYmcI
 5l4B23+k6N/VN6cvHthLrkQq3V0oDpliH6J3dM9v2vNh10b/7dwtUBgkZ8m5bCR1w9P+/CNB3O9
 CKCav36FYEKKqdUMb66wJXBT/HEGpxnNPqRUmV0i3YMfdWh96QszON1j4cbgn3jwMRDf0hrcN8c
 3+IE/7pp62u5fmi9RdQ==
X-Proofpoint-ORIG-GUID: 3U3DcNRGCAe6_3BsET19AsMQ1cy24XLl
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=69a0aba7 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VabnemYjAAAA:8 a=xZTfp-UuNEzyo7XdMfQA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Mailman-Approved-At: Thu, 26 Feb 2026 22:15:13 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mattev@meta.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[meta.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9DD2E1B03F7
X-Rspamd-Action: no action

Add a new dma-buf ioctl() op, DMA_BUF_IOCTL_REVOKE, connected to a new
(optional) dma_buf_ops callback, revoke().  An exporter receiving this
will _permanently_ revoke the DMABUF, meaning it can no longer be
mapped/attached/mmap()ed.  It also guarantees that existing
importers have been detached (e.g. via move_notify) and all mappings
made inaccessible.

This is useful for lifecycle management in scenarios where a process
has created a DMABUF representing a resource, then delegated it to
a client process; access to the resource is revoked when the client is
deemed "done", and the resource can be safely re-used elsewhere.

Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/dma-buf/dma-buf.c    |  5 +++++
 include/linux/dma-buf.h      | 22 ++++++++++++++++++++++
 include/uapi/linux/dma-buf.h |  1 +
 3 files changed, 28 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index edaa9e4ee4ae..b9b315317f2d 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -561,6 +561,11 @@ static long dma_buf_ioctl(struct file *file,
 	case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
 		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
 #endif
+	case DMA_BUF_IOCTL_REVOKE:
+		if (dmabuf->ops->revoke)
+			return dmabuf->ops->revoke(dmabuf);
+		else
+			return -EINVAL;
 
 	default:
 		return -ENOTTY;
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 0bc492090237..a68c9ad7aebd 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -277,6 +277,28 @@ struct dma_buf_ops {
 
 	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
 	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
+
+	/**
+	 * @revoke:
+	 *
+	 * This callback is invoked from a userspace
+	 * DMA_BUF_IOCTL_REVOKE operation, and requests that access to
+	 * the buffer is immediately and permanently revoked.  On
+	 * successful return, the buffer is not accessible through any
+	 * mmap() or dma-buf import.  The request fails if the buffer
+	 * is pinned; otherwise, the exporter marks the buffer as
+	 * inaccessible and uses the move_notify callback to inform
+	 * importers of the change.  The buffer is permanently
+	 * disabled, and the exporter must refuse all map, mmap,
+	 * attach, etc. requests.
+	 *
+	 * Returns:
+	 *
+	 * 0 on success, or a negative error code on failure:
+	 * -ENODEV if the associated device no longer exists/is closed.
+	 * -EBADFD if the buffer has already been revoked.
+	 */
+	int (*revoke)(struct dma_buf *dmabuf);
 };
 
 /**
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index 5a6fda66d9ad..84bf2dd2d0f3 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -178,5 +178,6 @@ struct dma_buf_import_sync_file {
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
 #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
 #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
+#define DMA_BUF_IOCTL_REVOKE	_IO(DMA_BUF_BASE, 4)
 
 #endif
-- 
2.47.3

