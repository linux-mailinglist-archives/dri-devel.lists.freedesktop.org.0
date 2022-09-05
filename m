Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D89C05AD40D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 15:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1486D10E38E;
	Mon,  5 Sep 2022 13:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E844010E38E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 13:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662385062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=euM8p/oF3VMfu7X8U7bTPRCu86DFEL3unpCKNWNsbB4=;
 b=TGhBJj4ZP8TlXchMwaSnFXOfMxNCEjrRo/r5n2wau+S60c+NUFbjOitzn2jNiJ8mksoNjE
 L4zSbdu2tSuuaHDcvJHJ0jSbXqNydESTSE6dM7PId/J+auCn35FA77VDIrGkWmkfjLRCFH
 uEBgwv2KQMFIkGVJ/gvykX9BHcm/3c4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-gFM5ONXkNu6OtXj1VreWSw-1; Mon, 05 Sep 2022 09:37:41 -0400
X-MC-Unique: gFM5ONXkNu6OtXj1VreWSw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C857D29ABA10;
 Mon,  5 Sep 2022 13:37:40 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF0A040D282E;
 Mon,  5 Sep 2022 13:37:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH 0/3] drm/gma500: Fix 2 locking related WARN_ON oopses
Date: Mon,  5 Sep 2022 15:37:35 +0200
Message-Id: <20220905133738.466490-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

I have been testing the gma500 code on a Packard Bell Dot SC (Intel Atom
N2600, cedarview) laptop because I'm working on aligning the gma500
backlight code with the changes done to other drivers in the recent
backlight refactoring.

During the testing I noticed dmesg filling with a WARN_ON constantly
triggering.

This series consists of 3 small non backlight fixes,
2 of which fix WARN_ON oopses/backtraces.

Regards,

Hans


Hans de Goede (3):
  drm/gma500: Fix BUG: sleeping function called from invalid context
    errors
  drm/gma500: Fix crtc_vblank reference leak when userspace queues
    multiple events
  drm/gma500: Fix WARN_ON(lock->magic != lock) error

 drivers/gpu/drm/gma500/gem.c         |  4 ++--
 drivers/gpu/drm/gma500/gma_display.c | 21 ++++++++++++++-------
 2 files changed, 16 insertions(+), 9 deletions(-)

-- 
2.36.1

