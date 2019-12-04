Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED28112D85
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 15:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842506E90F;
	Wed,  4 Dec 2019 14:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B81E6E90F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 14:35:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w15so8905088wru.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 06:35:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=COMExwvouadcQjAZ+j/aoCpf/bM+m1P6K6pubVfD2Hg=;
 b=H/QqSQ99l507X2T6xOWpJ5VsnOJrfmGarWfE9EZNBA+sH1NhxERoBR06so3Zdv8moU
 YuD3O5/YdCJCnMaJJoN69Yb+zgecvC5grIDCCJ8mwlJJERaCHAd2d+nsWn4gkGdkphpi
 Y0REBMshzehScvzUHPCwKbi+pVPt7djHx/FEvQtMHNEsKm+VwH5JtfBRTriliHHiFwvo
 GhJKQ4Qsd6L8hbIH3Gu2nhk7jdEDMsmiTXaBGKt6ZGG0MBTe/Df70uQaWlgX+NmUY6Av
 LF+XKp/fzh+l68VB7lQ1dOlUDVCN7wAY28wJk2QXQVKJgPxIRzDVWE/So5Yc7bJZq+zR
 K0rg==
X-Gm-Message-State: APjAAAUhG+N58EjEl1Dt9mFIlvLGuGRTvKmFQJsRzDgDikbyctDh3QQg
 S23887MT2Qqb3T3wAS2XoV2IoGUzbvg=
X-Google-Smtp-Source: APXvYqynBtkN+xmFaa6Ak9kWrzD46VfMxjzOkttwtuEbyf5iK06e03rFUEc6Ktv51sFARz/ZAj3Hxw==
X-Received: by 2002:a5d:4807:: with SMTP id l7mr4541406wrq.64.1575470122948;
 Wed, 04 Dec 2019 06:35:22 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id y139sm7286535wmd.24.2019.12.04.06.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 06:35:21 -0800 (PST)
Date: Wed, 4 Dec 2019 15:35:21 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v2 2/2] drm/ttm: Fix vm page protection handling
Message-ID: <20191204143521.GJ25242@dhcp22.suse.cz>
References: <20191203104853.4378-1-thomas_os@shipmail.org>
 <20191203104853.4378-3-thomas_os@shipmail.org>
 <20191204135219.GH25242@dhcp22.suse.cz>
 <b29b166c-e9fe-f829-f533-b39f98b334a9@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b29b166c-e9fe-f829-f533-b39f98b334a9@shipmail.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, pv-drivers@vmware.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkIDA0LTEyLTE5IDE1OjE2OjA5LCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90
ZToKPiBPbiAxMi80LzE5IDI6NTIgUE0sIE1pY2hhbCBIb2NrbyB3cm90ZToKPiA+IE9uIFR1ZSAw
My0xMi0xOSAxMTo0ODo1MywgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3JvdGU6Cj4gPiA+
IEZyb206IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPiA+ID4gCj4g
PiA+IFRUTSBncmFwaGljcyBidWZmZXIgb2JqZWN0cyBtYXksIHRyYW5zcGFyZW50bHkgdG8gdXNl
ci1zcGFjZSwgIG1vdmUKPiA+ID4gYmV0d2VlbiBJTyBhbmQgc3lzdGVtIG1lbW9yeS4gV2hlbiB0
aGF0IGhhcHBlbnMsIGFsbCBQVEVzIHBvaW50aW5nIHRvIHRoZQo+ID4gPiBvbGQgbG9jYXRpb24g
YXJlIHphcHBlZCBiZWZvcmUgdGhlIG1vdmUgYW5kIHRoZW4gZmF1bHRlZCBpbiBhZ2FpbiBpZgo+
ID4gPiBuZWVkZWQuIFdoZW4gdGhhdCBoYXBwZW5zLCB0aGUgcGFnZSBwcm90ZWN0aW9uIGNhY2hp
bmcgbW9kZS0gYW5kCj4gPiA+IGVuY3J5cHRpb24gYml0cyBtYXkgY2hhbmdlIGFuZCBiZSBkaWZm
ZXJlbnQgZnJvbSB0aG9zZSBvZgo+ID4gPiBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Q6OnZtX3BhZ2Vf
cHJvdC4KPiA+ID4gCj4gPiA+IFdlIHdlcmUgdXNpbmcgYW4gdWdseSBoYWNrIHRvIHNldCB0aGUg
cGFnZSBwcm90ZWN0aW9uIGNvcnJlY3RseS4KPiA+ID4gRml4IHRoYXQgYW5kIGluc3RlYWQgdXNl
IHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCgpIGFuZCAvIG9yCj4gPiA+IHZtZl9pbnNlcnRfcGZuX3By
b3QoKS4KPiA+ID4gQWxzbyBnZXQgdGhlIGRlZmF1bHQgcGFnZSBwcm90ZWN0aW9uIGZyb20KPiA+
ID4gc3RydWN0IHZtX2FyZWFfc3RydWN0Ojp2bV9wYWdlX3Byb3QgcmF0aGVyIHRoYW4gdXNpbmcg
dm1fZ2V0X3BhZ2VfcHJvdCgpLgo+ID4gPiBUaGlzIHdheSB3ZSBjYXRjaCBtb2RpZmljYXRpb25z
IGRvbmUgYnkgdGhlIHZtIHN5c3RlbSBmb3IgZHJpdmVycyB0aGF0Cj4gPiA+IHdhbnQgd3JpdGUt
bm90aWZpY2F0aW9uLgo+ID4gU28gZXNzZW50aWFsbHkgdGhpcyBzaG91bGQgaGF2ZSBhbnkgbmV3
IHNpZGUgZWZmZWN0IG9uIGZ1bmN0aW9uYWxpdHkgaXQKPiA+IGlzIGp1c3QgbWFraW5nIGEgaGFj
a3kvdWdseSBjb2RlIGxlc3Mgc28/Cj4gCj4gRnVuY3Rpb25hbGl0eSBpcyB1bmNoYW5nZWQuIFRo
ZSB1c2Ugb2YgYSBvbi1zdGFjayB2bWEgY29weSB3YXMgc2V2ZXJlbHkKPiBmcm93bmVkIHVwb24g
aW4gYW4gZWFybGllciB0aHJlYWQsIHdoaWNoIGFsc28gcG9pbnRzIHRvIGFub3RoZXIgc2ltaWxh
cgo+IGV4YW1wbGUgdXNpbmcgdm1mX2luc2VydF9wZm5fcHJvdCgpLgo+IAo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA5MDUxMDM1NDEuNDE2MS0yLXRob21hc19vc0BzaGlwbWFp
bC5vcmcvCj4gCj4gPiBJbiBvdGhlciB3b3JkcyB3aGF0IGFyZSB0aGUKPiA+IGNvbnNlcXVlbmNl
cyBvZiBoYXZpbmcgcGFnZSBwcm90ZWN0aW9uIGluY29uc2lzdGVudCBmcm9tIHZtYSdzPwo+IAo+
IER1cmluZyB0aGUgeWVhcnMsIGl0IGxvb2tzIGxpa2UgdGhlIGNhY2hpbmctIGFuZCBlbmNyeXB0
aW9uIGZsYWdzIG9mCj4gdm1hOjp2bV9wYWdlX3Byb3QgaGF2ZSBiZWVuIGxhcmdlbHkgcmVtb3Zl
ZCBmcm9tIHVzYWdlLiBGcm9tIHdoYXQgSSBjYW4KPiB0ZWxsLCB0aGVyZSBhcmUgbm8gbW9yZSBw
bGFjZXMgbGVmdCB0aGF0IGNhbiBhZmZlY3QgVFRNLiBXZSBkaXNjdXNzZWQKPiBfX3NwbGl0X2h1
Z2VfcG1kX2xvY2tlZCgpIHRvd2FyZHMgdGhlIGVuZCBvZiB0aGF0IHRocmVhZCwgYnV0IHRoYXQg
ZG9lc24ndAo+IGFmZmVjdCBUVE0gZXZlbiB3aXRoIGh1Z2UgcGFnZS10YWJsZSBlbnRyaWVzLgoK
UGxlYXNlIHN0YXRlIGFsbCB0aG9zZSBkZXRhaWxzL2Fzc3VtcHRpb25zIHlvdSBhcmUgb3BlcmF0
aW5nIG9uIGluIHRoZQpjaGFuZ2Vsb2cuCi0tIApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
