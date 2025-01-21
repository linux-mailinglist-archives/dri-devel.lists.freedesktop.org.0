Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB0BA17B3C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED4910E53A;
	Tue, 21 Jan 2025 10:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WpjKxrjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F7B10E53A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:17:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6367FF804;
 Tue, 21 Jan 2025 10:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737454646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L2UcyTTEM19x4Ti2iKjlNA5f2xup7UYOo/tCQ6TBq74=;
 b=WpjKxrjs+oqOAgomnhJmhD6kCX1h/0k3aFFYGqFhdwrn/GLnNvSTiZA6jM9VZSSEKlZ1eC
 RQjuHnKoPJZwthiahUGJ1PkcIBEb0O9qSjxVy0eDZg1fHq/b+W2wpwxfijuacD2G0nKWFe
 hwVqsZrbl2rumB9eeEswIrw8j9xLCsiy/lr//06maoSmJ4/qm8mYGra4ZGqhz6O9lBYa9I
 awVPO4JFxP6hzs3K9OHyAIKRUYR67cOX5kXIKWqimq2IzbwDKJ1wG3fxsxPh8CCn+q6AP1
 Q6DyrC0UcoblOYBDg3Gs4MCBeXfu/ZzcmK+bIpjQQCsvYJyiipBPmGMw1KZlCg==
Date: Tue, 21 Jan 2025 11:17:23 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH v4 0/3] drm/vkms: Switch to allocated for drm objects
Message-ID: <Z490M3Ax0j0rQztd@louis-chauvet-laptop>
Mail-Followup-To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
References: <20250117-b4-vkms-allocated-v4-0-8ec8fd21aaf6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117-b4-vkms-allocated-v4-0-8ec8fd21aaf6@bootlin.com>
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

On 17/01/25 - 10:04, Louis Chauvet wrote:
> Specific allocations for each DRM object is not strictly needed in VKMS
> right now, but in order to implement dynamic configuration of VKMS
> (configFS), it will be easier to have one allocation per DRM object.
> 
> There is no need for a dynamic allocation for the writeback connector as
> there can only be one per CRTC
> 
> No functionnal changes are intented in this series.
> 
> This series requires [1] to switch vkms objects to drm-managed objects.
> 
> [1]:https://lore.kernel.org/all/20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com/
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Applied on drm-misc-next, thanks.

Louis Chauvet
