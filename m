Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E964A814
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 19:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF536E1B8;
	Tue, 18 Jun 2019 17:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF4B6E1B8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 17:16:31 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id n11so16278303qtl.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 10:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5HdOkeGTOimtUzxYuQ63HUqEs40RoAuiCtdWAjPZDM0=;
 b=KSpFuDJq5OEP8DHtsSgymGMwf9QrokUdSeMdfKGrcyla2r1MiujZFybIzgpfBJDsBF
 tA6wzimzpnUOdhzPrZO0shUKkh3Yjp+22Ms+Apr4ibJ+rNkQKz0Q91/WktCS/UBEf54C
 fscfUrscVHwOsiv4zzBwIu79MsumbbjC3JRHkry9PJWIvQ3o8xStd4fT7kv2ECoT9f8H
 r/SBlWQ9wd1ylr+0SqnQ0c7tJJ5lNL5Ho8uqPZWswifiJwEjBBC1b/6CY3eKNEkv14Tt
 FpxkO2vwHHmQBT9r80OmkRmf3bdkpUrcIn1zJ924VWLcx22dGPCfLVk+loTx7fLFje2u
 xYkg==
X-Gm-Message-State: APjAAAXeUGq0MsN44GYENe1qvf1dafSTmu++XBCIGAOeW5OpW7ew3Gtr
 jfFCIVIW/+k7v62qsKu2J6NSNA==
X-Google-Smtp-Source: APXvYqxHpvdIJ3r1rR8PFVV6pBLc7jwq+5ZT5DwQvMXjzrBn2Est5EPpbCwUxoMEH+iz1jdelPvGnA==
X-Received: by 2002:ac8:2bb3:: with SMTP id m48mr98945689qtm.218.1560878191074; 
 Tue, 18 Jun 2019 10:16:31 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id o71sm8278024qke.18.2019.06.18.10.16.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 10:16:30 -0700 (PDT)
Date: Tue, 18 Jun 2019 13:16:29 -0400
From: Sean Paul <sean@poorly.run>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] drm: return -EFAULT if copy_to_user() fails
Message-ID: <20190618171629.GB25413@art_vandelay>
References: <20190618125623.GA24896@mwanda>
 <20190618131843.GA29463@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618131843.GA29463@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5HdOkeGTOimtUzxYuQ63HUqEs40RoAuiCtdWAjPZDM0=;
 b=OaDtkN5HFpjGr/oGrGRtE6pafVhMmdq/+VJSFcdz1WobXMuZUUKApbaDiA9vnXK2j3
 M1ZG9xkYjtUHKnUSxIWDICD7d9IOcd3cpxqHPwMwqOnwjKwahWRc8XwbX0PJfKH98415
 37Tsyp4Yhxud4rCL+Rw1GCax0qVqIuAdhttJfj9MfV0epKELmBAAIwOXbAonPiJugOsp
 EhKXuX5lRWnE12UtILOB1cW4SFsisYFxR1LSJ3zLUupulctUeP/CFusTIdpSZD8JLC4E
 dlPL2W1HH03olfJL/RXjzT2piEGtlzgdSpRKJfjApX6sjAnrlenIcMgVNTGyGbpx++rF
 yzsg==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Al Viro <viro@zeniv.linux.org.uk>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDQ6MTg6NDNQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBUaGUgY29weV9mcm9tX3VzZXIoKSBmdW5jdGlvbiByZXR1cm5zIHRoZSBudW1iZXIg
b2YgYnl0ZXMgcmVtYWluaW5nCj4gdG8gYmUgY29waWVkIGJ1dCB3ZSB3YW50IHRvIHJldHVybiBh
IG5lZ2F0aXZlIGVycm9yIGNvZGUuICBPdGhlcndpc2UKPiB0aGUgY2FsbGVycyB0cmVhdCBpdCBh
cyBhIHN1Y2Nlc3NmdWwgY29weS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxk
YW4uY2FycGVudGVyQG9yYWNsZS5jb20+CgpUaGFua3MgRGFuLCBJJ3ZlIGFwcGxpZWQgdGhpcyB0
byBkcm0tbWlzYy1maXhlcy4KClNlYW4KCj4gLS0tCj4gdjI6IFRoZSBmaXJzdCB2ZXJzaW9uIHdh
cyBtaXNzaW5nIGEgY2h1bmsKPiAKPiAgZHJpdmVycy9ncHUvZHJtL2RybV9idWZzLmMgIHwgNSAr
KysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2lvYzMyLmMgfCA1ICsrKystCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2J1ZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnVmcy5j
Cj4gaW5kZXggNjhkYWNmODQyMmM2Li44Y2U5ZDczZmFiNGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9idWZzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2J1ZnMuYwo+
IEBAIC0xMzUxLDcgKzEzNTEsMTAgQEAgc3RhdGljIGludCBjb3B5X29uZV9idWYodm9pZCAqZGF0
YSwgaW50IGNvdW50LCBzdHJ1Y3QgZHJtX2J1Zl9lbnRyeSAqZnJvbSkKPiAgCQkJCSAuc2l6ZSA9
IGZyb20tPmJ1Zl9zaXplLAo+ICAJCQkJIC5sb3dfbWFyayA9IGZyb20tPmxvd19tYXJrLAo+ICAJ
CQkJIC5oaWdoX21hcmsgPSBmcm9tLT5oaWdoX21hcmt9Owo+IC0JcmV0dXJuIGNvcHlfdG9fdXNl
cih0bywgJnYsIG9mZnNldG9mKHN0cnVjdCBkcm1fYnVmX2Rlc2MsIGZsYWdzKSk7Cj4gKwo+ICsJ
aWYgKGNvcHlfdG9fdXNlcih0bywgJnYsIG9mZnNldG9mKHN0cnVjdCBkcm1fYnVmX2Rlc2MsIGZs
YWdzKSkpCj4gKwkJcmV0dXJuIC1FRkFVTFQ7Cj4gKwlyZXR1cm4gMDsKPiAgfQo+ICAKPiAgaW50
IGRybV9sZWdhY3lfaW5mb2J1ZnMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9pb2MzMi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9pb2MzMi5jCj4gaW5kZXggNTg2YWEyODAyNGM1Li5hMTZiNmRjMmZhNDcgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9pb2MzMi5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9pb2MzMi5jCj4gQEAgLTM3OCw3ICszNzgsMTAgQEAgc3RhdGljIGludCBjb3B5X29u
ZV9idWYzMih2b2lkICpkYXRhLCBpbnQgY291bnQsIHN0cnVjdCBkcm1fYnVmX2VudHJ5ICpmcm9t
KQo+ICAJCQkgICAgICAuc2l6ZSA9IGZyb20tPmJ1Zl9zaXplLAo+ICAJCQkgICAgICAubG93X21h
cmsgPSBmcm9tLT5sb3dfbWFyaywKPiAgCQkJICAgICAgLmhpZ2hfbWFyayA9IGZyb20tPmhpZ2hf
bWFya307Cj4gLQlyZXR1cm4gY29weV90b191c2VyKHRvICsgY291bnQsICZ2LCBvZmZzZXRvZihk
cm1fYnVmX2Rlc2MzMl90LCBmbGFncykpOwo+ICsKPiArCWlmIChjb3B5X3RvX3VzZXIodG8gKyBj
b3VudCwgJnYsIG9mZnNldG9mKGRybV9idWZfZGVzYzMyX3QsIGZsYWdzKSkpCj4gKwkJcmV0dXJu
IC1FRkFVTFQ7Cj4gKwlyZXR1cm4gMDsKPiAgfQo+ICAKPiAgc3RhdGljIGludCBkcm1fbGVnYWN5
X2luZm9idWZzMzIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAtLSAKPiAy
LjIwLjEKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJv
bWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
