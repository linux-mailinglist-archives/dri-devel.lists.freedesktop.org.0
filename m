Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6986ACF0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 12:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C7110E72A;
	Wed, 28 Feb 2024 11:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE20510E5D8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 11:25:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B55A61803;
 Wed, 28 Feb 2024 11:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6AEC433F1;
 Wed, 28 Feb 2024 11:25:44 +0000 (UTC)
Message-ID: <ce262cda-84ba-4d8f-a916-76488c94066d@xs4all.nl>
Date: Wed, 28 Feb 2024 12:25:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] media: v4l2-subdev: Add a pad variant of
 .query_dv_timings()
Content-Language: en-US, nl
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, airlied@gmail.com,
 akpm@linux-foundation.org, conor+dt@kernel.org, daniel@ffwll.ch,
 dinguyen@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mripard@kernel.org,
 robh+dt@kernel.org, tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 chromeos-krk-upstreaming@google.com, ribalda@chromium.org
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-2-panikiel@google.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240221160215.484151-2-panikiel@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Paweł,

On 21/02/2024 17:02, Paweł Anikiel wrote:
> Currently, .query_dv_timings() is defined as a video callback without
> a pad argument. This is a problem if the subdevice can have different
> dv timings for each pad (e.g. a DisplayPort receiver with multiple
> virtual channels).
> 
> To solve this, add a pad variant of this callback which includes
> the pad number as an argument.

So now we have two query_dv_timings ops: one for video ops, and one
for pad ops. That's not very maintainable. I would suggest switching
all current users of the video op over to the pad op.

Regards,

	Hans

> 
> Signed-off-by: Paweł Anikiel <panikiel@google.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 11 +++++++++++
>  include/media/v4l2-subdev.h           |  5 +++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 4c6198c48dd6..11f865dd19b4 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -389,6 +389,16 @@ static int call_enum_dv_timings(struct v4l2_subdev *sd,
>  	       sd->ops->pad->enum_dv_timings(sd, dvt);
>  }
>  
> +static int call_query_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
> +				 struct v4l2_dv_timings *timings)
> +{
> +	if (!timings)
> +		return -EINVAL;
> +
> +	return check_pad(sd, pad) ? :
> +	       sd->ops->pad->query_dv_timings(sd, pad, timings);
> +}
> +
>  static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
>  				struct v4l2_mbus_config *config)
>  {
> @@ -489,6 +499,7 @@ static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
>  	.set_edid		= call_set_edid,
>  	.dv_timings_cap		= call_dv_timings_cap,
>  	.enum_dv_timings	= call_enum_dv_timings,
> +	.query_dv_timings	= call_query_dv_timings,
>  	.get_frame_desc		= call_get_frame_desc,
>  	.get_mbus_config	= call_get_mbus_config,
>  };
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index a9e6b8146279..dc8963fa5a06 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -797,6 +797,9 @@ struct v4l2_subdev_state {
>   * @enum_dv_timings: callback for VIDIOC_SUBDEV_ENUM_DV_TIMINGS() ioctl handler
>   *		     code.
>   *
> + * @query_dv_timings: same as query_dv_timings() from v4l2_subdev_video_ops,
> + *		      but with additional pad argument.
> + *
>   * @link_validate: used by the media controller code to check if the links
>   *		   that belongs to a pipeline can be used for stream.
>   *
> @@ -868,6 +871,8 @@ struct v4l2_subdev_pad_ops {
>  			      struct v4l2_dv_timings_cap *cap);
>  	int (*enum_dv_timings)(struct v4l2_subdev *sd,
>  			       struct v4l2_enum_dv_timings *timings);
> +	int (*query_dv_timings)(struct v4l2_subdev *sd, unsigned int pad,
> +				struct v4l2_dv_timings *timings);
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	int (*link_validate)(struct v4l2_subdev *sd, struct media_link *link,
>  			     struct v4l2_subdev_format *source_fmt,

