Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A512B44F
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEB489CD9;
	Mon, 27 May 2019 12:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8751389700
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 04:51:38 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id a3so8384950pgb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 21:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yUlmxOGnO1980oiGUAyuWMhEyWoJa2PD9pLjCihMzns=;
 b=cS0h74ScXtrftx34yIKZep+YX0L+fgKOH9hX+hEHSLH3gfb3zWiu3o+crx0SmeoRIM
 9m4U69BJuW6KWovG+VSHb0Lq9ztsAPTZexgSL2KKhcdegahzY5NJssJw975QKXe66S3f
 ooKr4D7+FYYikPb27/+C1pQuartdBrsuL3IsdmuK1iK/xwiUOYa1K1edKbrchtWH+Iiu
 dG5a5D2rBchlDQV1bcgRL2ukBk6rBMw+4GAYRtcnKg71vGfgKqd8PFGLgw9RoQcIYTcW
 4ljGpkOXHM7w7AAw5Hb2SvorG9Qeg1YxT7Nw6xnp4Al/yI6BFWYzKX7tzHFtHr5DiVad
 rEUw==
X-Gm-Message-State: APjAAAUAtwCCukiyvoQhagEQqoYE/zMqqvKkCL1SmpexBJLTpdE4ao9J
 IgRSy72ifeTdoHZY6YGfaRBGBg==
X-Google-Smtp-Source: APXvYqzFWcOQGNGke5SxYSfkPoz9/3QKFu6HpjgLwWyUA0idRxx7jSQ5CVK8tJUBDNqu1vgLMfZVlg==
X-Received: by 2002:a63:6bc3:: with SMTP id
 g186mr111791764pgc.21.1558932698131; 
 Sun, 26 May 2019 21:51:38 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id t18sm8082745pgm.69.2019.05.26.21.51.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 26 May 2019 21:51:37 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] drm: mediatek: unbind components in mtk_drm_unbind()
Date: Mon, 27 May 2019 12:50:54 +0800
Message-Id: <20190527045054.113259-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527045054.113259-1-hsinyi@chromium.org>
References: <20190527045054.113259-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yUlmxOGnO1980oiGUAyuWMhEyWoJa2PD9pLjCihMzns=;
 b=nh0J9d5tWECthEBuxY2gAfAcXw9czzCE8YBbgHOFmoDnQGRnZEmVmdROoGoBbFK5l5
 S5RwdS7TIk22ToA6KWeEGhKKKMhk701Hett9H/ziY9fXTnM2ZOxXEYwhuy2heRufHuva
 pU6I6/OE0aiTYhfWOUjCBadxOrSI2D3SvI0JU=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VW5iaW5kaW5nIGNvbXBvbmVudHMgKGkuZS4gbXRrX2RzaSBhbmQgbXRrX2Rpc3Bfb3ZsL3JkbWEv
Y29sb3IpIHdpbGwKdHJpZ2dlciBtYXN0ZXIobXRrX2RybSkncyAudW5iaW5kKCksIGFuZCBjdXJy
ZW50bHkgbXRrX2RybSdzIHVuYmluZAp3b24ndCBhY3R1YWxseSB1bmJpbmQgY29tcG9uZW50cy4g
RHVyaW5nIHRoZSBuZXh0IGJpbmQsCm10a19kcm1fa21zX2luaXQoKSBpcyBjYWxsZWQsIGFuZCB0
aGUgY29tcG9uZW50cyBhcmUgYWRkZWQgYmFjay4KCi51bmJpbmQoKSBzaG91bGQgY2FsbCBtdGtf
ZHJtX2ttc19kZWluaXQoKSB0byB1bmJpbmQgY29tcG9uZW50cy4KCkFuZCBzaW5jZSBjb21wb25l
bnRfbWFzdGVyX2RlbCgpIGluIC5yZW1vdmUoKSB3aWxsIHRyaWdnZXIgLnVuYmluZCgpLAp3aGlj
aCB3aWxsIGFsc28gdW5yZWdpc3RlciBkZXZpY2UsIGl0J3MgZmluZSB0byByZW1vdmUgb3JpZ2lu
YWwgZnVuY3Rpb25zCmNhbGxlZCBoZXJlLgoKRml4ZXM6IDExOWY1MTczNjI4YSAoImRybS9tZWRp
YXRlazogQWRkIERSTSBEcml2ZXIgZm9yIE1lZGlhdGVrIFNvQyBNVDgxNzMuIikKU2lnbmVkLW9m
Zi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgOCArKystLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2Rydi5jCmluZGV4IDU3Y2U0NzA4ZWYxYi4uYmJmZTNhNDY0YWVhIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwpAQCAtMzExLDYgKzMxMSw3IEBAIHN0YXRpYyBp
bnQgbXRrX2RybV9rbXNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQogc3RhdGljIHZvaWQg
bXRrX2RybV9rbXNfZGVpbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCiB7CiAJZHJtX2ttc19o
ZWxwZXJfcG9sbF9maW5pKGRybSk7CisJZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24oZHJtKTsK
IAogCWNvbXBvbmVudF91bmJpbmRfYWxsKGRybS0+ZGV2LCBkcm0pOwogCWRybV9tb2RlX2NvbmZp
Z19jbGVhbnVwKGRybSk7CkBAIC0zOTcsNyArMzk4LDkgQEAgc3RhdGljIHZvaWQgbXRrX2RybV91
bmJpbmQoc3RydWN0IGRldmljZSAqZGV2KQogCXN0cnVjdCBtdGtfZHJtX3ByaXZhdGUgKnByaXZh
dGUgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAogCWRybV9kZXZfdW5yZWdpc3Rlcihwcml2YXRl
LT5kcm0pOworCW10a19kcm1fa21zX2RlaW5pdChwcml2YXRlLT5kcm0pOwogCWRybV9kZXZfcHV0
KHByaXZhdGUtPmRybSk7CisJcHJpdmF0ZS0+bnVtX3BpcGVzID0gMDsKIAlwcml2YXRlLT5kcm0g
PSBOVUxMOwogfQogCkBAIC01NjgsMTMgKzU3MSw4IEBAIHN0YXRpYyBpbnQgbXRrX2RybV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogc3RhdGljIGludCBtdGtfZHJtX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBtdGtfZHJtX3ByaXZh
dGUgKnByaXZhdGUgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKLQlzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtID0gcHJpdmF0ZS0+ZHJtOwogCWludCBpOwogCi0JZHJtX2Rldl91bnJlZ2lzdGVy
KGRybSk7Ci0JbXRrX2RybV9rbXNfZGVpbml0KGRybSk7Ci0JZHJtX2Rldl9wdXQoZHJtKTsKLQog
CWNvbXBvbmVudF9tYXN0ZXJfZGVsKCZwZGV2LT5kZXYsICZtdGtfZHJtX29wcyk7CiAJcG1fcnVu
dGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwogCW9mX25vZGVfcHV0KHByaXZhdGUtPm11dGV4X25v
ZGUpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
