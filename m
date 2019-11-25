Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A840108AB6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 10:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7510389C59;
	Mon, 25 Nov 2019 09:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6380089C59
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 09:22:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n1so16995440wra.10
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 01:22:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=QiRSkNH09nDsKaV88CvJJn/s44TY85sod7XlDRyFXvQ=;
 b=KOKgbrVFMz3MWeb2GfgaSiHXQ30DsKFfAqgTcMKHFleII2/ouj67B7uro8T9lnjBxC
 CUk5ut8Szajqmpvlt89rFhLVNYvvMnkiEZtd+tGnYraMScnDSn9SnltMBCZk1IiMpK26
 Z0dfmrR6tcwxCkmHD9xQDNnjhVuYe6MbvRoTQwPuEay0PRr4/1iaLM08Txo7gXtRcTr0
 Aqkclp/mvgPDD09fPMFL+gzhbDywS895Th4xAYSjRI/FMF4APw8fe36iruSl2rdZqPrQ
 Lpahrx+fmH/puuw+lVp0jpjON11pjk7zt2M4Ml9Xdyw9R/OYDj4bHgwpcgXR1pNqYZ2p
 Sv0Q==
X-Gm-Message-State: APjAAAWHpkCr3hvbhu/2AmNZOgsaM9ePXdC6yY0Y93fNVgUHpnNJIKTC
 F2l5H11KC4e642+Wpr5e3KCllA==
X-Google-Smtp-Source: APXvYqz5j9Sk1KwP87Rie41BfxNaFxInLur5nJHL6zE3OzpkLJ4XRYQBBQiJWf93BsiUzqYndQdomA==
X-Received: by 2002:adf:da52:: with SMTP id r18mr30554159wrl.167.1574673752986; 
 Mon, 25 Nov 2019 01:22:32 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id l4sm7659664wme.4.2019.11.25.01.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 01:22:32 -0800 (PST)
Date: Mon, 25 Nov 2019 10:22:30 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] dma-buf: Fix memory leak in sync_file_merge()
Message-ID: <20191125092230.GJ29965@phenom.ffwll.local>
Mail-Followup-To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, emamd001@umn.edu
References: <20191122220957.30427-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122220957.30427-1-navid.emamdoost@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QiRSkNH09nDsKaV88CvJJn/s44TY85sod7XlDRyFXvQ=;
 b=jI6XqUKbE97OBR/UjSAdMYh4vADo7HA8Po0z1ZkXIMS3qB0URQJUFT1wc74uDMBR9W
 UWJa4/mNsQvrq6cMlNkpwknrPDbfv+qIYOKEH3ZWkUM7fMi2c76QIvjsxC6F7kgS6llk
 OZyNOS7CRJFGADKBjENW/ez+cXb85ep20lVUk=
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
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 emamd001@umn.edu, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDQ6MDk6NTVQTSAtMDYwMCwgTmF2aWQgRW1hbWRvb3N0
IHdyb3RlOgo+IEluIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBzeW5jX2ZpbGVfbWVyZ2UoKSB0aGUg
YWxsb2NhdGVkIHN5bmNfZmlsZSBpcwo+IGxlYWtlZCBpZiBudW1iZXIgb2YgZmVuY2VzIG92ZXJm
bG93cy4gUmVsZWFzZSBzeW5jX2ZpbGUgYnkgZ290byBlcnIuCj4gCj4gRml4ZXM6IGEwMmI5ZGM5
MGQ4NCAoImRtYS1idWYvc3luY19maWxlOiByZWZhY3RvciBmZW5jZSBzdG9yYWdlIGluIHN0cnVj
dCBzeW5jX2ZpbGUiKQo+IFNpZ25lZC1vZmYtYnk6IE5hdmlkIEVtYW1kb29zdCA8bmF2aWQuZW1h
bWRvb3N0QGdtYWlsLmNvbT4KClRoYW5rcyBmb3IgeW91ciBwYXRjaCwgYXBwbGllZCB3aXRoIGEg
Y2M6c3RhYmxlLgotRGFuaWVsCgo+IC0tLQo+ICBkcml2ZXJzL2RtYS1idWYvc3luY19maWxlLmMg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvc3luY19maWxlLmMgYi9kcml2ZXJzL2Rt
YS1idWYvc3luY19maWxlLmMKPiBpbmRleCAyNWM1YzA3MTY0NWIuLjkxMTg1ZGI5YTk1MiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvc3luY19maWxlLmMKPiArKysgYi9kcml2ZXJzL2Rt
YS1idWYvc3luY19maWxlLmMKPiBAQCAtMjIxLDcgKzIyMSw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc3lu
Y19maWxlICpzeW5jX2ZpbGVfbWVyZ2UoY29uc3QgY2hhciAqbmFtZSwgc3RydWN0IHN5bmNfZmls
ZSAqYSwKPiAgCWFfZmVuY2VzID0gZ2V0X2ZlbmNlcyhhLCAmYV9udW1fZmVuY2VzKTsKPiAgCWJf
ZmVuY2VzID0gZ2V0X2ZlbmNlcyhiLCAmYl9udW1fZmVuY2VzKTsKPiAgCWlmIChhX251bV9mZW5j
ZXMgPiBJTlRfTUFYIC0gYl9udW1fZmVuY2VzKQo+IC0JCXJldHVybiBOVUxMOwo+ICsJCWdvdG8g
ZXJyOwo+ICAKPiAgCW51bV9mZW5jZXMgPSBhX251bV9mZW5jZXMgKyBiX251bV9mZW5jZXM7Cj4g
IAo+IC0tIAo+IDIuMTcuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
