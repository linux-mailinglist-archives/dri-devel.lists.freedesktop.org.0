Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D6735B3D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 13:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C788989A;
	Wed,  5 Jun 2019 11:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE9B8961D;
 Wed,  5 Jun 2019 11:24:43 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d18so19057210wrs.5;
 Wed, 05 Jun 2019 04:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=34OcWZZf5GkIDFILgwfoZTGivtQoRAO+Y0/4qzEgrEw=;
 b=l9caWfmbqxMQhLEDRBghaygpwq44ZjjcH1FXIg6cDxjeMa6x8Ov2+zHFq+TA0RFs0s
 0do03uZxLVikyujxeUvelG8A+8klfcL25uc3xscIrmgRiAIwg7rzZ4CkN5u3f/E+jZ9Q
 Der1G1oYhoXzjRcLWDFNplvZE2aLDdCBGgwwjfW8/+txJGgAI9prfuIt7XMY5saf9cYI
 xWn1acuS6somjEtxIzmcofdwSJq3d4GNdWBAaCT7R8PYqj2M1a72yi2/0FX4xrZNKQe2
 rWHmuR4kadNAPbjTL0xSqRaeYqwNThnmHf+e6UCvUDGYbFoOwuVBf1HLL/qFavMF21f0
 K9xw==
X-Gm-Message-State: APjAAAVRNFfNpeKIPJPoyKOQQYZ+VVhirAi+fh54Gt9Cc45NmfSafpA4
 qeC0Ug0dzr3y16gkS50yF8sEhhgg
X-Google-Smtp-Source: APXvYqw/DnCetvqDiTZO+NwVVdgOQdtyP/CNrXf+rXuGTPt/ExbrHgdKOB4ioIbonoUXnyGX7sGJmw==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr8722077wru.264.1559733882161; 
 Wed, 05 Jun 2019 04:24:42 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b8sm15966779wrr.88.2019.06.05.04.24.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 04:24:41 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: fix ttm_bo_unreserve
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190604152306.1804-1-christian.koenig@amd.com>
 <497dc76b-4752-59cf-a9a4-8fdf8c608383@amd.com>
 <BL0PR12MB2580B3E88C17043DE402CF3280150@BL0PR12MB2580.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5a0f4e09-2614-5bbc-b8a2-53746bbb0b15@gmail.com>
Date: Wed, 5 Jun 2019 13:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <BL0PR12MB2580B3E88C17043DE402CF3280150@BL0PR12MB2580.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=34OcWZZf5GkIDFILgwfoZTGivtQoRAO+Y0/4qzEgrEw=;
 b=VPX3MJNHF/60VTf/QCJRH32UX82qy3227hz2tXFUK9OmlQToVj6QnpqeV/+5EFJmUR
 Q01Godi9lM6G7fXDKcyv2XWN77RCFxTMIHWuZXXwtOnQsm7V4pv0WsY+s66cGKBR4txS
 w9VHRD6ttXN3mvuPGqYp0yDPcmZpk32pGswJpU/Muko57+Z6PyPDKS2rOraQdK6+rOYh
 QVhRhi2omvGjnA4Q84AxxpbpL2P4uOT+T+emOeXPnZc/A+aVjFRZfDA+jyFbD+NLFwOK
 cRSAnhGM169p2U6/EIhsSCVQW4zDzULmszGq6b0DFJCX70Zm15zowulnhxoADxVFllYh
 YyRQ==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDYuMTkgdW0gMjE6MDMgc2NocmllYiBaZW5nLCBPYWs6Cj4KPiBSZWdhcmRzLAo+IE9h
awo+Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgS3VlaGxpbmcsIEZl
bGl4Cj4gU2VudDogVHVlc2RheSwgSnVuZSA0LCAyMDE5IDI6NDcgUE0KPiBUbzogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+OyBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIGRybS90dG06IGZpeCB0dG1fYm9fdW5yZXNlcnZlCj4KPiBPbiAyMDE5
LTA2LTA0IDExOjIzLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Cj4+IFNpbmNlIHdlIG5vdyBr
ZWVwIEJPcyBvbiB0aGUgTFJVIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgdGhleSBhcmUKPj4g
cmVtb3ZlZCB3aGVuIHRoZXkgYXJlIHBpbm5lZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+PiAtLS0KPj4gICAgaW5jbHVk
ZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCB8IDE0ICsrKysrKy0tLS0tLS0tCj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4+IGIvaW5jbHVkZS9kcm0vdHRt
L3R0bV9ib19kcml2ZXIuaCBpbmRleCA5ZjU0Y2Y5YzYwZGYuLmM5YjhiYTQ5MmYyNAo+PiAxMDA2
NDQKPj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+PiArKysgYi9pbmNs
dWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4+IEBAIC03NjcsMTQgKzc2NywxMiBAQCBzdGF0
aWMgaW5saW5lIGludCB0dG1fYm9fcmVzZXJ2ZV9zbG93cGF0aChzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QgKmJvLAo+PiAgICAgKi8KPj4gICAgc3RhdGljIGlubGluZSB2b2lkIHR0bV9ib191bnJl
c2VydmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPj4gICAgewo+PiAtCWlmICghKGJv
LT5tZW0ucGxhY2VtZW50ICYgVFRNX1BMX0ZMQUdfTk9fRVZJQ1QpKSB7Cj4+IC0JCXNwaW5fbG9j
aygmYm8tPmJkZXYtPmdsb2ItPmxydV9sb2NrKTsKPj4gLQkJaWYgKGxpc3RfZW1wdHkoJmJvLT5s
cnUpKQo+PiAtCQkJdHRtX2JvX2FkZF90b19scnUoYm8pOwo+PiAtCQllbHNlCj4+IC0JCQl0dG1f
Ym9fbW92ZV90b19scnVfdGFpbChibywgTlVMTCk7Cj4+IC0JCXNwaW5fdW5sb2NrKCZiby0+YmRl
di0+Z2xvYi0+bHJ1X2xvY2spOwo+PiAtCX0KPj4gKwlzcGluX2xvY2soJmJvLT5iZGV2LT5nbG9i
LT5scnVfbG9jayk7Cj4+ICsJaWYgKGxpc3RfZW1wdHkoJmJvLT5scnUpKQo+PiArCQl0dG1fYm9f
YWRkX3RvX2xydShibyk7Cj4+ICsJZWxzZQo+PiArCQl0dG1fYm9fbW92ZV90b19scnVfdGFpbChi
bywgTlVMTCk7Cj4gR29pbmcganVzdCBieSB0aGUgZnVuY3Rpb24gbmFtZXMsIHRoaXMgc2VlbXMg
dG8gZG8gdGhlIGV4YWN0IG9wcG9zaXRlIG9mIHdoYXQgdGhlIGNoYW5nZSBkZXNjcmlwdGlvbiBz
YXlzLgo+Cj4gW09ha10gKzEsIHdoZW4gSSByZWFkIHRoZSBkZXNjcmlwdGlvbiwgSSBhbHNvIGdl
dCBsb3N0Li4uU28gcGxlYXNlIGRvIGFkZCBhIG1vcmUgYWNjdXJhdGUgZGVzY3JpcHRpb24uCgpJ
J20gcHV6emxlZCB3aHkgeW91IGFyZSBjb25mdXNlZC4gV2Ugbm93IGtlZXAgdGhlIEJPcyBvbiB0
aGUgTFJVIHdoaWxlIAp0aGV5IGFyZSByZXNlcnZlZCwgc28gb24gdW5yZXNlcnZlIHdlIG5vdyBu
ZWVkIHRvIGV4cGxpY2l0bHkgcmVtb3ZlIHRoZW0gCmZyb20gdGhlIExSVSB3aGVuIHRoZXkgYXJl
IHBpbm5lZC4KCj4KPiBBbndheSwgdGhpcyBwYXRjaCBpcyBSZXZpZXdlZC1ieTogRmVsaXggS3Vl
aGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4KPiBCVFcsIHRoaXMgZml4IGlzIG5lZWRl
ZCBmb3IgS0ZELiBJdCBmaXhlcyBvdXIgZXZpY3Rpb24gdGVzdCB0aGF0IHdhcyBicm9rZW4gYnkg
eW91ciBwcmV2aW91cyBwYXRjaCBzZXJpZXMuIFRoaXMgdGVzdCBzcGVjaWZpY2FsbHkgdHJpZ2dl
cnMgaW50ZXJhY3Rpb25zIGJldHdlZW4gS0ZEIGFuZCBncmFwaGljcyB1bmRlciBtZW1vcnkgcHJl
c3N1cmUuIEl0J3Mgc29tZXRoaW5nIHdlIHJhcmVseSBzZWUgaW4gcmVhbCB3b3JsZCBjb21wdXRl
IGFwcGxpY2F0aW9uIHRlc3Rpbmcgd2l0aG91dCBhIHRhcmdldGVkIHRlc3QuIEJ1dCB3aGVuIGl0
IGJyZWFrcyBpdCBsZWFkcyB0byBzb21lIHBhaW5mdWwgaW50ZXJtaXR0ZW50IGZhaWx1cmVzIHRo
YXQgYXJlIGhhcmQgdG8gcmVncmVzcyBhbmQgZGVidWcuCj4KPiBEbyB5b3UgaGF2ZSBhbnkgdGFy
Z2V0ZWQgdGVzdHMgdG8gdHJpZ2dlciBldmljdGlvbnMgd2hlbiB5b3Ugd29yayBvbiBUVE0gaW50
ZXJuYWxzPwoKQ2F0IGFtZGdwdV9ldmljdF9ndHQgaW4gZGVidWdmcyBpcyBhIGdvb2QgdGVzdCBm
b3IgdGhpcy4KCkNocmlzdGlhbi4KCj4KPiBSZWdhcmRzLAo+ICAgwqAgRmVsaXgKPgo+Cj4+ICsJ
c3Bpbl91bmxvY2soJmJvLT5iZGV2LT5nbG9iLT5scnVfbG9jayk7Cj4+ICAgIAlyZXNlcnZhdGlv
bl9vYmplY3RfdW5sb2NrKGJvLT5yZXN2KTsKPj4gICAgfQo+PiAgICAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0
Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
