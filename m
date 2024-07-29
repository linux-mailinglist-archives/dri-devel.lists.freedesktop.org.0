Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB98093F145
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 11:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FBF10E377;
	Mon, 29 Jul 2024 09:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KZFZPJ4D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB5410E377
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 09:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722245816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=emFTwdbhfJ2ShCITolW8giMz/g85BaR1blQHMfaFnpM=;
 b=KZFZPJ4DZgFr+3RYZZmT6Twbh8LkOQr6PUQIhQKu19XiehAM89+X4UhYn9uqcIaJQl1AOA
 6Ponq/IGuF1ZSrU7RhwFUX7Z3InCHbK9DaV8AGgZOvj2U126bVhYk+60pCPAStp4466NwV
 lL+VTgGWyKAeokP14elPDdeTlSPWjF8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-f8gCmGnkPa6vKBM7xWyzsA-1; Mon, 29 Jul 2024 05:36:54 -0400
X-MC-Unique: f8gCmGnkPa6vKBM7xWyzsA-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6b7a0e7b823so7637406d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722245813; x=1722850613;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=emFTwdbhfJ2ShCITolW8giMz/g85BaR1blQHMfaFnpM=;
 b=Wmj40qn58B1r2jmr/748gTjJlYC7ZfIaWTJ2abRCbd7xnM7cy3cht6UBlRWX2vY9nL
 nQCouIjfMPnkT2iiUbIX+hNCJ79iBOK5FRdCPFWBVTR+Hmq4O3eUcUSNUZRS2pPVoFU+
 gxCxXx3hJOwheLoyFfsfkdOaJxhYJKndDIJdHauS65GUrFv1bdoGLNPjGuTXlZzljSC1
 sS3tVUvYfQVEdc/uiS0VgVa5i5RxlBJZbau1iz2Z/EGL/Ch8Jih14FoSO6H33H4IwqU2
 V9L8j0uFM89WvosyOZFVcJMMNkdzOoEYF9G6cP8PKdopsf8d/H729ayHa/RjfNNsUGpO
 xrqg==
X-Gm-Message-State: AOJu0YwqgKw6XRp3u1zpvDdOCgUZdg2M8TMCuJ4dr/ms1Hdj4nzqXney
 ykrhB1vajB5Fy2S5/3TK1ualr+6YnI2AVEn+Fh4SQZ6UwUIWtR/YhE3Vy1ws6v00+r614Rf687l
 aJ5S1pi5lIcNxsIz5Wt2b98LzWpyZbhJEQEL9LnGwxQ0RYETiLv/ja2vuGCzsbIwVVA==
X-Received: by 2002:ad4:5ccd:0:b0:6b2:af3c:f710 with SMTP id
 6a1803df08f44-6bb3e1a8f83mr85444986d6.2.1722245813570; 
 Mon, 29 Jul 2024 02:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4gc3YQkLtpxEMrgaDxCfFPgN8uoswS+Zv8SfLImnsVcyFRGniiKYT5wxqKdMycWiPyBs5IQ==
X-Received: by 2002:ad4:5ccd:0:b0:6b2:af3c:f710 with SMTP id
 6a1803df08f44-6bb3e1a8f83mr85444936d6.2.1722245813183; 
 Mon, 29 Jul 2024 02:36:53 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fa94a16sm50047086d6.86.2024.07.29.02.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 02:36:52 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 0/2] Use pcim_request_region() in vboxvideo
Date: Mon, 29 Jul 2024 11:36:24 +0200
Message-ID: <20240729093625.17561-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Hi everyone,

Now that we've got the simplified PCI devres API available we can slowly
start using it in drivers and step by step phase the more problematic
API out.

vboxvideo currently does not have a region request, so it is a suitable
first user.

P.

Philipp Stanner (2):
  PCI: Make pcim_request_region() a public function
  drm/vboxvideo: Add PCI region request

 drivers/gpu/drm/vboxvideo/vbox_main.c | 4 ++++
 drivers/pci/devres.c                  | 1 +
 drivers/pci/pci.h                     | 2 --
 include/linux/pci.h                   | 1 +
 4 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.45.2

