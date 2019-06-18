Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8944A36C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 16:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A83C6E1D2;
	Tue, 18 Jun 2019 14:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25B16E1D2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 14:07:08 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k21so21939343edq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=kbjXiDHUcs03Ham95m0Whx0OgVZ5j2550aVQnPTfdxQ=;
 b=kz83wFblNiPqfrK6soFfSgusRPrT7N1yi7+hywJ/mDtIpCwEs+LjpjMGkOvhNhxy7G
 f648EgKXJwEqimBaLYMqHZ+8up5WgcekNJ5FydsAxtn9pTjk0s72pmihHmpD8ZB/q1aW
 USEG+EajMUib+uLbr5fgdNLizf0FUfsnbUFPTLWxUK/ajRLM9BLTYaiAPwda4cy1ey4L
 qXvdPnEv044LVxBYkScxe3vm66Ws54rv2X3We+pChxXzZIGvxKHhMChmx1h9h9OPmEs6
 0/5+/VpccjV0YWXeFNFQ5tZz6ZypoSq7RBBPrmVZRtKJByZIY2icL/mTT4Aa+BwOaYMN
 lCZw==
X-Gm-Message-State: APjAAAVnQaA5emDOJ7qsnP6bm3LoIMwe9uNfoudFea/hVbLDsLwxCS+p
 Wvs0DPmu/mDhZd37OKgyD1JBSnMbq4w=
X-Google-Smtp-Source: APXvYqybQkv2LSTpbVQqBNG0vU3Pn6LJz77TNlXyMjfN4HiYSdsBYRstxuDZf20J7rLw9S/ZVFFw7Q==
X-Received: by 2002:a50:900d:: with SMTP id b13mr93026672eda.289.1560866827421; 
 Tue, 18 Jun 2019 07:07:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b25sm4631135ede.34.2019.06.18.07.07.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 07:07:06 -0700 (PDT)
Date: Tue, 18 Jun 2019 16:07:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 02/12] drm/virtio: switch virtio_gpu_wait_ioctl() to
 gem helper.
Message-ID: <20190618140704.GA12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20190618135821.8644-1-kraxel@redhat.com>
 <20190618135821.8644-3-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618135821.8644-3-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=kbjXiDHUcs03Ham95m0Whx0OgVZ5j2550aVQnPTfdxQ=;
 b=XjzjnU228yADptN7urnRtwf8Ole5zcytiEo9ewubNXfcudMgl6XJCKZLzRyF6DK60v
 r0lXIvAbGBB3ijq69WVn9MUKU9OXLTsAtICIh3LWg6xWSLwVd9duS4BDQdd94/O/UjBN
 Gf1rHG7pIdcfWWxcH62s7t4gajFPKygSMxMBY=
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

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDM6NTg6MTBQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBVc2UgZHJtX2dlbV9yZXNlcnZhdGlvbl9vYmplY3Rfd2FpdCgpIGluIHZpcnRpb19n
cHVfd2FpdF9pb2N0bCgpLgo+IFRoaXMgYWxzbyBtYWtlcyB0aGUgaW9jdGwgcnVuIGxvY2tsZXNz
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+
IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKTml0
OiBNaXNzaW5nIHRoZSB2MiBjaGFuZ2Vsb2cgaGVyZS4KLURhbmllbAoKPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMgfCAyNCArKysrKysrKysrLS0tLS0tLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwu
YyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCj4gaW5kZXggYWM2MGJl
OWI1YzE5Li4zMTNjNzcwZWEyYzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X2lvY3RsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
aW9jdGwuYwo+IEBAIC00NjQsMjMgKzQ2NCwxOSBAQCBzdGF0aWMgaW50IHZpcnRpb19ncHVfd2Fp
dF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ICAJCQkgICAgc3Ry
dWN0IGRybV9maWxlICpmaWxlKQo+ICB7Cj4gIAlzdHJ1Y3QgZHJtX3ZpcnRncHVfM2Rfd2FpdCAq
YXJncyA9IGRhdGE7Cj4gLQlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdvYmogPSBOVUxMOwo+IC0J
c3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpxb2JqID0gTlVMTDsKPiArCXN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqOwo+ICsJbG9uZyB0aW1lb3V0ID0gMTUgKiBIWjsKPiAgCWludCByZXQ7Cj4g
LQlib29sIG5vd2FpdCA9IGZhbHNlOwo+ICAKPiAtCWdvYmogPSBkcm1fZ2VtX29iamVjdF9sb29r
dXAoZmlsZSwgYXJncy0+aGFuZGxlKTsKPiAtCWlmIChnb2JqID09IE5VTEwpCj4gLQkJcmV0dXJu
IC1FTk9FTlQ7Cj4gKwlpZiAoYXJncy0+ZmxhZ3MgJiBWSVJUR1BVX1dBSVRfTk9XQUlUKSB7Cj4g
KwkJb2JqID0gZHJtX2dlbV9vYmplY3RfbG9va3VwKGZpbGUsIGFyZ3MtPmhhbmRsZSk7Cj4gKwkJ
cmV0ID0gcmVzZXJ2YXRpb25fb2JqZWN0X3Rlc3Rfc2lnbmFsZWRfcmN1KG9iai0+cmVzdiwgdHJ1
ZSk7Cj4gKwkJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKG9iaik7Cj4gKwkJcmV0dXJuIHJl
dCA/IDAgOiAtRUJVU1k7Cj4gKwl9Cj4gIAo+IC0JcW9iaiA9IGdlbV90b192aXJ0aW9fZ3B1X29i
aihnb2JqKTsKPiAtCj4gLQlpZiAoYXJncy0+ZmxhZ3MgJiBWSVJUR1BVX1dBSVRfTk9XQUlUKQo+
IC0JCW5vd2FpdCA9IHRydWU7Cj4gLQlyZXQgPSB2aXJ0aW9fZ3B1X29iamVjdF93YWl0KHFvYmos
IG5vd2FpdCk7Cj4gLQo+IC0JZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKGdvYmopOwo+IC0J
cmV0dXJuIHJldDsKPiArCXJldHVybiBkcm1fZ2VtX3Jlc2VydmF0aW9uX29iamVjdF93YWl0KGZp
bGUsIGFyZ3MtPmhhbmRsZSwKPiArCQkJCQkgICAgICAgdHJ1ZSwgdGltZW91dCk7Cj4gIH0KPiAg
Cj4gIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9nZXRfY2Fwc19pb2N0bChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LAo+IC0tIAo+IDIuMTguMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
