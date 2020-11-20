Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C8E2BBEB3
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 12:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA3A6E99E;
	Sat, 21 Nov 2020 11:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42436E8F5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 18:23:18 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id g19so5135180qvy.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 10:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UCRF1tW/AZBL2cTgUwVNxqtk7LoMkUYo1UAbEj+RJjA=;
 b=B4hybK4yzaLM2Npm1+7g6r63APKMgeTYmtc+xA4iVzmdUpm8/fc6u8PaaYBUCEqsTa
 DQGtD0B85sfZ6AQDUGUUQC5pVjZlDUujNTP78g/UuI8FK4lpcR30mtecsvkVf7DRgiuW
 MlO955aCtgx98+WPuV3NTYdOklNjuBLotWjSZU4ObiQWcAx2srZjTgQUtz+nDfdm6w6W
 DZqPXoE1QXdh/pboRXeD4ejJgfX5GK2Q1BTBAtJtZmFj9fTPLr6v/mkTDWfR54U03nWV
 iXOwhBmbqACTOvfxkYtC+csJIypzFC+zmDe+YDbqWg3tSfxHioKaKSUTa24FTqD2nFIt
 rECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UCRF1tW/AZBL2cTgUwVNxqtk7LoMkUYo1UAbEj+RJjA=;
 b=GVCdkOnllhKQKtG7dfOpRt3UN34kiH8ZFr/FERGA7h8Qqghu1cb7s2waEsYlYo5RMJ
 EHYIKzhLQQovcyayxlzNgrANBJJQM0y02xlv+HVEK7IoA+x71Oe2jg0H/NIvaMQzEHM1
 6bbnH4dvg0Y8pQMDfKU2bPLMFqX5EbtL5W++r6oQPI9ivKRkZLs4hNStJRLQxBMNy3Iv
 8/4g18MWTHtC1N2O8wu8NRhCqYu8K7f03fMGcpUsfmK0vFJB+4+1B9XNK/Sy6lIUMG92
 ptnHnLQg+7J5K11Zx90N4BFQQDtNtEa+m7FogCm0vWSoGAyOzyQE1+4h7GapLxHzHDAF
 /3hg==
X-Gm-Message-State: AOAM532rwsLO0PVFwe/ma8po6Hx3Y++0z2onKnkxC1tds0NTgAfkIIna
 Z253tYBivWBSRnsay+ZE2/jsWA==
X-Google-Smtp-Source: ABdhPJyYHlJdtw+Gau+17nV3WJLVIt14si/LWrTbl0K59MDQ0saInzPp33g3U6H6OWsC2O3yX2B0AQ==
X-Received: by 2002:a0c:b18a:: with SMTP id v10mr16583162qvd.46.1605896597938; 
 Fri, 20 Nov 2020 10:23:17 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id v9sm2453624qkv.34.2020.11.20.10.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 10:23:17 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kgB40-008ub6-IN; Fri, 20 Nov 2020 14:23:16 -0400
Date: Fri, 20 Nov 2020 14:23:16 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/3] mm: Track mmu notifiers in fs_reclaim_acquire/release
Message-ID: <20201120182316.GP244516@ziepe.ca>
References: <20201120095445.1195585-1-daniel.vetter@ffwll.ch>
 <20201120095445.1195585-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120095445.1195585-2-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Sat, 21 Nov 2020 11:34:30 +0000
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
Cc: linux-rdma@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Chinner <david@fromorbit.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, Qian Cai <cai@lca.pw>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjAsIDIwMjAgYXQgMTA6NTQ6NDJBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBmc19yZWNsYWltX2FjcXVpcmUvcmVsZWFzZSBuaWNlbHkgY2F0Y2ggcmVjdXJzaW9u
IGlzc3VlcyB3aGVuCj4gYWxsb2NhdGluZyBHRlBfS0VSTkVMIG1lbW9yeSBhZ2FpbnN0IHNocmlu
a2VycyAod2hpY2ggZ3B1IGRyaXZlcnMgdGVuZAo+IHRvIHVzZSB0byBrZWVwIHRoZSBleGNlc3Np
dmUgY2FjaGVzIGluIGNoZWNrKS4gRm9yIG1tdSBub3RpZmllcgo+IHJlY3Vyc2lvbnMgd2UgZG8g
aGF2ZSBsb2NrZGVwIGFubm90YXRpb25zIHNpbmNlIDIzYjY4Mzk1YzdjNwo+ICgibW0vbW11X25v
dGlmaWVyczogYWRkIGEgbG9ja2RlcCBtYXAgZm9yIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQvZW5k
IikuCj4gCj4gQnV0IHRoZXNlIG9ubHkgZmlyZSBpZiBhIHBhdGggYWN0dWFsbHkgcmVzdWx0cyBp
biBzb21lIHB0ZQo+IGludmFsaWRhdGlvbiAtIGZvciBtb3N0IHNtYWxsIGFsbG9jYXRpb25zIHRo
YXQncyB2ZXJ5IHJhcmVseSB0aGUgY2FzZS4KPiBUaGUgb3RoZXIgdHJvdWJsZSBpcyB0aGF0IHB0
ZSBpbnZhbGlkYXRpb24gY2FuIGhhcHBlbiBhbnkgdGltZSB3aGVuCj4gX19HRlBfUkVDTEFJTSBp
cyBzZXQuIFdoaWNoIG1lYW5zIG9ubHkgcmVhbGx5IEdGUF9BVE9NSUMgaXMgYSBzYWZlCj4gY2hv
aWNlLCBHRlBfTk9JTyBpc24ndCBnb29kIGVub3VnaCB0byBhdm9pZCBwb3RlbnRpYWwgbW11IG5v
dGlmaWVyCj4gcmVjdXJzaW9uLgo+IAo+IEkgd2FzIHBvbmRlcmluZyB3aGV0aGVyIHdlIHNob3Vs
ZCBqdXN0IGRvIHRoZSBnZW5lcmFsIGFubm90YXRpb24sIGJ1dAo+IHRoZXJlJ3MgYWx3YXlzIHRo
ZSByaXNrIGZvciBmYWxzZSBwb3NpdGl2ZXMuIFBsdXMgSSdtIGFzc3VtaW5nIHRoYXQKPiB0aGUg
Y29yZSBmcyBhbmQgaW8gY29kZSBpcyBhIGxvdCBiZXR0ZXIgcmV2aWV3ZWQgYW5kIHRlc3RlZCB0
aGFuCj4gcmFuZG9tIG1tdSBub3RpZmllciBjb2RlIGluIGRyaXZlcnMuIEhlbmNlIHdoeSBJIGRl
Y2lkZSB0byBvbmx5Cj4gYW5ub3RhdGUgZm9yIHRoYXQgc3BlY2lmaWMgY2FzZS4KPiAKPiBGdXJ0
aGVybW9yZSBldmVuIGlmIHdlJ2QgY3JlYXRlIGEgbG9ja2RlcCBtYXAgZm9yIGRpcmVjdCByZWNs
YWltLCB3ZSdkCj4gc3RpbGwgbmVlZCB0byBleHBsaWNpdCBwdWxsIGluIHRoZSBtbXUgbm90aWZp
ZXIgbWFwIC0gdGhlcmUncyBhIGxvdAo+IG1vcmUgcGxhY2VzIHRoYXQgZG8gcHRlIGludmFsaWRh
dGlvbiB0aGFuIGp1c3QgZGlyZWN0IHJlY2xhaW0sIHRoZXNlCj4gdHdvIGNvbnRleHRzIGFyZW50
IHRoZSBzYW1lLgo+IAo+IE5vdGUgdGhhdCB0aGUgbW11IG5vdGlmaWVycyBuZWVkaW5nIHRoZWly
IG93biBpbmRlcGVuZGVudCBsb2NrZGVwIG1hcAo+IGlzIGFsc28gdGhlIHJlYXNvbiB3ZSBjYW4n
dCBob2xkIHRoZW0gZnJvbSBmc19yZWNsYWltX2FjcXVpcmUgdG8KPiBmc19yZWNsYWltX3JlbGVh
c2UgLSBpdCB3b3VsZCBuZXN0IHdpdGggdGhlIGFjcXVpc3Rpb24gaW4gdGhlIHB0ZQo+IGludmFs
aWRhdGlvbiBjb2RlLCBjYXVzaW5nIGEgbG9ja2RlcCBzcGxhdC4gQW5kIHdlIGNhbid0IHJlbW92
ZSB0aGUKPiBhbm5vdGF0aW9ucyBmcm9tIHB0ZSBpbnZhbGlkYXRpb24gYW5kIGFsbCB0aGUgb3Ro
ZXIgcGxhY2VzIHNpbmNlCj4gdGhleSdyZSBjYWxsZWQgZnJvbSBtYW55IG90aGVyIHBsYWNlcyB0
aGFuIHBhZ2UgcmVjbGFpbS4gSGVuY2Ugd2UgY2FuCj4gb25seSBkbyB0aGUgZXF1aXZhbGVudCBv
ZiBtaWdodF9sb2NrLCBidXQgb24gdGhlIHJhdyBsb2NrZGVwIG1hcC4KPiAKPiBXaXRoIHRoaXMg
d2UgY2FuIGFsc28gcmVtb3ZlIHRoZSBsb2NrZGVwIHByaW1pbmcgYWRkZWQgaW4gNjYyMDRmMWQy
ZDFiCj4gKCJtbS9tbXVfbm90aWZpZXJzOiBwcmltZSBsb2NrZGVwIikgc2luY2UgdGhlIG5ldyBh
bm5vdGF0aW9ucyBhcmUKPiBzdHJpY3RseSBtb3JlIHBvd2VyZnVsLgo+IAo+IHYyOiBSZXZpZXcg
ZnJvbSBUaG9tYXMgSGVsbHN0cm9tOgo+IC0gdW5ib3RjaCB0aGUgZnNfcmVjbGFpbSBjb250ZXh0
IGNoZWNrLCBJIGFjY2lkZW50YWxseSBpbnZlcnRlZCBpdCwKPiAgIGJ1dCBpdCBkaWRuJ3QgYmxv
dyB1cCBiZWNhdXNlIEkgaW52ZXJ0ZWQgaXQgaW1tZWRpYXRlbHkKPiAtIGZpeCBjb21waWxpbmcg
Zm9yICFDT05GSUdfTU1VX05PVElGSUVSCj4gCj4gdjM6IFVuYnJlYWsgdGhlIFBGX01FTUFMTE9D
XyBjb250ZXh0IGZsYWdzLiBUaGFua3MgdG8gUWlhbiBmb3IgdGhlCj4gcmVwb3J0IGFuZCBEYXZl
IGZvciBleHBsYWluaW5nIHdoYXQgSSBmYWlsZWQgdG8gc2VlLgo+IAo+IENjOiBsaW51eC1mc2Rl
dmVsQHZnZXIua2VybmVsLm9yZwo+IENjOiBEYXZlIENoaW5uZXIgPGRhdmlkQGZyb21vcmJpdC5j
b20+Cj4gQ2M6IFFpYW4gQ2FpIDxjYWlAbGNhLnB3Pgo+IENjOiBsaW51eC14ZnNAdmdlci5rZXJu
ZWwub3JnCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgPHRob21hc19vc0BzaGlwbWFp
bC5vcmc+Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4g
Q2M6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiBDYzogbGludXgtbW1Aa3Zh
Y2sub3JnCj4gQ2M6IGxpbnV4LXJkbWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IE1hYXJ0ZW4gTGFu
a2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogIk1hdHRoZXcgV2lsY294
IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAtLS0KPiAgbW0vbW11X25vdGlmaWVy
LmMgfCAgNyAtLS0tLS0tCj4gIG1tL3BhZ2VfYWxsb2MuYyAgIHwgMzEgKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDE4
IGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5j
b20+CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
