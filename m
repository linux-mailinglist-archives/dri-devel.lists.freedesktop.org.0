Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2503E2236
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 19:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA446EB5D;
	Wed, 23 Oct 2019 17:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9DC6EB5D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 17:59:14 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9111721929
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 17:59:14 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id c17so30566269qtn.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 10:59:14 -0700 (PDT)
X-Gm-Message-State: APjAAAXEhiAQFf5Ji8J28CcUMg61cheMGD40zk74Sq4HbLtu98VslLc1
 3Bpgz3cm/D+NJqTu0Z8VNGo+/THJNYlGErW39g==
X-Google-Smtp-Source: APXvYqwgiCA3/HW7B9HdMyTBcuSF8WS4GaQJTs5HXdTu0a3ruOPx1ujAxcRIzhZ2LIxDxG0XTebd4N+mapW3qIEWKdQ=
X-Received: by 2002:a05:6214:1111:: with SMTP id
 e17mr6340426qvs.79.1571853553726; 
 Wed, 23 Oct 2019 10:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191023120925.30668-1-tomeu.vizoso@collabora.com>
 <20191023122157.32067-1-tomeu.vizoso@collabora.com>
 <d87ff25e-52af-a467-d128-85fe18028e4c@arm.com>
In-Reply-To: <d87ff25e-52af-a467-d128-85fe18028e4c@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Oct 2019 12:58:59 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKT4f+Bp7Ajg=V-Ejaynp6BXXFUJKNuCxasU3U3LgepDg@mail.gmail.com>
Message-ID: <CAL_JsqKT4f+Bp7Ajg=V-Ejaynp6BXXFUJKNuCxasU3U3LgepDg@mail.gmail.com>
Subject: Re: [PATCH v2] panfrost: Properly undo pm_runtime_enable when
 deferring a probe
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571853554;
 bh=GVxu4ie3F6beXlleyG/nZFkxDDZ33fjhbpnxbt5ZrVY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=V66bBzKehixlr0jPDg+nSIzXnNnH9cQiylvILvEawEAlOw0cbqKI1c5Nz4AKkcW0E
 ACZZEa+2w9jJjjeT43ADwbiA3Q3Jplc2CRVq+6d9RjxiwhYelcQ2IayhY1/HKM0XrQ
 wMXFKT4izUvKRgDXAsCkuGT7qtuslqabLZe2lliA=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTA6NDkgQU0gU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJp
Y2VAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMy8xMC8yMDE5IDEzOjIxLCBUb21ldSBWaXpvc28g
d3JvdGU6Cj4gPiBXaGVuIGRlZmVycmluZyB0aGUgcHJvYmUgYmVjYXVzZSBvZiBhIG1pc3Npbmcg
cmVndWxhdG9yLCB3ZSB3ZXJlIGNhbGxpbmcKPiA+IHBtX3J1bnRpbWVfZGlzYWJsZSBldmVuIGlm
IHBtX3J1bnRpbWVfZW5hYmxlIHdhc24ndCBjYWxsZWQuCj4gPgo+ID4gTW92ZSB0aGUgY2FsbCB0
byBwbV9ydW50aW1lX2Rpc2FibGUgdG8gdGhlIHJpZ2h0IHBsYWNlLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+Cj4gPiBSZXBv
cnRlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgo+ID4gQ2M6IFJvYmluIE11cnBo
eSA8cm9iaW4ubXVycGh5QGFybS5jb20+Cj4gPiBGaXhlczogZjRhM2M2YTQ0YjM1ICgiZHJtL3Bh
bmZyb3N0OiBEaXNhYmxlIFBNIG9uIHByb2JlIGZhaWx1cmUiKQo+Cj4gQXMgUm9iaW4gcG9pbnRl
ZCBvdXQgdGhpcyBzaG91bGQgYmU6Cj4KPiBGaXhlczogNjM1NDMwNzk3ZDNmICgiZHJtL3BhbmZy
b3N0OiBSZXdvcmsgcnVudGltZSBQTSBpbml0aWFsaXphdGlvbiIpCj4KPiBCdXQgb3RoZXIgdGhh
biB0aGF0LAo+Cj4gUmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5j
b20+CgpBcHBsaWVkIHdpdGggRml4ZXMgZml4ZWQuIExvb2tzIGxpa2Ugd2UganVzdCBtaXNzZWQg
dGhpcyB3ZWVrcyBmaXhlcy4uLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
