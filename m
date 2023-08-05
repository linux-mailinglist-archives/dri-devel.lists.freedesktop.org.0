Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED184770F3D
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 12:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6F310E0BE;
	Sat,  5 Aug 2023 10:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F2310E0BE
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691230699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EDl8FKi4TmGBJc8DUiagN0W08gSz4Sjm38M3DkmH1A8=;
 b=hn8ktiUJxERlzo0deOKj3fEEeB/MrVCD945S92yeLLGzhvvF/Ls8osj8AjdaaZwnsueyza
 S7b8bZ4kj8DP5y8cYK9Ayhbz7HH5+xtbcULuatp8/CdA8MgO+6bJIfk1mz3m0i4Lo1UfBn
 294WyyMvpu8xb2gcpTPqu3JG3x8GL8g=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-SzpViEHMOEK5idIE98tbAA-1; Sat, 05 Aug 2023 06:18:18 -0400
X-MC-Unique: SzpViEHMOEK5idIE98tbAA-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-63cebe9238bso7597296d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Aug 2023 03:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691230698; x=1691835498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EDl8FKi4TmGBJc8DUiagN0W08gSz4Sjm38M3DkmH1A8=;
 b=LH3uVmXYJ0ku8OsW10Ij9R7KlNHpHVEhE5bJ5t/Xy1k3iahtrkbsAcuGGGx4Z0uCma
 VdvgkIM9dMVARE/i+ZoYM9y+TJZmfeQ8ZSUhv2nOY8K08k6UtBWX6KNZtnoAn5QUbw6o
 bkPGuSX20U6s6d0g1lqAB2YK/iapHWx0ZvSX0Ke1PHupm6P0eGIXVjrNS3S+8Zr++GXO
 TpA/UsrSBMv5wBopw/bLsyLcbPzlqUG822kRVQpCUZajtqXUNp7cDnaaizugPKqA+YN7
 lxnuDWZk/rrIpBYWE3i6hJ9WkJYL08nrTEPQqMF+QA5Gx/Puh6Qrh4nYqWElV8POJJyj
 c8bw==
X-Gm-Message-State: ABy/qLYjSZFSoeror6h5FXd4KFtVueUxe1CX5fjxdJC8ncCcoVjS6IjZ
 5nRnXwIl6aVEB63hNwBtyCOKtAnFfu3FOzBVAsOqjuUMGmaYn9+SH3S/+bvuNs/ECSU0pNY44zn
 aklqEcNWfWPQp17OGkJYr4mJbDUuF
X-Received: by 2002:ac8:5c05:0:b0:40f:a5bb:5276 with SMTP id
 i5-20020ac85c05000000b0040fa5bb5276mr21244865qti.1.1691230697927; 
 Sat, 05 Aug 2023 03:18:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGxbKkXSoa09vwMpsK5fJJErUueAZzn6Eyh8re2STw/wxSsOI0uRnQzLEtQYQPJQ+wGIPPrkA==
X-Received: by 2002:ac8:5c05:0:b0:40f:a5bb:5276 with SMTP id
 i5-20020ac85c05000000b0040fa5bb5276mr21244843qti.1.1691230697692; 
 Sat, 05 Aug 2023 03:18:17 -0700 (PDT)
Received: from kherbst.pingu.com ([31.17.16.107])
 by smtp.gmail.com with ESMTPSA id
 dq15-20020a05622a520f00b0040c72cae9f9sm1247325qtb.93.2023.08.05.03.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Aug 2023 03:18:16 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/disp: Revert a NULL check inside
 nouveau_connector_get_modes
Date: Sat,  5 Aug 2023 12:18:13 +0200
Message-ID: <20230805101813.2603989-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Karol Herbst <kherbst@redhat.com>, Olaf Skibbe <news@kravcenko.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The original commit adding that check tried to protect the kenrel against
a potential invalid NULL pointer access.

However we call nouveau_connector_detect_depth once without a native_mode
set on purpose for non LVDS connectors and this broke DP support in a few
cases.

Cc: Olaf Skibbe <news@kravcenko.com>
Cc: Lyude Paul <lyude@redhat.com>
Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/238
Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/245
Fixes: 20a2ce87fbaf8 ("drm/nouveau/dp: check for NULL nv_connector->native_mode")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index f75c6f09dd2af..a2e0033e8a260 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -967,7 +967,7 @@ nouveau_connector_get_modes(struct drm_connector *connector)
 	/* Determine display colour depth for everything except LVDS now,
 	 * DP requires this before mode_valid() is called.
 	 */
-	if (connector->connector_type != DRM_MODE_CONNECTOR_LVDS && nv_connector->native_mode)
+	if (connector->connector_type != DRM_MODE_CONNECTOR_LVDS)
 		nouveau_connector_detect_depth(connector);
 
 	/* Find the native mode if this is a digital panel, if we didn't
-- 
2.41.0

