Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6467814518
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48AD89122;
	Mon,  6 May 2019 07:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EEE89122
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 07:25:45 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id g190so1571940qkf.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 00:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pO57+WHM9icAQXA84tNTYrkL98PNEsC+5xBzFAyNyVg=;
 b=EGawcQ+XC8rgsC51xnmnyerv94j3zW9+f4Ci0/wd3fv+Oy0VfDMdLH0UnBcnojq/NJ
 EMisbT9IV2qgwRFSHmav+ZKlVVX4eMtj+crorF8KwklV6Avc2RmyFHA0WnsentE2zHrk
 /EIgc9AGzMHi0+AgztdATqwUu/6ENZbeAehPBLxmpT3A2uodUQDUnmV/bFBP78WWPa8o
 we6YfpEu8Z0CPo38aQRxe+5j1vSrO4moL83lQVz6wwtxSOV6AYLH+bJNTBB97soWLVJ3
 Z2TDnlQUENgrHMWbex5a/Z7B5RALxqwJXg/MYti7LOCBzRYL76A8xXllmWwvG+RPrKIg
 IeAQ==
X-Gm-Message-State: APjAAAX5D2JQCGCkeZDGeYS7xsBRD/1UywB99n0GX3zpn5sbV4UKmxfK
 9oztmJ5kSHCbH1Jviwl5PiFEQPkC0f/kUX6/ilijEg==
X-Google-Smtp-Source: APXvYqzi6kaFJ7dpE+n+VOhA31cBwTt9A6DfQSW/RJ6FOD2P+M23nMnX4FFbt/nvMku6Ns54SMrMIRxJijtROfat5M4=
X-Received: by 2002:a37:8843:: with SMTP id k64mr18569492qkd.8.1557127545107; 
 Mon, 06 May 2019 00:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <1556114601-30936-1-git-send-email-fabien.dessenne@st.com>
 <1556114601-30936-2-git-send-email-fabien.dessenne@st.com>
 <c445397b-36a7-3511-603a-e94ae6ddcf12@st.com>
In-Reply-To: <c445397b-36a7-3511-603a-e94ae6ddcf12@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 6 May 2019 09:25:34 +0200
Message-ID: <CA+M3ks6M7BC3VP-4O7suVucnYySJps4CxyAyVz_ra5EVDUzrag@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/stm: ltdc: manage the get_irq probe defer case
To: Philippe CORNU <philippe.cornu@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pO57+WHM9icAQXA84tNTYrkL98PNEsC+5xBzFAyNyVg=;
 b=Q4sRowf0YZqref5eztkLd8S7ufHGsFLRndJMSOMuqY3b4S0MmgjZiYllijIxccx3+i
 d8qqm5j/vpnQrGZwJxPwwlWKsTrjEKWY6V1DThjLxMKK0nJ3OLFoyeqykRh4uzGe/OfR
 dByViWZvEs33mHGK/JVSuWGgxQUZHf262x09TCQPzgdAysQkppKolZRuF8gPsb228h1n
 iZNxlwS9hfyLFHgtVphlUl3yYDAaS0SGzHvmBgn3v+C0jrO4dnMBQekgtaTwTwxTYNQj
 JDN9iFu/x6u/ntfRt42Z+55u5TsUjZFp48zR3MbdjmPhULajgsdi4kI1dK6BPdNnQTjK
 OxHg==
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
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgdmVuLiAyNiBhdnIuIDIwMTkgw6AgMTQ6MzAsIFBoaWxpcHBlIENPUk5VIDxwaGlsaXBwZS5j
b3JudUBzdC5jb20+IGEgw6ljcml0IDoKPgo+IEhpIEZhYmllbiwKPiBhbmQgdGhhbmsgeW91IGZv
ciB5b3VyIHBhdGNoLAo+Cj4gQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3Ju
dUBzdC5jb20+Cj4KPiBQaGlsaXBwZSA6LSkKPgo+IE9uIDQvMjQvMTkgNDowMyBQTSwgRmFiaWVu
IERlc3Nlbm5lIHdyb3RlOgo+ID4gTWFuYWdlIHRoZSAtRVBST0JFX0RFRkVSIGVycm9yIGNhc2Ug
Zm9yIHRoZSBsdGRjIElSUS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJpZW4gRGVzc2VubmUg
PGZhYmllbi5kZXNzZW5uZUBzdC5jb20+CgpBcHBsaWVkIG9uIGRybS1taXNjLW5leHQuClRoYW5r
cywKQmVuamFtaW4KCj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAz
ICsrKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9s
dGRjLmMKPiA+IGluZGV4IDU2NmIwZDguLjUyMWJhODMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMK
PiA+IEBAIC0xMTc0LDYgKzExNzQsOSBAQCBpbnQgbHRkY19sb2FkKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZGV2KQo+ID4KPiA+ICAgICAgIGZvciAoaSA9IDA7IGkgPCBNQVhfSVJROyBpKyspIHsKPiA+
ICAgICAgICAgICAgICAgaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCBpKTsKPiA+ICsgICAg
ICAgICAgICAgaWYgKGlycSA9PSAtRVBST0JFX0RFRkVSKQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gZXJyOwo+ID4gKwo+ID4gICAgICAgICAgICAgICBpZiAoaXJxIDwgMCkKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+Cj4gPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
