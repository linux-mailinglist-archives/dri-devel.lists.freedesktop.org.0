Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FF347BE39
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 11:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4ED10FC1C;
	Tue, 21 Dec 2021 10:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540F210FC19
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 10:39:39 +0000 (UTC)
Date: Tue, 21 Dec 2021 10:39:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1640083177;
 bh=hPRELDBRRxQ+cyI0/AOFM+F6eiRHj96W1420vRye73Y=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=uFr8Orra0Ypm//GJVgoue4hVc9jVAaOnvqnnPkJ55rVCVgBHmCUuBctPubEruiJql
 0FWTcs9TVmwfVHOWvcBDgQv/QuZcixe7jcVnvLUdkrmRNzkNrj9jStSD6+ULP8Wcty
 5OxqcGqufMOSKvWXiLsjasCiMziIWQv8co+CVqz2NZxHK8qY1DRn44z06y4wKjV4HX
 ooQgMAPzEyVdXeQ1VLNiy7aEvvwZunZEyTQdm8I94jvf/UscKWsfcE5knqz/1kDIZL
 +dWqCJs00R3RExBDMkQP72U7aSjkbLf3GDIqkr4TJ6c7uCEILLWi/O7o8Ka0/o10Zm
 +KDnlxAXVsQKQ==
To: =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 2/2] drm/vkms: set plane modifiers
Message-ID: <t1g_xNE6hgj1nTQfx2UWob1wbsCAxElBvWRwNSY_EzmlEe_9WWpq8-vQKyJPK6wZY8q8BqHl-KoGwS5V91VgN8lGIl3PJt7s2fkdsRd3y70=@emersion.fr>
In-Reply-To: <20211216170140.15803-2-jose.exposito89@gmail.com>
References: <20211216170140.15803-1-jose.exposito89@gmail.com>
 <20211216170140.15803-2-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, cphealy@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Overall looks good, but it is a bit repetitive to copy & paste this in all
drivers. It'd be nice to provide a core helper to do this, and then drivers
can just set format_mod_supported to the helper if they don't have more
involved logic. Thoughts?

See drm_plane_check_pixel_format, where the logic is already implemented.

Alternatively=E2=80=A6 We can just support a missing format_mod_supported i=
n
create_in_format_blob. This sounds like this was the original intention of
db1689aa61bd ("drm: Create a format/modifier blob") and
drm_plane_check_pixel_format.
