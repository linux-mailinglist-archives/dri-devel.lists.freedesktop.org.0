Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E327CFCBEB
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A70910E569;
	Wed,  7 Jan 2026 09:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1VIrkJlG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCF010E56B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 09:09:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7419CC1EC92;
 Wed,  7 Jan 2026 09:09:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 90BF8606F8;
 Wed,  7 Jan 2026 09:09:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 137A5103C86DE; Wed,  7 Jan 2026 10:09:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767776982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=P1CKSMWAbSSOC/ne2tNQS1qPfmyiHDbzXLsDeMdW+pU=;
 b=1VIrkJlGrCCGNvTXSthbq1O53cc+xlQKxMQ29A1Qpqq96gUttEEwy6UU41Hd4ceKs5jw40
 jhC53clqe4aPp8j0R+Eu/HY2A6ibXzhWyRU6rDNv4Fi2CsFj0CEf6+msELJmU9fKdo1V5A
 HuXzhXInc8dsM8yzO0KB9ioGOD5kxq/E+T5uwqcdiVgQ1CKtwkrPzE62NqZdFzjWB5jUzH
 mUwcrK4utSOB+KHbMkjJGwW0Bwtwk9Pd5xZzp7XIXiILDbJej5RLaQUtS5KKRaMK3RVChn
 /ZHF7oQZW0NnE2cuCIGR24pT2Y7SeT8Y5/pmI+LpofK4FI/+VgZRkayuvxZ7MQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 10:09:39 +0100
Message-Id: <DFI8N16SORJ9.3P2KY2DK6ACFS@bootlin.com>
Subject: Re: [PATCH v2 0/1] drm/bridge: lontium-lt9611uxc: use irq as optional
Cc: <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>, <jernej.skrabec@gmail.com>,
 <jonas@kwiboo.se>, <linux-kernel@vger.kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <simona@ffwll.ch>,
 <tzimmermann@suse.de>
To: "Vladimir Yakovlev" <vovchkir@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260107032342.332758-1-vovchkir@gmail.com>
In-Reply-To: <20260107032342.332758-1-vovchkir@gmail.com>
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

On Wed Jan 7, 2026 at 4:23 AM CET, Vladimir Yakovlev wrote:
> Hello!
>
> This patch add support IRQ as optional for lt9611uxc
>
> Changes in v2:
> - As Luca Ceresoli recommended earlier, I added a patch to replace
> - request_threaded_irq with devm_request_threaded_irq before making
> - these changes.
> -
> - Since the updates only affected this patch, and the previous patch
> - was new, I made v2 just for this one. I apologize if this is incorrect.

This series depends on "[PATCH] drm/bridge: lontium-lt9611uxc: change to
use devm_request_threaded_irq" which you have sent separately, so it cannot
be applied as-is. The best thing to do would have been sending a v2 series
with 2 patches: first the devm conversion, then this one.

However no need to send again just for this, it can be handled while
applying.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
