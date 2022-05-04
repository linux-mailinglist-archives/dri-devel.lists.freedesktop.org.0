Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0A151A121
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 15:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC5B10ECF4;
	Wed,  4 May 2022 13:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CF310ECF4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 13:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651671651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hRw10w18YqMmpXwWoMnPkU3yug5+gYkjZ9Mhtb+Hvn8=;
 b=UqeraU51ZfDCqoq3uniYV/kNwQF6LgI5cIttkj7oztuQA4l65Vrka8vxBCSnbzn+ogZjNp
 grBRMaS8lvVOq9BfrIokABWhbORoriXTazsBrKI4+yjg904kvAIcxjUdo/l7UCfUQYBwvJ
 rrIrGkYSD2Msv3cxExQPZg7lPXdF8+A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-g6OYgXB8NXGgSnrLxRS1Yg-1; Wed, 04 May 2022 09:40:48 -0400
X-MC-Unique: g6OYgXB8NXGgSnrLxRS1Yg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E614A3810D26;
 Wed,  4 May 2022 13:40:47 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FB97C28101;
 Wed,  4 May 2022 13:40:46 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
	lyude@redhat.com,
	tzimmermann@suse.de
Subject: [PATCH v2 0/3] mgag200: Improve damage handling
Date: Wed,  4 May 2022 15:40:23 +0200
Message-Id: <20220504134026.283417-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mgag200: Improve damage handling

This series improves the damage handling on Matrox gpu, and allows
Gnome/Wayland to run much better.
Also include some driver cleanup.

Tested on a Dell T310 with Matrox MGA G200eW WPCM450 (rev 0a)

v2:
 Drop remove mgag200_probe_vram()
 Rewrote the patch to warn if startaddr is not 0, and hw doesn't
  support it. (instead of removing the unused flag).

Thanks,

-- 

Jocelyn


Jocelyn Falempe (3):
  mgag200: Add FB_DAMAGE_CLIPS support
  mgag200: Optimize damage clips
  mgag200: Warn once if trying to set start address on broken hardware.

 drivers/gpu/drm/mgag200/mgag200_mode.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

-- 
2.35.1

