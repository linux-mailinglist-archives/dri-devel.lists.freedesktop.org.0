Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D600DD130
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 23:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABB56E03C;
	Fri, 18 Oct 2019 21:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1BF6E03C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 21:28:05 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-ZsR7GoEjOgeIoMuI48ax2g-1; Fri, 18 Oct 2019 17:28:02 -0400
Received: by mail-qt1-f197.google.com with SMTP id j5so7198796qtn.10
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 14:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=L5FoxAeiOJXHENRmyifkDJ8p5JlL6buceMDaf//MHh8=;
 b=kZWUEirR3Vp08FpM05Uv88Qs6eH7pdYgq8jyyWNG6kjG1MYcrw1R+ZsWpnalJFQ5xc
 +yB0mW4ggRGy6PG+/Nnf06LmndM7gR8bFQ0rOm1DT4qlAaPuhthAhClxsRLo1XZO7iPC
 n4+krRu2p3x9n0m8nQy1pkfqv7sAaDmn9AeZNOveNEvEeY0+DIse7SxSUlvm1L4ToyRY
 p2fljvgiS4gWVs4sGagiBObbpxzEIs/kiLX8BnplBwJ4YHXwpbqdFUAuDF6VZ9fiBWkg
 bmo2Fn0tv/TYmgAyRjPEgCBwAxft4oRrZVBk46UlYCtzeDCOLSkoa6Nw9wiAYvfk2lVa
 J+yQ==
X-Gm-Message-State: APjAAAVjoR772PBW73iEx4cW3PlWoLnjMqtLVi/XXjjKy0X3Mw9kYJoX
 c438FoYyrNWnWTpIpAKtrffJotodCV73JJlUdZVgRhOSBDr0TaJJYpKa3vnRUp6mRLboUp4pqLk
 6G8mHpMzc0YjaWaIfWs8Nuq/xoKQI
X-Received: by 2002:a0c:b4d2:: with SMTP id h18mr11682134qvf.208.1571434082399; 
 Fri, 18 Oct 2019 14:28:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzIH971AEIdZo/M2v8KecWxLz1G80/RcgpXZsCmv2MR+7IWCNZwZuo5DuM6GLRM2HvZ/gOvjw==
X-Received: by 2002:a0c:b4d2:: with SMTP id h18mr11682113qvf.208.1571434082095; 
 Fri, 18 Oct 2019 14:28:02 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id o67sm3687646qkf.8.2019.10.18.14.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 14:28:00 -0700 (PDT)
Message-ID: <83d91ac4c67768d013615ee6312b84da3fb959fe.camel@redhat.com>
Subject: Re: [PATCH 06/15] drm/dp: Read AUX read interval from DPCD
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Oct 2019 17:27:59 -0400
In-Reply-To: <20191015143509.1104985-7-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
 <20191015143509.1104985-7-thierry.reding@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: ZsR7GoEjOgeIoMuI48ax2g-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571434084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6jESZyRZkhfyqEwT6oFD4MehBckngk8Mw7ublvS2Mco=;
 b=gfVs/pPVHbjBcZERF1lzYoF3a611dchMwbzDkdlIVzN4Hr8ijjtfKDp45pzHtP/dhygyxI
 aHvkRqf5yZmVp0sTKg+NCkWy3vSkAX8WGvkSyR+EX85/Squ6bZX7XKV+egfOhMtofC03Pw
 iUaMH4wfGVz9bHqyGdQ/wL+6Kj2vz4g=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTEwLTE1IGF0IDE2OjM1ICswMjAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToK
PiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IFN0b3JlIHRo
ZSBBVVggcmVhZCBpbnRlcnZhbCBmcm9tIERQQ0QsIHNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgdG8g
d2FpdAo+IGZvciB0aGUgZHVyYXRpb25zIGdpdmVuIGluIHRoZSBzcGVjaWZpY2F0aW9uIGR1cmlu
ZyBsaW5rIHRyYWluaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVk
aW5nQG52aWRpYS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCB8IDMz
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzMg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVy
LmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKPiBpbmRleCA3YTUzN2ZmYzJmYjEuLjZj
MTJkZTZmN2U0NiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKPiAr
KysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKPiBAQCAtMjUsOCArMjUsMTEgQEAKPiAg
Cj4gICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ICAjaW5jbHVkZSA8bGludXgvaTJjLmg+Cj4g
KyNpbmNsdWRlIDxsaW51eC90aW1lNjQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4g
IAo+ICsjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgo+ICsKPiAgLyoKPiAgICogVW5sZXNzIG90
aGVyd2lzZSBub3RlZCwgYWxsIHZhbHVlcyBhcmUgZnJvbSB0aGUgRFAgMS4xYSBzcGVjLiAgTm90
ZSB0aGF0Cj4gICAqIERQIGFuZCBEUENEIHZlcnNpb25zIGFyZSBpbmRlcGVuZGVudC4gIERpZmZl
cmVuY2VzIGZyb20gMS4wIGFyZSBub3QKPiBub3RlZCwKPiBAQCAtMTI5Nyw2ICsxMzAwLDM2IEBA
IGRybV9kcF9hbHRlcm5hdGVfc2NyYW1ibGVyX3Jlc2V0X2NhcChjb25zdCB1OAo+IGRwY2RbRFBf
UkVDRUlWRVJfQ0FQX1NJWkVdKQo+ICAJCQlEUF9BTFRFUk5BVEVfU0NSQU1CTEVSX1JFU0VUX0NB
UDsKPiAgfQo+ICAKPiArLyoqCj4gKyAqIGRybV9kcF9yZWFkX2F1eF9pbnRlcnZhbCgpIC0gcmVh
ZCB0aGUgQVVYIHJlYWQgaW50ZXJ2YWwgZnJvbSB0aGUgRFBDRAo+ICsgKiBAZHBjZDogcmVjZWl2
ZXIgY2FwYWNpdHkgYnVmZmVyCj4gKyAqCj4gKyAqIFJlYWRzIHRoZSBBVVggcmVhZCBpbnRlcnZh
bCAoaW4gbWljcm9zZWNvbmRzKSBmcm9tIHRoZSBEUENELiBOb3RlIHRoYXQKPiB0aGUKPiArICog
VFJBSU5JTkdfQVVYX1JEX0lOVEVSVkFMIHN0b3JlcyB0aGUgdmFsdWUgaW4gdW5pdHMgb2YgNCBt
aWxsaXNlY29uZHMuIElmCj4gbm8KPiArICogcmVhZCBpbnRlcnZhbCBpcyBzcGVjaWZpZWQgYW5k
IGZvciBEUENEIHYxLjQgYW5kIGxhdGVyLCB0aGUgcmVhZAo+IGludGVydmFsCj4gKyAqIGlzIGFs
d2F5cyAxMDAgbWljcm9zZWNvbmRzLgo+ICsgKgo+ICsgKiBSZXR1cm5zOgo+ICsgKiBUaGUgcmVh
ZCBBVVggaW50ZXJ2YWwgaW4gbWljcm9zZWNvbmRzLgo+ICsgKi8KPiArc3RhdGljIGlubGluZSB1
bnNpZ25lZCBpbnQKPiArZHJtX2RwX2F1eF9yZF9pbnRlcnZhbChjb25zdCB1OCBkcGNkW0RQX1JF
Q0VJVkVSX0NBUF9TSVpFXSkKPiArewo+ICsJdW5zaWduZWQgaW50IHJkX2ludGVydmFsID0gZHBj
ZFtEUF9UUkFJTklOR19BVVhfUkRfSU5URVJWQUxdICYKPiArCQkJCQlEUF9UUkFJTklOR19BVVhf
UkRfTUFTSzsKPiArCj4gKwlpZiAocmRfaW50ZXJ2YWwgPiA0KQo+ICsJCURSTV9ERUJVR19LTVMo
IkFVWCBpbnRlcnZhbCAldSwgb3V0IG9mIHJhbmdlIChtYXg6IDQpXG4iLAo+ICsJCQkgICAgICBy
ZF9pbnRlcnZhbCk7CkRvIHlvdSB0aGluayBpdCBtaWdodCBiZSB3b3J0aCBjbGFtcGluZyB0aGUg
dmFsdWUgdG8gNCBoZXJlPwoKPiArCj4gKwlpZiAocmRfaW50ZXJ2YWwgPiAwICYmIGRwY2RbRFBf
RFBDRF9SRVZdIDwgRFBfRFBDRF9SRVZfMTQpCgpBbHNvIHNtYWxsICBuaXQgcGljazogeW91IGNh
biBqdXN0IHVzZSByZF9pbnRlcnZhbCBpbnN0ZWFkIG9mIHJkX2ludGVydmFsID4gMAo+ICsJCXJk
X2ludGVydmFsICo9IDQgKiBVU0VDX1BFUl9NU0VDOwo+ICsJZWxzZQo+ICsJCXJkX2ludGVydmFs
ID0gMTAwOwo+ICsKPiArCXJldHVybiByZF9pbnRlcnZhbDsKPiArfQo+ICsKPiAgLyoKPiAgICog
RGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKPiAgICovCi0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
