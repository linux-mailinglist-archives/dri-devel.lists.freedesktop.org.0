Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BBD316DDB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 19:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327226ECB3;
	Wed, 10 Feb 2021 18:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C276E6ECB3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612980379;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jYi+k7DEhVHx5f9l8WnnMKISfctNrL5GP+pVovkhzyE=;
 b=CWGRh963AEQW+6bWXHYXTMKmOc59VJ4/jqxzZDAeXvN0d059q334LM8MDLovjoc+kej1PL
 tx1DwGp8dHxyXrpLHyKsByhcww2aIrleBKQcS4RTecBKUiIV3NvoAtWAChjV6mu9LdOfCy
 D5wpqKpg/8Ez0lOhe8Td981JnUuEC7c=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-6z0OWfngPDi0Gu_EVn_CxQ-1; Wed, 10 Feb 2021 13:03:07 -0500
X-MC-Unique: 6z0OWfngPDi0Gu_EVn_CxQ-1
Received: by mail-qt1-f197.google.com with SMTP id m21so2186381qtp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 10:03:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=jYi+k7DEhVHx5f9l8WnnMKISfctNrL5GP+pVovkhzyE=;
 b=i6fLwZHcqcO+3PnfZZJJ8Tt9AXymjhkhFH5lNhFYGmK+uFDl//TA6cSY3kQo3onAbp
 zzvbegvOEBB1CWEjbeyEOf4gfKTyPqEom/tR+nsWwNOk79iljGCtsSgMnE/6G8WllAcw
 ez5ws3YyMr4bcdXBX+Fu75SbqjhTwZVI3W3qJqWBPnQSH9JhNuImXTVn0zafLJCb49zF
 fBRNIfHQRXU3/1aTdrOzaVP8XNb8w/4okkAv805hVOEUne9SB3tiCOKDvHDIYo+K5/Ni
 UTSRFlKpTR6rhw7ieuBjRmJ7DBgOL2xW0Li/ZwiEGWKZm9PFQtp9XT6kSbDq84dRG79X
 G1lw==
X-Gm-Message-State: AOAM532OsIfH2aY2AGHUChhg2bdqnPMHZgLnxCqC6qKTPhc5S75gANdb
 oJjxgAYVdjmGnubEhWnGYgc0jYcIkZqRCgzdtT48nx0NKLqKRW07lRU6+/dRmxNWON3xiHwugcd
 nT3brocPnSFOY583O+knkUdoawCcj
X-Received: by 2002:a0c:c583:: with SMTP id a3mr4141005qvj.15.1612980186832;
 Wed, 10 Feb 2021 10:03:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzAYXxVyBX4lvJYvwtH9+mLstAEOqw2KxHkGhO7wbCieB1wFxJQPnwDRv4Ua5PpuMX+0picQ==
X-Received: by 2002:a0c:c583:: with SMTP id a3mr4140988qvj.15.1612980186584;
 Wed, 10 Feb 2021 10:03:06 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id o24sm1819958qtt.36.2021.02.10.10.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 10:03:06 -0800 (PST)
Message-ID: <d8606a5519a777c6531accdd8406b17a1dac3c66.camel@redhat.com>
Subject: Re: [RFC PATCH 1/2] drm/dp: Make number of AUX retries configurable
 by display drivers.
From: Lyude Paul <lyude@redhat.com>
To: Khaled Almahallawy <khaled.almahallawy@intel.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Date: Wed, 10 Feb 2021 13:03:05 -0500
In-Reply-To: <20210210083338.100068-1-khaled.almahallawy@intel.com>
References: <20210210083338.100068-1-khaled.almahallawy@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: seanpaul@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTAyLTEwIGF0IDAwOjMzIC0wODAwLCBLaGFsZWQgQWxtYWhhbGxhd3kgd3Jv
dGU6Cj4gVGhlIG51bWJlciBvZiBBVVggcmV0cmllcyBzcGVjaWZpZWQgaW4gdGhlIERQIHNwZWNz
IGlzIDcuIEN1cnJlbnRseSwgdG8gbWFrZQo+IERlbGwgNGsgbW9uaXRvcnMgaGFwcGllciwgdGhl
IG51bWJlciBvZiByZXRyaWVzIGFyZSAzMi4KPiBpOTE1IGFsc28gcmV0cmllcyA1IHRpbWVzIChp
bnRlbF9kcF9hdXhfeGZlcikgd2hpY2ggbWVhbnMgaW4gdGhlIGNhc2Ugb2YgQVVYCj4gdGltZW91
dCB3ZSBhY3R1YWxseSByZXRyaWVzIDMyICogNSA9IDE2MCB0aW1lcy4KCklzIHRoZXJlIGFueSBn
b29kIHJlYXNvbiBmb3IgaTkxNSB0byBhY3R1YWxseSBiZSBkb2luZyByZXRyaWVzIGl0c2VsZj8g
SXQgc2VlbXMKbGlrZSBhbiBlYXNpZXIgc29sdXRpb24gaGVyZSBtaWdodCBqdXN0IHRvIGJlIHRv
IGZpeCBpOTE1IHNvIGl0IGRvZXNuJ3QgcmV0cnksCmFuZCBqdXN0IHJlbHkgb24gRFJNIHRvIGRv
IHRoZSByZXRyaWVzIGFzIGFwcHJvcHJpYXRlLgoKVGhhdCBiZWluZyBzYWlkIHRob3VnaCwgSSdt
IG9wZW4gdG8gdGhpcyBpZiB0aGVyZSBpcyBhIGxlZ2l0aW1hdGUgcmVhc29uIGZvcgppOTE1IHRv
IGJlIGhhbmRsaW5nIHJldHJpZXMgb24gaXRzIG93bgoKPiAKPiBTbyBtYWtpbmcgdGhlIG51bWJl
ciBvZiBhdXggcmV0aXJlcyBhIHZhcmlhYmxlIHRvIGFsbG93IGZvciBmaW5lIHR1bmluZyBhbmQK
PiBvcHRpbWl6YXRpb24gb2YgYXV4IHRpbWluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLaGFsZWQg
QWxtYWhhbGxhd3kgPGtoYWxlZC5hbG1haGFsbGF3eUBpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgMTAgKysrLS0tLS0tLQo+IMKgaW5jbHVkZS9k
cm0vZHJtX2RwX2hlbHBlci5owqDCoMKgwqAgfMKgIDEgKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5j
Cj4gaW5kZXggZWVkYmI0ODgxNWI3Li44ZmRmNTdiNGEwNmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
aGVscGVyLmMKPiBAQCAtMjQ5LDEzICsyNDksNyBAQCBzdGF0aWMgaW50IGRybV9kcF9kcGNkX2Fj
Y2VzcyhzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCB1OAo+IHJlcXVlc3QsCj4gwqAKPiDCoMKgwqDC
oMKgwqDCoMKgbXV0ZXhfbG9jaygmYXV4LT5od19tdXRleCk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKg
wqAvKgo+IC3CoMKgwqDCoMKgwqDCoCAqIFRoZSBzcGVjaWZpY2F0aW9uIGRvZXNuJ3QgZ2l2ZSBh
bnkgcmVjb21tZW5kYXRpb24gb24gaG93IG9mdGVuIHRvCj4gLcKgwqDCoMKgwqDCoMKgICogcmV0
cnkgbmF0aXZlIHRyYW5zYWN0aW9ucy4gV2UgdXNlZCB0byByZXRyeSA3IHRpbWVzIGxpa2UgZm9y
Cj4gLcKgwqDCoMKgwqDCoMKgICogYXV4IGkyYyB0cmFuc2FjdGlvbnMgYnV0IHJlYWwgd29ybGQg
ZGV2aWNlcyB0aGlzIHdhc24ndAo+IC3CoMKgwqDCoMKgwqDCoCAqIHN1ZmZpY2llbnQsIGJ1bXAg
dG8gMzIgd2hpY2ggbWFrZXMgRGVsbCA0ayBtb25pdG9ycyBoYXBwaWVyLgo+IC3CoMKgwqDCoMKg
wqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDCoGZvciAocmV0cnkgPSAwOyByZXRyeSA8IDMyOyByZXRy
eSsrKSB7Cj4gK8KgwqDCoMKgwqDCoMKgZm9yIChyZXRyeSA9IDA7IHJldHJ5IDwgYXV4LT5udW1f
cmV0cmllczsgcmV0cnkrKykgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYg
KHJldCAhPSAwICYmIHJldCAhPSAtRVRJTUVET1VUKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdXNsZWVwX3JhbmdlKEFVWF9SRVRSWV9JTlRFUlZB
TCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgQVVYX1JFVFJZX0lOVEVSVkFMICsgMTAwKTsKPiBAQCAtMTc0
NCw2ICsxNzM4LDggQEAgdm9pZCBkcm1fZHBfYXV4X2luaXQoc3RydWN0IGRybV9kcF9hdXggKmF1
eCkKPiDCoMKgwqDCoMKgwqDCoMKgYXV4LT5kZGMucmV0cmllcyA9IDM7Cj4gwqAKPiDCoMKgwqDC
oMKgwqDCoMKgYXV4LT5kZGMubG9ja19vcHMgPSAmZHJtX2RwX2kyY19sb2NrX29wczsKPiArwqDC
oMKgwqDCoMKgwqAvKlN0aWxsIG1ha2luZyB0aGUgRGVsbCA0ayBtb25pdG9ycyBoYXBwaWVyKi8K
PiArwqDCoMKgwqDCoMKgwqBhdXgtPm51bV9yZXRyaWVzID0gMzI7Cj4gwqB9Cj4gwqBFWFBPUlRf
U1lNQk9MKGRybV9kcF9hdXhfaW5pdCk7Cj4gwqAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gaW5kZXggZWRm
ZmQxZGNjYTNlLi4xNmNiZmM4ZjVlNjYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Rw
X2hlbHBlci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gQEAgLTE4NzYs
NiArMTg3Niw3IEBAIHN0cnVjdCBkcm1fZHBfYXV4IHsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IG11dGV4IGh3X211dGV4Owo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgd29ya19zdHJ1Y3QgY3Jj
X3dvcms7Cj4gwqDCoMKgwqDCoMKgwqDCoHU4IGNyY19jb3VudDsKPiArwqDCoMKgwqDCoMKgwqBp
bnQgbnVtX3JldHJpZXM7Cj4gwqDCoMKgwqDCoMKgwqDCoHNzaXplX3QgKCp0cmFuc2Zlcikoc3Ry
dWN0IGRybV9kcF9hdXggKmF1eCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9kcF9hdXhfbXNnICptc2cpOwo+IMKgwqDC
oMKgwqDCoMKgwqAvKioKCi0tIApTaW5jZXJlbHksCiAgIEx5dWRlIFBhdWwgKHNoZS9oZXIpCiAg
IFNvZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQKICAgCk5vdGU6IEkgZGVhbCB3aXRoIGEgbG90
IG9mIGVtYWlscyBhbmQgaGF2ZSBhIGxvdCBvZiBidWdzIG9uIG15IHBsYXRlLiBJZiB5b3UndmUK
YXNrZWQgbWUgYSBxdWVzdGlvbiwgYXJlIHdhaXRpbmcgZm9yIGEgcmV2aWV3L21lcmdlIG9uIGEg
cGF0Y2gsIGV0Yy4gYW5kIEkKaGF2ZW4ndCByZXNwb25kZWQgaW4gYSB3aGlsZSwgcGxlYXNlIGZl
ZWwgZnJlZSB0byBzZW5kIG1lIGFub3RoZXIgZW1haWwgdG8gY2hlY2sKb24gbXkgc3RhdHVzLiBJ
IGRvbid0IGJpdGUhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
