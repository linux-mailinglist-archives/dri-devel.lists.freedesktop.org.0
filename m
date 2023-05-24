Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6CC70F916
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 16:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603E610E102;
	Wed, 24 May 2023 14:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F11410E102
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 14:49:44 +0000 (UTC)
Date: Wed, 24 May 2023 14:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1684939780; x=1685198980;
 bh=UMGKqW/LwbT3aOvig7BA7g7y0JawpMyWnU8/VkTGCYk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=vGpxsSNLy3XCwfOZeeuNA9ng5xkEz2ezCBZzFF2nH5qQd9g0ieW88tXfhrS5a39VL
 /v4iiEAPpoxLiAEcQPgX9pXHd0NNie7tqRdpAVtZFfakiRtaIeMAkQAddGZDAmHwp0
 Cp596qEvZt8ZAlAvOzdT3h0EBV7aPDXIooTEAmv9pbVZJu4TNvo5Vvgwszwvr+d+JD
 g1K5ZiJTwWiRl1xKorCRlYSSX2lCngqSsDvzCjHDdD9udPE+ScpjqZd9Mvob8BVpBv
 f5agR+U80bRBQHtj8WYSQep9wzYcpOG93uLFYggfT4x9zzkxwCIC9cmj2JnhNcUBZS
 1dr45ln8xS2ug==
To: Alan Liu <HaoPing.Liu@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/7] Secure display with new CRTC properties
Message-ID: <sNSf9ou1krQ0UJcBpR8Lr5KKfdOBllnwV5x6jNoCT8h9T-zSA2x0ouGg_RMKDACyrgm_MXIvh-kgpCJ4taEa1V3OyfWYekbSDPMX3KswZGw=@emersion.fr>
In-Reply-To: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
References: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
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
Cc: lili.gong@amd.com, dri-devel@lists.freedesktop.org, wayne.lin@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, May 16th, 2023 at 07:39, Alan Liu <HaoPing.Liu@amd.com> wrote:

> To address this problem, since modern display control hardware is able to
> calculate the CRC checksum of the display content, we are thinking of a
> feature to let userspace specify a region of interest (ROI) on display, a=
nd
> we can utilize the hardware to calculate the CRC checksum as frames scann=
ed
> out, and finally, provide the checksum for userspace for validation purpo=
se.
> In this case, since the icons themselves are often fixed over static
> backgrounds, the CRC of the ROI pixels can be known in advance. So one of=
 the
> usage of ROI and corresponding CRC result is that as users know the CRC
> checksum of the tell-tales in advance, at runtime they can retrieve the C=
RC
> value from kernel for validation as frames are scanned out.
>=20
> We implement this feature and call it secure display.

I's strongly advise *not* using the word "secure" here. "Secure" is over-lo=
aded
with so many different meanings, as a result it's super-unclear what a KMS
property name "SECURE_FOO" would do. As an example, some people use "secure=
" to
refer to Digital Restrictions Management. Something like "CHECKSUM_REGION"
would much better describe the feature you want to implement IMHO.

Also, please note that IGT already extracts CRCs for testing purposes. Mayb=
e
there's an opportunity to use the same uAPI here.
