Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DB634E5E0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 12:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BC56E8A5;
	Tue, 30 Mar 2021 10:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3542F6E8A6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617101815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYqzNHiuAl/aoLjb89NUxhkCMXfILPBrl172tqHnnHE=;
 b=CNfyjNv8F23LnMAJNDnUNFKhwn/+7qb3AMe4+LBSVke3MjdtxoflURxkmkRK1pxz29h/wa
 vnfIkHKNay0CZroZ6iXTvyo6Xn63R2rHoOCxuLAkmRYilhPRBTOBrNjn4OI/wGtZljeK1R
 LcBsMTqOVdAh6cAaCzlQRs3q0Qh8TMU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-cn1si3qlPz-QrtUbvPqfFg-1; Tue, 30 Mar 2021 06:56:53 -0400
X-MC-Unique: cn1si3qlPz-QrtUbvPqfFg-1
Received: by mail-ej1-f72.google.com with SMTP id p11so3586654eju.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 03:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rYqzNHiuAl/aoLjb89NUxhkCMXfILPBrl172tqHnnHE=;
 b=tLTsUFy75MDDPVg+a6knwpE7eRibK0n/uIrd9iLT6qPhUa5F3Qcxh9UW6nlIlluBtg
 fVuVtnqzHX//89bY7VC+3u/9eSX5BnL1o3Yh9g9G+NRV/dwYPjLTyzdXALqRM4u4inKC
 gqlvnqLEm16/l5Izn2VkS/L1i/l19t+SUR/uRszbP67nRmrUxubwvnT2LVc/N7LOpsdt
 R6fkTF0Ybz4r/j68IemlSzMHsyBjs7zIxdYI3dLzj7YOlohhKZKFUP9G+BLC74/Sqf2Q
 KGLx5SDk77FDC93D65PV3Ypy5SHA261aHifSdqdyQEsqyPh2uKoYNOQQK9RY8gL8qEdp
 dQGQ==
X-Gm-Message-State: AOAM532z0hA6s8gLzNCTPsTLkyP2S69xd2FKL3rcHi2o9huaUgqTmfbs
 CJ4BTmP97tDHi2v8AkU8oc4ptnzo7xR1WQWC39Cqo6A2Dxhu33uD0wySx37WX0L7GP9kthnQHQK
 OmLh8bg0zhYRVsmHYVuhXtK81WvyG
X-Received: by 2002:a05:6402:270e:: with SMTP id
 y14mr32945896edd.283.1617101812771; 
 Tue, 30 Mar 2021 03:56:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk85EwNcCIjfgTHncBkIRpyvOFJP73cc6LgtyJnG141Ecwyc7yx0+jNJ7jYIvKmaPJ/RYKmg==
X-Received: by 2002:a05:6402:270e:: with SMTP id
 y14mr32945855edd.283.1617101812562; 
 Tue, 30 Mar 2021 03:56:52 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id gq9sm5631143ejb.62.2021.03.30.03.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 03:56:52 -0700 (PDT)
Subject: Re: [PATCH 11/11] [RFC] drm/i915/dp: fix array overflow warning
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 Martin Sebor <msebor@gcc.gnu.org>, Jani Nikula
 <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, imre.deak@intel.com
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-12-arnd@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <949db606-ac48-69ae-b0f7-b1cba6fc2d7f@redhat.com>
Date: Tue, 30 Mar 2021 12:56:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210322160253.4032422-12-arnd@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: dri-devel@lists.freedesktop.org, linux-scsi@vger.kernel.org,
 Animesh Manna <animesh.manna@intel.com>, x86@kernel.org,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Uma Shankar <uma.shankar@intel.com>, Kalle Valo <kvalo@codeaurora.org>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, ath11k@lists.infradead.org,
 Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>, Sean Paul <seanpaul@chromium.org>,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 Manasi Navare <manasi.d.navare@intel.com>,
 linux-security-module@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAzLzIyLzIxIDU6MDIgUE0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gRnJvbTogQXJu
ZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAKPiBnY2MtMTEgd2FybnMgdGhhdCBpbnRlbF9k
cF9jaGVja19tc3Rfc3RhdHVzKCkgaGFzIGEgbG9jYWwgYXJyYXkgb2YKPiBmb3VydGVlbiBieXRl
cyBhbmQgcGFzc2VzIHRoZSBsYXN0IGZvdXIgYnl0ZXMgaW50byBhIGZ1bmN0aW9uIHRoYXQKPiBl
eHBlY3RzIGEgc2l4LWJ5dGUgYXJyYXk6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcC5jOiBJbiBmdW5jdGlvbiDigJhpbnRlbF9kcF9jaGVja19tc3Rfc3RhdHVz4oCZ
Ogo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYzo0NTU2OjIyOiBlcnJv
cjog4oCYZHJtX2RwX2NoYW5uZWxfZXFfb2vigJkgcmVhZGluZyA2IGJ5dGVzIGZyb20gYSByZWdp
b24gb2Ygc2l6ZSA0IFstV2Vycm9yPXN0cmluZ29wLW92ZXJyZWFkXQo+ICA0NTU2IHwgICAgICAg
ICAgICAgICAgICAgICAhZHJtX2RwX2NoYW5uZWxfZXFfb2soJmVzaVsxMF0sIGludGVsX2RwLT5s
YW5lX2NvdW50KSkgewo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYzo0NTU2OjIyOiBub3RlOiByZWZlcmVuY2luZyBhcmd1
bWVudCAxIG9mIHR5cGUg4oCYY29uc3QgdTggKuKAmSB7YWthIOKAmGNvbnN0IHVuc2lnbmVkIGNo
YXIgKuKAmX0KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kcC5jOjM4Ogo+IGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaDoxNDU5OjY6
IG5vdGU6IGluIGEgY2FsbCB0byBmdW5jdGlvbiDigJhkcm1fZHBfY2hhbm5lbF9lcV9va+KAmQo+
ICAxNDU5IHwgYm9vbCBkcm1fZHBfY2hhbm5lbF9lcV9vayhjb25zdCB1OCBsaW5rX3N0YXR1c1tE
UF9MSU5LX1NUQVRVU19TSVpFXSwKPiAgICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4K
PiAKPiBDbGVhcmx5IHNvbWV0aGluZyBpcyB3cm9uZyBoZXJlLCBidXQgSSBjYW4ndCBxdWl0ZSBm
aWd1cmUgb3V0IHdoYXQuCj4gQ2hhbmdpbmcgdGhlIGFycmF5IHNpemUgdG8gMTYgYnl0ZXMgYXZv
aWRzIHRoZSB3YXJuaW5nLCBidXQgaXMKPiBwcm9iYWJseSB0aGUgd3Jvbmcgc29sdXRpb24gaGVy
ZS4KClRoZSBkcm0gZGlzcGxheXBvcnQtaGVscGVycyBpbmRlZWQgZXhwZWN0IGEgNiBieXRlcyBi
dWZmZXIsIGJ1dCB0aGV5CnVzdWFsbHkgb25seSBjb25zdW1lIDQgYnl0ZXMuCgpJIGRvbid0IHRo
aW5rIHRoYXQgY2hhbmdpbmcgdGhlIERQX0RQUlhfRVNJX0xFTiBpcyBhIGdvb2QgZml4IGhlcmUs
CnNpbmNlIGl0IGlzIHVzZWQgaW4gbXVsdGlwbGUgcGxhY2VzLCBidXQgdGhlIGVzaSBhcnJheSBh
bHJlYWR5IGdldHMKemVyby1lZCBvdXQgYnkgaXRzIGluaXRpYWxpemVyLCBzbyB3ZSBjYW4ganVz
dCBwYXNzIDIgZXh0cmEgMCBieXRlcwp0byBnaXZlIGRybV9kcF9jaGFubmVsX2VxX29rKCkgY2Fs
bCB0aGUgNiBieXRlIGJ1ZmZlciBpdHMgcHJvdG90eXBlCnNwZWNpZmllcyBieSBkb2luZyB0aGlz
OgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwppbmRleCA4OTc3MTFkOWQ3
ZDMuLjE0Nzk2MmQ0YWQwNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAu
YwpAQCAtNDUzOCw3ICs0NTM4LDExIEBAIGludGVsX2RwX2NoZWNrX21zdF9zdGF0dXMoc3RydWN0
IGludGVsX2RwICppbnRlbF9kcCkKIAlkcm1fV0FSTl9PTl9PTkNFKCZpOTE1LT5kcm0sIGludGVs
X2RwLT5hY3RpdmVfbXN0X2xpbmtzIDwgMCk7CiAKIAlmb3IgKDs7KSB7Ci0JCXU4IGVzaVtEUF9E
UFJYX0VTSV9MRU5dID0ge307CisJCS8qCisJCSAqIGRybV9kcF9jaGFubmVsX2VxX29rKCkgZXhw
ZWN0cyBhIDYgYnl0ZSBsYXJnZSBidWZmZXIsIGJ1dAorCQkgKiB0aGUgRVNJIGluZm8gb25seSBj
b250YWlucyA0IGJ5dGVzLCBwYXNzIDIgZXh0cmEgMCBieXRlcy4KKwkJICovCisJCXU4IGVzaVtE
UF9EUFJYX0VTSV9MRU4gKyAyXSA9IHt9OwogCQlib29sIGhhbmRsZWQ7CiAJCWludCByZXRyeTsK
IAoKU28gaTkxNSBkZXZzLCB3b3VsZCBzdWNoIGEgZml4IGJlIGFjY2VwdGFibGUgPwoKUmVnYXJk
cywKCkhhbnMKCgoKCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKPiBpbmRleCA4YzEyZDUz
NzU2MDcuLjgzMGUyNTE1ZjExOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwLmMKPiBAQCAtNjUsNyArNjUsNyBAQAo+ICAjaW5jbHVkZSAiaW50ZWxfdmRzYy5oIgo+
ICAjaW5jbHVkZSAiaW50ZWxfdnJyLmgiCj4gIAo+IC0jZGVmaW5lIERQX0RQUlhfRVNJX0xFTiAx
NAo+ICsjZGVmaW5lIERQX0RQUlhfRVNJX0xFTiAxNgo+ICAKPiAgLyogRFAgRFNDIHRocm91Z2hw
dXQgdmFsdWVzIHVzZWQgZm9yIHNsaWNlIGNvdW50IGNhbGN1bGF0aW9ucyBLUGl4ZWxzL3MgKi8K
PiAgI2RlZmluZSBEUF9EU0NfUEVBS19QSVhFTF9SQVRFCQkJMjcyMDAwMAo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
