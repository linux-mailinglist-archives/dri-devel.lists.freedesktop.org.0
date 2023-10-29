Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F4F7DACF4
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 16:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4911310E175;
	Sun, 29 Oct 2023 15:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB4F10E178;
 Sun, 29 Oct 2023 15:07:54 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6ba54c3ed97so3626252b3a.2; 
 Sun, 29 Oct 2023 08:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698592073; x=1699196873; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FSklqDw7AA6NpVC0KwUQy6XYNfBWwLFmbDUXgjz8m44=;
 b=UYM/iJBvQRJ4P2MG8+pOiI6y6j5cMga12528AJ6CiMRdrwJ0KRJPQz0Y99TRkGOrrP
 N0BvJ08FBVU/8VeKSzm7TQwicpE8YNWp4zJ5y0gxiIULfxzsP+jC3rE4tEQHo2X1kslp
 9NIJ8nE2b6ma2r/7YGr8+/XO4xlnKGPp/WDvne1myGgzXKH9bixgTtt9KVxPJqMuPjQ+
 lntl6ydmkn6yC6b7wnpLC7v5Q2OtFeF/EoLiVu+3ZCVRPcCvXHwEZJZpYS+MizPWy0Fk
 qHHRIfAOn6scCdjTtigaLj+/uWCMw3eP+YQ69eMpPudvsp6+TCinZFqbVv5uyfVc/8nO
 mRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698592073; x=1699196873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FSklqDw7AA6NpVC0KwUQy6XYNfBWwLFmbDUXgjz8m44=;
 b=K2W4t/BtDX3US/Mx2kznigmpbJmf6A4ZylwOHFNEUCX4x/ijfdXfDmkkzTKeIh6Fd4
 aOvTK8pGmOqA/8meb+61ZonaYqXKMuUsW0hMyq5pwLaEFdiCOaQoA256h86F8jV45Nf/
 1c32I0dAH3iPi6KEwgW1ISBlzezRpVeyu0LuZBribnoBNr+Qoj2lhBaTTyVt2TKEZpmJ
 wuO+zDXsSZl5RA9NpM+zuTgY3yGbbITUpqH2X479Fsk6HQiC+iM1/l9970S1A44+AYN6
 KarRHmvfsZzPjl46vvZ1LTM1dPk11RkJcrrXqjuJZJGwVylyuJ3UPHdM4PkCOi6qR2vv
 XU7g==
X-Gm-Message-State: AOJu0Yzyp9Oc4/D+iOL+f3qR0ZM9/D5MaH5PlWx2KQbcNa+GM52dzSlH
 3JAJeESQayEQdtkRB+jT22bkWPclGgU=
X-Google-Smtp-Source: AGHT+IEbL1zf2t4TtJc5sNTLMosvU1cSZfEXfy7mKOHHWcq9Qw1cfBsH6UExxcaPaoPtuEZsy0OcFg==
X-Received: by 2002:a05:6a00:22cb:b0:6b6:e147:717 with SMTP id
 f11-20020a056a0022cb00b006b6e1470717mr9971653pfj.23.1698592073428; 
 Sun, 29 Oct 2023 08:07:53 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a62ae14000000b006934a1c69f8sm4393588pff.24.2023.10.29.08.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 08:07:52 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm/gem: Add metadata
Date: Sun, 29 Oct 2023 08:07:38 -0700
Message-ID: <20231029150740.6434-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027194537.408922-1-robdclark@gmail.com>
References: <20231027194537.408922-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The EXT_external_objects extension is a bit awkward as it doesn't pass
explicit modifiers, leaving the importer to guess with incomplete
information.  In the case of vk (turnip) exporting and gl (freedreno)
importing, the "OPTIMAL_TILING_EXT" layout depends on VkImageCreateInfo
flags (among other things), which the importer does not know.  Which
unfortunately leaves us with the need for a metadata back-channel.

The contents of the metadata are defined by userspace.  The
EXT_external_objects extension is only required to work between
compatible versions of gl and vk drivers, as defined by device and
driver UUIDs.

v2: add missing metadata kfree

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 57 ++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gem.c |  1 +
 drivers/gpu/drm/msm/msm_gem.h |  4 +++
 include/uapi/drm/msm_drm.h    |  2 ++
 4 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 781db689fb16..9ec74ab4cfea 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -49,9 +49,10 @@
  * - 1.9.0 - Add MSM_SUBMIT_FENCE_SN_IN
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
+ * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	11
+#define MSM_VERSION_MINOR	12
 #define MSM_VERSION_PATCHLEVEL	0
 
 static void msm_deinit_vram(struct drm_device *ddev);
@@ -844,6 +845,8 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 		break;
 	case MSM_INFO_SET_NAME:
 	case MSM_INFO_GET_NAME:
+	case MSM_INFO_SET_METADATA:
+	case MSM_INFO_GET_METADATA:
 		break;
 	default:
 		return -EINVAL;
@@ -905,6 +908,58 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 					 msm_obj->name, args->len))
 				ret = -EFAULT;
 		}
+		break;
+	case MSM_INFO_SET_METADATA:
+		/* Impose a moderate upper bound on metadata size: */
+		if (args->len > 128) {
+			ret = -EOVERFLOW;
+			break;
+		}
+
+		ret = msm_gem_lock_interruptible(obj);
+		if (ret)
+			break;
+
+		msm_obj->metadata =
+			krealloc(msm_obj->metadata, args->len, GFP_KERNEL);
+		msm_obj->metadata_size = args->len;
+
+		if (copy_from_user(msm_obj->metadata, u64_to_user_ptr(args->value),
+				   args->len)) {
+			msm_obj->metadata_size = 0;
+			ret = -EFAULT;
+		}
+
+		msm_gem_unlock(obj);
+
+		break;
+	case MSM_INFO_GET_METADATA:
+		if (!args->value) {
+			/*
+			 * Querying the size is inherently racey, but
+			 * EXT_external_objects expects the app to confirm
+			 * via device and driver UUIDs that the exporter and
+			 * importer versions match.  All we can do from the
+			 * kernel side is check the length under obj lock
+			 * when userspace tries to retrieve the metadata
+			 */
+			args->len = msm_obj->metadata_size;
+			break;
+		}
+
+		ret = msm_gem_lock_interruptible(obj);
+		if (ret)
+			break;
+
+		if (args->len < msm_obj->metadata_size) {
+			ret = -ETOOSMALL;
+		} else if (copy_to_user(u64_to_user_ptr(args->value),
+					msm_obj->metadata, args->len)) {
+			ret = -EFAULT;
+		}
+
+		msm_gem_unlock(obj);
+
 		break;
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 1113e6b2ec8e..175ee4ab8a6f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1058,6 +1058,7 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 
 	drm_gem_object_release(obj);
 
+	kfree(msm_obj->metadata);
 	kfree(msm_obj);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 7f34263048a3..8d414b072c29 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -109,6 +109,10 @@ struct msm_gem_object {
 
 	char name[32]; /* Identifier to print for the debugfs files */
 
+	/* userspace metadata backchannel */
+	void *metadata;
+	u32 metadata_size;
+
 	/**
 	 * pin_count: Number of times the pages are pinned
 	 *
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 6c34272a13fd..6f2a7ad04aa4 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -139,6 +139,8 @@ struct drm_msm_gem_new {
 #define MSM_INFO_GET_NAME	0x03   /* get debug name, returned by pointer */
 #define MSM_INFO_SET_IOVA	0x04   /* set the iova, passed by value */
 #define MSM_INFO_GET_FLAGS	0x05   /* get the MSM_BO_x flags */
+#define MSM_INFO_SET_METADATA	0x06   /* set userspace metadata */
+#define MSM_INFO_GET_METADATA	0x07   /* get userspace metadata */
 
 struct drm_msm_gem_info {
 	__u32 handle;         /* in */
-- 
2.41.0

