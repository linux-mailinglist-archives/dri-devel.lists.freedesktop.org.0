Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCA313042
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 16:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114CD6E7BD;
	Fri,  3 May 2019 14:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4889A6E7BD
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 14:32:20 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id z145so3726597vsc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 07:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KNj51lIjeQK8WApzmlspsNMjbZZ9Du1bvLr1kJOxehQ=;
 b=ja/rZeYlXLsUn6r6CkuZG3pL7IiYjfoGe7driloaLqAXhjL19Twwe8avgCGGy03vbD
 rBkABuuB5enFL/Jecmo5f4cRLfTgxkhbBZDk8HpTSoAAEAVPvPUpAFFd5g8bZIVOhz0u
 sqBnN/L9uc55leIob+E/1okc9SLfxq3ywrHL8wO1sZWkU6TxCnbdW41nKtVjy94mcA/x
 gHuQgWMuMU47pjLgxyPeaK6fE8dvTjntxDs7zvPBone6mE259ZOf3VqH0455zVDIBZpO
 p8YwGw1EuHtKQ/txRmEGmHt2IK/yfqwCjPfUYkwKFbWVtG9zhUHeQ+fPOCV34r/o/z6L
 r45w==
X-Gm-Message-State: APjAAAXDauQzmEfKeyE7kD7HTjysAUpCD3+2hM0UYBWBM6qZlQpjUHI5
 d+W/D8gDoBfT2Gv812rtDePy/N7DcT801x3tWWM=
X-Google-Smtp-Source: APXvYqzw9qDPwWTgnBFTbrauh1ncnY/N3/m+7k0df1treH5yjOfJEP3IGJ+eEQNnPD4sPR7q1lgdlttYchK+wPzdrWM=
X-Received: by 2002:a05:6102:206:: with SMTP id
 z6mr5879706vsp.186.1556893939374; 
 Fri, 03 May 2019 07:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190429221021.159784-1-olvaffe@gmail.com>
In-Reply-To: <20190429221021.159784-1-olvaffe@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 3 May 2019 15:31:32 +0100
Message-ID: <CACvgo522UzNkdv1vERKvH3O2T0JtpBejRTCdyhqPcTABdGcb4g@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: allocate fences with GFP_KERNEL
To: Chia-I Wu <olvaffe@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KNj51lIjeQK8WApzmlspsNMjbZZ9Du1bvLr1kJOxehQ=;
 b=qrlvxMWtvpZjeIAySvb6CvFr6Ci6o+ZDULhcEFVJPrH/YdcRDRGdB4PvvYvf1uK7MD
 ZHFK6MP94RwqTasup/wyoMraZk7hrcmnOcSngOGPIiOdrMovTPKkHB3jAXB20Vi4wNqe
 ZmFfPCN6wtxaupOWGJu8beFEgP1Q4Wv26vXS6xJDe+oqZcy6t2ISHXLSm8SMvHkYYdeK
 WWn6aMnTea1QVgFEIhRCq1w1oqPQS6uM7GvHhd5u+wue2Wk/Hf+b5QZrSBzh1FHMJ0W/
 lVBz/YbcmWoPnY5oSBWZCA4jsLNclWwcl6zBhHyeFib7OzsEliHAZLO7XAhF8HFxCq+B
 EYvw==
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
Cc: Robert Foss <robert.foss@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyOSBBcHIgMjAxOSBhdCAyMzoxMCwgQ2hpYS1JIFd1IDxvbHZhZmZlQGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiBJdCB3YXMgY2hhbmdlZCB0byBHRlBfQVRPTUlDIGluIGNvbW1pdCBlYzJm
MDU3N2MgKGFkZCAmIHVzZQo+IHZpcnRpb19ncHVfcXVldWVfZmVuY2VkX2N0cmxfYnVmZmVyKSBi
ZWNhdXNlIHRoZSBhbGxvY2F0aW9uIGhhcHBlbmVkCj4gd2l0aCBhIHNwaW5sb2NrIGhlbGQuICBU
aGF0IHdhcyBubyBsb25nZXIgdHJ1ZSBhZnRlciBjb21taXQKPiA5ZmRkOTBjMGYgKGFkZCB2aXJ0
aW9fZ3B1X2FsbG9jX2ZlbmNlKCkpLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hpYS1JIFd1IDxvbHZh
ZmZlQGdtYWlsLmNvbT4KPiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4g
Q2M6IEd1c3Rhdm8gUGFkb3ZhbiA8Z3VzdGF2by5wYWRvdmFuQGNvbGxhYm9yYS5jb20+Cj4gQ2M6
IFJvYmVydCBGb3NzIDxyb2JlcnQuZm9zc0Bjb2xsYWJvcmEuY29tPgoKUmV2aWV3ZWQtYnk6IEVt
aWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CgpTaWRlOgpSb2IsIHNob3Vs
ZCB3ZSBmb2xsb3ctdXAgb24gOWZkZDkwYzBmIGFuZCBkcm9wIHRoZQp2aXJ0aW9fZ3B1X2ZlbmNl
X2VtaXQoKSByZXR1cm4gdHlwZT8KCkhUSAotRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
