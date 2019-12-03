Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751C110F3C0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 01:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0692389267;
	Tue,  3 Dec 2019 00:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45C089267
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 00:02:40 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-9Leh9xvfOuqIMwLcsMedzg-1; Mon, 02 Dec 2019 19:02:38 -0500
Received: by mail-qt1-f197.google.com with SMTP id l4so1135218qte.18
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 16:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=SmFSmDKy3YcF1B/iUdVkdBO+ca8lrVy/mvRx1nB1HV4=;
 b=aige0X1iuRf1E4SnBK48tUEBZtYynM1DyUOaljfRSOr2UB0SIMd12AZE5StMPa0p/P
 hsSgNAkGK8zycvBRcCsZJCTLgiUuij9OFX74oiiGzJlQ8TmYm27ufCh0wF4MGqgSMQYm
 wDXyAKwLsmctQhWSUtVWnrWTSSo3klu0PK/2YuBVY6HubGFCfhuh1gtIjPq1r7C4tPW5
 u0bCcYa+/6PwY+vNFqLxHc57ouWCqCIc0YI7s+VoGSeDVwyIU9vt34FAKG90htgSUaGu
 YUR2YUmkWCWfBqY6iC9fn/8SXjKgWc3tfich8gVCGslkeJD4p63r/+aQ4OVecyY/HEqC
 WriA==
X-Gm-Message-State: APjAAAWkV23kJfXUDsOsY245l/+v4aywDj/D9UQL0M1RWMkISy7OEtiE
 MYVc5Ou+MZXroUWgNzPVWm+3j1eaCi/dJt0JhCGOSoF4nJZ0sT1u09r4Q6yUAFMjxKuV/4SKjik
 y0ezu1sd4Zjy9Lvq8zad+LOsFlPmp
X-Received: by 2002:a05:620a:1467:: with SMTP id
 j7mr2041195qkl.76.1575331357634; 
 Mon, 02 Dec 2019 16:02:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzI4Fu9l5e2hhr9qk5YqZZ2E9/kWI7V77ATA4sWZ9fxcOKL/lGEBgdx67my7qd/bzeICnwPNg==
X-Received: by 2002:a05:620a:1467:: with SMTP id
 j7mr2041161qkl.76.1575331357350; 
 Mon, 02 Dec 2019 16:02:37 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id s26sm727827qkj.24.2019.12.02.16.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 16:02:36 -0800 (PST)
Message-ID: <a67744f1ddebe98a0760677949ef014f6a150f74.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Remove VCPI while disabling topology mgr
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Mon, 02 Dec 2019 19:02:35 -0500
In-Reply-To: <20191202035737.16909-1-Wayne.Lin@amd.com>
References: <20191202035737.16909-1-Wayne.Lin@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: 9Leh9xvfOuqIMwLcsMedzg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575331359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SmFSmDKy3YcF1B/iUdVkdBO+ca8lrVy/mvRx1nB1HV4=;
 b=WRh70xdmqg6rNlhEG16XaZeQzxifq73Lc97bSMzf715POsgDC8eXAXNNbN8jQ/MWSqqPto
 RLr1vS0FLlz9x/hIf8h2GaPcfvGYWPguchrmB8g4+7Uc+DvqDffhVVCRFSbHlg9nLk5xKi
 2etjjNWalZzUXsgnENMpraUbtfTcIPE=
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

SSdtLCBub3QgZW50aXJlbHkgc3VyZSB3aGF0IHRoaXMgcGF0Y2ggaXMgdHJ5aW5nIHRvIGFjY29t
cGxpc2guIEknbSBndWVzc2luZwptYXliZSB3ZSdyZSBsZWF2aW5nIHN0YWxlIFZDUEkgYWxsb2Nh
dGlvbnMgZnJvbSB0aGUgcHJldmlvdXMgdG9wb2xvZ3kKZW5hYmxlbWVudCBhbmQgdGhlbiBzb21l
aG93IHRyeWluZyB0byB1c2UgdGhvc2UgYWdhaW4gd2hlbiBhbGxvY2F0aW5nCnBheWxvYWRzPyBU
aGUgcGF0Y2ggbG9va3MgY29ycmVjdCBhdCBsZWFzdC4KCklmIHRoaXMgcGF0Y2ggaXMgZml4aW5n
IGFuIGlzc3VlLCBzdWNoIGFzIGRpc3BsYXlzIG5vdCB0dXJuaW5nIG9uIHdpdGggYW1kZ3B1LApJ
J2QgZGVmaW5pdGVseSBtZW50aW9uIGl0IGluIG1vcmUgZGV0YWlsIGhlcmUgYW5kIENjIHRvIHN0
YWJsZSBpZiBhcHBsaWNhYmxlLgpBbHNvLCBvbmUgbml0cGljayBiZWxvdzoKCk9uIE1vbiwgMjAx
OS0xMi0wMiBhdCAxMTo1NyArMDgwMCwgV2F5bmUgTGluIHdyb3RlOgo+IFtXaHldCj4gV2hpbGUg
ZGlzYWJsaW5nIG1zdCB0b3BvbG9neSBtYW5hZ2VyIGluCj4gZHJtX2RwX21zdF90b3BvbG9neV9t
Z3Jfc2V0X21zdCgpLCBub3cganVzdCByZXNldCB0aGUgbWdyLT5wYXlsb2Fkcwo+IGJ1dCBkb2Vz
bid0IGhhbmRsZSB0aGUgbWdyLT5wcm9wb3NlZF92Y3Bpcy4KPiAKPiBbSG93XQo+IFJlbW92ZSBt
Z3ItPnByb3Bvc2VkX3ZjcGlzIHRvIE5VTEwuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2F5bmUgTGlu
IDxXYXluZS5MaW5AYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYyB8IDEyICsrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3Bv
bG9neS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gaW5kZXgg
YWU1ODA5YTFmMTlhLi44MWU5MmIyNjBkN2EgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMKPiBAQCAtMzM4Niw2ICszMzg2LDcgQEAgc3RhdGljIGludCBkcm1fZHBfZ2V0
X3ZjX3BheWxvYWRfYncodTggZHBfbGlua19idywKPiB1OCAgZHBfbGlua19jb3VudCkKPiAgaW50
IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3NldF9tc3Qoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xv
Z3lfbWdyICptZ3IsCj4gYm9vbCBtc3Rfc3RhdGUpCj4gIHsKPiAgCWludCByZXQgPSAwOwo+ICsJ
aW50IGkgPSAwOwo+ICAJc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiID0gTlVMTDsKPiAg
Cj4gIAltdXRleF9sb2NrKCZtZ3ItPmxvY2spOwo+IEBAIC0zNDQ2LDEwICszNDQ3LDIxIEBAIGlu
dCBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zZXRfbXN0KHN0cnVjdAo+IGRybV9kcF9tc3RfdG9w
b2xvZ3lfbWdyICptZ3IsIGJvb2wgbXMKPiAgCQkvKiB0aGlzIGNhbiBmYWlsIGlmIHRoZSBkZXZp
Y2UgaXMgZ29uZSAqLwo+ICAJCWRybV9kcF9kcGNkX3dyaXRlYihtZ3ItPmF1eCwgRFBfTVNUTV9D
VFJMLCAwKTsKPiAgCQlyZXQgPSAwOwo+ICsJCW11dGV4X2xvY2soJm1nci0+cGF5bG9hZF9sb2Nr
KTsKPiAgCQltZW1zZXQobWdyLT5wYXlsb2FkcywgMCwgbWdyLT5tYXhfcGF5bG9hZHMgKiBzaXpl
b2Yoc3RydWN0Cj4gZHJtX2RwX3BheWxvYWQpKTsKPiAgCQltZ3ItPnBheWxvYWRfbWFzayA9IDA7
Cj4gIAkJc2V0X2JpdCgwLCAmbWdyLT5wYXlsb2FkX21hc2spOwo+ICsJCWZvciAoaSA9IDA7IGkg
PCBtZ3ItPm1heF9wYXlsb2FkczsgaSsrKSB7Cj4gKwkJCXN0cnVjdCBkcm1fZHBfdmNwaSAqdG1w
X3ZjcGkgPSBtZ3ItPnByb3Bvc2VkX3ZjcGlzW2ldOwo+ICsKPiArCQkJaWYgKHRtcF92Y3BpKSB7
Cj4gKwkJCQl0bXBfdmNwaS0+dmNwaSA9IDA7Cj4gKwkJCQl0bXBfdmNwaS0+bnVtX3Nsb3RzID0g
MDsKPiArCQkJfQo+ICsJCQltZ3ItPnByb3Bvc2VkX3ZjcGlzW2ldID0gTlVMTDsKPiArCQl9Cj4g
IAkJbWdyLT52Y3BpX21hc2sgPSAwOwo+ICsJCW11dGV4X3VubG9jaygmbWdyLT5wYXlsb2FkX2xv
Y2spOwoKYmlrZXNoZWQ6IEknZCBqdXN0IHJlbmFtZSB0bXBfdmNwaSBoZXJlIHRvIHZjcGksIGJ1
dCBJJ2xsIGxlYXZlIHRoYXQgdXAgdG8geW91Cj4gIAl9Cj4gIAo+ICBvdXRfdW5sb2NrOgotLSAK
Q2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
