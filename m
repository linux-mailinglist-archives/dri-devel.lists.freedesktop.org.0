Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0639F5237
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 18:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3043510EA27;
	Tue, 17 Dec 2024 17:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h/Rk5cr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 18147 seconds by postgrey-1.36 at gabe;
 Tue, 17 Dec 2024 17:16:38 UTC
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFD710EA23;
 Tue, 17 Dec 2024 17:16:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EF0E0A41E9A;
 Tue, 17 Dec 2024 17:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091D7C4CEDD;
 Tue, 17 Dec 2024 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734455797;
 bh=mALeudlsz4tffkWUerdlBg3NdDAP0x7MdgTaQvMmqbg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=h/Rk5cr7NWBk4BGvrUY/Pz6jXQkhT6ZT6iM7rxav2vLeqobPJTZNG2MK0U4kI8OfN
 kt5AV7A6swzUFZ1Ji4Zk7/M8yGUFHDYENdfVcT/rammZklLlxisWRh1uVurzzIX2Vl
 gKUUh3H17ue1Q8ilf5HOU8p18NKDJlc1AC0cR6iW3p/go844hZqK6fepR7D5jb71tg
 x5dOXqkZ9JjWfLLYMQ5M0/AlE4BWT0rPOXgYOuQNa0GPsOfWcMgd/FD4liN6dOnkNY
 NcfPBIJQD6YcwaKMiHlr5MJGuPEHoIkJEVNJ6g41jc5tBLz7j8UIfpHBXV+yEPva2j
 gPHt4GK62yB8Q==
Message-ID: <de77731bc192ae3d8d2cd184f076619c@kernel.org>
Date: Tue, 17 Dec 2024 17:16:35 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 01/25] drm: add clone mode check for CRTC
In-Reply-To: <20241216-concurrent-wb-v4-1-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-1-fe220297a7f0@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_abhinavk@quicinc.com, quic_ebharadw@quicinc.com,
 DavidAirlie <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
 JessicaZhang <quic_jesszhan@quicinc.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Rob Clark" <robdclark@chromium.org>, "Rob
 Clark" <robdclark@gmail.com>, "Sean Paul" <sean@poorly.run>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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

On Mon, 16 Dec 2024 16:43:12 -0800, Jessica Zhang wrote:
> Add a common helper to check if the given CRTC state is in clone mode.
> This can be used by drivers to help detect if a CRTC is being shared by
> multiple encoders
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
