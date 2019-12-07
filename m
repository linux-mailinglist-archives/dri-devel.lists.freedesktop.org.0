Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B3A115CCA
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9940B6E1B8;
	Sat,  7 Dec 2019 14:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9176E1AA
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:51 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id s22so10701756ljs.7
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tMLaH1DcHQ+vslghT8+TRlkI4S2XQo8E4UTpDmragvw=;
 b=tM2O2jFkT5GTZD6StgUNuVNIJvjcj3jZKE9hAPWQp0cAdAd8s9AjVHRLUyo3GL1SmY
 SHAOF/ENtdtO7nUlc0c+5CMHve4sGB/9JncKNsou51XW7h47rgrGpghviwDHxarqgTc6
 4A0boK662OOigBZxnOBWpDOSr7wqfDdPlk1FWIUZrFtVdUyL0LXvlLgRCmfESOOFYG44
 /khxhR+wEz68ROYy5A5iforbEqYZnSazjGb9kKsojHtiXn9F35Aaw3rFlAdqKp3Wqc++
 qMUJ8DUBbfC+lcK3VoJ2O7y+Pbx6ZJh43XaIDXKWOe+ltc+T465WgQMiAtpTwbA/FXdc
 E7JA==
X-Gm-Message-State: APjAAAV27o3dRmlCTIg2SaPx+aY23o4Ys55wP1ovRBaUnam3zEABLtpT
 D0DXiajB6tvp526me39hKtKzScOc5seiNA==
X-Google-Smtp-Source: APXvYqy+3wJ62tFG4eYTppjZHiTHnpCgFKPf2bYaW1HgVGCJ9bYH7aEQPcT0zxepBy1VmMfRB5FgmQ==
X-Received: by 2002:a05:651c:153:: with SMTP id
 c19mr11950509ljd.237.1575727489236; 
 Sat, 07 Dec 2019 06:04:49 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:48 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 22/25] drm/panel: sitronix-st7701: use drm_panel backlight
 support
Date: Sat,  7 Dec 2019 15:03:50 +0100
Message-Id: <20191207140353.23967-23-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tMLaH1DcHQ+vslghT8+TRlkI4S2XQo8E4UTpDmragvw=;
 b=D5+RmOPm/+yiH3s+zhgEQGpCAmW0YXmO48/99b7aaUbSUOvDCUGN6xw3aJGZok+YIl
 iOJ+GDzDZKJQC457IWNLRwXQHFFwdVfDRnUxN+Q7eaI6POWbKXfSJ8cw7sb4/mHRBbpi
 ynYuv49Pik/w7Xr+hnv7Fi0/jsE3DCzwGrHOx8y12KhtuP7nx4tbQpEOjP15CtyBnrUX
 XF9CEacwHFVlssgCdD8nufa44SMQTmfwEHhskW5VZv72NI/qHuVzIXGwQbkNs2JJwkcG
 qRlj1jvP7/PKAwsYvBF1P1bdl67vM/vuuvfH12DLL0tbY5NLpnHWbygQMkLMGPC8O8NJ
 sHbg==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBiYWNrbGlnaHQgc3VwcG9ydCBpbiBkcm1fcGFuZWwgdG8gc2ltcGxpZnkgdGhlIGRy
aXZlcgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgpDYzogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+CkNjOiBUaGll
cnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaXRyb25p
eC1zdDc3MDEuYyB8IDEyICsrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc2l0cm9uaXgtc3Q3NzAxLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0
cm9uaXgtc3Q3NzAxLmMKaW5kZXggYzA4YTg2NWEyYTkzLi40YjRmMjU1OGUzYjQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaXRyb25peC1zdDc3MDEuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3NzAxLmMKQEAgLTksNyArOSw2
IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9wYW5lbC5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQu
aD4KIAotI2luY2x1ZGUgPGxpbnV4L2JhY2tsaWdodC5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8v
Y29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L21v
ZHVsZS5oPgpAQCAtMTAzLDcgKzEwMiw2IEBAIHN0cnVjdCBzdDc3MDEgewogCXN0cnVjdCBtaXBp
X2RzaV9kZXZpY2UgKmRzaTsKIAljb25zdCBzdHJ1Y3Qgc3Q3NzAxX3BhbmVsX2Rlc2MgKmRlc2M7
CiAKLQlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmFja2xpZ2h0OwogCXN0cnVjdCByZWd1bGF0
b3JfYnVsa19kYXRhICpzdXBwbGllczsKIAlzdHJ1Y3QgZ3Bpb19kZXNjICpyZXNldDsKIAl1bnNp
Z25lZCBpbnQgc2xlZXBfZGVsYXk7CkBAIC0yMjMsNyArMjIxLDYgQEAgc3RhdGljIGludCBzdDc3
MDFfZW5hYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCXN0cnVjdCBzdDc3MDEgKnN0Nzcw
MSA9IHBhbmVsX3RvX3N0NzcwMShwYW5lbCk7CiAKIAlTVDc3MDFfRFNJKHN0NzcwMSwgTUlQSV9E
Q1NfU0VUX0RJU1BMQVlfT04sIDB4MDApOwotCWJhY2tsaWdodF9lbmFibGUoc3Q3NzAxLT5iYWNr
bGlnaHQpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC0yMzIsNyArMjI5LDYgQEAgc3RhdGljIGludCBz
dDc3MDFfZGlzYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIHsKIAlzdHJ1Y3Qgc3Q3NzAx
ICpzdDc3MDEgPSBwYW5lbF90b19zdDc3MDEocGFuZWwpOwogCi0JYmFja2xpZ2h0X2Rpc2FibGUo
c3Q3NzAxLT5iYWNrbGlnaHQpOwogCVNUNzcwMV9EU0koc3Q3NzAxLCBNSVBJX0RDU19TRVRfRElT
UExBWV9PRkYsIDB4MDApOwogCiAJcmV0dXJuIDA7CkBAIC0zNjYsMTAgKzM2Miw2IEBAIHN0YXRp
YyBpbnQgc3Q3NzAxX2RzaV9wcm9iZShzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kpCiAJCXJl
dHVybiBQVFJfRVJSKHN0NzcwMS0+cmVzZXQpOwogCX0KIAotCXN0NzcwMS0+YmFja2xpZ2h0ID0g
ZGV2bV9vZl9maW5kX2JhY2tsaWdodCgmZHNpLT5kZXYpOwotCWlmIChJU19FUlIoc3Q3NzAxLT5i
YWNrbGlnaHQpKQotCQlyZXR1cm4gUFRSX0VSUihzdDc3MDEtPmJhY2tsaWdodCk7Ci0KIAlkcm1f
cGFuZWxfaW5pdCgmc3Q3NzAxLT5wYW5lbCwgJmRzaS0+ZGV2LCAmc3Q3NzAxX2Z1bmNzLAogCQkg
ICAgICAgRFJNX01PREVfQ09OTkVDVE9SX0RTSSk7CiAKQEAgLTM4NCw2ICszNzYsMTAgQEAgc3Rh
dGljIGludCBzdDc3MDFfZHNpX3Byb2JlKHN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSkKIAkg
Ki8KIAlzdDc3MDEtPnNsZWVwX2RlbGF5ID0gMTIwICsgZGVzYy0+cGFuZWxfc2xlZXBfZGVsYXk7
CiAKKwlyZXQgPSBkcm1fcGFuZWxfb2ZfYmFja2xpZ2h0KCZzdDc3MDEtPnBhbmVsKTsKKwlpZiAo
cmV0KQorCQlyZXR1cm4gcmV0OworCiAJcmV0ID0gZHJtX3BhbmVsX2FkZCgmc3Q3NzAxLT5wYW5l
bCk7CiAJaWYgKHJldCA8IDApCiAJCXJldHVybiByZXQ7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
