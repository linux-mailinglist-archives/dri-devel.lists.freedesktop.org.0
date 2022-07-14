Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 730CA574E7C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 15:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257FC10ED59;
	Thu, 14 Jul 2022 13:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21D010F372
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 13:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657803633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iKnFxqR/xnLOGU/x0kBd7RKVjTH74hGUTCbW3S5Ws0I=;
 b=Yug1ZbBohvegt39dVItOPbiMp1JddPTPimGaHfeSX83Ch/zcnkXxG8Qka1n69qDcoke20S
 +qxaiSwt3Efh64WuhfXyeh0NHPBmxI4U05Btcm8fWXedQU7JcW3SxsvL662bxQdT46nWk0
 wdUZ78H/Bv717ukos0FB64zUCrspfCU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-RIpoeq2hPHiiTCAi9ikkNQ-1; Thu, 14 Jul 2022 09:00:32 -0400
X-MC-Unique: RIpoeq2hPHiiTCAi9ikkNQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 z14-20020a056402274e00b0043ae5c003c1so1470166edd.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 06:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iKnFxqR/xnLOGU/x0kBd7RKVjTH74hGUTCbW3S5Ws0I=;
 b=L9lvCxmxhExZAMNbyb98BsGRm6P63sAiMCN1AmEn9XZQ+n0MdhhJyLKNDtXiwG445b
 mJhzZvvwtV0gW0kVf14ztA/nLzBkTy6cAkUs/t+OmX6ZymJb1Su90nEPlKGL+CTQbJq3
 1YXC8QyalNhf4TVzAvlHTm17Y5bjVfg7NchI/vmP/86cPTKjtdI08wV56XxPqsmFMUBL
 VyDNGdVvlOXDX0tcTGe+crLwszT2kv7SWwqpNqruCzm06aFuhMa4l4rGn39YzC71faU2
 kjBkTJj+aiSeVXki+QHjB8NOYJ1ObcmMPBf9FBdDnFVWbK1nfulPFkqTDmHWTNvLag/c
 2uwQ==
X-Gm-Message-State: AJIora+zUqqq1rfAY9/CPHOApMHaySZuRnKioc9CFuUZTJX8Ixfrjgvd
 FA+mqExiX83WK0WPwEm3hJ1PflLxd/E77eHVYy1PzV5fViA/WlG/44jIfgYb7brQBsH8sj3TjmL
 ssOEjUXv3sRIIX9yoZ/h6B3OAwH2p
X-Received: by 2002:a05:6402:2786:b0:43a:dc4e:ea63 with SMTP id
 b6-20020a056402278600b0043adc4eea63mr12517998ede.175.1657803631530; 
 Thu, 14 Jul 2022 06:00:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t+2ObxccmxD712cuXRmX9quI6ekyMGtiKiuOhSEY86aReh6m2BXNY85vO9S1aEdOFNawKcDA==
X-Received: by 2002:a05:6402:2786:b0:43a:dc4e:ea63 with SMTP id
 b6-20020a056402278600b0043adc4eea63mr12517965ede.175.1657803631343; 
 Thu, 14 Jul 2022 06:00:31 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 zk9-20020a17090733c900b0072ecef772acsm694237ejb.2.2022.07.14.06.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 06:00:30 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	kraxel@redhat.com
Subject: [PATCH 0/2] drm/virtio: use drm managed resources
Date: Thu, 14 Jul 2022 15:00:26 +0200
Message-Id: <20220714130028.2127858-1-dakr@redhat.com>
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

