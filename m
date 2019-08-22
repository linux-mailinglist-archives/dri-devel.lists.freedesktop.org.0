Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1C59A24E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 23:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3906EB3D;
	Thu, 22 Aug 2019 21:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6266EB3D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 21:42:59 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 303AC859FE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 21:42:59 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id y188so7212132qke.18
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 14:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=IU3Ee92FEBHHi781zf8T2oO/hO/CA2qUkC/qphKOTdg=;
 b=dcBUuhWFL6rf2dg4clq2V4jfBzomZSjApLt9BJyvn4TySfkoCVq29urUe47DRn/rtt
 fCQn/4P0LRM0mL2Puv99pY51PgoNWtN4tA80M5+Qc/q/4HruI7e3NWOF15Bz+qi0XHAk
 OdkXuCxNtJKtcZpg1gvR6PHrh8S4KAyXRg4hPf/CyJn5MmGEVwKCsNy+qfMsjrlXOs7X
 zg1FngtWPPoxy+olqIOR61kePVLMmyYsEtIomsfyoZQPzQF5+SmDFWNpQlkO43U70DZI
 U7njKOmdpSRdBtc9j2uIc9Ry2+UOJclKNLmWO8r9yWicnlmrOW3hSm2huGE2UuqCQHmQ
 mnQA==
X-Gm-Message-State: APjAAAUlpI6Ia5sQi0lA9xpoGUgbbs+vcWODy+LPudn8qVhiRP8UIJi6
 5Hi0ICMg9c6SsDrjoEQkDCl0t7h2+IZDj1viBWfGCJpVnDK3hCAmnKj0VlGu4/T5kIasPD0XIBB
 Yu3CD9xbndpTssjIo/DgsI4Klu94J
X-Received: by 2002:a0c:81b8:: with SMTP id 53mr1427612qvd.91.1566510178241;
 Thu, 22 Aug 2019 14:42:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkaqcSjH8MAzTw9Y5ZWBKmpKvVClxwZEvjFu/WghEeCVpN7n6ux7xDTUtb6EQj/CvEZJ8h5g==
X-Received: by 2002:a0c:81b8:: with SMTP id 53mr1427602qvd.91.1566510177986;
 Thu, 22 Aug 2019 14:42:57 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id q13sm469420qkm.120.2019.08.22.14.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 14:42:57 -0700 (PDT)
Message-ID: <42c1aea5306a807e35fc154a8dc17e3921f4d90b.camel@redhat.com>
Subject: Re: [PATCH v4 1/5] drm/dp-mst: Add PBN calculation for DSC modes
From: Lyude Paul <lyude@redhat.com>
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Date: Thu, 22 Aug 2019 17:42:55 -0400
In-Reply-To: <20190822135741.12923-2-David.Francis@amd.com>
References: <20190822135741.12923-1-David.Francis@amd.com>
 <20190822135741.12923-2-David.Francis@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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

QWdoLCBzb3JyeSB0byBnbyBiYWNrIG9uIHRoaXMgLSBJJ20gbm90aWNpbmcgYSBsb3QgbW9yZSBj
aGFuZ2VzIHdlIHNob3VsZCBoYXZlCm5vdyB0aGF0IEkndmUgYmVlbiBhYmxlIGFwcGx5IHRoaXMg
bG9jYWxseSB0byBteSB0cmVlLiBTZWUgYmVsb3c6CgpPbiBUaHUsIDIwMTktMDgtMjIgYXQgMDk6
NTcgLTA0MDAsIERhdmlkIEZyYW5jaXMgd3JvdGU6Cj4gV2l0aCBEU0MsIGJwcCBjYW4gYmUgYSBt
dWx0aXBsZSBvZiAxLzE2LCBzbwo+IGRybV9kcF9jYWxjX3Bibl9tb2RlIGlzIGluc3VmZmljaWVu
dC4KPiAKPiBBZGQgZHJtX2RwX2NhbGNfcGJuX21vZGVfZHNjLCBhIGZ1bmN0aW9uIHdoaWNoIGlz
Cj4gdGhlIHNhbWUgYXMgZHJtX2RwX2NhbGNfcGJuX21vZGUsIGJ1dCB0aGUgYnBwIGlzCj4gaW4g
dW5pdHMgb2YgMS8xNi4KPiAKPiBSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCA0MyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxw
ZXIuaCAgICAgICB8ICAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4g
aW5kZXggODJhZGQ3MzZlMTdkLi44ZTJlNzMxYzM1YzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMKPiBAQCAtMzU5MSw2ICszNTkxLDQ5IEBAIHN0YXRpYyBpbnQgdGVz
dF9jYWxjX3Bibl9tb2RlKHZvaWQpCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiArLyoqCj4gKyAq
IGRybV9kcF9jYWxjX3Bibl9tb2RlX2RzYygpIC0gQ2FsY3VsYXRlIHRoZSBQQk4gZm9yIGEgbW9k
ZSB3aXRoIERTQwo+IGVuYWJsZWQuCj4gKyAqIEBjbG9jazogZG90IGNsb2NrIGZvciB0aGUgbW9k
ZQo+ICsgKiBAZHNjX2JwcDogZHNjIGJpdHMgcGVyIHBpeGVsIHgxNiAoZS5nLiBkc2NfYnBwID0g
MTM2IGlzIDguNSBicHApCj4gKyAqCj4gKyAqIFRoaXMgdXNlcyB0aGUgZm9ybXVsYSBpbiB0aGUg
c3BlYyB0byBjYWxjdWxhdGUgdGhlIFBCTiB2YWx1ZSBmb3IgYSBtb2RlLAo+ICsgKiBnaXZlbiB0
aGF0IHRoZSBtb2RlIGlzIHVzaW5nIERTQwo+ICsgKiBSZXR1cm5zOgo+ICsgKiBQQk4gcmVxdWly
ZWQgZm9yIHRoaXMgbW9kZQo+ICsgKi8KPiAraW50IGRybV9kcF9jYWxjX3Bibl9tb2RlX2RzYyhp
bnQgY2xvY2ssIGludCBkc2NfYnBwKQo+ICt7Cj4gKwl1NjQga2JwczsKPiArCXM2NCBwZWFrX2ti
cHM7Cj4gKwl1MzIgbnVtZXJhdG9yOwo+ICsJdTMyIGRlbm9taW5hdG9yOwo+ICsKPiArCWticHMg
PSBjbG9jayAqIGRzY19icHA7Cj4gKwo+ICsJLyoKPiArCSAqIG1hcmdpbiA1MzAwcHBtICsgMzAw
cHBtIH4gMC42JSBhcyBwZXIgc3BlYywgZmFjdG9yIGlzIDEuMDA2Cj4gKwkgKiBUaGUgdW5pdCBv
ZiA1NC82NE1ieXRlcy9zZWMgaXMgYW4gYXJiaXRyYXJ5IHVuaXQgY2hvc2VuIGJhc2VkIG9uCj4g
KwkgKiBjb21tb24gbXVsdGlwbGllciB0byByZW5kZXIgYW4gaW50ZWdlciBQQk4gZm9yIGFsbCBs
aW5rIHJhdGUvbGFuZQo+ICsJICogY291bnRzIGNvbWJpbmF0aW9ucwo+ICsJICogY2FsY3VsYXRl
Cj4gKwkgKiBwZWFrX2ticHMgKj0gKDEvMTYpIGJwcHgxNiB0byBicHAKPiArCSAqIHBlYWtfa2Jw
cyAqPSAoMTAwNi8xMDAwKQo+ICsJICogcGVha19rYnBzICo9ICg2NC81NCkKPiArCSAqIHBlYWtf
a2JwcyAqPSA4ICAgIGNvbnZlcnQgdG8gYnl0ZXMKPiArCSAqCj4gKwkgKiBEaXZpZGUgbnVtZXJh
dG9yIGFuZCBkZW5vbWluYXRvciBieSAxNiB0byBhdm9pZCBvdmVyZmxvdwo+ICsJICovCj4gKwo+
ICsJbnVtZXJhdG9yID0gNjQgKiAxMDA2IC8gMTY7Cj4gKwlkZW5vbWluYXRvciA9IDU0ICogOCAq
IDEwMDAgKiAxMDAwOwo+ICsKPiArCWticHMgKj0gbnVtZXJhdG9yOwo+ICsJcGVha19rYnBzID0g
ZHJtX2ZpeHBfZnJvbV9mcmFjdGlvbihrYnBzLCBkZW5vbWluYXRvcik7Cj4gKwo+ICsJcmV0dXJu
IGRybV9maXhwMmludF9jZWlsKHBlYWtfa2Jwcyk7Cj4gK30KPiArRVhQT1JUX1NZTUJPTChkcm1f
ZHBfY2FsY19wYm5fbW9kZV9kc2MpOwoKSSBkaWRuJ3Qgbm90aWNlIHVudGlsIG5vdyB0aGF0IHRo
ZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgdHdvIGZ1bmN0aW9ucwppcwoKbnVtZXJhdG9y
ID0gNjQgKiAxMDA2IC8gMTY7CgpTbyBpdCBkb2Vzbid0IHNlZW0gbGlrZSBpdCdzIHdvcnRoIGhh
dmluZyB0d28gc2VwZXJhdGUgZnVuY3Rpb25zIGZvciB0aGlzLCBzbwpsZXQncyBqdXN0IGdldCBy
aWQgb2YgZHJtX2RwX2NhbGNfcGJuX21vZGVfZHNjKCkgYW5kIGNvbWJpbmUgaXQgd2l0aApkcm1f
ZHBfY2FsY19wYm5fbW9kZSgpIGJ5IGFkZGluZyBhIGJvb2wgcGFyYW1ldGVyIHRvIHNwZWNpZnkg
d2hldGhlciBvciBub3QKd2UncmUgY2FsY3VsYXRpbmcgZm9yIGRzYwoKPiArCj4gIC8qIHdlIHdh
bnQgdG8ga2ljayB0aGUgVFggYWZ0ZXIgd2UndmUgYWNrIHRoZSB1cC9kb3duIElSUXMuICovCj4g
IHN0YXRpYyB2b2lkIGRybV9kcF9tc3Rfa2lja190eChzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9n
eV9tZ3IgKm1ncikKPiAgewo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hl
bHBlci5oCj4gYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCj4gaW5kZXggMmJhNjI1
M2VhNmQzLi5kZGI1MThmMjE1N2EgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX21z
dF9oZWxwZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKPiBAQCAt
NjExLDcgKzYxMSw3IEBAIHN0cnVjdCBlZGlkICpkcm1fZHBfbXN0X2dldF9lZGlkKHN0cnVjdCBk
cm1fY29ubmVjdG9yCj4gKmNvbm5lY3Rvciwgc3RydWN0IGRybV9kcF8KPiAgCj4gIAo+ICBpbnQg
ZHJtX2RwX2NhbGNfcGJuX21vZGUoaW50IGNsb2NrLCBpbnQgYnBwKTsKPiAtCj4gK2ludCBkcm1f
ZHBfY2FsY19wYm5fbW9kZV9kc2MoaW50IGNsb2NrLCBpbnQgZHNjX2JwcCk7Cj4gIAo+ICBib29s
IGRybV9kcF9tc3RfYWxsb2NhdGVfdmNwaShzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3Ig
Km1nciwKPiAgCQkJICAgICAgc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCwgaW50IHBibiwg
aW50Cj4gc2xvdHMpOwotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
