Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512A78D6850
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 19:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579A710E3A7;
	Fri, 31 May 2024 17:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="syhF+z71";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F3010E2C1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 17:43:40 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52b8254338dso2319177e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 10:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717177419; x=1717782219; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=++A9eRTepXKaQlX/n7y1YLYk+bRzmeV2OxSEniWyl9Y=;
 b=syhF+z712POs7v8WDR4KtmP5sa4ypNaN7nC/niDNvzj7wZ90zkLkwTn76h8vG+6YG2
 nWcaDe1KL/vJMAHwiCm09G5DETG8xJP9o0Iw6K6wdvxFwXFzC/OHc0cKK6do/Hu32zzI
 hYnBNkSli3NzRJGjCnQUmKKXNypHB2nTevfb78e3fZML9FpViiOOGton51B4KpjP5443
 3qPwpXgZXBU5KWFqa5AnUhJama+kF8LFEIdY7zzy49ceXhOd0SSLrD8sDDr/MipnTHvi
 aVKSuoIYmlB0qtQTM3C5KmUpuerVxNPLa1lJKY7sxTDXNFPRG+moQblhxs5IZRl+U/Db
 +ODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717177419; x=1717782219;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=++A9eRTepXKaQlX/n7y1YLYk+bRzmeV2OxSEniWyl9Y=;
 b=EETzzYKdwu06yEi3OhfNVERcugwKGbTdGIPYnUgaAZREuqBs6BJHzmI7pasJT+E2Jc
 vVhv6XiwFG/tdPdVHYjq90IZcXKtaTHYLjLNPGDKDHxvRjE/2TVkoe/ayoRrp6KVdbOf
 +g5L90RPbiREOFKEk4EfETX2TKxEGjLqm107k6kgFxNZaNM8Uw0d7BjZ0U0re5TcZ3eh
 XulbHVvU0CSh4kRZ40FMP5Xm8JhfbPWiZBrEkdWthB/MLvYxxK9F0f2AulqVR53ktx0D
 7rDAfQ21jBPD2n3eikFDOrlmV7Imw+DDJljcFpxxgJR3yh2cFfSb4XU+lFcDb4cjH0Qe
 /F0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWyADWISe0ZPRRp6/866ga18EPl4dAoxTAXJDlSWnqAWAIzNPbqAAkUQvjF6P4HSehsvTxJ2aeU6V4NvmoJAbKH6PfzNhr04RyPuRZ6Azo
X-Gm-Message-State: AOJu0Yzb8uFkoDJiq8k29EAnnH84F/0HETFvwhlYhQ0AiE9ktiPOZfqU
 hNCimfXt222eAfu0AhYztT72yjXOGbKib1wKakisKxkiIo8ZDrSd8rXxgd5WLzA=
X-Google-Smtp-Source: AGHT+IFyvYzgg/xDu6GcGjRimu3ZdjRNTdvZZXX3T2C8F9djKPfbZ79k2XyO7ksg7mNcH2hCy7HTxQ==
X-Received: by 2002:ac2:4354:0:b0:52b:404:914f with SMTP id
 2adb3069b0e04-52b8958aed8mr1697776e87.34.1717177418909; 
 Fri, 31 May 2024 10:43:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b8e43a5e2sm54511e87.298.2024.05.31.10.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 10:43:38 -0700 (PDT)
Date: Fri, 31 May 2024 20:43:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
Message-ID: <6kmhrxip4xb44bspptwdaoqsod5gm7ccr27fn3jr4ouh4jszi4@fuxht25n5wki>
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
 <7428a2f7-befc-6db8-76f4-3ca8dc12d31c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7428a2f7-befc-6db8-76f4-3ca8dc12d31c@quicinc.com>
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

On Fri, May 31, 2024 at 10:18:07AM -0600, Jeffrey Hugo wrote:
> On 5/30/2024 5:12 PM, Dmitry Baryshkov wrote:
> > There are two ways to describe an eDP panel in device tree. The
> > recommended way is to add a device on the AUX bus, ideally using the
> > edp-panel compatible. The legacy way is to define a top-level platform
> > device for the panel.
> > 
> > Document that adding support for eDP panels in a legacy way is strongly
> > discouraged (if not forbidden at all).
> > 
> > While we are at it, also drop legacy compatible strings and bindings for
> > five panels. These compatible strings were never used by a DT file
> > present in Linux kernel and most likely were never used with the
> > upstream Linux kernel.
> > 
> > The following compatibles were never used by the devices supported by
> > the upstream kernel and are a subject to possible removal:
> > 
> > - lg,lp097qx1-spa1
> > - samsung,lsn122dl01-c01
> > - sharp,ld-d5116z01b
> 
> Ok to drop the sharp one I added.  It should be able to be handled by the
> (newish) edp-panel, but I think the TI bridge driver needs some work for the
> specific platform (no I2C connection) to verify.

Thanks. I'm tempted to merge the series as is now and drop
sharp,ld-d5116z01b once you can confirm that it can be handled by
edp-panel on your platform.

-- 
With best wishes
Dmitry
