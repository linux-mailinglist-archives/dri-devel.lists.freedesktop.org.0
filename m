Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C46A26D641
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 10:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253726E994;
	Thu, 17 Sep 2020 08:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B095A6E997
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 08:20:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z1so1052181wrt.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 01:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=4FsHKMfQqZOUAbRSwnENuvanMSGS4TVLBEUS3pGowIk=;
 b=HQYarVadBy3TUaFuJNJo+nD3pHUKZ1pKtCHvQrIKwDH7AdJzyghGDp1/Iu55ttXZNP
 NCTZiGtJV7nip7rUzcuKWgNMJwE196MsQ9QF6MlTKCGS2TIczcRJ/YCY3qoIBrVITBVK
 vSk2zJJmxLR+GLF5qeaTuzEq08M6kAgb1yQVGaorX+Pf7EfW4+AqaDhtTAznp8Ll+ehM
 5fXxz8unQpwSX4g9N/wh05GMT4h8dl2hR5N2R32P7P3OLZPi+BzmbWDJR/F7Pv5R2LcY
 h0hxE2yyhOs9AsY/hEcnV1LJZ6og9AWPcaKetcqg4f6Sw+kk1+5HZRZns7dFXkwKTE40
 v7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=4FsHKMfQqZOUAbRSwnENuvanMSGS4TVLBEUS3pGowIk=;
 b=aAZE5PLj7gEV6ADSrns9rZG8hbxnZonR8HG9OTRHceThfGqpVwCZpT3iyKimNmSBNK
 VxUwdzYrN5luN88gl0kYkUNeygD84IwurLQ9BCHDv7jNGS4uVGQoSa9r9jhtcN3zEBoe
 Nc9LYS2k4UA7U6NttZGugjUhjOFxLrs2St/KiN/Jq2X/a9jP4E0/fSO6aqZBy+/TFCmd
 9n/Bir3onSUniKAn9PXQx4EAQVnTgGU8VDaXzyDkC9sj3quggTtJONAU6n89AdnnDbHJ
 2PU3Htdj87OwYSQGKfdWyTP6X/8YRv46zE0LOTID0rmfdOUV+/PMgvuq/Ja2cBW0iy2n
 G6Jg==
X-Gm-Message-State: AOAM532OYNXq+dNUNb4OOfa+bUZYLDI+AVKKGH5UJjYZPq3j34moqmOz
 fFN7I/t0cSTQwd+YusPwbkJ4ofZxoLI=
X-Google-Smtp-Source: ABdhPJz9EoxgWkWJcY1uNyFeYejoI2fQQCeS+T+96Sw4f1r+CnhB0D2CnTDEuHDJLL7G4aUUKGhdCw==
X-Received: by 2002:a05:6402:393:: with SMTP id
 o19mr31892751edv.34.1600330368284; 
 Thu, 17 Sep 2020 01:12:48 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p25sm16058022edm.60.2020.09.17.01.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2020 01:12:47 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: fix incorrect TT->SYSTEM move handling
To: Dave Airlie <airlied@gmail.com>
References: <20200916142406.2379-1-christian.koenig@amd.com>
 <CAPM=9tzGmwcDfLAxrzrFi29kcbn1prifaECc_kn7+5_-65mfnQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d1e1b00d-3d40-46db-04f4-db8071dd9da2@gmail.com>
Date: Thu, 17 Sep 2020 10:12:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9tzGmwcDfLAxrzrFi29kcbn1prifaECc_kn7+5_-65mfnQ@mail.gmail.com>
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
Reply-To: christian.koenig@amd.com
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDkuMjAgdW0gMjE6Mjcgc2NocmllYiBEYXZlIEFpcmxpZToKPiBPbiBUaHUsIDE3IFNl
cCAyMDIwIGF0IDAwOjI0LCBDaHJpc3RpYW4gS8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0enVtZXJr
ZW5AZ21haWwuY29tPiB3cm90ZToKPj4gV2hlbiB3ZSBtb3ZlIGZyb20gdGhlIFNZU1RFTSBkb21h
aW4gdG8gdGhlIFRUIGRvbWFpbgo+PiB3ZSBzdGlsbCBuZWVkIHRvIHBvdGVudGlhbGx5IGNoYW5n
ZSB0aGUgY2FjaGluZyBzdGF0ZS4KPj4KPj4gVGhpcyBpcyBtb3N0IGxpa2VseSB0aGUgc291cmNl
IG9mIGEgYnVuY2ggb2YgcHJvYmxlbXMgd2l0aAo+PiBBR1AgYW5kIFVTV0MgdG9nZXRoZXIgd2l0
aCBoaWJlcm5hdGlvbiBhbmQgc3dhcC4KPiBJJ20gZ29pbmcgdG8gbmVlZCBtb3JlIGNvbW1lbnRh
cnksIGJlY2F1c2UgSSd2ZSBiZWVuIHN0YXJpbmcgYXQgdGhpcwo+IGNvZGUgYSBsb3QgaW4gdGhl
IHBhc3QgZmV3IGRheXMgYW5kIEknbSBhbHRob3VnaCBJIGRpc2xpa2UgdGhpcyBwYXRoLAo+IEkn
bSBub3Qgc3VyZSB3aGF0IHRoaXMgYnJpbmdzLgo+Cj4gVGhlIGN1cnJlbnQgY29kZSBmbG93IHRv
IG1lIGlzIGZvciBTWVNURU0tPlRUIGRvbWFpbgo+Cj4gdHRtX3R0X2NyZWF0ZQo+IHR0bV90dF9z
ZXRfcGxhY2VtZW50X2NhY2hpbmcgKG5ldyBwbGFjZW1lbnQpCj4gdHRtX3R0X2JpbmQgKGNhbiBj
YXVzZSBwb3B1bGF0ZSkKPiBtb3ZlX25vdGlmeQo+IHJlcGxhY2UgcG9pbnRlcnMKPiBldmljdGVk
ID0gZmFsc2UKPiByZXR1cm4KPgo+IFRoZSBuZXcgZmxvdyBsb29rcyBsaWtlCj4gdHRtX3R0X2Ny
ZWF0ZQo+IHR0bV90dF9zZXRfcGxhY2VtZW50X2NhY2hpbmcgKG5ldyBwbGFjZW1lbnQpCj4gdHRt
X3R0X2JpbmQgKGNhbiBjYXVzZSBwb3B1bGF0ZSkKPiBtb3ZlX25vdGlmeQo+ICh2aWEgdHRtX2Jv
X21vdmVfdHRtKQo+IHR0bV90dF9zZXRfcGxhY2VtZW50X2NhY2hpbmcgKG5ldyBwbGFjZW1lbnQp
Cj4gdHRtX3R0X2JpbmQKPiByZXBsYWNlIHBvaW50ZXJzCj4gKGJhY2sgdG8gbWFpbiBjb2RlKQo+
IGV2aWN0ZWQgPSBmYWxzZQo+IHJldHVybgo+Cj4gSXMgdGhlIHNlY29uZCBzZXQgcGxhY2VtZW50
IGNhY2hpbmcgZG9pbmcgc29tZXRoaW5nIGRpZmZlcmVudCBoZXJlPyBvcgo+IGlzIHRoZXJlIHNv
bWV0aGluZyB0aGF0IGhhcHBlbnMgaW4gbW92ZSBub3RpZnkgdGhhdCB3ZSBuZWVkIHRvIHNldAo+
IHRoaW5ncyBhZnRlcndhcmRzPwoKT2gsIEkgd2FzIGJsaW5kLiBIYXZlbid0IHNlZW4gdGhlIGNh
bGwgdG8gdHRtX3R0X3NldF9wbGFjZW1lbnRfY2FjaGluZygpIApkaXJlY3RseSBiZWZvcmUgdGhp
cyBvbmUuCgpTbyBmb3JnZXQgdGhpcyBvbmUsIG5lZWQgdG8ga2VlcCBzZWFyY2hpbmcgd2h5IGhp
YmVybmF0aW9uIGRvZXNuJ3Qgd29yayA6KAoKQ2hyaXN0aWFuLgoKPgo+IERhdmUuCj4KPj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
PiBDQzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jIHwgOCAtLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4gaW5kZXggZmZiZGMyMGQ4ZThkLi41ZjdlZmM5
MDk3MGUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+PiBAQCAtMjY0LDEzICsyNjQsNiBAQCBz
dGF0aWMgaW50IHR0bV9ib19oYW5kbGVfbW92ZV9tZW0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0
ICpibywKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2VycjsKPj4gICAgICAgICAgICAgICAgICB9
Cj4+IC0KPj4gLSAgICAgICAgICAgICAgIGlmIChiby0+bWVtLm1lbV90eXBlID09IFRUTV9QTF9T
WVNURU0pIHsKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKGJkZXYtPmRyaXZlci0+bW92
ZV9ub3RpZnkpCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmRldi0+ZHJpdmVy
LT5tb3ZlX25vdGlmeShibywgZXZpY3QsIG1lbSk7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAg
IGJvLT5tZW0gPSAqbWVtOwo+PiAtICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG1vdmVkOwo+
PiAtICAgICAgICAgICAgICAgfQo+PiAgICAgICAgICB9Cj4+Cj4+ICAgICAgICAgIGlmIChiZGV2
LT5kcml2ZXItPm1vdmVfbm90aWZ5KQo+PiBAQCAtMjkzLDcgKzI4Niw2IEBAIHN0YXRpYyBpbnQg
dHRtX2JvX2hhbmRsZV9tb3ZlX21lbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+PiAg
ICAgICAgICAgICAgICAgIGdvdG8gb3V0X2VycjsKPj4gICAgICAgICAgfQo+Pgo+PiAtbW92ZWQ6
Cj4+ICAgICAgICAgIGJvLT5ldmljdGVkID0gZmFsc2U7Cj4+Cj4+ICAgICAgICAgIGN0eC0+Ynl0
ZXNfbW92ZWQgKz0gYm8tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZUOwo+PiAtLQo+PiAyLjE3LjEK
Pj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
