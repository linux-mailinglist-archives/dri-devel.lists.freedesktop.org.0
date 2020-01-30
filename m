Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 637B114E515
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 22:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE50089F69;
	Thu, 30 Jan 2020 21:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC0B89F61
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 21:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580421003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tDNWgCst0GDwyM8nTpF4hXu76x1sJCVKLSJtmSAtsWY=;
 b=Mq0oat01Nerv0DtLEACdA6cw+E2Tb0UdDvFMUQnCXJtEOV1laKNNSPazkBfXScWQC3it6A
 JPKY+MyQUnYhCPer9cZFsAw3yNYRXciqc4NEuOWu0O/v2qMDiQAPKrsDfKY79hBLPd8DMA
 NJ4AOqx8Pw2jsFicceFhqCD02GTvrJM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-XOzxuZvMO1eJjZQFONM0VQ-1; Thu, 30 Jan 2020 16:50:01 -0500
Received: by mail-qv1-f70.google.com with SMTP id l5so3073621qvq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 13:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=wMFzh29HDDMklefP8G6zmTI9HttNs9lrEUG8LsvM26Q=;
 b=TvDRd/2Of9ec11fWtWThW1iGwyy9fN7kfEIhiTc9mge0k7a/B+cX48S2NkkTe33v8E
 nZrhchPyV0d85i7Jm8HL6FPGdMaP+fQlLscQCDnqy6t8oDyfm3OgzAj1k6L47VQ0IAT5
 df2LJ4XlvU7B8wtZ37DNM79URJPTD2w7Hvm2ojTKWUguvFRZBmHrnjeur4WDSfrW7+Ir
 9Jh51VXW3BeOTfSDCU7Vqq4RX7eR4nEsJ8qigVCf+DNv4qoLeX+P+3bB28osvHBMIOFG
 XVj9aNlgS97lEL3wMwobPN1baDoNGBdZb4MZM5L4h0KvP1mji030TycUoXFBfi1xrqGl
 vqYQ==
X-Gm-Message-State: APjAAAWnGvRiRioJiLysXA4v4cm9fZ+fnxzaDZ5wIznOr5iea6iFKIfd
 dMMtUIgRtUId6mXgpGadFsLP8oexRXb4inycSS6kD7IihW+RYzew6DxvpNGQ6oFmB1cTDVrNqAA
 RMXx1SExcL7q0StypETbQFYe9nITE
X-Received: by 2002:a37:488f:: with SMTP id v137mr7550584qka.16.1580421001119; 
 Thu, 30 Jan 2020 13:50:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxvpyuTWgiHuk6OW/l51Jh/jS5tBwsmniUIcPwilBcn9BjCJhQTU+sOOWjQ8+KqtoBcHhe+og==
X-Received: by 2002:a37:488f:: with SMTP id v137mr7550514qka.16.1580421000264; 
 Thu, 30 Jan 2020 13:50:00 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id p92sm3750984qtd.14.2020.01.30.13.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 13:49:59 -0800 (PST)
Message-ID: <8d87e97fcfd970a08ce178c27a0dda0f7b085e11.camel@redhat.com>
Subject: Re: [PATCH] drm/mst: Fix possible NULL pointer dereference in
 drm_dp_mst_process_up_req()
From: Lyude Paul <lyude@redhat.com>
To: =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 30 Jan 2020 16:49:58 -0500
In-Reply-To: <20200129232448.84704-1-jose.souza@intel.com>
References: <20200129232448.84704-1-jose.souza@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31)
MIME-Version: 1.0
X-MC-Unique: XOzxuZvMO1eJjZQFONM0VQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: intel-gfx@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpJJ2xsIGdvIGFoZWFk
IGFuZCBwdXNoIHRoaXMgbm93LCB0aGFua3MhCgpPbiBXZWQsIDIwMjAtMDEtMjkgYXQgMTU6MjQg
LTA4MDAsIEpvc8OpIFJvYmVydG8gZGUgU291emEgd3JvdGU6Cj4gQWNjb3JkaW5nIHRvIERQIHNw
ZWNpZmljYXRpb24sIERQX1NJTktfRVZFTlRfTk9USUZZIGlzIGFsc28gYQo+IGJyb2FkY2FzdCBt
ZXNzYWdlIGJ1dCBhcyB0aGlzIGZ1bmN0aW9uIG9ubHkgaGFuZGxlcwo+IERQX0NPTk5FQ1RJT05f
U1RBVFVTX05PVElGWSBJIHdpbGwgb25seSBtYWtlIHRoZSBzdGF0aWMKPiBhbmFseXplciB0aGF0
IGNhdWdodCB0aGlzIGlzc3VlIGhhcHB5IGJ5IG5vdCBjYWxsaW5nCj4gZHJtX2RwX2dldF9tc3Rf
YnJhbmNoX2RldmljZV9ieV9ndWlkKCkgd2l0aCBhIE5VTEwgZ3VpZCwgY2F1c2luZwo+IGRybV9k
cF9tc3RfcHJvY2Vzc191cF9yZXEoKSB0byByZXR1cm4gaW4gdGhlICJpZiAoIW1zdGIpIiByaWdo
dAo+IGJlbGxvdy4KPiAKPiBGaXhlczogOTQwOGNjOTRlYjA0ICgiZHJtL2RwX21zdDogSGFuZGxl
IFVQIHJlcXVlc3RzIGFzeW5jaHJvbm91c2x5IikKPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVk
aGF0LmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gU2lnbmVkLW9mZi1i
eTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAzICsrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBpbmRleCAyM2NmNDZiZmVmNzQuLmE4MTEyNDdjZWNm
ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC0zODI5LDcg
KzM4MjksOCBAQCBkcm1fZHBfbXN0X3Byb2Nlc3NfdXBfcmVxKHN0cnVjdAo+IGRybV9kcF9tc3Rf
dG9wb2xvZ3lfbWdyICptZ3IsCj4gIAkJZWxzZSBpZiAobXNnLT5yZXFfdHlwZSA9PSBEUF9SRVNP
VVJDRV9TVEFUVVNfTk9USUZZKQo+ICAJCQlndWlkID0gbXNnLT51LnJlc291cmNlX3N0YXQuZ3Vp
ZDsKPiAgCj4gLQkJbXN0YiA9IGRybV9kcF9nZXRfbXN0X2JyYW5jaF9kZXZpY2VfYnlfZ3VpZCht
Z3IsIGd1aWQpOwo+ICsJCWlmIChndWlkKQo+ICsJCQltc3RiID0gZHJtX2RwX2dldF9tc3RfYnJh
bmNoX2RldmljZV9ieV9ndWlkKG1nciwKPiBndWlkKTsKPiAgCX0gZWxzZSB7Cj4gIAkJbXN0YiA9
IGRybV9kcF9nZXRfbXN0X2JyYW5jaF9kZXZpY2UobWdyLCBoZHItPmxjdCwgaGRyLT5yYWQpOwo+
ICAJfQotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
