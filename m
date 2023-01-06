Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AC2660848
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 21:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2997C10E8F5;
	Fri,  6 Jan 2023 20:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 12600 seconds by postgrey-1.36 at gabe;
 Fri, 06 Jan 2023 20:26:54 UTC
Received: from 2.mo583.mail-out.ovh.net (2.mo583.mail-out.ovh.net
 [178.33.109.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E7510E8EF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 20:26:54 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.156.105])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 7153C265FC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 16:49:45 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-dkv5l (unknown [10.110.171.46])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 774621FEFA;
 Fri,  6 Jan 2023 16:49:44 +0000 (UTC)
Received: from sk2.org ([37.59.142.107])
 by ghost-submission-6684bf9d7b-dkv5l with ESMTPSA
 id qEZ3EChRuGOnAQEAwhnnFg
 (envelope-from <steve@sk2.org>); Fri, 06 Jan 2023 16:49:44 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0016c7c8180-8638-4f18-99c1-2227c532a771,
 9FE29456621203A27B372E1E0503D45BE0167874) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 0/4] video/backlight: Use backlight helpers
Date: Fri,  6 Jan 2023 17:48:51 +0100
Message-Id: <20230106164856.1453819-1-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5848205592908039899
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkedtgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeelgeetueejffejfeejvefhtddufeejgfetleegtddukeelieelvddvteduveejtdenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsthgvvhgvsehskhdvrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
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
Cc: Stephen Kitt <steve@sk2.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This started with work on the removal of backlight_properties'
deprecated fb_blank field, much of which can be taken care of by using
helper functions provided by backlight.h instead of directly accessing
fields in backlight_properties. This patch series doesn't involve
fb_blank, but it still seems useful to use helper functions where
appropriate.

Stephen Kitt (4):
  backlight: aat2870: Use backlight helper
  backlight: arcxcnn: Use backlight helper
  backlight: ipaq_micro: Use backlight helper
  backlight: tosa: Use backlight helper

 drivers/video/backlight/aat2870_bl.c    | 7 +------
 drivers/video/backlight/arcxcnn_bl.c    | 5 +----
 drivers/video/backlight/ipaq_micro_bl.c | 7 +------
 drivers/video/backlight/tosa_bl.c       | 7 +------
 4 files changed, 4 insertions(+), 22 deletions(-)

-- 
2.30.2

