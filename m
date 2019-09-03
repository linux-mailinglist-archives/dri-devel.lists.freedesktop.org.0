Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A27A8A7498
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 22:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5866897EE;
	Tue,  3 Sep 2019 20:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56715897EE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 20:27:51 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k2so852932wmj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 13:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/b2QHbCNP+aT9un1NN+bENpn3vUoUF45wJf6gW6ANh0=;
 b=IhEibkwoHHkIk9gvFUoehd/Yem5rdpT5rLvGc7LKptcTzYdO8jA/BQKzgKqQYPRFxz
 BiDmuEbxzlIclg84F+yyU/AndOTUuZXTqZ8S4hSva+sInfZa+zJoBzC4xTtmPcs6KOQg
 OGKZFlgcLB6wtE1tSHjuQX0pNFQi3GMKu1J759n1s8gvG+o6NkmeHsVEAsFFmnXU6Ps1
 Co/K0/wPRmbs3s/AR/I9B1TF/zHc/KF/6HcW9KYZrIsftW4igYpCgAajmjQxlKJqoaud
 xJqNCHuJ7wgUlU+B27TK3LCd9jS9KleGScBUZtuJ4XdJSYm1forIdWpxvnwASqqwZTlD
 efVw==
X-Gm-Message-State: APjAAAUvW4Pwp9MSZ4Uise2cDTMdP40yk3qsNpIY6WjOurPpG63JzyO6
 Qnj7GBV4rQ1WBY6tkO6Xk7tM2XktVzi9skfz+i6LzA==
X-Google-Smtp-Source: APXvYqwf5YJGifCM+NEVFPPjuCChvoU5yCQm/Yq9u+hrQ8LuXqKbrI/Jc5ugnZkobaG2J3YOiX6RhsCZ32+T8arEsTs=
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr1364009wml.36.1567542469567; 
 Tue, 03 Sep 2019 13:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190829212417.257397-1-davidriley@chromium.org>
 <20190830060857.tzrzgoi2hrmchdi5@sirius.home.kraxel.org>
 <CAASgrz2v0DYb_5A3MnaWFM4Csx1DKkZe546v7DG7R+UyLOA8og@mail.gmail.com>
 <20190830111605.twzssycagmjhfa45@sirius.home.kraxel.org>
 <CAASgrz0SXc2bEXq4xPCry_oHMXNbau36Q9i20anbFq1X0FsoMQ@mail.gmail.com>
 <20190902052852.vqejjqrib6tvv2v5@sirius.home.kraxel.org>
In-Reply-To: <20190902052852.vqejjqrib6tvv2v5@sirius.home.kraxel.org>
From: David Riley <davidriley@chromium.org>
Date: Tue, 3 Sep 2019 13:27:37 -0700
Message-ID: <CAASgrz1GKRGncD_6aDUKnDuBiZpZOjkP0P62Ukmk+DN6csKm7w@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Use vmalloc for command buffer allocations.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/b2QHbCNP+aT9un1NN+bENpn3vUoUF45wJf6gW6ANh0=;
 b=GCMat47+ln2ZL+YdHP0Tk7eE6pnHP0TvcZwh5LKi/Mw6LL7vl/KQy9uPMwMikh2YTc
 8nkINnJeY/vz1F42wZNhvV1MpdoTOcNMgjQfPgLTWju+e2zSZdyRSVoZ9us5Pe+xpQVZ
 gSwMG+cj4PS7ZvMY617QkEGh8fuckVn0Ahbzo=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMSwgMjAxOSBhdCAxMDoyOCBQTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEF1ZyAzMCwgMjAxOSBhdCAxMDo0OToyNUFNIC0w
NzAwLCBEYXZpZCBSaWxleSB3cm90ZToKPiA+IEhpIEdlcmQsCj4gPgo+ID4gT24gRnJpLCBBdWcg
MzAsIDIwMTkgYXQgNDoxNiBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+ICAgSGksCj4gPiA+Cj4gPiA+ID4gPiA+IC0gICAgIGtmcmVlKHZidWYt
PmRhdGFfYnVmKTsKPiA+ID4gPiA+ID4gKyAgICAga3ZmcmVlKHZidWYtPmRhdGFfYnVmKTsKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBpZiAoaXNfdm1hbGxvY19hZGRyKHZidWYtPmRhdGFfYnVmKSkgLi4u
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gbmVlZGVkIGhlcmUgSSBndWVzPwo+ID4gPiA+ID4KPiA+ID4g
Pgo+ID4gPiA+IGt2ZnJlZSgpIGhhbmRsZXMgdm1hbGxvYy9rbWFsbG9jL2t2bWFsbG9jIGludGVy
bmFsbHkgYnkgZG9pbmcgdGhhdCBjaGVjay4KPiA+ID4KPiA+ID4gT2suCj4gPiA+Cj4gPiA+ID4g
LSB2aWRlb2J1Zl92bWFsbG9jX3RvX3NnIGluIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVv
YnVmLWRtYS1zZy5jLAo+ID4gPiA+IGFzc3VtZXMgY29udGlndW91cyBhcnJheSBvZiBzY2F0dGVy
bGlzdCBhbmQgdGhhdCB0aGUgYnVmZmVyIGJlaW5nIGNvbnZlcnRlZAo+ID4gPiA+IGlzIHBhZ2Ug
YWxpZ25lZAo+ID4gPgo+ID4gPiBXZWxsLCB2bWFsbG9jIG1lbW9yeSBfaXNfIHBhZ2UgYWxpZ25l
ZC4KPiA+Cj4gPiBUcnVlLCBidXQgdGhpcyBmdW5jdGlvbiBnZXRzIGNhbGxlZCBmb3IgYWxsIHBv
dGVudGlhbCBlbnF1ZXVpbmdzIChlZwo+ID4gcmVzb3VyY2VfY3JlYXRlXzNkLCByZXNvdXJjZV9h
dHRhY2hfYmFja2luZykgYW5kIEkgd2FzIGNvbmNlcm5lZCB0aGF0Cj4gPiBzb21lIG90aGVyIHVz
YWdlIGluIHRoZSBmdXR1cmUgbWlnaHQgbm90IGhhdmUgdGhhdCBndWFyYW50ZWUuCj4KPiBUaGUg
dm1hbGxvY190b19zZyBjYWxsIGlzIHdyYXBwZWQgaW50byAiaWYgKGlzX3ZtYWxsb2MoKSkiLCBz
byB0aGlzCj4gc2hvdWxkIG5vdCBiZSBhIHByb2JsZW0uCj4KPiA+ID4gc2dfYWxsb2NfdGFibGVf
ZnJvbV9wYWdlcygpIGRvZXMgYWxvdCBvZiB3aGF0IHlvdSBuZWVkLCB5b3UganVzdCBuZWVkIGEK
PiA+ID4gc21hbGwgbG9vcCBhcm91bmQgdm1hbGxvY190b19wYWdlKCkgY3JlYXRlIGEgc3RydWN0
IHBhZ2UgYXJyYXkKPiA+ID4gYmVmb3JlaGFuZC4KPiA+Cj4gPiBUaGF0IGZlZWxzIGxpa2UgYW4g
ZXh0cmEgYWxsb2NhdGlvbiB3aGVuIHVuZGVyIG1lbW9yeSBwcmVzc3VyZSBhbmQKPiA+IG1vcmUg
d29yaywgdG8gbm90IGdhaW4gbXVjaCAtLSB0aGVyZSBzdGlsbCBuZWVkcyB0byBiZSBhIGZ1bmN0
aW9uIHRoYXQKPiA+IGl0ZXJhdGVzIHRocm91Z2ggYWxsIHRoZSBwYWdlcy4gIEJ1dCBJIGRvbid0
IGZlZWwgc3VwZXIgc3Ryb25nbHkgYWJvdXQKPiA+IGl0IGFuZCBjYW4gY2hhbmdlIGl0IGlmIHlv
dSB0aGluayB0aGF0IGl0IHdpbGwgYmUgbGVzcyBtYWludGVuYW5jZQo+ID4gb3ZlcmhlYWQuCj4K
PiBMZXRzIHNlZSBob3cgdm1hbGxvY190b19zZyBsb29rcyBsaWtlIHdoZW4gaXQgYXNzdW1lcyBw
YWdlLWFsaWduZWQKPiBtZW1vcnkuICBJdCdzIHByb2JhYmx5IG5vdGljZWFibGUgc2hvcnRlciB0
aGVuLgoKSXQncyBub3QgcmVhbGx5LiAgVGhlIGFsbG9jYXRpb24gb2YgdGhlIHRhYmxlIGlzIG9u
ZSB1bml0IGxlc3MsIGFuZApkb2Vzbid0IG5lZWQgdG8gdGFrZSBpbnRvIGFjY291bnQgdGhhdCBk
YXRhIG1pZ2h0IGJlIGFuIG9mZnNldCB3aXRoaW4KdGhlIHBhZ2UuICBJdCBzdGlsbCBuZWVkcyBl
cnJvciBoYW5kbGluZywgcGFydGlhbCBmaW5hbCBwYWdlIGhhbmRsaW5nLAphbmQgbWFya2luZyBv
ZiB0aGUgZW5kIG9mIHRoZSBzY2F0dGVybGlzdC4gIFRoaW5ncyBjb3VsZCBiZSBzbGlnaHRseQpz
aW1wbGlmaWVkIHRvIGFzc3VtZSB0aGF0IHlvdSBjYW4gYWx3YXlzIGdldCBhIGNvbnRpZ3VvdXMg
YWxsb2NhdGlvbgpvZiB0aGUgdGFibGUgaW5zdGVhZCBvZiB1c2luZyBzZ19hbGxvY190YWJsZS9m
b3JfZWFjaF9zZywgYnV0IGdpdmVuCnRoYXQgd2UncmUgb25seSBnb2luZyBkb3duIHRoaXMgcGF0
aCB3aGVuIG1lbW9yeSBpcyBmcmFnbWVudGVkIGFuZCBpbgphIGZhbGxiYWNrLCBkb2Vzbid0IHNl
ZW0gd29ydGh3aGlsZSB0byBtYWtlIHRoYXQgdHJhZGUtb2ZmLgoKSSd2ZSB3cml0dGVuIGEgZGlm
ZmVyZW50IHZlcnNpb24gb2Ygdm1hbGxvY190b19zZ3Qgd2hpY2ggdXNlcwpzZ19hbGxvY190YWJs
ZV9mcm9tX3BhZ2VzIHVuZGVyIHRoZSBjb3ZlcnMgYW5kIGl0IGNvbWVzIGluIHNsaWdodGx5CnNo
b3J0ZXIgKDM5IGxpbmVzIHZzIDU1IGxpbmVzKSwgYnV0IGluY3VycyBhbm90aGVyIGFsbG9jYXRp
b24gYXMKcHJldmlvdXNseSBzbyBJJ20gcGVyc29uYWxseSBpbiBmYXZvdXIgb2YgdGhpbmdzIGFz
IHdyaXR0ZW4uCmZwZ2FfbWdyX2J1Zl9sb2FkIGlzIGFub3RoZXIgZnVuY3Rpb24gd2hpY2ggcm91
Z2hseSBkb2VzIHRoZSBzYW1lIHNvcnQKb2Ygb3BlcmF0aW9uIGFuZCBpdCdzIGEgYml0IGxvbmdl
ci4KCkknbGwgcG9zdCBhIHYyIHNob3J0bHksIGJ1dCBpZiB5b3UgdGhpbmsgaXQncyB3b3J0aCBt
YWtpbmcgdGhlIGV4dHJhCmFsbG9jYXRpb24gb2YgdGhlIHBhZ2VzIGFycmF5IHRvIHVzZSwgSSBj
YW4gcG9zdCB0aGF0IGluc3RlYWQuCgo+IGNoZWVycywKPiAgIEdlcmQKPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
