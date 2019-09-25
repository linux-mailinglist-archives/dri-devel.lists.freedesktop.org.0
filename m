Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A06EBE87F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 00:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB866ED35;
	Wed, 25 Sep 2019 22:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2396ED35
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 22:52:35 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-ztf8Xkn3OQy8KqvfGOCJ-g-1; Wed, 25 Sep 2019 18:52:33 -0400
Received: by mail-qt1-f200.google.com with SMTP id j5so498269qtn.10
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 15:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=3TYWa7QxybKhq6P5dfdLARMaRftgizAJhr2wRJAZ26k=;
 b=Yo6f/Fz4I7UVEth2XuDOxrdr0XpjuLEW4SmKgivlaoK+86gLpuAZChhynWKJGx5RbV
 VF8Gy+qzbrsJ0g51mUFa9WxG/mWWEvmiycBZbDjeJYISFaUXZ9gtMoQKpEFVUji+nAhi
 +hh5A1jbJ/qu2o1QcD53SVtAOXpDYecKPlPR+hi0koCzf2g5xU0kQZaCXkQQErgDC8q9
 vvSJ78yquhr/ylTDJ7mrg/esJ7SXolCZ2ftYnDK1dC1Ol8BcYYbQYMOKe6vqM8wS0beV
 FY6J+GO9rGgHLKXeUKeB4cjSu3JU2w1inr70YytrVg0HvKH1Gh+/5nB3nkqtzNF8eNS/
 hSnQ==
X-Gm-Message-State: APjAAAUXHh4kqKlPnlzesKl36Iz+YYQFRKBt5l0/yTsqQC1nUvul7u3N
 Lv2OjriLr+AczkHa1wjcclqoZhuOEOAw+t4r/I2p/6XhTQt73oQN2dltYY3wV36OQQ2e6KDJzCw
 2D9EwCtrxaGbgcQmioWqF7DY+eSht
X-Received: by 2002:ac8:2d09:: with SMTP id n9mr962420qta.10.1569451952519;
 Wed, 25 Sep 2019 15:52:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxB1Dsw/WUHR21s6STItPGz0BB1GTN3tc/6O3a3fn9/h9M+DbYPukuLjhN7Ej21wrP8nkb8YQ==
X-Received: by 2002:ac8:2d09:: with SMTP id n9mr962409qta.10.1569451952296;
 Wed, 25 Sep 2019 15:52:32 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id u43sm251436qte.19.2019.09.25.15.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 15:52:31 -0700 (PDT)
Message-ID: <747cb6aa8440c5af079befa818e8520d8215fb31.camel@redhat.com>
Subject: Re: [PATCH] drm: Destroy the correct mutex name in
 drm_dp_mst_topology_mgr_destroy
From: Lyude Paul <lyude@redhat.com>
To: Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
Date: Wed, 25 Sep 2019 18:52:30 -0400
In-Reply-To: <20190925224617.24027-1-matthew.d.roper@intel.com>
References: <20190925224617.24027-1-matthew.d.roper@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: ztf8Xkn3OQy8KqvfGOCJ-g-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1569451955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tmh7VHwG0Qgyf8PPlTH4hNO35pCH2MC2du1uu2+gnvI=;
 b=JU8rbC/8ziijMXu0kqWG8frmB9XXdwgxqlpbWA2VuUSiUM8bE59gzSCfDRItsVFH2TbrmR
 EMRCcQ9dEVgTS66g/tGvatWUnMdvXUdz4ekRgstsk2hOkUwuNNj/haPYF5CW8umUXELIVq
 3gwR1Rps2yosbOKOIsXqXGdPtLPg16A=
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
Cc: Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VUdIIHRoaXMgaXMgZW50aXJlbHkgbXkgZmF1bHQsIHNvcnJ5IGFib3V0IHRoYXQuIFRoaXMgcmVm
ZXJlbmNlIGdvdCBsZWZ0IGluCndoZW4gSSBjaGVycnktcGlja2VkIHRoaXMgcGF0Y2ggZnJvbSBh
IGRpZmZlcmVudCBzZXJpZXMuCgpSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0
LmNvbT4KCkZlZWwgZnJlZSB0byBwdXNoIHJpZ2h0IGF3YXkKCk9uIFdlZCwgMjAxOS0wOS0yNSBh
dCAxNTo0NiAtMDcwMCwgTWF0dCBSb3BlciB3cm90ZToKPiBJdCBsb29rcyBsaWtlIG9uZSBvZiB0
aGUgdG9wb2xvZ3kgbWFuYWdlciBtdXRleGVzIG1heSBoYXZlIGJlZW4gcmVuYW1lZAo+IGR1cmlu
ZyBhIHJlYmFzZSwgYnV0IHRoZSBkZXN0cnVjdGlvbiBmdW5jdGlvbiB3YXNuJ3QgdXBkYXRlZCB3
aXRoIHRoZQo+IG5ldyBuYW1lOgo+IAo+ICAgIGVycm9yOiDigJhzdHJ1Y3QgZHJtX2RwX21zdF90
b3BvbG9neV9tZ3LigJkgaGFzIG5vIG1lbWJlciBuYW1lZAo+ICAgIOKAmGRlbGF5ZWRfZGVzdHJv
eV9sb2Nr4oCZCj4gCj4gRml4ZXM6IDUwMDk0YjVkY2QzMiAoImRybS9kcF9tc3Q6IERlc3Ryb3kg
dG9wb2xvZ3lfbWdyIG11dGV4ZXMiKQo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
Pgo+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0
IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYwo+IGluZGV4IDAxZDk3YzZjYmJiMi4uYzg4MDRjYTYyNjRjIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gQEAgLTQzMDEsNyArNDMwMSw3IEBAIHZvaWQg
ZHJtX2RwX21zdF90b3BvbG9neV9tZ3JfZGVzdHJveShzdHJ1Y3QKPiBkcm1fZHBfbXN0X3RvcG9s
b2d5X21nciAqbWdyKQo+ICAJZHJtX2F0b21pY19wcml2YXRlX29ial9maW5pKCZtZ3ItPmJhc2Up
Owo+ICAJbWdyLT5mdW5jcyA9IE5VTEw7Cj4gIAo+IC0JbXV0ZXhfZGVzdHJveSgmbWdyLT5kZWxh
eWVkX2Rlc3Ryb3lfbG9jayk7Cj4gKwltdXRleF9kZXN0cm95KCZtZ3ItPmRlc3Ryb3lfY29ubmVj
dG9yX2xvY2spOwo+ICAJbXV0ZXhfZGVzdHJveSgmbWdyLT5wYXlsb2FkX2xvY2spOwo+ICAJbXV0
ZXhfZGVzdHJveSgmbWdyLT5xbG9jayk7Cj4gIAltdXRleF9kZXN0cm95KCZtZ3ItPmxvY2spOwot
LSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
