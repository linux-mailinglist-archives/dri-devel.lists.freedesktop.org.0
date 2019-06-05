Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42045357D6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EBD895E7;
	Wed,  5 Jun 2019 07:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCD0893C0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 07:05:25 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 83so5053863pgg.8
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 00:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6vB9H/x4K9GTr/5xe5x0phbXLq3ehoCrZ4GkVzDpnKQ=;
 b=rFJHESbYed9z+Lajn52VjvWDTzSA95YVMVeSexKmQIiaeppAVodaBDmQbH8FZsdS5d
 vTMgkFJzM7j5cLRHCqKonYb6S0O3TLo/ELHyTjOnQCdffARIQOlsAkkHOs759XYflAok
 vOPhXbhxM7XXtMEpiN1wSG0zm+vhS5NSqsVmlxsXf3emYww0b3r+cuoux/q5JkdoYG0k
 J3FUvBQZnIIpgBTFsDgsVCgA4ewMD8KByGpAiUH1qbfols3iF778mSuFexKgmGr/cfGX
 VNBrqGEjf3vWTd9akfWOzO7glMBi1CuDJ2Nc7NUCneF4AvqTEMCO2GWwxIuXSvFeC67H
 uGdg==
X-Gm-Message-State: APjAAAU7k9Mblj8e97mwcb0u9I4Hacz9iIeUpLqPQxRNnzT/5fExbtXh
 EHP8MPIX5FW76W7pnTY+exLsSWOsWuU=
X-Google-Smtp-Source: APXvYqxRSH/hRKkBpLnP6nbJfTNZ7bEjPBPE2gktY46JAm1wZv7l8pycaOuo9PUBCY/OkTDAXT13gA==
X-Received: by 2002:a63:374d:: with SMTP id g13mr2444294pgn.413.1559718324783; 
 Wed, 05 Jun 2019 00:05:24 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d132sm6527348pfd.61.2019.06.05.00.05.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 00:05:24 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/15] drm/bridge: tc358767: Simplify polling in
 tc_main_link_setup()
Date: Wed,  5 Jun 2019 00:04:54 -0700
Message-Id: <20190605070507.11417-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605070507.11417-1-andrew.smirnov@gmail.com>
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6vB9H/x4K9GTr/5xe5x0phbXLq3ehoCrZ4GkVzDpnKQ=;
 b=AjYe4rFedvHM4DhxC0na29BxekJqa4X9v32x4XZi2Q39H5ng8wiTdhUTtgpZMGJUwQ
 R+LjWw3FAPY62dWja57kC+lwLcypzOLy6GubqwgDHSW5hDGcpjylBcixDG8fqXMFZj0j
 QZcKtvqnYZ9zXk3px0Na91tpVv9fXcWAYGRFwEUOEHPm6ZDdl5JHe+6gFKnR4b71scmE
 fHMKeLuTyBiZxIgrzDTS5qdKzivqsZ4ax26lcSDWfzsP/YtTFafuUmpd57C4v9JtemUH
 Tack3nU6dFSTavg/alF8O3/9K4POc1b2vE8sj/b8CSWwNjVejwSQVnN4Pc85ZJrPp3Cb
 2oPg==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSBleHBsaWNpdCBwb2xsaW5nIGxvb3Agd2l0aCBlcXVpdmFsZW50IGNhbGwgdG8KdGNf
cG9sbF90aW1lb3V0KCkgZm9yIGJyZXZpdHkuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVk
LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWlsLmNv
bT4KQ2M6IEFyY2hpdCBUYW5lamEgPGFyY2hpdHRAY29kZWF1cm9yYS5vcmc+CkNjOiBBbmRyemVq
IEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFs
a2VpbmVuQHRpLmNvbT4KQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dlbnRl
bWJlZGRlZC5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpD
YzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6IENocmlzIEhlYWx5IDxjcGhl
YWx5QGdtYWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDE1ICsr
KysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCmluZGV4IGZiOGExOTQyZWM1NC4uNWUx
ZTczYTkxNjk2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCkBAIC03NzQsNyArNzc0LDYg
QEAgc3RhdGljIGludCB0Y19tYWluX2xpbmtfZW5hYmxlKHN0cnVjdCB0Y19kYXRhICp0YykKIAlz
dHJ1Y3QgZGV2aWNlICpkZXYgPSB0Yy0+ZGV2OwogCXVuc2lnbmVkIGludCByYXRlOwogCXUzMiBk
cF9waHlfY3RybDsKLQlpbnQgdGltZW91dDsKIAl1MzIgdmFsdWU7CiAJaW50IHJldDsKIAl1OCB0
bXBbOF07CkBAIC04MzEsMTUgKzgzMCwxMSBAQCBzdGF0aWMgaW50IHRjX21haW5fbGlua19lbmFi
bGUoc3RydWN0IHRjX2RhdGEgKnRjKQogCWRwX3BoeV9jdHJsICY9IH4oRFBfUEhZX1JTVCB8IFBI
WV9NMV9SU1QgfCBQSFlfTTBfUlNUKTsKIAl0Y193cml0ZShEUF9QSFlfQ1RSTCwgZHBfcGh5X2N0
cmwpOwogCi0JdGltZW91dCA9IDEwMDA7Ci0JZG8gewotCQl0Y19yZWFkKERQX1BIWV9DVFJMLCAm
dmFsdWUpOwotCQl1ZGVsYXkoMSk7Ci0JfSB3aGlsZSAoKCEodmFsdWUgJiBQSFlfUkRZKSkgJiYg
KC0tdGltZW91dCkpOwotCi0JaWYgKHRpbWVvdXQgPT0gMCkgewotCQlkZXZfZXJyKGRldiwgInRp
bWVvdXQgd2FpdGluZyBmb3IgcGh5IGJlY29tZSByZWFkeSIpOwotCQlyZXR1cm4gLUVUSU1FRE9V
VDsKKwlyZXQgPSB0Y19wb2xsX3RpbWVvdXQodGMsIERQX1BIWV9DVFJMLCBQSFlfUkRZLCBQSFlf
UkRZLCAxLCAxMDAwKTsKKwlpZiAocmV0KSB7CisJCWlmIChyZXQgPT0gLUVUSU1FRE9VVCkKKwkJ
CWRldl9lcnIoZGV2LCAidGltZW91dCB3YWl0aW5nIGZvciBwaHkgYmVjb21lIHJlYWR5Iik7CisJ
CXJldHVybiByZXQ7CiAJfQogCiAJLyogU2V0IG1pc2M6IDggYml0cyBwZXIgY29sb3IgKi8KLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
