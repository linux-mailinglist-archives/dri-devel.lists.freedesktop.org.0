Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A7DA1A1C9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 11:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C25110E7C4;
	Thu, 23 Jan 2025 10:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H612sPhO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4A510E7C4;
 Thu, 23 Jan 2025 10:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737627994; x=1769163994;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QREHT56/rPn1OVWAQjftr5gaogHIkErP83e1Ihi4wBQ=;
 b=H612sPhO7kLF+YBzZ5vL/GDkaPrK1q9LCf2FNNjv0oOJvF7zSPkJDvil
 Wou3O26+lWTmYtqfe1p3vOSX9W/nj2SLsBXF1ecoV1g/NxUZRCKndnmQH
 PKPnJ8zoT18v+ksdkOkycI0D9oKCTALgBB+A1U96QyvCL7H/SEtTWcY3k
 3xQ/sEOcAywnX4b3Nk00I8EXQUnja3z2lsQdyPNR3iUEaET1ZZ0pgjMVU
 0OHLGIK3hbJTFrRVoU5GGmXpwvRHA2TIFwJ8qkV+DWqZmC9dueObXLHVQ
 rbKc/m/MWYlRxa2xI4zqbqSdoecTKMnPeeYnanCIWmrp9zo2HRxeVOGpq w==;
X-CSE-ConnectionGUID: ZW2kr9IKRqGktoaJD1kzZw==
X-CSE-MsgGUID: ewO55F4OSjSLI9T/3cHfjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37378539"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="37378539"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 02:26:33 -0800
X-CSE-ConnectionGUID: S1PKAmDESN+o5C/ByVIEEQ==
X-CSE-MsgGUID: J0+vRFyLQ9qJcuxmTGu6xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="138283782"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.98])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 02:26:28 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 2/7] drm/display: dp: implement new access helpers
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-2-7fc020e04dbc@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
 <20250117-drm-rework-dpcd-access-v1-2-7fc020e04dbc@linaro.org>
Date: Thu, 23 Jan 2025 12:26:25 +0200
Message-ID: <87o6zxn7vy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 17 Jan 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> Existing DPCD access functions return an error code or the number of
> bytes being read / write in case of partial access. However a lot of
> drivers either (incorrectly) ignore partial access or mishandle error
> codes. In other cases this results in a boilerplate code which compares
> returned value with the size.
>
> Implement new set of DPCD access helpers, which ignore partial access,
> always return 0 or an error code. Implement existing helpers using the
> new functions to ensure backwards compatibility.
>
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c       | 42 +++++++-------
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 27 +++++----
>  include/drm/display/drm_dp_helper.h           | 81 ++++++++++++++++++++++++++-
>  include/drm/display/drm_dp_mst_helper.h       | 10 ++--
>  4 files changed, 119 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 809c65dcb58983693fb335b88759a66919410114..5a693f2779284467e2d05b9d8b2c2bee0ad6c112 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -495,13 +495,13 @@ EXPORT_SYMBOL(drm_dp_bw_code_to_link_rate);
>  
>  static inline void
>  drm_dp_dump_access(const struct drm_dp_aux *aux,
> -		   u8 request, uint offset, void *buffer, int ret)
> +		   u8 request, uint offset, void *buffer, size_t size, int ret)
>  {
>  	const char *arrow = request == DP_AUX_NATIVE_READ ? "->" : "<-";
>  
> -	if (ret > 0)
> +	if (ret == 0)
>  		drm_dbg_dp(aux->drm_dev, "%s: 0x%05x AUX %s (ret=%3d) %*ph\n",
> -			   aux->name, offset, arrow, ret, min(ret, 20), buffer);
> +			   aux->name, offset, arrow, ret, min_t(int, size, 20), buffer);
>  	else
>  		drm_dbg_dp(aux->drm_dev, "%s: 0x%05x AUX %s (ret=%3d)\n",
>  			   aux->name, offset, arrow, ret);
> @@ -559,8 +559,10 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
>  		if (ret >= 0) {
>  			native_reply = msg.reply & DP_AUX_NATIVE_REPLY_MASK;
>  			if (native_reply == DP_AUX_NATIVE_REPLY_ACK) {
> -				if (ret == size)
> +				if (ret == size) {
> +					ret = 0;
>  					goto unlock;
> +				}
>  
>  				ret = -EPROTO;
>  			} else
> @@ -602,9 +604,9 @@ int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset)
>  	int ret;
>  
>  	ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, 1);
> -	WARN_ON(ret == 0);
> +	WARN_ON(ret == -EPROTO);
>  
> -	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, ret);
> +	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, 1, ret);
>  
>  	return ret < 0 ? ret : 0;
>  }
> @@ -634,21 +636,21 @@ void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered)
>  EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
>  
>  /**
> - * drm_dp_dpcd_read() - read a series of bytes from the DPCD
> + * drm_dp_dpcd_read_data() - read a series of bytes from the DPCD
>   * @aux: DisplayPort AUX channel (SST or MST)
>   * @offset: address of the (first) register to read
>   * @buffer: buffer to store the register values
>   * @size: number of bytes in @buffer
>   *
> - * Returns the number of bytes transferred on success, or a negative error
> + * Returns zero (0) on success, or a negative error
>   * code on failure. -EIO is returned if the request was NAKed by the sink or
>   * if the retry count was exceeded. If not all bytes were transferred, this
>   * function returns -EPROTO. Errors from the underlying AUX channel transfer
>   * function, with the exception of -EBUSY (which causes the transaction to
>   * be retried), are propagated to the caller.
>   */
> -ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
> -			 void *buffer, size_t size)
> +int drm_dp_dpcd_read_data(struct drm_dp_aux *aux, unsigned int offset,
> +			  void *buffer, size_t size)
>  {
>  	int ret;
>  
> @@ -671,45 +673,45 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
>  	}
>  
>  	if (aux->is_remote)
> -		ret = drm_dp_mst_dpcd_read(aux, offset, buffer, size);
> +		ret = drm_dp_mst_dpcd_read_data(aux, offset, buffer, size);
>  	else
>  		ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset,
>  					 buffer, size);
>  
> -	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, buffer, ret);
> +	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, buffer, size, ret);
>  	return ret;
>  }
> -EXPORT_SYMBOL(drm_dp_dpcd_read);
> +EXPORT_SYMBOL(drm_dp_dpcd_read_data);
>  
>  /**
> - * drm_dp_dpcd_write() - write a series of bytes to the DPCD
> + * drm_dp_dpcd_write_data() - write a series of bytes to the DPCD
>   * @aux: DisplayPort AUX channel (SST or MST)
>   * @offset: address of the (first) register to write
>   * @buffer: buffer containing the values to write
>   * @size: number of bytes in @buffer
>   *
> - * Returns the number of bytes transferred on success, or a negative error
> + * Returns zero (0) on success, or a negative error
>   * code on failure. -EIO is returned if the request was NAKed by the sink or
>   * if the retry count was exceeded. If not all bytes were transferred, this
>   * function returns -EPROTO. Errors from the underlying AUX channel transfer
>   * function, with the exception of -EBUSY (which causes the transaction to
>   * be retried), are propagated to the caller.
>   */
> -ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
> -			  void *buffer, size_t size)
> +int drm_dp_dpcd_write_data(struct drm_dp_aux *aux, unsigned int offset,
> +			   void *buffer, size_t size)
>  {
>  	int ret;
>  
>  	if (aux->is_remote)
> -		ret = drm_dp_mst_dpcd_write(aux, offset, buffer, size);
> +		ret = drm_dp_mst_dpcd_write_data(aux, offset, buffer, size);
>  	else
>  		ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_WRITE, offset,
>  					 buffer, size);
>  
> -	drm_dp_dump_access(aux, DP_AUX_NATIVE_WRITE, offset, buffer, ret);
> +	drm_dp_dump_access(aux, DP_AUX_NATIVE_WRITE, offset, buffer, size, ret);
>  	return ret;
>  }
> -EXPORT_SYMBOL(drm_dp_dpcd_write);
> +EXPORT_SYMBOL(drm_dp_dpcd_write_data);
>  
>  /**
>   * drm_dp_dpcd_read_link_status() - read DPCD link status (bytes 0x202-0x207)
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index f8cd094efa3c0bd6f75b52a0410b0910d8026a76..f8db5be53a33e87e94b864ba48151354e091f5aa 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -2128,20 +2128,20 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
>  }
>  
>  /**
> - * drm_dp_mst_dpcd_read() - read a series of bytes from the DPCD via sideband
> + * drm_dp_mst_dpcd_read_data() - read a series of bytes from the DPCD via sideband
>   * @aux: Fake sideband AUX CH
>   * @offset: address of the (first) register to read
>   * @buffer: buffer to store the register values
>   * @size: number of bytes in @buffer
>   *
>   * Performs the same functionality for remote devices via
> - * sideband messaging as drm_dp_dpcd_read() does for local
> + * sideband messaging as drm_dp_dpcd_read_data() does for local
>   * devices via actual AUX CH.
>   *
> - * Return: Number of bytes read, or negative error code on failure.
> + * Return: Zero (0) on success, or negative error code on failure.
>   */
> -ssize_t drm_dp_mst_dpcd_read(struct drm_dp_aux *aux,
> -			     unsigned int offset, void *buffer, size_t size)
> +int drm_dp_mst_dpcd_read_data(struct drm_dp_aux *aux,
> +			      unsigned int offset, void *buffer, size_t size)
>  {
>  	struct drm_dp_mst_port *port = container_of(aux, struct drm_dp_mst_port,
>  						    aux);
> @@ -2151,20 +2151,20 @@ ssize_t drm_dp_mst_dpcd_read(struct drm_dp_aux *aux,
>  }
>  
>  /**
> - * drm_dp_mst_dpcd_write() - write a series of bytes to the DPCD via sideband
> + * drm_dp_mst_dpcd_write_data() - write a series of bytes to the DPCD via sideband
>   * @aux: Fake sideband AUX CH
>   * @offset: address of the (first) register to write
>   * @buffer: buffer containing the values to write
>   * @size: number of bytes in @buffer
>   *
>   * Performs the same functionality for remote devices via
> - * sideband messaging as drm_dp_dpcd_write() does for local
> + * sideband messaging as drm_dp_dpcd_write_data() does for local
>   * devices via actual AUX CH.
>   *
> - * Return: number of bytes written on success, negative error code on failure.
> + * Return: zero (0) on success, negative error code on failure.
>   */
> -ssize_t drm_dp_mst_dpcd_write(struct drm_dp_aux *aux,
> -			      unsigned int offset, void *buffer, size_t size)
> +int drm_dp_mst_dpcd_write_data(struct drm_dp_aux *aux,
> +			       unsigned int offset, void *buffer, size_t size)
>  {
>  	struct drm_dp_mst_port *port = container_of(aux, struct drm_dp_mst_port,
>  						    aux);
> @@ -3490,9 +3490,8 @@ static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
>  		goto fail_free;
>  	}
>  
> -	ret = min_t(size_t, txmsg->reply.u.remote_dpcd_read_ack.num_bytes,
> -		    size);
> -	memcpy(bytes, txmsg->reply.u.remote_dpcd_read_ack.bytes, ret);
> +	memcpy(bytes, txmsg->reply.u.remote_dpcd_read_ack.bytes, size);
> +	ret = 0;
>  
>  fail_free:
>  	kfree(txmsg);
> @@ -3530,7 +3529,7 @@ static int drm_dp_send_dpcd_write(struct drm_dp_mst_topology_mgr *mgr,
>  		if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK)
>  			ret = -EIO;
>  		else
> -			ret = size;
> +			ret = 0;
>  	}
>  
>  	kfree(txmsg);
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 8f4054a560396a43750570a8c2e95624039ab8ad..548237a81ef0359dab1ed7df6ef0fd1e0c76e0c5 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -522,10 +522,85 @@ struct drm_dp_aux {
>  
>  int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
>  void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered);
> -ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
> -			 void *buffer, size_t size);
> -ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
> +
> +int drm_dp_dpcd_read_data(struct drm_dp_aux *aux, unsigned int offset,
>  			  void *buffer, size_t size);
> +int drm_dp_dpcd_write_data(struct drm_dp_aux *aux, unsigned int offset,
> +			   void *buffer, size_t size);
> +
> +/**
> + * drm_dp_dpcd_read() - read a series of bytes from the DPCD
> + * @aux: DisplayPort AUX channel (SST or MST)
> + * @offset: address of the (first) register to read
> + * @buffer: buffer to store the register values
> + * @size: number of bytes in @buffer
> + *
> + * Deprecated wrapper around drm_dp_dpcd_read().
> + * Returns the number of bytes transferred on success, or a negative error
> + * code on failure.
> + */
> +static inline ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux,
> +				       unsigned int offset,
> +				       void *buffer, size_t size)
> +{
> +	int ret = drm_dp_dpcd_read_data(aux, offset, buffer, size);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return size;
> +}
> +
> +/**
> + * drm_dp_dpcd_read_byte() - read a single byte from the DPCD
> + * @aux: DisplayPort AUX channel
> + * @offset: address of the register to read
> + * @valuep: location where the value of the register will be stored
> + *
> + * Returns zero (0) on success, or a negative error code on failure.
> + */
> +static inline int drm_dp_dpcd_read_byte(struct drm_dp_aux *aux,
> +					unsigned int offset, u8 *valuep)
> +{
> +	return drm_dp_dpcd_read_data(aux, offset, valuep, 1);
> +}
> +
> +/**
> + * drm_dp_dpcd_write_byte() - write a single byte to the DPCD
> + * @aux: DisplayPort AUX channel
> + * @offset: address of the register to write
> + * @value: value to write to the register
> + *
> + * Returns zero (0) on success, or a negative error code on failure.
> + */
> +static inline int drm_dp_dpcd_write_byte(struct drm_dp_aux *aux,
> +					 unsigned int offset, u8 value)
> +{
> +	return drm_dp_dpcd_write_data(aux, offset, &value, 1);
> +}
> +
> +/**
> + * drm_dp_dpcd_write() - write a series of bytes from the DPCD
> + * @aux: DisplayPort AUX channel (SST or MST)
> + * @offset: address of the (first) register to write
> + * @buffer: buffer containing the values to write
> + * @size: number of bytes in @buffer
> + *
> + * Deprecated wrapper around drm_dp_dpcd_write().
> + * Returns the number of bytes transferred on success, or a negative error
> + * code on failure.
> + */
> +static inline ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux,
> +					unsigned int offset,
> +					void *buffer, size_t size)
> +{
> +	int ret = drm_dp_dpcd_write_data(aux, offset, buffer, size);
> +
> +	if (ret < 0)
> +		return ret;

I just realized this changes behaviour. This no longer returns the
number of bytes transferred when it's less than size. It'll always be an
error.

Now, if we were to accept this change, I wonder if we could do that as a
standalone change first, within the current functions? Return either
size or negative error, nothing between [0..size).

After that, we could change all the return checks for "!= size" or "<
size" to "< 0" (because they would be the same thing). When all the
places have been changed, we could eventually switch from returning size
to returning 0 on success when nobody depends on it anymore, and keep
the same function names.

I think this does have a certain appeal to it. Thoughts?


BR,
Jani.


> +
> +	return size;
> +}
>  
>  /**
>   * drm_dp_dpcd_readb() - read a single byte from the DPCD
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
> index a80ba457a858f36ac2110a6fdd91d8a1570b58e1..d527b323a7a8c92b93280fcc8cd3025e21cdcf02 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -899,10 +899,12 @@ int __must_check
>  drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
>  			       bool sync);
>  
> -ssize_t drm_dp_mst_dpcd_read(struct drm_dp_aux *aux,
> -			     unsigned int offset, void *buffer, size_t size);
> -ssize_t drm_dp_mst_dpcd_write(struct drm_dp_aux *aux,
> -			      unsigned int offset, void *buffer, size_t size);
> +int drm_dp_mst_dpcd_read_data(struct drm_dp_aux *aux,
> +			      unsigned int offset,
> +			      void *buffer, size_t size);
> +int drm_dp_mst_dpcd_write_data(struct drm_dp_aux *aux,
> +			       unsigned int offset,
> +			       void *buffer, size_t size);
>  
>  int drm_dp_mst_connector_late_register(struct drm_connector *connector,
>  				       struct drm_dp_mst_port *port);

-- 
Jani Nikula, Intel
