Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F2295920
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E867C6F3EF;
	Thu, 22 Oct 2020 07:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3066EACF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 12:50:32 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id h11so985510qvq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 05:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VkhhJyafoy36fds4PnCfWF9LNV9fC1i6gyayD/bdTsE=;
 b=Bjric0h8k3E5nVSnyA3y8syn5qJbzN5IRzuOHR0d7uEDz69w1rKEdQtJjX2klnSD2f
 HQcTpKD5D3V7kWLlToHxrM8UOfbUsM4NGMyxmaL4cJNWPBOlwy7SSVlgAu3fXQNgW/tm
 E/Z154bHNIDfOdfpW4c0/FAD/DUsAoEBg7tdzOhHMjGwZ1srI5ZzmyHw1kqTbOA20Zsr
 6FkTvbFUFtQy26Mpkg7JM8b/jc3WZ4zNCmcMh6GqroRxUEuzzQjwRRq/1rm+GvI0lwIa
 yqkLIFnQ0gQqj71OpMsdVbj1j0y2lESP0Xm+nHN0pfprmhEnmw6kFUQw4XnnGYDmJyHR
 D1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VkhhJyafoy36fds4PnCfWF9LNV9fC1i6gyayD/bdTsE=;
 b=K8pZYPinXJq86SVgD7ruRwJsodv6x22qrXZinj/eQkyv0d4q3zkAdKjvgRWcag/Z5E
 nV4Z5jXpJbupRwabod2QgtsXa3us7jB7v/8Aj5sxRKqylJS4qyE3RzCVK5ZHZj5t9tnP
 9TytGtivKXcEbJSAgYRQ9ZAuwaAWYkCPBKVHUV0+8lgKBL8E6UcrS45SqvfP2+B5lO5h
 4BlBh+zcQ0aCL8oiTa3E2aPXcJWK6ySKkQIhGkqAyLIZid0tKd/p5oIYz+Kj3wjj/iq8
 xxcdFE3/fV2xK9l/uT18fBbneHsPdgCGuEqLM4x+GDfHiVwmmn1ebEB+xxdVmursH7fz
 nTBA==
X-Gm-Message-State: AOAM531+8zrfMXyzDWsgMnpR8ig8QJoXIbQRpywwjZXi+ScmG6iN4gqZ
 Cot4foSZd89apyoNtM+Do2Lvrg==
X-Google-Smtp-Source: ABdhPJylgNYamo6kqGCWkyezTruGMIXv95IBuM/bFST1jOCSfo3IMWIRoN2J3LwPyBiAPIKaTroxlw==
X-Received: by 2002:ad4:52c6:: with SMTP id p6mr2781869qvs.38.1603284631882;
 Wed, 21 Oct 2020 05:50:31 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id r11sm1016060qtw.47.2020.10.21.05.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 05:50:31 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kVDZW-003UAg-0q; Wed, 21 Oct 2020 09:50:30 -0300
Date: Wed, 21 Oct 2020 09:50:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v3 12/16] PCI: Obey iomem restrictions for procfs mmap
Message-ID: <20201021125030.GK36674@ziepe.ca>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
 <20201021085655.1192025-13-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021085655.1192025-13-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.com>,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjEsIDIwMjAgYXQgMTA6NTY6NTFBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGVyZSdzIHRocmVlIHdheXMgdG8gYWNjZXNzIFBDSSBCQVJzIGZyb20gdXNlcnNw
YWNlOiAvZGV2L21lbSwgc3lzZnMKPiBmaWxlcywgYW5kIHRoZSBvbGQgcHJvYyBpbnRlcmZhY2Uu
IFR3byBjaGVjayBhZ2FpbnN0Cj4gaW9tZW1faXNfZXhjbHVzaXZlLCBwcm9jIG5ldmVyIGRpZC4g
QW5kIHdpdGggQ09ORklHX0lPX1NUUklDVF9ERVZNRU0sCj4gdGhpcyBzdGFydHMgdG8gbWF0dGVy
LCBzaW5jZSB3ZSBkb24ndCB3YW50IHJhbmRvbSB1c2Vyc3BhY2UgaGF2aW5nCj4gYWNjZXNzIHRv
IFBDSSBCQVJzIHdoaWxlIGEgZHJpdmVyIGlzIGxvYWRlZCBhbmQgdXNpbmcgaXQuCj4gCj4gRml4
IHRoaXMgYnkgYWRkaW5nIHRoZSBzYW1lIGlvbWVtX2lzX2V4Y2x1c2l2ZSgpIGNoZWNrIHdlIGFs
cmVhZHkgaGF2ZQo+IG9uIHRoZSBzeXNmcyBzaWRlIGluIHBjaV9tbWFwX3Jlc291cmNlKCkuCj4g
Cj4gUmVmZXJlbmNlczogOTBhNTQ1ZTk4MTI2ICgicmVzdHJpY3QgL2Rldi9tZW0gdG8gaWRsZSBp
byBtZW1vcnkgcmFuZ2VzIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGludGVsLmNvbT4KPiBDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+Cj4g
Q2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+IENjOiBEYW4gV2lsbGlhbXMg
PGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51
eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29t
Pgo+IENjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiBDYzogSmFuIEth
cmEgPGphY2tAc3VzZS5jej4KPiBDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRl
bC5jb20+Cj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3Jn
Cj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBCam9ybiBIZWxnYWFzIDxi
aGVsZ2Fhc0Bnb29nbGUuY29tPgo+IENjOiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnCj4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jb20+CgpNYXli
ZSBub3QgZm9yIGZpeGluZyBpbiB0aGlzIHNlcmllcywgYnV0IHRoaXMgYWNjZXNzIHRvCklPUkVT
T1VSQ0VfQlVTWSBkb2Vzbid0IGhhdmUgYW55IGxvY2tpbmcuCgpUaGUgd3JpdGUgc2lkZSBob2xk
cyB0aGUgcmVzb3VyY2VfbG9jayBhdCBsZWFzdC4uCgo+ICAJcmV0ID0gcGNpX21tYXBfcGFnZV9y
YW5nZShkZXYsIGksIHZtYSwKPiAgCQkJCSAgZnByaXYtPm1tYXBfc3RhdGUsIHdyaXRlX2NvbWJp
bmUpOwoKQXQgdGhpcyBwb2ludCB0aGUgdm1hIGlzbid0IGxpbmtlZCBpbnRvIHRoZSBhZGRyZXNz
IHNwYWNlLCBzbyBkb2Vzbid0CnRoaXMgaGFwcGVuPwoKICAgICBDUFUgMCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBDUFUxCiBtbWFwX3JlZ2lvbigpCiAgIHZtYSA9IHZtX2FyZWFf
YWxsb2MKICAgcHJvY19idXNfcGNpX21tYXAKICAgIGlvbWVtX2lzX2V4Y2x1c2l2ZQogICAgcGNp
X21tYXBfcGFnZV9yYW5nZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldm9rZV9kZXZtZW0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5tYXBfbWFwcGluZ19yYW5nZSgpCiAgICAgLy8gdm1hIGlzIG5vdCBsaW5rZWQgdG8g
dGhlIGFkZHJlc3Mgc3BhY2UgaGVyZSwKICAgICAvLyB1bm1hcCBkb2Vzbid0IGZpbmQgaXQKICB2
bWFfbGluaygpIAogICEhISBUaGUgVk1BIGdldHMgbWFwcGVkIHdpdGggdGhlIHJldm9rZWQgUFRF
cwoKSSBjb3VsZG4ndCBmaW5kIGFueXRoaW5nIHRoYXQgcHJldmVudHMgaXQgYXQgbGVhc3QsIG5v
IG1tYXBfc2VtIG9uIHRoZQp1bm1hcCBzaWRlLCBqdXN0IHRoZSBpX21tYXBfbG9jawoKTm90IHNl
ZWluZyBob3cgYWRkcmVzcyBzcGFjZSBhbmQgcHJlLXBvcHVsYXRpbmcgZHVyaW5nIG1tYXAgd29y
awp0b2dldGhlcj8gRGlkIEkgbWlzcyBsb2NraW5nIHNvbWVwbGFjZT8KCk5vdCBzb21ldGhpbmcg
dG8gYmUgZml4ZWQgZm9yIHRoaXMgc2VyaWVzLCB0aGlzIGlzIGNsZWFybHkgYW4KaW1wcm92ZW1l
bnQsIGJ1dCBzZWVtcyBsaWtlIGFub3RoZXIgcHJvYmxlbSB0byB0YWNrbGU/CgpKYXNvbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
