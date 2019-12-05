Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7E6114241
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 15:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8FA6E02F;
	Thu,  5 Dec 2019 14:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAE96E02F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 14:05:08 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id 6so2802558oix.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 06:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xeq4HgJBk0tt+S9xudVxwhQMEwHOJwN3jhLi9OPFVKY=;
 b=WRoFbobU5GfxeDJ68e9/Ot4jhVVLgCVHT37MBXFGgpcg1sOqNSbXIgyhYrOt3MdrMZ
 /X7QaEwAS8bIK6MLem80M+MnEhA46LEQkAGGIQ8RoS97dDY9n5ZEsBd044BqEGFiShOJ
 Q2Tas/kLkwt1VluY8Q7/nMZWP3iEgNCFPuFR6KvrpJYZPtVtAq+M3LBGxSabW+choxGC
 4JwMwm0nwff2Oynq6/4QO2p+LruLd941WGssqOM73R4xb5KDuUvmZMTPaULS0mlE9B0P
 QHvmBHryVwdmqBli3psEu8CesDhsUQnnpNJd12vRQYMcr8GM2dqQ6c2L3RV9gtN+WgKi
 cOLg==
X-Gm-Message-State: APjAAAUi4Va8ZlLRg04B2E2L4NfJPxY0WAqi7Xq5GkOcqpbyKbGY87EQ
 arXquGkb3GPH+cQSyd0jwTIrWUpat5ZOmyrnwijjJQ==
X-Google-Smtp-Source: APXvYqzl2QkRicAy9CfAYCw7et3Bgx9YggGL0O1f0fzAsagnw/nPzczyEThdywCyJBZDVTdqDQAUNlpNTbUK5vhRF90=
X-Received: by 2002:aca:b805:: with SMTP id i5mr7462629oif.110.1575554707452; 
 Thu, 05 Dec 2019 06:05:07 -0800 (PST)
MIME-Version: 1.0
References: <0000000000006dff110598d25a9b@google.com>
 <000000000000bcf3bc0598f5090d@google.com>
In-Reply-To: <000000000000bcf3bc0598f5090d@google.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 5 Dec 2019 15:04:55 +0100
Message-ID: <CAKMK7uF4AR_tRxt5wBKxzz6gTPJmub3A=xyuh1HjgvfYy7RCBg@mail.gmail.com>
Subject: Re: INFO: task hung in fb_open
To: syzbot <syzbot+a4ae1442ccc637162dc1@syzkaller.appspotmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xeq4HgJBk0tt+S9xudVxwhQMEwHOJwN3jhLi9OPFVKY=;
 b=b09ztlWc8v0Um4ctng63ZDT0E7P0RKXrvR927jOraXHcGtJp+Uf2CHIS+MDhda51Bh
 t/U7WR4cLn1riEonp0c2aWFTbS7B4AKZl2EUZHj5NsL5WDWdHrX8BVO6KWzWJvr2InKS
 NcLiCmBKk1g//LRtR7nDPgmouAT6mLYsA1WLE=
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Dave Airlie <airlied@linux.ie>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ayan Kumar Halder <ayan.halder@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgNSwgMjAxOSBhdCAyOjM4IFBNIHN5emJvdAo8c3l6Ym90K2E0YWUxNDQyY2Nj
NjM3MTYyZGMxQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20+IHdyb3RlOgo+Cj4gc3l6Ym90IGhh
cyBiaXNlY3RlZCB0aGlzIGJ1ZyB0bzoKPgo+IGNvbW1pdCA5NzljMTFlZjM5Y2VlNzlkNmY1NTYw
OTFhMzU3ODkwOTYyYmUyNTgwCj4gQXV0aG9yOiBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbi5oYWxk
ZXJAYXJtLmNvbT4KPiBEYXRlOiAgIFR1ZSBKdWwgMTcgMTc6MTM6NDYgMjAxOCArMDAwMAo+Cj4g
ICAgICBkcm0vc3VuNGk6IFN1YnN0aXR1dGUgc3VuNGlfYmFja2VuZF9mb3JtYXRfaXNfeXV2KCkg
d2l0aCBmb3JtYXQtPmlzX3l1dgoKUHJldHR5IHN1cmUgeW91ciBHQ0QgbWFjaGluZSBpcyBub3Qg
dXNpbmcgdGhlIHN1bjRpIGRyaXZlci4gSXQncyBhbHNvCnZlcnkgZmFyIGF3YXkgZnJvbSB0aGUg
Y29kZSB0aGF0J3MgYmxvd2luZyB1cC4gYmlzZWN0IGdvbmUgd3Jvbmc/Ci1EYW5pZWwKCj4KPiBi
aXNlY3Rpb24gbG9nOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9iaXNlY3QudHh0
P3g9MTVkMmY5N2VlMDAwMDAKPiBzdGFydCBjb21taXQ6ICAgNTk2Y2Y0NWMgTWVyZ2UgYnJhbmNo
ICdha3BtJyAocGF0Y2hlcyBmcm9tIEFuZHJldykKPiBnaXQgdHJlZTogICAgICAgdXBzdHJlYW0K
PiBjb25zb2xlIG91dHB1dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9sb2cudHh0
P3g9MTNkMmY5N2VlMDAwMDAKPiBrZXJuZWwgY29uZmlnOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBw
c3BvdC5jb20veC8uY29uZmlnP3g9N2Q4YWIyZTBlMDljMmE4Mgo+IGRhc2hib2FyZCBsaW5rOiBo
dHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9YTRhZTE0NDJjY2M2MzcxNjJk
YzEKPiBzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXBy
by5zeXo/eD0xNDI3M2VkYWUwMDAwMAo+IEMgcmVwcm9kdWNlcjogICBodHRwczovL3N5emthbGxl
ci5hcHBzcG90LmNvbS94L3JlcHJvLmM/eD0xNWU3Njc3YWUwMDAwMAo+Cj4gUmVwb3J0ZWQtYnk6
IHN5emJvdCthNGFlMTQ0MmNjYzYzNzE2MmRjMUBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4g
Rml4ZXM6IDk3OWMxMWVmMzljZSAoImRybS9zdW40aTogU3Vic3RpdHV0ZSBzdW40aV9iYWNrZW5k
X2Zvcm1hdF9pc195dXYoKQo+IHdpdGggZm9ybWF0LT5pc195dXYiKQo+Cj4gRm9yIGluZm9ybWF0
aW9uIGFib3V0IGJpc2VjdGlvbiBwcm9jZXNzIHNlZTogaHR0cHM6Ly9nb28uZ2wvdHBzbUVKI2Jp
c2VjdGlvbgoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
