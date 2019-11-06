Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABA2F131B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 11:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269CF6EC97;
	Wed,  6 Nov 2019 10:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBAE6EC97
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 10:00:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f3so2556176wmc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 02:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=zy+pSn3ZcoonGSv1GO7C8DvEXQpMaLJfKmRCgcy5jsg=;
 b=UtP3yPffcSpypVwkx0MAx15mCBOVGgsOGglaOixG8eCv7Ci4MqqgLLaWJxbguU8DxE
 Chw2fVy5X5HvvtJC9TwueeVX1vnPXPVG3wKGoyMvvuOk1mdszJtn0V5wpHWBJhj9bimv
 aDY3Ld7Go0EHz94pbkYh7tbN7QwVUSZ6aqx8D+uNuxBrsuEZ15YJyvQOC7Yc9iqQQceO
 MUBU8e37+7M5gIHyQm3yw/s1uXNXEt+Yk5Q4BOvcWw/VpW6Hw+mkwNPx9TLqHDIO/p9H
 Kg1SbcT6XiL7WQ3nOvLfqcyfwMjyWWi1MGWWdfsqNJXr+pbHoj21UXI8d+MnlYWWoQ5X
 tBvA==
X-Gm-Message-State: APjAAAVkJUdZlXw3hXPvCiDyEgjlQefqSnLY2o/M9PgLLgipJ+y807G2
 JtLln48E5XOr501wUxFRkKRkDg==
X-Google-Smtp-Source: APXvYqyQxNqhhawsrrSWps1N79qhazCv6pc1zOL9i3tUA/WFWiss6Xh9eJvnifMvzvFih9IDJzCAvg==
X-Received: by 2002:a7b:c305:: with SMTP id k5mr1740732wmj.90.1573034407343;
 Wed, 06 Nov 2019 02:00:07 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id c144sm2310805wmd.1.2019.11.06.02.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 02:00:06 -0800 (PST)
Date: Wed, 6 Nov 2019 11:00:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH 1/1] drm/panel: boe-tv101wum-n16 seperate the panel power
 control
Message-ID: <20191106100004.GC23790@phenom.ffwll.local>
Mail-Followup-To: Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 cawa.cheng@mediatek.com, bibby.hsieh@mediatek.com,
 ck.hu@mediatek.com, stonea168@163.com
References: <20191106081752.12944-1-jitao.shi@mediatek.com>
 <20191106081752.12944-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106081752.12944-2-jitao.shi@mediatek.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=zy+pSn3ZcoonGSv1GO7C8DvEXQpMaLJfKmRCgcy5jsg=;
 b=C+n82oQNJFjenuv/DNJAgBzVrh8fyteQYuLVy1XYG0jKDYAL0O8OiwweQ2NLFw5+5Z
 ZdIrd+/HVctvnEXkFTMOx5+k//af4trZVXXZxnubH7Vim5naTIuY8nLC3gKoBR3quozj
 8X7xb90cwVKttEgAQgiN9Nv/y8jr4IvUoqNeQ=
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDQ6MTc6NTJQTSArMDgwMCwgSml0YW8gU2hpIHdyb3Rl
Ogo+IFNlcGVyYXRlIHRoZSBwYW5lbCBwb3dlciBjb250cm9sIGZyb20gcHJlcGFyZS91bnByZXBh
cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29t
PgoKWW91ciBwYXRjaCBzZXJpZXMgaXMgYWxsIGtpbmRzIG9mIHNwbGl0IHVwLiBDYW4geW91IHBs
cyByZXNlbmQsIHdpdGggdGhlCmVudGlyZSB0aGluZyBhbGwgaW4gb25lIGdvPwoKVGhhbmtzLCBE
YW5pZWwKCj4gLS0tCj4gIC4uLi9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10djEwMXd1bS1ubDYu
YyAgICB8IDY5ICsrKysrKysrKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2Vy
dGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYwo+IGluZGV4IGUyNDk2YTMzNGFiNi4uNWIxYjI4NWEy
MTk0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3
dW0tbmw2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3Vt
LW5sNi5jCj4gQEAgLTUwLDYgKzUwLDcgQEAgc3RydWN0IGJvZV9wYW5lbCB7Cj4gIAlzdHJ1Y3Qg
cmVndWxhdG9yICphdmRkOwo+ICAJc3RydWN0IGdwaW9fZGVzYyAqZW5hYmxlX2dwaW87Cj4gIAo+
ICsJYm9vbCBwcmVwYXJlZF9wb3dlcjsKPiAgCWJvb2wgcHJlcGFyZWQ7Cj4gIAlib29sIGVuYWJs
ZWQ7Cj4gIAo+IEBAIC01MDEsMTIgKzUwMiwxMSBAQCBzdGF0aWMgaW50IGJvZV9wYW5lbF9kaXNh
YmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gLXN0
YXRpYyBpbnQgYm9lX3BhbmVsX3VucHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKPiAr
c3RhdGljIGludCBib2VfcGFuZWxfdW5wcmVwYXJlX3Bvd2VyKHN0cnVjdCBkcm1fcGFuZWwgKnBh
bmVsKQo+ICB7Cj4gIAlzdHJ1Y3QgYm9lX3BhbmVsICpib2UgPSB0b19ib2VfcGFuZWwocGFuZWwp
Owo+IC0JaW50IHJldDsKPiAgCj4gLQlpZiAoIWJvZS0+cHJlcGFyZWQpCj4gKwlpZiAoIWJvZS0+
cHJlcGFyZWRfcG93ZXIpCj4gIAkJcmV0dXJuIDA7Cj4gIAo+ICAJaWYgKGJvZS0+ZGVzYy0+ZGlz
Y2hhcmdlX29uX2Rpc2FibGUpIHsKPiBAQCAtNTE4LDEyICs1MTgsNiBAQCBzdGF0aWMgaW50IGJv
ZV9wYW5lbF91bnByZXBhcmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCj4gIAkJdXNsZWVwX3Jh
bmdlKDUwMDAsIDcwMDApOwo+ICAJCXJlZ3VsYXRvcl9kaXNhYmxlKGJvZS0+cHAxODAwKTsKPiAg
CX0gZWxzZSB7Cj4gLQkJcmV0ID0gYm9lX3BhbmVsX29mZihib2UpOwo+IC0JCWlmIChyZXQgPCAw
KSB7Cj4gLQkJCWRldl9lcnIocGFuZWwtPmRldiwgImZhaWxlZCB0byBzZXQgcGFuZWwgb2ZmOiAl
ZFxuIiwKPiAtCQkJCXJldCk7Cj4gLQkJCXJldHVybiByZXQ7Cj4gLQkJfQo+ICAJCW1zbGVlcCgx
NTApOwo+ICAJCWdwaW9kX3NldF92YWx1ZShib2UtPmVuYWJsZV9ncGlvLCAwKTsKPiAgCQl1c2xl
ZXBfcmFuZ2UoNTAwLCAxMDAwKTsKPiBAQCAtNTMzLDE3ICs1MjcsMzkgQEAgc3RhdGljIGludCBi
b2VfcGFuZWxfdW5wcmVwYXJlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQo+ICAJCXJlZ3VsYXRv
cl9kaXNhYmxlKGJvZS0+cHAxODAwKTsKPiAgCX0KPiAgCj4gKwlib2UtPnByZXBhcmVkX3Bvd2Vy
ID0gZmFsc2U7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgYm9lX3Bh
bmVsX3VucHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKPiArewo+ICsJc3RydWN0IGJv
ZV9wYW5lbCAqYm9lID0gdG9fYm9lX3BhbmVsKHBhbmVsKTsKPiArCWludCByZXQ7Cj4gKwo+ICsJ
aWYgKCFib2UtPnByZXBhcmVkKQo+ICsJCXJldHVybiAwOwo+ICsKPiArCWlmICghYm9lLT5kZXNj
LT5kaXNjaGFyZ2Vfb25fZGlzYWJsZSkgewo+ICsJCXJldCA9IGJvZV9wYW5lbF9vZmYoYm9lKTsK
PiArCQlpZiAocmV0IDwgMCkgewo+ICsJCQlkZXZfZXJyKHBhbmVsLT5kZXYsICJmYWlsZWQgdG8g
c2V0IHBhbmVsIG9mZjogJWRcbiIsCj4gKwkJCQlyZXQpOwo+ICsJCQlyZXR1cm4gcmV0Owo+ICsJ
CX0KPiArCX0KPiArCj4gIAlib2UtPnByZXBhcmVkID0gZmFsc2U7Cj4gIAo+ICAJcmV0dXJuIDA7
Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQgYm9lX3BhbmVsX3ByZXBhcmUoc3RydWN0IGRybV9wYW5l
bCAqcGFuZWwpCj4gK3N0YXRpYyBpbnQgYm9lX3BhbmVsX3ByZXBhcmVfcG93ZXIoc3RydWN0IGRy
bV9wYW5lbCAqcGFuZWwpCj4gIHsKPiAgCXN0cnVjdCBib2VfcGFuZWwgKmJvZSA9IHRvX2JvZV9w
YW5lbChwYW5lbCk7Cj4gIAlpbnQgcmV0Owo+ICAKPiAtCWlmIChib2UtPnByZXBhcmVkKQo+ICsJ
aWYgKGJvZS0+cHJlcGFyZWRfcG93ZXIpCj4gIAkJcmV0dXJuIDA7Cj4gIAo+ICAJZ3Bpb2Rfc2V0
X3ZhbHVlKGJvZS0+ZW5hYmxlX2dwaW8sIDApOwo+IEBAIC01NzEsMTggKzU4NywxMCBAQCBzdGF0
aWMgaW50IGJvZV9wYW5lbF9wcmVwYXJlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQo+ICAJZ3Bp
b2Rfc2V0X3ZhbHVlKGJvZS0+ZW5hYmxlX2dwaW8sIDEpOwo+ICAJdXNsZWVwX3JhbmdlKDYwMDAs
IDEwMDAwKTsKPiAgCj4gLQlyZXQgPSBib2VfcGFuZWxfaW5pdChib2UpOwo+IC0JaWYgKHJldCA8
IDApIHsKPiAtCQlkZXZfZXJyKHBhbmVsLT5kZXYsICJmYWlsZWQgdG8gaW5pdCBwYW5lbDogJWRc
biIsIHJldCk7Cj4gLQkJZ290byBwb3dlcm9mZjsKPiAtCX0KPiAtCj4gLQlib2UtPnByZXBhcmVk
ID0gdHJ1ZTsKPiArCWJvZS0+cHJlcGFyZWRfcG93ZXIgPSB0cnVlOwo+ICAKPiAgCXJldHVybiAw
Owo+ICAKPiAtcG93ZXJvZmY6Cj4gLQlyZWd1bGF0b3JfZGlzYWJsZShib2UtPmF2ZWUpOwo+ICBw
b3dlcm9mZmF2ZGQ6Cj4gIAlyZWd1bGF0b3JfZGlzYWJsZShib2UtPmF2ZGQpOwo+ICBwb3dlcm9m
ZjF2ODoKPiBAQCAtNTkzLDYgKzYwMSwyNSBAQCBzdGF0aWMgaW50IGJvZV9wYW5lbF9wcmVwYXJl
KHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQo+ICAJcmV0dXJuIHJldDsKPiAgfQo+ICAKPiArc3Rh
dGljIGludCBib2VfcGFuZWxfcHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKPiArewo+
ICsJc3RydWN0IGJvZV9wYW5lbCAqYm9lID0gdG9fYm9lX3BhbmVsKHBhbmVsKTsKPiArCWludCBy
ZXQ7Cj4gKwo+ICsJaWYgKGJvZS0+cHJlcGFyZWQpCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJcmV0
ID0gYm9lX3BhbmVsX2luaXQoYm9lKTsKPiArCWlmIChyZXQgPCAwKSB7Cj4gKwkJZGV2X2Vycihw
YW5lbC0+ZGV2LCAiZmFpbGVkIHRvIGluaXQgcGFuZWw6ICVkXG4iLCByZXQpOwo+ICsJCXJldHVy
biByZXQ7Cj4gKwl9Cj4gKwo+ICsJYm9lLT5wcmVwYXJlZCA9IHRydWU7Cj4gKwo+ICsJcmV0dXJu
IDA7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgYm9lX3BhbmVsX2VuYWJsZShzdHJ1Y3QgZHJtX3Bh
bmVsICpwYW5lbCkKPiAgewo+ICAJc3RydWN0IGJvZV9wYW5lbCAqYm9lID0gdG9fYm9lX3BhbmVs
KHBhbmVsKTsKPiBAQCAtNzU0LDcgKzc4MSw5IEBAIHN0YXRpYyBpbnQgYm9lX3BhbmVsX2dldF9t
b2RlcyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
cGFuZWxfZnVuY3MgYm9lX3BhbmVsX2Z1bmNzID0gewo+ICAJLmRpc2FibGUgPSBib2VfcGFuZWxf
ZGlzYWJsZSwKPiAgCS51bnByZXBhcmUgPSBib2VfcGFuZWxfdW5wcmVwYXJlLAo+ICsJLnVucHJl
cGFyZV9wb3dlciA9IGJvZV9wYW5lbF91bnByZXBhcmVfcG93ZXIsCj4gIAkucHJlcGFyZSA9IGJv
ZV9wYW5lbF9wcmVwYXJlLAo+ICsJLnByZXBhcmVfcG93ZXIgPSBib2VfcGFuZWxfcHJlcGFyZV9w
b3dlciwKPiAgCS5lbmFibGUgPSBib2VfcGFuZWxfZW5hYmxlLAo+ICAJLmdldF9tb2RlcyA9IGJv
ZV9wYW5lbF9nZXRfbW9kZXMsCj4gIH07Cj4gLS0gCj4gMi4yMS4wCj4gCgotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
