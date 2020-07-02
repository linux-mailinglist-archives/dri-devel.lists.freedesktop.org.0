Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB051211CBF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89A76EA53;
	Thu,  2 Jul 2020 07:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA43E6E203
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 05:53:12 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id s16so9761414lfp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 22:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cwHCT7cT5X5SdEciMo4uCbOZCo5n65PfdpAKlH+e0hw=;
 b=FaeLrB1PxfX9Rsw/lPFjelWqksRrbsEITJFJeCizLaLwdP9ptRy3tMKhctrK9R6CYb
 A8nh51VNmcK5plrXDtyDG9ONNrRVmwEZg4d5jOjyn1M7Zv4yuzv20vCqUTpCv/UN9reM
 0J/Aazqbh2YVku/j72RTB/OKgDHo7woJWRAIO6VM/4mO7P4+I1UarkTpQJAEdcdm8IMv
 PM2DtVEx29/IgoQkPD/+MH1lNZuzUFdPpgXpks+P8GcvoLFDytKBUI6boI6c9HtXeE9F
 An8Rj/UTes1byT+HZCjUEHlF/XLw+3G/BRf8oiXykibH0xR8E5u9VsawaRpJJYhAdc4Z
 X2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cwHCT7cT5X5SdEciMo4uCbOZCo5n65PfdpAKlH+e0hw=;
 b=MbGvP1Of4b5yANAUSBx4lydk1aapZUUcyGyrrLIpL3aytHJOgIwO/zWsK0/CwChGzy
 DyCdIGFWVh5dwdM4kwTn6JMojHsxugNMtjLyiMQ4KlaNNGLs4u54XjvPZe9mnCweS8tS
 nMwTO3+J49Ya7hVMS4X1lFgtILYJEGoHo/42UhkK5XUt9Nw6GcT48HD2/3j7zuLbfBYw
 lUurqGwlyuYOr+JqGYp+KUTn55PeJ2goqasgf8eS2EHEsn7s6ZslC79TANqauuEP5KEd
 EAcSPl+tdEjB49Y7ziemUCWwjV5UXHA9GhxGfSIjeVsCKjYEXe4MU/Pb1JhS1Q8hTpih
 aN7Q==
X-Gm-Message-State: AOAM532RfI+Gyh8aFXZ4dICnRZpIegR8bV/Nr96SRLtGWbmH2Xh6TTm+
 aRBjiOF1CzrvvKh4o4UuH9E=
X-Google-Smtp-Source: ABdhPJwavK+SIIiWOV66MVXkfysc7JQV+BS31nbzvmYL6xd58vIGpeeocZo16IZXV41yYLdjSkOmXw==
X-Received: by 2002:a19:691c:: with SMTP id e28mr17498281lfc.131.1593669189870; 
 Wed, 01 Jul 2020 22:53:09 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id c27sm2939944lfm.56.2020.07.01.22.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 22:53:09 -0700 (PDT)
Subject: Re: [PATCH v4 12/37] PM / devfreq: tegra20: Use MC timings for
 building OPP table
From: Dmitry Osipenko <digetx@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131458epcas1p2c774a0302bcef2c02790c2cb8cad57a0@epcas1p2.samsung.com>
 <20200609131404.17523-13-digetx@gmail.com>
 <4ea7fe00-7676-3186-8222-6e0d0eb8ed1f@samsung.com>
 <4b22d3ee-f303-d81d-e261-187d4a46e749@gmail.com>
 <2069fb51-f043-795d-7768-0024fc9a9f4e@samsung.com>
 <7988b6cf-e60c-7e5c-ffc3-8075c20af3d3@gmail.com>
Message-ID: <388eef55-3452-064b-8560-e9d65b908525@gmail.com>
Date: Thu, 2 Jul 2020 08:53:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7988b6cf-e60c-7e5c-ffc3-8075c20af3d3@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDIuMDcuMjAyMCAwODo0MywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMDIuMDcuMjAy
MCAwODozMCwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4+IE9uIDcvMi8yMCAyOjA3IFBNLCBE
bWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+PiAwMi4wNy4yMDIwIDA3OjE4LCBDaGFud29vIENob2kg
0L/QuNGI0LXRgjoKPj4+PiBIaSBEbWl0cnksCj4+Pj4KPj4+PiBPbiA2LzkvMjAgMTA6MTMgUE0s
IERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+Pj4gVGhlIGNsa19yb3VuZF9yYXRlKCkgd29uJ3Qg
YmUgdXNhYmxlIGZvciBidWlsZGluZyBPUFAgdGFibGUgb25jZQo+Pj4+PiBpbnRlcmNvbm5lY3Qg
c3VwcG9ydCB3aWxsIGJlIGFkZGVkIHRvIHRoZSBFTUMgZHJpdmVyIGJlY2F1c2UgdGhhdCBDTEsg
QVBJCj4+Pj4+IGZ1bmN0aW9uIGxpbWl0cyB0aGUgcm91bmRlZCByYXRlIGJhc2VkIG9uIHRoZSBj
bGsgcmF0ZSB0aGF0IGlzIGltcG9zZWQgYnkKPj4+Pj4gYWN0aXZlIGNsay11c2VycywgYW5kIHRo
dXMsIHRoZSByb3VuZGluZyB3b24ndCB3b3JrIGFzIGV4cGVjdGVkIGlmCj4+Pj4+IGludGVyY29u
bmVjdCB3aWxsIHNldCB0aGUgbWluaW11bSBFTUMgY2xvY2sgcmF0ZSBiZWZvcmUgZGV2ZnJlcSBk
cml2ZXIgaXMKPj4+Pj4gbG9hZGVkLiBUaGUgc3RydWN0IHRlZ3JhX21jIGNvbnRhaW5zIG1lbW9y
eSB0aW1pbmdzIHdoaWNoIGNvdWxkIGJlIHVzZWQgYnkKPj4+Pj4gdGhlIGRldmZyZXEgZHJpdmVy
IGZvciBidWlsZGluZyB1cCBPUFAgdGFibGUgaW5zdGVhZCBvZiByb3VuZGluZyBjbG9jawo+Pj4+
PiByYXRlLCB0aGlzIHBhdGNoIGltcGxlbWVudHMgdGhpcyBpZGVhLgo+Pj4+Pgo+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+Pj4+IC0tLQo+
Pj4+PiAgZHJpdmVycy9kZXZmcmVxL3RlZ3JhMjAtZGV2ZnJlcS5jIHwgMTggKysrKysrKysrKyst
LS0tLS0tCj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZGV2ZnJlcS90ZWdyYTIwLWRl
dmZyZXEuYyBiL2RyaXZlcnMvZGV2ZnJlcS90ZWdyYTIwLWRldmZyZXEuYwo+Pj4+PiBpbmRleCA2
NDY5ZGM2OWM1ZTAuLmJmNTA0Y2E0ZGVhMiAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9kZXZm
cmVxL3RlZ3JhMjAtZGV2ZnJlcS5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZGV2ZnJlcS90ZWdyYTIw
LWRldmZyZXEuYwo+Pj4+PiBAQCAtMTIzLDggKzEyMyw3IEBAIHN0YXRpYyBpbnQgdGVncmFfZGV2
ZnJlcV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Pj4+PiAgewo+Pj4+PiAg
CXN0cnVjdCB0ZWdyYV9kZXZmcmVxICp0ZWdyYTsKPj4+Pj4gIAlzdHJ1Y3QgdGVncmFfbWMgKm1j
Owo+Pj4+PiAtCXVuc2lnbmVkIGxvbmcgbWF4X3JhdGU7Cj4+Pj4+IC0JdW5zaWduZWQgbG9uZyBy
YXRlOwo+Pj4+PiArCXVuc2lnbmVkIGludCBpOwo+Pj4+PiAgCWludCBlcnI7Cj4+Pj4+ICAKPj4+
Pj4gIAltYyA9IHRlZ3JhX2dldF9tZW1vcnlfY29udHJvbGxlcigpOwo+Pj4+PiBAQCAtMTUxLDEy
ICsxNTAsMTcgQEAgc3RhdGljIGludCB0ZWdyYV9kZXZmcmVxX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4+Pj4+ICAKPj4+Pj4gIAl0ZWdyYS0+cmVncyA9IG1jLT5yZWdzOwo+
Pj4+PiAgCj4+Pj4+IC0JbWF4X3JhdGUgPSBjbGtfcm91bmRfcmF0ZSh0ZWdyYS0+ZW1jX2Nsb2Nr
LCBVTE9OR19NQVgpOwo+Pj4+PiAtCj4+Pj4+IC0JZm9yIChyYXRlID0gMDsgcmF0ZSA8PSBtYXhf
cmF0ZTsgcmF0ZSsrKSB7Cj4+Pj4+IC0JCXJhdGUgPSBjbGtfcm91bmRfcmF0ZSh0ZWdyYS0+ZW1j
X2Nsb2NrLCByYXRlKTsKPj4+Pj4gKwlpZiAoIW1jLT5udW1fdGltaW5ncykgewo+Pj4+Cj4+Pj4g
Q291bGQgeW91IGV4cGxhaW4gd2hhdCBpcyBtZWFuaW5nIG9mICdudW1fdGltaW5nPwo+Pj4KPj4+
IFRoZSBudW1fdGltaW5ncyBpcyB0aGUgbnVtYmVyIG9mIG1lbW9yeSB0aW1pbmdzIGRlZmluZWQg
aW4gYQo+Pj4gZGV2aWNlLXRyZWUuIE9uZSB0aW1pbmcgY29uZmlndXJhdGlvbiBwZXIgbWVtb3J5
IGNsb2NrIHJhdGUuCj4+Cj4+IE9LLiBJIHVuZGVyc3RhbmQuCj4+Cj4+Pgo+Pj4+IEFsc28sIHdo
eSBhZGQgdGhlIG9wcCBlbnRyeSBpbiBjYXNlIG9mIG1jLT5udW1fdGltaW5ncyBpcyB6ZXJvPwo+
Pj4KPj4+IFRpbWluZ3MgbWF5IGJlIG5vdCBkZWZpbmVkIGluIHNvbWUgZGV2aWNlLXRyZWVzIGF0
IGFsbCBhbmQgaW4gdGhpcyBjYXNlCj4+PiBtZW1vcnkgYWx3YXlzIHJ1bm5pbmcgb24gYSBmaXhl
ZCBjbG9jayByYXRlLgo+Pgo+PiBZb3UgbWVhbiB0aGF0ICd0aW1pbmdzJyBpbmZvcm1hdGlvbiBp
cyBvcHRpb25hbD8KPiAKPiBZZXMKPiAKPiBBY3R1YWxseSwgbG9va3MgbGlrZSBJIG1pc3NlZCB0
byBwcm9wZXJseSB0ZXN0IHRoaXMgY2FzZSB3aGVyZSB0aW1pbmdzCj4gYXJlIG1pc3NpbmcgaW4g
RFQgYW5kIGl0IHNob3VsZG4ndCB3b3JrIHdpdGggdGhlIGN1cnJlbnQgY29kZS4gSSdsbCBmaXgK
PiBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+IAo+Pj4KPj4+IFRoZSBkZXZmcmVxIGRyaXZlciB3
b24ndCBiZSBwcmFjdGljYWxseSB1c2VmdWwgaWYgbWMtPm51bV90aW1pbmdzIGlzCj4+PiB6ZXJv
IHNpbmNlIG1lbW9yeSBmcmVxdWVuY3kgY2FuJ3QgYmUgY2hhbmdlZCwgYnV0IGFueXdheXMgd2Un
ZCB3YW50IHRvCj4+PiBsb2FkIHRoZSBkZXZmcmVxIGRyaXZlciBpbiBvcmRlciB0byBwcmV2ZW50
IGNvbmZ1c2lvbiBhYm91dCB3aHkgaXQncyBub3QKPj4+IGxvYWRlZC4KPj4+Cj4+PiBGb3IgZXhh
bXBsZSwgeW91IG1heSBhc2sgc29tZWJvZHkgdG8gc2hvdyBjb250ZW50cyBvZgo+Pj4gL3N5cy9j
bGFzcy9kZXZmcmVxL3RlZ3JhMjAtZGV2ZnJlcS90cmFuc19zdGF0IGFuZCB0aGUgcGVyc29uIHNh
eXMgdG8geW91Cj4+PiB0aGF0IHRoaXMgZmlsZSBkb2Vzbid0IGV4aXN0LCBub3cgeW91J2xsIGhh
dmUgdG8gZmlndXJlIG91dCB3aGF0Cj4+PiBoYXBwZW5lZCB0byB0aGUgZGV2ZnJlcSBkcml2ZXIu
Cj4+Cj4+IEkgdW5kZXJzdGFuZCB3aHkgYWRkIE9QUCBlbnRyeSBwb2ludCB3aGVuIHRpbWluZyBp
cyBub3QgZGVmaW5lZCBvbiBEVC4KPj4gQnV0LCBhY3R1YWxseSwgSSB0aGluayB0aGF0IHlvdSBi
ZXR0ZXIgdG8gY2hhbmdlICd0aW1pbmdzJyBpbmZvIGlzIG1hbmRhdG9yeQo+PiBpbnN0ZWFkIG9m
IG9wdGlvbmFsLiBCZWNhdXNlIHRoZSBkZXZmcmVxIGRyaXZlciBpcyBmb3IgRFZGUwo+PiBhbmQg
dGhlIGRyaXZlciBzdXBwb3J0aW5nIERWRlMgaGF2ZSB0byBoYXZlIHRoZSBmcmVxdWVuY3kgaW5m
b3JtYXRpb24KPj4gbGlrZSBPUFAuCgpUaGF0J3Mgd2hhdCBJIGluaXRpYWxseSBkaWQgYnkgYmFp
bGluZyBvdXQgZnJvbSBkcml2ZXIncyBwcm9iZSBpZgp0aW1pbmdzIGluZm8gaXMgbWlzc2luZywg
dW50aWwgcmFuIGludG8gYSBzaXR1YXRpb24gZGVzY3JpYmVkIGFib3ZlIDopCgo+PiBPciwgCj4+
IElmIHlvdSB3YW50IHRvIGtlZXAgJ3RpbWluZycgaXMgb3B0aW9uYWwgb24gRFQsCj4+IEkgcmVj
b21tZW5kIHRoYXQgeW91IGFkZCBvbmUgdGltaW5nIGRhdGEgdG8gdGVncmEgbWMgZHJpdmVyCj4+
IHdoZW4gRFQgZG9lc24ndCBpbmNsdWRlIHRoZSBhbnkgdGltaW5nIGluZm9ybWF0aW9uCj4+IEkg
dGhpbmsgdGhhdCBpcyBpdCBtb3JlIGNsZWFyLgo+IAo+IE9rYXksIEknbGwgbW92ZSBpdCBpbnRv
IHRoZSBNQyBkcml2ZXIgaW4gdGhlIG5leHQgdmVyc2lvbi4KPiAKPiBUaGFuayB5b3UgZm9yIHRo
ZSByZXZpZXchCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
