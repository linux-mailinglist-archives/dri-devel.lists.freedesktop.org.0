Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A623143CC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 00:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A056EA26;
	Mon,  8 Feb 2021 23:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3189 seconds by postgrey-1.36 at gabe;
 Mon, 08 Feb 2021 23:31:30 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488F96EA26
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 23:31:30 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1612827088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SegC4CV6d0P6W49MuLrns6yQuqABgobkVsLrpvW8HeY=;
 b=kr2DAhr74YkqNeARuoMvJoMdyKhsfEpsbHy9kVkAFkoKeCFy+XbwLVU4kHbs8DVRmAEhaT
 VNkKUjILUMYqpGsoOzZznrw1YmZV/iAX1R8WY40YTOGfRS7NDEK+NmQ0A/KTD9X1gekZH5
 +cgqjAukgyXtiuHbrwWM0vNEVBVR9u45beWhtCEAzzwFBqCNW8Qz4SPMGEFqCIKgyOYd8f
 1WqVSBv8m9Vg2z8Koi8guMZCWPl6sJ5AG0zFWjfw4g5VoOc7qMgpTtWoFZ4haT5B9NOenF
 plYyvoJE61ufpNviU6f9jMsxWdF3hnP4bela1n9fHJqw9qI9bag1IR7WWrIgqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1612827088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SegC4CV6d0P6W49MuLrns6yQuqABgobkVsLrpvW8HeY=;
 b=yfB/N7DmNnWqSeuabYv12ATEmhQBsZ62ZmJkqTCynRN+Oox+PNj3u7651X492/Bkts/18i
 36Byz2Pso16PDfBA==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm: Replace in_interrupt() usage.
Date: Tue,  9 Feb 2021 00:31:15 +0100
Message-Id: <20210208233119.391103-1-bigeasy@linutronix.de>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Folks,

in the discussion about preempt count consistency across kernel
configurations:

 https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/

it was concluded that the usage of in_interrupt() and related context
checks should be removed from non-core code.

In the long run, usage of 'preemptible, in_*irq etc.' should be banned from
driver code completely.

This series addresses the gma500 driver and parts of the amdgpu driver.
There are still call sites left in in the amdgpu driver.

Sebastian


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
