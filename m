Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3B1D3D3F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 12:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2E76E086;
	Fri, 11 Oct 2019 10:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C496E086
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 10:25:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BAPLSw113550;
 Fri, 11 Oct 2019 05:25:21 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9BAPL3m044776
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Oct 2019 05:25:21 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 05:25:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 05:25:17 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BAPJul107727;
 Fri, 11 Oct 2019 05:25:19 -0500
Subject: Re: [PATCHv2 7/7] drm/omap: hdmi4: fix use of uninitialized var
To: Tony Lindgren <tony@atomide.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
 <20190930103840.18970-8-tomi.valkeinen@ti.com>
 <20191008141335.GB5610@atomide.com>
 <ffb498fb-5041-d3e9-2702-879f3d389adf@ti.com>
 <20191008142153.GD5610@atomide.com>
 <59381248-5ded-7ea9-40a6-cbfb58a3c5b1@ti.com>
 <20191010132407.GS5610@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <d7cb0f2a-1645-29ff-aaf2-2ec5188dbc24@ti.com>
Date: Fri, 11 Oct 2019 13:25:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010132407.GS5610@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570789521;
 bh=k02BI/6YnixZV6Y7oYQEPBkyLz2KEQYQKTYvcuruyMs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=MAqxw7nvetO4lZ5Ootqkjazx2nz0BN85f3eBKr1ZuPBaFpyF67MQOP/+8p6aSKpAC
 Vv3b9y+bsVJhmXwtj06Fti2v0Mgd0O8/73ycN2D8blTqj2gUNRvDtQLUQz070FyAWe
 2bqlxhi9V4Sz5ec+hq0qmkKl21LxDik8R+HSjNyU=
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-omap@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMTAvMjAxOSAxNjoyNCwgVG9ueSBMaW5kZ3JlbiB3cm90ZToKCj4gSG1tIHNvIHdoYXQg
cmVnaXN0ZXIgZG9lcyB0aGlzIGNsb2NrIGFjdHVhbGx5IGNoYW5nZT8KPiAKPiBJJ20gc2VlaW5n
IGFuIGluY3JlYXNlIG9mIGZldyB0ZW5zIG9mIGV4dHJhIG1XLCB3aGljaCBtZWFucyBhdAo+IGxl
YXN0IG9uZSBkYXkgb2Ygc3RhbmRieSB0aW1lIGxlc3MgZm9yIG1lIDopIEl0IGRvZXMgbm90IGhh
cHBlbgo+IGFsd2F5cywgbWF5YmUgaGFsZiBvZiB0aGUgdGltZS4KCkkgaGF2ZSBubyBpZGVhIHdo
eSB0aGlzIHdvdWxkIGFmZmVjdCBwb3dlciBjb25zdW1wdGlvbi4gQXMgZmFyIGFzIEkgY2FuIAp1
bmRlcnN0YW5kLCB0aGUgYml0cyB3cml0dGVuIGhlcmUgYXJlIGEgY2xrIGRpdmlkZXIgTUNMSy4g
SSBkb24ndCBzZWUgCndoeSB0aGF0IHdvdWxkIGFmZmVjdC4KCk1heWJlIEp5cmkgb3IgUGV0ZXIg
aGFzIGFuIGlkZWEsIEkgaGF2ZSBuZXZlciBsb29rZWQgYXQgdGhlIEhETUkgYXVkaW8gc2lkZS4K
CiAgVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUg
MjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3Rp
cGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
