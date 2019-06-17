Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF6148510
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1976B89256;
	Mon, 17 Jun 2019 14:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC0F89256
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:15:24 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id d4so16367420edr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 07:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=AYvx+hKlTuvWdDRT83rsHG30d0GVUlP5mRSGQAA1z4U=;
 b=hCo3Paz4acq4S3pZz5YhGfn3sbzqDjcdl724WbVMvUNGmmDzLmRa+LnVn+OD2ztdGK
 VMjwdq8mNHDRrVU9CHpgN5r7LJmx8LQgZ2VbeNNfpZ29g0iwIZvKJcaexZdYDmUNd4HP
 GHKGLrtRyJn5Bb8P/VzEgOKjmKOEoaTnoGfz1Ai8y2BZK9ta0iLcsx4aKT0NNDOctCN8
 L3+M4Mq3+tu1FTRDZoZB2HIwk7kGzBy6WqVZklHsYpNWWQ4LBWNNw9C+sc0Oiq2dJiZ/
 mucz+IU2gvT+YKElV0HktuOI2omKblEQaWNBLaHIi4bwlWmjEUgiEDYSBAeOljqKeT2U
 TDCQ==
X-Gm-Message-State: APjAAAULuuH0XkK0rTbn7z2wTDLGNVkZxIcBfHn75td4xhjbnNyH9F2S
 w5/QxCAFnnzzif0JeGRtGMHmLb6L37A=
X-Google-Smtp-Source: APXvYqwaIDiXPlRgUHNg3kWDu2WCWsswz9JWV+a6jzhjA5v+QP6d6ZCANJoULcIqQzttt4TspRFMiQ==
X-Received: by 2002:a17:906:4356:: with SMTP id
 z22mr98657350ejm.56.1560780922674; 
 Mon, 17 Jun 2019 07:15:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id u15sm3735567edi.10.2019.06.17.07.15.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 07:15:19 -0700 (PDT)
Date: Mon, 17 Jun 2019 16:15:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/4] drm/virtio: switch virtio_gpu_wait_ioctl() to gem
 helper.
Message-ID: <20190617141516.GF12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20190617111406.14765-1-kraxel@redhat.com>
 <20190617111406.14765-3-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617111406.14765-3-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=AYvx+hKlTuvWdDRT83rsHG30d0GVUlP5mRSGQAA1z4U=;
 b=lOeUzLD7n4PAtFX3vYOFGYkqrgu1sQCyqQDXWzLTWLqikYvglRb+IKFBJMleJ1aRe1
 UUg9US9oUwADsm26SYW+wJ25BZAAesxu1FDsxn85zKoHf4riEK0CY2fJ21aza++votM/
 cvZKlJSnYsfAAnUWrTLrv/MCX9rZqWZ2l8HUQ=
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
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDE6MTQ6MDRQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBVc2UgZHJtX2dlbV9yZXNlcnZhdGlvbl9vYmplY3Rfd2FpdCgpIGluIHZpcnRpb19n
cHVfd2FpdF9pb2N0bCgpLgoKV291bGQgYmUgZ29vZCB0byBtZW50aW9uIGhlcmUgdGhhdCB3aXRo
IHRoaXMgdGhlIHdhaXQgYmVjb21lcyBsb2NrbGVzcywgd2UKZG9uJ3QgY2FsbCB0dG1fYm9fcmVz
ZXJ2ZS91bnJlc2VydmUgYW55bW9yZS4KCj4gU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9pb2N0bC5jIHwgMTggKysrKy0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9pb2N0bC5jCj4gaW5kZXggYzBiYTFlYWQ3NDBmLi5lMzhhNmJiNDZjYzcgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYwo+IEBAIC00NjQsMjMgKzQ2NCwxMyBA
QCBzdGF0aWMgaW50IHZpcnRpb19ncHVfd2FpdF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB2b2lkICpkYXRhLAo+ICAJCQkgICAgc3RydWN0IGRybV9maWxlICpmaWxlKQo+ICB7Cj4gIAlz
dHJ1Y3QgZHJtX3ZpcnRncHVfM2Rfd2FpdCAqYXJncyA9IGRhdGE7Cj4gLQlzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKmdvYmogPSBOVUxMOwo+IC0Jc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpxb2Jq
ID0gTlVMTDsKPiAtCWludCByZXQ7Cj4gLQlib29sIG5vd2FpdCA9IGZhbHNlOwo+IC0KPiAtCWdv
YmogPSBkcm1fZ2VtX29iamVjdF9sb29rdXAoZmlsZSwgYXJncy0+aGFuZGxlKTsKPiAtCWlmIChn
b2JqID09IE5VTEwpCj4gLQkJcmV0dXJuIC1FTk9FTlQ7Cj4gLQo+IC0JcW9iaiA9IGdlbV90b192
aXJ0aW9fZ3B1X29iaihnb2JqKTsKPiArCWxvbmcgdGltZW91dCA9IDE1ICogSFo7Cj4gIAo+ICAJ
aWYgKGFyZ3MtPmZsYWdzICYgVklSVEdQVV9XQUlUX05PV0FJVCkKPiAtCQlub3dhaXQgPSB0cnVl
Owo+IC0JcmV0ID0gdmlydGlvX2dwdV9vYmplY3Rfd2FpdChxb2JqLCBub3dhaXQpOwo+ICsJCXRp
bWVvdXQgPSAwOwoKdGltZW91dCBvZiAwIGdldHMgdXBncmFkZSB0byBhIDEgamlmZnkgd2FpdCwg
d2hpY2ggaXMgcHJvYmFibHkgbm90IHdoYXQKeW91IHdhbnQgaGVyZS4gWW91IG5lZWQgdG8gb3Bl
bi1jb2RlIHR0bV9ib193YWl0IGhlcmUgYW5kIGNhbGwKcmVzZXJ2YXRpb25fb2JqZWN0X3Rlc3Rf
c2lnbmFsZWRfcmN1KCkgZm9yIHRoaXMgY2FzZS4KCldpdGggdGhhdCBmaXhlZCBSZXZpZXdlZC1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCj4gIAo+IC0JZHJtX2dl
bV9vYmplY3RfcHV0X3VubG9ja2VkKGdvYmopOwo+IC0JcmV0dXJuIHJldDsKPiArCXJldHVybiBk
cm1fZ2VtX3Jlc2VydmF0aW9uX29iamVjdF93YWl0KGZpbGUsIGFyZ3MtPmhhbmRsZSwKPiArCQkJ
CQkgICAgICAgdHJ1ZSwgdGltZW91dCk7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgdmlydGlvX2dw
dV9nZXRfY2Fwc19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+IC0tIAo+IDIuMTguMQo+
IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
