Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AECCA72B5
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 11:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C8910EAB9;
	Fri,  5 Dec 2025 10:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="akJniKg7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE46510EAB2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1764930749; x=1765535549; i=deller@gmx.de;
 bh=6bfDO+uLvOSGQXGW3TkYOKRK1XJyCw2LRBDcIhSJU7Q=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=akJniKg7IVtZl11BMF42VGqt0jwUHj+0tj3egmVGCaSoIyd6rbJxTDpwvJodlBuW
 BxP1SlBE+kuDUYiF6CLTyhuZ0OmhBCsA1r8dTCFtHwYrXovnRcrou4cgSizt/4Cs0
 WKdxHl6i8YMDgTj/vF5iaYyWS2fszPK+Vq5ZviQ+/JcwT41XXSmJjubXqQ0sOr2vB
 95hTtkStlnIiw4JCt06LJCKmA+SmNOQLEY2K2nooU3Py2J5xJBK5dx4ExRVUekLl5
 FGu/lDkN0YkiwkrHvNpFPVtKasAFTqjwE94CL8UlVbVy3wiKletNFFECSOOmYnQNn
 b05uCoeagsWc9qyzgA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.145]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrhQC-1voNBY3iGy-00epBS; Fri, 05
 Dec 2025 11:32:28 +0100
Message-ID: <bf69bf02-35f1-493f-84d7-957f25b38b4c@gmx.de>
Date: Fri, 5 Dec 2025 11:32:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: ssd1307fb: fix potential page leak in
 ssd1307fb_probe()
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: niederp@physik.uni-kl.de, tomi.valkeinen@ti.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251203035546.26849-1-nihaal@cse.iitm.ac.in>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251203035546.26849-1-nihaal@cse.iitm.ac.in>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KaBoVDh5Xn0iqqpDH+qYeo9tlflrsYUMIPDSIUEWD3So5NGBDdM
 BcyPfyiWbF+S0h3IgTQtnzoT954XV4pOXs4rK9HoKuNuHF33xD13y24QQMw+6f+nZ7YRCdg
 qqQil3y8cIfLsmGb6thrvVTr7fmko7eXolODY750Vwcxj5oFSdI1pwIUH1i2AzywEwCOAtB
 24Ttb7haH1ZkvqBfkQBuQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OOLv9bb5hVM=;Ncml2NB56DeYEv8WBSPLguDBz0E
 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
 DrnkOELhyiwH1p+8D1D25h+xrE4znaz1LOedNQ
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

On 12/3/25 04:55, Abdun Nihaal wrote:
> The page allocated for vmem using __get_free_pages() is not freed on the
> error paths after it. Fix that by adding a corresponding __free_pages()
> call to the error path.
>=20
> Fixes: facd94bc458a ("fbdev: ssd1307fb: Allocate page aligned video memo=
ry.")
> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
> ---
> Compile tested only. Not tested on hardware.
>=20
> v1->v2:
> - Fix incorrect call to __free_pages with uninitialized values as
>    pointed out by Helge Deller. Now, the patch uses vmem and vmem_size
>    which hold valid values at the goto site.
>=20
>    Thanks for catching. I'm sorry I overlooked this in v1.
>=20
> v1 link: https://lore.kernel.org/all/20251202191225.111661-1-nihaal@cse.=
iitm.ac.in/
>=20
>   drivers/video/fbdev/ssd1307fb.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
applied.

Thanks!
Helge
