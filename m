Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F00B955B26D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 16:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D3810E41E;
	Sun, 26 Jun 2022 14:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5289B10E43A
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656253267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ahf2yCApAVRKZIV4QgwQyLJ3X4VNm/eYrF4Rb3afHBs=;
 b=HRbLhbf9ZF6YfHAqpHZo/wvNLzxpgAD/X/1Mx7UAEfX9/QKDO4OKIFD3umRsbu7KkTyGnI
 ElVaEh+y7TzyF7G17vUlN/kEuSzxA6OlPlilj3Ar/2hyDc26yfYfihbXfX6BTuq6a6jWgF
 z/a317FEs6J4Mre4L1nwqJafYZQyON8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-jXX9lc0pPkOrUYVCSqfKSQ-1; Sun, 26 Jun 2022 10:21:05 -0400
X-MC-Unique: jXX9lc0pPkOrUYVCSqfKSQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 x18-20020a0ce252000000b004703cbb92ebso7106189qvl.21
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 07:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ahf2yCApAVRKZIV4QgwQyLJ3X4VNm/eYrF4Rb3afHBs=;
 b=EDfIVPAO5Itsy2i9q3xsl00/UQn7im8+3LlLt0dCAFTPbmvHYBA4OtWHFflY65T95A
 SpsNg9nw7bAg2ZeP1pCE2J3u9Fmn6ugZq3wpUYf5WbTQEtNdzMXjts/2+Tznyq7BQHok
 hQyyMrSuzo4/Br6HtNiG3i88YMcxATGb9Zri9QvDJeVRjxFUwH3Khh7Ulih8r0IZ7zOv
 aGVLB0PLqaLOzrBH6/QGRNzBUFQmVtr17ES+56rT1N6Q5y0RguqRSJ80V/QwlZnEe+At
 SllG8Fig743Te+CYCt2QWVxBBgmLQCa2SZkMxeQk5zfFWNFjPnibDFY8++MZxiQy/wnM
 I0pQ==
X-Gm-Message-State: AJIora+vHn4udew/K+POH8KeYy2Sf5vtInLdFR1uN9bf32uZEYqQVRvy
 fYC6mBXnZ73T1C9r9AAWBom+3s04467gD/3vbepculXws8mCGPb0b50lfsZNq7R22EltQu1gjYr
 SdX/8WftVcYwsll2LnszwMwvNVF3S
X-Received: by 2002:a05:620a:471f:b0:6a6:f574:8b78 with SMTP id
 bs31-20020a05620a471f00b006a6f5748b78mr5486449qkb.469.1656253264874; 
 Sun, 26 Jun 2022 07:21:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1taraKCxi2XWY8/KIXCz5Sr4ylSIyPsZkkuTt119Zkfdt3zbyYiMOzX4TAVcI2CZmI4Sd2wRg==
X-Received: by 2002:a05:620a:471f:b0:6a6:f574:8b78 with SMTP id
 bs31-20020a05620a471f00b006a6f5748b78mr5486420qkb.469.1656253264652; 
 Sun, 26 Jun 2022 07:21:04 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a05620a291600b006aef641865esm6399256qkp.128.2022.06.26.07.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 07:21:04 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, wenjing.liu@amd.com, Jun.Lei@amd.com,
 George.Shen@amd.com, Jimmy.Kizito@amd.com, Jerry.Zuo@amd.com,
 michael.strauss@amd.com, aurabindo.pillai@amd.com
Subject: [PATCH] drm/amd/display: Remove unused globals FORCE_RATE and
 FORCE_LANE_COUNT
Date: Sun, 26 Jun 2022 10:20:53 -0400
Message-Id: <20220626142053.3373970-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sparse reports
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:3885:6: warning: symbol 'FORCE_RATE' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:3886:10: warning: symbol 'FORCE_LANE_COUNT' was not declared. Should it be static?

Neither of thse variables is used in dc_link_dp.c.  Reviewing the commit listed in
the fixes tag shows neither was used in the original patch.  So remove them.

Fixes: 265280b99822 ("drm/amd/display: add CLKMGR changes for DCN32/321")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index be1dcb0a2a06..f3421f2bd52e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -3882,9 +3882,6 @@ static bool decide_mst_link_settings(const struct dc_link *link, struct dc_link_
 	return true;
 }
 
-bool FORCE_RATE = false;
-uint32_t FORCE_LANE_COUNT = 0;
-
 void decide_link_settings(struct dc_stream_state *stream,
 	struct dc_link_settings *link_setting)
 {
-- 
2.27.0

