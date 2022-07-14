Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B22575435
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 19:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEAA10F726;
	Thu, 14 Jul 2022 17:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF5710FBD7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657820582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kkoL+N0anXvIfREutcAdVwnSsLavnD7q+RdRvz8h3vc=;
 b=HNSJ0AoCn3hbHRgat5we0plfqeUr1beDdQaE6ukE8AmCsVY0K8cuvqbbTZV8J9Tb9KiuDL
 2a+kUJiSzhdD9aBMJkgYd36X8GWBxN7gjm3wCAH7TuLYBLL3W+DiI2R3e8jaNDeNO3UEsT
 qoH/W9Xg6BM71nvon9I9+ftb8pSorW0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-lFPaophEPDibys_LAzmnqw-1; Thu, 14 Jul 2022 13:42:52 -0400
X-MC-Unique: lFPaophEPDibys_LAzmnqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCD8C804184;
 Thu, 14 Jul 2022 17:42:51 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.10.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FDAC400EAB2;
 Thu, 14 Jul 2022 17:42:51 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v2 0/2] Miscellaneous runtime PM fixes for Nouveau
Date: Thu, 14 Jul 2022 13:42:32 -0400
Message-Id: <20220714174234.949259-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noticed these minor issues while trying to investigate

https://bugzilla.redhat.com/show_bug.cgi?id=2086470

While unfortunately I've been unable to confirm whether these patches
fix the specific problem in question, they're likely fixes we want to
pull in regardless.

Lyude Paul (2):
  drm/nouveau/acpi: Don't print error when we get -EINPROGRESS from
    pm_runtime
  drm/nouveau: Don't pm_runtime_put_sync(), only
    pm_runtime_put_autosuspend()

 drivers/gpu/drm/nouveau/nouveau_display.c | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_fbcon.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.35.3

