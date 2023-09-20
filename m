Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED6A7A83C4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 15:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057CD10E4B9;
	Wed, 20 Sep 2023 13:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6DA10E4BA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 13:46:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-401d80f4ef8so74961845e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 06:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695217597; x=1695822397; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cAM1wadeSyIjp7q3Vm93wQl3fXT/7CxJyrjA05VxHHI=;
 b=vsQQ1wcuvxbA0msiFqz711gKsep4avaTRscQWLw928jyNLGwEd6b9qN0ztcS70sAYD
 3hfaBHM6z6SZTlIL6WivOE+jm71jVkcJYW/dg0b7tYlHIiKI2xMve+KqVXdrUdjd8vSD
 qnsG4sCq/EiYy6cqO/WnOmOC1Kb4Bd/iPfw2wq+9Efxy4WWwfB/qTCFRD8Bo04URiSW7
 tHrAho29Dd4bVW3sn+RwjUwZp0IzPw+Pa33uNee2XqmK/4YDgupCEDeH3uOEcCUYG6sc
 Yy2YrCDi2LkYYl7r8qIpF401jKmnDbzZ+pLBcYaDlxYzJgExbCTItKIYh4ms0lITZ2jn
 bI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695217597; x=1695822397;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cAM1wadeSyIjp7q3Vm93wQl3fXT/7CxJyrjA05VxHHI=;
 b=oGrHTcClFDiAXrQYNsqmO9ExUDUJoWD0OEwRwo1RPlkcJhWuKxSDDKWIwTDNV//O9W
 12L1sJZMB2kWWHO+FO+yVLOJ1RR7IZEDjpU6wSEjfCONVaQvj/AfIzw0EeDDHMWNC3d3
 GovCR7765gD6mcqCZAOLiZebY97kv8qOVISoyytRjbfpyXNyO5lSWhd4V1g6WO0kHVKz
 AE24kWEMpFgu1XVpsnnR+dp0mE2Ln/ST6Gqey7Y2phlsezA7Q5h6ILZapw98Lb+rY6fD
 lDhE7kMAcHF1d5VJ6Mkt6iVJEiYueg1eKS+U/dx0R0pBQF3XwaE0v52yflTRLKMfQHLF
 a+pg==
X-Gm-Message-State: AOJu0YyGLbHn0S0B+zX7m+Us2RIFObUVagSzgQXsXc1S6Gtm+ikAfF4K
 dUkS7RFPEuER3JOu94//hLtixg==
X-Google-Smtp-Source: AGHT+IFbm0KhCiry33Vx93F5rLpq+lFcEYHKEkaTNlVhxvoLeU6XTDCsvfVSPISxoCiGd9wzuVCSWg==
X-Received: by 2002:a05:600c:144:b0:405:1ba2:4fc9 with SMTP id
 w4-20020a05600c014400b004051ba24fc9mr2524735wmm.15.1695217597366; 
 Wed, 20 Sep 2023 06:46:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a05600c211700b004042dbb8925sm2010111wml.38.2023.09.20.06.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 06:46:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
In-Reply-To: <20230914131015.2472029-1-jani.nikula@intel.com>
References: <20230914131015.2472029-1-jani.nikula@intel.com>
Subject: Re: [PATCH] drm/meson: fix memory leak on ->hpd_notify callback
Message-Id: <169521759637.2169873.6598076316992605754.b4-ty@linaro.org>
Date: Wed, 20 Sep 2023 15:46:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, stable@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 14 Sep 2023 16:10:15 +0300, Jani Nikula wrote:
> The EDID returned by drm_bridge_get_edid() needs to be freed.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: fix memory leak on ->hpd_notify callback
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=099f0af9d98231bb74956ce92508e87cbcb896be

-- 
Neil

