Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1545CBFE3AC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 22:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CDC10E194;
	Wed, 22 Oct 2025 20:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Dfff7yyT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84ED10E194;
 Wed, 22 Oct 2025 20:56:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9A16648751;
 Wed, 22 Oct 2025 20:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B90C4CEFD;
 Wed, 22 Oct 2025 20:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761166578;
 bh=inAMQyKAc1Q8OSBoBIraOPZUOkirC95Di7Iww6dYpAk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dfff7yyTETuXCELBEpQeQ7Gl/odWr5fAovIYkxNdoLMFkbpUoGOy0qlwzNA6oz8HC
 D1VVrBI6LrqRPANuP+v0x8ZM/UbeNWtFxIXb9bcoLBwiUWtC9w1HDllnPqldYlKBhj
 zD7/KQVbhy1VASnoy1Iz4118HpSZUMh0qz24wZi+EtIh0N2xVKbebLbmioPF1gJJpx
 h6OeD6t0dw0tWKTW4j8w4kI6Jwu6UOVY+5ypezoV+K6Caaxp5XvMIJMFeqpWMPEcX7
 jmz0VsYeI0LPj2XDU1/Dzcm05oh+oeQuistKvEQ8cXMYjQ2c04YFZdfSn/CogGeq36
 rbMqXMstfcSig==
Message-ID: <904ba70f-b1bf-4745-8e92-d27a6c903673@kernel.org>
Date: Wed, 22 Oct 2025 22:56:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/nouveau/uvmm: Allow larger pages
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, Lyude Paul
 <lyude@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org
References: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
 <20251009233837.10283-3-mohamedahmedegypt2001@gmail.com>
 <CAA+WOBvVasy2wRP_wmP-R6Q8y5B4sN08jNYfHuDVjiWXV+m23Q@mail.gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <CAA+WOBvVasy2wRP_wmP-R6Q8y5B4sN08jNYfHuDVjiWXV+m23Q@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/22/25 12:16 PM, Mohamed Ahmed wrote:
> Pinging again re: review and also was asking if we can revert the
> select_page_shift() handling back to v1 behavior with a fall-back
> path, as it looks like there are some cases where
> nouveau_bo_fixup_align() isn't enough;
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36450#note_3159199.

I don't think we should add a fallback for something that is expected to be
sufficient.

Instead we should figure out in which exact case the WARN_ON() was hit and why.
