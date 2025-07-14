Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F1DB052E1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731AB10E1A5;
	Tue, 15 Jul 2025 07:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scandent.com header.i=@scandent.com header.b="hLynrRWz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7A010E02C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 22:06:38 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7e3142e58cfso94128385a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=scandent.com; s=google; t=1752530797; x=1753135597;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WIaH38Gh5kKcHJRj8XVnX3nblAGXvNpyNwpxmX14OvU=;
 b=hLynrRWzeFUXXuZwpx8FA3AqrI6QL+ruqBsXzZ3mGS6/C1gukJvsKdKEh150aOnt6r
 gegKauL1Dp3yaiSV0WEzm2yx3Zyg/xry0WkWuMnrbuoYI1MCAGysmbksaP97cXvWfJXn
 U5Yy8gCNtQ5hROxm+2oQNnK93gt8T/4DBPz42C703ETz41od0CGsVb6hLQoZThV9p5ro
 xoUXNroDCfGxRmOGWC/T7CH9s10vhb0Rgj4tq7xG9rUaZmOOEqxk+RDTS1p/Wt9/Bhwm
 ZEQwWrHyDHhPTAUtYwUqnU6wKA4VZMRwsabSQ0Vz5kLVmtOa4f4gLZYZwsc3LXvMihg0
 i9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752530797; x=1753135597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIaH38Gh5kKcHJRj8XVnX3nblAGXvNpyNwpxmX14OvU=;
 b=BUhAV+cSPZWmTCnXPMDJ1OmsmPpDKXojv5XP6ll39MRA22CFeCFsMsijSTX2tTspgH
 K/lOpEpHkM3F4ogGPjJqRID6WyPwaWBLdTbGvBEa3d8sjg5pOjzsXtsJYNawM9XY6nDk
 zOf/mdTCoGmlqrznwwWjovQLkyFSifZjTSoYNES8fjapBj47tn887lXzsOGNT/P9Nyd/
 UGOJayzEEVCW2dKN/PlKoaiPnAfnOOkR5R05+KhU1uh2J9/43++cTVotN2f+g8n5dRUR
 og4PTTZ8pnxgXdqfEygA6X/mz8flx/hmk9e5Heo+rfUmm99+d8UQ/Tx/dUbVkY1zCmJh
 ypCw==
X-Gm-Message-State: AOJu0Yy7HDA4dus8oVGZqdak+3dsJh6DsvAou6LEyAp7y3yAZIWsg4EZ
 gOLjj3Ux5KTQKlzXF0BkSVc4QLvBctl6geo1MrAuYuGZ9C2odDQYNiN2GF9lFVbg4+ZZqHEgNop
 TClnB3bA=
X-Gm-Gg: ASbGnct2jqaJTH2DyA5Pk9k4E+byzFI73ixSpc29vLywku3IGlAfEezvcvwq7UMtYho
 H1aYAl9spaeZ64wX2ZlgbRnhkbBujY90XkWSDlq7Hx7fbMRRKYtVWbu+CF7yDPxYmI8PRDyIlH3
 KFYFjszrG9V90LyCConzbwasuYTuIOngeVUKZxaJQCj4/lULCCteDIVljeV1TYThEdaT2+4LELB
 TNKpcaC47nI09TErEhDzBwT3ZVTSCr0TPsnR7i56S91IgXhhiPymZmwzOOhMOVGfv/eax6zd6/m
 VIgywY66JGP3GcKfmedgtNrqaRqB84tgnZ8K9GZ05j8FhXS4zjkuKCUsL7hHDY/3/TgqDiMSrh3
 drQDjak6SLqVe3S8UUQ80UD+KAN2JJAXm1BBE83I+/9xHtqykULkwfNV6yOw=
X-Google-Smtp-Source: AGHT+IGo6sk1WOwGd8qfuaMpolZbEey/HPUdTGdDHSrcv6A5rEBSXicgFwOvAcgwkS+TBGqrLBP+/A==
X-Received: by 2002:a05:620a:371e:b0:7dc:8bf9:ee6c with SMTP id
 af79cd13be357-7de04fafb6bmr2174431185a.23.1752530796908; 
 Mon, 14 Jul 2025 15:06:36 -0700 (PDT)
Received: from vserver (ool-44c5118c.dyn.optonline.net. [68.197.17.140])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ab6fdc7731sm13137311cf.40.2025.07.14.15.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:06:36 -0700 (PDT)
From: Richard Yao <richard@scandent.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akshay Athalye <akshay@scandent.com>, Richard Yao <richard@scandent.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Junhao Xie <bigfoot@classfun.cn>, Andre Przywara <andre.przywara@arm.com>,
 Caleb James DeLisle <cjd@cjdns.fr>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Tianxianwei name
Date: Mon, 14 Jul 2025 18:06:22 -0400
Message-ID: <20250714220627.23585-2-richard@scandent.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250714220627.23585-1-richard@scandent.com>
References: <20250714220627.23585-1-richard@scandent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Jul 2025 07:24:49 +0000
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

Tianxianwei is a company based in Shenzhen, China, making LCD screens.

Add their name to the list of vendors.

Signed-off-by: Richard Yao <richard@scandent.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6..a2151e2aef4b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1548,6 +1548,8 @@ patternProperties:
     description: Texas Instruments
   "^tianma,.*":
     description: Tianma Micro-electronics Co., Ltd.
+  "^tianxianwei,.*":
+    description: Shenzhen Tianxianwei technology co., LTD
   "^tlm,.*":
     description: Trusted Logic Mobility
   "^tmt,.*":
-- 
2.50.0

