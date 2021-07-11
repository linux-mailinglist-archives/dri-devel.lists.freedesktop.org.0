Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6603B3C3D2B
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 16:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D7689BCD;
	Sun, 11 Jul 2021 14:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDF389598;
 Sun, 11 Jul 2021 14:06:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8C7161167;
 Sun, 11 Jul 2021 14:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626012370;
 bh=HLSq+Yauw46XSnh1gDxK4lm/+yT/5Pe4lHG6h8wLuEw=;
 h=From:To:Cc:Subject:Date:From;
 b=qOaetmf+BgnziXdmdC3Bz6NXwoTFT1GrJG2OYiPhLM4mekfP2IZVtA39K4LqznVUy
 Mvxcd9jq6j+kM2oehDuNrLydp6UTPEtQU0HiNeZ2pMuU54jjTt763Q9++bLdvrIxQ+
 JACVL1ZxFfcVMAYJOgcswFUrFqz+w+89kuYJZnxX45llk6Y4bOTf2u2EHxkM9f/g55
 ufSL67ZTvnT8qoxL76iYAXrt/J9TZ87nRN58MHse9ZdSML2CJDgc6pSeGIOYrV5adi
 EnRdL+FG1JaasWQYKT48sZJ3bp/0lbtqOd2LTkVbgFd6j7dSBSHynKknqHqNZNXbWm
 vLcrN3M/V0QeQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jgg@ziepe.ca
Subject: [PATCH v5 0/2] Add p2p via dmabuf to habanalabs
Date: Sun, 11 Jul 2021 17:05:59 +0300
Message-Id: <20210711140601.7472-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: linux-rdma@vger.kernel.org, daniel.vetter@ffwll.ch, sleybo@amazon.com,
 galpress@amazon.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, dledford@redhat.com, hch@lst.de,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, leonro@nvidia.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
This is v5 of this patch-set following again a long email thread.

It contains fixes to the implementation according to the review that Jason
did on v4. Jason, I appreciate your feedback. If you can take another look
to see I didn't miss anything that would be great.

The details of the fixes are in the changelog in the commit message of
the second patch.

There was one issue with your proposal to set the orig_nents to 0. I did
that, but I also had to restore it to nents before calling sg_free_table
because that function uses orig_nents to iterate.

Thanks,
Oded

Oded Gabbay (1):
  habanalabs: define uAPI to export FD for DMA-BUF

Tomer Tayar (1):
  habanalabs: add support for dma-buf exporter

 drivers/misc/habanalabs/Kconfig             |   1 +
 drivers/misc/habanalabs/common/habanalabs.h |  22 +
 drivers/misc/habanalabs/common/memory.c     | 522 +++++++++++++++++++-
 drivers/misc/habanalabs/gaudi/gaudi.c       |   1 +
 drivers/misc/habanalabs/goya/goya.c         |   1 +
 include/uapi/misc/habanalabs.h              |  28 +-
 6 files changed, 570 insertions(+), 5 deletions(-)

-- 
2.25.1

