Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E7E102764
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 15:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC946E25B;
	Tue, 19 Nov 2019 14:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A63E6E25B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:54:02 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJErp3i090121;
 Tue, 19 Nov 2019 08:53:51 -0600
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJEroLd030115
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Nov 2019 08:53:50 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 08:53:50 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 08:53:50 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJErm08081520;
 Tue, 19 Nov 2019 08:53:48 -0600
Subject: Re: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
To: Tony Lindgren <tony@atomide.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-34-sebastian.reichel@collabora.com>
 <20191118230535.GG35479@atomide.com>
 <e91c7fc9-18e0-cc22-4617-127fe9be2c1b@ti.com>
 <20191119143243.GH35479@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <edff7dfa-8b95-48ac-59e0-14553f3c8d39@ti.com>
Date: Tue, 19 Nov 2019 16:53:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119143243.GH35479@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574175231;
 bh=pFAdUqZPr58xWVCR6+pIGTZ+S0Xmfh873qkjFZpwL5Y=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=lNOP6StDUqrqjMQPgW8RK/XQVwTaAZ4Z4ls0/bhehSqG/l7k92VzhgPYL/a9qL+1u
 N9SbM2u4xKFxZWODLM/TVAYeQ650nXRzp0qDMKFBJqyULu/XmSS7xJhPYUJbFAoq5d
 AEMOeDDh9cCnltPEgB5jqfcS/dKncCw9Yq1JlOlw=
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTkvMTEvMjAxOSAxNjozMiwgVG9ueSBMaW5kZ3JlbiB3cm90ZToKCj4+IFdlIGhhdmVuJ3Qg
aGFkIG9tYXBfZ2VtX29wX2ZpbmlzaCgpIGluIHRoZSBrZXJuZWwgZm9yIHNvbWUgeWVhcnMgbm93
Li4uCj4+Cj4+IFNob3VsZG4ndCBhIG5vcm1hbCBwYWdlIGZsaXAsIG9yIGlmIGRvaW5nIHNpbmds
ZS1idWZmZXJpbmcsIHVzaW5nIHRoZQo+PiBkaXJ0eWZiIGlvY3RsLCBkbyB0aGUgam9iPwo+IAo+
IEl0IGRvZXMgbm90IHNlZW0gdG8gaGFwcGVuIHdpdGggdGhlIG9sZCBwdnItb21hcDQgcmVsYXRl
ZCBwYXRjaGVzCj4gYW5kIHdoYXRldmVyIGdsZXMgcmVsYXRlZCB0ZXN0cyBhdCBsZWFzdC4gSWYg
eW91IGhhdmUgc29tZSBpZGVhCj4gd2hlcmUgaXQgc2hvdWxkIGdldCBjYWxsZWQgSSBjYW4gdGFr
ZSBhIGxvb2sgYXQgc29tZSBwb2ludC4KClRoZSB1c2Vyc3BhY2UgYXBwcyBuZWVkIHRvIGRvIHRo
aXMuIElmIHRoZXkncmUgdXNpbmcgc2luZ2xlLWJ1ZmZlcmluZywgCnRoZW4gdXNpbmcgdGhlIGRp
cnR5ZmIgaW9jdGwgc2hvdWxkIGRvIHRoZSB0cmljaywgYWZ0ZXIgdGhlIFNHWCBoYXMgCmZpbmlz
aGVkIGRyYXdpbmcuCgpJdCdzIHByb2JhYmx5IHNvbWV3aGF0IGRpZmZpY3VsdCBpZiBFR0wgaXMg
Y29udHJvbGxpbmcgdGhlIGRpc3BsYXksIGFzLCAKYWZhaWssIFNHWCBFR0wgaXMgY2xvc2VkIHNv
dXJjZSwgYW5kIHRoYXQncyBwcm9iYWJseSB3aGVyZSBpdCBzaG91bGQgYmUgCmRvbmUuCgpCdXQg
YWRkaW5nIGJhY2sgdGhlIGhhY2t5IG9tYXAgZ2VtIHN5bmMgc3R1ZmYsIGFuZCB0aGVuIHNvbWVo
b3cgZ3Vlc3NpbmcgCmZyb20gdGhlIHN5bmMgZmluaXNoIHRoYXQgc29tZSBkaXNwbGF5IG5lZWRz
IHRvIGJlIHVwZGF0ZWQuLi4gSXQganVzdCAKZG9lcyBub3Qgc291bmQgcmlnaHQgdG8gbWUuCgog
IFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIy
LCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBh
aWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
