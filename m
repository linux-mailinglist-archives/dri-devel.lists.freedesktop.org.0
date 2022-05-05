Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BC751B9DB
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 10:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF8610F8C8;
	Thu,  5 May 2022 08:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDD010F8C8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 08:16:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DD1AE1F37F;
 Thu,  5 May 2022 08:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1651738603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+rG3u9WN3fpKsJ0oR6FOTx9SGcpcZNwJpHRZoiitWn0=;
 b=iZYfwDJOH3Rm9o+MLXSeu50EFMfd04XPhuJ/CB2/T6Z6DRtP11UcKJwcKyHntgX/sKa2RI
 CH6o5/RIWxX7F43gvAY3CXkLN0l6PCPqFBQnpY4226kszreGPap8IbAxANXT9XN+5OGMsS
 82Q6oURWAFQNrJrP+mu5LGGeKvQm574=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D03F13B11;
 Thu,  5 May 2022 08:16:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QqHGAeuHc2K1BwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 05 May 2022 08:16:43 +0000
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-integrity@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: [PATCH v3 00/21] xen: simplify frontend side ring setup
Date: Thu,  5 May 2022 10:16:19 +0200
Message-Id: <20220505081640.17425-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
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
Cc: alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>,
 Peter Huewe <peterhuewe@gmx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Many Xen PV frontends share similar code for setting up a ring page
(allocating and granting access for the backend) and for tearing it
down.

Create new service functions doing all needed steps in one go.

This requires all frontends to use a common value for an invalid
grant reference in order to make the functions idempotent.

Changes in V3:
- new patches 1 and 2, comments addressed

Changes in V2:
- new patch 9 and related changes in patches 10-18

Juergen Gross (21):
  xen: update grant_table.h
  xen/grant-table: never put a reserved grant on the free list
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

 drivers/block/xen-blkfront.c                |  57 +++----
 drivers/char/tpm/xen-tpmfront.c             |  18 +--
 drivers/gpu/drm/xen/xen_drm_front.h         |   9 --
 drivers/gpu/drm/xen/xen_drm_front_evtchnl.c |  43 ++----
 drivers/net/xen-netfront.c                  |  85 ++++-------
 drivers/pci/xen-pcifront.c                  |  19 +--
 drivers/scsi/xen-scsifront.c                |  31 +---
 drivers/usb/host/xen-hcd.c                  |  65 ++------
 drivers/xen/gntdev-dmabuf.c                 |  13 +-
 drivers/xen/grant-table.c                   |  12 +-
 drivers/xen/xen-front-pgdir-shbuf.c         |  18 +--
 drivers/xen/xenbus/xenbus_client.c          |  82 +++++++---
 include/xen/grant_table.h                   |   2 -
 include/xen/interface/grant_table.h         | 161 ++++++++++++--------
 include/xen/interface/io/ring.h             |  19 ++-
 include/xen/xenbus.h                        |   4 +-
 sound/xen/xen_snd_front_evtchnl.c           |  44 ++----
 sound/xen/xen_snd_front_evtchnl.h           |   9 --
 18 files changed, 287 insertions(+), 404 deletions(-)

-- 
2.35.3

