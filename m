Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A838B10A3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B637A113CBD;
	Wed, 24 Apr 2024 17:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="QL/oPBIM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 310 seconds by postgrey-1.36 at gabe;
 Wed, 24 Apr 2024 17:06:06 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A223113C9C;
 Wed, 24 Apr 2024 17:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978364; x=1714583164; i=friedrich.vock@gmx.de;
 bh=ZFgynH9kVvXd7X71GGc8wd8zn3hjzWcTxqNGMvCSWsw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QL/oPBIMC6OnNxEcvez3C1Oza5okI/5VUk9gQtY08LrfXPwxjIZn8kviSwg+kZdi
 lFEkeZQfV8oAHSi/97X4h3AcyDKOKl1iwJrkt++O+z/8BqG927TxdCWQvFcM+srIZ
 ozp9siUl4USYulmABqI3iiTsExyEcB4eIMuQF8BNJPsRs1FT4YDadRVWllThNv9E6
 +Zxqi2j1XDYMXArofBMeKL6cbwHbnW9OwRkVppSeB6WqtXa3lDFG1NdmJPd6pdpIu
 OjAH9w1lfWLytzOjQAsz+lvor/+/T1tMxlQ6QnkGN3ftonsqLcztcnsA8vXKZM1J4
 P8727wqaAaZXcLrQdw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGN2-1sIzoz1zUM-00I0ut; Wed, 24
 Apr 2024 19:00:43 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 16/18] drm/amdgpu: Implement SET_PRIORITY GEM op
Date: Wed, 24 Apr 2024 18:57:06 +0200
Message-ID: <20240424165937.54759-17-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:btnRn+8eRzZVxSdWw26IvGCDOAMk3OXN59r3kdY0wQ/jG50Vh1X
 Wx4twcdHEUJeiRYLdQnD2cyx3HJjFIpKO3GjNLpxK0qZP3BvvjBfnA1jhKsePILqOn2Zd2a
 oBD+4HRuczSD/drkjEmJmZlQMezPR1yv0AFdu6Lh1wbabrixNnYiAPRarpNAmPfOM9/95cn
 kYXAsOo2J0+ks0ep3/Dzg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cd9kI+Aei+0=;2xKl2czPTjHzyyiKmUssheRK8Re
 EkLS7Hr/+7CRpNIGilyhHgh6SMTk1keLooGTv32LcXxkuO74w1GQy1DSK0n6HVIQuhJ9RZrAE
 KBwUnTXDLVHVwQvpjddOFNPf2wuSCjMqY4hIp52NtvS26V7Cqga89TkYlOpcYtWduAMTSDduo
 94DzKxbxwBPch+qtYSn8dMWNXLjkle3/viPgbaNGqM3jptniHwqFGf3CSE2nO6Cx1jiuMlj5g
 2zCZBXALk6ltPSvL7EZPG+GwLEMhZc1fQpezYZI6ySixTN1BCWeZNnmpb6FnNpbOuhyU+6WK7
 93KIjjewagTN15UdV9aR/zxKR6OO48I6xqiNO3qG0BfqkG92hNGLW4UIrH35Dl+aNMJfetYmo
 IQLJBoPyRzXq5abaHI/scI2ncJ4curOJORPbrBIv8ly0aN9FMpz/KBYhyDcg/9XZMR1Un0N3R
 6SRXxzFgPJhMYXw1A/WypCgaU5ksPUh6O6lcMnaGcxdn3Cn8cEU/yZ+JDumZE32J9kUWbaX/7
 qW1BHCub+YJuVy+Pfp4p5oCg8y2ahEzfWc530bxsXTUyY2m7EoJaw88pCNAPqJ0AA70w83C6W
 3LFiQZF6FweSpQPQ3a8o/j4DAgpJvOorXxj7d2SAYWfVVERHGjYsd/yBTCRtbGMZaw362s/zG
 MyerxW4Yyy3KjM5jpZJF/XFa/dybQlNKou/rv6b+sICD5MKc9ztnqWN+DfZYtzKsM8KAvvtGU
 m2J3UPCg832fhvIGgWUhkJjcI1TUz93ok2z62WqbPjdnZx0F6TxhOUrCYV4k4MiPA3ujz0ydH
 L/f5k1jjaxQNIZBiipYJ/DS7yLB+CVz1/eiGQhJ/m0g8k=
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

Used by userspace to adjust buffer priorities in response to changes in
application demand and memory pressure.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 20 ++++++++++++++++++++
 include/uapi/drm/amdgpu_drm.h           |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_gem.c
index 5ca13e2e50f50..6107810a9c205 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -836,8 +836,10 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void =
*data,
 {
 	struct amdgpu_device *adev =3D drm_to_adev(dev);
 	struct drm_amdgpu_gem_op *args =3D data;
+	struct ttm_resource_manager *man;
 	struct drm_gem_object *gobj;
 	struct amdgpu_vm_bo_base *base;
+	struct ttm_operation_ctx ctx;
 	struct amdgpu_bo *robj;
 	int r;

@@ -851,6 +853,9 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *=
data,
 	if (unlikely(r))
 		goto out;

+	memset(&ctx, 0, sizeof(ctx));
+	ctx.interruptible =3D true;
+
 	switch (args->op) {
 	case AMDGPU_GEM_OP_GET_GEM_CREATE_INFO: {
 		struct drm_amdgpu_gem_create_in info;
@@ -898,6 +903,21 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void =
*data,

 		amdgpu_bo_unreserve(robj);
 		break;
+	case AMDGPU_GEM_OP_SET_PRIORITY:
+		if (args->value > AMDGPU_BO_PRIORITY_MAX_USER)
+			args->value =3D AMDGPU_BO_PRIORITY_MAX_USER;
+		ttm_bo_update_priority(&robj->tbo, args->value);
+		if (robj->tbo.evicted_type !=3D TTM_NUM_MEM_TYPES) {
+			ttm_bo_try_unevict(&robj->tbo, &ctx);
+			amdgpu_bo_unreserve(robj);
+		} else {
+			amdgpu_bo_unreserve(robj);
+			man =3D ttm_manager_type(robj->tbo.bdev,
+				robj->tbo.resource->mem_type);
+			ttm_mem_unevict_evicted(robj->tbo.bdev, man,
+						true);
+		}
+		break;
 	default:
 		amdgpu_bo_unreserve(robj);
 		r =3D -EINVAL;
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index bdbe6b262a78d..53552dd489b9b 100644
=2D-- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -531,6 +531,7 @@ union drm_amdgpu_wait_fences {

 #define AMDGPU_GEM_OP_GET_GEM_CREATE_INFO	0
 #define AMDGPU_GEM_OP_SET_PLACEMENT		1
+#define AMDGPU_GEM_OP_SET_PRIORITY              2

 /* Sets or returns a value associated with a buffer. */
 struct drm_amdgpu_gem_op {
=2D-
2.44.0

