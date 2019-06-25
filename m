Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD68C55877
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934F56E20C;
	Tue, 25 Jun 2019 20:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BE36E20C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:11:39 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so28996112eds.7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=zkV6FjfcQsvo6WYlA8ceAW7NTugFBRZuAe5/8PprGgI=;
 b=Konkf9fnszyFmXXpgKn150rxuWWTc7glxMUNHql+uww3ad4xDbwoYDuHdda4AZtw1t
 YgA4YKQVRjUMQblJT7i9yZ8JbaAVeluAK+C09Rymd6fAu2pRViwHw0fzJ6RqaoqFeVoY
 p1opKxE6lVUUinU7epCkTNkSebBW1EVo2G/70tj9TZKMTZJmN+88iwTGfj4oYWdpGZwU
 k0J1fVYEWZwq/TyLj0x+p8CN4LMCd9ujNLFdGNkqjnIKs6gHcWLmCLGXdMjYqfqrApyR
 gGb9jKShNgXJzxVn2IIMm0kMV11w4zvQo3rFTWnRZXSjF1qpcX+2g2YC8G4ef1koPuOo
 8ZBQ==
X-Gm-Message-State: APjAAAW8poBGdlRsK4B+HVafA/KrON1F5f82XoJ5Hek2vkhBcPn5A1n9
 hstMnANe+EuBTLWSEyFZYKypyA==
X-Google-Smtp-Source: APXvYqwoVMnAgUuE3liJcixkOYd1NT201/L7ZxinP68zsYUut//RkA+BJy/SK3l/jTY4VRTqV7InDw==
X-Received: by 2002:a50:b635:: with SMTP id b50mr327666ede.293.1561493497807; 
 Tue, 25 Jun 2019 13:11:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id k3sm1048485edi.14.2019.06.25.13.11.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 13:11:36 -0700 (PDT)
Date: Tue, 25 Jun 2019 22:11:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Robert Beckett <bob.beckett@collabora.com>
Subject: Re: [PATCH v3 3/4] drm/vblank: estimate vblank while disabling
 vblank if interrupt disabled
Message-ID: <20190625201134.GF12905@phenom.ffwll.local>
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
 <b96132cef4b63118df1026a99b3c345692e3de26.1561483965.git.bob.beckett@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b96132cef4b63118df1026a99b3c345692e3de26.1561483965.git.bob.beckett@collabora.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=zkV6FjfcQsvo6WYlA8ceAW7NTugFBRZuAe5/8PprGgI=;
 b=EqENzc8ZFmkojdUW4bYooe/jHYrBPUxIfH5lufyaa/ljp7fZjFaQVWzP2rlePy2DAk
 tfSJFccP/J6XNDXKPMrYnu/DCrc9n9AXAa/9a0pfe5ig1PwrFxmcHQChxJ1LNWbAM/az
 ssuZV1iUpkscfXe/eYKaPcbpNlh7TWiA16EY4=
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDY6NTk6MTRQTSArMDEwMCwgUm9iZXJ0IEJlY2tldHQg
d3JvdGU6Cj4gSWYgaW50ZXJydXB0cyBhcmUgZGlzYWJsZWQgKGUuZy4gdmlhIHZibGFua19kaXNh
YmxlX2ZuKSBhbmQgd2UgY29tZSB0bwo+IGRpc2FibGUgdmJsYW5rLCB1cGRhdGUgdGhlIHZibGFu
ayBjb3VudCB0byBiZXN0IGd1ZXNzIGFzIHRvIHdoYXQgaXQKPiB3b3VsZCBiZSBoYWQgdGhlIGlu
dGVycnVwdHMgcmVtYWluZWQgZW5hYmxlZCwgYW5kIHVwZGF0ZSB0aGUgdGltZXNhbXAgdG8KPiBu
b3cuCj4gCj4gVGhpcyBhdm9pZHMgYSBzdGFsZSB2YmxhbmsgZXZlbnQgYmVpbmcgc2VudCB3aGls
ZSBkaXNhYmxpbmcgY3J0Y3MgZHVyaW5nCj4gYXRvbWljIG1vZGVzZXQuCj4gCj4gRml4ZXM6IDY4
MDM2YjA4YjkxYmMgKCJkcm0vdmJsYW5rOiBEbyBub3QgdXBkYXRlIHZibGFuayBjb3VudCBpZiBp
bnRlcnJ1cHRzCj4gYXJlIGFscmVhZHkgZGlzYWJsZWQuIikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBS
b2JlcnQgQmVja2V0dCA8Ym9iLmJlY2tldHRAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV92YmxhbmsuYyB8IDE2ICsrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5r
LmMKPiBpbmRleCA3ZGFiYjJiZGI3MzMuLmRiNjhiOGNiZjc5NyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92Ymxh
bmsuYwo+IEBAIC0zNzUsOSArMzc1LDIzIEBAIHZvaWQgZHJtX3ZibGFua19kaXNhYmxlX2FuZF9z
YXZlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKQo+ICAJICogaW50
ZXJydXB0cyB3ZXJlIGVuYWJsZWQuIFRoaXMgYXZvaWRzIGNhbGxpbmcgdGhlIC0+ZGlzYWJsZV92
YmxhbmsoKQo+ICAJICogb3BlcmF0aW9uIGluIGF0b21pYyBjb250ZXh0IHdpdGggdGhlIGhhcmR3
YXJlIHBvdGVudGlhbGx5IHJ1bnRpbWUKPiAgCSAqIHN1c3BlbmRlZC4KPiArCSAqIElmIGludGVy
cnVwdHMgYXJlIGRpc2FibGVkIChlLmcuIHZpYSBibGFua19kaXNhYmxlX2ZuKSB0aGVuIG1ha2UK
PiArCSAqIGJlc3QgZ3Vlc3MgYXMgdG8gd2hhdCBpdCB3b3VsZCBiZSBub3cgYW5kIG1ha2Ugc3Vy
ZSB3ZSBoYXZlIGFuIHVwCj4gKwkgKiB0byBkYXRlIHRpbWVzdGFtcC4KPiAgCSAqLwo+IC0JaWYg
KCF2YmxhbmstPmVuYWJsZWQpCj4gKwlpZiAoIXZibGFuay0+ZW5hYmxlZCkgewo+ICsJCWt0aW1l
X3Qgbm93ID0ga3RpbWVfZ2V0KCk7CgpXb3VsZCBiZSBuaWNlIHRvIGZha2UgdGhpcyBhIGJpdCBt
b3JlIGFjY3VyYXRlbHkgYW5kIHJvdW5kIHRoZSB0aW1lc3RhbXAKaGVyZSB0byBhIG11bHRpcGxl
IG9mIHRoZSBmcmFtZSBkdXJhdGlvbiwgaS5lLiAuLi4KPiArCQl1MzIgZGlmZiA9IDA7Cj4gKwkJ
aWYgKHZibGFuay0+ZnJhbWVkdXJfbnMpIHsKPiArCQkJdTY0IGRpZmZfbnMgPSBrdGltZV90b19u
cyhrdGltZV9zdWIobm93LCB2YmxhbmstPnRpbWUpKTsKPiArCQkJZGlmZiA9IERJVl9ST1VORF9D
TE9TRVNUX1VMTChkaWZmX25zLAo+ICsJCQkJCQkgICAgIHZibGFuay0+ZnJhbWVkdXJfbnMpOwo+
ICsJCX0KCgkJbm93ID0gdmJsYW5rLT50aW1lICsgZGlmZiAqIHZibGFua19mcmFtZWR1cl9uczsK
ClBpY2tpbmcgdGhlIHJpZ2h0IG1hY3JvIGZvciBkb2luZyA2NGJpdCBtdWx0aXBsaWVzIGxlZnQg
dG8geW91IDotKQoKPiArCj4gKwkJc3RvcmVfdmJsYW5rKGRldiwgcGlwZSwgZGlmZiwgbm93LCB2
YmxhbmstPmNvdW50KTsKPiArCj4gIAkJZ290byBvdXQ7Cj4gKwl9Cj4gIAo+ICAJLyoKPiAgCSAq
IFVwZGF0ZSB0aGUgY291bnQgYW5kIHRpbWVzdGFtcCB0byBtYWludGFpbiB0aGUKClNvbWV3aGF0
IHVuaGFwcHkgdGhhdCB3ZSdyZSBkdXBsaWNhdGluZyB0aGlzIGxvZ2ljIHdpdGgKZHJtX3VwZGF0
ZV92YmxhbmtfY291bnQsIGJ1dCBpdCdzIGp1c3QgMiBsaW5lcyBvZiBtYXRoLgotRGFuaWVsCgo+
IC0tIAo+IDIuMTguMAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
