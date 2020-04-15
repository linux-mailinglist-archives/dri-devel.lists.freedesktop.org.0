Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 469081A948B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955136E88B;
	Wed, 15 Apr 2020 07:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A336E88B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:01 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k1so10648574wrx.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IQt0eavpuFWDfbQlEkBKmJ30wUKD2UffzcnQaAIVLQk=;
 b=c8gI3nUniaDPnj2vAbCeyWyTF63CWn5abRYyRBx+zqkvNYN0B9MtywnXyrtJqnTeFl
 dCJaJIZNwrzNV+nL4mAB5OGSPU1lwDKfqRVYETD8LPwVqCYArMpEsNI3iafmB5YZkrsl
 43/PiVz7B9U0nkSpnyHgi5GcQl9TdeQewTwso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IQt0eavpuFWDfbQlEkBKmJ30wUKD2UffzcnQaAIVLQk=;
 b=D1+zWVUR0rGw++BP0rOsk1Ukp/srHOHpNToy+qDQPv8kXtBXiebVo86/G7b9ZLWJNy
 /d/NpWnEZQ0+VeGzfOe1ckIejcDlbV53aXfDnZQs0DTkC3+liPBhG8KpMWIxXptD6EEN
 9ANl1vib8yF9xb+F49ZPLr1hIds5x5IlJ0m0msPCQ2dugDSUkNBlkheJzQuNYbQnaNGy
 pGmw1B5HhDjxPHUsv4qX1PJsZodUIMfx1WCMiSgt5EBbtwmDd1la78VEcw0Bw6Fg/1qe
 L76ljiZBZq4TKPRfvaBkZLuFPde5IZrcSgWjq5dFk9Zd64XT+G1c9yBvP7Gx7UbZW1eP
 Wqfw==
X-Gm-Message-State: AGi0PuYDFC+hS8bN5Bz3sUwgMz4c8C9krG4H6DXUHdBcXlaNvdY+mLvl
 KLUAk6+9qZRBtPv3YhhtwHL8Dw==
X-Google-Smtp-Source: APiQypKMrtzLtcYGWp4dG1NAbMUTRsNrTsppRTIHIlD8etyQZfgxQrL60Cxc+R5NoVqtisFTu7ONDA==
X-Received: by 2002:adf:f08b:: with SMTP id n11mr4424630wro.36.1586936459725; 
 Wed, 15 Apr 2020 00:40:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:40:59 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 18/59] drm/ili9341: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:39:53 +0200
Message-Id: <20200415074034.175360-19-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: David Lechner <david@lechnology.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxyZWFkeSB1c2luZyBkZXZtX2RybV9kZXZfaW5pdCwgc28gdmVyeSBzaW1wbGUgcmVwbGFjbWVu
dC4KCkFja2VkLWJ5OiBEYXZpZCBMZWNobmVyIDxkYXZpZEBsZWNobm9sb2d5LmNvbT4KQWNrZWQt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiAiTm9yYWxmIFRyw7hubmVzIiA8
bm9yYWxmQHRyb25uZXMub3JnPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IEVyaWMgQW5ob2x0
IDxlcmljQGFuaG9sdC5uZXQ+CkNjOiBEYXZpZCBMZWNobmVyIDxkYXZpZEBsZWNobm9sb2d5LmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGlueS9pbGk5MzQxLmMgfCAxMyArKysrLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55L2lsaTkzNDEuYyBiL2RyaXZlcnMvZ3B1L2RybS90
aW55L2lsaTkzNDEuYwppbmRleCBlMTUyZGUzNjkwMTkuLmJiODE5ZjQ1YTVkMyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3RpbnkvaWxpOTM0MS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90
aW55L2lsaTkzNDEuYwpAQCAtMTgzLDE4ICsxODMsMTMgQEAgc3RhdGljIGludCBpbGk5MzQxX3By
b2JlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCiAJdTMyIHJvdGF0aW9uID0gMDsKIAlpbnQgcmV0
OwogCi0JZGJpZGV2ID0ga3phbGxvYyhzaXplb2YoKmRiaWRldiksIEdGUF9LRVJORUwpOwotCWlm
ICghZGJpZGV2KQotCQlyZXR1cm4gLUVOT01FTTsKKwlkYmlkZXYgPSBkZXZtX2RybV9kZXZfYWxs
b2MoZGV2LCAmaWxpOTM0MV9kcml2ZXIsCisJCQkJICAgIHN0cnVjdCBtaXBpX2RiaV9kZXYsIGRy
bSk7CisJaWYgKElTX0VSUihkYmlkZXYpKQorCQlyZXR1cm4gUFRSX0VSUihkYmlkZXYpOwogCiAJ
ZGJpID0gJmRiaWRldi0+ZGJpOwogCWRybSA9ICZkYmlkZXYtPmRybTsKLQlyZXQgPSBkZXZtX2Ry
bV9kZXZfaW5pdChkZXYsIGRybSwgJmlsaTkzNDFfZHJpdmVyKTsKLQlpZiAocmV0KSB7Ci0JCWtm
cmVlKGRiaWRldik7Ci0JCXJldHVybiByZXQ7Ci0JfQotCWRybW1fYWRkX2ZpbmFsX2tmcmVlKGRy
bSwgZGJpZGV2KTsKIAogCWRiaS0+cmVzZXQgPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChkZXYs
ICJyZXNldCIsIEdQSU9EX09VVF9ISUdIKTsKIAlpZiAoSVNfRVJSKGRiaS0+cmVzZXQpKSB7Ci0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
