Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CDD71F05
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C5A6E35B;
	Tue, 23 Jul 2019 18:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED1C6E323;
 Tue, 23 Jul 2019 17:26:27 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id g2so19487038pfq.0;
 Tue, 23 Jul 2019 10:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding;
 bh=CNtl/XMCYybIEW7V6humgr0dogonmzHoWy1jDSG8h7g=;
 b=USDE1OodG56A9LC+UkiUn3cIdCGwvhiNDWyMRI0RALGCmIgBDeMr/ydbgJZpvqb9q1
 k9FeQ1g+2YyNKjKPLHC3oyDGG/gcCCHp7yyn79DXXRTGD5VjFrwK7nRtKZ9uRt21NzD4
 rwHlnmKpIAuki2cvN2Dr54cYf2adZw2DtALoN68HSFyK1xrNI6mODhd06NBFrnA5ferQ
 JUVXotBtECoHvlx1gf+wF3ZrDILhIWQ1YDOiifDy6VKp5lR2J8kx4L9YzXci+k/z8bwF
 RFJJSZ4hHWgCBg2Nr10tsa5irgx1gVcTnvWGOVMHrMKJrQ30jBkIRBeIPgJSJYywmhFA
 ZOXw==
X-Gm-Message-State: APjAAAV6u5DzyoZJKEDZ6VvTVbeNpt6/HuUGq3HHtLisbNhtTfSy7ae5
 XxcWmQyPEpvxXarU7en2pEE=
X-Google-Smtp-Source: APXvYqwDFV8uoDquBgYpuTfkRCO820VbI0AwMpyMP4jOSlXX6JwuDGiKvL0EalNZrSWTzbAetJwdcg==
X-Received: by 2002:a65:4509:: with SMTP id n9mr24190793pgq.133.1563902787447; 
 Tue, 23 Jul 2019 10:26:27 -0700 (PDT)
Received: from localhost ([184.63.162.180])
 by smtp.gmail.com with ESMTPSA id 21sm35183142pfj.76.2019.07.23.10.26.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 10:26:26 -0700 (PDT)
Date: Tue, 23 Jul 2019 10:26:18 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 syzbot <syzbot+79f5f028005a77ecb6bb@syzkaller.appspotmail.com>, 
 John Fastabend <john.fastabend@gmail.com>, bpf <bpf@vger.kernel.org>
Message-ID: <5d37433a832d_3aba2ae4f6ec05bc3a@john-XPS-13-9370.notmuch>
In-Reply-To: <CACT4Y+ZGwKP+f4esJdx60AywO9b3Y5Bxb4zLtH6EEkaHpP6Zag@mail.gmail.com>
References: <0000000000001a51c4058ddcb1b6@google.com>
 <CACT4Y+ZGwKP+f4esJdx60AywO9b3Y5Bxb4zLtH6EEkaHpP6Zag@mail.gmail.com>
Subject: Re: kernel panic: stack is corrupted in pointer
Mime-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding;
 bh=CNtl/XMCYybIEW7V6humgr0dogonmzHoWy1jDSG8h7g=;
 b=U/Rf3sgbh+knlezhXqPSn2tPDhd3yZ9PXhVp0K+yE5NDA0zMH7psYw6WXrRHPR2fCh
 NlQQm28kaTVbrFrhkEv2zHbF574VVME4p3W87tdiK95o/4PAfTP7dr6vDDT6sOWKNvSh
 dy/y0EdSlUOJtG533ff4d54r0QuyNmRxxpyn1hXMxQMuBikt+ssREESIzAN3LjGCreGT
 WhQCCxo/YD9v7AvUypFkTjXyZ15Bc5+HJwnPhMf/Vd47t8D9XJe1czhgtCD69V1oUQ03
 IZbT5xrGjjILlUwCdOuXHarut2lZl0+qPYIcVK3rsCC7I5AOwPKyuG90eTkkQtDp4I6D
 LWNg==
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, David Airlie <airlied@linux.ie>,
 netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Alexei Starovoitov <ast@kernel.org>, amd-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 alexander.deucher@amd.com, leo.liu@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG1pdHJ5IFZ5dWtvdiB3cm90ZToKPiBPbiBXZWQsIEp1bCAxNywgMjAxOSBhdCAxMDo1OCBBTSBz
eXpib3QKPiA8c3l6Ym90Kzc5ZjVmMDI4MDA1YTc3ZWNiNmJiQHN5emthbGxlci5hcHBzcG90bWFp
bC5jb20+IHdyb3RlOgo+ID4KPiA+IEhlbGxvLAo+ID4KPiA+IHN5emJvdCBmb3VuZCB0aGUgZm9s
bG93aW5nIGNyYXNoIG9uOgo+ID4KPiA+IEhFQUQgY29tbWl0OiAgICAxNDM4Y2RlNyBBZGQgbGlu
dXgtbmV4dCBzcGVjaWZpYyBmaWxlcyBmb3IgMjAxOTA3MTYKPiA+IGdpdCB0cmVlOiAgICAgICBs
aW51eC1uZXh0Cj4gPiBjb25zb2xlIG91dHB1dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5j
b20veC9sb2cudHh0P3g9MTM5ODgwNTg2MDAwMDAKPiA+IGtlcm5lbCBjb25maWc6ICBodHRwczov
L3N5emthbGxlci5hcHBzcG90LmNvbS94Ly5jb25maWc/eD0zNDMwYTE1MWUxNDUyMzMxCj4gPiBk
YXNoYm9hcmQgbGluazogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPTc5
ZjVmMDI4MDA1YTc3ZWNiNmJiCj4gPiBjb21waWxlcjogICAgICAgZ2NjIChHQ0MpIDkuMC4wIDIw
MTgxMjMxIChleHBlcmltZW50YWwpCj4gPiBzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxs
ZXIuYXBwc3BvdC5jb20veC9yZXByby5zeXo/eD0xMTFmYzhhZmEwMDAwMAo+IAo+IEZyb20gdGhl
IHJlcHJvIGl0IGxvb2tzIGxpa2UgdGhlIHNhbWUgYnBmIHN0YWNrIG92ZXJmbG93IGJ1Zy4gK0pv
aG4KPiBXZSBuZWVkIHRvIGR1cCB0aGVtIG9udG8gc29tZSBjYW5vbmljYWwgcmVwb3J0IGZvciB0
aGlzIGJ1Zywgb3IgdGhpcwo+IGJlY29tZXMgdW5tYW5hZ2VhYmxlLgoKRml4ZXMgaW4gYnBmIHRy
ZWUgc2hvdWxkIGZpeCB0aGlzLiBIb3BlZnVsbHksIHdlIHdpbGwgc3F1YXNoIHRoaXMgb25jZSBm
aXhlcwpwZXJjb2xhdGUgdXAuCgojc3l6IHRlc3Q6IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9icGYvYnBmLmdpdAoKPiAKPiAjc3l6IGR1cDoga2VybmVsIHBh
bmljOiBjb3JydXB0ZWQgc3RhY2sgZW5kIGluIGRwdXQKPiAKPiA+IFRoZSBidWcgd2FzIGJpc2Vj
dGVkIHRvOgo+ID4KPiA+IGNvbW1pdCA5NmE1ZDhkNDkxNWYzZTI0MWViYjQ4ZDVkZWNkZDExMGFi
OWM3ZGNmCj4gPiBBdXRob3I6IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4KPiA+IERhdGU6ICAg
RnJpIEp1bCAxMyAxNToyNjoyOCAyMDE4ICswMDAwCj4gPgo+ID4gICAgICBkcm0vYW1kZ3B1OiBN
YWtlIHN1cmUgSUIgdGVzdHMgZmx1c2hlZCBhZnRlciBJUCByZXN1bWUKPiA+Cj4gPiBiaXNlY3Rp
b24gbG9nOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9iaXNlY3QudHh0P3g9MTRh
NDYyMDA2MDAwMDAKPiA+IGZpbmFsIGNyYXNoOiAgICBodHRwczovL3N5emthbGxlci5hcHBzcG90
LmNvbS94L3JlcG9ydC50eHQ/eD0xNmE0NjIwMDYwMDAwMAo+ID4gY29uc29sZSBvdXRwdXQ6IGh0
dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTEyYTQ2MjAwNjAwMDAwCj4g
Pgo+ID4gSU1QT1JUQU5UOiBpZiB5b3UgZml4IHRoZSBidWcsIHBsZWFzZSBhZGQgdGhlIGZvbGxv
d2luZyB0YWcgdG8gdGhlIGNvbW1pdDoKPiA+IFJlcG9ydGVkLWJ5OiBzeXpib3QrNzlmNWYwMjgw
MDVhNzdlY2I2YmJAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+ID4gRml4ZXM6IDk2YTVkOGQ0
OTE1ZiAoImRybS9hbWRncHU6IE1ha2Ugc3VyZSBJQiB0ZXN0cyBmbHVzaGVkIGFmdGVyIElQCj4g
PiByZXN1bWUiKQo+ID4KPiA+IEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBzdGFjay1wcm90
ZWN0b3I6IEtlcm5lbCBzdGFjayBpcyBjb3JydXB0ZWQgaW46Cj4gPiBwb2ludGVyKzB4NzAyLzB4
NzUwIGxpYi92c3ByaW50Zi5jOjIxODcKPiA+IFNodXR0aW5nIGRvd24gY3B1cyB3aXRoIE5NSQo+
ID4gS2VybmVsIE9mZnNldDogZGlzYWJsZWQKPiA+Cj4gPgo+ID4gLS0tCj4gPiBUaGlzIGJ1ZyBp
cyBnZW5lcmF0ZWQgYnkgYSBib3QuIEl0IG1heSBjb250YWluIGVycm9ycy4KPiA+IFNlZSBodHRw
czovL2dvby5nbC90cHNtRUogZm9yIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgc3l6Ym90Lgo+ID4g
c3l6Ym90IGVuZ2luZWVycyBjYW4gYmUgcmVhY2hlZCBhdCBzeXprYWxsZXJAZ29vZ2xlZ3JvdXBz
LmNvbS4KPiA+Cj4gPiBzeXpib3Qgd2lsbCBrZWVwIHRyYWNrIG9mIHRoaXMgYnVnIHJlcG9ydC4g
U2VlOgo+ID4gaHR0cHM6Ly9nb28uZ2wvdHBzbUVKI3N0YXR1cyBmb3IgaG93IHRvIGNvbW11bmlj
YXRlIHdpdGggc3l6Ym90Lgo+ID4gRm9yIGluZm9ybWF0aW9uIGFib3V0IGJpc2VjdGlvbiBwcm9j
ZXNzIHNlZTogaHR0cHM6Ly9nb28uZ2wvdHBzbUVKI2Jpc2VjdGlvbgo+ID4gc3l6Ym90IGNhbiB0
ZXN0IHBhdGNoZXMgZm9yIHRoaXMgYnVnLCBmb3IgZGV0YWlscyBzZWU6Cj4gPiBodHRwczovL2dv
by5nbC90cHNtRUojdGVzdGluZy1wYXRjaGVzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
