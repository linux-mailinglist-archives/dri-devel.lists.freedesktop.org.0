Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890DAA4EDB4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 20:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13E610E096;
	Tue,  4 Mar 2025 19:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="s0goX98w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 315 seconds by postgrey-1.36 at gabe;
 Tue, 04 Mar 2025 19:44:57 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB18F10E096
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1741117496; x=1741722296; i=wahrenst@gmx.net;
 bh=+PVDCSaWd7kj6AUbyv1/Qq32zBkkvCXfE2mJfsi7wrs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=s0goX98w9ODcvDsuSDA4uWMdnT4fhcY1z1zqG+tlffRNYUzsvCCpQPdjOnvHy6K9
 zMQ4PQ3coXO9uEw46u15onLmODbCbUPJBIbR8ZYdAefsXL+hsrRLWSahcfNBayuR+
 pXbcVx1BTl+Bgp048HfHgLbo1L18JWdCEdKryhC9fY+IbA2yfwRFjCZD8P8EcwjEn
 KzyIYdgalAPKjFMNEYeLmHpYBG64yhH0jj1UZq/DBkAxx1d+8itKkuJHjQsbxuHs6
 RKHzJcxF8Ik+1g9XJPk1yzHFYwTN6niuzR4PNESCes992bsiDLm4SgSQUYTNMzqzh
 5voLBGPBU4Y/9xhchA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M59C2-1toRe71588-00GgkX; Tue, 04
 Mar 2025 20:39:19 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: David Turner <david.turner@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-list@raspberrypi.com,
 linux-sound@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 1/2] drm/vc4: hdmi: Call HDMI hotplug helper on disconnect
Date: Tue,  4 Mar 2025 20:39:11 +0100
Message-Id: <20250304193912.5696-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304193912.5696-1-wahrenst@gmx.net>
References: <20250304193912.5696-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RjemSbaKMcCEugHtgOSazUH8ZnN5EEJ+J5iWJvUZxT8gBhx38Tl
 MJ2LBdXiyt3mk3ivdWslL6Bdeo02Jt7nnXIyVRmFXHxAz0ym8Av4osOif8aREtArWieRlJy
 QKiG1sPFGUkuqPH7iQz+42fOJGJCUNfZarQvACsy6bNfbdG2/IRufEd8XdlnqdrH98E9aYI
 +ZqqGIyxkBE6LDT7cXomw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+/YBCjGFQok=;CETDPRQQgp0M53tL5098wNVy2Ub
 BH114tewVbmsk5qu9OArpmQQ4tMhE2MkL8gL5jzqVHLe4N4r6FRUj07QJPud3pecmpRf/qstR
 xxuuK11MJEHE+7XIB2Xz7fna6ldqUMqR8tMXrV9bF39GQSjDAvIQXsN306sP5c04uSW4njj7A
 XB/GM5gu70IHQlc07LZ9nTRijUf//UQT/FDIj5vVond5wrM8z3M3D1s9D5kBp9DiIqNRZc6HR
 V3o/bBZ7tGudyNmGbyLmu1RuESCjy7wbJ5AYXB8HIY1/4EsUi7BQ+BGsNHbrAGYjHXmw9xCkx
 8IXUFXCkXdGY+UKTkEMywK8TVz/ukQrv2rVRr+qG4QB/y9zhRNejiTsYZQ80pwPw73Fsg5IYE
 vmodwf656dnF36rxvEohio2uRkJvCm95ES3n8wuPT5z4Qpk9tRKdCzDa2pHTJIixPAb17pGE3
 eG9Kae3tAYi4ApMDYBHSzF19NCuJYrcUCKhwQVzWTL+84zSEI7oK4VsN3vmoELCFb/QOjcIMT
 9WOjZEQ4aRmtCxoTQ2XUWe+RccGnjSfGXy/q4vA6BR+8rrxnwk5ouqiDxNEFZyeR+RsCgpylf
 LyvZk5X32RZF9gu/4PV+90LMsVrSpyLaxkvIuPXkCm7aKTwy7p76H8meoDzieJoPnL4KkELH6
 5isz3uLOp84wXee6T2bpc7MiSEHmmXE7lp5GJ2pqTmv+QicxUwl71Tf1tTNtF1C2dPetf+qko
 2EhBNGvYAjsYCqxFnspCvGdu9QVcOBXG7EO4iHzVzGcpltDICCStOPBBr3qs39VZW/YMSR0re
 tAzdkMOOpH726IqxijKqWeJZH+SVM26+WOObecDmxr7s95XMRTBRLfkuuUlJM2pK2RXN3GNHr
 s8iGsFDZNfYeooMxdpZLmr2u/JgbmaYimUQJuwmCmZh/Y6OASEQ2yYTQgFT9ZywggfhDpSVw0
 YOeNUfQnOVll2SYtSGv2AtfVFUI5NASdH3q0JA2um+0gI9aEl9/JXqx7/poPygpD1Sx9hKfUo
 QcUBkC3hUdIUVg3ykHJkC/dxXtS10dIHiat7nnfRkE0xAjtuYv0gt9JNUa/PyzLe7zcQysphC
 k6v3/h14cyr3z4VD6k1vy33mQXWEmtrzv/1bU/W2ItFr0XojLoxTxrgWSiEfBu8JB41H3Qfwt
 Yy5aSSL95fAlvwTiYmfLGcTpA2J+lFIZumk9m493hr9i5g23vg1WTEh8svBUIRTo1XLZbNiGc
 WWlATz0HgjhwRlVQxzbsHxYofhKM40/afdt59o/yC7WBqvncO46+BgAbw0v/ebrXqmNu5Quj/
 4+lM6RicUk0tAflvhHUIGhUTlygXUgmM+iJGDDGfaZ0eoIvUnqAfDt03hHtoKqPTpyOBiT3BF
 vWYUPQIpFLwUi3QrQ2LKBGv/DHDST/hyyQy2P1uEwXzvIyju5it+J1ucSB
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

drm_atomic_helper_connector_hdmi_hotplug() must be called
regardless of the connection status, otherwise the HDMI audio
disconnect event won't be notified.

Fixes: 2ea9ec5d2c20 ("drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_=
hotplug()")
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi=
.c
index 47d9ada98430..e4b027616d04 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -400,13 +400,13 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi =
*vc4_hdmi,
 	 * the lock for now.
 	 */

+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
+
 	if (status =3D=3D connector_status_disconnected) {
 		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 		return;
 	}

-	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
-
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);

=2D-
2.34.1

