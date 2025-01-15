Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B40A11B5B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 08:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E7010E501;
	Wed, 15 Jan 2025 07:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="LqTxqpYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC7610E4FD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 07:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1736927817; x=1737187017;
 bh=dna1hELyton754vR7XwkrxCfNyJJW6bkChVCmzi9QEc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=LqTxqpYZk/w/xyanth4lARSk2/mjeZjH/vtwWJL69ggVgsSbPSlcgcvFi8Rg1rqF6
 S7oGa+BgIHmjN8ZIBhBeSH7ynhVHctlbA3mK1N9HkKKMO+CJnybr71Fpa4fZ0ONHFU
 Ac0laPzj62P4RNadmkbw6mE1qi6xDw0vyDqw7yOvYjGDQ3JcbF3SbN/7TOGK7lUmoh
 R6h30lTyq/XoPh3a7YXMh+cmpGVU2KRuXjlNIKaHxpd6xaSZcJDOXymr9P8RA/MSJr
 mJO5HHMhHK25SH11kc0o6Ep8aaGzk2G0IdD3aaW6PDpAgHosj+Tsc2EmiY8EapUZgZ
 /3FYA0XGzoYTw==
Date: Wed, 15 Jan 2025 07:56:52 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 23/45] drm/amd/display: Ignore deprecated props when
 plane_color_pipeline set
Message-ID: <jvy2Hqze-awB760FG1skr9viS1MfGpXrAOrJiwgHdtEQ_4eB4cLVMCzL-2zax_-kG8ZtLWrVxQ3vscFfN2jHU09AvlBPhN7ax_u7hTGKTyw=@emersion.fr>
In-Reply-To: <20241220043410.416867-24-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-24-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: fa6aa2ab867ecd8a3c38a4f37e6fffd4b8bb7d00
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Is this "ignore" something we could do at the core DRM level, instead
of doing it in all drivers? e.g. by silently ignoring user-space requests
to set the property?

It sounds like this codepath still resets the colorspace to sRGB, which
is later overwritten by colorops pulled in the atomic state anyways.
