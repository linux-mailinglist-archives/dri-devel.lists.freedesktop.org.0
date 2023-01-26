Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C86BA67CE50
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C36810E91A;
	Thu, 26 Jan 2023 14:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EFB10E915
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:37:22 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id hw16so5509092ejc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ojoaU79vsM9d6gnnSHhz/j9TBcg9S6MfuddKc11zkQI=;
 b=Qvk6hlDc1Y7T+h5eZC3/WtyiiG6rpVH0bci43kDVCCpE/XcXipEi4dTXtMkPl3jHCl
 Zua9JThVPpbqtgtqjvAjeLu8lA82Zd1tVi3kTA2zDuiYTXnlv2Y+RBZrJ7CTkpr9AtlV
 Uvwc74o1vvTQjbo82+RROoFCMPaEPzcG9VZoGxvAkXYqltOcfXGnVsMmoX4Wn6FVRnbV
 nd/qjdSgnDT9Y0naJmUTI4pRvVRwvXJE+C7AqbHKUfsut0kO+M+o4K6NXJ+gOqI7WrYH
 W2G4w3FxuOCCw0L/EVVBcx35Wh+ShQT5G6FEr9+iRTdEjGoHDTwh9rPkoUmo7QPV06IP
 0xxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ojoaU79vsM9d6gnnSHhz/j9TBcg9S6MfuddKc11zkQI=;
 b=puOPjCKl0erQTkPEKEhpX2AeCJ/ZPv6uCbbvV1NSbt/GPJdJ76M8fP5t/WErCRJwaJ
 CImZdxaph0Yt3KB7KyzOTiYSDlnEAy81PFkwCgyS2rWZ0RuJudA3G5I7a6o14yATU7V/
 Ovzwx4DOJLoP7zQjt+AVLM3D3OTo0T8ltNfLPBAezLIWG7QdDq8H+e0xp+NOhHtD/ETU
 WjRyoXSA3jZQpaTMlTYFuJlieYYOzq4UttN7OFPtE70EURTUo2uv6nTQqTQf/TcrDrgN
 yEuWSXxeiFOGLcCarSchZ6QWXPcPxu8O64PvhIIk6HSC+zCBwhaf9kRBk8C1H+4ijUra
 xy2Q==
X-Gm-Message-State: AO0yUKWd6T0OtCJS9ggt1+Zu4ER63kdKMcJ1cr3m2liv3owcZJKfAp1s
 tdwcIZj9sVZ8qWr/0VBQbEc=
X-Google-Smtp-Source: AK7set8dbBqhWX+8vueaZet6qki7SVYHve2oRacn2VrEua6nci8+6sOuxk2m//pfsWPfpmCMkPjwDw==
X-Received: by 2002:a17:906:4b13:b0:878:5e84:e1da with SMTP id
 y19-20020a1709064b1300b008785e84e1damr2699504eju.27.1674743841116; 
 Thu, 26 Jan 2023 06:37:21 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 rh16-20020a17090720f000b0084c7029b24dsm674327ejb.151.2023.01.26.06.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 06:37:20 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/4] gpu: host1x: Implement syncpoint wait using DMA fences
Date: Thu, 26 Jan 2023 15:37:16 +0100
Message-Id: <167474380848.1640957.3846713642023225990.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230119130921.1882602-1-cyndis@kapsi.fi>
References: <20230119130921.1882602-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

On Thu, 19 Jan 2023 15:09:18 +0200, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> In anticipation of removal of the intr API, move host1x_syncpt_wait
> to use DMA fences instead. As of this patch, this means that waits
> have a 30 second maximum timeout because of the implicit timeout
> we have with fences, but that will be lifted in a follow-up patch.
> 
> [...]

Applied, thanks!

[1/4] gpu: host1x: Implement syncpoint wait using DMA fences
      commit: 10b8db9244e3545d7278016ffb878d5bfe3201fe
[2/4] gpu: host1x: Implement job tracking using DMA fences
      commit: caf0f8e3e318c7e1c687072293518c42befcea68
[3/4] gpu: host1x: Rewrite syncpoint interrupt handling
      commit: ba9218b16428dbfcdd167899f7e54c5c6a081c07
[4/4] gpu: host1x: External timeout/cancellation for fences
      commit: 93d08ca7ed728bf3bf70aa78caacdfb7011d6d03

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
