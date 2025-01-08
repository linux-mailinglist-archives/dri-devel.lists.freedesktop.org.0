Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF04A051B8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 04:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FAE10E3E2;
	Wed,  8 Jan 2025 03:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wcuMkGgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4115C10E3E2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 03:48:03 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-aa67333f7d2so2382978266b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 19:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736308022; x=1736912822; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=stDs0TSz4aEAipwsN6sZsg3hsDGWBm0SrvPGkX++BaQ=;
 b=wcuMkGggSOnVNo5+jsHkh0bq5Xg6kahDouc65hDSaFwrNLl0c8PGaSdyjEesjO4ULF
 4MfRADP6Bkj/9P9fwYlHhPQj+ZBLqhevBqvVMZT02SuWV1Zd+S2XjPweCl7Trad/GMKx
 3L48YhCqME4UocLV3IWxebiMxWQdfj2VUXxWzTbDxN0dT7il+GVWBQ6LGVdHk/7GQugN
 oZFsRKgpko8miAkEot+Ryext0I44PaV77GA/D+LtAifedj1OWjW66+rRRCDvztonM1z4
 qyLBibczLa8F8bX2b09w2ien/ByTtjmieL+/GeHc2oPIyPSToqW6FCUfFNIEmmIiNsjb
 Vgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736308022; x=1736912822;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=stDs0TSz4aEAipwsN6sZsg3hsDGWBm0SrvPGkX++BaQ=;
 b=Dz5b2rTM3lcUXcbH0kD6/OMD25/nlUWCRBcOIz+ixCTayY5YGN6ifzgtICSn7BW1JA
 9w1HBnUoLJ/ecHfEt8NOCDBxR9G1di8c5iu0YJjDKU55u3NgnqbeOzmqc0Xhhxr933St
 SmbZtiWvGQuobTMzNwLPLLHIUtmy6KVZMksldfyEZZgWoSRjRn/+KuFez/H03VJ1BK3j
 LUER0xK6pFMB7PBvJrhvqlTamU2z7KcWfdz/Wef1DF99pZ7r2TIGpB3lh02nIX60mtTp
 3whIekUVX2yVNwmeu4nwBIPTJrJAJYACPpErGk4BHTNGF9lFeNWXhRP3AgyLJpdmXdoH
 E6cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyXm53Z1E7qqnRfCvmvMC39zoRdwYxyVOChbbWpq+bJsgHMdytejboLuoTAAuwbXAyjgWbWNhwu3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmAkycOMAfIZQ+N2v+8fchooBBJPvrTvO1SIMfoUsOWABtfEUw
 SS8nezazGDtA7PKgKm7QzqKX+o+asoUqiIBK8anoNBD8Wm4RCO2LIKC7Wh7Ady8Yt/PID4nsx/I
 Q
X-Gm-Gg: ASbGncuKj9+GO5PM+/BXVPaLQIqrW8vmKM3RGPlb58Cp93RDEoD/4VFPj7kWBxN7BmL
 btzvbidZGSl24Bf96aNcaypq4o4LcyC5u52nV8pYkMROYAaEZuXa4bDfmjxx7dyS5RUMyBRqDZP
 2GQXDTBzAE9CqoMRV9NE+uK8VWtcm7IfZXjsrNdips5GtHn1X/IS7W+aOY49dnmkk0FlVZkbm7I
 RA90rn/yjnUndDC3Zh1ordybnVszV1D9H1c6IZHDY6Sx3XsgdQJTFF4Q7jwLaJIkadDuLfSw9Q8
 ieyTUnIqSVRNyWJdq6oMHK7SCw+oa4VK0SvB
X-Google-Smtp-Source: AGHT+IFznef1Ju25Gi6zAlDGHUzHuCUbTn41gI6JOSQWRXewctsNTUeCyv5oR6ZEoaTnqBnHuOaDjg==
X-Received: by 2002:a05:6512:b19:b0:542:1c1e:ea7f with SMTP id
 2adb3069b0e04-542845af15emr249004e87.9.1736302088975; 
 Tue, 07 Jan 2025 18:08:08 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235ffef8sm5390244e87.74.2025.01.07.18.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 18:08:07 -0800 (PST)
Date: Wed, 8 Jan 2025 04:08:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-next] drm/bridge: it6505: Fix unreachable loop
 increment in KSV list check
Message-ID: <qsylng4kkrosvdikotdiwsuppanlmg5kzmj6kkubx7wknuevit@d5rrej473gd4>
References: <20250107110740.42892-1-dheeraj.linuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107110740.42892-1-dheeraj.linuxdev@gmail.com>
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

On Tue, Jan 07, 2025 at 04:37:40PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> The inner loop in it6505_hdcp_part2_ksvlist_check had an unreachable
> increment due to returning true before the loop could continue.
> Restructure the loop to only return after verifying all 5 entries
> match, making the loop increment reachable.
> 
> Fixes: 0989c02c7a5c ("drm/bridge: it6505: fix HDCP CTS compare V matching")
> Closes: https://scan7.scan.coverity.com/#/project-view/52337/11354?selectedIssue=1602785
> Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 88ef76a37fe6..2ff2245abdeb 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2255,8 +2255,10 @@ static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
>  			    av[i][1] != av[i][2] || bv[i][0] != av[i][3])
>  				break;
>  
> -			DRM_DEV_DEBUG_DRIVER(dev, "V' all match!! %d, %d", retry, i);
> -			return true;
> +			if (i == 4) {
> +				DRM_DEV_DEBUG_DRIVER(dev, "V' all match!! %d, %d", retry, i);
> +				return true;
> +			}

I think, it's more idiomatic if you move it out of the loop.

>  		}
>  	}
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
