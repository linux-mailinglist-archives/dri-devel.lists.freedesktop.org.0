Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B79AE2635EF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 20:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B0D6F490;
	Wed,  9 Sep 2020 18:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E856F490
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 18:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599675978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hlW5Drv0YzWJDBPeOb29SiaflrOgi3f9TisT2mG2y/Q=;
 b=M3ZUCZLUK210t014i6D8qAptpoOk+B1zcbVlPxBf9AkWF3RGUOFMVuXtKWIg4mjNTQiG67
 WY15GjWPXUNpGjIrMxQiaU9dRAtKwqM4o0LJmq0xVS2QYoOkn/cCekzXA1nBFu7DpI5ga1
 1aGGNpW2IFO0gYYFMI2SpajctgdPRpY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-sW94ap4cOCaAJmpDp7tBsw-1; Wed, 09 Sep 2020 14:26:14 -0400
X-MC-Unique: sW94ap4cOCaAJmpDp7tBsw-1
Received: by mail-qt1-f199.google.com with SMTP id e6so2397364qtg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 11:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=hlW5Drv0YzWJDBPeOb29SiaflrOgi3f9TisT2mG2y/Q=;
 b=eJpIue+hIasNvs5s60TvJ/YVhsGUwRhXLu3kQE2H6TbdqudpI6GzVdu+WsjCTGQsN7
 CiETgiTj9LeApKfcSlcBiE+MydaKcUiZaQlM5fesAIBZiRpVZp1VX07f6ueCgU22Gqym
 whqfCUfYD27wISe9X9v3FH9A0vxD+FImy2zd1yBpLmwQJMvLRcP1GIvQwCNtVy2kIyAa
 byvvpqSHHbUDSBTE5VZG3ueihN10xtg3suACPH0lJn//o8CQ+FDwYlIp3I2GfQYrZqHt
 DIOBMuPJpTNgUDZUso6AUCDOlO6BPQqed8505O6pgC75buiTYWSA+ANmxEi971YittQM
 5bdg==
X-Gm-Message-State: AOAM533Gev11bCNY6aBxa6K/dis+KESJRDN1h+XkigAiKW+1JwrzGZ9s
 x7ZSy1I077yRlw1KEo/6F+sEE2hgPu0j4dIcXBLoEQbzaUh2uXycPBKUjFbBXMVXto2da1H8K5P
 xjeppbZtARP9Ttv4C35Bjw9j9tqu2
X-Received: by 2002:a37:aa4d:: with SMTP id t74mr4622647qke.222.1599675974087; 
 Wed, 09 Sep 2020 11:26:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhBZAMGnvfsoFPwNJ7xs1Eyzz9NiXE+YsmwWiMngXhojnSroO/ah7fEEDk1XWYOB3mCb//mA==
X-Received: by 2002:a37:aa4d:: with SMTP id t74mr4622628qke.222.1599675973751; 
 Wed, 09 Sep 2020 11:26:13 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id z29sm3938674qtj.79.2020.09.09.11.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 11:26:13 -0700 (PDT)
Message-ID: <aaf36e7a1be596f831ca2665375632aae9c8e350.camel@redhat.com>
Subject: Re: [PATCH] drm/dp: For MST hub, Get max_link_rate&max_lane from
 extended rx capability field if EXTENDED_RECEIVER_CAPABILITY_FILED_PRESENT
 is set.
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Wed, 09 Sep 2020 14:26:11 -0400
In-Reply-To: <20200909182010.GO6112@intel.com>
References: <20200827053053.11271-1-koba.ko@canonical.com>
 <CAJB-X+WPiUR8N5sLMS2UC-rPHj=TGJy2ezeBPjjeUXzbN5bfcg@mail.gmail.com>
 <b1dcaf433b7ebe2d0284693724f0e7d8a7fa4825.camel@redhat.com>
 <20200909182010.GO6112@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anthony Wong <anthony.wong@canonical.com>, Koba Ko <koba.ko@canonical.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIwLTA5LTA5IGF0IDIxOjIwICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gV2VkLCBTZXAgMDksIDIwMjAgYXQgMTI6MzM6MDlQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3
cm90ZToKPiA+IFdlIGp1c3QgYWRkZWQgYSBuZXcgaGVscGVyIGZvciBEUENEIHJldHJpZXZhbCB0
byBkcm1fZHBfaGVscGVyLmMgKHdoaWNoCj4gPiBhbHNvCj4gPiBoYW5kbGVzIGdyYWJiaW5nIHRo
ZSBleHRlbmRlZCByZWNlaXZlciBjYXBzKSwgd2Ugc2hvdWxkIHByb2JhYmx5IG1ha2UgdXNlCj4g
PiBvZgo+ID4gaXQgaGVyZSAKPiAKPiBTb21lb25lIHNob3VsZCByZWFsbHkgcmV3b3JrIHRoaXMg
d2hvbGUgdGhpbmcgc28gdGhhdCB0aGUgZHJpdmVyIGNhbgo+IHBhc3MgaW4gdGhlIGxpbmsgcmF0
ZStsYW5lIGNvdW50IHdoZW4gc2V0dGluZyB1cCB0aGUgbGluay4gVGhlcmUncyBubwo+IHJlYXNv
biB0byBhc3N1bWUgdGhhdCB0aGUgc291cmNlIGRldmljZSBjYXBhYmlsaXRpZXMgbWF0Y2ggb3Ig
ZXhjZWVkCj4gdGhlIE1TVCBkZXZpY2UgY2Fwcy4gSXQgd291bGQgYWxzbyBhbGxvdyB0aGUgZHJp
dmVyIHRoZSBkeW5hbWljYWxseQo+IGFkanVzdCB0aGVzZSBpbiByZXNwb25zZSB0byBsaW5rIGZh
aWx1cmVzLgoKSSdtIGEgYml0IGNvbmZ1c2VkLCBJIGFsc28gdGhpbmsgd2Ugc2hvdWxkIHBhc3Mg
dGhlIGxpbmsgcmF0ZStsYW5lIGNvdW50IGluCihlc3BlY2lhbGx5IHNpbmNlIGl0J2xsIGJlIHZl
cnkgaGVscGZ1bCBmb3Igd2hlbiB3ZSBzdGFydCBvcHRpbWl6aW5nIFBCTgpoYW5kbGluZyBpbiBy
ZWdhcmRzIHRvIGJ3IGNvbnN0cmFpbnRzKSwgYnV0IEknbSBub3Qgc3VyZSB3aGF0IHlvdSBtZWFu
IGJ5CiJUaGVyZSdzIG5vIHJlYXNvbiB0byBhc3N1bWUgdGhhdCB0aGUgc291cmNlIGRldmljZSBj
YXBhYmlsaXRpZXMgbWF0Y2ggb3IKZXhjZWVkIHRoZSBNU1QgZGV2aWNlIGNhcHMiLCBhcmVuJ3Qg
d2UgZG9pbmcgdGhlIG9wcG9zaXRlIGhlcmUgYnkgY2hlY2tpbmcgdGhlCk1TVCBkZXZpY2UgY2Fw
cz8KPiAKPiA+IE9uIFdlZCwgMjAyMC0wOS0wOSBhdCAxNDozMSArMDgwMCwgS29iYSBLbyB3cm90
ZToKPiA+ID4gT24gVGh1LCBBdWcgMjcsIDIwMjAgYXQgMTozMCBQTSBLb2JhIEtvIDxrb2JhLmtv
QGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+ID4gPiA+IEN1cnJlbnRseSwgRFJNIGdldCB0aGUgY2Fw
YWJpbGl0eSBvZiB0aGUgbXN0IGh1YiBvbmx5IGZyb20gRFBfRFBDRF9SRVYKPiA+ID4gPiBhbmQK
PiA+ID4gPiBnZXQgdGhlIHNsb3dlciBzcGVlZCBldmVuIHRoZSBtc3QgaHViIGNhbiBydW4gaW4g
dGhlIGZhc3RlciBzcGVlZC4KPiA+ID4gPiAKPiA+ID4gPiBBcyBwZXIgRFAtMS4zLCBGaXJzdCBj
aGVjayBEUF9FWFRFTkRFRF9SRUNFSVZFUl9DQVBfRklFTERfUFJFU0VOVC4KPiA+ID4gPiBJZiBE
UF9FWFRFTkRFRF9SRUNFSVZFUl9DQVBfRklFTERfUFJFU0VOVCBpcyAxLCByZWFkIHRoZQo+ID4g
PiA+IERQX0RQMTNfRFBDRF9SRVYKPiA+ID4gPiB0bwo+ID4gPiA+IGdldCB0aGUgZmFzdGVyIGNh
cGFiaWxpdHkuCj4gPiA+ID4gSWYgRFBfRVhURU5ERURfUkVDRUlWRVJfQ0FQX0ZJRUxEX1BSRVNF
TlQgaXMgMCwgcmVhZCBEUF9EUENEX1JFVi4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBLb2JhIEtvIDxrb2JhLmtvQGNhbm9uaWNhbC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAxMCArKysrKysrKystCj4gPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4g
PiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYwo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ID4g
PiA+IGluZGV4IDY3ZGQ3MmVhMjAwZS4uM2I4NGM2ODAxMjgxIDEwMDY0NAo+ID4gPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiA+ID4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gPiA+ID4gQEAgLTM0OTcsNiArMzQ5
Nyw4IEBAIHN0YXRpYyBpbnQgZHJtX2RwX2dldF92Y19wYXlsb2FkX2J3KHU4Cj4gPiA+ID4gZHBf
bGlua19idywKPiA+ID4gPiB1OCAgZHBfbGlua19jb3VudCkKPiA+ID4gPiAgaW50IGRybV9kcF9t
c3RfdG9wb2xvZ3lfbWdyX3NldF9tc3Qoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyCj4g
PiA+ID4gKm1nciwKPiA+ID4gPiBib29sIG1zdF9zdGF0ZSkKPiA+ID4gPiAgewo+ID4gPiA+ICAg
ICAgICAgaW50IHJldCA9IDA7Cj4gPiA+ID4gKyAgICAgICB1OCBkcGNkX2V4dCA9IDA7Cj4gPiA+
ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgZHBjZF9vZmZzZXQgPSAwOwo+ID4gPiA+ICAgICAgICAg
c3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiID0gTlVMTDsKPiA+ID4gPiAKPiA+ID4gPiAg
ICAgICAgIG11dGV4X2xvY2soJm1nci0+cGF5bG9hZF9sb2NrKTsKPiA+ID4gPiBAQCAtMzUxMCw5
ICszNTEyLDE1IEBAIGludCBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zZXRfbXN0KHN0cnVjdAo+
ID4gPiA+IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsIGJvb2wgbXMKPiA+ID4gPiAgICAg
ICAgICAgICAgICAgc3RydWN0IGRybV9kcF9wYXlsb2FkIHJlc2V0X3BheTsKPiA+ID4gPiAKPiA+
ID4gPiAgICAgICAgICAgICAgICAgV0FSTl9PTihtZ3ItPm1zdF9wcmltYXJ5KTsKPiA+ID4gPiAr
ICAgICAgICAgICAgICAgZHJtX2RwX2RwY2RfcmVhZChtZ3ItPmF1eCwKPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBEUF9UUkFJTklOR19BVVhfUkRfSU5URVJWQUwsCj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmRwY2RfZXh0LCBzaXplb2Yo
ZHBjZF9leHQpKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGRwY2Rfb2Zmc2V0
ID0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAoKGRwY2RfZXh0ICYKPiA+ID4gPiBE
UF9FWFRFTkRFRF9SRUNFSVZFUl9DQVBfRklFTERfUFJFU0VOVCkgPyAgRFBfRFAxM19EUENEX1JF
ViA6Cj4gPiA+ID4gRFBfRFBDRF9SRVYpOwo+ID4gPiA+IAo+ID4gPiA+ICAgICAgICAgICAgICAg
ICAvKiBnZXQgZHBjZCBpbmZvICovCj4gPiA+ID4gLSAgICAgICAgICAgICAgIHJldCA9IGRybV9k
cF9kcGNkX3JlYWQobWdyLT5hdXgsIERQX0RQQ0RfUkVWLCBtZ3ItCj4gPiA+ID4gPmRwY2QsCj4g
PiA+ID4gRFBfUkVDRUlWRVJfQ0FQX1NJWkUpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICByZXQg
PSBkcm1fZHBfZHBjZF9yZWFkKG1nci0+YXV4LCBkcGNkX29mZnNldCwgbWdyLQo+ID4gPiA+ID5k
cGNkLAo+ID4gPiA+IERQX1JFQ0VJVkVSX0NBUF9TSVpFKTsKPiA+ID4gPiAgICAgICAgICAgICAg
ICAgaWYgKHJldCAhPSBEUF9SRUNFSVZFUl9DQVBfU0laRSkgewo+ID4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIERSTV9ERUJVR19LTVMoImZhaWxlZCB0byByZWFkIERQQ0RcbiIpOwo+ID4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X3VubG9jazsKPiA+ID4gPiAtLQo+
ID4gPiA+IDIuMjUuMQo+ID4gPiA+IAo+ID4gPiBBZGQgTHl1ZGUgUGF1bAo+ID4gPiAKPiA+IC0t
IAo+ID4gQ2hlZXJzLAo+ID4gCUx5dWRlIFBhdWwgKHNoZS9oZXIpCj4gPiAJU29mdHdhcmUgRW5n
aW5lZXIgYXQgUmVkIEhhdAo+ID4gCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKLS0gCkNoZWVycywKCUx5dWRlIFBhdWwgKHNoZS9o
ZXIpCglTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
