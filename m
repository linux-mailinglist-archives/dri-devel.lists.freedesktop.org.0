Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6592103801
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 11:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C19F6E239;
	Wed, 20 Nov 2019 10:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD236E239
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 10:55:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z10so27561908wrs.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 02:55:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=nE0kRKkBQX0dy62jxNmU6uNQZsrckgjoZ9te2gvRHrM=;
 b=JyDvhX9j4SAlIQpDC2g3bRZPDzNUSh7kVwk3qv837MNHLusJWzy9p3U0MR3pVGu+0/
 1Ja6ITP2rFU7yv6D+WSgywVriov5O9BBNEDPZ2176CNGosfdjZl99d364hZA27Pqw6jn
 xJqV/ifpNBMPvZScLtyhCo2WC7PM80SNLoNhLbmHC14CcgOSHoE0S0wodOBjTj/4hJZ/
 LH6ay3edZspGx5G4S7IxivSsnhh4HLoNXe8kiGrDRJKE0OxqhgPwNYVVChe5x/XS6ku2
 0X51AQ4KoCFV6M3XhT2N8scE6ekYh4MGr8Z1FixKWa4dOlhYz8p/0Vcu0btXth5JkhrX
 kOxw==
X-Gm-Message-State: APjAAAV79KIYofqopm8LyDdHmV4MwNbkS7IusH0HRKnXZKn92xQGwcbq
 CHZD9n19HUeGxcAPDNJu+9MThg==
X-Google-Smtp-Source: APXvYqzH0e0Gl4Hd3CHoJ9bx4WH0jmUF46Jbt8rS99sD0Q5qMye80U26ZDZC6uCyTYSCht5t/hY9vw==
X-Received: by 2002:adf:fd45:: with SMTP id h5mr2599463wrs.388.1574247308555; 
 Wed, 20 Nov 2019 02:55:08 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b66sm6451106wmh.39.2019.11.20.02.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 02:55:07 -0800 (PST)
Date: Wed, 20 Nov 2019 11:55:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/3] drm/modeset: Prime modeset lock vs dma_resv
Message-ID: <20191120105505.GK30416@phenom.ffwll.local>
References: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
 <20191119210844.16947-2-daniel.vetter@ffwll.ch>
 <9ce03b86-3bec-3a33-b5d0-4acbe9e861ec@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ce03b86-3bec-3a33-b5d0-4acbe9e861ec@amd.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=nE0kRKkBQX0dy62jxNmU6uNQZsrckgjoZ9te2gvRHrM=;
 b=EduAshhD0jiR1FTl10Fob+dAHurPh/hb+u3X8K4nae8a3fjQsEZcjkfeVY8I/SXEmO
 jA8KHvjMpLXlFc6TLV/LzBJf+HQ7P2gSp+VuA2utpcxQV5LEKGR1ZdyxmRzFXm1cMVAU
 DQblCt6uya1DtzGDxdDbGs0OrnN6YTSONuXzU=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDk6MzQ6MDNBTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAxOS4xMS4xOSB1bSAyMjowOCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4g
PiBJdCdzIGtpbmRhIHJlYWxseSBoYXJkIHRvIGdldCB0aGlzIHdyb25nIG9uIGEgZHJpdmVyIHdp
dGggYm90aCBkaXNwbGF5Cj4gPiBhbmQgZG1hX3Jlc3YgbG9ja2luZy4gQnV0IHdobyBldmVyIGtu
b3dzLCBzbyBiZXR0ZXIgdG8gbWFrZSBzdXJlIHRoYXQKPiA+IHJlYWxseSBhbGwgZHJpdmVycyBu
ZXN0IHRoZXNlIHRoZSBzYW1lIHdheS4KPiA+IAo+ID4gRm9yIGFjdHVhbCBsb2NrIHNlbWFudGlj
cyB0aGUgYWNxdWlyZSBjb250ZXh0IG5lc3RpbmcgZG9lc24ndCBtYXR0ZXIuCj4gPiBCdXQgdG8g
dGVhY2ggbG9ja2RlcCB3aGF0J3MgZ29pbmcgb24gd2l0aCB3d19tdXRleCB0aGUgYWNxdWlyZSBj
dHggaXMKPiA+IGEgZmFrZSBsb2NrZGVwIGxvY2ssIGhlbmNlIGZyb20gYSBsb2NrZGVwIHBvdiBp
dCBkb2VzIG1hdHRlci4gVGhhdCdzCj4gPiB3aHkgSSBmaWd1cmVkIGJldHRlciB0byBpbmNsdWRl
IGl0Lgo+ID4gCj4gPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxp
bnV4LmludGVsLmNvbT4KPiA+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KPiA+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNv
bT4KPiAKPiBXaHkgbm90IGFkZCBhbm90aGVyIF9faW5pdCBmdW5jdGlvbiBsaWtlIHdlIGRpZCBm
b3IgZG1hX3Jlc3Y/IFRoYXQgbG9va2VkCj4gcmF0aGVyIGNsZWFuIHRvIG1lLgoKSG0sIEkndmUg
b25seSBkb25lIHRoYXQgYmVjYXVzZSBjYWxsZXJzIG9mIGRtYV9yZXN2X2luaXQgd2hlcmUgaG9s
ZGluZwpsb3RzIG9mIGxvY2tzIGFscmVhZHkgKHR0bSBnaG9zdCBvYmplY3RzKS4gQXQgbGVhc3Qg
aW4gaTkxNSB3ZSB0cnkgdG8gZG8KYWxsIGxvY2tkZXAgcHJpbWluZyBhcyBjbG9zZSBhcyBwb3Nz
aWJsZSB0byB0aGUgbXV0ZXhfaW5pdCBjYWxscywgc28gaXQncwphbGwgdG9nZXRoZXIuIFNpbmNl
IG9mdGVuIHRoZXJlJ3Mgbm8gc2VwYXJhdGUgb2JqX2luaXQgZnVuY3Rpb24sIGFuZCB5b3UKbmVl
ZCB0byB1c2UgdGhlIHNhbWUgbXV0ZXhfaW5pdCB0byBtYWtlIHN1cmUgeW91IGhhdmUgdGhlIHNh
bWUgc3RhdGljCmxvY2tkZXAga2V5LgoKTm8gc3Ryb25nIG9waW5pb24gaGVyZSBmcm9tIG1lLCBq
dXN0IHdhbnRlZCB0byBleHBsYWluIHdoeSBJJ20gYmlhc2VkIHRvCnRoaXMgd2F5IG9mIGRvaW5n
IHRoaW5ncy4KCj4gRWl0aGVyIHdoeSBmZWVsIGZyZWUgdG8gYWRkIGFuIEFja2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnCj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gdG8gdGhlIHBhdGNoLgoK
VGhhbmtzLiBDYW4geW91IHBscyBhbHNvIGxvb2sgYXQgcGF0Y2ggMiwgYXQgbGVhc3QgZnJvbSBh
IHR0bS9hbWRncHUgcG92PwoKQ2hlZXJzLCBEYW5pZWwKCj4gCj4gUmVnYXJkcywKPiBDaHJpc3Rp
YW4uCj4gCj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jIHwg
MjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMjgg
aW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9t
b2RlX2NvbmZpZy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jCj4gPiBpbmRl
eCAzYjU3MGE0MDQ5MzMuLjA4ZTZlZmY2YTE3OSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbW9kZV9jb25maWcuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rl
X2NvbmZpZy5jCj4gPiBAQCAtMjcsNiArMjcsNyBAQAo+ID4gICAjaW5jbHVkZSA8ZHJtL2RybV9m
aWxlLmg+Cj4gPiAgICNpbmNsdWRlIDxkcm0vZHJtX21vZGVfY29uZmlnLmg+Cj4gPiAgICNpbmNs
dWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2RtYS1yZXN2Lmg+Cj4g
PiAgICNpbmNsdWRlICJkcm1fY3J0Y19pbnRlcm5hbC5oIgo+ID4gICAjaW5jbHVkZSAiZHJtX2lu
dGVybmFsLmgiCj4gPiBAQCAtNDE1LDYgKzQxNiwzMyBAQCB2b2lkIGRybV9tb2RlX2NvbmZpZ19p
bml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gPiAgIAlkZXYtPm1vZGVfY29uZmlnLm51bV9j
cnRjID0gMDsKPiA+ICAgCWRldi0+bW9kZV9jb25maWcubnVtX2VuY29kZXIgPSAwOwo+ID4gICAJ
ZGV2LT5tb2RlX2NvbmZpZy5udW1fdG90YWxfcGxhbmUgPSAwOwo+ID4gKwo+ID4gKwlpZiAoSVNf
RU5BQkxFRChDT05GSUdfTE9DS0RFUCkpIHsKPiA+ICsJCXN0cnVjdCBkcm1fbW9kZXNldF9hY3F1
aXJlX2N0eCBtb2Rlc2V0X2N0eDsKPiA+ICsJCXN0cnVjdCB3d19hY3F1aXJlX2N0eCByZXN2X2N0
eDsKPiA+ICsJCXN0cnVjdCBkbWFfcmVzdiByZXN2Owo+ID4gKwkJaW50IHJldDsKPiA+ICsKPiA+
ICsJCWRtYV9yZXN2X2luaXQoJnJlc3YpOwo+ID4gKwo+ID4gKwkJZHJtX21vZGVzZXRfYWNxdWly
ZV9pbml0KCZtb2Rlc2V0X2N0eCwgMCk7Cj4gPiArCQlyZXQgPSBkcm1fbW9kZXNldF9sb2NrKCZk
ZXYtPm1vZGVfY29uZmlnLmNvbm5lY3Rpb25fbXV0ZXgsCj4gPiArCQkJCSAgICAgICAmbW9kZXNl
dF9jdHgpOwo+ID4gKwkJaWYgKHJldCA9PSAtRURFQURMSykKPiA+ICsJCQlyZXQgPSBkcm1fbW9k
ZXNldF9iYWNrb2ZmKCZtb2Rlc2V0X2N0eCk7Cj4gPiArCj4gPiArCQl3d19hY3F1aXJlX2luaXQo
JnJlc3ZfY3R4LCAmcmVzZXJ2YXRpb25fd3dfY2xhc3MpOwo+ID4gKwkJcmV0ID0gZG1hX3Jlc3Zf
bG9jaygmcmVzdiwgJnJlc3ZfY3R4KTsKPiA+ICsJCWlmIChyZXQgPT0gLUVERUFETEspCj4gPiAr
CQkJZG1hX3Jlc3ZfbG9ja19zbG93KCZyZXN2LCAmcmVzdl9jdHgpOwo+ID4gKwo+ID4gKwkJZG1h
X3Jlc3ZfdW5sb2NrKCZyZXN2KTsKPiA+ICsJCXd3X2FjcXVpcmVfZmluaSgmcmVzdl9jdHgpOwo+
ID4gKwo+ID4gKwkJZHJtX21vZGVzZXRfZHJvcF9sb2NrcygmbW9kZXNldF9jdHgpOwo+ID4gKwkJ
ZHJtX21vZGVzZXRfYWNxdWlyZV9maW5pKCZtb2Rlc2V0X2N0eCk7Cj4gPiArCQlkbWFfcmVzdl9m
aW5pKCZyZXN2KTsKPiA+ICsJfQo+ID4gICB9Cj4gPiAgIEVYUE9SVF9TWU1CT0woZHJtX21vZGVf
Y29uZmlnX2luaXQpOwo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
