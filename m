Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C52B3590
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BE86E84E;
	Mon, 16 Sep 2019 07:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7337B6E962
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 10:40:57 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y23so26272054ljn.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 03:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C+J9lamyA6ZW0+YfpTLXuhGXKsRf+gk+TsCwF+GvOpI=;
 b=KKLfgGFblbNfr+0ys/Ez081DGGvdjlHeRw4M9Ls5VQGsv9OkfOO8eZ77nJCs8PxOS+
 dHufzKadRg3XM90/4RQcmownzLDB1WAsfFOhVs79qhdCgQXQxBrMTax+iE6Z0JCizVTb
 WDkX10vwmMmaCPAkT6ik0QQWlkdk/HbWSPzz6ovflv3aUtzM84LYihz+58Hz0biG3Ztv
 TuSIun4VcjYagaZLSbsh7wFlATT8agnpFkRhoPybb1g40O4H+JIFZXV/kn9MlUwrqNTK
 vHjAWz83rn7T96dUROMgeoRFRW9Mwrvswv1ZKzAs2pL034Fmkw6LslAF8Lr57Jme4nza
 7z7g==
X-Gm-Message-State: APjAAAWLlSqtCkP6kyB9OujvzajxvoGins5sI53pCq0NJnTOFQI1e4WE
 JZKfaUb1/JEP2njkrw5CUugztobBq7MVnWgP5C4=
X-Google-Smtp-Source: APXvYqyXWdGRTe0VGIN11vHOaL9SKm+GCrvwjBKs9HbpkUzu1AYV8OtmYK42fcISXFrc+62Wut/8Cmn9RfKRuF7BFmI=
X-Received: by 2002:a2e:91c6:: with SMTP id u6mr12261165ljg.112.1568371255735; 
 Fri, 13 Sep 2019 03:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190912183854.28194-1-thomas_os@shipmail.org>
In-Reply-To: <20190912183854.28194-1-thomas_os@shipmail.org>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Fri, 13 Sep 2019 16:10:43 +0530
Message-ID: <CAFqt6zYVVCLXCmznkCKGhbe6+NE86KRpXyqTqZ27rh72vOJiAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: Restore ttm prefaulting
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
X-Mailman-Approved-At: Mon, 16 Sep 2019 07:28:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C+J9lamyA6ZW0+YfpTLXuhGXKsRf+gk+TsCwF+GvOpI=;
 b=LgiCq9fFfrRLWeC9Befvvw0RXITY4D3isLYXp9xmPQ0/FG9thG0kKQGS1IXuWcPW1/
 V0FyvW72B09KG20crNUhzDCcPccnjp+kvWjZbxFJ6hOFMFmFWBbSoGS51b62tvPMAz+k
 7pHvPtm6bufzxEHOKJjmlWJToQlwvrM/sQyJ+qjcPXjadI+qjR0fhY4oGyT7bEhejVih
 /WOPYFSaPDEQR3oaGiTzKu6NhSmwDgOzn3/CxosX20WQHDRWoKrGXfptm/B7oWgE61rK
 HlflR0oEMdckG7qF6rhjxDbB6B8s4OAi+En/mGv6zoD1Y4cYEG4TUHj3EKhmiuTZxFwd
 Bg6A==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Matthew Wilcox <willy@infradead.org>, pv-drivers@vmware.com,
 stable@vger.kernel.org,
 linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTI6MDkgQU0gVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2Fy
ZSkKPHRob21hc19vc0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogVGhvbWFzIEhlbGxz
dHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+Cj4gQ29tbWl0IDRkYWE0ZmJhM2EzOCAoImdw
dTogZHJtOiB0dG06IEFkZGluZyBuZXcgcmV0dXJuIHR5cGUgdm1fZmF1bHRfdCIpCj4gYnJva2Ug
VFRNIHByZWZhdWx0aW5nLiBTaW5jZSB2bWZfaW5zZXJ0X21peGVkKCkgdHlwaWNhbGx5IGFsd2F5
cyByZXR1cm5zCj4gVk1fRkFVTFRfTk9QQUdFLCBwcmVmYXVsdGluZyBzdG9wcyBhZnRlciB0aGUg
c2Vjb25kIFBURS4KPgo+IFJlc3RvcmUgKGFsbW9zdCkgdGhlIG9yaWdpbmFsIGJlaGF2aW91ci4g
VW5mb3J0dW5hdGVseSB3ZSBjYW4gbm8gbG9uZ2VyCj4gd2l0aCB0aGUgbmV3IHZtX2ZhdWx0X3Qg
cmV0dXJuIHR5cGUgZGV0ZXJtaW5lIHdoZXRoZXIgYSBwcmVmYXVsdGluZwo+IFBURSBpbnNlcnRp
b24gaGl0IGFuIGFscmVhZHkgcG9wdWxhdGVkIFBURSwgYW5kIHRlcm1pbmF0ZSB0aGUgaW5zZXJ0
aW9uCj4gbG9vcC4gSW5zdGVhZCB3ZSBjb250aW51ZSB3aXRoIHRoZSBwcmUtZGV0ZXJtaW5lZCBu
dW1iZXIgb2YgcHJlZmF1bHRzLgo+Cj4gRml4ZXM6IDRkYWE0ZmJhM2EzOCAoImdwdTogZHJtOiB0
dG06IEFkZGluZyBuZXcgcmV0dXJuIHR5cGUgdm1fZmF1bHRfdCIpCj4gQ2M6IFNvdXB0aWNrIEpv
YXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPgo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8
dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhpcyBjb21taXQgbWVyZ2VkIGludG8gNC4xOS4gTmVl
ZCB0byBDYyBzdGFibGUuCgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIHY0LjE5KwoKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyB8IDE2ICsrKysrKystLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+IGluZGV4IDVhNTgwYWRlYjlkMS4uYWExOGU4YTUzNzI3
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCj4gQEAgLTI5MCwxNSArMjkwLDEzIEBAIHZt
X2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9mYXVsdCAqdm1mLAo+
ICAgICAgICAgICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gdm1m
X2luc2VydF9wZm4oJmN2bWEsIGFkZHJlc3MsIHBmbik7Cj4KPiAtICAgICAgICAgICAgICAgLyoK
PiAtICAgICAgICAgICAgICAgICogU29tZWJvZHkgYmVhdCB1cyB0byB0aGlzIFBURSBvciBwcmVm
YXVsdGluZyB0bwo+IC0gICAgICAgICAgICAgICAgKiBhbiBhbHJlYWR5IHBvcHVsYXRlZCBQVEUs
IG9yIHByZWZhdWx0aW5nIGVycm9yLgo+IC0gICAgICAgICAgICAgICAgKi8KPiAtCj4gLSAgICAg
ICAgICAgICAgIGlmICh1bmxpa2VseSgocmV0ID09IFZNX0ZBVUxUX05PUEFHRSAmJiBpID4gMCkp
KQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+IC0gICAgICAgICAgICAgICBlbHNl
IGlmICh1bmxpa2VseShyZXQgJiBWTV9GQVVMVF9FUlJPUikpCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgZ290byBvdXRfaW9fdW5sb2NrOwo+ICsgICAgICAgICAgICAgICAvKiBOZXZlciBlcnJv
ciBvbiBwcmVmYXVsdGVkIFBURXMgKi8KPiArICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KChy
ZXQgJiBWTV9GQVVMVF9FUlJPUikpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGkg
PT0gMCkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2lvX3VubG9j
azsKPiArICAgICAgICAgICAgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBicmVhazsKPiArICAgICAgICAgICAgICAgfQo+Cj4gICAgICAgICAgICAgICAg
IGFkZHJlc3MgKz0gUEFHRV9TSVpFOwo+ICAgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoKytw
YWdlX29mZnNldCA+PSBwYWdlX2xhc3QpKQo+IC0tCj4gMi4yMC4xCj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
