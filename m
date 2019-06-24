Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8412851C62
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 22:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A4C89DD2;
	Mon, 24 Jun 2019 20:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151C489DB9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 20:31:25 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id m30so8154772pff.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 13:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lSYYVqhHYII5ViyDtFOkp4I/i31+agPnClo/p5CN7rU=;
 b=o0sv4paPaWKWkxnfuMaGRSzzQzCBcb8x4IFaoDX+I1HnIGbuiVA/yhsykLUn0ZamlL
 s9KaCrs1U7jRlW4fGjxAcFwTbGzBDfgFYrvGUhD/Uc4kTWuE5y9hzcN2JVAbFX+u6OuO
 VArvZIpxrhm8/kYuBhT3ZuiCutTshi+FwWtG4gU73wFduIQD0jvjG3gDrPDj4OCj6Dr4
 V3KS8SR9Mq5+WzkzONpwZk+AK11ZK2atQCBmXTj1z7uTS/xRasGdtUwAf0hPXEtkgO6p
 K8g4n1Dyyq8PL+4CqjWZhAYd4V/n6Fr+P8w8fyyyvUxv+xThIWt6ddtP/claVCxpVAsC
 kAlQ==
X-Gm-Message-State: APjAAAVA39yqfA38VpJ5fvUhTTidEOZ5tnn9Lpq0NAV8YSrNcVdbDinT
 6IFDgZhxohCvfbM+ZjRtx8cYuA==
X-Google-Smtp-Source: APXvYqzbWxM5xrdZvQVssIkJ108K28bRsNta+aYXMp4VczMFyBnMpEFk0/3OUZMH3nt4zl2HLpoBMQ==
X-Received: by 2002:a65:62ca:: with SMTP id m10mr34696355pgv.57.1561408284531; 
 Mon, 24 Jun 2019 13:31:24 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id e10sm9833411pfi.153.2019.06.24.13.31.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 13:31:24 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 3/4] backlight: pwm_bl: Set scale type for CIE 1931 curves
Date: Mon, 24 Jun 2019 13:31:12 -0700
Message-Id: <20190624203114.93277-4-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190624203114.93277-1-mka@chromium.org>
References: <20190624203114.93277-1-mka@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lSYYVqhHYII5ViyDtFOkp4I/i31+agPnClo/p5CN7rU=;
 b=Mg4fv0I1KvsvYo7P+k+I0/jzY0DpnxpM73UwzZA397nYxCv69Pmx51bd0IZKJQS/T0
 e/T2av1TRlRVmfz56FF9Jew1DTrqN5iqbEIH15c5yTcYw4xPo9wLhvaIaKD96sdi5ihi
 w7DU16/nElyk+XneNHQnooeQwSyLleBKKFhyY=
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
aG0gc2V0CnRoZSBicmlnaHRuZXNzIHNjYWxlIHR5cGUgcHJvcGVydHkgYWNjb3JkaW5nbHkuIFRo
aXMgbWFrZXMgdGhlCnNjYWxlIHR5cGUgYXZhaWxhYmxlIHRvIHVzZXJzcGFjZSB2aWEgdGhlICdz
Y2FsZScgc3lzZnMgYXR0cmlidXRlLgoKU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2Ug
PG1rYUBjaHJvbWl1bS5vcmc+ClRlc3RlZC1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5y
aWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFu
aWVsLnRob21wc29uQGxpbmFyby5vcmc+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIGFkZGVkIEVucmlj
J3MgJ1Rlc3RlZC1ieScgdGFnCi0gYWRkZWQgRGFuaWVsJ3MgJ0Fja2VkLWJ5JyB0YWcKLS0tCiBk
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9wd21fYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5j
CmluZGV4IGZiNDVmODY2YjkyMy4uZjA2N2ZlN2FhMzVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9wd21fYmwuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21f
YmwuYwpAQCAtNTUzLDYgKzU1Myw4IEBAIHN0YXRpYyBpbnQgcHdtX2JhY2tsaWdodF9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlnb3RvIGVycl9hbGxvYzsKIAl9CiAKKwlt
ZW1zZXQoJnByb3BzLCAwLCBzaXplb2Yoc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVzKSk7CisK
IAlpZiAoZGF0YS0+bGV2ZWxzKSB7CiAJCS8qCiAJCSAqIEZvciB0aGUgRFQgY2FzZSwgb25seSB3
aGVuIGJyaWdodG5lc3MgbGV2ZWxzIGlzIGRlZmluZWQKQEAgLTU5MSw2ICs1OTMsOCBAQCBzdGF0
aWMgaW50IHB3bV9iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IAogCQkJcGItPmxldmVscyA9IGRhdGEtPmxldmVsczsKIAkJfQorCisJCXByb3BzLnNjYWxlID0g
QkFDS0xJR0hUX1NDQUxFX0NJRTE5MzE7CiAJfSBlbHNlIHsKIAkJLyoKIAkJICogVGhhdCBvbmx5
IGhhcHBlbnMgZm9yIHRoZSBub24tRFQgY2FzZSwgd2hlcmUgcGxhdGZvcm0gZGF0YQpAQCAtNjAx
LDcgKzYwNSw2IEBAIHN0YXRpYyBpbnQgcHdtX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCiAJcGItPmx0aF9icmlnaHRuZXNzID0gZGF0YS0+bHRoX2JyaWdo
dG5lc3MgKiAoc3RhdGUucGVyaW9kIC8gcGItPnNjYWxlKTsKIAotCW1lbXNldCgmcHJvcHMsIDAs
IHNpemVvZihzdHJ1Y3QgYmFja2xpZ2h0X3Byb3BlcnRpZXMpKTsKIAlwcm9wcy50eXBlID0gQkFD
S0xJR0hUX1JBVzsKIAlwcm9wcy5tYXhfYnJpZ2h0bmVzcyA9IGRhdGEtPm1heF9icmlnaHRuZXNz
OwogCWJsID0gYmFja2xpZ2h0X2RldmljZV9yZWdpc3RlcihkZXZfbmFtZSgmcGRldi0+ZGV2KSwg
JnBkZXYtPmRldiwgcGIsCi0tIAoyLjIyLjAuNDEwLmdkOGZkYmUyMWI1LWdvb2cKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
