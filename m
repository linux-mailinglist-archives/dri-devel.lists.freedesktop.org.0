Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AE54F4E4B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 03:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2770210E6B6;
	Wed,  6 Apr 2022 01:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701F310E697
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 01:45:57 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5E0FD839BA;
 Wed,  6 Apr 2022 03:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649209555;
 bh=v3oFc7B9bk2XqycnFoV04ixZ2YcCpeqjwMggrSrn75U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=o4J3v1s3ENNJEYYwqYgvj1wHS6f9tcldZPd7pkPdyzU6mW3Rol9t91MY41+ydOFqP
 0+mAXb9BdNRZ2rgPZJELmfBa6E4gzP2kSyYospn3W4EdT82ZcOnH7cB2Z65VruxKdR
 mOqgA4gc3aKwE8vKKIvh6unJbnqA7H0GJOPFkoyUuK1PErGEavYAv622jrZA8FJHTe
 AFRZP+T+p11ZJOuJOaODsOnGV3lBVABwYHlSCsCZGYEhQJh1PEp+WXBohaylgwS4kZ
 35eOXXxc7NIJJJznSlFPJRyzhqXWcV9M+Mg0oblqaqIj+YdwmsVHAJ3ajIvwgY1t0h
 fcGjS6QUK0LAw==
Message-ID: <481e40a3-bf84-1b04-b6e6-2a74a0b4b6fe@denx.de>
Date: Wed, 6 Apr 2022 03:45:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20220406105828.6d238651@canb.auug.org.au>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220406105828.6d238651@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/22 02:58, Stephen Rothwell wrote:
> Hi all,

Hi,

> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> WARNING: modpost: drivers/gpu/drm/bridge/chipone-icn6211.prelink.o(.exit.data+0x0): Section mismatch in reference from the variable __cfi_jt_cleanup_module to the function .init.text:cleanup_module()
> The variable __exitdata __cfi_jt_cleanup_module references
> a function __init cleanup_module().
> This is often seen when error handling in the exit function
> uses functionality in the init path.
> The fix is often to remove the __init annotation of
> cleanup_module() so it may be used outside an init section.
> 
> Introduced by commit
> 
>    8dde6f7452a1 ("drm: bridge: icn6211: Add I2C configuration support")
> 
> The chipone_exit function should not be marked __init.

Thanks, fix is submitted.

Sigh.
