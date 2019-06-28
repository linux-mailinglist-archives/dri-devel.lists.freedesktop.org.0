Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E78F959822
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 12:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB0D6E8BD;
	Fri, 28 Jun 2019 10:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00D46E8BD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:05:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3F123307D840;
 Fri, 28 Jun 2019 10:05:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC68F5C21A;
 Fri, 28 Jun 2019 10:05:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BBA7A11AA3; Fri, 28 Jun 2019 12:05:16 +0200 (CEST)
Date: Fri, 28 Jun 2019 12:05:16 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v4 02/12] drm/virtio: switch virtio_gpu_wait_ioctl() to
 gem helper.
Message-ID: <20190628100516.yrtiuxemyt4hvyra@sirius.home.kraxel.org>
References: <20190620060726.926-1-kraxel@redhat.com>
 <20190620060726.926-3-kraxel@redhat.com>
 <CAPaKu7RWpoRkTkoatdYHz6itHZFvUYgaBcQAXnSC2gDc+dFZxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7RWpoRkTkoatdYHz6itHZFvUYgaBcQAXnSC2gDc+dFZxQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 28 Jun 2019 10:05:25 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDQ6NTU6MjBQTSAtMDcwMCwgQ2hpYS1JIFd1IHdyb3Rl
Ogo+IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDExOjA3IFBNIEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBVc2UgZHJtX2dlbV9yZXNlcnZhdGlvbl9vYmpl
Y3Rfd2FpdCgpIGluIHZpcnRpb19ncHVfd2FpdF9pb2N0bCgpLgo+ID4gVGhpcyBhbHNvIG1ha2Vz
IHRoZSBpb2N0bCBydW4gbG9ja2xlc3MuCj4gVGhlIHVzZXJzcGFjZSBoYXMgYSBCTyBjYWNoZSB0
byBhdm9pZCBmcmVlaW5nIEJPcyBpbW1lZGlhdGVseSBidXQgdG8KPiByZXVzZSB0aGVtIG9uIG5l
eHQgYWxsb2NhdGlvbnMuICBUaGUgQk8gY2FjaGUgY2hlY2tzIGlmIGEgQk8gaXMgYnVzeQo+IGJl
Zm9yZSByZXVzZSwgYW5kIEkgYW0gc2VlaW5nIGEgYmlnIG5lZ2F0aXZlIHBlcmYgaW1wYWN0IGJl
Y2F1c2Ugb2YKPiBzbG93IHZpcnRpb19ncHVfd2FpdF9pb2N0bC4gIEkgd29uZGVyIGlmIHRoaXMg
aGVscHMuCgpDb3VsZCBoZWxwIGluZGVlZCAoYXNzdW1pbmcgaXQgY2hlY2tzIHdpdGggTk9XQUlU
KS4KCkhvdyBtYW55IG9iamVjdHMgZG9lcyB1c2Vyc3BhY2UgY2hlY2sgaW4gb25lIGdvIHR5cGlj
YWxseT8gIE1heWJlIGl0Cm1ha2VzIHNlbnNlIHRvIGFkZCBhbiBpb2N0bCB3aGljaCBjaGVja3Mg
YSBsaXN0LCB0byByZWR1Y2UgdGhlIHN5c3RlbQpjYWxsIG92ZXJoZWFkLgoKPiA+ICsgICAgICAg
aWYgKGFyZ3MtPmZsYWdzICYgVklSVEdQVV9XQUlUX05PV0FJVCkgewo+ID4gKyAgICAgICAgICAg
ICAgIG9iaiA9IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlLCBhcmdzLT5oYW5kbGUpOwo+IERv
bid0IHdlIG5lZWQgYSBOVUxMIGNoZWNrIGhlcmU/CgpZZXMsIHdlIGRvLiAgV2lsbCBmaXguCgp0
aGFua3MsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
