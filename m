Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E876989727
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 21:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEE310E012;
	Sun, 29 Sep 2024 19:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cLJD058A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5857F10E012
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2024 19:48:17 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7a9aec89347so241520785a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2024 12:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727639296; x=1728244096; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=C/yNLMI4Dfa1JOu9ZZ5KMcnVN9OakoAYGWQtbvgWXzk=;
 b=cLJD058A/X+fsScvgPEVCad+hlIfgn5ywC12R7Bp1kiW5BK1FsVYXjwVeBRbZAS9Lb
 IJ7ljyKvdy82W9jqT7ieTkjiBmt4USbMO0syuiNktkEBPBEHkJqOi0p4QZuv3NGUPy3I
 LzDtrPZyV2W/Zja9ULfocEOp3WrAqK/fxiBFGQYLczXk+SQ7rW6YmH9OfszJteU7+O/6
 0WafzImhICnF326yLtY7sEv/bpMc99se58ApSDg9mDDv1ueqgjbwosbZEkeEH2uBdT8D
 B10ZStIxJseuREgMn8r+HZ5JIWgX4TfiTtAHSxDVp+qUF499P+hTdz6Rn6Ao+kVcBlUX
 68pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727639296; x=1728244096;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C/yNLMI4Dfa1JOu9ZZ5KMcnVN9OakoAYGWQtbvgWXzk=;
 b=GUbU09VUnGxS654vvpasrhE1s8ca/ADNpLmjhecxw4aLFcG6AQSRUZQl9h/AGxxOB+
 ++Hq45v7Kezkvcr+hLdUpVl3qY+GJjpdgk1EB+bc77r372hnDauXlYqTVjRgI91NAiqg
 AjbwfkhjJB0MhhhFcjhSy0nITsU2j3YQcUXlRLHOdGyN0UOQERgzsePOCqkE7CSqCnhS
 CpryJM6XnfwTCKrmOMtJZxQ2Txx9dcsWTVCohcCt3/onCRTOVZIAVpbhQ9rsE+IyScjY
 5N1a9/ePKSR68GeZw2wobG/iC+RBo/5Xt0dPbnIU32tdfuHTEpRbnL21iJQXrH87/6e0
 qUhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH96mJ1TUmnbcOXzDw7MtQDc75SXueBqVLUQT+YN08wvLkesHd36haT+4+TqVvVd0MUFUB+r7+dLk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPBKiZtU8MtY20DS4XYt5qxrvJ4yiMtEVR/spjDB7JpGb2TdIj
 NMY9ZREOhIeju8dWvVxIUFnreo/rSaLMIYgoncIhUxz5Py1EmR6q
X-Google-Smtp-Source: AGHT+IFeeeUii0kxH//xLKWlv0LXOHbVcGPm/7q0EHdBCNjq4YERwamx3b7Evz0ZK+RetrYdcveDXA==
X-Received: by 2002:a05:620a:370b:b0:7ac:bb36:5c5d with SMTP id
 af79cd13be357-7ae378529admr1444074285a.31.1727639296140; 
 Sun, 29 Sep 2024 12:48:16 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae3783d613sm347893685a.121.2024.09.29.12.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2024 12:48:15 -0700 (PDT)
Date: Sun, 29 Sep 2024 15:48:11 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Mehdi Djait <mehdi.djait@bootlin.com>, christophe.jaillet@wanadoo.fr,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH v6 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <znyfkop6lm5a734hsuko56xcmeeessqrkhbjhf5iwbtllmli2k@kcwbo7fh6yah>
References: <20240905124432.834831-1-lanzano.alex@gmail.com>
 <20240905124432.834831-3-lanzano.alex@gmail.com>
 <q2njnpzpkd3xrrv6icr5wq6uztja3wfmy2x2ldreqemzbwkedv@ixywmn7qy34q>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <q2njnpzpkd3xrrv6icr5wq6uztja3wfmy2x2ldreqemzbwkedv@ixywmn7qy34q>
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

Hi thanks for the review! I'll address these in v8. Looks like you
missed my v7 of this patch

On Wed, Sep 25, 2024 at 11:07:00PM GMT, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Sep 05, 2024 at 08:44:00AM -0400, Alex Lanzano wrote:
> > +static void sharp_memory_crtc_enable(struct drm_crtc *crtc,
> > +				     struct drm_atomic_state *state)
> > +{
> > +	struct pwm_state pwm_state;
> > +	struct sharp_memory_device *smd = drm_to_sharp_memory_device(crtc->dev);
> > +
> > +	sharp_memory_clear_display(smd);
> > +
> > +	if (smd->enable_gpio)
> > +		gpiod_set_value(smd->enable_gpio, 1);
> > +
> > +	switch (smd->vcom_mode) {
> > +	case SHARP_MEMORY_SOFTWARE_VCOM:
> > +		smd->sw_vcom_signal = kthread_run(sharp_memory_sw_vcom_signal_thread,
> > +						  smd, "sw_vcom_signal");
> > +		break;
> > +
> > +	case SHARP_MEMORY_EXTERNAL_VCOM:
> > +		break;
> > +
> > +	case SHARP_MEMORY_PWM_VCOM:
> > +		pwm_get_state(smd->pwm_vcom_signal, &pwm_state);
> 
> I'd prefer using pwm_init_state() here instead of pwm_get_state(), The
> former only depends on machine description (probably device tree), the
> latter depends on what happend before to the PWM. While it probably
> doesn't make a difference in practise, the former is more deterministic.
> 

Will fix in v8.

> > +		pwm_state.period =    1000000000;
> > +		pwm_state.duty_cycle = 100000000;
> 
> Unusual indention.
> 

Will fix

> The device tree (and also ACPI) defines a default period for a PWM. If
> you used pwm_init_state() -- as suggested above -- you could just use
> pwm_set_relative_duty_cycle(smd->pwm_vcom_signal, 1, 10); here.
> 

Will fix

> > +		pwm_state.enabled = true;
> > +		pwm_apply_might_sleep(smd->pwm_vcom_signal, &pwm_state);
> > +		break;
> > +	}
> > +}
> > +
> > +static void sharp_memory_crtc_disable(struct drm_crtc *crtc,
> > +				      struct drm_atomic_state *state)
> > +{
> > +	struct sharp_memory_device *smd = drm_to_sharp_memory_device(crtc->dev);
> > +
> > +	sharp_memory_clear_display(smd);
> > +
> > +	if (smd->enable_gpio)
> > +		gpiod_set_value(smd->enable_gpio, 0);
> > +
> > +	switch (smd->vcom_mode) {
> > +	case SHARP_MEMORY_SOFTWARE_VCOM:
> > +		kthread_stop(smd->sw_vcom_signal);
> > +		break;
> > +
> > +	case SHARP_MEMORY_EXTERNAL_VCOM:
> > +		break;
> > +
> > +	case SHARP_MEMORY_PWM_VCOM:
> > +		pwm_disable(smd->pwm_vcom_signal);
> 
> What is the objective here? Do you want to save energy and don't care
> about the output? Or do you want the PWM to emit the inactive level?
> Note that for the second case, pwm_disable() is wrong, as depending on
> the underlying hardware the PWM might continue to toggle or emit a
> constant active level.
> 

I want the PWM to stop emitting to save energy.

> > +		break;
> > +	}
> > +}
> > +
> > [...]
> > +
> > +static int sharp_memory_init_pwm_vcom_signal(struct sharp_memory_device *smd)
> > +{
> > +	struct pwm_state state;
> > +	struct device *dev = &smd->spi->dev;
> > +
> > +	smd->pwm_vcom_signal = devm_pwm_get(dev, NULL);
> > +	if (IS_ERR(smd->pwm_vcom_signal))
> > +		return dev_err_probe(dev, -EINVAL, "Could not get pwm device\n");
> > +
> > +	pwm_init_state(smd->pwm_vcom_signal, &state);
> > +	state.enabled = false;
> > +	pwm_apply_might_sleep(smd->pwm_vcom_signal, &state);
> 
> Same question as above. If you care about the output level, use
> 
> 	{
> 		.period = ...,
> 		.duty_cycle = 0,
> 		.enabled = true,
> 	}
> 

See answer above!

> > +
> > +	return 0;
> > +}
> 
> Best regards
> Uwe


