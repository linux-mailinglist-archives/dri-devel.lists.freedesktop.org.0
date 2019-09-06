Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1882AB705
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 13:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055A96E24D;
	Fri,  6 Sep 2019 11:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264EA6E24D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 11:18:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 92A00308AA12;
 Fri,  6 Sep 2019 11:18:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-59.ams2.redhat.com
 [10.36.117.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5FB3600CC;
 Fri,  6 Sep 2019 11:18:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1AEA0753F; Fri,  6 Sep 2019 13:18:43 +0200 (CEST)
Date: Fri, 6 Sep 2019 13:18:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 3/3] drm/vram: Implement lazy unmapping for GEM VRAM
 buffers
Message-ID: <20190906111843.zcqdfxxhdg7d5rtw@sirius.home.kraxel.org>
References: <20190906085214.11677-1-tzimmermann@suse.de>
 <20190906085214.11677-4-tzimmermann@suse.de>
 <20190906093905.umz4wkwn4lukg2jg@sirius.home.kraxel.org>
 <b08a47cf-8e2f-6632-7704-94c8ec4421d4@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b08a47cf-8e2f-6632-7704-94c8ec4421d4@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 06 Sep 2019 11:18:44 +0000 (UTC)
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
Cc: feng.tang@intel.com, dave@stgolabs.net, rong.a.chen@intel.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, maxime.ripard@bootlin.com,
 ying.huang@intel.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMTI6Mzc6NDdQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAwNi4wOS4xOSB1bSAxMTozOSBzY2hyaWViIEdlcmQgSG9m
Zm1hbm46Cj4gPj4gK3ZvaWQgZHJtX2dlbV92cmFtX2JvX2RyaXZlcl9tb3ZlX25vdGlmeShzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ID4+ICsJCQkJCWJvb2wgZXZpY3QsCj4gPj4gKwkJ
CQkJc3RydWN0IHR0bV9tZW1fcmVnICpuZXdfbWVtKQo+ID4+ICt7Cj4gPiBbIC4uLiBdCj4gPj4g
KwlpZiAoIWttYXAtPnZpcnR1YWwpCj4gPj4gKwkJcmV0dXJuOwo+ID4+ICsJdHRtX2JvX2t1bm1h
cChrbWFwKTsKPiA+PiArCWttYXAtPnZpcnR1YWwgPSBOVUxMOwo+ID4+ICt9Cj4gPiAKPiA+IEkg
dGhpbmsgdHRtX2J1ZmZlcl9vYmplY3RfZGVzdHJveSgpIG5lZWRzICJpZiAoa21hcC0+dmlydHVh
bCkKPiA+IHR0bV9ib19rdW5tYXAoKSIgdG9vLCBkdWUgdG8gdGhlIGxhenkgdW5tYXAgeW91IGNh
biBsYW5kIHRoZXJlCj4gPiB3aXRoIGFuIGFjdGl2ZSBtYXBwaW5nLgo+IAo+IEhtbSwgZnJvbSBt
eSB1bmRlcnN0YW5kaW5nLCB0aGF0IGZpbmFsIGNhbGwgdG8gbW92ZV9ub3RpZnkoKSBpcyBkb25l
IGJ5Cj4gdHRtX2JvX2NsZWFudXBfbWVtdHlwZV91c2UoKSwgd2hpY2ggaXMgY2FsbGVkIGZyb20g
d2l0aGluIHR0bV9ib19wdXQoKS4KCkFoLCBnb29kLCBzb3VuZHMgbGlrZSB0aGlzIHNob3VsZCB3
b3JrIGluZGVlZC4KTWF5YmUgYWRkIFdBUk5fT04oa21hcC0+dmlydHVhbCksIGp1c3QgdG8gYmUg
c3VyZSB3ZSBkb24ndCBvdmVybG9va2VkIHNvbWV0aGluZy4KCmNoZWVycywKICBHZXJkCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
