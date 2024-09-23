Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE4597E5DC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 08:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D1110E37D;
	Mon, 23 Sep 2024 06:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qaqjt1MR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD6B10E37D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 06:07:57 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-535be093a43so4655168e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 23:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727071675; x=1727676475; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gCmO/YTjAtYJXPPaJsx5QKtYsIvj2q2oYXd++xIla/8=;
 b=Qaqjt1MR57gtiWMKNz6MP4r9AIjOC5E772Qx6b5uqCJy5FE3WGvyi70+ETqknwrAcA
 IN9yHtQPYvQAIWPaHhcaUxKIkarzID0KnNydJnsVLrWhOJXiMCM0VYDe5ExajB8jVCSl
 tdlXdbBneUHX2FfdA8aUknNYnMc1oLPSDoixvk3LyujGwn0SmAev/XtJCx02vuYtY6rf
 a9iPIFpcgu+zJQ5N8SvykQh1ntLRLlMei23o+HxoCjpx1EEMF9vhg3q/LYJfsgsfN+Qi
 /ZSb/Xs0HFu/nEKkxBAjSDcbouD2oecrrRDZydgWXMMoF3QNxC5Tv09XnTdtngLtrpcE
 4aQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727071675; x=1727676475;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCmO/YTjAtYJXPPaJsx5QKtYsIvj2q2oYXd++xIla/8=;
 b=IVZjW9NGTpO3XgbQV5mM8Au05krriF8ttaEBboeOZhhKI0HEokQzGV4aX3FbTOFNMx
 WOfaDNkgm3NIAcnv613O8qEpvrsLraBnxVUKI8nXGy20rJh9Upp+Coi2pOTRNwFJY6+H
 bi8wMwFbZxvOM0ckjzHrG4HA3jMBFpu2/yzMtqSeqtbPoDy6oabP4uZsheW8ohoVax//
 4TX5XEYERyIOCjiYlpjdULhH+uyIEiYErWK+7/As3FaMZyUAw948fEHn353ackXj2HNv
 GWII5ojXGBFFCHz+jmG/d9L8ELa+voGVv6+1MWj8jK1Ltb0TzOcItjO+Gebk2l4EsGcr
 zyRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeKN7O4kcf1NrAjusMn7vuPy0sGARFnrsf+dNcIhAJtAv+hKSziHnhuj9UlBaCbD6Hp+96M2u2cUM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydMzdhEfVCHZbW1qeDsxLZ3BDZekC9U/wQXTB2egQGOSYzuVAy
 PMffcMgWCkfEkxZG3Lu1QHzvxe2+YaS77J6gBCr6dAKdvZCsG1K0gxKIhO99ysM=
X-Google-Smtp-Source: AGHT+IE9nytSnroJiHN9xKcxla1q+HIPMXUfGMJEkQjc2qU3zMNEUmMCLyZt/tDAoafU+Yd8PgQ6Yg==
X-Received: by 2002:a05:6512:39c9:b0:536:56d8:24b4 with SMTP id
 2adb3069b0e04-536ac2d0514mr5129471e87.5.1727071675372; 
 Sun, 22 Sep 2024 23:07:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53687046624sm3172932e87.62.2024.09.22.23.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 23:07:54 -0700 (PDT)
Date: Mon, 23 Sep 2024 09:07:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikandan.M@microchip.com
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dharma.B@microchip.com
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add Microchip AC69T88A LVDS
 Display panel
Message-ID: <f4z2egmrcoh7kih2pyr3mq7fzuwtvod6vxlzzim2iw3ly7jcr3@2uxiyzlfixhp>
References: <20240919091548.430285-1-manikandan.m@microchip.com>
 <20240919091548.430285-2-manikandan.m@microchip.com>
 <zognzunciriytm3uvoolxjsvu43v3m2lnctsz5swusnmm3aj2z@ag7zkncccdmf>
 <83e9d20d-f294-4303-b570-816ebc989bcf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83e9d20d-f294-4303-b570-816ebc989bcf@microchip.com>
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

On Mon, Sep 23, 2024 at 05:50:22AM GMT, Manikandan.M@microchip.com wrote:
> On 20/09/24 9:13 pm, Dmitry Baryshkov wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Thu, Sep 19, 2024 at 02:45:48PM GMT, Manikandan Muralidharan wrote:
> >> Add support for Microchip AC69T88A 5 inch TFT LCD 800x480
> >> Display module with LVDS interface.The panel uses the Sitronix
> >> ST7262 800x480 Display driver
> > 
> > AC69T88A seems to be a module name, rather than a panel name. What is
> > the actual panel name present on this module?
> Both names, "Microchip AC69T88A" and "MPU32-LVDS-DISPLAY-WVGA" are 
> present on the display module

Which panel was used for the module? I don't think that Microchip
produces LVDS panels.

> > 
> >>
> >> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> >> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> >> ---
> >> changes in v2:
> >> - replace microchip,ac69t88a-lvds-panel with
> >> microchip,ac69t88a
> >> ---
> >>   drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
> >>   1 file changed, 28 insertions(+)
> >>
> > 
> > --
> > With best wishes
> > Dmitry
> 
> -- 
> Thanks and Regards,
> Manikandan M.
> 

-- 
With best wishes
Dmitry
