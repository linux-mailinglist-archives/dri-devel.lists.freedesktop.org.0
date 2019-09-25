Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 883DDBE564
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 21:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF2F6EE12;
	Wed, 25 Sep 2019 19:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590F76EE12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 19:11:01 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-p8JqDQ71M46SqvByn-Oj1Q-1; Wed, 25 Sep 2019 15:10:53 -0400
Received: by mail-qt1-f200.google.com with SMTP id c8so545960qtd.20
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 12:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=62dwixw1TVUqmQpy0dEAbmg1dKirZ9BTTZ/xPasxv7w=;
 b=Htv+Y/Brk4ofK0BYIoEFfRtnhVsQmTqmsi0Z1jYQvltSNcClDG7lRcBqe/7PUmM1pt
 4gaIyfjOa6YLxNkhvycCC5H8yAFdBDP5WY9KdqYv7z3X0eCDHz0VP8fysXXg3oTkgXvw
 MLXzADqHxnLXpkP1CmX14Tw4HY31VfsdV4YQvKrZdNWaUN1+rBM8d6MnD4iW9vZ2xqCt
 irNP7wSx2nuXSWfthHqs3Lgn8kHs9DeBQtbt7T6PVcLCxNeK6YSUI2uXNe5yN03aYctu
 8IrxVOwha2JR5lHeT2RfPMk0tZWoAfxrT1J6NXvN0aFsCnvshXoKxaioMPtVl8Cbgdl8
 V3Lg==
X-Gm-Message-State: APjAAAV1ChkDgP5rm237Y8NnoSWnG/UaMiER5UKFsh2rDK/uu1eyibVZ
 ZLOmny+Med8i/6soNxlGLMv6BKzTLwMv+SkEn1zISnXpyTEU+4HYW7nTDx0R4e0Ee9fHVW9s5mj
 F/Bq+PDrfFt9lBBJqTaw0jtFE4Tqw
X-Received: by 2002:ac8:4293:: with SMTP id o19mr1000209qtl.138.1569438652968; 
 Wed, 25 Sep 2019 12:10:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5X/ayjLC6F72bAgUlcHOuQ1hiUgngIVlsIsuehJbNMyaLHmKnJxZ/HdUAQS2prInNhkNhHw==
X-Received: by 2002:ac8:4293:: with SMTP id o19mr1000194qtl.138.1569438652696; 
 Wed, 25 Sep 2019 12:10:52 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id l48sm340251qtb.50.2019.09.25.12.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 12:10:51 -0700 (PDT)
Message-ID: <3fa09bd0ce97546afc1077d4a7a11122bb7dcbdf.camel@redhat.com>
Subject: Re: [PATCH 1/3] drm/dp/mst: Reduce nested ifs
From: Lyude Paul <lyude@redhat.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Wed, 25 Sep 2019 15:10:51 -0400
In-Reply-To: <20190925141442.23236-1-ville.syrjala@linux.intel.com>
References: <20190925141442.23236-1-ville.syrjala@linux.intel.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: p8JqDQ71M46SqvByn-Oj1Q-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1569438660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNetGW2Ksc9fNsF/xxuQamV/7i9Uwf2Od7tIUzpCNFY=;
 b=V9f0oiLjw5pJE7upceZWXT/SnRwAmg9LxRfucc6L7lTJS1e9Tl4jN7SGwa0lsms5TPCMhw
 CLVq17G1F4FXCeBKr7K7E9piapsvKj1e/FGtCvsgXnBbsQo0oCJlEVxH2MX6NZo3r6cqGw
 anoYh/YM49a7pxIJaCJXpMPvZKaRGPk=
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBXZWQsIDIwMTkt
MDktMjUgYXQgMTc6MTQgKzAzMDAsIFZpbGxlIFN5cmphbGEgd3JvdGU6Cj4gRnJvbTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAKPiBSZXBsYWNlIHRo
ZSBuZXN0ZWQgaWZzIHdpdGggYSBzaW5nbGUgaWYgYW5kIGEgbG9naWNhbCBBTkQuCj4gCj4gQ2M6
IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDEwICsrKysrLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGIvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGluZGV4IDk3MjE2MDk5YTcxOC4uZTI1NTk3ZWIzY2Ex
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gQEAgLTExMjMsMTEg
KzExMjMsMTEgQEAgc3RhdGljIHZvaWQgZHJtX2RwX21zdF9wdXRfcGF5bG9hZF9pZChzdHJ1Y3QK
PiBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAo+ICAJY2xlYXJfYml0KHZjcGkgLSAxLCAm
bWdyLT52Y3BpX21hc2spOwo+ICAKPiAgCWZvciAoaSA9IDA7IGkgPCBtZ3ItPm1heF9wYXlsb2Fk
czsgaSsrKSB7Cj4gLQkJaWYgKG1nci0+cHJvcG9zZWRfdmNwaXNbaV0pCj4gLQkJCWlmIChtZ3It
PnByb3Bvc2VkX3ZjcGlzW2ldLT52Y3BpID09IHZjcGkpIHsKPiAtCQkJCW1nci0+cHJvcG9zZWRf
dmNwaXNbaV0gPSBOVUxMOwo+IC0JCQkJY2xlYXJfYml0KGkgKyAxLCAmbWdyLT5wYXlsb2FkX21h
c2spOwo+IC0JCQl9Cj4gKwkJaWYgKG1nci0+cHJvcG9zZWRfdmNwaXNbaV0gJiYKPiArCQkgICAg
bWdyLT5wcm9wb3NlZF92Y3Bpc1tpXS0+dmNwaSA9PSB2Y3BpKSB7Cj4gKwkJCW1nci0+cHJvcG9z
ZWRfdmNwaXNbaV0gPSBOVUxMOwo+ICsJCQljbGVhcl9iaXQoaSArIDEsICZtZ3ItPnBheWxvYWRf
bWFzayk7Cj4gKwkJfQo+ICAJfQo+ICAJbXV0ZXhfdW5sb2NrKCZtZ3ItPnBheWxvYWRfbG9jayk7
Cj4gIH0KLS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
