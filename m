Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB727E0028
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1A16E4A1;
	Tue, 22 Oct 2019 08:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AC06E4A1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:59:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p4so17082928wrm.8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 01:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=jxmCwIeHDgkpYVsOzcGzZpWtPrDaLJlk3S4i0/jBbqQ=;
 b=O8u6qY8yjy84WC0E491s443jZIlMgULdoYGxNoIzElHbPE+Au0B2AzOfXp21xM6u2x
 YiAxtEOVRxUynzQXeezIXD/TnCdmFg5gqIRgoxH37dlP4IQDxoJ9WYmAXfq2UEZtLtYS
 I/q7qDyeoWXHbgzph5/RrT/f2fKHfq/oHfHOcvu/WXIxtgPGUStu1v+9CUZ41lmwH65I
 K+BTXdh1ywaIfpYneH3aqE9KjR6oidwQ/iMMSUG9r9s4428cgNhu4QQ97vnhqsSvMoxV
 hLykGfcBaIrlROZ5gVpzVSy4HUglyV8qf9Aqim48FbiP8H8QHVVhYDvkoPKL1qUSOYw+
 KSog==
X-Gm-Message-State: APjAAAVPRPmXn/GSKUlsb8bZ+8k1t1e6XohyO2f+f27IGe77EkpjfgR9
 khC8aeTEYwt+U0jK88c1Qz8nzw==
X-Google-Smtp-Source: APXvYqzd2QpyGvXdawpEdZBVER8fWByd/JbP1ANnd25CFqLpm8M5brZeLwzlHZe2BHfKM5mySIaaEw==
X-Received: by 2002:adf:9bdc:: with SMTP id e28mr2303057wrc.309.1571734770249; 
 Tue, 22 Oct 2019 01:59:30 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b196sm10894237wmd.24.2019.10.22.01.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 01:59:29 -0700 (PDT)
Date: Tue, 22 Oct 2019 10:59:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kangjie Lu <kjlu@umn.edu>
Subject: Re: [PATCH] drm/gma500: fix memory disclosures due to uninitialized
 bytes
Message-ID: <20191022085927.GA11828@phenom.ffwll.local>
Mail-Followup-To: Kangjie Lu <kjlu@umn.edu>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20191018044150.1899-1-kjlu@umn.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018044150.1899-1-kjlu@umn.edu>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=jxmCwIeHDgkpYVsOzcGzZpWtPrDaLJlk3S4i0/jBbqQ=;
 b=FzT8PFDjIeRzigByVRwj0mJBOY+NZri4fx2GCcFeQvsKu0uIP5+G1eqnDjAUzziXIW
 iSpGdtjw/lp3Cqe01O2ixd9JHyOXSLeoDOMn/iys8YEejPa0QHKhm7+iDi1ZmWFGWNjP
 E9UwvDBr6PKnx7uCF5g51cb3H2YhOPDsKpR2o=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTE6NDE6NTBQTSAtMDUwMCwgS2FuZ2ppZSBMdSB3cm90
ZToKPiAiY2xvY2siIG1heSBiZSBjb3BpZWQgdG8gImJlc3RfY2xvY2siLiBJbml0aWFsaXppbmcg
YmVzdF9jbG9jawo+IGlzIG5vdCBzdWZmaWNpZW50LiBUaGUgZml4IGluaXRpYWxpemVzIGNsb2Nr
IGFzIHdlbGwgdG8gYXZvaWQKPiBtZW1vcnkgZGlzY2xvc3VyZXMgYW5kIGluZm9ybWFpdG9uIGxl
YWtzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEthbmdqaWUgTHUgPGtqbHVAdW1uLmVkdT4KCkFnYWlu
IG5vIGxlYWsgaGVyZSwgYnV0IGFsc28gZG9lc24ndCBodXJ0LCBzbyBhcHBsaWVkLgotRGFuaWVs
Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2NydGMuYyB8IDIgKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1
MDAvb2FrdHJhaWxfY3J0Yy5jCj4gaW5kZXggMTY3YzEwNzY3ZGQ0Li45MDBlNTQ5OTI0OWQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9jcnRjLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2NydGMuYwo+IEBAIC0xMjksNiArMTI5
LDcgQEAgc3RhdGljIGJvb2wgbXJzdF9zZHZvX2ZpbmRfYmVzdF9wbGwoY29uc3Qgc3RydWN0IGdt
YV9saW1pdF90ICpsaW1pdCwKPiAgCXMzMiBmcmVxX2Vycm9yLCBtaW5fZXJyb3IgPSAxMDAwMDA7
Cj4gIAo+ICAJbWVtc2V0KGJlc3RfY2xvY2ssIDAsIHNpemVvZigqYmVzdF9jbG9jaykpOwo+ICsJ
bWVtc2V0KCZjbG9jaywgMCwgc2l6ZW9mKGNsb2NrKSk7Cj4gIAo+ICAJZm9yIChjbG9jay5tID0g
bGltaXQtPm0ubWluOyBjbG9jay5tIDw9IGxpbWl0LT5tLm1heDsgY2xvY2subSsrKSB7Cj4gIAkJ
Zm9yIChjbG9jay5uID0gbGltaXQtPm4ubWluOyBjbG9jay5uIDw9IGxpbWl0LT5uLm1heDsKPiBA
QCAtMTg1LDYgKzE4Niw3IEBAIHN0YXRpYyBib29sIG1yc3RfbHZkc19maW5kX2Jlc3RfcGxsKGNv
bnN0IHN0cnVjdCBnbWFfbGltaXRfdCAqbGltaXQsCj4gIAlpbnQgZXJyID0gdGFyZ2V0Owo+ICAK
PiAgCW1lbXNldChiZXN0X2Nsb2NrLCAwLCBzaXplb2YoKmJlc3RfY2xvY2spKTsKPiArCW1lbXNl
dCgmY2xvY2ssIDAsIHNpemVvZihjbG9jaykpOwo+ICAKPiAgCWZvciAoY2xvY2subSA9IGxpbWl0
LT5tLm1pbjsgY2xvY2subSA8PSBsaW1pdC0+bS5tYXg7IGNsb2NrLm0rKykgewo+ICAJCWZvciAo
Y2xvY2sucDEgPSBsaW1pdC0+cDEubWluOyBjbG9jay5wMSA8PSBsaW1pdC0+cDEubWF4Owo+IC0t
IAo+IDIuMTcuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
