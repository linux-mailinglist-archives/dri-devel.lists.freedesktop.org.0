Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342CC558A9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2A36E217;
	Tue, 25 Jun 2019 20:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E676E217
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:22:49 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a14so28994246edv.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=IbaPTmVSK1Auuensg5mZK66IsBxApH2FblnD8ib5Dg0=;
 b=Mynx4VDB/+bNDpxMdbqnZ9skDLgg27qwyiHBgCIvEC00ojdWtGYm/dIxO5NNmDO7PC
 AuyhKnfPAQDYsmljH7BMukWedq82fOv6vI46WxXAwgf0I8A3EsPlI4BHrCKZ88V1rxa3
 oPTgu0VfSwUT20mxRIdsNDycyoj99gHemvxrm3zanYY8LCH4SuPruhhrr+xZGA7PTab3
 MIP4ga1AY2R+69dChBMb0ly6CqGKCP8/CZlsZqkqhU3zjGLvV8TjCmJ6EqOV+rExojqb
 AzpZRLUmJpoilmfrKv95WqT14IotcDCIry6FQQIxkZDfhP92fe1O5sOy03CiqqF/2jxp
 Qk0Q==
X-Gm-Message-State: APjAAAU+pQ/GBO9IjwsJ0DIcsEraTgUDgGKOUP37Zczsarkc+cy6b97q
 WJ1yL2VjJp70GR15AcUfHrLPrA==
X-Google-Smtp-Source: APXvYqzf4IQVb9h7Dov4iMeSGmus3NKT567mUeCO3NbEkQYOBEowGMzZ7rMIdDBuAYAw+tichO+cdg==
X-Received: by 2002:a17:906:b211:: with SMTP id
 p17mr410520ejz.11.1561494168042; 
 Tue, 25 Jun 2019 13:22:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id s5sm4839873edh.3.2019.06.25.13.22.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 13:22:47 -0700 (PDT)
Date: Tue, 25 Jun 2019 22:22:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Robert Beckett <bob.beckett@collabora.com>
Subject: Re: [PATCH v3 4/4] drm/imx: only send event on crtc disable if kept
 disabled
Message-ID: <20190625202244.GG12905@phenom.ffwll.local>
Mail-Followup-To: Robert Beckett <bob.beckett@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1561483965.git.bob.beckett@collabora.com>
 <6599f538740632c5524bab86514b8ba026798537.1561483965.git.bob.beckett@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6599f538740632c5524bab86514b8ba026798537.1561483965.git.bob.beckett@collabora.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=IbaPTmVSK1Auuensg5mZK66IsBxApH2FblnD8ib5Dg0=;
 b=DZxe9WXKrsmxaaroa2rbKK1EsEntZAaqVR/+UjyyI7hGgL3bekEganJsyf+fyFbk0X
 PktDQ/QOboGkcqQb2mlJEWZ60RRAFBy6DQixbZ+b8tm+c4oLCvC4oKBiMlUvm+ludtHT
 A88M05J210TfYPMN3036eGm3lcpipS7i2woEk=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, NXP Linux Team <linux-imx@nxp.com>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDY6NTk6MTVQTSArMDEwMCwgUm9iZXJ0IEJlY2tldHQg
d3JvdGU6Cj4gVGhlIGV2ZW50IHdpbGwgYmUgc2VudCBhcyBwYXJ0IG9mIHRoZSB2YmxhbmsgZW5h
YmxlIGR1cmluZyB0aGUgbW9kZXNldAo+IGlmIHRoZSBjcnRjIGlzIG5vdCBiZWluZyBrZXB0IGRp
c2FibGVkLgo+IAo+IEZpeGVzOiA1ZjJmOTExNTc4ZmIgKCJkcm0vaW14OiBhdG9taWMgcGhhc2Ug
MyBzdGVwIDE6IFVzZSBhdG9taWMgY29uZmlndXJhdGlvbiIpCj4gCj4gU2lnbmVkLW9mZi1ieTog
Um9iZXJ0IEJlY2tldHQgPGJvYi5iZWNrZXR0QGNvbGxhYm9yYS5jb20+CgpSZXZpZXdlZC1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2lteC9pcHV2My1jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYwo+IGlu
ZGV4IGUwNGQ2ZWZmZjFiNS4uYzQzNmEyOGQ1MGU0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pbXgvaXB1djMtY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1j
cnRjLmMKPiBAQCAtOTQsNyArOTQsNyBAQCBzdGF0aWMgdm9pZCBpcHVfY3J0Y19hdG9taWNfZGlz
YWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gIAlkcm1fY3J0Y192Ymxhbmtfb2ZmKGNydGMp
Owo+ICAKPiAgCXNwaW5fbG9ja19pcnEoJmNydGMtPmRldi0+ZXZlbnRfbG9jayk7Cj4gLQlpZiAo
Y3J0Yy0+c3RhdGUtPmV2ZW50KSB7Cj4gKwlpZiAoY3J0Yy0+c3RhdGUtPmV2ZW50ICYmICFjcnRj
LT5zdGF0ZS0+YWN0aXZlKSB7Cj4gIAkJZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoY3J0Yywg
Y3J0Yy0+c3RhdGUtPmV2ZW50KTsKPiAgCQljcnRjLT5zdGF0ZS0+ZXZlbnQgPSBOVUxMOwo+ICAJ
fQo+IC0tIAo+IDIuMTguMAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
