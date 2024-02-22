Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEE386008C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AD210E9E7;
	Thu, 22 Feb 2024 18:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="afsXDD6h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E107310E9D1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 17:47:15 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-512e39226efso83001e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 09:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708624034; x=1709228834; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1vMzRY4ZdJC97RtaAcBXZtkJzfMV0ziR37O9+2OreJs=;
 b=afsXDD6hPjhctz74shwZmrUMD8HoWL6+O2VBg3qI7glhbi7/3PkfTHfDZ3DKHRqgjc
 UyehVCpAQw7+b8PmM+EaSCjwKI+9+UifjBUae5vSmML4jpKZkx9xCPnnhe1H4ooDyjDp
 +9w0V83RaxN4fQerd2/zaavPaFm9CYy6LAovLIggatWoATX7L0X44kxCVRTWgK8f5d9h
 +Dpbt1C/zFNTNV1p9ha0ds1cKT0ikKJ/ZF9vb0GcgiJJjoRlMaayY9Mi6ZYhc2F/eT+U
 sQXGzBzuBplcShS+McnBYUM+jw7GWC236YF9C54uuxhR3YLlJkMsEJMrocUBfuju+bXX
 2xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708624034; x=1709228834;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1vMzRY4ZdJC97RtaAcBXZtkJzfMV0ziR37O9+2OreJs=;
 b=o/pwNnOD4FuR1OUeC3nxjb9WRupSWlHZOg+o+SrsU8q5GRkTfl5pfZ0eBWfXXKnq2G
 4F5HsOdLpw8TM1kk/zKnRAiHgRgbkcW7qd484cqfCWiZuZNYFoL9k5JrBs/aNe27IT4+
 az0NHBQpoOOP7fXCDRaO1wtprjFC864PSEWjZrjF2rnfT7Go8fjSdGgAVryowB9TxUgk
 7iTy+Sdf0lWsQ7fU8xio9EKqviEsI3zIPWFOaRBXK7PPbxNWuZRZhbcoKlOWIP1G7kK5
 qJjqO6EFKvWbqEdj9p/5EeAVlw3RIRoZBZMNeaZRQYZ0Rs8M7ITXiUFqSVQ/vk73EMxd
 xlaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn+yt/M+GReT7y3AAnsmpErdwVDG8znBRwr3ipPBt+E7130eDfKvM9G2JD4AR3OkvznAhNpMBDSDJ7G8w9TNXQk7NxMXLi32a0Lis6lsko
X-Gm-Message-State: AOJu0YwASTEYoX00dVI2hzlnMV2+xSFL8vf9zocD1okrjKop3cyluB2L
 IOQMTKqa2qPijkXet9XgrvYQrhgk4lGBsKYZTtJgAPmMyphdQBA1
X-Google-Smtp-Source: AGHT+IGiugEEEwYB53ORSW0VA1gdJrv8sHxuyh9M9w4ejmOATIcCj/UM2+JKxQktNLdPnMuWWIo5iw==
X-Received: by 2002:a05:6512:3fc:b0:512:ceae:93d9 with SMTP id
 n28-20020a05651203fc00b00512ceae93d9mr3339347lfq.28.1708624033424; 
 Thu, 22 Feb 2024 09:47:13 -0800 (PST)
Received: from [192.168.50.110] ([90.255.110.157])
 by smtp.gmail.com with ESMTPSA id
 ay25-20020a05600c1e1900b00411d3a414c6sm895267wmb.47.2024.02.22.09.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 09:47:12 -0800 (PST)
Message-ID: <79a4b60e-24f3-47fd-b3b3-7d207cec1470@gmail.com>
Date: Thu, 22 Feb 2024 17:47:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: panel: st7701: Add Hardkernel ODROID-GO Ultra
 panel support
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240221194528.1855714-1-greena88@gmail.com>
 <20240222164332.3864716-1-greena88@gmail.com>
 <20240222164332.3864716-2-greena88@gmail.com>
 <f9446923-acd3-41cf-92d4-676b946280c4@quicinc.com>
Content-Language: en-GB
From: Adam Green <greena88@gmail.com>
In-Reply-To: <f9446923-acd3-41cf-92d4-676b946280c4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 22 Feb 2024 18:12:56 +0000
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

On 22/02/2024 17:14, Jessica Zhang wrote:
> Hi Adam,
> 
> Just wondering, why the change to 120 here?
> 
> Thanks,
> 
> Jessica Zhang

Hi,

The 120ms is taken from the datasheet specification for the controller 
as maximum time it takes for the display to reset,

Kind regards,

Adam
