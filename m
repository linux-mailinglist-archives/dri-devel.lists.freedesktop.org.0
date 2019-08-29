Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA901A328F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB966E2F2;
	Fri, 30 Aug 2019 08:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221D36E16D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 20:00:09 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t14so2070375plr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 13:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LnwOSHW+qkIfwX+CEo6pre2vAtIHSJHM7Ipb0uTKcN8=;
 b=Vla8QjfJreU84Fd0DZgTzV943BZRwQNj1MKjvspVoraYoLyRj2mN2NQsL0V0PyNwdZ
 diitF80M5Rf5RlvPOaGle39EzaIhltCuaz2xFaB8H35vbi1mhpp2CQMGZAy6lsjUxULv
 t3Wz/ZSC/CkNUFEFZqgqNaRSvCW26FcEPjERZR0H657+LgH+NEwXSyKRApjy0YwFO4G8
 bMtvHgF87jvDzSWZApDIlcKm+loYqT33Ce+KPhhlMFnhPRGdUcLGVfSliVSKzCvO9nEo
 VLMhHtnNJY9lnybtbcY2/BLkfpE0EfzwdvcR3xvnshMUqHIt5/wjmQhYhlevHNsQg+WS
 xn6Q==
X-Gm-Message-State: APjAAAVuArsTTLTpYI907cU4JGHcSQmsl1UUJSuBkk25MEsom0y8HUki
 yttgibJkko1x2ZxBdv39jp8QNKVBH8M=
X-Google-Smtp-Source: APXvYqwdxPRjNZXc7J371kYMqpuaaLwSfZc+tGFJrILbQTyvwMq61GQBgGE76g8xmKy3HX0ZAhYEFg==
X-Received: by 2002:a17:902:9a07:: with SMTP id
 v7mr12015218plp.245.1567108808730; 
 Thu, 29 Aug 2019 13:00:08 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id u7sm3053766pgr.94.2019.08.29.13.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 13:00:08 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.19.y 3/3] drm/tilcdc: Register cpufreq notifier after we
 have initialized crtc
Date: Thu, 29 Aug 2019 14:00:01 -0600
Message-Id: <20190829200001.17092-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829200001.17092-1-mathieu.poirier@linaro.org>
References: <20190829200001.17092-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LnwOSHW+qkIfwX+CEo6pre2vAtIHSJHM7Ipb0uTKcN8=;
 b=ljvhUTB5kgie6mZn/Katfok8X2WrFwgXFmGKAsJBCEExxJK+Nxf6/5JnDHhk1LxGzy
 GYRAppVUeZ1sd1GoWZIlw7jgdNHty21ipU5Xwbsjv2pDu76zTUuu2M0TYKjBIGiG+5/U
 z01+UGUU35QOWpFRzt7fPcfbQ99aFBb2fmxT0/oIwQsg9/ldDduJhzRqeDTeL/2cT+fn
 xZEkAhbQh16HdO3N3dLit2heuBIRhD2aWB6bocU4JidBTKhPZUvGLVHHMbcSP5Om8Rkn
 fjF4IfC7pe9zuVYT61BgDPYNoG1OUc1oLDYMoO1xaeTde3LKzueqjrs2vOyE7CXBh8Pc
 jvRQ==
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
Cc: architt@codeaurora.org, jejb@linux.vnet.ibm.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jsarha@ti.com, tomi.valkeinen@ti.com,
 Laurent.pinchart@ideasonboard.com, vinholikatti@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KCmNvbW1pdCA0MzI5NzNmZDNhMjAxMDI4
NDBkNWY3ZTYxYWY5ZjFhMDNjMjE3YTRjIHVwc3RyZWFtCgpSZWdpc3RlciBjcHVmcmVxIG5vdGlm
aWVyIGFmdGVyIHdlIGhhdmUgaW5pdGlhbGl6ZWQgdGhlIGNydGMgYW5kCnVucmVnaXN0ZXIgaXQg
YmVmb3JlIHdlIHJlbW92ZSB0aGUgY3RyYy4gUmVjZWl2aW5nIGEgY3B1ZnJlcSBub3RpZnkKd2l0
aG91dCBjcnRjIGNhdXNlcyBhIGNyYXNoLgoKUmVwb3J0ZWQtYnk6IFBldGVyIFVqZmFsdXNpIDxw
ZXRlci51amZhbHVzaUB0aS5jb20+ClNpZ25lZC1vZmYtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0
aS5jb20+ClNpZ25lZC1vZmYtYnk6IE1hdGhpZXUgUG9pcmllciA8bWF0aGlldS5wb2lyaWVyQGxp
bmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfZHJ2LmMgfCAzNCAr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aWxj
ZGMvdGlsY2RjX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfZHJ2LmMKaW5k
ZXggMGZiMzAwZDQxYTA5Li5lMTg2ODc3NmRhMjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90aWxjZGMvdGlsY2RjX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2Rj
X2Rydi5jCkBAIC0xODQsNiArMTg0LDEyIEBAIHN0YXRpYyB2b2lkIHRpbGNkY19maW5pKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IHRpbGNkY19kcm1fcHJpdmF0ZSAqcHJpdiA9
IGRldi0+ZGV2X3ByaXZhdGU7CiAKKyNpZmRlZiBDT05GSUdfQ1BVX0ZSRVEKKwlpZiAocHJpdi0+
ZnJlcV90cmFuc2l0aW9uLm5vdGlmaWVyX2NhbGwpCisJCWNwdWZyZXFfdW5yZWdpc3Rlcl9ub3Rp
ZmllcigmcHJpdi0+ZnJlcV90cmFuc2l0aW9uLAorCQkJCQkgICAgQ1BVRlJFUV9UUkFOU0lUSU9O
X05PVElGSUVSKTsKKyNlbmRpZgorCiAJaWYgKHByaXYtPmNydGMpCiAJCXRpbGNkY19jcnRjX3No
dXRkb3duKHByaXYtPmNydGMpOwogCkBAIC0xOTgsMTIgKzIwNCw2IEBAIHN0YXRpYyB2b2lkIHRp
bGNkY19maW5pKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJZHJtX21vZGVfY29uZmlnX2NsZWFu
dXAoZGV2KTsKIAl0aWxjZGNfcmVtb3ZlX2V4dGVybmFsX2RldmljZShkZXYpOwogCi0jaWZkZWYg
Q09ORklHX0NQVV9GUkVRCi0JaWYgKHByaXYtPmZyZXFfdHJhbnNpdGlvbi5ub3RpZmllcl9jYWxs
KQotCQljcHVmcmVxX3VucmVnaXN0ZXJfbm90aWZpZXIoJnByaXYtPmZyZXFfdHJhbnNpdGlvbiwK
LQkJCQkJICAgIENQVUZSRVFfVFJBTlNJVElPTl9OT1RJRklFUik7Ci0jZW5kaWYKLQogCWlmIChw
cml2LT5jbGspCiAJCWNsa19wdXQocHJpdi0+Y2xrKTsKIApAQCAtMjc0LDE3ICsyNzQsNiBAQCBz
dGF0aWMgaW50IHRpbGNkY19pbml0KHN0cnVjdCBkcm1fZHJpdmVyICpkZHJ2LCBzdHJ1Y3QgZGV2
aWNlICpkZXYpCiAJCWdvdG8gaW5pdF9mYWlsZWQ7CiAJfQogCi0jaWZkZWYgQ09ORklHX0NQVV9G
UkVRCi0JcHJpdi0+ZnJlcV90cmFuc2l0aW9uLm5vdGlmaWVyX2NhbGwgPSBjcHVmcmVxX3RyYW5z
aXRpb247Ci0JcmV0ID0gY3B1ZnJlcV9yZWdpc3Rlcl9ub3RpZmllcigmcHJpdi0+ZnJlcV90cmFu
c2l0aW9uLAotCQkJQ1BVRlJFUV9UUkFOU0lUSU9OX05PVElGSUVSKTsKLQlpZiAocmV0KSB7Ci0J
CWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIGNwdWZyZXEgbm90aWZpZXJcbiIpOwot
CQlwcml2LT5mcmVxX3RyYW5zaXRpb24ubm90aWZpZXJfY2FsbCA9IE5VTEw7Ci0JCWdvdG8gaW5p
dF9mYWlsZWQ7Ci0JfQotI2VuZGlmCi0KIAlpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwg
Im1heC1iYW5kd2lkdGgiLCAmcHJpdi0+bWF4X2JhbmR3aWR0aCkpCiAJCXByaXYtPm1heF9iYW5k
d2lkdGggPSBUSUxDRENfREVGQVVMVF9NQVhfQkFORFdJRFRIOwogCkBAIC0zNjEsNiArMzUwLDE3
IEBAIHN0YXRpYyBpbnQgdGlsY2RjX2luaXQoc3RydWN0IGRybV9kcml2ZXIgKmRkcnYsIHN0cnVj
dCBkZXZpY2UgKmRldikKIAl9CiAJbW9kZXNldF9pbml0KGRkZXYpOwogCisjaWZkZWYgQ09ORklH
X0NQVV9GUkVRCisJcHJpdi0+ZnJlcV90cmFuc2l0aW9uLm5vdGlmaWVyX2NhbGwgPSBjcHVmcmVx
X3RyYW5zaXRpb247CisJcmV0ID0gY3B1ZnJlcV9yZWdpc3Rlcl9ub3RpZmllcigmcHJpdi0+ZnJl
cV90cmFuc2l0aW9uLAorCQkJQ1BVRlJFUV9UUkFOU0lUSU9OX05PVElGSUVSKTsKKwlpZiAocmV0
KSB7CisJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIGNwdWZyZXEgbm90aWZpZXJc
biIpOworCQlwcml2LT5mcmVxX3RyYW5zaXRpb24ubm90aWZpZXJfY2FsbCA9IE5VTEw7CisJCWdv
dG8gaW5pdF9mYWlsZWQ7CisJfQorI2VuZGlmCisKIAlpZiAocHJpdi0+aXNfY29tcG9uZW50aXpl
ZCkgewogCQlyZXQgPSBjb21wb25lbnRfYmluZF9hbGwoZGV2LCBkZGV2KTsKIAkJaWYgKHJldCA8
IDApCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
