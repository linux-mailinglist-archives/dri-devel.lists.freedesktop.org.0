Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E6C25BDD3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8A46E5A4;
	Thu,  3 Sep 2020 08:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524716E4FB
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 17:48:16 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f4fdad20001>; Wed, 02 Sep 2020 10:48:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 02 Sep 2020 10:48:16 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 02 Sep 2020 10:48:16 -0700
Received: from [172.20.40.84] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Sep
 2020 17:48:15 +0000
From: Daniel Dadap <ddadap@nvidia.com>
Subject: How to address individual vga-switcheroo muxes on systems with
 multiple muxes
To: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <bfa0e1e9-2ecf-e1d7-1a6f-71c2f7b01c7a@nvidia.com>
Date: Wed, 2 Sep 2020 12:50:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1599068882; bh=kzD59YvxX7tB9C293O3N/aX2je9owR1MjK7Hf9vT7dM=;
 h=X-PGP-Universal:From:Subject:To:Message-ID:Date:User-Agent:
 MIME-Version:X-Originating-IP:X-ClientProxiedBy:Content-Type:
 Content-Transfer-Encoding:Content-Language;
 b=nIEXZmQ/G+1gMG+6dfHhQRwhLOGoGrzPrGVJZ9J7UXYDxwR/ZR5vDXiXgiWg2HsnV
 PjLE46lToipNN89yyMEP3j/LySWzBJ+JKvUXXssAxpWwA9cP2vOfUVKSolVcrv4TGc
 1BDCuxXpsiUza42O1z6goDGGrz18p6ZDG+ISzZfBAv6g3sbtBzDPaWqHXGjIpIIVTD
 f2bk90G6vc6fuXbxgBwQRHvyd3b+JACAtAZsHzSH5hWq5Y2XOyj5I1OZChypt0Gkti
 yylVodxd4ZKChTMHKGCjBL4+938E8xMDeC1cIc+6Q+2ptX7uQ3OfRYn++Z6bCuU0Jj
 PbXRj/qx7obgQ==
X-Mailman-Approved-At: Thu, 03 Sep 2020 08:50:07 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,


Some time ago, I asked some questions about how to handle issues with 
DRM drivers attempting to touch eDP while muxed away, due to implicit 
assumptions about eDP being permanently connected. I've proposed some 
changes which prevent eDP access on switched-away eDP outputs for at 
least i915, but now I'd like to follow up on one of the topics that was 
brought up during that previous conversation: namely, how to deal with 
systems with multiple mux devices, where it may be desirable to address 
the muxes independently of each other. Currently, the apple-gmux driver 
seems to support multiple muxes by just switching them in sync with each 
other, exposing only one logical mux device to the vga-switcheroo 
subsystem to control both physical muxes.


Since then, I've proposed a driver for a mux that is present on some 
upcoming notebook designs, some of which have distinct muxes for 
internal and external display connections [1]. I don't believe any of 
these systems are available publicly just yet, but it's only a matter of 
time before they are. During the previous discussion, I believe Daniel 
Vetter stated that the ability to address multiple muxes is something 
that could be addressed when designing a "proper" userspace API for 
vga-switcheroo (i.e., not debugfs), so I'd like to get the conversation 
started on how we could go about designing this API.


[1] https://patchwork.kernel.org/patch/11751453/

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
