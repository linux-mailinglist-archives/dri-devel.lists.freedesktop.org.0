Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76612A918D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF616EE24;
	Fri,  6 Nov 2020 08:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BF56ED23
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 13:50:57 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t13so1622428ljk.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 05:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rVeMayhPAIlsOkSvb4nuohXgqZynnes1X57YaEIU5uA=;
 b=Ddasc07+hJetg84HtPv08IWqTsehHI7PYy/jeaGYIJMoDTXsEyExRWysvl+tTQ41bV
 /j2IxQQVm0ZteUx0q9GRqWbGelcZmQqeTBU1e610olL21Mx9kCKCXpeD7yv+fBPhPss5
 JWaQSemcWu5a8N9oDcUPCtBRuEIam3SgIHjjL89rTHiS3g4tYrAgdbrD5yzq9B8oRV+R
 X49313jTw0H8+KNYPD17gwxEtzw2VFyHhb7tPlXimQMeln2atdQZ8+ifIA9+5H+QsPhw
 hXyq5ZtYxsMvnQTN+u8ByDguczGT5kPsEMzrxKxg8FUybmkzS3pehHwaSTMlDMRYoSUG
 Bgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rVeMayhPAIlsOkSvb4nuohXgqZynnes1X57YaEIU5uA=;
 b=Zp4Vk9TyVM3bO98MlmqCq3CfH3n0dk5cjKmpC6DfkeosgMXihlP/tL1d+pR87Zps/6
 I7I6iup1QNcCQ0Hm2hLzOG2Q2QuvW3I6eWheJoOD0xC5xmo9AcfXUmzrG35FbjD8DK0D
 StjCxafO6JOrn0r6SYi+yW2amd9ifr67kpuclXIjRk7btjpgaz0CO+dkX6wUlSpR4ohR
 86B7i3fgqObEhT8t8UdXgfAmW8Ex/LDduRS4jpUFMuxfgbOw0ji95PRAaph/Z1TwmgT7
 S0LWGn+iumBNObIGLAc4lvtSrglcKFQWutUONLqOTMzRwLpc+Q33O8SF6yW47a5VN0Ki
 /4cA==
X-Gm-Message-State: AOAM533X8CP8/Z8KRfu30ksJjUbqEqe/UZnFtY0IZGCEnn3yuiliDXz8
 piHryp/J8Iojl1ZoccL5Kyk=
X-Google-Smtp-Source: ABdhPJx9t/7UR0Azd8ghUvjNKS2td2e/Pij/noR4yugPoL3tOZYg7hWUhrN+++nNm81CO2+OQJZQJw==
X-Received: by 2002:a2e:9618:: with SMTP id v24mr859390ljh.51.1604584256138;
 Thu, 05 Nov 2020 05:50:56 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.googlemail.com with ESMTPSA id z15sm186420lfd.79.2020.11.05.05.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 05:50:55 -0800 (PST)
Subject: Re: [PATCH v7 36/47] memory: tegra20-emc: Add devfreq support
To: Chanwoo Choi <cw00.choi@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Mikko Perttunen
 <cyndis@kapsi.fi>, Viresh Kumar <vireshk@kernel.org>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20201104164923.21238-1-digetx@gmail.com>
 <CGME20201104165200epcas1p1c8f692fa2d5a01c01e4f8aca55462fb2@epcas1p1.samsung.com>
 <20201104164923.21238-37-digetx@gmail.com>
 <95e289fc-210c-1f8d-1b24-36e33ce96deb@samsung.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <05fbab83-517f-a0e3-24db-358bfc367d5b@gmail.com>
Date: Thu, 5 Nov 2020 16:50:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <95e289fc-210c-1f8d-1b24-36e33ce96deb@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMTEuMjAyMCAwNTozMCwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4gT24gMTEvNS8yMCAx
OjQ5IEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IEFkZCBkZXZmcmVxIHN1cHBvcnQgdG8g
dGhlIFRlZ3JhMjAgRU1DIGRyaXZlci4gTWVtb3J5IHV0aWxpemF0aW9uCj4+IHN0YXRpc3RpY3Mg
d2lsbCBiZSBwZXJpb2RpY2FsbHkgcG9sbGVkIGZyb20gdGhlIG1lbW9yeSBjb250cm9sbGVyIGFu
ZAo+PiBhcHByb3ByaWF0ZSBtaW5pbXVtIGNsb2NrIHJhdGUgd2lsbCBiZSBzZWxlY3RlZCBieSB0
aGUgZGV2ZnJlcSBnb3Zlcm5vci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtv
IDxkaWdldHhAZ21haWwuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvbWVtb3J5L3RlZ3JhL0tjb25m
aWcgICAgICAgfCAgMiArCj4+ICBkcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTIwLWVtYy5jIHwg
OTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDk0
IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVtb3J5L3RlZ3JhL0tj
b25maWcgYi9kcml2ZXJzL21lbW9yeS90ZWdyYS9LY29uZmlnCj4+IGluZGV4IGFjM2RmZTE1NTUw
NS4uNzZlOWEzYjEwODM5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL21lbW9yeS90ZWdyYS9LY29u
ZmlnCj4+ICsrKyBiL2RyaXZlcnMvbWVtb3J5L3RlZ3JhL0tjb25maWcKPj4gQEAgLTEyLDYgKzEy
LDggQEAgY29uZmlnIFRFR1JBMjBfRU1DCj4+ICAJdHJpc3RhdGUgIk5WSURJQSBUZWdyYTIwIEV4
dGVybmFsIE1lbW9yeSBDb250cm9sbGVyIGRyaXZlciIKPj4gIAlkZWZhdWx0IHkKPj4gIAlkZXBl
bmRzIG9uIFRFR1JBX01DICYmIEFSQ0hfVEVHUkFfMnhfU09DCj4+ICsJc2VsZWN0IERFVkZSRVFf
R09WX1NJTVBMRV9PTkRFTUFORAo+PiArCXNlbGVjdCBQTV9ERVZGUkVRCj4+ICAJc2VsZWN0IFBN
X09QUAo+IAo+IG5pdHBpY2suIElmIHlvdSBzZWxlY3QgUE1fREVWRlJFUSwgZG9uJ3QgbmVlZCB0
byBzZWxlY3QgJ1BNX09QUCcKPiBiYWNhdXNlIFBNX0RFVkZSRVEgdXNlIE9QUCBhcyBtYW5kYXRv
cnkgd2l0aCAnc2VsZWN0IFBNX09QUCcgaW4gS2NvbmZpZy4KCk9rCgouLi4KPj4gK3N0YXRpYyBp
bnQgdGVncmFfZW1jX2RldmZyZXFfaW5pdChzdHJ1Y3QgdGVncmFfZW1jICplbWMpCj4+ICt7Cj4+
ICsJaW50IGVycjsKPj4gKwo+PiArCS8qCj4+ICsJICogUFdSX0NPVU5UIGlzIDEvMiBvZiBQV1Jf
Q0xPQ0tTIGF0IG1heCwgYW5kIHRodXMsIHRoZSB1cC10aHJlc2hvbGQKPj4gKwkgKiBzaG91bGQg
YmUgbGVzcyB0aGFuIDUwLiAgU2Vjb25kbHksIG11bHRpcGxlIGFjdGl2ZSBtZW1vcnkgY2xpZW50
cwo+PiArCSAqIG1heSBjYXVzZSBvdmVyIDIwJSBvZiBsb3N0IGNsb2NrIGN5Y2xlcyBkdWUgdG8g
c3RhbGxzIGNhdXNlZCBieQo+PiArCSAqIGNvbXBldGluZyBtZW1vcnkgYWNjZXNzZXMuICBUaGlz
IG1lYW5zIHRoYXQgdGhyZXNob2xkIHNob3VsZCBiZQo+PiArCSAqIHNldCB0byBhIGxlc3MgdGhh
biAzMCBpbiBvcmRlciB0byBoYXZlIGEgcHJvcGVybHkgd29ya2luZyBnb3Zlcm5vci4KPj4gKwkg
Ki8KPj4gKwllbWMtPm9uZGVtYW5kX2RhdGEudXB0aHJlc2hvbGQgPSAyMDsKPj4gKwo+PiArCS8q
Cj4+ICsJICogUmVzZXQgc3RhdGlzdGljIGdhdGhlcnMgc3RhdGUsIHNlbGVjdCBnbG9iYWwgYmFu
ZHdpZHRoIGZvciB0aGUKPj4gKwkgKiBzdGF0aXN0aWNzIGNvbGxlY3Rpb24gbW9kZSBhbmQgc2V0
IGNsb2NrcyBjb3VudGVyIHNhdHVyYXRpb24KPj4gKwkgKiBsaW1pdCB0byBtYXhpbXVtLgo+PiAr
CSAqLwo+PiArCXdyaXRlbF9yZWxheGVkKDB4MDAwMDAwMDAsIGVtYy0+cmVncyArIEVNQ19TVEFU
X0NPTlRST0wpOwo+PiArCXdyaXRlbF9yZWxheGVkKDB4MDAwMDAwMDAsIGVtYy0+cmVncyArIEVN
Q19TVEFUX0xMTUNfQ09OVFJPTCk7Cj4+ICsJd3JpdGVsX3JlbGF4ZWQoMHhmZmZmZmZmZiwgZW1j
LT5yZWdzICsgRU1DX1NUQVRfUFdSX0NMT0NLX0xJTUlUKTsKPj4gKwo+PiArCWVtYy0+ZGV2ZnJl
cSA9IGRldmZyZXFfYWRkX2RldmljZShlbWMtPmRldiwgJnRlZ3JhX2VtY19kZXZmcmVxX3Byb2Zp
bGUsCj4+ICsJCQkJCSAgREVWRlJFUV9HT1ZfU0lNUExFX09OREVNQU5ELAo+PiArCQkJCQkgICZl
bWMtPm9uZGVtYW5kX2RhdGEpOwo+IAo+IERvIHlvdSB3YW50IHRvIHVzZSAnZGV2ZnJlcV9hZGRf
ZGV2aWNlJyBpbnN0ZWFkIG9mCj4gJ2Rldm1fZGV2ZnJlcV9hZGRfZGV2aWNlKCknPyBJZiB5b3Ug
aGF2ZSB0byB1c2UgJ2RldmZyZXFfYWRkX2RldmljZScKPiBkdWUgdG8gc29tZSByZWFzb24sIHlv
dSBuZWVkIHRvIGNhbGwgJ2RldmZyZXFfcmVtb3ZlX2RldmljZScgb24gZXhpdC4KClRoZSByZWFz
b24gSSBkaWRuJ3QgdXNlIHRoZSBkZXZtIGhlcmUgaXMgYmVjYXVzZSB0aGUgRU1DLWNsayBjYWxs
YmFjawpzaG91bGQgYmUgdW5yZWdpc3RlcmVkICphZnRlciogZGV2ZnJlcSBpcyByZW1vdmVkLgoK
VGhpbmtpbmcgYSBiaXQgbW9yZSBhYm91dCBpdCwgSSBndWVzcyB0aGUgYmVzdCB2YXJpYW50IHdp
bGwgYmUgdG8gYWRkCmRldm0gc3VwcG9ydCB0byB0aGUgY2xrIGNhbGxiYWNrIHJlZ2lzdHJhdGlv
biBhbmQgdGhlbiBpdCBzaG91bGQgYmUKcG9zc2libGUgdG8gdXNlIGRldm0gZm9yIHRoZSBkZXZm
cmVxLiBJJ2xsIHRyeSB0byBpbXBsZW1lbnQgaXQgaW4gdjgsCnRoYW5rcy4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
