Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC44BDAA3E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 18:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E578110E65E;
	Tue, 14 Oct 2025 16:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=unisoc.com header.i=@unisoc.com header.b="a4Y5H+f5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381BD10E581
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:13:27 +0000 (UTC)
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
 by SHSQR01.spreadtrum.com with ESMTP id 59E8ZxsP003990
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 16:35:59 +0800 (+08)
 (envelope-from zhaoyang.huang@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 59E8WfXa085643;
 Tue, 14 Oct 2025 16:32:41 +0800 (+08)
 (envelope-from zhaoyang.huang@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX01.spreadtrum.com [10.0.64.7])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4cm6pz4wdzz2Nc5jJ;
 Tue, 14 Oct 2025 16:30:19 +0800 (CST)
Received: from bj03382pcu03.spreadtrum.com (10.0.73.40) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Tue, 14 Oct 2025 16:32:38 +0800
From: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
 <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Mel Gorman
 <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>,
 Zhaoyang Huang <huangzhaoyang@gmail.com>, <steve.kang@unisoc.com>
Subject: [PATCH 0/2] optimization of dma-buf system_heap allocation
Date: Tue, 14 Oct 2025 16:32:28 +0800
Message-ID: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.73.40]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL: SHSQR01.spreadtrum.com 59E8WfXa085643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
 s=default; t=1760430772;
 bh=jHNbOSkAKxEmrSis/ca++e1CL7eRGk9nY48IkitfWL0=;
 h=From:To:Subject:Date;
 b=a4Y5H+f5gs9OCSDBq5C514+UWWtOCiAX3I0FjR3BiI8uaOItTC9h6bTMGdI6XPKWK
 2E8qo7NI4ZSakzlCNUAGhcF707/K58wB9x5Fiej2In1Ifa922vtKbABLHqsDPdBTlg
 +0DIqOHIdVDGSfhGpP3dUfOeaZHVKbS9BtL35hz6J3bl9/x5v78poNS84MfTlQNFpN
 Eg3/cRlrBHyUeqTgzkbNsfcRAsDhhVVnscxN0X1NjeaQeQsIbeYV9BS+bbIUf39WBa
 MkPVD6C+zFUFIqHCavBPmuwvwEmKmMzuihbIrySnlHvoYNTSt2yuvRuPM0ysqYM2SP
 rDY6UoMvEygsw==
X-Mailman-Approved-At: Tue, 14 Oct 2025 16:36:49 +0000
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

From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>

This series of patches would like to introduce alloc_pages_bulk_list in
dma-buf which need to call back the API for page allocation.

Zhaoyang Huang (2):
  mm: call back alloc_pages_bulk_list since it is useful
  driver: dma-buf: use alloc_pages_bulk_list for order-0 allocation

 drivers/dma-buf/heaps/system_heap.c | 33 +++++++++++++++---------
 include/linux/gfp.h                 |  9 +++++--
 mm/mempolicy.c                      | 14 +++++------
 mm/page_alloc.c                     | 39 ++++++++++++++++++++---------
 4 files changed, 62 insertions(+), 33 deletions(-)

-- 
2.25.1

