Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41265991BD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 02:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E8110E4DE;
	Fri, 19 Aug 2022 00:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D5610E4DE
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 00:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660868953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QjKDaOf5VrUR9aSan2WIUuQM3BhgteOS+VRIFGCRBQA=;
 b=YUdRyBV/KXKSm8DlO/xqaLb1RSVBvgv5kc54/5yi5W49BUY7ksA7qDQ5SRgVTWEWXuv3MR
 7Eyz9aVYN1FU4zUqgO8QvDxneu1ms4jr+5uSXEn6WJ6mNjeP6iagQ7+nFWJ8BQXBvUhG9z
 l8kNu67M6t5UC48WloOg7j/oNVfnrtQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-snqLOzYnN5-Y9yyuqNd0ug-1; Thu, 18 Aug 2022 20:29:11 -0400
X-MC-Unique: snqLOzYnN5-Y9yyuqNd0ug-1
Received: by mail-ed1-f72.google.com with SMTP id
 o2-20020a056402438200b0043d552deb2aso1847489edc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 17:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=QjKDaOf5VrUR9aSan2WIUuQM3BhgteOS+VRIFGCRBQA=;
 b=20NnNsv5YoQK3Dg8gm2yWqk8uqSmhsXfrbpm8562f8kQP1mjj8ul9x7WRbJyrPi28j
 okwMgP+R5+wXNMp+9zzw24S/QPTjhioBM7uKaFwvA17BUXIhGWt4D7X/L/HxXz9532Yx
 lksa//EabRttHrzBkX/nngwhCaomd42narfFIwq3774WRDXqFXaqIGwcb81pnqIBdJX6
 nVh1DPTrDGxMZuKYcWwKUm8rGW+HnPtLpYVu356LmX8VQAgVVCrH+imi+PzRPTaJ4Z7A
 s45Unili5qnP0qK483R/p9wF+K9zLHuzMbcfzcjsjqeJMXP7ND8Lf/xlIO5MUAGxXbyZ
 lBXQ==
X-Gm-Message-State: ACgBeo3pY937rGfEVOhfENHOlNzaBI1M6gAJgza9JssJzru+psnVEFaS
 1/lPg3sKYX+0J99ZaeZsrPCcwuelpLqjeEPbzW75IDl0xxGH9o2FlmCIu4QUX39mZY818xhPqMG
 Rov2O9uge/p6ywGrhosffIQ3e62U/
X-Received: by 2002:a17:907:b19:b0:730:b0d8:750 with SMTP id
 h25-20020a1709070b1900b00730b0d80750mr3251510ejl.46.1660868950480; 
 Thu, 18 Aug 2022 17:29:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR41UEbU7E96B5pVjIewvKNNPfANaqzwVo+RAQVp2oV943hHXtlWHyB65FWfFjj1qjf2AX2dHA==
X-Received: by 2002:a17:907:b19:b0:730:b0d8:750 with SMTP id
 h25-20020a1709070b1900b00730b0d80750mr3251501ejl.46.1660868950316; 
 Thu, 18 Aug 2022 17:29:10 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 b26-20020aa7cd1a000000b004460b020ffdsm2027913edw.83.2022.08.18.17.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 17:29:09 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH drm-misc-next 0/3] Fixes for vc4 hotplug rework
Date: Fri, 19 Aug 2022 02:29:02 +0200
Message-Id: <20220819002905.82095-1-dakr@redhat.com>
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

Danilo Krummrich (3):
  drm/vc4: hdmi: unlock mutex when device is unplugged
  drm/vc4: plane: protect device resources after removal
  drm/vc4: crtc: protect device resources after removal

 drivers/gpu/drm/vc4/vc4_crtc.c  | 41 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_drv.h   |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c  |  7 ++++--
 drivers/gpu/drm/vc4/vc4_plane.c | 25 ++++++++++++++++++++
 4 files changed, 71 insertions(+), 3 deletions(-)


base-commit: 8ba9249396bef37cb68be9e8dee7847f1737db9d
-- 
2.37.2

