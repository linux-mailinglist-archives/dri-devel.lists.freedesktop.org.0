Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BFE2C40B8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 13:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B2E6E997;
	Wed, 25 Nov 2020 12:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401A36E8BD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 12:59:25 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id t9so2422252edq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 04:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qk7R7rj9O0NhZ+AE1ny276LbnmmXVRiOcypUvezp6WU=;
 b=qZhr5hL9VjG05kHUiHkPt8MDK66zbz7Iz9qHPgtNlOdjWIie+sahZJleJDBMfqWUZ+
 9IJv+uz991Zb2rR1eEZn+Lh37p5J6AnL5nhYCZICm0twGIog5BVuuG/2JnbCyPmyTvl+
 yYlzS07y9oOexcSFZx8nKPT6cGpm3ke4LV7L5qxQaBiY0brmkfIKUp+tVp0Umwn/Wyjn
 6SWgqXmYhgtQIYhzXAQr9uzw+fD3OOzXsCs7Lh+5EZAPoMGK/2aowJ1FlC+hVl1OT727
 3qWv+NtVUX2xYMeNtWIMhxjokpTQAZcy6JlIMzKWhnX6IUYsc83Bo2xTakgyuOVdBFla
 9tYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qk7R7rj9O0NhZ+AE1ny276LbnmmXVRiOcypUvezp6WU=;
 b=d2QFj3eBBYCdxx2AspGzYjK6Lsl+dGWHuePW5HvoySs04XCNgl8r3cn80Pl37cmYjP
 tacGWDlNhPHmQGMDLDS5Ts+wZuWen5QkNeOJHI1v4s0L1Y6SGJ57zC0N044RtGd3tmvz
 tPo/8V7yO1qA5mp/Vx8VDak3wlAUZcO0Rmgvzast0PCvGQwZS2L/whmoaVSdlWYv3A2c
 tLJB81ZTli7mmyBVm8B7k0NLTAz9ufeIvdy3ZmIL1I5EcEUKfg9fZjUqkfXJpEhdYqja
 Ft/c7PmnAz8Zq7NY9vH2slC3VKuF32UNW0pEnf6J7GOdSX6Wxna9jPx9i0RslnxM7nyi
 SU/Q==
X-Gm-Message-State: AOAM532RoR0hRD5lDRmw2eyMBsVog+WLe9Cx+KiMkrTyBZxLCCoIlX3Y
 Ta8977ZYRUT4AOvo3l3Kw6Mn2JqcSz0=
X-Google-Smtp-Source: ABdhPJw+LCsdL/bfAUPHvn3YXlXN00UDMUEySqmac3iU5rIypudModHhNOiAuyG9tg7svENkbTxg/Q==
X-Received: by 2002:a50:ab15:: with SMTP id s21mr3369084edc.88.1606309163599; 
 Wed, 25 Nov 2020 04:59:23 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:87d9:eeff:99f6:84c2])
 by smtp.gmail.com with ESMTPSA id z19sm1203188ejj.101.2020.11.25.04.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 04:59:23 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/vmwgfx: switch to ttm_sg_tt_init
Date: Wed, 25 Nov 2020 13:59:16 +0100
Message-Id: <20201125125919.1372-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125125919.1372-1-christian.koenig@amd.com>
References: <20201125125919.1372-1-christian.koenig@amd.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIERhbmllbCBWTVdHRlggZG9lc24ndCBzdXBwb3J0IERNQS1idWYgYW55d2F5
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYyB8IDQg
KystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKaW5kZXggNmEwNDI2MWNl
NzYwLi4xYzc1ZjczNTM4YzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X3R0bV9idWZmZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1f
YnVmZmVyLmMKQEAgLTYxMSw4ICs2MTEsOCBAQCBzdGF0aWMgc3RydWN0IHR0bV90dCAqdm13X3R0
bV90dF9jcmVhdGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAl2bXdfYmUtPm1vYiA9
IE5VTEw7CiAKIAlpZiAodm13X2JlLT5kZXZfcHJpdi0+bWFwX21vZGUgPT0gdm13X2RtYV9hbGxv
Y19jb2hlcmVudCkKLQkJcmV0ID0gdHRtX2RtYV90dF9pbml0KCZ2bXdfYmUtPmRtYV90dG0sIGJv
LCBwYWdlX2ZsYWdzLAotCQkJCSAgICAgIHR0bV9jYWNoZWQpOworCQlyZXQgPSB0dG1fc2dfdHRf
aW5pdCgmdm13X2JlLT5kbWFfdHRtLCBibywgcGFnZV9mbGFncywKKwkJCQkgICAgIHR0bV9jYWNo
ZWQpOwogCWVsc2UKIAkJcmV0ID0gdHRtX3R0X2luaXQoJnZtd19iZS0+ZG1hX3R0bSwgYm8sIHBh
Z2VfZmxhZ3MsCiAJCQkJICB0dG1fY2FjaGVkKTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
