Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3980EAA9C9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 19:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CDC6E048;
	Thu,  5 Sep 2019 17:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE206E048
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 17:14:32 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id r4so6522642iop.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 10:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TTCctpkX00mowbNYgM0kIWU2mkTavgxoTs3XunObL/I=;
 b=AoNhh/Zgh44qm9gG4xiwfhLrM4WlSZvdibTwUUpBWBnC5Hq0HJY+oB0SUFJLBZHfKm
 LruVp/hb1+IbYszVJlG1HLRYc0ldfRQ6JnS5C0tPudmzBaXSJ4NjZDWjjJmC2DrwbFDl
 UNgkmwvAJpwcv4mD8udQkbcegaJ5fvkeP9qScxnTjxoHZ5tSDAEoQM0a0uSlNjZoAWDv
 9LJzVc7USKukzKGEf4NE5oZEdocx9CdoFNILSlLtBEYfVHsJrqwViAbm6Y2Y4OdJvl4c
 kVkD1jo1yUpnbVhg5RriXLSzXbT2WJp3+fX41vhZM6OrWZ84HBOp0uFmyzZGL3HZfe0p
 mmcg==
X-Gm-Message-State: APjAAAV8Ua5lzKxjBrkjDpZkrnaXsMw09CwjuKgv0YG2PRM0Szydayum
 qBXwlTPirHMeOrs4LdUhIAoAopeDhsIkBuosrmQ=
X-Google-Smtp-Source: APXvYqyFRrcEUYAzNKAMqPVORab2OGeAkhhkQx1fB9YTAhkq6c0qW9HmWRMVc4oWCScMVD4hVjvX8XxINlOEm6TsfVc=
X-Received: by 2002:a6b:e903:: with SMTP id u3mr5289382iof.241.1567703671793; 
 Thu, 05 Sep 2019 10:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190904074828.32502-1-kraxel@redhat.com>
 <CAPaKu7RWiEr5n_DWcg0H2PPnRs9CUn-ZgQV3NYe8VrdZgEAhTQ@mail.gmail.com>
 <20190905052340.gfwmzkqwcpxtvzvu@sirius.home.kraxel.org>
In-Reply-To: <20190905052340.gfwmzkqwcpxtvzvu@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 5 Sep 2019 10:14:20 -0700
Message-ID: <CAPaKu7RCwP05buzpL-MVYYUOzmWaQqNWjom7RK-2fL8hB2w45Q@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: fix command submission with objects but
 without fence.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TTCctpkX00mowbNYgM0kIWU2mkTavgxoTs3XunObL/I=;
 b=pMRdQRIl9vuOA+nHETjwUCF9udSp5PW7cTCK4Jh+bPhGYJNF0N3bjjDk7LCt4Uwplm
 iy2tuWxdiYyRLTvt6r4GgT+p9RJMOnyKA+umCVnfV2wiSfDkQlKt/OSAc4Va1sy2/Qqz
 TbDiflxrsy/pVLoa5JUtgrCaOQ5PYAiwrTnu7+WQrZbvVtJuyHmeyJFPjf7E0jyPahOM
 ohpQ5Xqm2Ir1EF+98Iq5lnJBcOE146CeJz4xe6yylI16QWb/Aopse67u3uh3HEqrZuQJ
 IlwiJZNxoKbrn7dGm7qE6sYZrY6deHg0OaeBBJcjs2/p9Q3v8nplXkocXnLvQkGnGeq7
 BOcg==
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

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCAxMDoyMyBQTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAwNCwgMjAxOSBhdCAwNDoxMDozMFBNIC0w
NzAwLCBDaGlhLUkgV3Ugd3JvdGU6Cj4gPiBPbiBXZWQsIFNlcCA0LCAyMDE5IGF0IDEyOjQ4IEFN
IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT25s
eSBjYWxsIHZpcnRpb19ncHVfYXJyYXlfYWRkX2ZlbmNlIGlmIHdlIGFjdHVhbGx5IGhhdmUgYSBm
ZW5jZS4KPiA+ID4KPiA+ID4gRml4ZXM6IGRhNzU4ZDUxOTY4YSAoImRybS92aXJ0aW86IHJld29y
ayB2aXJ0aW9fZ3B1X2V4ZWNidWZmZXJfaW9jdGwgZmVuY2luZyIpCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jIHwgOSArKysrKy0tLS0KPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYyBiL2RyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jCj4gPiA+IGluZGV4IDU5NWZhNmVjMmQ1OC4u
N2ZkMjg1MWY3Yjk3IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfdnEuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEu
Ywo+ID4gPiBAQCAtMzM5LDExICszMzksMTIgQEAgc3RhdGljIHZvaWQgdmlydGlvX2dwdV9xdWV1
ZV9mZW5jZWRfY3RybF9idWZmZXIoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKPiA+
ID4gICAgICAgICAgICAgICAgIGdvdG8gYWdhaW47Cj4gPiA+ICAgICAgICAgfQo+ID4gPgo+ID4g
PiAtICAgICAgIGlmIChmZW5jZSkKPiA+ID4gKyAgICAgICBpZiAoZmVuY2UpIHsKPiA+ID4gICAg
ICAgICAgICAgICAgIHZpcnRpb19ncHVfZmVuY2VfZW1pdCh2Z2RldiwgaGRyLCBmZW5jZSk7Cj4g
PiA+IC0gICAgICAgaWYgKHZidWYtPm9ianMpIHsKPiA+ID4gLSAgICAgICAgICAgICAgIHZpcnRp
b19ncHVfYXJyYXlfYWRkX2ZlbmNlKHZidWYtPm9ianMsICZmZW5jZS0+Zik7Cj4gPiA+IC0gICAg
ICAgICAgICAgICB2aXJ0aW9fZ3B1X2FycmF5X3VubG9ja19yZXN2KHZidWYtPm9ianMpOwo+ID4g
PiArICAgICAgICAgICAgICAgaWYgKHZidWYtPm9ianMpIHsKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgdmlydGlvX2dwdV9hcnJheV9hZGRfZmVuY2UodmJ1Zi0+b2JqcywgJmZlbmNlLT5m
KTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdmlydGlvX2dwdV9hcnJheV91bmxvY2tf
cmVzdih2YnVmLT5vYmpzKTsKPiA+ID4gKyAgICAgICAgICAgICAgIH0KPiA+IFRoaXMgbGVha3Mg
d2hlbiBmZW5jZSA9PSBOVUxMIGFuZCB2YnVmLT5vYmpzICE9IE5VTEwgKHdoaWNoIGNhbiByZWFs
bHkKPiA+IGhhcHBlbiBJSVJDLi4uIG5vdCBhdCBteSBkZXNrIHRvIGNoZWNrKS4KPgo+IFllcywg
aXQgY2FuIGhhcHBlbiwgZm9yIGV4YW1wbGUgd2hlbiBmbHVzaGluZyBkdW1iIGJ1ZmZlcnMuCj4K
PiBCdXQgSSBkb24ndCB0aGluayB3ZSBsZWFrIGluIHRoaXMgY2FzZS4gIFRoZSBjb2RlIHBhdGhz
IHdoaWNoIGRvbid0IG5lZWQKPiBhIGZlbmNlIGFsc28gZG8gbm90IGNhbGwgdmlydGlvX2dwdV9h
cnJheV9sb2NrX3Jlc3YoKSwgc28gdGhpbmdzIGFyZQo+IGJhbGFuY2VkLiAgVGhlIGFjdHVhbCBy
ZWxlYXNlIG9mIHRoZSBvYmpzIGhhcHBlbnMgaW4KPiB2aXJ0aW9fZ3B1X2RlcXVldWVfY3RybF9m
dW5jKCkgdmlhIHZpcnRpb19ncHVfYXJyYXlfcHV0X2ZyZWVfZGVsYXllZCgpLgpJIG1pc3JlYWQg
YW5kIHRob3VnaHQgdGhpcyB3YXMgaW4gdmlydGlvX2dwdV9kZXF1ZXVlX2N0cmxfZnVuYy4gIFNv
cnJ5IDooCgpSZXZpZXdlZC1ieTogQ2hpYS1JIFd1IDxvbHZhZmZlQGdtYWlsLmNvbT4KCgoKPgo+
IGNoZWVycywKPiAgIEdlcmQKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
