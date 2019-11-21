Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F9C104E4B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B07A89996;
	Thu, 21 Nov 2019 08:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D25589996
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 08:47:42 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a15so3289513wrf.9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 00:47:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TmQGSJJ2m/6KFTeFbF1y4/QTinOnHRlvYqUeanwYFLk=;
 b=oy6fWqXYSvPpP3km5RIM/3womBDHmk1xvIniY++No4J4Bxg+JHg1HOSzRElagK7gVR
 41gZ/5Qx4mnnkkK/ZRqfk4in2yXAZZPCyr1dhsht+/C01tUJL1FvyD7ZODt0F3kTdPLH
 K3V5er8eszDttpKWgF8h1+91NWA5pyJqhA/mXt1yGc39ngNZp6wp4A4BmTJCA9z1IQXp
 k+oPJymGpW8WbfAAEyqjQvgT0RQh7nckHOA8RgKVBNcuy++EqQxLMTfx5zbyTK2OM4QP
 297J2K607tQYHj1152J/Q1d80Quxa6llOuWvFmE/FnyH7KpcZpAw7yEj9NiafYy0pwgm
 R5CQ==
X-Gm-Message-State: APjAAAUph1PHLmH819BzOdVhoBKUELLnFQsvnxxR5IYR0dz8nLUUwIEL
 3xY+gmGHrd/wAK1ega/GgpPMA2MJlvY=
X-Google-Smtp-Source: APXvYqyxll7wFgGErxVQ4XjCBGk0Kb5EeNAQrlagv4Y1QvjJp1Av7HuJKRIDL+BU0iZGMuP3IYjqRw==
X-Received: by 2002:adf:e8cf:: with SMTP id k15mr9522654wrn.256.1574326061201; 
 Thu, 21 Nov 2019 00:47:41 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id q15sm2258807wmq.0.2019.11.21.00.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 00:47:40 -0800 (PST)
Date: Thu, 21 Nov 2019 09:47:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191121084732.GA6236@phenom.ffwll.local>
References: <20191118164927.GF23790@phenom.ffwll.local>
 <20191120080532.hjjjddxrsikozlpq@sirius.home.kraxel.org>
 <20191120103913.GH30416@phenom.ffwll.local>
 <20191120114038.6ytbvc3hc4fzb5aa@sirius.home.kraxel.org>
 <CAKMK7uFhFi7F9RZ=Jyf5qG2Bfss9N8UbCr=kVAoNWOsnmTZrtw@mail.gmail.com>
 <20191120121848.eq5jeh3qgpendm7l@sirius.home.kraxel.org>
 <CAKMK7uGNStNfNnyh2BZJ4kXEZYAnjcTq67jRd2W-1TvSc3tv7Q@mail.gmail.com>
 <20191120130841.3ajf6pho4zyqqcwg@sirius.home.kraxel.org>
 <CAKMK7uG5D9YeYgSx+H0v+g7uGt5bEnDyAij=mokQS8Qgez4Ukw@mail.gmail.com>
 <20191121081021.ehm27mlsst76wtmk@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121081021.ehm27mlsst76wtmk@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.3.0-1-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TmQGSJJ2m/6KFTeFbF1y4/QTinOnHRlvYqUeanwYFLk=;
 b=VWsH/XfHjDGEAXFc7Txx8HGijysCk8dStGuLkB2u0H4yhKN0jEGMJztx5M/+jaC63P
 CXCwoU3uxZMGFb0KI7Aqm5XGDvwKvx+hXzRhnNx7k+s7DpQxIhuDA6I4Ej4F7fNZwhOa
 pKmHoZK7e3rfuDnz+iS9sdXiTXmXazkRRWmRk=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDk6MTA6MjFBTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiAgIEhpLAo+IAo+ID4gQXNpZGU6IHRoZSBhbWRncHUgaXNuJ3QgZ3JlYXQgYmVjYXVz
ZSBpdCdzIHJhY3ksIHVzZXJzcGFjZSBjb3VsZCBoYXZlCj4gPiBndWVzc2VkIHRoZSBmZCBhbmQg
YWxyZWFkeSBzdGFydGVkIGFuIG1tYXAgYmVmb3JlIHdlIG1hbmFnZWQgdG8gdXBkYXRlCj4gPiBz
dHVmZi4KPiAKPiBDYW4ndCBzZWUgdGhhdCByYWNlLiAgV2hlbiBJIHJlYWQgdGhlIGNvZGUgY29y
cmVjdGx5IHRoZSBmZCBpcyBjcmVhdGVkCj4gYW5kIGluc3RhbGxlZCAodXNpbmcgZG1hX2J1Zl9m
ZCkgb25seSBhZnRlciBkbWFidWYgc2V0dXAgaXMgZmluaXNoZWQuCgpSaWdodCwgSSBtaXhlZCB0
aGluZ3MgdXAuIExvb2tzIGFsbCBnb29kLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
