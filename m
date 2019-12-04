Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 953A7113682
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 21:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403106E97C;
	Wed,  4 Dec 2019 20:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05EC6E985
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 20:35:40 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394--b9HgCjTOlauakIlvltQCw-1; Wed, 04 Dec 2019 15:35:38 -0500
Received: by mail-qk1-f200.google.com with SMTP id v2so628540qkj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 12:35:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=CcfXnqRDGLzjfAhhoPEcGcIjYRF7WAMJk0Ov035HOEQ=;
 b=PLk1+X0Lm/IN1FN3yfb0coBfFgllgBsgpDrZ80fQhmJtykCVhEjqwPiBV/Nw1K20SK
 HHkaBWmhQwWYSMze36M8mBaDnE0Apcwt0AHX0njx7ICmA348fRVSuevt3YnYKloySXDD
 U4zuCaIwAajvByIvGimkJPzVomODPXe7j7moI47km7ttgso/lV4a79Lrw4HOX2jFgwEd
 p+X10VPpsRi1Oe/gOO01d63G3iRd3tRDLZYbZqP8LbgXU/YwNjokEHMMEaDlhRFUN3gl
 Py7tZzlUW51e3ofpBnAp63A/7ZJ6TbuSgRgoPl7pJUoXFli+0gAmW6liry5nNfk5/R/K
 hicA==
X-Gm-Message-State: APjAAAWUreZRGfJZpFbHfeGj+YyO2hb3NM3TMKK4P3MpLxz8DAGaixlZ
 +mfvfio+CPH2zrjYottWk0PikwKs8p4sgrYhyV8TOeNbaXUEBnVpZEe4fmYyL7tzMBPEVOMcSgJ
 17i+aCeLCacMiWHrQneInhGw4Xc31
X-Received: by 2002:ac8:27ae:: with SMTP id w43mr4563627qtw.273.1575491737558; 
 Wed, 04 Dec 2019 12:35:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqytQgQkToEqaj5Q7Jblq+SLtUht+TP6KqrFu2cJHaSSxTOW0mOv4V7Bw5JGM6N69CV+8urzog==
X-Received: by 2002:ac8:27ae:: with SMTP id w43mr4563615qtw.273.1575491737370; 
 Wed, 04 Dec 2019 12:35:37 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id t15sm4088792qkg.49.2019.12.04.12.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 12:35:36 -0800 (PST)
Message-ID: <7a2d903669055f9c717899b06225058df3a1775d.camel@redhat.com>
Subject: Re: [PATCH v2] drm/dp_mst: Correct the bug in
 drm_dp_update_payload_part1()
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Wed, 04 Dec 2019 15:35:35 -0500
In-Reply-To: <20191203042423.5961-1-Wayne.Lin@amd.com>
References: <20191203042423.5961-1-Wayne.Lin@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: -b9HgCjTOlauakIlvltQCw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575491739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CcfXnqRDGLzjfAhhoPEcGcIjYRF7WAMJk0Ov035HOEQ=;
 b=eMGCAccnHPd3FVBoZnmt1DtjL6cjzb8QvLZCXDtM7FmzlAg3IZgovXOGtlaVnIIOvNinvt
 jFXniqOib8QfX06gqzhCmDCQs7DLlvIX1hO7lu9jw0Nc6q+hYaFZdaLaaY3LJ2xzB8jB7O
 VFnwCwBZDDgapVsgwWryhNNNhFfLwWg=
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
Cc: jerry.zuo@amd.com, Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dC1maXhlcyBhcwplNWE2Y2EyN2ViNzJjNjc1MzNk
ZGZjMTFjMDZkZjg0YmVhYTE2N2ZhLCB0aGFua3MhCgpPbiBUdWUsIDIwMTktMTItMDMgYXQgMTI6
MjQgKzA4MDAsIFdheW5lIExpbiB3cm90ZToKPiBbV2h5XQo+IElmIHRoZSBwYXlsb2FkX3N0YXRl
IGlzIERQX1BBWUxPQURfREVMRVRFX0xPQ0FMIGluIHNlcmllcywgY3VycmVudAo+IGNvZGUgZG9l
c24ndCBkZWxldGUgdGhlIHBheWxvYWQgYXQgY3VycmVudCBpbmRleCBhbmQganVzdCBtb3ZlIHRo
ZQo+IGluZGV4IHRvIG5leHQgb25lIGFmdGVyIHNodWZmbGluZyBwYXlsb2Fkcy4KPiAKPiBbSG93
XQo+IERyb3AgdGhlIGkrKyBpbmNyZWFzaW5nIHBhcnQgaW4gZm9yIGxvb3AgaGVhZCBhbmQgZGVj
aWRlIHdoZXRoZXIKPiB0byBpbmNyZWFzZSB0aGUgaW5kZXggb3Igbm90IGFjY29yZGluZyB0byBw
YXlsb2FkX3N0YXRlIG9mIGN1cnJlbnQKPiBwYXlsb2FkLgo+IAo+IENoYW5nZXMgc2luY2UgdjE6
Cj4gKiBSZWZpbmUgdGhlIGNvZGUgdG8gaGF2ZSBpdCBlYXN5IHJlYWRpbmcKPiAqIEFtZW5kIHRo
ZSBjb21taXQgbWVzc2FnZSB0byBtZWV0IHRoZSB3YXkgY29kZSBpcyBtb2RpZmllZCBub3cuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogV2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT4KPiBSZXZpZXdl
ZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKPiBpbmRleCA4MWU5MmIyNjBkN2EuLjRlZjZkZWNjMDU1MSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC0zMTc2LDkgKzMxNzYsMTEg
QEAgaW50IGRybV9kcF91cGRhdGVfcGF5bG9hZF9wYXJ0MShzdHJ1Y3QKPiBkcm1fZHBfbXN0X3Rv
cG9sb2d5X21nciAqbWdyKQo+ICAJCQlkcm1fZHBfbXN0X3RvcG9sb2d5X3B1dF9wb3J0KHBvcnQp
Owo+ICAJfQo+ICAKPiAtCWZvciAoaSA9IDA7IGkgPCBtZ3ItPm1heF9wYXlsb2FkczsgaSsrKSB7
Cj4gLQkJaWYgKG1nci0+cGF5bG9hZHNbaV0ucGF5bG9hZF9zdGF0ZSAhPSBEUF9QQVlMT0FEX0RF
TEVURV9MT0NBTCkKPiArCWZvciAoaSA9IDA7IGkgPCBtZ3ItPm1heF9wYXlsb2FkczsgLyogZG8g
bm90aGluZyAqLykgewo+ICsJCWlmIChtZ3ItPnBheWxvYWRzW2ldLnBheWxvYWRfc3RhdGUgIT0g
RFBfUEFZTE9BRF9ERUxFVEVfTE9DQUwpCj4gewo+ICsJCQlpKys7Cj4gIAkJCWNvbnRpbnVlOwo+
ICsJCX0KPiAgCj4gIAkJRFJNX0RFQlVHX0tNUygicmVtb3ZpbmcgcGF5bG9hZCAlZFxuIiwgaSk7
Cj4gIAkJZm9yIChqID0gaTsgaiA8IG1nci0+bWF4X3BheWxvYWRzIC0gMTsgaisrKSB7Ci0tIApD
aGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
