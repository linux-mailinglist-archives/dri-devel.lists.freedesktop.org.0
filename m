Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B2E82ABAD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 11:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496CF10E8CF;
	Thu, 11 Jan 2024 10:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AC110E8CF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704968089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N/UoCwqwLqGcoRY403M5K9c8YGwWXRlfn//t7u6wv2s=;
 b=ih/22RlHKAwSoQtTlyM/1JWA8kftXd6Rv3RQt3qVCXd0XEg+1YS0iAtWR2nh6DIU0Ua7b8
 /06bF0wZ6JeqVX4KjGTW/3ty+Xl4cOzkC4pHJjtYCmRCW7c92CZyFg8Cx7vtUBQO365n0w
 kWf4lvajIjeTl3yNrZfB9oVXXlvRlUg=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-aurJfu9nP8iiYR9hG8LFvw-1; Thu, 11 Jan 2024 05:14:47 -0500
X-MC-Unique: aurJfu9nP8iiYR9hG8LFvw-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3bbbfe871afso1302714b6e.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 02:14:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704968087; x=1705572887;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N/UoCwqwLqGcoRY403M5K9c8YGwWXRlfn//t7u6wv2s=;
 b=GrgUEVVCAb56y+48A5cJUPkhTJiJBP2JSTyPwIp4qXSyNhr260VU69rookc/KJ31vF
 DGSoX8avOYCTcQxK8RSxBnaYc0SBpm13wqgyhLkPf0orBiXwuel3blb+1w4BZCSk0PCl
 22DZcsvKB/o2L78+esuYYmYxbpTz6q8oXWlWyZj4cWqH+tzQ7y4V4W3iH1fhxkcKSWnC
 Xwp1nl/A+IZo6v9kJYQ4bIYA7Tpb9ljVb/TMHo6bNHXdj7p9S5P/fc4z8WV9wc2zzQtG
 eulc35EYhR/SN9CVR4cMndINV0ptOqxXLPuSDY4NdQY1KZFTwT2AKe3nN1vCf75Di7B5
 MOmg==
X-Gm-Message-State: AOJu0Ywmc1irK9GK6DmngYDvx/O0mlD9ni/BcubrQL5Dm9/wlh0D2mzG
 CT/B/lS2s2mjfGCYnVBDXSHycytYtS10bSNNlMz5sJXpByGj/EML9rpveVglXNpo0IZvl+On/iB
 Xv1kxthZf0mM6s/ZLR1ekM2upczW0ZC62XsNF
X-Received: by 2002:a54:4415:0:b0:3bd:44ea:a6a9 with SMTP id
 k21-20020a544415000000b003bd44eaa6a9mr1768454oiw.4.1704968087200; 
 Thu, 11 Jan 2024 02:14:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4P/rjoGuSsC484KSAD6OYk0J+cSTTYILIQID5AnGfJR82sS+9GPYmICi9JFFqXoGebsRpDg==
X-Received: by 2002:a54:4415:0:b0:3bd:44ea:a6a9 with SMTP id
 k21-20020a544415000000b003bd44eaa6a9mr1768436oiw.4.1704968086951; 
 Thu, 11 Jan 2024 02:14:46 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 eo7-20020a05622a544700b0042993549c3asm313237qtb.32.2024.01.11.02.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 02:14:46 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 0/2] drm/imx/dcss: implement region request and devres
Date: Thu, 11 Jan 2024 11:13:45 +0100
Message-ID: <20240111101346.15193-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
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
Cc: linux-arm-kernel@lists.infradead.org, Philipp Stanner <pstanner@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

OK, I messed up the ARM64 build. That's what you get for living on x86
for years and decades. Mea culpa. Should work now.

--

Changes in v3:
- Fix build errors (missing variable, forgotten remove to call of deleted
  function)

Changes in v2:
- Add the region-request to this patch-series. That was previously a
  separate patch.

dcss currently does not request its memory resource. This series adds
that request with devres. As we're at it, it also ports all the ioremaps
and associated allocations to devres.

I can build this, but I don't have the hardware available to test it. So
you might want to have a closer look.

P.

Philipp Stanner (2):
  drm/imx/dcss: request memory region
  drm/imx/dcss: have all init functions use devres

 drivers/gpu/drm/imx/dcss/dcss-blkctl.c | 14 +++-----------
 drivers/gpu/drm/imx/dcss/dcss-ctxld.c  | 15 ++++-----------
 drivers/gpu/drm/imx/dcss/dcss-dev.c    | 19 +++++++++----------
 drivers/gpu/drm/imx/dcss/dcss-dev.h    |  1 -
 drivers/gpu/drm/imx/dcss/dcss-dpr.c    | 25 ++++++-------------------
 drivers/gpu/drm/imx/dcss/dcss-drv.c    | 12 +++---------
 drivers/gpu/drm/imx/dcss/dcss-dtg.c    | 23 ++++-------------------
 drivers/gpu/drm/imx/dcss/dcss-scaler.c | 24 +++++-------------------
 drivers/gpu/drm/imx/dcss/dcss-ss.c     | 11 +++--------
 9 files changed, 37 insertions(+), 107 deletions(-)

-- 
2.43.0

