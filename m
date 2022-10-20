Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6F16061E5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 15:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390E110E47D;
	Thu, 20 Oct 2022 13:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21ED10E4A5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 13:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666273145; x=1697809145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ljMdWx0ncfHHf9/cuviQrmrpgKp4U9CBBJ+FsQph8Y=;
 b=VmIsIo3eU842bX/lpJ2boQ+zQ52W1ntFENViH2eQLbUFmrlMUbldpDAc
 8HKVThDl78WsWppU4rb9APeEBZziCzV1rgi+Zk7bMzTgqMYp9juQuQx/J
 ZcKhJuCSB8Kj9lzItasnE1Ji+r3t0yxdu98VQglAruyNIusJDN1rtxWUc
 ZFfbazrdtdW9Uu3EUnOnWKgFa4AqknB02IzOFTQhQWQpA+nqT7i57sCJb
 K7MT3ref4pzlwj3MItX15pj7NBrptNY+27wkvj8NTi4Z9yg2QbchJbDDj
 JWDcS7z0VOPnRA7iOCO5yEL6zMqgAyYds9czmWr/ds/sZJnDD2XkgBC6A g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="307806044"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="307806044"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 06:39:00 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="719064678"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="719064678"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 06:38:56 -0700
From: "Kwapulinski, Maciej" <maciej.kwapulinski@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>
Subject: [PATCH v4 10/10] gna: add open and close operations on GNA device
Date: Thu, 20 Oct 2022 15:35:25 +0200
Message-Id: <20221020133525.1810728-11-maciej.kwapulinski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
References: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomasz Jankowski <tomasz1.jankowski@intel.com>

Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
---
 drivers/gpu/drm/gna/gna_device.c | 46 ++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
index aee409e3b4ea..4ce08bf313c3 100644
--- a/drivers/gpu/drm/gna/gna_device.c
+++ b/drivers/gpu/drm/gna/gna_device.c
@@ -58,6 +58,49 @@ const struct dev_pm_ops __maybe_unused gna_pm = {
 	SET_RUNTIME_PM_OPS(gna_runtime_suspend, gna_runtime_resume, NULL)
 };
 
+static int gna_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct gna_device *gna_priv;
+
+	gna_priv = to_gna_device(dev);
+
+	file->driver_priv = gna_priv;
+
+	return 0;
+}
+
+static void gna_delete_file_requests(struct drm_file *file, struct gna_device *gna_priv)
+{
+	struct gna_request *req, *temp_req;
+	struct list_head *reqs_list;
+
+	mutex_lock(&gna_priv->reqlist_lock);
+
+	reqs_list = &gna_priv->request_list;
+	if (!list_empty(reqs_list)) {
+		list_for_each_entry_safe(req, temp_req, reqs_list, node) {
+			if (req->drm_f == file) {
+				bool is_pending;
+
+				list_del_init(&req->node);
+				is_pending = cancel_work_sync(&req->work);
+				if (is_pending)
+					atomic_dec(&gna_priv->enqueued_requests);
+				kref_put(&req->refcount, gna_request_release);
+				break;
+			}
+		}
+	}
+
+	mutex_unlock(&gna_priv->reqlist_lock);
+}
+
+static void gna_close(struct drm_device *dev, struct drm_file *file)
+{
+	struct gna_device *gna_priv = (struct gna_device *)file->driver_priv;
+
+	gna_delete_file_requests(file, gna_priv);
+}
 
 static void gna_drm_dev_fini(struct drm_device *dev, void *ptr)
 {
@@ -136,6 +179,9 @@ static struct drm_gem_object *gna_create_gem_object(struct drm_device *dev,
 
 static const struct drm_driver gna_drm_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_RENDER,
+	.open = gna_open,
+	.postclose = gna_close,
+
 	.gem_create_object = gna_create_gem_object,
 
 	.ioctls = gna_drm_ioctls,
-- 
2.25.1

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

