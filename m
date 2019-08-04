Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 790BE81352
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4555D89F6B;
	Mon,  5 Aug 2019 07:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C8A89E15
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 20:37:56 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f17so71071262wme.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 13:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=614oQfNECnBl76zZMuP6DD7lsJ4uFIehr7gg2GuUSuc=;
 b=AS5xn4YSp9UrKN+Ij3YZ8vkrQaQX0WbE1hZdE2JjpxJEjx2fmNIdXl+u3FFkJY8bBs
 S4DgowpmukcFKBKByDgVZrhIaRnVfR17Klh0XDr9kNnAE60ej3y4QZFZ2lnm6bj7nioE
 NE02/KwOTdgc2RiH56WSfilTvAPNwSjUWudzSdqUbFbXoGb76u6yHxH/xqa8sSJVw86y
 /A9VCQ7GIcrMwY9I/Igz/q0PZpcWcN6LQJFCDPxtqvwZbdOBb0cj80UsbV5XQfuQ/lmL
 Idql3vLfCZJI2bZv5u4mvriryft3sXVS/VY9uQ06zr3NK4qUI5UUBC7/EBhr1PTYAXSH
 MH3w==
X-Gm-Message-State: APjAAAX9oxo5fssYDxc4e79s6Wk5s9rIPu3RU3p1NMB69Du8MblbDGwX
 PLg496DVCd3hpaF1m9Co6d8=
X-Google-Smtp-Source: APXvYqxWQqaUp9OfLwLuDJf120aVTFuhjtTQ9WayyTg2GRXAT9S11eHNFLdnTlvX3jYer7/a2+NswA==
X-Received: by 2002:a05:600c:2146:: with SMTP id
 v6mr14194434wml.59.1564951074997; 
 Sun, 04 Aug 2019 13:37:54 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-220-99.pppoe.mtu-net.ru.
 [91.78.220.99])
 by smtp.gmail.com with ESMTPSA id v16sm75542601wrn.28.2019.08.04.13.37.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Aug 2019 13:37:54 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1] drm/tegra: dc: Turn off and reset hardware across
 suspend-resume
Date: Sun,  4 Aug 2019 23:37:02 +0300
Message-Id: <20190804203702.16073-1-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=614oQfNECnBl76zZMuP6DD7lsJ4uFIehr7gg2GuUSuc=;
 b=udRZwvBy56EHj8w5FiQd5HmvHtoeIayI3x/yvR6sDJ+Ewn7z6yi6mu6NWlwcZAmS8D
 WtiBRgG2YRRcKwLv9ELIX1/WwhbIuGA3JDAmeEeDqydM0Qigb41mROG+XqaZs6JgDKeG
 aZiHbcZzbbtS3Wdmk4sivf6kI0cuBaeOc/0YiFZYn2QEy71YOfDiE0YTlvXUHcoKXwga
 yqY9MZsRA5iUHQvgvqyw31kKMRL5MRmOT8Ub3f3s79jEmAj0QJagrIvlYSpnyA6irJRo
 tY+ILDpiR09VHgcAF5dmquq+hnRhMYccvKffAcSmQB+ZW+z04xOzeor4jZU8bKwMAdFP
 vauw==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlcnMgY29yZSBidW1wcyBydW50aW1lIFBNIHJlZmNvdW50IGR1cmluZyBvZiBlbnRl
cmluZyBpbnRvCnN1c3BlbmQgdG8gd29ya2Fyb3VuZCBzb21lIHByb2JsZW0gd2hlcmUgcGFyZW50
IGRldmljZSBtYXkgYmVjb21lIHR1cm5lZApvZmYgYmVmb3JlIGl0cyBjaGlsZHJlbi4gRm9yIG5v
dyBDUlRDcyBhcmUgb25seSBnZXR0aW5nIGRpc2FibGVkIG9uCnN1c3BlbmQgYW5kIGluIG9yZGVy
IHRvIGFjdHVhbGx5IHN1c3BlbmQgdGhlIGRpc3BsYXkgY29udHJvbGxlcnMgaGFyZHdhcmUsCnRo
ZSBydW50aW1lIFBNIG5lZWRlZCB0byBiZSAiZm9yY2VkIiBpbnRvIHN1c3BlbmQgbW9kZS4KClNp
Z25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vdGVncmEvZGMuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYyBiL2RyaXZlcnMv
Z3B1L2RybS90ZWdyYS9kYy5jCmluZGV4IDRhNzVkMTQ5ZTM2OC4uNmM4ZjUyMjJkNTU4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvZGMuYwpAQCAtMjU3Miw2ICsyNTcyLDggQEAgc3RhdGljIGludCB0ZWdyYV9kY19yZXN1
bWUoc3RydWN0IGRldmljZSAqZGV2KQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMg
dGVncmFfZGNfcG1fb3BzID0gewogCVNFVF9SVU5USU1FX1BNX09QUyh0ZWdyYV9kY19zdXNwZW5k
LCB0ZWdyYV9kY19yZXN1bWUsIE5VTEwpCisJU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMocG1fcnVu
dGltZV9mb3JjZV9zdXNwZW5kLAorCQkJCXBtX3J1bnRpbWVfZm9yY2VfcmVzdW1lKQogfTsKIAog
c3RydWN0IHBsYXRmb3JtX2RyaXZlciB0ZWdyYV9kY19kcml2ZXIgPSB7Ci0tIAoyLjIyLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
