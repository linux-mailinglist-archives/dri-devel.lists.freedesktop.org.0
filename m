Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7F8B1B7BD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 17:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD7110E6C1;
	Tue,  5 Aug 2025 15:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A6/bQf5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67F610E042
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 15:43:08 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 690173BEE;
 Tue,  5 Aug 2025 17:42:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754408539;
 bh=/b477glFckhVpTYsTfuMHJDefa5GJeU4ik0M0GbH8Vk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=A6/bQf5TcLq0wIaspqgTxOf4ElWozTpQso5dLuvEr6O9XYLyMUF2LhSakhUaK+99J
 VQU7dzXaM4hRrshAqfBAF7Zk04cRpl5R0NX/uJt5pW7Rkf9qM711Uv+nW37tN0cXDP
 DdcaLYo5v1674NDNdPWC5RlLifYYLccJU4n3D9Bs=
Message-ID: <5eb7a110-d10d-40a5-963e-185b65e714f1@ideasonboard.com>
Date: Tue, 5 Aug 2025 18:43:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/omap: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
To: imre.deak@intel.com
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20250728101603.243788-1-imre.deak@intel.com>
 <20250728101603.243788-2-imre.deak@intel.com>
 <aaa77500-c886-417f-b800-8c9cbbcc3285@ideasonboard.com>
 <aJIaDgAVN8_5TXYu@ideak-desk>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <aJIaDgAVN8_5TXYu@ideak-desk>
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

Hi,

On 05/08/2025 17:49, Imre Deak wrote:
> Hi Tomi,
> 
> On Tue, Aug 05, 2025 at 02:53:36PM +0300, Tomi Valkeinen wrote:
>> Hi Imre,
>>
>> On 28/07/2025 13:16, Imre Deak wrote:
>>> Plumb the format info from .fb_create() all the way to
>>> drm_helper_mode_fill_fb_struct() to avoid the redundant
>>> lookup.
>>>
>>> For the fbdev case a manual drm_get_format_info() lookup
>>> is needed.
>>>
>>> The patch is based on the driver parts of the patchset at Link:
>>> below, which missed converting the omap driver.
>>>
>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
>>> Reported-by: Mark Brown <broonie@kernel.org>
>>> Closes: https://lore.kernel.org/all/98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk
>>> Link: https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
>>> Signed-off-by: Imre Deak <imre.deak@intel.com>
>>> ---
>>>  drivers/gpu/drm/omapdrm/omap_fb.c    | 23 ++++++++++-------------
>>>  drivers/gpu/drm/omapdrm/omap_fb.h    |  2 ++
>>>  drivers/gpu/drm/omapdrm/omap_fbdev.c |  5 ++++-
>>>  3 files changed, 16 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
>>> index 30c81e2e5d6b3..bb3105556f193 100644
>>> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
>>> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
>>> @@ -351,7 +351,7 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
>>>  		}
>>>  	}
>>>  
>>> -	fb = omap_framebuffer_init(dev, mode_cmd, bos);
>>> +	fb = omap_framebuffer_init(dev, info, mode_cmd, bos);
>>>  	if (IS_ERR(fb))
>>>  		goto error;
>>>  
>>> @@ -365,9 +365,9 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
>>>  }
>>>  
>>>  struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
>>> +		const struct drm_format_info *info,
>>>  		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos)
>>>  {
>>> -	const struct drm_format_info *format = NULL;
>>>  	struct omap_framebuffer *omap_fb = NULL;
>>>  	struct drm_framebuffer *fb = NULL;
>>>  	unsigned int pitch = mode_cmd->pitches[0];
>>> @@ -377,15 +377,12 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
>>>  			dev, mode_cmd, mode_cmd->width, mode_cmd->height,
>>>  			(char *)&mode_cmd->pixel_format);
>>>  
>>> -	format = drm_get_format_info(dev, mode_cmd->pixel_format,
>>> -				     mode_cmd->modifier[0]);
>>> -
>>>  	for (i = 0; i < ARRAY_SIZE(formats); i++) {
>>>  		if (formats[i] == mode_cmd->pixel_format)
>>>  			break;
>>>  	}
>>>  
>>> -	if (!format || i == ARRAY_SIZE(formats)) {
>>> +	if (i == ARRAY_SIZE(formats)) {
>>>  		dev_dbg(dev->dev, "unsupported pixel format: %4.4s\n",
>>>  			(char *)&mode_cmd->pixel_format);
>>>  		ret = -EINVAL;
>>> @@ -399,7 +396,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
>>>  	}
>>>  
>>>  	fb = &omap_fb->base;
>>> -	omap_fb->format = format;
>>> +	omap_fb->format = info;
>>>  	mutex_init(&omap_fb->lock);
>>>  
>>>  	/*
>>> @@ -407,23 +404,23 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
>>>  	 * that the two planes of multiplane formats need the same number of
>>>  	 * bytes per pixel.
>>>  	 */
>>> -	if (format->num_planes == 2 && pitch != mode_cmd->pitches[1]) {
>>> +	if (info->num_planes == 2 && pitch != mode_cmd->pitches[1]) {
>>>  		dev_dbg(dev->dev, "pitches differ between planes 0 and 1\n");
>>>  		ret = -EINVAL;
>>>  		goto fail;
>>>  	}
>>>  
>>> -	if (pitch % format->cpp[0]) {
>>> +	if (pitch % info->cpp[0]) {
>>>  		dev_dbg(dev->dev,
>>>  			"buffer pitch (%u bytes) is not a multiple of pixel size (%u bytes)\n",
>>> -			pitch, format->cpp[0]);
>>> +			pitch, info->cpp[0]);
>>>  		ret = -EINVAL;
>>>  		goto fail;
>>>  	}
>>>  
>>> -	for (i = 0; i < format->num_planes; i++) {
>>> +	for (i = 0; i < info->num_planes; i++) {
>>>  		struct plane *plane = &omap_fb->planes[i];
>>> -		unsigned int vsub = i == 0 ? 1 : format->vsub;
>>> +		unsigned int vsub = i == 0 ? 1 : info->vsub;
>>>  		unsigned int size;
>>>  
>>>  		size = pitch * mode_cmd->height / vsub;
>>> @@ -440,7 +437,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
>>>  		plane->dma_addr  = 0;
>>>  	}
>>>  
>>> -	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
>>> +	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
>>
>> Isn't the fix really a one-liner, just passing "format" here instead of
>> NULL?
> 
> That would fix the issue of fb->format being initialized to NULL yes.
> 
> However, I think the change should be in sync with the conversion of the
> rest of the drivers in patchset [1]. IOW, what this patch is meant to
> fix is that [1] missed converting the OMAP driver similarly to the other
> drivers.
> 
> I think the change is equivalent to the above one-liner you suggest with
> the following differences:
> 
> - omap_framebuffer_init() uses the drm_format_info passed down from either
>   drm_internal_framebuffer_create(), or omap_fbdev_driver_fbdev_probe().
>   In both cases the passed down format info matches what
>   omap_framebuffer_init() would look up again.
> 
> - Skip the format == NULL check. format can't be NULL in any case, since
>   that would have emitted a WARN already in drm_get_format_info() ->
>   drm_format_info().
> 
> [1] https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com

Yep, I have no issue with the patch as such. But if it's a fix, going
into an rc, I think it's better if it's as small as possible, and do the
cleanups/refactorings as a non-fix later.

The patch description here sounds more like it's just refactoring the
code a bit, but if I understand correctly, it's fixing an issue that
cause a WARN?

So... Either we could 1) split the patch, have the WARN fix as a fix
patch to the current rc, and the rest later in the next merge window, or
2) if you want to keep this as a single patch, I think it makes sense to
change the subject and description to highlight the fix aspect.

I think my comments apply to all patches in this series, as they're
essentially doing the same thing...

 Tomi

>>  Tomi
>>
>>>  
>>>  	ret = drm_framebuffer_init(dev, fb, &omap_framebuffer_funcs);
>>>  	if (ret) {
>>> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.h b/drivers/gpu/drm/omapdrm/omap_fb.h
>>> index 0873f953cf1d1..e6010302a22bd 100644
>>> --- a/drivers/gpu/drm/omapdrm/omap_fb.h
>>> +++ b/drivers/gpu/drm/omapdrm/omap_fb.h
>>> @@ -13,6 +13,7 @@ struct drm_connector;
>>>  struct drm_device;
>>>  struct drm_file;
>>>  struct drm_framebuffer;
>>> +struct drm_format_info;
>>>  struct drm_gem_object;
>>>  struct drm_mode_fb_cmd2;
>>>  struct drm_plane_state;
>>> @@ -23,6 +24,7 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
>>>  		struct drm_file *file, const struct drm_format_info *info,
>>>  		const struct drm_mode_fb_cmd2 *mode_cmd);
>>>  struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
>>> +		const struct drm_format_info *info,
>>>  		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos);
>>>  int omap_framebuffer_pin(struct drm_framebuffer *fb);
>>>  void omap_framebuffer_unpin(struct drm_framebuffer *fb);
>>> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
>>> index 7b63968906817..948af7ec1130b 100644
>>> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
>>> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
>>> @@ -197,7 +197,10 @@ int omap_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>>>  		goto fail;
>>>  	}
>>>  
>>> -	fb = omap_framebuffer_init(dev, &mode_cmd, &bo);
>>> +	fb = omap_framebuffer_init(dev,
>>> +				   drm_get_format_info(dev, mode_cmd.pixel_format,
>>> +						       mode_cmd.modifier[0]),
>>> +				   &mode_cmd, &bo);
>>>  	if (IS_ERR(fb)) {
>>>  		dev_err(dev->dev, "failed to allocate fb\n");
>>>  		/* note: if fb creation failed, we can't rely on fb destroy
>>

