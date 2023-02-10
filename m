Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B25269179D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 05:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5D010EC3A;
	Fri, 10 Feb 2023 04:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89C910EC4F;
 Fri, 10 Feb 2023 04:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=4VsXfANm+kYIo05AeEA5j8t+IDPU2nct/ungBhLGgeA=; b=zDZkNlQCoG1oYpv5Yx8GSQwD72
 ysCRyQtNoBm4+WkyxQZr4qeRctvgDxbeNju2Wt5mhaiYAfFJ2Vfq+FfhF9TfeQVBNRVAi4JbrmNvZ
 a8sZo8LcSYw+TLpZSmdMPuVoc6yYuK1C+ciHAEaA8So3B0ye7MowMF96xnUd5AHCdgX6hJEtVFkdR
 psQRRgHD1bjorn83YxrM8gC5oRKffQtjMo39zhkaYuoK+CWQyw3XI2LgR3TonMCwmZqjk8oo0vFF8
 VS6ODdYFJq8U+73M+QV/rv1xTROz0P4plld8UomPNskPuPweKQBTkdfEp5m0hGHdq0PWN+N7nW7qJ
 pm7LL/sA==;
Received: from [2601:1c2:980:9ec0::df2f]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pQLBL-004D4t-9I; Fri, 10 Feb 2023 04:38:43 +0000
Message-ID: <0779deb4-7eea-e1b2-2394-7e5dd5e30d3f@infradead.org>
Date: Thu, 9 Feb 2023 20:38:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: error: 'const struct dc_dsc_config' has no member named 'is_frl'
Content-Type: text/plain; charset=UTF-8
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

The 'is_frl' struct field is conditional:

#if defined(CONFIG_DRM_AMD_DC_DCN)
	bool is_frl; /* indicate if DSC is applied based on HDMI FRL sink's capability */
#endif

so code that uses it should be careful, otherwise build errors may happen:

../drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c: In function 'dp_active_dongle_validate_timing':
../drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:126:66: error: 'const struct dc_dsc_config' has no member named 'is_frl'
  126 |                         if (timing->flags.DSC && !timing->dsc_cfg.is_frl)
      |   

Seen on arch=um and arch=riscv (RV64).

-- 
~Randy
