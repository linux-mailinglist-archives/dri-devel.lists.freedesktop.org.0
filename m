Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D3718F780
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199886E1CD;
	Mon, 23 Mar 2020 14:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90486E213
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:37 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m17so8460897wrw.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=atkH2g488R1CB16DuIUv15OUWez2VfrV7sgc1phFlME=;
 b=SGvCAMB98FzZ1pEOk8bLX89/7AUjmGgznzwANqTHzGZBd6Uj7gXTwmK8bvofbZbHyx
 FDy6NQ2tzfsubGxaexzHc0bZK5jM3j13LdSmbUApdq1RmkIYtXBYTBFWvyIuKXe4REOz
 jFdNYkYG5ZNj05NvZdw5WobkJGk+UMw1vh0l4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=atkH2g488R1CB16DuIUv15OUWez2VfrV7sgc1phFlME=;
 b=Mi7zMBHnwoWTQnYDCpXJsTZPmVTLNRYETP06MYBj4Liuig2K5xFTrFDHFZ/sfOp0fJ
 X7NGIKKq8jDDL33lCMhuLpwJpKMD0jCtSgnTqS3yx0avsbB3bJQe3onwNpfknaTYh6SZ
 VWuj9/VbhPh/QwV56Z/GFvuBGyz2ixrnw63AepEM3JpX/hWsUThjEgrw9h5d9wYBYCJC
 Kxblx6dd+R5kqcDJdOZ7e/Ydlx/KIlT2L1LmBD0wx5FGvxXHPM2ZrXdi8klWivpwJAnU
 uXdeb4abWnHTJGRF2TzQLu4teemVKs/yG4hJqG9aflwhB1NtbeolsNzE1u0NUgyW62c9
 K9BQ==
X-Gm-Message-State: ANhLgQ2hzhbUGjmSMnSrf/OxvPrE1VLvzFPSI0uwy3LZnmpqmNbhVdAy
 YT9HMP3xtygbd4AUFwY3Y5Hmy0EhJcK0mQ==
X-Google-Smtp-Source: ADFU+vt5gAk+l64lCZqn/dD1TA9Jzq4OBuX5u3M5SpSxpswWHeLlcPEUYEg93xJ5RfnFHao57jEnjg==
X-Received: by 2002:adf:8385:: with SMTP id 5mr13374232wre.35.1584975036240;
 Mon, 23 Mar 2020 07:50:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 29/51] drm/cirrus: Drop explicit drm_mode_config_cleanup call
Date: Mon, 23 Mar 2020 15:49:28 +0100
Message-Id: <20200323144950.3018436-30-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgY2FuIGV2ZW4gZGVsZXRlIHRoZSBkcm1fZHJpdmVyLnJlbGVhc2UgaG9vayBub3chCgpUaGlz
IGlzIG1hZGUgcG9zc2libGUgYnkgYSBwcmVjZWVkaW5nIHBhdGNoIHdoaWNoIGFkZGVkIGEgZHJt
bV8KY2xlYW51cCBhY3Rpb24gdG8gZHJtX21vZGVfY29uZmlnX2luaXQoKSwgaGVuY2UgYWxsIHdl
IG5lZWQgdG8gZG8gdG8KZW5zdXJlIHRoYXQgZHJtX21vZGVfY29uZmlnX2NsZWFudXAoKSBpcyBy
dW4gb24gZmluYWwgZHJtX2RldmljZQpjbGVhbnVwIGlzIGNoZWNrIHRoZSBuZXcgZXJyb3IgY29k
ZSBmb3IgX2luaXQoKS4KCnYyOiBFeHBsYWluIHdoeSB0aGlzIGNsZWFudXAgaXMgcG9zc2libGUg
KExhdXJlbnQpLgoKdjM6IFVzZSBkcm1tX21vZGVfY29uZmlnX2luaXQoKSBmb3IgbW9yZSBjbGFy
aXR5IChTYW0sIFRob21hcykKCkFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0
LmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQWNrZWQtYnk6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPgpDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGludGVsLmNvbT4KQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiBHZXJk
IEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+CkNjOiAiTm9yYWxmIFRyw7hubmVzIiA8bm9yYWxmQHRyb25uZXMub3Jn
PgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMgfCAyMSAr
KysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAx
MCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1
cy5jIGIvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYwppbmRleCBhOWQ3ODlhNTY1MzYu
LmJkODc4NGVhOWQ2NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCkBAIC01MTAsMTEgKzUxMCwx
NSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyBjaXJydXNfbW9k
ZV9jb25maWdfZnVuY3MgPSB7CiAJLmF0b21pY19jb21taXQgPSBkcm1fYXRvbWljX2hlbHBlcl9j
b21taXQsCiB9OwogCi1zdGF0aWMgdm9pZCBjaXJydXNfbW9kZV9jb25maWdfaW5pdChzdHJ1Y3Qg
Y2lycnVzX2RldmljZSAqY2lycnVzKQorc3RhdGljIGludCBjaXJydXNfbW9kZV9jb25maWdfaW5p
dChzdHJ1Y3QgY2lycnVzX2RldmljZSAqY2lycnVzKQogewogCXN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYgPSAmY2lycnVzLT5kZXY7CisJaW50IHJldDsKKworCXJldCA9IGRybW1fbW9kZV9jb25maWdf
aW5pdChkZXYpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAKLQlkcm1fbW9kZV9jb25maWdf
aW5pdChkZXYpOwogCWRldi0+bW9kZV9jb25maWcubWluX3dpZHRoID0gMDsKIAlkZXYtPm1vZGVf
Y29uZmlnLm1pbl9oZWlnaHQgPSAwOwogCWRldi0+bW9kZV9jb25maWcubWF4X3dpZHRoID0gQ0lS
UlVTX01BWF9QSVRDSCAvIDI7CkBAIC01MjIsMTUgKzUyNiwxMiBAQCBzdGF0aWMgdm9pZCBjaXJy
dXNfbW9kZV9jb25maWdfaW5pdChzdHJ1Y3QgY2lycnVzX2RldmljZSAqY2lycnVzKQogCWRldi0+
bW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMTY7CiAJZGV2LT5tb2RlX2NvbmZpZy5wcmVm
ZXJfc2hhZG93ID0gMDsKIAlkZXYtPm1vZGVfY29uZmlnLmZ1bmNzID0gJmNpcnJ1c19tb2RlX2Nv
bmZpZ19mdW5jczsKKworCXJldHVybiAwOwogfQogCiAvKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gKi8KIAotc3RhdGlj
IHZvaWQgY2lycnVzX3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikKLXsKLQlkcm1fbW9k
ZV9jb25maWdfY2xlYW51cChkZXYpOwotfQotCiBERUZJTkVfRFJNX0dFTV9GT1BTKGNpcnJ1c19m
b3BzKTsKIAogc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGNpcnJ1c19kcml2ZXIgPSB7CkBAIC01
NDQsNyArNTQ1LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGNpcnJ1c19kcml2ZXIgPSB7
CiAKIAkuZm9wcwkJID0gJmNpcnJ1c19mb3BzLAogCURSTV9HRU1fU0hNRU1fRFJJVkVSX09QUywK
LQkucmVsZWFzZSAgICAgICAgID0gY2lycnVzX3JlbGVhc2UsCiB9OwogCiBzdGF0aWMgaW50IGNp
cnJ1c19wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCkBAIC01OTEsNyArNTkxLDkgQEAg
c3RhdGljIGludCBjaXJydXNfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAogCWlmIChj
aXJydXMtPm1taW8gPT0gTlVMTCkKIAkJZ290byBlcnJfdW5tYXBfdnJhbTsKIAotCWNpcnJ1c19t
b2RlX2NvbmZpZ19pbml0KGNpcnJ1cyk7CisJcmV0ID0gY2lycnVzX21vZGVfY29uZmlnX2luaXQo
Y2lycnVzKTsKKwlpZiAocmV0KQorCQlnb3RvIGVycl9jbGVhbnVwOwogCiAJcmV0ID0gY2lycnVz
X2Nvbm5faW5pdChjaXJydXMpOwogCWlmIChyZXQgPCAwKQpAQCAtNjEzLDcgKzYxNSw2IEBAIHN0
YXRpYyBpbnQgY2lycnVzX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKIAlyZXR1cm4g
MDsKIAogZXJyX2NsZWFudXA6Ci0JZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZGV2KTsKIAlpb3Vu
bWFwKGNpcnJ1cy0+bW1pbyk7CiBlcnJfdW5tYXBfdnJhbToKIAlpb3VubWFwKGNpcnJ1cy0+dnJh
bSk7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
