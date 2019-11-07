Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEA8F2DD7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 13:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A559E6E435;
	Thu,  7 Nov 2019 12:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1A96E42E;
 Thu,  7 Nov 2019 12:01:22 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t26so2107868wmi.4;
 Thu, 07 Nov 2019 04:01:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oWlbIy4SUN0siRniERYH7JAO7idrfXJDG2cvbP/TwRM=;
 b=banSZTYOxWY8aTOiv9DSgo7i6nIoTWQCJbwB12gew+2qVBINEHsZDGsQ/INzEQhpXB
 U04tL6SdBS+aXw3rJmvocOR3NDsn+7mubUT2INF5ffMoGeZ7CLM4EWiDTa5OJLIt/V3q
 jEYIxDEtB6/5OxQKr0lRHuAjCgnyeYOB3loTE71xOgJ4L988i79n/jiQE66uEmZJpr8o
 os/4073wEX81WpRaI6G7OdifhDycII5SmEpKocUmAACCHdd1vPdEWYsdzfwBM91OUmu5
 4YkmJHanuAqKFI0mct2IZVCrVqaEqcdwKLZvWE4zeTuzV4KTogJHRsHsTOCPcZhiGEPv
 fG6A==
X-Gm-Message-State: APjAAAUN6e5qx8FvqOrRrfiQFg31CBHGjjDHAIFLOZazue6bmPxvlTga
 jv9uKexMmX7i5DLAGn6+r7+8I9th
X-Google-Smtp-Source: APXvYqwohKmXfpXuo+2fq/JHxomXptXF77E+bqJB3eGst/HsKTL15cy5yGHmnZiTNQb3gu4XZ76pUA==
X-Received: by 2002:a7b:c1d0:: with SMTP id a16mr2666623wmj.127.1573128080524; 
 Thu, 07 Nov 2019 04:01:20 -0800 (PST)
Received: from laptop.fritz.box ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x6sm60116wrw.34.2019.11.07.04.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 04:01:19 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: also export ttm_bo_vm_fault v2
Date: Thu,  7 Nov 2019 13:01:17 +0100
Message-Id: <20191107120118.2825-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oWlbIy4SUN0siRniERYH7JAO7idrfXJDG2cvbP/TwRM=;
 b=drhIPTAHEmUlVPK4k43wg0dVUdLQLH2HTc+c/3dM7oZoZ3VcbxJGPEhgyNYALXNoB+
 oYxGM+fARLWUbcCsCbj2GevPh66aYrnNB6U1PHuhsb1BiAlJHqzoZAVdoZZrED04FtRj
 cVXm2ES1KKNU/Azy46xRHWCnCT88eVun1pIW/KEpHRfTvt2TuAT/8QNtdQaNqfHbo0I8
 ZGEsFFm1kStR5q5A1DgDJT2IzV0SYO7d6p89OwJbxFvbhXiVDta/f1j3DrNWrcTsqUCy
 dJW5tRGPr1tbcvqmmLIW7PmJPlktsxiT+xjKd2lFUTlhjwqSsNGKz6LERusDYmY7X3c1
 uYvw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+
CgpUaGF0IGlzIG5lZWRlZCBieSBhdCBsZWFzdCBhIGNsZWFudXAgaW4gcmFkZW9uLgoKdjI6IGFs
c28gZXhwb3J0IHR0bV9ib192bV9hY2Nlc3MKClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5
Lmh1YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyB8IDgg
KysrKystLS0KIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggICAgfCA2ICsrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9ib192bS5jCmluZGV4IDkxNDY2Y2ZiNmYxNi4uZTY0OTVjYTI2MzBiIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvX3ZtLmMKQEAgLTMwOCw3ICszMDgsNyBAQCB2bV9mYXVsdF90IHR0bV9ib192bV9m
YXVsdF9yZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKIH0KIEVYUE9SVF9TWU1CT0wodHRt
X2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKTsKIAotc3RhdGljIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2Zh
dWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQordm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHQoc3Ry
dWN0IHZtX2ZhdWx0ICp2bWYpCiB7CiAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEgPSB2bWYt
PnZtYTsKIAlwZ3Byb3RfdCBwcm90OwpAQCAtMzI4LDYgKzMyOCw3IEBAIHN0YXRpYyB2bV9mYXVs
dF90IHR0bV9ib192bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIAogCXJldHVybiByZXQ7
CiB9CitFWFBPUlRfU1lNQk9MKHR0bV9ib192bV9mYXVsdCk7CiAKIHZvaWQgdHRtX2JvX3ZtX29w
ZW4oc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiB7CkBAIC0zODcsOCArMzg4LDggQEAgc3Rh
dGljIGludCB0dG1fYm9fdm1fYWNjZXNzX2ttYXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bywKIAlyZXR1cm4gbGVuOwogfQogCi1zdGF0aWMgaW50IHR0bV9ib192bV9hY2Nlc3Moc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwKLQkJCSAgICB2b2lkICpi
dWYsIGludCBsZW4sIGludCB3cml0ZSkKK2ludCB0dG1fYm9fdm1fYWNjZXNzKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIsCisJCSAgICAgdm9pZCAqYnVmLCBp
bnQgbGVuLCBpbnQgd3JpdGUpCiB7CiAJdW5zaWduZWQgbG9uZyBvZmZzZXQgPSAoYWRkcikgLSB2
bWEtPnZtX3N0YXJ0OwogCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSB2bWEtPnZtX3By
aXZhdGVfZGF0YTsKQEAgLTQyNCw2ICs0MjUsNyBAQCBzdGF0aWMgaW50IHR0bV9ib192bV9hY2Nl
c3Moc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAogCXJl
dHVybiByZXQ7CiB9CitFWFBPUlRfU1lNQk9MKHR0bV9ib192bV9hY2Nlc3MpOwogCiBzdGF0aWMg
Y29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHR0bV9ib192bV9vcHMgPSB7CiAJLmZh
dWx0ID0gdHRtX2JvX3ZtX2ZhdWx0LApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9i
b19hcGkuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKaW5kZXggZThiMGYwYzY2MDU5
Li42NmNhNDlkYjk2MzMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgK
KysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaApAQCAtNzM0LDcgKzczNCwxMyBAQCB2
bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwK
IAkJCQkgICAgcGdwcm90X3QgcHJvdCwKIAkJCQkgICAgcGdvZmZfdCBudW1fcHJlZmF1bHQpOwog
Cit2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZik7CisKIHZv
aWQgdHRtX2JvX3ZtX29wZW4oc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOwogCiB2b2lkIHR0
bV9ib192bV9jbG9zZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7CisKK2ludCB0dG1fYm9f
dm1fYWNjZXNzKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIs
CisJCSAgICAgdm9pZCAqYnVmLCBpbnQgbGVuLCBpbnQgd3JpdGUpOworCiAjZW5kaWYKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
