Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC2036FFE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 11:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017F0893C0;
	Thu,  6 Jun 2019 09:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA265893D0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:35:09 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id c26so2412143edt.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 02:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=kDElZEvyh0wwS+altmassyfjP24rSOzt0szVf1g2L50=;
 b=rh/3rMm7f/8PjV0rZ7XpHsjUW66VCeOaIOSmQOVF/oY/mPdY5iJLubs6iPKSxRPmNw
 AVBwydhgIHZxNffBcrP0rt/doy1zqpDH+CRVx2OqTX9pS5ypp/Z07905ZoZO8FY1ocEd
 IpPsrJ40AbIDd91zDmQJSrxHlK2vdOEVG8Q4eaVkDGThCuJtn1nPmldvpgkL30jcLrNv
 2RDflRhCtgZbnSgciB/sMOsjxhUBDCTkcUpnMZSsRz+u7SHIiUqcH5FiuzSboyK/HRJm
 G4IbvKz2bEXZyPt5+ypjO/U8k1MOh+6VVmNrot1hW9ot4AH/oClBCJWLO1RYM0okfiXb
 2n3Q==
X-Gm-Message-State: APjAAAX8yilQP31XWFtCPtTqmF2mjSuCPwxUV9mn/InxnogxtSLj8dPY
 uP1ivtnufmOKkaPhJQr11Z0nLA==
X-Google-Smtp-Source: APXvYqz535AKo1bXymGjBQWwnk6+07vGfXjVe0irLPc3lS29pvmS/JPBFO+oAPfiSDSeDmMlImyObg==
X-Received: by 2002:a17:906:892:: with SMTP id
 n18mr14029693eje.10.1559813708496; 
 Thu, 06 Jun 2019 02:35:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b10sm237625ejb.30.2019.06.06.02.35.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 02:35:07 -0700 (PDT)
Date: Thu, 6 Jun 2019 11:35:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH] drm/crc-debugfs: User irqsafe spinlock in
 drm_crtc_add_crc_entry
Message-ID: <20190606093505.GZ21222@phenom.ffwll.local>
References: <20190605194556.16744-1-daniel.vetter@ffwll.ch>
 <20190606081241.GT5942@intel.com>
 <CA+M3ks41OnehTCHxz2TwJ3DA1ODNLNFhPsFs-k0bLX6Brye6sw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+M3ks41OnehTCHxz2TwJ3DA1ODNLNFhPsFs-k0bLX6Brye6sw@mail.gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=kDElZEvyh0wwS+altmassyfjP24rSOzt0szVf1g2L50=;
 b=PLSUT992b1U8dpe92bHTICyI56rPv/rg1wFJcOe6FmfBwcD7sf0jzQ8MxOHFqdIra2
 cK/EskBsTRehTi4iod9847miKUQrcpHP0JxJCqplAaGOQQg0MPthuvooqZnJ0sDkLEyP
 YiI6pHoRSKc7a5AVhky4iAw/HKotsfT/yySls=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMTA6Mjc6MjNBTSArMDIwMCwgQmVuamFtaW4gR2FpZ25h
cmQgd3JvdGU6Cj4gTGUgamV1LiA2IGp1aW4gMjAxOSDDoCAxMDoxMiwgVmlsbGUgU3lyasOkbMOk
Cj4gPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPiBhIMOpY3JpdCA6Cj4gPgo+ID4gT24g
V2VkLCBKdW4gMDUsIDIwMTkgYXQgMDk6NDU6NTZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90
ZToKPiA+ID4gV2UgY2FuIGJlIGNhbGxlZCBmcm9tIGFueSBjb250ZXh0LCB3ZSBuZWVkIHRvIGJl
IHByZXBhcmVkLgo+ID4gPgo+ID4gPiBOb3RpY2VkIHRoaXMgd2hpbGUgaGFja2luZyBvbiB2a21z
LCB3aGljaCBjYWxscyB0aGlzIGZ1bmN0aW9uIGZyb20gYQo+ID4gPiBub3JtYWwgd29ya2VyLiBX
aGljaCByZWFsbHkgdXBzZXRzIGxvY2tkZXAuCj4gPiA+Cj4gPiA+IENjOiBSb2RyaWdvIFNpcXVl
aXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxvQGdtYWlsLmNvbT4KPiA+ID4gQ2M6IFRvbWV1IFZpem9z
byA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+Cj4gPiA+IENjOiBFbWlsIFZlbGlrb3YgPGVt
aWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+ID4gPiBDYzogQmVuamFtaW4gR2FpZ25hcmQgPGJl
bmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ID4KPiA+IFJldmlld2VkLWJ5OiBWaWxs
ZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IAo+IFJldmlld2Vk
LWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KClRo
YW5rcyBmb3IgdGFraW5nIGEgbG9vaywgcGF0Y2ggcHVzaGVkIHRvIGRybS1taXNjLW5leHQuCi1E
YW5pZWwKCj4gCj4gPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdm
c19jcmMuYyB8IDUgKysrLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RlYnVnZnNfY3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiA+
ID4gaW5kZXggNTg1MTY5ZjBkY2M1Li43ZjM1YjViYTE5MjQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RlYnVnZnNfY3JjLmMKPiA+ID4gQEAgLTM5Niw4ICszOTYsOSBAQCBpbnQgZHJtX2Ny
dGNfYWRkX2NyY19lbnRyeShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGJvb2wgaGFzX2ZyYW1lLAo+
ID4gPiAgICAgICBzdHJ1Y3QgZHJtX2NydGNfY3JjICpjcmMgPSAmY3J0Yy0+Y3JjOwo+ID4gPiAg
ICAgICBzdHJ1Y3QgZHJtX2NydGNfY3JjX2VudHJ5ICplbnRyeTsKPiA+ID4gICAgICAgaW50IGhl
YWQsIHRhaWw7Cj4gPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gPiA+Cj4gPiA+IC0g
ICAgIHNwaW5fbG9jaygmY3JjLT5sb2NrKTsKPiA+ID4gKyAgICAgc3Bpbl9sb2NrX2lycXNhdmUo
JmNyYy0+bG9jaywgZmxhZ3MpOwo+ID4gPgo+ID4gPiAgICAgICAvKiBDYWxsZXIgbWF5IG5vdCBo
YXZlIG5vdGljZWQgeWV0IHRoYXQgdXNlcnNwYWNlIGhhcyBzdG9wcGVkIHJlYWRpbmcgKi8KPiA+
ID4gICAgICAgaWYgKCFjcmMtPmVudHJpZXMpIHsKPiA+ID4gQEAgLTQyOCw3ICs0MjksNyBAQCBp
bnQgZHJtX2NydGNfYWRkX2NyY19lbnRyeShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGJvb2wgaGFz
X2ZyYW1lLAo+ID4gPiAgICAgICBoZWFkID0gKGhlYWQgKyAxKSAmIChEUk1fQ1JDX0VOVFJJRVNf
TlIgLSAxKTsKPiA+ID4gICAgICAgY3JjLT5oZWFkID0gaGVhZDsKPiA+ID4KPiA+ID4gLSAgICAg
c3Bpbl91bmxvY2soJmNyYy0+bG9jayk7Cj4gPiA+ICsgICAgIHNwaW5fdW5sb2NrX2lycXJlc3Rv
cmUoJmNyYy0+bG9jaywgZmxhZ3MpOwo+ID4gPgo+ID4gPiAgICAgICB3YWtlX3VwX2ludGVycnVw
dGlibGUoJmNyYy0+d3EpOwo+ID4gPgo+ID4gPiAtLQo+ID4gPiAyLjIwLjEKPiA+ID4KPiA+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+ID4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCj4gPgo+ID4gLS0KPiA+IFZpbGxlIFN5cmrDpGzDpAo+ID4gSW50ZWwKPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
