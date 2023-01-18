Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F849671399
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 07:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E97710E687;
	Wed, 18 Jan 2023 06:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39EC10E685
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674022414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bPNRTAzSirKPyPC/a7kemJ9gbWhkHOBWemjVPOdr94=;
 b=YVpiyCQXZKpcMcZrFioYkZAIv1enhimY9lKKsilWMnm/rGQbJ/vz9KdcGEuaHjo4VhbGHf
 7WrkSAWfWyhFFlL6kCtPvGxyLbo42epcUKsAGnbkwRbRemku2Uy+S8vHcrloZX3pJdCkqH
 B38rDm9zDPp1JyT8wN1fxbBQ03aZq1U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-393-ITTrUlr0Mi2mIdaqtsPWZA-1; Wed, 18 Jan 2023 01:13:33 -0500
X-MC-Unique: ITTrUlr0Mi2mIdaqtsPWZA-1
Received: by mail-ed1-f70.google.com with SMTP id
 z20-20020a05640240d400b0049e1b5f6175so5161284edb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 22:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9bPNRTAzSirKPyPC/a7kemJ9gbWhkHOBWemjVPOdr94=;
 b=2YT1eBUv+vv0wI0dT/jOuixqb2sl46ao2JYiOhQ+ZperT2rA57CCu4ardIT0SHBlj1
 N2jdbs8Xy6CN1JZAjjf4/TLmvWrIyoUvBhh08+mf3+MtHFGtwc2cNwic2cMEUj9sRFtz
 2YGGhLVZT6/q5ng9qkQQRH38yVWfTRlJ33SIodhy3JC6sMe4Dd5xP+Rbbgu5z0gwQJdI
 Rcvy8uAMeI+ekRINNQm16ue3h6KSnBMtVEat4XZ6kh8Bax9Gj2M0iF5vVC7D2TkqAr45
 +R8Ja2Wn3xvQFJUSJgEOw1qNwdKQfDtRD1M3xDbD3e1BmoT8q4Lb5wsomRjXlPSc2dHt
 W7pQ==
X-Gm-Message-State: AFqh2kqZDXbuoJGy9C9b4hC2TwnufZjIoHwe4M03aOa75VgoL+jA2wTX
 WQ+brRU3xI8Tu86iyq+64ErFX4vbmuQjsZfhcHMqvnHdda88ox3YuSYWT6IW3Jz6UBWQxkNivEx
 YaKGggnQw1s+gj6fG6//WwPdIcEOD
X-Received: by 2002:aa7:c0d4:0:b0:49d:9bd8:6253 with SMTP id
 j20-20020aa7c0d4000000b0049d9bd86253mr6311447edp.17.1674022411762; 
 Tue, 17 Jan 2023 22:13:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtjvWeO5BcMo55Z0OQiMRRnw0jtETl53EDUmTCOZ9HyMXZACKq57o1DdaU9DHq6GmVA9kdq0w==
X-Received: by 2002:aa7:c0d4:0:b0:49d:9bd8:6253 with SMTP id
 j20-20020aa7c0d4000000b0049d9bd86253mr6311429edp.17.1674022411580; 
 Tue, 17 Jan 2023 22:13:31 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 y11-20020aa7c24b000000b004954c90c94bsm13745667edo.6.2023.01.17.22.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:13:31 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
Subject: [PATCH drm-next 02/14] drm/exec: fix memory leak in
 drm_exec_prepare_obj()
Date: Wed, 18 Jan 2023 07:12:44 +0100
Message-Id: <20230118061256.2689-3-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't call drm_gem_object_get() unconditionally.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_exec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index ed2106c22786..5713a589a6a3 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -282,7 +282,6 @@ int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
 			goto error_unlock;
 	}
 
-	drm_gem_object_get(obj);
 	return 0;
 
 error_unlock:
-- 
2.39.0

