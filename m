Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D7D1009AE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 17:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545456E77F;
	Mon, 18 Nov 2019 16:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEFE6E69C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 16:49:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z10so20321753wrs.12
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 08:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bLawITr+nBvx8OsgInQsiYvZgNuNIh42p+GfFl+vOgg=;
 b=C9C8wbqx9MmJm/AHsjzY/jXOGo6wNAVrUqOEfCtreGiZt/AQlrWBXt7UyiG3+QmiQP
 J494lhpJDOPEpMj/ejqoIfG2HV2SvRNunV8PTWljduurJBbGi6yjDhR4FuP/tWsA6xhj
 U7D3QB9N49ZIkrbSS/fY4SbP9y5KFdVKTYopo06U/9iCui3Xq13W4VMu5UEXJN5fDVFz
 ZmUcw8RoPu1I5xECVdEsGW4eWrIkAZSCuRN4d9av+hJV34swDEB5a9V8OE+ZiI8hdQ+T
 JQ0ySfDZA6butAxfk+J+z8BiS2CAWHhhWkq1+pxU6o2fb3Pk13EbQiaGsN4l7zbdpUHT
 dC+Q==
X-Gm-Message-State: APjAAAU9AoSEU4yiZO2OqIW1lEHBSoWIL+nJtzxiMwuXjE60NajGWJXS
 z/cwQ0/h9pmhBXxeFaqLp3FMWQ==
X-Google-Smtp-Source: APXvYqzyaFlniaFhzqp9wvEh76gCYQcDrrn0zBbG+ql/WJErCuqisyPvCecKupZ5dcybLaNg2zNa2A==
X-Received: by 2002:a05:6000:18c:: with SMTP id
 p12mr3724312wrx.154.1574095769762; 
 Mon, 18 Nov 2019 08:49:29 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b17sm24040473wru.36.2019.11.18.08.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 08:49:28 -0800 (PST)
Date: Mon, 18 Nov 2019 17:49:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191118164927.GF23790@phenom.ffwll.local>
References: <20191112144435.GK23790@phenom.ffwll.local>
 <20191113073902.343vfunbjuzy725y@sirius.home.kraxel.org>
 <CAKMK7uF7G_H3ZvMpFkqKdGXc5H8P=vAtfoREksJJyysQmxOYzQ@mail.gmail.com>
 <20191113135145.itdsbojzrj5elzvu@sirius.home.kraxel.org>
 <20191113162729.GQ23790@phenom.ffwll.local>
 <20191115093738.kdi4qopah6hvntrb@sirius.home.kraxel.org>
 <CAKMK7uGq7-SpFrEXE2OJhnv66vxtJSifvSg4NUTFhLentQJ31w@mail.gmail.com>
 <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
 <CAKMK7uHNOF5pAWCbQ1-eFWcxEOZmOoKOYL450ZJd7TOeVhMvjw@mail.gmail.com>
 <20191118104026.zg5pt5yg2wkulmrr@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118104026.zg5pt5yg2wkulmrr@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bLawITr+nBvx8OsgInQsiYvZgNuNIh42p+GfFl+vOgg=;
 b=ex0gdqVpUXyPS6HdLgaA6gaZOF6KmqJ+7sKINgFuEQ52gpDRuC+VZdoZB3lgp3Cv0y
 f/22ya1UHrhesJZk9qwxCdKxHUpQZ3ucrIekfLSzFLDZV93b2cLYUIt5MKtZ7qOgkEUR
 o7NoAYDb9GjuiWt/Xuzh/BFQ/PKi0k/lmkNf4=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMTE6NDA6MjZBTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiAgIEhpLAo+IAo+ID4gPiA+ID4gSXMgYW55IG1vdmUgYnVmZmVyIGdvb2QgZW5vdWdo
IHRvIHRyaWdnZXIgdGhpcywgaS5lLiB3aWxsIFNZU1RFTSAtPiBWUkFNCj4gPiA+ID4gPiB3b3Jr
IHRvbz8gIFRoYXQnbGwgYmUgZWFzaWVyIGJlY2F1c2UgYWxsIEkgbmVlZCB0byBkbyBpcyBtYXAg
dGhlIGJ1ZmZlcgo+ID4gPiA+ID4gdG8gYSBjcnRjIHRvIGZvcmNlIHBpbm5pbmcgdG8gdnJhbSwg
dGhlbiBjaGVjayBpZiB0aGUgbWFwcGluZ3MgYXJlCj4gPiA+ID4gPiBpbnRhY3Qgc3RpbGwgLi4u
Cj4gPiA+ID4KPiA+ID4gPiBJIHRoaW5rIHRoYXQgc2hvdWxkIHdvcmsgdG9vLgo+ID4gPgo+ID4g
PiBTZWVtcyB0byB3b3JrIG9rIGZvciB0dG0vdnJhbS4KPiA+ID4KPiA+ID4gVGVzdCBjb2RlOgo+
ID4gPiAgIGh0dHBzOi8vZ2l0LmtyYXhlbC5vcmcvY2dpdC9kcm1pbmZvL2NvbW1pdC8/aWQ9YTll
Yjk2NTA0ZGMxNzM3NmUwN2I1YzZlZGY1Mjk2YjQxYTQ4YmJmZQo+ID4gCj4gPiBJIHRoaW5rIHRo
YXQncyBub3QgbmFzdHkgZW5vdWdoLiBJZiB0aGUgbWFwcGluZ3MgYXJlbid0IHVwZGF0ZWQsIHRo
ZW4KPiA+IHlvdSdsbCBzdGlsbCBzZWUgdGhlIHRoZSBzYW1lIG9sZCBwYWdlcyB3aXRoIHRoZSBy
aWdodCBjb250ZW50cy4gWW91Cj4gPiBuZWVkIHRvIGNoYW5nZSB0aGVtIHNvbWVob3cgYWZ0ZXIg
dGhleSBtaWdyYXRlZCAod2l0aCB2cmFtIGV2aWN0aW9uCj4gPiB0aGF0IGhhcHBlbnMgYXV0b21h
dGljYWxseSBzaW5jZSB0aGVyZSdsbCBiIGFub3RoZXIgb2JqZWN0IGluIHRoZSBzYW1lCj4gPiBz
cG90LCBmb3Igc3lzdGVtIG1lbW9yeSBJIHRoaW5rIHlvdSBuZWVkIHRoZSBzaHJpbmtlciB0byBr
aWNrIGluIGFuZAo+ID4gZnJlZSB0aGUgcGFnZXMgZmlyc3QpLiBFYXNpZXN0IHByb2JhYmx5IHRv
IHdhaXQgZm9yIGEga2V5IHByZXNzIHNvIHlvdQo+ID4gY2FuIGFwcHJlY2lhdGUgdGhlIGNvbG9y
LCB0aGVuIHdyaXRlIGEgZGlmZmVyZW50IGNvbG9yIChmdWxsIHNjcmVlbikKPiA+IHdoZW4gdGhl
IGJ1ZmZlciBpcyBpbiB2cmFtLgo+IAo+IHVwZGF0ZS1vYmplY3QtYWZ0ZXItbW92ZSB3b3JrcyBm
aW5lLgo+IAo+IHRyeSB6YXAgbWFwcGluZ3Mgd2l0aCBtYWR2aXNlKGRvbnRuZWVkKSBoYXMgbm8g
YmFkIGVmZmVjdHMgKGFmdGVyIHZyYW0KPiBtb3ZlLCB0cnlpbmcgdG8gZm9yY2UgcmUtY3JlYXRp
bmcgdGhlIHB0ZXMpLgoKV2VsbCBpZiBpdCdzIGJyb2tlbiB0aGUgemFwcGluZyB3b3VsZG4ndCB3
b3JrIDotKQoKPiBkaWRuJ3QgdHJ5IHRoZSBtZW1vcnkgcHJlc3N1cmUgdGhpbmcgeWV0LgoKSSdt
IHN1cnByaXNlZCAuLi4gYW5kIEkgaGF2ZSBubyBpZGVhIGhvdy93aHkgaXQga2VlcHMgd29ya2lu
Zy4KCkZvciBteSBwYXJhbm9pYSwgY2FuIHlvdSBpbnN0cnVtZW50IHRoZSB0dG0gcGFnZSBmYXVs
dCBoYW5kbGVyLCBhbmQgZG91YmxlCmNoZWNrIHRoYXQgd2UgZ2V0IG5ldyBmYXVsdHMgYWZ0ZXIg
dGhlIG1vdmUsIGFuZCBzZXQgdXAgbmV3IHB0ZXMgZm9yIHRoZQpzYW1lIG9sZCBtYXBwaW5nLCBi
dXQgbm93IHBvaW50aW5nIGF0IHRoZSBuZXcgcGxhY2UgaW4gdnJhbT8KCj4gPiBZb3UnZCBuZWVk
IHRvIGNoZWNrIHRoZSBwdGVzIHRoZW1zZWx2ZXMuIFdoaWNoIEkgdGhpbmsgbm90IGV2ZW4gcHJv
Ywo+ID4gc2hvd3MgYnkgZGVmYXVsdCAob25seSB0aGUgZmlsZSB0aGF0J3Mgc3VwcG9zZWQgdG8g
YmUgbWFwcGVkKS4gQnV0Cj4gPiBnb29kIHRvIGNvbmZpcm0gdGhhdCB0aGUgYnVmZmVyIG1vdmVk
IGF0IGxlYXN0Lgo+IAo+IE9uZSByZXByb2R1Y2FibGUgZ2xpdGNoIGZvdW5kOiAgZm9yaygpIHdo
aWxlIGhhdmluZyBhIGRtYS1idWYgbWFwcGVkCj4gdHJpZ2dlcnMgdGhlIFdBUk5fT04gaW4gdHRt
X2JvX3ZtX29wZW4oKS4gIEJvdGggb2xkICYgbmV3IG1tYXAgY29kZQo+IHBhdGhzLCBzbyB0aGlz
IGlzbid0IHNvbWV0aGluZyBuZXcgY29taW5nIGZyb20gdGhlCj4gZHJtX2dlbV9vYmplY3RfZnVu
Y3MubW1hcCBzd2l0Y2guICBJbnN0ZWFkIGl0IGlzIGFuIG9sZCBpc3N1ZSBjb21pbmcKPiBmcm9t
IHRoZSBhZGRyZXNzIHNwYWNlIGhhbmRsaW5nIGJlaW5nIGRpZmZlcmVudCBpbiBkcm0gbW1hcCBh
bmQgZG1hYnVmCj4gbW1hcCBjb2RlIHBhdGhzLgo+IAo+IEkgY2FuIHNlZSBub3cgd2h5IHlvdSB3
YW50IGEgcHJpdmF0ZSBhZGRyZXNzIHNwYWNlIGZvciBlYWNoIG9iamVjdC4KPiBEb2VzIHRoYXQg
aW1wbHkgd2UgbmVlZCBhbiBhbm9uX2lub2RlIGZvciBlYWNoIGdlbSBvYmplY3Q/ICBPciBpcwo+
IHRoZXJlIHNvbWUgbW9yZSBsaWdodHdlaWdodCB3YXkgdG8gZG8gdGhpcz8KCkkgaGF2ZSBubyBp
ZGVhIHdoZXRoZXIgd2UgY2FuIGdldCBhIGFkZHJlc3Nfc3BhY2Ugc3RydWN0IHdpdGhvdXQgYW4g
aW5vZGUKKGFuZCBubyBkaXNhc3RlcnMpLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
