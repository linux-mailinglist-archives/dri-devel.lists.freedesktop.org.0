Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 695E512FDFC
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 21:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C85A89DD3;
	Fri,  3 Jan 2020 20:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EB589DD3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 20:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578083717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsuLr5ZVjVIlutjxMEKe0gKIqnRBkCxqqMJb3ulXWi0=;
 b=KrLhnUP2wsePO3TJXD1920bB1T1XEqAUAF9FLlDXi163TVWLeb9IKm/CwAqSlejpkywMBv
 K6Ps+8DqaZvzmTjIxN19oKk2HBEfqLb4T8OPezBOL4/s4dJqdl5FNDfzH3do2RkQyVbYzS
 XCaEQeJA73j2X79Uh+kxlHnwmLSl5xY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-e2SmyAebPHGQs_lxpudNjg-1; Fri, 03 Jan 2020 15:35:15 -0500
Received: by mail-qv1-f72.google.com with SMTP id x22so28654776qvc.18
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 12:35:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=5P6pC9bB+XM8/Xw1EneHQrwc3b3SXf3nT5GAbtbko10=;
 b=p4SX5S9V9hDevJMoUjOUtFQldVlMUWMM80zR2nG3bPBVypTwMzoMiqKISPvXb7COZf
 W2ZPqGBY5fo8g8+SyAujnuzR4gGGDnDd0Hbae8Z7Lc0nevIsY4MSDkjJJ+VKwDVEVvH1
 0lei/alEZbhrxFhI3mtCRK/eca7ou6ZpKsu6C6xkL+uglUJpHrcDrN2KVaHevgdjlyDv
 nrhajfNUC0xijQiWjKlQ3Hvp39E4vdfE/fEKzs+g/mIWyFtX/np6qhB2ASUI1x9JdQnn
 BbzwDDEvPCTai9t7gq5vbtmyVBba2H3SjBTykeHsthd+izX2veHiaLM+2scevWw06h7I
 i72w==
X-Gm-Message-State: APjAAAUK39DrF104gKgyN/R76h/+PJbBNfrzrGeubNIUNR169CZYD4tE
 54tw+Nikol2hj69/aM74G/lwj1k/DrcAe13csM23mJL5owoaZ8iwwlZPHHmcvkR1fzVNAd+dt16
 5zLu/4SX8vV2vys6ZlJh/0GEbyuXj
X-Received: by 2002:ad4:5421:: with SMTP id g1mr68023148qvt.57.1578083714753; 
 Fri, 03 Jan 2020 12:35:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqzgi68keBLcjfBEz4zN/KMDnPfwz3LFg1QJoD7HQRJG4uxuW/u3P8yGx/4EeO57ZnsZsWnpOw==
X-Received: by 2002:ad4:5421:: with SMTP id g1mr68023134qvt.57.1578083714480; 
 Fri, 03 Jan 2020 12:35:14 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id h28sm16911014qkk.48.2020.01.03.12.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 12:35:13 -0800 (PST)
Message-ID: <cfb5d28df84df7d3ce20656ca40be65713d5bdb0.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Avoid NULL pointer dereference
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Fri, 03 Jan 2020 15:35:12 -0500
In-Reply-To: <20191226023151.5448-1-Wayne.Lin@amd.com>
References: <20191226023151.5448-1-Wayne.Lin@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: e2SmyAebPHGQs_lxpudNjg-1
X-Mimecast-Spam-Score: 0
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
Cc: jerry.zuo@amd.com, mikita.lipski@amd.com, Nicholas.Kazlauskas@amd.com,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmFjayBmcm9tIHRoZSBob2xpZGF5cyEKClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUBy
ZWRoYXQuY29tPgoKRG8geW91IG5lZWQgbWUgdG8gcHVzaCB0aGlzIHRvIGRybS1taXNjPwoKT24g
VGh1LCAyMDE5LTEyLTI2IGF0IDEwOjMxICswODAwLCBXYXluZSBMaW4gd3JvdGU6Cj4gW1doeV0K
PiBGb3VuZCBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIHVuZGVyIHRoZSBiZWxvdyBz
aXR1YXRpb246Cj4gCj4gCXNyYyDigJQgSERNSV9Nb25pdG9yICAgc3JjIOKAlCBIRE1JX01vbml0
b3IKPiBlLmcuOgkgICAgXCAgICAgICAgICAgID0+Cj4gCSAgICAgTVNUQiDigJQgTVNUQiAgICAg
KHVucGx1ZykgTVNUQiDigJQgTVNUQgo+IAo+IFdoZW4gZGlzcGxheSAxIEhETUkgYW5kIDIgRFAg
ZGFpc3kgY2hhaW4gbW9uaXRvcnMsIHVucGx1Z2dpbmcgdGhlIGRwCj4gY2FibGUgY29ubmVjdGVk
IHRvIHNvdXJjZSBjYXVzZXMga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdAo+IGRy
bV9kcF9tc3RfYXRvbWljX2NoZWNrX2J3X2xpbWl0KCkuIFdoZW4gY2FsY3VsYXRpbmcgcGJuX2xp
bWl0LCBpZgo+IGJyYW5jaCBpcyBudWxsLCBhY2Nlc3NpbmcgIiZicmFuY2gtPnBvcnRzIiBjYXVz
ZXMgdGhlIHByb2JsZW0uCj4gCj4gW0hvd10KPiBKdWRnZSBicmFuY2ggaXMgbnVsbCBvciBub3Qg
YXQgdGhlIGJlZ2lubmluZy4gSWYgaXQgaXMgbnVsbCwgcmV0dXJuIDAuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogV2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT4KPiBDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwg
MyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gaW5kZXggN2QyZDMxZWFmMDAzLi5hNjQ3M2UzYWI0
NDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBAQCAtNDcwNyw2
ICs0NzA3LDkgQEAgaW50IGRybV9kcF9tc3RfYXRvbWljX2NoZWNrX2J3X2xpbWl0KHN0cnVjdAo+
IGRybV9kcF9tc3RfYnJhbmNoICpicmFuY2gsCj4gIAlzdHJ1Y3QgZHJtX2RwX3ZjcGlfYWxsb2Nh
dGlvbiAqdmNwaTsKPiAgCWludCBwYm5fbGltaXQgPSAwLCBwYm5fdXNlZCA9IDA7Cj4gIAo+ICsJ
aWYgKCFicmFuY2gpCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICAJbGlzdF9mb3JfZWFjaF9lbnRyeShw
b3J0LCAmYnJhbmNoLT5wb3J0cywgbmV4dCkgewo+ICAJCWlmIChwb3J0LT5tc3RiKQo+ICAJCQlp
ZiAoZHJtX2RwX21zdF9hdG9taWNfY2hlY2tfYndfbGltaXQocG9ydC0+bXN0YiwKPiBtc3Rfc3Rh
dGUpKQotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
