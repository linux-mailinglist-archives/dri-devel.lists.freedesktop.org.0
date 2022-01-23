Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED715497CEC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 11:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E2C10E88B;
	Mon, 24 Jan 2022 10:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 936 seconds by postgrey-1.36 at gabe;
 Sun, 23 Jan 2022 09:17:48 UTC
Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com
 [203.205.221.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3001610E956
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 09:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1642929465; bh=ebnITDbYGhHZlORJ01F47RuYdE3BHTqqebQdVWap3hk=;
 h=From:To:Cc:Subject:Date;
 b=UxHjxHzj8LLuOgBXiCUAvpkz8ehdpFvLyzAv6zeGvEME/owr7ZzmnY2W4JZfpOp7k
 JwYWQ1cAleMXq9mu+2wNk9zQwsWiDrNAzAbHoPtNdDV6vIkBooCvvKSGsgkzSTDQSx
 XbPTSoNTd+ou1MEa+/TJ7QJsrFDhKswmwYCKuQA8=
Received: from localhost.localdomain ([124.71.162.69])
 by newxmesmtplogicsvrszc9.qq.com (NewEsmtp) with SMTP
 id 8707224; Sun, 23 Jan 2022 17:02:07 +0800
X-QQ-mid: xmsmtpt1642928527tcky9npmy
Message-ID: <tencent_E12D0D523E1FC160E03D16ECD8E145901B06@qq.com>
X-QQ-XMAILINFO: MdDuF0zFTqpBCUbiTeGjp2lZZFBzE2dSoPEEOnyqctpfQcLpJyH/i5fEvg51Gh
 Osk22jBTTTuYlQOOxvb3yqgmC+5n4kdRB6NOhqovW4jflO6iSo2v0QGOeFZSYYS7MHJb3DDOaSI+
 fBLAB3aJVs9VkF7AL0VuejnjM+xoqXJtpKeSN7v64+KyFBNNRDpZE1FCBbGWxA9RsL+Hk9uzQ0Lf
 vYCVPgf0XZTteKbuDf2y5XNtBcTGABvYkwUDsD0eZBRbJGZR6kojV0AudKUizdaXHBAzAXM8pexm
 HWGnGQO1tZkbgET/6+VqkhrKEyzR+4g/PqWuGM3OknWCHDF6Ef+q7VVU9HDKFx+Locbb/ikcf8ZS
 hXvfmbuZpUaXG7rNbyWjcVnl69ZuDK8be57EZ4L7crgOicb7ROHcJzUM+sG5KkB2PISwSirrGH2i
 dNJeASjcr6i14nQ70NeMSqFmxiUyRsq5Br4L4bESUxHOgH7q2obeY3WnAWMs4DK+HuxOBLB2EFFO
 BiObl7iYSpWYFRpq/II2CSCeiJ74eoKWcLpAH0JPg0virE66cWMlBGtbY2/VUtJ0YKoVVRXHT6zR
 z+l85ofabwAzioftm4FVgQiI6Y476fo43y9KNpJ+K14GE7L7xLmD4xKY16qATLoMSzw6teSuf2xq
 ThGHuzQ+ZI38Vt7Zq0rhqcvfcwKr/n/L3GH6LvNjER/ykxiqJw+dOJmLad2dvm8jUOtIaErgDIpT
 7uUbQEN16X1E9NP7PL44tb50Si3UCEiJvcLcS6rM9ZUVItaWhq5ylzd3ZKhi1LkE5fX2OhJkdlAF
 xXCUJux1N6UXaABS/A4ZI819Y+qQYYJD8dIuM7VIPv5peiv6Lt3hecHsLrlKNemSbEVhLwDsKlXg
 ==
From: fuyufan <835863489@qq.com>
To: rostedt@goodmis.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: fix free illegal pointer when create drm_property_blob
 failed
Date: Sun, 23 Jan 2022 09:02:06 +0000
X-OQ-MSGID: <20220118021940.1942199-1-fuyufan@huawei.com> (raw)
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 24 Jan 2022 10:24:17 +0000
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
Cc: fuyufan <fuyufan@huawei.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: fuyufan <fuyufan@huawei.com>

we get (Unable to handle kernel NULL pointer dereference at virtual
address 000000000000000c) when call drm_property_blob_put().
After analysis, we get the following process:

alloc faild:
drm_atomic_set_mode_for_crtc()
    drm_property_create_blob() // failed
    state->mode_blob = ERR_PTR(-ENOMEM)

free illegal pointer:
__drm_atomic_helper_crtc_destroy_state()
    drm_property_blob_put(state->mode_blob)
            drm_mode_object_put(&blob->base);   // here blob is ERR_PTR(-ENOMEM)

So do we have to determine if blob is an error code before calling drm_mode_object_put().

Signed-off-by: fuyufan <fuyufan@huawei.com>
---
 drivers/gpu/drm/drm_property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 69dfed57c..05dba22fe 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -597,7 +597,7 @@ EXPORT_SYMBOL(drm_property_create_blob);
  */
 void drm_property_blob_put(struct drm_property_blob *blob)
 {
-       if (!blob)
+       if (IS_ERR_OR_NULL(blob))
                return;

        drm_mode_object_put(&blob->base);
--
2.23.0

