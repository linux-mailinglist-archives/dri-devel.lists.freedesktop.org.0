Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318895F72E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 13:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16666E326;
	Thu,  4 Jul 2019 11:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AD46E326
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 11:25:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B00A1882F5;
 Thu,  4 Jul 2019 11:25:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-222.ams2.redhat.com
 [10.36.116.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 467A759442;
 Thu,  4 Jul 2019 11:25:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1E36611AB5; Thu,  4 Jul 2019 13:25:34 +0200 (CEST)
Date: Thu, 4 Jul 2019 13:25:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v6 08/18] drm/virtio: rework virtio_gpu_execbuffer_ioctl
 fencing
Message-ID: <20190704112534.v7icsuverf7wrbjq@sirius.home.kraxel.org>
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-9-kraxel@redhat.com>
 <CAPaKu7QP=A2kV_kqcT20Pmc831HviaBJN1RpOFoa=V1g6SmE_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7QP=A2kV_kqcT20Pmc831HviaBJN1RpOFoa=V1g6SmE_g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 04 Jul 2019 11:25:36 +0000 (UTC)
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
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiAgICAgICAgIGlmIChmZW5jZSkKPiA+ICAgICAgICAgICAgICAgICB2aXJ0aW9f
Z3B1X2ZlbmNlX2VtaXQodmdkZXYsIGhkciwgZmVuY2UpOwo+ID4gKyAgICAgICBpZiAodmJ1Zi0+
b2Jqcykgewo+ID4gKyAgICAgICAgICAgICAgIHZpcnRpb19ncHVfYXJyYXlfYWRkX2ZlbmNlKHZi
dWYtPm9ianMsICZmZW5jZS0+Zik7Cj4gPiArICAgICAgICAgICAgICAgdmlydGlvX2dwdV9hcnJh
eV91bmxvY2tfcmVzdih2YnVmLT5vYmpzKTsKPiA+ICsgICAgICAgfQo+IFRoaXMgaXMgd2l0aCB0
aGUgc3BpbmxvY2sgaGVsZC4gIE1heWJlIHdlIHNob3VsZCBtb3ZlIHRoZQo+IHZpcnRpb19ncHVf
YXJyYXlfdW5sb2NrX3Jlc3YgY2FsbCBvdXQgb2YgdGhlIGNyaXRpY2FsIHNlY3Rpb24uCgpUaGF0
IHdvdWxkIGJyaW5nIGJhY2sgdGhlIHJhY2UgLi4uCgo+IEkgYW0gYWN0dWFsbHkgbW9yZSBjb25j
ZXJuZWQgYWJvdXQgdmlydGlvX2dwdV9hcnJheV9hZGRfZmVuY2UsIGJ1dCBpdAo+IGlzIGFsc28g
aGFyZGVyIHRvIG1vdmUuICBTaG91bGQgd2UgYWRkIGEga3JlZiB0byB0aGUgb2JqZWN0IGFycmF5
PwoKWWVwLCByZWZjb3VudGluZyB3b3VsZCBiZSB0aGUgb3RoZXIgd2F5IHRvIGZpeCB0aGUgcmFj
ZS4KCj4gVGhpcyBib3RoZXJzIG1lIGJlY2F1c2UgSSByZWNlbnRseSByYW4gaW50byBhIENQVS1i
b3VuZCBnYW1lIHdpdGggdmVyeQo+IGJhZCBsb2NrIGNvbnRlbnRpb24gaGVyZS4KCkhtbS4gIEFu
eSBjbHVlIHdoZXJlIHRoaXMgY29tZXMgZnJvbT8gIE11bHRpcGxlIHRocmVhZHMgY29tcGV0aW5n
IGZvcgp2aXJ0aW8gYnVmZmVycyBJIGd1ZXNzPyAgTWF5YmUgd2Ugc2hvdWxkIGhhdmUgbGFyZ2Vy
IHZpcnRxdWV1ZXM/CgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
