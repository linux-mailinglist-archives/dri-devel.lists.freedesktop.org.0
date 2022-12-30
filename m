Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 459FA659780
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 12:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1C910E1C8;
	Fri, 30 Dec 2022 11:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A5910E1C8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 11:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672398756; x=1703934756;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3VsE+z1EeU8Psra+dUMDAy+VrY2Aej5EoDJtd8f8ZbY=;
 b=f5cFE/Ywbf4s7dZfgItHp+mq04mGldtnutaVDuiyzNeIeaaCJLi2Scs+
 bXshxL/DB92N1RHSni+/vLgSj6p49YGmDhOpnn5WaE61bHL5b63nf4mTj
 T/17a+pxKC00G4RGi18k8v6NysZ+hLLVTn/TW5C+89f0yT4yZ/9vTUqKm
 aWHaquFEfhiVHUkUuh7MDElnSDqs4N9EWPHvq1/2wNy81oyy3MRRzHBJd
 FNBwbM52fqywMMBaEzpGg04hjYWJ7pk730rQO/huh0PPvWqnBxcNci9pR
 JwVzqci/UJNgYVzpJbMe0uSFEVE01p8hMHDAHJMt+jmSsjFeSleM7XwXz A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="323178229"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; d="scan'208";a="323178229"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2022 03:12:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="655839538"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; d="scan'208";a="655839538"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2022 03:12:34 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	christian.koenig@amd.com
Subject: [RFC] TTM shrinking revisited
Date: Fri, 30 Dec 2022 12:11:58 +0100
Message-Id: <20221230111159.75410-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Christian, others.

I'm starting to take a look at the TTM shrinker again. We'll probably be
needing it at least for supporting integrated hardware with the xe driver.

So assuming that the last attempt failed because of the need to allocate
shmem pages and lack of writeback at shrink time, I was thinking of the
following approach: (A rough design sketch of the core support for the
last bullet is in patch 1/1. It of course needs polishing if the interface
is at all accepted by the mm people).

Before embarking on this, any feedback or comments would be greatly
appreciated:

*) Avoid TTM swapping when no swap space is available. Better to adjust the
   TTM swapout watermark, as no pages can be freed to the system anyway.
*) Complement the TTM swapout watermark with a shrinker.
   For cached pages, that may hopefully remove the need for the watermark.
   Possibly a watermark needs to remain for wc pages and / or dma pages,
   depending on how well shrinking them works.
*) Trigger immediate writeback of pages handed to the swapcache / shmem,
   at least when the shrinker is called from kswapd.
*) Hide ttm_tt_swap[out|in] details in the ttm_pool code. In the pool code
   we have more details about the backing pages and can split pages,
   transition caching state and copy as necessary. Also investigate the
   possibility of reusing pool pages in a smart way if copying is needed.
*) See if we can directly insert pages into the swap-cache instead of
   taking the shmem detour, something along with the attached patch 1 RFC.

Thanks,
Thomas

