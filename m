Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F531E2F75
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 12:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5E06E249;
	Thu, 24 Oct 2019 10:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCD66E248;
 Thu, 24 Oct 2019 10:53:50 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r1so15740727wrs.9;
 Thu, 24 Oct 2019 03:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CeCNJWHOpHtsXAOyksDVLi7P1fyXHhg97krfszcqLXU=;
 b=T1f2GnwNkCCuBA1RKqtCiu4ptZBXbwj2jQzqIQj6iGJU2zBjmVz0MMjLXodf4MwNds
 ZrZkG+s7+bqtpEGVuQlnrYJj8oWqZdSxVPIYvWi04/nUv70WHK8EViKJL+tYZGgBbME9
 XCYAIRDuo6kdAVdJUy/1F7EKMWhdRNJDeVkVd+/Dl662f/HkVnFzmUVYc+V33oXtMtOr
 RLA5R2zbu7b+cmHh+TM3u9wec1rNk4hNBzv8dsQe6yTap9wlz7EzSsH8FZ+py/fnJqJn
 1wvf5DHADC/Tmkd82aUIho3Rxn0j5iBn16GTbqsz6fjFzMJIXYp9PVmhydSPVZRo9h72
 UqaQ==
X-Gm-Message-State: APjAAAXUx3KXA47EfB9TFbrE9StVl6jFN7pm1b9kitIHdDh3s0+vmbRT
 /MsKvZgdsTnUCXoazPab8KNYiS04
X-Google-Smtp-Source: APXvYqxF/Yhg/RjmltGQeBHHpZ/oqmp9CrviDlvLY4GZxDFmOjLAN6g6h5vCjSfpILt1/5JMlGweSA==
X-Received: by 2002:a5d:4003:: with SMTP id n3mr3058709wrp.95.1571914429133;
 Thu, 24 Oct 2019 03:53:49 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f14sm1106257wmc.22.2019.10.24.03.53.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Oct 2019 03:53:48 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: use the parent resv for ghost objects v2
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20191018115831.14951-1-christian.koenig@amd.com>
 <01bf3c2a-e178-6083-01a8-bb06aaef10bf@gmail.com>
 <006ab5ab-fa42-b206-1a40-3f0744689443@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7eca974f-7d49-b8da-8a39-ac0a771dd618@gmail.com>
Date: Thu, 24 Oct 2019 12:53:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <006ab5ab-fa42-b206-1a40-3f0744689443@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=CeCNJWHOpHtsXAOyksDVLi7P1fyXHhg97krfszcqLXU=;
 b=giNUm+v0qSPXTj/6YAsyiRmHcjHZ4Xe9YjDKRdxKdGbhxEBrc9fhyFCIWzfS0BuFIe
 rcWQo8HEOSmUL1ckYkCcICpAqSmCPmIph6pEaBKgAtKgcCRdt8RaOph0Cy1pC2HDteQZ
 THi4pNSKyOZx3vnOmYSLaSGL95hbEXb5ZLqJT1WZDR1WeM/LZLLOzjdwm36BQY0IcCHi
 ClD8yoI90AlZlLo82bqUPR28qZ1wWUu+KuWH5OHv0Gzk5kwNEFUjGdHJZAG80ryExQq/
 yRFor/CtdLzE0NQwWv9ginOYinQJzFQKVTLSbevw17GVYcMmyqRcNW1KfdYWQEamgr+u
 uPew==
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

QW0gMjQuMTAuMTkgdW0gMTI6NTEgc2NocmllYiBaaG91LCBEYXZpZChDaHVuTWluZyk6Cj4gT24g
MjAxOS8xMC8yNCDkuIvljYg2OjI1LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBQaW5nPwo+
Pgo+PiBBbSAxOC4xMC4xOSB1bSAxMzo1OCBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+PiBU
aGlzIHdheSB0aGUgVFRNIGlzIGRlc3Ryb3llZCB3aXRoIHRoZSBjb3JyZWN0IGRtYV9yZXN2IG9i
amVjdAo+Pj4gbG9ja2VkIGFuZCB3ZSBjYW4gZXZlbiBwaXBlbGluZSBpbXBvcnRlZCBCTyBldmlj
dGlvbnMuCj4+Pgo+Pj4gdjI6IExpbWl0IHRoaXMgdG8gb25seSBjYXNlcyB3aGVuIHRoZSBwYXJl
bnQgb2JqZWN0IHVzZXMgYSBzZXBhcmF0ZQo+Pj4gIMKgwqDCoMKgIHJlc2VydmF0aW9uIG9iamVj
dCBhcyB3ZWxsLiBUaGlzIGZpeGVzIGFub3RoZXIgT09NIHByb2JsZW0uCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4g
LS0tCj4+PiAgwqAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIHwgMTYgKysrKysr
KysrLS0tLS0tLQo+Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3V0aWwuYwo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPj4+IGluZGV4
IGUwMzBjMjdmNTNjZi4uNDVlNDQwZjgwYjdiIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
b191dGlsLmMKPj4+IEBAIC01MTIsNyArNTEyLDkgQEAgc3RhdGljIGludCB0dG1fYnVmZmVyX29i
amVjdF90cmFuc2ZlcihzdHJ1Y3QKPj4+IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4+ICDCoMKg
wqDCoMKgIGtyZWZfaW5pdCgmZmJvLT5iYXNlLmtyZWYpOwo+Pj4gIMKgwqDCoMKgwqAgZmJvLT5i
YXNlLmRlc3Ryb3kgPSAmdHRtX3RyYW5zZmVyZWRfZGVzdHJveTsKPj4+ICDCoMKgwqDCoMKgIGZi
by0+YmFzZS5hY2Nfc2l6ZSA9IDA7Cj4+PiAtwqDCoMKgIGZiby0+YmFzZS5iYXNlLnJlc3YgPSAm
ZmJvLT5iYXNlLmJhc2UuX3Jlc3Y7Cj4+PiArwqDCoMKgIGlmIChiby0+YmFzZS5yZXN2ID09ICZi
by0+YmFzZS5fcmVzdikKPj4+ICvCoMKgwqDCoMKgwqDCoCBmYm8tPmJhc2UuYmFzZS5yZXN2ID0g
JmZiby0+YmFzZS5iYXNlLl9yZXN2Owo+Pj4gKwo+Pj4gIMKgwqDCoMKgwqAgZG1hX3Jlc3ZfaW5p
dChmYm8tPmJhc2UuYmFzZS5yZXN2KTsKPiBEb2Vzbid0IHRoaXMgbGVhZCB0byBpc3N1ZSBpZiB5
b3UgZm9yY2UgdG8gaW5pdCBwYXJlbnQgcmVzdj8gT3RoZXJ3aXNlCj4gaG93IHRvIGRlYWwgd2l0
aCBpZiBwYXJlbnQtPnJlc3YgaXMgbG9ja2luZz8KClVwcywgZ29vZCBwb2ludC4gVGhhdCBpcyBp
bmRlZWQgYSByZWFsbHkgYmFkIHR5cG8gYWRkZWQgZHVyaW5nIHRoZSAKcmViYXNlLiBHb2luZyB0
byBmaXggdGhhdC4KClRoYW5rcywKQ2hyaXN0aWFuLgoKPgo+Cj4+PiAgwqDCoMKgwqDCoCByZXQg
PSBkbWFfcmVzdl90cnlsb2NrKGZiby0+YmFzZS5iYXNlLnJlc3YpOwo+Pj4gIMKgwqDCoMKgwqAg
V0FSTl9PTighcmV0KTsKPj4+IEBAIC03MTEsNyArNzEzLDcgQEAgaW50IHR0bV9ib19tb3ZlX2Fj
Y2VsX2NsZWFudXAoc3RydWN0Cj4+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIHJldDsKPj4+ICDCoCAtwqDCoMKgwqDCoMKgwqAgZG1hX3Jlc3ZfYWRkX2V4Y2xfZmVuY2Uo
Z2hvc3Rfb2JqLT5iYXNlLnJlc3YsIGZlbmNlKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBkbWFfcmVz
dl9hZGRfZXhjbF9mZW5jZSgmZ2hvc3Rfb2JqLT5iYXNlLl9yZXN2LCBmZW5jZSk7Cj4+PiAgwqAg
wqDCoMKgwqDCoMKgwqDCoMKgIC8qKgo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgICogSWYgd2Un
cmUgbm90IG1vdmluZyB0byBmaXhlZCBtZW1vcnksIHRoZSBUVE0gb2JqZWN0Cj4+PiBAQCAtNzI0
LDcgKzcyNiw3IEBAIGludCB0dG1fYm9fbW92ZV9hY2NlbF9jbGVhbnVwKHN0cnVjdAo+Pj4gdHRt
X2J1ZmZlcl9vYmplY3QgKmJvLAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlCj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm8tPnR0bSA9IE5VTEw7Cj4+PiAgwqAgLcKgwqDCoMKg
wqDCoMKgIHR0bV9ib191bnJlc2VydmUoZ2hvc3Rfb2JqKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBk
bWFfcmVzdl91bmxvY2soJmdob3N0X29iai0+YmFzZS5fcmVzdik7Cj4gZmJvLT5iYXNlLmJhc2Uu
cmVzdj8KPgo+IC1EYXZpZAo+Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHR0bV9ib19wdXQoZ2hv
c3Rfb2JqKTsKPj4+ICDCoMKgwqDCoMKgIH0KPj4+ICDCoCBAQCAtNzY3LDcgKzc2OSw3IEBAIGlu
dCB0dG1fYm9fcGlwZWxpbmVfbW92ZShzdHJ1Y3QKPj4+IHR0bV9idWZmZXJfb2JqZWN0ICpibywK
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gIMKgIC3CoMKgwqDCoMKgwqDCoCBkbWFfcmVzdl9hZGRf
ZXhjbF9mZW5jZShnaG9zdF9vYmotPmJhc2UucmVzdiwgZmVuY2UpOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgIGRtYV9yZXN2X2FkZF9leGNsX2ZlbmNlKCZnaG9zdF9vYmotPmJhc2UuX3Jlc3YsIGZlbmNl
KTsKPj4+ICDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgLyoqCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKiBJZiB3ZSdyZSBub3QgbW92aW5nIHRvIGZpeGVkIG1lbW9yeSwgdGhlIFRUTSBvYmplY3QK
Pj4+IEBAIC03ODAsNyArNzgyLDcgQEAgaW50IHR0bV9ib19waXBlbGluZV9tb3ZlKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdAo+Pj4gKmJvLAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlCj4+
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm8tPnR0bSA9IE5VTEw7Cj4+PiAgwqAgLcKg
wqDCoMKgwqDCoMKgIHR0bV9ib191bnJlc2VydmUoZ2hvc3Rfb2JqKTsKPj4+ICvCoMKgwqDCoMKg
wqDCoCBkbWFfcmVzdl91bmxvY2soJmdob3N0X29iai0+YmFzZS5fcmVzdik7Cj4+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgIHR0bV9ib19wdXQoZ2hvc3Rfb2JqKTsKPj4+ICDCoCDCoMKgwqDCoMKgIH0g
ZWxzZSBpZiAoZnJvbS0+ZmxhZ3MgJiBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVEKSB7Cj4+PiBAQCAt
ODM2LDcgKzgzOCw3IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyhzdHJ1Y3QKPj4+IHR0
bV9idWZmZXJfb2JqZWN0ICpibykKPj4+ICDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+PiAgwqAgLcKgwqDCoCByZXQgPSBkbWFfcmVzdl9j
b3B5X2ZlbmNlcyhnaG9zdC0+YmFzZS5yZXN2LCBiby0+YmFzZS5yZXN2KTsKPj4+ICvCoMKgwqAg
cmV0ID0gZG1hX3Jlc3ZfY29weV9mZW5jZXMoJmdob3N0LT5iYXNlLl9yZXN2LCBiby0+YmFzZS5y
ZXN2KTsKPj4+ICDCoMKgwqDCoMKgIC8qIExhc3QgcmVzb3J0LCB3YWl0IGZvciB0aGUgQk8gdG8g
YmUgaWRsZSB3aGVuIHdlIGFyZSBPT00gKi8KPj4+ICDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgIHR0bV9ib193YWl0KGJvLCBmYWxzZSwgZmFsc2UpOwo+Pj4gQEAg
LTg0NSw3ICs4NDcsNyBAQCBpbnQgdHRtX2JvX3BpcGVsaW5lX2d1dHRpbmcoc3RydWN0Cj4+PiB0
dG1fYnVmZmVyX29iamVjdCAqYm8pCj4+PiAgwqDCoMKgwqDCoCBiby0+bWVtLm1lbV90eXBlID0g
VFRNX1BMX1NZU1RFTTsKPj4+ICDCoMKgwqDCoMKgIGJvLT50dG0gPSBOVUxMOwo+Pj4gIMKgIC3C
oMKgwqAgdHRtX2JvX3VucmVzZXJ2ZShnaG9zdCk7Cj4+PiArwqDCoMKgIGRtYV9yZXN2X3VubG9j
aygmZ2hvc3QtPmJhc2UuX3Jlc3YpOwo+Pj4gIMKgwqDCoMKgwqAgdHRtX2JvX3B1dChnaG9zdCk7
Cj4+PiAgwqAgwqDCoMKgwqDCoCByZXR1cm4gMDsKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
