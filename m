Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CCBA5D9B9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 10:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0469510E031;
	Wed, 12 Mar 2025 09:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lEiKlRFD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AAC10E031
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 09:41:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F25A24314D;
 Wed, 12 Mar 2025 09:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741772490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYd5syVLmKdM205IPiqRZrSysfgoPICXjHhl29L/kEQ=;
 b=lEiKlRFDzkw8g2+H8Nm4fftbGYrCE92LfxOVzb+R7OkJzqCvjVFZZjpXcsztK6IU4JDrE9
 DkEE5uR7w3lYDAIKvk8gmTyfln9g1j6tJbvS+WiJPrWGzyOAHFmt2CSuAStT1t4o62w7L9
 Io0gsVJ28Iry2yl34jRLHc02pcLF7q03MSTu5RZ00+kcx0B96oYJa1hO8EDUoOKhH3B5dr
 lpRqGVkJ7anV4F90i1IuRD+srpYfh2SKF2l7GBL08zSJW+5UrL6NeumIGgaMcmBwFCjyct
 OtkCQadziDUVsTY1S7yCSzBSHBRT/ZHWSg5J1JXNW46KZl2Px1YQ7j16whkLbA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250311-add-powertip-ph128800t004-v1-0-7f95e6984cea@bootlin.com>
References: <20250311-add-powertip-ph128800t004-v1-0-7f95e6984cea@bootlin.com>
Subject: Re: [PATCH 0/2] Add POWERTIP PH128800T004-ZZA01 panel support
Message-Id: <174177248888.2707180.3560466107849632577.b4-ty@bootlin.com>
Date: Wed, 12 Mar 2025 10:41:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdegjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejheeiledvkeeigeeluddtleejvdfhleefleffffeitdetvdeltddttddtgfelteenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddujedrtddrudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhim
 hhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: louis.chauvet@bootlin.com
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


On Tue, 11 Mar 2025 17:40:04 +0100, Antonin Godard wrote:
> The POWERTIP PH128800T004-ZZA01 panel is close to the POWERTIP
> PH128800T006-ZHC01, with different timings. Add a binding and a panel
> entry under panel-simple.c.
> 
> 

Applied, thanks!

[1/2] dt-bindings: display: simple: Add POWERTIP PH128800T004-ZZA01 panel
      commit: 36cb24049b911ed83d34441cd2e9adebfc999da8
[2/2] drm/panel: simple: Add POWERTIP PH128800T004-ZZA01 panel entry
      commit: 6374a1005f20c1c2f7bbcc1bc735c2be4910a685

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

