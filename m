Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEEF65F4EF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 21:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8946810E802;
	Thu,  5 Jan 2023 20:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9961C10E802
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 20:04:24 +0000 (UTC)
Date: Thu, 05 Jan 2023 20:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1672949062; x=1673208262;
 bh=Iu0S5pzTOxTDfG7nebE2jCK1ayWZMXcNpMamDyFKYu8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=bxv1IiLGY0gFh32sbqKjzec04SrU7o24i6IkRpdyZKjaRBJ2yI7CkD0/vPCc54qJJ
 YZBRgNgVb+MObZtrwDLfxWnZwoUJTlKF11mlMoDCz7bW4JLbVXL+dqDyDiQ5C3vFTD
 kuLAMsYu+F+7LY5h9m9anRK8sDkxX1YzrXFJqFAbkvlNnwAsEMwP3ZZjkC9mmvsLEs
 Ec9gBeOy0WNE+JzL3/Y6Kw6AmmBgbtDNI7xUaDsI19RVn5ldagxS/VZZwcXAf7AAbB
 GMpGHakg6phGm8Nxq4Ufqw/4eBW2VhfkRL0jzBg8By6mN9S04ca0cdm5SsluXmQFU4
 yRjSC+3wStIGg==
To: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/gem: Check for valid formats
Message-ID: <Zn2icOxZL4nAQSFhSBqEVhJyWT23ofYkl4NW4oIGs4JGMAT1GTfL6-K5QEGfEqRC9o2Ujg3zXGrAiLY7VRhS1OIqftCdUOXCPSd3wsS8CPE=@emersion.fr>
In-Reply-To: <a958c1c9-680e-a85d-d373-57c7546c7fbe@igalia.com>
References: <20230103125322.855089-1-mcanal@igalia.com>
 <Y7bsKFCIOgauVbII@phenom.ffwll.local>
 <7104fc80-f996-8fce-eb72-b29ba4ff438e@igalia.com>
 <CAKMK7uHZcLc1UYD44Zpi2wkrkuKAWXpQZKtdy4wwMW9wqJJ_og@mail.gmail.com>
 <5d2ed13c-2317-bc77-68d1-ce3099382f68@igalia.com>
 <UBhD-Gmig3Df3ErqWGXZZ1hWkfdkPBywcckHxoKwwoc3N33Uf8rQumRw-nlsyrk9r8-KINUU8Evudytuu3lLcFnNZijSV3LbA0K8UVagpHc=@emersion.fr>
 <ccc74a8e-a7f9-7eb1-22b6-9bce60bdcdc7@igalia.com>
 <ukOECyKlhRh1kJyKRS31jhyXsjawb6urSVNYuLkOjRC15BbVEif1wANfPtHAjzLAirubEc8oGt56k6GsUjSSQYeDSbwq2uwYBFsvAAFMwXQ=@emersion.fr>
 <a958c1c9-680e-a85d-d373-57c7546c7fbe@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To be honest, your suggestion to put the check inside framebuffer_check()
sounds like a better idea: we wouldn't even hit any driver-specific
code-path when the check fails. Daniel, do you think there'd be an issue
with this approach?
