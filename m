Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D361698B1
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2020 17:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A736E02D;
	Sun, 23 Feb 2020 16:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1B96E02D;
 Sun, 23 Feb 2020 16:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 6B5D03F5BB;
 Sun, 23 Feb 2020 17:54:15 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=HEPMb2xN; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gz0yG0ClAaNg; Sun, 23 Feb 2020 17:54:14 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id C1D963F418;
 Sun, 23 Feb 2020 17:54:12 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id F0AE936023F;
 Sun, 23 Feb 2020 17:54:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1582476852; bh=wxPWZMnaHxvhqVllDP/O5dl63RWxie9K/haXwvx4klo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HEPMb2xNPfy8xIdt+KGPbILif0AUcd7sIIy131vPJYooIV8JIzi41VU5qURkXDjGk
 Mbl000O7Cr23vlIJru4FvX6rigervSL+7YlkKAy45knXoPkjaJJhuOlKE49yozDYDr
 zQj1wbrzDxcs9ma+Jkvgx7aYKewZwdqY6t8fpZ8w=
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
To: christian.koenig@amd.com, Daniel Vetter <daniel@ffwll.ch>
References: <20200217154509.2265-6-christian.koenig@amd.com>
 <20200217175518.GL2363188@phenom.ffwll.local>
 <f8ac7cbc-7c90-7119-735c-9f55adb6fa7f@shipmail.org>
 <CAKMK7uHG3EkEPbAQ3UEHHLcfmR+0NPq0wZuBX+s2-WCFdso8ew@mail.gmail.com>
 <79a0d79f-91bd-2481-740c-20e6c819c7c9@shipmail.org>
 <ee929c93-c9d7-7243-810e-94c6f0fc64b0@shipmail.org>
 <20200220180459.GS2363188@phenom.ffwll.local>
 <d1c37ec4-b63e-437a-a2be-80ba5192e048@shipmail.org>
 <20200220200831.GA2363188@phenom.ffwll.local>
 <501bf409-e4fe-a318-17b4-d5d050b09529@shipmail.org>
 <20200221171217.GD2363188@phenom.ffwll.local>
 <d9343617-9da8-5fea-a0f1-99db34a0cf2c@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <8f29b152-9c7b-3427-efa2-4a39f0daced8@shipmail.org>
Date: Sun, 23 Feb 2020 17:54:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <d9343617-9da8-5fea-a0f1-99db34a0cf2c@gmail.com>
Content-Language: en-US
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMi8yMy8yMCA0OjQ1IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDIxLjAyLjIw
IHVtIDE4OjEyIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4gW1NOSVBdCj4+IFllYWggdGhlIEdy
ZWF0IFBsYW4gKHRtKSBpcyB0byBmdWxseSByZWx5IG9uIHd3X211dGV4IHNsb3dseSAKPj4gZGVn
ZW5lcmF0aW5nCj4+IGludG8gZXNzZW50aWFsbHkgYSBnbG9iYWwgbG9jay4gQnV0IG9ubHkgd2hl
biB0aGVyZSdzIGFjdHVhbCBjb250ZW50aW9uCj4+IGFuZCB0aHJhc2hpbmcuCj4KPiBZZXMgZXhh
Y3RseS4gQSByZWFsbHkgYmlnIHByb2JsZW0gaW4gVFRNIGlzIGN1cnJlbnRseSB0aGF0IHdlIGRy
b3AgdGhlIAo+IGxvY2sgYWZ0ZXIgZXZpY3RpbmcgQk9zIGJlY2F1c2UgdGhleSB0ZW5kIHRvIG1v
dmUgaW4gYWdhaW4gZGlyZWN0bHkgCj4gYWZ0ZXIgdGhhdC4KPgo+IEZyb20gcHJhY3RpY2UgSSBj
YW4gYWxzbyBjb25maXJtIHRoYXQgdGhlcmUgaXMgZXhhY3RseSB6ZXJvIGJlbmVmaXQgCj4gZnJv
bSBkcm9wcGluZyBsb2NrcyBlYXJseSBhbmQgcmVhY3F1aXJlIHRoZW0gZm9yIGV4YW1wbGUgZm9y
IHRoZSBWTSAKPiBwYWdlIHRhYmxlcy4gVGhhdCdzIGp1c3QgbWFrZXMgaXQgbW9yZSBsaWtlbHkg
dGhhdCBzb21lYm9keSBuZWVkcyB0byAKPiByb2xsIGJhY2sgYW5kIHRoaXMgaXMgd2hhdCB3ZSBu
ZWVkIHRvIGF2b2lkIGluIHRoZSBmaXJzdCBwbGFjZS4KCgpJZiB5b3UgaGF2ZSBhIGJlbmNobWFy
a2luZyBzZXR1cCBhdmFpbGFibGUgaXQgd291bGQgYmUgdmVyeSBpbnRlcmVzdGluZyAKZm9yIGZ1
dHVyZSByZWZlcmVuY2UgdG8gc2VlIGhvdyBjaGFuZ2luZyBmcm9tIFdEIHRvIFdXIG11dGV4ZXMg
YWZmZWN0cyAKdGhlIHJvbGwgYmFjayBmcmVxdWVuY3kuIFdXIGlzIGtub3duIHRvIGNhdXNlIHJv
bGxiYWNrcyBtdWNoIGxlc3MgCmZyZXF1ZW50bHkgYnV0IHRoZXJlIGlzIG1vcmUgd29yayBhc3Nv
Y2lhdGVkIHdpdGggZWFjaCByb2xsYmFjay4KCj4KPiBDb250ZW50aW9uIG9uIEJPIGxvY2tzIGR1
cmluZyBjb21tYW5kIHN1Ym1pc3Npb24gaXMgcGVyZmVjdGx5IGZpbmUgYXMgCj4gbG9uZyBhcyB0
aGlzIGlzIGFzIGxpZ2h0d2VpZ2h0IGFzIHBvc3NpYmxlIHdoaWxlIHdlIGRvbid0IGhhdmUgCj4g
dHJhc2hpbmcuIFdoZW4gd2UgaGF2ZSB0cmFzaGluZyBtdWx0aSBzdWJtaXNzaW9uIHBlcmZvcm1h
bmNlIGlzIGJlc3QgCj4gYXJjaGl2ZWQgdG8ganVzdCBmYXZvciBhIHNpbmdsZSBwcm9jZXNzIHRv
IGZpbmlzaCBpdHMgYnVzaW5lc3MgYW5kIAo+IGJsb2NrIGV2ZXJ5Ym9keSBlbHNlLgoKSG1tLiBT
b3VuZHMgbGlrZSB3ZSBuZWVkIGEgcGVyLW1hbmFnZXIgd3dfcndzZW0gcHJvdGVjdGluZyBtYW5h
Z2VyIAphbGxvY2F0aW9uLCB0YWtlbiBpbiB3cml0ZS1tb2RlIHRoZW4gdGhlcmUncyB0aHJhc2hp
bmcuIEluIHJlYWQtbW9kZSAKb3RoZXJ3aXNlLiBUaGF0IHdvdWxkIGxpbWl0IHRoZSBhbW91bnQg
b2YgInVubmVjZXNzYXJ5IiBsb2NrcyB3ZSdkIGhhdmUgCnRvIGtlZXAgYW5kIHJlZHVjZSB1bndh
bnRlZCBzaWRlLWVmZmVjdHMsIChzZWUgYmVsb3cpOgoKPgo+IEJlY2F1c2Ugb2YgdGhpcyBJIHdv
dWxkIGFjdHVhbGx5IHZvdGUgZm9yIGZvcmJpZGRpbmcgdG8gcmVsZWFzZSAKPiBpbmRpdmlkdWFs
IHd3X211dGV4KCkgbG9ja3MgaW4gYSBjb250ZXh0LgoKWWVzLCBJIHNlZSB0aGUgcHJvYmxlbS4K
CkJ1dCBteSBmaXJzdCByZWFjdGlvbiBpcyB0aGF0IHRoaXMgbWlnaHQgaGF2ZSB1bmRlcnNpcmFi
bGUgc2lkZS1lZmZlY3RzLiAKTGV0J3Mgc2F5IHNvbWVib2R5IHdhbnRlZCB0byBzd2FwIHRoZSBl
dmljdGVkIEJPcyBvdXQ/IE9yIGNwdS13cml0ZXMgdG8gCnRoZW0gY2F1c2luZyBmYXVsdHMsIHRo
YXQgbWlnaHQgYWxzbyBibG9jayB0aGUgbW1fc2VtLCB3aGljaCBpbiB0dXJuIApibG9ja3MgaHVn
ZXBhZ2VkPwoKU3RpbGwgaXQncyBhIGZhaXJseSBzaW1wbGUgc29sdXRpb24gdG8gYSBwcm9ibGVt
IHRoYXQgc2VlbXMgb3RoZXJ3aXNlIApoYXJkIHRvIHNvbHZlIGVmZmljaWVudGx5LgoKVGhhbmtz
LApUaG9tYXMKCgo+Cj4gUmVnYXJkcywKPiBDaHJpc3RpYW4uCj4KPj4gLURhbmllbAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
