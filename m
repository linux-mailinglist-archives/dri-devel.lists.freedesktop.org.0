Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD2CB882D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 01:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390AA6FC0A;
	Thu, 19 Sep 2019 23:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F142A6FC0A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 23:40:59 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-_QMXWAIRPpW31QJOwe-lWg-1; Thu, 19 Sep 2019 19:40:56 -0400
Received: by mail-qk1-f198.google.com with SMTP id x62so5960156qkb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 16:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=wDCcCIAxZTP4NhEBKZatXOJR721Ut/RVgMMWm1PgCrs=;
 b=ffQdS9AAb2r2h0BiABIr5XWDEQGey3xk+GX5VPC62UM8zRNWdrxopFkfMeNfaX+Q3T
 5+q9+CeUqA9WGs4gP+iZEQzQievYUlvSpmcuct5NQbgAJJWCNq3HW/R7jJ14+2a9cwiN
 rBT+DL8ppv6RYdHauASFjwKq7agm0bmDhhXmI66uZ2biFuCihLH6PmA1j6zzU2BVfVEG
 wTHmLV6snrJ5rk2YenHG89yQHxIzuL1POQMiU/3zW6fbJRepJ6hhWh31h47xSCt/Kvkq
 IJ6IsB5PVSsNqhmVR01ldwcs9UlZw+aaVbMwpWc6EfAQ4YOSzjurR1tacYTs2WC2iLeC
 od5w==
X-Gm-Message-State: APjAAAVQepxwoXZ5g/2Of49qeaIpYPcWUoD/w0BLI8CQOZSSxfMJtd8m
 Td9oKrgHpDebvAmvk/pmFI4BLgNR47CNdKj0vKgI1VxQBklLnV1v71eBEhVrFzVyhWX7WngzPFk
 EinDUQJ5mP8zuyMLcJYXExpI+bdWH
X-Received: by 2002:a37:a858:: with SMTP id r85mr435314qke.394.1568936456349; 
 Thu, 19 Sep 2019 16:40:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx3VDWf5w6Zor/vmdby4Uefrvj0LD87n0PkanNg5+e6PhZTSML+tJckVU559VL8o9vW12XD0g==
X-Received: by 2002:a37:a858:: with SMTP id r85mr435304qke.394.1568936456183; 
 Thu, 19 Sep 2019 16:40:56 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id x12sm88240qtb.32.2019.09.19.16.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 16:40:55 -0700 (PDT)
Message-ID: <7893bf17824cf350b7d4aee2fe6afafd5220a1fc.camel@redhat.com>
Subject: Re: [PATCH 03/15] drm/amdgpu: validate mst topology in atomic check
From: Lyude Paul <lyude@redhat.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
Date: Thu, 19 Sep 2019 19:40:55 -0400
In-Reply-To: <12913419239b363a0c20c0c013b2dc3cfd4effb6.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
 <12913419239b363a0c20c0c013b2dc3cfd4effb6.1568833906.git.mikita.lipski@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: _QMXWAIRPpW31QJOwe-lWg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1568936458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JVzZEwIahpuEbxatSNR+XUr/8Kr7c5LSTvQnbXWzQA4=;
 b=grjKdFiGUgqHFqWYpKWFGI2UL9EF8PxREEIj8I3ioN6nVqrNvQmfKo37NUZG0YpmTlU8v/
 Oi+5+3LvdI3U4vVK1HL8Gcp6TTehfJCI6s7bIPCQWPSGzbQo5kSE7w/9R+GdpyGYtaY5bc
 CUqjuNJFxV3tFJMvX5mOPtdaMJKXXVM=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhbHNvIG5lZWRzIHRvIGJlIHNxdWFzaGVkIGludG8gdGhlIHByZXZpb3VzIHR3byBwYXRj
aGVzLiBUaGVyZSdzIG5vIHBvaW50CmluIHVzaW5nIGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Ns
b3RzKCkgb3IgZHJtX2RwX2F0b21pY19yZWxlYXNlX3ZjcGlfc2xvdHMoKQp3aXRob3V0IGRybV9k
cF9tc3RfYXRvbWljX2NoZWNrKCksIHNpbmNlIHRoZSBWQ1BJIGFsbG9jYXRpb25zIHNldHVwIGJ5
IHRoZSB0d28KZnVuY3Rpb25zIGFyZW4ndCB2YWxpZGF0ZWQgdW50aWwgdGhlbi4KCk9uIFdlZCwg
MjAxOS0wOS0xOCBhdCAxNjoyNiAtMDQwMCwgbWlraXRhLmxpcHNraUBhbWQuY29tIHdyb3RlOgo+
IEZyb206IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KPiAKPiBbd2h5XQo+
IFZhbGlkYXRlIG1zdCB0b3BvbG9neSBhbmQgdGhlIG51bWJlciBvZiBWQ1BJIHNsb3RzIGF2YWls
YWJsZQo+IGZvciBhIG5ldyBzdGF0ZS4gRmFpbCBpZiB0b3BvbG9neSBoYXMgbm8gbW9yZSBiYW5k
d2lkdGggZm9yCj4gYSBuZXcgc3RhdGUuCj4gW2hvd10KPiBQYXNzIHRoZSBhdG9taWMgc3RhdGUg
dG8gZHJtX2RwX21zdF9hdG9taWNfY2hlY2sgdG8gdmVyaWZ5Cj4gaWYgdGhlIG5ldyB0b3BvbG9n
eSBpcyBwb3NzaWJsZS4KPiAKPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA1
ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+IGluZGV4
IGQ3MDBiOTYyZDMzOC4uMzljMjM5YTA4NjMzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gQEAgLTc0ODUsNiArNzQ4NSwx
MSBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2UK
PiAqZGV2LAo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGZhaWw7Cj4gIAo+ICsJLyogUGVyZm9ybSB2
YWxpZGF0aW9uIG9mIE1TVCB0b3BvbG9neSBpbiB0aGUgc3RhdGUqLwo+ICsJcmV0ID0gZHJtX2Rw
X21zdF9hdG9taWNfY2hlY2soc3RhdGUpOwo+ICsJaWYgKHJldCkKPiArCQlnb3RvIGZhaWw7Cj4g
Kwo+ICAJaWYgKHN0YXRlLT5sZWdhY3lfY3Vyc29yX3VwZGF0ZSkgewo+ICAJCS8qCj4gIAkJICog
VGhpcyBpcyBhIGZhc3QgY3Vyc29yIHVwZGF0ZSBjb21pbmcgZnJvbSB0aGUgcGxhbmUgdXBkYXRl
Ci0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
