Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AA7359CA5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 13:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143516EC0D;
	Fri,  9 Apr 2021 11:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4DC6EC0D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 11:07:32 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id n2so8003239ejy.7
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 04:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l6sJSPiM6sekYmY5Zdbzgi+u3WF4okToW6bIGuh+m8o=;
 b=r8nxDHzQS0IC1iu3bC/74zUhoYU+uYWI9OXsTq83W9nF5rdqr6m4DJwXYfz6o4w64Z
 bVDytlW3dotyEuWo+NocjP/IKh7rK4DXtKj2Xm7zEopO2Ofbci2cX/jkJGFTjFGGy+nt
 nHOCO0hZq0An+jvcoLRxhbZYDX9zUw0tDocMcT379s/c4ItRZ+gakdIEVgNxmkUiVycz
 WReMM0WgPTJfvlkhi4foZihWCkys4ZL+j+FKAt8S5jdLU4aEWy5zaBHV04cttMKvQKwi
 4PTKtxbO+jRxxk3G2sH1K20+IZ+inO4gUS/3lL2D4z3W+BkOepk75bddiFXsiVymz+Ic
 0ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l6sJSPiM6sekYmY5Zdbzgi+u3WF4okToW6bIGuh+m8o=;
 b=Cs61F7duWQnj+ttJ1DhKIKAFfHuTprCwc+PgTgOrhsQqdOFYB1sIOCc9Zd05NVtUvj
 w8ZqYvpfKVW99f5F2bRNuUg4cECa6SdirrAUd41jWTeo/VoZKbWRNTbUqJJ2mvy61xr1
 0Pi5x7Mq7ctOpEMDgWO1xWRqL4u9Cu4nt8XVbIbrdZ4gDFSrNQfqLvMrLlomROF7i7yp
 9BFQB9W3kudl5iRVraP5QDPWIQyO6RTHA9ANjI5Nf/lq0Mw4OQuT+MCp1FfrYtRpLu6M
 GSyVjPM2alOO/i270Tbun84Yhj6viSIeECcajhKhH7xSHS4uflGiRKFzx5DeF385XjiJ
 qsOA==
X-Gm-Message-State: AOAM531MrikuBV/gBAV0Ynp1ybFpsENZfYxnOI8avMZMQy937CLreqQx
 2VALTINdiFSQB3ShZey20wBD8ZRjZLw=
X-Google-Smtp-Source: ABdhPJy0rPn9C21zPol1swUoaEqib6AvBEgH+CpYu1wJuPQbKdq0uVhnPVNaC4iumhss7jl+FSZvRg==
X-Received: by 2002:a17:906:f8d7:: with SMTP id
 lh23mr15862775ejb.457.1617966451487; 
 Fri, 09 Apr 2021 04:07:31 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:216f:9340:7a2b:4f98])
 by smtp.gmail.com with ESMTPSA id gb22sm1048099ejc.78.2021.04.09.04.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 04:07:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: make global mutex and use count static
Date: Fri,  9 Apr 2021 13:07:30 +0200
Message-Id: <20210409110730.2958-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: bernard@vivo.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25seSBuZWVkZWQgZHVyaW5nIGRldmljZSBob3QgcGx1ZyBhbmQgcmVtb3ZlIGFuZCBub3QgZXhw
b3J0ZWQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+ClN1Z2dlc3RlZC1ieTogQmVybmFyZCA8YmVybmFyZEB2aXZvLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZpY2UuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2RldmljZS5j
CmluZGV4IDliNzg3YjNjYWViNS4uMWYyMDI0MTY0ZDcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZp
Y2UuYwpAQCAtMzksOCArMzksOCBAQAogLyoqCiAgKiB0dG1fZ2xvYmFsX211dGV4IC0gcHJvdGVj
dGluZyB0aGUgZ2xvYmFsIHN0YXRlCiAgKi8KLURFRklORV9NVVRFWCh0dG1fZ2xvYmFsX211dGV4
KTsKLXVuc2lnbmVkIHR0bV9nbG9iX3VzZV9jb3VudDsKK3N0YXRpYyBERUZJTkVfTVVURVgodHRt
X2dsb2JhbF9tdXRleCk7CitzdGF0aWMgdW5zaWduZWQgdHRtX2dsb2JfdXNlX2NvdW50Owogc3Ry
dWN0IHR0bV9nbG9iYWwgdHRtX2dsb2I7CiBFWFBPUlRfU1lNQk9MKHR0bV9nbG9iKTsKIAotLSAK
Mi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
