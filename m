Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A92772AF0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F23010E2C8;
	Mon,  7 Aug 2023 16:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0D510E2C1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 16:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691425984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7zFP8XpgqMd1ZR+xUc/aq9ardUQohRgS98TLoMxhZWU=;
 b=JAjmgy5OSbvlz/45hbCxM6lEmxV+oVMV03enNWsNDHGny/gOy2Pt9d97yFgoxBMVaPKaAN
 pFK/AD65tlDwSgARMZxPZkMo5TAfyRzTBbkB9dmiBMbA4zUdyz3Ugdirq03ib6Xzo0yoPn
 3J7yVl8IigZIP+MujsQzDwITIbuYLMc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-xekXVb3TMNuIFUfymeJmUg-1; Mon, 07 Aug 2023 12:33:03 -0400
X-MC-Unique: xekXVb3TMNuIFUfymeJmUg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-99bcfdaaa52so320336166b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 09:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425979; x=1692030779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7zFP8XpgqMd1ZR+xUc/aq9ardUQohRgS98TLoMxhZWU=;
 b=MLxzzBHtDmZgKUYy9qlxFH9k1Ek65VQboUL3uc21hac7916eWtcfrYfh5IWetoIClL
 ePYZj08MG+PUOOUMCTehc9LgHM1+hllLfmHCepeCHQcFClrtXuJiopil58GKMhavAEsI
 T3GlyAcfTT9XKpTHEt7PAT/7f5JwAHjVgqDGng6wj3ThE6IZg74rUDWXzyfityjysEqc
 s0dJdYLScfWgWoTIEhUC/cFCAyFnigtMaYnXgqSXQc1HdXdZJ0rQr51s48MWZUSh/Pzq
 EVj5y8PowSe8AsVSRjGHcH6wfoqInp3qfW07tl9FRoLw/+X2Chhg0iFyYGqhPwRu3ScI
 RrZQ==
X-Gm-Message-State: AOJu0YzpDnTqpEAGvMl+e7K62AesEOJlCTVyrfoPRRnsU0ad0R9UWLpy
 k/OAwLWetHjR5vkenxZ/nPXPzY833ybqflzE/+xknFxXGkNmYH2j1074B9L9JnWzlnAU+oPfvCs
 DHwmugT5sj733qLZd63L8MFFmhH41
X-Received: by 2002:a17:906:5dce:b0:99c:aa43:b20c with SMTP id
 p14-20020a1709065dce00b0099caa43b20cmr6276318ejv.33.1691425978963; 
 Mon, 07 Aug 2023 09:32:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzwa0036YfN6zZ9wxNCsP6a+2soTFVv0lKi71JnNJfbR+fIxNYwVKxG8hEDVJBGDY4OrEouA==
X-Received: by 2002:a17:906:5dce:b0:99c:aa43:b20c with SMTP id
 p14-20020a1709065dce00b0099caa43b20cmr6276305ejv.33.1691425978678; 
 Mon, 07 Aug 2023 09:32:58 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 bn10-20020a170906c0ca00b00992b0745548sm5435523ejb.152.2023.08.07.09.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 09:32:58 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, sfr@canb.auug.org.au
Subject: [PATCH drm-misc-next 4/5] drm/nouveau: uvmm: remove incorrect calls
 to mas_unlock()
Date: Mon,  7 Aug 2023 18:32:25 +0200
Message-ID: <20230807163238.2091-5-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807163238.2091-1-dakr@redhat.com>
References: <20230807163238.2091-1-dakr@redhat.com>
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
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove incorrect calls to mas_unlock() in the unwind path of
__nouveau_uvma_region_insert(). The region maple tree uses an external
lock instead, namely the global uvmm lock.

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 2acbac73e57a..91b964ef98b1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -279,15 +279,11 @@ __nouveau_uvma_region_insert(struct nouveau_uvmm *uvmm,
 	u64 last = addr + range - 1;
 	MA_STATE(mas, &uvmm->region_mt, addr, addr);
 
-	if (unlikely(mas_walk(&mas))) {
-		mas_unlock(&mas);
+	if (unlikely(mas_walk(&mas)))
 		return -EEXIST;
-	}
 
-	if (unlikely(mas.last < last)) {
-		mas_unlock(&mas);
+	if (unlikely(mas.last < last))
 		return -EEXIST;
-	}
 
 	mas.index = addr;
 	mas.last = last;
-- 
2.41.0

