Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FDA88E4BF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 15:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E966610FA3E;
	Wed, 27 Mar 2024 14:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="CbUJLPf5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2252 seconds by postgrey-1.36 at gabe;
 Wed, 27 Mar 2024 14:12:15 UTC
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6207510FD15
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=NZdy0X3liUqTEzRbInNe/vjDY6MNb1re1WUM40McVv8=; 
 t=1711548735; x=1712758335; b=CbUJLPf5pbW+QqDTMediStge3/J6oxuBG4GwEesyEiIzPYi
 qljuuKjwsIxQLGr+FBrZU/kReKrsQxeyIbFEt0sy/gBrix+W0bZuF4imWWFXm/PAcLQRkTKPXlCBH
 Ywkc5X4vQfWkSu9vK4yYsLpRRXzV4KcUSr+/LHYMRcR9kKCAQPdYehx5u3iXcZ/jKiV2fj7VrROeo
 gDpEBz1uldFQxn+Mpi4Lnf87a69mr6hA1HUe1vwzOEzUIWDSXIwONbWP6dKjMRJ0BK/XrOGB4xPIt
 TkAl3kttxnhvO6gDfUwntaPzxbZ2QLvacNMG0F7oCW5ZWifSUvPsnJw1MZl/JEHQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97) (envelope-from <johannes@sipsolutions.net>)
 id 1rpTPq-0000000H6pw-3l9Q; Wed, 27 Mar 2024 14:34:07 +0100
Message-ID: <46e9539f59c82762e3468a9519fa4123566910d5.camel@sipsolutions.net>
Subject: Re: [PATCH 02/22] um: virt-pci: drop owner assignment
From: Johannes Berg <johannes@sipsolutions.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>,  Richard Weinberger <richard@nod.at>, Anton
 Ivanov <anton.ivanov@cambridgegreys.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe
 <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von
 Dentz <luiz.dentz@gmail.com>, Olivia Mackall <olivia@selenic.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, Amit Shah <amit@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, David
 Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Gurchetan
 Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, Joerg Roedel
 <joro@8bytes.org>, Alexander Graf <graf@amazon.com>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar
 Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,  Stefano Garzarella
 <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>, Dan Williams
 <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Dave
 Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, Pankaj Gupta
 <pankaj.gupta.linux@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Vivek Goyal <vgoyal@redhat.com>, Miklos
 Szeredi <miklos@szeredi.hu>, Anton Yakovlev
 <anton.yakovlev@opensynergy.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
Cc: virtualization@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev, 
 kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
 nvdimm@lists.linux.dev,  linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org,  linux-fsdevel@vger.kernel.org,
 alsa-devel@alsa-project.org,  linux-sound@vger.kernel.org
Date: Wed, 27 Mar 2024 14:34:04 +0100
In-Reply-To: <20240327-module-owner-virtio-v1-2-0feffab77d99@linaro.org>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-2-0feffab77d99@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
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

On Wed, 2024-03-27 at 13:40 +0100, Krzysztof Kozlowski wrote:
> virtio core already sets the .owner, so driver does not need to.

> All further patches depend on the first virtio patch, therefore please ac=
k
> and this should go via one tree: virtio?

Sure. Though it's not really actually necessary, you can set it in the
core and merge the other patches in the next cycle; those drivers that
_have_ an .owner aren't broken after all.

Acked-by: Johannes Berg <johannes@sipsolutions.net>

johannes
