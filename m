Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA77228298
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 16:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A256E59B;
	Tue, 21 Jul 2020 14:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322996E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 14:46:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o11so21480097wrv.9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=N2I8hzVQk/3Gv/eylam1DQeZNrEVe896ye3pb7esOr8=;
 b=oTr9yEg/aoIM3t46QWJXlB3z61jNClQMonZuMyRXvNjSOsNCQCZI3xjl9WPBMU5bhL
 yf8v11n1bCblAICjIXO9urR1IAe39ZAgAdWGBxutTXQnqyNYm4koOLy6mpMqkPXM0vwQ
 A0C6HJ7ehkW+RaSKVtvxyxQUvoAdKrkc/FMoGwACafbdjoiPURLzSh5GUu+7eXChL6/P
 1j94tCMUaPYkKuqlVgTfmS/zmiBfgOPSB74OLWZ5FThK3G9330aXorNWb2U8Tm01YguA
 HiDu9ZQkmqC6ux/lq5MrY9lU9BvgX4IcaGfqXNBHAoGL/qQwAhP2srB4q6pyON2jXVSM
 cuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=N2I8hzVQk/3Gv/eylam1DQeZNrEVe896ye3pb7esOr8=;
 b=rYb5lzx4Qp0PGWykNO0l0d8ln+TQxULtSkqQ5XqOa0jgZGK2H8LDS519FHfn8ph0Pu
 BCOovgQE2Vi6rYIKNAamHGr8kghTcQDHv1BgleyO6MT+O4mGVgypeK5gG/MQiObzKZCC
 vxHTpiIatNUaPaYNg/8ymlrp/AjeVW9cv4ikJKYEbfuGq05Y3MnJ5hNqQsf1tlQogCMI
 C62TG+sA3UF4ONVg8zgEwR1gvRoeJZzRTiP4tStIcN6AjOtaZPHiFzkuMxXOCidqNsWj
 uCNheaAkbZyfRylc07unNHTyNVEd7yD5L0NPFQrObiiw0osMKqwugM2nbSWlK26Sydgr
 LnNw==
X-Gm-Message-State: AOAM530eThbFxNwyWX8Gr6yML+CmVYMlaCTTJWZqfLpN5oW9c8sNnFEW
 wigjTdRWicFjgryUg+R4Eym3k1RM
X-Google-Smtp-Source: ABdhPJxNGw30J+FON0vWRJ6BfyIW0WBJGxcvuyhPNVe1mhv5+djIQYS0ZG/J7c/LvsYj4CqOgCLW8Q==
X-Received: by 2002:a5d:4002:: with SMTP id n2mr28610796wrp.255.1595342780849; 
 Tue, 21 Jul 2020 07:46:20 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id v12sm26536076wrs.2.2020.07.21.07.46.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 07:46:20 -0700 (PDT)
Subject: Re: [PATCH 06/11] drm/radeon: stop using TTM_MEMTYPE_FLAG_MAPPABLE
To: daniel@ffwll.ch
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-6-christian.koenig@amd.com>
 <20200721092448.GE6419@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8a602078-3dad-4158-6057-07427ea69d74@gmail.com>
Date: Tue, 21 Jul 2020 16:46:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200721092448.GE6419@phenom.ffwll.local>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Madhav.Chauhan@amd.com, michael.j.ruhl@intel.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDcuMjAgdW0gMTE6MjQgc2NocmllYiBkYW5pZWxAZmZ3bGwuY2g6Cj4gT24gVHVlLCBK
dWwgMjEsIDIwMjAgYXQgMDk6MzI6NDBBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gVGhlIGRyaXZlciBkb2Vzbid0IGV4cG9zZSBhbnkgbm90LW1hcGFibGUgbWVtb3J5IHJlc291
cmNlcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90
dG0uYyB8IDEzICsrKystLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA5IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+
PiBpbmRleCA1NGFmMDZkZjg2NWIuLmI0NzQ3ODFhMDkyMCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fdHRtLmMKPj4gQEAgLTc2LDcgKzc2LDcgQEAgc3RhdGljIGludCByYWRlb25f
aW5pdF9tZW1fdHlwZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgdWludDMyX3QgdHlwZSwK
Pj4gICAJc3dpdGNoICh0eXBlKSB7Cj4+ICAgCWNhc2UgVFRNX1BMX1NZU1RFTToKPj4gICAJCS8q
IFN5c3RlbSBtZW1vcnkgKi8KPj4gLQkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfTUFQ
UEFCTEU7Cj4+ICsJCW1hbi0+ZmxhZ3MgPSAwOwo+PiAgIAkJbWFuLT5hdmFpbGFibGVfY2FjaGlu
ZyA9IFRUTV9QTF9NQVNLX0NBQ0hJTkc7Cj4+ICAgCQltYW4tPmRlZmF1bHRfY2FjaGluZyA9IFRU
TV9QTF9GTEFHX0NBQ0hFRDsKPj4gICAJCWJyZWFrOwo+PiBAQCAtODQsNyArODQsNyBAQCBzdGF0
aWMgaW50IHJhZGVvbl9pbml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1
aW50MzJfdCB0eXBlLAo+PiAgIAkJbWFuLT5mdW5jID0gJnR0bV9ib19tYW5hZ2VyX2Z1bmM7Cj4+
ICAgCQltYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX01BU0tfQ0FDSElORzsKPj4gICAJ
CW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVEOwo+PiAtCQltYW4tPmZs
YWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsKPj4gKwkJbWFuLT5mbGFncyA9IDA7Cj4+
ICAgI2lmIElTX0VOQUJMRUQoQ09ORklHX0FHUCkKPj4gICAJCWlmIChyZGV2LT5mbGFncyAmIFJB
REVPTl9JU19BR1ApIHsKPj4gICAJCQlpZiAoIXJkZXYtPmRkZXYtPmFncCkgewo+PiBAQCAtOTIs
OCArOTIsNiBAQCBzdGF0aWMgaW50IHJhZGVvbl9pbml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9f
ZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAo+PiAgIAkJCQkJICAodW5zaWduZWQpdHlwZSk7
Cj4+ICAgCQkJCXJldHVybiAtRUlOVkFMOwo+PiAgIAkJCX0KPj4gLQkJCWlmICghcmRldi0+ZGRl
di0+YWdwLT5jYW50X3VzZV9hcGVydHVyZSkKPj4gLQkJCQltYW4tPmZsYWdzID0gVFRNX01FTVRZ
UEVfRkxBR19NQVBQQUJMRTsKPiBUaGVyZSBpcyBhIGJ1bmNoIG9mIGFncCBkcml2ZXJzIChhbHBo
YSwgcHBjLCB0aGF0IGtpbmQgb2Ygc3R1ZmYpIHdpdGggdGhpcwo+IGZsYWcgc2V0LiBBbmQgcmFk
ZW9uLmtvIGRpZCBhdCBsZWFzdCBvbmNlIHdvcmsgb24gdGhlc2UuIEFuZCB5b3VyIHBhdGNoIHRv
Cj4gZGlzYWJsZSBhZ3Agb25seSBjaGFuZ2VzIHRoZSBkZWZhdWx0LCBpdCBkb2Vzbid0IHJpcCBv
dXQgdGhlIGNvZGUuCgpUaGUga2V5IHBpbnQgaXMgdGhhdCB0aGUgZmxhZ3MgZm9yIEFHUCBhcmUg
dGhlIHNhbWUgYXMgdGhlIG9uZSBmb3IgdGhlIApQQ0llIHBhdGguIFNvIG5vIGZ1bmN0aW9uYWwg
Y2hhbmdlIGF0IGFsbCA6KQoKVGhlIHJlYWwgaGFuZGxpbmcgb2YgY2FudF91c2VfYXBlcnR1cmUg
aXMgaW4gcmFkZW9uX3R0bV9pb19tZW1fcmVzZXJ2ZSgpLgoKQ2hyaXN0aWFuLgoKPgo+IFNvIG5v
dCBzdXJlIHlvdXIgYXNzdW1wdGlvbiBoZXJlIGlzIGNvcnJlY3QuCj4gLURhbmllbAo+Cj4+ICAg
CQkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9GTEFHX1VOQ0FDSEVEIHwKPj4gICAJ
CQkJCQkgVFRNX1BMX0ZMQUdfV0M7Cj4+ICAgCQkJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1f
UExfRkxBR19XQzsKPj4gQEAgLTEwMyw4ICsxMDEsNyBAQCBzdGF0aWMgaW50IHJhZGVvbl9pbml0
X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAo+PiAg
IAljYXNlIFRUTV9QTF9WUkFNOgo+PiAgIAkJLyogIk9uLWNhcmQiIHZpZGVvIHJhbSAqLwo+PiAg
IAkJbWFuLT5mdW5jID0gJnR0bV9ib19tYW5hZ2VyX2Z1bmM7Cj4+IC0JCW1hbi0+ZmxhZ3MgPSBU
VE1fTUVNVFlQRV9GTEFHX0ZJWEVEIHwKPj4gLQkJCSAgICAgVFRNX01FTVRZUEVfRkxBR19NQVBQ
QUJMRTsKPj4gKwkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQ7Cj4+ICAgCQlt
YW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfVU5DQUNIRUQgfCBUVE1fUExfRkxB
R19XQzsKPj4gICAJCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfV0M7Cj4+ICAg
CQlicmVhazsKPj4gQEAgLTM5NCw3ICszOTEsNiBAQCBzdGF0aWMgaW50IHJhZGVvbl9ib19tb3Zl
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgZXZpY3QsCj4+ICAgCj4+ICAgc3Rh
dGljIGludCByYWRlb25fdHRtX2lvX21lbV9yZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpi
ZGV2LCBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkKPj4gICB7Cj4+IC0Jc3RydWN0IHR0bV9tZW1f
dHlwZV9tYW5hZ2VyICptYW4gPSAmYmRldi0+bWFuW21lbS0+bWVtX3R5cGVdOwo+PiAgIAlzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldiA9IHJhZGVvbl9nZXRfcmRldihiZGV2KTsKPj4gICAKPj4g
ICAJbWVtLT5idXMuYWRkciA9IE5VTEw7Cj4+IEBAIC00MDIsOCArMzk4LDcgQEAgc3RhdGljIGlu
dCByYWRlb25fdHRtX2lvX21lbV9yZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBz
dHJ1Y3QgdHRtX21lbV8KPj4gICAJbWVtLT5idXMuc2l6ZSA9IG1lbS0+bnVtX3BhZ2VzIDw8IFBB
R0VfU0hJRlQ7Cj4+ICAgCW1lbS0+YnVzLmJhc2UgPSAwOwo+PiAgIAltZW0tPmJ1cy5pc19pb21l
bSA9IGZhbHNlOwo+PiAtCWlmICghKG1hbi0+ZmxhZ3MgJiBUVE1fTUVNVFlQRV9GTEFHX01BUFBB
QkxFKSkKPj4gLQkJcmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gICAJc3dpdGNoIChtZW0tPm1lbV90
eXBlKSB7Cj4+ICAgCWNhc2UgVFRNX1BMX1NZU1RFTToKPj4gICAJCS8qIHN5c3RlbSBtZW1vcnkg
Ki8KPj4gLS0gCj4+IDIuMTcuMQo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
