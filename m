Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C271F8FC8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A656E2BE;
	Mon, 15 Jun 2020 07:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEF689CCB;
 Sun, 14 Jun 2020 07:12:39 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id j19so8331274ilk.9;
 Sun, 14 Jun 2020 00:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=J0HX3Qy+oA7OgSkbAwCFUgm7xc4/mQq2g3sSxGqtxts=;
 b=ng0Hs7X76WMv2RgLHK06guvTkOhbuJO1TZxkIDGvxw8Y8cfXgIV/12HWs0gFqNgvOe
 UM/bVQxlvagvWjXIbdCgd0k8y/XX6chWyaZW1KeVUtw5AjHuhIWQ4KHUw3jXaX4omsA7
 9HzANrDVVvngT3aa19831CroM1Oqm5DAjVrmsQUuCefQz5mv7gnPKn7ZKQW+NjsL2lQl
 n69rfkYHJB+wiUECAcoooaS7GBQV/CImXYpLQKQ7uYEOxKRfFCoPCpaZ4pnQkZwBuR04
 xbinJ2+pytEaA+KPFsIRiRHp+tyJYzZTedi4Kngguff8RDa/SnPIRw/e9/jM7E4RE0IY
 uCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=J0HX3Qy+oA7OgSkbAwCFUgm7xc4/mQq2g3sSxGqtxts=;
 b=QBIM2xdCkTwm1+TR9BW4pcVJ2WdtrmvOGd5ges6AFfpSuh9Y41+29dqBSoe75aidf6
 P01glN8rnkg+GQquo+MbH3E+LaSimPLOHR/VvoA20JPNTqBRwMzlkqcP6u7U1WXhMagg
 q7HRGU/r/uwuWvpRAVVoTj5qtMe3hnDz0rsiCTwr4gsrwUQt0vc8ig57m3vk53AzPCqq
 xkFzyFsPwKMg9nMRSnu2rBO4iVPnCUhWWKIRgMz6qVDokNsoqPfk67V1OlWz9H8Vr7jw
 ux7gvIP9rtBxVBn/Fm5u17EPY2VLgMzqWsCgitqwI559796rMpZG2wXmaderxouJmshT
 e//Q==
X-Gm-Message-State: AOAM533zUZBhL+o9L5JPeqynPCdT3Dwc7YDD6SoFXSiyCEJYg4mHu8gv
 529lmnwacgh2W49JqDgWOE0=
X-Google-Smtp-Source: ABdhPJyimyxSAUwofweWNgN5hEFbQ/O7Qx3jeTQjffr0wRqkezjV+1DdWhLCq+42269oMOzx82Uv1A==
X-Received: by 2002:a92:4885:: with SMTP id j5mr19444436ilg.35.1592118758649; 
 Sun, 14 Jun 2020 00:12:38 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id t63sm6158788ill.54.2020.06.14.00.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 00:12:38 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Evan Quan <evan.quan@amd.com>, Leo Liu <leo.liu@amd.com>,
 James Zhu <James.Zhu@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: fix ref count leak in amdgpu_driver_open_kms
Date: Sun, 14 Jun 2020 02:12:29 -0500
Message-Id: <20200614071231.87723-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, emamd001@umn.edu, kjlu@umn.edu,
 wu000273@umn.edu, smccaman@umn.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in amdgpu_driver_open_kms the call to pm_runtime_get_sync increments the
counter even in case of failure, leading to incorrect
ref count. In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index d7e17e34fee1..bd40aa307462 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -991,7 +991,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 
 	r = pm_runtime_get_sync(dev->dev);
 	if (r < 0)
-		return r;
+		goto pm_put;
 
 	fpriv = kzalloc(sizeof(*fpriv), GFP_KERNEL);
 	if (unlikely(!fpriv)) {
@@ -1042,6 +1042,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 
 out_suspend:
 	pm_runtime_mark_last_busy(dev->dev);
+pm_put:
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return r;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
