Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2ED46C87
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 00:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DDA895B9;
	Fri, 14 Jun 2019 22:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A16F89590
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 22:47:56 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id i189so2229084pfg.10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 15:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0MclKa4ww/GU4h0ModhXTnU03GxDuW7aam4X/xA5H20=;
 b=iSo+UyCtg5VOAVmYFWDvJKzNs3qwGe8ZsF3VlPgCK0OBM8FTT4f8uBFJ/XJLrkLphp
 kdDi3DWOzHie6gxPWvcAE3b9IUZGIUXsMHUp6SVy29PiZgKIQBKPs6NLiY+8ejcyQX6H
 ADtSGho+a135qqdAirsRTmlMZYjwCxv9A9LuOhLxhgwxNOtD6vmoyXP12LhIVqYevPX5
 ZBx9ruFCLvxWOPt7+kKIYjpH0rs5Adbcjy2cXk8vAv1xd4IY+QFoGAnHFcwwltk0257/
 I+l3lQTM7PQf3UySaBBcDbJDN1aTE4FzrbUQG6LFh4yxM9xr+gsN8x789zdNgiPCoqTY
 /xJg==
X-Gm-Message-State: APjAAAUIcZdxvcDJ03iFYUrZ4mlAyKILfyeDWQbhvafIm/s1MQjD6haD
 HllAcqZrOzkiHgYa98Ln4K/wCw==
X-Google-Smtp-Source: APXvYqzZ+CMlOlPiOf2LQv6uMUwI93prqIodMDLjqSqBeZ5oaQMYW0ftolCisN3PIf4q8UD0Rzr7Vg==
X-Received: by 2002:a17:90a:25af:: with SMTP id
 k44mr13019616pje.122.1560552476071; 
 Fri, 14 Jun 2019 15:47:56 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id x7sm3706087pfm.82.2019.06.14.15.47.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 15:47:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de, seanpaul@chromium.org
Subject: [PATCH 2/2] drm/rockchip: Base adjustments of the mode based on prev
 adjustments
Date: Fri, 14 Jun 2019 15:47:30 -0700
Message-Id: <20190614224730.98622-2-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190614224730.98622-1-dianders@chromium.org>
References: <20190614224730.98622-1-dianders@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0MclKa4ww/GU4h0ModhXTnU03GxDuW7aam4X/xA5H20=;
 b=ZHrf0zetXblEGMrSWzFuV+TI9faYuEa+jhfVW9V/m0B9O+jKxO4+WjenDITlg+aFYZ
 rwkn7i/eEJwwpQKHMiEq0zlBvGsHMIF45Uf+FNPktBaKA1e7aETQITS6pxCwjG88fhY0
 xNrhAWXlbmUSTAcnqo9tAd0ptVAPAcMc7dGLQ=
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
Cc: David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 urjaman@gmail.com, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdm9wX2NydGNfbW9kZV9maXh1cCgpIHdlIGZpeHVwIHRoZSBtb2RlIHRvIHNob3cgd2hhdCB3
ZSBhY3R1YWxseQp3aWxsIGJlIGFibGUgdG8gYWNoaWV2ZS4gIEhvd2V2ZXIgd2Ugc2hvdWxkIGJh
c2Ugb3VyIGFkanVzdG1lbnRzIG9uCmFueSBwcmV2aW91cyBhZGp1c3RtZW50cyB0aGF0IHdlcmUg
bWFkZS4KCkFzIGFuIGV4YW1wbGUsIHRoZSBkd19oZG1pIGRyaXZlciBtYXkgd2lzaCB0byBtYWtl
IHNvbWUgc21hbGwKYWRqdXN0bWVudHMgdG8gY2xvY2sgcmF0ZXMgaW4gaXRzIGF0b21pY19jaGVj
aygpIGZ1bmN0aW9uLiAgSWYgaXQKZG9lcywgaXQgd2lsbCB1cGRhdGUgdGhlIGFkanVzdGVkX21v
ZGUuICBXZSBzaG91bGRuJ3QgdGhyb3cgYXdheSB0aG9zZQphZGp1c3RtZW50cy4KCk5PVEU6IHRo
ZSB2ZXJzaW9uIG9mIHRoZSBkd19oZG1pIGRyaXZlciB1cHN0cmVhbSBkb2Vzbid0IF9hY3R1YWxs
eV8KbWFrZSBzdWNoIGFkanVzdG1lbnRzLCBidXQgZG93bnN0cmVhbSBpbiBDaHJvbWUgT1MgaXQg
ZG9lcy4gIEl0IGlzCnBsYXVzaWJsZSB0aGF0IG9uZSBkYXkgd2UnbGwgZmlndXJlIG91dCBob3cg
dG8gY2xlYW5seSBtYWtlIHRoYXQKaGFwcGVuIGluIGFuIHVwc3RyZWFtLWZyaWVuZGx5IHdheSwg
c28gd2Ugc2hvdWxkIHByZXBhcmUgYnkgdXNpbmcgdGhlCnJpZ2h0IG1vZGUuCgpTaWduZWQtb2Zm
LWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Ci0tLQoKIGRyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKaW5kZXggZDEyNGYzNGFiOWZjLi4wOWE3OTBj
MmYzYTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1f
dm9wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYwpA
QCAtMTAwNiw4ICsxMDA2LDggQEAgc3RhdGljIGJvb2wgdm9wX2NydGNfbW9kZV9maXh1cChzdHJ1
Y3QgZHJtX2NydGMgKmNydGMsCiAJc3RydWN0IHZvcCAqdm9wID0gdG9fdm9wKGNydGMpOwogCiAJ
YWRqdXN0ZWRfbW9kZS0+Y2xvY2sgPQotCQlESVZfUk9VTkRfVVAoY2xrX3JvdW5kX3JhdGUodm9w
LT5kY2xrLCBtb2RlLT5jbG9jayAqIDEwMDApLAotCQkJICAgICAxMDAwKTsKKwkJRElWX1JPVU5E
X1VQKGNsa19yb3VuZF9yYXRlKHZvcC0+ZGNsaywKKwkJCQkJICAgIGFkanVzdGVkX21vZGUtPmNs
b2NrICogMTAwMCksIDEwMDApOwogCiAJcmV0dXJuIHRydWU7CiB9Ci0tIAoyLjIyLjAuNDEwLmdk
OGZkYmUyMWI1LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
