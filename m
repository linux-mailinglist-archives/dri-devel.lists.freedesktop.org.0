Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D11A38103
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 00:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C9789A62;
	Thu,  6 Jun 2019 22:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847C289A62
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 22:41:09 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id z25so5555624edq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 15:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JhgexSOQCk69aVM20s4eSvr2Wf1I3NzyL+87Su9CLwA=;
 b=SrbT9P8kZZDaOowObpX/REV6Z4KE8AXP3stM5K3btOE+w1DPgmMDDoyPB2w2C0frXZ
 Cv+6tdTQ3ra8bFYvOkU3Vvl0aLTDAB82GX9c+DnDJRpKoLiVsCrJvNrN7RcPXqoEiQ2U
 i8yyugOQkJwPuXZvLgdm1G9ZZ64wquRThzAp99q/KwJmWHfu2lunZb2q6xgxuCQppvPI
 rhG+nRnqb3aPs3fPkVGGrI+GQN15ckdlasyqJls2OzzSu26bh4Ma9WRy8Ph3xMR7tPhp
 BeNEk3qx9zeKnGQQcA5EkOpMHWb60ctoIjni2U8I7M0CdRTUdxtOGfFdEZ///FthcMXd
 rjbw==
X-Gm-Message-State: APjAAAVuRJAzxlXDe6HnkCfb+4ZgioQWedsBfGUnKmkhYbuBXvRcDNlK
 DTf7jY7lRWvJEVOgMVCkxCk=
X-Google-Smtp-Source: APXvYqxerrRP5WRy+rml8eMGfURU7CFX2ih4mnTm2wD+X3V2ToEbFqcEecsAb4P/596kEGg6E9fFWw==
X-Received: by 2002:a17:906:4cc3:: with SMTP id
 q3mr19346590ejt.27.1559860868078; 
 Thu, 06 Jun 2019 15:41:08 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id j2sm56764ejc.43.2019.06.06.15.41.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 15:41:07 -0700 (PDT)
Date: Thu, 6 Jun 2019 19:41:01 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Brian Starkey <brian.starkey@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/2] drm/vkms: Add support for writeback
Message-ID: <0acd74232d988970668298be0111c485bc68ec87.1559860606.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1559860606.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1559860606.git.rodrigosiqueiramelo@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JhgexSOQCk69aVM20s4eSvr2Wf1I3NzyL+87Su9CLwA=;
 b=Gu2p9ICSRNK3e7zFb7NBBVp4Ff1fWLEZnTnzBaOxFQiL8kAo84Tc1N3CPv/kKiyJS3
 EWITAf0/4yF/XIeuKimpj8+sxz7CpJiLiK6WUcEnu0EIBjRyn4fYENf6SsnTXIM9ZhNw
 03G+rVbSNoh52i31iN1c0/aUPFQ//NJRo3v959iCh90eFxqnB6H+EUcNvuA6DHHCQeOu
 UvAFLYHSS0eOMN+mpC+QTUCmd7T0tLzDBtj7jUGsAitK/aqbJs19L2xHt9gaDuPf4zvo
 Xgvjq5xPpZPbuS5AxtCUO5ZhV0I3eEy4Gxt8BZrwgbPz4eAktdaShWJk5NRkD3ihPqlu
 ML0A==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1684726871=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1684726871==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ewog5ol6fvorzftb"
Content-Disposition: inline


--ewog5ol6fvorzftb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This patch implements the necessary functions to add writeback support
for vkms. This feature is useful for testing compositors if you don=E2=80=
=99t
have hardware with writeback support.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vkms/Makefile         |   9 +-
 drivers/gpu/drm/vkms/vkms_crtc.c      |   5 +
 drivers/gpu/drm/vkms/vkms_drv.c       |  10 ++
 drivers/gpu/drm/vkms/vkms_drv.h       |  12 ++
 drivers/gpu/drm/vkms/vkms_output.c    |   6 +
 drivers/gpu/drm/vkms/vkms_writeback.c | 165 ++++++++++++++++++++++++++
 6 files changed, 206 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_writeback.c

diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 89f09bec7b23..90eb7acd618d 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -1,4 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
-vkms-y :=3D vkms_drv.o vkms_plane.o vkms_output.o vkms_crtc.o vkms_gem.o v=
kms_crc.o
+vkms-y :=3D \
+	vkms_drv.o \
+	vkms_plane.o \
+	vkms_output.o \
+	vkms_crtc.o \
+	vkms_gem.o \
+	vkms_crc.o \
+	vkms_writeback.o
=20
 obj-$(CONFIG_DRM_VKMS) +=3D vkms.o
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_c=
rtc.c
index 1bbe099b7db8..ce797e265b1b 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -23,6 +23,11 @@ static enum hrtimer_restart vkms_vblank_simulate(struct =
hrtimer *timer)
 	if (!ret)
 		DRM_ERROR("vkms failure on handling vblank");
=20
+	if (output->writeback_status =3D=3D WB_START) {
+		drm_writeback_signal_completion(&output->wb_connector, 0);
+		output->writeback_status =3D WB_STOP;
+	}
+
 	if (state && output->crc_enabled) {
 		u64 frame =3D drm_crtc_accurate_vblank_count(crtc);
=20
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_dr=
v.c
index 92296bd8f623..d5917d5a45e3 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -29,6 +29,10 @@ bool enable_cursor;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
=20
+int enable_writeback;
+module_param_named(enable_writeback, enable_writeback, int, 0444);
+MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector");
+
 static const struct file_operations vkms_driver_fops =3D {
 	.owner		=3D THIS_MODULE,
 	.open		=3D drm_open,
@@ -123,6 +127,12 @@ static int __init vkms_init(void)
 		goto out_fini;
 	}
=20
+	vkms_device->output.writeback_status =3D WB_DISABLED;
+	if (enable_writeback) {
+		vkms_device->output.writeback_status =3D WB_STOP;
+		DRM_INFO("Writeback connector enabled");
+	}
+
 	ret =3D vkms_modeset_init(vkms_device);
 	if (ret)
 		goto out_fini;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_dr=
v.h
index e81073dea154..ca1f9ee63ec8 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -7,6 +7,7 @@
 #include <drm/drm.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_writeback.h>
 #include <linux/hrtimer.h>
=20
 #define XRES_MIN    20
@@ -60,14 +61,22 @@ struct vkms_crtc_state {
 	u64 frame_end;
 };
=20
+enum wb_status {
+	WB_DISABLED,
+	WB_START,
+	WB_STOP,
+};
+
 struct vkms_output {
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 	struct drm_connector connector;
+	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
 	struct drm_pending_vblank_event *event;
 	bool crc_enabled;
+	enum wb_status writeback_status;
 	/* ordered wq for crc_work */
 	struct workqueue_struct *crc_workq;
 	/* protects concurrent access to crc_data */
@@ -141,4 +150,7 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const=
 char *source_name,
 			   size_t *values_cnt);
 void vkms_crc_work_handle(struct work_struct *work);
=20
+/* Writeback */
+int enable_writeback_connector(struct vkms_device *vkmsdev);
+
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms=
_output.c
index 1442b447c707..1fc1d4e9585c 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -91,6 +91,12 @@ int vkms_output_init(struct vkms_device *vkmsdev, int in=
dex)
 		goto err_attach;
 	}
=20
+	if (vkmsdev->output.writeback_status !=3D WB_DISABLED) {
+		ret =3D enable_writeback_connector(vkmsdev);
+		if (ret)
+			DRM_ERROR("Failed to init writeback connector\n");
+	}
+
 	drm_mode_config_reset(dev);
=20
 	return 0;
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/v=
kms_writeback.c
new file mode 100644
index 000000000000..f7b962ae5646
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include "vkms_drv.h"
+#include <drm/drm_writeback.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+
+static const struct drm_connector_funcs vkms_wb_connector_funcs =3D {
+	.fill_modes =3D drm_helper_probe_single_connector_modes,
+	.destroy =3D drm_connector_cleanup,
+	.reset =3D drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
+};
+
+static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	struct drm_framebuffer *fb;
+	const struct drm_display_mode *mode =3D &crtc_state->mode;
+
+	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
+		return 0;
+
+	fb =3D conn_state->writeback_job->fb;
+	if (fb->width !=3D mode->hdisplay || fb->height !=3D mode->vdisplay) {
+		DRM_DEBUG_KMS("Invalid framebuffer size %ux%u\n",
+			      fb->width, fb->height);
+		return -EINVAL;
+	}
+
+	if (fb->format->format !=3D DRM_FORMAT_XRGB8888) {
+		struct drm_format_name_buf format_name;
+
+		DRM_DEBUG_KMS("Invalid pixel format %s\n",
+			      drm_get_format_name(fb->format->format,
+						  &format_name));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct drm_encoder_helper_funcs vkms_wb_encoder_helper_funcs =
=3D {
+	.atomic_check =3D vkms_wb_encoder_atomic_check,
+};
+
+static int vkms_wb_connector_get_modes(struct drm_connector *connector)
+{
+	struct drm_device *dev =3D connector->dev;
+
+	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
+				    dev->mode_config.max_height);
+}
+
+static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connecto=
r,
+			       struct drm_writeback_job *job)
+{
+	struct vkms_gem_object *vkms_obj;
+	struct drm_gem_object *gem_obj;
+	int ret;
+
+	if (!job->fb)
+		return 0;
+
+	gem_obj =3D drm_gem_fb_get_obj(job->fb, 0);
+	ret =3D vkms_gem_vmap(gem_obj);
+	if (ret) {
+		DRM_ERROR("vmap failed: %d\n", ret);
+		return ret;
+	}
+
+	vkms_obj =3D drm_gem_to_vkms_gem(gem_obj);
+	job->priv =3D vkms_obj->vaddr;
+
+	return 0;
+}
+
+static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
+				struct drm_writeback_job *job)
+{
+	struct drm_gem_object *gem_obj;
+
+	if (!job->fb)
+		return;
+
+	gem_obj =3D drm_gem_fb_get_obj(job->fb, 0);
+	vkms_gem_vunmap(gem_obj);
+}
+
+static void vkms_wb_atomic_commit(struct drm_connector *conn,
+				  struct drm_connector_state *state)
+{
+	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(conn->dev);
+	struct vkms_output *output =3D &vkmsdev->output;
+	struct drm_writeback_connector *wb_conn =3D &output->wb_connector;
+	struct drm_connector_state *conn_state =3D wb_conn->base.state;
+	void *priv_data =3D conn_state->writeback_job->priv;
+	struct vkms_crc_data *primary_data =3D NULL;
+	struct drm_framebuffer *fb =3D NULL;
+	struct vkms_gem_object *vkms_obj;
+	struct drm_gem_object *gem_obj;
+	struct drm_plane *plane;
+
+	if (!conn_state)
+		return;
+
+	if (!conn_state->writeback_job || !conn_state->writeback_job->fb) {
+		output->writeback_status =3D WB_STOP;
+		DRM_DEBUG_DRIVER("Disable writeback\n");
+		return;
+	}
+
+	drm_for_each_plane(plane, &vkmsdev->drm) {
+		struct vkms_plane_state *vplane_state;
+		struct vkms_crc_data *plane_data;
+
+		vplane_state =3D to_vkms_plane_state(plane->state);
+		plane_data =3D vplane_state->crc_data;
+
+		if (drm_framebuffer_read_refcount(&plane_data->fb) =3D=3D 0)
+			continue;
+
+		if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
+			primary_data =3D plane_data;
+	}
+
+	if (!primary_data)
+		return;
+
+	fb =3D &primary_data->fb;
+	gem_obj =3D drm_gem_fb_get_obj(fb, 0);
+	vkms_obj =3D drm_gem_to_vkms_gem(gem_obj);
+
+	if (!vkms_obj->vaddr || !priv_data)
+		return;
+
+	memcpy(priv_data, vkms_obj->vaddr, vkms_obj->gem.size);
+	drm_writeback_queue_job(wb_conn, state);
+	output->writeback_status =3D WB_START;
+}
+
+static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs =
=3D {
+	.get_modes =3D vkms_wb_connector_get_modes,
+	.prepare_writeback_job =3D vkms_wb_prepare_job,
+	.cleanup_writeback_job =3D vkms_wb_cleanup_job,
+	.atomic_commit =3D vkms_wb_atomic_commit,
+};
+
+int enable_writeback_connector(struct vkms_device *vkmsdev)
+{
+	struct drm_writeback_connector *wb =3D &vkmsdev->output.wb_connector;
+
+	vkmsdev->output.wb_connector.encoder.possible_crtcs =3D 1;
+	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
+
+	return drm_writeback_connector_init(&vkmsdev->drm, wb,
+					    &vkms_wb_connector_funcs,
+					    &vkms_wb_encoder_helper_funcs,
+					    vkms_formats,
+					    ARRAY_SIZE(vkms_formats));
+}
+
--=20
2.21.0

--ewog5ol6fvorzftb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlz5ln0ACgkQWJzP/com
vP/aSRAAvqLHOXEBF8r6ep6wmjTQhYCq1LUd6oQko0ZZrcIX/Bkso+qVx4hzPbul
YhGrqVe+SsTtPHGUG2fncUcjNvAgwlYPItFHrpYfwZo+z5zCvmmnNke4ObG5KYf1
OBFsKcL8NzWLt6/YDY4600m64q0oM3boRI3qkbrdrxTlttz9AKcWN7GSZrjOMM/o
/2TpoKT1VktEUze8UElEajdghvg/IzUVEmSJzJtsuYo2JwMZaZivyvIjlMy4egNW
XfIWJctjrmlddHUUUmmDXdzkrks6CqovMUhTjrokCwthRCslbrLAgUAFSATnIJdH
8m33tJOBSJbmIGUD1g7Y3sR39G88EOk5DQ3cRNvzJRtCXWNzVStMnB9g7eXeTQdX
6lrsdARuDeYdKcIGzn4+O6BZ6e/YFnBFWVnuvkkZY5YkC6Vg7XopQEIDmLIafeJD
aITLkW9Enr8NOo7sVbE88nv08ZNy0vLQ+GfdfNZxksFww4Fvz3kO/gONvghrrCMD
Exwb+BoitMu3O4gUD6FAWon8fOGD5b0MP47nd+fJNZfbRLy+W/JLvhgcu7VAWdjI
EQmgQSA+pfAzvC81ZGeP2PYNIuRZC2dFyzBhISHOi21D9eKibhEPzxI4Skr+UAM0
LfYEuaGhXFpSonWpvYZv8yuZZNAS+pDXyJb2vvyR8iAYllVuOUA=
=WXYt
-----END PGP SIGNATURE-----

--ewog5ol6fvorzftb--

--===============1684726871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1684726871==--
