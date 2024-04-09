Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD9C89DE86
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 17:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2179310FE86;
	Tue,  9 Apr 2024 15:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.b="Re2MZHX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-52003.amazon.com (smtp-fw-52003.amazon.com
 [52.119.213.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FDC112CF0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 11:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1712663151; x=1744199151;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GFjr+qUI/xJlRfC49pDYbbQ+5mOHCUk/2gN5wZX0VPA=;
 b=Re2MZHX5GydCM8B6KilkbcXlSGPSLv0DHVNAFcmqvWsd0IZ1NH+wl46p
 jp+rvzqYg9VvAX9wn3JpJghaHuXQWE2yPEhE8P08rq+2tVNxto7uD3tbV
 QrLFtsNiMvuJGKG0kOuG7Rz2NIhkvDaaqqVhKqvF/2RhKVIbglEWBhS4x g=;
X-IronPort-AV: E=Sophos;i="6.07,189,1708387200"; d="scan'208";a="650727234"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-52003.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 11:45:43 +0000
Received: from EX19MTAUWC002.ant.amazon.com [10.0.21.151:49900]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.27.169:2525]
 with esmtp (Farcaster)
 id 3f52ccb2-10c8-4639-a2de-4651f9e21034; Tue, 9 Apr 2024 11:45:42 +0000 (UTC)
X-Farcaster-Flow-ID: 3f52ccb2-10c8-4639-a2de-4651f9e21034
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 9 Apr 2024 11:45:38 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Tue, 9 Apr
 2024 11:45:22 +0000
Message-ID: <7c82670e-6063-4b0f-9bbf-805a0d949d84@amazon.com>
Date: Tue, 9 Apr 2024 13:45:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/25] misc: nsm: drop owner assignment
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>, "David
 Hildenbrand" <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, "Richard
 Weinberger" <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe
 <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>, "Luiz Augusto von
 Dentz" <luiz.dentz@gmail.com>, Olivia Mackall <olivia@selenic.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, Amit Shah <amit@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gonglei
 <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>, "Sudeep
 Holla" <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
 <daniel@ffwll.ch>, Jean-Philippe Brucker <jean-philippe@linaro.org>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen
 <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet
 <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>, "Dan
 Williams" <dan.j.williams@intel.com>, Vishal Verma
 <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, Ira Weiny
 <ira.weiny@intel.com>, "Pankaj Gupta" <pankaj.gupta.linux@gmail.com>, Bjorn
 Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Vivek Goyal
 <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>, "Anton Yakovlev"
 <anton.yakovlev@opensynergy.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
CC: <virtualization@lists.linux.dev>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-um@lists.infradead.org>,
 <linux-block@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-gpio@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <iommu@lists.linux.dev>, <netdev@vger.kernel.org>, <v9fs@lists.linux.dev>,
 <kvm@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <nvdimm@lists.linux.dev>, <linux-remoteproc@vger.kernel.org>,
 <linux-scsi@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
References: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
 <20240331-module-owner-virtio-v2-15-98f04bfaf46a@linaro.org>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <20240331-module-owner-virtio-v2-15-98f04bfaf46a@linaro.org>
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D035UWA002.ant.amazon.com (10.13.139.60) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Tue, 09 Apr 2024 15:16:14 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMxLjAzLjI0IDEwOjQ0LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IHZpcnRpbyBj
b3JlIGFscmVhZHkgc2V0cyB0aGUgLm93bmVyLCBzbyBkcml2ZXIgZG9lcyBub3QgbmVlZCB0by4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAbGluYXJvLm9yZz4KCgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIEdyYWYgPGdyYWZAYW1hem9u
LmNvbT4KCgpBbGV4CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApL
cmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4g
U2NobGFlZ2VyLCBKb25hdGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFy
bG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5
IDIzNyA4NzkKCgo=

