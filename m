Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8FB97DEBC
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 22:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEC510E1A8;
	Sat, 21 Sep 2024 20:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kBRh9esJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536CA10E1A8
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 20:15:14 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso2371454e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 13:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726949712; x=1727554512; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aueuoJk8vYdpJXqJjsbRBhB3fAkdhN+RWgn2HXmxoVk=;
 b=kBRh9esJvDZzK3eC5e57h0dcSnzOgmf7xQPJZ/2PigZumrBlzwBojxyKafcw7BT/Df
 pdqizCE8HSqQElWFSuOPbU2AwwODSk3KoHoBXJD2/ZqWK+OHU/flrFe/SZxVuitb8rKr
 9Yc42mKI4SwMr6AgQO9SFSDmOS6P0RYPkX/7GYSAP8lZR6U9p0f73EglEhY08tmSOIo4
 WF3mfUfVB/PZynjgupwwpBQdff+ViqAq5VR9OBqrPW7xQPnpUIPRp435f7PIq9pbJGs9
 FMdX6PbJxiDTAAEwinAdvuACueA4BkdAuwMRItk2axYxuFzvRpLU3qOct47eAEn8H9l9
 gUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726949712; x=1727554512;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aueuoJk8vYdpJXqJjsbRBhB3fAkdhN+RWgn2HXmxoVk=;
 b=xCyUTO0CPZGRv+58JZ3NnJ8Y8WJIsBoZGXVw5B7C6OJb6l5H8nOh+YzO7fmAsgoSZb
 ejn+hK/DCUNOYd6Ujwn2Pp+FmrXTUB4IJuI3j9gSwUj5WMxvRV13EpczpbxfLWsgUjTF
 05Mjs2i4Hx5Vdv3sRhxKKR6rGAuV3fBzwgr9XMEjv8virlt/rGnEKsjLEpO2+cQ20DET
 BGUBys7SfJZfk+9zbXv75kQY1QbCfolsVJj1t6ubhmRWstoToFrxlFqm7mH8Dl9DmE3w
 PNvIkrY9jS9RaXopf/eAvTApWQ7Lpy0g4LLrKLYekhkf7aTylJeaduTlPVeMsV1zql/Z
 6WzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBphSNwbKA8Hp0kRGLo4OatBod16+iI9yhdZ002xBR8TzG1ME/AeWsPKn0gmUxVktDE2L/q1XBLr8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzECLiOKyzOKDCKhIwwjybbSvsbDS6LM8A32A5MMZ43YkrySuSq
 F+E84IJJmv/0aSHBRHWXA7348cUUkE1b6HFxoPN5LENeXyDdRrw8GLajrXzGvME=
X-Google-Smtp-Source: AGHT+IHE5Sz8PqI/4vvidVBPG6WlaqRCeC69ObQhJbeRe8p7Zgb72JR7dTMXYN9ujLUIFJd21mXWyg==
X-Received: by 2002:a05:6512:3b85:b0:52f:d090:6da6 with SMTP id
 2adb3069b0e04-536ac338a52mr3756292e87.55.1726949712328; 
 Sat, 21 Sep 2024 13:15:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704db0bsm2706147e87.114.2024.09.21.13.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 13:15:11 -0700 (PDT)
Date: Sat, 21 Sep 2024 23:15:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, 
 Saravana Kannan <saravanak@google.com>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Devarsh Thakkar <devarsht@ti.com>
Subject: Re: fw_devlinks preventing a panel driver from probing
Message-ID: <34mewzvfyjsvyud3lzy6swxs7sr64xkgrbkxtvyw3czvoerct7@7guo32ehwa52>
References: <1a1ab663-d068-40fb-8c94-f0715403d276@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a1ab663-d068-40fb-8c94-f0715403d276@ideasonboard.com>
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

On Mon, Sep 16, 2024 at 02:51:57PM GMT, Tomi Valkeinen wrote:
> Hi,
> 
> We have an issue where two devices have dependencies to each other,
> according to drivers/base/core.c's fw_devlinks, and this prevents them from
> probing. I've been adding debugging to the core.c, but so far I don't quite
> grasp the issue, so I thought to ask. Maybe someone can instantly say that
> this just won't work...

Well, just 2c from my side. I consider that fw_devlink adds devlinks for
of-graph nodes to be a bug. It doesn't know about the actual direction
of dependencies between corresponding devices or about the actual
relationship between drivers. It results in a loop which is then broken
in some way. Sometimes this works. Sometimes it doesn't. Sometimes this
hides actual dependencies between devices. I tried reverting offending
parts of devlink, but this attempt failed.

> 
> If I understand the fw_devlink code correctly, in a normal case the links
> formed with media graphs are marked as a cycle (FWLINK_FLAG_CYCLE), and then
> ignored as far as probing goes.
> 
> What we see here is that when using a single-link OLDI panel, the panel
> driver's probe never gets called, as it depends on the OLDI, and the link
> between the panel and the OLDI is not a cycle.

I think in your case you should be able to fix the issue by using the
FWNODE_FLAG_NOT_DEVICE, which is intented to be used in such cases. You
have a dependency on DT node which doesn't have backing device.

> 
> The DSS driver probes, but the probe fails as it requires all the panel
> devices to have been probed (and thus registered to the DRM framework)
> before it can finish its setup.
> 
-- 
With best wishes
Dmitry
