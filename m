Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C054D5F96
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 11:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D1B10E8C1;
	Fri, 11 Mar 2022 10:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3637A10E8C1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 10:34:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 79D72210FB;
 Fri, 11 Mar 2022 10:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1646994873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wxQGvXlNGe5HCBbR63oBE/kK35uYM5cAEXtsbUcwkZQ=;
 b=iNIvX7qiHCHs8as2v0+a/C6Wf9AM41VW8O+o2xwFxi1cw2QRDGGMgZ/U+wVya50NqXLinC
 i0LxZhXeNa6Kvoq6FYdE1Rn7t/eAOn4geBVM9tpVaCf3Bq2EMzIQrENQGGyoxOfZbZapRr
 hZujw3UMlrZhO11g0/T3KzHa4Umc+Jk=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A827013A85;
 Fri, 11 Mar 2022 10:34:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Kh3tJ7glK2LxdQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 11 Mar 2022 10:34:32 +0000
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-integrity@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net
Subject: [PATCH 0/2] xen/grant-table: do some cleanup
Date: Fri, 11 Mar 2022 11:34:27 +0100
Message-Id: <20220311103429.12845-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Jaroslav Kysela <perex@perex.cz>, Peter Huewe <peterhuewe@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jakub Kicinski <kuba@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Eric Van Hensbergen <ericvh@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cleanup grant table code by removing unused functionality.

Juergen Gross (2):
  xen/grant-table: remove gnttab_*transfer*() functions
  xen/grant-table: remove readonly parameter from functions

 drivers/block/xen-blkfront.c                |   8 +-
 drivers/char/tpm/xen-tpmfront.c             |   2 +-
 drivers/gpu/drm/xen/xen_drm_front_evtchnl.c |   2 +-
 drivers/input/misc/xen-kbdfront.c           |   4 +-
 drivers/net/xen-netfront.c                  |  13 +-
 drivers/pci/xen-pcifront.c                  |   2 +-
 drivers/scsi/xen-scsifront.c                |   4 +-
 drivers/usb/host/xen-hcd.c                  |   4 +-
 drivers/xen/gntalloc.c                      |   2 +-
 drivers/xen/gntdev-dmabuf.c                 |   2 +-
 drivers/xen/grant-table.c                   | 151 +++-----------------
 drivers/xen/pvcalls-front.c                 |   6 +-
 drivers/xen/xen-front-pgdir-shbuf.c         |   3 +-
 include/xen/grant_table.h                   |  13 +-
 net/9p/trans_xen.c                          |   8 +-
 sound/xen/xen_snd_front_evtchnl.c           |   2 +-
 16 files changed, 50 insertions(+), 176 deletions(-)

-- 
2.34.1

