Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37312B02EFD
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 08:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0864210E0DE;
	Sun, 13 Jul 2025 06:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Y0LNISne";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9DC10E0DE
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 06:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=sLbiq/0nfCsd9v6VJPO9Ovu9FstS4u9XiQgcgz6zoEo=; b=Y0LNISne1pd2goWJ2ms/VjfQ3v
 LI1oCZzY66HjcZ0VEEeBgp9yI0uHMk5SAYamAV1UkvbNbjLKra9z+O9+iTj7kMyXUBy5pK52ran/w
 ODlaGL947uWAVanUNIUbf3CKbSoKrRbOTlarKT/EbavmVrONm9XSoCzu65LgC53NlNS8b/qLGV+XD
 CYCYZOW9N/3Q+gDjI8ye/k8Q3y8d7Fcc9XDwNh5pxrgTMs5Ww9+km3Wncn7H3weHUZQdmLWmTeCZd
 V/t0XuJwoasEm73YtwsNEctm0eD1Zl8M1zByKIrSIJNtblFsPJXt1Tbnc0yuOkTRdh2MEop42kZr5
 IZUVNG4g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uaqWk-0000000HPnB-2NSK; Sun, 13 Jul 2025 06:49:34 +0000
Message-ID: <e744987a-2fed-4780-a9c6-fd1175698da8@infradead.org>
Date: Sat, 12 Jul 2025 23:49:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jul 11 (drivers/gpu/drm/msm/msm_gem.c)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org
References: <20250711191014.12a64210@canb.auug.org.au>
Content-Language: en-US
In-Reply-To: <20250711191014.12a64210@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
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



On 7/11/25 2:10 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250710:

on i386, when:

CONFIG_DRM_MSM=y
CONFIG_DRM_MSM_GPU_STATE=y
CONFIG_DRM_MSM_GPU_SUDO=y
# CONFIG_DRM_MSM_VALIDATE_XML is not set
# CONFIG_DRM_MSM_MDP4 is not set
# CONFIG_DRM_MSM_MDP5 is not set
# CONFIG_DRM_MSM_DPU is not set

so DRM_MSM_KMS is also not set:

../drivers/gpu/drm/msm/msm_gem.c: In function ‘msm_gem_vma_put’:
../drivers/gpu/drm/msm/msm_gem.c:106:54: error: invalid use of undefined type ‘struct msm_kms’
  106 |         msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
      |                                                      ^~
../drivers/gpu/drm/msm/msm_gem.c:107:39: error: invalid use of undefined type ‘struct msm_kms’
  107 |         put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
      |                                       ^~
../drivers/gpu/drm/msm/msm_gem.c: In function ‘is_kms_vm’:
../drivers/gpu/drm/msm/msm_gem.c:668:39: error: invalid use of undefined type ‘struct msm_kms’
  668 |         return priv->kms && (priv->kms->vm == vm);
      |                                       ^~

-- 
~Randy

