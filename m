Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A67A5CB6D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 17:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAF710E08D;
	Tue, 11 Mar 2025 16:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="S0TFRpJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9136A10E08D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 16:57:20 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id F2FB4584532
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 16:40:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 603A520454;
 Tue, 11 Mar 2025 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741711237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BX8MNYhz0nxWMzf1+xnQg1mi6wTmP7EBm2twdrUm7v8=;
 b=S0TFRpJ3AyXV9KHXjY5DlNxy8NO77/HuAixVNSs7sGUyZTxK9DmwQWfxhelgTcgemMKMB7
 UIyQ4/OfmUou5NxHIwa50NR8okTD8lwfCay12eooeCDGN55QL78Sg5LCO9z5mN16rHQSOr
 K+jKvlF2WKQt1hIU7McWkR4W+kCPSoZFsnrURAlQbcQyCKFGGJk5szB4dKOyP8xasRka8k
 leaMIh+0fGcyVvtomgHmSrBiBOlxblI5k2fs/8VwhyVs8N1Qwn5+PQsyYplsyuCWY0Mrc5
 4h212PLBmKylB8nIa3iBN+MXwoGDNu9PxYxWqeqOOjZa4rQse0sAja2jWANfeA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Add POWERTIP PH128800T004-ZZA01 panel support
Date: Tue, 11 Mar 2025 17:40:04 +0100
Message-Id: <20250311-add-powertip-ph128800t004-v1-0-7f95e6984cea@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGVn0GcC/x3MQQqAIBBA0avErBsYLSm6SrSwHGs2JRoVhHdPW
 r7F/y8kjsIJhuqFyJckOfYCVVewbHZfGcUVgyZtqFGE1jkMx83xlIBhU7rviU6iFtvGGt8pv2g
 zQ+lDZC/P/x6nnD8NnyvfawAAAA==
X-Change-ID: 20250310-add-powertip-ph128800t004-43a5f71fc25b
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=764;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Wy+8EZh4dGWZSx8yJwDto+VPZKMU0wZaUq8VJgwIZis=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn0Gd8GLC2HXiom4X5kjgGEKBoCePp32te7YSYp
 g1Anj9pVY2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9BnfAAKCRDRgEFAKaOo
 Nl7cD/oCcuiDxHD7QS8L/NYIxlsF3/CkbY1JS5sa9dgPU3wg65FgLdhlVrywFTQa8vP7vf3wbbL
 nrjEr9+1L1+U2ddN47tCM1ute9s3JD9/I32zMm6kU2GDm+v4AUvzaAIk4ey9Ze+JoFLc7O+e9s0
 LyOZdNNqkypPCg/5Y/Uv0ZGersIZZk9P89dzoBnar5ADJ/TZewLIQOxYsl9gATCp1WsXAVG+j1X
 LBc0Ly8q/bzVp/7xA6fSpkdnx+UNUu0TcDEsT3pDHxfFpULOAuHL8uJKP7lDJaQo6L5ULPECa48
 OPomMsNGB89zVdcSEDjsgaEF9cTmr1rN+LpIwhiDwfYsODH506TTO+oTLl82OUkNGpjrY0tA0do
 79kKB5H+vMdfb1H1Xp+4KOcKWc4FyHir9yfJgdP242Qbdbb7HC89Z6oJZJrwiYwcv8j6q2DVwqm
 qc0/GQaN0bSrwz8bnRfnRItPz4rTNGgbxREsoD2j/js5Z4s1QnOcNLgnR/F7EBTPMnt56/DMdDT
 yzxDhrcf+t7VMxYIgoajRtsk2GdwljveeGea3Cd27pNfzyHAdjyPY5tRPXVS+h62EZ+KhnCdcl9
 hCRMv9pwxfst9xPo/ZqD1ffBscmcnTsXFFf53iqxP7tWZkpfSgGfmLtOSpdHVarfRyAv3bpEBYg
 55a/I8VMSGMabzQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduvdefkeffteeluedvgffhjeegffduveegfffghfejteejkedvgfeuvedtudejkeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvl
 hdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
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

The POWERTIP PH128800T004-ZZA01 panel is close to the POWERTIP
PH128800T006-ZHC01, with different timings. Add a binding and a panel
entry under panel-simple.c.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      dt-bindings: display: simple: Add POWERTIP PH128800T004-ZZA01 panel
      drm/panel: simple: Add POWERTIP PH128800T004-ZZA01 panel entry

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 29 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
---
base-commit: 66683f3b2661643f694607283ee8f01b7a934c83
change-id: 20250310-add-powertip-ph128800t004-43a5f71fc25b

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

