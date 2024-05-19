Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB088C96DB
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 23:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E0910E195;
	Sun, 19 May 2024 21:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mEJR+3B2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998B810E195
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 21:44:44 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51f60817e34so4276987e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 14:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716155082; x=1716759882; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iZrkjZRHsfmxgbK3walk1XdMRADgBjFWKUVLaZqtwFE=;
 b=mEJR+3B2h/BKiLzPV9AgmvmUkwo0BoVsTYI/2z9Nwm83ssJHMghWhTK+t9khCUgGLY
 ZZXz3eCx/vKyGeyURKpv0hjEuL71qPSyjXxPVIV3FHx03DnFv8qL/W6qUfxv3jUAIhGy
 qKp4n4pY68fLz8ojUwN3lp7UlFErDRByIxw7MWCJKJf8UjpkvHdXbBCL53l/Rp9g7qv1
 hc3A+Ti0648Pc/Sa8Ny+5h5DSnKAnjOZLecMKzJaxyasfwqyydJLzmQyROgiJEuCyjgZ
 HcTHFEhuXLssc6qruO0L9hYMxGAjMp/B2Vrvqpsnyk6861aJddng0P7sfnRgILcLwmLq
 KXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716155082; x=1716759882;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iZrkjZRHsfmxgbK3walk1XdMRADgBjFWKUVLaZqtwFE=;
 b=WJ3ONvHldkq62SXIdk1qc/vYEppFpj/cPZE1QTIJZroSyRxlMKzbfe7KuvBCyw+7Lg
 HO2LXsHhI4MBc9WnBH3/TNOR6UnUoNQhoPx47w1GxUKIjoeVO6nhKQLXTtmZfzLnSMSo
 Fz/u4snvJlvjgRrC4z1+bMrfne7CcoXLLENgYiItuj666xYyIZPmCJSD2EA8xvIOrROE
 UAbpeaUEUHc+Bu1zesP/Wfw9+batghuaCGstzlPCR6qsGzWd0Tn8Q12VpIdmrf+iH+lI
 ajY9b+x/KE/uD7UkIiWIrv4NudsIu8lYqfhy+qbQWzB9t3UlIMnoGmJcENCflCQ/QdVo
 MPIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFDlEqBZj3lmsXm/j+cgFPp6GmmR08scIhnwRH+IEa6nMbnHs7q+7yqeHFm68uzFQdCe/oKTv0QsVoQ5qNplTLQSkBA/MwANYhCVHtt6Tx
X-Gm-Message-State: AOJu0YyQHR/GI+gkRId76UopaY8jYClvo0zMFLpwLBja3qWWqQGyfcuZ
 z0Lcw3ma27FLQ7XwuxL8ctiW9U5opqBDaI6wMumYcx1GVArGfiRfkNAsut5ih84=
X-Google-Smtp-Source: AGHT+IHOuiyvikkf+YRll9mS4v1GujAEdqsCvFUwgxyyxkIYPx/CXF8ahRuYHA82wBImlUDB5iNHmA==
X-Received: by 2002:a05:6512:3b86:b0:51f:3f6c:7466 with SMTP id
 2adb3069b0e04-5220fe79356mr24519590e87.48.1716155082667; 
 Sun, 19 May 2024 14:44:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad4d0sm4047947e87.49.2024.05.19.14.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 14:44:42 -0700 (PDT)
Date: Mon, 20 May 2024 00:44:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/bridge: Add 'struct device *' field to the
 drm_bridge structure
Message-ID: <6khhnjtdcjvebnffrqlavowld4gvgcpnxplcinkja5xv3yefct@vjnmj72dfqtg>
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
 <20240514-scarlet-corgi-of-efficiency-faf2bb@penduick>
 <c44480ab-8d6b-4334-8eba-83db9b30ff1a@linux.dev>
 <20240515-fair-satisfied-myna-480dea@penduick>
 <d394ee32-4fa4-41a8-a5ca-c1c7f77f44d2@linux.dev>
 <20240515-copper-chimpanzee-of-fortitude-ff3dab@penduick>
 <2c15c859-6b2b-4979-8317-698bf6cc430c@linux.dev>
 <20240516-intrepid-uptight-tench-0df95e@penduick>
 <e955b706-04dd-479f-8327-32771d94f70f@linux.dev>
 <07b931d9-b11f-4829-a6c4-d5025fc071b5@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07b931d9-b11f-4829-a6c4-d5025fc071b5@linux.dev>
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

On Thu, May 16, 2024 at 08:04:59PM +0800, Sui Jingfeng wrote:
> 
> 
> On 5/16/24 18:40, Sui Jingfeng wrote:
> > use 'to_i2c_client(bridge->dev)' to retrieve the pointer
> 
> to_i2c_client(bridge->kdev).
> 
> Besides, this also means that we don't need to add the fwnode
> pointer into struct drm_bridge as member. Relief the conflicts
> with other reviewers if the work of switching to fwnode is still
> needed. As for majorities cases (1 to 1), of_node and fwnode can
> be retrieved with 'struct device *' easily. The aux-bridge.c and
> aux-hdp-bridge.c can also be converted too easily.
> 
> of_node, fwnode, swnode and device properties are all belong to
> the backing device structure itself. It can be more natural to use
> device_proterty_read_xxx() APIs after init time, Which in turn
> avoid the need to acquire and duplicate all properties another
> time in the driver private structure.

This doesn't sound 100% correct. This is going to drop the possibile
case when bridge driver uses child DT or FW node under the main device
node. For example of such usecase see drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c

> 
> We could do the programming around the 'struct device *.', remove
> a batch of boilerplate.

-- 
With best wishes
Dmitry
