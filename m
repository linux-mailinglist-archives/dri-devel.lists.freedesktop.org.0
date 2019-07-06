Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B38C61B0C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C5F89A74;
	Mon,  8 Jul 2019 07:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A6589F08
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 17:33:15 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id s7so25723123iob.11
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jul 2019 10:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aORoEfxHMte5Izs1lq4tjs5CsYwqAPQNnbHEGD7zrHk=;
 b=rLxVzCIHrCMTMbR7iPqmXoHleyA9gnXVnbdXm1/RBiTA3mP49VsU4TFxjJNDDFjheY
 wx7xXscgLyX+su2biO0JqXxDyIyJ1sfGYte8jQ0UsVrlr186wgmjnU3+yWChGaMkhlZP
 qACdgXkJHpUCrMfZWOD4B49y9tO8Mw8e4Ov1nyta9v6w6ipumR0O+2bHYzcCdpgiZ/08
 6GrQVDQ6Df9XOz9zwVyQVFobEFh8tapGsHm05PPSxYDo/7a0qRi7lKQWbsggKtYGXmKO
 yXK1JEvUtQ0FzX1+4KiDmb6zLTNICd9+0oakNxrxzR3nrb6pjS8VF9cm3vAQhJbnhjCM
 5itw==
X-Gm-Message-State: APjAAAWZaa9kL6e4pcwAa7qNUNMJy/BpHcTsIdKh2Bd+r6VdZGDiFN+X
 wv2M3opb2g+r1eQr8t3Ppwn6Og==
X-Google-Smtp-Source: APXvYqwt2kjsDRTuEZSm8wEakw60cJMABjp+Orn0k1S4sY1HPmriYbz/5kYKdXsRrWEe4S1bw6x/rg==
X-Received: by 2002:a05:6638:691:: with SMTP id
 i17mr11651649jab.70.1562434394233; 
 Sat, 06 Jul 2019 10:33:14 -0700 (PDT)
Received: from google.com ([2620:15c:183:0:9f3b:444a:4649:ca05])
 by smtp.gmail.com with ESMTPSA id l14sm12481945iob.1.2019.07.06.10.33.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 10:33:13 -0700 (PDT)
Date: Sat, 6 Jul 2019 11:33:09 -0600
From: Yu Zhao <yuzhao@google.com>
To: Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, Junwei Zhang <Jerry.Zhang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/ttm: properly unmap dma page upon failure
Message-ID: <20190706173309.GA111051@google.com>
References: <20190325202250.212801-1-yuzhao@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190325202250.212801-1-yuzhao@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aORoEfxHMte5Izs1lq4tjs5CsYwqAPQNnbHEGD7zrHk=;
 b=kvgDePG9Qhe5RimxRYGTdvtCHvnIA64aS0kZ+uGbl4/sheZZNvoQmc9BwVlHR6yyR7
 uObNmUaps0Ba4wtzAtPNdW3XbHk1/WS/pBwlRdnv2QmS2t318RmhkbEaT9/LU9r2tTHM
 5E14Qz/dVHMzvTDzLcx8JAUv+woHxk7001nRbjOpAtv5CZqKr/Zypac7Ih3jswZ8NVhY
 vUBbT0vi8fVLaB/SsOvi3SWu2Z3KLWqDPH2YKTbBcHcFtfh8wQUC1SN+ZFxOPoYIRMkZ
 it1Top97FKplk7mBWTty7+A9R4DJDQO481ASiwUSzuKZz/7MIgbf1ZOi3CdSrqtEhy6W
 rSMw==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMjUsIDIwMTkgYXQgMDI6MjI6NTBQTSAtMDYwMCwgWXUgWmhhbyB3cm90ZToK
PiBkbWFfdW5tYXBfcGFnZSgpIG11c3QgYmUgY2FsbGVkIHdpdGggZXhhY3RseSB0aGUgc2FtZSBk
bWEgYWRkcmVzcwo+IGFuZCBzaXplIHJldHVybmVkIGJ5IGRtYV9tYXBfcGFnZSgpLiBPdGhlcndp
c2UsIHRoZSBmdW5jdGlvbiBtYXkKPiBmYWlsLgo+IAo+IFRoaXMgaXMgYXQgbGVhc3QgdGhlIGNh
c2UgZm9yIGRlYnVnX2RtYV91bm1hcF9wYWdlKCkgYW5kIEFNRCBpb21tdQo+IHVubWFwX3BhZ2Ug
Y2FsbGJhY2suCgpIaSwgY2FuIHdlIHBsZWFzZSB0YWtlIHRoaXMgZml4PyBUaGFua3MuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
