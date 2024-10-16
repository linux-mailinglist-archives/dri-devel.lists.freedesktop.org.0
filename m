Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3AD9A0412
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 10:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B4010E061;
	Wed, 16 Oct 2024 08:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rQuWC+yj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BEA10E061
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 08:21:12 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43115b31366so57753175e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 01:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729066870; x=1729671670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oHuHA10oz+IlUb3WFI3EHpjMKwYEau3D3WrIjZr3cMQ=;
 b=rQuWC+yj+3Z+yT2Z/vnLTiqM7v9fajPjTTDdkwB4GfEWwXkc5He30r8M5VRurwwb14
 xJh9c0HGL7v19u8l+6WuBON45QzXEmdGyq27MSbp8auJ+XOjX7GCt5ve6+SIpt3chR5F
 qFNPkmGwsIqTj+FLXBBCgFOxBVmKw1l9TCpOa/AMA3+vqzhNFT1QZVcrs4amH8yTdWF1
 Ka6Kzm+xYUWzz1QH+xsK/bWBd4G8HIFGZZ6ouJV4IxlzG4jpce/so98RJrSxl31bpgWe
 +F8PMEQg5lGM1GwKUpOTUAIUW4o10rn51yLH8nH70oQK55kMuuqmiwA12ycs++EnhIGe
 LKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729066870; x=1729671670;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oHuHA10oz+IlUb3WFI3EHpjMKwYEau3D3WrIjZr3cMQ=;
 b=Yw3pLAFN824q6GKsusZHrfnfEIiGg5/YtdE9pNw07Ci4gCJM2zKjmrVyBTFFFYQhvA
 IH9AQSWcfvwVRZ9R2ysBEAHjeo0qfrDINLhpZyMpg+feKrxavEhuNm/H/Qxr4cDkPdO1
 Z4Cm4lc0hCKY3EderXKzb6NH6wcmbBmoDxinCLNVfBRWvVtpeBoZg7ADC/syABlZmA7+
 4rFwmmW9Nza+CEO3fa9QXltAMtDpSuiH0iNcWHAU/lLL59hOo5biGBP5lEkBbf7D0H0m
 eJuFdtOf4QhHcYM1ubm9ZSwC490ac7nMy8FN3/dUKnLXRd7E8AYUe5FZqkQjXd5gy60k
 uD/Q==
X-Gm-Message-State: AOJu0Yxf/w/vrsY0MF6FGUkM1N13UUM7RNqXzv4f3FelTs3bbEb8qvN7
 bIxtmSLg8UbelippRh+NI8l0cEjTIMYSXl9V/0aJ3qS+vhUD6lzMiBPaBoJ6ioo=
X-Google-Smtp-Source: AGHT+IERLNsDKzULbD6b+VfFRVUqsn5sE8FD5wfQhGK0Pm7Idfsgba53RSTr8weraZ+y4cAyzf8GLQ==
X-Received: by 2002:a05:600c:4f83:b0:42e:75a6:bb60 with SMTP id
 5b1f17b1804b1-4314a322492mr24798595e9.19.1729066870226; 
 Wed, 16 Oct 2024 01:21:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f569eacsm41658965e9.20.2024.10.16.01.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 01:21:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Danila Tikhonov <danila@jiaxyga.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@mainlining.org
In-Reply-To: <20241013212402.15624-1-danila@jiaxyga.com>
References: <20241013212402.15624-1-danila@jiaxyga.com>
Subject: Re: [PATCH 0/2] Add Samsung AMS581VF01 panel support
Message-Id: <172906686939.3993974.10769227098345025810.b4-ty@linaro.org>
Date: Wed, 16 Oct 2024 10:21:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

Hi,

On Mon, 14 Oct 2024 00:24:00 +0300, Danila Tikhonov wrote:
> This patch series adds support for the Samsung AMS581VF01 panel, used in
> the Google Pixel 4a (sm7150-google-sunfish). Unlike many other devices,
> which may use different panels in various revisions, the Pixel 4a has only
> one possible panel option. Also this panel is not used in other devices.
> Testing has been done by me.
> 
> The driver initializes the panel in normal mode (High Brightness Mode and
> Brightness Dimming are disabled). High Brightness Mode and Brightness
> Dimming are not supported yet.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Samsung AMS581VF01
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dca22e99706b70169534575fc82028bb6d44138a
[2/2] drm/panel: Add Samsung AMS581VF01 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b330f3a069a20a5698ac840908579c325b7bdc4a

-- 
Neil

