Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24334763853
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 16:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A08B10E47F;
	Wed, 26 Jul 2023 14:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B74310E47F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 14:06:30 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbc12181b6so68067475e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 07:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690380388; x=1690985188;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9CExGnNyyTMqIBKgfK9jLWHHsLv2lLgzC/iVvVseu6I=;
 b=Ht2si9k7sgQ4FHp41Xh1A2JRiS/sAP7mdGhwnc82tNBq2KhiDxPAVt0aK1A2VTj/XL
 nKkWfon54v9QVETu+4fnEDvnhNnBXu0k5Gjhzmeykacz160OyXbdRQqNNrJCvs+d75cN
 RJSh8S/UYpiNUYzZn+/dx/NnjJVCLrviDsiyHYAzoIN+cIAGo1Svk3ZBw8tq1EZ6H+NQ
 S/SvRXJSWsOqTHMKEmeuOyYb2dRTNpYw3qN/MMDIB5QY/2i14OhKwTGiO2iM1F4KAUdk
 Cbo/9PRDySRvy2vGVOTd42gYrMA3Oig9enZ2Cdbtol9jr7U6zljhvbpXtiXY+B8Y5DWH
 h0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690380388; x=1690985188;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9CExGnNyyTMqIBKgfK9jLWHHsLv2lLgzC/iVvVseu6I=;
 b=RcadfvxOS1QHLNm/i0EUBPh1svRVrXo3anAPTkxSnOtUDgikDENuJ7/GPu2A5y6nv6
 FmbqBSFfUbzz8/F6U0va1pWU5asbzied+XdmPE+mxnWlWi+ED68vC5u8wyLL2HfXjZ5J
 KY8OI62+vfBJGSix0NWPPomlS1AtYCrd/A8hdKxw7LZ7m3YGCuJYwlWOX72WgOH+UmCF
 9xloS/Mu+tHdh2h840+ch+qYVCgKZkU80PHF0pAbJ1Hqkep3o5B7QXwGx+WBeoCzUDzy
 8n+SgfDTWlz3pWP3k02rfAsDMV4fgRr/1TruKOCdHMrxX7k49DF/aNQT5KOjICi/VVJx
 g/NA==
X-Gm-Message-State: ABy/qLbo5AE44Hswrb+cvoAu2hnwtkVtNz52PJZ9+mBJyQtETduiOvE5
 EyrhVXhzzng2Ng1uixLlmdvpotVfgjw=
X-Google-Smtp-Source: APBJJlGdNjDudSlbDDSi8kE8qRRQF0XYpEHL6Oi54V8yNv6mrteRqEmoKAod05XfMB4/ihqfy+LAQQ==
X-Received: by 2002:a05:600c:20d3:b0:3fd:3006:410a with SMTP id
 y19-20020a05600c20d300b003fd3006410amr1444089wmm.25.1690380387879; 
 Wed, 26 Jul 2023 07:06:27 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 e15-20020a5d4e8f000000b0031432f1528csm20078420wru.45.2023.07.26.07.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 07:06:27 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Oded Gabbay <ogabbay@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][V2][next] accel/qaic: remove redundant pointer pexec
Date: Wed, 26 Jul 2023 15:06:26 +0100
Message-Id: <20230726140626.264952-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pointer pexec is being assigned a value however it is never read. The
assignment is redundant and can be removed. Replace sizeof(*pexec)
with sizeof the type and remove the declaration of pointer pexec.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---

V2: completely remove the declaration of pexec and replace sizeof(*pexec)
with size of the type.

---
 drivers/accel/qaic/qaic_data.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index e9a1cb779b30..a90b64b325b4 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1292,7 +1292,6 @@ static void update_profiling_data(struct drm_file *file_priv,
 static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv,
 				   bool is_partial)
 {
-	struct qaic_partial_execute_entry *pexec;
 	struct qaic_execute *args = data;
 	struct qaic_execute_entry *exec;
 	struct dma_bridge_chan *dbc;
@@ -1312,7 +1311,7 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 
 	received_ts = ktime_get_ns();
 
-	size = is_partial ? sizeof(*pexec) : sizeof(*exec);
+	size = is_partial ? sizeof(struct qaic_partial_execute_entry) : sizeof(*exec);
 	n = (unsigned long)size * args->hdr.count;
 	if (args->hdr.count == 0 || n / args->hdr.count != size)
 		return -EINVAL;
@@ -1320,7 +1319,6 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 	user_data = u64_to_user_ptr(args->data);
 
 	exec = kcalloc(args->hdr.count, size, GFP_KERNEL);
-	pexec = (struct qaic_partial_execute_entry *)exec;
 	if (!exec)
 		return -ENOMEM;
 
-- 
2.39.2

