Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D07A96D6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 01:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B4E89CB8;
	Wed,  4 Sep 2019 23:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DB189CB8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 23:10:42 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id p12so347818iog.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 16:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DB1rbzm8PF8Bwfs8Jp/tKsNhJPofsXR23GDzMzgP/Zo=;
 b=irqlwVzPoHzD5CzzYbDmnYJWPvg2sc1wnFMfn+PF6xKawpK12IqKV8LkcutYIPV2Z8
 4PkQIc62YV+z65uNzOv70xav/eu5iHn0a/zD1ACcIx169OogeC6T4QxKh+vRCH9Z9zAg
 ubTt6vu8ijBPn+KTH0EdniTePgobVTXwGCo4BTAbRz3aANaN3yamF4afbo76uAtQp7ZF
 arH6E6TM9SCchfAqih/d+0lyNpaapjBvRkYfyBNOtwks+otZn9XFS74aX1YYFJlngRNa
 gR+TJTVtEOolOqQhyY/rLIw7uGgbu2kRfOURcbV9W7zKVV/8Xl7vs1nJFUB3jD/Pbeif
 bpUw==
X-Gm-Message-State: APjAAAUScLeTReC3TEccTAQrDxTR1qTS00KEy9il6HL4e/QxUAiwtYsp
 5KX+BLX5TMsYu4G8edxsOMNrfwrwjM2bxa4NcRo=
X-Google-Smtp-Source: APXvYqy0jYg/Z8XA/MeoEAwnqZjsjs0eFej+KYg1PPMJWO6JB9B1AVaOVDMkjRWEP7D3sv6xexnbd1n0FFsKarY4fh4=
X-Received: by 2002:a6b:db0e:: with SMTP id t14mr546846ioc.93.1567638641383;
 Wed, 04 Sep 2019 16:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190904074828.32502-1-kraxel@redhat.com>
In-Reply-To: <20190904074828.32502-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 4 Sep 2019 16:10:30 -0700
Message-ID: <CAPaKu7RWiEr5n_DWcg0H2PPnRs9CUn-ZgQV3NYe8VrdZgEAhTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: fix command submission with objects but
 without fence.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DB1rbzm8PF8Bwfs8Jp/tKsNhJPofsXR23GDzMzgP/Zo=;
 b=TWXBSs+rssh2KOR8Br4xQVWj2yPdts1caiQ8YeGZCkLygQUi3QXTp7bXtG8avLPfoY
 FU0qWwBUSFqJQ11YlGcYAyCc1LuOHBkMXnenhqK6bcrkpT40+xQVdSKLzHma7+CFHsNH
 DZE2H4wNyGmxrNjxgvrV/PEFzx79oncEEh/D3bItyY1amR4GCh4qqWlRADRT5zCrS1xz
 v9RL7oWNP1ZGT3CoxK7EoA/Xh83edIeMEIwa2Q5LX2O+a5xbwE8I0aEm9ioQHvqkHV6F
 cx90+SxExNmT98lEpdrmmEC1UE3oSt/btorqGtDplYJGoFnrKoF6bjyDNR9WrI8DSxLl
 l/fA==
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

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCAxMjo0OCBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBPbmx5IGNhbGwgdmlydGlvX2dwdV9hcnJheV9hZGRfZmVuY2Ug
aWYgd2UgYWN0dWFsbHkgaGF2ZSBhIGZlbmNlLgo+Cj4gRml4ZXM6IGRhNzU4ZDUxOTY4YSAoImRy
bS92aXJ0aW86IHJld29yayB2aXJ0aW9fZ3B1X2V4ZWNidWZmZXJfaW9jdGwgZmVuY2luZyIpCj4g
U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jIHwgOSArKysrKy0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV92cS5jCj4gaW5kZXggNTk1ZmE2ZWMyZDU4Li43ZmQyODUxZjdiOTcg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYwo+IEBAIC0zMzksMTEgKzMzOSwx
MiBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X3F1ZXVlX2ZlbmNlZF9jdHJsX2J1ZmZlcihzdHJ1
Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAo+ICAgICAgICAgICAgICAgICBnb3RvIGFnYWlu
Owo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBpZiAoZmVuY2UpCj4gKyAgICAgICBpZiAoZmVuY2Up
IHsKPiAgICAgICAgICAgICAgICAgdmlydGlvX2dwdV9mZW5jZV9lbWl0KHZnZGV2LCBoZHIsIGZl
bmNlKTsKPiAtICAgICAgIGlmICh2YnVmLT5vYmpzKSB7Cj4gLSAgICAgICAgICAgICAgIHZpcnRp
b19ncHVfYXJyYXlfYWRkX2ZlbmNlKHZidWYtPm9ianMsICZmZW5jZS0+Zik7Cj4gLSAgICAgICAg
ICAgICAgIHZpcnRpb19ncHVfYXJyYXlfdW5sb2NrX3Jlc3YodmJ1Zi0+b2Jqcyk7Cj4gKyAgICAg
ICAgICAgICAgIGlmICh2YnVmLT5vYmpzKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgdmly
dGlvX2dwdV9hcnJheV9hZGRfZmVuY2UodmJ1Zi0+b2JqcywgJmZlbmNlLT5mKTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICB2aXJ0aW9fZ3B1X2FycmF5X3VubG9ja19yZXN2KHZidWYtPm9ianMp
Owo+ICsgICAgICAgICAgICAgICB9ClRoaXMgbGVha3Mgd2hlbiBmZW5jZSA9PSBOVUxMIGFuZCB2
YnVmLT5vYmpzICE9IE5VTEwgKHdoaWNoIGNhbiByZWFsbHkKaGFwcGVuIElJUkMuLi4gbm90IGF0
IG15IGRlc2sgdG8gY2hlY2spLgoKCj4gICAgICAgICB9Cj4gICAgICAgICBub3RpZnkgPSB2aXJ0
aW9fZ3B1X3F1ZXVlX2N0cmxfYnVmZmVyX2xvY2tlZCh2Z2RldiwgdmJ1Zik7Cj4gICAgICAgICBz
cGluX3VubG9jaygmdmdkZXYtPmN0cmxxLnFsb2NrKTsKPiAtLQo+IDIuMTguMQo+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
