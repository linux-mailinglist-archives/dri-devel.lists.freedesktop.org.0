Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1999ACEB562
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 07:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E308310E010;
	Wed, 31 Dec 2025 06:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="LCRTwwVd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 528 seconds by postgrey-1.36 at gabe;
 Wed, 31 Dec 2025 06:20:31 UTC
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E871A10E010;
 Wed, 31 Dec 2025 06:20:31 +0000 (UTC)
Message-ID: <59736756-d81b-41bb-84ba-a1b51057cdd4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1767161500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z64DZs+w89x8AC/nna2gxUPH589poWq3I+QyEvTvhfM=;
 b=LCRTwwVdR4yj1tB08o9pZeHt1Fum5bvDmLdKMuLInfbyBZNXGThoxR1ceSCzlbYvdsTVSM
 AUkZHGpqnqjIme8hdkCmBi/zBVt0jRKFv4L/EE8GbWHZe8IYeNYy6+UTMNt7nDfgUofDYZ
 IngeS+KaYn4GpogGxJ6y600nYBHU3uE=
Date: Tue, 30 Dec 2025 22:11:34 -0800
MIME-Version: 1.0
Content-Language: en-US
To: Lyude Paul <lyude@redhat.com>, dakr@kernel.org,
 Timur Tabi <ttabi@nvidia.com>
Cc: regressions@lists.linux.dev, nouveau@lists.freedesktop.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [REGRESSION][BISECTED] Freeze when nouveau loads GSP firmware during
 boot on Blackwell
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On the 6.19-rc kernel series with linux-firmware 20251125, I have been unable to boot into the kernel while using nouveau on my RTX 5090 rig. 

It appears to freeze right after "nouveau 0000:01:00.0: gsp: RM version: 570.144" appears in my dmesg, and it locks up at this point. It works fine if I blacklist nouveau or use nomodeset.

After bisecting, the first bad commit is da67179e5538 ("drm/nouveau/gsp: Allocate fwsec-sb at boot"). As it's a Blackwell card, I cannot test with GSP disabled.

Still trying to figure out the best way to provide complete logs of the freeze, as it's too early to go into my journal and sysrq keys don't work when it freezes... 

Thanks,
Matt
