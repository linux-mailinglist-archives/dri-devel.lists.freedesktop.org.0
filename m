Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6116D949D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8BC10EB55;
	Thu,  6 Apr 2023 11:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5DF10E4F6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 11:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680778973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AB7yfzjEvRHH8TidDe0npRB6+mGa6JkmpE43QroBrFU=;
 b=hunrB7ieYYlW6Navi4d4LCGkvYv5nCfqJml/XkQOuizYLPo7PzGCh9zdrMMQPoZPBQlLmy
 qtfF7tR1qde0ocHn67nvid7n8Bu7h1Zf/Ebq1SYTXSBvkPpddvEqpSVw+tc8gHoMNK58Zx
 qiN+MeXeEe8uQu3WbcQk4sqlUa1O7Sw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-flr5B0tjOuK_wj1H86a6wA-1; Thu, 06 Apr 2023 07:02:52 -0400
X-MC-Unique: flr5B0tjOuK_wj1H86a6wA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j27-20020a05600c1c1b00b003edd2023418so20196007wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 04:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680778971;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AB7yfzjEvRHH8TidDe0npRB6+mGa6JkmpE43QroBrFU=;
 b=3v7S4xipsDO9TEjzvZi3uEuiC+44PMEmRQ09ITht89hySwRYNIFICeD8XQb79RmMlA
 trIHHgdvUr58FDJ9qz0V2FaMtp+lpfG+6o3R6F3AYs3X4BFsJa7ZZDXT23gLW5H0Vgmn
 LhrIlBm3NuWx/hhFz/aFRtru5uxZswt5hIqJTBcgwDM4N53crCLjut0YG8QqN6vZjJ2m
 tgB8V0avZHf9yl/6dQhvroSe7qQmMGGYhl0eIpkXeGw5xJLX5CwEUa1W1j2VUeb9SSV8
 FRJzcGMoDUxv4Yk+FyWaQrg3hDrwpGZSLVw666lAfIL6idTpH1Asl6v0GEb6PNdtu1jl
 K8fg==
X-Gm-Message-State: AAQBX9etZzxT7DtMrgUqN5XiVvHHSTQZR5iAo6ew7cfA02bW3bEMmtSW
 M2Csf4jq+jPwtBEFgsPWHGScdwe4fgLEtjIiCir3gAo8MNAto+Z7xlF2QlJNm8yxSRJUX3DAB+R
 SMvDPRjOiAub3n61Z5yp3IntZupvX
X-Received: by 2002:a05:6000:114b:b0:2ca:5c9a:a548 with SMTP id
 d11-20020a056000114b00b002ca5c9aa548mr6541531wrx.60.1680778971001; 
 Thu, 06 Apr 2023 04:02:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350YZGlsDxDnoj90UVq3SMMDRgQ3LgI89wpVhHKxclDtqB1PH2+qbh3D6NTE4BnMgDDroL68gEg==
X-Received: by 2002:a05:6000:114b:b0:2ca:5c9a:a548 with SMTP id
 d11-20020a056000114b00b002ca5c9aa548mr6541510wrx.60.1680778970731; 
 Thu, 06 Apr 2023 04:02:50 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b6-20020a05600010c600b002d8566128e5sm1472401wrx.25.2023.04.06.04.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 04:02:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/vkms: A couple of trivial cleanups
Date: Thu,  6 Apr 2023 13:02:33 +0200
Message-Id: <20230406110235.3092055-1-javierm@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>, Marius Vlad <marius.vlad@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series contains two trivial cleanups for the vkms driver.

Patch #1 just gets rid of a wrapper helper that wasn't really adding that
much value and patch #2 drops the <drm/drm_simple_kms_helper.h> header
that was only used to call the drm_simple_encoder_init() function helper.

Best regards,
Javier


Javier Martinez Canillas (2):
  drm/vkms: Drop vkms_connector_destroy() wrapper
  drm/vkms: Remove <drm/drm_simple_kms_helper.h> include

 drivers/gpu/drm/vkms/vkms_output.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)


base-commit: 77d08a2de6a43521f5a02848f11185b6f46af21c
-- 
2.40.0

