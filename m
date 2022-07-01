Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2312B56395F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 20:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A09218ACAF;
	Fri,  1 Jul 2022 18:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED01818ACC0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 18:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656701597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=122qxecwdqzJ8Ugfz+kvOKIEtAtbHr1tJgGRsr7PPpU=;
 b=AvjvoYYnMLmqwseQRu1vgpGmQijxHHpy+nbzqjnJlT8EYYhLIYHP4dmZ+K5INhCf6IkceM
 gx1nw6W43z8YQbKfUFrrGMsxWE532w4zv/Mco22TZ/YlSRSssq3VASPgUaECrN5zBJAnNP
 XhPKzkGig4fxoA48BAPXnWbhE/ebOVA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-UTTew-esN6uYm_sNgz552Q-1; Fri, 01 Jul 2022 14:53:16 -0400
X-MC-Unique: UTTew-esN6uYm_sNgz552Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 z17-20020a05640235d100b0043762b1e1e3so2291607edc.21
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 11:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=122qxecwdqzJ8Ugfz+kvOKIEtAtbHr1tJgGRsr7PPpU=;
 b=iNuWdcIfkfCuGok0rLj3IPGwLB1BZ9NJXOxscN8ge8LI/LhTwjVLItYtf3XSBriF/8
 FYbzHXtQPp6MM6+x/huAuJGnzVGCLD0Aymt94Hfl7saNyJKogFq7OWloh8/1hLwshATw
 ZWT3KG2221PSzDVAFkBU0967UBvfic4TxhAt8pRFz/b0zV5A9SAm+1b3HP9vQuFfOYqW
 //VxR/gxrxWuwNnveMGF5DAprwwXcegOx9atpNWyVfHLfx/tl0R6lb25zbew6bZl5d0d
 2nd5RF3gF6uXpb4Xbi+vU2GgjPB+Wxg/iXsocgwr9HkmXky69tHAgn9JPgXgfBWkrEz+
 B3Wg==
X-Gm-Message-State: AJIora8DQPx2fRyTJ23QgN46zr/nDRtisR4Z6CZW24EW0Zs3oMAYYvHA
 robAH5uR3IpE8alaWTP0ylUI4X06WQowCsZICeLTDvXHdpPK7NfZ7H7di4gbhcWDvhZlyhyVYPM
 5Jggi0ASzMLitX06FQqw/7x9Igf+l
X-Received: by 2002:a05:6402:498:b0:435:daf0:915b with SMTP id
 k24-20020a056402049800b00435daf0915bmr20387351edv.322.1656701595155; 
 Fri, 01 Jul 2022 11:53:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tfkBYtuvcwm4VYGQy9UccCKu7Qvni141Sl+kLC2NT5OI/FHv0D+4sTupIA3MUcMStiXF0FVw==
X-Received: by 2002:a05:6402:498:b0:435:daf0:915b with SMTP id
 k24-20020a056402049800b00435daf0915bmr20387327edv.322.1656701594973; 
 Fri, 01 Jul 2022 11:53:14 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 cb25-20020a0564020b7900b004359dafe822sm15406658edb.29.2022.07.01.11.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 11:53:14 -0700 (PDT)
From: dakr@redhat.com
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 emma@anholt.net
Subject: [PATCH 05/10] drm: use idr_init_base() to initialize
 mode_config.object_idr
Date: Fri,  1 Jul 2022 20:52:58 +0200
Message-Id: <20220701185303.284082-6-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701185303.284082-1-dakr@redhat.com>
References: <20220701185303.284082-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Danilo Krummrich <dakr@redhat.com>

idr_init_base(), implemented by commit 6ce711f27500 ("idr: Make 1-based
IDRs more efficient"), let us set an arbitrary base other than
idr_init(), which uses base 0.

Since, for this IDR, no ID < 1 is ever requested/allocated, using
idr_init_base(&idr, 1) avoids unnecessary tree walks.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_mode_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 37b4b9f0e468..e2a295a4ee0b 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -411,7 +411,7 @@ int drmm_mode_config_init(struct drm_device *dev)
 	INIT_LIST_HEAD(&dev->mode_config.property_blob_list);
 	INIT_LIST_HEAD(&dev->mode_config.plane_list);
 	INIT_LIST_HEAD(&dev->mode_config.privobj_list);
-	idr_init(&dev->mode_config.object_idr);
+	idr_init_base(&dev->mode_config.object_idr, 1);
 	idr_init(&dev->mode_config.tile_idr);
 	ida_init(&dev->mode_config.connector_ida);
 	spin_lock_init(&dev->mode_config.connector_list_lock);
-- 
2.36.1

