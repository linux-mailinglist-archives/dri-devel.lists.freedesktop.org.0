Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94E891A46E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 13:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F36410EA7E;
	Thu, 27 Jun 2024 11:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="g8Z+sIiT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B5D10E216
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 11:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1719486010; x=1720090810; i=markus.elfring@web.de;
 bh=EhLckhKVfKE7w0R51LNF24lj0PYCDE9gcP8repqcmMY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=g8Z+sIiToVtcL+u4dUeHcXr4JkUU+qZNfOGDu1N74BmW5VxZKH+KPwC/jiNVoJOa
 CG3UJE1jpez6q73HN3ZzGMt7zq07MXfzugygex1hTq5DBk0cgTNhhKJf5EekIlPt2
 zMwKaTShgPhrwbyCys3e0fpzYNtq7fzALOX6U8aZ54iXuxqpo9Fm2xJlnM8LayXpH
 6DBnaHDZ/vMq9kgU+/M/ApBmDSO6VjzrBb36heQMN1RqxKkxoEKbXiquzfit7jbyR
 VoJVHdCN8P9JzHoVaL8w32WLHQ29OlZ1EJnWDLOFYv82Asb7BVq/WoKaIJxux25Hq
 ixDkjwqqDdJYTImUZA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M3m9J-1sN3qD29Wl-00GO5I; Thu, 27
 Jun 2024 13:00:10 +0200
Message-ID: <7b5c3831-6c6f-4518-b677-6e82f0ce7ad7@web.de>
Date: Thu, 27 Jun 2024 13:00:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make24@iscas.ac.cn>, dri-devel@lists.freedesktop.org,
 Alan Cox <alan@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@gmail.com>
References: <20240627025033.2981966-1-make24@iscas.ac.cn>
Subject: Re: [PATCH v2] drm/gma500: fix null pointer dereference in
 psb_intel_lvds_get_modes
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240627025033.2981966-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3Vb+Jx2vooG5cOktMPc+G7oJTsGDmB4KURcwNspnXl6og+nSjX/
 jdhxJ1IxabSWJh1A4O7biEVTEAmc4MD9ankPs5NCn8vPXfTgBIytuKoDkULFyUMQRjhikx1
 D5UryBAY27XObBXXomIbrNKMezVVy1e3ZBcjy1Ze30zxHrZFkCb8b3t3cz/TB47ZXQ7cRKG
 UPT4hyHs5cp10hNaByDew==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WIWbjhk1C4A=;of0i6ck5xDlWRW/KZQCVN8MISca
 SsYH2GHpMQBKYsmZ0o661yQb/R67UoQup+VX6BOhpCjM4f9pEYyeAz7eHmv21e3wx39SnTzh2
 Z54gShKbJQMLDLrOFg0sCA2GiCYMZr68T2GYigSRQs6TKwdqSRJMZAmxtxqnXnCBsaH9v9nPg
 BnjZRaouBDi9Jw+/PjsZ/F099UUqodBCY3cM+9YXw/+5f9Cs3aoUNX/YXzerF74aDSjvUjhuZ
 g8++/SuM2r/5QVt63bduHpA6Odfgfh7xhw4hbguFkfL1yqaZlDtxBlIL/JnDWAJ2IVYtKdkXi
 AHi3RcnSDqUc1ldWzhj45UT+6gJPZ4IZhj2z72Ne8Wa8xsNkAiuZwk29i6GNugI4RpX2BWpAG
 faJhJrAYMLOAEen0RgjlzibinhcLhZng0XVrmD7Ht6rGZt1dbqoaUb0wM0TxsVGehRNfAYCLh
 yR8AB9MvemUJ5iBE9jxVI2kropgj1zl8YUt2Ne2ovaqpAZFVuQiGA5w363W+u6jfkn8CBpQMC
 nUVO0wH0TrXSF2dVaEIggAsJe82z5QUKAjUGp4muLMC/Ik2lYJzi8fXb+GBlwH/dvYTssmKUd
 rhFWr4nhoKrSwX6H32ACuAA4mptV/cIu2NHrpBwxDvOcfDkliIZ+Sjg/XjsCSJMf6qhF1s1vH
 cZku4TOeqMlNlS6ItO0tW581uUj9rfXB3ym/Qu9KfsJgMMzMlTLvmHQtu6vLv8l4knw2JgMxZ
 e0Bfc21cHyGv96VsYNx8JlZnIekmICy0ZZAlYKpILUMXp3M4v07tZODUA0InUVpT2UFMrRw3t
 vfp9wTHYasTMKyQLoe4otgP4GeooAua4CsI5Harw3He+4=
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

> In psb_intel_lvds_get_modes(), the return value of drm_mode_duplicate() =
is
> assigned to mode, which will lead to a possible NULL pointer dereference
> on failure of drm_mode_duplicate(). Add a check to avoid npd.

A) Can a wording approach (like the following) be a better change descript=
ion?

   A null pointer is stored in the local variable =E2=80=9Cmode=E2=80=9D a=
fter a call
   of the function =E2=80=9Cdrm_mode_duplicate=E2=80=9D failed. This point=
er was passed to
   a subsequent call of the function =E2=80=9Cdrm_mode_probed_add=E2=80=9D=
 where an undesirable
   dereference will be performed then.
   Thus add a corresponding return value check.


B) How do you think about to append parentheses to the function name
   in the summary phrase?


C) How do you think about to put similar results from static source code
   analyses into corresponding patch series?


Regards,
Markus
