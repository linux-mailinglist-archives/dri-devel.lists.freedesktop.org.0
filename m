Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7265B10A2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 16:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36FD6ED81;
	Thu, 12 Sep 2019 14:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5826ED81
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 14:05:13 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id f2so17717221edw.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 07:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ha/ksfChi40fvWXvJ2Pp1OUPpzkomxxm5i7dcskz7Q0=;
 b=FSxHsJpaUFSIYjrBdW2Wko0oy6jJrFNIAcn3lioQvHNpc1impKYwO4mjgKjFA8yeDp
 E/FVIXYq3Rc9lVA1z/3wKWT/z/pwZAhDda3sSEW+MLC/8ZQ26RajeeKp7t48vRKjcGNq
 J/BarVGpYqBd96pY9M4LyxUCnOhYzObO/pmIsmwmUv2CqkdXpG6rwO+z12cLq6dPH2Rd
 ookKmLAcvf1tGSE3VaPtM0lSjfK503UKk44zVl8K/qJ9gAlV30SwyVGTxS79XqhOSHwt
 tcxLGI7M49dFuiV8vSz2yGGZYz2QQh0b5+SRciGTsu7NdflUtC0TGn47wtP+HoQ6cHSS
 1jRw==
X-Gm-Message-State: APjAAAWLJCD0LBO9D3zqUSPFZtgJlhewt3YiPGkNqTr9rMqfMeH/vTet
 nEIzwRujpiCP+UMwzN6JUqdWzBS/BKVhWQ==
X-Google-Smtp-Source: APXvYqwvAUdc7oHv6vLTEkIm/VhMaR4RDUBNgX3n/qmjdQ2hrQt3L5BlsdnWnlksQMnfWogZPWJGbw==
X-Received: by 2002:a50:c90c:: with SMTP id o12mr25824008edh.126.1568297112073; 
 Thu, 12 Sep 2019 07:05:12 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54])
 by smtp.gmail.com with ESMTPSA id c22sm1053798edc.9.2019.09.12.07.05.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2019 07:05:11 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id t16so28616282wra.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 07:05:11 -0700 (PDT)
X-Received: by 2002:a05:6000:1082:: with SMTP id
 y2mr35193821wrw.77.1568297110781; 
 Thu, 12 Sep 2019 07:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190912094121.228435-1-tfiga@chromium.org>
 <20190912123821.rraib5entkcxt5p5@sirius.home.kraxel.org>
In-Reply-To: <20190912123821.rraib5entkcxt5p5@sirius.home.kraxel.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 12 Sep 2019 23:04:59 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AFXfu7ysFCi1XQS61DK8nbSk5-=UHkvpYWDtFae5YQ6Q@mail.gmail.com>
Message-ID: <CAAFQd5AFXfu7ysFCi1XQS61DK8nbSk5-=UHkvpYWDtFae5YQ6Q@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/virtio: Export resource handles via DMA-buf API
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ha/ksfChi40fvWXvJ2Pp1OUPpzkomxxm5i7dcskz7Q0=;
 b=N1uaN/ryzApCA4SADojux1E9zO7nn0OPjjEhdzhTt0JKsMtlgusANPx2drUgpBAlLs
 SoZeqeON7maPDbM+8sK+uV/VnXPnMhc5g1bliSnosSXlo6RK5RwkdtVIW7Qp0ctU+sSL
 QIWvxhqIgpV8zoKpYk8nnZDbkc4QWsB8IV8IA=
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
Cc: Zach Reizner <zachr@chromium.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Keiichi Watanabe <keiichiw@chromium.org>, stevensd@chromium.org,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 Pawel Osciak <posciak@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VyZCwKCk9uIFRodSwgU2VwIDEyLCAyMDE5IGF0IDk6MzggUE0gR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gICBIaSwKPgo+ID4gVG8gc2VhbWxlc3NseSBl
bmFibGUgYnVmZmVyIHNoYXJpbmcgd2l0aCBkcml2ZXJzIHVzaW5nIHN1Y2ggZnJhbWV3b3JrcywK
PiA+IG1ha2UgdGhlIHZpcnRpby1ncHUgZHJpdmVyIGV4cG9zZSB0aGUgcmVzb3VyY2UgaGFuZGxl
IGFzIHRoZSBETUEgYWRkcmVzcwo+ID4gb2YgdGhlIGJ1ZmZlciByZXR1cm5lZCBmcm9tIHRoZSBE
TUEtYnVmIG1hcHBpbmcgb3BlcmF0aW9uLiAgQXJndWFibHksIHRoZQo+ID4gcmVzb3VyY2UgaGFu
ZGxlIGlzIGEga2luZCBvZiBETUEgYWRkcmVzcyBhbHJlYWR5LCBhcyBpdCBpcyB0aGUgYnVmZmVy
Cj4gPiBpZGVudGlmaWVyIHRoYXQgdGhlIGRldmljZSBuZWVkcyB0byBhY2Nlc3MgdGhlIGJhY2tp
bmcgbWVtb3J5LCB3aGljaCBpcwo+ID4gZXhhY3RseSB0aGUgc2FtZSByb2xlIGEgRE1BIGFkZHJl
c3MgcHJvdmlkZXMgZm9yIG5hdGl2ZSBkZXZpY2VzLgoKRmlyc3Qgb2YgYWxsLCB0aGFua3MgZm9y
IHRha2luZyBhIGxvb2sgYXQgdGhpcy4KCj4KPiBOby4gIEEgc2NhdHRlciBsaXN0IGhhcyBndWVz
dCBkbWEgYWRkcmVzc2VzLCBwZXJpb2QuICBTdHVmZmluZyBzb21ldGhpbmcKPiBlbHNlIGludG8g
YSBzY2F0dGVybGlzdCBpcyBhc2tpbmcgZm9yIHRyb3VibGUsIHRoaW5ncyB3aWxsIGdvIHNlcmlv
dXNseQo+IHdyb25nIHdoZW4gc29tZW9uZSB0cmllcyB0byB1c2Ugc3VjaCBhIGZha2Ugc2NhdHRl
cmxpc3QgYXMgcmVhbCBzY2F0dGVybGlzdC4KCldoYXQgaXMgYSAiZ3Vlc3QgZG1hIGFkZHJlc3Mi
PyBUaGUgZGVmaW5pdGlvbiBvZiBhIERNQSBhZGRyZXNzIGluIHRoZQpMaW51eCBETUEgQVBJIGlz
IGFuIGFkZHJlc3MgaW50ZXJuYWwgdG8gdGhlIERNQSBtYXN0ZXIgYWRkcmVzcyBzcGFjZS4KRm9y
IHZpcnRpbywgdGhlIHJlc291cmNlIGhhbmRsZSBuYW1lc3BhY2UgbWF5IGJlIHN1Y2ggYW4gYWRk
cmVzcwpzcGFjZS4gSG93ZXZlciwgd2UgY291bGQgYXMgd2VsbCBpbnRyb2R1Y2UgYSBzZXBhcmF0
ZSBETUEgYWRkcmVzcwpzcGFjZSBpZiByZXNvdXJjZSBoYW5kbGVzIGFyZSBub3QgdGhlIHJpZ2h0
IHdheSB0byByZWZlciB0byB0aGUgbWVtb3J5CmZyb20gb3RoZXIgdmlydGlvIGRldmljZXMuCgo+
Cj4gQWxzbyBub3RlIHRoYXQgInRoZSBETUEgYWRkcmVzcyBvZiB0aGUgYnVmZmVyIiBpcyBib25r
ZXJzIGluIHZpcnRpby1ncHUKPiBjb250ZXh0LiAgdmlydGlvLWdwdSByZXNvdXJjZXMgYXJlIG5v
dCByZXF1aXJlZCB0byBiZSBwaHlzaWNhbGx5Cj4gY29udGlnb3VzIGluIG1lbW9yeSwgc28gdHlw
aWNhbGx5IHlvdSBhY3R1YWxseSBuZWVkIGEgc2NhdHRlciBsaXN0IHRvCj4gZGVzY3JpYmUgdGhl
bS4KClRoZXJlIGlzIG5vIHN1Y2ggcmVxdWlyZW1lbnQgZXZlbiBvbiBhIGJhcmUgbWV0YWwgc3lz
dGVtLCBzZWUgYW55CnN5c3RlbSB0aGF0IGhhcyBhbiBJT01NVSwgd2hpY2ggaXMgdHlwaWNhbCBv
biBBUk0vQVJNNjQuIFRoZSBETUEKYWRkcmVzcyBzcGFjZSBtdXN0IGJlIGNvbnRpZ3VvdXMgb25s
eSBmcm9tIHRoZSBETUEgbWFzdGVyIHBvaW50IG9mCnZpZXcuCgpCZXN0IHJlZ2FyZHMsClRvbWFz
egpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
