Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D457B369943
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 20:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9746E188;
	Fri, 23 Apr 2021 18:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B846E188
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 18:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619202124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Cg55Iw1JXBxapqO9g4AqcatPlphFbJjxV2toSncpADY=;
 b=AuMGq4dMih1eg3ODpenH5GdR43/hnsUZCqM6wzl+EGiW/MaZJYJ9bXI6byDOSRD9B2bnob
 uL5hcD/aie6hjjUm9lRzismzSMQfZXXpblzhqqY0tVEgIl66ArRxoHuDiKhYS5bTjladXd
 k33V4NywtBvbGdI4JmEik3OH0K5kYUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-l6AHCsVFP0q7LVIXbX1L9w-1; Fri, 23 Apr 2021 14:22:02 -0400
X-MC-Unique: l6AHCsVFP0q7LVIXbX1L9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D51E343A3;
 Fri, 23 Apr 2021 18:22:01 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-114-74.rdu2.redhat.com [10.10.114.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 117D7608BA;
 Fri, 23 Apr 2021 18:21:56 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/tegra: Fix device/module refs for DP
Date: Fri, 23 Apr 2021 14:21:44 -0400
Message-Id: <20210423182146.185633-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series fixes a regression that was introduced by one of the
changes I made to when Tegra registers its AUX adapters, along with
fixing some reference leaks that I found along the way.

			       !!!NOTE!!!

There's one thing I'm not entirely sure about, which is the use of
module references (e.g. try_module_get()) here. If I'm understanding how
this code worked previously: since the get_device call in tegra_sor_probe()
was previously the i2c adapter for the AUX channel - which itself is
initialized in drm_dp_aux_register() - then I -think- that the module
owner for the DDC adapter would likely have been drm_kms_helper. With
these changes, if I'm understanding things correctly we're now just
grabbing a module reference for ourselves - something which might not be
the best idea?

If anyone could confirm if I need to fix this or not that'd be
appreciated, along with reviews of course :P

Lyude Paul (2):
  drm/tegra: Get ref for DP AUX channel, not its ddc adapter
  drm/tegra: Fix DP AUX channel reference leaks

 drivers/gpu/drm/tegra/sor.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
