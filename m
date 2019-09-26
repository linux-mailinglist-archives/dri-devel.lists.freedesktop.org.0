Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD22FBF011
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 12:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710136ECD1;
	Thu, 26 Sep 2019 10:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32B16ECFF;
 Thu, 26 Sep 2019 10:50:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 74AC92D7E1;
 Thu, 26 Sep 2019 10:50:47 +0000 (UTC)
Received: from [10.72.12.101] (ovpn-12-101.pek2.redhat.com [10.72.12.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 012735D6A7;
 Thu, 26 Sep 2019 10:49:15 +0000 (UTC)
Subject: Re: [PATCH V2 6/8] mdev: introduce virtio device and its device ops
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
 <20190924135332.14160-7-jasowang@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D58F7DA@SHSMSX104.ccr.corp.intel.com>
 <2210d23d-38e4-e654-e53d-7867348de86a@redhat.com>
 <20190925092044-mutt-send-email-mst@kernel.org>
 <eb7c76b5-2938-2e73-d847-b174a289c5c9@redhat.com>
 <20190926042102-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d6a66de5-5774-5ad6-8e9d-26bb6d8eaa8c@redhat.com>
Date: Thu, 26 Sep 2019 18:48:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926042102-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 26 Sep 2019 10:50:48 +0000 (UTC)
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
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>, "Liang,
 Cunming" <cunming.liang@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "idos@mellanox.com" <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "parav@mellanox.com" <parav@mellanox.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>, "Bie,
 Tiwei" <tiwei.bie@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvOS8yNiDkuIvljYg0OjIxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBTZXAgMjYsIDIwMTkgYXQgMTI6MDQ6NDZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4+Pj4gSSdtIG5vdCBzdXJlIGhvdyBzdGFibGUgYWJvdmUgb3BzIGFyZS4KPj4+PiBJdCdzIHRo
ZSBrZXJuZWwgaW50ZXJuYWwgQVBJLCBzbyB0aGVyZSdzIG5vIHN0cmljdCByZXF1aXJlbWVudCBm
b3IgdGhpcy4gV2UKPj4+PiB3aWxsIGV4cG9ydCBhIHZlcnNpb24gdmFsdWUgZm9yIHVzZXJzcGFj
ZSBmb3IgY29tcGF0aWJpbGl0eS4KPj4+IEdpdmVuIGl0J3MgdGllZCB0byB2aXJ0aW8gd2UgcHJv
YmFibHkgd2FudCBrZXJuZWwrdXNlcnNwYWNlCj4+PiBmZWF0dXJlIGJpdHM/Cj4+Cj4+IFllcywg
dGhlbiBJIHRoaW5rIHdlIGNvdWxkIHByb2JhYmx5IGhhdmUgYSB2ZXJzaW9uIGZpZWxkIGluc2lk
ZSBlLmcKPj4gZGV2aWNlX29wcyBzdHJ1Y3R1cmUuIFRoZW4gaXQgY291bGQgYmUgZmV0Y2hlZCBm
cm9tIGJvdGgga2VybmVsIGFuZAo+PiB1c2Vyc3BhY2UgZHJpdmVyLgo+Pgo+PiBUaGFua3MKPj4K
Pgo+IG15IHBvaW50IHdhcyBmZWF0dXJlIGJpdHMgbm90IGEgdmVyc2lvbiBudW1iZXIuCgoKU29t
ZXRoaW5nIGxpa2UgYmFja2VuZF9mZWF0dXJlIHRoYXQgY3VycmVudCB2aG9zdF9uZXQgZGlkPwoK
VGhhbmtzCgoKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
