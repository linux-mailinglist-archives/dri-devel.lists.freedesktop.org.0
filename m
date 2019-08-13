Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A4B8C16E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 21:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874B76E22B;
	Tue, 13 Aug 2019 19:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812EC6E21C;
 Tue, 13 Aug 2019 19:21:05 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t3so14049672ljj.12;
 Tue, 13 Aug 2019 12:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/cNvoPy2yR9koeTbAepG658vZPZC8lqmb3IEz7AVFkA=;
 b=rLD+IEFpv1EYiifFumtvM9vQo7yETMg9sPvhQZ99LlPQo1WP0lAGsFKx9NBtC0mYTm
 aK4tqRjIk1f425sIcOcqNNu+kpnTefh/vGfUsxdAmnLUwDSITRI4FB9kfqhVZ72UgZRT
 uFh0lu9J0Iq3kiY1vBW105/ZfmtWzZL7N+YJVIqYNIVOVl0Gbfe8QU2gI41Ja1v7MpP1
 C/gLcG8f0+GLHAclGi8dHDFR+XmxzlFKTkQryxhRDhQpZKxlL3Yck22JatMUHzoD/6i4
 BX8uegaV+LPrNO74R+CtCVRTYooZ8lihbAGTPkJyC5JLrO4gci/1NTijEjCisaOn6IEw
 kdmw==
X-Gm-Message-State: APjAAAX7G3frRlP2lw/2ergfT0S1YrQFQqGD4Iv00QY4iqjFB1uO9aYi
 5pp7RlNIvH/pqYIftZXSLdlZgYACL9i4BsMesc0wEw==
X-Google-Smtp-Source: APXvYqxX1SC+301AOVizqmFOI29rvlIU1JTB5xFtQ3MblcbsgVVETWXugMPbNgktI9/Kougkk1i8JY2hDFacWHlb6mc=
X-Received: by 2002:a2e:9c19:: with SMTP id s25mr22508616lji.188.1565724063617; 
 Tue, 13 Aug 2019 12:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190809222643.23142-1-matthew.auld@intel.com>
In-Reply-To: <20190809222643.23142-1-matthew.auld@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 14 Aug 2019 05:20:52 +1000
Message-ID: <CAPM=9tzCOmRNGKjJ1K+VUWLNK5kvJFRSqLABnGxafxgPWfTM5w@mail.gmail.com>
Subject: Re: [PATCH v3 00/37] Introduce memory region concept (including
 device local memory)
To: Matthew Auld <matthew.auld@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/cNvoPy2yR9koeTbAepG658vZPZC8lqmb3IEz7AVFkA=;
 b=sSeKH2zH/uxiSGvoMTos2iO+v1BlzRmW/gD3P4WVgyfAiluRv4yA5z/hSxfxrmImHj
 XQEiydD6HlMUsFS4v5Ctob59mO1FO5emsoGvXfbh3OhJ7iutVkqep2txflp01VIJMmLv
 tlrnq68/oeVYeiXV3WcLU2J9Dx9NSObc1D2/wLCKJWc7zyupvOWfqLfkl2dUNMosF72+
 7FwyMijd2E7q8d/oi5y0+wPwAT7kosn9PmlBjOC/0zUOYCE86fhjLngPyeL1DJ+H2UdO
 8yhARXWM9MZozl6CnFFRtcV2TOrUv8igrGhIrkhMNXL20y1NruBF7pfQ8CJWlFiV5KlH
 3XMA==
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAxMCBBdWcgMjAxOSBhdCAwODoyNiwgTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRA
aW50ZWwuY29tPiB3cm90ZToKPgo+IEluIHByZXBhcmF0aW9uIGZvciB1cGNvbWluZyBkZXZpY2Vz
IHdpdGggZGV2aWNlIGxvY2FsIG1lbW9yeSwgaW50cm9kdWNlIHRoZQo+IGNvbmNlcHQgb2YgZGlm
ZmVyZW50IG1lbW9yeSByZWdpb25zLCBhbmQgYSBzaW1wbGUgYnVkZHkgYWxsb2NhdG9yIHRvIG1h
bmFnZQo+IHRoZW0gaW4gaTkxNS4KPgo+IE9uZSBvZiB0aGUgY29uY2VybnMgcmFpc2VkIGZyb20g
djEgd2FzIGFyb3VuZCBub3QgdXNpbmcgZW5vdWdoIG9mIFRUTSwgd2hpY2ggaXMKPiBhIGZhaXIg
Y3JpdGljaXNtLCBzbyB0cnlpbmcgdG8gZ2V0IGJldHRlciBhbGlnbm1lbnQgaGVyZSBpcyBzb21l
dGhpbmcgd2UgYXJlCj4gaW52ZXN0aWdhdGluZywgdGhvdWdoIGN1cnJlbnRseSB0aGF0IGlzIHN0
aWxsIFdJUCBzbyBpbiB0aGUgbWVhbnRpbWUgdjMgc3RpbGwKPiBjb250aW51ZXMgdG8gcHVzaCBt
b3JlIG9mIHRoZSBsb3ctbGV2ZWwgZGV0YWlscyBmb3J3YXJkLCBidXQgbm90IHlldCB0aGUgVFRN
Cj4gaW50ZXJhY3Rpb25zLgoKQ2FuIHdlIGJ1bXAgdGhlIFRUTSB3b3JrIHVwIHRoZSBsYWRkZXIg
aGVyZSwgYXMgaXMgSSdtIG5vdCB3aWxsaW5nIHRvCmFjY2VwdCBhbnkgb2YgdGhpcyBjb2RlIHVw
c3RyZWFtIHdpdGhvdXQgc29tZSBzZXJpb3VzIGFuYWx5c2lzLCB0aGlzCmlzbid0IGEgY2FzZSBv
ZiBtZSBtYWtpbmcgYSBuaWNlIHN1Z2dlc3Rpb24gYW5kIHlvdSBoYXZpbmcgdGhlIG9wdGlvbgp0
byBpZ25vcmUgaXQuIERvbid0IG1ha2UgbWUgc2hvdXQuCgpEYXZlLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
