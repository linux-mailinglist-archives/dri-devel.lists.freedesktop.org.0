Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80654A03DF6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 12:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E9510E3EE;
	Tue,  7 Jan 2025 11:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZV5RcRru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C9B10E3EE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 11:38:04 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso17033307e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 03:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736249823; x=1736854623; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=o/PYRxsMYOI6HMRaY2mnjWULMAox9UZwOEIGH7JXfww=;
 b=ZV5RcRrualRisDrL9/wkxRoojE4fqk/LOrWlS/adfOBD9WebeZm+gt7Kzngme6rf1j
 W+0lKl2+IxrkDbTSI6CXTuA2hUYCHoQBaCh63VFNHR93SRcPFduQrUIpbWgQuodgmyZz
 uYAV5ykCgQZ2faKf+HHhwevy4gFZHB51nlh1b8trnWP+b1RaGrNaDDGQNtbqT9EoCsIZ
 dojKlg+OMGB/RDmv3GT1bIuUPogai1UzlyvUNSnuWTlkmhxeGElFE1ybNYPaFIboZysK
 AguWahP4cbsKlfO5wk3um5z7jri3MsvA/0RGg71zBGJkvRt1qOw43kHSsmhX9SvJNaYp
 K3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736249823; x=1736854623;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o/PYRxsMYOI6HMRaY2mnjWULMAox9UZwOEIGH7JXfww=;
 b=B61gP7p9zSlkZxhhRLGYetDNHr9rDtzddacCR2lP6WAdTb9PKVhzDYw+0xSvC7Ap1T
 cJAR4BZggdLi3+VPjKdcNZg/+hf65sDtHRREugUQw9YyfQXU88S4Bo6JIShyMvIucMYU
 XAGBr++8ieB5m4gKw3+A/1s3AfWFd/onXifkrOBrebB2LC1ZZg+R48zQPGO1IF1WmASM
 ALP3EEXJ8EINKq0ugNJTwV9BWS0qgcAVjHhVBGiAq+B2ZwkD+NfvdpW09gBOJ9LTth6O
 j/pQKlrzbQCORCfEwBf8p1h/FJrtlf3IidtDm5Lg57Gu9WkUkgclYqQEJ1i3oZwGi5C2
 AGOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEgJ8A9w19kIjTfQLu6CEDAqeup+2Klo6oOh4TjiYhZwExjEwtAXk1ROqIbhvdW7sQKBULy6AkOZU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4qsufalvRfs4GPnHlRRme3aIAHgm/OhK7IGGLYdXThoe4SnPE
 TQ0gGFzNozFw8pbPJ0yBiAjXYcAB3SVwxSVnM1dM4TX+BP8BPCHIgC1H9RmPrdA=
X-Gm-Gg: ASbGncuA111HKKznUS9Ge2FO5C4laHb7iSCLkvkYgjajLLg0B8cT9MIFh5z1MgBsDJU
 o9KUoU0IPb3+Ct2OQVSf1YP6/bQYjTstx1m0ahLwWBkeERZGrpFwF4G+8hyT5BhxQQpB4llGXqg
 c3D9IyqOcqCAKAb84vZFJZ2T4vZ3NWC5g9+AW8BK4+ln7GUfWTC0U2Kq17rBtzmlr5uT7wX4Ifi
 9Gie+GCJOq4NIjVeLLhxe9UZYLusxzzOrOl9i7pAZjn80KDtnxE8x2gUC3+6MXfFXoaE2/3daMp
 lMDLsru8zU/n3pkXYwaysnXlqLjTaGnxgJ5Y
X-Google-Smtp-Source: AGHT+IEqjZikjGljv5hNpFIZmUNE1YEc+DHgSbndWE4bILAQC6OmXd3/2r+BwuoHM7Of4+6OQXWByw==
X-Received: by 2002:a05:6512:3049:b0:542:250d:eef2 with SMTP id
 2adb3069b0e04-5422953c2f8mr18389002e87.20.1736249823170; 
 Tue, 07 Jan 2025 03:37:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223813898sm5127012e87.154.2025.01.07.03.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 03:37:01 -0800 (PST)
Date: Tue, 7 Jan 2025 13:36:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 0/4] Fix ycbcr_420_allowed inconsistency for HDMI
 bridges
Message-ID: <fvwc3jpwizqp5b7nzoiik3dlokyhy6zvhjzwnx4dxe4ock5t3o@pcmfq2tzmyek>
References: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
 <f432ddfb896acf0dc91eb0e7f974a97e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f432ddfb896acf0dc91eb0e7f974a97e@kernel.org>
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

On Mon, Jan 06, 2025 at 02:55:52PM +0000, Maxime Ripard wrote:
> On Tue, 24 Dec 2024 20:22:40 +0200, Cristian Ciocaltea wrote:
> > Bridges with DRM_BRIDGE_OP_HDMI set in drm_bridge->ops are expected to
> > rely on drm_bridge->supported_formats to advertise the supported
> > colorspaces, including HDMI_COLORSPACE_YUV420.
> > 
> > However, when drm_bridge_connector gets initialised, only
> > 
> > [ ... ]
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!

I thought about picking up those patches, but then I deciced to ask you
first. I think first two patches should go to drm-next-fixes? Or just
drm-fixes? While the last two patches look kike a drm-next material.

-- 
With best wishes
Dmitry
