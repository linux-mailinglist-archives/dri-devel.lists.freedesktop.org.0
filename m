Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DB55B156
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CE889DC5;
	Sun, 30 Jun 2019 18:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37A889DC5
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 18:42:36 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id e5so23679106iok.4
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 11:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QDSijjS1xXueLHNMMqTIhyO9jX2UJsvp3nUT87AqiGI=;
 b=BN5RqfEdf/ss9VSmzEYmV+q6s/OcuWhUoV0eBLbg3WHNuKk1HLwZpVNjQ0c/5Az+2R
 7xq3kqrUIeOGgtoPh3FYfTu4eLKaH88+IzpQBWoYJIfiLM5jrweFoCzcPjDgxG/eFMK0
 Ba98O4a35i9AeSiyNawIFkmoGyxRG96ucdZQFWFTN21M0b+FJwQ1dCh+FZ5c4AANuhJv
 6BMq7X6gDOYi00UOd4KiW/mc5Vmvz9YMYyVfK6Qs9weP+LiWzwZg4vpLsVDkGqTOI00z
 egg7FAh4WGxWxuDUik/BiEFQiPC5dOHTG1eLma7JYI/nlPweBuFu3l7MX7asHJwQEo4/
 Q/Aw==
X-Gm-Message-State: APjAAAXn7X1t3hmKl3WzomFXEm2PY2/fc+MCo7e2BQuOB+d43yhBXmbf
 xFzBc9lWc67fEpqYlD2Hv4t1ZxxtvY+CzEHb7i8=
X-Google-Smtp-Source: APXvYqzT+F08H19tgi6gFVBhegfk1wEZEmFvDGusVakOA4QAtP5eqstzg7IKQKCsgYDvO760yw11fqmH1p4BEZO8acw=
X-Received: by 2002:a5d:948f:: with SMTP id v15mr13272701ioj.93.1561920155877; 
 Sun, 30 Jun 2019 11:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190620060726.926-1-kraxel@redhat.com>
 <20190620060726.926-12-kraxel@redhat.com>
 <CAPaKu7QXCMMKR50Oiv=CefUA4S+S3KgpJ2FKTd1WA1H2_ORqXg@mail.gmail.com>
 <20190628104907.vign7lmgftrwfisv@sirius.home.kraxel.org>
In-Reply-To: <20190628104907.vign7lmgftrwfisv@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sun, 30 Jun 2019 11:42:25 -0700
Message-ID: <CAPaKu7Skvc6UW+amOz4F8AAW95kXQzMhEJn-v=7kdGqu1dbtxA@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] drm/virtio: switch from ttm to gem shmem helpers
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QDSijjS1xXueLHNMMqTIhyO9jX2UJsvp3nUT87AqiGI=;
 b=Emhed+tl7EdEvirZ/81+czghnaAYl79gEfihBwTiJ97+LKwiG68+VS+CHihBWaEOQV
 zwwiuyIkcDRa3FgNnZKTDxe8BL2qflZc2MbNjhc6vQTUvLQlbAg7l6G+d98WxHi67oku
 CgSpPUfNxpAkz7iYWZ+R9dwslRE4Ly0uUTpWF4RoXt9nwklOA9OKSMbeE6n4RTaIh+5D
 vNx6PJInFmhrIiLqZnehfguHPOB02XFHM8OtdfdSFOYXYtqz96BY7NRq7yr+92b+ZQoO
 aQunq3wV+kRdpmRaQjqlZaUViaHUttS94Al/radLkStdbTl22SlZnqcxXeBc7WbEMkEG
 J9kQ==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMzo0OSBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiA+ID4gIHN0YXRpYyBpbmxpbmUgc3RydWN0IHZpcnRpb19ncHVf
b2JqZWN0Kgo+ID4gPiAgdmlydGlvX2dwdV9vYmplY3RfcmVmKHN0cnVjdCB2aXJ0aW9fZ3B1X29i
amVjdCAqYm8pCj4KPiA+IFRoZSBsYXN0IHVzZXJzIG9mIHRoZXNlIHR3byBoZWxwZXJzIGFyZSBy
ZW1vdmVkIHdpdGggdGhpcyBwYXRjaC4gIFdlCj4gPiBjYW4gcmVtb3ZlIHRoZW0uCj4KPiBwYXRj
aCAxMi8xMiBkb2VzIHRoYXQuCkkgbWVhbnQgdmlydGlvX2dwdV9vYmplY3RfcmVmL3VucmVmLCB3
aGljaCBhcmUgc3RpbGwgYXJvdW5kIGFmdGVyIHBhdGNoIDEyLgo+Cj4gPiA+ICsgICAgICAgYm8g
PSBnZW1fdG9fdmlydGlvX2dwdV9vYmooJnNobWVtX29iai0+YmFzZSk7Cj4gPiA+ICsgICAgICAg
Ym8tPmJhc2UuYmFzZS5mdW5jcyA9ICZ2aXJ0aW9fZ3B1X2dlbV9mdW5jczsKPiA+IE1vdmUgdGhp
cyB0byB2aXJ0aW9fZ3B1X2NyZWF0ZV9vYmplY3QuCj4KPiBGaXhlZC4KPgo+ID4gPiArICAgICAg
IHJldCA9IGRybV9nZW1fc2htZW1fcGluKCZvYmotPmJhc2UuYmFzZSk7Cj4gPiBUaGUgYm8gaXMg
YXR0YWNoZWQgZm9yIGl0cyBlbnRpcmUgbGlmZXRpbWUsIGF0IGxlYXN0IGN1cnJlbnRseS4gIE1h
eWJlCj4gPiB3ZSBjYW4gdXNlIGRybV9nZW1fc2htZW1fZ2V0X3BhZ2VzX3NndCAoYW5kIGdldCBy
aWQgb2Ygb2JqLT5wYWdlcykuCj4KPiBBbHJlYWR5IGNoZWNrZWQgdGhpcy4KPiBXZSBjYW4ndCBk
dWUgdG8gdGhlIGlvbW11IHF1aXJrcy4KPgo+IGNoZWVycywKPiAgIEdlcmQKPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
