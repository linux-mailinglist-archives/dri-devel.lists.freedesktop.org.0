Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF40CF5F5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 11:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F7A6E122;
	Tue,  8 Oct 2019 09:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63E56E122
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 09:25:56 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id r9so14982270edl.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 02:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=8FLTNDeQpw5ic8RVn6DsnVa758Xb9dG4nxfxq0sKO2E=;
 b=ubf9GLqs/R0CbE18Vmiu9n8iai2dlHNM33thvnsJyj8q8KWiB2ZvC/mPkrOAly94CO
 kNwuzW3WJwG1w4Yok8HVAJA0CZu37vEZ9u5R/ZLwM+9TqgzxFgTwq7uo6DjCMKE4IbpF
 8XsG7QlIQyuU42oWv48t2IfSKyATLvORAP9sJDP5foaSpWV3p1V972K3WTahC9h3GMI3
 t5TYW095czlRiLvkKeIyhHqhHUHqX6eHV6wQvtpdEnecvAW9WdyxBP42bj1msV+ti3RH
 3Iv6+IWawAEI5RRmCrYmPAjcUgnqVVoBwwH85dBDxxYCetVOrVU1S72qTrJfDfD7mnhu
 RSfg==
X-Gm-Message-State: APjAAAVqaVHZF8Z41g8zqZKfeQvKwZVXYz928UjTf5Ow6X55RDVFunTu
 xoIqEWkHUkgcYwjVC5cq2tWDXA==
X-Google-Smtp-Source: APXvYqxZSLLTGUD1CwFlRjRk0T91rOBLKbkbtn+YdWvMVYfBnJL3PUkaczNDbRLz4gJs02C4wNw6yw==
X-Received: by 2002:a17:906:b298:: with SMTP id
 q24mr27677774ejz.168.1570526755266; 
 Tue, 08 Oct 2019 02:25:55 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id g15sm3721014edp.0.2019.10.08.02.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 02:25:54 -0700 (PDT)
Date: Tue, 8 Oct 2019 11:25:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/4] drm/ttm: use the parent resv for ghost objects v2
Message-ID: <20191008092552.GG16989@phenom.ffwll.local>
References: <20190829142917.13058-1-christian.koenig@amd.com>
 <20190829142917.13058-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829142917.13058-3-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=8FLTNDeQpw5ic8RVn6DsnVa758Xb9dG4nxfxq0sKO2E=;
 b=LAZ46mJUFAxcnWOyo+nJpPksfRTymGrZL6YYd+E7a+cjrRURnGcoF6tYsGF/NUCFT+
 e1MS6jNo3DWKh0PAxOG0QL72CXSoMolMNu2qvX/p7ubl3LSBto/qHVvPn5MN6KYnlY/X
 CJ4yTrWPX2y4MzrTK3h+DfQDr8/xcyWDvi6KY=
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDQ6Mjk6MTVQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBUaGlzIHdheSB3ZSBjYW4gZXZlbiBwaXBlbGluZSBpbXBvcnRlZCBCTyBldmlj
dGlvbnMuCj4gCj4gdjI6IExpbWl0IHRoaXMgdG8gb25seSBjYXNlcyB3aGVuIHRoZSBwYXJlbnQg
b2JqZWN0IHVzZXMgYSBzZXBhcmF0ZQo+ICAgICByZXNlcnZhdGlvbiBvYmplY3QgYXMgd2VsbC4g
VGhpcyBmaXhlcyBhbm90aGVyIE9PTSBwcm9ibGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KClNpbmNlIEkgcmVhZCBxdWl0
ZSBhIGJpdCBvZiB0dG0gSSBmaWd1cmVkIEknbGwgcmV2aWV3IHRoaXMgdG9vLCBidXQgSSdtCnRv
dGFsbHkgbG9zdC4gQW5kIGdpdCBibGFtZSBnaXZlcyBtZSBhdCBiZXN0IGNvbW1pdHMgd2l0aCBv
bmUtbGluZXIgY29tbWl0Cm1lc3NhZ2VzLCBhbmQgdGhlIGRvY3MgYXJlbid0IGV4cGxhaW5pbmcg
bXVjaCBhdCBhbGwgZWl0aGVyIChhbmQgZ2VuZXJhbGx5CnRoZXkgZGlkbid0IGdldCB1cGRhdGVk
IGF0IGFsbCB3aXRoIGFsbCB0aGUgY2hhbmdlcyBpbiB0aGUgcGFzdCB5ZWFycykuIAoKSSBoYXZl
IGEgdmFndWUgaWRlYSBvZiB3aGF0IHlvdSdyZSBkb2luZyBoZXJlLCBidXQgbm90IGVub3VnaCB0
byBkbyByZXZpZXcKd2l0aCBhbnkgY29uZmlkZW5jZS4gQW5kIGZyb20gb3RoZXIgdHRtIHBhdGNo
ZXMgZnJvbSBhbWQgaXQgZmVlbHMgYSBsb3QKbGlrZSB3ZSBoYXZlIGVzc2VudGlhbGx5IGEgYnVz
IGZhY3RvciBvZiAxIGZvciBhbGwgdGhpbmdzIHR0bSA6LS8KLURhbmllbAoKPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIHwgMTYgKysrKysrKysrLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9ib191dGlsLmMKPiBpbmRleCBmZTgxYzU2NWU3ZWYuLjJlYmU5ZmU3ZjZjOCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiBAQCAtNTE3LDcgKzUxNyw5IEBAIHN0
YXRpYyBpbnQgdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIoc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibywKPiAgCWtyZWZfaW5pdCgmZmJvLT5iYXNlLmtyZWYpOwo+ICAJZmJvLT5iYXNlLmRl
c3Ryb3kgPSAmdHRtX3RyYW5zZmVyZWRfZGVzdHJveTsKPiAgCWZiby0+YmFzZS5hY2Nfc2l6ZSA9
IDA7Cj4gLQlmYm8tPmJhc2UuYmFzZS5yZXN2ID0gJmZiby0+YmFzZS5iYXNlLl9yZXN2Owo+ICsJ
aWYgKGJvLT5iYXNlLnJlc3YgPT0gJmJvLT5iYXNlLl9yZXN2KQo+ICsJCWZiby0+YmFzZS5iYXNl
LnJlc3YgPSAmZmJvLT5iYXNlLmJhc2UuX3Jlc3Y7Cj4gKwo+ICAJZG1hX3Jlc3ZfaW5pdChmYm8t
PmJhc2UuYmFzZS5yZXN2KTsKPiAgCXJldCA9IGRtYV9yZXN2X3RyeWxvY2soZmJvLT5iYXNlLmJh
c2UucmVzdik7Cj4gIAlXQVJOX09OKCFyZXQpOwo+IEBAIC03MTYsNyArNzE4LDcgQEAgaW50IHR0
bV9ib19tb3ZlX2FjY2VsX2NsZWFudXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAg
CQlpZiAocmV0KQo+ICAJCQlyZXR1cm4gcmV0Owo+ICAKPiAtCQlkbWFfcmVzdl9hZGRfZXhjbF9m
ZW5jZShnaG9zdF9vYmotPmJhc2UucmVzdiwgZmVuY2UpOwo+ICsJCWRtYV9yZXN2X2FkZF9leGNs
X2ZlbmNlKCZnaG9zdF9vYmotPmJhc2UuX3Jlc3YsIGZlbmNlKTsKPiAgCj4gIAkJLyoqCj4gIAkJ
ICogSWYgd2UncmUgbm90IG1vdmluZyB0byBmaXhlZCBtZW1vcnksIHRoZSBUVE0gb2JqZWN0Cj4g
QEAgLTcyOSw3ICs3MzEsNyBAQCBpbnQgdHRtX2JvX21vdmVfYWNjZWxfY2xlYW51cChzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAJCWVsc2UKPiAgCQkJYm8tPnR0bSA9IE5VTEw7Cj4g
IAo+IC0JCXR0bV9ib191bnJlc2VydmUoZ2hvc3Rfb2JqKTsKPiArCQlkbWFfcmVzdl91bmxvY2so
Jmdob3N0X29iai0+YmFzZS5fcmVzdik7Cj4gIAkJdHRtX2JvX3B1dChnaG9zdF9vYmopOwo+ICAJ
fQo+ICAKPiBAQCAtNzcyLDcgKzc3NCw3IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfbW92ZShzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAJCWlmIChyZXQpCj4gIAkJCXJldHVybiByZXQ7
Cj4gIAo+IC0JCWRtYV9yZXN2X2FkZF9leGNsX2ZlbmNlKGdob3N0X29iai0+YmFzZS5yZXN2LCBm
ZW5jZSk7Cj4gKwkJZG1hX3Jlc3ZfYWRkX2V4Y2xfZmVuY2UoJmdob3N0X29iai0+YmFzZS5fcmVz
diwgZmVuY2UpOwo+ICAKPiAgCQkvKioKPiAgCQkgKiBJZiB3ZSdyZSBub3QgbW92aW5nIHRvIGZp
eGVkIG1lbW9yeSwgdGhlIFRUTSBvYmplY3QKPiBAQCAtNzg1LDcgKzc4Nyw3IEBAIGludCB0dG1f
Ym9fcGlwZWxpbmVfbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAJCWVsc2UK
PiAgCQkJYm8tPnR0bSA9IE5VTEw7Cj4gIAo+IC0JCXR0bV9ib191bnJlc2VydmUoZ2hvc3Rfb2Jq
KTsKPiArCQlkbWFfcmVzdl91bmxvY2soJmdob3N0X29iai0+YmFzZS5fcmVzdik7Cj4gIAkJdHRt
X2JvX3B1dChnaG9zdF9vYmopOwo+ICAKPiAgCX0gZWxzZSBpZiAoZnJvbS0+ZmxhZ3MgJiBUVE1f
TUVNVFlQRV9GTEFHX0ZJWEVEKSB7Cj4gQEAgLTg0MSw3ICs4NDMsNyBAQCBpbnQgdHRtX2JvX3Bp
cGVsaW5lX2d1dHRpbmcoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiAgCWlmIChyZXQp
Cj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gLQlyZXQgPSBkbWFfcmVzdl9jb3B5X2ZlbmNlcyhnaG9z
dC0+YmFzZS5yZXN2LCBiby0+YmFzZS5yZXN2KTsKPiArCXJldCA9IGRtYV9yZXN2X2NvcHlfZmVu
Y2VzKCZnaG9zdC0+YmFzZS5fcmVzdiwgYm8tPmJhc2UucmVzdik7Cj4gIAkvKiBMYXN0IHJlc29y
dCwgd2FpdCBmb3IgdGhlIEJPIHRvIGJlIGlkbGUgd2hlbiB3ZSBhcmUgT09NICovCj4gIAlpZiAo
cmV0KQo+ICAJCXR0bV9ib193YWl0KGJvLCBmYWxzZSwgZmFsc2UpOwo+IEBAIC04NTAsNyArODUy
LDcgQEAgaW50IHR0bV9ib19waXBlbGluZV9ndXR0aW5nKHN0cnVjdCB0dG1fYnVmZmVyX29iamVj
dCAqYm8pCj4gIAliby0+bWVtLm1lbV90eXBlID0gVFRNX1BMX1NZU1RFTTsKPiAgCWJvLT50dG0g
PSBOVUxMOwo+ICAKPiAtCXR0bV9ib191bnJlc2VydmUoZ2hvc3QpOwo+ICsJZG1hX3Jlc3ZfdW5s
b2NrKCZnaG9zdC0+YmFzZS5fcmVzdik7Cj4gIAl0dG1fYm9fcHV0KGdob3N0KTsKPiAgCj4gIAly
ZXR1cm4gMDsKPiAtLSAKPiAyLjE3LjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
