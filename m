Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C968B7057F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 18:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D06489CDF;
	Mon, 22 Jul 2019 16:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB1D887DE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:33:39 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB27E21993
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:33:38 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id x22so34201327qtp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 09:33:38 -0700 (PDT)
X-Gm-Message-State: APjAAAUDjgsh2E75RTyThMXNXSjjWhoMDvKDT4IJeeUkRUxfSJUNZc6o
 QEZ8v/AW+Y1B4cOtFFb/W705vQODxAw2TD161A==
X-Google-Smtp-Source: APXvYqyPz99nNnUcuCibamsFCq14ccGv09joFfzzuqq5rS90X/Vl4ixVNnhtsAvYglaNudu4p5ZsbGu4PEgqMwS0sag=
X-Received: by 2002:a0c:acef:: with SMTP id n44mr52477039qvc.39.1563813218097; 
 Mon, 22 Jul 2019 09:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190717183352.22519-1-robh@kernel.org>
 <20190717183352.22519-4-robh@kernel.org>
 <20190722141536.GF2156@rosenzweig.io>
In-Reply-To: <20190722141536.GF2156@rosenzweig.io>
From: Rob Herring <robh@kernel.org>
Date: Mon, 22 Jul 2019 10:33:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKA6xzhhsdY9sD6qnhi=C4eEDwpJMVXCvhTrcOY2NAAyQ@mail.gmail.com>
Message-ID: <CAL_JsqKA6xzhhsdY9sD6qnhi=C4eEDwpJMVXCvhTrcOY2NAAyQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/panfrost: Add support for GPU heap allocations
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563813219;
 bh=9U9UANDpmPxJQP8Dp1KZHeNy0Uu1EzHsP/oI6TqeqgE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zsHLmXket8wNLZHnxpu31PxlxMNLteCzw2j0LF04cZKPktAsUksaWnqrRrKAQhCNv
 Nkbf7WZlK6BO6X1MBvvXDtniN317yHCr8DtQOHlbBgJnrdi04zN9F47pI3/mVH6IjO
 GPl74fGLg5tqRMl2eYopctNkeWcuGdzpp0dH+Oro=
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgODoxNSBBTSBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3Nh
QHJvc2VuendlaWcuaW8+IHdyb3RlOgo+Cj4gPiAgI2RlZmluZSBQQU5GUk9TVF9CT19OT0VYRUMg
ICAxCj4gPiArI2RlZmluZSBQQU5GUk9TVF9CT19IRUFQICAgICAyCj4KPiBCaWtlc2hlZGRpbmcs
IGJ1dCBJIGRvbid0IGxpa2UgdGhpcyBuYW1lLiBUaGVyZSBhcmUsIEkgdGhpbmssIG11bHRpcGxl
Cj4gR1BVLW1hcHBlZCBidWZmZXJzIChhdCBsZWFzdCBpbiBQYW5mcm9zdCAtLSBJIGRvbid0IGtu
b3cgaG93IHRoZSBibG9iCj4gbWFuYWdlcyBtZW1vcnkpIHRoYXQgY2FuIGJlIGNvbnNpZGVyZWQg
aGVhcHMgb2Ygc29ydHMuIFNvbWUgb2YgdGhvc2UgYXJlCj4ganVzdCByZWd1bGFyIG9sZCBCT3Mu
CgpXZWxsLCBJIGhhZCAnbm9tYXAnIHdoaWNoIHJlZmxlY3RlZCBleGFjdGx5IHdoYXQgdGhlIGtl
cm5lbCB3b3VsZCBkbwp0byB0aGUgQk8gYW5kIHNvbWUgZm9sa3MgZGlkbid0IGxpa2UgdGhhdCBl
aXRoZXIuIEdyYW50ZWQsIGV4YWN0bHkKd2hhdCBpcyBub3QgbWFwcGVkIHdhc24ndCB0aGF0IGNs
ZWFyLgoKSXQncyByZWFsbHkgYSBxdWVzdGlvbiBvZiBnaXZlIHVzZXJzcGFjZSBleGFjdGx5IHdo
YXQgaXQgYXNrcyBmb3Igb3IKdGVsbCB0aGUga2VybmVsIGhvdyB0aGUgQk8gaXMgZ29pbmcgdG8g
YmUgdXNlZCBhbmQgaXQgd2lsbCBkZWNpZGUgdGhlCmRldGFpbHMgKHdoaWNoIGNvdWxkIGNoYW5n
ZSkuIEl0J3Mgc2ltaWxhciB0byBhc2tpbmcgZm9yIGEgbGluZWFyCmJ1ZmZlciB2cy4gc2Nhbm91
dCBidWZmZXIuCgo+IFdoYXQgbWFrZXMgdGhlc2Ugc3BlY2lhbCBpcyB0aGF0IHRoZXkncmUgZ3Jv
d2FibGUuIENhbGxpbmcgaXQgImhlYXAiIGlzCj4gb2theSBpbnNpZGUgdGhlIGtlcm5lbCwgYnV0
IGZvciB0aGUgVUFCSSwgSSdkIHByZWZlciBhbiBleHBsaWNpdAo+ICJQQU5GUk9TVF9CT19HUk9X
QUJMRShfSEVBUCkiIHRvIG1ha2UgaXQgb2J2aW91cyB3aGF0J3MgZ29pbmcgb24uCgpJTU8sICdn
cm93YWJsZScgbWVhbnMgdGhlIEJPIGlzIG9uZSBzaXplIGFuZCB0aGVuIGdyb3dzIHRvIGEgbmV3
IHNpemUuCkJ1dCB3ZSdyZSBub3QgcmVzaXppbmcgdGhlIEJPLCBidXQgcmF0aGVyIGp1c3QgZGVs
YXlpbmcgdGhlIEdQVQptYXBwaW5nIGFuZCBzcGFyc2VseSBtYXBwaW5nIGl0LgoKUm9iCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
