Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A421DD8A2
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 22:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01176E959;
	Thu, 21 May 2020 20:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B58E6E959
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 20:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590094024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZCbHVU++ADvqtlwI3liORSZGCKRYFsaHclPVH+arJhU=;
 b=a6ieZxkDXHsjGi0QQxdCHtjtestv2d/lYYQvqDwTPiZQxEgaG6rd6LB6+neVAczHZ4DCc+
 3c03EWPgNanoOHgFEkFSNAkc4rfMrNSK9rHDv03fjvgElLFeFVo3h/cNzXgHvza5fq3r8q
 OzDSvr1KF64IVYbMWvY+A4KwP/DfI8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-gzgkwDQFMVKsC_RoQwr3Ew-1; Thu, 21 May 2020 16:47:00 -0400
X-MC-Unique: gzgkwDQFMVKsC_RoQwr3Ew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7559918FE860;
 Thu, 21 May 2020 20:46:58 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-116-188.rdu2.redhat.com
 [10.10.116.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C97B56ED80;
 Thu, 21 May 2020 20:46:56 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vblank: Fix -Wformat compile warnings on some arches
Date: Thu, 21 May 2020 16:46:47 -0400
Message-Id: <20200521204647.2578479-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some architectures like ppc64le and aarch64, compiling with
-Wformat=1 will throw the following warnings:

  In file included from drivers/gpu/drm/drm_vblank.c:33:
  drivers/gpu/drm/drm_vblank.c: In function 'drm_update_vblank_count':
  drivers/gpu/drm/drm_vblank.c:273:16: warning: format '%llu' expects
  argument of type 'long long unsigned int', but argument 4 has type
  'long int' [-Wformat=]
    DRM_DEBUG_VBL("updating vblank count on crtc %u:"
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ./include/drm/drm_print.h:407:22: note: in definition of macro
  'DRM_DEBUG_VBL'
    drm_dbg(DRM_UT_VBL, fmt, ##__VA_ARGS__)
                        ^~~
  drivers/gpu/drm/drm_vblank.c:274:22: note: format string is defined here
           " current=%llu, diff=%u, hw=%u hw_last=%u\n",
                     ~~~^
                     %lu

So, fix that with a typecast.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Co-developed-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/drm_vblank.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index acb3c3f65b579..1a96db2dd16fa 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -342,7 +342,7 @@ static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe,
 
 	DRM_DEBUG_VBL("updating vblank count on crtc %u:"
 		      " current=%llu, diff=%u, hw=%u hw_last=%u\n",
-		      pipe, atomic64_read(&vblank->count), diff,
+		      pipe, (unsigned long long)atomic64_read(&vblank->count), diff,
 		      cur_vblank, vblank->last);
 
 	if (diff == 0) {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
