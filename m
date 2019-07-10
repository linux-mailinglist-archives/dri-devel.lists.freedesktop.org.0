Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4439B65273
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 09:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAA9896ED;
	Thu, 11 Jul 2019 07:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896586E114
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 16:03:06 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k18so2616488ljc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 09:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lLmMkhctNEuFU/NWee/rLpEm39VeDGOXHzQDHvN/6EY=;
 b=k4qdL/vxVphYTFT62XAx3/AuyWkei8niuNWH9AOZRJWuql5HlloQaRrDRJrmoAz+Xq
 fT1sGHv/e45p5Npn/V0bK/QRxHVXadZdhCH6muzyqcrr1NQe0PmJwqtkPvNjVrPUL6ys
 mcF0r8Cc60+C9zTv8WjZJ+KX3FLsZWLa4gsWYfRg3SUOVEJT2Amiwk9ajIhzhJGmo+us
 e06e772rAu2AA9gUcJwAFP11Uxt7Eosu5uujsZa5CAZ/7YRrWaN7dOZN+uDbcsfFygk8
 22tvUfvQZtOeQ71BUnAsEFnpmpwSempFR/3EgL7rXaZ2vs61SZiZEXOpfeKe043uG83U
 qR0g==
X-Gm-Message-State: APjAAAVzszBigQ7tKmGUjQlL7znKg1DSR2bukHAtzNqBV7bfWZzMfdjT
 FrIQnXstONYQrel6ixiP3uY=
X-Google-Smtp-Source: APXvYqx96rnUQTsomSZgymS/cSn16dapx8+CRxKVlAnq4xASCJqCh4A+Y5s4lFuEgrTSZN3XuqiTQQ==
X-Received: by 2002:a2e:9d8a:: with SMTP id c10mr15473673ljj.147.1562774585004; 
 Wed, 10 Jul 2019 09:03:05 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.googlemail.com with ESMTPSA id t25sm413719lfg.7.2019.07.10.09.03.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 09:03:04 -0700 (PDT)
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
From: Dmitry Osipenko <digetx@gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <20190709145151.23086-1-digetx@gmail.com>
 <20190710101229.54ufuhmh22dfxclr@flea>
 <4ad69d15-07f8-9753-72d6-a51402c94c20@gmail.com>
 <20190710125552.qvmnh6qs63ikiu2k@flea>
 <f530844d-70f2-c3cc-d5f6-b435f1dbdfd2@gmail.com>
 <20190710130615.gvi2jwgr2cds66xr@flea>
 <75719cad-c65c-7ebc-3ea8-98134f86ddc3@gmail.com>
 <4a13f12f-05a7-473e-4e4e-7a7e32d09720@gmail.com>
 <20190710140504.t5lsk36gnn5cdn6b@flea>
 <e7d78307-4a48-45b1-ffbe-bc397fec0e40@gmail.com>
 <2b17baa6-0d16-acac-f626-51799f0d3293@gmail.com>
Message-ID: <5b6bc04d-391e-3370-ffe5-17094ae4b365@gmail.com>
Date: Wed, 10 Jul 2019 19:03:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <2b17baa6-0d16-acac-f626-51799f0d3293@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 11 Jul 2019 07:23:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lLmMkhctNEuFU/NWee/rLpEm39VeDGOXHzQDHvN/6EY=;
 b=sQ8w4vB3vSSSnSSYSg6EQMicHo3+SIxaVI/Vim0+5d+LgR3sk6ohsUDnCq45RH98Wh
 g/prrYculst+mQNxN6577hhFE2ZnRV/dGejnhJi5m+IL8aWdO40RvlPo3Hlx6Ebj5zIK
 Z9P/xymgI822DhULMO3zviWbZYobAnhVTAc7bILNPTauET4Xwu/K56ZelNcnu5Jol6Hq
 kIXa3BBFszmIpErbA41AcYMJTkgnyjBUxu4zJl67FiJg7SFPb8+RPgVEKiy8KiObfTbv
 YxhfzT+UlpSng0XwxhPcu3i2ACIw31aEyVjSjn5xIdSdy7nwrWg34WFg8AVS1dScTMpC
 mXDA==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTAuMDcuMjAxOSAxODo0NSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMTAuMDcuMjAx
OSAxODowNSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+IDEwLjA3LjIwMTkgMTc6MDUs
IE1heGltZSBSaXBhcmQg0L/QuNGI0LXRgjoKPj4+IE9uIFdlZCwgSnVsIDEwLCAyMDE5IGF0IDA0
OjI5OjE5UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+PiBUaGlzIHdvcmtzOgo+
Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYwo+Pj4+IGluZGV4IDU2ZDM2
Nzc5ZDIxMy4uZTVhMmY5YzhmNDA0IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fY2xpZW50X21vZGVzZXQuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50
X21vZGVzZXQuYwo+Pj4+IEBAIC0xODIsNiArMTgyLDggQEAgZHJtX2Nvbm5lY3Rvcl9waWNrX2Nt
ZGxpbmVfbW9kZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+Pj4+ICAgICAgICAg
bW9kZSA9IGRybV9tb2RlX2NyZWF0ZV9mcm9tX2NtZGxpbmVfbW9kZShjb25uZWN0b3ItPmRldiwg
Y21kbGluZV9tb2RlKTsKPj4+PiAgICAgICAgIGlmIChtb2RlKQo+Pj4+ICAgICAgICAgICAgICAg
ICBsaXN0X2FkZCgmbW9kZS0+aGVhZCwgJmNvbm5lY3Rvci0+bW9kZXMpOwo+Pj4+ICsgICAgICAg
ZWxzZQo+Pj4+ICsgICAgICAgICAgICAgICBjbWRsaW5lX21vZGUtPnNwZWNpZmllZCA9IGZhbHNl
Owo+Pj4KPj4+IEhtbW0sIGl0J3Mgbm90IGNsZWFyIHRvIG1lIHdoeSB0aGF0IHdvdWxkbid0IGJl
IHRoZSBjYXNlLgo+Pj4KPj4+IElmIHdlIGNvbWUgYmFjayB0byB0aGUgYmVnaW5uaW5nIG9mIHRo
YXQgZnVuY3Rpb24sIHdlIHJldHJpZXZlIHRoZQo+Pj4gY21kbGluZV9tb2RlIGJ1ZmZlciBmcm9t
IHRoZSBjb25uZWN0b3IgcG9pbnRlciwgdGhhdCB3aWxsIHByb2JhYmx5Cj4+PiBoYXZlIGJlZW4g
cGFyc2VkIGEgZmlyc3QgdGltZSB1c2luZyBkcm1fbW9kZV9jcmVhdGVfZnJvbV9jbWRsaW5lX21v
ZGUKPj4+IGluIGRybV9oZWxwZXJfcHJvYmVfYWRkX2NtZGxpbmVfbW9kZS4KPj4+Cj4+PiBOb3cs
IEknbSBndWVzc2luZyB0aGF0IHRoZSBpc3N1ZSBpcyB0aGF0IGluCj4+PiBkcm1fbW9kZV9wYXJz
ZV9jb21tYW5kX2xpbmVfZm9yX2Nvbm5lY3RvciwgaWYgd2UgaGF2ZSBhIG5hbWVkIG1vZGUsIHdl
Cj4+PiBqdXN0IGNvcHkgdGhlIG1vZGUgb3ZlciBhbmQgc2V0IG1vZGUtPnNwZWNpZmllZC4KPj4+
Cj4+PiBBbmQgd2UgdGhlbiBtb3ZlIG92ZXIgdG8gZG8gb3RoZXIgY2hlY2tzLCBhbmQgdGhhdCdz
IHByb2JhYmx5IHdoYXQKPj4+IGZhaWxzIGFuZCByZXR1cm5zLCBidXQgb3VyIGRybV9jbWRsaW5l
X21vZGUgd2lsbCBoYXZlIGJlZW4gbW9kaWZpZWQuCj4+Pgo+Pj4gSSdtIG5vdCBlbnRpcmVseSBz
dXJlIGhvdyB0byBkZWFsIHdpdGggdGhhdCB0aG91Z2guCj4+Pgo+Pj4gSSBndWVzcyB3ZSBjb3Vs
ZCBhbGxvY2F0ZSBhIGRybV9jbWRsaW5lX21vZGUgc3RydWN0dXJlIG9uIHRoZSBzdGFjaywKPj4+
IGZpbGwgdGhhdCwgYW5kIGlmIHN1Y2Nlc3NmdWwgY29weSBvdmVyIGl0cyBjb250ZW50IHRvIHRo
ZSBvbmUgaW4KPj4+IGRybV9jb25uZWN0b3IuIFRoYXQgd291bGQgYWxsb3cgdXMgdG8gb25seSBj
aGFuZ2UgdGhlIGNvbnRlbnQgb24KPj4+IHN1Y2Nlc3MsIHdoaWNoIGlzIHdoYXQgSSB3b3VsZCBl
eHBlY3QgZnJvbSBzdWNoIGEgZnVuY3Rpb24/Cj4+Pgo+Pj4gSG93IGRvZXMgdGhhdCBzb3VuZD8K
Pj4KPj4gSSBub3cgc2VlIHRoYXQgdGhlcmUgaXMgRFJNX01PREVfVFlQRV9VU0VSREVGIGZsYWcg
dGhhdCBpcyBhc3NpZ25lZCBvbmx5Cj4+IGZvciB0aGUgImNtZGxpbmUiIG1vZGUgYW5kIGRybV9j
bGllbnRfcm90YXRpb24oKSBpcyB0aGUgb25seSBwbGFjZSBpbgo+PiBEUk0gY29kZSB0aGF0IGNh
cmVzIGFib3V0IHdoZXRoZXIgbW9kZSBpcyBmcm9tIGNtZGxpbmUsIGhlbmNlIGxvb2tzIGxpa2UK
Pj4gaXQgd2lsbCBiZSBtb3JlIGNvcnJlY3QgdG8gZG8gdGhlIGZvbGxvd2luZzoKPj4KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYwo+PiBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYwo+PiBpbmRleCA1NmQzNjc3OWQyMTMuLmU1
YjNiZTllZDY4OSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9k
ZXNldC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYwo+PiBA
QCAtODI1LDYgKzgyNSw3IEBAIGJvb2wgZHJtX2NsaWVudF9yb3RhdGlvbihzdHJ1Y3QgZHJtX21v
ZGVfc2V0Cj4+ICptb2Rlc2V0LCB1bnNpZ25lZCBpbnQgKnJvdGF0aW9uKQo+PiAgewo+PiAgICAg
ICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IgPSBtb2Rlc2V0LT5jb25uZWN0b3Jz
WzBdOwo+PiAgICAgICAgIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lID0gbW9kZXNldC0+Y3J0Yy0+
cHJpbWFyeTsKPj4gKyAgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSA9IG1vZGVz
ZXQtPm1vZGU7Cj4+ICAgICAgICAgc3RydWN0IGRybV9jbWRsaW5lX21vZGUgKmNtZGxpbmU7Cj4+
ICAgICAgICAgdTY0IHZhbGlkX21hc2sgPSAwOwo+PiAgICAgICAgIHVuc2lnbmVkIGludCBpOwo+
PiBAQCAtODU5LDcgKzg2MCw3IEBAIGJvb2wgZHJtX2NsaWVudF9yb3RhdGlvbihzdHJ1Y3QgZHJt
X21vZGVfc2V0Cj4+ICptb2Rlc2V0LCB1bnNpZ25lZCBpbnQgKnJvdGF0aW9uKQo+PiAgICAgICAg
ICAqIHNpbXBsZSBYT1IgYmV0d2VlbiB0aGUgdHdvIGhhbmRsZSB0aGUgYWRkaXRpb24gbmljZWx5
Lgo+PiAgICAgICAgICAqLwo+PiAgICAgICAgIGNtZGxpbmUgPSAmY29ubmVjdG9yLT5jbWRsaW5l
X21vZGU7Cj4+IC0gICAgICAgaWYgKGNtZGxpbmUtPnNwZWNpZmllZCkgewo+PiArICAgICAgIGlm
IChtb2RlLT5mbGFncyAmIERSTV9NT0RFX1RZUEVfVVNFUkRFRikgewo+PiAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IGNtZGxpbmVfcmVzdCwgcGFuZWxfcmVzdDsKPj4gICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBjbWRsaW5lX3JvdCwgcGFuZWxfcm90Owo+PiAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IHN1bV9yb3QsIHN1bV9yZXN0Owo+Pgo+IAo+IEFsdGhvdWdoLCB0aGVu
IHJvdGF0aW9uIHdvbid0IGJlIGFwcGxpZWQgdG8gdGhlIG5hbWVkIG1vZGUgaW4gdGhhdCBjYXNl
Lgo+IAo+IFNlZW1zIHRoZSBmaXggY291bGQgYmUgZXZlbiBzaW1wbGVyOgo+IAo+IEBAIC04NTks
NyArODU5LDcgQEAgYm9vbCBkcm1fY2xpZW50X3JvdGF0aW9uKHN0cnVjdCBkcm1fbW9kZV9zZXQK
PiAqbW9kZXNldCwgdW5zaWduZWQgaW50ICpyb3RhdGlvbikKPiAgICAgICAgICAqIHNpbXBsZSBY
T1IgYmV0d2VlbiB0aGUgdHdvIGhhbmRsZSB0aGUgYWRkaXRpb24gbmljZWx5Lgo+ICAgICAgICAg
ICovCj4gICAgICAgICBjbWRsaW5lID0gJmNvbm5lY3Rvci0+Y21kbGluZV9tb2RlOwo+IC0gICAg
ICAgaWYgKGNtZGxpbmUtPnNwZWNpZmllZCkgewo+ICsgICAgICAgaWYgKGNtZGxpbmUtPnNwZWNp
ZmllZCAmJiBjbWRsaW5lLT5yb3RhdGlvbl9yZWZsZWN0aW9uKSB7Cj4gICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBjbWRsaW5lX3Jlc3QsIHBhbmVsX3Jlc3Q7Cj4gICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBjbWRsaW5lX3JvdCwgcGFuZWxfcm90Owo+ICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgc3VtX3JvdCwgc3VtX3Jlc3Q7Cj4gCj4gQW5kIGxvb2tzIGxpa2UgdGhlcmUg
aXMgYW5vdGhlciBwcm9ibGVtIGhlcmUuLiB0aGUgY21kbGluZSdzIHJvdGF0aW9uCj4gb3ZlcnJp
ZGVzICphbGwqIG1vZGVzIHdoaWxlIHRoZSBkb2MvZmIvbW9kZWRiLnJzdCBjbGFpbXMgdGhhdCBy
b3RhdGlvbgo+IGlzIGFwcGxpZWQgb25seSB0byB0aGUgKmluaXRpYWwqIG1vZGUuCj4gCgpBY3R1
YWxseSwgSSB3YXMgd3JvbmcgaGVyZS4gVGhpcyByb3RhdGlvbiBpcyBnZXR0aW5nIGFwcGxpZWQg
b25seSB0byB0aGUKZnJhbWVidWZmZXIncyBjb25zb2xlLCBzbyBsb29rcyBmaW5lLgoKSSBndWVz
cyBpdCdzIGFsc28gb2theSB0byBqdXN0IGtlZXAgYXBwbHlpbmcgY21kbGluZSdzIHJvdGF0aW9u
IGV2ZW4gaWYKdGhlIG1vZGUgaXMgaW52YWxpZC4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBo
YXZlIGFueSBvYmplY3Rpb25zLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
