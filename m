Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F54F1A7BD5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 15:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D846E4C9;
	Tue, 14 Apr 2020 13:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BA2026E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 13:09:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30E0130E;
 Tue, 14 Apr 2020 06:09:07 -0700 (PDT)
Received: from [10.57.33.145] (unknown [10.57.33.145])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B89573F73D;
 Tue, 14 Apr 2020 06:09:05 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/panfrost: add devfreq regulator support
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Steven Price <steven.price@arm.com>
References: <20200411200632.4045-1-peron.clem@gmail.com>
 <20200411200632.4045-2-peron.clem@gmail.com>
 <c96f31a2-6ff4-31aa-aaac-2ce9eafb3bfe@arm.com>
 <CAJiuCcegkNGQ7j4jcT1rBpSLqG1c-nb8g0wq+Nbvt-dGj7am2Q@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <729d73c5-2d2d-a2b6-7715-7293744f8f95@arm.com>
Date: Tue, 14 Apr 2020 14:09:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAJiuCcegkNGQ7j4jcT1rBpSLqG1c-nb8g0wq+Nbvt-dGj7am2Q@mail.gmail.com>
Content-Language: en-GB
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNC0xMyAzOjE4IHBtLCBDbMOpbWVudCBQw6lyb24gd3JvdGU6Cj4gSGkgU3RldmVu
LAo+IAo+IE9uIE1vbiwgMTMgQXByIDIwMjAgYXQgMTU6MTgsIFN0ZXZlbiBQcmljZSA8c3RldmVu
LnByaWNlQGFybS5jb20+IHdyb3RlOgo+Pgo+PiBPbiAxMS8wNC8yMDIwIDIxOjA2LCBDbMOpbWVu
dCBQw6lyb24gd3JvdGU6Cj4+PiBPUFAgdGFibGUgY2FuIGRlZmluZWQgYm90aCBmcmVxdWVuY3kg
YW5kIHZvbHRhZ2UuCj4+Pgo+Pj4gUmVnaXN0ZXIgdGhlIG1hbGkgcmVndWxhdG9yIGlmIGl0IGV4
aXN0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBn
bWFpbC5jb20+Cj4+PiAtLS0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kZXZmcmVxLmMgfCAzNCArKysrKysrKysrKysrKysrKystLS0KPj4+ICAgIGRyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCAgfCAgMSArCj4+PiAgICAyIGZpbGVzIGNo
YW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCj4+PiBpbmRleCA2MjU0MWY0ZWRk
ODEuLjJkYzhlMjM1NTM1OCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kZXZmcmVxLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9kZXZmcmVxLmMKPj4+IEBAIC03OCwxMiArNzgsMjYgQEAgaW50IHBhbmZyb3N0X2Rl
dmZyZXFfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPj4+ICAgICAgICBzdHJ1
Y3QgZGV2aWNlICpkZXYgPSAmcGZkZXYtPnBkZXYtPmRldjsKPj4+ICAgICAgICBzdHJ1Y3QgZGV2
ZnJlcSAqZGV2ZnJlcTsKPj4+ICAgICAgICBzdHJ1Y3QgdGhlcm1hbF9jb29saW5nX2RldmljZSAq
Y29vbGluZzsKPj4+ICsgICAgIGNvbnN0IGNoYXIgKm1hbGkgPSAibWFsaSI7Cj4+PiArICAgICBz
dHJ1Y3Qgb3BwX3RhYmxlICpvcHBfdGFibGUgPSBOVUxMOwo+Pj4gKwo+Pj4gKyAgICAgLyogUmVn
dWxhdG9yIGlzIG9wdGlvbmFsICovCj4+PiArICAgICBvcHBfdGFibGUgPSBkZXZfcG1fb3BwX3Nl
dF9yZWd1bGF0b3JzKGRldiwgJm1hbGksIDEpOwo+Pgo+PiBUaGlzIGxvb2tzIGxpa2UgaXQgYXBw
bGllcyBiZWZvcmUgM2UxMzk5YmNjZjUxICgiZHJtL3BhbmZyb3N0OiBBZGQKPj4gc3VwcG9ydCBm
b3IgbXVsdGlwbGUgcmVndWxhdG9ycyIpIHdoaWNoIGlzIGN1cnJlbnRseSBpbiBkcm0tbWlzYy1u
ZXh0Cj4+IChhbmQgbGludXgtbmV4dCkuIFlvdSB3YW50IHNvbWV0aGluZyBtb3JlIGxpa2U6Cj4g
Cj4gVGhhbmtzIGZvciB5b3UgcmV2aWV3LCBpbmRlZWQgSSBkaWRuJ3Qgc2VlIHRoYXQgbXVsdGlw
bGUgcmVndWxhdG9ycwo+IHN1cHBvcnQgaGFzIGJlZW4gYWRkZWQuCj4gV2lsbCB1cGRhdGUgaW4g
djIuCgpBbHRob3VnaCBub3RlIHRoYXQgd2UgcHJvYmFibHkgYWxzbyB3YW50IGEgdmVyc2lvbiB0
aGF0IGNhbiBiZSAKYmFja3BvcnRlZCB0byBzdGFibGUgd2l0aG91dCB0aGF0IGRlcGVuZGVuY3ks
IHNpbmNlIHRoaXMgYmVoYXZpb3VyIGlzIAphcmd1YWJseSBhIHJlZ3Jlc3Npb24gc2luY2UgMjIx
YmM3NzkxNGNiICgiZHJtL3BhbmZyb3N0OiBVc2UgZ2VuZXJpYyAKY29kZSBmb3IgZGV2ZnJlcSIp
LCBhbmQgZG9lcyBhcHBlYXIgdG8gaGF2ZSBiZWVuIGNhdXNpbmcgc3VidGxlIHByb2JsZW1zIApm
b3IgdXNlcnMuCgpSb2Jpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
