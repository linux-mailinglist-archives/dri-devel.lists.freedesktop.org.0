Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DB4112CF1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 14:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868C16F4C7;
	Wed,  4 Dec 2019 13:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C676A6F4C7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 13:52:21 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y23so4914230wma.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 05:52:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=An6Y7n87V4cec/ZG6X9jG6nGGaBG7D9uoUb5EJBRrQA=;
 b=FA9UhJoIAyoq3sNvUKMVKy57/yC78bTy9OZvfmD06W5b9fjbqDWomx4XrFuwqld+Zs
 Y1beb40jM1SmVe65xzLHsOI7aj/2M/SV0qhgA/WkwzBihIOYPEFd1yAz5UvLAq2tOXoQ
 1alTo9BNzG4TSeNsJNWEj0AI+2dZQN4UK4lC6ND36wpyYmck02X9UYiaaXWc0nbNx+GM
 8mNp+R1mV8kqHEp1pkgrW37QsON3JjF+4CeJEiMCYUFhYQH7iplAR9+rUboZj9gYcIHf
 LY3lSN5/ZGxxvijZoQ5Zs8y1r+84cu3y4B/++Rxxs1+9ZQeSDGZAscJTUPFervuOv+Q+
 c7CA==
X-Gm-Message-State: APjAAAXJTeKVjI2Flj4QlP7340tnx4qodqn6h4vIrZMxMmW5Fjiu8h5/
 x+wSxbr4jbyBJG21L5oZm8k=
X-Google-Smtp-Source: APXvYqwf4epbEO4cSbnKP1ihntMY5E8nPmRKTpkePIJQuwds3Lx4tk/ZGOCpzc9XmafoGcaajIJcCQ==
X-Received: by 2002:a05:600c:1109:: with SMTP id
 b9mr27505155wma.162.1575467540467; 
 Wed, 04 Dec 2019 05:52:20 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id z11sm8279399wrt.82.2019.12.04.05.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 05:52:19 -0800 (PST)
Date: Wed, 4 Dec 2019 14:52:19 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v2 2/2] drm/ttm: Fix vm page protection handling
Message-ID: <20191204135219.GH25242@dhcp22.suse.cz>
References: <20191203104853.4378-1-thomas_os@shipmail.org>
 <20191203104853.4378-3-thomas_os@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203104853.4378-3-thomas_os@shipmail.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, pv-drivers@vmware.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlIDAzLTEyLTE5IDExOjQ4OjUzLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90
ZToKPiBGcm9tOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4gCj4g
VFRNIGdyYXBoaWNzIGJ1ZmZlciBvYmplY3RzIG1heSwgdHJhbnNwYXJlbnRseSB0byB1c2VyLXNw
YWNlLCAgbW92ZQo+IGJldHdlZW4gSU8gYW5kIHN5c3RlbSBtZW1vcnkuIFdoZW4gdGhhdCBoYXBw
ZW5zLCBhbGwgUFRFcyBwb2ludGluZyB0byB0aGUKPiBvbGQgbG9jYXRpb24gYXJlIHphcHBlZCBi
ZWZvcmUgdGhlIG1vdmUgYW5kIHRoZW4gZmF1bHRlZCBpbiBhZ2FpbiBpZgo+IG5lZWRlZC4gV2hl
biB0aGF0IGhhcHBlbnMsIHRoZSBwYWdlIHByb3RlY3Rpb24gY2FjaGluZyBtb2RlLSBhbmQKPiBl
bmNyeXB0aW9uIGJpdHMgbWF5IGNoYW5nZSBhbmQgYmUgZGlmZmVyZW50IGZyb20gdGhvc2Ugb2YK
PiBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Q6OnZtX3BhZ2VfcHJvdC4KPiAKPiBXZSB3ZXJlIHVzaW5n
IGFuIHVnbHkgaGFjayB0byBzZXQgdGhlIHBhZ2UgcHJvdGVjdGlvbiBjb3JyZWN0bHkuCj4gRml4
IHRoYXQgYW5kIGluc3RlYWQgdXNlIHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCgpIGFuZCAvIG9yCj4g
dm1mX2luc2VydF9wZm5fcHJvdCgpLgo+IEFsc28gZ2V0IHRoZSBkZWZhdWx0IHBhZ2UgcHJvdGVj
dGlvbiBmcm9tCj4gc3RydWN0IHZtX2FyZWFfc3RydWN0Ojp2bV9wYWdlX3Byb3QgcmF0aGVyIHRo
YW4gdXNpbmcgdm1fZ2V0X3BhZ2VfcHJvdCgpLgo+IFRoaXMgd2F5IHdlIGNhdGNoIG1vZGlmaWNh
dGlvbnMgZG9uZSBieSB0aGUgdm0gc3lzdGVtIGZvciBkcml2ZXJzIHRoYXQKPiB3YW50IHdyaXRl
LW5vdGlmaWNhdGlvbi4KClNvIGVzc2VudGlhbGx5IHRoaXMgc2hvdWxkIGhhdmUgYW55IG5ldyBz
aWRlIGVmZmVjdCBvbiBmdW5jdGlvbmFsaXR5IGl0CmlzIGp1c3QgbWFraW5nIGEgaGFja3kvdWds
eSBjb2RlIGxlc3Mgc28/IEluIG90aGVyIHdvcmRzIHdoYXQgYXJlIHRoZQpjb25zZXF1ZW5jZXMg
b2YgaGF2aW5nIHBhZ2UgcHJvdGVjdGlvbiBpbmNvbnNpc3RlbnQgZnJvbSB2bWEncz8KCj4gQ2M6
IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IE1pY2hhbCBI
b2NrbyA8bWhvY2tvQHN1c2UuY29tPgo+IENjOiAiTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3
aWxseUBpbmZyYWRlYWQub3JnPgo+IENjOiAiS2lyaWxsIEEuIFNodXRlbW92IiA8a2lyaWxsLnNo
dXRlbW92QGxpbnV4LmludGVsLmNvbT4KPiBDYzogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBu
dmlkaWEuY29tPgo+IENjOiAiSsOpcsO0bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgo+
IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4gUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyB8IDE0ICsrKysrKystLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9ib192bS5jCj4gaW5kZXggZTY0OTVjYTI2MzBiLi4yMDk4ZjhkNGRmYzUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPiBAQCAtMTczLDcgKzE3Myw2IEBAIHZtX2Zh
dWx0X3QgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9mYXVsdCAqdm1mLAo+ICAJ
CQkJICAgIHBnb2ZmX3QgbnVtX3ByZWZhdWx0KQo+ICB7Cj4gIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSA9IHZtZi0+dm1hOwo+IC0Jc3RydWN0IHZtX2FyZWFfc3RydWN0IGN2bWEgPSAqdm1h
Owo+ICAJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRh
Owo+ICAJc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYgPSBiby0+YmRldjsKPiAgCXVuc2lnbmVk
IGxvbmcgcGFnZV9vZmZzZXQ7Cj4gQEAgLTI0NCw3ICsyNDMsNyBAQCB2bV9mYXVsdF90IHR0bV9i
b192bV9mYXVsdF9yZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKPiAgCQlnb3RvIG91dF9p
b191bmxvY2s7Cj4gIAl9Cj4gIAo+IC0JY3ZtYS52bV9wYWdlX3Byb3QgPSB0dG1faW9fcHJvdChi
by0+bWVtLnBsYWNlbWVudCwgcHJvdCk7Cj4gKwlwcm90ID0gdHRtX2lvX3Byb3QoYm8tPm1lbS5w
bGFjZW1lbnQsIHByb3QpOwo+ICAJaWYgKCFiby0+bWVtLmJ1cy5pc19pb21lbSkgewo+ICAJCXN0
cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHggPSB7Cj4gIAkJCS5pbnRlcnJ1cHRpYmxlID0gZmFs
c2UsCj4gQEAgLTI2MCw3ICsyNTksNyBAQCB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdF9yZXNl
cnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKPiAgCQl9Cj4gIAl9IGVsc2Ugewo+ICAJCS8qIElv
bWVtIHNob3VsZCBub3QgYmUgbWFya2VkIGVuY3J5cHRlZCAqLwo+IC0JCWN2bWEudm1fcGFnZV9w
cm90ID0gcGdwcm90X2RlY3J5cHRlZChjdm1hLnZtX3BhZ2VfcHJvdCk7Cj4gKwkJcHJvdCA9IHBn
cHJvdF9kZWNyeXB0ZWQocHJvdCk7Cj4gIAl9Cj4gIAo+ICAJLyoKPiBAQCAtMjg0LDEwICsyODMs
MTEgQEAgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoc3RydWN0IHZtX2ZhdWx0
ICp2bWYsCj4gIAkJfQo+ICAKPiAgCQlpZiAodm1hLT52bV9mbGFncyAmIFZNX01JWEVETUFQKQo+
IC0JCQlyZXQgPSB2bWZfaW5zZXJ0X21peGVkKCZjdm1hLCBhZGRyZXNzLAo+IC0JCQkJCV9fcGZu
X3RvX3Bmbl90KHBmbiwgUEZOX0RFVikpOwo+ICsJCQlyZXQgPSB2bWZfaW5zZXJ0X21peGVkX3By
b3Qodm1hLCBhZGRyZXNzLAo+ICsJCQkJCQkgICAgX19wZm5fdG9fcGZuX3QocGZuLCBQRk5fREVW
KSwKPiArCQkJCQkJICAgIHByb3QpOwo+ICAJCWVsc2UKPiAtCQkJcmV0ID0gdm1mX2luc2VydF9w
Zm4oJmN2bWEsIGFkZHJlc3MsIHBmbik7Cj4gKwkJCXJldCA9IHZtZl9pbnNlcnRfcGZuX3Byb3Qo
dm1hLCBhZGRyZXNzLCBwZm4sIHByb3QpOwo+ICAKPiAgCQkvKiBOZXZlciBlcnJvciBvbiBwcmVm
YXVsdGVkIFBURXMgKi8KPiAgCQlpZiAodW5saWtlbHkoKHJldCAmIFZNX0ZBVUxUX0VSUk9SKSkp
IHsKPiBAQCAtMzE5LDcgKzMxOSw3IEBAIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0KHN0cnVj
dCB2bV9mYXVsdCAqdm1mKQo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAKPiAtCXBy
b3QgPSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MpOwo+ICsJcHJvdCA9IHZtYS0+dm1f
cGFnZV9wcm90Owo+ICAJcmV0ID0gdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHZtZiwgcHJvdCwg
VFRNX0JPX1ZNX05VTV9QUkVGQVVMVCk7Cj4gIAlpZiAocmV0ID09IFZNX0ZBVUxUX1JFVFJZICYm
ICEodm1mLT5mbGFncyAmIEZBVUxUX0ZMQUdfUkVUUllfTk9XQUlUKSkKPiAgCQlyZXR1cm4gcmV0
Owo+IC0tIAo+IDIuMjEuMAoKLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
