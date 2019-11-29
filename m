Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F810DA6D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 21:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E5D6E970;
	Fri, 29 Nov 2019 20:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B3B6E970
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 20:07:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p9so267488wmc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 12:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fGUxfHWifQKWfd7lhEhXsro+4xySkC5/5k8k7RLW60s=;
 b=ugUN3ixBqaIOcPWqXJZE2atocnlGIj+xWtKjJOKxxBHzn+NbOdrQJ4oiFoC5+ENCPd
 zvoZN4D6mE8gCP2HdbIoEsNT1U5tIC1XdGCyp3rV3aeceZ8NTrdI6i870Xy8ShJkpqCe
 6UeSpkibkHZ2wGEtPaxujH2Q9jI2ZKuhntOy8n7GU5khQxBNwAGmn+6ZbMXm8P73evra
 bDEwe/OQpMw7D863S8hQzvPH4c2tVE8YtIB1A3SVfIv4uVDU0T4yiFishbYegXc+90Ho
 xu0kXjaicNqFBlnWV1QanuMq8lz49x7fVj/SUW5up3GyJEAIjEyfHByDF4FBZBonMZUd
 GZrA==
X-Gm-Message-State: APjAAAU0kFQ0Y2kjBy1uXjY2eXmRfrlcIkuZuLxxp8hUqBdYgouPAcps
 o4v/A4wrjKZ3a+cEYyNAStq6caPEeJA=
X-Google-Smtp-Source: APXvYqyPjdGpaQpUCdcjZzbGPsNTm4l1FlBP5fcGPk8zEHVqlZE9Xs9bKG3w5NTMN6h3qnct69yvsQ==
X-Received: by 2002:a1c:a906:: with SMTP id s6mr16931349wme.125.1575058056177; 
 Fri, 29 Nov 2019 12:07:36 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id k8sm6431399wrl.3.2019.11.29.12.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 12:07:35 -0800 (PST)
Date: Fri, 29 Nov 2019 21:07:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 2/8] drm/panfrost: Fix a race in panfrost_ioctl_madvise()
Message-ID: <20191129200733.GQ624164@phenom.ffwll.local>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-3-boris.brezillon@collabora.com>
 <dd8a946c-5666-a7b8-f7bc-06647e0d0bbc@arm.com>
 <20191129153310.2f9c80e1@collabora.com>
 <b159591d-1dd4-1ac7-e924-c02be1d8b1f3@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b159591d-1dd4-1ac7-e924-c02be1d8b1f3@arm.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fGUxfHWifQKWfd7lhEhXsro+4xySkC5/5k8k7RLW60s=;
 b=XJoWJ10+eDXtobkg01prbR7FDcbY+AQMM3Pg0Xh2IR59KB9ytIvzZgBIsG0g2v6Adc
 iXxY2C7J65E78R3b6gwSbg2GuaagdfE7yt1cBLmsRv384pbbFv+XClJCNOyPmjLKaNg2
 rSOeS53iiudcRZ2j5r3KGWX7+ocgbegBDOlrs=
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
Cc: stable@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDI6NDA6MzRQTSArMDAwMCwgU3RldmVuIFByaWNlIHdy
b3RlOgo+IE9uIDI5LzExLzIwMTkgMTQ6MzMsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiA+IE9u
IEZyaSwgMjkgTm92IDIwMTkgMTQ6MjQ6NDggKzAwMDAKPiA+IFN0ZXZlbiBQcmljZSA8c3RldmVu
LnByaWNlQGFybS5jb20+IHdyb3RlOgo+ID4gCj4gPj4gT24gMjkvMTEvMjAxOSAxMzo1OSwgQm9y
aXMgQnJlemlsbG9uIHdyb3RlOgo+ID4+PiBJZiAyIHRocmVhZHMgY2hhbmdlIHRoZSBNQURWSVNF
IHByb3BlcnR5IG9mIHRoZSBzYW1lIEJPIGluIHBhcmFsbGVsIHdlCj4gPj4+IG1pZ2h0IGVuZCB1
cCB3aXRoIGFuIHNobWVtLT5tYWR2IHZhbHVlIHRoYXQncyBpbmNvbnNpc3RlbnQgd2l0aCB0aGUK
PiA+Pj4gcHJlc2VuY2Ugb2YgdGhlIEJPIGluIHRoZSBzaHJpbmtlciBsaXN0LiAgCj4gPj4KPiA+
PiBJJ20gYSBiaXQgd29ycmllZCBmcm9tIHRoZSBwb2ludCBvZiB2aWV3IG9mIHVzZXIgc3BhY2Ug
c2FuaXR5IHRoYXQgeW91Cj4gPj4gb2JzZXJ2ZWQgdGhpcyAtIGJ1dCBjbGVhcmx5IHRoZSBrZXJu
ZWwgc2hvdWxkIGJlIHJvYnVzdCEKPiA+IAo+ID4gSXQncyBub3Qgc29tZXRoaW5nIEkgb2JzZXJ2
ZWQsIGp1c3QgZm91bmQgdGhlIHJhY2UgYnkgaW5zcGVjdGluZyB0aGUKPiA+IGNvZGUsIGFuZCBJ
IHRob3VnaHQgaXQgd2FzIHdvcnRoIGZpeGluZyBpdC4KPiAKPiBHb29kISA7KSBZb3VyIGNvdmVy
IGxldHRlciByZWZlcnJpbmcgdG8gYSAiZGVidWcgc2Vzc2lvbiIgbWFkZSBtZSB0aGluawo+IHlv
dSdkIGFjdHVhbGx5IGhpdCBhbGwgdGhlc2UuCgpUaW1lIGZvciBzb21lIGlndCB0byBtYWtlIHN1
cmUgdGhpcyBpcyBhY3R1YWxseSBjb3JyZWN0PwotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
