Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8493678AEB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 23:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CDC10E5B1;
	Mon, 23 Jan 2023 22:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878EF10E5B1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 22:43:43 +0000 (UTC)
Date: Mon, 23 Jan 2023 22:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1674513820; x=1674773020;
 bh=T32LL4EZWJQiTlXZRxo3uLZWpZ3nMl2Yd6h6TykQanE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=oGsustv/aFX0neTu+taywujaK+r0UzyNyTXL1EH0SenQ9kbK8TQbkWncZWWNbWd0w
 0q2DVVDBF1KDD5SXA3GDEPict5czz5ZSzTKXQ1LXI+t0+pK8VNYty5qzhg79V0FI+4
 zFyZ2M8YIsGNCxhUfemogRHhg8EtYhLrVL1sr+m8AhfYtio31JBZamad1RG0vsrRoo
 hVHoa7oegg7VGikVDQ+Xc9/uOhMywPVOPKsSroRSKR/Fj9NxkEpnC12Zn8JiPt3rkL
 Y/y/UmBORXdLag6rH5z4E3p6b+GIiW1KIk7Yv4FNdsIpaQRrpfNOrhpjZqTqJKiQuP
 HDk1Yk8Pk6Cpg==
To: Sebastian Wick <sebastian.wick@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [ANNOUNCE] pixfmtdb
Message-ID: <B55u__QnPBXyk6SrEEYETx1ugeGjZHT9Fva6b9fpZazX-v7nTFJqnKH9Y7OebmOTQ51zffSYMnrfnfYutoWSLzpt-bWk2K8V69Ru7327VlM=@emersion.fr>
In-Reply-To: <CA+hFU4z-3iotNkUVr=aHrQ9GFNnGLrvL2B1isnx2x2UnnO+qXA@mail.gmail.com>
References: <nn8qWh16AviRPuLVOg_I-Nn747ncRsuJsZU_VZHvKhxp2hoFBCFsAfezBDkiwM-yn-CXAW_Vos121VKtETNsSZU3EuCuVzcgHBnnWNnww-g=@emersion.fr>
 <Y86skCbxY5kZglo8@pendragon.ideasonboard.com>
 <CA+hFU4z-3iotNkUVr=aHrQ9GFNnGLrvL2B1isnx2x2UnnO+qXA@mail.gmail.com>
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
Cc: wayland-devel <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, January 23rd, 2023 at 21:25, Sebastian Wick <sebastian.wick@redh=
at.com> wrote:

> Why is the TF defined for GL formats and both the primaries and TF for
> Vulkan formats? The only exception here should be sRGB formats. Where
> did you get the information from?

This is what upstream dfdutils does [1]. Can you explain why you think
it should be undefined instead of linear?

I was wondering what to do for DRM formats regarding these. I think it
would be worthwhile to do like Vulkan: set TF =3D linear, primaries =3D
BT.709, pre-multiplied alpha =3D yes. These are the things KMS assume
when there is no override (ie, when there is no KMS property saying
otherwise).

[1]: https://github.com/KhronosGroup/dfdutils/blob/5cd41cbdf63e80b00c085c69=
06a1152709e4c0f2/createdfd.c#L47
