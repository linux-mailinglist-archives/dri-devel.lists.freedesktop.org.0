Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC45617DEFF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 12:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B63989C55;
	Mon,  9 Mar 2020 11:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FA889C55
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 11:49:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x3so9464457wmj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 04:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=bTyK1vEbnCjw8JirthPvuBhto29rFArsRHJMgNd42N0=;
 b=p5fikUQDYZzI+DqGSlWw6jEiflDEOQGm1SKiUEXPawrmdmJosx4+C7J9cjw9rY3lSm
 C4hg9j83eThnJiIHSxg5Tf9FJ9ATafyx1eHK+vQWMMowVkocxfckSs+h9WQWM9khJkkC
 1v9MlkfF0mI/kznSCUQXCOuHqPj1gsIRTeivttxFO8WlZAN/yKiQirlOxbHH1Pm4l17i
 7TWPaaDLKNQcv/4XkQo+N7awJlpdBHe1Ltu785hY8LP1dnWwYE+Gmn+bia76de71D70V
 azRYzqY7QL8/tM/jXE8QRiRY+gdij8Egyl8CQaM2aDgiosmGA4eMFSYoj1sru6mlqiTl
 0BTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bTyK1vEbnCjw8JirthPvuBhto29rFArsRHJMgNd42N0=;
 b=KhIS19JchqZSllwEFmwvIw7odClZzaK7tAJj8/8ugO+mDSxTcAvErp6akbIvv5cC/1
 mgyAJ0gLijhuNbGg0EWBr6m7QM+JUWCkrUYLfegXXWbTZcUPrhLcGfEpdD/QqF0PTd4Z
 M8B5eq5volCp9k3Dam1qgrXK/DzNO7fP9XxBNZtdusZvs5oTjxhAf6pMTu5i0WvoVU9R
 ScjBhdaUKgLho1nFHUPYBbd354nf7DDT8u7d/bYRdbbSA/5nTFjd6KBxiH2xvKJz3QaS
 22BxSqnVSHhtrMTUb91/2D/pK5GiUVmCtXoPrPkacJbOrkC6Lbmztf44ixMdvV3maX3n
 6oNA==
X-Gm-Message-State: ANhLgQ3nKboXd8AfXS7NiVtz6HPnC52J1ShH1YOUaf5vyZiQfWK676mI
 d+/9Rn5eH/ipmgtP1Z8Uq6s=
X-Google-Smtp-Source: ADFU+vvfrVz4OfMRTQP9j4tQTKbGiA20TX8sbtNUrRka4Gm+7DNS0n7LnzAu7KKmFak/LUJ3FVdfmQ==
X-Received: by 2002:a7b:c950:: with SMTP id i16mr15978097wml.97.1583754558164; 
 Mon, 09 Mar 2020 04:49:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id m3sm42925505wrx.9.2020.03.09.04.49.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Mar 2020 04:49:17 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: fix false positive assert
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Pierre-eric.Pelloux-prayer@amd.com, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>
References: <20200306124155.1995-1-christian.koenig@amd.com>
Message-ID: <84724c95-1fdb-314e-19b2-03a6f0865f26@gmail.com>
Date: Mon, 9 Mar 2020 12:49:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200306124155.1995-1-christian.koenig@amd.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGllcnJlLWVyaWMsIGp1c3QgYSBnZW50bGUgcGluZyBvbiB0aGlzPyBDb3VsZCBJIGdldCBhIHRl
c3RlZC1ieT8KClJheSBjYW4geW91IGFjayBvciBldmVuIHJldmlldyB0aGlzPwoKVGhhbmtzLApD
aHJpc3RpYW4uCgpBbSAwNi4wMy4yMCB1bSAxMzo0MSBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6
Cj4gVGhlIGFzc2VydCBzb21ldGltZXMgaW5jb3JyZWN0bHkgdHJpZ2dlcnMgd2hlbiBwaW5uZWQg
Qk9zIGFyZSBkZXN0cm95ZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jIHwgNSArKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IGluZGV4IDI0NDVlMmJkNjI2Ny4uY2E1
YThkMDFmZjFmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gQEAgLTE1MSw4ICsxNTEsNiBAQCBz
dGF0aWMgdm9pZCB0dG1fYm9fYWRkX21lbV90b19scnUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0
ICpibywKPiAgIAlzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiA9IGJvLT5iZGV2Owo+ICAgCXN0
cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuOwo+ICAgCj4gLQlkbWFfcmVzdl9hc3NlcnRf
aGVsZChiby0+YmFzZS5yZXN2KTsKPiAtCj4gICAJaWYgKCFsaXN0X2VtcHR5KCZiby0+bHJ1KSkK
PiAgIAkJcmV0dXJuOwo+ICAgCj4gQEAgLTYxMSw3ICs2MDksOCBAQCBzdGF0aWMgdm9pZCB0dG1f
Ym9fcmVsZWFzZShzdHJ1Y3Qga3JlZiAqa3JlZikKPiAgIAkJICovCj4gICAJCWlmIChiby0+bWVt
LnBsYWNlbWVudCAmIFRUTV9QTF9GTEFHX05PX0VWSUNUKSB7Cj4gICAJCQliby0+bWVtLnBsYWNl
bWVudCAmPSB+VFRNX1BMX0ZMQUdfTk9fRVZJQ1Q7Cj4gLQkJCXR0bV9ib19tb3ZlX3RvX2xydV90
YWlsKGJvLCBOVUxMKTsKPiArCQkJdHRtX2JvX2RlbF9mcm9tX2xydShibyk7Cj4gKwkJCXR0bV9i
b19hZGRfbWVtX3RvX2xydShibywgJmJvLT5tZW0pOwo+ICAgCQl9Cj4gICAKPiAgIAkJa3JlZl9p
bml0KCZiby0+a3JlZik7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
