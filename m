Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8565A5B3B7F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 17:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14DF10EE00;
	Fri,  9 Sep 2022 15:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 103A510EE00
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 15:10:10 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id 80FFA204B50B;
 Fri,  9 Sep 2022 08:10:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 80FFA204B50B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1662736209;
 bh=BQWwqqe1UKwBk425BTnMB7wqR9ai9g0mdnqtA+m/cfA=;
 h=From:To:Subject:Date:From;
 b=fErrCb1qQ1kw6G2AcFQUXHxW+K19T01W/nj4SmkFbSm2W0N3uCpACwitNoXiFN4Qx
 /xFsuyxv9X2ADxZtQCNmgTcBmxewEpcWQceVY+LKrcUTEQncWUXNmBqtV+ya3tkuYU
 5VcOabE/1z9l8DVMUUtdaN2MjSdfRLAEQ5x86r30=
From: Saurabh Sengar <ssengar@linux.microsoft.com>
To: ssengar@microsoft.com, drawat.floss@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mikelley@microsoft.com
Subject: [PATCH] drm/hyperv: Add ratelimit on error message
Date: Fri,  9 Sep 2022 08:09:53 -0700
Message-Id: <1662736193-31379-1-git-send-email-ssengar@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
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

Due to a full ring buffer, the driver may be unable to send updates to
the Hyper-V host.  But outputing the error message can make the problem
worse because console output is also typically written to the frame
buffer.
Rate limiting the error message, also output the error code for additional
diagnosability.

Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_proto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
index 76a182a..013a782 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
@@ -208,7 +208,7 @@ static inline int hyperv_sendpacket(struct hv_device *hdev, struct synthvid_msg
 			       VM_PKT_DATA_INBAND, 0);
 
 	if (ret)
-		drm_err(&hv->dev, "Unable to send packet via vmbus\n");
+		drm_err_ratelimited(&hv->dev, "Unable to send packet via vmbus; error %d\n", ret);
 
 	return ret;
 }
-- 
1.8.3.1

