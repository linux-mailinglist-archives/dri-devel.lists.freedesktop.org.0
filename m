Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0D96E8B05
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2692410EB9E;
	Thu, 20 Apr 2023 07:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FE310E9D6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 14:41:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1763ee8f8so16201355e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 07:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915317; x=1684507317;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QOtCCZEZcabVSo6ibhq9qM6H/gWQgiZ4yShGSbi2dIs=;
 b=v73jw3xqTQUVgXczV6VibuF8JzrL/ShtyFABv3vUyAsKXR6lZdiQZIIbGMj/at/OEP
 x4xU7JXIVke63B3ABGTzR88C8KQpod/Vy/NaBJAclm36oD/wlZU1cKjcliDclaFbcyyx
 rUgh/oDxSKnA6LKj+kCiKHiszLMXshysRzYgO7zUCTlNae5lL+EoWfPOsfvh3X+S/iJp
 t3gRoKVaic1EQGuC1uMFLANOPfJSz93tUHWO3Vfx9YBY3RGqPNG1hf1HRuWdxiBErnBx
 Mh4bHZWqfnk7is2rQuReq+WWLJvb4f1l2J+fw47Xs4MOk+2X4PUWrjobxCkahDE9c8nU
 MLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681915317; x=1684507317;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QOtCCZEZcabVSo6ibhq9qM6H/gWQgiZ4yShGSbi2dIs=;
 b=eRWKIjG0qGWBbdxmKnfh3Jof8bX9nrvtdjZHkiRbjR0nfSIpAB16hQOE+NP7bnh3Ow
 4h3ac7cizz0P9ftiqMGOoGGrn5ExiroFMHkK6EH9r5SUa0kJcgS3oopvwqMiFiyD2JKs
 bNNiqlqR2s80cBws3GpHmgdzQbmqoz0LgcoJK0Zmgj5ARay6B0i7yAUgroRxe0X8/hjg
 veUDUE7oDIEs1gQiSvlrBkg5vr5Jb6dJ1tHncceR6BrmYO/YM84P+eUiHSoYT1BUsy9b
 5fc4l2XkwreFsZYZCEeaycsQjkxSlEONyaQcYLlRhd9xuBxhfW5JmS8TRuMGWov10UAb
 bgvw==
X-Gm-Message-State: AAQBX9fwDcXNmmUapFwqYb0ztdBgZMF0f802KTM89SGWjo/tnoT41nOp
 ivDSd27psOxKf/saKaJmvVs/
X-Google-Smtp-Source: AKy350Z4jFNf20Hlc2GWv28CTXaygiHWdHklMvv/5X5zjnBS4ogAsyzgZ1W89NxiPUYqbOGQz9cXEg==
X-Received: by 2002:adf:f010:0:b0:2fa:6929:eb81 with SMTP id
 j16-20020adff010000000b002fa6929eb81mr4309583wro.31.1681915317445; 
 Wed, 19 Apr 2023 07:41:57 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:41:57 -0700 (PDT)
From: Arnaud Vrac <avrac@freebox.fr>
Date: Wed, 19 Apr 2023 16:41:09 +0200
Subject: [PATCH 02/11] drm/msm/dpu: use the actual lm maximum width instead
 of a hardcoded value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-2-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=F1W/wchYMCu2VjLqHH6U+LrWUMc7lJp207y9YaxngyM=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2YRHSjxXabDh0Gu+NKzHbr/LV2esVhNCjWe
 gUDIZ3V20WJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9mAAKCRBxA//ZuzQ0
 q9tYD/9LxTx1cpzUZKY3M7CrNX2Jf6IGVMYxyJqcOvjHmPaMEElWxCjSZ2oY2ZbE+F1S6z5JPsq
 P9UgmupIvqwIEvcsVnhcvW1wXyfcPH8xyZ8kRhW4LQIfS3VW/ySRdNndBtPtjVVRFJzvOiZHDVd
 MWcdkols1Sb8bAPlDeuXffjYMWYkzgqcDzJk7Iq5FerkvkQt91s18X7Mht3pKgvlak4SdMYXKpc
 kE5ULRYhNvt8XbKAUPTDDLMZo4XrsGo+fua4M8AXfPp0du/QMqlP7SxL6NadQfsINl5RuQUlmyq
 0lf64+UUU2Als0GNKEvEAmy4sv8iQBv0rru0jzDW5jlw/aarbONgpxYDcIcQHoesDAOTa4WA6dO
 OiDqWXskg/QCG7LYfo9JSg0S9ohG6dC+sE+bypkM+TqNLcobWOVObLs6dYOhMBGhxD0SW0HCLC5
 hIjiQVeoupzgYXhjJeLJjEZtiwsTx0OPxXL67WzZ4Tfs7UzTOi0XVVqa4kl3K8xXp3Ybj3xCPPf
 Q+ToaLhrxKsyuA8VeXC2yCWM7d5o5tfG6oohLDoqeXB2Jd5nj8Oo8jWeoUDUfG+bGliN+CXIkF1
 XM2LKRVo2Hl1KwyNWNHGUsnlUE7mPmB2QoZREpw7VhwsTDdvAWMpV3ZKTJkXkuH6Ir/ouEFm/oE
 3txKrd1uS68t15g==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: Arnaud Vrac <avrac@freebox.fr>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This avoids using two LMs instead of one when the display width is lower
than the maximum supported value. For example on MSM8996/MSM8998, the
actual maxwidth is 2560, so we would use two LMs for 1280x720 or
1920x1080 resolutions, while one is enough.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1dc5dbe585723..dd2914726c4f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -53,8 +53,6 @@
 
 #define IDLE_SHORT_TIMEOUT	1
 
-#define MAX_HDISPLAY_SPLIT 1080
-
 /* timeout in frames waiting for frame done */
 #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
 
@@ -568,10 +566,12 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	 */
 	if (intf_count == 2)
 		topology.num_lm = 2;
-	else if (!dpu_kms->catalog->caps->has_3d_merge)
-		topology.num_lm = 1;
+	else if (dpu_kms->catalog->caps->has_3d_merge &&
+		 dpu_kms->catalog->mixer_count > 0 &&
+		 mode->hdisplay > dpu_kms->catalog->mixer[0].sblk->maxwidth)
+		topology.num_lm = 2;
 	else
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
+		topology.num_lm = 1;
 
 	if (crtc_state->ctm)
 		topology.num_dspp = topology.num_lm;

-- 
2.40.0

