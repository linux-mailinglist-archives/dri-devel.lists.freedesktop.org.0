Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA7984C8C5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 11:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A8B10EED8;
	Wed,  7 Feb 2024 10:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="grHVbc4y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2C210EED8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 10:39:31 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51165efb684so804206e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 02:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707302370; x=1707907170; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dfn60JJbW7ZmqouExzAHtYMCfc4R1yQ5pVABs7D1eOk=;
 b=grHVbc4yFCWcBOG3orsL+3aZopYijDROksKY17Ul/GLxzqHYbbhCPvW/p+XnbHMF3h
 HyJIlvS4Sjoujwr5ekg6AeTHm/adNU56Q8/ttYJFLrfSEViKuNXYTMvNZ6LBOf6WZ/Qs
 baQ1AGGj0DPD7x+fs4w76MmUeq+egW4xxu7DHgUwARSbKH0/FVCoApeUKaxzbK90KckR
 QQ7dQe1JzxbsXbvnC5vuVjwBdRsQiWuQW5ind7g2VTNcfOA4XPtbJZCc3ph8i/gCFRWK
 4grBBNM8T5escaeGpFH4U6ojNsNM92MjL01vEkf0G6MrBlPQ8Rnr8x0yk2Vqx82Pi8YU
 HZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707302370; x=1707907170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dfn60JJbW7ZmqouExzAHtYMCfc4R1yQ5pVABs7D1eOk=;
 b=WozFQdbfV8oqTxj1KDY/FKGQLTrsK7zw/T6Dzv3J4uVaQte6XQ57uAQtXLBiHzHnTn
 k93l8Wr3oa65sBOtMpzE2T4ekybzZwR6dQHkWpOQwu6+lf83jlXDDwT9wbaedqpGlz5f
 GRS9eYjMpQb9yVHROHcxInDNjKdtSfESiS/W/kQreDfC75/qdPXlucWC3EHJ9jYJxiQp
 cifW3B1LVg3xSUHkWdnFsxbhsy54OSsS/bH/D3m7GM1LHChFRiHK+1FDY0lX17PJGmdT
 Doj373nOYiAd2vzVaG57JC3omMU0GPAI9E3up7oyfNrUTJsHVZyn6glT5DNcUYk/CoE8
 IjrQ==
X-Gm-Message-State: AOJu0YwueP6phVkBVhFR/cJdklHzkxxkBqSiFXhOe2P238vnhgod3JjJ
 lUqUaA0MTwSY0VJLFk0rzKdfa4Yo1YNBONhZDOCV+zNl2WDRFI+KrJpNZkQ7hqs=
X-Google-Smtp-Source: AGHT+IEipOfbNK9V08XJPCsd03wUBBzs9t3wZxjrqCsg9IqwLKFhr/huOTxY1ppV6pEIHt6ZJdr1+A==
X-Received: by 2002:a05:6512:29e:b0:511:4ff2:ee40 with SMTP id
 j30-20020a056512029e00b005114ff2ee40mr4008102lfp.2.1707302369783; 
 Wed, 07 Feb 2024 02:39:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVD8EdgZc3nksJaP0oIYnia74Z174M64l+MZjJP2i/5YDCnM3T2yVRG8smRau9je/Pk106Y6OLEaHc/LlYnctkgmosO3vqqIH0P5XoHGc1GbH+1Gb6d1n6ZoC3n/1JOx3hWM1siqixifmHRv15dntCs51lnl0um9O2dK86p/CZ6re2NClJo4yZivR4OsYuj9Cg/3gXKhZ35t9JsGFwscFx5WcGaewxtPA8lr5HlHk3nB/mz1vMtx84tV7Vtt30Ssf8Z7YgOXQaqrexJ+A==
Received: from eriador.lan (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300::227]) by smtp.gmail.com with ESMTPSA id
 z2-20020a056512308200b0051156758496sm135106lfd.92.2024.02.07.02.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 02:39:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/2] drivers: drm: struct bus_type cleanup
Date: Wed,  7 Feb 2024 12:39:26 +0200
Message-ID: <170730233341.360722.2569543187695193129.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240203-bus_cleanup-gpu-v1-0-1b6ecdb5f941@marliere.net>
References: <20240203-bus_cleanup-gpu-v1-0-1b6ecdb5f941@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Sat, 03 Feb 2024 15:25:02 -0300, Ricardo B. Marliere wrote:
> This series is part of an effort to cleanup the users of the driver
> core, as can be seen in many recent patches authored by Greg across the
> tree (e.g. [1]). Specifically, this series is part of the task of
> splitting one of his TODOs [2].
> 

Applied to drm-misc-next, thanks!

[1/2] drm: display: make dp_aux_bus_type const
      commit: 78cb1f1d19b600ed288ed7ad1fd7b9378302cbc5
[2/2] drm: mipi-dsi: make mipi_dsi_bus_type const
      commit: 2c8ba564a42c7418a726367c73d7c88454848fdc

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
