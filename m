Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D396CE3283
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 14:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C186E3A4;
	Thu, 24 Oct 2019 12:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEEA6E3A4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 12:38:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w18so25365759wrt.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 05:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=DJ9YPx7+n1PCdyUhZ2dP1UoOL9smelF9iCjqcb3ACuQ=;
 b=TMRDZSY7+WX+Wac1TUvTM6dnoWFrPnC9Nq7nG2vxxqg3jgTFliCnGkV1j8cD0UK2Sf
 6qxqHQ2dQ5JzSS1yCbSHkKwVRir0v4eF7NjzTqWPS2QZypEKD548jr3SYV1axaYQQ4yi
 s3pWPeRs5DVDLPd2GE36YcrGY5zH4wsgsFNTh0UYuHAqPhG4JYIi8du+Glbn0N0lW46S
 xQfspfO9nhM6R52EI9yIUS1zbCROw8F+NARZSOgH7QxfUj6VO0znD2T25BkTulXZlXkr
 U9+NyfNQCk7T5M6YgzcdErOjcd72Q0iq0AgZlbdtY0m9hr34yWVsOYChgi/FMpuCC+SY
 aZfw==
X-Gm-Message-State: APjAAAV+oiPGw4jxgQcqpANSxkJj6wzQ5luQC1AgVsFA02PqctgKMCer
 2J2InZiVrKMYbMNYNt0YrPZQdA==
X-Google-Smtp-Source: APXvYqzJz9HtesuNFtknXFUbo5uGWFpCON0/JuQdLXmV+NUQ5T2p0OSvCdnTHV2dFr2Z4sMGd+CjlQ==
X-Received: by 2002:adf:d190:: with SMTP id v16mr3844066wrc.64.1571920735886; 
 Thu, 24 Oct 2019 05:38:55 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id l6sm2465278wmg.2.2019.10.24.05.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 05:38:54 -0700 (PDT)
Date: Thu, 24 Oct 2019 14:38:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/v3d: fix double free of bin
Message-ID: <20191024123853.GH11828@phenom.ffwll.local>
Mail-Followup-To: Colin King <colin.king@canonical.com>,
 Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 Navid Emamdoost <navid.emamdoost@gmail.com>,
 Iago Toral Quiroga <itoral@igalia.com>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20191024104801.3122-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024104801.3122-1-colin.king@canonical.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=DJ9YPx7+n1PCdyUhZ2dP1UoOL9smelF9iCjqcb3ACuQ=;
 b=OC7T25s1P6P+UU4+3mI+CNjv0Ku6/AuM5iNGxza+4kgK+zIgYufjMaQgvJdsHJ8Sr2
 MdDenmU891PzzJpPKN6NhBcOOlQEtUQXxu/FPHDFBBC9FQrCVtbsXgxBELTZ6F5XC/ax
 nMpELi2hZ20KJDv3LvlzfxBVWH0CHLXa1ta0A=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Iago Toral Quiroga <itoral@igalia.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMTE6NDg6MDFBTSArMDEwMCwgQ29saW4gS2luZyB3cm90
ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+
IFR3byBkaWZmZXJlbnQgZml4ZXMgaGF2ZSBhZGRyZXNzZWQgdGhlIHNhbWUgbWVtb3J5IGxlYWsg
b2YgYmluIGFuZAo+IHRoaXMgbm93IGNhdXNlcyBhIGRvdWJsZSBmcmVlIG9mIGJpbi4gIFdoaWxl
IHRoZSBpbmRpdmlkdWFsIG1lbW9yeQo+IGxlYWsgZml4ZXMgYXJlIGZpbmUsIGJvdGggZml4ZXMg
dG9nZXRoZXIgYXJlIHByb2JsZW1hdGljLgo+IAo+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJEb3Vi
bGUgZnJlZSIpCj4gRml4ZXM6IDI5Y2QxM2NmZDc2MiAoImRybS92M2Q6IEZpeCBtZW1vcnkgbGVh
ayBpbiB2M2Rfc3VibWl0X2NsX2lvY3RsIikKPiBGaXhlczogMGQzNTJhM2E4YTFmICgiIHJtL3Yz
ZDogZG9uJ3QgbGVhayBiaW4gam9iIGlmIHYzZF9qb2JfaW5pdCBmYWlscy4iKQo+IFNpZ25lZC1v
ZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+CgpUaGF0IHNv
dW5kcyBsaWtlIHdyb25nIG1lcmdlIHJlc29sdXRpb24gc29tZXdoZXJlLCBhbmQgd2UgZG9uJ3Qg
aGF2ZSB0aG9zZQpwYXRjaGVzIG1lcmdlZCB0b2dldGhlciBpbiBhbnkgZmluYWwgdHJlZSB5ZXQg
YW55d2hlcmUuIFdoYXQncyB0aGlzIGJhc2VkCm9uPwotRGFuaWVsCgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vdjNkL3YzZF9nZW0uYyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jCj4gaW5kZXggNTQ5ZGRlODM0MDhiLi4zNzUxNWU0
N2I0N2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2VtLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0uYwo+IEBAIC01NjgsNyArNTY4LDYgQEAgdjNk
X3N1Ym1pdF9jbF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ICAJ
CXJldCA9IHYzZF9qb2JfaW5pdCh2M2QsIGZpbGVfcHJpdiwgJmJpbi0+YmFzZSwKPiAgCQkJCSAg
IHYzZF9qb2JfZnJlZSwgYXJncy0+aW5fc3luY19iY2wpOwo+ICAJCWlmIChyZXQpIHsKPiAtCQkJ
a2ZyZWUoYmluKTsKPiAgCQkJdjNkX2pvYl9wdXQoJnJlbmRlci0+YmFzZSk7Cj4gIAkJCWtmcmVl
KGJpbik7Cj4gIAkJCXJldHVybiByZXQ7Cj4gLS0gCj4gMi4yMC4xCj4gCgotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
