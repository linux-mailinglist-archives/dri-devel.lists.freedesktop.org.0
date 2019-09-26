Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316DDBED47
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 10:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A316ED13;
	Thu, 26 Sep 2019 08:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5AF6ED13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:21:46 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C1D3BC06512C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:21:45 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id r15so1603874qtn.12
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 01:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hhU99cCB7XpvTN2fcxp8EjIrPOBFerG9ZEfadnPits4=;
 b=aXN60B4fX02ESHRL/EmCHgjB087MdXGw5Ss+nn8nv5FI4Z0xXvB9P8ArPmD8SqDHhL
 ZNLm1Q9DSe+xodXccEVbbkaY+/MfX43zZAi1lho009p9BR1qmUYAHhcv0wtl+EvqT2qO
 JS3LQEIV4anqKFw+PDURU9z+Lr5VVk+eLQgPLaig9OzT2UYTj42fnBadx0Gd9iRav91Q
 G6qgtlKQlvuGvtysP57w/LEOn8i9OMOAsySDPHg38no4aYhr1D6EIGt7czLr7oMRQvSb
 eYxhKtMC7TtDzjFlgk8GX+PBWZVWHTR8orzt4bwfpMuQJcRVsdTsVrgbSjkMeIuD1F2I
 97QA==
X-Gm-Message-State: APjAAAW81oUbM70m5xnWhcgbsFaTVd4WlSZdaUoKAu5Q5vmzZcm/Fx8H
 giuZXVRcVasm7wWDcM7URwIUdkPkrGVsikBPPZULhzNoqjlkSUZ3Wg3JFh2gMP+45yxgumQBLjX
 MOP69hdqO7NrnTj22lkZOtBPCuZT8
X-Received: by 2002:a37:d84:: with SMTP id 126mr1845509qkn.407.1569486105090; 
 Thu, 26 Sep 2019 01:21:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQ1sVd1RtjNN4RR2UjNtY+bztkqyrSkS/Hzvn/M5fL9tuYPUVoOD4Dv1RZQ64O49sodkiqzw==
X-Received: by 2002:a37:d84:: with SMTP id 126mr1845463qkn.407.1569486104789; 
 Thu, 26 Sep 2019 01:21:44 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
 by smtp.gmail.com with ESMTPSA id 199sm632146qkk.112.2019.09.26.01.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 01:21:43 -0700 (PDT)
Date: Thu, 26 Sep 2019 04:21:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 6/8] mdev: introduce virtio device and its device ops
Message-ID: <20190926042102-mutt-send-email-mst@kernel.org>
References: <20190924135332.14160-1-jasowang@redhat.com>
 <20190924135332.14160-7-jasowang@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D58F7DA@SHSMSX104.ccr.corp.intel.com>
 <2210d23d-38e4-e654-e53d-7867348de86a@redhat.com>
 <20190925092044-mutt-send-email-mst@kernel.org>
 <eb7c76b5-2938-2e73-d847-b174a289c5c9@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb7c76b5-2938-2e73-d847-b174a289c5c9@redhat.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTI6MDQ6NDZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiA+ID4gPiBJJ20gbm90IHN1cmUgaG93IHN0YWJsZSBhYm92ZSBvcHMgYXJlLgo+ID4gPiBJ
dCdzIHRoZSBrZXJuZWwgaW50ZXJuYWwgQVBJLCBzbyB0aGVyZSdzIG5vIHN0cmljdCByZXF1aXJl
bWVudCBmb3IgdGhpcy4gV2UKPiA+ID4gd2lsbCBleHBvcnQgYSB2ZXJzaW9uIHZhbHVlIGZvciB1
c2Vyc3BhY2UgZm9yIGNvbXBhdGliaWxpdHkuCj4gPiBHaXZlbiBpdCdzIHRpZWQgdG8gdmlydGlv
IHdlIHByb2JhYmx5IHdhbnQga2VybmVsK3VzZXJzcGFjZQo+ID4gZmVhdHVyZSBiaXRzPwo+IAo+
IAo+IFllcywgdGhlbiBJIHRoaW5rIHdlIGNvdWxkIHByb2JhYmx5IGhhdmUgYSB2ZXJzaW9uIGZp
ZWxkIGluc2lkZSBlLmcKPiBkZXZpY2Vfb3BzIHN0cnVjdHVyZS4gVGhlbiBpdCBjb3VsZCBiZSBm
ZXRjaGVkIGZyb20gYm90aCBrZXJuZWwgYW5kCj4gdXNlcnNwYWNlIGRyaXZlci4KPiAKPiBUaGFu
a3MKPiAKCgpteSBwb2ludCB3YXMgZmVhdHVyZSBiaXRzIG5vdCBhIHZlcnNpb24gbnVtYmVyLgoK
PiA+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
