Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4CC508B9A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 17:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC9A10EFC2;
	Wed, 20 Apr 2022 15:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FAE10EFC2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 15:09:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5B4A1210E4;
 Wed, 20 Apr 2022 15:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1650467398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=E9Za1fy7SJZVuU3gsJHYcUnfUQspR3rknfU8bXQql9Y=;
 b=s7o4aJsXllglxjEicM+le/pE5Q4+nZsQh1+qkc+l1wMXB8I5KM8EXHpK9vVJQBopp4olwE
 /0eL2tvJFzr8/5F+QMy5ysfmCp4A5ramqeRsMJKSZCtFDWgeFHKh6l0oEFDWWCNJk0EhzP
 yXIHNy0QuiJkmeTPgRibcNpvjDS2yuo=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96AE513AD5;
 Wed, 20 Apr 2022 15:09:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QAKAI0UiYGJILQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 15:09:57 +0000
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-integrity@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: [PATCH 00/18] xen: simplify frontend side ring setup
Date: Wed, 20 Apr 2022 17:09:24 +0200
Message-Id: <20220420150942.31235-1-jgross@suse.com>
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

Juergen Gross (18):
  xen/blkfront: switch blkfront to use INVALID_GRANT_REF
  xen/netfront: switch netfront to use INVALID_GRANT_REF
  xen/scsifront: remove unused GRANT_INVALID_REF definition
  xen/usb: switch xen-hcd to use INVALID_GRANT_REF
  xen/drm: switch xen_drm_front to use INVALID_GRANT_REF
  xen/sound: switch xen_snd_front to use INVALID_GRANT_REF
  xen/dmabuf: switch gntdev-dmabuf to use INVALID_GRANT_REF
  xen/shbuf: switch xen-front-pgdir-shbuf to use INVALID_GRANT_REF
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

 drivers/block/xen-blkfront.c                | 54 ++++----------
 drivers/char/tpm/xen-tpmfront.c             | 18 +----
 drivers/gpu/drm/xen/xen_drm_front.h         |  9 ---
 drivers/gpu/drm/xen/xen_drm_front_evtchnl.c | 40 +++-------
 drivers/net/xen-netfront.c                  | 77 ++++++--------------
 drivers/pci/xen-pcifront.c                  | 19 +----
 drivers/scsi/xen-scsifront.c                | 30 ++------
 drivers/usb/host/xen-hcd.c                  | 59 ++++-----------
 drivers/xen/gntdev-dmabuf.c                 | 13 +---
 drivers/xen/xen-front-pgdir-shbuf.c         | 17 +----
 drivers/xen/xenbus/xenbus_client.c          | 81 ++++++++++++++++-----
 include/xen/xenbus.h                        |  4 +-
 sound/xen/xen_snd_front_evtchnl.c           | 41 +++--------
 sound/xen/xen_snd_front_evtchnl.h           |  9 ---
 14 files changed, 156 insertions(+), 315 deletions(-)

-- 
2.34.1

