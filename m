Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB161BC271
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 17:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D406E81E;
	Tue, 28 Apr 2020 15:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205B46E81E;
 Tue, 28 Apr 2020 15:14:44 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v8so2613588wma.0;
 Tue, 28 Apr 2020 08:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=l31iHzi+Qs0wCkNpZUkmQ43l/0Uer53q54jbPNk9/tA=;
 b=KlHwcr3gTyxBlExVYMYEDezxp2MypKFK+c6Ao/6WCZFEdvxM87IzFhahTJWpvBuNZM
 cFsfktXWaoRij0YPRZs+CfSAAapta3x5PTjTct9nKzkeYlY/uKwbfbgFnN7gjjy2NYs8
 oeXIVDldzCGpa4IeFQvUz5qM0thtnyU+gBnAqzy88i4+rnZ7PFIvhnjWZjEFzSIO0kbL
 p0p19jj+iD6Xh5Tg8gXjuda6JrLj+r8F56iRtpn0tm/B5pquPdIB0hA4jaipWC68ssNv
 HlJNAQ+DAB1ZQ2u1gjAfaSG5//xbPSnz+CTuBZi+htDjig8onvuhS9nFWJ1tLfXTRyp2
 zKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=l31iHzi+Qs0wCkNpZUkmQ43l/0Uer53q54jbPNk9/tA=;
 b=XX+WvOC8Gz3T1oI2EnMi/gb0dKPp66V7F3ULtwX82gQJB9w4zolPBUgD7XMPqrd/on
 XbUX/lmKMgQAJq895PhuqBErgH6LkC0iE1XfRA60roXfab1nTYWI9zAK0ZMGKxhx7E/A
 b7Wz6hu6yebX8SlD2CPjResDbEgo4SuSxkWahR4tExp5gk26pkCQ44HeB3W2QjTw51u0
 lTSleytaJZ0NE317FyrLCMy01RVNbRwio65NXNTbv35WMPZqRYIPFjlj34YgAn6z0rw7
 bvbGHzM4KMJUzgzp83Z7PKy08d2MZ2T/yrtHkirMN6/qsbVGxemU9xe9B2L2XYPdw6pt
 Dz8w==
X-Gm-Message-State: AGi0Pua/4zenpi5clBovvyJM/jFUX1qP2FQfULPETI0csgzKf5U2/TOW
 fJEFTnYuigsHXA1Bxy0AtMU=
X-Google-Smtp-Source: APiQypL8H3EcxyO7rOvNQpM8a9StjgW5VyI7nmqOUuAgjrQlknQi+ypDm7LmhWDvCqyCCbM8wblpgQ==
X-Received: by 2002:a1c:7715:: with SMTP id t21mr4857338wmi.182.1588086882730; 
 Tue, 28 Apr 2020 08:14:42 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id s8sm25807970wru.38.2020.04.28.08.14.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 08:14:42 -0700 (PDT)
Subject: Re: [RFC 02/17] drm: amdgpu: fix sg_table nents vs. orig_nents misuse
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200428132005.21424-1-m.szyprowski@samsung.com>
 <CGME20200428132023eucas1p2a1993145eef91506698aa8c9750a7e43@eucas1p2.samsung.com>
 <20200428132005.21424-3-m.szyprowski@samsung.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c462d1f0-8daa-76bb-a7fd-5e0d687975d5@gmail.com>
Date: Tue, 28 Apr 2020 17:14:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200428132005.21424-3-m.szyprowski@samsung.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDQuMjAgdW0gMTU6MTkgc2NocmllYiBNYXJlayBTenlwcm93c2tpOgo+IFRoZSBEb2N1
bWVudGF0aW9uL0RNQS1BUEktSE9XVE8udHh0IHN0YXRlcyB0aGF0IGRtYV9tYXBfc2cgcmV0dXJu
cyB0aGUKPiBudW1lciBvZiB0aGUgY3JlYXRlZCBlbnRyaWVzIGluIHRoZSBETUEgYWRkcmVzcyBz
cGFjZS4gSG93ZXZlciB0aGUKPiBzdWJzZXF1ZW50IGNhbGxzIHRvIGRtYV9zeW5jX3NnX2Zvcl97
ZGV2aWNlLGNwdX0gYW5kIGRtYV91bm1hcF9zZyBtdXN0IGJlCj4gY2FsbGVkIHdpdGggdGhlIG9y
aWdpbmFsIG51bWJlciBvZiBlbnRyaWVzIHBhc3NlZCB0byBkbWFfbWFwX3NnLiBUaGUKPiBzZ190
YWJsZS0+bmVudHMgaW4gdHVybiBob2xkcyB0aGUgcmVzdWx0IG9mIHRoZSBkbWFfbWFwX3NnIGNh
bGwgYXMgc3RhdGVkCj4gaW4gaW5jbHVkZS9saW51eC9zY2F0dGVybGlzdC5oLiBBZGFwdCB0aGUg
Y29kZSB0byBvYmV5IHRob3NlIHJ1bGVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJv
d3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIHwgNyArKysrLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgIHwgOCArKysrLS0tLQo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKPiBpbmRleCA0M2Q4ZWQ3Li40ZGY4
MTNlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFf
YnVmLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5j
Cj4gQEAgLTMwNyw4ICszMDcsOSBAQCBzdGF0aWMgc3RydWN0IHNnX3RhYmxlICphbWRncHVfZG1h
X2J1Zl9tYXAoc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLAo+ICAgCQlpZiAoSVNf
RVJSKHNndCkpCj4gICAJCQlyZXR1cm4gc2d0Owo+ICAgCj4gLQkJaWYgKCFkbWFfbWFwX3NnX2F0
dHJzKGF0dGFjaC0+ZGV2LCBzZ3QtPnNnbCwgc2d0LT5uZW50cywgZGlyLAo+IC0JCQkJICAgICAg
RE1BX0FUVFJfU0tJUF9DUFVfU1lOQykpCj4gKwkJc2d0LT5uZW50cyA9IGRtYV9tYXBfc2dfYXR0
cnMoYXR0YWNoLT5kZXYsIHNndC0+c2dsLCBzZ3QtPm9yaWdfbmVudHMsCj4gKwkJCQkJICAgICAg
ZGlyLCBETUFfQVRUUl9TS0lQX0NQVV9TWU5DKTsKPiArCQlpZiAoIXNndC0+bmVudHMpCj4gICAJ
CQlnb3RvIGVycm9yX2ZyZWU7Cj4gICAJCWJyZWFrOwo+ICAgCj4gQEAgLTM0OSw3ICszNTAsNyBA
QCBzdGF0aWMgdm9pZCBhbWRncHVfZG1hX2J1Zl91bm1hcChzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2ht
ZW50ICphdHRhY2gsCj4gICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRt
X2FkZXYoYm8tPnRiby5iZGV2KTsKPiAgIAo+ICAgCWlmIChzZ3QtPnNnbC0+cGFnZV9saW5rKSB7
Cj4gLQkJZG1hX3VubWFwX3NnKGF0dGFjaC0+ZGV2LCBzZ3QtPnNnbCwgc2d0LT5uZW50cywgZGly
KTsKPiArCQlkbWFfdW5tYXBfc2coYXR0YWNoLT5kZXYsIHNndC0+c2dsLCBzZ3QtPm9yaWdfbmVu
dHMsIGRpcik7Cj4gICAJCXNnX2ZyZWVfdGFibGUoc2d0KTsKPiAgIAkJa2ZyZWUoc2d0KTsKPiAg
IAl9IGVsc2Ugewo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiBpbmRl
eCBkNTU0M2MyLi41ZjMxNTg1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYwo+IEBAIC0xMDQzLDcgKzEwNDMsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV90dG1fdHRf
cGluX3VzZXJwdHIoc3RydWN0IHR0bV90dCAqdHRtKQo+ICAgewo+ICAgCXN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KHR0bS0+YmRldik7Cj4gICAJc3RydWN0IGFt
ZGdwdV90dG1fdHQgKmd0dCA9ICh2b2lkICopdHRtOwo+IC0JdW5zaWduZWQgbmVudHM7Cj4gICAJ
aW50IHI7Cj4gICAKPiAgIAlpbnQgd3JpdGUgPSAhKGd0dC0+dXNlcmZsYWdzICYgQU1ER1BVX0dF
TV9VU0VSUFRSX1JFQURPTkxZKTsKPiBAQCAtMTA1OSw4ICsxMDU4LDkgQEAgc3RhdGljIGludCBh
bWRncHVfdHRtX3R0X3Bpbl91c2VycHRyKHN0cnVjdCB0dG1fdHQgKnR0bSkKPiAgIAo+ICAgCS8q
IE1hcCBTRyB0byBkZXZpY2UgKi8KPiAgIAlyID0gLUVOT01FTTsKPiAtCW5lbnRzID0gZG1hX21h
cF9zZyhhZGV2LT5kZXYsIHR0bS0+c2ctPnNnbCwgdHRtLT5zZy0+bmVudHMsIGRpcmVjdGlvbik7
Cj4gLQlpZiAobmVudHMgPT0gMCkKPiArCXR0bS0+c2ctPm5lbnRzID0gZG1hX21hcF9zZyhhZGV2
LT5kZXYsIHR0bS0+c2ctPnNnbCwKPiArCQkJCSAgICB0dG0tPnNnLT5vcmlnX25lbnRzLCBkaXJl
Y3Rpb24pOwo+ICsJaWYgKHR0bS0+c2ctPm5lbnRzID09IDApCj4gICAJCWdvdG8gcmVsZWFzZV9z
ZzsKPiAgIAo+ICAgCS8qIGNvbnZlcnQgU0cgdG8gbGluZWFyIGFycmF5IG9mIHBhZ2VzIGFuZCBk
bWEgYWRkcmVzc2VzICovCj4gQEAgLTEwOTEsNyArMTA5MSw3IEBAIHN0YXRpYyB2b2lkIGFtZGdw
dV90dG1fdHRfdW5waW5fdXNlcnB0cihzdHJ1Y3QgdHRtX3R0ICp0dG0pCj4gICAJCXJldHVybjsK
PiAgIAo+ICAgCS8qIHVubWFwIHRoZSBwYWdlcyBtYXBwZWQgdG8gdGhlIGRldmljZSAqLwo+IC0J
ZG1hX3VubWFwX3NnKGFkZXYtPmRldiwgdHRtLT5zZy0+c2dsLCB0dG0tPnNnLT5uZW50cywgZGly
ZWN0aW9uKTsKPiArCWRtYV91bm1hcF9zZyhhZGV2LT5kZXYsIHR0bS0+c2ctPnNnbCwgdHRtLT5z
Zy0+b3JpZ19uZW50cywgZGlyZWN0aW9uKTsKPiAgIAo+ICAgCXNnX2ZyZWVfdGFibGUodHRtLT5z
Zyk7Cj4gICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
