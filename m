Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDF7106884
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 10:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD8A6F4F5;
	Fri, 22 Nov 2019 09:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4234A6E1E8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 18:18:04 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id z25so3803046oti.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 10:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BLh+wq2FKhAOzMh5cYk9TfhwRQ3GNGiwiSyRjHesiO4=;
 b=Te9AG98BqNDJnMk35TaRSZg1Akff9KW2CjW5Cr7YVbLK0ef0uzjSMoRzLYeThJ42Q2
 BGl02FUOWwPzPt1248dYqf5q6EkpjO7lHK79ljN2E4FoqI4aWjmm075SuY6KceratH8+
 WfYuQx/W+ml0VaYwuixqnlKvY6jB0IKO1Q+oMdhYXYMTRjerhqXmbWEfRKO6jH+N9DrO
 iwZc6pxC5YbR3WIjocm1ZQ8DSP8cMtugGbW3cK2Nan9DJzANIx9G2C4tXtxV2eRfNWXq
 ME7EyqXJ6z1yXrHs9NyHxiEtZbRZUVyDohlN6WnLUBzQu+gsfr3DNUEM47+eK8afD9+e
 BAZw==
X-Gm-Message-State: APjAAAVQEO2VU8NeiWp7/tPA/p6+Vsm3aLjJ9JNFreE7Q4dutNaazOs0
 wmOWYbfeo49FsPMve7SfEQxZTwUFQS3UXM8cAwU=
X-Google-Smtp-Source: APXvYqyP8jT97drkLxAOQj9i4dbSNbCEbWv6Btfk7/zmrzrazKpqzfQGZHvSu0NazVBk2BmpBQqhJr5kv4zzgQ4ZpPM=
X-Received: by 2002:a9d:6149:: with SMTP id c9mr7367377otk.279.1574360283417; 
 Thu, 21 Nov 2019 10:18:03 -0800 (PST)
MIME-Version: 1.0
References: <20190925043800.726-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190925043800.726-1-navid.emamdoost@gmail.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Thu, 21 Nov 2019 12:17:52 -0600
Message-ID: <CAEkB2ESR+GictT00W95pADAeakAuLrTECqUxEt=b7TG2x=FgVw@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: prevent memory leak in vmw_cmdbuf_res_add
To: VMware Graphics <linux-graphics-maintainer@vmware.com>, 
 Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 22 Nov 2019 09:00:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BLh+wq2FKhAOzMh5cYk9TfhwRQ3GNGiwiSyRjHesiO4=;
 b=AfCzA/xcPYfKAiPT09NYITrqZxU0TdI+ZO6qx+Go4PDPhF8W1qK428wuZjVPlsEcbo
 fbZ+L7IZENZ0tDIhhYv23CBtqdLjjNWQ2XckHg7Cm26FtGW25svaOb0fgMBUu2uScxa0
 8pxd/Dt0Cx+K/qmpa99ApYW36a/ym+R+16o99cJEhl4C5qxUsHnzUk1WpKQscG8Ykucl
 fRBw03q35Ob/fQL3qywJogesTmEZt0t5l3kIQcUkr3s5xEVzVj/0pRWb1syCdUvmoaCL
 LZ/T6s1bAmBpJ4UjQxsqO702DBI9qiHRPXsIbMfcZXmKjpdhyfWe1ctSCh2M5vZGya7o
 fjgw==
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
Cc: Navid Emamdoost <emamd001@umn.edu>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMTE6MzggUE0gTmF2aWQgRW1hbWRvb3N0CjxuYXZpZC5l
bWFtZG9vc3RAZ21haWwuY29tPiB3cm90ZToKPgo+IEluIHZtd19jbWRidWZfcmVzX2FkZCBpZiBk
cm1faHRfaW5zZXJ0X2l0ZW0gZmFpbHMgdGhlIGFsbG9jYXRlZCBtZW1vcnkKPiBmb3IgY3JlcyBz
aG91bGQgYmUgcmVsZWFzZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOYXZpZCBFbWFtZG9vc3QgPG5h
dmlkLmVtYW1kb29zdEBnbWFpbC5jb20+CgpXb3VsZCB5b3UgcGxlYXNlIHJldmlldyB0aGlzIHBh
dGNoPwoKVGhhbmtzLAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY21k
YnVmX3Jlcy5jIHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9jbWRidWZfcmVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWZfcmVz
LmMKPiBpbmRleCA0YWM1NWZjMmJmOTcuLjQ0ZDg1OGNlNGNlNyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWZfcmVzLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWZfcmVzLmMKPiBAQCAtMjA5LDggKzIwOSwxMCBAQCBp
bnQgdm13X2NtZGJ1Zl9yZXNfYWRkKHN0cnVjdCB2bXdfY21kYnVmX3Jlc19tYW5hZ2VyICptYW4s
Cj4KPiAgICAgICAgIGNyZXMtPmhhc2gua2V5ID0gdXNlcl9rZXkgfCAocmVzX3R5cGUgPDwgMjQp
Owo+ICAgICAgICAgcmV0ID0gZHJtX2h0X2luc2VydF9pdGVtKCZtYW4tPnJlc291cmNlcywgJmNy
ZXMtPmhhc2gpOwo+IC0gICAgICAgaWYgKHVubGlrZWx5KHJldCAhPSAwKSkKPiArICAgICAgIGlm
ICh1bmxpa2VseShyZXQgIT0gMCkpIHsKPiArICAgICAgICAgICAgICAga2ZyZWUoY3Jlcyk7Cj4g
ICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ludmFsaWRfa2V5Owo+ICsgICAgICAgfQo+Cj4gICAg
ICAgICBjcmVzLT5zdGF0ZSA9IFZNV19DTURCVUZfUkVTX0FERDsKPiAgICAgICAgIGNyZXMtPnJl
cyA9IHZtd19yZXNvdXJjZV9yZWZlcmVuY2UocmVzKTsKPiAtLQo+IDIuMTcuMQo+CgoKLS0gCk5h
dmlkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
