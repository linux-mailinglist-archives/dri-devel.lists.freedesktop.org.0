Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED3CA49DD8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 16:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033AB10E00A;
	Fri, 28 Feb 2025 15:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="SbnsfFdh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D49110E00A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 15:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1740757555; x=1741362355; i=markus.elfring@web.de;
 bh=GcdKCf558++2vu5m7gIvfuqBTLz7S1RpSdIWX3ae9fw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
 Subject:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=SbnsfFdhW5jTuCxG/+o+fQpa8DZjfYpCvwKFf3/cO5On9c6K96EB6TeYFh1D8ROa
 QCHBJfjOiXycNzVdwXWTC4n4WvT/HeSj2Pb/RK3d6wmIXnO9rsc/psktkbenByghN
 shDn+jQAQQY728s8A1/W2wa/GNGeC0XwkVqam/Z6zUXaQfFgE+BZ+dAdLypdGTNVk
 0hzHYLQUxJlB/+cSXNuOFckS28hBKc5q3Uzm+585XLrOR5CFuMf/akzRl4JC49m7M
 MHHWbhwrpHM92Gybxtk5YlnSHgqRlyy0QmRFtLgEDxQvy+/n/JK6OKt4vbceLhUrQ
 UmdRpciY6+OTfTxLTA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.27]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MS17h-1thfiL4BYZ-00Umnj; Fri, 28
 Feb 2025 16:45:55 +0100
Message-ID: <9574279b-6e02-467c-8e0f-28a037e061d9@web.de>
Date: Fri, 28 Feb 2025 16:45:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Boyuan Zhang
 <boyuan.zhang@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>,
 Ma Jun <Jun.Ma2@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Qasim Ijaz <qasdev00@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/amdgpu: Simplify maximum determination in
 si_calc_upll_dividers()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6tzxbNamT2aPgHgoiVfifWqE5cSnMfgN/z4TiYhCFMyrRahLu1+
 q1i3Zv9l20qaiEfl5hKVEsg41xdcfWn2gpa1qMuyaE9kc8GlSzbmTnWeLflPgmUBNei33vn
 YUb0xv7PyLuJlxYeIcRKtOi2iRIgPxqAtCgCxCM3c+mRJmAr+W/Hf4nNuA1hv97DM9t6a0o
 eFHJegx6AhnsXQ9OilIhA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZdKYDLN+kv4=;ZFxF5BPUHWUwNdqiiACgOJWBYyG
 gO8sor5zJIKViHfqrneKHESVNSNV+y9z+yvkJO00DpYDWblKdC+pxcZGXnZT1TKL/pwyuLLwW
 YK5XPDuncIEICBU+5fzYE868aYHs80ctGTl8Kkk+dhKecH8q0GWHR3+ICJAh9N33SskzzTN6M
 xt09JDJiITzlZId52nz3OuaVoP3kZXWNuTOAZlNEYGC0p8b169UcJZdEDn+ru6JUANK8v2YxR
 MVRKaeDUVWQlZ+aXFhVTopd43MwGw+xWYpJI2lYW2QwDLSBvmcGpMhv/qcIsFFl9v8r/uLDXr
 2coqzl2zcIp3A7qIrPxZYZQmixfBm2Xd8yKQkZj0bHwudlaYxUDaB4gaaV9FtXS2+1V2gplTM
 KMola5cy2v5UWOI1GDMROwjMJ76pxux8ZfVPArjVL4gopNgDFVSDy8XuB/Zzv8JcM3XU6Kf0p
 lIIOEaS71t+fXlio/n8wc+JyD9iQq4jtKFwn4+UqSDiWO+0kZsQG7e4WGEpIhxGZODC0ut7Gu
 Qvqd1TaivBx5YOYmKWfwSykOlmQ7q1zqQupZ+89O2k8i3Zu6LdlzI3PL2EqxfwVyOjT7XEe88
 F7VaoR6kvJhZUG0V/3XEtDl1V7hpyi5ec3wGu3LjsgJopsBhSDs5x91sFbyyte9tdybmGYRI2
 f7dfp9PiDDmyWfNNGdXVnVFeT0gaVg0IytJlP9GnUj398lOXOUx0OXNJt3eJrLU9APHkGWJXM
 SXG/eD+9AWF9eb7hTsc7ODusPXPBOHuuBU5RVRcnwPNNhBsaAnLQUBfTdR4hzahVHaj6ePVlF
 kmRkBKea9IT1Tl6kdcmlDL0tvu0kyetzgqP+VH6cS0NZ++KVviVI63QDJnAZ7MLct1hl+yMSu
 4RoB6UA5AvdoBoNPLQhFlv7c3ngtSG8k7k+RteS93gjCzvKRTWUeomQq+B3Bw35n1WSBoMvRJ
 7vkYth4Zq2MHTu33iNiFaWLmE81eU5wCayR2vU8w2fM5YRqjDRxQX3PxLneIFLfd+sC84FOxD
 Hqr1NNx4sbH5hyRuz1qrycb9QIHrIrWl5utpFrzh8WbwMX1Awe2U5Ys5a3qHZK7ZHMhxuXlV9
 MAhWqlwsag77eCbtenV6oAQnf+0n+68JNB6mJOiWfYmqUDEfRVyOjqqJZp4j8NybXzmwjFblD
 rUgyw+5Jhr5Tatw9CmuJBpV6ycny3yeKI8oJlZfTBIY+V326v0W1vXcx/6miFrZyiW9ahB35s
 /e8slKIH6e7wv0FEYALKM1/oR9qGxAR25hgsWzXdq5VRdGXdWkefupd9sLPWxnoYkS0ABXW/i
 z0ngooFx+a31S3uZNW6Dy94psh5Zq67hSkoPnKvWmdJuzGNe9sEoAIZs+W7zk5IpbpR/KVSmU
 V4zyg9DunJszsYTgas116Htq+K7dYiGYOg2cPMPRTbT5/xOxZJRphQwtraxiVjxx8jqVSSzrT
 kGKrFMA==
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Feb 2025 16:37:00 +0100

Replace nested max() calls by single max3() call in this
function implementation.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/amd/amdgpu/si.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/=
si.c
index 026e8376e2c0..2a255fb15768 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -1726,7 +1726,7 @@ static int si_calc_upll_dividers(struct amdgpu_devic=
e *adev,
 	unsigned optimal_score =3D ~0;

 	/* Loop through vco from low to high */
-	vco_min =3D max(max(vco_min, vclk), dclk);
+	vco_min =3D max3(vco_min, vclk, dclk);
 	for (vco_freq =3D vco_min; vco_freq <=3D vco_max; vco_freq +=3D 100) {
 		uint64_t fb_div =3D (uint64_t)vco_freq * fb_factor;
 		unsigned vclk_div, dclk_div, score;
=2D-
2.48.1

