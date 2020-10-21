Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D6A295223
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 20:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06D96EE63;
	Wed, 21 Oct 2020 18:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532F66EE48
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 18:21:29 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id t25so4569934ejd.13
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 11:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lBYBT2trM0zWLuScJPu/8MEsMxH22DaNGgcD4PxkzgM=;
 b=aI4DCgQQ2pNgP8FJefkPAHWyeYDZ6gBOdUW5ASwTjCdJPt6/F0D5IUw+ryIpjQNXm7
 gK4+rVdRij2UezhsYNKjky15pbLyx71SXm/fZWi7e8Q4m+RVncNlw0/EQHwWG71kG1jW
 swatZpkYTu5yAZOXhuMbyP3n0EJyZ6Tj4Y/cuYa29u3olktUJdc4M4TJ2rd4I+0DOH8g
 zGBna8sz6bZsljPuc9avDUo1nfa6ddJFnaen4gYQFZ8z/YYqPo9kDiLM1CATyUVyGmG8
 pnWq4b5N/m5mvr9ZCnxufY7oD2D56MpGg2WZMNT6wzDAol9vlUAst1BSJiogsIkNya2g
 yS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lBYBT2trM0zWLuScJPu/8MEsMxH22DaNGgcD4PxkzgM=;
 b=Cg5b4sB28oDz0ctV+ZkN33gLu8aRAMwyPyPqORi7tC55aev4IzO+aRCq68v0tsSc6m
 34cClmWSnRfneuKPuMCMwCWAFS/5EZdW/hONU3LWVVkj/iLa7Y9qarR5aOf6NY5M71hU
 lUa2SfkOaPMfvp5XXk6FMz5d2djWPdZZNtDxXX4a2+waEh/mak1SwfY+EFchNKdWtJ60
 enR3nDvTFjd278D9X7KpphaaukvMIr2FEuMS3OwCU66nsg4AbiSbCe5m9jFzMD3yZV53
 SfrgA4PIs0ktpGE04Q0Z53yDHrU12AvySfTK0OTHSrDC632DqIo+Id9+xAAsqHGRb1Zm
 29dw==
X-Gm-Message-State: AOAM532RAygvmQV13rWIYYWvjstyEIAYv+WKuOE4uNW7Bb3feIaDqAp6
 znD445KoYjiHAdMHmoKNvs5gitkKlUZ0HFwM7dMa7w==
X-Google-Smtp-Source: ABdhPJzA1jSls/Kx/Mwjc1+1+EpDhh/HoRUDuIKQ8K0ggJGziicPcEE6tEKertKBv/kwHwmxQELgJDflTG3MPc+CL3w=
X-Received: by 2002:a17:906:c20f:: with SMTP id
 d15mr4627011ejz.341.1603304487981; 
 Wed, 21 Oct 2020 11:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
 <20201021085655.1192025-14-daniel.vetter@ffwll.ch>
In-Reply-To: <20201021085655.1192025-14-daniel.vetter@ffwll.ch>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 21 Oct 2020 11:21:17 -0700
Message-ID: <CAPcyv4jJTeH-PNjsXGrn=Ooz7=9rsZLdnFgwJ9xpQ6y14YoDrQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/16] /dev/mem: Only set filp->f_mapping
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjEsIDIwMjAgYXQgMTo1NyBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPgo+IFdoZW4gd2UgY2FyZSBhYm91dCBwYWdlY2FjaGUgbWFp
bnRlbmFuY2UsIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQKPiBib3RoIGZfbWFwcGluZyBhbmQg
aV9tYXBwaW5nIHBvaW50IGF0IHRoZSByaWdodCBtYXBwaW5nLgo+Cj4gQnV0IGZvciBpb21lbSBt
YXBwaW5ncyB3ZSBvbmx5IGNhcmUgYWJvdXQgdGhlIHZpcnR1YWwvcHRlIHNpZGUgb2YKPiB0aGlu
Z3MsIHNvIGZfbWFwcGluZyBpcyBlbm91Z2guIEFsc28gc2V0dGluZyBpbm9kZS0+aV9tYXBwaW5n
IHdhcwo+IGNvbmZ1c2luZyBtZSBhcyBhIGRyaXZlciBtYWludGFpbmVyLCBzaW5jZSBpbiBlLmcu
IGRyaXZlcnMvZ3B1IHdlCj4gZG9uJ3QgZG8gdGhhdC4gUGVyIERhbiB0aGlzIHNlZW1zIHRvIGJl
IGNvcHlwYXN0YSBmcm9tIHBsYWNlcyB3aGljaCBkbwo+IGNhcmUgYWJvdXQgcGFnZWNhY2hlIGNv
bnNpc3RlbmN5LCBidXQgbm90IG5lZWRlZC4gSGVuY2UgcmVtb3ZlIGl0IGZvcgo+IHNsaWdodGx5
IGxlc3MgY29uZnVzaW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgo+
IENjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiBDYzogRGFuIFdpbGxpYW1z
IDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGlu
dXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNv
bT4KPiBDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gQ2M6IEphbiBL
YXJhIDxqYWNrQHN1c2UuY3o+Cj4gQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50
ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwu
Y29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
