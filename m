Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 248AA4ECAB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 17:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A6E6E8E3;
	Fri, 21 Jun 2019 15:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEB06E8E3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 15:57:46 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k8so10773026eds.7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 08:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=JkRze46CsZJ76L12gVJImUOwO8IXZ3hXazTL+K65a1A=;
 b=JBIhCcFk1Cd5QY7mU3cicU4jc7hmoeHbGDLGvVpJjVi0POTgrm5CBhMCQqAozR+ETP
 tDEhjgNcyWe0XDrrZl10bMinJwgaU9GywxsxcDWIKc8eLMnB29RrzobVpdMXhIh+wPD1
 DjojOJ6T1QjzJFlOzYNqIaAUYE8Jdtxg6c2f/zWlm4P4TOCW7+7eUmN+SYFExgPR9fNS
 rqLqwRWFAa7mi8EvMLiTL+DyT0Ao/S1Hy/6Z5+kgkft/MTJJjhZfwEGeSQspNpJHgZa+
 0S5sxrcFLmpwyvGVHVZrgOnMw7A9IM3xGlbkVX/gnpzcrB6JPaRWKWNe8VcQ1LnBGuR1
 S+aw==
X-Gm-Message-State: APjAAAUssy2CZhzI2/Awi/X1USci+uSHGI9MurtKTwxqRbs3b14ObTdF
 C4x28UJshKcM3kVcnuxohJ0h9A==
X-Google-Smtp-Source: APXvYqys6Yyc7jl3t1P2KeCaVO94UGvbTjVYxcckgeETG+8h6MDXXQ9wUcLJJtdCngH5zG488j9w+A==
X-Received: by 2002:a50:b0e3:: with SMTP id j90mr28451594edd.26.1561132665006; 
 Fri, 21 Jun 2019 08:57:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id d44sm953340eda.75.2019.06.21.08.57.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 08:57:44 -0700 (PDT)
Date: Fri, 21 Jun 2019 17:57:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas@shipmail.org>
Subject: Re: [PATCH v2 00/18] drm/ttm: make ttm bo a gem bo subclass
Message-ID: <20190621155737.GH12905@phenom.ffwll.local>
References: <20190621115755.8481-1-kraxel@redhat.com>
 <8e022cff-604c-457a-7b85-c1233ac3a2fe@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e022cff-604c-457a-7b85-c1233ac3a2fe@shipmail.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=JkRze46CsZJ76L12gVJImUOwO8IXZ3hXazTL+K65a1A=;
 b=Y/aBPt8NnNKd0vSWz7xtf/6dizz46F+afZccdUXopUD3YD7AV/iqyheaabiv5jVBGS
 N0nncHwOEL386ztXKfTt5Cn8mqpjVIY3gsRWlUJh6G3dGclZw+RNGwSvf258ku3Y/0E+
 iWQg5gch0k0REJ8N/YRyv3laQ777CW/P2Mm8o=
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
Cc: ckoenig.leichtzumerken@gmail.com, Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMDU6MTI6MTlQTSArMDIwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKFZNd2FyZSkgd3JvdGU6Cj4gCj4gCj4gT24gNi8yMS8xOSAxOjU3IFBNLCBHZXJkIEhvZmZt
YW5uIHdyb3RlOgo+IAo+IEFhcmdoLiBQbGVhc2UgZG9uJ3QgZG8gdGhpcy4gTXVsdGlwbGUgcmVh
c29uczoKPiAKPiAxKSBJIHRoaW5rIEl0J3MgYmFkIHRvIGR1bXAgYWxsIGJ1ZmZlciBvYmplY3Qg
ZnVuY3Rpb25hbGl0eSB3ZSBjYW4gcG9zc2libHkKPiB0aGluayBvZiBpbiBhIHNpbmdsZSBzdHJ1
Y3QgYW5kIGZvcmNlIHRoYXQgb24gYWxsICh3ZWxsIGF0IGxlYXN0IG1vc3QpCj4gdXNlcnMuIEl0
J3MgYmV0dGVyIHRvIGlzb2xhdGUgZnVuY3Rpb25hbGl0eSBpbiBzdHJ1Y3RzLCBoYXZlIHV0aWxp
dHkKPiBmdW5jdGlvbnMgZm9yIHRob3NlIGFuZCBsZXQgdGhlIGRyaXZlcnMgZGVyaXZlIHRoZWly
IGJ1ZmZlciBvYmplY3RzIGZyb20KPiB3aGF0ZXZlciBmdW5jdGlvbmFsaXR5IHRoZXkgYWN0dWFs
bHkgbmVlZC4KPiAyKSB2bXdnZnggaXMgbm90IHVzaW5nIGdlbSBhbmQgd2UgZG9uJ3Qgd2FudCB0
byBjYXJyeSB0aGF0IGV4dHJhIHBheWxvYWQgaW4KPiB0aGUgYnVmZmVyIG9iamVjdC4KPiAzKSBU
VE0gaGlzdG9yaWNhbGx5IGhhc24ndCBiZWVuIHVzaW5nIHRoZSB2YXJpb3VzIGRybSBsYXllcnMg
ZXhjZXB0IGZvcgo+IGxhdGVyIHdoZW4gY29tbW9uIGhlbHBlcnMgaGF2ZSBiZWVuIHVzZWQsIChs
aWtlIHRoZSB2bWEgbWFuYWdlciBhbmQgdGhlCj4gY2FjaGUgdXRpbGl0aWVzKS4gSXQncyBkZXNp
cmFibGUgdG8ga2VlcCB0aGF0IGxheWVyIGRpc3RpbmN0aW9uLiAod2hpY2ggaXMKPiByZWFsbHkg
d2hhdCBJJ20gc2F5aW5nIGluIDEuKQo+IAo+IE5vdyBpZiBtb3JlIGFuZCBtb3JlIGZ1bmN0aW9u
YWxpdHkgdGhhdCBvcmlnaW5hdGVkIGluIFRUTSBpcyBtb3ZpbmcgaW50byBHRU0KPiB3ZSBuZWVk
IHRvIGZpbmQgYSBiZXR0ZXIgd2F5IHRvIGRvIHRoYXQgd2l0aG91dCBkdXBsaWNhdGluZyBmdW5j
dGlvbmFsaXR5LiBJCj4gc3VnZ2VzdCBhZGRpbmcgcG9pbnRlcnMgaW4gdGhlIFRUTSBzdHJ1Y3Rz
IGFuZCBkZWZhdWx0aW5nIHRob3NlIHBvaW50ZXJzIHRvCj4gdGhlIG1lbWJlciBpbiB0aGUgVFRN
IHN0cnVjdC4gT3B0aW9uYWxseSB0byB0byB0aGUgbWVtYmVyIGluIHRoZSBHRU0gc3RydWN0Lgo+
IElmIHdlIG5lZWQgdG8gbWlncmF0ZSB0aG9zZSBtZW1iZXJzIG91dCBvZiB0aGUgVFRNIHN0cnVj
dCwgdm13Z2Z4IHdvdWxkIGhhdmUKPiB0byBwcm92aWRlIHRoZW0gaW4gaXRzIG93biBidWZmZXIg
Y2xhc3MuCj4gCj4gTkFLIGZyb20gdGhlIHZtd2dmeCBzaWRlLgoKSXQncyA1OSBEUklWRVJfR0VN
IHZzIDEgd2hpY2ggaXMgbm90LiBJIHRoaW5rIHRoZSB2ZXJkaWN0IGlzIGNsZWFyIHdoYXQKdGhl
IHJlYXNvbmFibGUgdGhpbmcgdG8gZG8gaXMgaGVyZSwgYW5kIHRoaXMgd2lsbCBhbGxvdyB1cyB0
bwpzdWJzdGFudGlhbGx5IGltcHJvdmUgY29kZSBhbmQgY29uY2VwdCBzaGFyaW5nIGFjcm9zcyBk
cm0gZHJpdmVycy4KCjEwIHllYXJzIGFnbyBpdCB3YXMgaW5kZWVkIG5vdCBjbGVhciB3aGV0aGVy
IGV2ZXJ5b25lIGRvaW5nIHRoZSBzYW1lIGlzIGEKYnJpZ2h0IGlkZWEsIGJ1dCB0aGF0J3Mgbm8g
bW9yZS4gSWYgeW91IHdhbnQgSSBndWVzcyB5b3UgY2FuIGtlZXAgYQpwcml2YXRlIGNvcHkgb2Yg
dHRtIGluIHZtd2dmeCwgYnV0IG5vdCBzdXJlIHRoYXQncyByZWFsbHkgd29ydGggaXQKbG9uZy10
ZXJtLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
