Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71162A506A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 20:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3AF6E866;
	Tue,  3 Nov 2020 19:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568996E866
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 19:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604432975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RMhmlI7J39tGZ2SV4Ku6FWb6g9FR/7RgJqLGVWssnYI=;
 b=XrwDBhT8+fgWVLj0AUacQyEBAyT/J5rAs1WqmU0Jpp+qzgrCgXg+Y7FtrlJeGWDZb2eO+h
 iKFlkp4KavZCTWrgVc68Y8Cv07OG0TjCqTo1IIcRpgWAq1fCaacF63vy8qt8b730i1nto2
 TkM2onhnX1VYZGzDcnpWZrqPvEzIHMY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-IveBtsTHMP-WZaCyp9rKsw-1; Tue, 03 Nov 2020 14:49:33 -0500
X-MC-Unique: IveBtsTHMP-WZaCyp9rKsw-1
Received: by mail-qv1-f69.google.com with SMTP id l16so9846280qvt.17
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 11:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RMhmlI7J39tGZ2SV4Ku6FWb6g9FR/7RgJqLGVWssnYI=;
 b=R17xoQodsAZ4GRPNQssExYdfAaDXjJB1jWMRygx+MEU9YE0HPDiul+I6y8iXPNIV1U
 3aoG5XGmjXOLHyjCDkToWansDrdpVA7joITdRltl2/BH7kjh4KTSRjvEBnjfyVKfzABk
 HRNu4sm33SUY+5ZT11XoZOCfTKFFGgL6AYafyA7GKc8KG72W+bBAAs4R2pZ6TVayC0yU
 m2K0negLxXitvwJgrhuzsAT8nAHauSNRyUVIwEb1Q5MNvEhscbYngO2ura7AA/jE2IWl
 ldkwRmXNRsUaAVquvaOT+4uMytZZAydemlMoi73URZQAmHl62U6mFq4XQ7yJAVVdOb3Q
 Av+Q==
X-Gm-Message-State: AOAM531VVmcoO/tgizkyh6xWgtfQk/eyCVpF8DR+c87OI40defaphjhF
 s7g/tqAIo/aYd9hyspw7n2rjr2l+tCIDkExBbxe+CpHSZkI0nyckw6Ed1HU9APSFcMjK08CMcKo
 jekDrzhzx0PTEgan8UJdKv38cwkHD
X-Received: by 2002:a37:c441:: with SMTP id h1mr21747181qkm.298.1604432973155; 
 Tue, 03 Nov 2020 11:49:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy41D81xBVSWbgfUtCJ62NG9CG/yhsi1aEcls1TS+xTGUJGjh7vp2/8LAkziyOyD18UEa3N7Q==
X-Received: by 2002:a37:c441:: with SMTP id h1mr21747159qkm.298.1604432972928; 
 Tue, 03 Nov 2020 11:49:32 -0800 (PST)
Received: from xps13.redhat.com ([2605:a601:a639:f01:1ac8:8e0c:f1cc:7a29])
 by smtp.gmail.com with ESMTPSA id w25sm11392532qkj.85.2020.11.03.11.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 11:49:31 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 0/3] drm/nouveau: fix a use-after-free in postclose()
Date: Tue,  3 Nov 2020 14:49:09 -0500
Message-Id: <20201103194912.184413-1-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jeremy Cline <jcline@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes a number of use-after-frees in nouveau's postclose()
handler. It was discovered by pointing IGT's core_hotunplug tests at a
nouveau device, but the steps to reproduce it are simple:

1. Open the device file
2. Unbind the driver or remove the device
3. Close the file opened in step 1.

During the device removal, the nouveau_drm structure is de-allocated,
but is dereferenced in the postclose() handler.

One obvious solution is to ensure all the operations in the postclose()
handler are valid by extending the lifetime of the nouveau_drm
structure. This is possible with the new devm_drm_dev_alloc() interface,
but the change is somewhat invasive so I thought it best to submit that
work separately.

Instead, we make use of the drm_dev_unplug() API, clean up all clients
in the device removal call, and check to make sure the device has not
been unplugged in the postclose() handler. While this does not enable
hot-unplug support for nouveau, it's enough to avoid crashing the kernel
and leads to all the core_hotunplug tests to pass.

Jeremy Cline (3):
  drm/nouveau: use drm_dev_unplug() during device removal
  drm/nouveau: Add a dedicated mutex for the clients list
  drm/nouveau: clean up all clients on device removal

 drivers/gpu/drm/nouveau/nouveau_drm.c | 39 +++++++++++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_drv.h |  5 ++++
 2 files changed, 39 insertions(+), 5 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
