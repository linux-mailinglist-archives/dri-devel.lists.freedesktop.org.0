Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DC5512E44
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 10:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6120610F849;
	Thu, 28 Apr 2022 08:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD1B10F849
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 08:27:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CDEBA2186F;
 Thu, 28 Apr 2022 08:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1651134467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uHWa92vFc0VKwXbjUTC1XMh188o1HlT0uQD6qb0vP48=;
 b=ptsNFLPN4AOJ9HLpo2aUFC1C35GqsbNQmwQwd/cc0fkX9rwV4HLRJVj0WiG+95oGxsBYyw
 5reFV928fpI3wng15ZZWSf2aMaxIkut0k3dO9MjlmOJ7aHFGqGsaFIzVlip6U6aXsYeVwo
 KQjHMdo/P4x1VKzfCdDMkbEiS1Pfu8Q=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF6F413491;
 Thu, 28 Apr 2022 08:27:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ApxEOAJQamIBLgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Apr 2022 08:27:46 +0000
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-integrity@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: [PATCH v2 00/19] xen: simplify frontend side ring setup
Date: Thu, 28 Apr 2022 10:27:24 +0200
Message-Id: <20220428082743.16593-1-jgross@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, Jens Axboe <axboe@kernel.dk>,
 alsa-devel@alsa-project.org, Stefano Stabellini <sstabellini@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jarkko Sakkinen <jarkko@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Peter Huewe <peterhuewe@gmx.de>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Many Xen PV frontends share similar code for setting up a ring page
(allocating and granting access for the backend) and for tearing it
down.

Create new service functions doing all needed steps in one go.

This requires all frontends to use a common value for an invalid
grant reference in order to make the functions idempotent.

Changes in V2:
- new patch 9 and related changes in patches 10-18

Juergen Gross (19):
  xen/blkfront: switch blkfront to use INVALID_GRANT_REF
  xen/netfront: switch netfront to use INVALID_GRANT_REF
  xen/scsifront: remove unused GRANT_INVALID_REF definition
  xen/usb: switch xen-hcd to use INVALID_GRANT_REF
  xen/drm: switch xen_drm_front to use INVALID_GRANT_REF
  xen/sound: switch xen_snd_front to use INVALID_GRANT_REF
  xen/dmabuf: switch gntdev-dmabuf to use INVALID_GRANT_REF
  xen/shbuf: switch xen-front-pgdir-shbuf to use INVALID_GRANT_REF
  xen: update ring.h
  xen/xenbus: add xenbus_setup_ring() service function
  xen/blkfront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/netfront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/tpmfront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/drmfront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/pcifront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/scsifront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/usbfront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/sndfront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/xenbus: eliminate xenbus_grant_ring()

 drivers/block/xen-blkfront.c                | 57 +++++---------
 drivers/char/tpm/xen-tpmfront.c             | 18 +----
 drivers/gpu/drm/xen/xen_drm_front.h         |  9 ---
 drivers/gpu/drm/xen/xen_drm_front_evtchnl.c | 43 +++--------
 drivers/net/xen-netfront.c                  | 85 +++++++--------------
 drivers/pci/xen-pcifront.c                  | 19 +----
 drivers/scsi/xen-scsifront.c                | 31 ++------
 drivers/usb/host/xen-hcd.c                  | 65 ++++------------
 drivers/xen/gntdev-dmabuf.c                 | 13 +---
 drivers/xen/xen-front-pgdir-shbuf.c         | 17 +----
 drivers/xen/xenbus/xenbus_client.c          | 82 +++++++++++++++-----
 include/xen/interface/io/ring.h             | 19 +++--
 include/xen/xenbus.h                        |  4 +-
 sound/xen/xen_snd_front_evtchnl.c           | 44 +++--------
 sound/xen/xen_snd_front_evtchnl.h           |  9 ---
 15 files changed, 179 insertions(+), 336 deletions(-)

-- 
2.34.1

