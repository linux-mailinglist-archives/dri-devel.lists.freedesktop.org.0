Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA374925BB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 16:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8116B6E132;
	Mon, 19 Aug 2019 14:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4B56E132
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:02:19 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2FB2E811A9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:02:19 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id h3so5301370wrw.7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 07:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PUIjNZIKR9LCnddltfWlb7W4sRr7FHdtzbFD6nc+9Kw=;
 b=iHJ1FOuROqABqQf1gMHxLSuaFdC9aurH6hE8xAPJH5LxB571h1jkAtbb8x47Yi9qGX
 t2a62c9Bd5g7TG+aXOcm9tI0wqz+OkJZ8tcbt1UTdxDkmn4A7AkLtBm0mNBuCuoPnvCO
 f4tGdf7trX3kM5rXI4Mi77llUh2zA0pgHCRe1gR1MvzJeF+ilsxBqd/WVQjm6OQTEvO0
 OVjUp+U0foMjIW7nsAn+qlAvS73Kzh4e3kymOyGbOv/n7tT6JjyLDjxvz3bmvgBwWnbh
 I54gwhJoInfbdAt3ZBAOjd0MA1//qKXRTKnWhzGGhyMB69BE6HrL8T8kfX8HAllyBeqn
 MY1Q==
X-Gm-Message-State: APjAAAVsJ/UFuUiPvipk9CkOBEcx/wZOF5wx9knyWfr3cQELCSmjmnqa
 tGwGETPXCpt231pyEPWdilE55O5ihMEg8G3Gb+8Om7RLdf1Eo1xW7S6OppdMjfd7g4I3Z7xmeO6
 PqHYuKV0wd9F+eDKxYor54xXl5KnX
X-Received: by 2002:a7b:c947:: with SMTP id i7mr21323294wml.77.1566223337909; 
 Mon, 19 Aug 2019 07:02:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw3IF0kXS9esJmdxJ0xt2LFC6UgPAqOlxQ49z0GzdlVFp83a7DxuX7k+SUbSlwpyckWuDZKNQ==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr21323271wml.77.1566223337666; 
 Mon, 19 Aug 2019 07:02:17 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id q20sm48314455wrc.79.2019.08.19.07.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2019 07:02:17 -0700 (PDT)
Subject: Re: [PATCH] efifb: BGRT: Improve efifb_bgrt_sanity_check
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20190721131918.10115-1-hdegoede@redhat.com>
 <CGME20190817084100epcas3p15bc1b42c02d8d86969a4a403896d6fee@epcas3p1.samsung.com>
 <a94c96de-16a5-7b52-a964-f8974e867a65@redhat.com>
 <9da1b656-4640-fe16-9def-fe6c069ed39e@samsung.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <7a2f6fed-c059-6d56-52e5-326f0e44bc6f@redhat.com>
Date: Mon, 19 Aug 2019 16:02:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9da1b656-4640-fe16-9def-fe6c069ed39e@samsung.com>
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, Peter Jones <pjones@redhat.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxOS0wOC0xOSAxNjowMSwgQmFydGxvbWllaiBab2xuaWVya2lld2ljeiB3cm90ZToK
PiAKPiBPbiA4LzE3LzE5IDEwOjQwIEFNLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+PiBIaSwKPiAK
PiBIaSBIYW5zLAo+IAo+PiBPbiAyMS0wNy0xOSAxNToxOSwgSGFucyBkZSBHb2VkZSB3cm90ZToK
Pj4+IEZvciB2YXJpb3VzIHJlYXNvbnMsIGF0IGxlYXN0IHdpdGggeDg2IEVGSSBmaXJtd2FyZXMs
IHRoZSB4b2Zmc2V0IGFuZAo+Pj4geW9mZnNldCBpbiB0aGUgQkdSVCBpbmZvIGFyZSBub3QgYWx3
YXlzIHJlbGlhYmxlLgo+Pj4KPj4+IEV4dGVuc2l2ZSB0ZXN0aW5nIGhhcyBzaG93biB0aGF0IHdo
ZW4gdGhlIGluZm8gaXMgY29ycmVjdCwgdGhlCj4+PiBCR1JUIGltYWdlIGlzIGFsd2F5cyBleGFj
dGx5IGNlbnRlcmVkIGhvcml6b250YWxseSAodGhlIHlvZmZzZXQgdmFyaWFibGUKPj4+IGlzIG1v
cmUgdmFyaWFibGUgYW5kIG5vdCBhbHdheXMgcHJlZGljdGFibGUpLgo+Pj4KPj4+IFRoaXMgY29t
bWl0IHNpbXBsaWZpZXMgLyBpbXByb3ZlcyB0aGUgYmdydF9zYW5pdHlfY2hlY2sgdG8gc2ltcGx5
Cj4+PiBjaGVjayB0aGF0IHRoZSBCR1JUIGltYWdlIGlzIGV4YWN0bHkgY2VudGVyZWQgaG9yaXpv
bnRhbGx5IGFuZCBza2lwcwo+Pj4gKHJlKWRyYXdpbmcgaXQgd2hlbiBpdCBpcyBub3QuCj4+Pgo+
Pj4gVGhpcyBmaXhlcyB0aGUgQkdSVCBpbWFnZSBzb21ldGltZXMgYmVpbmcgZHJhd24gaW4gdGhl
IHdyb25nIHBsYWNlLgo+Pj4KPj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+PiBGaXhl
czogODhmZTRjZWIyNDQ3ICgiZWZpZmI6IEJHUlQ6IERvIG5vdCBjb3B5IHRoZSBib290IGdyYXBo
aWNzIGZvciBub24gbmF0aXZlIHJlc29sdXRpb25zIikKPj4+IFNpZ25lZC1vZmYtYnk6IEhhbnMg
ZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4+Cj4+IHBpbmc/IEkgZG8gbm90IHNlZSB0
aGlzIG9uZSBpbiAtbmV4dCB5ZXQsIHdoYXQgaXMgdGhlIHN0YXR1cyBvZiB0aGlzCj4+IHBhdGNo
Pwo+IFBhdGNoIHF1ZXVlZCBmb3IgdjUuNCwgdGhhbmtzIGFuZCBzb3JyeSBmb3IgdGhlIGRlbGF5
LgoKTm8gcHJvYmxlbSwgdGhhbmsgeW91IGFsbCB0aGUgbWFpbnRhaW5lciB3b3JrIHlvdSBkbyBv
biBmYmRldi4KClJlZ2FyZHMsCgpIYW5zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
