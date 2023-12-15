Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5698148C7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 14:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0279410EA0E;
	Fri, 15 Dec 2023 13:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE5910EA13
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:13:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 43CEEB826C3;
 Fri, 15 Dec 2023 13:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ECCBC433C8;
 Fri, 15 Dec 2023 13:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702645984;
 bh=lLwzrgxcaUHAFk47T3+S+izU8CDg1Vqs/F6ioCNsFls=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mgnkrExkZI4ZZGrW7R4y/ZQkY8EHnZWPeO71l2kMfGk3j5YU/erIP774PK7AYgcqd
 4kpuygxAiDTi02ZFjDrCCpe/3whoh8E8pnXiJROrygHTYu4x0kzpL4TNh/2FD6hzHE
 0d/4yT4cGEtnWKWDF1JTld7+xpqNbQgGaI6ZxTa1Tr5ufNtVGHRALsWreuUVSeG+ii
 zDrsEnL6Qjt2Ux1APozBcBShOZWOzMh6yiFxqTaYsJC+lFXN/Y8acZ825v5DxGWxsQ
 b73AfwIiGDG0ba9lHQXZ06irb4ds1Xqm1YZfhwJwjgsrDgMZH7PlUXezS6zrj1vc+2
 JAyE5yqBTTWVQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Donald Robson <donald.robson@imgtec.com>
In-Reply-To: <20231208160825.92933-1-donald.robson@imgtec.com>
References: <20231208160825.92933-1-donald.robson@imgtec.com>
Subject: Re: (subset) [PATCH] drm/imagination: Fixed infinite loop in
 pvr_vm_mips_map()
Message-Id: <170264598213.449619.12866525083643261549.b4-ty@kernel.org>
Date: Fri, 15 Dec 2023 14:13:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: tzimmermann@suse.de, matt.coster@imgtec.com,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 08 Dec 2023 16:08:25 +0000, Donald Robson wrote:
> Unwinding loop in error path for this function uses unsigned limit
> variable, causing the promotion of the signed counter variable.
> 
> --> 204         for (; pfn >= start_pfn; pfn--)
>                        ^^^^^^^^^^^^^^^^
> If start_pfn can be zero then this is an endless loop.  I've seen this
> code in other places as well.  This loop is slightly off as well.  It
> should decrement pfn on the first iteration.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next-fixes).

Thanks!
Maxime

