Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF399C6B1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D956E155;
	Mon, 26 Aug 2019 00:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8A96ED17
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 18:37:45 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id s145so9004456qke.7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 11:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=K6bpuQL+cink1ifj2JHG6nbNFjIxQlV3Y84jEqbo5vk=;
 b=saoJAr5uDttJR6+15Skgj73Jhd84blj/vY3iy+UpJRGaelPJQz9NrO2kcabaxKsdYU
 Mj0mbwMXIJRUjDqYZjkwCux2rST+TWQ9l1Vuvkz3oRzgcjDvVbb3MGnx+de3rA/hjKmI
 d5uoLg04+A0/WqZO4mFb0D7nUoeAkbyJgDpgoED6Sp7XOmwU8BoH4gX/EKNup1TS1R2v
 e2+xdzSnWqtEkF893hqlG3K9e6QR0VsjPozN5MKvZNR/2pmBawRx3cKJV8sYYa0pxEix
 kb9+GU7UUqmhzoJXgfjYfsNvXyZZpiUkCYV1hnupyLxJ+xrtHB4f4QiwJ/ta4x6KZyC3
 cmxA==
X-Gm-Message-State: APjAAAU9++SHoZVkfjfiKVi09VIN0uTPykPzpZ5twzQmJ6fNeGxxoyhm
 v+DLMeHOtpXpKFK8JW3SmZ4xAg==
X-Google-Smtp-Source: APXvYqz1XZyujdK0IAvMbZFvo+vEeUsWSNzj0vDry/nXK/m98CjK2Dr8Rm6LZJn4cNZVgaeOnHT1qQ==
X-Received: by 2002:a37:6146:: with SMTP id v67mr5406438qkb.493.1566585464569; 
 Fri, 23 Aug 2019 11:37:44 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id x69sm1834380qkb.4.2019.08.23.11.37.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 11:37:43 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: daniel@ffwll.ch
Subject: [PATCH] gpu/drm: fix a -Wstringop-truncation warning
Date: Fri, 23 Aug 2019 14:37:06 -0400
Message-Id: <1566585426-2952-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=K6bpuQL+cink1ifj2JHG6nbNFjIxQlV3Y84jEqbo5vk=;
 b=Evlsr1hDPf8Jv3i32l+rkNwnF8sbK1RXp7eJDrXIB0v22CQWyR4hjiujIN8EScs0XK
 aOue7YpJS7cr+GnCDLT3WQGWlbXO6bJ47iubX42e6CtXu1L+bFEpGmWzS7TGPbTokak+
 s1xqseqdQLw4Fx2v3FMdv45K65jzf3QcPwysGBxhN3kOy5HUnoDMI9590lgDx/oVfKN7
 et0xqEGrg9eNJMUVmP43aIgoISsB2vBPvdIZfVo83x+KGS1NqY5l6hboYmDDBKCgVskr
 sahbHb87yBHuDno0v/v/5E0vpqojYcgyYYCk25qJV85iB2tqSfV0urJIZaGsjDpcU7hT
 LcfA==
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
Cc: maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, Qian Cai <cai@lca.pw>,
 sean@poorly.run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVkZS9saW51eC9iaXRtYXAuaDo5LAogICAgICAg
ICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L2NwdW1hc2suaDoxMiwKICAgICAgICAgICAg
ICAgICBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vY3B1bWFzay5oOjUsCiAgICAgICAgICAg
ICAgICAgZnJvbSAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21zci5oOjExLAogICAgICAgICAgICAg
ICAgIGZyb20gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaDoyMSwKICAgICAgICAg
ICAgICAgICBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oOjUsCiAgICAg
ICAgICAgICAgICAgZnJvbSAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmg6NTMs
CiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvdGhyZWFkX2luZm8uaDozOCwK
ICAgICAgICAgICAgICAgICBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vcHJlZW1wdC5oOjcs
CiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvcHJlZW1wdC5oOjc4LAogICAg
ICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L3JjdXBkYXRlLmg6MjcsCiAgICAgICAg
ICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvcmN1bGlzdC5oOjExLAogICAgICAgICAgICAg
ICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L3BpZC5oOjUsCiAgICAgICAgICAgICAgICAgZnJvbSAu
L2luY2x1ZGUvbGludXgvc2NoZWQuaDoxNCwKICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVk
ZS9saW51eC91YWNjZXNzLmg6NSwKICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fcHJvcGVydHkuYzoyNDoKSW4gZnVuY3Rpb24gJ3N0cm5jcHknLAogICAgaW5saW5lZCBm
cm9tICdkcm1fcHJvcGVydHlfY3JlYXRlJyBhdApkcml2ZXJzL2dwdS9kcm0vZHJtX3Byb3BlcnR5
LmM6MTMwOjI6Ci4vaW5jbHVkZS9saW51eC9zdHJpbmcuaDozMDU6OTogd2FybmluZzogJ19fYnVp
bHRpbl9zdHJuY3B5JyBzcGVjaWZpZWQKYm91bmQgMzIgZXF1YWxzIGRlc3RpbmF0aW9uIHNpemUg
Wy1Xc3RyaW5nb3AtdHJ1bmNhdGlvbl0KICByZXR1cm4gX19idWlsdGluX3N0cm5jcHkocCwgcSwg
c2l6ZSk7CiAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgpGaXggaXQgYnkg
dXNpbmcgc3Ryc2NweSgpIHdoaWNoIHdpbGwgYWx3YXlzIHJldHVybiBhIHZhbGlkIHN0cmluZywg
YW5kCmRvZXNuJ3QgdW5uZWNlc3NhcmlseSBmb3JjZSB0aGUgdGFpbCBvZiB0aGUgZGVzdGluYXRp
b24gYnVmZmVyIHRvIGJlCnplcm9lZC4KClNpZ25lZC1vZmYtYnk6IFFpYW4gQ2FpIDxjYWlAbGNh
LnB3PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJvcGVydHkuYyB8IDMgKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9wcm9wZXJ0eS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcm9wZXJ0
eS5jCmluZGV4IDg5MmNlNjM2ZWY3Mi4uNjZlYzJjYzdhNTU5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX3Byb3BlcnR5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcm9wZXJ0
eS5jCkBAIC0xMjcsOCArMTI3LDcgQEAgc3RydWN0IGRybV9wcm9wZXJ0eSAqZHJtX3Byb3BlcnR5
X2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCXByb3BlcnR5LT5udW1fdmFsdWVzID0g
bnVtX3ZhbHVlczsKIAlJTklUX0xJU1RfSEVBRCgmcHJvcGVydHktPmVudW1fbGlzdCk7CiAKLQlz
dHJuY3B5KHByb3BlcnR5LT5uYW1lLCBuYW1lLCBEUk1fUFJPUF9OQU1FX0xFTik7Ci0JcHJvcGVy
dHktPm5hbWVbRFJNX1BST1BfTkFNRV9MRU4tMV0gPSAnXDAnOworCXN0cnNjcHkocHJvcGVydHkt
Pm5hbWUsIG5hbWUsIERSTV9QUk9QX05BTUVfTEVOKTsKIAogCWxpc3RfYWRkX3RhaWwoJnByb3Bl
cnR5LT5oZWFkLCAmZGV2LT5tb2RlX2NvbmZpZy5wcm9wZXJ0eV9saXN0KTsKIAotLSAKMS44LjMu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
