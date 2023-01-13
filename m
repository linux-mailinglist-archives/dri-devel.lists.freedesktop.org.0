Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2F669F05
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 18:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86C610EA71;
	Fri, 13 Jan 2023 17:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8D110EA71
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 17:06:22 +0000 (UTC)
Date: Fri, 13 Jan 2023 17:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1673629580; x=1673888780;
 bh=jJeQxB8/KmXQitNwPXMWSStRuaiDU+YY9uukqpwJCMM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=myo3w9kxodoVv683E7PVtGGb+N1R3b5tkPqfMdcwwscIzUnicMv96wCp72tzSCxVL
 CdP/7+F/8Ybe0SfOUqn2AvM8sSsAOEAD61eNOHB7vg1kLBYf/EOsMN67ouFVt2UHsw
 dkjtlyouAn81Y5p4/coJdnCMPoQIFP2Rs+X4qPFBAOQkWqarvfoTp1QOHOkBg9fqmE
 heM0G8LtnEdhB9BoQfHmKFMPeSNmYHgf1gDalORVEAtC0ehRF6KqNP7LwNzdqVkNxs
 akwPGsMADpvYijyMCNs+Y/5tjEaJsRGZZ8GT1QxHFFTzkqgReFjoFLh3d0X1RL0Bd+
 ebU+iW/r8ADag==
To: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 2/3] drm/amdgpu: Remove redundant framebuffer format
 check
Message-ID: <feD8ifyiQQcVKESmwwRiyFCSBrXbRd6kGm8LGHgC0ympY2Qsc9Oi3UEqva2xVspk59CvZV4kpgCJUUKPJt9scwsIMAVBvDZrXMihMehs_WM=@emersion.fr>
In-Reply-To: <20230113165919.580210-3-mcanal@igalia.com>
References: <20230113165919.580210-1-mcanal@igalia.com>
 <20230113165919.580210-3-mcanal@igalia.com>
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
Cc: amd-gfx@lists.freedesktop.org,
 =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hm, unfortunately I think we need to keep the check in amdgpu for the
same reason as i915: amdgpu will pick a modifier if user-space didn't
supply one on GFX9+.

I wonder if that also applies to vmwgfx? Maybe that would be a reason
to have the check in framebuffer_init()? (Not sure!)
