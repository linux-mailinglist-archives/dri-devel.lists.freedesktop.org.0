Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862884D18D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 17:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCBE6E3D0;
	Thu, 20 Jun 2019 15:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48E36E3D0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 15:05:43 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id a15so3495838qtn.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 08:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+SlWqt7mGdvs9AkWDoKN464Wi1itv44/ucax1MjY5Lc=;
 b=TFqOVeC+WDRTZuGG9pZzWgkPbAThwqp5CXV/m6zW1p8eO/awvfSgVjLm/Fy4pRH3EK
 r/fxKe9464E5Ndf18xj1dzqrWHmpvXEEuL2y7m21G5MlByRKQUSw5h2ADgm8GTHpVZE6
 jEqPSXBhgDAlFy+55V1Is4etxgc8tbXkBs2RhIiW+dbWEjsTQxGx0HJCJOW9nubqsDOR
 1eFSnlMIYYxSsJyqkrshjl8Bbmbermtm71YbxXBB/Ayh+ucwJzBK0pGLFOgR5sR/S2zi
 pyCZdsIXuR4AxXh3hds88VB50OqBJYy7070BAa14pcz9DTqhUGSC2JCUak0e98te+yf8
 tRxQ==
X-Gm-Message-State: APjAAAXypWPwzWCJOQ81lno6FTkJGbopHCmb6foRgZi1bwQ51ZQlC6wc
 eeM1XhgbOasquum8WM1suIZRrgePshQWvRRA4oRqYw==
X-Google-Smtp-Source: APXvYqwM0WwCghbi2ShrGdjVLvsTAcFo9iwOmgfOosK9RkDv6TnpEiQTqBaPRpsQc4gKzVQlXZXbkX5AW0qYeR6z2PE=
X-Received: by 2002:ac8:395b:: with SMTP id
 t27mr115053664qtb.115.1561043142986; 
 Thu, 20 Jun 2019 08:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <1560755897-5002-1-git-send-email-yannick.fertre@st.com>
 <7e6a87b6-e442-20cb-0d4e-68eb40c56042@st.com>
In-Reply-To: <7e6a87b6-e442-20cb-0d4e-68eb40c56042@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 20 Jun 2019 17:05:32 +0200
Message-ID: <CA+M3ks7oNuNnH+0eD5TDLFR_0fFWYA4gGtf40HcbFK4SQ7O-EQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/stm: drv: fix suspend/resume
To: Philippe CORNU <philippe.cornu@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+SlWqt7mGdvs9AkWDoKN464Wi1itv44/ucax1MjY5Lc=;
 b=sy2yUH85O64yGVV1H0EJrjQcDOaj/CH5ejtqXd/eWKCNUQyDKLJ4Ox5EJnSlDquSXm
 SD8EasjV3UB1B5KBD4BJnBVokm+WRQoyVw89nAbRcPXDVbtLQlWLKqGtZ4VKNAIE+OPn
 oZDLcU3qBcF0A3LMaG/5XdlCcXF5Ba2qpye539vqcAVjLvl5CfKX5ey0UqOToFh2swiE
 KiXL6zKImj1xSO+JXDDiNFj4/bXj9QiS8Gf2Eh6SuPs3Z0YBFOxUIaJEAo/rbguyBbq8
 GaZJroCvZZk8cxlYXqtTx9MgwqhC9iVzV2T8mO6IRsQWKuNSzTapj4JuUQRDWb+n1Tdy
 W3UQ==
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>, Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWFyLiAxOCBqdWluIDIwMTkgw6AgMTE6NTcsIFBoaWxpcHBlIENPUk5VIDxwaGlsaXBwZS5j
b3JudUBzdC5jb20+IGEgw6ljcml0IDoKPgo+IEhpIFlhbm5pY2ssCj4KPiBUaGFuayB5b3UgZm9y
IHlvdXIgcGF0Y2guCj4KPiBBY2tlZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51
QHN0LmNvbT4KCkkgaGF2ZSBjb3JyZWN0ZWQgRml4ZXMgc2hhMSAoc2hvdWxkIGJlIDEyIGRpZ2l0
cykKQXBwbGllZCBvbiBkcm0tbWlzYy1uZXh0LgoKQmVuamFtaW4KCj4KPiBQaGlsaXBwZSA6LSkK
Pgo+IE9uIDYvMTcvMTkgOToxOCBBTSwgWWFubmljayBGZXJ0csOpIHdyb3RlOgo+ID4gV2l0aG91
dCB0aGlzIGZpeCwgdGhlIHN5c3RlbSBjYW4gbm90IGdvIGluICJzdXNwZW5kIiBtb2RlCj4gPiBk
dWUgdG8gYW4gZXJyb3IgaW4gZHJ2X3N1c3BlbmQgZnVuY3Rpb24uCj4gPgo+ID4gRml4ZXM6IDM1
YWI2Y2YgKCJkcm0vc3RtOiBzdXBwb3J0IHJ1bnRpbWUgcG93ZXIgbWFuYWdlbWVudCIpCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+
Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYyB8IDE1ICsrKysrKysrLS0t
LS0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3N0bS9kcnYuYwo+ID4gaW5kZXggNTY1OTU3Mi4uOWRlZTRlNCAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zdG0vZHJ2LmMKPiA+IEBAIC0xMzYsOCArMTM2LDcgQEAgc3RhdGljIF9fbWF5YmVfdW51c2Vk
IGludCBkcnZfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiAgICAgICBzdHJ1Y3QgbHRk
Y19kZXZpY2UgKmxkZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsKPiA+ICAgICAgIHN0cnVjdCBkcm1f
YXRvbWljX3N0YXRlICpzdGF0ZTsKPiA+Cj4gPiAtICAgICBpZiAoV0FSTl9PTighbGRldi0+c3Vz
cGVuZF9zdGF0ZSkpCj4gPiAtICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOwo+ID4gKyAgICAg
V0FSTl9PTihsZGV2LT5zdXNwZW5kX3N0YXRlKTsKPiA+Cj4gPiAgICAgICBzdGF0ZSA9IGRybV9h
dG9taWNfaGVscGVyX3N1c3BlbmQoZGRldik7Cj4gPiAgICAgICBpZiAoSVNfRVJSKHN0YXRlKSkK
PiA+IEBAIC0xNTUsMTUgKzE1NCwxNyBAQCBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IGRydl9y
ZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+ID4gICAgICAgc3RydWN0IGx0ZGNfZGV2aWNlICps
ZGV2ID0gZGRldi0+ZGV2X3ByaXZhdGU7Cj4gPiAgICAgICBpbnQgcmV0Owo+ID4KPiA+ICsgICAg
IGlmIChXQVJOX09OKCFsZGV2LT5zdXNwZW5kX3N0YXRlKSkKPiA+ICsgICAgICAgICAgICAgcmV0
dXJuIC1FTk9FTlQ7Cj4gPiArCj4gPiAgICAgICBwbV9ydW50aW1lX2ZvcmNlX3Jlc3VtZShkZXYp
Owo+ID4gICAgICAgcmV0ID0gZHJtX2F0b21pY19oZWxwZXJfcmVzdW1lKGRkZXYsIGxkZXYtPnN1
c3BlbmRfc3RhdGUpOwo+ID4gLSAgICAgaWYgKHJldCkgewo+ID4gKyAgICAgaWYgKHJldCkKPiA+
ICAgICAgICAgICAgICAgcG1fcnVudGltZV9mb3JjZV9zdXNwZW5kKGRldik7Cj4gPiAtICAgICAg
ICAgICAgIGxkZXYtPnN1c3BlbmRfc3RhdGUgPSBOVUxMOwo+ID4gLSAgICAgICAgICAgICByZXR1
cm4gcmV0Owo+ID4gLSAgICAgfQo+ID4KPiA+IC0gICAgIHJldHVybiAwOwo+ID4gKyAgICAgbGRl
di0+c3VzcGVuZF9zdGF0ZSA9IE5VTEw7Cj4gPiArCj4gPiArICAgICByZXR1cm4gcmV0Owo+ID4g
ICB9Cj4gPgo+ID4gICBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IGRydl9ydW50aW1lX3N1c3Bl
bmQoc3RydWN0IGRldmljZSAqZGV2KQo+ID4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
