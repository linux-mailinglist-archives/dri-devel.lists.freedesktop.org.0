Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B6057B804
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 16:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A1311AF68;
	Wed, 20 Jul 2022 14:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE3811380B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 14:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658325741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iKnFxqR/xnLOGU/x0kBd7RKVjTH74hGUTCbW3S5Ws0I=;
 b=MjGkRu3vb4DN0BGLMTpwtI2xzbNW65l/B6PNBxgE8B6UdzTPkqBXUU/e5CLdQPwuEpp/nI
 DsXJzDL0vl/r6DQiQ//k8VSPMG+24HAi6epSm5n2wiIzXeZDPBL/unDX/LplNTyMK3Vdpr
 +iILspQsBeQqqh0QCBa867QjXitZ2vs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-ec1dlsxcPNSj5Q49X3B4hQ-1; Wed, 20 Jul 2022 10:02:20 -0400
X-MC-Unique: ec1dlsxcPNSj5Q49X3B4hQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 y21-20020a056402359500b0043adf65d1a0so12103659edc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 07:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iKnFxqR/xnLOGU/x0kBd7RKVjTH74hGUTCbW3S5Ws0I=;
 b=fOAs/eT1xHCS+dGqu6EZSIpN+53fVFfHXIBYVx7gwkS5TRn+Tuu2E7cCJhxPO5QD0p
 VLgZVhdxVi3WkDz/YlgK/aZ3d0WZXy8T3G/7n2NM309rM32DsJHoCH4IuU8XfF7oB8Ko
 wWEKdlTKYFTHTRxIOlA2Lo7LAx96hEITYOQ7OLlhY3wQPjGjSNPLQHP/N9ZROmxzGLTX
 GsJKkQARg92Ax63I1/6UCNBvD/RoAULE6Tq2xYkuJFOF5QB6bVWdNzZ1uuJ7GpKygREE
 ViJ/YhD9IPusO0MW2iq87kLLf9v9GAnja8EEMOxpqdv2CKcllheCV285x6nnf1Dp8SW+
 Mc5g==
X-Gm-Message-State: AJIora8eDkEzFC4exd1MfTlWV8kziGj/lu+76ZGs9ghyzkgn0hvfd3EM
 r/XrI6bHK9FpVwbzBTwm5dlxvxk+4CclDdA15f48S644gfju+XBaCmaQtDrKOJ8bXUL2w+d88fl
 nBO6IEidxh8XKN0ox1G+VRsbsC0w2
X-Received: by 2002:a17:906:99c5:b0:6df:8215:4ccd with SMTP id
 s5-20020a17090699c500b006df82154ccdmr33944151ejn.684.1658325739441; 
 Wed, 20 Jul 2022 07:02:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u7RPMn+gfIrWOhHU+fL8XR930gM9Bvh1ZvK9ZXRK1yNq0MQtL/PL8tYuk1qkNEh3O6EQu5kA==
X-Received: by 2002:a17:906:99c5:b0:6df:8215:4ccd with SMTP id
 s5-20020a17090699c500b006df82154ccdmr33944136ejn.684.1658325739259; 
 Wed, 20 Jul 2022 07:02:19 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a170906560d00b006fee98045cdsm8053040ejq.10.2022.07.20.07.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 07:02:18 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	kraxel@redhat.com
Subject: [PATCH RESEND 0/2] drm/virtio: use drm managed resources
Date: Wed, 20 Jul 2022 16:02:12 +0200
Message-Id: <20220720140214.199492-1-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
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

This patch series converts plain memory allocations for driver structures and
planes to drm managed allocations in order to cleanup/simply the corresponding
release/destroy callbacks.

Danilo Krummrich (2):
  drm/virtio: plane: use drm managed resources
  drm/virtio: kms: use drm managed resources

 drivers/gpu/drm/virtio/virtgpu_kms.c   | 16 ++++++--------
 drivers/gpu/drm/virtio/virtgpu_plane.c | 30 +++++++-------------------
 2 files changed, 15 insertions(+), 31 deletions(-)

-- 
2.36.1

