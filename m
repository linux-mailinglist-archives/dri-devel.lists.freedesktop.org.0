Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58154599A68
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 13:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4D910EA4A;
	Fri, 19 Aug 2022 11:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B97110E8F4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 11:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660907335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZqI5vZLpia5ct5t7JuYb11QdDPq9USkS4MLCaMGWylI=;
 b=PMoJcCEYpFkoEgfcatUBo2IgBPT5dtjjC4U7xp9yKXgfoZ5cQNr11BtRApDsgO57ovo+Ox
 KxNkuZsD1YE/7c4qAQoFNF+H8xlGQ1y6DKTMq5nDTH3pLMhWRGcALYbRrMhCTbv1MOo4jg
 cbOdHNmAOMPVqP3bRCASgskDFCoL//w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-JMGiymvhPWuvBeYFn4jfGQ-1; Fri, 19 Aug 2022 07:08:54 -0400
X-MC-Unique: JMGiymvhPWuvBeYFn4jfGQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 w17-20020a056402269100b0043da2189b71so2602066edd.6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 04:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ZqI5vZLpia5ct5t7JuYb11QdDPq9USkS4MLCaMGWylI=;
 b=48vv1oyyw+Hv17ynmz3TJDMaxqbUVihGWAZtxclbLos1R87rChOd5Ch9y6NRv14fwt
 9tJht5XidepoZwF+YLHC+qS432ezUEU493vG/ETA+BLuX0HT/t77WipFUDuMdCJS4grI
 U07NLYWWpsYPQph6+JJVoamEZUenyHzO2dX8KLdua/54mFlAC0Va2nW7xFqeRddWgFhb
 iic0W6BrdZPzTOxkCJyBjjNQYwE70ATUFTNf0T7wGUU+6HAgmYiGk2fTDSJEo56kP7ck
 nhmRQQdYFKqX29X+4E852VHKkWMyldn81SHfMt+9iuS4HJFAhxNUQJHk3r3WosB7gPDf
 U6KQ==
X-Gm-Message-State: ACgBeo1sD4Kiozj/uHdjxeHS/wYvbSMTojeSNjOFHAlbv91/uKxu10Xm
 yv/0Kp9at5HeTAifpZ5kVjd2/g+HXIeL5PZbTe/9G2vakzuGaJYoiATTy7Grrd37GdDwW6c1fW/
 Q3GY0rAPub3AnsUuROeA3HBdSTFbX
X-Received: by 2002:a17:907:7214:b0:731:465d:a77c with SMTP id
 dr20-20020a170907721400b00731465da77cmr4444775ejc.308.1660907333301; 
 Fri, 19 Aug 2022 04:08:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR73kb35vu9cHeWsEco9u/k6H/Hyebp7jx52dcbEuWBWpQkfXhPntXEIALCybwbQfWKXG12SEg==
X-Received: by 2002:a17:907:7214:b0:731:465d:a77c with SMTP id
 dr20-20020a170907721400b00731465da77cmr4444764ejc.308.1660907333157; 
 Fri, 19 Aug 2022 04:08:53 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a1709060cd100b007308fab3eb7sm2167827ejh.195.2022.08.19.04.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:08:52 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH drm-misc-next v2 0/4] Fixes for vc4 hotplug rework
Date: Fri, 19 Aug 2022 13:08:45 +0200
Message-Id: <20220819110849.192037-1-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
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

Hi,

I've found a few potential issues left after the hotplug rework.

In vc4_hdmi.c we're missing two mutex_unlock() calls when the device is
unplugged.

vc4_crtc and vc4_plane seem to miss some drm_dev_enter()/drm_dev_exit() calls
to protect against resource access after the device/driver is unbound, but the
DRM potentially isn't freed yet and userspace can still call into the driver.

Changes in v2:
  - Use drm_device pointer from struct drm_plane (Maxime)
  - Protect entire functions to increase readability (Maxime)
  - Add another patch to fix an uncovered MMIO access in vc4_hvs.c

Danilo Krummrich (4):
  drm/vc4: hdmi: unlock mutex when device is unplugged
  drm/vc4: plane: protect device resources after removal
  drm/vc4: crtc: protect device resources after removal
  drm/vc4: hvs: protect drm_print_regset32()

 drivers/gpu/drm/vc4/vc4_crtc.c  | 41 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.c  |  7 ++++--
 drivers/gpu/drm/vc4/vc4_hvs.c   |  4 ++--
 drivers/gpu/drm/vc4/vc4_plane.c | 20 ++++++++++++++++
 4 files changed, 67 insertions(+), 5 deletions(-)


base-commit: 8ba9249396bef37cb68be9e8dee7847f1737db9d
-- 
2.37.2

