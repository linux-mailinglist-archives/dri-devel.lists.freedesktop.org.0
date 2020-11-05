Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9282A915E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89D06EA75;
	Fri,  6 Nov 2020 08:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F090C6EDD2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 17:00:37 +0000 (UTC)
Received: from HKMAIL103.nvidia.com (Not Verified[10.18.92.9]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa42fb40000>; Fri, 06 Nov 2020 01:00:36 +0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Nov
 2020 17:00:22 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS)
 id 15.0.1473.3 via Frontend Transport; Thu, 5 Nov 2020 17:00:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=By1NsUN5b8RRGFc32yc5YsFMj3fIx6ZNQ9bY8yJu7mvKtdSFtDX+7KiJ/14WaYJgJF0ybYS6zJM5oVa/xGm8VCDtGntVrpzIJCZMs8wb5ep/QLN9rBwQ+9g16QHZWsbaWojsqhbS4pSx534iXaG5GIee+vqXlQEQG1WF+J1PFTNGYvcLlE/Hz+WSN/s3/bEpCVqKWKQAGwGnUb+T283zWpHk1F4aty4IM9FB9xbejApxOuLwQVto7DiGrhBtzXxAJpZUPKGvDr23+GZllCfIb3fHWbkEkngYcymYcHK+Vt9X6Adc+joKcgy2gk/nJ65ADLjOj6SPV7f7nio4Apm3rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePLhMY+6UZh7oR8TYEZJUyFahB2BR04H5E0isD4v2Z8=;
 b=G9eCiRhICPH7umqAca4X+TeSjhGcMcNVcXnBhaCbYPc6FMY+Dd6sQ1zWDcFcpLGvXGTqiCPQauxN+hSjIVujulEiJMtqn9c6wYTLTr8VBKDi4ABvsTqkevx1s1TYYHomhIw//PNpLAexgQ1/5b/vsEk6YtUP26dxBlZL2JerB81ihq5HmGdixfs6DkvpHuOx/j3QEfPepa64bdlvKG0HGhX5PpmRAdotCFmiX94lPDR5eoH+ezuRlbz9Y5Fu4PnZgiFGAUSWpq8SIyWtjUDj/c74oRzNDYGDmyFsqF15kQecyHLiAN12mDfK+L0KfunaoFg3LyZyUOe5IDZM58l4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB2779.namprd12.prod.outlook.com (2603:10b6:5:4f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 5 Nov
 2020 17:00:20 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 17:00:20 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Bartlomiej Zolnierkiewicz
 <b.zolnierkie@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Tom Lendacky
 <thomas.lendacky@amd.com>
Subject: [PATCH] drm: remove pgprot_decrypted() before calls to
 io_remap_pfn_range()
Date: Thu, 5 Nov 2020 13:00:19 -0400
Message-ID: <0-v1-2e6a0db57868+166-drm_sme_clean_jgg@nvidia.com>
X-ClientProxiedBy: MN2PR12CA0032.namprd12.prod.outlook.com
 (2603:10b6:208:a8::45) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR12CA0032.namprd12.prod.outlook.com (2603:10b6:208:a8::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 17:00:20 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kaicV-0007zk-EK; Thu, 05 Nov 2020 13:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604595636; bh=+uVsIBtcv3Vj55p/qtJ1U+7ugqR2N/ieF+31UaiTgWk=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
 Subject:Date:Message-ID:Content-Transfer-Encoding:Content-Type:
 X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=YqXgb/cA5GsY6Hi0glSZTJoZdtJJMHyzqSmaTKmlo9qSg++fpAJrWzFeyfMAu8gQb
 HH8EvM9n8oWymguDSufcfnZIMBuc0eQYzfWQjygmT7r9lbhOM2IJ6Si+OXjrYfkOD1
 bQJZAOghb1O6Pg13ne5A7bdo461kx9O9MTbv+iyP3RUbac9UsSDfimkifr1H5mJUK6
 eVtUKNVea3OFLnLa7BAY+pAX1lP+Oyb08KUs6gGdT0/oYrBPe0gxw3n0iP/ChOE42z
 9DxqmHZqUO+VKdGIVo+SRK/eF7LgF2QU7khCM1RCwrmUEjaSwiLz8N3FNxJqmFyusg
 H+0McX8V1biDg==
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit f8f6ae5d077a ("mm: always have io_remap_pfn_range() set
pgprot_decrypted()") moves the pgprot_decrypted() into
io_remap_pfn_range(). Delete any, now confusing, open coded calls that
directly precede io_remap_pfn_range():

- drm_io_prot() is only in drm_mmap_locked() to call io_remap_pfn_range()

- fb_mmap() immediately calls vm_iomap_memory() which is a convenience
  wrapper for io_remap_pfn_range()

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/drm_vm.c         | 3 ---
 drivers/video/fbdev/core/fbmem.c | 5 -----
 2 files changed, 8 deletions(-)

rc3 will have the dependent patch, this should not be merged to DRM until it
has the rc3 commits.

There are three other pgprot_decrypted() calls in DRM, I could not figure out
what was what there, but other than very special cases I would expect code to
use io_remap_pfn_range() instead.

diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index 1a636963378947..6d5a03b3223800 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -70,9 +70,6 @@ static pgprot_t drm_io_prot(struct drm_local_map *map,
 {
 	pgprot_t tmp = vm_get_page_prot(vma->vm_flags);
 
-	/* We don't want graphics memory to be mapped encrypted */
-	tmp = pgprot_decrypted(tmp);
-
 #if defined(__i386__) || defined(__x86_64__) || defined(__powerpc__) || \
     defined(__mips__)
 	if (map->type == _DRM_REGISTERS && !(map->flags & _DRM_WRITE_COMBINING))
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 8268bbee8cae11..63a27a67a05cfa 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1386,11 +1386,6 @@ fb_mmap(struct file *file, struct vm_area_struct * vma)
 	mutex_unlock(&info->mm_lock);
 
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
-	/*
-	 * The framebuffer needs to be accessed decrypted, be sure
-	 * SME protection is removed
-	 */
-	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 	fb_pgprotect(file, vma, start);
 
 	return vm_iomap_memory(vma, start, len);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
