Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6956A655511
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 23:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19E910E25C;
	Fri, 23 Dec 2022 22:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CF810E25C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 22:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YhlmX038fEtdxHekWSWN0VPbSS5RA2dz6m5q0kGEkWE=; b=bmxvCIqmHjr4bysp7+reM6Pq1J
 7FNOPK3oR4BYAySBv/4a1yBEUft29tzSdQJn5pPFbBcvCsphu7gPb68MhrK/BKGrBE99+PAG2j1Ku
 zsRzrA+GFaH9cvbWI/+8SwxVHBIZFLwCRmTxrHrqgP5xIzf+aQ0GlopUI32Q0/Dk0P4R1DyvyPgNx
 rFetNgL74E6PAndYcgcNuufnfc9Piali5Q4FAT5X2cDZ4SDSoGQzudzzja5dhjxVxGe89wt1BaiRy
 ocw6q1ZxOICdnkFaYp0OiMC7YkwdNu2sX8fy0PDmijV7QGYlSg6pVOBUkU0+D9E5G9AzvcDNacL1y
 TKf5AWYg==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1p8qVm-008rDq-Vz; Fri, 23 Dec 2022 23:27:31 +0100
Message-ID: <6d3486ef-db9d-6b53-096e-00c961a5424b@igalia.com>
Date: Fri, 23 Dec 2022 19:27:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/tests: reduce drm_mm_test stack usage
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221215163511.266214-1-arnd@kernel.org>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221215163511.266214-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>,
 Daniel Latypov <dlatypov@google.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/15/22 13:34, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The check_reserve_boundaries function uses a lot of kernel stack,
> and it gets inlined by clang, which makes __drm_test_mm_reserve
> use even more of it, to the point of hitting the warning limit:
> 
> drivers/gpu/drm/tests/drm_mm_test.c:344:12: error: stack frame size (1048) exceeds limit (1024) in '__drm_test_mm_reserve' [-Werror,-Wframe-larger-than]
> 
> When building with gcc, this does not happen, but the structleak
> plugin can similarly increase the stack usage and needs to be
> disabled, as we do for all other kunit users.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied it to drm-misc-next-fixes with the small checkpatch fix.

Best Regards,
- Maíra Canal
