Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE1E8B1078
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3CE113C8D;
	Wed, 24 Apr 2024 17:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="B40I6HKZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A7A113C81;
 Wed, 24 Apr 2024 17:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978040; x=1714582840; i=friedrich.vock@gmx.de;
 bh=1yE1NeqzI2xECsJABNGmn3QP2VnTIaEv65ZejUrgF34=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=B40I6HKZsy/9dIxlVKxw9KW/UDekEPvvw5smrXUdYoB3tUxig41CyKP/uR7VkYCx
 xUfgTTyqJ6TqYEZ61CKxuWiCG5Swv09Wn+3IHpTsiow7nry/FoS0Sc5DuqNTzodEE
 MLEooG0x6udsGod2hZpxvyk/fF5cQdwbv+L8H/x/N+9wYEEGRCHyeK87/ygaIhvfm
 vCcS0STYtrTp4gHkNRsuHiQFjAeFwfoPd5XNs27+lGAKunmH35HgIKgRpbn6thkNx
 fdioruqYKxCD4hz57yEDMvj15jvGp6FwnF0HPlE5+0MsTMky4yOOqEA+2TavSInhc
 uAR6Fsfs4kj3+HUH+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MlNtP-1sOnaP036j-00krIS; Wed, 24
 Apr 2024 19:00:40 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 09/18] drm/amdgpu: Don't mark VRAM as a busy placement for
 VRAM|GTT resources
Date: Wed, 24 Apr 2024 18:56:59 +0200
Message-ID: <20240424165937.54759-10-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jXP8CEkU7U1tPZcrgRj1AmESpCJzigAn5RVze3Qgl/j+U1Pzswc
 MhC7LqvawFt3j5R+d1nREsEBl8Q7RYv+vcs6EDDLvy7HgGb3nSj2ZD/GzSDclpSnRTLi2dz
 yjxjCcEjrfA+Ee9xFSrNQof62cr5yoANs2SpKokijX/n9qYOLK6fQkFS0l3Ad9zAbiKNH4E
 dV1DC796d19sy32Aq3mwA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Z7QgOlNXbQI=;gN9H0ct65fI+4gXNmTmYoeroHfw
 pMKy5BcIeg3G3h3n+PXkaOs2w3fWQuLe6WFKdQpihWjB0dskpuaSfao2loSb5HUCwI4m6rL3t
 69Y9YAZ/c1sgJDAcvU4KqHTHNdocGfu8MnXWCFj2CoY7aeF85vSD4/2ajLQ8KU8JDBM/gQcJ3
 sxeA99qLN8sVTeDFfRWdW3sjJx3VGXm/lnjvpJByDq/hxroGBptNt0QU6I0Yk3Wfn78b/7cTs
 JlXq9q40GSQj6/51nRI4J1Fx5UHKpVaRLHMSXzWiMScygXm4NIcKsPfuYyfQwiMb69IT6sGVw
 Yfts60ljxvkILG/oSj6czb4XF/G24apiahpFFzrpfmSIU8Hl7CvgmW2g/6diYz034Kx+GLLuT
 fMjalnR+mpxja8GIvaqqrr6BhOL6wT1c/Gpr7l4wGOFchGvhfQ3yFmWmfrT9QjqN/OY1RtLoc
 PzM6cEhCkAz1kyKRaXLqnOLIL3x8BYFgAxkS/O0B3n1lLndmd1Xh9FuIngs1lZDEO8C/XjYTn
 m1EvdJ11f0tMCfCZpOoCkAnQ1MrS6lKbbHwZ/X89B+uax4FLVOyZUoh9CGasOtUWRxztlpoep
 77CfMjLzL8FX0uz9S+IQimwII3Y+/o9ujUJdvNlDQuzVjWHDVWWZ78H6eE27AlXDYWcZFTbt2
 OOa6qpszeEm5G93FFfkDbomrkFpnuiCo/r3I5Silpc80JRmP7CkVq71EtL0xZUep0oTDZ+Fo8
 B0TR8bF3yEfa5Kd/yDfb2bUPcXxd0sV8ogHeK57QVFHWMy/CagXIKNxrcTntACi2gPF0WXQUJ
 q6AuALQDDlbn+oE1NjkXVP6qstqpBFOxF3wr8PcoSsheA=
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

We will never try evicting things from VRAM for these resources anyway.
This affects TTM buffer uneviction logic, which would otherwise try to
move these buffers into VRAM (clashing with VRAM-only allocations).

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_object.c
index 5834a95d680d9..85c10d8086188 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -127,6 +127,7 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo =
*abo, u32 domain)
 	struct amdgpu_device *adev =3D amdgpu_ttm_adev(abo->tbo.bdev);
 	struct ttm_placement *placement =3D &abo->placement;
 	struct ttm_place *places =3D abo->placements;
+	bool skip_vram_busy =3D false;
 	u64 flags =3D abo->flags;
 	u32 c =3D 0;

@@ -156,6 +157,13 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo=
 *abo, u32 domain)
 		if (flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS)
 			places[c].flags |=3D TTM_PL_FLAG_CONTIGUOUS;
 		c++;
+
+		/*
+		 * If GTT is preferred by the buffer as well, don't try VRAM when it's
+		 * busy.
+		 */
+		if ((domain & abo->preferred_domains) & AMDGPU_GEM_DOMAIN_GTT)
+			skip_vram_busy =3D true;
 	}

 	if (domain & AMDGPU_GEM_DOMAIN_DOORBELL) {
@@ -223,6 +231,11 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo=
 *abo, u32 domain)

 	placement->num_busy_placement =3D c;
 	placement->busy_placement =3D places;
+
+	if (skip_vram_busy) {
+		--placement->num_busy_placement;
+		++placement->busy_placement;
+	}
 }

 /**
=2D-
2.44.0

