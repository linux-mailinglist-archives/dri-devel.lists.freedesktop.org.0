Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E938C104421
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 20:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C138995F;
	Wed, 20 Nov 2019 19:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B597E8995F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 19:18:22 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-gqv_YxcjOw6BLvYBgMuSTg-1; Wed, 20 Nov 2019 14:18:19 -0500
Received: by mail-qv1-f70.google.com with SMTP id w7so454648qvs.15
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 11:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=0ZPeDSwJuPWYCh0VtDJP/WF4gGFB+fn/XJDG0N6k/Og=;
 b=B3NPY82ZW3km+EBYKJgCtjazNzPruCLA8hTj8gsP2mSbXtf6FcvBzUmksgtDyeoPLH
 Ck1i0amecpK0EM8//dmGsW2v/gM/eVKL4cHn8K62TqgjsO0acSI+p2r0ObzyTa48GtNA
 7RpTQDimo45nnWQQcTRA/Kt36WEIFdkIHoXlJYAKa8Cx+TFVTqOGxlAAHBvTArBT+ae6
 nisJTgVbvlO/THYJFO+Tng9mzUftunruJcSa6GVqs9xyM3fc49ThxrhxhqEpZ5sV/lY9
 LhcvZidQnOzrOf8VIa/lmgBmqmvMS6DwkPU31xyyuwO6qUPptEdGCwLG9l2d4X6AARkm
 ZJyg==
X-Gm-Message-State: APjAAAVNnP0ZChNA5vNb4O4eUloO3Z3GrxLcsSB7hZTrAAG/B0DJB/mG
 DA//P98/Gc1NqhzJJ6Tq5qo4L1B+nHZ0mRPKlHoZeLRQVnMuH5fshtBvTNxRqfXG8qi6Zq6jayY
 cN0dqlago7PPQwyAEaIRHRXmkJTFp
X-Received: by 2002:ac8:1908:: with SMTP id t8mr4314402qtj.18.1574277499307;
 Wed, 20 Nov 2019 11:18:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqx3z6BLPgSb887SPg+WQy5XrCTAlqdgetdC6l5TXKFFF3p7RCVtBvZ/2U95u26DiAwzmgkpgg==
X-Received: by 2002:ac8:1908:: with SMTP id t8mr4314362qtj.18.1574277498977;
 Wed, 20 Nov 2019 11:18:18 -0800 (PST)
Received: from dhcp-10-20-1-46.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id w15sm15088193qtk.43.2019.11.20.11.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 11:18:18 -0800 (PST)
Message-ID: <a0e277e23dc540c66d075305a0a9c6903e81de48.camel@redhat.com>
Subject: Re: [PATCH][next] drm/dp_mst: fix multiple frees of tx->bytes
From: Lyude Paul <lyude@redhat.com>
To: Colin Ian King <colin.king@canonical.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel.vetter@ffwll.ch>,  dri-devel@lists.freedesktop.org
Date: Wed, 20 Nov 2019 14:18:17 -0500
In-Reply-To: <0e6b2b68-2898-213d-3a37-c23d32a97133@canonical.com>
References: <20191120173509.347490-1-colin.king@canonical.com>
 <f6c44c85a63c89e548cafa55d89caccd7e868268.camel@redhat.com>
 <0e6b2b68-2898-213d-3a37-c23d32a97133@canonical.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: gqv_YxcjOw6BLvYBgMuSTg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574277501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aWQ0snqOKErAvm9iOwBriYePO5G6kgp/7GlG1L6NwAM=;
 b=bd2ziWcHMCaTycH4JILx9Y/qst/rxWZ5Da4ExcbefsA6iFlroArrTJm/jH0WtxU9cnrQem
 jH30RW1U60BkOKOQTKHFFkXCEbSGoTc4EZ9dAt1klNgR/IZCwNE9r9SQg8iI1d2PDwQmXA
 WEzIxUyOYmunnXu8JudBWqiCnQi1NnM=
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTExLTIwIGF0IDE5OjExICswMDAwLCBDb2xpbiBJYW4gS2luZyB3cm90ZToK
PiBPbiAyMC8xMS8yMDE5IDE4OjU5LCBMeXVkZSBQYXVsIHdyb3RlOgo+ID4gSGVoLCBzdXJwcmlz
ZWQgSSBtaXNzZWQgdGhpcyBvbmUhCj4gPiAKPiA+IFJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxs
eXVkZUByZWRoYXQuY29tPgo+ID4gCj4gPiBEbyB5b3UgbmVlZCBtZSB0byBwdXNoIHRoaXMgdG8g
ZHJtLW1pc2MsIG9yIGRvIHlvdSBoYXZlIGNvbW1pdCByaWdodHMKPiA+IGFscmVhZHkKPiAKPiBJ
IGhhdmUgbm8gY29tbWl0IHJpZ2h0cy4KCkdvdGNoYToKCkVudW1lcmF0aW5nIG9iamVjdHM6IDEx
LCBkb25lLgpDb3VudGluZyBvYmplY3RzOiAxMDAlICgxMS8xMSksIGRvbmUuCkRlbHRhIGNvbXBy
ZXNzaW9uIHVzaW5nIHVwIHRvIDQgdGhyZWFkcwpDb21wcmVzc2luZyBvYmplY3RzOiAxMDAlICg2
LzYpLCBkb25lLgpXcml0aW5nIG9iamVjdHM6IDEwMCUgKDYvNiksIDg4NSBieXRlcyB8IDQ0Mi4w
MCBLaUIvcywgZG9uZS4KVG90YWwgNiAoZGVsdGEgNSksIHJldXNlZCAwIChkZWx0YSAwKQpUbyBz
c2g6Ly9naXQuZnJlZWRlc2t0b3Aub3JnL2dpdC9kcm0vZHJtLW1pc2MKICAgODg5NmU0MGMwNWNj
Li4yYzhiYzkxNDg4ZmMgIGRybS1taXNjLW5leHQgLT4gZHJtLW1pc2MtbmV4dApQdXNoaW5nIGRy
bS1taXNjLWZpeGVzIHRvIGZvci1saW51eC1uZXh0LWZpeGVzLi4uIEV2ZXJ5dGhpbmcgdXAtdG8t
ZGF0ZQpEb25lLgpQdXNoaW5nIGRybS1taXNjLW5leHQtZml4ZXMgdG8gZm9yLWxpbnV4LW5leHQu
Li4gRXZlcnl0aGluZyB1cC10by1kYXRlCkRvbmUuClVwZGF0aW5nIHJlcmVyZSBjYWNoZS4uLiBE
b25lLgpSZWxvYWRpbmcgbmlnaHRseS5jb25mLi4uIERvbmUuCkZldGNoaW5nIGRybS1hbWQuLi4g
RG9uZS4KRmV0Y2hpbmcgZHJtLWludGVsLi4uIERvbmUuCkZldGNoaW5nIHNvdW5kLXVwc3RyZWFt
IChsb2NhbCByZW1vdGUgc291bmQpLi4uIERvbmUuCkZldGNoaW5nIGRybS4uLiBEb25lLgpGZXRj
aGluZyBkcm0tbWlzYy4uLiBEb25lLgpGZXRjaGluZyBsaW51eC11cHN0cmVhbSAobG9jYWwgcmVt
b3RlIG9yaWdpbikuLi4gRG9uZS4KRmV0Y2hpbmcgZHJtLXRpcC4uLiBEb25lLgpNZXJnaW5nIGRy
bS9kcm0tZml4ZXMuLi4gUmVzZXQuIERvbmUuCk1lcmdpbmcgZHJtLW1pc2MvZHJtLW1pc2MtZml4
ZXMuLi4gRmFzdC1mb3J3YXJkLiBEb25lLgpNZXJnaW5nIGRybS1pbnRlbC9kcm0taW50ZWwtZml4
ZXMuLi4gRmFzdC1mb3J3YXJkLiBEb25lLgpNZXJnaW5nIGRybS1hbWQvZHJtLWFtZC1maXhlcy4u
LiBGYXN0LWZvcndhcmQuIERvbmUuCk1lcmdpbmcgZHJtL2RybS1uZXh0Li4uIERvbmUuCk1lcmdp
bmcgZHJtLW1pc2MvZHJtLW1pc2MtbmV4dC1maXhlcy4uLiBEb25lLgpNZXJnaW5nIGRybS1pbnRl
bC9kcm0taW50ZWwtbmV4dC1maXhlcy4uLiBEb25lLgpNZXJnaW5nIGRybS1hbWQvZHJtLWFtZC1u
ZXh0LWZpeGVzLi4uIEZhc3QtZm9yd2FyZC4gRG9uZS4KTWVyZ2luZyBkcm0tbWlzYy9kcm0tbWlz
Yy1uZXh0Li4uIERvbmUuCk1lcmdpbmcgZHJtLWludGVsL2RybS1pbnRlbC1uZXh0LXF1ZXVlZC4u
LiBEb25lLgpNZXJnaW5nIGRybS1pbnRlbC9kcm0taW50ZWwtbmV4dC4uLiBGYXN0LWZvcndhcmQu
IERvbmUuCk1lcmdpbmcgZHJtLWFtZC9kcm0tYW1kLW5leHQuLi4gRmFzdC1mb3J3YXJkLiBEb25l
LgpNZXJnaW5nIHNvdW5kLXVwc3RyZWFtL2Zvci1saW51cyAobG9jYWwgcmVtb3RlIHNvdW5kKS4u
LiBGYXN0LWZvcndhcmQuIERvbmUuCk1lcmdpbmcgc291bmQtdXBzdHJlYW0vZm9yLW5leHQgKGxv
Y2FsIHJlbW90ZSBzb3VuZCkuLi4gRG9uZS4KTWVyZ2luZyBkcm0taW50ZWwvdG9waWMvY29yZS1m
b3ItQ0kuLi4gRG9uZS4KQWRkaW5nIGludGVncmF0aW9uIG1hbmlmZXN0IGRybS10aXA6IDIwMTl5
LTExbS0yMGQtMTloLTE2bS0zOXMgVVRDLi4uIERvbmUuClB1c2hpbmcgZHJtLXRpcC4uLiBEb25l
LgpGaW5hbGl6aW5nIHJlcmVyZSBjYWNoZS4uLiBOb3RoaW5nIGNoYW5nZWQuIFB1c2hpbmcgcmVy
ZXJlIGNhY2hlLi4uIERvbmUuCgpUaGFua3MgZm9yIHRoZSBwYXRjaCEKPiAKPiAKPiA+IE9uIFdl
ZCwgMjAxOS0xMS0yMCBhdCAxNzozNSArMDAwMCwgQ29saW4gS2luZyB3cm90ZToKPiA+ID4gRnJv
bTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiA+ID4gCj4gPiA+
IEN1cnJlbnRseSB0eC0+Ynl0ZXMgaXMgYmVpbmcgZnJlZWQgci0+bnVtX3RyYW5zYWN0aW9ucyBu
dW1iZXIgb2YKPiA+ID4gdGltZXMgYmVjYXVzZSB0eCBpcyBub3QgYmVpbmcgc2V0IGNvcnJlY3Rs
eS4gRml4IHRoaXMgYnkgc2V0dGluZwo+ID4gPiB0eCB0byAmci0+dHJhbnNhY3Rpb25zW2ldIHNv
IHRoYXQgdGhlIGNvcnJlY3Qgb2JqZWN0cyBhcmUgYmVpbmcKPiA+ID4gZnJlZWQgb24gZWFjaCBs
b29wIGl0ZXJhdGlvbi4KPiA+ID4gCj4gPiA+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJEb3VibGUg
ZnJlZSIpCj4gPiA+IEZpeGVzOiAyZjAxNWVjNmVhYjYgKCJkcm0vZHBfbXN0OiBBZGQgc2lkZWJh
bmQgZG93biByZXF1ZXN0IHRyYWNpbmcgKwo+ID4gPiBzZWxmdGVzdHMiKQo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+ID4gPiAt
LS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCA0ICsrKy0K
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+
ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ID4gPiBp
bmRleCBhZTU4MDlhMWYxOWEuLjI3NTRlN2UwNzVlNyAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gPiA+IEBAIC01MTcsOCArNTE3LDEwIEBAIGRybV9k
cF9kZWNvZGVfc2lkZWJhbmRfcmVxKGNvbnN0IHN0cnVjdAo+ID4gPiBkcm1fZHBfc2lkZWJhbmRf
bXNnX3R4ICpyYXcsCj4gPiA+ICAJCQl9Cj4gPiA+ICAKPiA+ID4gIAkJCWlmIChmYWlsZWQpIHsK
PiA+ID4gLQkJCQlmb3IgKGkgPSAwOyBpIDwgci0+bnVtX3RyYW5zYWN0aW9uczsgaSsrKQo+ID4g
PiArCQkJCWZvciAoaSA9IDA7IGkgPCByLT5udW1fdHJhbnNhY3Rpb25zOyBpKyspIHsKPiA+ID4g
KwkJCQkJdHggPSAmci0+dHJhbnNhY3Rpb25zW2ldOwo+ID4gPiAgCQkJCQlrZnJlZSh0eC0+Ynl0
ZXMpOwo+ID4gPiArCQkJCX0KPiA+ID4gIAkJCQlyZXR1cm4gLUVOT01FTTsKPiA+ID4gIAkJCX0K
PiA+ID4gIAotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
