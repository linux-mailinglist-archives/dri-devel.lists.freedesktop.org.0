Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EE4A56AD3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 15:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABDE10E141;
	Fri,  7 Mar 2025 14:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="Rk2JI14N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D856810E141
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 14:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1741358922; x=1741963722; i=markus.elfring@web.de;
 bh=53gg/aCTFTibjY5aJ4alNpQJDsk/0FoKqcakSxNP730=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Rk2JI14N4ARXCHpuTNyNOcInGRlDkRyGaOnvc0XIXeYUutcybCjAHABLG1wnNfQL
 E0OC5UbS4qsIGNhktZhmXoeEx+Rj72xBVVV5biYD7UGcnPWwGnbEy+cIEpPiwEY8Q
 Xodz7LO2kOD6E581tYK5/diCEoHmiUPXXACz+eniUXpob/rHZRB6LSDtrR4em4otj
 DHvyto3q+jXv/haoOKN4VlAgedztXJx3HGpJK3IXxDnYbd0yiQHutog9A9GfqHObn
 X9w/r421MIcII9vZKaJkV5o9w9NykVGYUR174njtFLopu5pgjOxmwCNUMkaRt8n1d
 mcWxNyu2oF7hNonkgA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.70]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MzTLI-1t4OGg00aO-00rs3h; Fri, 07
 Mar 2025 15:48:42 +0100
Message-ID: <c29a5d6e-335b-463e-a318-e8d78d176a9f@web.de>
Date: Fri, 7 Mar 2025 15:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, David Airlie <airlied@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Simona Vetter <simona@ffwll.ch>
References: <20250306042720.2296-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] drm/exynos/vidi: Remove redundant error handling in
 vidi_get_modes()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250306042720.2296-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EcZzEqOUckJHTaTmMgt0SzYVfd5Np76gwmwaGPdRegKbmAQG2ie
 RCevNQmV/4Ln5FLn/62gjIXAXTwQiqbh+/CATnHMYczi6MEkvoN2BjaOvrQfw+HYKHhR5Bx
 mzIvsJgE1sKOnRViNKz2N+UpbCZJft0aRieW7CKidbc7mLkcQbyX+KULpqBHO9Kegi+W8x5
 R1QalZUFSCke95V9fRkHg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BhmL7JB8mZw=;0Gs9w1jIrIJFlQZ4oQBwgNG9PdQ
 nXplFJ+a+QA1RHvsThhDSdcjEM6cRz//u9FqvZxcsmEBbR773A8sqENDuyC31AAE+qnnv+dM1
 iHBdO9C+ZSifqcBqSc2q5HZoTkkvWvGup0113DCSPJfZPERdC3223HQkp+iG0GOLMILqGPKcw
 niOa21dCv/jZS3BW/bAfHnpXtsKxgfUKScVf/seSgmtGPRoEk25fzMUrGjAEFStd9rXnHK6rc
 HCNpN+VULvHVxPbYV2GqqAJENiWcPEOiaSb+LdZzppnTd6/8HW9Gg7PIZFLFWcPAvz2hp2JhI
 xnV9t/wmBN8zqmCUkvu1WqOaM56US9q6VhRJubmvtugstNNrH/qUP8JVRQvmASuFzjsdQ8djo
 gdvQjyB11O/cVHQKIKOt8kPvEB0bRdvGRdZP1C2DIln6PxsQOVsPhd9gkLu5lL/Grds458w7b
 KYSUYAwfbNAgXSGKh7/NE9DTLh/50oMB/JIReQM9UDyyQ62IxnSuF4zkxqYLH8JzjByh9blAR
 l/sWdgXXKczn48QXbrGJiN2orUU8kwFaEWXW5ojieXNgY8QaYRSf18bigyo+4a75sF8S6ntua
 fPAk+gFh2I0XTgqkKcARKzBvsby9t7IYc9UuVW2rrmOOVPaUHaIiN3fq3LgEj65+iWO3pGGEN
 ZgaAgZoHthKpXVnNG0hHAde92foYQV1SQhViNw0sjD3OyyYqTSNau5sjNuOJptKEroDWWzHVw
 CAVxO0IsEnMN2aRwDSNQ8QO/fd2qp2RkE4/YC//NzSNh+N8eX+NBNBK2vb2qfoC34OzZCoE4O
 /o4Xy3iPiQ51JAb8lVeadSMR7aPbro9HOWvHzbPy/tHkVEd826PFhyTTO1GLNLXchFNkURLMi
 RE1lxllCOUI+2xgyJxQn0grSkFgWCfZ7lJ6H2sf/dOGUjb1gzmUmPdhnn02h5z5RDIC3yLW+a
 L07FuFRq0El4llj695N14l2b8OpLs1fKpO1qh2sThOXovc5dyl3pxcXcjQYTZwu/9sLtS1P2D
 yl2v+e8F3S7npQJXYV5aDzAwEJ5wnCtVdcjDMXJl4uItgWrmvumM3DwxU8jq8PO4Eln4DdjTU
 WLsSDnYoCewDHiu6WutEun9F6faMuYA+boXsa8ZMMJNAQMcdSe/Xy7eWyOLIZrRIYRDaZ+FSo
 VGPuvzCbdvH74SnrGbHKU/8gdPfrhy4wc7aYCllaOKC5BfEguPh9v085UDotW1Knlx5qMUa6Q
 ZL7cESsZmIWCdP9uPrTX9DCROhJ7SPXS31VSNGoOlD3NOkJ+4tyBj/uykw8/0rJrGISorqFzj
 wHir6t6hzukRwaNVGNeAUqn+shSuKB+km2H1t+Lp+gsNm2aN6bkSwWv9I5sY1Ru2R/vW39YSu
 ZQDHxb2D8DrJvQfi+iXsotjngUP4ea81CQRft+Aw2iBfHBaQE4LGZ8KxmSAMFBFIHeoeb8eBr
 KFtS6Kg==
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

=E2=80=A6
> drm_edid_alloc() fails, the function will immediately return 0,
=E2=80=A6

                   failed?


=E2=80=A6
> the event of failure in these two functions, it is still necessary
> to call the subsequent drm_edid_connector_update() function with
=E2=80=A6

You may occasionally put more than 66 characters into text lines
of such a change description.


>                                    =E2=80=A6 To maintain the integrity o=
f
> the operation, redundant error handling needs to be removed.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.14-rc5#n145

Regards,
Markus
