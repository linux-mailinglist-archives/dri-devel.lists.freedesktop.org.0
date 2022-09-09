Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0875B2E88
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0244D10E9A1;
	Fri,  9 Sep 2022 06:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A770410E9A1;
 Fri,  9 Sep 2022 06:11:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 43716B82344;
 Fri,  9 Sep 2022 06:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15D9C433C1;
 Fri,  9 Sep 2022 06:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662703898;
 bh=Nx9QuSHPp+BU8rIr9zvMqadtTGkiffWvSz/I3XSLDKA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pQse+VgM/lFaHtfc6hmaWhn0Z4yPWkbnee04Lz1YDoH4YqGHl2yYGHKewBnEtWauP
 UXxO/Rmry2iLw1R3cZ74a+iv+mWXkR1jSN8YqrWcngrZwpyQ+mvYZzEq0k2wtbV20e
 HeIYL7+P35JsAecBlFfw8vLKYruBZQFF67PA5S+I=
Date: Fri, 9 Sep 2022 08:11:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4 01/15] mei: add support to GSC extended header
Message-ID: <YxrZF46WTxKa9nf2@kroah.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-2-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909001612.728451-2-daniele.ceraolospurio@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>,
 dri-devel@lists.freedesktop.org, Vitaly Lubart <vitaly.lubart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 08, 2022 at 05:15:58PM -0700, Daniele Ceraolo Spurio wrote:
> From: Tomas Winkler <tomas.winkler@intel.com>
> 
> GSC extend header is of variable size and data
> is provided in a sgl list inside the header
> and not in the data buffers, need to enable the path.
> 
> V2:
> 1. Add missing kdoc for mei_cl_cb
> 2. In mei_me_hbuf_write()
>    use dev_err() when validationg parameters instead of WARN_ON()

This stuff goes below the --- line, as the documentation states, right?
Why is it here?

> 
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Vitaly Lubart <vitaly.lubart@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/misc/mei/client.c    | 55 ++++++++++++++++++++++++----------
>  drivers/misc/mei/hbm.c       | 13 ++++++++
>  drivers/misc/mei/hw-me.c     |  7 ++++-
>  drivers/misc/mei/hw.h        | 57 ++++++++++++++++++++++++++++++++++++
>  drivers/misc/mei/interrupt.c | 47 ++++++++++++++++++++++++-----
>  drivers/misc/mei/mei_dev.h   |  4 +++
>  6 files changed, 160 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
> index 0b2fbe1335a7..6c8b71ae32c8 100644
> --- a/drivers/misc/mei/client.c
> +++ b/drivers/misc/mei/client.c
> @@ -322,6 +322,7 @@ void mei_io_cb_free(struct mei_cl_cb *cb)
>  
>  	list_del(&cb->list);
>  	kfree(cb->buf.data);
> +	kfree(cb->ext_hdr);
>  	kfree(cb);
>  }
>  
> @@ -401,6 +402,7 @@ static struct mei_cl_cb *mei_io_cb_init(struct mei_cl *cl,
>  	cb->buf_idx = 0;
>  	cb->fop_type = type;
>  	cb->vtag = 0;
> +	cb->ext_hdr = NULL;
>  
>  	return cb;
>  }
> @@ -1740,6 +1742,17 @@ static inline u8 mei_ext_hdr_set_vtag(void *ext, u8 vtag)
>  	return vtag_hdr->hdr.length;
>  }
>  
> +static inline bool mei_ext_hdr_is_gsc(struct mei_ext_hdr *ext)
> +{
> +	return ext && ext->type == MEI_EXT_HDR_GSC;
> +}
> +
> +static inline u8 mei_ext_hdr_set_gsc(struct mei_ext_hdr *ext, struct mei_ext_hdr *gsc_hdr)
> +{
> +	memcpy(ext, gsc_hdr, mei_ext_hdr_len(gsc_hdr));
> +	return ext->length;
> +}
> +
>  /**
>   * mei_msg_hdr_init - allocate and initialize mei message header
>   *
> @@ -1752,14 +1765,17 @@ static struct mei_msg_hdr *mei_msg_hdr_init(const struct mei_cl_cb *cb)
>  	size_t hdr_len;
>  	struct mei_ext_meta_hdr *meta;
>  	struct mei_msg_hdr *mei_hdr;
> -	bool is_ext, is_vtag;
> +	bool is_ext, is_hbm, is_gsc, is_vtag;
> +	struct mei_ext_hdr *next_ext;
>  
>  	if (!cb)
>  		return ERR_PTR(-EINVAL);
>  
>  	/* Extended header for vtag is attached only on the first fragment */
>  	is_vtag = (cb->vtag && cb->buf_idx == 0);
> -	is_ext = is_vtag;
> +	is_hbm = cb->cl->me_cl->client_id == 0;
> +	is_gsc = ((!is_hbm) && cb->cl->dev->hbm_f_gsc_supported && mei_ext_hdr_is_gsc(cb->ext_hdr));
> +	is_ext = is_vtag || is_gsc;
>  
>  	/* Compute extended header size */
>  	hdr_len = sizeof(*mei_hdr);
> @@ -1771,6 +1787,9 @@ static struct mei_msg_hdr *mei_msg_hdr_init(const struct mei_cl_cb *cb)
>  	if (is_vtag)
>  		hdr_len += sizeof(struct mei_ext_hdr_vtag);
>  
> +	if (is_gsc)
> +		hdr_len += mei_ext_hdr_len(cb->ext_hdr);
> +
>  setup_hdr:
>  	mei_hdr = kzalloc(hdr_len, GFP_KERNEL);
>  	if (!mei_hdr)
> @@ -1785,10 +1804,20 @@ static struct mei_msg_hdr *mei_msg_hdr_init(const struct mei_cl_cb *cb)
>  		goto out;
>  
>  	meta = (struct mei_ext_meta_hdr *)mei_hdr->extension;
> +	meta->size = 0;
> +	next_ext = (struct mei_ext_hdr *)meta->hdrs;
>  	if (is_vtag) {
>  		meta->count++;
> -		meta->size += mei_ext_hdr_set_vtag(meta->hdrs, cb->vtag);
> +		meta->size += mei_ext_hdr_set_vtag(next_ext, cb->vtag);
> +		next_ext = mei_ext_next(next_ext);
> +	}
> +
> +	if (is_gsc) {
> +		meta->count++;
> +		meta->size += mei_ext_hdr_set_gsc(next_ext, cb->ext_hdr);
> +		next_ext = mei_ext_next(next_ext);
>  	}
> +
>  out:
>  	mei_hdr->length = hdr_len - sizeof(*mei_hdr);
>  	return mei_hdr;
> @@ -1812,14 +1841,14 @@ int mei_cl_irq_write(struct mei_cl *cl, struct mei_cl_cb *cb,
>  	struct mei_msg_hdr *mei_hdr = NULL;
>  	size_t hdr_len;
>  	size_t hbuf_len, dr_len;
> -	size_t buf_len;
> +	size_t buf_len = 0;
>  	size_t data_len;
>  	int hbuf_slots;
>  	u32 dr_slots;
>  	u32 dma_len;
>  	int rets;
>  	bool first_chunk;
> -	const void *data;
> +	const void *data = NULL;
>  
>  	if (WARN_ON(!cl || !cl->dev))
>  		return -ENODEV;
> @@ -1839,8 +1868,10 @@ int mei_cl_irq_write(struct mei_cl *cl, struct mei_cl_cb *cb,
>  		return 0;
>  	}
>  
> -	buf_len = buf->size - cb->buf_idx;
> -	data = buf->data + cb->buf_idx;
> +	if (buf->data) {
> +		buf_len = buf->size - cb->buf_idx;
> +		data = buf->data + cb->buf_idx;
> +	}
>  	hbuf_slots = mei_hbuf_empty_slots(dev);
>  	if (hbuf_slots < 0) {
>  		rets = -EOVERFLOW;
> @@ -1858,9 +1889,6 @@ int mei_cl_irq_write(struct mei_cl *cl, struct mei_cl_cb *cb,
>  		goto err;
>  	}
>  
> -	cl_dbg(dev, cl, "Extended Header %d vtag = %d\n",
> -	       mei_hdr->extended, cb->vtag);
> -
>  	hdr_len = sizeof(*mei_hdr) + mei_hdr->length;
>  
>  	/**
> @@ -1889,7 +1917,7 @@ int mei_cl_irq_write(struct mei_cl *cl, struct mei_cl_cb *cb,
>  	}
>  	mei_hdr->length += data_len;
>  
> -	if (mei_hdr->dma_ring)
> +	if (mei_hdr->dma_ring && buf->data)
>  		mei_dma_ring_write(dev, buf->data + cb->buf_idx, buf_len);
>  	rets = mei_write_message(dev, mei_hdr, hdr_len, data, data_len);
>  
> @@ -1983,9 +2011,6 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb)
>  		goto err;
>  	}
>  
> -	cl_dbg(dev, cl, "Extended Header %d vtag = %d\n",
> -	       mei_hdr->extended, cb->vtag);
> -
>  	hdr_len = sizeof(*mei_hdr) + mei_hdr->length;
>  
>  	if (rets == 0) {
> @@ -2030,7 +2055,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb)
>  
>  	mei_hdr->length += data_len;
>  
> -	if (mei_hdr->dma_ring)
> +	if (mei_hdr->dma_ring && buf->data)
>  		mei_dma_ring_write(dev, buf->data, buf_len);
>  	rets = mei_write_message(dev, mei_hdr, hdr_len, data, data_len);
>  
> diff --git a/drivers/misc/mei/hbm.c b/drivers/misc/mei/hbm.c
> index de712cbf5d07..12a62a911e42 100644
> --- a/drivers/misc/mei/hbm.c
> +++ b/drivers/misc/mei/hbm.c
> @@ -340,9 +340,13 @@ static int mei_hbm_capabilities_req(struct mei_device *dev)
>  	req.hbm_cmd = MEI_HBM_CAPABILITIES_REQ_CMD;
>  	if (dev->hbm_f_vt_supported)
>  		req.capability_requested[0] |= HBM_CAP_VT;
> +
>  	if (dev->hbm_f_cd_supported)
>  		req.capability_requested[0] |= HBM_CAP_CD;
>  
> +	if (dev->hbm_f_gsc_supported)
> +		req.capability_requested[0] |= HBM_CAP_GSC;
> +
>  	ret = mei_hbm_write_message(dev, &mei_hdr, &req);
>  	if (ret) {
>  		dev_err(dev->dev,
> @@ -1200,6 +1204,12 @@ static void mei_hbm_config_features(struct mei_device *dev)
>  	     dev->version.minor_version >= HBM_MINOR_VERSION_VT))
>  		dev->hbm_f_vt_supported = 1;
>  
> +	/* GSC support */
> +	if (dev->version.major_version > HBM_MAJOR_VERSION_GSC ||
> +	    (dev->version.major_version == HBM_MAJOR_VERSION_GSC &&
> +	     dev->version.minor_version >= HBM_MINOR_VERSION_GSC))
> +		dev->hbm_f_gsc_supported = 1;
> +
>  	/* Capability message Support */
>  	dev->hbm_f_cap_supported = 0;
>  	if (dev->version.major_version > HBM_MAJOR_VERSION_CAP ||
> @@ -1367,6 +1377,9 @@ int mei_hbm_dispatch(struct mei_device *dev, struct mei_msg_hdr *hdr)
>  		if (!(capability_res->capability_granted[0] & HBM_CAP_CD))
>  			dev->hbm_f_cd_supported = 0;
>  
> +		if (!(capability_res->capability_granted[0] & HBM_CAP_GSC))
> +			dev->hbm_f_gsc_supported = 0;
> +
>  		if (dev->hbm_f_dr_supported) {
>  			if (mei_dmam_ring_alloc(dev))
>  				dev_info(dev->dev, "running w/o dma ring\n");
> diff --git a/drivers/misc/mei/hw-me.c b/drivers/misc/mei/hw-me.c
> index 9e2f781c6ed5..da4ef0b51954 100644
> --- a/drivers/misc/mei/hw-me.c
> +++ b/drivers/misc/mei/hw-me.c
> @@ -590,9 +590,14 @@ static int mei_me_hbuf_write(struct mei_device *dev,
>  	u32 dw_cnt;
>  	int empty_slots;
>  
> -	if (WARN_ON(!hdr || !data || hdr_len & 0x3))
> +	if (WARN_ON(!hdr || hdr_len & 0x3))
>  		return -EINVAL;

Again, please remove the WARN_ON(), don't add to it.

>  
> +	if (!data && data_len) {
> +		dev_err(dev->dev, "wrong parameters null data with data_len = %zu\n", data_len);
> +		return -EINVAL;
> +	}
> +
>  	dev_dbg(dev->dev, MEI_HDR_FMT, MEI_HDR_PRM((struct mei_msg_hdr *)hdr));
>  
>  	empty_slots = mei_hbuf_empty_slots(dev);
> diff --git a/drivers/misc/mei/hw.h b/drivers/misc/mei/hw.h
> index e7e020dba6b1..14f89d96216b 100644
> --- a/drivers/misc/mei/hw.h
> +++ b/drivers/misc/mei/hw.h
> @@ -92,6 +92,12 @@
>  #define HBM_MINOR_VERSION_VT               2
>  #define HBM_MAJOR_VERSION_VT               2
>  
> +/*
> + * MEI version with GSC support
> + */
> +#define HBM_MINOR_VERSION_GSC              2
> +#define HBM_MAJOR_VERSION_GSC              2
> +
>  /*
>   * MEI version with capabilities message support
>   */
> @@ -229,10 +235,12 @@ enum mei_cl_disconnect_status {
>   *
>   * @MEI_EXT_HDR_NONE: sentinel
>   * @MEI_EXT_HDR_VTAG: vtag header
> + * @MEI_EXT_HDR_GSC: gsc header
>   */
>  enum mei_ext_hdr_type {
>  	MEI_EXT_HDR_NONE = 0,
>  	MEI_EXT_HDR_VTAG = 1,
> +	MEI_EXT_HDR_GSC = 2,
>  };
>  
>  /**
> @@ -305,6 +313,39 @@ static inline bool mei_ext_last(struct mei_ext_meta_hdr *meta,
>  	return (u8 *)ext >= (u8 *)meta + sizeof(*meta) + (meta->size * 4);
>  }
>  
> +struct mei_gsc_sgl {
> +	u32 low;
> +	u32 high;
> +	u32 length;
> +} __packed;
> +
> +#define GSC_HECI_MSG_KERNEL 0
> +#define GSC_HECI_MSG_USER   1
> +
> +#define GSC_ADDRESS_TYPE_GTT   0
> +#define GSC_ADDRESS_TYPE_PPGTT 1
> +#define GSC_ADDRESS_TYPE_PHYSICAL_CONTINUOUS 2 /* max of 64K */
> +#define GSC_ADDRESS_TYPE_PHYSICAL_SGL 3
> +
> +struct mei_ext_hdr_gsc_h2f {
> +	struct mei_ext_hdr hdr;
> +	u8                 client_id;
> +	u8                 addr_type;
> +	u32                fence_id;
> +	u8                 input_address_count;
> +	u8                 output_address_count;
> +	u8                 reserved[2];
> +	struct mei_gsc_sgl sgl[];
> +} __packed;

Why is this structure here if you do not use it?

And that's some really odd alignment of the fields, is this coming from
the hardware?

> +
> +struct mei_ext_hdr_gsc_f2h {
> +	struct mei_ext_hdr hdr;
> +	u8                 client_id;
> +	u8                 reserved;
> +	u32                fence_id;
> +	u32                written;
> +} __packed;
> +
>  /**
>   * mei_ext_next - following extended header on the TLV list
>   *
> @@ -320,6 +361,18 @@ static inline struct mei_ext_hdr *mei_ext_next(struct mei_ext_hdr *ext)
>  	return (struct mei_ext_hdr *)((u8 *)ext + (ext->length * 4));
>  }
>  
> +/**
> + * mei_ext_hdr_len - get ext header length in bytes
> + *
> + * @ext: extend header
> + *
> + * Return: extend header length in bytes
> + */
> +static inline u32 mei_ext_hdr_len(struct mei_ext_hdr *ext)
> +{
> +	return  (ext) ? ext->length * sizeof(u32) : 0;

Odd spacing :(

And please just spell out ? : statements with a real if () statement.
There is no difference from the generated code and you write code for
people first, compilers second.

And how can ext be NULL here?

thanks,

greg k-h
