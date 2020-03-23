Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CAF18F797
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4676E24D;
	Mon, 23 Mar 2020 14:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81216E24D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m17so8462420wrw.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z93YHdc5rIfXXQ9c0d1lgZMCmwRt2rA3AMMFMsoh+Us=;
 b=UhbbFXXJx40Fh81Y1I1CxQ2mM9Q/eXQ/vVTJFwYeEDAEfZhFPBT2NRWLnHjHimdpVo
 AziH/fmC+hFLrjUD5hc2wvktidBR/Pl+sFuFEdl30mljNUCAk/Y1EeXIwNIKHRwjaMBu
 +z+T4PZhbvvj0IIjXyGGwVQhqFBPBRVtTAtIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z93YHdc5rIfXXQ9c0d1lgZMCmwRt2rA3AMMFMsoh+Us=;
 b=fSQxOpe2aPN+tMlww49khLkL0kf/bBgojvV869V190B92U5188TKqP/DGCjg/Ij2+v
 uzu5jODCCpcLaqpWhSHq7qzNO/C8pB61I8YfrqXOBiFEJWF6JXB6Gj5G5cXiYvkQiyqP
 UtW6UcqANEzUvKv7KE/WcmF6Pzm0+3BeonQIdPnQ2gwWiADZYpwzMfxxkI9ACobbtRAq
 BM60p2wiIwwfHj4vH/F9/G5bcJcS646th1GMKdxaqs46WYdIZPWiLNBwhpL2/XH05tJ/
 d3kxV+RVsJPJEE3Ea8ZP8Ay67Ut0ToQEr8nvV+Qy/H+FdxctWFM7xnXIFWBPyoMHbSBb
 wD+w==
X-Gm-Message-State: ANhLgQ0oB0mHH3kFuwzrRhgCEBWu4aFdcNMIwyn91cvfpGU44hLLW1YZ
 PkcCPFz+1hRglHKbXs9HDTKDJjfTr/EpUg==
X-Google-Smtp-Source: ADFU+vvlna30QvcG3Z5HgbV2pZfGDro7Rul5FZq9ItMeRE3p0czgIINs9fQtDa0LG7T++0HlPXb3pg==
X-Received: by 2002:adf:fd87:: with SMTP id d7mr30243703wrr.393.1584975056103; 
 Mon, 23 Mar 2020 07:50:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:55 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 42/51] drm/gm12u320: More drmm_
Date: Mon, 23 Mar 2020 15:49:41 +0100
Message-Id: <20200323144950.3018436-43-daniel.vetter@ffwll.ch>
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
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwIGNhbGwgd2UgY2FuIGRyb3AsIGFuZCBhbGwgdGhl
IGFsbG9jYXRpb25zCndlIGNhbiBzd2l0Y2ggb3ZlciB0byBkcm1tX2t6YWxsb2MuIFVuZm9ydHVu
YXRlbHkgdGhlIHdvcmsgcXVldWUgaXMKc3RpbGwgcHJlc2VudCwgc28gY2FuJ3QgZ2V0IHJpZCBv
ZiB0aGUgZHJtX2RyaXZlci0+cmVsZWFzZSBmdW5jdGlvbgpvdXRyaWdodC4KCnYyOiBVc2UgZHJt
bV9tb2RlX2NvbmZpZ19pbml0KCkgZm9yIG1vcmUgY2xhcml0eSAoU2FtLCBUaG9tYXMpCgpDYzog
U2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+ClJldmlld2VkLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUBy
ZWRoYXQuY29tPiAodjEpClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgpDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KQ2M6
ICJOb3JhbGYgVHLDuG5uZXMiIDxub3JhbGZAdHJvbm5lcy5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3RpbnkvZ20xMnUzMjAuYyB8IDE4ICsrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3RpbnkvZ20xMnUzMjAuYyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L2dtMTJ1MzIw
LmMKaW5kZXggMzkyOGY2OWJiZDNkLi4zMzQ5ZjNjMmE3NjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90aW55L2dtMTJ1MzIwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20xMnUz
MjAuYwpAQCAtMTYwLDcgKzE2MCw3IEBAIHN0YXRpYyBpbnQgZ20xMnUzMjBfdXNiX2FsbG9jKHN0
cnVjdCBnbTEydTMyMF9kZXZpY2UgKmdtMTJ1MzIwKQogCWludCBpLCBibG9ja19zaXplOwogCWNv
bnN0IGNoYXIgKmhkcjsKIAotCWdtMTJ1MzIwLT5jbWRfYnVmID0ga21hbGxvYyhDTURfU0laRSwg
R0ZQX0tFUk5FTCk7CisJZ20xMnUzMjAtPmNtZF9idWYgPSBkcm1tX2ttYWxsb2MoJmdtMTJ1MzIw
LT5kZXYsIENNRF9TSVpFLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWdtMTJ1MzIwLT5jbWRfYnVmKQog
CQlyZXR1cm4gLUVOT01FTTsKIApAQCAtMTczLDcgKzE3Myw4IEBAIHN0YXRpYyBpbnQgZ20xMnUz
MjBfdXNiX2FsbG9jKHN0cnVjdCBnbTEydTMyMF9kZXZpY2UgKmdtMTJ1MzIwKQogCQkJaGRyID0g
ZGF0YV9ibG9ja19oZWFkZXI7CiAJCX0KIAotCQlnbTEydTMyMC0+ZGF0YV9idWZbaV0gPSBremFs
bG9jKGJsb2NrX3NpemUsIEdGUF9LRVJORUwpOworCQlnbTEydTMyMC0+ZGF0YV9idWZbaV0gPSBk
cm1tX2t6YWxsb2MoJmdtMTJ1MzIwLT5kZXYsCisJCQkJCQkgICAgIGJsb2NrX3NpemUsIEdGUF9L
RVJORUwpOwogCQlpZiAoIWdtMTJ1MzIwLT5kYXRhX2J1ZltpXSkKIAkJCXJldHVybiAtRU5PTUVN
OwogCkBAIC0xOTIsMTUgKzE5Myw4IEBAIHN0YXRpYyBpbnQgZ20xMnUzMjBfdXNiX2FsbG9jKHN0
cnVjdCBnbTEydTMyMF9kZXZpY2UgKmdtMTJ1MzIwKQogCiBzdGF0aWMgdm9pZCBnbTEydTMyMF91
c2JfZnJlZShzdHJ1Y3QgZ20xMnUzMjBfZGV2aWNlICpnbTEydTMyMCkKIHsKLQlpbnQgaTsKLQog
CWlmIChnbTEydTMyMC0+ZmJfdXBkYXRlLndvcmtxKQogCQlkZXN0cm95X3dvcmtxdWV1ZShnbTEy
dTMyMC0+ZmJfdXBkYXRlLndvcmtxKTsKLQotCWZvciAoaSA9IDA7IGkgPCBHTTEyVTMyMF9CTE9D
S19DT1VOVDsgaSsrKQotCQlrZnJlZShnbTEydTMyMC0+ZGF0YV9idWZbaV0pOwotCi0Ja2ZyZWUo
Z20xMnUzMjAtPmNtZF9idWYpOwogfQogCiBzdGF0aWMgaW50IGdtMTJ1MzIwX21pc2NfcmVxdWVz
dChzdHJ1Y3QgZ20xMnUzMjBfZGV2aWNlICpnbTEydTMyMCwKQEAgLTYzNiw3ICs2MzAsNiBAQCBz
dGF0aWMgdm9pZCBnbTEydTMyMF9kcml2ZXJfcmVsZWFzZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
KQogCXN0cnVjdCBnbTEydTMyMF9kZXZpY2UgKmdtMTJ1MzIwID0gZGV2LT5kZXZfcHJpdmF0ZTsK
IAogCWdtMTJ1MzIwX3VzYl9mcmVlKGdtMTJ1MzIwKTsKLQlkcm1fbW9kZV9jb25maWdfY2xlYW51
cChkZXYpOwogfQogCiBERUZJTkVfRFJNX0dFTV9GT1BTKGdtMTJ1MzIwX2ZvcHMpOwpAQCAtNjkz
LDcgKzY4NiwxMCBAQCBzdGF0aWMgaW50IGdtMTJ1MzIwX3VzYl9wcm9iZShzdHJ1Y3QgdXNiX2lu
dGVyZmFjZSAqaW50ZXJmYWNlLAogCWRldi0+ZGV2X3ByaXZhdGUgPSBnbTEydTMyMDsKIAlkcm1t
X2FkZF9maW5hbF9rZnJlZShkZXYsIGdtMTJ1MzIwKTsKIAotCWRybV9tb2RlX2NvbmZpZ19pbml0
KGRldik7CisJcmV0ID0gZHJtbV9tb2RlX2NvbmZpZ19pbml0KGRldik7CisJaWYgKHJldCkKKwkJ
Z290byBlcnJfcHV0OworCiAJZGV2LT5tb2RlX2NvbmZpZy5taW5fd2lkdGggPSBHTTEyVTMyMF9V
U0VSX1dJRFRIOwogCWRldi0+bW9kZV9jb25maWcubWF4X3dpZHRoID0gR00xMlUzMjBfVVNFUl9X
SURUSDsKIAlkZXYtPm1vZGVfY29uZmlnLm1pbl9oZWlnaHQgPSBHTTEyVTMyMF9IRUlHSFQ7Ci0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
