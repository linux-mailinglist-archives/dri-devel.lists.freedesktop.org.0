Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D275E5B130
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B04989D02;
	Sun, 30 Jun 2019 18:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E003E6E8C0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:03:04 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g135so8491961wme.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 03:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tkIKqohD1pWyDDJZwRAR+FLcGS0BmuKJrepunlcK85k=;
 b=SL8EuResNgz8DNu0CBxnAOURsgYzRX1P1PDHsTFdc629Fs4pF8QU9Bm6QsnHOeIBNY
 hKDv8ZNwobzyu7LlTwxLD+mMJ8H3lKQVjaqxXkPpK3ek9qkq+VgWC27qpXvjGyO2GW5R
 oOgmIqp34zmk6mxEkWjcjxQ+RJlCcoHrRLMI5+3C1aGnMWkCWSNYrRGxP0b3RNc/pCWF
 GL6BCHf7GPtdzWkFGscCH8RXMVYK/2kuj+x4cb/Uwb+UOr44RJCos05TgbLInFXR8ZQ1
 84cgSKjaj8YVZnQbMNftyPjWAV3db8ra4drxHatRXjNgQQfUKH7UpD/J/7oq3/yw579V
 bsgA==
X-Gm-Message-State: APjAAAVb8GUPEEgdsMuDY575AWkhDWNBgQ94XBmUxgcV4lA9i1uRE530
 7qW+RbTmUTMatbjN13Mz56RxkA==
X-Google-Smtp-Source: APXvYqwhcFL6tQPvDpqRgEZ6o9MP/TYJoYCPuvCjDURwYT5TSOIYtMdW/bnH9RbLDIM8UWBC5Gscrg==
X-Received: by 2002:a1c:a848:: with SMTP id r69mr6526253wme.12.1561716183015; 
 Fri, 28 Jun 2019 03:03:03 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id l124sm1628874wmf.36.2019.06.28.03.03.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 03:03:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH RFT 0/4] backlight: gpio: simplify the driver
Date: Fri, 28 Jun 2019 12:02:49 +0200
Message-Id: <20190628100253.8385-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tkIKqohD1pWyDDJZwRAR+FLcGS0BmuKJrepunlcK85k=;
 b=wqzma/SfPs0SNGTJrk5pSZ/CDzjE4TIsL1pUirIMru6Dd+k6VggDOtK8vTsC1hGLBl
 LkxecZDEuCSeCquLFAOPUsgoDKzm5faSmD1FnVCT7mAIophBAoibWoibsUUid8aXk7z1
 ReoaPn8iXq3u3x4tzSeci7yYCYibuOp7i9fH0JjNnW3tsNULnII/S3nTg5NJTPxm6n+L
 XQCn7bneeug8DsDsEwH6nFbR7aM+12R56vcL/hhU8Afv3LItBO/gwcnghPvcETXmMDOX
 reWrBAZ8fCMca+WmYEPAZ1tOiCj8kYRTNDsyKdttCYERhyT/eh212yuCPYf61oXc6OCd
 SFIg==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCldo
aWxlIHdvcmtpbmcgb24gbXkgb3RoZXIgc2VyaWVzIHJlbGF0ZWQgdG8gZ3Bpby1iYWNrbGlnaHRb
MV0gSSBub3RpY2VkCnRoYXQgd2UgY291bGQgc2ltcGxpZnkgdGhlIGRyaXZlciBpZiB3ZSBtYWRl
IHRoZSBvbmx5IHVzZXIgb2YgcGxhdGZvcm0KZGF0YSB1c2UgR1BJTyBsb29rdXBzIGFuZCBkZXZp
Y2UgcHJvcGVydGllcy4gVGhpcyBzZXJpZXMgdHJpZXMgdG8gZG8KdGhhdC4KClRoZSBmaXJzdCBw
YXRjaCBzZXRzIHVwIGFsbCB0aGUgcmVxdWlyZWQgc3RydWN0dXJlcyBpbiB0aGUgYm9hcmQgZmls
ZSwKdGhlIHNlY29uZCBtb2RpZmllcyB0aGUgYmFja2xpZ2h0IGRyaXZlciwgdGhlIHRoaXJkIGFu
ZCBmb3VydGggcmVtb3ZlCnRoZSBsZWZ0b3ZlcnMuCgpUaGlzIHNlcmllcyBkZXBlbmRzIG9uIHRo
ZSB0aHJlZSBmaXJzdCBwYXRjaGVzIGZyb20gWzFdLgoKSSBkb24ndCBoYXZlIGFjY2VzcyB0byB0
aGlzIEhXIGJ1dCBob3BlZnVsbHkgdGhpcyB3b3Jrcy4gT25seSBjb21waWxlCnRlc3RlZC4KClsx
XSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS82LzI1LzkwMAoKQmFydG9zeiBHb2xhc3pld3Nr
aSAoNCk6CiAgc2g6IGVjb3ZlYzI0OiBhZGQgYWRkaXRpb25hbCBwcm9wZXJ0aWVzIHRvIHRoZSBi
YWNrbGlnaHQgZGV2aWNlCiAgYmFja2xpZ2h0OiBncGlvOiBzaW1wbGlmeSB0aGUgcGxhdGZvcm0g
ZGF0YSBoYW5kbGluZwogIHNoOiBlY292ZWMyNDogZG9uJ3Qgc2V0IHVudXNlZCBmaWVsZHMgaW4g
cGxhdGZvcm0gZGF0YQogIGJhY2tsaWdodDogZ3BpbzogcmVtb3ZlIHVudXNlZCBmaWVsZHMgZnJv
bSBwbGF0Zm9ybSBkYXRhCgogYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jICAg
ICAgICAgfCAzMyArKysrKysrKysrLS0tLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19i
YWNrbGlnaHQuYyAgICAgfCA0NiArKysrKystLS0tLS0tLS0tLS0tLQogaW5jbHVkZS9saW51eC9w
bGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0LmggfCAgMyAtLQogMyBmaWxlcyBjaGFuZ2VkLCAz
OCBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
