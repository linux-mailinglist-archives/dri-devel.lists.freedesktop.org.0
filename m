Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13340CF054B
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 20:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160A010E0ED;
	Sat,  3 Jan 2026 19:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="X3qPlgEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1EF10E0ED
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 19:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ixtra7cRCSdKLwXhSUeerbW4Jf6OvICRGOjEqE1xcTc=; b=X3qPlgEC3zqnSbPeNLJhra1FGD
 rIlNIQX1x7NIrLFoKM/iijDGGtjs6hqoeFGCZQVV0qLMRO8ioBcD610wI5x3IGh/A8PPgxo9qjlpx
 8yNpfvSYw2bayVsmON4Uo4Ex2y+gtyffAnrwXav+9QqDrXu+IRM23GeA96b6a2/BxDXlMzSYa6kbW
 bXlkT7Us3j7B741Tsjdw+FF7jKJ3iu5ERoej1HzPEUMT9L8VCkwvFakprM//sGzdxYJmpNkdumcgs
 yX+m1Xo0YA+IP94/pk44JfQHy47Zm/lsK39cG/fH9V4cETMeAOd7ZWr2RfHMUPryUlZilV8ult15q
 lfnb14Wg==;
Received: from [187.36.210.68] (helo=morissey)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vc7hX-001JDb-6W; Sat, 03 Jan 2026 20:54:15 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: mwen@igalia.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/v3d: Set DMA segment size to avoid debug warnings
Date: Sat,  3 Jan 2026 16:53:07 -0300
Message-ID: <176746998017.120662.4920692890890221544.b4-ty@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203130323.2247072-1-xiaolei.wang@windriver.com>
References: <20251203130323.2247072-1-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 03 Dec 2025 21:03:23 +0800, Xiaolei Wang wrote:
> When using V3D rendering with CONFIG_DMA_API_DEBUG enabled, the
> kernel occasionally reports a segment size mismatch. This is because
> 'max_seg_size' is not set. The kernel defaults to 64K. setting
> 'max_seg_size' to the maximum will prevent 'debug_dma_map_sg()'
> from complaining about the over-mapping of the V3D segment length.
> 
> DMA-API: v3d 1002000000.v3d: mapping sg segment longer than device
>  claims to support [len=8290304] [max=65536]
> WARNING: CPU: 0 PID: 493 at kernel/dma/debug.c:1179 debug_dma_map_sg+0x330/0x388
> CPU: 0 UID: 0 PID: 493 Comm: Xorg Not tainted 6.12.53-yocto-standard #1
> Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : debug_dma_map_sg+0x330/0x388
> lr : debug_dma_map_sg+0x330/0x388
> sp : ffff8000829a3ac0
> x29: ffff8000829a3ac0 x28: 0000000000000001 x27: ffff8000813fe000
> x26: ffffc1ffc0000000 x25: ffff00010fdeb760 x24: 0000000000000000
> x23: ffff8000816a9bf0 x22: 0000000000000001 x21: 0000000000000002
> x20: 0000000000000002 x19: ffff00010185e810 x18: ffffffffffffffff
> x17: 69766564206e6168 x16: 74207265676e6f6c x15: 20746e656d676573
> x14: 20677320676e6970 x13: 5d34303334393134 x12: 0000000000000000
> x11: 00000000000000c0 x10: 00000000000009c0 x9 : ffff8000800e0b7c
> x8 : ffff00010a315ca0 x7 : ffff8000816a5110 x6 : 0000000000000001
> x5 : 000000000000002b x4 : 0000000000000002 x3 : 0000000000000008
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00010a315280
> Call trace:
>  debug_dma_map_sg+0x330/0x388
>  __dma_map_sg_attrs+0xc0/0x278
>  dma_map_sgtable+0x30/0x58
>  drm_gem_shmem_get_pages_sgt+0xb4/0x140
>  v3d_bo_create_finish+0x28/0x130 [v3d]
>  v3d_create_bo_ioctl+0x54/0x180 [v3d]
>  drm_ioctl_kernel+0xc8/0x140
>  drm_ioctl+0x2d4/0x4d8
> 
> [...]

Applied, thanks!

[1/1] drm/v3d: Set DMA segment size to avoid debug warnings
      commit: 9eb018828b1b30dfba689c060735c50fc5b9f704

Best regards,
- Maíra
