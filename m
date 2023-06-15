Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F22731BC0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 16:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B0F10E503;
	Thu, 15 Jun 2023 14:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8B410E503
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 14:50:26 +0000 (UTC)
Date: Thu, 15 Jun 2023 14:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1686840624; x=1687099824;
 bh=2oLSxhVwJyfjofPX6o77t+Pj6Q57Jdv4QACl2PymAo4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Al8CqUU4KtXVjYuTzC5CuhRrDKJVk07ewph5pUdevh7qPMQi8R0LAh5/GOcDgyUMK
 Mmj0I8CC0veJMkWkT8icdq1B3yO/Al7z+mU82lD+vhwRclYhSXx/tozm1CmFGSDJZd
 PpgGsYFnMK5GdMaqJBDyBLVL/UIZs8NkG8WVA7vh/TxtWtlcpM4ZvcioYAIYJjTya0
 DEAS4oWwKif1NBozJiw1EnSmhTTmETQL7gTVYOjQJAIJwmrMo1pCUIBxUrxMJYx4D2
 xu9iL/GkdalZrDHKscnoZi2R6wDS3PEEng9xL+5QeF9m0T0g6UGVf8YxDCBCJqjoa7
 Ze2zzX9JofDqQ==
To: Thomas Zimmermann <tzimmermann@suse.de>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/3] drm: Allow PRIME 'self-import' for all drivers
Message-ID: <O78vhvv6qtN2Fjh9tljnBnBeNwr-eASqyXaUG3e8cWPZ2MqoOSWR_D8S_ce2gqSvbLkJwX72tmc6ReUry0OTqJQWwhDcyrZrQP4hgg7iH30=@emersion.fr>
In-Reply-To: <20230615094206.4424-1-tzimmermann@suse.de>
References: <20230615094206.4424-1-tzimmermann@suse.de>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: mripard@kernel.org, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, June 15th, 2023 at 11:31, Thomas Zimmermann <tzimmermann@suse.=
de> wrote:

> Set drm_gem_prime_handle_to_fd() and drm_gem_prime_fd_to_handle()
> for all DRM drivers. Even drivers that do not support PRIME import
> or export of dma-bufs can now import their own buffer objects. This
> is required by some userspace, such as wlroots-based compositors, to
> share buffers among processes.
>=20
> The only driver that does not use the drm_gem_prime_*() helpers is
> vmwgfx. Once it has been converted, the callbacks in struct drm_driver
> can be removed.
>=20
> Simon Ser implemented the feature for drivers based on GEM VRAM helpers
> in [1]. This patchset generalizes the code for all drivers that do not
> otherwise support PRIME. Tested by running sway with gma500 hardware.

Very nice! Thanks a lot for doing this!

Just one minor comment about docs. I think there are also some remaining
references to drm_gem_prime_handle_to_fd() and drm_gem_prime_fd_to_handle()
in the drm_prime.c overview. These become stale since this series unexports
these functions.

With that fixed:

Reviewed-by: Simon Ser <contact@emersion.fr>
