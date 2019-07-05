Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CACE6075B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 16:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1931C6E4CB;
	Fri,  5 Jul 2019 14:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0526B6E4CB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 14:07:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2FCC459451;
 Fri,  5 Jul 2019 14:07:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-90.ams2.redhat.com
 [10.36.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1D277DE33;
 Fri,  5 Jul 2019 14:07:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C692B16E2D; Fri,  5 Jul 2019 16:07:46 +0200 (CEST)
Date: Fri, 5 Jul 2019 16:07:46 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v6 15/18] drm/virtio: rework
 virtio_gpu_transfer_to_host_ioctl fencing
Message-ID: <20190705140746.czs2e5ffryx2slxf@sirius.home.kraxel.org>
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-16-kraxel@redhat.com>
 <CAPaKu7S0n=E7g0o2e6fEk1YjP+u=tsoV8upw7J=noSx88PgP+A@mail.gmail.com>
 <20190704115138.ou77sb3rlrex67tj@sirius.home.kraxel.org>
 <CAPaKu7SDwR1TgFQK2XGEbRqSkCO0XZYxGhcjzsAwOH42aOHEEw@mail.gmail.com>
 <20190705090553.jx5zcdoxeimojq2i@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705090553.jx5zcdoxeimojq2i@sirius.home.kraxel.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 05 Jul 2019 14:07:49 +0000 (UTC)
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

PiA+ID4gLi4uIDNkIGNhc2UgcGFzc2VzIHRoZSBvYmpzIGxpc3QgdG8gdmlydGlvX2dwdV9jbWRf
dHJhbnNmZXJfdG9faG9zdF8zZCwKPiA+ID4gc28gaXQgZ2V0cyBhZGRlZCB0byB0aGUgdmJ1ZiBh
bmQgcmVsZWFzZWQgd2hlbiB0aGUgY29tbWFuZCBpcyBmaW5pc2hlZC4KPiA+IFdoeSBkb2Vzbid0
IHRoaXMgYXBwbHkgdG8gdmlydGlvX2dwdV9jbWRfdHJhbnNmZXJfdG9faG9zdF8yZD8KPiAKPiBI
bW0sIHllcywgbWFrZXMgc2Vuc2UgdG8gaGFuZGxlIGJvdGggdGhlIHNhbWUgd2F5Lgo+IAo+IFdp
dGggdmlyZ2w9b2ZmIHFlbXUgcHJvY2Vzc2VzIHRoZSBjb21tYW5kcyBmcm9tIHRoZSBndWVzdAo+
IHN5bmNocm9ub3VzbHksIHNvIGl0J2xsIHdvcmsgZmluZSBhcy1pcy4gIFNvIHlvdSBjYW4ndCBo
aXQKPiB0aGUgdGhlb3JldGljYWwgcmFjZSB3aW5kb3cgaW4gcHJhY3RpY2UuICBCdXQgZGVwZW5k
aW5nCj4gb24gdGhhdCBob3N0LXNpZGUgaW1wbGVtZW50YXRpb24gZGV0YWlsIGlzbid0IGEgZ29v
ZCBpZGVhCj4gaW5kZWVkLgoKQnJhbmNoIHdpdGggaW5jcmVtZW50YWwgZml4ZXM6Cmh0dHBzOi8v
Z2l0LmtyYXhlbC5vcmcvY2dpdC9saW51eC9sb2cvP2g9ZHJtLXZpcnRpby1raWxsLXR0bQoKSSds
bCBiZSBvZmZsaW5lIHRocmVlIHdlZWtzIG5vdywgd2lsbCByZXN1bWUgdGhpcyB3aGVuIEknbSBi
YWNrLgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
