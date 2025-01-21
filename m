Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1CFA17B8A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B9210E53E;
	Tue, 21 Jan 2025 10:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yxmF/LxZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EFA10E53E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:27:07 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53e384e3481so5394106e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 02:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737455226; x=1738060026; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=94oIgW/NBTeQj75qD32Hoj/Nc7NxsbmOHJRT87x3mhE=;
 b=yxmF/LxZ5T1iYFVr6grxpyCTTdqt6qEnaNah79aFYa/OvhKTAMrXp9fKuh441XVC+A
 19IHh7hHKpurT2liJSJRn1pid5z1PbMmhfdpnIow2nl2cuEtRpT9XgjkWLKW3oNkjrLo
 Lo1CKP56jkJv2q+dn9NcjowA3ThDDO6yrBUJDN4Jhpvn9q81xHeJzZiX95f5djKtx+LA
 klLZM6VW3d7UUWqHZcPDYCktDYM/Nt+2siwSNRDBLRNaTkpxITf52fxvU9TwCxZrB/ik
 v462KEKwQN7mioqGbglQpxeyn4u9B96GFzc1N4sr59XX1QjDWJ9HRk6A0eBd5AjDlj8z
 j82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737455226; x=1738060026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=94oIgW/NBTeQj75qD32Hoj/Nc7NxsbmOHJRT87x3mhE=;
 b=JF5h7D0WANXQIGyD9VarEVW/eAYW/hZamLS9RxsX0T5pKzfpfd3inhzA0kN+SV2hNY
 cTiRs2lRJmFESYw+9SN/6dgg/Ic13HqLvaTiNLe6kWbTqV4Ji7w9VNpBdW2CH+TWZtY6
 a3ECwgXjR/GLwy/2GohPT2tn74JYytoKZc1EMPnI17uMnrjOK93nxyStbz2/1U/JH4az
 prsvIFGwQm+Jbivxf4DMeXdLtnkj6qNOsxfBsLJqZWs5Jof5J8FzlW8viJiHrP0X5xCV
 iSErgj1nyOm1x1F2ZASGqWzU0bP1M3cyMOt1625QLE0vk0A6Mvz6dKuMmVkqXME2eIuU
 Ak0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi3ZSxO7gAnzu8RTLQiHHYm/cx8aUnEIrvt9fR0z2lR6hKJ6636SRlyZrwzbQRDAGtrCLJM/kvmdI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjNt9UiX7zz+uemm7O1GhE1Y2UxY1zBVHWSfaet3e9/W4Tj5C/
 /+lM2QAWcbiz+WYcc5zn5bqRpg80m5gha4F+vdSsviffh2bp+rECOuS1B5t4rKk=
X-Gm-Gg: ASbGncuBFbwK1SiLZfni+25SmS5MCVo8alL6p4hImlGrWjKe4F8unFaq9MpLhnlGqKG
 S3gFlguNcGCsyBD/bbSkvNLqCIEMauZp9FW+ZPI5+fYRISoY2LCxYk7NLty8jkXJa8oX2E5Rvar
 9biuLBnh0/iYYfdIZP8LlK+4Ik20GLCLEK/xgR5W2C1QCzsQYk4YmnYGTJVXXY1q1oap671EDAJ
 hLpUNqgEaqzZgwduMMZR+V6ZBVmiiUIg46kK9vPo2ULNH9RWFb9++Ypih8gVMV6aj1/t3l1l8rF
 cOF2t08LThjf12mFVIlp2IwdfuLP95zNZXYpldI5DrZ3ZTODsA==
X-Google-Smtp-Source: AGHT+IGf6gpXp4j7/QoRw0NoRBg5vIUXQm1Txj3SSQ1HUtqBQpPYNmuaEk9NWMvNJs5HkaKKsqorWw==
X-Received: by 2002:a05:6512:1044:b0:540:358d:d9b5 with SMTP id
 2adb3069b0e04-5439c1b8487mr6209525e87.0.1737455225656; 
 Tue, 21 Jan 2025 02:27:05 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af067f7sm1790153e87.10.2025.01.21.02.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 02:27:05 -0800 (PST)
Date: Tue, 21 Jan 2025 12:27:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/bridge: nwl-dsi: Set bridge type
Message-ID: <r4jiudi62bjpsaodcwxiylau3lort3xnnal2felxb3v45hfcin@iz27fooyblv4>
References: <20250120132135.554391-1-alexander.stein@ew.tq-group.com>
 <20250120132135.554391-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120132135.554391-2-alexander.stein@ew.tq-group.com>
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

On Mon, Jan 20, 2025 at 02:21:35PM +0100, Alexander Stein wrote:
> This is a DSI bridge, so set the bridge type accordingly.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
