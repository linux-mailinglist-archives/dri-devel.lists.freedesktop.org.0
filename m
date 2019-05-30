Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84EE30055
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 18:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB386E3B8;
	Thu, 30 May 2019 16:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F956E162;
 Thu, 30 May 2019 16:01:01 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id f25so2260745pgv.10;
 Thu, 30 May 2019 09:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/AvVj2fkffyKJVVEwFKFUqPeBodRCzKUgwbdD9q/Jf8=;
 b=f3cOVhin3sPUqEXwGB1ZFagqHv6SutYp+gCzlQlYDZ7QoKQXiQDMdeCTGxTTuSjEii
 HlRUGyc0t98Lxp2k9j8UOgLwA1SqJOsVPxYVFUf8G8772b2cMPKTCdyUx9ODf0f938iw
 cAqYF5Vn23K6WQC26o/axcnYAHgL9OveEvqKjuqSLyLMe9tPnQbE6rcXaLFjp7ig+2Qg
 jpcOFA56nTn1e6ry324HxssIMyOZYTvK8MYyHHpfaIHvZmer6S4AiVGA9esHtim3nDCv
 dSMLUb5UJa1+NuYX+h9YCqdSA2g+WCZ0u46E2fNQZVzr1GiIc5Bo25NGPkizP/z5HMy1
 a1DA==
X-Gm-Message-State: APjAAAXJeQsSmSbT4pf+UO7cYsnrko27PcB0Q+77QCyXOB3oSZRT+6px
 MvnBzb1SLoBqRL6+hfsVHNg=
X-Google-Smtp-Source: APXvYqxqMDv7lJX1pCMepVwjOk3m6ieg82K9QE0L8UaAoy7Qg4IpS/aWoSiApAu6sFckPzAk8O/8Eg==
X-Received: by 2002:a63:1642:: with SMTP id 2mr4282237pgw.230.1559232061116;
 Thu, 30 May 2019 09:01:01 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id d20sm3135230pjs.24.2019.05.30.09.00.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 09:01:00 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 4/4] drm/msm/dsi: Add support for MSM8998 DSI controller
Date: Thu, 30 May 2019 09:00:59 -0700
Message-Id: <20190530160059.2929-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
References: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
X-Mailman-Approved-At: Thu, 30 May 2019 16:46:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/AvVj2fkffyKJVVEwFKFUqPeBodRCzKUgwbdD9q/Jf8=;
 b=DwfznHmbKa3vatRv5uW8/u7C8ubKh0JIok9NCDOaOEufKHJNhUScZiMzcR18GcQhc/
 e20r5jT7DNivThJH0fk7HthJ0ozkmkokKsbd/1+9NrWO9Lho9Ev/KBU5johMaDjgQOad
 W3CJFJm/R4NXw3zi1d4AwJ+m1kM+ZX6AWgLc6tCrKYaIVOzt1oAYiFakIk8c8qf/Nrx4
 wEfQhMTtId1QLDVIb09CUYJ4mqiOisNjXRcARyb/n0ZU4QhSbhc+wXIi1bcecnsNj7f8
 Z2dLND+mHm8heNcgiXOJ26jFOsrIWUzqy5N5MeduadtaB2Z+xqZ5AQkxfVXdS6D7jXWn
 62nA==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marc.w.gonzalez@free.fr,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 sibis@codeaurora.org, freedreno@lists.freedesktop.org, chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERTSSBjb250cm9sbGVyIG9uIHRoZSBNU004OTk4IFNvQyBpcyBhIDZHIHYyLjAuMCBjb250
cm9sbGVyIHdoaWNoIGlzCnZlcnkgc2ltaWxhciB0byB0aGUgdjIuMC4xIG9mIFNETTg0NS4KClNp
Z25lZC1vZmYtYnk6IEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1Z29AZ21haWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuYyB8IDIxICsrKysrKysrKysrKysrKysr
KysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5oIHwgIDEgKwogMiBmaWxlcyBj
aGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9kc2kvZHNpX2NmZy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jCmluZGV4
IGRjZGZiMWJiNTRmOS4uN2RkMTdiNTljNjlkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2RzaS9kc2lfY2ZnLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5j
CkBAIC0xMTgsNiArMTE4LDI1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9jb25maWcg
bXNtODk5Nl9kc2lfY2ZnID0gewogCS5udW1fZHNpID0gMiwKIH07CiAKK3N0YXRpYyBjb25zdCBj
aGFyICogY29uc3QgZHNpX21zbTg5OThfYnVzX2Nsa19uYW1lc1tdID0geworCSJpZmFjZSIsICJi
dXMiLCAiY29yZSIsCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IG1zbV9kc2lfY29uZmlnIG1z
bTg5OThfZHNpX2NmZyA9IHsKKwkuaW9fb2Zmc2V0ID0gRFNJXzZHX1JFR19TSElGVCwKKwkucmVn
X2NmZyA9IHsKKwkJLm51bSA9IDIsCisJCS5yZWdzID0geworCQkJeyJ2ZGQiLCAzNjcwMDAsIDE2
IH0sCS8qIDAuOSBWICovCisJCQl7InZkZGEiLCA2MjgwMCwgMiB9LAkvKiAxLjIgViAqLworCQl9
LAorCX0sCisJLmJ1c19jbGtfbmFtZXMgPSBkc2lfbXNtODk5OF9idXNfY2xrX25hbWVzLAorCS5u
dW1fYnVzX2Nsa3MgPSBBUlJBWV9TSVpFKGRzaV9tc204OTk4X2J1c19jbGtfbmFtZXMpLAorCS5p
b19zdGFydCA9IHsgMHhjOTk0MDAwLCAweGM5OTYwMDAgfSwKKwkubnVtX2RzaSA9IDIsCit9Owor
CiBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGRzaV9zZG04NDVfYnVzX2Nsa19uYW1lc1tdID0g
ewogCSJpZmFjZSIsICJidXMiLAogfTsKQEAgLTE4Niw2ICsyMDUsOCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG1zbV9kc2lfY2ZnX2hhbmRsZXIgZHNpX2NmZ19oYW5kbGVyc1tdID0gewogCQkmbXNt
ODkxNl9kc2lfY2ZnLCAmbXNtX2RzaV82Z19ob3N0X29wc30sCiAJe01TTV9EU0lfVkVSX01BSk9S
XzZHLCBNU01fRFNJXzZHX1ZFUl9NSU5PUl9WMV80XzEsCiAJCSZtc204OTk2X2RzaV9jZmcsICZt
c21fZHNpXzZnX2hvc3Rfb3BzfSwKKwl7TVNNX0RTSV9WRVJfTUFKT1JfNkcsIE1TTV9EU0lfNkdf
VkVSX01JTk9SX1YyXzJfMCwKKwkJJm1zbTg5OThfZHNpX2NmZywgJm1zbV9kc2lfNmdfdjJfaG9z
dF9vcHN9LAogCXtNU01fRFNJX1ZFUl9NQUpPUl82RywgTVNNX0RTSV82R19WRVJfTUlOT1JfVjJf
Ml8xLAogCQkmc2RtODQ1X2RzaV9jZmcsICZtc21fZHNpXzZnX3YyX2hvc3Rfb3BzfSwKIH07CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmggYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmgKaW5kZXggMTZjNTA3OTExMTEwLi40ZjYzYjU3YjE5ZGMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmgKQEAgLTI1LDYgKzI1LDcgQEAKICNkZWZpbmUg
TVNNX0RTSV82R19WRVJfTUlOT1JfVjFfMwkweDEwMDMwMDAwCiAjZGVmaW5lIE1TTV9EU0lfNkdf
VkVSX01JTk9SX1YxXzNfMQkweDEwMDMwMDAxCiAjZGVmaW5lIE1TTV9EU0lfNkdfVkVSX01JTk9S
X1YxXzRfMQkweDEwMDQwMDAxCisjZGVmaW5lIE1TTV9EU0lfNkdfVkVSX01JTk9SX1YyXzJfMAkw
eDIwMDAwMDAwCiAjZGVmaW5lIE1TTV9EU0lfNkdfVkVSX01JTk9SX1YyXzJfMQkweDIwMDIwMDAx
CiAKICNkZWZpbmUgTVNNX0RTSV9WMl9WRVJfTUlOT1JfODA2NAkweDAKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
