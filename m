Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DFF498177
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 14:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F8A10E7D5;
	Mon, 24 Jan 2022 13:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F5010E7D5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643032415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=10jjCwVWraQntNdBxVG806Q7wvKbwg1gvSBpyTQbEiA=;
 b=GG6Pz05vHFEroF8c+dMedA3N5HUCb12VVwSjJqieqsMwkk4kvDkT39TrnLSwLM8wV+TTAd
 pMuXslh4P4neD2W92mRvnk8KuffrITpJucIMY8AAXkUenoFwkuYqlHWfQKs7HNwIBMeNwr
 +tZMDqLRIvgZxN5mf9iGc3hFJYWOt8s=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-biaDZTutNpmMjoXNE9GWDA-1; Mon, 24 Jan 2022 08:53:34 -0500
X-MC-Unique: biaDZTutNpmMjoXNE9GWDA-1
Received: by mail-oi1-f198.google.com with SMTP id
 c7-20020a056808138700b002cb08f9f1deso9165888oiw.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 05:53:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=10jjCwVWraQntNdBxVG806Q7wvKbwg1gvSBpyTQbEiA=;
 b=6Ey5alyloMxUG7LpjEOyTnANifW35O3Z09jC4laBJHynWXuBhRU62bqEltACcRmEQy
 Sf3As6kx/2NV1xuOd2frKIEiwuF5UOCpcrk1PzqYPpu+fTiloLwYu+kiX5OG9TL++6ec
 FR9C0x0eDIyu4J1DXN4v8ZQ+XwQe4ueiH2+XQ+JDaxDF75eDKxGbn7+P33hgFK4+FpcD
 p9+sIRrTDIyv54HDBUZxtrr+bNreNmr9ktGSu48Hb8FJIwW0Z0dydqHYq8PRwouJ3Tn2
 +6KMGOrLeL6BzCBl8jObEP+9DJiWL94xrWplV2vfYYi6gZ6pJeSg3jCJx1Xy6Xhdw487
 5LpA==
X-Gm-Message-State: AOAM530sv7sZkpcSpsVo6YmplyYw4Vj2LJb1pNzR96QKXyjHlTh9CuAn
 XbRizepwQhVyka+bB9TQclYR4IKZ6p9abzLUtHln+kgYiu3sGtyatFYjnVTuued0u5cEr4f7w6b
 RszGOLBvHXdu2ycrABwIxUVc/lHlb
X-Received: by 2002:a4a:d095:: with SMTP id i21mr3016412oor.66.1643032414034; 
 Mon, 24 Jan 2022 05:53:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXcXYp8AXPTplh6to4AiTnWP2fz7OgXjj9IzEQpUNCJmvn968uNUEQkbgSQYBOEJwbNzIXMA==
X-Received: by 2002:a4a:d095:: with SMTP id i21mr3016389oor.66.1643032413803; 
 Mon, 24 Jan 2022 05:53:33 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id v26sm1881619ooq.20.2022.01.24.05.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 05:53:33 -0800 (PST)
From: trix@redhat.com
To: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, lijo.lazar@amd.com, darren.powell@amd.com,
 guchun.chen@amd.com, Arunpravin.PaneerSelvam@amd.com,
 andrey.grodzovsky@amd.com
Subject: [PATCH] drm/amd/pm: set min,
 max to 0 if there is no get_dpm_ultimate_freq function
Date: Mon, 24 Jan 2022 05:52:59 -0800
Message-Id: <20220124135259.1057828-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

clang static analysis reports this represenative problem
amdgpu_smu.c:144:18: warning: The left operand of '*' is a garbage value
        return clk_freq * 100;
               ~~~~~~~~ ^

If there is no get_dpm_ultimate_freq function,
smu_get_dpm_freq_range returns success without setting the
output min,max parameters.  Because this is an extern function,
set the min,max to 0 when there is no get_dpm_ultimate_freq.

Fixes: e5ef784b1e17 ("drm/amd/powerplay: revise calling chain on retrieving frequency range")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 5ace30434e603..35fbe51f52eaa 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -121,11 +121,17 @@ int smu_get_dpm_freq_range(struct smu_context *smu,
 	if (!min && !max)
 		return -EINVAL;
 
-	if (smu->ppt_funcs->get_dpm_ultimate_freq)
+	if (smu->ppt_funcs->get_dpm_ultimate_freq) {
 		ret = smu->ppt_funcs->get_dpm_ultimate_freq(smu,
 							    clk_type,
 							    min,
 							    max);
+	} else {
+		if (min)
+			*min = 0;
+		if (max)
+			*max = 0;
+	}
 
 	return ret;
 }
-- 
2.26.3

