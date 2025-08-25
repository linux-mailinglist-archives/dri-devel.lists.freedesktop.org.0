Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87FAB337BF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 09:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE9510E05F;
	Mon, 25 Aug 2025 07:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X4nJcl9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AB110E05F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:26:30 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3c854b644c1so767165f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756106789; x=1756711589; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YXW4WXdZbpuVMj+45X2QEx8cTs8sv2KAIiv17RXifaI=;
 b=X4nJcl9yvIksuklmlfzLPqANy+cvibuwn3pEAZeZbL6vkd4LAK9cK/Q7YO2k1l16pJ
 5y9Kt4qR2kmBoYQDSWzaJEXCSn/hdbbWENgvqi/9y6IFbCHV7HqQhPtU+Zq49iud0Glb
 TDhklJBFilVTQj8VZzLfVEjCAx+GOkwD4fg90NfwZXKsv4QrgCqfGs1CwjCyzgI7hT/n
 EnEZ0DInyw7q4xG6OAMKauNMfphsjP2K4/WHn+RMAM7EmIpAdkFb48EoYyWJRvigWqEA
 Qt88r+TnlcrWmboSzuqiEklyfkfpcjFuntWP2/VpdZE80cU/Uy/rs64Rxmoj6EITIU8i
 Z84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756106789; x=1756711589;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YXW4WXdZbpuVMj+45X2QEx8cTs8sv2KAIiv17RXifaI=;
 b=dxBUqET/QvsnfpRDVPla4D/r5jc4U/Ao5FpjJY36c+O/R9J/clCgX2BoL/E308PSIJ
 xEcyjC/EKcc9eXDP4/TDIFXtHAhCHXRf0LsZPPxnKZNXJOAM8UWQo2koVqbPCE5SWU4g
 YM6mViaWA91JVxLVV5TREh4I1gquwgAWmpDhcVKa8wLy/IFQ6jqmir6Qm/vlHv5NJnNv
 Ov1abDWWNCtd4EvMGcaoCAueRkrgP1dGLRLoqNALpPKWHZHqt07ZnvZpeOUE/QQfYRzZ
 Yk4BvdCeXsxbLxXtecXybolMSEtfr2Y5n9FE7sBaWvjjf0hmlDJSkg+6/JXk2j2jLsXr
 BjBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYz50wlyCQqC/cN3xAKMd+9JDmpSBf/GB2pyFohH5m9G+jkbZkODtX74P6HbxFVPh9o6MacGwt5oQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ7/WWXOZl7QcvwA07FAQ5rzzRbQoCDwK9gXRkrdE66ooaRY47
 dg18xNyTQ59BIN/iRgwhIAZLcWjmVp8sTLlnQN81lAyMFDepftGqTkyoAKn1pwUxKQw=
X-Gm-Gg: ASbGncs/8pHVhDAw5Z9sctc9+FWdQvZVtbH9988dy/XEJypwFMom2l6YdcVTuZmUaEI
 Y/XjRqcjE5E8FylYOr4DplM00Ffnui+/o5as7ko0e+YHrYJcMiGKwXNjqHjkNKokd8RsiLBq3Bx
 UROVzHqn7QKP6qVF9FtfrSGTeIiLm8+Hg/AzkMmfi4NPYSt9Sxvf9pjzi4Q2zVnEVZkE3Itz/jJ
 fxxtc+NyAtIhPM6sCPkeczlMxsty68JEdOlVyP3skox2FPS7DwcvbxhoLgIECrm/lAr4uQFx8dQ
 YVEA3i0b/HdKfN3QxnOdi/z9Q7fk8G7gHm1l1tEjREvPX80aq8iUfRh6987njOQScrfIBlHd8KO
 rI98hOFujLZ3Q2EQl3SNy/WLsrwo=
X-Google-Smtp-Source: AGHT+IHr3tXyCt5Yvc6g17pBN46i+4YotNdNbVGbK4q48niWSb9xQKqdHzzLOgg+Scq9+9QVsNBEzw==
X-Received: by 2002:a05:6000:24c7:b0:3c8:1df2:540c with SMTP id
 ffacd0b85a97d-3c81df25723mr3798109f8f.43.1756106788624; 
 Mon, 25 Aug 2025 00:26:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c7116e1478sm10327401f8f.46.2025.08.25.00.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 00:26:28 -0700 (PDT)
Date: Mon, 25 Aug 2025 10:26:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 jfalempe@redhat.com, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 6/6] drm/ast: Put AST_DRAM_ constants into enum
 ast_dram_layout
Message-ID: <202508240748.TUAvbluX-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822132846.25376-7-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-ast-Do-not-print-DRAM-info/20250822-213333
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250822132846.25376-7-tzimmermann%40suse.de
patch subject: [PATCH 6/6] drm/ast: Put AST_DRAM_ constants into enum ast_dram_layout
config: i386-randconfig-141-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240748.TUAvbluX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508240748.TUAvbluX-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ast/ast_2100.c:63 ast_2100_get_dram_layout_p2a() error: uninitialized symbol 'dram_layout'.

vim +/dram_layout +63 drivers/gpu/drm/ast/ast_2100.c

334d62edac4c5b Thomas Zimmermann 2025-08-22  38  static enum ast_dram_layout ast_2100_get_dram_layout_p2a(struct ast_device *ast)
b59465efc7cb88 Thomas Zimmermann 2025-08-22  39  {
b59465efc7cb88 Thomas Zimmermann 2025-08-22  40  	u32 mcr_cfg;
334d62edac4c5b Thomas Zimmermann 2025-08-22  41  	enum ast_dram_layout dram_layout;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  42  
b59465efc7cb88 Thomas Zimmermann 2025-08-22  43  	ast_write32(ast, 0xf004, 0x1e6e0000);
b59465efc7cb88 Thomas Zimmermann 2025-08-22  44  	ast_write32(ast, 0xf000, 0x1);
b59465efc7cb88 Thomas Zimmermann 2025-08-22  45  	mcr_cfg = ast_read32(ast, 0x10004);
b59465efc7cb88 Thomas Zimmermann 2025-08-22  46  
b59465efc7cb88 Thomas Zimmermann 2025-08-22  47  	switch (mcr_cfg & 0x0c) {
b59465efc7cb88 Thomas Zimmermann 2025-08-22  48  	case 0:
b59465efc7cb88 Thomas Zimmermann 2025-08-22  49  	case 4:
334d62edac4c5b Thomas Zimmermann 2025-08-22  50  		dram_layout = AST_DRAM_512Mx16;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  51  		break;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  52  	case 8:
b59465efc7cb88 Thomas Zimmermann 2025-08-22  53  		if (mcr_cfg & 0x40)
334d62edac4c5b Thomas Zimmermann 2025-08-22  54  			dram_layout = AST_DRAM_1Gx16;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  55  		else
334d62edac4c5b Thomas Zimmermann 2025-08-22  56  			dram_layout = AST_DRAM_512Mx32;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  57  		break;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  58  	case 0xc:
334d62edac4c5b Thomas Zimmermann 2025-08-22  59  		dram_layout = AST_DRAM_1Gx32;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  60  		break;

Should there be a default case?

b59465efc7cb88 Thomas Zimmermann 2025-08-22  61  	}
b59465efc7cb88 Thomas Zimmermann 2025-08-22  62  
334d62edac4c5b Thomas Zimmermann 2025-08-22 @63  	return dram_layout;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  64  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

