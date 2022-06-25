Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E5A55AD21
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5276410EE8A;
	Sat, 25 Jun 2022 22:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B2C10E7A4;
 Sat, 25 Jun 2022 22:55:22 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id g186so5687592pgc.1;
 Sat, 25 Jun 2022 15:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVam+OtTXmVRJOOFcNCglGVq9lRc/LFnzlVeuJ/h90Y=;
 b=IAhdRKg3wq32mnlusa8itT5j46bSw9XZvICjmv6qzqx3ihb0k18YtsvJ9pv5AnYsiE
 upVCMq8I+5PAKNimjSpuQ6XPiQG3N9qa7mAeRGB9s7CwnE3DoviY27XD5sqvfDHZ4Nkf
 zVMujpzshIWAFBlYTYrFc9q56eHrdNx45XKwEh/ahh+bZvVdIDIbjcHuDy2peQvuPlif
 Z5m9OrjQ0btB+MMpt1MCjnqtxlrKg6Xnw+MoZkJgW49rmB3n1jaG9fmilTU3knT+roFv
 Vn4uBH52BfUb9YXg56XqC+dchDK57hQ/d/+q43gaAktx4gHxTdxhpQtHoodt0X0TM+ZC
 cZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UVam+OtTXmVRJOOFcNCglGVq9lRc/LFnzlVeuJ/h90Y=;
 b=DfXc45/z64KSrTM0W5MmyIVQMvSCGZMT914Ma45I427X8/Yj+FlotKlcdtXZjTnWK6
 oNYl0ifbZXpD5xpSNagIIkHlSc84h4sHSjDBrIvAmNCOigjSZfLpX6KiFeabfoLtANfr
 Zs5+vclZX7Xlb+QFUyFLq8MPVzeboDs8KLQKp3aLv5paxo3JnePNZ3rh3dwGa89IleVe
 +ldd0qpgUYDCxNTDPAZ/fHXhaHWN6lkm9CoAjz3HXBA2FkhxHFoFCKPcikdboUwc+ByF
 6RlZn4SdOxBlg0REuu1IE/tkc25HQr/N9Sl4Dbc3miF6rME0v33mwF5FRpkCDP0kTfBN
 7H6g==
X-Gm-Message-State: AJIora+T7SjCBVEq6lcsG7cbTigvWRjtST11CjuY0VoQY4sx/ggffGJI
 NQJ4I3iqi3xrjPCDPgq5znR9B8NRQX0=
X-Google-Smtp-Source: AGRyM1vJfS4+n8zLuln5hMJjECb+kROUTmxBGlhggzcyYs1vAP2R+nd5a1cbQBRWp0l+C057exRgnQ==
X-Received: by 2002:a05:6a00:234f:b0:525:1f7c:f2bf with SMTP id
 j15-20020a056a00234f00b005251f7cf2bfmr6603024pfj.14.1656197721362; 
 Sat, 25 Jun 2022 15:55:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a170902969800b0016a034ae481sm4197148plp.176.2022.06.25.15.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 15:55:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/15] drm/msm/gem: Consolidate pin/unpin paths
Date: Sat, 25 Jun 2022 15:54:44 -0700
Message-Id: <20220625225454.81039-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220625225454.81039-1-robdclark@gmail.com>
References: <20220625225454.81039-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Avoid having multiple spots where we increment/decrement pin_count (and
associated LRU updating)

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 3da64c7f65a2..407b18a24dc4 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -190,7 +190,7 @@ static struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj)
 
 	p = get_pages(obj);
 	if (!IS_ERR(p)) {
-		msm_obj->pin_count++;
+		to_msm_bo(obj)->pin_count++;
 		update_lru(obj);
 	}
 
@@ -213,9 +213,7 @@ void msm_gem_unpin_pages(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	msm_gem_lock(obj);
-	msm_obj->pin_count--;
-	GEM_WARN_ON(msm_obj->pin_count < 0);
-	update_lru(obj);
+	msm_gem_unpin_locked(obj);
 	msm_gem_unlock(obj);
 }
 
@@ -436,14 +434,13 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma)
 	if (GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
 		return -EBUSY;
 
-	pages = get_pages(obj);
+	pages = msm_gem_pin_pages_locked(obj);
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
 	ret = msm_gem_map_vma(vma->aspace, vma, prot, msm_obj->sgt, obj->size);
-
-	if (!ret)
-		msm_obj->pin_count++;
+	if (ret)
+		msm_gem_unpin_locked(obj);
 
 	return ret;
 }
-- 
2.36.1

