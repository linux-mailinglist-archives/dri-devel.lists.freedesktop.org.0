Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622B810F3E3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 01:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABD26E241;
	Tue,  3 Dec 2019 00:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37A26E0FF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 00:23:19 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-Pw5PbhvROgCtvQUUJolOYQ-1; Mon, 02 Dec 2019 19:23:15 -0500
Received: by mail-qk1-f199.google.com with SMTP id o204so984471qke.22
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 16:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=qK7dJt7emn2nPgIkNYQvvT1o0KOTyKHwgqttrH3YRw4=;
 b=PNjjeDNRxix0HQiIcEQIE9DEeXf3v8rJA8wENfI0DJuw2YzY7eISj6dmN34WU0Uryp
 iaSLvxtD4d5gkwapH6fXkfpCPSsAVgc2zRVUIFkU2xBfPa18wwWDyDeyHlR3EcvQzuUv
 nXrgfdEidqhCXCtC+nDn+kAmcxBEFmGUWVIcZGLx1DorJZqIqHL5gFVQzbHVZyibEMxX
 z3tuDblf6+hU6RJHGAJjunO1nBBQG43U/wdcDg2zgkgUrk3743kXfTnzWu5uYSyTPnbH
 GAGiCutXdijmoUklHYjcHu4+Wl3oyjEajZznM3M7CqfTmxybJN7V0ljK48uuD51KGlBQ
 Hobw==
X-Gm-Message-State: APjAAAWpPlb+oXEOD4XBlJC6PmahxQH+Pa0NMFm9/5UelT/Fvbx6L2eX
 kt4U0IdecFkGZ7Uh8adnufyW15GRbfe8r9OlDAfnUJU8+QcnnIntispTWRFv9nwEtrp65uTnQ4C
 tqAbQhKdyKdFZsVjhGjziVmh9oNbM
X-Received: by 2002:ac8:4a02:: with SMTP id x2mr2518849qtq.388.1575332594755; 
 Mon, 02 Dec 2019 16:23:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXPm7oQEUV0hxiQwMwFcRCzo34nlUWBD3UGZbYmef5k3XsS0mJ3MDAPbC/Q6MgG3STwaW+Yw==
X-Received: by 2002:ac8:4a02:: with SMTP id x2mr2518829qtq.388.1575332594462; 
 Mon, 02 Dec 2019 16:23:14 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id c6sm741255qka.111.2019.12.02.16.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 16:23:13 -0800 (PST)
Message-ID: <0ee5e2e9f6a739ee95715764ee8a3673fec29d08.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Correct the bug in
 drm_dp_update_payload_part1()
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Mon, 02 Dec 2019 19:23:12 -0500
In-Reply-To: <20191202035841.16984-1-Wayne.Lin@amd.com>
References: <20191202035841.16984-1-Wayne.Lin@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: Pw5PbhvROgCtvQUUJolOYQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575332598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qK7dJt7emn2nPgIkNYQvvT1o0KOTyKHwgqttrH3YRw4=;
 b=DIkXeDlIGqwHauxoxAFS7RT7pwWnKj9vMbij0Btrj2gwb7HVF6Eykj544dpJl/Q48AHFat
 8s5NpVXh4Tpqht1he1074dODbfg4BbD5brxQiHMgL73r5ZU/nzh9VmfpdFYp8UTW5u86BR
 3qW5ABvDo0+tDBvzHtM6Pt9/7VwMezA=
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
Cc: Jerry.Zuo@amd.com, Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTEyLTAyIGF0IDExOjU4ICswODAwLCBXYXluZSBMaW4gd3JvdGU6Cj4gW1do
eV0KPiBJZiB0aGUgcGF5bG9hZF9zdGF0ZSBpcyBEUF9QQVlMT0FEX0RFTEVURV9MT0NBTCBpbiBz
ZXJpZXMsIGN1cnJlbnQKPiBjb2RlIGRvZXNuJ3QgZGVsZXRlIHRoZSBwYXlsb2FkIGF0IGN1cnJl
bnQgaW5kZXggYW5kIGp1c3QgbW92ZSB0aGUKPiBpbmRleCB0byBuZXh0IG9uZSBhZnRlciBzaHVm
ZmxpbmcgcGF5bG9hZHMuCj4gCj4gW0hvd10KPiBBZnRlciBzaHVmZmxpbmcgcGF5bG9hZHMsIGRl
Y2lkZSB3aGV0aGVyIHRvIG1vdmUgb24gaW5kZXggb3Igbm90Cj4gYWNjb3JkaW5nIHRvIHBheWxv
YWRfc3RhdGUgb2YgY3VycmVudCBwYXlsb2FkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdheW5lIExp
biA8V2F5bmUuTGluQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBp
bmRleCA4MWU5MmIyNjBkN2EuLjhkYTVkNDYxZWEwMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC0zMTc2LDcgKzMxNzYsOCBAQCBpbnQgZHJtX2RwX3VwZGF0
ZV9wYXlsb2FkX3BhcnQxKHN0cnVjdAo+IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IpCj4g
IAkJCWRybV9kcF9tc3RfdG9wb2xvZ3lfcHV0X3BvcnQocG9ydCk7Cj4gIAl9Cj4gIAo+IC0JZm9y
IChpID0gMDsgaSA8IG1nci0+bWF4X3BheWxvYWRzOyBpKyspIHsKPiArCWZvciAoaSA9IDA7IGkg
PCBtZ3ItPm1heF9wYXlsb2FkczsKPiArCQkobWdyLT5wYXlsb2Fkc1tpXS5wYXlsb2FkX3N0YXRl
ID09IERQX1BBWUxPQURfREVMRVRFX0xPQ0FMKSA/Cj4gaSA6IGkrKykgewoKVG9vayBtZSBhIG1v
bWVudCB0byBmaWd1cmUgb3V0IHdoYXQgdGhpcyBsaW5lIHdhcyBhY3R1YWxseSBkb2luZy4gTmlj
ZSBjYXRjaApieSB0aGUgd2F5IQoKQW55d2F5OiBsZXQncyBqdXN0IGRyb3AgdGhpcyBsaW5lIHRv
IGF2b2lkIG1ha2luZyB0aGluZ3MgY29uZnVzaW5nIHRvIHJlYWQsCmRyb3AgaSsrIGZyb20gdGhl
IGZvciBsb29wIGluc3RlYWQsIGFuZCBqdXN0IHJld3JpdGUgaXQgc28gaXQgbG9va3MgbGlrZSB0
aGlzOgoKZm9yIChpID0gMDsgaSA8IG1nci0+bWF4X3BheWxvYWRzOyAvKiBkbyBub3RoaW5nICov
KSB7CglpZiAobWdyLT5wYXlsb2Fkc1tpXS5wYXlsb2FkX3N0YXRlICE9IERQX1BBWUxPQURfREVM
RVRFX0xPQ0FMKSB7CgkJaSsrOwoJCWNvbnRpbnVlOwoJfQoKV2l0aCB0aG9zZSBjaGFuZ2VzLCB0
aGlzIHBhdGNoIGlzOgoKUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+
CgpJIGNhbiBnbyBhaGVhZCBhbmQgcHVzaCB0aGVzZSBwYXRjaGVzIHRvIGRybS1taXNjIGZvciB5
b3Ugb25jZSB5b3UndmUgc2VudCBtZQp0aGUgdjIKPiAgCQlpZiAobWdyLT5wYXlsb2Fkc1tpXS5w
YXlsb2FkX3N0YXRlICE9IERQX1BBWUxPQURfREVMRVRFX0xPQ0FMKQo+ICAJCQljb250aW51ZTsK
PiAgCi0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
