Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6827442E37
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 20:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5272789804;
	Wed, 12 Jun 2019 18:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E224C89804
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 18:00:11 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id e5so6938060pls.13
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 11:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m17jcxzIUWgBG3pTTkNAHaWLFrUkZn/F2jLeWBAwk/I=;
 b=h4ehlkGKSUDI1m01cZ7vJLLUJMdiLWuVlPPa4v7h4sbgkziHz4kueSdhZQ1qM1fp6+
 ayIBZBaISKTYRRGyG3pT8jJajeYKNj/pzaM8iG1f7lBNd/mdFfTOxwMiVuWW+8Kb6gBC
 UgY/Kldoybpsszr/AkZwRZNrx4nID200z8cbItkNGBURWiCDegO3anlg5Ma6NEDNSvXz
 AubFg17xeyJHXMQyUIdn3075MOPKaxg3YoEfP2Qf+UMT/pcqZkc5fJZL01jvcg91el1M
 oaEfGHLUu/W/o2CpnbMZpb7cseX4WYXCvwhWEVvHsNq1PSKcd1wNtjN2Cltqe/XF66fX
 9F2w==
X-Gm-Message-State: APjAAAUBQ3hl7D5jL58SLyHCDdmM5e29gc/kM1v8jQhq+dsIto+sTpqm
 oCIYlb3B0bb71bJQfknnfaNm/Q==
X-Google-Smtp-Source: APXvYqx+SYfjf3qHKIePuC+ovfW0Z/QkZdT+QlY9I+ubfQA4/smq+JtaGNSKh6quVM8FvVoa9qFIKw==
X-Received: by 2002:a17:902:2006:: with SMTP id
 n6mr25655685pla.232.1560362411522; 
 Wed, 12 Jun 2019 11:00:11 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id m6sm180932pgr.18.2019.06.12.11.00.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 11:00:10 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] backlight: pwm_bl: Fix heuristic to determine number of
 brightness levels
Date: Wed, 12 Jun 2019 11:00:03 -0700
Message-Id: <20190612180003.161966-1-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m17jcxzIUWgBG3pTTkNAHaWLFrUkZn/F2jLeWBAwk/I=;
 b=K9ECcdPpoHNdUO2vD2Dylfi36k+JOk+4YD8Cfgm4Bn3VTPQdmcyN78WXD7L3d/HO0s
 hBdUSzi4DPjwEJ/logkQnM3DpJ+UFfFYykyjVso6WnixS6vlIlfMi6BeZJkZPIjx/bHO
 Dd9kFBgl1ab6JdR3Fm+FtrF4Nn2Y8//52ybEM=
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

V2l0aCBjb21taXQgODhiYTk1YmVkYjc5ICgiYmFja2xpZ2h0OiBwd21fYmw6IENvbXB1dGUgYnJp
Z2h0bmVzcyBvZgpMRUQgbGluZWFybHkgdG8gaHVtYW4gZXllIikgdGhlIG51bWJlciBvZiBzZXQg
Yml0cyAoYWthIGh3ZWlnaHQoKSkKaW4gdGhlIFBXTSBwZXJpb2QgaXMgdXNlZCBpbiB0aGUgaGV1
cmlzdGljIHRvIGRldGVybWluZSB0aGUgbnVtYmVyCm9mIGJyaWdodG5lc3MgbGV2ZWxzLCB3aGVu
IHRoZSBicmlnaHRuZXNzIHRhYmxlIGlzbid0IHNwZWNpZmllZCBpbgp0aGUgRFQuIFRoZSBudW1i
ZXIgb2Ygc2V0IGJpdHMgZG9lc24ndCBwcm92aWRlIGEgcmVsaWFibGUgY2x1ZSBhYm91dAp0aGUg
bGVuZ3RoIG9mIHRoZSBwZXJpb2QsIGluc3RlYWQgY2hhbmdlIHRoZSBoZXVyaXN0aWMgdG86Cgog
bmxldmVscyA9IHBlcmlvZCAvIGZscyhwZXJpb2QpCgpBbHNvIGxpbWl0IHRoZSBtYXhpbXVtIG51
bWJlciBvZiBicmlnaHRuZXNzIGxldmVscyB0byA0MDk2IHRvIGF2b2lkCmV4Y2Vzc2l2ZWx5IGxh
cmdlIHRhYmxlcy4KCldpdGggdGhpcyB0aGUgbnVtYmVyIG9mIGxldmVscyBpbmNyZWFzZXMgbW9u
b3RvbmljYWxseSB3aXRoIHRoZSBQV00KcGVyaW9kLCB1bnRpbCB0aGUgbWF4aW11bSBvZiA0MDk2
IGxldmVscyBpcyByZWFjaGVkOgoKcGVyaW9kIChucykgICAgIyBsZXZlbHMKCjEwMCAgICAJICAg
ICAgIDE2CjUwMAkgICAgICAgNjIKMTAwMAkgICAgICAgMTExCjUwMDAJICAgICAgIDQxNgoxMDAw
MAkgICAgICAgNzY5CjUwMDAwCSAgICAgICAzMzMzCjEwMDAwMAkgICAgICAgNDA5NgoKRml4ZXM6
IDg4YmE5NWJlZGI3OSAoImJhY2tsaWdodDogcHdtX2JsOiBDb21wdXRlIGJyaWdodG5lc3Mgb2Yg
TEVEIGxpbmVhcmx5IHRvIGh1bWFuIGV5ZSIpClNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhs
Y2tlIDxta2FAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9i
bC5jIHwgMjQgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9wd21fYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCmluZGV4
IGZiNDVmODY2YjkyMy4uMGI3MTUyZmEyNGY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9wd21fYmwuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwpA
QCAtMTk0LDI5ICsxOTQsMTcgQEAgaW50IHB3bV9iYWNrbGlnaHRfYnJpZ2h0bmVzc19kZWZhdWx0
KHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJCQkgICAgIHN0cnVjdCBwbGF0Zm9ybV9wd21fYmFja2xp
Z2h0X2RhdGEgKmRhdGEsCiAJCQkJICAgICB1bnNpZ25lZCBpbnQgcGVyaW9kKQogewotCXVuc2ln
bmVkIGludCBjb3VudGVyID0gMDsKLQl1bnNpZ25lZCBpbnQgaSwgbjsKKwl1bnNpZ25lZCBpbnQg
aTsKIAl1NjQgcmV0dmFsOwogCiAJLyoKLQkgKiBDb3VudCB0aGUgbnVtYmVyIG9mIGJpdHMgbmVl
ZGVkIHRvIHJlcHJlc2VudCB0aGUgcGVyaW9kIG51bWJlci4gVGhlCi0JICogbnVtYmVyIG9mIGJp
dHMgaXMgdXNlZCB0byBjYWxjdWxhdGUgdGhlIG51bWJlciBvZiBsZXZlbHMgdXNlZCBmb3IgdGhl
Ci0JICogYnJpZ2h0bmVzcy1sZXZlbHMgdGFibGUsIHRoZSBwdXJwb3NlIG9mIHRoaXMgY2FsY3Vs
YXRpb24gaXMgaGF2ZSBhCi0JICogcHJlLWNvbXB1dGVkIHRhYmxlIHdpdGggZW5vdWdoIGxldmVs
cyB0byBnZXQgbGluZWFyIGJyaWdodG5lc3MKLQkgKiBwZXJjZXB0aW9uLiBUaGUgcGVyaW9kIGlz
IGRpdmlkZWQgYnkgdGhlIG51bWJlciBvZiBiaXRzIHNvIGZvciBhCi0JICogOC1iaXQgUFdNIHdl
IGhhdmUgMjU1IC8gOCA9IDMyIGJyaWdodG5lc3MgbGV2ZWxzIG9yIGZvciBhIDE2LWJpdCBQV00K
LQkgKiB3ZSBoYXZlIDY1NTM1IC8gMTYgPSA0MDk2IGJyaWdodG5lc3MgbGV2ZWxzLgotCSAqCi0J
ICogTm90ZSB0aGF0IHRoaXMgbWV0aG9kIGlzIGJhc2VkIG9uIGVtcGlyaWNhbCB0ZXN0aW5nIG9u
IGRpZmZlcmVudAotCSAqIGRldmljZXMgd2l0aCBQV00gb2YgOCBhbmQgMTYgYml0cyBvZiByZXNv
bHV0aW9uLgorCSAqIE9uY2Ugd2UgaGF2ZSA0MDk2IGxldmVscyB0aGVyZSdzIGxpdHRsZSBwb2lu
dCBnb2luZyBtdWNoIGhpZ2hlci4uLgorCSAqIG5laXRoZXIgaW50ZXJhY3RpdmUgc2xpZGVycyBu
b3IgYW5pbWF0aW9uIGJlbmVmaXRzIGZyb20gaGF2aW5nCisJICogbW9yZSB2YWx1ZXMgaW4gdGhl
IHRhYmxlLgogCSAqLwotCW4gPSBwZXJpb2Q7Ci0Jd2hpbGUgKG4pIHsKLQkJY291bnRlciArPSBu
ICUgMjsKLQkJbiA+Pj0gMTsKLQl9CisJZGF0YS0+bWF4X2JyaWdodG5lc3MgPQorCQltaW4oKGlu
dClESVZfUk9VTkRfVVAocGVyaW9kLCBmbHMocGVyaW9kKSksIDQwOTYpOwogCi0JZGF0YS0+bWF4
X2JyaWdodG5lc3MgPSBESVZfUk9VTkRfVVAocGVyaW9kLCBjb3VudGVyKTsKIAlkYXRhLT5sZXZl
bHMgPSBkZXZtX2tjYWxsb2MoZGV2LCBkYXRhLT5tYXhfYnJpZ2h0bmVzcywKIAkJCQkgICAgc2l6
ZW9mKCpkYXRhLT5sZXZlbHMpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWRhdGEtPmxldmVscykKLS0g
CjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMyLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
