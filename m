Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 914714C943D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 20:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6940A10E7AE;
	Tue,  1 Mar 2022 19:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BEA10E7AE
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 19:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646162961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=b+msLQunHEcmiuuu7B6KPaPcoKHsejBtZdFml9n1AXs=;
 b=Nxwwv3c+u8hFFYzQG29JnvfQZu6AgxKmOLb50sP0FXAxyeqOwJwOHP9Sa7wJOaKklp7Hra
 PkHBmDpxAjIWqeofrPJStWNC7Kv1j/v/Tv9ha6FwBPZyuqkRJK9F6b7b8+WAmqJtRgmqzy
 ENP+ehN6LA4S863WxO2QNWafzgmqdS8=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-rnU9rDl7OhabdWXVdZZO3A-1; Tue, 01 Mar 2022 14:29:20 -0500
X-MC-Unique: rnU9rDl7OhabdWXVdZZO3A-1
Received: by mail-oo1-f70.google.com with SMTP id
 b10-20020a4a340a000000b0031937d5a5efso10984304ooa.15
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 11:29:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b+msLQunHEcmiuuu7B6KPaPcoKHsejBtZdFml9n1AXs=;
 b=KyL1hjUAodojbeymXtzVXbctNjSQBoBgUa7fsVJwQwYLiNdNSoguOR47TIaWDBNVd8
 8jABis6sJIwIwNHFA8Q+O5n0EvhKjbn7vb1sCppFF0cf9VGEL6Ftsy+RUml5FJT+KnIq
 o50fmExBlbMd9AGe6mCAhQgrI2eLgk0sy6NyI3BT5tcMqX+Ygxoeg6GS2osUIGUpbBBN
 KjfNrGnhZrJLvPkMvoXEzId/Wh3uKIkBndd829UEj+uj5ohzo/eapIKbzaqLGVLfxsJD
 45qJOMShafk7j4Yevxt7H6UIYOpKOG6WoUSJDh+/0oMf+Vjm0nT9fFnhtMCDYuqwFszx
 u6nw==
X-Gm-Message-State: AOAM531NNxli/7yIU3JiiuVwzfKt/Ny9kotfXRw2eO5++rCLHxN7BcOL
 +XSM5AH+VxxMAXMezP1oOPcG/lKHoi7qF8zd29e99zfvBb1k1M9YHlpoho9nisEfjODO1IxofiV
 7uFTLmH8a4q9MWiEzrsea61JVTaBo
X-Received: by 2002:a05:6870:87c4:b0:bc:4b13:b0c0 with SMTP id
 s4-20020a05687087c400b000bc4b13b0c0mr5039316oam.136.1646162959407; 
 Tue, 01 Mar 2022 11:29:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpLY9TTBQgKSPEKTWZlSp5xirp8uo7AKtiTGqXvhErF6hETfzSvsXuEhplLz2OX8xyyVD/vQ==
X-Received: by 2002:a05:6870:87c4:b0:bc:4b13:b0c0 with SMTP id
 s4-20020a05687087c400b000bc4b13b0c0mr5039301oam.136.1646162959171; 
 Tue, 01 Mar 2022 11:29:19 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 t7-20020a9d5907000000b005afa4058a4csm7019270oth.1.2022.03.01.11.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 11:29:18 -0800 (PST)
From: trix@redhat.com
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, corbet@lwn.net, bhelgaas@google.com
Subject: [PATCH] vgaarbiter: fix vgaarbiter doc build break
Date: Tue,  1 Mar 2022 11:29:09 -0800
Message-Id: <20220301192909.294900-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

make htmldocs fails with
Error: Cannot open file ./drivers/gpu/vga/vgaarb.c

The location of the file changed
drivers/gpu/vga/vgaarb.c -> drivers/pci/vgaarb.c
So update the docs with the new location.

Fixes: d6e1898bfa5b ("PCI/VGA: Move vgaarb to drivers/pci")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 Documentation/gpu/vgaarbiter.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaarbiter.rst
index 339ed5fecd2e4..bde3c0afb0590 100644
--- a/Documentation/gpu/vgaarbiter.rst
+++ b/Documentation/gpu/vgaarbiter.rst
@@ -100,7 +100,7 @@ In-kernel interface
 .. kernel-doc:: include/linux/vgaarb.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/vga/vgaarb.c
+.. kernel-doc:: drivers/pci/vgaarb.c
    :export:
 
 libpciaccess
-- 
2.26.3

