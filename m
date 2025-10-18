Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CABDBECFAF
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 14:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3385810E091;
	Sat, 18 Oct 2025 12:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V341xtMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8841510E091
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 12:46:06 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4711f3c386eso9894685e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 05:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760791565; x=1761396365; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NRDae27n+EW9z3sFe7xVTYXCCUSru9GSplX7TwKn6SY=;
 b=V341xtMFEr7CuO6Yd7epSvHNWvT2cOtLpgzadroTGTWGyNTTyLZ2vG8uKKn9cdP+bm
 QJs0HV2CkZAq335EHnFb/1Bu1oUyYekLIlU2OPwGIkTTnt0iVwtpwbTUPfhCCZfdJAdH
 d8RAdrJYl63yT/3lGvwQ6VplGxsLNgTYjAsx/SZHgJ9GhDcgeFJsDRkynVtwLgqVU+f1
 JHXYXS6YwwFwoV5X6LL5KFmo4rMnbuXfTp+l31GobCoE4FOR8yCTXEHSd9/gWeW8f0r/
 cGwwtedkXcZjEQeiVzp1MCevJxcnkq5XkNcgPinWTeksSmPIKCtWf9V/wpGe/+UWBtnX
 0Qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760791565; x=1761396365;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NRDae27n+EW9z3sFe7xVTYXCCUSru9GSplX7TwKn6SY=;
 b=YJ9+6lop/SYNQMxmn1fuehroYxIqGXYgUnJ/l0SP+GwFvYNMPsmoRLNdoPJvPd/I9F
 tu7iV+zZX0A0QaPO3nS2iFLcaZESvHumCEwPBAJz1gdrFAJ/4na6OUvgckpdN/cJG/2T
 6qdWJU2zKVb6CEIR5pcx0D8NqPmNt29aawt2nEyo2/s5L+SF/XZOga9KWnb9hWr0fc++
 GAI/2Sqt+dsb/XcAsrnD80RPadHI0Iy+A53oeVVFl0TVzt6LOcr9fi4xZlnb2hp8KnHE
 6w2/XbGhgNX75wn+bERN+Gm50vXSgJWGWMH2C/SnSLdxH/z3c1vCQ4Q2XnTejzEpHamK
 /GEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSkS18X+4hG6x8VXkFbofyZZTALGR2O3DWvHCtYLnM7frrirr17WguTp4H3oddhMMPqtk7AFD2dZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3jrEdrRDSw8m14mgiI5T/zmIN220jMO3pko8Su9b6+ojoIM0+
 QY+lC3Dcudfjd8S+NA6SeR97Xs1owjc/j1XoJ9PSS1uGj4cz0LgadU38
X-Gm-Gg: ASbGncvsJXnYfp1gX6ylpZVjxdZE3Gn+Ij1irAOIdF1/W0S4TyEXNIEMcc1KZSUMqcF
 JYdJu6cUqJl2amQUsdmaf06XZke5fxshtam8vG0+AluT6NF1udIqrVHUyA24ylnAXizGA3AmdQJ
 xxg3Ut3gbHASwGi8t+nPjonKMRf485OGdCtgMrv+79uJXuW269i/dE/++MqC5Nq+wMz03fLd2KP
 TV0kJg7+bmxAtIkFYVefjEZhdykYbXf5fCxiP6SOUnHlX+1xy7WHNQcYxHTmN53nIpJZza72sS/
 407TogvNMV85ULy7mefMA9oigEAeCYiG1Sj4ACGzNejrDznFCd9+iYqwzRH3EViSobta+6CPJKP
 C6jhjaAgLh+FEo88HUpE70hCg22yyZnuIhxDZhgwSe3pJEKAXmbS7lf6KBKSC8jcF9vx5sqTkcS
 pwakDxQzZuDm9YOD2g6ljzdpoXTffewHYYxmsCTONQabsBMiUTdEfXNhBKw0c=
X-Google-Smtp-Source: AGHT+IFyFnknhz6DJpA/W+HnNJLeyvUwLECQ2dA/m7ZFwdVON8k8RALCON4xRrvUX069kqPawyiTZw==
X-Received: by 2002:a05:600c:3b83:b0:46e:3d41:6001 with SMTP id
 5b1f17b1804b1-47117925171mr75159735e9.34.1760791564682; 
 Sat, 18 Oct 2025 05:46:04 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:2acd:89a8:83d9:4be5?
 ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711c487dfesm106194605e9.17.2025.10.18.05.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Oct 2025 05:46:03 -0700 (PDT)
Message-ID: <3f97061a-4156-469e-b062-d6f7e68d4ad8@gmail.com>
Date: Sat, 18 Oct 2025 14:46:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/sti: hda: add bridge before attaching
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-0-92fb40d27704@bootlin.com>
 <20251003-b4-drm-bridge-alloc-add-before-attach-v1-1-92fb40d27704@bootlin.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-1-92fb40d27704@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



Le 03/10/2025 à 10:59, Luca Ceresoli a écrit :
> DRM bridges should be always added to the global bridge list before being
> attached.
> 
> Link: https://lore.kernel.org/all/20250709-sophisticated-loon-of-rain-6ccdd8@houat/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
Hi Luca,

Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Best regards,
Raphaël>

