Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6103A7B7EB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 08:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2953B10E02A;
	Fri,  4 Apr 2025 06:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PDzEykG1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D23810E02A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 06:41:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8224C44FA9;
 Fri,  4 Apr 2025 06:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93B7C4CEDD;
 Fri,  4 Apr 2025 06:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743748910;
 bh=gNKz3ftSm+WCqgxdAGdG7TwBCa2MkJq8Xh2F2CQKuCg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PDzEykG1/Osw1rmGAXcH6UBaAVJjINdrYfQIZrv1QW5fcr7rMtvtdA9citOOR8Lx+
 wL/T6VdxmRwLpRSfMohNdGbzzytrdggVbMyiYxWJvHrysJTN83dsI9Anoax6m3AmEm
 R98MwLA3MK8br3YGNOiBhqJQ4MV6Mee52BJGto4FNXg7gqppy4HxNa5jopbMyo+HFo
 9qSKauy2CblOeLXKLrix0VTtqMAf+d02qOtEHuTSzuo5mYIMrY/AC7JUqEHjkRnWL5
 aQmnEsLUOaK+jR6hrB08oOxDMeC29KlddDXgN9u7qthxIT8tDoKiqptEx3HC38blcA
 8oO8rvowKjFSA==
MIME-Version: 1.0
Date: Fri, 04 Apr 2025 08:41:44 +0200
From: Michael Walle <mwalle@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki
 <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>, Javier Martinez
 Canillas <javierm@redhat.com>, Michael Trimarchi
 <michael@amarulasolutions.com>, Jagan Teki <jagan@edgeble.ai>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Purism Kernel Team
 <kernel@puri.sm>, Linus Walleij <linus.walleij@linaro.org>, Jianhua Lu
 <lujianhua000@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/30] panel/ilitek-ili9806e: Use refcounted allocation
 in place of devm_kzalloc()
In-Reply-To: <20250403-b4-drm_panel_mass_convert_part2-v2-9-260c8a44c56b@redhat.com>
References: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
 <20250403-b4-drm_panel_mass_convert_part2-v2-9-260c8a44c56b@redhat.com>
Message-ID: <0fed1ed195aac73395f20c14c29ef9af@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael
