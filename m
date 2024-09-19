Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EE497CDDA
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 20:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7097510E76C;
	Thu, 19 Sep 2024 18:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=internode.on.net header.i=@internode.on.net header.b="aBjBiQxO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 7119 seconds by postgrey-1.36 at gabe;
 Thu, 19 Sep 2024 18:55:27 UTC
Received: from omr000.pc5.atmailcloud.com (omr000.pc5.atmailcloud.com
 [103.150.252.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831A710E76C;
 Thu, 19 Sep 2024 18:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=internode.on.net; s=202309; h=MIME-Version:Message-ID:Date:Subject:To:From:
 content-type; bh=CNvzFe9fGd98RlReCYS+NNkkhCDG6VKvF/0EOMmVuWw=; b=aBjBiQxONcG+
 WStWCQNFMDyM5XL8L1jEzI2qqij749Gda8n53drz+derd8HA4XwjKNa1vC5DUQSy7cyHzmZZFGv/i
 G+nnprzZT7RD0myzz/ZaRUj4YYxRhCBLVjgZZyFZH7sAmglhQi35Q18txbtpwAK2d1sga2+NtVtzS
 cvf6N0YJ+WBlWG4v4QV8JyCDTRXH0LecxI/++lVRzLSvTsqUs+EBwPtRX2Zm+RnIrG47s2/xXCkbM
 7f9S5CEcTO7E09RwZmIP6KPW0RQrpHSGLZy77sAn0GMAh3vSQjJqElpc4FhJRUPPtZP1sMvxuFBXa
 1em9/3Q+IyV26dom6HPYbw==;
Received: from CMR-KAKADU01.i-02175a00542f9bb7e
 by OMR.i-011229ae50fa0cd71 with esmtps
 (envelope-from <arthur.marsh@internode.on.net>)
 id 1srKST-000000006NL-2t4y; Thu, 19 Sep 2024 16:56:45 +0000
Received: from [203.173.7.72] (helo=localhost)
 by CMR-KAKADU01.i-02175a00542f9bb7e with esmtpsa
 (envelope-from <arthur.marsh@internode.on.net>)
 id 1srKST-000000004vD-06HQ; Thu, 19 Sep 2024 16:56:45 +0000
Received: from amarsh04 by localhost with local (Exim 4.98)
 (envelope-from <arthur.marsh@internode.on.net>)
 id 1srKSP-000000001Cq-1EPo; Fri, 20 Sep 2024 02:26:41 +0930
From: Arthur Marsh <arthur.marsh@internode.on.net>
To: wuhoipok@gmail.com
Cc: Xinhui.Pan@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de, arthur.marsh@internode.on.net
Subject: drm/radeon: remove load callback from kms_driver
Date: Fri, 20 Sep 2024 02:26:40 +0930
Message-ID: <20240919165641.4632-1-user@am64>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240630165949.117634-3-wuhoipok@gmail.com>
References: <20240630165949.117634-3-wuhoipok@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Atmail-Id: arthur.marsh@internode.on.net
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=S/DfwpsP c=1 sm=1 tr=0 ts=66ec57cd
 a=q73fGBFtUWUW5y4nvQjQTA==:117 a=q73fGBFtUWUW5y4nvQjQTA==:17
 a=EaEq8P2WXUwA:10 a=x7bEGLp0ZPQA:10 a=pGLkceISAAAA:8 a=aIJAOKreiCTeCyBpU-sA:9
X-Cm-Envelope: MS4xfHYppumKWIUnyI2Ju0M49vhnvlI5I58KLh4+FPPY2NoGJ2kbZEMp8UJ0GP5RcBj4Y7lrVRzdx8vKa/zkhB+xX2yttGtN9cY+gbgwMpCjdJRG9KUiZfoW
 mgFQnH+Gory5lpvGZtlBfdI/y0NdXfFypS6yxqGrTmIK0ZplfmRYhuA0wyzStGh3shfYwSgojx+DgA==
X-atmailcloud-route: unknown
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

Recent kernels resulted in a blank screen, with Xorg.0.log reporting:

(II) [KMS] drm report modesetting isn't supported.

Sometimes while bisecting the pc came to a complete lockup (magic Sysreq 
unresponsive).

At the end of bisecting I had:

90985660ba488cd3428706e7d53d6c9cdbbf3101 is the first bad commit
commit 90985660ba488cd3428706e7d53d6c9cdbbf3101
Author: Wu Hoi Pok <wuhoipok@gmail.com>
Date:   Sun Jun 30 12:59:18 2024 -0400

    drm/radeon: remove load callback from kms_driver
    
    The ".load" callback in "struct drm_driver" is deprecated. In order to remove
    the callback, we have to manually call "radeon_driver_load_kms" instead.

This machine reports having:

AMD A10-6800K APU with Radeon HD Graphics

with the gpu appearing as 

Advanced Micro Devices [AMD/ATI] Richland [Radeon HD 8670D] 1002:990c

Regards,

Arthur Marsh.
