Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C644CC4BAB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 18:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4848110E228;
	Tue, 16 Dec 2025 17:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="OeFCShZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C8910E228
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 17:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1765906340; x=1766511140; i=markus.elfring@web.de;
 bh=uF74Wvfnts/GIwd00ySDCJ4VjQhdlmsrQYR+m7UjrHg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OeFCShZNXHaT1pywFUIdA4almWlgJ3dwO5uoHsJ3wkKQ+yYtM1BNGQmqNDrlXA02
 bkk5fzjUw+2tGT8menuy/pNL3oT8ZMoVG1Lw30xGuPeT+aFOFg8n1csJkhUHy4lNZ
 DbpFzKkvrKSAkT3syhkqdxrVErj25fj2on4uXi9GhRtSh5BJdWP1Hbe9+u5exDwbP
 bIV982najwW0hnHLk0K5NtE5lK08fNmhyuIm3wYywqmCUNX2Ezplkox4TsWrXb59I
 6GIaGbY0+Gu1ssi0Fv6lawHXsJFBtQ+hqF1KfcRNKjkGUtsdg1DCjI/FxnwCDLJp6
 yOAx5ZNc3X+WMqDOjw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.206]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N1u6d-1vxrG13Nm5-014mHH; Tue, 16
 Dec 2025 18:32:20 +0100
Message-ID: <ef60303c-bdb8-4084-bc70-a762027cd528@web.de>
Date: Tue, 16 Dec 2025 18:32:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] drm/panthor: Fix NULL pointer dereference on
 panthor_fw_unplug
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Aishwarya TCV
 <aishwarya.tcv@arm.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 David Airlie <airlied@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, nd@arm.com
References: <20251215203312.1084182-1-karunika.choo@arm.com>
Content-Language: en-GB, de-DE
In-Reply-To: <20251215203312.1084182-1-karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tHDZ07OeqFdwESXWJTT8KZ9p8PWoH8qor0kNFwff+WGjxu4cl14
 Vn+2mTNmkyFRGw7gdwFWxtXEGRrkrVIMSCX1ftBRpL/Uy64oC3RKbwHUlj8Cd/EurwQ48sy
 LVPGGzvosO5Z3sgRx/jaTYXSJ9whVwlj7B1f/kx8eL2m01grN1EjnOlY/EkXrAqIqAEkhpO
 9KSEvmxD82ruFEN2QruZg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x3ipKcr4F1I=;cN/EqB186aEi+X9RuDrBGzJaa8R
 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
 hcIJD1rQ3kvcbAatYP43oXfp1JUr1MRuoSndEp
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

> This patch removes the =E2=80=A6

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc1#n94

Regards,
Markus
