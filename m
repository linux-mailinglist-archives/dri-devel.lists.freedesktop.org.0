Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EA0231D49
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 13:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA5F6E4C4;
	Wed, 29 Jul 2020 11:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223A36E4C4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 11:20:04 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id q4so13902356edv.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 04:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NiS9IH7Od8Q9xbyIfFxNL/qSLHRh5AtTCa5eRtX/6P0=;
 b=oYvpKrCmqIeD8iRj1X4ApnzVEOtPWr3rEMBBYgOBfok3BXhsXdMlVmvZohhJOvih18
 jNE4k14oGdpSsLPJbtBRkrMlNcue8sN+y+RgaDPQkLvZImfBgA5BMfbmVN+VolVAUuK3
 B0sDwAnpzUQemc5d2Li9iDhKtZVUYvZixrVljnoDDdFqglT1YQnlErefF837QUMaP4Hd
 DydvIGNa7DQuHLfVjVFnNJE0Nx4jtiI9D56P1/8oGTuZk0CuQHSzSKf6uB9qvs4Qi9mI
 wrGUL4hgEwDvT5soktEjK+np1dfcauBpYKDPA4SlyIeS4dbrR9zRgHws9ZYFUXTLzTvG
 dLPg==
X-Gm-Message-State: AOAM532MhTVeE7XqXHnsoLXYD8Pg/zCgIyDCqqIA/JtpEmPWiYsbGl2+
 8cLtcQzPWOUBNegqKw+5Q7A=
X-Google-Smtp-Source: ABdhPJwEICJkcOEaQN8mut/yS4vwhDihD9l4jxfSgBLLqefKZMf5ENVOkl+EfbA/uvzttuTQQojyGQ==
X-Received: by 2002:aa7:c442:: with SMTP id n2mr29841866edr.309.1596021602580; 
 Wed, 29 Jul 2020 04:20:02 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id y14sm420978ejr.35.2020.07.29.04.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 04:20:01 -0700 (PDT)
Subject: Re: [PATCH] vgacon: fix out of bounds write to the scrollback buffer
To: =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>,
 b.zolnierkie@samsung.com
References: <c1f267aa-dfb3-91fa-3111-30c1676f1a91@kernel.org>
 <c5a73038-f441-602b-584b-3d84622b1fb1@nsfocus.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <d0cc1f99-1ef0-c7a2-6b42-d25d8fa49f1e@kernel.org>
Date: Wed, 29 Jul 2020 13:20:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c5a73038-f441-602b-584b-3d84622b1fb1@nsfocus.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Security Officers <security@kernel.org>, Kyungtae Kim <kt0755@gmail.com>,
 Anthony Liguori <aliguori@amazon.com>, Greg KH <greg@kroah.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-distros@vs.openwall.org,
 Solar Designer <solar@openwall.com>, Yang Yingliang <yangyingliang@huawei.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkuIDA3LiAyMCwgMTA6MTksIOW8oOS6kea1tyB3cm90ZToKPiBPbiAyMDIwLzcvMjkgMTY6
MTEsIEppcmkgU2xhYnkgd3JvdGU6Cj4+IEJ1dCB0aGUgbG9vcCBjaGVja3MgZm9yIHRoZSBvdmVy
ZmxvdzoKPj4gICBpZiAodmdhY29uX3Njcm9sbGJhY2tfY3VyLT50YWlsID49IHZnYWNvbl9zY3Jv
bGxiYWNrX2N1ci0+c2l6ZSkKPj4gICAgICAgICB2Z2Fjb25fc2Nyb2xsYmFja19jdXItPnRhaWwg
PSAwOwo+Pgo+PiBTbyB0aGUgZmlyc3QgMiBpdGVyYXRpb25zIHdvdWxkIHdyaXRlIHRvIHRoZSBl
bmQgb2YgdGhlIGJ1ZmZlciBhbmQgdGhpcwo+PiAzcmQgb25lIHNob3VsZCBoYXZlIHplcm9lZCAt
PnRhaWwuCj4gCj4gSW4gdGhlIDJuZCAgaXRlcmF0aW9uIGJlZm9yZSB0aGUgY2hlY2s6Cj4gdmdh
Y29uX3Njcm9sbGJhY2tfY3VyLT50YWlsIGlzIDY1MzYwIHdoaWNoIGlzIHN0aWxsIGxlc3MgdGhl
bgo+IHZnYWNvbl9zY3JvbGxiYWNrX2N1ci0+c2l6ZSg2NTQ0MCksIHNvIHRoZSAtPnRhaWwgd29u
J3QgYmUgemVyb2VkLgo+IAo+IFRoZW4gaXQgZ29zZSB0byB0aGUgM3JkICBpdGVyYXRpb24sIG92
ZXJmbG93IG9jY3Vycy4KCkFoaCwgSSBzZWUgbm93ISBTbyBpdCBtdXN0IGJlIHRyaWdnZXJlZCBi
eSBDU0kgTSBpbnN0ZWFkLiBJdCBhbGxvd3MgZm9yCm1vcmUgdGhhbiAxIGluIGNvdW50LiBTbyB0
aGlzIGlzIFBvQyBmb3IgdGhpcyBjYXNlOgojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0
ZGxpYi5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CiNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KI2luY2x1
ZGUgPHN5cy9zdGF0Lmg+CiNpbmNsdWRlIDxzeXMvaW9jdGwuaD4KI2luY2x1ZGUgPGZjbnRsLmg+
CgppbnQgbWFpbihpbnQgYXJnYywgY2hhcioqIGFyZ3YpCnsKICAgICAgICBpbnQgZmQgPSBvcGVu
KCIvZGV2L3R0eTEiLCBPX1JEV1IpOwogICAgICAgIHVuc2lnbmVkIHNob3J0IHNpemVbM10gPSB7
MjUsIDIwMCwgMH07CiAgICAgICAgaW9jdGwoZmQsIDB4NTYwOSwgc2l6ZSk7IC8vIFZUX1JFU0la
RQoKICAgICAgICB3cml0ZShmZCwgIlxlWzE7MUgiLCA2KTsKICAgICAgICBmb3IgKGludCBpID0g
MDsgaSA8IDMwOyBpKyspCiAgICAgICAgICAgICAgICB3cml0ZShmZCwgIlxlWzEwTSIsIDUpOwp9
CgpJdCBjb3JydXB0cyBtZW1vcnksIHNvIGl0IGNyYXNoZXMgdGhlIGtlcm5lbCByYW5kb21seS4g
RXZlbiB3aXRoIG15CmJlZm9yZS1sb29wIHBhdGNoLgoKU28gbm93OiBjb3VsZCB5b3UgcmVzZW5k
IHlvdXIgcGF0Y2ggd2l0aCBpbXByb3ZlZCBjb21taXQgbWVzc2FnZSwgYWRkCmFsbCB0aG9zZSBD
Y3MgZXRjLj8gWW91IGNhbiBjb3B5IG1vc3Qgb2YgdGhlIENjcyBmcm9tIG15IHBhdGNoIHZlcmJh
dGltLgoKSSBhbSBhbHNvIG5vdCBzdXJlIHRoZSB0ZXN0IEkgd2FzIHBvaW50aW5nIG91dCBvbiB0
aGUgdG9wIG9mIHRoaXMKbWVzc2FnZSB3b3VsZCBiZSBvZiBhbnkgdXNlIGFmdGVyIHRoZSBjaGFu
Z2UuIEJ1dCBtYXliZSBsZWF2ZSB0aGUgY29kZQpyZXN0IGluIHBlYWNlLgoKdGhhbmtzLAotLSAK
anMKc3VzZSBsYWJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
