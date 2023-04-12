Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99F96DF76E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 15:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A6710E07C;
	Wed, 12 Apr 2023 13:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BCF10E07C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681306813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jQ6mJvnGaQk+RNp54KZbj74EGw8UX/r2OpNLi6ETIYg=;
 b=H3dRyudPzG5eYD5IJ496ZnS+YucPuDxyvhWOXP+zc3WS9CuO2dn03s1GvDpXeXXj0lShlq
 G0prpRuF4VcakFZcE3ZApgnDZtjiHZ/a+vNLXXvJCItliPfcZV/hZj9fofauAX4yXYJt69
 KJlYrsKFO11OUHBsuT73N++jvd8SPEU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-JmSfxG6yMSq834Ohkp5s-g-1; Wed, 12 Apr 2023 09:40:12 -0400
X-MC-Unique: JmSfxG6yMSq834Ohkp5s-g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFC4F3815EEF;
 Wed, 12 Apr 2023 13:40:11 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB0DA492C3E;
 Wed, 12 Apr 2023 13:40:10 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 javierm@redhat.com, lyude@redhat.com
Subject: [RFC PATCH 0/2] drm/mgag200: Use 24bit format in VRAM
Date: Wed, 12 Apr 2023 15:39:10 +0200
Message-Id: <20230412133912.610294-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

The bandwidth between system memory and VRAM is very limited
on G200.
So when using a 32bit framebuffer on system memory, convert it to 24bit
when copying the frame to the VRAM, this allows to go 33% faster.
Converting the format on the fly is negligible, even on low end CPU.

[PATCH 1/2] drm/mgag200: simplify offset and scale computation.
[PATCH 2/2] drm/mgag200: Use 24bit format in VRAM

drivers/gpu/drm/mgag200/mgag200_mode.c | 87 ++++++++++++++++++++++++++++++++++++---------------------------------------------------
 1 file changed, 36 insertions(+), 51 deletions(-)



