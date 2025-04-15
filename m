Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7C1A89CEC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 13:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE9C10E0EC;
	Tue, 15 Apr 2025 11:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="srIJkOjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B0D10E0EC;
 Tue, 15 Apr 2025 11:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1744718106; x=1745322906; i=markus.elfring@web.de;
 bh=7vJwDbjhhUUleO+YsM2fphJAvcNc8PwwTfNeKp67nKU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=srIJkOjMJWaD7i/GUniCujRPiO5MLuTjxNVRTjC6MCcAC0NcrQ0kelACtuoCF4TR
 Ptgy8Fi5Xrj2htF3lo1v6P2XyhDg1rKvR+TQXq7+EJpatl4lmk68sJnrmzj7XVJji
 tPc3I4h8ZUOBAjkeRiKNSimiXxJ/d/5/z8llQSrtQl0zKB1mVRtt0DO/UlyH0kdZk
 5UD+eR47z43chlA7hiNgvc35dNc4u+jRjX7k7KSmpLNdtrC3u4hrb4pSqS9gQzh40
 A+5XHF4YxyjdK9qrvqfju2lTv8SMiRu7qdxHPwOZvowggd3QY1OQ8IS57NZr5ajfs
 zGRBcde5VWFnUcUgKQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.24]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MuFD7-1tAtvj2X9h-017YGo; Tue, 15
 Apr 2025 13:55:06 +0200
Message-ID: <777983bf-08d2-4ccd-aa92-4791c8f9195d@web.de>
Date: Tue, 15 Apr 2025 13:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Xinhui Pan <Xinhui.Pan@amd.com>
References: <20250415100813.3071-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] drm/amd/pm/powerplay/smumgr/fiji_smumgr: Add error
 check in fiji_populate_smc_boot_level()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250415100813.3071-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:j95cmp4iIHJldfBrtlJ3dqRgSUtrCjG/E336CB1WJIsSKZJCTSr
 QfSBc24kCx/pYxQqM4Nm0fduoBgsUwyJyYQKeXPm5LuEy604pfnbdARzdSzh43U6aih94mo
 A267dXnnWmXXgybTVGZXTwApcn5GAgtn1bTpyP/8pDG82/YAEewmRvqiTmm6ZVosHZ7EIRO
 d6C/NkUKTYYahRlDPNFig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ci3YOdjsLss=;IEKbIWfFHAoKltwaFh0/d4So4zt
 xUUcNirA8UGA4vkj1cLZ8a8+J6yARIThOsgVSOv0WsFaY6zDSmCxwPchfrT3CQtNckDq6zqin
 LZ+aGDXty6nUWvjCzLUoMNIgaB5NDChhfQVk0bT7KjxbxOi6FYWear1/fxrIKHC5Jj+ECKOVM
 PWR5w82031Eax+VY112aAEZhLDEd3O9Brw5aZHqCMoxp2MGxw7VYs0Sgy1Noqo64FOuIi8Ojb
 SbjRDYQatCad2t2KYAJcwE2zmg8/isGt4aH0BMPqCE/Jm0M4McfJDK0Vn0fMozAa1xinx97NS
 pPUk5iJsjh8p3E+dnlPaBjpFmBLHB4vokcLCBXNPHf0FZ9M/Rx3mo8O4P3bneJNs1FYMyVqe7
 aD1bMBqg57LiIqVFo8PqTIQXBtBQbwQz9uOh2HghVecw4NUi5+pzqrbSida/ioxT7/nSLY3dT
 xJb6b83566fiz5V9Z5/rzW8V88YBGTbUofYPSoM24veseVEqaYIEFIBk4DXdRHJqNkv2K9DOC
 ucfxyFhnfwhV1qv1glXFWmzmK9uyy4WYBuM5N0Jha4DO6wYnSzfbHQQQ3DOn1Ym2tv5LgYXGw
 ORBBaMZbWGtXEO8ZNXlHf/QRKpiD6551ArvsStwsT3DfhhfLWbpweHIrA9pR4ItliRW6V2j7E
 HuMCkAFid+7/mTKKBtPfCM5P6Juv2cSH70+Tix0PAcfWGV15yfk0diXmYJQu4/d5nxm59LjM5
 232EY+OleqV9QDI+nrj1giiKbI4dHr7K5/zb49cuLKQY7q0ST1lUf7IfQzemo2pat6ItOCm5a
 ELNKYX4o20kVVk/tcDC1gzH80Y8mQTCZBNgdUxeK7cc3QJ7OWJbY7TFdLYNfbkSULuEvFoxnO
 wZt1nVOIuI473sllLkJTjo+Bk1a2V5UsXQXbUMBkBRqUoGDGlRF+VFWJjAJth6ISO8gjpUuTp
 I6MCiaj/mWrk8gWajQnVNKpYV3k1eLwO/daZatWBOs3m+pTRWuHq44rvWMM/mlHzHfpNopQIi
 sc3DEYfUhW5CduIM5Atfi6JDN1Sh3Oib8UotLjCOXASYmrtvUNi0Bg5SxA8X5sxYywCqfa27y
 qJu2goJ8NSc71QD29ldgYeR6cxr5BIC5oalos3AOEK9vOMvo/AzfFpqUvbyRFB5RqP7DPKN/u
 A1c71vNT31yfuUsEgbAtq5N+9W++oA3jVpid2QZgrLaQm5CTdIPqPBuog9Wpp4147WzZXufGL
 kgzJ3JE1fQt5h8+InF83UJYM7p0PfYIPo7CNwmP96YwwZ/R2mkKADoqYlfMWCXlH1DoAg/wwm
 Wf7bYfaPBMjJw7d9YjrUVkbSc5j1z4U7IFh4684A93Iw4khKxO4mFziWfyFtd8DaXYcGVThRr
 1DWBl7Jr6QAtin8S9Q/s69hnWOT5pPdCWq4kKJhpc+ttRsNjDTIfKUz6OQ4jRXVxaUTfyCTFo
 UuJm6av/ts38/D79SvmNQYfC8rj1RQAXOmEfStyhcHx5sqsYGNhK7M7F/dOW6Hcg16WNL4Q==
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

> The return value of fiji_populate_smc_boot_level() is needs to be checked.

                                                     should?


> An error handling is also needed to phm_find_boot_level() to reset the
> boot level when the function fails. A proper implementation can be found
> in tonga_populate_smc_boot_level().

Can you propose in a nicer way to complete the error handling?

Regards,
Markus
