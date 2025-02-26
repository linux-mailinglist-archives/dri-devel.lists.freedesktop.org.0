Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6675A455BA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 07:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFE310E0E8;
	Wed, 26 Feb 2025 06:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qNPAYkio";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F43B10E0A4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 06:38:44 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3061513d353so67899621fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740551922; x=1741156722; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vdAWglkpNWkKlfVQY0b30qa+fHtrIyjn4IdPv+J5KmY=;
 b=qNPAYkioXwBL/FnETmzn7n9srtqoCXtew+WJ1LIvnciSzXfetyXZVLtnXtaECfssBw
 fYua0Lc5Y9PSUlEe7TNSMAhm1OkgZR59Lneoq8fnKSMbYLOvWUJerAEC7c52/YVuEUm6
 YtWeyF+fAOqkJdJo8+TcexzzU3ZnaN4XuyhwbJkqIHgVXIqXDzswI78pdz7gb0yvFAN8
 caXdKpln4GXQjdvsEVcSH519UPtcCujKkl8OyhjMGrD9zYHnzk8gRwgjd1IlVC0rHQXg
 EQbfe2zKA1FNbgaBPJT/twKm/ntrfnMRfkQHK2mdQgzhamaKq/swpLJhdV/xUWhQnV4n
 7ZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740551922; x=1741156722;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdAWglkpNWkKlfVQY0b30qa+fHtrIyjn4IdPv+J5KmY=;
 b=ZpK8kRJMFcwTrN0yyr+X8QR4d5R3EvF0CezvUFAEwT+OPxcxabN3RM1ij9DnXlUVu8
 bcEvdonz2kBtPOisdbsyXZHzaQLAn0GfkwU/V9MUJFa8HVzE5SoU5ZIqsIp0kNa5/IRz
 YGJBQK/QGXLZbOJ3KnlTEZWGtoTsB6GaYr8spRAej+Q6OHlec1BF4k+56OgbZd/Uj/Yj
 OtZxUQEs6J3WUkzRjpYn+zsNc4GFzPUB+iQqmyXJFiJJzE6GsNdcG9H6QoTd7y09taWN
 ecJ7lZdEZ7uWBipJZxLzGQBdKIhzvLlCbR1XRoSoEVB2qX5630AKyij+MkcrkcOJT2CS
 kUaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0AEembhbb5TlF7GSP8e02ifTFhivi02xsGSKQclfvenrUsvwo06dq7YiiB/0mQodkAQHNSHilsms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEzwM8KkvVHsPqXsR5ZDO5c8T++CCLQWmApBihexBO6mMLxDd+
 uG5+PE63b5agESFtogmvcgR84Y8j6XPA+Wmk0YmXM7lve4eZv1y3LCbkG7oQ2mw=
X-Gm-Gg: ASbGncsQnGS1VyMVLzIj9GU3osSxacNQdfsFf7aohbrW44ZLrC5xcds93V7mBWKNlP/
 Lw4dKD77PlwEnCTgGrrGARXnXHlD/3pE1qZjLXspAkqN5Yve6ogtr/hPyjCfgMWodhAFJ8i0Tt2
 cXnMT/PKZUrigY1lNNinxZn79cEQiw9Ix9pMpWi8x2WHh8MxZCNuU6JjH3+0TpgLR6cP9WWQh7Y
 jq1F1PPcZRe98FL8RbAIw8Ze23FLV/k/zx6FoRqZOe7+RNmP2duMTe0hAV1rP7eJW5XtZ+zwuMq
 L3n8QCF1VsiQW8mULHvG84Al/s4SyOfBf8rkH0c28kD73kbzj8Fzd8KVMlMvo+DXSp1aeu1kXRZ
 nou6TDg==
X-Google-Smtp-Source: AGHT+IGIr+d6iAad7GGGqJtdFIIrbosoSV2T/fF6VruZ1PJO3g36OWay8E3V9QE+EEdkJZgWoEXISg==
X-Received: by 2002:a19:4314:0:b0:548:f3f5:b26a with SMTP id
 2adb3069b0e04-548f3f5b333mr2954664e87.50.1740551922133; 
 Tue, 25 Feb 2025 22:38:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514fa94bsm353388e87.249.2025.02.25.22.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 22:38:40 -0800 (PST)
Date: Wed, 26 Feb 2025 08:38:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 04/15] drm/atomic: Introduce helper to lookup
 connector by encoder
Message-ID: <qskzti5jawqioug2jw46zylnax4uxoczvqolwqgbseflqaddze@3uke3rkwbpzs>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250225-bridge-connector-v4-4-7ecb07b09cad@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-bridge-connector-v4-4-7ecb07b09cad@kernel.org>
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

On Tue, Feb 25, 2025 at 05:43:52PM +0100, Maxime Ripard wrote:
> With the bridges switching over to drm_bridge_connector, the direct
> association between a bridge driver and its connector was lost.
> 
> This is mitigated for atomic bridge drivers by the fact you can access
> the encoder, and then call drm_atomic_get_old_connector_for_encoder() or
> drm_atomic_get_new_connector_for_encoder() with drm_atomic_state.
> 
> This was also made easier by providing drm_atomic_state directly to all
> atomic hooks bridges can implement.
> 
> However, bridge drivers don't have a way to access drm_atomic_state
> outside of the modeset path, like from the hotplug interrupt path or any
> interrupt handler.
> 
> Let's introduce a function to retrieve the connector currently assigned
> to an encoder, without using drm_atomic_state, to make these drivers'
> life easier.
> 
> Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_atomic.h     |  3 +++
>  2 files changed, 48 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
