Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A5555853
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D592F6E0A2;
	Tue, 25 Jun 2019 20:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528F66E0A2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:03:29 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k21so28993797edq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=KHs83YFBfNQZy/EqTIBWhIx/tAhxAnDwbcWzGiKotfU=;
 b=dk/ma4q8Sm5Y5a0WMWCagPP7risRyiwNQVcbhWkpGBOGBgrRk5l/DBH0U7Gpa+5Jkh
 wijtNcLsVZMDHZxLeKgyDSqbc8u8944N47ZxPxPylg2ZjRC5A0mycwsij54cYdgFzHJ1
 TKXoBSC3xiCHMRgM8x18NyVl6MND3yIB71C0ETxnVzWBvhatCbZkre1pwbRy1MeGK1nh
 H76Tih4Xeo7N3oAHpXnC4jqAbPVY1f98kkFxe05TREKih0WelLTIt181io6Qnse/kF/g
 RUTVmnBNcudbcc2Rp05aRO2V+3a08kCRDjFAOsBGLnkwW6e1FOdj2mH8p8oG4rOImOlR
 F0Yg==
X-Gm-Message-State: APjAAAXbTSmvRqel1DfKEy96VfGIeiqk3JRgyTCNoj8tOTmu0kyjDK8i
 bS/EZRt4cjBPI/KmWRsRHdWGbg==
X-Google-Smtp-Source: APXvYqzWmKDhdveaUADlwWBYeUgo7D5urxpoW3hfNOobLVUCSmkrF5iNrK07R4dKXM7pAl9426NJYQ==
X-Received: by 2002:a17:906:5c4a:: with SMTP id
 c10mr338323ejr.15.1561493007994; 
 Tue, 25 Jun 2019 13:03:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z22sm5063953edz.6.2019.06.25.13.03.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 13:03:27 -0700 (PDT)
Date: Tue, 25 Jun 2019 22:03:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Robert Beckett <bob.beckett@collabora.com>
Subject: Re: [PATCH v3 2/4] drm/imx: notify drm core before sending event
 during crtc disable
Message-ID: <20190625200324.GE12905@phenom.ffwll.local>
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
 <066eb916ec920e0515367548e4af2ee28f9d0a43.1561483965.git.bob.beckett@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <066eb916ec920e0515367548e4af2ee28f9d0a43.1561483965.git.bob.beckett@collabora.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=KHs83YFBfNQZy/EqTIBWhIx/tAhxAnDwbcWzGiKotfU=;
 b=Z2+2CN1JavLtWBr2T1//ZKUDoABAKJ5zKuNVyzePsNE9TasWyMzfPaevhIMmrD1UeR
 z3wJRNgVVcilRdlu2CiBDWSpt9mkj8kL0YPZVtYExVwxhnkjrlPzT7uJx62fHhu9DMsP
 /uTZQQ2TO6IaS17xbaMUGi+TXmRL+dEuxiPOI=
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDY6NTk6MTNQTSArMDEwMCwgUm9iZXJ0IEJlY2tldHQg
d3JvdGU6Cj4gTm90aWZ5IGRybSBjb3JlIGJlZm9yZSBzZW5kaW5nIHBlbmRpbmcgZXZlbnRzIGR1
cmluZyBjcnRjIGRpc2FibGUuCj4gVGhpcyBmaXhlcyB0aGUgZmlyc3QgZXZlbnQgYWZ0ZXIgZGlz
YWJsZSBoYXZpbmcgYW4gb2xkIHN0YWxlIHRpbWVzdGFtcAo+IGJ5IGhhdmluZyBkcm1fY3J0Y192
Ymxhbmtfb2ZmIHVwZGF0ZSB0aGUgdGltZXN0YW1wIHRvIG5vdy4KPiAKPiBUaGlzIHdhcyBzZWVu
IHdoaWxlIGRlYnVnZ2luZyB3ZXN0b24gbG9nIG1lc3NhZ2U6Cj4gV2FybmluZzogY29tcHV0ZWQg
cmVwYWludCBkZWxheSBpcyBpbnNhbmU6IC04MjEyIG1zZWMKPiAKPiBUaGlzIG9jY3VyZWQgZHVl
IHRvOgo+IDEuIGRyaXZlciBzdGFydHMgdXAKPiAyLiBmYmNvbiBjb21lcyBhbG9uZyBhbmQgcmVz
dG9yZXMgZmJkZXYsIGVuYWJsaW5nIHZibGFuawo+IDMuIHZibGFua19kaXNhYmxlX2ZuIGZpcmVz
IHZpYSB0aW1lciBkaXNhYmxpbmcgdmJsYW5rLCBrZWVwaW5nIHZibGFuawo+IHNlcSBudW1iZXIg
YW5kIHRpbWUgc2V0IGF0IGN1cnJlbnQgdmFsdWUKPiAoc29tZSB0aW1lIGxhdGVyKQo+IDQuIHdl
c3RvbiBzdGFydHMgYW5kIGRvZXMgYSBtb2Rlc2V0Cj4gNS4gYXRvbWljIGNvbW1pdCBkaXNhYmxl
cyBjcnRjIHdoaWxlIGl0IGRvZXMgdGhlIG1vZGVzZXQKPiA2LiBpcHVfY3J0Y19hdG9taWNfZGlz
YWJsZSBzZW5kcyB2Ymxhbmsgd2l0aCBvbGQgc2VxIG51bWJlciBhbmQgdGltZQo+IAo+IEZpeGVz
OiBhNDc0NDc4NjQyZDUgKCJkcm0vaW14OiBmaXggY3J0YyB2Ymxhbmsgc3RhdGUgcmVncmVzc2lv
biIpCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEJlY2tldHQgPGJvYi5iZWNrZXR0QGNvbGxh
Ym9yYS5jb20+CgpOb3cgdGhhdCBJIHVuZGVyc3RhbmQgd2hhdCdzIGdvaW5nIG9uIGhlcmU6CgpS
ZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jIHwgNCArKy0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2lteC9p
cHV2My1jcnRjLmMKPiBpbmRleCA5Y2MxZDY3ODY3NGYuLmUwNGQ2ZWZmZjFiNSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pbXgvaXB1djMtY3J0Yy5jCj4gQEAgLTkxLDE0ICs5MSwxNCBAQCBzdGF0aWMgdm9pZCBp
cHVfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gIAlpcHVfZGNf
ZGlzYWJsZShpcHUpOwo+ICAJaXB1X3ByZ19kaXNhYmxlKGlwdSk7Cj4gIAo+ICsJZHJtX2NydGNf
dmJsYW5rX29mZihjcnRjKTsKPiArCj4gIAlzcGluX2xvY2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50
X2xvY2spOwo+ICAJaWYgKGNydGMtPnN0YXRlLT5ldmVudCkgewo+ICAJCWRybV9jcnRjX3NlbmRf
dmJsYW5rX2V2ZW50KGNydGMsIGNydGMtPnN0YXRlLT5ldmVudCk7Cj4gIAkJY3J0Yy0+c3RhdGUt
PmV2ZW50ID0gTlVMTDsKPiAgCX0KPiAgCXNwaW5fdW5sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVu
dF9sb2NrKTsKPiAtCj4gLQlkcm1fY3J0Y192Ymxhbmtfb2ZmKGNydGMpOwo+ICB9Cj4gIAo+ICBz
dGF0aWMgdm9pZCBpbXhfZHJtX2NydGNfcmVzZXQoc3RydWN0IGRybV9jcnRjICpjcnRjKQo+IC0t
IAo+IDIuMTguMAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
