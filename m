Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 323C2A0C39
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 23:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DE289EB8;
	Wed, 28 Aug 2019 21:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE8A89EB8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 21:13:56 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id n197so513772iod.9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 14:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n0DnwMkmLDWIJwSrLn8Xo+nBrgU3ut606yiaW7tsLmw=;
 b=SFvkJpfrYDDBNFAut75v1vNIudsthDIpumBQTGEe486t+tIU4kBOrvU+8hLn4HbIUQ
 tvzRhX8yHUDRIy7pGU+ElPFDgugs/VUHr1qmwy2c7oNC7rjNqCezvB+ZKzBCXt0GPntG
 A/1WHwahDmb46U2ibWlkV6coY7YCkOWreUiEOa3/YDVS7+BMdBy6AarSMAwI2JwXUE+9
 Ws25yiTnxDj6yLKgq29XxxhIsNbKEXlf4WvIFsAu1Yw7WI7R3USoDNXfzTGp41bdCQdn
 DheEkfIAEWXErh+OtzHLaN9aYi31ExpojskpYnM7BemTinES6jzyOBavGsD+k918sUlt
 0vJg==
X-Gm-Message-State: APjAAAXjESg5V48TIdgU8QhHEJ0GH7Pqu4n+9EPS0kUwr/tXrjIy1XnN
 TiJRuLo87ApNF47JI7PLoE1F5mrA39G3YIMxeiJVT+qI
X-Google-Smtp-Source: APXvYqzMB/toxRqCkJ9PWvyQnMavsuq5vQlvJoKHZy+zVMpOjz1ploNu5L7LA5sr0YhCp5g4o3nI4y7/qsa67W4ChIM=
X-Received: by 2002:a6b:6f06:: with SMTP id k6mr1919196ioc.232.1567026835236; 
 Wed, 28 Aug 2019 14:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190823095503.2261-1-kraxel@redhat.com>
 <20190823095503.2261-3-kraxel@redhat.com>
In-Reply-To: <20190823095503.2261-3-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 28 Aug 2019 14:13:44 -0700
Message-ID: <CAPaKu7Tbv+JgPLy4GLDU8qwx-X7mA0eFT-Sjxb4CaV5Zr4beXA@mail.gmail.com>
Subject: Re: [PATCH v8 02/18] drm/virtio: switch virtio_gpu_wait_ioctl() to
 gem helper.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=n0DnwMkmLDWIJwSrLn8Xo+nBrgU3ut606yiaW7tsLmw=;
 b=WIWG1PDkVbjjjFnFPpFLjjxtVTRsYeL9XpsAkGxaDEIeAhcAamyPp68HluklgS3rQP
 C/5rt0po7h3H6Gf7/im0mdsHGo5rDctWgkNhkR9SFFcQ2giiCAvnQpbxtThQwkTa2htt
 hneadVzJncluLhLJBw/BMR67x6jSeSdegdVE2VtCwK/A96Wy7RvcQ6zKIeW4w0MQjz+9
 V4TWU2h4v0uKER3nm8/QWp7fJL2RYZHn+WvCAvu+lohvWO3gIKITjl9Bc7jM6BAWZgiU
 XiXVu9u9PfxR+WU3CUEBQFMiZj6jvaeMqaxYXRE+Q7tKwepQ0RWM3k/Bg5iAWg/1eUIv
 ihWg==
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
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMjo1NSBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBVc2UgZHJtX2dlbV9yZXNlcnZhdGlvbl9vYmplY3Rfd2FpdCgp
IGluIHZpcnRpb19ncHVfd2FpdF9pb2N0bCgpLgo+IFRoaXMgYWxzbyBtYWtlcyB0aGUgaW9jdGwg
cnVuIGxvY2tsZXNzLgo+Cj4gdjU6IGhhbmRsZSBsb29rdXAgZmFpbHVyZS4KPiB2MjogdXNlIHJl
c2VydmF0aW9uX29iamVjdF90ZXN0X3NpZ25hbGVkX3JjdSBmb3IgVklSVEdQVV9XQUlUX05PV0FJ
VC4KPgo+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+
IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyB8IDI1ICsrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDE0
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9pb2N0bC5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKPiBp
bmRleCAwYTg4ZWYxMWI5ZDMuLjc0YjZiYWQwMWQ3ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV9pb2N0bC5jCj4gQEAgLTQ2NiwyMyArNDY2LDIwIEBAIHN0YXRpYyBpbnQgdmly
dGlvX2dwdV93YWl0X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKPiAgewo+
ICAgICAgICAgc3RydWN0IGRybV92aXJ0Z3B1XzNkX3dhaXQgKmFyZ3MgPSBkYXRhOwo+IC0gICAg
ICAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnb2JqID0gTlVMTDsKPiAtICAgICAgIHN0cnVjdCB2
aXJ0aW9fZ3B1X29iamVjdCAqcW9iaiA9IE5VTEw7Cj4gKyAgICAgICBzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iajsKPiArICAgICAgIGxvbmcgdGltZW91dCA9IDE1ICogSFo7Cj4gICAgICAgICBp
bnQgcmV0Owo+IC0gICAgICAgYm9vbCBub3dhaXQgPSBmYWxzZTsKPgo+IC0gICAgICAgZ29iaiA9
IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlLCBhcmdzLT5oYW5kbGUpOwo+IC0gICAgICAgaWYg
KGdvYmogPT0gTlVMTCkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gKyAgICAg
ICBpZiAoYXJncy0+ZmxhZ3MgJiBWSVJUR1BVX1dBSVRfTk9XQUlUKSB7Cj4gKyAgICAgICAgICAg
ICAgIG9iaiA9IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlLCBhcmdzLT5oYW5kbGUpOwo+ICsg
ICAgICAgICAgICAgICBpZiAob2JqID09IE5VTEwpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FTk9FTlQ7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IGRtYV9yZXN2X3Rlc3Rfc2ln
bmFsZWRfcmN1KG9iai0+cmVzdiwgdHJ1ZSk7Cj4gKyAgICAgICAgICAgICAgIGRybV9nZW1fb2Jq
ZWN0X3B1dF91bmxvY2tlZChvYmopOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0ID8gMCA6
IC1FQlVTWTsKPiArICAgICAgIH0KPgo+IC0gICAgICAgcW9iaiA9IGdlbV90b192aXJ0aW9fZ3B1
X29iaihnb2JqKTsKPiAtCj4gLSAgICAgICBpZiAoYXJncy0+ZmxhZ3MgJiBWSVJUR1BVX1dBSVRf
Tk9XQUlUKQo+IC0gICAgICAgICAgICAgICBub3dhaXQgPSB0cnVlOwo+IC0gICAgICAgcmV0ID0g
dmlydGlvX2dwdV9vYmplY3Rfd2FpdChxb2JqLCBub3dhaXQpOwo+IC0KPiAtICAgICAgIGRybV9n
ZW1fb2JqZWN0X3B1dF91bmxvY2tlZChnb2JqKTsKPiAtICAgICAgIHJldHVybiByZXQ7Cj4gKyAg
ICAgICByZXR1cm4gZHJtX2dlbV9kbWFfcmVzdl93YWl0KGZpbGUsIGFyZ3MtPmhhbmRsZSwgdHJ1
ZSwgdGltZW91dCk7ClRoaXMgY2hhbmdlcyB0aGUgcmV0dXJuIHZhbHVlIGZyb20gLUVCVVNZIHRv
IC1FVElNRSB3aGVuIHRoZSB3YWl0CnRpbWVzIG91dC4gIEkgdGhpbmsgd2UgY2FuIHVzZSBkbWFf
cmVzdl93YWl0X3RpbWVvdXRfcmN1IGRpcmVjdGx5CmhlcmUuCgoKCj4gIH0KPgo+ICBzdGF0aWMg
aW50IHZpcnRpb19ncHVfZ2V0X2NhcHNfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAt
LQo+IDIuMTguMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
