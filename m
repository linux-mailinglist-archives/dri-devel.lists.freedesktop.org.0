Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E87854614B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D0811B1AC;
	Fri, 10 Jun 2022 09:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDDB11B190;
 Fri, 10 Jun 2022 09:15:40 +0000 (UTC)
Date: Fri, 10 Jun 2022 09:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654852538; x=1655111738;
 bh=r6hH9EBBXf3L9EyVUftnTYTmL4W/h4rjEK1WBLwuK7g=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=pAT+5R0T83+QzwUMUF+Pn/szunTsCVTIdIc8VfKmjOMYQr94oigi8F2prDH1dIJZO
 ztdKzutLOURWOIDokoBkc6gXcuUm/S/vWdzvHcYEtNkaZqjF6orRohjsJQnAfrzydE
 gqYD0M43+NMtNMhKoA+ieaU4EQTqum3+Ialcl6AA0bYrR+ATJMCVsD4VL9kBy3CJCB
 IeHlH7iZ23z88CswdaHywBeT0k//rCHzaoH0xHTWFAjJOOHwFAUxMzIqSBQ1zMNLrQ
 BRbAfzpfrvdeCdCN1JaQwjmi7BVSpM2vwYQs2ZDcka4OECGPOhFnT4XRBxnkWzSYYm
 9xEkkYEfQRwKQ==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <lcIVipq8mkBAPioQAVQmwsM_Gwo0e9fd2334yGSvIW6uEIEElwUrTe-x9J9h29TB1H3NY3liNCohaXDyjslDFIqxPZNSPbSPJ3vctA2jEAk=@emersion.fr>
In-Reply-To: <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 mombasawalam@vmware.com, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, krastevm@vmware.com,
 Pekka Paalanen <ppaalanen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, June 10th, 2022 at 10:41, Daniel Vetter <daniel@ffwll.ch> wrote:

> Anything I've missed? Or got completely wrong?

This plan looks good to me.

As Pekka mentionned, I'd also like to have a conversation of how far we wan=
t to
push virtualized driver features. I think KMS support is a good feature to =
have
to spin up a VM and have all of the basics working. However I don't think i=
t's
a good idea to try to plumb an ever-growing list of fancy features
(seamless integration of guest windows into the host, HiDPI, multi-monitor,
etc) into KMS. You'd just end up re-inventing Wayland or RDP on top of KMS.
Instead of re-inventing these, just use RDP or waypipe or X11 forwarding
directly.

So I think we need to draw a line somewhere, and decide e.g. that virtualiz=
ed
cursors are fine to add in KMS, but HiDPI is not.
