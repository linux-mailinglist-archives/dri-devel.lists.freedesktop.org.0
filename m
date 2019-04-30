Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D7FB67
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 16:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4D289150;
	Tue, 30 Apr 2019 14:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DAA89150
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 14:26:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c12so21252663wrt.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 07:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=0RTtDLBJ7Syo0j9BFRTapKi0+0OHC5jSD2Valhu5/Uk=;
 b=SzyWzHQznWuZSYPv1ssjvsnI9SmIV7DylfVeMm5PNTGtlcloYDu8FSjfnEr12v7tsT
 5dVP0lPeKNyT/IjsEdzkcWp33GSrYL6MlIKncKTewlx3nH9VvNpJKG7Vh/WHcAF+x7it
 CQbhBX6+JD83GNOfgGSE5KsnFGElFoG6R2C8JR5Z7j2XG5ZroWlMk7Cz/ftEF6ZdqZ/p
 m+q4+CPiEpCOGfMZFT4oFFcRJWhU8YLIusMGB0P/py114sznlSNDwh0e5cqDVei6THOz
 UFEZ+vsapmScxf19DCqsXyjMNqDnv0w/LpepPLHizNshG/gwNsfGA3tRuRoQsYNUd4VA
 3M2Q==
X-Gm-Message-State: APjAAAXqGodq1ATaWGNkvEeS1YX8dN+qIjlZNUW5IyuhgKCA10IszUwL
 1SGyqZQ57WlR89l+oEar5chytGBq
X-Google-Smtp-Source: APXvYqyLortReoOc8JbzpC1rtLt46f4pJAMd08BLCi+jkiVZ8qHMtFVcJhPVD7wfU1O4KMT7dS5EQA==
X-Received: by 2002:adf:f5d0:: with SMTP id k16mr4471919wrp.253.1556634394498; 
 Tue, 30 Apr 2019 07:26:34 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id u11sm3370266wrg.35.2019.04.30.07.26.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 07:26:33 -0700 (PDT)
Subject: Re: [PATCH 02/12] dma-buf: add explicit buffer pinning v2
To: Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com
References: <20190426123638.40221-1-christian.koenig@amd.com>
 <20190426123638.40221-2-christian.koenig@amd.com>
 <20190429084048.GL3271@phenom.ffwll.local>
 <edefefff-de3b-4c46-c920-613bb412216f@gmail.com>
 <20190430135937.GS3271@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a30d0d85-e8c7-4765-9fbb-27712e9e48ae@gmail.com>
Date: Tue, 30 Apr 2019 16:26:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430135937.GS3271@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0RTtDLBJ7Syo0j9BFRTapKi0+0OHC5jSD2Valhu5/Uk=;
 b=lD+zg3m2NK1G5D5kXUA6dx9ntIO0BkAn0vN4LP0GlsC3HKtm/Y0DwWOVILiKK3zDPh
 1PyA4roNiCFCpViHZDFwK9jNwMmJeDVuKUIBGrNuvDcQYMbsrkK3RQ3tH7DyIedpfeIp
 KG7Qx+uQkCzhUoDLVRlFTKuTOgInif23hSWXurbLWVhhbe776UqwfKjEv08Lj+f8UGwZ
 Ru2sRB76zAcnxesXynGuilK3n85slMihVmwBn7Rst1Ti1fMU0BZVABouX+AinOEwc6L6
 UF7XxE5pZ09CYE2S/fS4zF7SA6/4xf2DRkRbYZIoIZNcnrxmHeZn1OB3ybzVU+TrFSna
 fMfQ==
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
Reply-To: christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDQuMTkgdW0gMTU6NTkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgQXBy
IDMwLCAyMDE5IGF0IDAzOjQyOjIyUE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDI5LjA0LjE5IHVtIDEwOjQwIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IE9uIEZyaSwg
QXByIDI2LCAyMDE5IGF0IDAyOjM2OjI4UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
Cj4+Pj4gW1NOSVBdCj4+Pj4gKy8qKgo+Pj4+ICsgKiBkbWFfYnVmX3BpbiAtIExvY2sgZG93biB0
aGUgRE1BLWJ1Zgo+Pj4+ICsgKgo+Pj4+ICsgKiBAZG1hYnVmOglbaW5dCURNQS1idWYgdG8gbG9j
ayBkb3duLgo+Pj4+ICsgKgo+Pj4+ICsgKiBSZXR1cm5zOgo+Pj4+ICsgKiAwIG9uIHN1Y2Nlc3Ms
IG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KPj4+PiArICovCj4+Pj4gK2ludCBkbWFf
YnVmX3BpbihzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmKQo+Pj4gSSB0aGluayB0aGlzIHNob3VsZCBi
ZSBvbiB0aGUgYXR0YWNobWVudCwgbm90IG9uIHRoZSBidWZmZXIuIE9yIGlzIHRoZQo+Pj4gaWRl
YSB0aGF0IGEgcGluIGlzIGZvciB0aGUgZW50aXJlIGJ1ZmZlciwgYW5kIGFsbCBzdWJzZXF1ZW50
Cj4+PiBkbWFfYnVmX21hcF9hdHRhY2htZW50IG11c3Qgd29yayBmb3IgYWxsIGF0dGFjaG1lbnRz
PyBJIHRoaW5rIHRoaXMgbWF0dGVycwo+Pj4gZm9yIHN1ZmZpY2llbnRseSBjb250cml2ZWQgcDJw
IHNjZW5hcmlvcy4KPj4gVGhpcyBpcyBpbmRlZWQgZm9yIHRoZSBETUEtYnVmLCBjYXVzZSB3ZSBh
cmUgcGlubmluZyB0aGUgdW5kZXJseWluZyBiYWNraW5nCj4+IHN0b3JlIGFuZCBub3QganVzdCBv
bmUgYXR0YWNobWVudC4KPiBZb3UgY2FuJ3QgbW92ZSB0aGUgYnVmZmVyIGVpdGhlciB3YXksIHNv
IGZyb20gdGhhdCBwb2ludCB0aGVyZSdzIG5vCj4gZGlmZmVyZW5jZS4gSSBtb3JlIG1lYW50IGZy
b20gYW4gYWNjb3VudC9hcGkgcG9pbnQgb2YgdmlldyBvZiB3aGV0aGVyIGl0J3MKPiBvayB0byBw
aW4gYSBidWZmZXIgeW91IGhhdmVuJ3QgZXZlbiBhdHRhY2hlZCB0byB5ZXQuIEZyb20gdGhlIGNv
ZGUgaXQKPiBzZWVtcyBsaWtlIGZpcnN0IHlvdSBhbHdheXMgd2FudCB0byBhdHRhY2gsIGhlbmNl
IGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8KPiBwdXQgdGhlIHBpbi91bnBpbiBvbnRvIHRoZSBhdHRh
Y2htZW50LiBUaGF0IG1pZ2h0IGFsc28gaGVscCB3aXRoCj4gZGVidWdnaW5nLCB3ZSBjb3VsZCBj
aGVjayB3aGV0aGVyIGV2ZXJ5b25lIGJhbGFuY2VzIHRoZWlyIHBpbi91bnBpbgo+IGNvcnJlY3Rs
eSAoaW5zdGVhZCBvZiBqdXN0IGNvdW50aW5nIGZvciB0aGUgb3ZlcmFsbCBkbWEtYnVmKS4KPgo+
IFRoZXJlJ3MgYWxzbyBhIHNsaWdodCBzZW1hbnRpYyBkaWZmZXJlbmNlIGJldHdlZW4gYSBwaW4g
b24gYW4gYXR0YWNobWVudAo+ICh3aGljaCB3b3VsZCBtZWFuIHRoaXMgYXR0YWNobWVudCBpcyBh
bHdheXMgZ29pbmcgdG8gYmUgbWFwcGFibGUgYW5kIHdvbnQKPiBtb3ZlIGFyb3VuZCksIHdoZXJl
YXMgYSBwaW4gb24gdGhlIGVudGlyZSBkbWEtYnVmIG1lYW5zIHRoZSBlbnRpcmUgZG1hLWJ1Zgo+
IGFuZCBhbGwgaXQncyBhdHRhY2htZW50IG11c3QgYWx3YXlzIGJlIG1hcHBhYmxlLiBPdG9oLCBn
bG9iYWwgcGluIGlzCj4gcHJvYmFibHkgZWFzaWVyLCB5b3UganVzdCBuZWVkIHRvIGNoZWNrIGFs
bCBjdXJyZW50IGF0dGFjaG1lbnRzIGFnYWluCj4gd2hldGhlciB0aGV5IHN0aWxsIHdvcmsgb3Ig
d2hldGhlciB5b3UgbWlnaHQgbmVlZCB0byBtb3ZlIHRoZSBidWZmZXIKPiBhcm91bmQgdG8gYSBt
b3JlIHN1aXRhYmxlIHBsYWNlIChlLmcuIGlmIHlvdSBub3QgYWxsIGNhbiBkbyBwMnAgaXQgbmVl
ZHMKPiB0byBnbyBpbnRvIHN5c3RlbSByYW0gYmVmb3JlIGl0J3MgcGlubmVkKS4KPgo+IEZvciB0
aGUgYmFja2luZyBzdG9yYWdlIHlvdSBvbmx5IHdhbnQgb25lIHBlci1ibyAtPnBpbm5lZF9jb3Vu
dCwgdGhhdCdzCj4gY2xlYXIsIG15IHN1Z2dlc3Rpb24gd2FzIG1vcmUgYWJvdXQgd2hldGhlciBo
YXZpbmcgbW9yZSBpbmZvcm1hdGlvbiBhYm91dAo+IHdobydzIHBpbm5pbmcgaXMgdXNlZnVsLiBF
eHBvcnRlcnMgY2FuIGFsd2F5cyBqdXN0IGlnbm9yZSB0aGF0IGFkZGVkCj4gaW5mb3JtYXRpb24u
Cj4KPj4gS2V5IHBvaW50IGlzIEkgd2FudCB0byBjYWxsIHRoaXMgaW4gdGhlIGV4cG9ydGVyIGl0
c2VsZiBpbiB0aGUgbG9uZyBydW4uCj4+IEUuZy4gdGhhdCB0aGUgZXhwb3J0ZXIgc3RvcHMgd29y
a2luZyB3aXRoIGl0cyBpbnRlcm5hbCBzcGVjaWFsIGhhbmRsaW5nCj4+IGZ1bmN0aW9ucyBhbmQg
dXNlcyB0aGlzIG9uZSBpbnN0ZWFkLgo+IEhtLCBub3QgZXhhY3RseSBmb2xsb3dpbmcgd2h5IHRo
ZSBleHBvcnRlciBuZWVkcyB0byBjYWxsCj4gZG1hX2J1Zl9waW4vdW5waW4sIGluc3RlYWQgb2Yg
d2hhdGV2ZXIgaXMgdXNlZCB0byBpbXBsZW1lbnQgdGhhdC4gT3IgZG8KPiB5b3UgbWVhbiB0aGF0
IHlvdSB3YW50IGEgLT5waW5uZWRfY291bnQgaW4gZG1hX2J1ZiBpdHNlbGYsIHNvIHRoYXQgdGhl
cmUncwo+IG9ubHkgb25lIGJvb2sta2VlcGluZyBmb3IgdGhpcz8KClllcywgZXhhY3RseSB0aGF0
IGlzIG9uZSBvZiB0aGUgZmluYWwgZ29hbHMgb2YgdGhpcy4KCldlIGNvdWxkIG9mIGNvdXJzZSB1
c2UgdGhlIGF0dGFjaG1lbnQgaGVyZSwgYnV0IHRoYXQgd291bGQgZGlzcXVhbGlmeSAKdGhlIGV4
cG9ydGVyIGNhbGxpbmcgdGhpcyBkaXJlY3RseSB3aXRob3V0IGFuIGF0dGFjaG1lbnQuCgpSZWdh
cmRzLApDaHJpc3RpYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
