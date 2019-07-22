Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9D6709D9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 21:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D0D89D9A;
	Mon, 22 Jul 2019 19:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C5189D9A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 19:40:04 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id y123so12329017yby.10
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 12:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XiPi6NLGAihhHoJX1TQVxa/qSyYbhC/5nUBfiRfN5To=;
 b=Fz2j5SmRGSaFRuHpxVXqAkccrS56otV+dfyM8qUv3qvmkkh6IvIr902/N+2pVv/yIV
 ABXVHziXtMC3iz/9/iAvhyAX3wY8yyo8zEYWwoSj2Uw5ssK2ywTkhSYZ/X5R/W40tn+V
 OjNn+z75yRgzJdlxVhvIBbuFDp3oBr0pFPUu7HC+ecnH8jIlVMbvzZ7bihj5ZCzHfEXJ
 BKrB9MjCnKl097XtqvB7wVgV/kFmXGztGly2Fz5d80sIb2LxAuLCj+xXAHpogMoL4Igx
 wwILuUdGVn6yoOZjoeatWUK+OhNaCuVEtTEIAUvMsOAxWT649xNR8kk4jYIBvttGg4fA
 3orw==
X-Gm-Message-State: APjAAAU1HkOFGdvchN7fsQHrb6eIhgFCk/SXPRTGvf+N3ZE/4kSV4b6b
 seudh5ySsbHhI3qt193LxDJhfg==
X-Google-Smtp-Source: APXvYqz5SZD7hxqVmR3c0a4NmWzRdFT0snKaXz6JaYvHegDZWvbV9kes8na9VWp1p6aIBtO6/WGxtg==
X-Received: by 2002:a25:e003:: with SMTP id x3mr40966402ybg.225.1563824403688; 
 Mon, 22 Jul 2019 12:40:03 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id t201sm9586068ywc.87.2019.07.22.12.40.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 12:40:02 -0700 (PDT)
Date: Mon, 22 Jul 2019 15:40:02 -0400
From: Sean Paul <sean@poorly.run>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm: stop abusing dma_map/unmap for cache
Message-ID: <20190722194002.GI104440@art_vandelay>
References: <20190630124735.27786-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190630124735.27786-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XiPi6NLGAihhHoJX1TQVxa/qSyYbhC/5nUBfiRfN5To=;
 b=DatuO7iFd/gwaby0zE8VcAJc0UoFQHqT7eYDhZPJsVPEYuFar3ijTDWGJZ/oMnBCdn
 NCp5AOREUGLNU/Dl5ElDs7B8Z7kfIDKXdHCT8XENb09BHD9P/OIaYVJ4LvZYQgqy3twJ
 4VZ9Lx+eg6JJesZbxJFhpffym4RjzaZWqh8RchQ4bJWciVRW4DSxxFF1fVwXJngqdsji
 efB18StPJsYCrMvpMIa7gFnp2t7n3WT/xrib079dw3FlU/KE03xS0q5vJO8MR/2y6IWI
 U+0TeStphc7eDtcZZTx90NjrQ0y8Bv3ZJk6WPPbv+jhO6rFnmSUaNQEa40RruUxZGmWo
 PeEg==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMDU6NDc6MjJBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBSZWNlbnRs
eSBzcGxhdHMgbGlrZSB0aGlzIHN0YXJ0ZWQgc2hvd2luZyB1cDoKPiAKPiAgICBXQVJOSU5HOiBD
UFU6IDQgUElEOiAyNTEgYXQgZHJpdmVycy9pb21tdS9kbWEtaW9tbXUuYzo0NTEgX19pb21tdV9k
bWFfdW5tYXArMHhiOC8weGMwCj4gICAgTW9kdWxlcyBsaW5rZWQgaW46IGF0aDEwa19zbm9jIGF0
aDEwa19jb3JlIGZ1c2UgbXNtIGF0aCBtYWM4MDIxMSB1dmN2aWRlbyBjZmc4MDIxMSB2aWRlb2J1
ZjJfdm1hbGxvYyB2aWRlb2J1ZjJfbWVtb3BzIHZpZGUKPiAgICBDUFU6IDQgUElEOiAyNTEgQ29t
bToga3dvcmtlci91MTY6NCBUYWludGVkOiBHICAgICAgICBXICAgICAgICAgNS4yLjAtcmM1LW5l
eHQtMjAxOTA2MTkrICMyMzE3Cj4gICAgSGFyZHdhcmUgbmFtZTogTEVOT1ZPIDgxSkwvTE5WTkIx
NjEyMTYsIEJJT1MgOVVDTjIzV1coVjEuMDYpIDEwLzI1LzIwMTgKPiAgICBXb3JrcXVldWU6IG1z
bSBtc21fZ2VtX2ZyZWVfd29yayBbbXNtXQo+ICAgIHBzdGF0ZTogODBjMDAwMDUgKE56Y3YgZGFp
ZiArUEFOICtVQU8pCj4gICAgcGMgOiBfX2lvbW11X2RtYV91bm1hcCsweGI4LzB4YzAKPiAgICBs
ciA6IF9faW9tbXVfZG1hX3VubWFwKzB4NTQvMHhjMAo+ICAgIHNwIDogZmZmZjAwMDAxMTlhYmNl
MAo+ICAgIHgyOTogZmZmZjAwMDAxMTlhYmNlMCB4Mjg6IDAwMDAwMDAwMDAwMDAwMDAKPiAgICB4
Mjc6IGZmZmY4MDAxZjk5NDY2NDggeDI2OiBmZmZmODAwMWVjMjcxMDY4Cj4gICAgeDI1OiAwMDAw
MDAwMDAwMDAwMDAwIHgyNDogZmZmZjgwMDFlYTM1ODBhOAo+ICAgIHgyMzogZmZmZjgwMDFmOTVi
YTAxMCB4MjI6IGZmZmY4MDAxOGU4M2JhODgKPiAgICB4MjE6IGZmZmY4MDAxZTU0OGYwMDAgeDIw
OiBmZmZmZmZmZmZmZmZmMDAwCj4gICAgeDE5OiAwMDAwMDAwMDAwMDAxMDAwIHgxODogMDAwMDAw
MDBjMDAwMDFmZQo+ICAgIHgxNzogMDAwMDAwMDAwMDAwMDAwMCB4MTY6IDAwMDAwMDAwMDAwMDAw
MDAKPiAgICB4MTU6IGZmZmYwMDAwMTViNzAwNjggeDE0OiAwMDAwMDAwMDAwMDAwMDA1Cj4gICAg
eDEzOiAwMDAzMTQyY2MxYmUxNzY4IHgxMjogMDAwMDAwMDAwMDAwMDAwMQo+ICAgIHgxMTogZmZm
ZjgwMDFmNmRlOTEwMCB4MTA6IDAwMDAwMDAwMDAwMDAwMDkKPiAgICB4OSA6IGZmZmYwMDAwMTVi
NzgwMDAgeDggOiAwMDAwMDAwMDAwMDAwMDAwCj4gICAgeDcgOiAwMDAwMDAwMDAwMDAwMDAxIHg2
IDogZmZmZmZmZmZmZmZmZjAwMAo+ICAgIHg1IDogMDAwMDAwMDAwMDAwMGZmZiB4NCA6IGZmZmYw
MDAwMTA2NWRiYzgKPiAgICB4MyA6IDAwMDAwMDAwMDAwMDAwMGQgeDIgOiAwMDAwMDAwMDAwMDAx
MDAwCj4gICAgeDEgOiBmZmZmZmZmZmZmZmZmMDAwIHgwIDogMDAwMDAwMDAwMDAwMDAwMAo+ICAg
IENhbGwgdHJhY2U6Cj4gICAgIF9faW9tbXVfZG1hX3VubWFwKzB4YjgvMHhjMAo+ICAgICBpb21t
dV9kbWFfdW5tYXBfc2crMHg5OC8weGI4Cj4gICAgIHB1dF9wYWdlcysweDVjLzB4ZjAgW21zbV0K
PiAgICAgbXNtX2dlbV9mcmVlX3dvcmsrMHgxMGMvMHgxNTAgW21zbV0KPiAgICAgcHJvY2Vzc19v
bmVfd29yaysweDFlMC8weDMzMAo+ICAgICB3b3JrZXJfdGhyZWFkKzB4NDAvMHg0MzgKPiAgICAg
a3RocmVhZCsweDEyYy8weDEzMAo+ICAgICByZXRfZnJvbV9mb3JrKzB4MTAvMHgxOAo+ICAgIC0t
LVsgZW5kIHRyYWNlIGFmYzBkYzVhYjgxYTA2YmYgXS0tLQo+IAo+IE5vdCBxdWl0ZSBzdXJlIHdo
YXQgdHJpZ2dlcmVkIHRoYXQsIGJ1dCB3ZSByZWFsbHkgc2hvdWxkbid0IGJlIGFidXNpbmcKPiBk
bWFfe21hcCx1bm1hcH1fc2coKSBmb3IgY2FjaGUgbWFpbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Um9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IENjOiBTdGVwaGVuIEJveWQgPHNi
b3lkQGtlcm5lbC5vcmc+CgpBcHBsaWVkIHRvIC1taXNjLWZpeGVzCgpUaGFua3MsCgpTZWFuCgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW0uYyB8IDQgKystLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNt
X2dlbS5jCj4gaW5kZXggZDMxZDlmOTI3ODg3Li4zYjg0Y2JkY2FmYTMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L21zbV9nZW0uYwo+IEBAIC0xMDgsNyArMTA4LDcgQEAgc3RhdGljIHN0cnVjdCBwYWdlICoqZ2V0
X3BhZ2VzKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQo+ICAJCSAqIGJlY2F1c2UgZGlzcGxh
eSBjb250cm9sbGVyLCBHUFUsIGV0Yy4gYXJlIG5vdCBjb2hlcmVudDoKPiAgCQkgKi8KPiAgCQlp
ZiAobXNtX29iai0+ZmxhZ3MgJiAoTVNNX0JPX1dDfE1TTV9CT19VTkNBQ0hFRCkpCj4gLQkJCWRt
YV9tYXBfc2coZGV2LT5kZXYsIG1zbV9vYmotPnNndC0+c2dsLAo+ICsJCQlkbWFfc3luY19zZ19m
b3JfZGV2aWNlKGRldi0+ZGV2LCBtc21fb2JqLT5zZ3QtPnNnbCwKPiAgCQkJCQltc21fb2JqLT5z
Z3QtPm5lbnRzLCBETUFfQklESVJFQ1RJT05BTCk7Cj4gIAl9Cj4gIAo+IEBAIC0xMzgsNyArMTM4
LDcgQEAgc3RhdGljIHZvaWQgcHV0X3BhZ2VzKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQo+
ICAJCQkgKiBHUFUsIGV0Yy4gYXJlIG5vdCBjb2hlcmVudDoKPiAgCQkJICovCj4gIAkJCWlmICht
c21fb2JqLT5mbGFncyAmIChNU01fQk9fV0N8TVNNX0JPX1VOQ0FDSEVEKSkKPiAtCQkJCWRtYV91
bm1hcF9zZyhvYmotPmRldi0+ZGV2LCBtc21fb2JqLT5zZ3QtPnNnbCwKPiArCQkJCWRtYV9zeW5j
X3NnX2Zvcl9jcHUob2JqLT5kZXYtPmRldiwgbXNtX29iai0+c2d0LT5zZ2wsCj4gIAkJCQkJICAg
ICBtc21fb2JqLT5zZ3QtPm5lbnRzLAo+ICAJCQkJCSAgICAgRE1BX0JJRElSRUNUSU9OQUwpOwo+
ICAKPiAtLSAKPiAyLjIwLjEKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBH
b29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
