Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D562BBE6D
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 11:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5526E98F;
	Sat, 21 Nov 2020 10:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0B56E98F
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 10:16:25 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id n11so11252275ota.2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 02:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CfD4qCQ+49oMsxdJc7IK/6WOEpohcQtenHzH8FlfyRE=;
 b=JF3p/OCNodcLdDTJcqO7kRZDP5iwZv+x0xXQK41LiD+SZKTO1SnD9F9TC3ONOFKuZG
 U4kABs3ZPIz7naEfwag/JiTvqG/9+wKV3HIQM/JyXRXZbLmnr9VNbqi6La5leghgCv9w
 TsG6VVC+LRSJW222Wda3AxWmLqjBK2bKcBCkoqvrKE2qLqoz1EGwEU5hPuDEqagSt5iA
 5GZdeoJmodruZrfdZjri+bhkm7p/XQP78OfvW0H3afh1XJQlnJl6JCYE84SwDTPFNinm
 50CwSd9Ln5buo9sziidETyMtEhq6hsXmLswyKqfmg3EGTVLJAjzxlfk7jIDsfMipzhuo
 xcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CfD4qCQ+49oMsxdJc7IK/6WOEpohcQtenHzH8FlfyRE=;
 b=qunMGUoPG5YFco3R0hQ/MaSYi0XxE88CVph5HUVBjAD3KjaSxo0FKQs/4WUpn9U/p4
 9FlYyjtFFuR6VUlJtCS1fmcSZYj2PiAniLrBjBHauq2oYPFhE66j+8EkkCCi6pP0/QEO
 kXZskfkHhT17GIu4F8QfKGAtVd5XZWI53BxQOfVQFQ5faL33V3lVBsJpP6/tFfRxHQ/U
 YhNFSneNRpadK5Vxpe/tzuxproqU9dxs1wH8ID1LECJonvH8DqyKOVCntUK3dQ7BP4BM
 6rOwvoiuXfN00I+Y1hoABx2IHbrUyO53lyvxetcx2seC9tHmpUypdRqM6pEaGQcIafPC
 fu0g==
X-Gm-Message-State: AOAM530D7f424saeFW7NPKpPKIuazqTe8VrcLkPI5ty1l3qocxK3mZjx
 Iv4j+p0A4xR9dxs4bQe/70F3Phyy5uPdOxOON/s=
X-Google-Smtp-Source: ABdhPJwbWqIY6E2BNtMA32fQAIHCjlUN6aHKKi/wWDD0jzHnOSkXJPtriY6z17kkUPmnf3jQjaq/XzOLnrNEouBrIQ0=
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr16558234otc.145.1605953785126; 
 Sat, 21 Nov 2020 02:16:25 -0800 (PST)
MIME-Version: 1.0
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20201119144146.1045202-5-daniel.vetter@ffwll.ch>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Sat, 21 Nov 2020 12:15:58 +0200
Message-ID: <CAFCwf12vUjaUAKYYnXSOFeB_yYzjnChNSWyx+FopGXS0W-1rGQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/17] misc/habana: Use FOLL_LONGTERM for userptr
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, KVM list <kvm@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Pawel Piskorski <ppiskorski@habana.ai>,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Ofir Bitton <obitton@habana.ai>, linux-mm <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Tomer Tayar <ttayar@habana.ai>, Omer Shpigelman <oshpigelman@habana.ai>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Moti Haimovski <mhaimovski@habana.ai>, Dan Williams <dan.j.williams@intel.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMTksIDIwMjAgYXQgNDo0MSBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPgo+IFRoZXNlIGFyZSBwZXJzaXN0ZW50LCBub3QganVzdCBm
b3IgdGhlIGR1cmF0aW9uIG9mIGEgZG1hIG9wZXJhdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBKYXNvbiBHdW50aG9y
cGUgPGpnZ0B6aWVwZS5jYT4KPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0
aW9uLm9yZz4KPiBDYzogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+IENjOiBK
w6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiBDYzogSmFuIEthcmEgPGphY2tA
c3VzZS5jej4KPiBDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4g
Q2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBDYzogbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxp
bnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBPZGVkIEdhYmJheSA8b2RlZC5nYWJiYXlA
Z21haWwuY29tPgo+IENjOiBPbWVyIFNocGlnZWxtYW4gPG9zaHBpZ2VsbWFuQGhhYmFuYS5haT4K
PiBDYzogT2ZpciBCaXR0b24gPG9iaXR0b25AaGFiYW5hLmFpPgo+IENjOiBUb21lciBUYXlhciA8
dHRheWFyQGhhYmFuYS5haT4KPiBDYzogTW90aSBIYWltb3Zza2kgPG1oYWltb3Zza2lAaGFiYW5h
LmFpPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IENjOiBH
cmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IENjOiBQYXdl
bCBQaXNrb3Jza2kgPHBwaXNrb3Jza2lAaGFiYW5hLmFpPgo+IFNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gLS0tCj4gIGRyaXZlcnMvbWlzYy9o
YWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2Mv
aGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmMgYi9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21t
b24vbWVtb3J5LmMKPiBpbmRleCAwYjIyMDIyMTg3M2QuLmQwOGM0MWI5MGZlYyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmMKPiArKysgYi9kcml2
ZXJzL21pc2MvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmMKPiBAQCAtMTI5OCw3ICsxMjk4LDgg
QEAgc3RhdGljIGludCBnZXRfdXNlcl9tZW1vcnkoc3RydWN0IGhsX2RldmljZSAqaGRldiwgdTY0
IGFkZHIsIHU2NCBzaXplLAo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiAgICAg
ICAgIH0KPgo+IC0gICAgICAgcmMgPSBwaW5fdXNlcl9wYWdlc19mYXN0KHN0YXJ0LCBucGFnZXMs
IEZPTExfRk9SQ0UgfCBGT0xMX1dSSVRFLAo+ICsgICAgICAgcmMgPSBwaW5fdXNlcl9wYWdlc19m
YXN0KHN0YXJ0LCBucGFnZXMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRk9M
TF9GT1JDRSB8IEZPTExfV1JJVEUgfCBGT0xMX0xPTkdURVJNLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVzZXJwdHItPnBhZ2VzKTsKPgo+ICAgICAgICAgaWYgKHJjICE9IG5w
YWdlcykgewo+IC0tCj4gMi4yOS4yCj4KClRoaXMgcGF0Y2ggYW5kIHRoZSBwcmV2aW91cyBvbmUg
KDAzLzE3IG1pc2MvaGFiYW5hOiBTdG9wIHVzaW5nCmZyYW1lX3ZlY3RvciBoZWxwZXJzKSBhcmUg
Ym90aDoKUmV2aWV3ZWQtYnk6IE9kZWQgR2FiYmF5IDxvZ2FiYmF5QGtlcm5lbC5vcmc+CgpUaGFu
a3MsCk9kZWQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
