Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021192C7C44
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BB36E40C;
	Mon, 30 Nov 2020 01:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98ECB6EE97
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 00:05:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 23so7181760wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 16:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ask30rkCcxEwfDRluplRjJx9jj2tCEDJPuoiY4dzrEU=;
 b=TAXEVTKtCDoPUtQp9n2x5WKgPA+rDz5bae854cIShg+24zyp2JK+flsdc530Cu7Amj
 Bv0gZrhGCVGh30QLe4DHvFN3GWnEcf4EKhCBD9fE4Bn0buxOReLeZmrkYo7fGFfVMVbd
 Bd3i7ddKBNngnNgUfx+DkXMA9XYNNQMoBc8nz11hGHjKMh6nLbkgE4VeOU4yLN7xjwUp
 q0UMEKi52xPoeiZ5vfLIa8ZzQKZnXBPIVNtmkheBaiheX8y5caax5GO2sp4Y9ch4Fx1l
 EueHD74OM53JQ9Z7iDdoSeHVb5HY5tcq20liVgzfWyJpgGiKzHxD0UA3Gx5x1HibpYO+
 awQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ask30rkCcxEwfDRluplRjJx9jj2tCEDJPuoiY4dzrEU=;
 b=WPVAQ68+RNt/QcI8Uv2R5DLz849AAO5dnxKBpi6sABeVv6Ay7i4m2hR4Kue9LosJrk
 PhyHFqjLGMNa65A/urb1MERHMV2rguIaam9CHwWUcDQOl5QpULRNoiUf1xYEiL9ux/oe
 GpKDwJuj2klo6PxY5jyUtK6Gg8YvLywL4zPNxMy41P6KWuKO9T/x6tTRNcmq0FnUJHoa
 1oUEityFLBp0z3WLaWW9Z4gEmqE7hJnx/XJB7fqpDb53P//f41Q+twaACyZREL9pliHw
 UEA8svBb8ZlBhAIabL2ZXDC4YmHc2pmOkvNO/PuRhNwRrPYF1PX40SdcZ+7MfCbrAbUe
 Nb1g==
X-Gm-Message-State: AOAM5338kvsQ0GwDUQ8c20QqI1B/6hL6MDnlqLCJU3bWtxWKeZXH/fVv
 OQ+JKDs/wwMAX7tcfpzSkPA=
X-Google-Smtp-Source: ABdhPJz8/3DNGbL+SIcOcaVF41BOm5EcTR/4qYvInjmmiYqK578TQziZLEV9cbKsVueURcJ4rWG60Q==
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr13990772wrw.123.1606521932370; 
 Fri, 27 Nov 2020 16:05:32 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
 by smtp.googlemail.com with ESMTPSA id
 a131sm16416147wmh.30.2020.11.27.16.05.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Nov 2020 16:05:31 -0800 (PST)
Subject: Re: [PATCH] drm/panel: sony-acx565akm: Fix race condition in probe
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20201127200429.129868-1-sebastian.reichel@collabora.com>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <45fea8ad-233c-d227-70f2-66fe9f4fe808@gmail.com>
Date: Sat, 28 Nov 2020 02:05:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20201127200429.129868-1-sebastian.reichel@collabora.com>
Content-Language: en-GB
X-Mailman-Approved-At: Mon, 30 Nov 2020 01:02:59 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: kernel@collabora.com, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Jarkko Nikula <jarkko.nikula@bitmer.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WW91IG1heSBhZGQ6CgpUZXN0ZWQtYnk6IEl2YXlsbyBEaW1pdHJvdiA8aXZvLmcuZGltaXRyb3Yu
NzVAZ21haWwuY29tPgoKT24gMjcuMTEuMjAg0LMuIDIyOjA0INGHLiwgU2ViYXN0aWFuIFJlaWNo
ZWwgd3JvdGU6Cj4gVGhlIHByb2JlIHJvdXRpbmUgYWNxdWlyZXMgdGhlIHJlc2V0IEdQSU8gdXNp
bmcgR1BJT0RfT1VUX0xPVy4gRGlyZWN0bHkKPiBhZnRlcndhcmRzIGl0IGNhbGxzIGFjeDU2NWFr
bV9kZXRlY3QoKSwgd2hpY2ggc2V0cyB0aGUgR1BJTyB2YWx1ZSB0bwo+IEhJR0guIElmIHRoZSBi
b290bG9hZGVyIGluaXRpYWxpemVkIHRoZSBHUElPIHRvIEhJR0ggYmVmb3JlIHRoZSBwcm9iZQo+
IHJvdXRpbmUgd2FzIGNhbGxlZCwgdGhlcmUgaXMgb25seSBhIHZlcnkgc2hvcnQgdGltZSBwZXJp
b2Qgb2YgYSBmZXcKPiBpbnN0cnVjdGlvbnMgd2hlcmUgdGhlIHJlc2V0IHNpZ25hbCBpcyBMT1cu
IEV4YWN0IHRpbWUgZGVwZW5kcyBvbgo+IGNvbXBpbGVyIG9wdGltaXphdGlvbnMsIGtlcm5lbCBj
b25maWd1cmF0aW9uIGFuZCBhbGlnbm1lbnQgb2YgdGhlIHN0YXJzLAo+IGJ1dCBJIGV4cGVjdCBp
dCB0byBiZSBhbHdheXMgd2F5IGxlc3MgdGhhbiAxMHVzLiBUaGVyZSBhcmUgbm8gcHVibGljCj4g
ZGF0YXNoZWV0cyBmb3IgdGhlIHBhbmVsLCBidXQgYWN4NTY1YWttX3Bvd2VyX29uKCkgaGFzIGEg
Y29tbWVudCB3aXRoCj4gdGltaW5ncyBhbmQgcmVzZXQgcGVyaW9kIHNob3VsZCBiZSBhdCBsZWFz
dCAxMHVzLiBTbyB0aGlzIHBvdGVudGlhbGx5Cj4gYnJpbmdzIHRoZSBwYW5lbCBpbnRvIGEgaGFs
Zi1yZXNldCBzdGF0ZS4KPiAKPiBUaGUgcmVzdWx0IGlzLCB0aGF0IHBhbmVsIG1heSBub3Qgd29y
ayBhZnRlciBib290IGFuZCBjYW4gZ2V0IGludG8gYQo+IHdvcmtpbmcgc3RhdGUgYnkgcmUtZW5h
YmxpbmcgaXQgKGUuZy4gYnkgYmxhbmtpbmcgKyB1bmJsYW5raW5nKSwgc2luY2UKPiB0aGF0IGRv
ZXMgYSBjbGVhbiByZXNldCBjeWNsZS4gVGhpcyBidWcgaGFzIHJlY2VudGx5IGJlZW4gaGl0IGJ5
IEl2YXlsbwo+IERpbWl0cm92LCBidXQgdGhlcmUgYXJlIHNvbWUgb2xkZXIgcmVwb3J0cyB3aGlj
aCBhcmUgcHJvYmFibHkgdGhlIHNhbWUKPiBidWcuIEF0IGxlYXN0IFRvbnkgTGluZGdyZW4sIFBl
dGVyIFVqZmFsdXNpIGFuZCBKYXJra28gTmlrdWxhIGhhdmUKPiBleHBlcmllbmNlZCBpdCBpbiAy
MDE3IGRlc2NyaWJpbmcgdGhlIGJsYW5rL3VuYmxhbmsgcHJvY2VkdXJlIGFzCj4gcG9zc2libGUg
d29ya2Fyb3VuZC4KPiAKPiBOb3RlLCB0aGF0IHRoZSBidWcgcmVhbGx5IGdvZXMgYmFjayBpbiB0
aW1lLiBJdCBoYXMgb3JpZ2luYWxseSBiZWVuCj4gaW50cm9kdWNlZCBpbiB0aGUgcHJlZGVjZXNz
b3Igb2YgdGhlIG9tYXBmYiBkcml2ZXIgaW4gM2M0NWQwNWJlMzgyCj4gKCJPTUFQRFNTOiBhY3g1
NjVha20gcGFuZWw6IGhhbmRsZSBncGlvcyBpbiBwYW5lbCBkcml2ZXIiKSBpbiAyMDEyLgo+IFRo
YXQgZHJpdmVyIGV2ZW50dWFsbHkgZ290IHJlcGxhY2VkIGJ5IGEgbmV3ZXIgb25lLCB3aGljaCBo
YWQgdGhlIGJ1Zwo+IGZyb20gdGhlIGJlZ2lubmluZyBpbiA4NDE5Mjc0MmQ5YzIgKCJPTUFQRFNT
OiBBZGQgU29ueSBBQ1g1NjVBS00gcGFuZWwKPiBkcml2ZXIiKSBhbmQgc3RpbGwgZXhpc3RzIGlu
IGZiZGV2IHdvcmxkLiBUaGF0IGRyaXZlciBoYXMgbGF0ZXIgYmVlbgo+IGNvcGllZCB0byBvbWFw
ZHJtIGFuZCB0aGVuIHdhcyB1c2VkIGFzIGEgYmFzaXMgZm9yIHRoaXMgZHJpdmVyLiBMYXN0Cj4g
YnV0IG5vdCBsZWFzdCB0aGUgb21hcGRybSBzcGVjaWZpYyBkcml2ZXIgaGFzIGJlZW4gcmVtb3Zl
ZCBpbgo+IDQ1ZjE2YzgyZGI3ZSAoImRybS9vbWFwOiBkaXNwbGF5czogUmVtb3ZlIHVudXNlZCBw
YW5lbCBkcml2ZXJzIikuCj4gCj4gUmVwb3J0ZWQtYnk6IEphcmtrbyBOaWt1bGEgPGphcmtrby5u
aWt1bGFAYml0bWVyLmNvbT4KPiBSZXBvcnRlZC1ieTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVq
ZmFsdXNpQHRpLmNvbT4KPiBSZXBvcnRlZC1ieTogVG9ueSBMaW5kZ3JlbiA8dG9ueUBhdG9taWRl
LmNvbT4KPiBSZXBvcnRlZC1ieTogQWFybyBLb3NraW5lbiA8YWFyby5rb3NraW5lbkBpa2kuZmk+
Cj4gUmVwb3J0ZWQtYnk6IEl2YXlsbyBEaW1pdHJvdiA8aXZvLmcuZGltaXRyb3YuNzVAZ21haWwu
Y29tPgo+IENjOiBNZXJsaWpuIFdhamVyIDxtZXJsaWpuQHdpenp1cC5vcmc+Cj4gQ2M6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBDYzogVG9t
aSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPiBGaXhlczogMWM4ZmMzZjBjNWQy
ICgiZHJtL3BhbmVsOiBBZGQgZHJpdmVyIGZvciB0aGUgU29ueSBBQ1g1NjVBS00gcGFuZWwiKQo+
IFNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBSZWljaGVsIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xs
YWJvcmEuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNvbnktYWN4
NTY1YWttLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNv
bnktYWN4NTY1YWttLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc29ueS1hY3g1NjVh
a20uYwo+IGluZGV4IGU5NWZkZmIxNmI2Yy4uYmEwYjNlYWQxNTBmIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zb255LWFjeDU2NWFrbS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNvbnktYWN4NTY1YWttLmMKPiBAQCAtNjI5LDcgKzYyOSw3
IEBAIHN0YXRpYyBpbnQgYWN4NTY1YWttX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCj4g
ICAJbGNkLT5zcGkgPSBzcGk7Cj4gICAJbXV0ZXhfaW5pdCgmbGNkLT5tdXRleCk7Cj4gICAKPiAt
CWxjZC0+cmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0KCZzcGktPmRldiwgInJlc2V0IiwgR1BJ
T0RfT1VUX0xPVyk7Cj4gKwlsY2QtPnJlc2V0X2dwaW8gPSBkZXZtX2dwaW9kX2dldCgmc3BpLT5k
ZXYsICJyZXNldCIsIEdQSU9EX09VVF9ISUdIKTsKPiAgIAlpZiAoSVNfRVJSKGxjZC0+cmVzZXRf
Z3BpbykpIHsKPiAgIAkJZGV2X2Vycigmc3BpLT5kZXYsICJmYWlsZWQgdG8gZ2V0IHJlc2V0IEdQ
SU9cbiIpOwo+ICAgCQlyZXR1cm4gUFRSX0VSUihsY2QtPnJlc2V0X2dwaW8pOwo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
