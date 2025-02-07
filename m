Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6C2A2C928
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 17:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5381810E047;
	Fri,  7 Feb 2025 16:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="APUQ4Y8k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE08810E047
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 16:44:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54747AB5;
 Fri,  7 Feb 2025 17:43:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1738946618;
 bh=i9bS6npSCXjd0xRxPt7pUuM461bc20nql/jjB9Cr8Sg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=APUQ4Y8kCJ3bXGp5L+3RuSGmUJx6mrYv9Yh7es/6Vn5rxE4TeVWptGCXHgIw8NLBo
 EQj6jPP4GgYMBEQr4khulMncCB4ZnNkGjhRsDucfD7BaZy5Bl3PmGhqXu8KNAf9C5Z
 CPzdBMdA14/Uf+fhH4iYmmgYr5jo4lNAOuH3OWRc=
Date: Fri, 7 Feb 2025 18:44:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bart Van Assche <bvanassche@acm.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] drm: zynqmp_dp: Use scope-based mutex helpers
Message-ID: <20250207164446.GB24886@pendragon.ideasonboard.com>
References: <20250207162528.1651426-1-sean.anderson@linux.dev>
 <20250207162528.1651426-3-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207162528.1651426-3-sean.anderson@linux.dev>
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

Hi Sean,

Thank you for the patch.

On Fri, Feb 07, 2025 at 11:25:28AM -0500, Sean Anderson wrote:
> Convert most mutex_(un)lock calls to use (scoped_)guard instead. This
> generally reduces line count and prevents bugs like forgetting to unlock
> the mutex. I've left traditional calls in a few places where scoped
> helpers would be more verbose. This mostly happens where
> debugfs_file_put needs to be called regardless. I looked into defining a
> CLASS for debugfs_file, but it seems like more effort than it's worth
> since debugfs_file_get can fail.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
> Changes in v2:
> - Convert some conditional return statements to returns of ternary
>   expressions.
> - Remove unnecessary whitespace change
> 
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 147 +++++++++++--------------------
>  1 file changed, 50 insertions(+), 97 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 189a08cdc73c..63842f657836 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1534,10 +1534,10 @@ zynqmp_dp_bridge_mode_valid(struct drm_bridge *bridge,
>  	}
>  
>  	/* Check with link rate and lane count */
> -	mutex_lock(&dp->lock);
> -	rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
> -				  dp->link_config.max_lanes, dp->config.bpp);
> -	mutex_unlock(&dp->lock);
> +	scoped_guard(mutex, &dp->lock)
> +		rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
> +					  dp->link_config.max_lanes,
> +					  dp->config.bpp);

Could we use curly braces even for single-statement scopes ?

	scoped_guard(mutex, &dp->lock) {
		rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
					  dp->link_config.max_lanes,
					  dp->config.bpp);
	}

I think this would make the scope clearer.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	if (mode->clock > rate) {
>  		dev_dbg(dp->dev, "filtered mode %s for high pixel rate\n",
>  			mode->name);
> @@ -1722,13 +1722,9 @@ static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
>  static enum drm_connector_status zynqmp_dp_bridge_detect(struct drm_bridge *bridge)
>  {
>  	struct zynqmp_dp *dp = bridge_to_dp(bridge);
> -	enum drm_connector_status ret;
>  
> -	mutex_lock(&dp->lock);
> -	ret = __zynqmp_dp_bridge_detect(dp);
> -	mutex_unlock(&dp->lock);
> -
> -	return ret;
> +	guard(mutex)(&dp->lock);
> +	return __zynqmp_dp_bridge_detect(dp);
>  }
>  
>  static const struct drm_edid *zynqmp_dp_bridge_edid_read(struct drm_bridge *bridge,
> @@ -1881,10 +1877,9 @@ static ssize_t zynqmp_dp_pattern_read(struct file *file, char __user *user_buf,
>  	if (unlikely(ret))
>  		return ret;
>  
> -	mutex_lock(&dp->lock);
> -	ret = snprintf(buf, sizeof(buf), "%s\n",
> -		       test_pattern_str[dp->test.pattern]);
> -	mutex_unlock(&dp->lock);
> +	scoped_guard(mutex, &dp->lock)
> +		ret = snprintf(buf, sizeof(buf), "%s\n",
> +			       test_pattern_str[dp->test.pattern]);
>  
>  	debugfs_file_put(dentry);
>  	return simple_read_from_buffer(user_buf, count, ppos, buf, ret);
> @@ -1939,24 +1934,18 @@ static int zynqmp_dp_enhanced_get(void *data, u64 *val)
>  {
>  	struct zynqmp_dp *dp = data;
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	*val = dp->test.enhanced;
> -	mutex_unlock(&dp->lock);
>  	return 0;
>  }
>  
>  static int zynqmp_dp_enhanced_set(void *data, u64 val)
>  {
>  	struct zynqmp_dp *dp = data;
> -	int ret = 0;
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	dp->test.enhanced = val;
> -	if (dp->test.active)
> -		ret = zynqmp_dp_test_setup(dp);
> -	mutex_unlock(&dp->lock);
> -
> -	return ret;
> +	return dp->test.active ? zynqmp_dp_test_setup(dp) : 0;
>  }
>  
>  DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_enhanced, zynqmp_dp_enhanced_get,
> @@ -1966,24 +1955,19 @@ static int zynqmp_dp_downspread_get(void *data, u64 *val)
>  {
>  	struct zynqmp_dp *dp = data;
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	*val = dp->test.downspread;
> -	mutex_unlock(&dp->lock);
>  	return 0;
>  }
>  
>  static int zynqmp_dp_downspread_set(void *data, u64 val)
>  {
>  	struct zynqmp_dp *dp = data;
> -	int ret = 0;
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	dp->test.downspread = val;
> -	if (dp->test.active)
> -		ret = zynqmp_dp_test_setup(dp);
> -	mutex_unlock(&dp->lock);
>  
> -	return ret;
> +	return dp->test.active ? zynqmp_dp_test_setup(dp) : 0;
>  }
>  
>  DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_downspread, zynqmp_dp_downspread_get,
> @@ -1993,33 +1977,32 @@ static int zynqmp_dp_active_get(void *data, u64 *val)
>  {
>  	struct zynqmp_dp *dp = data;
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	*val = dp->test.active;
> -	mutex_unlock(&dp->lock);
>  	return 0;
>  }
>  
>  static int zynqmp_dp_active_set(void *data, u64 val)
>  {
>  	struct zynqmp_dp *dp = data;
> -	int ret = 0;
> +	int ret;
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	if (val) {
>  		if (val < 2) {
>  			ret = zynqmp_dp_test_setup(dp);
>  			if (ret)
> -				goto out;
> +				return ret;
>  		}
>  
>  		ret = zynqmp_dp_set_test_pattern(dp, dp->test.pattern,
>  						 dp->test.custom);
>  		if (ret)
> -			goto out;
> +			return ret;
>  
>  		ret = zynqmp_dp_update_vs_emph(dp, dp->test.train_set);
>  		if (ret)
> -			goto out;
> +			return ret;
>  
>  		dp->test.active = true;
>  	} else {
> @@ -2032,10 +2015,8 @@ static int zynqmp_dp_active_set(void *data, u64 val)
>  				 err);
>  		zynqmp_dp_train_loop(dp);
>  	}
> -out:
> -	mutex_unlock(&dp->lock);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_active, zynqmp_dp_active_get,
> @@ -2102,9 +2083,8 @@ static int zynqmp_dp_swing_get(void *data, u64 *val)
>  	struct zynqmp_dp_train_set_priv *priv = data;
>  	struct zynqmp_dp *dp = priv->dp;
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	*val = dp->test.train_set[priv->lane] & DP_TRAIN_VOLTAGE_SWING_MASK;
> -	mutex_unlock(&dp->lock);
>  	return 0;
>  }
>  
> @@ -2113,12 +2093,11 @@ static int zynqmp_dp_swing_set(void *data, u64 val)
>  	struct zynqmp_dp_train_set_priv *priv = data;
>  	struct zynqmp_dp *dp = priv->dp;
>  	u8 *train_set = &dp->test.train_set[priv->lane];
> -	int ret = 0;
>  
>  	if (val > 3)
>  		return -EINVAL;
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	*train_set &= ~(DP_TRAIN_MAX_SWING_REACHED |
>  			DP_TRAIN_VOLTAGE_SWING_MASK);
>  	*train_set |= val;
> @@ -2126,10 +2105,9 @@ static int zynqmp_dp_swing_set(void *data, u64 val)
>  		*train_set |= DP_TRAIN_MAX_SWING_REACHED;
>  
>  	if (dp->test.active)
> -		ret = zynqmp_dp_update_vs_emph(dp, dp->test.train_set);
> -	mutex_unlock(&dp->lock);
> +		return zynqmp_dp_update_vs_emph(dp, dp->test.train_set);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_swing, zynqmp_dp_swing_get,
> @@ -2140,10 +2118,9 @@ static int zynqmp_dp_preemphasis_get(void *data, u64 *val)
>  	struct zynqmp_dp_train_set_priv *priv = data;
>  	struct zynqmp_dp *dp = priv->dp;
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	*val = FIELD_GET(DP_TRAIN_PRE_EMPHASIS_MASK,
>  			 dp->test.train_set[priv->lane]);
> -	mutex_unlock(&dp->lock);
>  	return 0;
>  }
>  
> @@ -2152,12 +2129,11 @@ static int zynqmp_dp_preemphasis_set(void *data, u64 val)
>  	struct zynqmp_dp_train_set_priv *priv = data;
>  	struct zynqmp_dp *dp = priv->dp;
>  	u8 *train_set = &dp->test.train_set[priv->lane];
> -	int ret = 0;
>  
>  	if (val > 2)
>  		return -EINVAL;
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	*train_set &= ~(DP_TRAIN_MAX_PRE_EMPHASIS_REACHED |
>  			DP_TRAIN_PRE_EMPHASIS_MASK);
>  	*train_set |= val;
> @@ -2165,10 +2141,9 @@ static int zynqmp_dp_preemphasis_set(void *data, u64 val)
>  		*train_set |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
>  
>  	if (dp->test.active)
> -		ret = zynqmp_dp_update_vs_emph(dp, dp->test.train_set);
> -	mutex_unlock(&dp->lock);
> +		return zynqmp_dp_update_vs_emph(dp, dp->test.train_set);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_preemphasis, zynqmp_dp_preemphasis_get,
> @@ -2178,31 +2153,24 @@ static int zynqmp_dp_lanes_get(void *data, u64 *val)
>  {
>  	struct zynqmp_dp *dp = data;
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	*val = dp->test.link_cnt;
> -	mutex_unlock(&dp->lock);
>  	return 0;
>  }
>  
>  static int zynqmp_dp_lanes_set(void *data, u64 val)
>  {
>  	struct zynqmp_dp *dp = data;
> -	int ret = 0;
>  
>  	if (val > ZYNQMP_DP_MAX_LANES)
>  		return -EINVAL;
>  
> -	mutex_lock(&dp->lock);
> -	if (val > dp->num_lanes) {
> -		ret = -EINVAL;
> -	} else {
> -		dp->test.link_cnt = val;
> -		if (dp->test.active)
> -			ret = zynqmp_dp_test_setup(dp);
> -	}
> -	mutex_unlock(&dp->lock);
> +	guard(mutex)(&dp->lock);
> +	if (val > dp->num_lanes)
> +		return -EINVAL;
>  
> -	return ret;
> +	dp->test.link_cnt = val;
> +	return dp->test.active ? zynqmp_dp_test_setup(dp) : 0;
>  }
>  
>  DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_lanes, zynqmp_dp_lanes_get,
> @@ -2212,9 +2180,8 @@ static int zynqmp_dp_rate_get(void *data, u64 *val)
>  {
>  	struct zynqmp_dp *dp = data;
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000ULL;
> -	mutex_unlock(&dp->lock);
>  	return 0;
>  }
>  
> @@ -2222,7 +2189,6 @@ static int zynqmp_dp_rate_set(void *data, u64 val)
>  {
>  	struct zynqmp_dp *dp = data;
>  	int link_rate;
> -	int ret = 0;
>  	u8 bw_code;
>  
>  	if (do_div(val, 10000))
> @@ -2237,13 +2203,9 @@ static int zynqmp_dp_rate_set(void *data, u64 val)
>  	    bw_code != DP_LINK_BW_5_4)
>  		return -EINVAL;
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	dp->test.bw_code = bw_code;
> -	if (dp->test.active)
> -		ret = zynqmp_dp_test_setup(dp);
> -	mutex_unlock(&dp->lock);
> -
> -	return ret;
> +	return dp->test.active ? zynqmp_dp_test_setup(dp) : 0;
>  }
>  
>  DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_rate, zynqmp_dp_rate_get,
> @@ -2253,9 +2215,8 @@ static int zynqmp_dp_ignore_aux_errors_get(void *data, u64 *val)
>  {
>  	struct zynqmp_dp *dp = data;
>  
> -	mutex_lock(&dp->aux.hw_mutex);
> +	guard(mutex)(&dp->lock);
>  	*val = dp->ignore_aux_errors;
> -	mutex_unlock(&dp->aux.hw_mutex);
>  	return 0;
>  }
>  
> @@ -2266,9 +2227,8 @@ static int zynqmp_dp_ignore_aux_errors_set(void *data, u64 val)
>  	if (val != !!val)
>  		return -EINVAL;
>  
> -	mutex_lock(&dp->aux.hw_mutex);
> +	guard(mutex)(&dp->lock);
>  	dp->ignore_aux_errors = val;
> -	mutex_unlock(&dp->aux.hw_mutex);
>  	return 0;
>  }
>  
> @@ -2280,9 +2240,8 @@ static int zynqmp_dp_ignore_hpd_get(void *data, u64 *val)
>  {
>  	struct zynqmp_dp *dp = data;
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	*val = dp->ignore_hpd;
> -	mutex_unlock(&dp->lock);
>  	return 0;
>  }
>  
> @@ -2293,9 +2252,8 @@ static int zynqmp_dp_ignore_hpd_set(void *data, u64 val)
>  	if (val != !!val)
>  		return -EINVAL;
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	dp->ignore_hpd = val;
> -	mutex_unlock(&dp->lock);
>  	return 0;
>  }
>  
> @@ -2391,14 +2349,12 @@ static void zynqmp_dp_hpd_work_func(struct work_struct *work)
>  	struct zynqmp_dp *dp = container_of(work, struct zynqmp_dp, hpd_work);
>  	enum drm_connector_status status;
>  
> -	mutex_lock(&dp->lock);
> -	if (dp->ignore_hpd) {
> -		mutex_unlock(&dp->lock);
> -		return;
> -	}
> +	scoped_guard(mutex, &dp->lock) {
> +		if (dp->ignore_hpd)
> +			return;
>  
> -	status = __zynqmp_dp_bridge_detect(dp);
> -	mutex_unlock(&dp->lock);
> +		status = __zynqmp_dp_bridge_detect(dp);
> +	}
>  
>  	drm_bridge_hpd_notify(&dp->bridge, status);
>  }
> @@ -2410,11 +2366,9 @@ static void zynqmp_dp_hpd_irq_work_func(struct work_struct *work)
>  	u8 status[DP_LINK_STATUS_SIZE + 2];
>  	int err;
>  
> -	mutex_lock(&dp->lock);
> -	if (dp->ignore_hpd) {
> -		mutex_unlock(&dp->lock);
> +	guard(mutex)(&dp->lock);
> +	if (dp->ignore_hpd)
>  		return;
> -	}
>  
>  	err = drm_dp_dpcd_read(&dp->aux, DP_SINK_COUNT, status,
>  			       DP_LINK_STATUS_SIZE + 2);
> @@ -2428,7 +2382,6 @@ static void zynqmp_dp_hpd_irq_work_func(struct work_struct *work)
>  			zynqmp_dp_train_loop(dp);
>  		}
>  	}
> -	mutex_unlock(&dp->lock);
>  }
>  
>  static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)

-- 
Regards,

Laurent Pinchart
