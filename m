Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398FCB4FE7D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1E510E76E;
	Tue,  9 Sep 2025 14:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="2oVwkHmm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0D110E76E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 14:00:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 00BE41A09D3;
 Tue,  9 Sep 2025 14:00:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CBB2060630;
 Tue,  9 Sep 2025 14:00:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 43F53102F2869; 
 Tue,  9 Sep 2025 15:59:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757426430; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zkJmRVq9X8+VfiFiVFtH9/Lec29ID9JWmA+hQsicr58=;
 b=2oVwkHmmv7BPojJAfKrt3kpqZHFkobdQn8anhwZSjXXexsdPrYY0mb7Qd7mBXNP0+Hapf3
 yhbr01kdvGhPUnJVydECZxvOjMOZ22EB4oGlROtG5GDizZqbxlInomoz4VDLblZH6Jo6MJ
 uf/J94TIXU28ydjh7K+23kOyqAvPQbkiXWGLNb4N5BJCQvKks4eqfqP+WILRUICQqn8DFn
 UPAtrrFT9hJ91MV6PcuvB9rq3+w/L/dlYv8eElWnKfYRwjxhRhIMM9uh60Ehhiz9mxrkm6
 DIR6A29G2WyJddjlr9Y/P/Xe1TdaqXIpUVpCeZ8iACM02lGh/cYbz1sFzv+iVA==
Date: Tue, 9 Sep 2025 15:59:50 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Qi Xi <xiqi2@huawei.com>
Cc: <bobo.shaobowang@huawei.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <lumag@kernel.org>, <dianders@chromium.org>,
 <lyude@redhat.com>, <andy.yan@rock-chips.com>, <viro@zeniv.linux.org.uk>,
 <mordan@ispras.ru>, <amishin@t-argos.ru>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on
 error path
Message-ID: <20250909155950.0e15ec6c@booty>
In-Reply-To: <20250904034447.665427-1-xiqi2@huawei.com>
References: <20250904034447.665427-1-xiqi2@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hello Qi Xi,

On Thu, 4 Sep 2025 11:44:47 +0800
Qi Xi <xiqi2@huawei.com> wrote:

> Add missing mutex unlock before returning from the error path in
> cdns_mhdp_atomic_enable().
> 
> Fixes: 935a92a1c400 ("drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qi Xi <xiqi2@huawei.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
