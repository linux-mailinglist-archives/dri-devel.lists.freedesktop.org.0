Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A84665603A8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 16:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC85910E30B;
	Wed, 29 Jun 2022 14:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C60310E30B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 14:54:01 +0000 (UTC)
Date: Wed, 29 Jun 2022 14:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1656514439; x=1656773639;
 bh=jgx5qL+qt7rskFGOjzbeoMeHSUpyUNBp4rUtF20noHY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=RvNY50jFfbWs6i3uWd6/n0DzDoh2xDnOYu0beLZt6sSTpsrB8MWCVVUgJTJom3Uwl
 WZ7ChuCxhpQkJE7GZc7HXyRnMAFb79ayGeHojQ06SA6mjh/lHqBKxQIVTskjkus9O0
 nCgyQ1erYSfQy6UbK0XNLy2X6BVi5XBJ1gBCxO8Qw8oYnkCKjY7WVcuj+g804g7Twq
 kERswDzm7RZkCejmB7BhqCqq2QXFwnEuwWw3BVA6iWGbbYpYQ0l6mf7NwPKLagYmoR
 qL+oHWowC28FhXSArbHOnULpcuaeTAGnQZLFb5mHrwM9rvLCCihxdaqgX8tN99TWYp
 2XSKslO0Pmgng==
To: Dennis Tsiang <dennis.tsiang@arm.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/1] [RFC] drm/fourcc: Add new unsigned
 R16_UINT/RG1616_UINT formats
Message-ID: <o1qcCo8e19pmmNe-YJbPkmu4SBrOQ_E3u7eqdrcXUzdBccLtFswL_ARTpbrX9C10tippuy5ieXAsqdf7H47JuT7Hqa1NlizAPqVuRM0kRt4=@emersion.fr>
In-Reply-To: <05513f59-0bd9-77cd-36d4-41027bc339be@arm.com>
References: <AS8PR08MB81117652E417826E741154B8F8B99@AS8PR08MB8111.eurprd08.prod.outlook.com>
 <20220627175026.6a5dd239@eldfell>
 <05513f59-0bd9-77cd-36d4-41027bc339be@arm.com>
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
Cc: Normunds Rieksts <Normunds.Rieksts@arm.com>, airlied@linux.ie,
 Liviu Dudau <Liviu.Dudau@arm.com>, linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 david.harvey-macaulay@arm.com, Pekka Paalanen <ppaalanen@gmail.com>,
 Lisa Wu <lisa.wu@arm.com>, tzimmermann@suse.de, nd <nd@arm.com>,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, June 29th, 2022 at 16:46, Dennis Tsiang <dennis.tsiang@arm.co=
m> wrote:

> Thanks for your comments. This is not intended to be used for KMS, where
> indeed there would be no difference. This proposal is for other Graphics
> APIs such as Vulkan, which requires the application to be explicit
> upfront about how they will interpret the data, whether that be UNORM,
> UINT .etc. We want to be able to import dma_bufs which create a VkImage
> with a "_UINT" VkFormat. However there is currently no explicit mapping
> between the DRM fourccs + modifiers combos to "_UINT" VkFormats. One
> solution is to encode that into the fourccs, which is what this RFC is
> proposing.

As a general comment, I don't think it's reasonable to encode all of the
VkFormat information inside DRM FourCC. For instance, VkFormat has SRGB/UNO=
RM
variants which describe whether pixel values are electrical or optical
(IOW, EOTF-encoded or not). Moreover, other APIs may encode different
information in their format enums.
