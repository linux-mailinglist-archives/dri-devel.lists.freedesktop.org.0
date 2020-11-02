Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F32A2B03
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 13:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E6D6E4E8;
	Mon,  2 Nov 2020 12:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956BC6E4E8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 12:52:04 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id n15so12447305otl.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 04:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fMkq/VIu6fd+U26qy11bcn48l177zp7DNZNLDcC8+t4=;
 b=NDVwt/pVYEC750UTJE0s4J6JfMRuJGuZ5axCjsm/867iyTvOIQA71kEJ7rOwvA2uJK
 h2YIoyHvvyTzzEIOxqYrJJgzjB+hrNaFdipkdkPZ8SY+qC4/fqqKc90SaigG6BmW48bt
 tYRZIBm/F4Qpu5EDpooS+V6HzkMoBTCfnWFOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fMkq/VIu6fd+U26qy11bcn48l177zp7DNZNLDcC8+t4=;
 b=AveJ9Bq6JvHGoCM3cDOEkhaBVgnv/cdaEDZVDmbR/76eL3tbMmApuRWQVQKJ+mTj/f
 Gf58b4OQ7MSJa8VqSUQzjMk2f/sdwrwLA4zKiWFZO+BSwqaKGaCIY2pTAbso2TpwKRY8
 Cy+FhoAoZZ+u2cFy7UtjMkSh8SWc1R/E0+neceoJulKKDLwNgP7vltPkz0IN9eeeNtOP
 PLdDRHaDva8kfJ3/Gh9TcdP6NPcE74Kq95MOUmDHUtCbozrAzZGiVTHU9WitcxPkOYrq
 tl+rfbl55l8g6PtO+ZFYiIrq9DtoNjv+oAweld1q/YprRoE/we8r+n+CB+1R1faNplxa
 1Vdw==
X-Gm-Message-State: AOAM5326TaVmmQc6MxrxIQtqYfWT5k/6dxSVa45y4DcnhMD1rsKu1kDs
 4okbH3irjBG5vdHZoMR881vRe5LCDADxbedi2HZDjg==
X-Google-Smtp-Source: ABdhPJxyDuZkJAdOD9FOb99eLulTDZ7+rc12p+EOcj7msBdtsbwaHMm6Xwq+c7U/0m8FTtQO3fwxi/+WRsLRIJ6Ic54=
X-Received: by 2002:a9d:6e81:: with SMTP id a1mr11349917otr.303.1604321523932; 
 Mon, 02 Nov 2020 04:52:03 -0800 (PST)
MIME-Version: 1.0
References: <1604315990-56787-1-git-send-email-tiantao6@hisilicon.com>
 <8a76d144-f8ba-bbbc-9177-53088f6dc73a@suse.de>
 <d0b8c494-0d08-11ae-c0e9-988dbf9ecd35@suse.de>
In-Reply-To: <d0b8c494-0d08-11ae-c0e9-988dbf9ecd35@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 2 Nov 2020 13:51:52 +0100
Message-ID: <CAKMK7uHBjV8nEw9xW_MkGMeDrRSo9wuqCawdhw5D5t=JhVD5DA@mail.gmail.com>
Subject: Re: [PATCH] drm/irq: Add irq as false detection
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tian Tao <tiantao6@hisilicon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMiwgMjAyMCBhdCAxOjQwIFBNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToKPgo+IEhpCj4KPiBBbSAwMi4xMS4yMCB1bSAxMzowOSBzY2hy
aWViIFRob21hcyBaaW1tZXJtYW5uOgo+ID4gSGkKPiA+Cj4gPiBBbSAwMi4xMS4yMCB1bSAxMjox
OSBzY2hyaWViIFRpYW4gVGFvOgo+ID4+IEFkZCB0aGUgZGV0ZWN0aW9uIG9mIGZhbHNlIGZvciBp
cnEsIHNvIHRoYXQgdGhlIEVJTlZBTCBpcyBub3QKPiA+PiByZXR1cm5lZCB3aGVuIGRldi0+aXJx
X2VuYWJsZWQgaXMgZmFsc2UuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBUaWFuIFRhbyA8dGlh
bnRhbzZAaGlzaWxpY29uLmNvbT4KPiA+PiAtLS0KPiA+PiAgZHJpdmVycy9ncHUvZHJtL2RybV9p
cnEuYyB8IDMgKysrCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+Pgo+
ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2lycS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9pcnEuYwo+ID4+IGluZGV4IDA5ZDZlOWUuLjc1MzdhM2QgMTAwNjQ0Cj4gPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9pcnEuYwo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1faXJxLmMKPiA+PiBAQCAtMTcyLDYgKzE3Miw5IEBAIGludCBkcm1faXJxX3VuaW5zdGFsbChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ID4+ICAgICAgYm9vbCBpcnFfZW5hYmxlZDsKPiA+PiAg
ICAgIGludCBpOwo+ID4+Cj4gPj4gKyAgICBpZiAoIWRldi0+aXJxX2VuYWJsZWQgfHwgIWRldikK
PiA+PiArICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPj4gKwo+ID4KPiA+IERlcmVmZXJlbmNpbmcg
YSBwb2ludGVyIGJlZm9yZSBOVUxMLWNoZWNraW5nIGl0LCBpcyBZb2RhIHByb2dyYW1taW5nLiA6
KQo+ID4gSSdkIGp1c3QgZHJvcCB0aGUgdGVzdCBmb3IgIWRldiBhbmQgYXNzdW1lIHRoYXQgZGV2
IGlzIGFsd2F5cyB2YWxpZC4KPiA+Cj4gPiBJIHN1Z2dlc3QgdG8gY2hhbmdlIHRoZSBpbnQgcmV0
dXJuIHZhbHVlIHRvIHZvaWQgYW5kIHJldHVybiBub3RoaW5nLgo+ID4KPiA+IFJlLXJlYWRpbmcg
dGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbiBvZiB0aGlzIGZ1bmN0aW9uLCB0aGlzIGxvY2F0aW9u
Cj4gPiBtaWdodCBiZSB0b28gZWFybHkuIEZ1cnRoZXIgYmVsb3cgdGhlcmUgYWxyZWFkeSBpcyBh
IHRlc3QgZm9yCj4gPiBpcnFfZW5hYmxlZC4gUHV0IGEgZHJtX1dBUk5fT04gYXJvdW5kIGl0IGFu
ZCBpdCBzaG91bGQgYmUgZmluZS4gVGhpcyB3YXkKPiA+IHRoZSB2YmxhbmsgaGFuZGxlcnMgd2ls
bCBiZSBkaXNhYmxlZCBhbmQgZXJyb25lb3VzIGNhbGxlcnMgd2lsbCBzZWUgYQo+ID4gd2Fybmlu
ZyBpbiB0aGUga2VybmVsJ3MgbG9nLgo+Cj4gSW4gYWRkaXRpb24gdG8gdGhlc2UgY2hhbmdlcywg
eW91IGNvdWxkIGFsc28gYWRkIGEgbWFuYWdlZAo+IGltcGxlbWVudGF0aW9uIG9mIGRybV9pcnFf
aW5zdGFsbCgpLiBUaGUgY2Fub25pY2FsIG5hbWUgc2hvdWxkIGJlCj4gZGV2bV9kcm1faXJxX2lu
c3RhbGwoKS4gVGhlIGZ1bmN0aW9uIHdvdWxkIGNhbGwgZHJtX2lycV9pbnN0YWxsKCkgYW5kCj4g
cmVnaXN0ZXIgYSBjbGVhbnVwIGhhbmRsZXIgdmlhIGRldm1fYWRkX2FjdGlvbigpLiBFeGFtcGxl
IGNvZGUgaXMgYXQgWzFdLgo+Cj4gS01TIGRyaXZlcnMsIHN1Y2ggYXMgaGlibWMsIHdvdWxkIHRo
ZW4gbm90IGhhdmUgdG8gYm90aGVyIGFib3V0Cj4gdW5pbnN0YWxsaW5nIHRoZSBEUk0gaXJxLgoK
WXVwLCBkZXZtXyBpcyB0aGUgcmlnaHQgZml4IGhlcmUgaW1vLCBub3QgdHJ5aW5nIHRvIG1ha2Ug
dGhlIHVuaW5zdGFsbApob29rIHJlc2lsaWVudCBhZ2FpbnN0IGRyaXZlcnMgd2hpY2ggY2FuJ3Qg
a2VlcCB0cmFjayBvZiBzdHVmZi4gU28gaWYKdGhhdCdzIGFsbCB0aGVyZSBpcywgaW1vIHRoaXMg
cGF0Y2ggaXMgYSBiYWQgaWRlYSwgc2luY2Ugd2UgaGF2ZQpwcm9wZXIgdG9vbHMgdG8gbWFrZSBk
cml2ZXIgdW5sb2FkaW5nIGVhc2llciBvbiBkcml2ZXIgYXV0aG9yJ3MKbm93YWRheXMuCi1EYW5p
ZWwKCj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPiBbMV0KPiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2Rydi5jI242NjQKPgo+Cj4gPgo+ID4gQmVzdCByZWdhcmRzCj4gPiBU
aG9tYXMKPiA+Cj4gPj4gICAgICBpcnFfZW5hYmxlZCA9IGRldi0+aXJxX2VuYWJsZWQ7Cj4gPj4g
ICAgICBkZXYtPmlycV9lbmFibGVkID0gZmFsc2U7Cj4gPj4KPiA+Pgo+ID4KPiA+Cj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiA+
Cj4KPiAtLQo+IFRob21hcyBaaW1tZXJtYW5uCj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcgo+
IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSAo+IE1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQo+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKPiBHZXNj
aMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgoKCi0tIApEYW5pZWwgVmV0dGVyClNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
