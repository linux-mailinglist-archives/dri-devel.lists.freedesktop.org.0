Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EEB4A0A5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 14:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6C06E158;
	Tue, 18 Jun 2019 12:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E956E158
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 12:19:54 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id r12so19235581edo.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 05:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=+daw23WN3TUotQBOQHpMnsyjHeH1Hzvsz4/guo1+aDU=;
 b=XPvy7++e8B9veZ71uKn+OsT8j+ZUp5ej1dnCmHTNRt7HO/KcdXHYgOTXYmpqNyh2ya
 bxTdgI6TWiQ4APdijbDPBG5Kmc73GceDNX72ava6OJr+Pvn0fhBRKVdgUgSAQhh/f/mr
 De7T+2JpdJA6301w1tDO1CeRJAAqT+Ug4IF1+UQrEzTwE3PwXy2g0eFpB4yT6enpEMpD
 TrXPqGa0bGmYWnmNNLqn+h+uzaBpJr8O75HThzK2gBn/AIn2sWh3ml59xik9eMoMb1a+
 BRhDt6kE0isc9adEBbcXRSJ4O+1EpSSD3eHGLKrcbzEpeJD/4Gy6PBMdwxRuK3yNb3/V
 JNrQ==
X-Gm-Message-State: APjAAAXHrina8zcy4r9eYLjHO0c1RUiiecJT3JRFP2wC2tBogE2evweX
 p3myXaN3TWTnF04lJXgyQN8WpA==
X-Google-Smtp-Source: APXvYqyEldqfD2wJWkc+JhJNW9KoEw68FpXXYu9I1k6u4shlA3g/i1k98eDdIDFiX7kNZwIUfGkUzg==
X-Received: by 2002:a05:6402:1459:: with SMTP id
 d25mr10907671edx.235.1560860393525; 
 Tue, 18 Jun 2019 05:19:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b53sm4729495edd.45.2019.06.18.05.19.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 05:19:52 -0700 (PDT)
Date: Tue, 18 Jun 2019 14:19:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 1/4] drm/vmwgfx: Assign eviction priorities to resources
Message-ID: <20190618121950.GW12905@phenom.ffwll.local>
References: <20190618062442.14647-1-thomas@shipmail.org>
 <20190618105408.GB29642@arch-x1c3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618105408.GB29642@arch-x1c3>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=+daw23WN3TUotQBOQHpMnsyjHeH1Hzvsz4/guo1+aDU=;
 b=ijF8r6T8GJEY0v/nLlbDOlfmwHY/oaW3OqQKWORmMtScEj6wkBlDHManppVdQaqL6P
 9NrD8dKlLZUu8IoIraUKLqGeHXi/l2SghrhRRjtWNTyJz/TDWnXXD8v/1Nm5UYcPS8N8
 RfdpvdwYltT1lpDNTJg+7HCfNaa7o4VwAmaaE=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas@shipmail.org>,
 pv-drivers@vmware.com, dri-devel@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, Deepak Rawat <drawat@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTE6NTQ6MDhBTSArMDEwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IEhpIFRob21hcywKPiAKPiBPbiAyMDE5LzA2LzE4LCBUaG9tYXMgSGVsbHN0csO2bSAo
Vk13YXJlKSB3cm90ZToKPiA+IEZyb206IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13
YXJlLmNvbT4KPiA+IAo+ID4gVFRNIHByb3ZpZGVzIGEgbWVhbnMgdG8gYXNzaWduIGV2aWN0aW9u
IHByaW9yaXRpZXMgdG8gYnVmZmVyIG9iamVjdC4gVGhpcwo+ID4gbWVhbnMgdGhhdCBhbGwgYnVm
ZmVyIG9iamVjdHMgd2l0aCBhIGxvd2VyIHByaW9yaXR5IHdpbGwgYmUgZXZpY3RlZCBmaXJzdAo+
ID4gb24gbWVtb3J5IHByZXNzdXJlLgo+ID4gVXNlIHRoaXMgdG8gbWFrZSBzdXJlIHN1cmZhY2Vz
IGFuZCBpbiBwYXJ0aWN1bGFyIG5vbi1kaXJ0eSBzdXJmYWNlcyBhcmUKPiA+IGV2aWN0ZWQgZmly
c3QuIEV2aWN0aW5nIGluIHBhcnRpY3VsYXIgc2hhZGVycywgY290YWJsZXMgYW5kIGNvbnRleHRz
IGltcGx5Cj4gPiBhIHNpZ25pZmljYW50IHBlcmZvcm1hbmNlIGhpdCBvbiB2bXdnZngsIHNvIG1h
a2Ugc3VyZSB0aGVzZSByZXNvdXJjZXMgYXJlCj4gPiBldmljdGVkIGxhc3QuCj4gPiBTb21lIGJ1
ZmZlciBvYmplY3RzIGFyZSBzdWItYWxsb2NhdGVkIGluIHVzZXItc3BhY2Ugd2hpY2ggbWVhbnMg
d2UgY2FuIGhhdmUKPiA+IG1hbnkgcmVzb3VyY2VzIGF0dGFjaGVkIHRvIGEgc2luZ2xlIGJ1ZmZl
ciBvYmplY3Qgb3IgcmVzb3VyY2UuIEluIHRoYXQgY2FzZQo+ID4gdGhlIGJ1ZmZlciBvYmplY3Qg
aXMgZ2l2ZW4gdGhlIGhpZ2hlc3QgcHJpb3JpdHkgb2YgdGhlIGF0dGFjaGVkIHJlc291cmNlcy4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdh
cmUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IERlZXBhayBSYXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+
Cj4gRndpdyBwYXRjaGVzIDEtMyBhcmU6Cj4gUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1p
bC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gCj4gUGF0Y2ggNCBpczoKPiBBY2tlZC1ieTogRW1p
bCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiAKPiBIdWdlIHRoYW5rcyBm
b3Igc29ydGluZyB0aGlzIG91dC4KCk9oLCBkb2VzIHRoaXMgbWVhbiB3ZSBjYW4gcmVtb3ZlIHRo
ZSB2YXJpb3MgbWFzdGVyKiBjYWxsYmFja3MgZnJvbQpkcm1fZHJpdmVyIG5vdz8gSWlyYyB2bXdn
Znggd2FzIHRoZSBvbmx5IHVzZXIsIGFuZCB0aG9zZSBjYWxsYmFja3Mgc2VlbQp2ZXJ5IHRlbXB0
aW5nIHRvIHZhcmlvdXMgZm9sa3MgZm9yIGltcGxlbWVudGluZyBxdWVzdGlvbmFibGUgZHJpdmVy
IGhhY2tzCi4uLiBIYXBweSB0byB0eXBlIHRoZSBwYXRjaGVzLCBidXQgbWF5YmUgc2ltcGxlciBp
ZiB5b3UgZG8gdGhhdCBzaW5jZSBhbGwKdGhpcyBnZXRzIG1lcmdlZCB0aHJvdWdoIHRoZSB2bXdn
ZnggdHJlZS4KCkNoZWVycywgRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2lu
ZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
