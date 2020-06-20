Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992AF20304E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F012A6E563;
	Mon, 22 Jun 2020 07:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACED56E2F9;
 Sat, 20 Jun 2020 16:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1592669686;
 bh=GkxzUop8V8rXlGE6J5+lqYfRSh4yg12UHlm3n3ahwyA=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=a4rlFE8XGqBVbLrc2TKCv/EK1RI7adEXxpN8LsGUkf3KlPTUZ4cIoMpUaRn7xh28o
 EufulKaKRdD+xVXbuKCYfm3WjZwuhsYQaMVFJFMcMQnjctiFdyJwRoTm8WuZ8O+o0x
 PJoYALwx9Uk5i1T79TGZrj0Bj6p4NofVA5qr6Cv8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.139.185]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MkElZ-1j2rnA3nvl-00kiT8; Sat, 20
 Jun 2020 18:14:46 +0200
Subject: Re: [v2] drm/amdkfd: Fix memory leaks according to error branches
To: Julia Lawall <julia.lawall@inria.fr>, Bernard Zhao <bernard@vivo.com>,
 opensource.kernel@vivo.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <0e76e678-94b1-8f69-d52c-2b67608d5ef8@web.de>
 <alpine.DEB.2.22.394.2006201126130.2918@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <24b55845-6aac-fa4c-c65f-e479de1bbd6f@web.de>
Date: Sat, 20 Jun 2020 18:14:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2006201126130.2918@hadrien>
Content-Language: en-GB
X-Provags-ID: V03:K1:dddi+ST13hC+JmXVRlll4n8RIaaozevP2KyZmxxSr0Lc1Hhn+Zi
 9FO2dis//To4bxqww6Rlja6+NVXoZhhQt9O7GBijMse7rTvK4ldvI0fKH1RGXH3H/BbJuMn
 ax4MfwlhZzH87vLTFTHLnxvy1+EJ2Q6+GOuRM08O1Ot19skxZwoPH0i6gs5P5VExpxlAUrs
 E3hjstk2JbtmoQ24/OcOA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QU3a1UHBLwo=:87SR8wZ7bGgtI8yEYmPdRC
 WgUh77PdI5t0vyqiemJU0sCFxd7U8xoDj+4fSRBdLIaI1gzgAEXc631jim/bCx16q/ZKNROoB
 49YWmcOKM4D52lF3dwyZLuwnIYurYm9VdW8rb9rQSF4qxDDMV6XSpvJhto2y4w0BIuKQqqLV5
 i4gZqkS5YH4mj44u5eWOyw7WJ6Ooj8trdnyolbjiDear8NRwtg5JoM1RAVPVOXjrpbCJwXtl9
 UfGLiXnhAsGocdypDPsZ0yvVjM+wM+QOboBUvgDTOGCO3VYDX0+ubyO8mOfimX0QQVC1eoJv1
 MeqlUHleKyfWitRVnJLiA8r9Nq2uRhxy8qI3I/K2ECtGBfckfngaXBkZxoIknYOr5PtEsOKwh
 AJVmFQw1mknh2hl3rRcpHz5nf7D+OJ5oeQqAtrQghfUCu0z74YCuEmtbr15zurjd+B19ophZb
 zyyFo/iFTXABOyy6jG/9jVxN/X8BWJe6aXkiGAyTd/W723uP/3CeRAQgFx3mAHmg3c6of9U4h
 N0tnOGrMSU5y9fcL54HbumH7AFSTlQh5r9ok8j9ieuwgPe3nI8H2srNmoTYeo4ddvYBsRjaOL
 fcHcCuAhhJKXs5lMrlwUv1YgakjOcP330Z8G5u2SmWpn9nWuQiJuQGaVGCTmHEym7wWjVnl4f
 z9X0ShPbRpSIs1ko6xGTEBB/mXJW6yelMr9ZYIRvUc8mW3DDbVhU/Gcf+kLixibwLWPKJu0AK
 rzKbpmFmHkd78osYgdsV4fwMsHm62EVLi2EdLMiBgdSfxBvo7e6/y18ibb84MCP4QcFjeMjdg
 CxyPeUATrnvyKH2ChlgZw66FKBx9TKBPW4dS0bj4vyvlz2aQb7UqExWB7YJHRSobgB5i9C1T/
 f40/ndnQ8xLPoB2jtU5mfso0+iA8IMyH5GOCnXfvGu0GfLc+n74YJ0unQOSy7UyyCwdpqJhAh
 4SPJSEzmOK84MEGOvwIoNTsFturOFZ5UWjyA/MOziUACfZ05mlbD4fKNpLkQaQ7uiRQoU6jJc
 FA6bEJV2H2OxIH+fZ3iwvbHNwB5/nxR67v8oy3u16rP10lReib7Q/JhqbWPk5bV8NqTFuDfW/
 C0EXEmxbPNWjRLU6UeWaX+pnFoxLziwbhanvi1gBRJNnPip7GnhgnX+RyIdhnhIQEduGVRIV3
 tg7HINzV7/vWnqGN/1m068iwXcum0Bdeo3wU8jOTKEgI0l1Og25wXDOjX5S5nCa1PtmEBzwi6
 2DtcCxmq/Pe0oOqdn
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Felix_K=c3=bchling?= <Felix.Kuehling@amd.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> memleak is also not an English word.  Memory leak is only a few more
> characters, and doesn't require the reader to make the small extra effort
> to figure out what you mean.

Would you like to achieve similar adjustments at any more places?

How do you think about effects from a corresponding jargon?
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/msm/msm_submitqueue.c?id=177d3819633cd520e3f95df541a04644aab4c657

Regards,
Markus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
