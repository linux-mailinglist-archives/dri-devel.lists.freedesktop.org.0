Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABD5C54E52
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 01:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABCF10E0D8;
	Thu, 13 Nov 2025 00:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CIopdZUQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D1410E737
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 13:43:45 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-45066bee74aso189530b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 05:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762955024; x=1763559824; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nrx4AQ37NTMlQlrdjLvdwNh3PznoIEilNEwhKspqDuA=;
 b=CIopdZUQ278N0OSm5s84kBOyl4HhsfAVVtDmKgQsvXPs+aVZlhQbYC53GKqr6BYcgY
 s+snevJjM/SYrvzyWHhtUMlDHKIldTfnOtrhSNMMoAe6sHY8wYW1QvSMdA+XUfyNX/GS
 fm0XITso/HhlpeX/rLBsIJ5dbNJJ4HB+BltDV2jtiwkfWbc6B8/G4P/QO2HSyDwSx80r
 8vnKS+eqJkekovFtivbNKwRPyKnYefWCyNe1UHQCZoflDu9jqepuUvAOM7Bj/8U/tAEz
 ePUqJ/mTwDP6Uyw/O3SoXoVV5F04VZn7r1n6AAxGra4S/BYM58ADZzHUxbiWBFd6ptV9
 broA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762955024; x=1763559824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nrx4AQ37NTMlQlrdjLvdwNh3PznoIEilNEwhKspqDuA=;
 b=d30l87c44cN8GUqPf6wZ4XBT79XfGUeGbXDn2Ckr+vgsmjb7Y71s2nbX16ShR0ONyZ
 CDLuMEW1YAv+6efpAip5ia8dxAMH+28x/uifJt4zcbfXB2tI0Nn/FkYIsKTrarufXaY4
 OZ7KjLNGEFlbvPbC1fIN4qhtozP+HfDxKw2OXq5qDO7ZJDY1oCRFcRgt1vlwjzBxeFME
 p/ZFh6MBYveCoD0wQ9WQ2Ki0bTm4UO9RvW0JCPqehBoWA5HxcMM9H8FTSCB+xVQFE3fz
 5mJT8KFIJyL131bkR9JVE6cLDGJvYjTeJVVetW/W+IItf83lLQsacImOWrxcgPkW5Y+l
 ZAlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4p1xS7uZQk62xnPE+U2/8YxoGVFq+HPE3x0GHV10GWaUHqWyVPydZ2C7TQLTKCA1FhiZUzTM9RpY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSZV1AYQZueS9mfzOPmEtbgpOJn+/QNku2UjzLFFZVA/bjldZ1
 4y2mOCt/hRKj0F4tlTbVy1/JuAkqkV44EhtJ0GqcNTT70OE68s5sL8fZ
X-Gm-Gg: ASbGncvOPXisGzpSfAK8egTMDxM3XtURGRMv/hb8k9AOfM4UldxYb6HwTV4qKAxufTL
 HsUS/Kk9/6YeEwlMyKk7gSOF+PLPolhHqVINosLe4iCxRCUszFTc7A+2IEMchDYyoIKkkukHWBi
 5AUjZ/r3NBRT/j2+2a47QJnRuSLC0OJN5F1piyQ8Y4lwpK8IiAgu3Fx1evRe2MCakhESJ7P6F+o
 nuVd1oJktdaBnr4GpTpCXhszwy32mqkkl+KmLeh8EOywy2XDahWXQcya1ImASdACx3z5b0K2QPL
 mET+h08LVdgzi6h1cjH9Rj+nxaWSYTD57TKhjI9MWzX6xZVRVV5OX+sQjlJBzjPK/0H6UpJpzMP
 DltoVqy6aJOzg/R5WtcldEgWv2n6+M5sKmNtCz6/I6/dT5KHbpHVrUC/Ukn89tVNA11iQNQbvFS
 ciknbvhA7jD6Lhr+cYD5g=
X-Google-Smtp-Source: AGHT+IGGEG0M4F+2nw/6k2Jj5qk4SYppzNCowShS2/IeRUKr/7WvnQpWJnPJxfp116J4+oYTibRTWQ==
X-Received: by 2002:a05:6808:4897:10b0:450:6533:f4ec with SMTP id
 5614622812f47-450745ae683mr1077968b6e.39.1762955024481; 
 Wed, 12 Nov 2025 05:43:44 -0800 (PST)
Received: from fedora ([2804:1b3:a701:421a:3b43:be3f:fcb3:28a9])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7c70641ad1asm5482402a34.21.2025.11.12.05.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 05:43:44 -0800 (PST)
From: Gustavo Padovan <gfpadovan@gmail.com>
X-Google-Original-From: Gustavo Padovan <gustavo.padovan@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, gustavo@padovan.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org
Subject: [PATCH] MAINTAINERS: remove myself from sync framework
Date: Wed, 12 Nov 2025 10:43:30 -0300
Message-ID: <20251112134330.64130-1-gustavo.padovan@collabora.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Nov 2025 00:28:26 +0000
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

From: Gustavo Padovan <gustavo@padovan.org>

I haven't been involved in the work anymore for some time.
It is only fair that I remove myself from it and let other
continue to take care of it.

Signed-off-by: Gustavo Padovan <gustavo@padovan.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f0c8b85baa6b..4c565ed24ca5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24824,7 +24824,6 @@ F:	drivers/regulator/sy8106a-regulator.c
 
 SYNC FILE FRAMEWORK
 M:	Sumit Semwal <sumit.semwal@linaro.org>
-R:	Gustavo Padovan <gustavo@padovan.org>
 L:	linux-media@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-- 
2.51.1

