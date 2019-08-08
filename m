Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A7686211
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 14:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AD66E4F3;
	Thu,  8 Aug 2019 12:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2946E4F3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 12:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 557D23F5AB;
 Thu,  8 Aug 2019 14:43:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNFA3GisQkMe; Thu,  8 Aug 2019 14:43:20 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 3DF8E3F3CA;
 Thu,  8 Aug 2019 14:43:17 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 7E6DA360301;
 Thu,  8 Aug 2019 14:43:17 +0200 (CEST)
Subject: Re: [PATCH v3 2/8] ttm: turn ttm_bo_device.vma_manager into a pointer
To: Gerd Hoffmann <kraxel@redhat.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 David Airlie <airlied@linux.ie>, "Huang, Ray" <Ray.Huang@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20190808093702.29512-1-kraxel@redhat.com>
 <20190808093702.29512-3-kraxel@redhat.com>
 <2a90c899-19eb-5be2-3eda-f20efd31aa29@amd.com>
 <20190808103521.u6ggltj4ftns77je@sirius.home.kraxel.org>
 <20190808120252.GO7444@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas@shipmail.org>
Organization: VMware Inc.
Message-ID: <36145412-3c31-e635-1e8b-b42439811742@shipmail.org>
Date: Thu, 8 Aug 2019 14:43:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190808120252.GO7444@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1565268197; bh=Y96A8mvBNgHpthhnaEAzth6EF+7dsvNIExRZqv5ZrRU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=ckUXHhXo+S5yUd29rYFyBtENLt1uaNqV4fQz+6tMl5TSrlgdFSz83TS8PgxG5M2BM
 l7fi7m93ajc+HnFDo+Bo3YlS0a8KYvERd8XbkIGWyJHAmvRn5zfcrkEtS44AWof/4U
 nG61Vc7lVzETg8PSFZWcnEaQDa9lJ74Rv42HGZvc=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="ckUXHhXo";
 dkim-atps=neutral
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC84LzE5IDI6MDIgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gVGh1LCBBdWcgMDgs
IDIwMTkgYXQgMTI6MzU6MjFQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3cm90ZToKPj4gT24gVGh1
LCBBdWcgMDgsIDIwMTkgYXQgMDk6NDg6NDlBTSArMDAwMCwgS29lbmlnLCBDaHJpc3RpYW4gd3Jv
dGU6Cj4+PiBBbSAwOC4wOC4xOSB1bSAxMTozNiBzY2hyaWViIEdlcmQgSG9mZm1hbm46Cj4+Pj4g
UmVuYW1lIHRoZSBlbWJlZGRlZCBzdHJ1Y3Qgdm1hX29mZnNldF9tYW5hZ2VyLCBpdCBpcyBuYW1l
ZCBfdm1hX21hbmFnZXIKPj4+PiBub3cuICB0dG1fYm9fZGV2aWNlLnZtYV9tYW5hZ2VyIGlzIGEg
cG9pbnRlciBub3csIHBvaW50aW5nIHRvIHRoZQo+Pj4+IGVtYmVkZGVkIHR0bV9ib19kZXZpY2Uu
X3ZtYV9tYW5hZ2VyIGJ5IGRlZmF1bHQuCj4+Pj4KPj4+PiBBZGQgdHRtX2JvX2RldmljZV9pbml0
X3dpdGhfdm1hX21hbmFnZXIoKSBmdW5jdGlvbiB3aGljaCBhbGxvd3MgdG8KPj4+PiBpbml0aWFs
aXplIHR0bSB3aXRoIGEgZGlmZmVyZW50IHZtYSBtYW5hZ2VyLgo+Pj4gQ2FuJ3Qgd2UgZ28gZG93
biB0aGUgcm91dGUgb2YgY29tcGxldGVseSByZW1vdmluZyB0aGUgdm1hX21hbmFnZXIgZnJvbQo+
Pj4gVFRNPyB0dG1fYm9fbW1hcCgpIHdvdWxkIGdldCB0aGUgQk8gYXMgcGFyYW1ldGVyIGluc3Rl
YWQuCj4+IEl0IHN1cmVseSBtYWtlcyBzZW5zZSB0byB0YXJnZXQgdGhhdC4gIFRoaXMgcGF0Y2gg
Y2FuIGJlIGEgZmlyc3Qgc3RlcAo+PiBpbnRvIHRoYXQgZGlyZWN0aW9uLiAgSXQgYWxsb3dzIGdl
bSBhbmQgdHRtIHRvIHVzZSB0aGUgc2FtZQo+PiB2bWFfb2Zmc2V0X21hbmFnZXIgKHNlZSBwYXRj
aCAjMyksIHdoaWNoIGluIHR1cm4gbWFrZXMgdmFyaW91cyBnZW0KPj4gZnVuY3Rpb25zIHdvcmsg
b24gdHRtIG9iamVjdHMgKHNlZSBwYXRjaCAjNCBmb3IgdnJhbSBoZWxwZXJzKS4KPiArMSBvbiBj
bGVhbmluZyB0aGlzIHVwIGZvciBnb29kLCBhdCBsZWFzdCBsb25nLXRlcm0gLi4uCj4KPj4+IFRo
YXQgd291bGQgYWxzbyBtYWtlIHRoZSB2ZXJpZnlfYWNjZXNzIGNhbGxiYWNrIGNvbXBsZXRlbHkg
c3VwZXJmbHVvdXMKPj4+IGFuZCBsb29rcyBsaWtlIGEgZ29vZCBzdGVwIGludG8gdGhlIHJpZ2h0
IGRpcmVjdGlvbiBvZiBkZS1taWRsYXllcmluZy4KPj4gSG1tLCByaWdodCwgbm90aWNlZCB0aGF0
IHRvbyB3aGlsZSB3b3JraW5nIG9uIGFub3RoZXIgcGF0Y2ggc2VyaWVzLgo+PiBHdWVzcyBJJ2xs
IHRyeSB0byBtZXJnZSB0aG9zZSB0d28gYW5kIHNlZSB3aGVyZSBJIGVuZCB1cCAuLi4KPiAuLi4g
YnV0IGlmIGl0IGdldHMgdG9vIGludmFzaXZlIEknZCB2b3RlIGZvciBpbmNyZW1lbnRhbCBjaGFu
Z2VzLiBFdmVuIGlmCj4gd2UgY29tcGxldGVseSByaXAgb3V0IHRoZSB2bWEvbW1hcCBsb29rdXAg
c3R1ZmYgZnJvbSB0dG0sIHdlIHN0aWxsIG5lZWQgdG8KPiBrZWVwIGEgY29weSBzb21ld2hlcmUg
Zm9yIHZtd2dmeC4gT3Igd291bGQgdGhlIGV2aWwgcGxhbiBiZSB0aGUgdm13Z2Z4Cj4gd291bGQg
dXNlIHRoZSBnZW0gbW1hcCBoZWxwZXJzIHRvbz8KCkkgZG9uJ3QgdGhpbmsgaXQgd291bGQgYmUg
dG9vIGludmFzaXZlLiBXZSBjb3VsZCBzaW1wbHkgbW92ZSAKdHRtX2JvX3ZtX2xvb2t1cCBpbnRv
IGEgdm13X21tYXAuCgovVGhvbWFzCgoKCgo+IC1EYW5pZWwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
