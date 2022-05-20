Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3101D52F001
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 18:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F6110E791;
	Fri, 20 May 2022 16:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4418110E791
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 16:05:00 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id e2so469655wrc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 09:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=znA8cfMsy9necYNeW0un5CDeTQYcG+NaGrcgbE7Qc9U=;
 b=JopMXJ7clcSkxIBn6M73X2xRTKX5oF5JoAQMU8us42OUlYolcxyiiuQkP0zjMcerzX
 /qHr9+q3zT5GgGcda58u+TpiO1WOEIZFtfBj0+bU80rBUaae8sYOVYuRXw/NEefwwfDF
 BoUPpHIRkUxreRcPIZ3kNTICKWyGp+lACfP18Qx83ykYD3HFhXwd9sh4BF24okr+QNud
 0IXgUVF6Itr2NXtMpl5pTfKDGOQ7BiRvSZhip37MGXqYBt36jKGP2o/Wn2pKkjNKl4OS
 6ZRO3lLjUJ31k4AWkvHev7EBY30CKM0xSsuDdCSihyfQFsnONnE58CyI3sE83k1U/FvW
 mg2A==
X-Gm-Message-State: AOAM530Ercw/TAVng0YcW3Mjuos32XOiCCCOpArpht69TN2oCamIo6Qk
 8uYrAUsnW176ua/E9WvWTTI=
X-Google-Smtp-Source: ABdhPJzVBU9OT5V2aJFBxPSjcscT22BehkQdcY4NBwEls+uES4fYLVTSlw50QD9SuzILMGH2C/O7fA==
X-Received: by 2002:adf:dd81:0:b0:20e:5853:1762 with SMTP id
 x1-20020adfdd81000000b0020e58531762mr8993811wrl.447.1653062698678; 
 Fri, 20 May 2022 09:04:58 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 r17-20020adfa151000000b0020d00174eabsm2781202wrr.94.2022.05.20.09.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 09:04:58 -0700 (PDT)
Date: Fri, 20 May 2022 16:04:56 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
Subject: Re: [PATCH] drm/hyperv : Removing the restruction of VRAM allocation
 with PCI bar size
Message-ID: <20220520160456.3ibns7xyx7jv236d@liuwe-devbox-debian-v2>
References: <1653031240-13623-1-git-send-email-ssengar@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653031240-13623-1-git-send-email-ssengar@linux.microsoft.com>
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
Cc: linux-hyperv@vger.kernel.org, airlied@linux.ie, haiyangz@microsoft.com,
 ssengar@microsoft.com, decui@microsoft.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, drawat.floss@gmail.com,
 Wei Liu <wei.liu@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 20, 2022 at 12:20:40AM -0700, Saurabh Sengar wrote:
> There were two different approaches getting used in this driver to
> allocate vram:
> 	1. VRAM allocation from PCI region for Gen1
> 	2. VRAM alloaction from MMIO region for Gen2
> First approach limilts the vram to PCI BAR size, which is 64 MB in most
> legacy systems. This limits the maximum resolution to be restricted to
> 64 MB size, and with recent conclusion on fbdev issue its concluded to have
> similar allocation strategy for both Gen1 and Gen2. This patch unifies
> the Gen1 and Gen2 vram allocation strategy.
> 
> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> ---
> FBdev patch Ref :
> https://lore.kernel.org/lkml/20220428143746.sya775ro5zi3kgm3@liuwe-devbox-debian-v2/T/
> 
[...]
> -static int hyperv_setup_gen2(struct hyperv_drm_device *hv,
> -			     struct hv_device *hdev)
> +static int hyperv_setup_gen(struct hyperv_drm_device *hv,
> +			    struct hv_device *hdev)

There is no need to have "_gen" suffix anymore.

I don't know much about the rest so cannot really make any meaningful
comment here.

Thanks,
Wei.
