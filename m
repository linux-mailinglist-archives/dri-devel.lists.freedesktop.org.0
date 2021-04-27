Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C46B936CEBB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 00:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE1C6E9FA;
	Tue, 27 Apr 2021 22:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455E36E9FA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 22:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619563497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EgiXRmMXa3NJldt/X/DsEnucIqp2KsWziXQ4O//7F28=;
 b=OnbQToJ2D1OqGzX9zBaJ5KS++0p5Gyo4OTHEwTtgUOWto+NSYtRR6b9aULVJlmb750abX6
 I9fPxxEOFw1FO3kU2KisbtY6UnfpiDzhJy3qaW7Sc6VNnIu1n8hrKNhmbEHtZVp+fPyo7m
 oNKGLr6/uRsFBJpPlxkvN//JkkpCZJo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-RCB2vVDQNH6tL5iRU_z7TQ-1; Tue, 27 Apr 2021 18:44:54 -0400
X-MC-Unique: RCB2vVDQNH6tL5iRU_z7TQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 p8-20020a05622a0488b02901bab8dfa0c5so4345181qtx.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 15:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=EgiXRmMXa3NJldt/X/DsEnucIqp2KsWziXQ4O//7F28=;
 b=QBO/J1DE13f1VwfwZPv8+4hCxrciifAEUqL3dJMOxHH2UDojL2fXITBgIr3YOUP98e
 qO+NkrmkJRhF417CpR6Hvo1spgJ5+XNwe7uevy1zrhq1+X/0GlboUFpzEl093nqLUoxj
 so87ugqYxeue6yRDID/maZTUs1WgZKIjN0NQqjv387P+mTcMVf4JJT3i/vj+FayYFaFO
 rIfvUcEuarXLiaY8D9fsO3b2s1ci41MN/lQj3wTcmh7eBc25FBB7X9TF0bI9zr4+HrVy
 Uj1PU5M1aFryo0SwiX/mxlj/hjSA/RBMahDWMJD7U5vhWK1fklezCbcvstf5Zfdy80ba
 kDnw==
X-Gm-Message-State: AOAM533TOnkC+BgVmm0RzoGG51Er4yv7HbNZaUvluyCCf9Nh9K1uc1x9
 3JxyXixjHJN00EQPaQPXLIv4pgMBHPnJlSpGr9mm2hdG0xI1MOQ314xziQ+mDcOMix/ef1aGcEu
 xFaSo7wKncX3b1Hi/ADw+sdc15fyA
X-Received: by 2002:ac8:7761:: with SMTP id h1mr4639166qtu.226.1619563494342; 
 Tue, 27 Apr 2021 15:44:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW8E9WJQ40Y3UXOfq1mqkdZDksWBoxiI9VSIOGaYGWFbfX2Oo6ApE9CxLBPAUrNQWKTWwdjA==
X-Received: by 2002:ac8:7761:: with SMTP id h1mr4639146qtu.226.1619563494109; 
 Tue, 27 Apr 2021 15:44:54 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id n15sm917482qti.51.2021.04.27.15.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 15:44:53 -0700 (PDT)
Message-ID: <43482b904ef0150b6577044668dd651684590ab0.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/tegra: Get ref for DP AUX channel, not its ddc
 adapter
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Tue, 27 Apr 2021 18:44:52 -0400
In-Reply-To: <YIZu4PD6BmlGYXuc@orome.fritz.box>
References: <20210423182146.185633-1-lyude@redhat.com>
 <20210423182146.185633-2-lyude@redhat.com>
 <YIZu4PD6BmlGYXuc@orome.fritz.box>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIxLTA0LTI2IGF0IDA5OjQyICswMjAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToK
PiBPbiBGcmksIEFwciAyMywgMjAyMSBhdCAwMjoyMTo0NVBNIC0wNDAwLCBMeXVkZSBQYXVsIHdy
b3RlOgo+ID4gV2hpbGUgd2UncmUgdGFraW5nIGEgcmVmZXJlbmNlIG9mIHRoZSBEREMgYWRhcHRl
ciBmb3IgYSBEUCBBVVggY2hhbm5lbCBpbgo+ID4gdGVncmFfc29yX3Byb2JlKCkgYmVjYXVzZSB3
ZSdyZSBnb2luZyB0byBiZSB1c2luZyB0aGF0IGFkYXB0ZXIgd2l0aCB0aGUKPiA+IFNPUiwgbm93
IHRoYXQgd2UndmUgbW92ZWQgd2hlcmUgQVVYIHJlZ2lzdHJhdGlvbiBoYXBwZW5zIHRoZSBhY3R1
YWwgZGV2aWNlCj4gPiBzdHJ1Y3R1cmUgZm9yIHRoZSBEREMgYWRhcHRlciBpc24ndCBpbml0aWFs
aXplZCB5ZXQuIFdoaWNoIG1lYW5zIHRoYXQgd2UKPiA+IGNhbid0IHJlYWxseSB0YWtlIGEgcmVm
ZXJlbmNlIGZyb20gaXQgdG8gdHJ5IHRvIGtlZXAgaXQgYXJvdW5kIGFueW1vcmUuCj4gPiAKPiA+
IFRoaXMgc2hvdWxkIGJlIGZpbmUgdGhvdWdoLCBiZWNhdXNlIHdlIGNhbiBqdXN0IHRha2UgYSBy
ZWZlcmVuY2Ugb2YgaXRzCj4gPiBwYXJlbnQgaW5zdGVhZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiA+IEZpeGVzOiAzOWMxN2FlNjBlYTkg
KCJkcm0vdGVncmE6IERvbid0IHJlZ2lzdGVyIERQIEFVWCBjaGFubmVscyBiZWZvcmUKPiA+IGNv
bm5lY3RvcnMiKQo+ID4gQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gPiBDYzog
VGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KPiA+IENjOiBKb25hdGhh
biBIdW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPgo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiA+IENjOiBsaW51eC10ZWdyYUB2Z2VyLmtlcm5lbC5vcmcKPiA+IC0t
LQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgfCA2ICsrKy0tLQo+ID4gwqAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jIGIvZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL3Nvci5jCj4gPiBpbmRleCA3Yjg4MjYxZjU3YmIuLjRlMGUzYTYzZTU4NiAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL3Nvci5jCj4gPiBAQCAtMzczOSwxMSArMzczOSwxMSBAQCBzdGF0aWMgaW50IHRl
Z3JhX3Nvcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlCj4gPiAqcGRldikKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFzb3ItPmF1eCkKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRVBST0JFX0RFRkVS
Owo+ID4gwqAKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoZ2V0X2Rldmlj
ZSgmc29yLT5hdXgtPmRkYy5kZXYpKSB7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlmICh0cnlfbW9kdWxlX2dldChzb3ItPmF1eC0+ZGRjLm93bmVy
KSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoZ2V0X2RldmljZShzb3It
PmF1eC0+ZGV2KSkgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpZiAodHJ5X21vZHVsZV9nZXQoc29yLT5hdXgtPmRldi0+ZHJpdmVyLT5vd25lcikp
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgc29yLT5vdXRwdXQuZGRjID0gJnNvci0+YXV4LT5kZGM7Cj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlbHNlCj4gPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBw
dXRfZGV2aWNlKCZzb3ItPmF1eC0+ZGRjLmRldik7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwdXRfZGV2aWNlKHNvci0+
YXV4LT5kZXYpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiDCoMKg
wqDCoMKgwqDCoMKgfQo+IAo+IFVuZm9ydHVuYXRlbHksIEkgdGhpbmsgaXQncyBhIGJpdCBtb3Jl
IHN1YnRsZSB0aGFuIHRoYXQuIFRoZSByZWFzb24gZm9yCj4gdGhpcyBnZXRfZGV2aWNlKCkvdHJ5
X21vZHVsZV9nZXQoKSBkYW5jZSB3YXMgdG8gbWlycm9yIHRoZSBiZWhhdmlvdXIgb2YKPiBvZl9n
ZXRfaTJjX2FkYXB0ZXJfYnlfbm9kZSgpIHNvIHRoYXQgd2hlbiB3ZSBjYWxsIGkyY19wdXRfYWRh
cHRlcigpIGluCj4gdGVncmFfb3V0cHV0X3JlbW92ZSgpIHdlIGNvcnJlY3RseSBkZWNyZWFzZSB0
aGUgcmVmZXJlbmNlIGNvdW50Lgo+IAo+IFRoZSBhYm92ZSB3aWxsIGluY3JlYXNlIHRoZSByZWZl
cmVuY2Ugb24gdGhlIEkyQyBhZGFwdGVyJ3MgcGFyZW50IHdoaWxlCj4gaTJjX3B1dF9hZGFwdGVy
KCkgd2lsbCB0aGVuIG9ubHkgZGVjcmVhc2UgdGhlIHJlZmVyZW5jZSBvbiB0aGUgSTJDCj4gYWRh
cHRlciwgc28gSSB0aGluayBlZmZlY3RpdmVseSB3ZSdkIGJlIGxlYWtpbmcgYSByZWZlcmVuY2Ug
dG8gdGhlIEkyQwo+IGFkYXB0ZXIncyBwYXJlbnQuCj4gCj4gQWxzbywgc2luY2Ugd2UgZGlkbid0
IHRha2UgYSByZWZlcmVuY2Ugb24gdGhlIEkyQyBhZGFwdGVyIGV4cGxpY2l0bHksCj4gcmVsZWFz
aW5nIHRoYXQgcmVmZXJlbmNlIGluIHRlZ3JhX291dHB1dF9yZW1vdmUoKSBtaWdodCBmcmVlIHRo
ZSBJMkMKPiBhZGFwdGVyIHRvbyBlYXJseS4KPiAKPiBJIHdvbmRlciBpZiBwZXJoYXBzIGl0J2Qg
YmUgZWFzaWVyIHRvIGdldCByaWQgb2YgdGhlIHN0cnVjdCB0ZWdyYV9vdXRwdXQKPiBhYnN0cmFj
dGlvbiBhbHRvZ2V0aGVyIGFuZCBwdXNoIHRoaXMgZG93biBpbnRvIHRoZSBpbmRpdmlkdWFsIGRy
aXZlcnMsCj4gZXZlbiBpZiB0aGF0IG1lYW5zIGEgYml0IG1vcmUgY29kZSBkdXBsaWNhdGlvbi4g
VGhhdCdzIG5vdCB0aGUga2luZCBvZgo+IHF1aWNrIGZpeCB0byByZXNvbHZlIHRoaXMgY3VycmVu
dCBzaXR1YXRpb24sIHNvIHBlcmhhcHMgYXMgYSBzdG9wLWdhcCB3ZQo+IGp1c3QgbmVlZCB0byBz
cHJpbmtsZSBhIGZldyBtb3JlIGNvbmRpdGlvbmFscyB0aHJvdWdob3V0IHRlZ3JhX291dHB1dAo+
IGNvZGUuIFdlIGNvdWxkLCBmb3IgZXhhbXBsZSwgYXZvaWQgY2FsbGluZyBpMmNfcHV0X2FkYXB0
ZXIoKSBpbgo+IHRlZ3JhX291dHB1dF9yZW1vdmUoKSBmb3IgdGhlIERpc3BsYXlQb3J0IGNhc2Vz
IGFuZCBpbnN0ZWFkIG1hbnVhbGx5Cj4gcmVsZWFzZSB0aGUgcmVmZXJlbmNlIHRvIHRoZSBJMkMg
YWRhcHRlcidzIHBhcmVudCBpbiB0ZWdyYV9zb3JfcmVtb3ZlKCkuCj4gT24gdG9wIG9mIHlvdXIg
cGF0Y2ggYWJvdmUgdGhhdCAvc2hvdWxkLyBmaXggdGhpbmdzIHByb3Blcmx5IGZvciBub3cuCgpB
bHJpZ2h0IC0gSSB3aWxsIHRyeSB0byBnZXQgdG8gdGhpcyB0b21vcnJvdwoKPiAKPiBUaGllcnJ5
CgotLSAKQ2hlZXJzLAogTHl1ZGUgUGF1bCAoc2hlL2hlcikKIFNvZnR3YXJlIEVuZ2luZWVyIGF0
IFJlZCBIYXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
