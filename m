Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA57763B8C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 21:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420606E055;
	Tue,  9 Jul 2019 19:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FC76E094
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 19:00:17 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id r1so9715163pfq.12
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 12:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kVvpaDbzpEWbBjYARfR8dh/gP0bxxZgHm+m/Jkyi7lE=;
 b=oe+oUgPX2su2WihURvLL8o8y2sanSQqqHSUB2v2lFL4LZTkx5uikYG9l5FcYcJc32+
 ojnJ5bUL5rYGkxcZPFRDDYdWGDvdvtjLCLSBIa3SeTe198GWreGgwxB3NIdWKdaWximM
 24/zgmgY0zgCf3nyMzb4P9rWPTJZPO5va4tLdpJRBMw94zYcWxezYWK79LQNMnr4mkXh
 T7jchB5r2GIfRrDIMhcot1+Kxbi3ip52UPKpRlhg877EIjc3egWK14CvIdYB5A1CmG58
 YhVfEXv1ypHXmdtRpgf7M3DdCtOconzrByJd1MHau4zLOrUG2TRbtRQS+uZwUyv7QL7r
 KPLg==
X-Gm-Message-State: APjAAAUFePpZnvVfLZw9Q86EMyDB9U6A5vpS+cnKSg1ZkyI1SKOgA9q5
 v8w1fKGEihE7Zz+O2JKWkgYFQQ==
X-Google-Smtp-Source: APXvYqwBv0ikAuzn0RvswN8IgnqKDvN7XJZoGxWHBvHVxIkxhLmxMvq0Xmq/5AXVyvtVcIKhjRshPQ==
X-Received: by 2002:a17:90a:c58e:: with SMTP id
 l14mr1789873pjt.104.1562698817408; 
 Tue, 09 Jul 2019 12:00:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id o14sm2998437pjp.19.2019.07.09.12.00.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 12:00:16 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v3 3/4] backlight: pwm_bl: Set scale type for CIE 1931 curves
Date: Tue,  9 Jul 2019 12:00:06 -0700
Message-Id: <20190709190007.91260-4-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190709190007.91260-1-mka@chromium.org>
References: <20190709190007.91260-1-mka@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kVvpaDbzpEWbBjYARfR8dh/gP0bxxZgHm+m/Jkyi7lE=;
 b=ml+EGHk2gBbO+Ix+y3IXBdYnqYmz2DJ80cGljmi3CgE65/Et2Vg5hVrN5terF5lHFL
 S8tCFSnVYVpvKoafo00DLzPqA9hwRTKA8NY6EdeYlR4aSVKABT4hmSAr0Q9X7SnlphZC
 jHDTSVqfquQ6omSj4rf4xOaEmRWxY5QFJmPZQ=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIGJhY2tsaWdodCBjdXJ2ZXMgY2FsY3VsYXRlZCB3aXRoIHRoZSBDSUUgMTkzMSBhbGdvcml0
aG0gc2V0CnRoZSBicmlnaHRuZXNzIHNjYWxlIHR5cGUgdG8gbm9uLWxpbmVhci4gVGhpcyBtYWtl
cyB0aGUgc2NhbGUgdHlwZQphdmFpbGFibGUgdG8gdXNlcnNwYWNlIHZpYSB0aGUgJ3NjYWxlJyBz
eXNmcyBhdHRyaWJ1dGUuCgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNo
cm9taXVtLm9yZz4KVGVzdGVkLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxs
ZXRib0Bjb2xsYWJvcmEuY29tPgpBY2tlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhv
bXBzb25AbGluYXJvLm9yZz4KLS0tCkNoYW5nZXMgaW4gdjM6Ci0gbWFyayBzY2FsZSBhcyBub24t
bGluZWFyIGluc3RlYWQgb2YgdXNpbmcgdGhlIENJRTE5MzEgdHlwZSB3aGljaAogIGhhcyBiZWVu
IHJlbW92ZWQKLSB1cGRhdGVkIGNvbW1pdCBtZXNzYWdlCgpDaGFuZ2VzIGluIHYyOgotIGFkZGVk
IEVucmljJ3MgJ1Rlc3RlZC1ieScgdGFnCi0gYWRkZWQgRGFuaWVsJ3MgJ0Fja2VkLWJ5JyB0YWcK
LS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyB8IDUgKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3
bV9ibC5jCmluZGV4IGZiNDVmODY2YjkyMy4uN2M2ZGZjNGE2MDFkIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9wd21fYmwuYwpAQCAtNTUzLDYgKzU1Myw4IEBAIHN0YXRpYyBpbnQgcHdtX2JhY2tsaWdodF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlnb3RvIGVycl9hbGxvYzsKIAl9
CiAKKwltZW1zZXQoJnByb3BzLCAwLCBzaXplb2Yoc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVz
KSk7CisKIAlpZiAoZGF0YS0+bGV2ZWxzKSB7CiAJCS8qCiAJCSAqIEZvciB0aGUgRFQgY2FzZSwg
b25seSB3aGVuIGJyaWdodG5lc3MgbGV2ZWxzIGlzIGRlZmluZWQKQEAgLTU5MSw2ICs1OTMsOCBA
QCBzdGF0aWMgaW50IHB3bV9iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAogCQkJcGItPmxldmVscyA9IGRhdGEtPmxldmVsczsKIAkJfQorCisJCXByb3BzLnNj
YWxlID0gQkFDS0xJR0hUX1NDQUxFX05PTl9MSU5FQVI7CiAJfSBlbHNlIHsKIAkJLyoKIAkJICog
VGhhdCBvbmx5IGhhcHBlbnMgZm9yIHRoZSBub24tRFQgY2FzZSwgd2hlcmUgcGxhdGZvcm0gZGF0
YQpAQCAtNjAxLDcgKzYwNSw2IEBAIHN0YXRpYyBpbnQgcHdtX2JhY2tsaWdodF9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJcGItPmx0aF9icmlnaHRuZXNzID0gZGF0YS0+
bHRoX2JyaWdodG5lc3MgKiAoc3RhdGUucGVyaW9kIC8gcGItPnNjYWxlKTsKIAotCW1lbXNldCgm
cHJvcHMsIDAsIHNpemVvZihzdHJ1Y3QgYmFja2xpZ2h0X3Byb3BlcnRpZXMpKTsKIAlwcm9wcy50
eXBlID0gQkFDS0xJR0hUX1JBVzsKIAlwcm9wcy5tYXhfYnJpZ2h0bmVzcyA9IGRhdGEtPm1heF9i
cmlnaHRuZXNzOwogCWJsID0gYmFja2xpZ2h0X2RldmljZV9yZWdpc3RlcihkZXZfbmFtZSgmcGRl
di0+ZGV2KSwgJnBkZXYtPmRldiwgcGIsCi0tIAoyLjIyLjAuNDEwLmdkOGZkYmUyMWI1LWdvb2cK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
