Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1E789922E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 01:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5889910E851;
	Thu,  4 Apr 2024 23:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JUKz/xUZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814C310E4FF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 23:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712273862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=boxkrV9ky/Gec9wmXQmveA81DL89h8BY/JSivzwPeBk=;
 b=JUKz/xUZoIATQP3AYV0BTWhL1OCl8niSsg1MmxJhRjNOmGKFeDtSOrOhLib/S0977WF+EU
 ygIzVNj503ZlqTz6UJKYoHxPVLjwA4MYfAhPPwd2kspL8Tifh/ahjORkNi/ElO1dr9p5uS
 bRok78wj7hzoZbomO+DexOJ3Gjdpwzw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-671-1ydl0QcxP3e6aHEiqVEUxQ-1; Thu,
 04 Apr 2024 19:37:40 -0400
X-MC-Unique: 1ydl0QcxP3e6aHEiqVEUxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C4C41C07F44;
 Thu,  4 Apr 2024 23:37:40 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.8.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3377F8173;
 Thu,  4 Apr 2024 23:37:40 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] nouveau: GSP DP aux fixes
Date: Thu,  4 Apr 2024 19:35:52 -0400
Message-ID: <20240404233736.7946-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Fixes for a few issues I've been seeing around regarding DP aux
transactions with nouveau and GSP support - mainly stemming from the
fact that GSP returns an error for aux transactions that are attempted
on disconnected ports. Some of these issues somehow manage to make
runtime PM fail on my Slimbook Executive 16!

Lyude Paul (2):
  drm/nouveau/kms/nv50-: Disable AUX bus for disconnected DP ports
  drm/nouveau/dp: Don't probe eDP ports twice harder

 drivers/gpu/drm/nouveau/nouveau_dp.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

-- 
2.44.0

