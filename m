Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58CB8424CB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 13:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05224113052;
	Tue, 30 Jan 2024 12:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7474D11304F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 12:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1706617427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+n8ItVGKEntF1q4atKJJA2NJbdTS+Zf0wFw3L1mGo3s=;
 b=Lv6jdOaQdchyQWN4DHxAvoCnvj0/mzDrE8k+Dr5pJcsLTiEG+reSL3O6QPCwhLeaDszKCu
 cRzpOCW4TQFqmEXaAJ1pHsu1AjJNjx6+Ip6LyAVCeCT9jhrt/vkvzf4TFcfPZVANebtntU
 EjtFP7R0OwxikAVSeQNnRvnGl431PHg=
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v6 0/4] usb: gadget: functionfs: DMABUF import interface
Date: Tue, 30 Jan 2024 13:23:36 +0100
Message-ID: <20240130122340.54813-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is the v6 of my patchset that adds a new DMABUF import interface to
FunctionFS.

Given that the cache coherency issue that has been discussed after my
v5 is a tangential problem and not directly related to this new
interface, I decided to drop the dma_buf_begin/end_access() functions
for now - but I'm open to the idea of re-introducing them in a
subsequent patchset.

The patchset was rebased on next-20240129.

Cheers,
-Paul

---
Changelog:
* Drop v5's patches [1/6] and [2/6].
* [3/4]: 
  - Drop use of dma_buf_begin/end_access(). We now make the assumption
    that the devices attached to the DMABUFs must be coherent between
    themselves. The cache coherency issue is a tangential problem, and
    those functions can be re-introduced in a subsequent patchset.
  - Unqueue pending requests on detach. Otherwise, when closing the data
    endpoint the DMABUF will never be signaled.
  - Use list_for_each_entry_safe() in ffs_dmabuf_detach(), because there
    is a list_del() in there.
  - use pr_vdebug() instead of pr_debug()
  - Rename ffs_dmabuf_unmap_work() -> ffs_dmabuf_cleanup()

---
Paul Cercueil (4):
  usb: gadget: Support already-mapped DMA SGs
  usb: gadget: functionfs: Factorize wait-for-endpoint code
  usb: gadget: functionfs: Add DMABUF import interface
  Documentation: usb: Document FunctionFS DMABUF API

 Documentation/usb/functionfs.rst    |  36 ++
 drivers/usb/gadget/Kconfig          |   1 +
 drivers/usb/gadget/function/f_fs.c  | 513 ++++++++++++++++++++++++++--
 drivers/usb/gadget/udc/core.c       |   7 +-
 include/linux/usb/gadget.h          |   2 +
 include/uapi/linux/usb/functionfs.h |  41 +++
 6 files changed, 579 insertions(+), 21 deletions(-)

-- 
2.43.0

