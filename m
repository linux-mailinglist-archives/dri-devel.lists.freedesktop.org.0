Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C063357D4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3778F895E2;
	Wed,  5 Jun 2019 07:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3EC893C0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 07:05:26 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id a3so4478065pgb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 00:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wirFf7Bfi/9XjwkqOXDgrZYsLDnJpPp9vEZbkrcNQgM=;
 b=A5mw98msGY8zM2iaonFdcYD4tmRyQQnyA+WHwB7siG46l2P8DeETUpZ6jyDahe0znF
 Z2kGQ1fb2iQx+l3I3Q73+YEeRxTSXt47u5cg4M2BRj5o848ITk44K2Im8RX53h4RR4Zn
 RK7lDhosTsWQZudUmafmjtz4zbV5kCEtNcvVaxVhTFT5izlF/Q73VkFwHBD2cVpSti6S
 P4Dv/hE/I/jgoEsi7q4o7GVMwQH0P/wMZO93HlZOQS3oPRQ3LxrXHYtg3Mnx9o8AysOE
 Pb+cwf6n3UdgbewezocwCt/ezv0fvgk3M94yiwx7KDWaR96faZ6u32tavSDQ8H7GQou1
 354g==
X-Gm-Message-State: APjAAAURTNMOT9XtCFv4hZXwB0h3DaOWYZtnf25EvuSlciGy02cM/Jkv
 XjL/JJXChnp9grF13l+AqodFSfB5pI8=
X-Google-Smtp-Source: APXvYqzdAjVBrJhFWY+RrjKSWzaYuKCZNU94Ec07F/vvaqCHIvzCwttviG6CztET7NH7lSx/v9qRCQ==
X-Received: by 2002:a63:f44b:: with SMTP id p11mr2435554pgk.225.1559718326197; 
 Wed, 05 Jun 2019 00:05:26 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d132sm6527348pfd.61.2019.06.05.00.05.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 00:05:25 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 03/15] drm/bridge: tc358767: Simplify polling in
 tc_link_training()
Date: Wed,  5 Jun 2019 00:04:55 -0700
Message-Id: <20190605070507.11417-4-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605070507.11417-1-andrew.smirnov@gmail.com>
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wirFf7Bfi/9XjwkqOXDgrZYsLDnJpPp9vEZbkrcNQgM=;
 b=NIHBvw4DzFLmSh+4MdmMCikQr0aNv7Gkhi7yCDFo0EYZH942t+X3CFLkzVladA3Swb
 71Q8gWyOMwE3jAO5/hyjtYSrn6iR2qWSCXbJtWy8uax9XJLaSngzuIwi/YXsgG1aH7Pd
 haLYlVRzocFh+mB2qOhYiuw+xQbShOfzrN0O3xFV5DUjzqgDHw8/JboORuS6I74vjeSl
 uLZk7SSwhbspqq1qCdzWVDAQKZs50ov7P8cjBVcmiFW3RYf/0KbI22pVj/by6wPkG/uH
 2fzmlJcvJgU/DYfXDRkFPnc7s4QNVxJkxftGNP7WK+d73ctFN6/TW3yDjP+ZZCTyBtxn
 pu1Q==
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

UmVwbGFjZSBleHBsaWNpdCBwb2xsaW5nIGluIHRjX2xpbmtfdHJhaW5pbmcoKSB3aXRoIGVxdWl2
YWxlbnQgY2FsbCB0bwp0Y19wb2xsX3RpbWVvdXQoKSBmb3Igc2ltcGxpY2l0eS4gTm8gZnVuY3Rp
b25hbCBjaGFuZ2UgaW50ZW5kZWQgKG5vdAppbmNsdWRpbmcgc2xpZ2h0bHkgYWx0ZXJlZCBkZWJ1
ZyBvdXRwdXQpLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92
QGdtYWlsLmNvbT4KQ2M6IEFyY2hpdCBUYW5lamEgPGFyY2hpdHRAY29kZWF1cm9yYS5vcmc+CkNj
OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzogTGF1cmVudCBQaW5jaGFy
dCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogVG9taSBWYWxrZWluZW4g
PHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtv
dkBjb2dlbnRlbWJlZGRlZC5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJv
bml4LmRlPgpDYzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6IENocmlzIEhl
YWx5IDxjcGhlYWx5QGdtYWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJv
bml4LmRlPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3Njcu
YyB8IDE1ICsrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
OSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggNWUxZTczYTkx
Njk2Li4xMTVjZmZjNTVhOTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMz
NTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKQEAgLTc0OCwy
MiArNzQ4LDE5IEBAIHN0YXRpYyBpbnQgdGNfc2V0X3ZpZGVvX21vZGUoc3RydWN0IHRjX2RhdGEg
KnRjLAogCiBzdGF0aWMgaW50IHRjX3dhaXRfbGlua190cmFpbmluZyhzdHJ1Y3QgdGNfZGF0YSAq
dGMpCiB7Ci0JdTMyIHRpbWVvdXQgPSAxMDAwOwogCXUzMiB2YWx1ZTsKIAlpbnQgcmV0OwogCi0J
ZG8gewotCQl1ZGVsYXkoMSk7Ci0JCXRjX3JlYWQoRFAwX0xUU1RBVCwgJnZhbHVlKTsKLQl9IHdo
aWxlICgoISh2YWx1ZSAmIExUX0xPT1BET05FKSkgJiYgKC0tdGltZW91dCkpOwotCi0JaWYgKHRp
bWVvdXQgPT0gMCkgeworCXJldCA9IHRjX3BvbGxfdGltZW91dCh0YywgRFAwX0xUU1RBVCwgTFRf
TE9PUERPTkUsCisJCQkgICAgICBMVF9MT09QRE9ORSwgMSwgMTAwMCk7CisJaWYgKHJldCkgewog
CQlkZXZfZXJyKHRjLT5kZXYsICJMaW5rIHRyYWluaW5nIHRpbWVvdXQgd2FpdGluZyBmb3IgTFRf
TE9PUERPTkUhXG4iKTsKLQkJcmV0dXJuIC1FVElNRURPVVQ7CisJCXJldHVybiByZXQ7CiAJfQog
Ci0JcmV0dXJuICh2YWx1ZSA+PiA4KSAmIDB4NzsKKwl0Y19yZWFkKERQMF9MVFNUQVQsICZ2YWx1
ZSk7CiAKKwlyZXR1cm4gKHZhbHVlID4+IDgpICYgMHg3OwogZXJyOgogCXJldHVybiByZXQ7CiB9
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
