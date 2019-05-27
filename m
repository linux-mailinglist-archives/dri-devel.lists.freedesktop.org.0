Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA922AF39
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 09:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D0989890;
	Mon, 27 May 2019 07:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324A089875
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 07:10:14 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e24so25217527edq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 00:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=XL4d1ygyOVos6OxxzUja6aVyQpW0IYXJivlYSrfQHnA=;
 b=KvPTXsHh36bsTa9L9W/PithRMYOve9MjxBLdMjrw/IsHC4hvUO+EggSDmpHT7M6HTo
 ZZE+oRVmhppozizeLFc13XeGA2vGeRpchSX/PCGgghVic384Hdot95ykATIe7u/ihA5e
 4yKX6E46NeM+Khr5moEDc6Oa+K53UUIMxZPRvzSlA6584UBuj5fmwbwK3KNoNXND0sdU
 xCU9itdIjJJRNpvchUyOWgTtuPka0HaEtggeteH6qpchYU8OvBJswGvuAgWtcXEgfzyt
 +HSDCkysGSX7qH6WlqLkE08+mHKIgt7PluKjz549bxCz5wqFwiGmLs0TjkLcRlUtLa+W
 TRbw==
X-Gm-Message-State: APjAAAWy3LAjJgxI2o+bNLlxLDEeVw1E8ctecDZ3m5iTW/ZrAKtuEKAo
 ma2+huKBh6lmtmeCZa1UedWjLg==
X-Google-Smtp-Source: APXvYqxmf4kZpf2kSzeL00JRYQz4ZuC7fNJI9lm/8bcGPpfy+gM69wF3uZnkD5Bwr4a8VAYhaNb6Og==
X-Received: by 2002:a50:8dcd:: with SMTP id
 s13mr119843031edh.247.1558941012817; 
 Mon, 27 May 2019 00:10:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x49sm3061491edm.25.2019.05.27.00.10.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 May 2019 00:10:12 -0700 (PDT)
Date: Mon, 27 May 2019 09:10:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 14/33] staging/olpc: lock_fb_info can't fail
Message-ID: <20190527071010.GK21222@phenom.ffwll.local>
Mail-Followup-To: LKML <linux-kernel@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jens Frederich <jfrederich@gmail.com>,
 Daniel Drake <dsd@laptop.org>,
 Jon Nettleton <jon.nettleton@gmail.com>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
 <20190524085354.27411-15-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524085354.27411-15-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=XL4d1ygyOVos6OxxzUja6aVyQpW0IYXJivlYSrfQHnA=;
 b=Qr9Hp/isXrkr9fuYdPqzaBtAjHowXQV6nHrgMW1iYQSKeh9qk1qaaRUheam0yRh2cl
 GgeR39C4Ti6Nd0i/BnNMq4m5LpI1efLep4sXRL7TWc3akV+9fqlxIKFgClGOCMhi4SkZ
 bom5FuFGCH7qbNmJAlech06iY2d0oRvQn6NxE=
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
Cc: Daniel Drake <dsd@laptop.org>, Jens Frederich <jfrederich@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMTA6NTM6MzVBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBTaW1wbHkgYmVjYXVzZSBvbHBjIG5ldmVyIHVucmVnaXN0ZXJzIHRoZSBkYW1uIHRo
aW5nLiBJdCBhbHNvCj4gcmVnaXN0ZXJzIHRoZSBmcmFtZWJ1ZmZlciBkaXJlY3RseSBieSBwb2tp
bmcgYXJvdW5kIGluIGZiZGV2Cj4gY29yZSBpbnRlcm5hbHMsIHNvIGl0J3MgYWxsIGFyb3VuZCBy
YXRoZXIgYnJva2VuLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+Cj4gQ2M6IEplbnMgRnJlZGVyaWNoIDxqZnJlZGVyaWNoQGdtYWlsLmNv
bT4KPiBDYzogRGFuaWVsIERyYWtlIDxkc2RAbGFwdG9wLm9yZz4KPiBDYzogSm9uIE5ldHRsZXRv
biA8am9uLm5ldHRsZXRvbkBnbWFpbC5jb20+CgpIaSBHcmVnLAoKU29tZWhvdyBnZXRfbWFpbnRh
aW5lcnMgZGlkbid0IHBpY2sgeW91IHVwIGZvciB0aGlzLiBBY2sgZm9yIG1lcmdpbmcgdGhpcwp0
aHJvdWdoIGRybS9mYmRldj8gSXQncyBwYXJ0IG9mIGEgYmlnZ2VyIHNlcmllcyB0byByZXdvcmsg
ZmJkZXYvZmJjb24KaW50ZXJhY3Rpb25zLgoKVGhhbmtzLCBEYW5pZWwKCj4gLS0tCj4gIGRyaXZl
cnMvc3RhZ2luZy9vbHBjX2Rjb24vb2xwY19kY29uLmMgfCA2ICstLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc3RhZ2luZy9vbHBjX2Rjb24vb2xwY19kY29uLmMgYi9kcml2ZXJzL3N0YWdpbmcvb2xw
Y19kY29uL29scGNfZGNvbi5jCj4gaW5kZXggNmI3MTRmNzQwYWMzLi5hMjU0MjM4YmUxODEgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL29scGNfZGNvbi9vbHBjX2Rjb24uYwo+ICsrKyBi
L2RyaXZlcnMvc3RhZ2luZy9vbHBjX2Rjb24vb2xwY19kY29uLmMKPiBAQCAtMjUwLDExICsyNTAs
NyBAQCBzdGF0aWMgYm9vbCBkY29uX2JsYW5rX2ZiKHN0cnVjdCBkY29uX3ByaXYgKmRjb24sIGJv
b2wgYmxhbmspCj4gIAlpbnQgZXJyOwo+ICAKPiAgCWNvbnNvbGVfbG9jaygpOwo+IC0JaWYgKCFs
b2NrX2ZiX2luZm8oZGNvbi0+ZmJpbmZvKSkgewo+IC0JCWNvbnNvbGVfdW5sb2NrKCk7Cj4gLQkJ
ZGV2X2VycigmZGNvbi0+Y2xpZW50LT5kZXYsICJ1bmFibGUgdG8gbG9jayBmcmFtZWJ1ZmZlclxu
Iik7Cj4gLQkJcmV0dXJuIGZhbHNlOwo+IC0JfQo+ICsJbG9ja19mYl9pbmZvKGRjb24tPmZiaW5m
byk7Cj4gIAo+ICAJZGNvbi0+aWdub3JlX2ZiX2V2ZW50cyA9IHRydWU7Cj4gIAllcnIgPSBmYl9i
bGFuayhkY29uLT5mYmluZm8sCj4gLS0gCj4gMi4yMC4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
