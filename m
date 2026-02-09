Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHgVEmj/iWluFQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:38:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97271111F70
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F27F10E41A;
	Mon,  9 Feb 2026 15:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="VKcxFpGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC4510E41A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 15:38:12 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-483487335c2so5393305e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 07:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770651491; x=1771256291;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jk99TzIHNfOaBko9b1E43IwPHNs+vzenJUms8qd4tnM=;
 b=VKcxFpGAYvRRyWaTQCJXzhzOGRvs2/ssmoCdyrKYO9RmRnstdQY3ulrSpR/EJXF+Uh
 FT2IAkvcjuQb7vuQavrFZroVUJn7lVPi7tqvGFxjZFKf7QyewrxGF44cUvc0kfbUi7Oz
 Oqj6MUGETZlQY9yIBDH5eiSMdwCLGY7TbHOn4Jxo5HBBaXfjEcbgFJU/0+bJXn4gFXPh
 wz06nEsoAlhZlipYydwcH9+7PC029gBquyJAT4WP7HEktHKjdxFBXRbzTGk4flcAxwfV
 SYchymdY1QQH62ub/vBCaJCqqUKT81T+hqFuk37QxuZQwqHUkU4W8fLuvFkqxX9zXq5i
 OZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770651491; x=1771256291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Jk99TzIHNfOaBko9b1E43IwPHNs+vzenJUms8qd4tnM=;
 b=qVPihooP89SW0szejuwfFOSiZrVS0rZlfctWPgVlaVcByYRZn8pQLGaKlSI0objg34
 aIJzgCzPf8KYIiVStBZRBGEpIUi6uAvygHA+mj3buGJu1tOBplBme9XM/Kmav/U7Y9vi
 UKcMjjd+I+t3TdJ2s8uA1jNMFM3f4Ar3yyHlFFb//MRMODin0oJ+lct80oLd4XcsYfAa
 ramz+9fah8qPQjFQSAYQeLblfEh33qOPEsTmyxqJRmobQjCreasW0rwz4RfzRyEJ4Jp3
 ClBzAUGk4LZ2pNzNuy74+UHMNMbIfhU6Pf5xenLtuCbCuNvPhLyezzB1x//44tveG8/x
 9sZw==
X-Gm-Message-State: AOJu0YzG7Plk+8nUdG1A31MkY7qnxC4O/XNE06AQUet4Ow6AcDcIn4g4
 +hg5FwC8DcZNvMRYd27OiErwKS+UbfyB/U1GjJwAnLLPOeeLAdNd67Op7DOVwtcqWsKvkncQrpm
 SX0SZ
X-Gm-Gg: AZuq6aJr5XoRewGpMID982VPU7K1tn9J63ImiviRMvGscv624Rf75XI8SHhEgLWRsjh
 BZYYqR27vKsLxTwHu6KnaQ9JugkhZyZUvJoZPH93pJ727dW3owwoTRebqef6zo2cWAtXJ65RMFs
 OYNPtAWW9E5On6Tfyzc/WJTunlFnq9hgdO0pMOw7WMiPHn8liZ0hWCa43R33rLKtiYEete4pIxM
 ohgmFmc2KO94ekISc4C3w6eb9CX/lGg71SmSlXAqzGY1nNrXMk773zdPPzDkPk9K9XB70bGNe4G
 GyUWA4ldmw4kYVZIqUKILntDFV2Qus9Tv3e8eTyjJEanGUY/6H5EGMIpP4BAFQ9Y94GHwI1vQy3
 jBu4Safh+6KDH9DMZ6BbELV9UinbXsTR/niCn+j7i++BzKvStGlDIBhqYNn3v6XfIqdRxVU4PUO
 6YJA==
X-Received: by 2002:a05:600c:6592:b0:47e:e7e5:ff32 with SMTP id
 5b1f17b1804b1-483209c6dd4mr181313355e9.34.1770651491431; 
 Mon, 09 Feb 2026 07:38:11 -0800 (PST)
Received: from localhost ([85.163.81.98]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4376a78d796sm11560760f8f.20.2026.02.09.07.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 07:38:11 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
 jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com,
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
 linux-coco@lists.linux.dev
Subject: [PATCH 1/5] dma-mapping: avoid random addr value print out on error
 path
Date: Mon,  9 Feb 2026 16:38:05 +0100
Message-ID: <20260209153809.250835-2-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260209153809.250835-1-jiri@resnulli.us>
References: <20260209153809.250835-1-jiri@resnulli.us>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[resnulli.us];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,resnulli.us:mid]
X-Rspamd-Queue-Id: 97271111F70
X-Rspamd-Action: no action

From: Jiri Pirko <jiri@nvidia.com>

dma_addr is unitialized in dma_direct_map_phys() when swiotlb is forced
and DMA_ATTR_MMIO is set which leads to random value print out in
warning. Fix that by just returning DMA_MAPPING_ERROR.

Fixes: e53d29f957b3 ("dma-mapping: convert dma_direct_*map_page to be phys_addr_t based")
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 kernel/dma/direct.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index da2fadf45bcd..62f0d9d0ba02 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -88,7 +88,7 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 
 	if (is_swiotlb_force_bounce(dev)) {
 		if (attrs & DMA_ATTR_MMIO)
-			goto err_overflow;
+			return DMA_MAPPING_ERROR;
 
 		return swiotlb_map(dev, phys, size, dir, attrs);
 	}
-- 
2.51.1

