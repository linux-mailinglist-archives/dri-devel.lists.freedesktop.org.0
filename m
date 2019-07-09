Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7422D6395A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 18:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EBE89688;
	Tue,  9 Jul 2019 16:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AD6896C4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 16:27:36 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d24c07c0000>; Tue, 09 Jul 2019 09:27:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 09 Jul 2019 09:27:35 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 09 Jul 2019 09:27:35 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Jul
 2019 16:27:34 +0000
Subject: Re: [PATCH v1] drm/tegra: Fix gpiod_get_from_of_node() regression
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>
References: <20190705151139.19032-1-digetx@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <9425f0e8-36ec-76cb-b177-fa486fcafc19@nvidia.com>
Date: Tue, 9 Jul 2019 17:27:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705151139.19032-1-digetx@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1562689660; bh=eiMzdExQqfXSHcpxt0RmPgRZdbS5a+9W8kuVpeJfT2c=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=dx1hthAf1o0tT3KQdGbZYxZ3xITziFcwzhbVcVlCGqjCi/pXXZcY0f+Juxw7JzeXG
 eiFsootJn9+BVTyUxsLp+tS5HJ/z4SOR2RK5TL4kr+1ia/YIBULICdwqpC9HJbidxl
 PEHODPxSDzE/aBh3WSRjb0ntsQf+Y8d2VnwvDfbCaT/4+AcZGz5v423d3smJzDiXp0
 1JaK5aMrkeeRNdhkArKkkVN2wLWgseC1bXG5S6MUKrBCcA2ZtNKfUZuBDIHKXoUvpY
 yRqpsCiQnPZ/FSqdzYqCaBcj8EU/lovtZkh6h7CJKsB1y6kKEs1LFV/gQd4yt43MJN
 U+eLjK17qMMTg==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA1LzA3LzIwMTkgMTY6MTEsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiBUaGF0IGZ1bmN0
aW9uIG5vdyByZXR1cm5zIEVSUl9QVFIgaW5zdGVhZCBvZiBOVUxMIGlmICJocGQtZ3BpbyIgaXMg
bm90Cj4gcHJlc2VudCBpbiBkZXZpY2UtdHJlZS4gVGhlIG9mZmVuZGluZyBwYXRjaCBtaXNzZWQg
dG8gYWRhcHQgdGhlIFRlZ3JhJ3MKPiBEUk0gZHJpdmVyIGZvciB0aGUgQVBJIGNoYW5nZS4KPiAK
PiBGaXhlczogMDI1YmYzNzcyNWYxICgiZ3BpbzogRml4IHJldHVybiB2YWx1ZSBtaXNtYXRjaCBv
ZiBmdW5jdGlvbiBncGlvZF9nZXRfZnJvbV9vZl9ub2RlKCkiKQo+IFNpZ25lZC1vZmYtYnk6IERt
aXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL291dHB1dC5jIHwgOCArKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvb3V0cHV0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKPiBpbmRleCAy
NzRjYjk1NWUyZTEuLjQ3MWQzMzgwOWNkNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvb3V0cHV0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKPiBA
QCAtMTI2LDggKzEyNiwxMiBAQCBpbnQgdGVncmFfb3V0cHV0X3Byb2JlKHN0cnVjdCB0ZWdyYV9v
dXRwdXQgKm91dHB1dCkKPiAgCQkJCQkJICAgICAgICJudmlkaWEsaHBkLWdwaW8iLCAwLAo+ICAJ
CQkJCQkgICAgICAgR1BJT0RfSU4sCj4gIAkJCQkJCSAgICAgICAiSERNSSBob3RwbHVnIGRldGVj
dCIpOwo+IC0JaWYgKElTX0VSUihvdXRwdXQtPmhwZF9ncGlvKSkKPiAtCQlyZXR1cm4gUFRSX0VS
UihvdXRwdXQtPmhwZF9ncGlvKTsKPiArCWlmIChJU19FUlIob3V0cHV0LT5ocGRfZ3BpbykpIHsK
PiArCQlpZiAoUFRSX0VSUihvdXRwdXQtPmhwZF9ncGlvKSA9PSAtRU5PRU5UKQo+ICsJCQlvdXRw
dXQtPmhwZF9ncGlvID0gTlVMTDsKPiArCQllbHNlCj4gKwkJCXJldHVybiBQVFJfRVJSKG91dHB1
dC0+aHBkX2dwaW8pOwo+ICsJfQo+ICAKPiAgCWlmIChvdXRwdXQtPmhwZF9ncGlvKSB7Cj4gIAkJ
ZXJyID0gZ3Bpb2RfdG9faXJxKG91dHB1dC0+aHBkX2dwaW8pOwo+IAoKQWNrZWQtYnk6IEpvbiBI
dW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPgoKQ2hlZXJzCkpvbgoKLS0gCm52cHVibGljCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
