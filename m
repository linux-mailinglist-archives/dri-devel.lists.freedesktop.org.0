Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1EC2A50A1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 21:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6179F6ECD1;
	Tue,  3 Nov 2020 20:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18F66ECD1
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 20:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604433786;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hs/zXGHlz9vLFkghpxlnSjQMAlQ6jTL7a/WUuTWkQUQ=;
 b=aANr42l2dRh7rsoGHQZQCOgAqW7trM4iao79nWRKUVbFzg7PE8PMrIJiq7yIhCRaeYmrKG
 7qr34NkabwkPzZnvJV0glVf1C59L7Jzk6PlXK9livi69ac5IZdTWrC6zV3mXrYIJZUvKpN
 W9ZmFwuDxbmCR0SQHzkuES1O8hglBPk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-usqMxhOjNCCfUT2m_-6V-A-1; Tue, 03 Nov 2020 15:03:04 -0500
X-MC-Unique: usqMxhOjNCCfUT2m_-6V-A-1
Received: by mail-qk1-f199.google.com with SMTP id j20so11563589qkl.7
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 12:03:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=hs/zXGHlz9vLFkghpxlnSjQMAlQ6jTL7a/WUuTWkQUQ=;
 b=rIQGd7Q4RU7IIpaj7GPQjmut7H1bbMQ4JYaJkjWawcWCsWGcnyF3xd/fGdzknNQTGS
 q4s+HXz7IE/xpCdJjRiT21rt1p89HWghAGIw3G18UEa8J3XLyUg+vg8qia/JJGlvOcRK
 m6/Gdy0QVorbgJnsMr5/pH78YyWiLUAmiEZyx4VDJ7KnNxW1siq5T4On2afQvXRitGVt
 MWtrsstkJJCJ7q4+ZQzi1tFmINggjaBORgDCoakBWpt7nFoegKF8iVlWs0JZqrCsQ09G
 rxSipTgrb/yu3i8NrmF73syWgZfQCqgNyDu42rRvFu8KQVaUkSUdFBPhdNH/HaplGLxY
 w4Tg==
X-Gm-Message-State: AOAM530ZxvhySaewScfSC5y1a8IVyYgXWrg40ZdYplB5GQFNYkTr9XOl
 IPSRmeMwWEYBABbQzg9LRVfhQA3RSj8aP+Do+gwG0GfHkBuPKspqweYxV6aCaxwMnG6HOQf6N/e
 GSdPUbjWXOSrCeHJf8oWiGgOZCqgu
X-Received: by 2002:a05:620a:1193:: with SMTP id
 b19mr8991541qkk.42.1604433784110; 
 Tue, 03 Nov 2020 12:03:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3Uif/P5KpG7c3Wmsy5fgC5l2WzpKVRev2cYaqxmHthv/mJZZ6oxzAqBLM1VOiN/jiyFC7lg==
X-Received: by 2002:a05:620a:1193:: with SMTP id
 b19mr8991516qkk.42.1604433783827; 
 Tue, 03 Nov 2020 12:03:03 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id o21sm206002qko.9.2020.11.03.12.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 12:03:03 -0800 (PST)
Message-ID: <dd9b5ea4409886e83b87a6769e7ed45c753298cb.camel@redhat.com>
Subject: Re: [PATCH] drm/edid: Fix uninitialized variable in drm_cvt_modes()
From: Lyude Paul <lyude@redhat.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 03 Nov 2020 15:03:01 -0500
In-Reply-To: <CAKb7UvjJHMbDEAYJRCCdQ=LZfpogb4Z6y+yYFgPYKvbE1mM1ig@mail.gmail.com>
References: <20201022165450.682571-1-lyude@redhat.com>
 <CAKb7UvhfWA6ijoQnq2Mvrx8jfn57EC-P5KBkYR3HmrBUrntJhg@mail.gmail.com>
 <8d15a513bd38a01b3607e5c75b5754cc599fe33c.camel@redhat.com>
 <CAKb7UvjJHMbDEAYJRCCdQ=LZfpogb4Z6y+yYFgPYKvbE1mM1ig@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33)
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
Reply-To: lyude@redhat.com
Cc: Kees Cook <keescook@chromium.org>, Leon Romanovsky <leon@kernel.org>,
 David Airlie <airlied@linux.ie>, Chao Yu <chao@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "# 3.9+" <stable@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTExLTAzIGF0IDE0OjUzIC0wNTAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiBP
biBUdWUsIE5vdiAzLCAyMDIwIGF0IDI6NDcgUE0gTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNv
bT4gd3JvdGU6Cj4gPiAKPiA+IFNvcnJ5ISBUaG91Z2h0IEkgaGFkIHJlc3BvbmRlZCB0byB0aGlz
IGJ1dCBhcHBhcmVudGx5IG5vdCwgY29tbWVudHMgZG93bgo+ID4gYmVsb3cKPiA+IAo+ID4gT24g
VGh1LCAyMDIwLTEwLTIyIGF0IDE0OjA0IC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiA+ID4g
T24gVGh1LCBPY3QgMjIsIDIwMjAgYXQgMTI6NTUgUE0gTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4gTm90aWNlZCB0aGlzIHdoZW4gdHJ5aW5nIHRv
IGNvbXBpbGUgd2l0aCAtV2FsbCBvbiBhIGtlcm5lbCBmb3JrLiBXZQo+ID4gPiA+IHBvdGVudGlh
bGx5Cj4gPiA+ID4gZG9uJ3Qgc2V0IHdpZHRoIGhlcmUsIHdoaWNoIGNhdXNlcyB0aGUgY29tcGls
ZXIgdG8gY29tcGxhaW4gYWJvdXQgd2lkdGgKPiA+ID4gPiBwb3RlbnRpYWxseSBiZWluZyB1bmlu
aXRpYWxpemVkIGluIGRybV9jdnRfbW9kZXMoKS4gU28sIGxldCdzIGZpeCB0aGF0Lgo+ID4gPiA+
IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4g
PiA+ID4gCj4gPiA+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY1LjkrCj4gPiA+
ID4gRml4ZXM6IDNmNjQ5YWI3MjhjZCAoInRyZWV3aWRlOiBSZW1vdmUgdW5pbml0aWFsaXplZF92
YXIoKSB1c2FnZSIpCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVk
aGF0LmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5j
IHwgOCArKysrKysrLQo+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gPiA+ID4gaW5kZXgg
NjMxMTI1YjQ2ZTA0Li4yZGExNThmZmVkOGUgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQu
Ywo+ID4gPiA+IEBAIC0zMDk0LDYgKzMwOTQsNyBAQCBzdGF0aWMgaW50IGRybV9jdnRfbW9kZXMo
c3RydWN0IGRybV9jb25uZWN0b3IKPiA+ID4gPiAqY29ubmVjdG9yLAo+ID4gPiA+IAo+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCA0OyBpKyspIHsKPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IHdpZHRoLCBoZWlnaHQ7Cj4gPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTggY3Z0X2FzcGVjdF9yYXRpbzsKPiA+ID4gPiAKPiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3Z0ID0gJih0aW1pbmctPmRhdGEu
b3RoZXJfZGF0YS5kYXRhLmN2dFtpXSk7Cj4gPiA+ID4gCj4gPiA+ID4gQEAgLTMxMDEsNyArMzEw
Miw4IEBAIHN0YXRpYyBpbnQgZHJtX2N2dF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcgo+ID4g
PiA+ICpjb25uZWN0b3IsCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPiA+ID4gPiAKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaGVpZ2h0ID0gKGN2dC0+Y29kZVswXSArICgoY3Z0LT5jb2RlWzFdICYg
MHhmMCkgPDwgNCkgKwo+ID4gPiA+IDEpICoKPiA+ID4gPiAyOwo+ID4gPiA+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN3aXRjaCAoY3Z0LT5jb2RlWzFdICYgMHgwYykgewo+ID4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGN2dF9hc3BlY3RfcmF0aW8gPSBjdnQtPmNv
ZGVbMV0gJiAweDBjOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN3aXRj
aCAoY3Z0X2FzcGVjdF9yYXRpbykgewo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjYXNlIDB4MDA6Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB3aWR0aCA9IGhlaWdodCAqIDQgLyAzOwo+ID4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiA+ID4gQEAgLTMx
MTQsNiArMzExNiwxMCBAQCBzdGF0aWMgaW50IGRybV9jdnRfbW9kZXMoc3RydWN0IGRybV9jb25u
ZWN0b3IKPiA+ID4gPiAqY29ubmVjdG9yLAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjYXNlIDB4MGM6Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB3aWR0aCA9IGhlaWdodCAqIDE1IC8gOTsKPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQ6Cj4gPiA+IAo+ID4gPiBXaGF0IHZh
bHVlIHdvdWxkIGN2dC0+Y29kZVsxXSBoYXZlIHN1Y2ggdGhhdCB0aGlzIGdldHMgaGl0Pwo+ID4g
PiAKPiA+ID4gT3IgaXMgdGhpcyBhICJjb21waWxlciBpcyBicm9rZW4sIHNvIGxldCdzIGFkZCBt
b3JlIGNvZGUiIHNpdHVhdGlvbj8KPiA+ID4gSWYgc28sIHBlcmhhcHMgdGhlIGNvZGUgYWRkZWQg
Y291bGQganVzdCBiZSBlbm91Z2ggdG8gc2lsZW5jZSB0aGUKPiA+ID4gY29tcGlsZXIgKHVucmVh
Y2hhYmxlLCBldGMpPwo+ID4gCj4gPiBJIG1lYW4sIHRoaXMgaW5mb3JtYXRpb24gY29tZXMgZnJv
bSB0aGUgRURJRCB3aGljaCBpbmhlcmVudGx5IG1lYW5zIGl0J3MKPiA+IGNvbWluZwo+ID4gZnJv
bSBhbiB1bnRydXN0ZWQgc291cmNlIHNvIHRoZSB2YWx1ZSBjb3VsZCBiZSBsaXRlcmFsbHkgYW55
dGhpbmcgYXMgbG9uZyBhcwo+ID4gdGhlCj4gPiBFRElEIGhhcyBhIHZhbGlkIGNoZWNrc3VtLiBO
b3RlIChhc3N1bWluZyBJJ20gdW5kZXJzdGFuZGluZyB0aGlzIGNvZGUKPiA+IGNvcnJlY3RseSk6
Cj4gPiAKPiA+IGRybV9hZGRfZWRpZF9tb2RlcygpIOKGkiBhZGRfY3Z0X21vZGVzKCkg4oaSIGRy
bV9mb3JfZWFjaF9kZXRhaWxlZF9ibG9jaygpIOKGkgo+ID4gZG9fY3Z0X21vZGUoKSDihpIgZHJt
X2N2dF9tb2RlcygpCj4gPiAKPiA+IFNvIGFmYWljdCB0aGlzIGlzbid0IGEgYnJva2VuIGNvbXBp
bGVyIGJ1dCBhIGxlZ2l0aW1hdGUgdW5pbml0aWFsaXplZAo+ID4gdmFyaWFibGUuCj4gCj4gVGhl
IHZhbHVlIGNhbiBiZSBhbnl0aGluZywgYnV0IGl0IGhhcyB0byBiZSBzb21ldGhpbmcuIFRoZSBz
d2l0Y2ggaXMKPiBvbiAidW5rbm93biAmIDB4MGMiLCBzbyBvbmx5IDQgY2FzZXMgYXJlIHBvc3Np
YmxlLCB3aGljaCBhcmUKPiBlbnVtZXJhdGVkIGluIHRoZSBzd2l0Y2guCgpvb3BzLCB5b3UncmUg
Y29tcGxldGVseSByaWdodCBsb2wuIHdpbGwgZmlndXJlIG91dCB3aGF0IHRoZSB1bnJlYWNoYWJs
ZSBtYWNybyBpbgp0aGUga2VybmVsIGlzIGFuZCB1c2UgdGhhdCBpbiBhIHJlc3BpbiBvZiB0aGlz
IHBhdGNoCgo+IAo+IMKgIC1pbGlhCj4gCgotLSAKU2luY2VyZWx5LAogICBMeXVkZSBQYXVsIChz
aGUvaGVyKQogICBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0CiAgIApOb3RlOiBJIGRlYWwg
d2l0aCBhIGxvdCBvZiBlbWFpbHMgYW5kIGhhdmUgYSBsb3Qgb2YgYnVncyBvbiBteSBwbGF0ZS4g
SWYgeW91J3ZlCmFza2VkIG1lIGEgcXVlc3Rpb24sIGFyZSB3YWl0aW5nIGZvciBhIHJldmlldy9t
ZXJnZSBvbiBhIHBhdGNoLCBldGMuIGFuZCBJCmhhdmVuJ3QgcmVzcG9uZGVkIGluIGEgd2hpbGUs
IHBsZWFzZSBmZWVsIGZyZWUgdG8gc2VuZCBtZSBhbm90aGVyIGVtYWlsIHRvIGNoZWNrCm9uIG15
IHN0YXR1cy4gSSBkb24ndCBiaXRlIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
