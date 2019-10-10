Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B29D30AF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 20:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36E76E3C1;
	Thu, 10 Oct 2019 18:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D776E3C1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 18:45:46 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id q143so2262206ybg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 11:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A/ttt3bFmMs3oe08RcmXuhu4LizkiCyYFIE0laa45So=;
 b=E9nvIzfWCGUZh3wuOMgWgBijsucaqURetCGyzOt9wW8o372TifOzI2hThXMnGsarL1
 c27z05hnIp/Z31dwOj79NiC3dE2sBoWhQekPvWAhpYG3FmTF18LLob3QZ33JLi5+kviw
 WQxIrQORE+P4UaQS9CMfNGmhGRaBjfRd6SMHFgWh3kc5VQiwTTtv3z0ZT5jZJWhP7QBh
 BAOCGlN9Y+SBn3GYfK6sWrjf6RwSIJ5ekuD2KhEHTNyl6uXmpsHn+UFvlFetqsPZXUxb
 AJNpgYDbKBXWBW5A4za6PEfKeGWI16OWR64CJ0LH0wfTugEk6BU/PPQpotshyPg/wT1c
 Qhaw==
X-Gm-Message-State: APjAAAWFyqJ0SCvAYWNg4ftf/FTMcnWCn4zhrlxRzoM5bCQRMyL3ySe/
 PZoTMrEa53FYDTNsOFmEbZHadQ==
X-Google-Smtp-Source: APXvYqyh33T1BNbWlgbA1o9hie13mRU+C4O0G5oOi8OvRSwg6vQv6oB4PiTNCKeHDoJbj82grAWYzw==
X-Received: by 2002:a25:84ce:: with SMTP id x14mr7606863ybm.437.1570733145768; 
 Thu, 10 Oct 2019 11:45:45 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id y129sm1682398ywy.41.2019.10.10.11.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 11:45:45 -0700 (PDT)
Date: Thu, 10 Oct 2019 14:45:44 -0400
From: Sean Paul <sean@poorly.run>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Implement reset correctly
Message-ID: <20191010184544.GK85762@art_vandelay>
References: <20191009213454.32891-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009213454.32891-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=A/ttt3bFmMs3oe08RcmXuhu4LizkiCyYFIE0laa45So=;
 b=IyjR386BAgPPWowRuqUZTRmePv2ormX4YmToHCVqZVPMdy7A3ol3aZwvXdIydzup9K
 przYrp1X0Hv1wH8j6k0fnoNR5Pl9UkSctcdX23cXDOxQ6R54KO/UfVG7tOVLbwdpuls5
 oxPa8TshABAWqRdYX5+QCIONLi/e3rSqLbVNV2+bsjDegRpDiCYXWUFhnrD/YsPxXc6l
 kMw8l9PgWqLd+n+Aqv3piQLUzjoywgzTh7ISxEKBTfPvQQDF5B4Jtfi/qRxqTT42N1cW
 fJZW3r8z7gW9RgQcC8KX+qOHw9k3xrwWRaXWPBPtauKpuV2lr0qgjs/CMsahE6havdRp
 qAFg==
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMDI6MzQ6NTRQTSAtMDcwMCwgSmVmZnJleSBIdWdvIHdy
b3RlOgo+IE9uIG1zbTg5OTgsIHZibGFuayB0aW1lb3V0cyBhcmUgb2JzZXJ2ZWQgYmVjYXVzZSB0
aGUgRFNJIGNvbnRyb2xsZXIgaXMgbm90Cj4gcmVzZXQgcHJvcGVybHksIHdoaWNoIGVuZHMgdXAg
c3RhbGxpbmcgdGhlIE1EUC4gIFRoaXMgaXMgYmVjYXVzZSB0aGUgcmVzZXQKPiBsb2dpYyBpcyBu
b3QgY29ycmVjdCBwZXIgdGhlIGhhcmR3YXJlIGRvY3VtZW50YXRpb24uCj4gCj4gVGhlIGRvY3Vt
ZW50YXRpb24gc3RhdGVzIHRoYXQgYWZ0ZXIgYXNzZXJ0aW5nIHJlc2V0LCBzb2Z0d2FyZSBzaG91
bGQgd2FpdAo+IHNvbWUgdGltZSAobm8gaW5kaWNhdGlvbiBvZiBob3cgbG9uZyksIG9yIHBvbGwg
dGhlIHN0YXR1cyByZWdpc3RlciB1bnRpbCBpdAo+IHJldHVybnMgMCBiZWZvcmUgZGVhc3NlcnRp
bmcgcmVzZXQuCj4gCj4gd21iKCkgaXMgaW5zdWZmaWNpZW50IGZvciB0aGlzIHB1cnBvc2Ugc2lu
Y2UgaXQganVzdCBlbnN1cmVzIG9yZGVyaW5nLCBub3QKPiB0aW1pbmcgYmV0d2VlbiB3cml0ZXMu
ICBTaW5jZSBhc3NlcnRpbmcgYW5kIGRlYXNzZXJ0aW5nIHJlc2V0IG9jY3VycyBvbiB0aGUKPiBz
YW1lIHJlZ2lzdGVyLCBvcmRlcmluZyBpcyBhbHJlYWR5IGd1YXJhbnRlZWQgYnkgdGhlIGFyY2hp
dGVjdHVyZSwgbWFraW5nCj4gdGhlIHdtYiBleHRyYW5lb3VzLgo+IAo+IFNpbmNlIHdlIHdvdWxk
IGRlZmluZSBhIHRpbWVvdXQgZm9yIHBvbGxpbmcgdGhlIHN0YXR1cyByZWdpc3RlciB0byBhdm9p
ZCBhCj4gcG9zc2libGUgaW5maW5pdGUgbG9vcCwgbGV0cyBqdXN0IHVzZSBhIHN0YXRpYyBkZWxh
eSBvZiAyMCBtcywgc2luY2UgMTYuNjY2Cj4gbXMgaXMgdGhlIHRpbWUgYXZhaWxhYmxlIHRvIHBy
b2Nlc3Mgb25lIGZyYW1lIGF0IDYwIGZwcy4KPiAKPiBGaXhlczogYTY4OTU1NGJhNmVkIChkcm0v
bXNtOiBJbml0aWFsIGFkZCBEU0kgY29ubmVjdG9yIHN1cHBvcnQpCj4gU2lnbmVkLW9mZi1ieTog
SmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+Cj4gLS0tCj4gCj4gUm9iIGV0
IGFsLCBpcyBpdCBwb3NzaWJsZSBmb3IgdGhpcyB0byBnbyBpbnRvIGEgNS40LXJjPwo+IAo+ICBk
cml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rz
aS9kc2lfaG9zdC5jCj4gaW5kZXggNjYzZmY5ZjRmYWM5Li42OGRlZDliNDczNWQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMKPiBAQCAtOTg2LDcgKzk4Niw3IEBAIHN0YXRpYyB2
b2lkIGRzaV9zd19yZXNldChzdHJ1Y3QgbXNtX2RzaV9ob3N0ICptc21faG9zdCkKPiAgCXdtYigp
OyAvKiBjbG9ja3MgbmVlZCB0byBiZSBlbmFibGVkIGJlZm9yZSByZXNldCAqLwo+ICAKPiAgCWRz
aV93cml0ZShtc21faG9zdCwgUkVHX0RTSV9SRVNFVCwgMSk7Cj4gLQl3bWIoKTsgLyogbWFrZSBz
dXJlIHJlc2V0IGhhcHBlbiAqLwo+ICsJbXNsZWVwKDIwKTsgLyogbWFrZSBzdXJlIHJlc2V0IGhh
cHBlbiAqLwoKQ291bGQgeW91IHBsZWFzZSBwdWxsIHRoaXMgb3V0IGludG8gYSAjZGVmaW5lIHVz
ZWQgZm9yIGJvdGggaW4gY2FzZSB3ZSBkZWNpZGUgdG8KdHdlYWsgaXQ/IEkgZG9uJ3Qgd2FudCB0
aGVzZSAyIHZhbHVlcyB0byBkcmlmdC4KClRoYW5rcywKU2VhbgoKPiAgCWRzaV93cml0ZShtc21f
aG9zdCwgUkVHX0RTSV9SRVNFVCwgMCk7Cj4gIH0KPiAgCj4gQEAgLTEzOTYsNyArMTM5Niw3IEBA
IHN0YXRpYyB2b2lkIGRzaV9zd19yZXNldF9yZXN0b3JlKHN0cnVjdCBtc21fZHNpX2hvc3QgKm1z
bV9ob3N0KQo+ICAKPiAgCS8qIGRzaSBjb250cm9sbGVyIGNhbiBvbmx5IGJlIHJlc2V0IHdoaWxl
IGNsb2NrcyBhcmUgcnVubmluZyAqLwo+ICAJZHNpX3dyaXRlKG1zbV9ob3N0LCBSRUdfRFNJX1JF
U0VULCAxKTsKPiAtCXdtYigpOwkvKiBtYWtlIHN1cmUgcmVzZXQgaGFwcGVuICovCj4gKwltc2xl
ZXAoMjApOwkvKiBtYWtlIHN1cmUgcmVzZXQgaGFwcGVuICovCj4gIAlkc2lfd3JpdGUobXNtX2hv
c3QsIFJFR19EU0lfUkVTRVQsIDApOwo+ICAJd21iKCk7CS8qIGNvbnRyb2xsZXIgb3V0IG9mIHJl
c2V0ICovCj4gIAlkc2lfd3JpdGUobXNtX2hvc3QsIFJFR19EU0lfQ1RSTCwgZGF0YTApOwo+IC0t
IAo+IDIuMTcuMQo+IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAv
IENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
