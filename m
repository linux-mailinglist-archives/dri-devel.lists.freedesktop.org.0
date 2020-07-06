Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDEF21573E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 14:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D8C6E393;
	Mon,  6 Jul 2020 12:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138886E3E3
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 12:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594038549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=Mc/ldKPt/EXYFlwVXR6UGMdQ57wZ+ah4uNI5EbcP1/0=;
 b=GtO4xP7CF7LkYmMHF1rp6gPbw5YCCVz6AZlYzlqUzQD5i5icJvixAmXbOWOSdDNar1ZNlv
 TH+qf7YLrmd8+h2vxxx7RPDppM47VoVBSZOJgSL/eRCnEY4dm8KOZMqVGKj2hfXNKkhXCH
 /e7Hh1pHy14L51BDaAMklHoJE9r4bP4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-nHe6Y5HyOqyD5yHBN7b9Yw-1; Mon, 06 Jul 2020 08:29:06 -0400
X-MC-Unique: nHe6Y5HyOqyD5yHBN7b9Yw-1
Received: by mail-qt1-f198.google.com with SMTP id u93so28195442qtd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 05:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Mc/ldKPt/EXYFlwVXR6UGMdQ57wZ+ah4uNI5EbcP1/0=;
 b=uA9DKWVoSFrKfEdSVm5huNEhxyp1n95wePSo1QtWTDiwS5Ek78jTubSaqLgzXNwxjX
 eY1+akhoT3WJp8b+uy3LGEi9G2EZMBFMWBdnE62I125N8JXn1BHHqbo1qvI7MDgh0Etd
 WyPu0cCOrtzFDA/JpI93yZqHEx/hJrQNKy8clZxdavc3/5jl6TuDFq19CokEdpl9vt7h
 X6xqoC6VReUgDPmVwD8v3WgcfEGqbxQqn6/0suXRyObmFtCEx8RKFGLrNfnWgNjtvTNh
 7SkfUDc/2iJdaeFCV9OrqkrtDRc0JCCTZIUkhP5jU2N/xOqoviqLcC9KS0NJRM00vmZy
 XeGw==
X-Gm-Message-State: AOAM530pEBCh0LLLoryVSLsTk0vUZrXPp9KEjO5hcyFBbKQMu5iogOH+
 UZ6Dm/JnnHA4yZXEfb6GTBRGmE2TjW5i9IHNWoerjFN07zUTxedIMEeAJBHbTDlVt+WDRzs6IUD
 ZxpvDo2yOBzaH7gK0Vp35ha2gUt9u
X-Received: by 2002:a05:6214:d4d:: with SMTP id
 13mr13540399qvr.22.1594038544912; 
 Mon, 06 Jul 2020 05:29:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMy8mu7HXUm95aP+rznm4nycrjLabnqqCu0tSzaAU0UirnpXs5EwtEIjiB8f3YLEf4kXnE0A==
X-Received: by 2002:a05:6214:d4d:: with SMTP id
 13mr13540380qvr.22.1594038544638; 
 Mon, 06 Jul 2020 05:29:04 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id u6sm22032735qtc.34.2020.07.06.05.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 05:29:04 -0700 (PDT)
From: trix@redhat.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/radeon: fix double free
Date: Mon,  6 Jul 2020 05:28:57 -0700
Message-Id: <20200706122857.27661-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

clang static analysis flags this error

drivers/gpu/drm/radeon/ci_dpm.c:5652:9: warning: Use of memory after it is freed [unix.Malloc]
                kfree(rdev->pm.dpm.ps[i].ps_priv);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/radeon/ci_dpm.c:5654:2: warning: Attempt to free released memory [unix.Malloc]
        kfree(rdev->pm.dpm.ps);
        ^~~~~~~~~~~~~~~~~~~~~~

problem is reported in ci_dpm_fini, with these code blocks.

	for (i = 0; i < rdev->pm.dpm.num_ps; i++) {
		kfree(rdev->pm.dpm.ps[i].ps_priv);
	}
	kfree(rdev->pm.dpm.ps);

The first free happens in ci_parse_power_table where it cleans up locally
on a failure.  ci_dpm_fini also does a cleanup.

	ret = ci_parse_power_table(rdev);
	if (ret) {
		ci_dpm_fini(rdev);
		return ret;
	}

So remove the cleanup in ci_parse_power_table and
move the num_ps calculation to inside the loop so ci_dpm_fini
will know how many array elements to free.

Fixes: cc8dbbb4f62a ("drm/radeon: add dpm support for CI dGPUs (v2)")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/radeon/ci_dpm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
index 86ac032275bb..ba20c6f03719 100644
--- a/drivers/gpu/drm/radeon/ci_dpm.c
+++ b/drivers/gpu/drm/radeon/ci_dpm.c
@@ -5563,6 +5563,7 @@ static int ci_parse_power_table(struct radeon_device *rdev)
 	if (!rdev->pm.dpm.ps)
 		return -ENOMEM;
 	power_state_offset = (u8 *)state_array->states;
+	rdev->pm.dpm.num_ps = 0;
 	for (i = 0; i < state_array->ucNumEntries; i++) {
 		u8 *idx;
 		power_state = (union pplib_power_state *)power_state_offset;
@@ -5572,10 +5573,8 @@ static int ci_parse_power_table(struct radeon_device *rdev)
 		if (!rdev->pm.power_state[i].clock_info)
 			return -EINVAL;
 		ps = kzalloc(sizeof(struct ci_ps), GFP_KERNEL);
-		if (ps == NULL) {
-			kfree(rdev->pm.dpm.ps);
+		if (ps == NULL)
 			return -ENOMEM;
-		}
 		rdev->pm.dpm.ps[i].ps_priv = ps;
 		ci_parse_pplib_non_clock_info(rdev, &rdev->pm.dpm.ps[i],
 					      non_clock_info,
@@ -5597,8 +5596,8 @@ static int ci_parse_power_table(struct radeon_device *rdev)
 			k++;
 		}
 		power_state_offset += 2 + power_state->v2.ucNumDPMLevels;
+		rdev->pm.dpm.num_ps = i + 1;
 	}
-	rdev->pm.dpm.num_ps = state_array->ucNumEntries;
 
 	/* fill in the vce power states */
 	for (i = 0; i < RADEON_MAX_VCE_LEVELS; i++) {
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
