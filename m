Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59833C30962
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D0510E5BF;
	Tue,  4 Nov 2025 10:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Yhd1zxS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DFC10E5BF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 10:49:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E0EDD1A187B;
 Tue,  4 Nov 2025 10:49:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B5127606EF;
 Tue,  4 Nov 2025 10:49:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D477D10B50BDE; Tue,  4 Nov 2025 11:49:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762253357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9I3vy0iA37ZZNq9rWs96vtcIs4h7b1D8KsBmAVcjis4=;
 b=Yhd1zxS+6ZDfh4/Tb+QML8+c9q8VCHLOLBGY6ShFepYAhmIdF+arb/sK2tWC9H755aMImn
 oHVrAYxAjDEw+/KyvRGEcgw1wuIsDy+QciFyw5fpQvS0yzxhV24ItMfLNjNOrJLYcJjtsd
 +P1zo5wKjmZPiULRG74V6vYT2g8z26QOYkyqJD4eNgkWNdSSdnLWlQgfD8wx734R9cVgYd
 fawujTKNzYYdvrgkI1dWiwfuVFHlPQKCYwVvXJ3rHurYu3c5rDZ+sfVmcHPPNow3aPsfT+
 j0p1AIUvY4ihpgW9WK43d+nY1oJ8u1ik6tYqApMKFRMwvHNRieSiIuhjMxY7BQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aPtfy2jCI_kb3Df7@stanley.mountain>
References: <aPtfy2jCI_kb3Df7@stanley.mountain>
Subject: Re: [PATCH next] drm/vkms: Fix use after frees on error paths
Message-Id: <176225335371.410618.7512653404131520222.b4-ty@bootlin.com>
Date: Tue, 04 Nov 2025 11:49:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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


On Fri, 24 Oct 2025 14:15:23 +0300, Dan Carpenter wrote:
> These error paths free a pointer and then dereference it on the next line
> to get the error code.  Save the error code first and then free the
> memory.
> 
> 

Applied, thanks!

[1/1] drm/vkms: Fix use after frees on error paths
      commit: f9e46acc172138a472ffb3bf0270a0b156a77411

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

