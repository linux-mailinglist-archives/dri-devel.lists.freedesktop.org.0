Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 823769F0A11
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 11:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B4110EFB9;
	Fri, 13 Dec 2024 10:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FT47pd2+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB68E10EFBB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:51:26 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso1794433e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 02:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734087085; x=1734691885; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LnP8gFtJmpG9uae63t0E5cLFvDIYUTdp96d92xuKYIg=;
 b=FT47pd2+DkeDquG0BjIfNOMnmF2/v456/6oZ30FzC0089Fq9xtjzAndCeCqEv+2TZa
 7mTVh/YSWnsVnLWZCL0yVaD6vv+xiaLpYSHXK0PJEk05NOlKpEGJJIIbfz276kYyTH2/
 oAk1GBjJ69fUbm1dvHJzZ/XmpKAowq0nc6DaAjrCSLK/+NIsvWaumT0YvYp4N8W1I0KK
 vKHHcCLKeTdujl4VYGYoxRcWDOAScwYh+QXpclNNNCfSJhb+t7yUAeOnMouCeYO4SuHR
 7nAroYhUfPeHqKdY/JDFwl3JnOL/+VulDHxv3CtJRYI46nhvnOMHl07BMN7TWh5A3iCq
 traA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734087085; x=1734691885;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LnP8gFtJmpG9uae63t0E5cLFvDIYUTdp96d92xuKYIg=;
 b=a8Xs8bzKtChDe2A9nfxy+JU+IzUa9zTM0a7wDAAggd1zYbKxC7fl8HAahwQQWtD8zb
 L4yMQVQTrWNz/z2EPG76j3dw1Tjk04jVoyq15VN+sz62LxnhGN0vQ4R8EkuuBQYwcA0M
 euUtkXlJO6ikaGEaeu148IwC5g27lrQQNgrlcFMmYkYhmYNr7SoxzFb+cL61qzOocjcs
 VxgU42ujld6mJgBjvkjcy3PS+l7/Er1C1WHmQgqaaqqmz1VvnJWy7nWp7hyTcaL25ts4
 JeYglGy5l7q/o7eBeDAAyDfVHYuyEdwb1zzhXJ9ZBe/CRMMnpr0LNh4hEQTN+LehHFkK
 qBrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2She5eQhg/3yI1RZp2E7mnyIeXV2HMNl8oAZ49fG2gKS9RyplDC0MNN1gXHXRd230a15ACvgPhqE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbZK/NDcn53YEdZdxfg+GWcUsrWOqj6KRttr94vOK9Cq37BXhh
 omYWD4Yd/qwug5bVpnYSgtH2XzmDrBlVLPXhhKxJoTbt+jlVp5bX0JQd4U2VMqE=
X-Gm-Gg: ASbGncuG3IAqKpLaEFtv+wPAkoJROdk9d6AWfwwhRXy1wmUvqdQtN4iPiz/vnt8C3zy
 /0pej9jXEv5nun4H+ej9uYkmdzCT3jLizd+UKuP238eQ6v5wK9PXGG/M1cTVewlEq8LXlC8MbbV
 8GS7c9i+OuuT7MYaim+sOZLa6KVkEwPBne9BJob0bt+uePTa7ccnQ2G5lFwvFBD4bE+gvOI37Ku
 hwNboxdNXq6hJWEIRJqHQaooQdd6V1p0eDYGruFiNGxwZckYNq6M7Z+Bvmk6jdfeK+5fAu95J7U
 oAzljtSoXiRdEYi9IQY9MSqBLUmVdpQAmvft
X-Google-Smtp-Source: AGHT+IEDuFoGLuIuP53DhPi1O/BDv4/qO5VgR1m2bdJZc4tElHnfEJBCyfzGGLUAk8FR/PQbgsVdxw==
X-Received: by 2002:a05:6512:3996:b0:540:1d58:da7b with SMTP id
 2adb3069b0e04-5408ad7f99dmr551790e87.11.1734087085029; 
 Fri, 13 Dec 2024 02:51:25 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e44a45769sm1996851e87.60.2024.12.13.02.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 02:51:24 -0800 (PST)
Date: Fri, 13 Dec 2024 12:51:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCHv3 01/10] drm/crtc: Add histogram properties
Message-ID: <cn63on775l35olcywzhwx3hzivve4ch7h7edp7mvnn3l5x6e2i@z34t36lr2ktj>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
 <20241209162504.2146697-2-arun.r.murthy@intel.com>
 <7tho6j262nzbu6nvjgzelsu3ljjipxdhazjlzdfa3xi2lbn3vs@bx55yrrbmshg>
 <IA0PR11MB7307E1C101F417CFAE3B114ABA3D2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <l6dpikqfgwlio5rungx4ckvw524woz4mybkiqfp4k5fpkokj2c@zox6yfhxnzeh>
 <IA0PR11MB73078417607420EC685A4C73BA3D2@IA0PR11MB7307.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB73078417607420EC685A4C73BA3D2@IA0PR11MB7307.namprd11.prod.outlook.com>
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

On Tue, Dec 10, 2024 at 05:52:38PM +0000, Murthy, Arun R wrote:
> > On Tue, Dec 10, 2024 at 08:42:36AM +0000, Murthy, Arun R wrote:
> > > > On Mon, Dec 09, 2024 at 09:54:55PM +0530, Arun R Murthy wrote:
> > > > > Add variables for histogram drm_property, its corrsponding
> > > > > crtc_state variables and define the structure pointed by the blob property.
> > > > >
> > > > > struct drm_histogram and drm_iet defined in
> > > > > include/uapi/drm/drm_mode.h
> > > > >
> > > > > The property HISTOGRAM_ENABLE allows user to enable/disable the
> > > > > histogram feature in the hardware. Upon KMD enabling by writing to
> > > > > the hardware registers, a histogram is generated. Histogram is
> > > > > composed of 'n' bins with each bin being an integer(pixel count).
> > > >
> > > > Is it really a count of pixels that fall into one of the bins?
> > > It's the statistics generated for each frame that is sent to the display and the
> > value corresponds to 5 bit pixel depth.
> > 
> > Let me try it once more, but this is becoming tiresome. Please provide a
> > description of the property good enough so that one can implement
> > HISTOGRAM support for the VKMS driver. You don't have to provide Intel-
> > specific details, but the description should be complete enough.
> > "The number of pixels falling into each of the bins, sorted by luminosity, started
> > from the brighest ones" might be an example of a good enough desription.
> > Then one can add such functionality to other drivers. Just saying "statistics"
> > doesn't give us anything.
> > 
> This is a hardware feature and hence for other drivers to add support for this
> means that the hardware should have support for this.

OpenGL, OpenGL ES, Vulkan and other libraries also define software
interface for hardware features. However they define it in a way that
allows at least software implementation. I'm not arguing about the
particular feature or its implementation. I'm not asking for the
_hardware_ description or any other kind hardware-related information.
But I really want to see a good documentation for the userspace
interface that will allows other vendors to implement it in their
drivers (including my example, VKMS). Up to now I have not seen a
definition of properties that fits this criteria.

> Each bin consists of 5 bit pixel depth.
> Example code of how to use this histogram and increase the contrast is GHE.

Yes, I have taken a look. No, it's not a replacement for the
documentation.

I'm really sorry to write that, but until the documentation issue is
resolved, please consider this patch to be:

Nacked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Thanks and Regards,
> Arun R Murthy
> --------------------

-- 
With best wishes
Dmitry
