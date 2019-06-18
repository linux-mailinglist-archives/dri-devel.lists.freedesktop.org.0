Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 885DF4A3D8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 16:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0146E1CE;
	Tue, 18 Jun 2019 14:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C55D6E1CE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 14:24:27 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z25so21990712edq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=uHnXFlY19ajG5XeU4b9Sa8dKBSgR+uGugZ79Ne3Ctiw=;
 b=kgxOYtBL2Lb7j94AaO8Isg+ifXioQcXo3+/Elch5ivRdlNqmw295zkNJVsIGWq8Vcm
 rgJ1Zm1TwUdT0SWXAFCKxjQb45E6AEyRDpoP2NbHr//Ax7Dxwj9lIxoXnZFBFcqPipyA
 ycCBdHK4CwrnNFmQ0wJudNvN513mUGPOX+GaGeQrQDc5px8hPhro9gPvFf0IeSxfdu40
 a63+tOZyw8oHbBwOw5p1O5QIlhmg8zFxXGYOBUkmQCxzSU0DOpSSxRjrFzhUD9pNSH74
 RnoWf/LXSAsEopGUHuyjHuzsDJ9qCVFY5iwc7qntEo4p7YttWovXsJ+v6LlTmDuL8IPP
 xTtQ==
X-Gm-Message-State: APjAAAUo+2DRjCaen8p3rhXvKnyJ5GwrFRhGBFNDO8m94Lu1l1ZjtbEi
 O369EPzbZVePIZxpirdv6mRzEsJmUW0=
X-Google-Smtp-Source: APXvYqxx5Ar/sJIj7A18c3YwjZinSwD1QAHaWKUNoAbyM4MPKWCKRVpPSd25DOefwPVv3Oq0Yp24Jw==
X-Received: by 2002:a17:906:924c:: with SMTP id
 c12mr37650490ejx.60.1560867866173; 
 Tue, 18 Jun 2019 07:24:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id w35sm2253983edd.32.2019.06.18.07.24.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 07:24:25 -0700 (PDT)
Date: Tue, 18 Jun 2019 16:24:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 08/12] drm/virtio: rework virtio_gpu_object_create
 fencing
Message-ID: <20190618142423.GE12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20190618135821.8644-1-kraxel@redhat.com>
 <20190618135821.8644-9-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618135821.8644-9-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=uHnXFlY19ajG5XeU4b9Sa8dKBSgR+uGugZ79Ne3Ctiw=;
 b=acF128CBhxF2kvltkkX7fAoQeLnvbBcYHTDB+c8gopqzYOIsw9tTUJ9TFqlQIBtdsI
 zQ7Uznscg2mpVIHwI3qm21u+gRcRbt8R0sFUeDu8Ycy0Bvx2MmgX11qp5AOMBLjPvlfX
 rGEIWltU5HEOeqcOVjNzNnEtGRD6vsJyhCDrk=
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

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDM6NTg6MTZQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBVc2UgZ2VtIHJlc2VydmF0aW9uIGhlbHBlcnMgYW5kIGRpcmVjdCByZXNlcnZhdGlv
bl9vYmplY3RfKiBjYWxscwo+IGluc3RlYWQgb2YgdHRtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdl
cmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfb2JqZWN0LmMgfCAyOCArKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMKPiBpbmRleCA4MmJmYmY5ODNmZDIu
LjQ2MWYxNWYyNjUxNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRn
cHVfb2JqZWN0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0
LmMKPiBAQCAtMTQxLDM0ICsxNDEsMjIgQEAgaW50IHZpcnRpb19ncHVfb2JqZWN0X2NyZWF0ZShz
dHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAo+ICAKPiAgCWlmIChmZW5jZSkgewo+ICAJ
CXN0cnVjdCB2aXJ0aW9fZ3B1X2ZlbmNlX2RyaXZlciAqZHJ2ID0gJnZnZGV2LT5mZW5jZV9kcnY7
Cj4gLQkJc3RydWN0IGxpc3RfaGVhZCB2YWxpZGF0ZV9saXN0Owo+IC0JCXN0cnVjdCB0dG1fdmFs
aWRhdGVfYnVmZmVyIG1haW5idWY7Cj4gKwkJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSAm
Ym8tPmdlbV9iYXNlOwo+ICAJCXN0cnVjdCB3d19hY3F1aXJlX2N0eCB0aWNrZXQ7Cj4gIAkJdW5z
aWduZWQgbG9uZyBpcnFfZmxhZ3M7Cj4gLQkJYm9vbCBzaWduYWxlZDsKPiAgCj4gLQkJSU5JVF9M
SVNUX0hFQUQoJnZhbGlkYXRlX2xpc3QpOwo+IC0JCW1lbXNldCgmbWFpbmJ1ZiwgMCwgc2l6ZW9m
KHN0cnVjdCB0dG1fdmFsaWRhdGVfYnVmZmVyKSk7Cj4gLQo+IC0JCS8qIHVzZSBhIGdlbSByZWZl
cmVuY2Ugc2luY2UgdW5yZWYgbGlzdCB1bmRvZXMgdGhlbSAqLwo+IC0JCWRybV9nZW1fb2JqZWN0
X2dldCgmYm8tPmdlbV9iYXNlKTsKPiAtCQltYWluYnVmLmJvID0gJmJvLT50Ym87Cj4gLQkJbGlz
dF9hZGQoJm1haW5idWYuaGVhZCwgJnZhbGlkYXRlX2xpc3QpOwo+IC0KPiAtCQlyZXQgPSB2aXJ0
aW9fZ3B1X29iamVjdF9saXN0X3ZhbGlkYXRlKCZ0aWNrZXQsICZ2YWxpZGF0ZV9saXN0KTsKPiAr
CQlkcm1fZ2VtX29iamVjdF9nZXQob2JqKTsKPiArCQlyZXQgPSBkcm1fZ2VtX2xvY2tfcmVzZXJ2
YXRpb25zKCZvYmosIDEsICZ0aWNrZXQpOwo+ICAJCWlmIChyZXQgPT0gMCkgewo+ICAJCQlzcGlu
X2xvY2tfaXJxc2F2ZSgmZHJ2LT5sb2NrLCBpcnFfZmxhZ3MpOwo+IC0JCQlzaWduYWxlZCA9IHZp
cnRpb19mZW5jZV9zaWduYWxlZCgmZmVuY2UtPmYpOwo+IC0JCQlpZiAoIXNpZ25hbGVkKQo+ICsJ
CQlpZiAoIXZpcnRpb19mZW5jZV9zaWduYWxlZCgmZmVuY2UtPmYpKQo+ICAJCQkJLyogdmlydGlv
IGNyZWF0ZSBjb21tYW5kIHN0aWxsIGluIGZsaWdodCAqLwo+IC0JCQkJdHRtX2V1X2ZlbmNlX2J1
ZmZlcl9vYmplY3RzKCZ0aWNrZXQsICZ2YWxpZGF0ZV9saXN0LAo+IC0JCQkJCQkJICAgICZmZW5j
ZS0+Zik7CgpTYW1lIGlzc3VlIHdpdGggdGhlIHJlZmNvdW50aW5nIGdvbmUgd3JvbmcgaGVyZSBh
cyBpbiB0aGUgcHJldmlvdXMgcGF0Y2guCi1EYW5pZWwKCj4gKwkJCQlyZXNlcnZhdGlvbl9vYmpl
Y3RfYWRkX2V4Y2xfZmVuY2Uob2JqLT5yZXN2LAo+ICsJCQkJCQkJCSAgJmZlbmNlLT5mKTsKPiAg
CQkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHJ2LT5sb2NrLCBpcnFfZmxhZ3MpOwo+IC0JCQlp
ZiAoc2lnbmFsZWQpCj4gLQkJCQkvKiB2aXJ0aW8gY3JlYXRlIGNvbW1hbmQgZmluaXNoZWQgKi8K
PiAtCQkJCXR0bV9ldV9iYWNrb2ZmX3Jlc2VydmF0aW9uKCZ0aWNrZXQsICZ2YWxpZGF0ZV9saXN0
KTsKPiAgCQl9Cj4gLQkJdmlydGlvX2dwdV91bnJlZl9saXN0KCZ2YWxpZGF0ZV9saXN0KTsKPiAr
CQlkcm1fZ2VtX3VubG9ja19yZXNlcnZhdGlvbnMoJm9iaiwgMSwgJnRpY2tldCk7Cj4gKwkJZHJt
X2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKG9iaik7Cj4gIAl9Cj4gIAo+ICAJKmJvX3B0ciA9IGJv
Owo+IC0tIAo+IDIuMTguMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
