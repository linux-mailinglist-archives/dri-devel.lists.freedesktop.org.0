Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075A8C141CB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 11:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C2A10E37E;
	Tue, 28 Oct 2025 10:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="0i92+p4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF4A10E0BC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 10:31:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4EB281A16F8;
 Tue, 28 Oct 2025 10:31:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1AEC3606AB;
 Tue, 28 Oct 2025 10:31:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 27FF31179C2E5; Tue, 28 Oct 2025 11:31:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761647498; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+uY3+sIHhzL49uMZkTdNmvkZZS6TEOBGiAztDbiw/+Y=;
 b=0i92+p4JkeVY6u147fjVPtfkWhGbpfDe6ssbaFqu7WZEzB2Fud39xeLE3zmFVPYNIZajB/
 sQrWhVntow+EwdMcxMuvVQ6vK5glS2x5SL9Gfn+nOWxSsu6/pTkBXLhtWqpu0NMe1TYpmD
 4YeMusEbYSetkWsxv3I5WSfJQH9ZlStzEpU0zQyScP4tYTBtUW1j+WrYiLMEIp+XADFEHs
 vhyrBQ1HbuQxzS1Wu1N/g5P7M7fCxovk3Bp8mNNyDyWRuPwfc4RhOXVPfVyBUHqDQyGmUF
 q2XDt98c0IberEB9YpcxQZsai5KLV+8lmXwre+vIz1lkCptegwcJPvh/m7QQJA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 11:31:23 +0100
Message-Id: <DDTVWXIXAHWF.2CDJWTB5Z7MWT@bootlin.com>
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/6] drm/bridge: enforce drm_bridge_add() before
 drm_bridge_attach()
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Alain Volmat"
 <alain.volmat@foss.st.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Raphael Gallais-Pou"
 <rgallaispou@gmail.com>, "Andy Yan" <andy.yan@rock-chips.com>
X-Mailer: aerc 0.20.1
References: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-0-bb8611acbbfb@bootlin.com>
In-Reply-To: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-0-bb8611acbbfb@bootlin.com>
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

Hello,

On Tue Oct 28, 2025 at 11:15 AM CET, Luca Ceresoli wrote:
> Changes in v3:
> - Searched for any remaining drivers not calling drm_bridge_add(); found =
1,
>   added patch 6 to convert it

Just a note to mention that the leftover driver, fixed by the newly added
patch 6, was added very recently. Patches 3-5 would help a lot in avoiding
more cases to sneak in.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
