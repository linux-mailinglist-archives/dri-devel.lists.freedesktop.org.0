Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCD7E48BF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 12:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE696E96E;
	Fri, 25 Oct 2019 10:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0986E96E;
 Fri, 25 Oct 2019 10:42:55 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id x20so1096914vso.13;
 Fri, 25 Oct 2019 03:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6I7lVXoRVOMh+s5zeEA3Lm8+N1pBmbUdCauEUyrNHQQ=;
 b=f7QGx8x7oIjAeMVlUTx8kFZK5BDOwDLIUo8M/aKeqYxVXxlhb6KWj2c7iqa0opMf5m
 JXPFYvyM3dDT+sJYWacNTXhxT7q19LbjNO9KU47zOhWngUzkyUUB0xozSRjM819lzzW9
 NYCBuQpOzchuLAShRAdpQ+b6Vwe7Um2BKcitUnN7CS0b94m1v/JNeJGF/plXkczbPZ+l
 0XjLArCdTU8QK2iTTiuMp2mUzqZMNJuGMIp/RL3GKRW0HO/zp28bq2Gd3uAQgODC5dFl
 0BWB0NK2BOwX4cFrnUb39O/6vJnFpRDzLQH3ae6iZuh/uV+B2K9Jxh/x2Z5ow8Di+3WH
 L/sw==
X-Gm-Message-State: APjAAAUEiCpK6uq/dFrH0HTkQoS8AmfYchgIsPQRk6q3hTPPzboXLbMH
 +zq4BcP96MVIk7OsHe7HFg0cxQ7IKHTTHQIsASgnknBB1eXI8w==
X-Google-Smtp-Source: APXvYqwvO87bkbdND0DuO6H+1sKwdTlgAVI9hmJOGsJyb8lIMAgnwpNYtsMHKNEPsbAynl5tXkhWVWFeAOdjq2qSbiQ=
X-Received: by 2002:a67:df0d:: with SMTP id s13mr1439646vsk.95.1572000174101; 
 Fri, 25 Oct 2019 03:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191016142716.10168-1-l.stach@pengutronix.de>
In-Reply-To: <20191016142716.10168-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 25 Oct 2019 12:42:47 +0200
Message-ID: <CAH9NwWeVY0GknaC7aY+bmpbALv2E2it3STf7uoj4vSf60o9yog@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/etnaviv: fix deadlock in GPU coredump
To: Lucas Stach <l.stach@pengutronix.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6I7lVXoRVOMh+s5zeEA3Lm8+N1pBmbUdCauEUyrNHQQ=;
 b=l7pN5beZQxsfnlinw4BOLLCPms4KVDDXC4BcZnxfi6KThySH9Ird/F4/9ViQxbGpx8
 4xhAOhjI70deRUbkGvAky+pD8Jy8BHUqQMkAFUviTnGoc9fEcT1Gt+B5aPDeZNq+Fj05
 fKTVHXZn3l5DanUwTxc8aZ8BEUbnN6WgycrEIjHpsA+SlialuwnBH2JQiJqY9sVcjscb
 LJ1ABZ/1WrtLMQlBXdNvj2z00Qecf1XmQnQ2D4kSuyN2qb0f+bQqUtRGparYfBnCVTM+
 QkvJO9CyZ/SeHHhxCylJ/I3bkxAeMomZvBWcZX3llTD8ipjWCPK3KRliizSNjwY+7AMk
 1GsQ==
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
Cc: Sascha Hauer <kernel@pengutronix.de>, patchwork-lst@pengutronix.de,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTWkuLCAxNi4gT2t0LiAyMDE5IHVtIDE2OjI3IFVociBzY2hyaWViIEx1Y2FzIFN0YWNoIDxs
LnN0YWNoQHBlbmd1dHJvbml4LmRlPjoKPgo+IFRoZSBHUFUgY29yZWR1bXAgZnVuY3Rpb24gdmlv
bGF0ZXMgdGhlIGxvY2tpbmcgb3JkZXIgYnkgaG9sZGluZyB0aGUgTU1VCj4gY29udGV4dCBsb2Nr
IHdoaWxlIHRyeWluZyB0byBhY3F1aXJlIHRoZSBldG5hdml2X2dlbV9vYmplY3QgbG9jay4gVGhp
cwo+IHJlc3VsdHMgaW4gYSBwb3NzaWJsZSBBQkJBIGRlYWRsb2NrIHdpdGggb3RoZXIgY29kZXBh
dGhzIHdoaWNoIGZvbGxvdwo+IHRoZSBlc3RhYmxpc2hlZCBsb2NraW5nIG9yZGVyLgo+IEZvcnR1
bmF0ZWx5IHRoaXMgaXMgZWFzeSB0byBmaXggYnkgZHJvcHBpbmcgdGhlIE1NVSBjb250ZXh0IGxv
Y2sKPiBlYXJsaWVyLCBhcyB0aGUgQk8gZHVtcGluZyBkb2Vzbid0IG5lZWQgdGhlIE1NVSBjb250
ZXh0IHRvIGJlIHN0YWJsZS4KPiBUaGUgb25seSB0aGluZyB0aGUgQk8gZHVtcGluZyBjYXJlcyBh
Ym91dCBhcmUgdGhlIEJPIG1hcHBpbmdzLCB3aGljaAo+IGFyZSBzdGFibGUgYWNyb3NzIHRoZSBs
aWZldGltZSBvZiB0aGUgam9iLgo+Cj4gRml4ZXM6IDI3YjY3Mjc4ZTAwNyAoZHJtL2V0bmF2aXY6
IHJld29yayBNTVUgaGFuZGxpbmcpCj4gWyBOb3QgcmVhbGx5IHRoZSBmaXJzdCBiYWQgY29tbWl0
LCBidXQgdGhlIG9uZSB3aGVyZSB0aGlzIGZpeCBhcHBsaWVzCj4gICBjbGVhbmx5LiBTdGFibGUg
a2VybmVscyBuZWVkIGEgbWFudWFsIGJhY2twb3J0LiBdCj4gUmVwb3J0ZWQtYnk6IENocmlzdGlh
biBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
THVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CgpUZXN0ZWQtYnk6IENocmlzdGlh
biBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2R1bXAuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2
aXYvZXRuYXZpdl9kdW1wLmMKPiBpbmRleCA2OThkYjU0MDk3MmMuLjY0OGNmMDIwNzMwOSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2R1bXAuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jCj4gQEAgLTE4MCw2ICsxODAs
OCBAQCB2b2lkIGV0bmF2aXZfY29yZV9kdW1wKHN0cnVjdCBldG5hdml2X2dlbV9zdWJtaXQgKnN1
Ym1pdCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBldG5hdml2X2NtZGJ1Zl9nZXRf
dmEoJnN1Ym1pdC0+Y21kYnVmLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmZ3B1LT5tbXVfY29udGV4dC0+Y21kYnVmX21hcHBpbmcpKTsKPgo+ICsgICAgICAgbXV0
ZXhfdW5sb2NrKCZncHUtPm1tdV9jb250ZXh0LT5sb2NrKTsKPiArCj4gICAgICAgICAvKiBSZXNl
cnZlIHNwYWNlIGZvciB0aGUgYm9tYXAgKi8KPiAgICAgICAgIGlmIChuX2JvbWFwX3BhZ2VzKSB7
Cj4gICAgICAgICAgICAgICAgIGJvbWFwX3N0YXJ0ID0gYm9tYXAgPSBpdGVyLmRhdGE7Cj4gQEAg
LTIyMSw4ICsyMjMsNiBAQCB2b2lkIGV0bmF2aXZfY29yZV9kdW1wKHN0cnVjdCBldG5hdml2X2dl
bV9zdWJtaXQgKnN1Ym1pdCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG9iai0+YmFzZS5zaXplKTsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgbXV0ZXhfdW5sb2Nr
KCZncHUtPm1tdV9jb250ZXh0LT5sb2NrKTsKPiAtCj4gICAgICAgICBldG5hdml2X2NvcmVfZHVt
cF9oZWFkZXIoJml0ZXIsIEVURFVNUF9CVUZfRU5ELCBpdGVyLmRhdGEpOwo+Cj4gICAgICAgICBk
ZXZfY29yZWR1bXB2KGdwdS0+ZGV2LCBpdGVyLnN0YXJ0LCBpdGVyLmRhdGEgLSBpdGVyLnN0YXJ0
LCBHRlBfS0VSTkVMKTsKPiAtLQo+IDIuMjAuMQo+CgoKLS0gCmdyZWV0cwotLQpDaHJpc3RpYW4g
R21laW5lciwgTVNjCgpodHRwczovL2NocmlzdGlhbi1nbWVpbmVyLmluZm8vcHJpdmFjeXBvbGlj
eQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
