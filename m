Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC426FE1FD
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 17:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3F510E4D6;
	Wed, 10 May 2023 15:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FC610E4D6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 15:58:12 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 823C8CC1F0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 15:48:10 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 70F2CC0008;
 Wed, 10 May 2023 15:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1683733684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WoIOANVWdL0y5NcqhIK3a/G8U5mkm1Ghbop7k5ySOhk=;
 b=Rd3d4ufks9H8+MFvwd9uWILnq9BHpac5TSVlyaIfx5FiU+NOdCVUKjT0oc43j2oZegyNzn
 BXnSqpoCr02fjgy25wvCFPaWqaRviURasbmfeDG0aK0GymSBFrrPX5BuKixDem2XayZoF8
 e5h19iXJm1R87Udx6qlnaYHq9O3zX7RGmXDndSidb3ecZl9f9L5fm2PLqz9JRK1GMG7sZL
 LaSGFiqdSTwBRmLAIIJe95eA+Du/FtrlAeKDgo/6wW+jIf3/VJpqbAc+CKjlFZOwqn5W7G
 FfVITgIQ8gYiM5kpYG6EWtadeSaHh2qReOLzrOm02Aoov7drJtk/GPiqPEfcQA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/5] of: More 'device' vs. 'module' cleanups
Date: Wed, 10 May 2023 17:47:58 +0200
Message-Id: <20230510154803.189096-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-tegra@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

As part of a previous series, Rob suggested that keeping too much logic
in of/device.c was backward and would benefit from a gradual cleanup
with the hope some day to move the remaining helpers into inline
functions wrapping the proper of_*() methods.

Link: https://lore.kernel.org/lkml/CAL_JsqJE43qfYzHUuCJsbaPPBTbYX05Q7FFmPTjPFZ3Dmz_mXg@mail.gmail.com/

A few of these "conversions" happened in the series I was originally
working on. At this time I actually wrote a few other changes,
completely unrelated to my original series, but still following Rob's
cleanup idea: here they are.

Link: https://lore.kernel.org/lkml/20230307165359.225361-1-miquel.raynal@bootlin.com/

The last step of this series is to actually remove a copy of one of
these helpers which I think is not needed. This drivers/gpu/ patch
depends on the previous changes.

Thanks, Miquèl

Miquel Raynal (5):
  of: module: Mutate of_device_modalias() into two helpers
  of: module: Mutate of_device_uevent() into two helpers
  of: module: Mutate of_device_uevent_modalias() into two helpers
  of: module: Export of_uevent()
  gpu: host1x: Stop open-coding of_device_uevent()

 drivers/gpu/host1x/bus.c  | 31 +++-----------
 drivers/of/device.c       | 90 ---------------------------------------
 drivers/of/module.c       | 82 +++++++++++++++++++++++++++++++++++
 include/linux/of.h        | 21 +++++++++
 include/linux/of_device.h | 39 ++++++++++++++---
 5 files changed, 141 insertions(+), 122 deletions(-)

-- 
2.34.1

