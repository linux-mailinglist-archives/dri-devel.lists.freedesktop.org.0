Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938923169B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 02:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B841D6E112;
	Wed, 29 Jul 2020 00:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4147D6E112
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 00:08:14 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id o10so6418651edh.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 17:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CzRjOXMgDp55nI/oAXJjfRn/i/hwSHvrGTh+zciIJU4=;
 b=h10GsZOZgHtCHOjbkoYKREE1K6jRJQeizrslQsmVwDs+w5Fzi0FTUNZQtFU5TnpGW4
 nEALjwRZRPLQHX+BDpSMCZtj6ZwTWBJ2TWhRwSPhDz22QuXwscJn+prcuMFgd/Ke3JZg
 3F9W8edQXR/BZyHTuH0QOmaXTeEJsiGBk0jlz4PSJxZYYxxbVrL5Pkg9dtxsz0sL1Tpe
 HYjQhdnvDLZ6pVBnb9Af5w/UEU4DW60Bbc1E0k9onEz9nGScKYx18V4uqbnFk3iAq1pt
 V1twHahi19vmj3qolADAfi/MHaTG5l5GVIWQk2TsMhNKHJr5bXh9JeAjhIEI0WjjOVIK
 BEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CzRjOXMgDp55nI/oAXJjfRn/i/hwSHvrGTh+zciIJU4=;
 b=sIggo4lAwCKQDCyi74aJfebE5MlX8EohTZ84lTMwKuWPyfYX1nhDRBwsIQ9Qn1BGbx
 fJRavcq+4J9jAGLjWN8g1Kjsdq1Uub6iHIXSwI0eIqeICxkihK7ivIJls2cWpAlZze2P
 z/ANTS+nOhtcmDOAWz03Ne6sC4+kY0oL7Ojq9HOx3R7C/T1B8WRVcPKY4zPXRv1H3l7z
 minTeexUC+DP7uIBH1EF1epUY4zqkNnIJP7FOMTpj+vzwpEBpAtPNcBffhY1WaCjRDKv
 cd2D1Dp0PliEO5F8Pb/buzUtnEo6IKUVFEzdZ4jw7B01bOW12idThDeHgtBx4FWsRY1g
 FW6g==
X-Gm-Message-State: AOAM531IA5HjpX6joIOr+gJYwO/1iNBJHHKrG9fMs0qyYGuz8/uZlkhs
 bdsEVCXlPsgIZR+dQN+Hp7mSKwEMJTUqLQjU348=
X-Google-Smtp-Source: ABdhPJyGxd+NtUs+t4+vzwyfgCqPy8NJIiksynBcvp0dCoy0l6jBMjPFuVQGzRj5W10GMaHXbRylDPN9iloyzEr7jJM=
X-Received: by 2002:aa7:d047:: with SMTP id n7mr20677036edo.78.1595981292775; 
 Tue, 28 Jul 2020 17:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200728041736.20689-1-airlied@gmail.com>
 <b18a4abf-6a05-7d2f-4c75-3e48396894ae@amd.com>
In-Reply-To: <b18a4abf-6a05-7d2f-4c75-3e48396894ae@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 29 Jul 2020 10:08:00 +1000
Message-ID: <CAPM=9tzz2a3pAY3MkvVS+FCiOxX6WNs2bmooHO0E47i6P4V0JA@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm/nouveau: don't call tt destroy callback on alloc
 failure.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyOCBKdWwgMjAyMCBhdCAxNzo0OSwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDI4LjA3LjIwIHVtIDA2OjE3IHNjaHJpZWIg
RGF2ZSBBaXJsaWU6Cj4gPiBGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
ID4KPiA+IFRoaXMgaXMgY29uZnVzaW5nLCBhbmQgZnJvbSBteSByZWFkaW5nIG9mIGFsbCB0aGUg
ZHJpdmVycyBvbmx5Cj4gPiBub3V2ZWF1IGdvdCB0aGlzIHJpZ2h0Lgo+ID4KPiA+IEp1c3QgbWFr
ZSB0aGUgQVBJIGFjdCB1bmRlciBkcml2ZXIgY29udHJvbCBvZiBpdCdzIG93biBhbGxvY2F0aW9u
Cj4gPiBmYWlsaW5nLCBhbmQgZG9uJ3QgY2FsbCBkZXN0cm95LCBpZiB0aGUgcGFnZSB0YWJsZSBm
YWlscyB0bwo+ID4gY3JlYXRlIHRoZXJlIGlzIG5vdGhpbmcgdG8gY2xlYW51cCBoZXJlLgo+ID4K
PiA+IChJJ20gd2lsbGluZyB0byBiZWxpZXZlIEkndmUgbWlzc2VkIHNvbWV0aGluZyBoZXJlLCBz
byBwbGVhc2UKPiA+IHJldmlldyBkZWVwbHkpLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhdmUg
QWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4KPiBUaGF0IGxvb2tzIHJpZ2h0IHRvIG1lIGFz
IHdlbGwsIFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnCj4gPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KCkxhbmRlZCB0aGlzIGluIGRybS1uZXh0IGFzIHdlbGwuCgpEYXZlLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
