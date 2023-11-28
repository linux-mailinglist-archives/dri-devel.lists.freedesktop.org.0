Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EAB7FB6D6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C6F10E47F;
	Tue, 28 Nov 2023 10:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CD210E47C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:12:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4079ed65471so41584485e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 02:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701166323; x=1701771123; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/jJIpXfUqMsnRBGS3y5ASpjNGohuz9xx+5+nx6r1n00=;
 b=TU0Pa72V9Nsd6Z1Dr3x0GCfxtVQadE2V2AD+zqDXrQi9OXwtqsv/dRfdBoCVEGQvdY
 1un8Be/q9EsIa7FFNu6j9DFBjnBXHZuuqIdIPBANJv8zS85KTI1c7o8sOzIPrR1xPDqN
 mo8ujA6twv7uLcsTSDHarqmzJqKgcEIC5VzvGnZp21tYic6pD11PjcUSiEo0M97AhwLo
 NQpyRkmlyQmC9/thJHDsZd+EaYn9bgcI/TJluXZHIup1NpyBNSUYSo2XtShFU55H9mEs
 BpdMaqpxJrkX2GROyKY2PUnWrxBH9w+biK2SDeIM8rGwgMfK+YyIcOIqZ1ZaAFAMhA/3
 lYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701166323; x=1701771123;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/jJIpXfUqMsnRBGS3y5ASpjNGohuz9xx+5+nx6r1n00=;
 b=WNBD8w8mcb/1lYtTl+jX8QhGP59waCqJnMRFKfjkMl79jv+i7TpoSHqlAUfsCbOQTT
 6zawylFwfQRwqgFWIp7tQm5dKHuyKvOsD/2mzruyjj32WcAw5K/nFKOJXzs9zVcdHbzD
 Lyo9aSO5hk2gW5i5JCYmjrF1GfKA0DtXK7+uFJFJXrnBYHSr7lRpyUFxREqst9NrmYmJ
 BpyoK0jmBzn9oXzLFztg5hoCWq22JB978K8xYWSEgUtDbWhQyKBSVWPY7dshV0dOucBU
 RRFbaYIzUwo+BOSwJU/nBMU9+h/R2D1qNEzDWGcGMnuuaulHADHUAhTlLGU6xpoXSCwT
 HTJw==
X-Gm-Message-State: AOJu0YwkEmEVw8TOS5L5qp2cHV+h7N1tOYE6zvY7UE9EoP2H9DhzZYi5
 AWVAk/X74OHKEPT2eBeZ6QREdA==
X-Google-Smtp-Source: AGHT+IFj1SEyzBamITvGlM9acxZpE+SuR4K1DvYsd7sL0DSYgEK67+INqGACpV1iZ7zuYcFPjnlSiw==
X-Received: by 2002:a05:600c:4e8b:b0:40b:4c1a:f5b2 with SMTP id
 f11-20020a05600c4e8b00b0040b4c1af5b2mr1186553wmq.35.1701166323063; 
 Tue, 28 Nov 2023 02:12:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a056000194a00b003330b139fa5sm1643604wry.30.2023.11.28.02.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 02:12:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Liu Ying <victor.liu@nxp.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
References: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
Subject: Re: (subset) [PATCH 0/3] Revert panel fixes and original buggy patch
Message-Id: <170116632194.2250210.1478661000647719120.b4-ty@linaro.org>
Date: Tue, 28 Nov 2023 11:12:01 +0100
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 28 Nov 2023 00:10:18 +0100, Linus Walleij wrote:
> This series reverts the attempts to fix the bug that went
> into v6.7-rc1 in commit 199cf07ebd2b
> "drm/bridge: panel: Add a device link between drm device and panel device"
> and then it reverts that patch as well.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[3/3] Revert "drm/bridge: panel: Add a device link between drm device and panel device"
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9b6a59e5db87c2c6b3ca0391176ed4358623d5e4

-- 
Neil

