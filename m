Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B405E0016
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4904E6E497;
	Tue, 22 Oct 2019 08:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1916E497
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:56:34 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f22so15336419wmc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 01:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=NhL0fj9j5ptz9/xvHkQKOUdaslq/CkWZYa1JsAOtxdI=;
 b=pj3uyAC18rUFaHspC2nwcGsqcUsMa1sHTafUbNx9Ax7F646ze5unTksxw9GP4Z1YVZ
 qII5rBhPvw+l/URc/4/JrEukCJ3K00xBe4qRV5bygJRPp1wSGbGwEHb0dhznn/nVbQJG
 +W1Nyp4NC1Ty/VC8CxIpqyp3ackPOWrVsnKKewbUlAsHWtfWxwVvaxa50+bRhXvU90Ai
 ANPM605QDQu5YUZyUHwyoZe6Fq4jLNcllgvGT5V2WTPOIN/NpgPiUrNuKjgF4WHiKV6D
 /Bcy4N+Xb8WMmkph5pK2anlZuF3ANLHnCURcGMg+ysBX2Ev6OIU9MkAdEUg6usuaaIJ1
 b7bQ==
X-Gm-Message-State: APjAAAW/1r4t+y0hkdxY68hu9hzmcBHXzqAmid0cbrNx5HhkBVOE1eRj
 5XorvUUB187UhHtqkRZYeM/95Q==
X-Google-Smtp-Source: APXvYqxAfMxeUyGmFf4v1DK17doImX3Vhpdg+HjGuwTEd4+hbl0KGo4Sg9ZmYxWQbSjf750Elb+ibQ==
X-Received: by 2002:a05:600c:211:: with SMTP id
 17mr1886520wmi.135.1571734593057; 
 Tue, 22 Oct 2019 01:56:33 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id p17sm14054884wrn.4.2019.10.22.01.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 01:56:32 -0700 (PDT)
Date: Tue, 22 Oct 2019 10:56:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kangjie Lu <kjlu@umn.edu>
Subject: Re: [PATCH] gma/gma500: fix a memory disclosure bug due to
 uninitialized bytes
Message-ID: <20191022085630.GZ11828@phenom.ffwll.local>
Mail-Followup-To: Kangjie Lu <kjlu@umn.edu>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20191018042953.31099-1-kjlu@umn.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018042953.31099-1-kjlu@umn.edu>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=NhL0fj9j5ptz9/xvHkQKOUdaslq/CkWZYa1JsAOtxdI=;
 b=HkJ5+MiJN5s233Lm4108n/NHXuc/rh3e7JUmGptlI92KC8Q+kkmPwZVA11ptKcqGBP
 nkgtevwOkp8YI1V/3vsZB61EqzCJmPDEJ8ZKissu//tLQ9HadBwMaJ0WBm5IU/+LyRig
 R1iIlCkSBTesmDVn577MKXytRnEQoDXE6RDuk=
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

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTE6Mjk6NTNQTSAtMDUwMCwgS2FuZ2ppZSBMdSB3cm90
ZToKPiBgYmVzdF9jbG9ja2AgaXMgYW4gb2JqZWN0IHRoYXQgbWF5IGJlIHNlbnQgb3V0LiBPYmpl
Y3QgYGNsb2NrYAo+IGNvbnRhaW5zIHVuaW5pdGlhbGl6ZWQgYnl0ZXMgdGhhdCBhcmUgY29waWVk
IHRvIGBiZXN0X2Nsb2NrYCwKPiB3aGljaCBsZWFkcyB0byBtZW1vcnkgZGlzY2xvc3VyZSBhbmQg
aW5mb3JtYXRpb24gbGVhay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLYW5namllIEx1IDxramx1QHVt
bi5lZHU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2X2ludGVsX2Rpc3BsYXku
YyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJz
L2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9kaXNwbGF5LmMKPiBpbmRleCBmNTY4NTJhNTAzZTgu
LjhiNzg0OTQ3ZWQzYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9p
bnRlbF9kaXNwbGF5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9k
aXNwbGF5LmMKPiBAQCAtNDA1LDYgKzQwNSw4IEBAIHN0YXRpYyBib29sIGNkdl9pbnRlbF9maW5k
X2RwX3BsbChjb25zdCBzdHJ1Y3QgZ21hX2xpbWl0X3QgKmxpbWl0LAo+ICAJc3RydWN0IGdtYV9j
cnRjICpnbWFfY3J0YyA9IHRvX2dtYV9jcnRjKGNydGMpOwo+ICAJc3RydWN0IGdtYV9jbG9ja190
IGNsb2NrOwo+ICAKPiArCW1lbXNldCgmY2xvY2ssIDAsIHNpemVvZihjbG9jaykpOwoKSSBndWVz
cyB3aGF0ZXZlciBhbmFseXplciB5b3UgdXNlIGZvciB0aGlzIGRvZXNuJ3Qgc2VlIHBhc3QgdGhl
IC0+Y2xvY2sKdmZ1bmMgY2FsbCwgc28gc2hvdWxkbid0IGJlIGEgcmVhbCBpc3N1ZS4gQWxzbywg
aXQncyBub3QgYW4gaW5mb3JtYXRpb24KZGlzY2xvc3VyZSBzaW5jZSB3ZSBvbmx5IGV2ZXIgbGVh
ayB0aGlzIHRvIG90aGVyIGtlcm5lbCBjb2RlLCBuZXZlcgp1c2Vyc3BhY2UuCgpCdXQgSSBndWVz
cyBkb2Vzbid0IGh1cnQsIHNvIGFwcGxpZWQuCi1EYW5pZWwKCj4gKwo+ICAJc3dpdGNoIChyZWZj
bGspIHsKPiAgCWNhc2UgMjcwMDA6Cj4gIAkJaWYgKHRhcmdldCA8IDIwMDAwMCkgewo+IC0tIAo+
IDIuMTcuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
