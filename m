Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A21987B99
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 01:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2F010E0D1;
	Thu, 26 Sep 2024 23:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LtVY8vmN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E5C10E0D1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 23:21:25 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f75f116d11so18191711fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 16:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727392883; x=1727997683; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Hj1ddZeOtN7zDwMwktNYFtzm3Gh7Tekdeg6sieYs35g=;
 b=LtVY8vmNgqtrQeHH18H7O4B7kTTvufv9XqGBwEKfjzQJq4WePngxc8/mKTTsV1udci
 DH+wyhjAmKygEXJ61AixRuh1vNlSun0o7x1ufKvSMQ5cokHM9D26eivcDFbFqt6/peEN
 9X2ptEj4mVzCc3/ntrd7+SHCTn/sci+OYEQSMGAFM24nD9C7dCgLbmWT43SwucVxh262
 sCw7JyxHozREr3kUwoSvhIxyJOe2RMs8l6CAlExlUrF1mBgYjAKapacZPCcRZW4H0+sr
 2v4xwsIfu6SYFE2fYtzrFE/5j/wbJ6xGr/wIJ5I3ro30EyZ6TeN3pGVEr6qxPROX6Rz8
 u9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727392883; x=1727997683;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hj1ddZeOtN7zDwMwktNYFtzm3Gh7Tekdeg6sieYs35g=;
 b=an8P7QnQZJ3VhICM134zj5Ul2O8NeXOdI/fQM1+Jg98+ay7hDbIBNmQ/hJLZHzpzuJ
 JFPgclwBmcCts6P31xGPfM6hsUvTwIAVYAbtEQtMLjC/9Fbbat3yp2JA3f8pvtAY5R7H
 NY98POkpl9I2E8M/rRGF43dUQcXezHH0hDonCjY7SRXkLLtzHmVjOFJJwRbY9Pi0g+JL
 r6VQJOpeGVVyGmJCSrht2FceADN8lqxmGjI5Bgb66UBVFvOnxf18PCtUAsw0IJ8yo7Ls
 Ws4f93IO5pI+1a355wibG/VUSGfr/7IP7Xp/+pjiJZARmdgiifXqKptFDs6HhSkaK/j1
 HAKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+n9nkXnCjRLQhqXRj2nhwcjgUibEZUZIcChAh0eZfnvqrImJTjkq0ZsGGpHAZ2uH/udzlASuC3X4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/byre1orUkZWUPkQvNPdDABd1G4+FWNwgHCflv5rMu6vhZSCc
 AH26gccGTGb4qPFgUKKQSzg30emNkzhW507MfmCnfM9D9xht9FWDvmU8ezcxffE=
X-Google-Smtp-Source: AGHT+IELK0Z3Oj9K6pV3soLuC1gTs0dfJ9rdKZI8pDVBtLZN2FDIDBgtVuAsJBZb02BkKfXRyruufA==
X-Received: by 2002:a05:6512:3a96:b0:52e:9e70:d068 with SMTP id
 2adb3069b0e04-5389fc29c84mr797475e87.4.1727392882552; 
 Thu, 26 Sep 2024 16:21:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a044159csm100729e87.263.2024.09.26.16.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 16:21:22 -0700 (PDT)
Date: Fri, 27 Sep 2024 02:21:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Manikandan.M@microchip.com, neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dharma.B@microchip.com
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add Microchip AC69T88A LVDS
 Display panel
Message-ID: <aehcvf55b52p6u5ai3uri7jzo2dywdhv6mxo4pxz3lhajjoxqe@izk23gt2yvdn>
References: <20240919091548.430285-1-manikandan.m@microchip.com>
 <20240919091548.430285-2-manikandan.m@microchip.com>
 <zognzunciriytm3uvoolxjsvu43v3m2lnctsz5swusnmm3aj2z@ag7zkncccdmf>
 <83e9d20d-f294-4303-b570-816ebc989bcf@microchip.com>
 <f4z2egmrcoh7kih2pyr3mq7fzuwtvod6vxlzzim2iw3ly7jcr3@2uxiyzlfixhp>
 <17b5a11c-b9a8-4172-831e-d52f1a4270e9@microchip.com>
 <quxjqmx5yc27cxmjvnq6irltr36josag4yltxbiweh4femqbqo@j34pxmfxglc5>
 <20240926-foamy-oarfish-of-passion-ec6fa2@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926-foamy-oarfish-of-passion-ec6fa2@houat>
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

On Thu, Sep 26, 2024 at 03:58:11PM GMT, Maxime Ripard wrote:
> On Thu, Sep 26, 2024 at 04:32:59PM GMT, Dmitry Baryshkov wrote:
> > On Thu, Sep 26, 2024 at 08:17:09AM GMT, Manikandan.M@microchip.com wrote:
> > > On 23/09/24 11:37 am, Dmitry Baryshkov wrote:
> > > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > > > 
> > > > On Mon, Sep 23, 2024 at 05:50:22AM GMT, Manikandan.M@microchip.com wrote:
> > > >> On 20/09/24 9:13 pm, Dmitry Baryshkov wrote:
> > > >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > > >>>
> > > >>> On Thu, Sep 19, 2024 at 02:45:48PM GMT, Manikandan Muralidharan wrote:
> > > >>>> Add support for Microchip AC69T88A 5 inch TFT LCD 800x480
> > > >>>> Display module with LVDS interface.The panel uses the Sitronix
> > > >>>> ST7262 800x480 Display driver
> > > >>>
> > > >>> AC69T88A seems to be a module name, rather than a panel name. What is
> > > >>> the actual panel name present on this module?
> > > >> Both names, "Microchip AC69T88A" and "MPU32-LVDS-DISPLAY-WVGA" are
> > > >> present on the display module
> > > > 
> > > > Which panel was used for the module? I don't think that Microchip
> > > > produces LVDS panels.
> > > Its a new LVDS display from Microchip that uses Sitronix ST7262 TFT LCD 
> > > driver
> > > 
> > > https://www.crystalfontz.com/controllers/datasheet-viewer.php?id=486
> > 
> > Ok. Anyway if somebody ends up looking for the panel, they'll probably
> > find the module and vice versa.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Given that aside from that mail, the module name isn't mentionned
> anywhere, I'm not sure they would.
> 
> The way we usually deal with controllers is to have a separate driver
> for panels based on that controller, even more so since that controller
> seems to be able to affect the display.

But in this case it's panel-simple, no special driver for the
controller. From my understanding the AC69T88A is the module name (at
least the datasheet uses that name). The on-board EEPROM also carries
that name and the name of the controller.

-- 
With best wishes
Dmitry
