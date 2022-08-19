Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A142859A90C
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 01:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FF210E213;
	Fri, 19 Aug 2022 23:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB0310E2A8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 23:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660950664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AtnN6jebhmIGGhubsNu0FAYV6P8gfd744zQ5EQW7o6I=;
 b=ItVRkOlVPvAR48NXO1d6Xqn0AmrXQ5GuAaOUqSRwzTyvwduJWZ4c3SPv2g26D0C9W82fuR
 MQ+Fq7L8rLi4A/qhMK+qy/Ku0WN7jOXlRngTmW/qI7uWnZU75MGMjZuWwrevpfr5e4MJAO
 YaplQuqGQ+TxSpK82QoX8ttrdg0rlto=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-321-kS8XpmglMwSOaxOr7C_BSg-1; Fri, 19 Aug 2022 19:11:03 -0400
X-MC-Unique: kS8XpmglMwSOaxOr7C_BSg-1
Received: by mail-ej1-f72.google.com with SMTP id
 js11-20020a17090797cb00b00730d73eac83so1943316ejc.19
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 16:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=AtnN6jebhmIGGhubsNu0FAYV6P8gfd744zQ5EQW7o6I=;
 b=bGbi0B7IhXXKbR+oujf49aaCIcnAPfDmZILxUC1B4QZSX6WKiV77+HUZx7TV7R0ot2
 yqjz5ECYsgKegxYF31h62wuVM8HKlyqLALcj9kzwK4Y9CKvgqyD/IVXVHrfso59OwAD4
 B2zLQRTlPlkt2gAdp5Oq5e6NpA6HMzqVjmIeHYF+tzMS1pEFCb+y+zez3xSM20Kk27Za
 d1D5bDoZTDh0nUG7i+xDfLCtwQmf8cSZW48bNJGeGqhs5fcMpzZxHZ5XXKoqhkhb9Djg
 qZi6zJx8MMKy86i/HxU7q9k2SsKIElYr0dtteGhMbmtxe9bD042RHQ34MDjAMrkCzTHv
 WSDw==
X-Gm-Message-State: ACgBeo26j1TblblgconpdgeIEi2X2aEd6Gdqj/cu/Dx9oC+HMVNErMdY
 G0oddAdw1C8MZVGyPBEIRUccQwD2kTaF9FHQqbreMO2OIKEfQ6y0djxOx8yr57hZz9JlcHeRIcE
 aRWPPL2Eu7SMThSwiJHWDybLMG7x6
X-Received: by 2002:a17:906:8a73:b0:730:9af8:b335 with SMTP id
 hy19-20020a1709068a7300b007309af8b335mr6434593ejc.14.1660950662119; 
 Fri, 19 Aug 2022 16:11:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7NBEOsuPoam3rZcTPy0EjMDMllWg/Gb0657kWfoZyVC8nmly7FDaP4Aw8yt3ZTCCA2Q0I9QA==
X-Received: by 2002:a17:906:8a73:b0:730:9af8:b335 with SMTP id
 hy19-20020a1709068a7300b007309af8b335mr6434581ejc.14.1660950661899; 
 Fri, 19 Aug 2022 16:11:01 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 ss28-20020a170907c01c00b00730a18a8b68sm2887088ejc.130.2022.08.19.16.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 16:11:01 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 0/7] drm/arm/hdlcd: use drm managed resources
Date: Sat, 20 Aug 2022 01:10:51 +0200
Message-Id: <20220819231058.647658-1-dakr@redhat.com>
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

This patch series converts the driver to use drm managed resources to prevent
potential use-after-free issues on driver unbind/rebind and to get rid of the
usage of deprecated APIs.

Danilo Krummrich (7):
  drm/arm/hdlcd: use drmm_* to allocate driver structures
  drm/arm/hdlcd: replace drm->dev_private with drm_to_hdlcd_priv()
  drm/arm/hdlcd: crtc: use drmm_crtc_init_with_planes()
  drm/arm/hdlcd: plane: use drm managed resources
  drm/arm/hdlcd: use drm_dev_unplug()
  drm/arm/hdlcd: crtc: protect device resources after removal
  drm/arm/hdlcd: debugfs: protect device resources after removal

 drivers/gpu/drm/arm/hdlcd_crtc.c | 78 ++++++++++++++++++++++++--------
 drivers/gpu/drm/arm/hdlcd_drv.c  | 36 ++++++++-------
 drivers/gpu/drm/arm/hdlcd_drv.h  |  2 +
 3 files changed, 79 insertions(+), 37 deletions(-)


base-commit: 8869fa666a9e6782c3c896c1fa57d65adca23249
-- 
2.37.2

