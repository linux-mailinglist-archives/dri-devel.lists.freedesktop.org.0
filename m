Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F7749C2A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 10:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF7489D9A;
	Tue, 18 Jun 2019 08:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA21089D9A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 08:38:56 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id e3so20405051edr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 01:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=KdMfgz2iFHMu/AcrqFN0SsSlKb5oRUB+bIcR3o3m/3Q=;
 b=pGZoD2V+KRpV2C3FpmLDIBL+CipxQcBr9SVpolTE0O6+9lEUQXvqCGwuvkVJzgNRkl
 uVm47xPdU0YhaBePB3lx4d42hxZJPy67XBiTPPsFlgcmLiSa2gztuOQ+sDusWBDvFQTE
 q9mpxTXCufSrOeP45j6kW7/V79rUoyp33mktQEO/JQsITiOBeT2IYQgo47gfrNTutoUh
 oxATmvsLqNgUJsZhLq8hMgzPHuxPBrsrfWYTKPwseMGnxGhv42P/OdBxVcezdPqqy+z8
 BTIFQC1azDSdbqzHnl55F26G8pGvm3lF9a/CdVh/ErYYCLj3qvAoAflLYrlW4OjDUdHB
 EyfA==
X-Gm-Message-State: APjAAAWJZtwo6ndC5k/lf9fAaGf6b4aqGltEYNIkrNSvYj37ba5OVwqF
 nWZEbEvZo16r7FnskWnmtWYZSdlGtwg=
X-Google-Smtp-Source: APXvYqxXmnZ7yt7+mdk2KiSlrJzqKKvteI7mn3yeshBXiMgGvTzvlUD2N/cpiXgzLno8Ud8vJhA8Bw==
X-Received: by 2002:a17:906:3756:: with SMTP id
 e22mr18927483ejc.72.1560847135330; 
 Tue, 18 Jun 2019 01:38:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z3sm4569517edd.72.2019.06.18.01.38.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 01:38:54 -0700 (PDT)
Date: Tue, 18 Jun 2019 10:38:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH 2/3] drm/vkms: stop generating CRCs on buffer overflow
Message-ID: <20190618083852.GM12905@phenom.ffwll.local>
References: <20190613121802.2193-1-oleg.vasilev@intel.com>
 <20190613121802.2193-2-oleg.vasilev@intel.com>
 <20190613130711.GL23020@phenom.ffwll.local>
 <20190618015346.w2hgjrqlf4jxi3ei@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618015346.w2hgjrqlf4jxi3ei@smtp.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KdMfgz2iFHMu/AcrqFN0SsSlKb5oRUB+bIcR3o3m/3Q=;
 b=J/kMAc26tBIJpWHTazm95NUln2QTYg2DuFO2W0BoopqYL4FOkkqC/4k+VAVZP3GPEM
 aLPQuMVlHbP6BpB7NTZIygF9SLMuyezkgaQw4TVtpQtYWFOWbJXBVriRhPEKHRNqBBIp
 Pwnxb07ktagcMhB+FtU1ThXv2dKc0cql93RbQ=
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
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 Oleg Vasilev <oleg.vasilev@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTA6NTM6NDZQTSAtMDMwMCwgUm9kcmlnbyBTaXF1ZWly
YSB3cm90ZToKPiBIaSBPbGVnLAo+IAo+IEZpcnN0IG9mIGFsbCwgdGhhbmsgeW91IGZvciB5b3Vy
IHBhdGNoc2V0Lgo+IAo+IE9uIDA2LzEzLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gVGh1
LCBKdW4gMTMsIDIwMTkgYXQgMDM6MTg6MDFQTSArMDMwMCwgT2xlZyBWYXNpbGV2IHdyb3RlOgo+
ID4gPiBCZWNhdXNlIGludGVycnVwdHMgYXJlIGdlbmVyYXRlZCBhcnRpZml0aWFsbHksIGtlcm5l
bCBidWcgbWF5IGxlYWQgdG8KPiA+ID4gaW5maW50ZSBhdHRlbXB0cyB0byBzdWJtaXQgQ1JDLgo+
ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogT2xlZyBWYXNpbGV2IDxvbGVnLnZhc2lsZXZAaW50
ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMg
fCAxMCArKysrKysrKystCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Zr
bXMvdmttc19jcmMuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMKPiA+ID4gaW5k
ZXggZDdiNDA5YTNjMGY4Li5iYzcxN2E4ODg4YjUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS92a21zL3ZrbXNfY3JjLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMv
dmttc19jcmMuYwo+ID4gPiBAQCAtMTY3LDYgKzE2Nyw3IEBAIHZvaWQgdmttc19jcmNfd29ya19o
YW5kbGUoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ID4gPiAgCXUzMiBjcmMzMiA9IDA7Cj4g
PiA+ICAJdTY0IGZyYW1lX3N0YXJ0LCBmcmFtZV9lbmQ7Cj4gPiA+ICAJdW5zaWduZWQgbG9uZyBm
bGFnczsKPiA+ID4gKwlpbnQgcmV0Owo+ID4gPiAgCj4gPiA+ICAJc3Bpbl9sb2NrX2lycXNhdmUo
Jm91dC0+c3RhdGVfbG9jaywgZmxhZ3MpOwo+ID4gPiAgCWZyYW1lX3N0YXJ0ID0gY3J0Y19zdGF0
ZS0+ZnJhbWVfc3RhcnQ7Cj4gPiA+IEBAIC0yMDIsNyArMjAzLDE0IEBAIHZvaWQgdmttc19jcmNf
d29ya19oYW5kbGUoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ID4gPiAgCSAqIG1pc3Npbmcg
ZnJhbWVzCj4gPiA+ICAJICovCj4gPiA+ICAJd2hpbGUgKGZyYW1lX3N0YXJ0IDw9IGZyYW1lX2Vu
ZCkKPiA+ID4gLQkJZHJtX2NydGNfYWRkX2NyY19lbnRyeShjcnRjLCB0cnVlLCBmcmFtZV9zdGFy
dCsrLCAmY3JjMzIpOwo+ID4gPiArCXsKPiA+IAo+ID4gQmlrZXNoZWQ6IEtlcm5lbCBjb2Rpbmdz
dHlsZSBwdXRzIHRoaXMgb24gdGhlIHNhbWUgbGluZSBhcyB0aGUgY2xvc2luZyApCj4gPiBvZiB0
aGUgd2hpbGUvaWYvZm9yLgo+IAo+IEkgcmVjb21tZW5kIHlvdSB0byBjcmVhdGUgYSBwb3N0LWNv
bW1pdCBzY3JpcHQgaW4geW91ciBnaXQgcmVwby4KPiBTb21ldGhpbmcgbGlrZSB0aGlzOgo+IAo+
IHRvdWNoIC5naXQvaG9va3MvcG9zdC1jb21taXQKPiAKPiBJbiB0aGUgcG9zdC1jb21taXQsIGFk
ZDoKPiAKPiBleGVjIGdpdCBzaG93IC0tZm9ybWF0PWVtYWlsIEhFQUQgfCAuL3NjcmlwdHMvY2hl
Y2twYXRjaC5wbCAtLXN0cmljdCAtLWNvZGVzcGVsbAo+ICAKPiA+IEFzaWRlIGZyb20gdGhhdCBu
b3Qgc3VyZSB0aGF0J3MgdXNlZnVsIGhlcmUsIHdlJ3ZlIGZpeGVkIHRoZSBidWcgYnkgbm93Cj4g
PiAuLi4KPiAKPiBJTUhPLCB0aGlzIHBhdGNoIGlzIHVzZWZ1bCBiZWNhdXNlIGl0IGhhbmRsZXMg
dGhlIHJldHVybiB2YWx1ZSBmcm9tCj4gZHJtX2NydGNfYWRkX2NyY19lbnRyeSgpIHdoaWNoIG1h
a2UgdGhlIGNvZGUgYSBsaXR0bGUgYml0IG1vcmUgcmVsaWFibGUuCj4gQWRkaXRpb25hbGx5LCBp
dCBhdm9pZHMgcG9sbHV0aW5nIHRoZSBkbWVzZyBvdXRwdXQgaW4gY2FzZSBvZiBhCj4gcHJvYmxl
bS4KCklmIGl0J3MgdGhlIHJldHVybiB2YWx1ZSB0aGF0IGFubm95cyB5b3UsIHRoZXJlJ3MgYW4g
ZWFzeSBmaXg6IExldCdzCnJlbW92ZSBpdCEgTm9uZSBvZiB0aGUgb3RoZXIgZHJpdmVycyBsb29r
IGF0IGl0IGVpdGhlci4KCkltbyB0aGF0J3MgY2xlYXJlciB0aGFuIHRyeWluZyB0byBkbyBzb21l
dGhpbmcgcmVhc29uYWJsZSB3aGVuIGZhY2luZwpkcml2ZXIgYnVncyAod2hpY2ggdGhpcyBpcyBo
ZXJlKS4KLURhbmllbAoKPiAKPiA+IC1EYW5pZWwKPiA+IAo+ID4gPiArCQlyZXQgPSBkcm1fY3J0
Y19hZGRfY3JjX2VudHJ5KGNydGMsIHRydWUsIGZyYW1lX3N0YXJ0KyssICZjcmMzMik7Cj4gPiA+
ICsJCWlmIChyZXQpIHsKPiA+ID4gKwkJCURSTV9XQVJOKCJWS01TIHN0b3AgZ2VuZXJhdGluZyBD
UkNzXG4iKTsKPiA+ID4gKwkJCW91dC0+Y3JjX2VuYWJsZWQgPSBmYWxzZTsKPiA+ID4gKwkJCWJy
ZWFrOwo+ID4gPiArCQl9Cj4gPiA+ICsJfQo+ID4gPiAgCj4gPiA+ICBvdXQ6Cj4gPiA+ICAJLyog
dG8gYXZvaWQgdXNpbmcgdGhlIHNhbWUgdmFsdWUgZm9yIGZyYW1lIG51bWJlciBhZ2FpbiAqLwo+
ID4gPiAtLSAKPiA+ID4gMi4yMS4wCj4gPiA+IAo+ID4gCj4gPiAtLSAKPiA+IERhbmllbCBWZXR0
ZXIKPiA+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ID4gaHR0cDovL2Js
b2cuZmZ3bGwuY2gKPiAKPiAtLSAKPiBSb2RyaWdvIFNpcXVlaXJhCj4gaHR0cHM6Ly9zaXF1ZWly
YS50ZWNoCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9y
YXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
