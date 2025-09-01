Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D130B3DFD4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 12:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01ACF10E40E;
	Mon,  1 Sep 2025 10:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="vec88hCK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B78310E40E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 10:13:23 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cFl7g5W4vz9tpk;
 Mon,  1 Sep 2025 12:13:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1756721599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PEPqKsXcvXT/g24/oUJ+GoYNPppG4ZlMLpGam/YzKnY=;
 b=vec88hCKKDE7RbFUqpBJTsK9g2ifA9UrB4TgMAy3eJ1kpCt8uTgEdyYh62Wot4umwPkRD2
 ITAbFotnK4nEbrJcc3xPWIT89mEIzQtl8WcYLavBI7YxiIuWmTabbf+CA99cXJ4SqgfOFI
 iRXXGmG0Fgh+Y+ZpDQwS9wsZYiW4bCP2H8hzeVzyYvaJ6HFFsvxiZv86duNh8q/qEnlat8
 hYmHeSTZnJxS4s9/ARAAX+kvdnE4WOvaRzn0U/omo5ybmFt+Y9N4AfYw6jG3rmE7J1HCyE
 PopPHQbHmMH/Eh4izFTmp0Urv9CL3ZxnYercHSlzD8YXK3jNn2IFzqa1gf1i5w==
Message-ID: <9c7499e1-8386-45d2-b859-aba7b33387af@mailbox.org>
Date: Mon, 1 Sep 2025 12:13:16 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/rcar-du: dsi: Fix 1/2/3 lane support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20250813210840.97621-1-marek.vasut+renesas@mailbox.org>
 <d1354951-cbd3-4216-970b-e1e130f58522@ideasonboard.com>
 <fa0d9882-aadd-49e4-8a39-e0d0c321ecc1@mailbox.org>
 <e03c3fcb-7392-4ddc-80f1-8c104cd04e3c@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <e03c3fcb-7392-4ddc-80f1-8c104cd04e3c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 12693b4806c0b95e2f9
X-MBO-RS-META: 1tqhofjo8unimw73ac5d1sc8b6esrkz7
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

On 9/1/25 11:22 AM, Tomi Valkeinen wrote:

Hello Tomi,

>> Would you like to pick this up via drm-misc , or shall I ?
> 
> I'll push to drm-misc. Thanks!

Thank you

-- 
Best regards,
Marek Vasut
