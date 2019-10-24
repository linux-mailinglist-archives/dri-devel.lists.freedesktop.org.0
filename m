Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52770E2923
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 05:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD4E6E0A8;
	Thu, 24 Oct 2019 03:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF846E0A8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 03:51:24 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c4so17492683edl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 20:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tqY8MkrFlRuB64lQselPYGZKvMHD/g09EyqNLXd31OI=;
 b=WwjvCQQ7TvRCxNmcWsLoFmyK+KYG9d72vMxvL22LtUzr+cvtV3+C+4ryNmpVhO3ehG
 TaFNPw+znrH5zi8KTuTDvXv7TN/rTGxNzMeYmKYy33H4PsHzQMh5QYBznvFzNKppdzWx
 FZAgoXFX2tTO0OPBQRqh8q7OBjvwBCvXzbcKGkhdyZgQ8QkSDAv7d87rEULFhn9HobNw
 emLvQ3GFSbZDx+vUz3yhnvOu3zFYkWHphiHBah+TAKXOmCQfF5x+6680YOnZtL8M4ho/
 y2a6IMs4tRphkX58cQMK4ACjjomdJUPd6vvKECRA3JTwnBaW4aIlQxkh2l3lEb+t/7ci
 M+Mw==
X-Gm-Message-State: APjAAAVqZN/GYda9Qjh0jM9xA0blIBzuzfaZB1zQCEl9r+qhGDlODd05
 RH49OAVVkisYThAsuZ++F/zmPP9GUF0=
X-Google-Smtp-Source: APXvYqwdUUtdCa/K1QLDrYgEru7nk8p/hHH8FlcNg2LLTg1C/pVtODjq1pyZcksz60OocYd5uPXpQw==
X-Received: by 2002:a50:8b26:: with SMTP id l35mr24062022edl.220.1571889082785; 
 Wed, 23 Oct 2019 20:51:22 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44])
 by smtp.gmail.com with ESMTPSA id j5sm939384edj.62.2019.10.23.20.51.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 20:51:22 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id r19so1060926wmh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 20:51:22 -0700 (PDT)
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr2815314wmb.125.1571889081917; 
 Wed, 23 Oct 2019 20:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191023120925.30668-1-tomeu.vizoso@collabora.com>
 <20191023122157.32067-1-tomeu.vizoso@collabora.com>
In-Reply-To: <20191023122157.32067-1-tomeu.vizoso@collabora.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 24 Oct 2019 11:51:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v675oCOr6JR6CXB28hrUuwBN2M9C9SS6UPNpbEAfw9ztjA@mail.gmail.com>
Message-ID: <CAGb2v675oCOr6JR6CXB28hrUuwBN2M9C9SS6UPNpbEAfw9ztjA@mail.gmail.com>
Subject: Re: [PATCH v2] panfrost: Properly undo pm_runtime_enable when
 deferring a probe
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgODoyMiBQTSBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9z
b0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IFdoZW4gZGVmZXJyaW5nIHRoZSBwcm9iZSBiZWNh
dXNlIG9mIGEgbWlzc2luZyByZWd1bGF0b3IsIHdlIHdlcmUgY2FsbGluZwo+IHBtX3J1bnRpbWVf
ZGlzYWJsZSBldmVuIGlmIHBtX3J1bnRpbWVfZW5hYmxlIHdhc24ndCBjYWxsZWQuCj4KPiBNb3Zl
IHRoZSBjYWxsIHRvIHBtX3J1bnRpbWVfZGlzYWJsZSB0byB0aGUgcmlnaHQgcGxhY2UuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+
IFJlcG9ydGVkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cj4gQ2M6IFJvYmluIE11
cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+Cj4gRml4ZXM6IGY0YTNjNmE0NGIzNSAoImRybS9w
YW5mcm9zdDogRGlzYWJsZSBQTSBvbiBwcm9iZSBmYWlsdXJlIikKClRlc3RlZC1ieTogQ2hlbi1Z
dSBUc2FpIDx3ZW5zQGNzaWUub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
