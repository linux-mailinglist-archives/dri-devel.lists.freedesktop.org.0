Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805ACAE1DC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 03:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFA189BF4;
	Tue, 10 Sep 2019 01:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCC489BF4;
 Tue, 10 Sep 2019 01:17:01 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id k13so18416733ioj.1;
 Mon, 09 Sep 2019 18:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fg07MweLHH4wwPyRQaIsuq/bTMsYPypgSVQcw/P+MR0=;
 b=TKn9lJnnLSENpraF25X721vFcTYDLPlwlxa/GpAvRgbzdgFcSUdrVQKSOzFEDhaBBe
 wJ8aSbv2Ha6faunBoKMGdKq8fvyfkfkjqOmjp13ZohivrrzAc4RW6jsJhuJEtAx88DCE
 2TypMUHJjI887h77F7faqjgIsxF1crYZeQ64h1AHgaG68FT6Tm5VuSiQBk3KKMmZ5HHz
 EalTS/Zv/XFR06p2yV2eVi+2DO4PMOigWJotdr5rAvSNxQ3fbAhYfXNHwwT/JtRjMbKB
 FJfvplsfZEtuUO4t9stb7nIJRnPLAjKcGlOd0qAE1EmxoHGUtezeWUQ+v9xqrXIiMo63
 H+Lw==
X-Gm-Message-State: APjAAAVCrAQrtVovhdfy8mf7kvUQoQjmC8IbwZPq+kWhiCAJa4f1Zuvn
 VXY30wom+T1643wXSUTQU/ldI6yemmkmgZIFqOQ=
X-Google-Smtp-Source: APXvYqwZLqBFcmbEZwhjb9lNyCjHpoASHU6acW71ZcdmWqXHot1wHyGGIn4FaToWl3Rdc/vej10yEYc7PCqksQO+J8s=
X-Received: by 2002:a02:ad0e:: with SMTP id s14mr28514301jan.97.1568078219833; 
 Mon, 09 Sep 2019 18:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190908024800.23229-1-anarsoul@gmail.com>
 <CAKGbVbt056DyZHer1bKnAv8uBCX6zbsWeMjE6AQy8HYQf7L1wg@mail.gmail.com>
 <3263343.nbYvo8rMJO@diego>
 <CA+E=qVfWYd8QdEi=h7JL=AVV+ehpP=GZ3cUsZ1Cbhh0O5xn1ng@mail.gmail.com>
In-Reply-To: <CA+E=qVfWYd8QdEi=h7JL=AVV+ehpP=GZ3cUsZ1Cbhh0O5xn1ng@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 10 Sep 2019 09:16:48 +0800
Message-ID: <CAKGbVbskXmWJOrRWOSJ2f1dN7VAKTosLmYEA_n6fn+AjQnBj9Q@mail.gmail.com>
Subject: Re: [Lima] [PATCH] drm/lima: fix lima_gem_wait() return value
To: Vasily Khoruzhick <anarsoul@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fg07MweLHH4wwPyRQaIsuq/bTMsYPypgSVQcw/P+MR0=;
 b=h7VXX4xJlyJnzFkKo+dr0BzEin5+6/viDKTQYzDMLynP0Nez9ia4CzqgR8UELh+wuU
 4OXshvpNw2uLG784aBIaeo+KpiEcByJ8FKAYe4PU+gu2/czPplW+U941caT0RC3QVwvv
 U/KXBYQgzeN90M+y+T2pb5VVxY2rbWES54at95Xowh4HbYwYiQMLiQtvOgteW3Fq3zA6
 mzZckfTOJnq0XASKg0BvPJe1EWW7UE1jvIU+FnLHt/WKAfQnrxk9Z+zF1jG4m7DrFxxC
 aR92Z++Gj9EKPV2vCMp1dOFsJWq9wBQ65g93zewuehBfwKvvgmkPMD/jX4MaBcd0B+co
 ujQA==
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 stable@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIEhlaWtvLCBJJ2xsIHB1c2ggdGhpcyBwYXRjaCB0byBkcm0tbWlzYy1maXhlcy4KCkkg
Y2FuIGFkZCB0aGUgRml4ZXMgdGFnIGJlZm9yZSBwdXNoLgoKVGhhbmtzLApRaWFuZwoKT24gVHVl
LCBTZXAgMTAsIDIwMTkgYXQgMTI6MjMgQU0gVmFzaWx5IEtob3J1emhpY2sgPGFuYXJzb3VsQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCA5LCAyMDE5IGF0IDU6MTggQU0gSGVpa28g
U3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4gPgo+ID4gSGkgUWlhbmcsCj4gPgo+
ID4gQW0gTW9udGFnLCA5LiBTZXB0ZW1iZXIgMjAxOSwgMDQ6MzA6NDMgQ0VTVCBzY2hyaWViIFFp
YW5nIFl1Ogo+ID4gPiBPaCwgSSB3YXMgbWlzcyBsZWFkaW5nIGJ5IHRoZSBkcm1fZ2VtX3Jlc2Vy
dmF0aW9uX29iamVjdF93YWl0Cj4gPiA+IGNvbW1lbnRzLiBQYXRjaCBpczoKPiA+ID4gUmV2aWV3
ZWQtYnk6IFFpYW5nIFl1IDx5dXE4MjVAZ21haWwuY29tPgo+ID4gPgo+ID4gPiBJJ2xsIGFwcGx5
IHRoaXMgcGF0Y2ggdG8gZHJtLW1pc2MtbmV4dC4KPiA+ID4KPiA+ID4gQ3VycmVudCBrZXJuZWwg
cmVsZWFzZSBpcyA1LjMtcmM4LCBpcyBpdCB0b28gbGF0ZSBmb3IgdGhpcyBmaXggdG8gZ28KPiA+
ID4gaW50byB0aGUgbWFpbmxpbmUgNS4zIHJlbGVhc2U/Cj4gPiA+IEknZCBsaWtlIHRvIGtub3cg
aG93IHRvIGFwcGx5IHRoaXMgZml4IGZvciBjdXJyZW50IHJjIGtlcm5lbHMsIGJ5Cj4gPiA+IGRy
bS1taXNjLWZpeGVzPyBDYW4gSSBwdXNoCj4gPiA+IHRvIGRybS1taXNjLWZpeGVzIGJ5IGRpbSBv
ciBJIGNhbiBvbmx5IHB1c2ggdG8gZHJtLW1pc2MtbmV4dCBhbmQKPiA+ID4gZHJtLW1pc2MgbWFp
bnRhaW5lciB3aWxsCj4gPiA+IHBpY2sgZml4ZXMgZnJvbSBpdCB0byBkcm0tbWlzYy1maXhlcz8K
PiA+Cj4gPiBkcm0tbWlzYy1maXhlcyBnZXRzIG1lcmdlZCBpbnRvIGRybS1taXNjLW5leHQgYnkg
bWFpbnRhaW5lcnMgcmVndWxhcmx5LAo+ID4gc28gSSBfdGhpbmtfIHlvdSBzaG91bGQgYXBwbHkg
dGhlIGZpeC1wYXRjaCB0byBkcm0tbWlzYy1maXhlcyBmaXJzdC4KPiA+IFtJIGFsc28gYWx3YXlz
IGhhdmUgdG8gcmVhZCB0aGUgZG9jdW1lbnRhdGlvbiA7LSkgXQo+ID4KPiA+IEluIGFueSBjYXNl
IHlvdSBtaWdodCB3YW50IHRvIGFkZCBhICJGaXhlczogLi4uLi4iIHRhZyBhcyB3ZWxsIGFzIGEK
PiA+ICJDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyIgdGFnLCBzbyBpdCBjYW4gYmUgYmFja3Bv
cnRlZCB0byBzdGFibGUKPiA+IGtlcm5lbHMgaWYgYXBwbGljYWJsZS4KPgo+IENjOiBzdGFibGUg
aXMgYWxyZWFkeSBoZXJlLCBidXQgSSB0aGluayBpdCBzdGlsbCBuZWVkcyAiRml4ZXM6ICIgdGFn
Lgo+Cj4gUWlhbmcsIGNhbiB5b3UgYWRkIGl0IGF0IHlvdXIgc2lkZSBvciB5b3Ugd2FudCBtZSB0
byByZXNlbmQgdGhlIHBhdGNoPwo+Cj4gPgo+ID4gSGVpa28KPiA+Cj4gPiA+IE9uIFN1biwgU2Vw
IDgsIDIwMTkgYXQgMTA6NDggQU0gVmFzaWx5IEtob3J1emhpY2sgPGFuYXJzb3VsQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBkcm1fZ2VtX3Jlc2VydmF0aW9uX29iamVjdF93YWl0
KCkgcmV0dXJucyAwIGlmIGl0IHN1Y2NlZWRzIGFuZCAtRVRJTUUKPiA+ID4gPiBpZiBpdCB0aW1l
b3V0cywgYnV0IGxpbWEgZHJpdmVyIGFzc3VtZWQgdGhhdCAwIGlzIGVycm9yLgo+ID4gPiA+Cj4g
PiA+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBW
YXNpbHkgS2hvcnV6aGljayA8YW5hcnNvdWxAZ21haWwuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+
ICBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbS5jIHwgMiArLQo+ID4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPgo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2xpbWEvbGltYV9nZW0uYwo+ID4gPiA+IGluZGV4IDQ3N2MwZjc2NjY2My4uYjYwOWRjMDMw
ZDZjIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtLmMK
PiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbS5jCj4gPiA+ID4gQEAg
LTM0Miw3ICszNDIsNyBAQCBpbnQgbGltYV9nZW1fd2FpdChzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUs
IHUzMiBoYW5kbGUsIHUzMiBvcCwgczY0IHRpbWVvdXRfbnMpCj4gPiA+ID4gICAgICAgICB0aW1l
b3V0ID0gZHJtX3RpbWVvdXRfYWJzX3RvX2ppZmZpZXModGltZW91dF9ucyk7Cj4gPiA+ID4KPiA+
ID4gPiAgICAgICAgIHJldCA9IGRybV9nZW1fcmVzZXJ2YXRpb25fb2JqZWN0X3dhaXQoZmlsZSwg
aGFuZGxlLCB3cml0ZSwgdGltZW91dCk7Cj4gPiA+ID4gLSAgICAgICBpZiAocmV0ID09IDApCj4g
PiA+ID4gKyAgICAgICBpZiAocmV0ID09IC1FVElNRSkKPiA+ID4gPiAgICAgICAgICAgICAgICAg
cmV0ID0gdGltZW91dCA/IC1FVElNRURPVVQgOiAtRUJVU1k7Cj4gPiA+ID4KPiA+ID4gPiAgICAg
ICAgIHJldHVybiByZXQ7Cj4gPiA+ID4gLS0KPiA+ID4gPiAyLjIzLjAKPiA+ID4gPgo+ID4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBsaW1h
IG1haWxpbmcgbGlzdAo+ID4gPiBsaW1hQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbWEKPiA+Cj4gPgo+
ID4KPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
