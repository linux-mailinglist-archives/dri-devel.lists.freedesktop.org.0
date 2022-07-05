Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B945669AC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0230A112F79;
	Tue,  5 Jul 2022 11:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1752210E048
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657015360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G6JwN6kDh1no423YdXFobnm9id4clHpuSWy/fs9OcOQ=;
 b=ac7k5JEcEb7cspeeQ27FGZOZanXetlYevjl89yqVIz7KNmkpNkOH92xE3DqyrVAk639dxH
 XauSrpcsAP1A1lszulgWgAeNP0dg67xFjR6BuQkBqkl3V24PVYDOfHWifeFzy0YsxDgWM5
 +rxbJdTcIZx8hVeNQRa+9mdtBMoks/A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-FfEO9gQ5MZedPNGPhIMHKw-1; Tue, 05 Jul 2022 06:02:36 -0400
X-MC-Unique: FfEO9gQ5MZedPNGPhIMHKw-1
Received: by mail-wm1-f70.google.com with SMTP id
 h125-20020a1c2183000000b003a0374f1eb8so8631857wmh.8
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 03:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G6JwN6kDh1no423YdXFobnm9id4clHpuSWy/fs9OcOQ=;
 b=mz/OS+2tC6aCsVd05slSxbgei2ODQ+M8dMPJR+EFKZHY6DtfY+Yxi128ldZGmQBCFH
 t6LnlRDhhgSsuGVGEG6V9LZDUt9s9pk4xd4Jrx2tQzqsb924PeYYI025B2QNNtLqNcdN
 J3/69nrYFJ12Naps3OBjw12JYZptGNQLQZ5rmtjTsCapHTgObchCizKqtk/MyaMxZbwj
 f9/e4hZM6te4mebFKQcjkO2No90PyABUE+7M6Sn+KmHWAPPv9W+w27Qp2tbSJuPuVMT8
 gKwpvL17eQ5L10WKjSacLNHRxNVgs8bR3GJcuR6govWiXETajdl46i9UdNI3uBz2P/Bp
 BpbA==
X-Gm-Message-State: AJIora+m5OcQwQX307Tp0WSL4iQI2TOXFj1Vb9QDFu54sYI+0o/+KjDX
 xiyyua//kHCz/gHbkDfiwcVMzWVuPyDsGl89dXY83b6ZXO5vIPieYN8fs/qtX8ETJVicCGketgA
 psbCFcKd262TXwYNLDlzfyCflcoMq
X-Received: by 2002:a05:600c:b46:b0:3a0:4a51:bb1d with SMTP id
 k6-20020a05600c0b4600b003a04a51bb1dmr35510715wmr.168.1657015355151; 
 Tue, 05 Jul 2022 03:02:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s4/g0sBLSbisYhUn+RXPZDCB5AgKAg4Q6dmtoJohq3UxfdprzXO1/tSDYsherbyMS9/qjKLw==
X-Received: by 2002:a05:600c:b46:b0:3a0:4a51:bb1d with SMTP id
 k6-20020a05600c0b4600b003a04a51bb1dmr35510693wmr.168.1657015354905; 
 Tue, 05 Jul 2022 03:02:34 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f7-20020a0560001b0700b0021d68e1fd42sm6255192wrz.89.2022.07.05.03.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 03:02:34 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm: A couple of fixes for drm_copy_field() helper
 function
Date: Tue,  5 Jul 2022 12:02:12 +0200
Message-Id: <20220705100215.572498-1-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Peter Robinson reported me a kernel bug in one of his aarch64 test boards
and even though I was not able to reproduce it, I think that figured out
what the problem was. It seems the cause is that a DRM driver doesn't set
some of the struct drm fields copied to userspace via DRM_IOCTL_VERSION.

Even though this is a driver bug, we can make drm_copy_field() more robust
and warn about it instead of leading to an attempt to copy a NULL pointer.

While looking at this, I also found that a variable in drm_copy_field() is
not using the correct type. So I included that change in the patch-set too.

Best regards,
Javier

Changes in v2:
- Add Peter Robinson Tested-by and Thomas Zimmermann Reviewed-by tags.
- Just warn if a value isn't set and report it as a string of length 0.
  (Thomas Zimmermann).

Javier Martinez Canillas (2):
  drm: Use size_t type for len variable in drm_copy_field()
  drm: Prevent drm_copy_field() to attempt copying a NULL pointer

 drivers/gpu/drm/drm_ioctl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.36.1

