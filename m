Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEAD42C7BA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 19:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A246E0F1;
	Wed, 13 Oct 2021 17:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1389F6E054
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 16:18:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57B9E6D;
 Wed, 13 Oct 2021 09:18:17 -0700 (PDT)
Received: from e120937-lin (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25FED3F694;
 Wed, 13 Oct 2021 09:18:07 -0700 (PDT)
Date: Wed, 13 Oct 2021 17:18:04 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jie Deng <jie.deng@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Kalle Valo <kvalo@codeaurora.org>, Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 David Hildenbrand <david@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Eric Van Hensbergen <ericvh@gmail.com>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-um@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, kvm@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH RFC] virtio: wrap config->reset calls
Message-ID: <20211013161804.GB6376@e120937-lin>
References: <20211013105226.20225-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013105226.20225-1-mst@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 13 Oct 2021 17:35:42 +0000
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

On Wed, Oct 13, 2021 at 06:55:31AM -0400, Michael S. Tsirkin wrote:
> This will enable cleanups down the road.
> The idea is to disable cbs, then add "flush_queued_cbs" callback
> as a parameter, this way drivers can flush any work
> queued after callbacks have been disabled.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  arch/um/drivers/virt-pci.c                 | 2 +-
>  drivers/block/virtio_blk.c                 | 4 ++--
>  drivers/bluetooth/virtio_bt.c              | 2 +-
>  drivers/char/hw_random/virtio-rng.c        | 2 +-
>  drivers/char/virtio_console.c              | 4 ++--
>  drivers/crypto/virtio/virtio_crypto_core.c | 8 ++++----
>  drivers/firmware/arm_scmi/virtio.c         | 2 +-
>  drivers/gpio/gpio-virtio.c                 | 2 +-
>  drivers/gpu/drm/virtio/virtgpu_kms.c       | 2 +-
>  drivers/i2c/busses/i2c-virtio.c            | 2 +-
>  drivers/iommu/virtio-iommu.c               | 2 +-
>  drivers/net/caif/caif_virtio.c             | 2 +-
>  drivers/net/virtio_net.c                   | 4 ++--
>  drivers/net/wireless/mac80211_hwsim.c      | 2 +-
>  drivers/nvdimm/virtio_pmem.c               | 2 +-
>  drivers/rpmsg/virtio_rpmsg_bus.c           | 2 +-
>  drivers/scsi/virtio_scsi.c                 | 2 +-
>  drivers/virtio/virtio.c                    | 5 +++++
>  drivers/virtio/virtio_balloon.c            | 2 +-
>  drivers/virtio/virtio_input.c              | 2 +-
>  drivers/virtio/virtio_mem.c                | 2 +-
>  fs/fuse/virtio_fs.c                        | 4 ++--
>  include/linux/virtio.h                     | 1 +
>  net/9p/trans_virtio.c                      | 2 +-
>  net/vmw_vsock/virtio_transport.c           | 4 ++--
>  sound/virtio/virtio_card.c                 | 4 ++--
>  26 files changed, 39 insertions(+), 33 deletions(-)
> 
[snip]
> diff --git a/drivers/firmware/arm_scmi/virtio.c b/drivers/firmware/arm_scmi/virtio.c
> index 11e8efb71375..6b8d93fe8848 100644
> --- a/drivers/firmware/arm_scmi/virtio.c
> +++ b/drivers/firmware/arm_scmi/virtio.c
> @@ -452,7 +452,7 @@ static void scmi_vio_remove(struct virtio_device *vdev)
>  	 * outstanding message on any vqueue to be ignored by complete_cb: now
>  	 * we can just stop processing buffers and destroy the vqueues.
>  	 */
> -	vdev->config->reset(vdev);
> +	virtio_reset_device(vdev);
>  	vdev->config->del_vqs(vdev);
>  	/* Ensure scmi_vdev is visible as NULL */
>  	smp_store_mb(scmi_vdev, NULL);


Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

