Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C187F9FD6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 13:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4E810E021;
	Mon, 27 Nov 2023 12:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FD810E021
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 12:44:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id CD221B82905;
 Mon, 27 Nov 2023 12:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B85B4C433C7;
 Mon, 27 Nov 2023 12:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701089089;
 bh=A14BRrGRbT7av40PhXMj0HS+RBvdVsYZIOGpQ37tpnU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FN/20vTB3kN+TGx3aaURGkKj3OW5/kXf7nlbGZtT6aNu0mhdVH1FADHVW+WvQu7mc
 6dHIj/Df9J8lg/vR47JMZq97IhUqRUNE5IgyV0HnPUy3VeG995A0az4sC01TIXuhS/
 cvySHtf/Qco9u13gpIORXuBchpQduL8lgFvQAuZHs7BmZPTdSNdaoqlycXtvLUNcam
 r20luoucHSpZf2oVDVPsNlzq8HC6TAh5uU08LcaAjsDBLemT1UHOcU6JTWk6hyPUlQ
 xd5sTVwNHEhJLoqlYWrvC6p7gdq8LrjgqIjM0hxP1NsSOMo551HKc0B3eTW4VaJQ35
 r5eLQkHqpy5IQ==
From: Michael Walle <mwalle@kernel.org>
To: tony@atomide.com
Subject: Re: [PATCH 1/6] dt-bindings: tc358775: Add support for tc358765
Date: Mon, 27 Nov 2023 13:44:30 +0100
Message-Id: <20231127124430.2153227-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231126163247.10131-1-tony@atomide.com>
References: <20231126163247.10131-1-tony@atomide.com>
MIME-Version: 1.0
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
Cc: Michael Walle <mwalle@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, ivo.g.dimitrov.75@gmail.com, rfoss@kernel.org,
 jernej.skrabec@gmail.com, simhavcs@gmail.com, merlijn@wizzup.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, jonas@kwiboo.se, pavel@ucw.cz,
 mripard@kernel.org, robh+dt@kernel.org, philipp@uvos.xyz,
 neil.armstrong@linaro.org, sre@kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> The tc358765 is similar to tc358775 except for the stdby-gpios.

Bad timing (for me). I'm about to send a bigger patch series for the
tc358775 which fixes the (completely) broken initialialization. And also
contains some of your fixes.

That being said, I intend to make the standby gpio optional also for the
tc358755, because it might just be hardwired on the board.

But second, I'm really curious if this bridge is working for you correctly
as it is at the moment. One particular thing I've noticed is that you must
release the reset while both the clock and the data lanes are in LP11 mode.
Otherwise, the bridge won't work properly (i.e. horizontally shifted
picture, or no picture at all).

What DSI host controller are you using?

-michael
