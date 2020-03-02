Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D82D176743
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E5D6E8E3;
	Mon,  2 Mar 2020 22:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594946E867
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x7so1916196wrr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O8WxP+W9FFLxMwS3avexsGbMfAXgLLBMh8QsMlhjz8Y=;
 b=ieyzOstMtSc5OFkQMXHite8rUK/wZ1lG6E55KxvCazHzGx1ggonh2LyE0HcSbNbJL4
 6pTLtnIOICEctSBDvu88Fr21jK+TkBcEXLZQGFdZJ9/VDi6uiQdXtH6EWvQEeHTHHb/W
 wnPFAbVBu1YdQJIpqtIzaVqLyJz+qRub8BasQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O8WxP+W9FFLxMwS3avexsGbMfAXgLLBMh8QsMlhjz8Y=;
 b=Q8i1+zUCThtJZkEsnxtS8GrqxW4Y4w2Ul9bqaOZlYDkLau5OTb40WI9GJ73fjxCp3+
 vT/w9mDSn7s6pPgxO8XfQiq1Bpwm6oBmsHy5IbJT/C5MaKvMGt1ttq3TpCivtqykJFfu
 oMbQe6AWNZ3yYQFh4IpoK/f+m1pkPFKwhJ0QWSokXvwyS5uvD/tpOxYIDUL6vJ6MKL61
 LuBNDD1EgE0IJfrd156KPVj4CBZuLWtE4sbl9Qc+xP7f7Px+FLM0WBZ7xF98gXVzrOJ5
 +ppFSc7wTmRCzh7oNowhCRJyaOdmf86m+5IAab8Xc14tK1ILB0Kpug2Nndsy2UoTfQmo
 4SbA==
X-Gm-Message-State: ANhLgQ3gFHsVgSC1PuDy1Zu0PH1idLAJPwFccNkWydYC13d8haQX13W3
 5TAMKszpCPVQkh0AfWHSh5IXWInbXt8=
X-Google-Smtp-Source: ADFU+vsuxmDHkJ5exaI1/2fA9yYQmYkOQxBAl2ArEl8njVUSlohfH/s5nIgSDP9BbYSu+M/eNqV93A==
X-Received: by 2002:adf:f349:: with SMTP id e9mr1756532wrp.56.1583188052767;
 Mon, 02 Mar 2020 14:27:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:31 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 42/51] drm/gm12u320: More drmm_
Date: Mon,  2 Mar 2020 23:26:22 +0100
Message-Id: <20200302222631.3861340-43-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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
IAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
