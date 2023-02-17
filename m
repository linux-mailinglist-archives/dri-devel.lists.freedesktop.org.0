Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CAA69ACFD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B5710F001;
	Fri, 17 Feb 2023 13:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C89110EFE5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7uKZrgGFJpURUNNqYPRQvVp3RBdWsUReZR9Qa+W+o5s=;
 b=VgF1xCMRViNC5MoMXSeppypDYZslYo6iwTqkrAGW/CKURrRaWaH2oBB8ghQnQa96PFRRQt
 l8mndVHpU4WyuW4Tuntk2qgDBEn1uSvp/jC95zpheDdx7iUMCn6VmfWgDbQGyNp5d/QnTh
 jdV6Vd6DuDgjwm6fxcMe9ljdF7rNCfY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-1e-Bo-TcPFy-s7lRNyVVfQ-1; Fri, 17 Feb 2023 08:44:38 -0500
X-MC-Unique: 1e-Bo-TcPFy-s7lRNyVVfQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 cb12-20020a0564020b6c00b0046790cd9082so2146430edb.21
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7uKZrgGFJpURUNNqYPRQvVp3RBdWsUReZR9Qa+W+o5s=;
 b=J1M13A/vV+KRuKeYaCQ9Gfwbz4jDy/YTNP9b01PBQ3b5UfSZSaw6b6AjO2GvyC9I42
 aRivQy/9oSejUUYUVvUAOO1EyYDNunRNiQGlz+795qULrRnWF+RANa4koERLmgRHLfAf
 1rO2G+Z2NS9Z5NGw7FqhIBEFcQ1hrJk6UMJdJewWrPIueRsS/PHwNgcWIofzyIWzsTl1
 aXFw7cVX5JV6ND06KngE9P+iBLhnMUePKvW58esz0mL6p4HeoElDcH0nCBgefcl27Tbz
 THEe+Q5r9yhHC4aJvxGL1FUgIzaxhNv7AqZdRRywPY0sQhkmvc8jiDHfueAlFddQRHok
 9z/A==
X-Gm-Message-State: AO0yUKX58ygWtxD2oQRpszmJ9IO/npBNnYJYAMIJWvHw7rLAQokM8w7w
 O6KGzaDBc7yrVXoW7Z3Vo9ykNzHorG1klAIhIUqXM4CpFq3P90rHHmY9o56Kv+ybBNYdGcDGxJj
 L1ZLcgwuKooIDZnEmvJSWRPyKzHHJevknEg==
X-Received: by 2002:aa7:c9c6:0:b0:4ae:e51e:9e3e with SMTP id
 i6-20020aa7c9c6000000b004aee51e9e3emr348791edt.24.1676641477312; 
 Fri, 17 Feb 2023 05:44:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9IRUJksGLLW/RDiXSfuPpHSO6kl3p0Lri0OcDeobF/5J+q0ZakgTJZKlO0HFr6pr+zDCdPAg==
X-Received: by 2002:aa7:c9c6:0:b0:4ae:e51e:9e3e with SMTP id
 i6-20020aa7c9c6000000b004aee51e9e3emr348775edt.24.1676641477173; 
 Fri, 17 Feb 2023 05:44:37 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a509508000000b004ad61135698sm1948004eda.13.2023.02.17.05.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:44:36 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v2 02/16] drm/exec: fix memory leak in
 drm_exec_prepare_obj()
Date: Fri, 17 Feb 2023 14:44:08 +0100
Message-Id: <20230217134422.14116-3-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>
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
2.39.1

