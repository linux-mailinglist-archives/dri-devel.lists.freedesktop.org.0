Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C592C48FB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 21:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0B56EA80;
	Wed, 25 Nov 2020 20:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A77D6E902
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 20:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606336028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vosBqspdw7JmFXivYdUDySO0pSWDCWmE9V9Dch1o6C4=;
 b=bi3YK0Mx8gJaGkzt1q56wetsmkVq99HEJuau6bmhesNZv91qadpuWClIpJImxArxNrDzHv
 enyMhE0mhW7AtJJidQ9OBSBxWZV5kqjkGJg646U90BlX1/bpGqnasNDl6BZF6oFldo2kXu
 9RNSBRc3HULOU/oRByopu6sUv3XS5a4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-LvYqnrOdMdCpff8O5jqMIQ-1; Wed, 25 Nov 2020 15:27:07 -0500
X-MC-Unique: LvYqnrOdMdCpff8O5jqMIQ-1
Received: by mail-qt1-f197.google.com with SMTP id 100so3261277qtf.14
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 12:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vosBqspdw7JmFXivYdUDySO0pSWDCWmE9V9Dch1o6C4=;
 b=UFDJOY874Bgd0LPK26ue5L/Hx+Q004/TdiLE39mfqAUuTcDeW2/Bl3ABe54wx2fV0K
 D+pfwAN73Sp+2BwiLLrE3CLlWo2+j7XWBY0c+jGjleHgqYU88bCByUdK6qvRDGrAp0K9
 eg3FEymXRvUMQiS1VCoTreGnrlmwC+ccEPQl+9vzNs5sxFL8BZtHymZcthqhMkHASWKR
 33hLjFtooDQktRPNpLJl5S+p8IOCwISiMRTBghU6CUDAI4vn1SPGs07UCphPCdCFHUcj
 Ia63GSPSLuyZGPee1gzFauLeBJ9ApZpxlXFHgVuzz+Mj4tATOaBl16n/cKlwjO8SrrJM
 BRtg==
X-Gm-Message-State: AOAM533SXJbssOKkVMAKwSXqjx6gChCZngKmbmtc8urJd6/JkvE5V5/x
 xowtWs9zNJ9RQfZVzCW8rctSi6U0C+pF8ZyF3+AiM2FApyOm6Ku8UKjPdw6hc454CqeAVkelkV1
 NaxxD4lK0Rd6zMdwP9vpgwv5vV9SK
X-Received: by 2002:ac8:ec8:: with SMTP id w8mr621876qti.371.1606336026759;
 Wed, 25 Nov 2020 12:27:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyT78zpa38ZcqRtOpdxdblr3H4mlGuN8etlAySSZYr1uSsG5rPx8jYrid33ovUycVEA93aYXg==
X-Received: by 2002:ac8:ec8:: with SMTP id w8mr621855qti.371.1606336026552;
 Wed, 25 Nov 2020 12:27:06 -0800 (PST)
Received: from dev.jcline.org ([2605:a601:a638:b301:9966:d978:493:6a3d])
 by smtp.gmail.com with ESMTPSA id o187sm431772qkb.120.2020.11.25.12.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 12:27:05 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v2 0/3] drm/nouveau: fix a use-after-free in postclose()
Date: Wed, 25 Nov 2020 15:26:45 -0500
Message-Id: <20201125202648.5220-1-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201103194912.184413-1-jcline@redhat.com>
References: <20201103194912.184413-1-jcline@redhat.com>
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

This series reroll addresses a missing mutex_destroy() call and a typo
in a commit message.

Jeremy Cline (3):
  drm/nouveau: use drm_dev_unplug() during device removal
  drm/nouveau: Add a dedicated mutex for the clients list
  drm/nouveau: clean up all clients on device removal

 drivers/gpu/drm/nouveau/nouveau_drm.c | 42 +++++++++++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_drv.h |  5 ++++
 2 files changed, 42 insertions(+), 5 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
