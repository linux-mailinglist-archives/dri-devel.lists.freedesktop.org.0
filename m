Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EFDADC7E0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 12:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8385810E5CA;
	Tue, 17 Jun 2025 10:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lNE93oYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A6710E045
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 02:17:48 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b2f62bbb5d6so3001057a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 19:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750040267; x=1750645067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KZMQS+IaNs/xpTUGHSm25tygrtlj4jikbdPrhHwUj8Q=;
 b=lNE93oYxhPl6doV+eSDwq0HWOKbnuCDfQwaYOTp6NDyviT35s1O5aaglhV95myIqoI
 b4I6OmMTkCmwc/jMl0UBMfRM2ZBW1/7FGypUVQvMVtDBwHP+n9xMjhmonBU1IAkuvWVE
 FiVr76HQGF2L53ej6ol9FY9G01yy/FlNQm5eycCH21GPd1yfgFi+Xp9mMUq5MZs4VCWJ
 lz82HzHJiyszj7aV8xQyvflllDORcVMW409wJ5ym331TCiZGMRNWZzKYXT8SP9cxei1U
 v6IQC/D/L182vrmDgyYB98bJ1L7rUpjfFJ3Cz71kSYh419ZtZDiCZ6fXO8+2QS4qdyYC
 PuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750040267; x=1750645067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KZMQS+IaNs/xpTUGHSm25tygrtlj4jikbdPrhHwUj8Q=;
 b=Fg/UkUhtaWRIAXoEkwmGtWldw+e7NtHLzI0p5oH1z+aGKIUgt5jP5U6x1wTICZuk5l
 KNbAwaFqMwcO8iQzRNJlafHmjQyc3bFhhz2SLyZAoYK04JmIh23Bt1NCzEqSqtuaKdsx
 MfmSu+yukWsuDLF/jiQ3wrLnM0LpORDE+nAQQSjpD7yBrlHsMuSZtEHJnu3ZZg2U7nWs
 QFy+6VBk0RkIHmfF0imoMCdJMZzR/lUqmi9ePxO+kdntlFWS5jaRcyOI3ipJkXAqu5lC
 J9h22+YSf7DIf/814g6/+E8Y/lQXyXxgLB0lycwfEor1jAe+P8EQ4BtQgNNCJ0O9tTx6
 PpmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhkI/PssWelXAGoZ4go7mo1aLsdGjuN5b7fk86lTCHHcLElvZ6VnyQXEia/MiCYkGqaAV5pZiaOL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAbN9TLohLTEK4l9T67G9vJ060IVGvacMAclQeFd9Fx6jFWeTz
 56l0KMs1K7X5gYnq+n39Oc7eqleSzLIhn7pduTz5TEsnnYC7Atfp6ByL
X-Gm-Gg: ASbGncuz25T+Mu+xI48vsIFknPCVk2a3C8lowLA9uSuaiUE4vwfJo+JsfWf8SVtu5+d
 Fe0wfGePgJV11sHeOTMYVvFuTb0rNzx4LuBtja9rRVUt7zj141E/WXZ/J3UXU6+uM4uLc+b5BBW
 SirE4wSu/FVvdkFwAF3W1XlFmeDEChN+dS+c7xisRBaEtbvz1sK5Fbv24YI9lBugiVW+TM88ig4
 CYfFF5C7/DPXgx7dCWXJdSOYqsE0Hjy/UMxZdX0Bs+hl8FRc+wpDHEAvHvVjPludvgIOTeHqja4
 7ZsGKi1518MnSy0Ci6VdBnYi2HLSiR7doaSIYB8cZ86+yNk7RDgLHfotZWQiqXx/sShxkGaC0ae
 EJL2En+o3tFagRzayKEN/yeEj/kyoy0wij4Rot4pnWcY/X0erJmYPk1510Hb9N4I=
X-Google-Smtp-Source: AGHT+IHDsJZGj+lDxZG5TgbN438rJtv/FU3URTV5UDwqjTi3dIwneqJsEiiTD8dmycjHVTZ+/dQLfw==
X-Received: by 2002:a05:6a21:648b:b0:21f:53e4:1925 with SMTP id
 adf61e73a8af0-21fbd523a1dmr9778681637.10.1750040266910; 
 Sun, 15 Jun 2025 19:17:46 -0700 (PDT)
Received: from hyeon-Virtual-Machine.mshome.net
 (syn-172-089-148-138.res.spectrum.com. [172.89.148.138])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe1689814sm4718037a12.51.2025.06.15.19.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jun 2025 19:17:46 -0700 (PDT)
From: HyeonSu Jeon <dev.hyeonsu.jeon@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, corbet@lwn.net
Cc: HyeonSu Jeon <dev.hyeonsu.jeon@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: nouveau: remove invalid kernel-doc reference to r535.c
Date: Sun, 15 Jun 2025 19:17:42 -0700
Message-Id: <20250616021742.8304-1-dev.hyeonsu.jeon@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 Jun 2025 10:16:27 +0000
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

The file drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c does not exist
in the tree, but is referenced in gsp.rst via a kernel-doc directive.
This causes an error during the documentation build

Removing this refernce resolves the error

Signed-off-by: HyeonSu Jeon <dev.hyeonsu.jeon@gmail.com>
---
 Documentation/gpu/nouveau.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
index b8c801e0068c..cab4a8eda850 100644
--- a/Documentation/gpu/nouveau.rst
+++ b/Documentation/gpu/nouveau.rst
@@ -25,8 +25,5 @@ providing a consistent API to upper layers of the driver stack.
 GSP Support
 ------------------------
 
-.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
-   :doc: GSP message queue element
-
 .. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
    :doc: GSP message handling policy
-- 
2.34.1

