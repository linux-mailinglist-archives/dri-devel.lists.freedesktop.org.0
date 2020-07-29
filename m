Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E780232C6A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 09:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DFF6E88F;
	Thu, 30 Jul 2020 07:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CD06E466
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 07:38:57 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id c10so87650pjn.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 00:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hf50u6h9wnLFy96WAeaaud4OkMwukdvpfoIh17caQSk=;
 b=qvu8pBA35juXB5IAuj3EOdEUiIafCwux4Zh/tDRiwecjZ4h5ljtUkch7bU9dNi7BEn
 zDV1HWeXxyCHZ+z2tecTWyTytdwhCEd+DESLLScaS3yfoPMOqFliEXQd8TV0hQYlTJtq
 KbivU5pLK8l1ZRq1qGCXjh0QZyOLgi3XhExE07HdtbzYUitJ5N17urMNFvkQLT+boa/3
 k5+plqHvx2y0rTUOJgJEmfCPNHFoKVZvQWvR3/xJ9pYJ0/Me2W8JrPQtu6RHmwTL08Tz
 Ykq8YBWIbvNFayGGaRBCwOFl+137kCp0rtNEZYG3EIZvf5Dg0Ef7VahEMkXnpQf7V2e9
 0Nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hf50u6h9wnLFy96WAeaaud4OkMwukdvpfoIh17caQSk=;
 b=RS3YBLf2P0SS+9Ra0hXEYpTNTsjg9r/oZ7DHAnANY831K28EprLbUon+h4G/B6unb3
 nW+XVCCB4vcYVxO1CBcFdZo2cdSqN8HJCWxwGCWjeP/iTbUYXzol92QvVrS1nnzou9LK
 F9weHleCATcAI0m0S3o6JMO2KRWbNbeiBeZB9aXcbf/4T/af4Y32S6NK17GcDDep1vqe
 JoyIoGGa9NN7B0rda7fTamtd8OeK28XNCBrcs9CBrDgZZ82qymOjZqc7nSg0JGHYqmiu
 GNnKJpxHD27CScITiJn7sIhfNO0q4t8XDKjR61mBUpxHPtJ5P8oA9V6nAmwxuOkNvxu/
 RwnQ==
X-Gm-Message-State: AOAM533JGXxYTFSHCQOQo/ddGt3WWOku7kVvUhJWl8wlONZNn+/lt+Fx
 Q9FU0dNJcRcLy6DdVYExX2Th8pZXW4D1l6FbtGTdlw==
X-Google-Smtp-Source: ABdhPJz3p/RdzMtYa5b161gOYMyR9V5zWuKnydulgpgc6pQ29hu00H5qrHoahniLRmzse010xwGrjzFF810Pxzvlfuk=
X-Received: by 2002:a17:90a:fa8c:: with SMTP id
 cu12mr8694751pjb.229.1596008336834; 
 Wed, 29 Jul 2020 00:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200721101647.42653-1-hexin.op@bytedance.com>
In-Reply-To: <20200721101647.42653-1-hexin.op@bytedance.com>
From: Muchun Song <songmuchun@bytedance.com>
Date: Wed, 29 Jul 2020 15:38:21 +0800
Message-ID: <CAMZfGtW512Hi_T=PhXdSfs1n54q6HndVx=stCC6By4OnB39Z=g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/virtio: fix missing dma_fence_put() in
 virtio_gpu_execbuffer_ioctl()
To: Xin He <hexin.op@bytedance.com>, daniel@ffwll.ch, airlied@linux.ie, 
 kraxel@redhat.com, sumit.semwal@linaro.org, 
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux-foundation.org
X-Mailman-Approved-At: Thu, 30 Jul 2020 07:16:49 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, Qi Liu <liuqi.16@bytedance.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjEsIDIwMjAgYXQgNjoxNyBQTSBYaW4gSGUgPGhleGluLm9wQGJ5dGVkYW5j
ZS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogUWkgTGl1IDxsaXVxaS4xNkBieXRlZGFuY2UuY29tPgo+
Cj4gV2Ugc2hvdWxkIHB1dCB0aGUgcmVmZXJlbmNlIGNvdW50IG9mIHRoZSBmZW5jZSBhZnRlciBj
YWxsaW5nCj4gdmlydGlvX2dwdV9jbWRfc3VibWl0KCkuIFNvIGFkZCB0aGUgbWlzc2luZyBkbWFf
ZmVuY2VfcHV0KCkuCj4KPiBGaXhlczogMmNkN2I2ZjA4YmM0ICgiZHJtL3ZpcnRpbzogYWRkIGlu
L291dCBmZW5jZSBzdXBwb3J0IGZvciBleHBsaWNpdCBzeW5jaHJvbml6YXRpb24iKQo+IENvLWRl
dmVsb3BlZC1ieTogWGluIEhlIDxoZXhpbi5vcEBieXRlZGFuY2UuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFhpbiBIZSA8aGV4aW4ub3BAYnl0ZWRhbmNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBRaSBM
aXUgPGxpdXFpLjE2QGJ5dGVkYW5jZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IE11Y2h1biBTb25nIDxz
b25nbXVjaHVuQGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4KPiBjaGFuZ2Vsb2cgaW4gdjM6Cj4gMSkg
Q2hhbmdlIHRoZSBzdWJqZWN0IGZyb20gImRybS92aXJ0aW86IGZpeGVkIG1lbW9yeSBsZWFrIGlu
IHZpcnRpb19ncHVfZXhlY2J1ZmZlcl9pb2N0bCgpIiB0bwo+ICAgICJkcm0vdmlydGlvOiBmaXgg
bWlzc2luZyBkbWFfZmVuY2VfcHV0KCkgaW4gdmlydGlvX2dwdV9leGVjYnVmZmVyX2lvY3RsKCki
Cj4gMikgUmV3b3JrIHRoZSBjb21taXQgbG9nCj4KPiBjaGFuZ2Vsb2cgaW4gdjI6Cj4gMSkgQWRk
IGEgY2hhbmdlIGRlc2NyaXB0aW9uCj4KPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X2lvY3RsLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYwo+IGluZGV4IDVkZjcyMjA3MmJhMC4uMTlj
NWJjMDFlYjc5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9p
b2N0bC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKPiBA
QCAtMTc5LDYgKzE3OSw3IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9leGVjYnVmZmVyX2lvY3Rs
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4KPiAgICAgICAgIHZpcnRpb19n
cHVfY21kX3N1Ym1pdCh2Z2RldiwgYnVmLCBleGJ1Zi0+c2l6ZSwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2ZnByaXYtPmN0eF9pZCwgYnVmbGlzdCwgb3V0X2ZlbmNlKTsKPiArICAg
ICAgIGRtYV9mZW5jZV9wdXQoJm91dF9mZW5jZS0+Zik7Cj4gICAgICAgICB2aXJ0aW9fZ3B1X25v
dGlmeSh2Z2Rldik7Cj4gICAgICAgICByZXR1cm4gMDsKPgo+IC0tCj4gMi4yMS4xIChBcHBsZSBH
aXQtMTIyLjMpCj4KClBpbmcgZ3V5cy4gQW55IGNvbW1lbnRzIG9yIHN1Z2dlc3Rpb25z77yfCgot
LSAKWW91cnMsCk11Y2h1bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
