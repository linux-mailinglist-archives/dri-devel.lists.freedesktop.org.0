Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4201A20829
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 11:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D86F10E264;
	Tue, 28 Jan 2025 10:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QmgwvXAR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA4310E612
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 10:04:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 513431BF204;
 Tue, 28 Jan 2025 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738058675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OgYV1p9ISQoK4yI18FOJcDadHJfkikkNCT31rFdcASY=;
 b=QmgwvXARm5dogmhXKa+Jlc0ul3ZRiJHfGnNL4JYVupQJNb8GY9HP6WDU7PMjqzUVcyEldt
 xvK37jndLW/ycPtBTFEl9fDZn1MEFSBwyGnfGt8+l4ZM0rFJ/UiyIMhXky+lqed2umdmp6
 jQHO+0z79paLbwAutVlMJOMKX+l/1+FR857gwp+S0VliVw7cSE77XJivsak+pq9/Xjvft7
 fVgIPeRBrHEktxEy4KeCUWTf621jNP+uOfQfFckgMKeZ4e3+mSomsT7d3YrqIME6kRJ00W
 vruK3rEOiGjlqPTIXFPpmdIO7ZFqSt5KE0bqsm5jAXV33AEzZZ2jU3Y8eG1jAQ==
Date: Tue, 28 Jan 2025 11:04:33 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Paz Zcharya <pazz@chromium.org>
Cc: Sean Paul <seanpaul@google.com>, Drew Davenport <ddavenport@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paz Zcharya <pazz@google.com>, David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <melissa.srw@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vkms: Add support for ABGR8888 pixel format
Message-ID: <Z5irsdEc6Ex2v_eP@louis-chauvet-laptop>
Mail-Followup-To: Paz Zcharya <pazz@chromium.org>,
 Sean Paul <seanpaul@google.com>,
 Drew Davenport <ddavenport@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paz Zcharya <pazz@google.com>, David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20250127235956.136032-1-pazz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127235956.136032-1-pazz@google.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 27/01/25 - 23:59, Paz Zcharya wrote:
> Add support for pixel format ABGR8888, which is the default format
> on Android devices. This will allow us to use VKMS as the default
> display driver in Android Emulator (Cuttlefish) and increase VKMS
> adoption.
> 
> Changes in v2:
> - Rebased on top of tip of tree because it has been 3 months.
> - No functional changes.
> 
> Signed-off-by: Paz Zcharya <pazz@google.com>

Hi Paz,

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

When applying a patch I got a small warning about a missmatch between your 
author email and the Signed-off-by:

	-:106: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Paz Zcharya <pazz@chromium.org>' != 'Signed-off-by: Paz Zcharya <pazz@google.com>'

I can fix it for you by adding a Author: / changing the Sign-of-by before 
applying on drm-misc-next.

What mail do you want to use? pazz@google.com or pazz@chromium.org?

Thanks!
Louis Chauvet
