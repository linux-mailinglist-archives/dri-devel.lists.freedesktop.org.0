Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA5E6A4C69
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 21:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B78510E1CF;
	Mon, 27 Feb 2023 20:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314B310E1CF;
 Mon, 27 Feb 2023 20:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=skccS5dCHnUWuDDB7Qkqv95X91Iw1J6jxu1lqMy1F1M=; b=OMC/ULOELfp3GHxMbmwvDd92f+
 3XC5UUjde61y0pWmQVIAsg9N/loY+0FdX/bo47xZiwJ+PmDOMzsIw85uBvLw/Qb/jG71r07NzwQIL
 Z9rXJqFRqRFNfvfWTThc4TzAyfV5vi1McYXCZ1H33FFiO802/VNBXK6bKDigPI4ymtPlDbS/rl8LN
 KWXqstkVH4GT8vFkZMZbTYcbmRbOMX4sDfBrGOAR5FKG5gfeJt6y2SRXFp+iRn3vlxfEN3c7k+IQ8
 UP0b0weaHwOYq1JWqXiUF9PI7WNAk1o3NQDNiy5gGMWvZwCv+Iy25c0oLtbKrZlPoEotynXQiDqQA
 YO52NAhA==;
Received: from [181.199.58.72] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pWkI2-00H62x-4L; Mon, 27 Feb 2023 21:40:06 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] drm: Add doc about GPU reset
Date: Mon, 27 Feb 2023 15:39:59 -0500
Message-Id: <20230227204000.56787-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.39.2
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 amaranath.somalapuram@amd.com, Pekka Paalanen <ppaalanen@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 contactshashanksharma@gmail.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks everyone that gave feedback. v2 Changes:
- This new version is a section of drm-uapi instead of a new file
- Drop requirement for KMD to kill applications
- Drop role of init systems on compositors recover
- Drop assumption that robust apps creates new contexts

Original cover letter bellow:

Due to the complexity of its stack and the apps that we run on it, GPU resets
are for granted. What's left for driver developers is how to make resets a
smooth experience as possible. While some OS's can recover or show an error
message in such cases, Linux is more a hit-and-miss due to its lack of
standardization and guidelines of what to do in such cases.

This is the goal of this document, to proper define what should happen after a
GPU reset so developers can start acting on top of this. An IGT test should be
created to validate this for each driver.

Initially my approach was to expose an uevent for GPU resets, as it can be seen
here[1]. However, even if an uevent can be useful for some use cases (e.g.
telemetry and error reporting), for the "OS integration" case of GPU resets
it would be more productive to have something defined through the stack.

Thanks,
	André

[1] https://lore.kernel.org/amd-gfx/20221125175203.52481-1-andrealmeid@igalia.com/

André Almeida (1):
  drm/doc: Document DRM device reset expectations

 Documentation/gpu/drm-uapi.rst | 51 ++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

-- 
2.39.2

