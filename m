Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1023042C60E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 18:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1442B6EA85;
	Wed, 13 Oct 2021 16:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DC56EA82;
 Wed, 13 Oct 2021 16:16:41 +0000 (UTC)
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP
 (IdeaSmtpServer 3.0.0)
 id f7a05deb65d81dcd; Wed, 13 Oct 2021 18:16:39 +0200
Received: from kreacher.localnet (unknown [213.134.161.244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by v370.home.net.pl (Postfix) with ESMTPSA id 77EAD66A871;
 Wed, 13 Oct 2021 18:16:38 +0200 (CEST)
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Linux ACPI <linux-acpi@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [PATCH v2 2/7] nouveau: ACPI: Use the ACPI_COMPANION() macro directly
Date: Wed, 13 Oct 2021 18:08:06 +0200
Message-ID: <2240749.ElGaqSPkdT@kreacher>
In-Reply-To: <21245442.EfDdHjke4D@kreacher>
References: <4369779.LvFx2qVVIh@kreacher> <21245442.EfDdHjke4D@kreacher>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 213.134.161.244
X-CLIENT-HOSTNAME: 213.134.161.244
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeljedgkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkjghfggfgtgesthfuredttddtjeenucfhrhhomhepfdftrghfrggvlhculfdrucghhihsohgtkhhifdcuoehrjhifsehrjhifhihsohgtkhhirdhnvghtqeenucggtffrrghtthgvrhhnpedvjeelgffhiedukedtleekkedvudfggefhgfegjefgueekjeelvefggfdvledutdenucfkphepvddufedrudefgedrudeiuddrvdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvudefrddufeegrdduiedurddvgeegpdhhvghlohepkhhrvggrtghhvghrrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqpdhrtghpthhtoheplhhinhhugidqrggtphhisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghskhgvghhgshesrhgvughhrghtrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehnohhuvhgv
 rghusehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-DCC--Metrics: v370.home.net.pl 1024; Body=5 Fuz1=5 Fuz2=5
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

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

The ACPI_HANDLE() macro is a wrapper arond the ACPI_COMPANION()
macro and the ACPI handle produced by the former comes from the
ACPI device object produced by the latter, so it is way more
straightforward to evaluate the latter directly instead of passing
the handle produced by the former to acpi_bus_get_device().

Modify nouveau_acpi_edid() accordingly (no intentional functional
impact).

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---

v1 -> v2:
   * Resend with a different From and S-o-b address and with R-by from Ben.
     No other changes.

---
 drivers/gpu/drm/nouveau/nouveau_acpi.c |    9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

Index: linux-pm/drivers/gpu/drm/nouveau/nouveau_acpi.c
===================================================================
--- linux-pm.orig/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ linux-pm/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -364,7 +364,6 @@ void *
 nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector)
 {
 	struct acpi_device *acpidev;
-	acpi_handle handle;
 	int type, ret;
 	void *edid;
 
@@ -377,12 +376,8 @@ nouveau_acpi_edid(struct drm_device *dev
 		return NULL;
 	}
 
-	handle = ACPI_HANDLE(dev->dev);
-	if (!handle)
-		return NULL;
-
-	ret = acpi_bus_get_device(handle, &acpidev);
-	if (ret)
+	acpidev = ACPI_COMPANION(dev->dev);
+	if (!acpidev)
 		return NULL;
 
 	ret = acpi_video_get_edid(acpidev, type, -1, &edid);



