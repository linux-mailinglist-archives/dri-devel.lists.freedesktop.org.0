Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E87332A5056
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 20:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805626E8EC;
	Tue,  3 Nov 2020 19:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956546E8EC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 19:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604432877;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CHQ3/bBc5WxHfN8LaH/bQM7T7VaD4uRFaJUk/wKN6nw=;
 b=V/53gMnjlQwcfEkf1wAVDNwedSiEa6r9cEf7jBixRKSHZ9+X3uoZU9GO92nWoLQspGLlH/
 ka8QPcyOIkfO2LeaQgnLkU4tPc2kb28YYwJEikemRlM1jnTrExmk4Ds4x5A7xSArwgWRaE
 Ab1v5UR+3D3IarMPGBciBzM0iY8xNFQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-CPGIPgTgNv6UPO9CLXskqg-1; Tue, 03 Nov 2020 14:47:55 -0500
X-MC-Unique: CPGIPgTgNv6UPO9CLXskqg-1
Received: by mail-qv1-f69.google.com with SMTP id b10so8051267qvl.8
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 11:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=CHQ3/bBc5WxHfN8LaH/bQM7T7VaD4uRFaJUk/wKN6nw=;
 b=rfZNkTyFHuW3nYYss321v6j0UZJAIoViC92qXi5NmRJXgGys9cIgsIQOjOmAEM9xbC
 3ZmKfEX2sIVwYTuDACQEpWyt661ln62bWv18SFOzUtKM1bj/2NoX/sXt2QvgRZsLJ3km
 kGIgTkpf8PiNqFsGp27jn0KsfHzyrfqcz+KoyhWfTR+oFtWJuuQVFPYe0sX3aJv8s0tc
 dZ6tMPZIYj3+8nWvT0xibdf0Mae3r/NiBgObOAw8C6+GYF+563EgkNjI8O1qg1aaTAPO
 iNb+bLYKj4u5d/636phe4ohJpP2oYMeIyORPdbmQ5z8V2IntuxAEf4AN2YZ2N2Hacg9E
 Sa5w==
X-Gm-Message-State: AOAM533OMn1jJmfAQol067Uox1hN+boEo9nSK3a/7wXS/PvDFmTXErWB
 flt3A9imi0eOAyNdzmfWVby6zs81lMPWM418UyIE+w8OKFzgZfwu+dHLIfD5x07jRvVWFekYHaZ
 +NqeVypYk8BZAY9xBN9lEpviXOGRX
X-Received: by 2002:a37:47c2:: with SMTP id u185mr17010919qka.63.1604432875496; 
 Tue, 03 Nov 2020 11:47:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0D0CC36lHqdD9IBGL0B2j1EjIRDVnCjR6y7CDfrhuUmcd3BPaRc4m50PeZvW+nAg9DESoqA==
X-Received: by 2002:a37:47c2:: with SMTP id u185mr17010888qka.63.1604432875262; 
 Tue, 03 Nov 2020 11:47:55 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id x75sm11687361qka.59.2020.11.03.11.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 11:47:54 -0800 (PST)
Message-ID: <8d15a513bd38a01b3607e5c75b5754cc599fe33c.camel@redhat.com>
Subject: Re: [PATCH] drm/edid: Fix uninitialized variable in drm_cvt_modes()
From: Lyude Paul <lyude@redhat.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 03 Nov 2020 14:47:53 -0500
In-Reply-To: <CAKb7UvhfWA6ijoQnq2Mvrx8jfn57EC-P5KBkYR3HmrBUrntJhg@mail.gmail.com>
References: <20201022165450.682571-1-lyude@redhat.com>
 <CAKb7UvhfWA6ijoQnq2Mvrx8jfn57EC-P5KBkYR3HmrBUrntJhg@mail.gmail.com>
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

U29ycnkhIFRob3VnaHQgSSBoYWQgcmVzcG9uZGVkIHRvIHRoaXMgYnV0IGFwcGFyZW50bHkgbm90
LCBjb21tZW50cyBkb3duIGJlbG93CgpPbiBUaHUsIDIwMjAtMTAtMjIgYXQgMTQ6MDQgLTA0MDAs
IElsaWEgTWlya2luIHdyb3RlOgo+IE9uIFRodSwgT2N0IDIyLCAyMDIwIGF0IDEyOjU1IFBNIEx5
dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gCj4gPiBOb3RpY2VkIHRoaXMg
d2hlbiB0cnlpbmcgdG8gY29tcGlsZSB3aXRoIC1XYWxsIG9uIGEga2VybmVsIGZvcmsuIFdlCj4g
PiBwb3RlbnRpYWxseQo+ID4gZG9uJ3Qgc2V0IHdpZHRoIGhlcmUsIHdoaWNoIGNhdXNlcyB0aGUg
Y29tcGlsZXIgdG8gY29tcGxhaW4gYWJvdXQgd2lkdGgKPiA+IHBvdGVudGlhbGx5IGJlaW5nIHVu
aW5pdGlhbGl6ZWQgaW4gZHJtX2N2dF9tb2RlcygpLiBTbywgbGV0J3MgZml4IHRoYXQuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gPiAKPiA+
IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NS45Kwo+ID4gRml4ZXM6IDNmNjQ5YWI3
MjhjZCAoInRyZWV3aWRlOiBSZW1vdmUgdW5pbml0aWFsaXplZF92YXIoKSB1c2FnZSIpCj4gPiBT
aWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiDC
oGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgOCArKysrKysrLQo+ID4gwqAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5j
Cj4gPiBpbmRleCA2MzExMjViNDZlMDQuLjJkYTE1OGZmZWQ4ZSAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYwo+ID4gQEAgLTMwOTQsNiArMzA5NCw3IEBAIHN0YXRpYyBpbnQgZHJtX2N2dF9tb2Rlcyhz
dHJ1Y3QgZHJtX2Nvbm5lY3Rvcgo+ID4gKmNvbm5lY3RvciwKPiA+IAo+ID4gwqDCoMKgwqDCoMKg
wqAgZm9yIChpID0gMDsgaSA8IDQ7IGkrKykgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGludCB3aWR0aCwgaGVpZ2h0Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdTggY3Z0X2FzcGVjdF9yYXRpbzsKPiA+IAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGN2dCA9ICYodGltaW5nLT5kYXRhLm90aGVyX2RhdGEuZGF0YS5jdnRbaV0pOwo+ID4g
Cj4gPiBAQCAtMzEwMSw3ICszMTAyLDggQEAgc3RhdGljIGludCBkcm1fY3Z0X21vZGVzKHN0cnVj
dCBkcm1fY29ubmVjdG9yCj4gPiAqY29ubmVjdG9yLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPiA+IAo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGhlaWdodCA9IChjdnQtPmNvZGVbMF0gKyAoKGN2dC0+Y29kZVsx
XSAmIDB4ZjApIDw8IDQpICsgMSkgKgo+ID4gMjsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHN3aXRjaCAoY3Z0LT5jb2RlWzFdICYgMHgwYykgewo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY3Z0X2FzcGVjdF9yYXRpbyA9IGN2dC0+Y29kZVsxXSAmIDB4MGM7Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzd2l0Y2ggKGN2dF9hc3BlY3RfcmF0aW8p
IHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIDB4MDA6Cj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdpZHRoID0gaGVpZ2h0
ICogNCAvIDM7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJyZWFrOwo+ID4gQEAgLTMxMTQsNiArMzExNiwxMCBAQCBzdGF0aWMgaW50IGRybV9jdnRf
bW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IKPiA+ICpjb25uZWN0b3IsCj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FzZSAweDBjOgo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3aWR0aCA9IGhlaWdodCAqIDE1IC8gOTsKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZWZhdWx0Ogo+IAo+IFdoYXQgdmFsdWUgd291
bGQgY3Z0LT5jb2RlWzFdIGhhdmUgc3VjaCB0aGF0IHRoaXMgZ2V0cyBoaXQ/Cj4gCj4gT3IgaXMg
dGhpcyBhICJjb21waWxlciBpcyBicm9rZW4sIHNvIGxldCdzIGFkZCBtb3JlIGNvZGUiIHNpdHVh
dGlvbj8KPiBJZiBzbywgcGVyaGFwcyB0aGUgY29kZSBhZGRlZCBjb3VsZCBqdXN0IGJlIGVub3Vn
aCB0byBzaWxlbmNlIHRoZQo+IGNvbXBpbGVyICh1bnJlYWNoYWJsZSwgZXRjKT8KCkkgbWVhbiwg
dGhpcyBpbmZvcm1hdGlvbiBjb21lcyBmcm9tIHRoZSBFRElEIHdoaWNoIGluaGVyZW50bHkgbWVh
bnMgaXQncyBjb21pbmcKZnJvbSBhbiB1bnRydXN0ZWQgc291cmNlIHNvIHRoZSB2YWx1ZSBjb3Vs
ZCBiZSBsaXRlcmFsbHkgYW55dGhpbmcgYXMgbG9uZyBhcyB0aGUKRURJRCBoYXMgYSB2YWxpZCBj
aGVja3N1bS4gTm90ZSAoYXNzdW1pbmcgSSdtIHVuZGVyc3RhbmRpbmcgdGhpcyBjb2RlCmNvcnJl
Y3RseSk6IAoKZHJtX2FkZF9lZGlkX21vZGVzKCkg4oaSIGFkZF9jdnRfbW9kZXMoKSDihpIgZHJt
X2Zvcl9lYWNoX2RldGFpbGVkX2Jsb2NrKCkg4oaSCmRvX2N2dF9tb2RlKCkg4oaSIGRybV9jdnRf
bW9kZXMoKQoKU28gYWZhaWN0IHRoaXMgaXNuJ3QgYSBicm9rZW4gY29tcGlsZXIgYnV0IGEgbGVn
aXRpbWF0ZSB1bmluaXRpYWxpemVkIHZhcmlhYmxlLgo+IAo+IMKgIC1pbGlhCj4gCgotLSAKU2lu
Y2VyZWx5LAogICBMeXVkZSBQYXVsIChzaGUvaGVyKQogICBTb2Z0d2FyZSBFbmdpbmVlciBhdCBS
ZWQgSGF0CiAgIApOb3RlOiBJIGRlYWwgd2l0aCBhIGxvdCBvZiBlbWFpbHMgYW5kIGhhdmUgYSBs
b3Qgb2YgYnVncyBvbiBteSBwbGF0ZS4gSWYgeW91J3ZlCmFza2VkIG1lIGEgcXVlc3Rpb24sIGFy
ZSB3YWl0aW5nIGZvciBhIHJldmlldy9tZXJnZSBvbiBhIHBhdGNoLCBldGMuIGFuZCBJCmhhdmVu
J3QgcmVzcG9uZGVkIGluIGEgd2hpbGUsIHBsZWFzZSBmZWVsIGZyZWUgdG8gc2VuZCBtZSBhbm90
aGVyIGVtYWlsIHRvIGNoZWNrCm9uIG15IHN0YXR1cy4gSSBkb24ndCBiaXRlIQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
