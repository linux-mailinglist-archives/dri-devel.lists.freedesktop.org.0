Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7A625E885
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 16:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76256E104;
	Sat,  5 Sep 2020 14:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712356E104
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Sep 2020 14:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ENrwMfE6hjkJ/TvU+7K3kw0oNF7tj75Cqe1y+1wG0tU=; b=wh9/IPOvFILcCg/8lAAA1FDxHn
 IVpdCbPBlePn0U9xmliDkWwKgpV4aBhCSPjV+cwmNqDaOPnf1Kfo0SHVAW+dDsPcKuoWV+Cm2o3kS
 ou2x54IonOyDlX16twutL8yBG3CJePIYNYv6qYeaG1RbBNf8a5GY4yBj1Noz0PemqpttAyUqy+3t6
 xGOaVD4ASSMDJvGc866jw0m4zekVwqx27eH73F+fpM7OGfQpFdUglGmTt8wdIDQ1u0AA00HSPt8+3
 R3LAUEmDLigi4eAIy0Y7fES9Mfe8hROykaWHJe+gkoaKNcO3WijiaWQOjfAVnfs+298PBtGusRJXb
 IwTSf6LQ==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kEZZF-0007XQ-Qq; Sat, 05 Sep 2020 17:53:25 +0300
Subject: Re: [RFC PATCH v2 06/17] gpu: host1x: Cleanup and refcounting for
 syncpoints
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-7-mperttunen@nvidia.com>
 <913a625c-9630-92af-aba0-fdddf6bbdb29@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <e9cce9d5-1a63-077e-1ca6-ac5d5112d5fe@kapsi.fi>
Date: Sat, 5 Sep 2020 17:53:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <913a625c-9630-92af-aba0-fdddf6bbdb29@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS81LzIwIDU6MzAgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwNS4wOS4yMDIwIDEz
OjM0LCBNaWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPiAuLi4KPj4gKwo+PiArLyoqCj4+ICsg
KiBob3N0MXhfc3luY3B0X3B1dCgpIC0gZnJlZSBhIHJlcXVlc3RlZCBzeW5jcG9pbnQKPj4gKyAq
IEBzcDogaG9zdDF4IHN5bmNwb2ludAo+PiArICoKPj4gKyAqIFJlbGVhc2UgYSBzeW5jcG9pbnQg
cHJldmlvdXNseSBhbGxvY2F0ZWQgdXNpbmcgaG9zdDF4X3N5bmNwdF9yZXF1ZXN0KCkuIEEKPj4g
KyAqIGhvc3QxeCBjbGllbnQgZHJpdmVyIHNob3VsZCBjYWxsIHRoaXMgd2hlbiB0aGUgc3luY3Bv
aW50IGlzIG5vIGxvbmdlciBpbgo+PiArICogdXNlLgo+PiArICovCj4+ICt2b2lkIGhvc3QxeF9z
eW5jcHRfcHV0KHN0cnVjdCBob3N0MXhfc3luY3B0ICpzcCkKPj4gK3sKPj4gKwlpZiAoIXNwKQo+
PiArCQlyZXR1cm47Cj4+ICsKPj4gKwlrcmVmX3B1dCgmc3AtPnJlZiwgc3luY3B0X3JlbGVhc2Up
Owo+PiArfQo+PiArRVhQT1JUX1NZTUJPTChob3N0MXhfc3luY3B0X3B1dCk7Cj4+ICAgCj4+ICAg
dm9pZCBob3N0MXhfc3luY3B0X2RlaW5pdChzdHJ1Y3QgaG9zdDF4ICpob3N0KQo+PiAgIHsKPj4g
QEAgLTQ3MSwxNiArNDc4LDQ4IEBAIHVuc2lnbmVkIGludCBob3N0MXhfc3luY3B0X25iX21sb2Nr
cyhzdHJ1Y3QgaG9zdDF4ICpob3N0KQo+PiAgIH0KPj4gICAKPj4gICAvKioKPj4gLSAqIGhvc3Qx
eF9zeW5jcHRfZ2V0KCkgLSBvYnRhaW4gYSBzeW5jcG9pbnQgYnkgSUQKPj4gKyAqIGhvc3QxeF9z
eW5jcHRfZ2V0X2J5X2lkKCkgLSBvYnRhaW4gYSBzeW5jcG9pbnQgYnkgSUQKPj4gKyAqIEBob3N0
OiBob3N0MXggY29udHJvbGxlcgo+PiArICogQGlkOiBzeW5jcG9pbnQgSUQKPj4gKyAqLwo+PiAr
c3RydWN0IGhvc3QxeF9zeW5jcHQgKmhvc3QxeF9zeW5jcHRfZ2V0X2J5X2lkKHN0cnVjdCBob3N0
MXggKmhvc3QsCj4+ICsJCQkJCSAgICAgIHVuc2lnbmVkIGludCBpZCkKPj4gK3sKPj4gKwlpZiAo
aWQgPj0gaG9zdC0+aW5mby0+bmJfcHRzKQo+PiArCQlyZXR1cm4gTlVMTDsKPj4gKwo+PiArCWlm
IChrcmVmX2dldF91bmxlc3NfemVybygmaG9zdC0+c3luY3B0W2lkXS5yZWYpKQo+PiArCQlyZXR1
cm4gJmhvc3QtPnN5bmNwdFtpZF07Cj4+ICsJZWxzZQo+PiArCQlyZXR1cm4gTlVMTDsKPj4gK30K
Pj4gK0VYUE9SVF9TWU1CT0woaG9zdDF4X3N5bmNwdF9nZXRfYnlfaWQpOwo+PiArCj4+ICsvKioK
Pj4gKyAqIGhvc3QxeF9zeW5jcHRfZ2V0X2J5X2lkX25vcmVmKCkgLSBvYnRhaW4gYSBzeW5jcG9p
bnQgYnkgSUQgYnV0IGRvbid0Cj4+ICsgKiAJaW5jcmVhc2UgdGhlIHJlZmNvdW50Lgo+PiAgICAq
IEBob3N0OiBob3N0MXggY29udHJvbGxlcgo+PiAgICAqIEBpZDogc3luY3BvaW50IElECj4+ICAg
ICovCj4+IC1zdHJ1Y3QgaG9zdDF4X3N5bmNwdCAqaG9zdDF4X3N5bmNwdF9nZXQoc3RydWN0IGhv
c3QxeCAqaG9zdCwgdW5zaWduZWQgaW50IGlkKQo+PiArc3RydWN0IGhvc3QxeF9zeW5jcHQgKmhv
c3QxeF9zeW5jcHRfZ2V0X2J5X2lkX25vcmVmKHN0cnVjdCBob3N0MXggKmhvc3QsCj4+ICsJCQkJ
CQkgICAgdW5zaWduZWQgaW50IGlkKQo+PiAgIHsKPj4gICAJaWYgKGlkID49IGhvc3QtPmluZm8t
Pm5iX3B0cykKPj4gICAJCXJldHVybiBOVUxMOwo+PiAgIAo+PiAtCXJldHVybiBob3N0LT5zeW5j
cHQgKyBpZDsKPj4gKwlyZXR1cm4gJmhvc3QtPnN5bmNwdFtpZF07Cj4+ICt9Cj4+ICtFWFBPUlRf
U1lNQk9MKGhvc3QxeF9zeW5jcHRfZ2V0X2J5X2lkX25vcmVmKTsKPj4gKwo+PiArLyoqCj4+ICsg
KiBob3N0MXhfc3luY3B0X2dldCgpIC0gaW5jcmVtZW50IHN5bmNwb2ludCByZWZjb3VudAo+PiAr
ICogQHNwOiBzeW5jcG9pbnQKPj4gKyAqLwo+PiArc3RydWN0IGhvc3QxeF9zeW5jcHQgKmhvc3Qx
eF9zeW5jcHRfZ2V0KHN0cnVjdCBob3N0MXhfc3luY3B0ICpzcCkKPj4gK3sKPj4gKwlrcmVmX2dl
dCgmc3AtPnJlZik7Cj4+ICsKPj4gKwlyZXR1cm4gc3A7Cj4+ICAgfQo+PiAgIEVYUE9SVF9TWU1C
T0woaG9zdDF4X3N5bmNwdF9nZXQpOwo+IAo+IEhlbGxvLCBNaWtrbyEKPiAKPiBXaGF0IGRvIHlv
dSB0aGluayBhYm91dCB0byBvcGVuLWNvZGUgYWxsIHRoZSBob3N0MXggc3RydWN0cyBieSBtb3Zp
bmcKPiB0aGVtIGFsbCBvdXQgaW50byB0aGUgcHVibGljIGxpbnV4L2hvc3QxeC5oPyBUaGVuIHdl
IGNvdWxkIGlubGluZSBhbGwKPiB0aGVzZSB0cml2aWFsIHNpbmdsZS1saW5lIGZ1bmN0aW9ucyBi
eSBoYXZpbmcgdGhlbSBkZWZpbmVkIGluIHRoZSBwdWJsaWMKPiBoZWFkZXIuIFRoaXMgd2lsbCBh
dm9pZCBhbGwgdGhlIHVubmVjZXNzYXJ5IG92ZXJoZWFkIGJ5IGFsbG93aW5nCj4gY29tcGlsZXIg
dG8gb3B0aW1pemUgdGhlIGNvZGUgbmljZWx5Lgo+IAo+IE9mIGNvdXJzZSB0aGlzIGNvdWxkIGJl
IGEgc2VwYXJhdGUgY2hhbmdlIGFuZCBpdCBjb3VsZCBiZSBkb25lIHNvbWV0aW1lCj4gbGF0ZXIs
IEkganVzdCB3YW50ZWQgdG8gc2hhcmUgdGhpcyBxdWljayB0aG91Z2h0IGZvciB0aGUgc3RhcnQg
b2YgdGhlCj4gcmV2aWV3Lgo+IAoKSGkgOikKCkkgdGhpbmsgZm9yIHN1Y2ggbWljcm8tb3B0aW1p
emF0aW9ucyB3ZSBzaG91bGQgaGF2ZSBhIGJlbmNobWFyayB0byAKZXZhbHVhdGUgYWdhaW5zdC4g
SSdtIG5vdCBzdXJlIHdlIGhhdmUgYWxsIHRoYXQgbWFueSBmdW5jdGlvbiBjYWxscyBpbnRvIApo
ZXJlIG92ZXJhbGwgdGhhdCBpdCB3b3VsZCBtYWtlIGEgbm90aWNlYWJsZSBkaWZmZXJlbmNlLiBJ
biBhbnkgY2FzZSwgYXMgCnlvdSBzYWlkLCBJJ2QgcHJlZmVyIHRvIGtlZXAgZnVydGhlciByZWZh
Y3RvcmluZyB0byBhIHNlcGFyYXRlIHNlcmllcyB0byAKYXZvaWQgZ3Jvd2luZyB0aGlzIHNlcmll
cyB0b28gbXVjaC4KCk1pa2tvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
