Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50534A44243
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6B310E192;
	Tue, 25 Feb 2025 14:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="K5+bAzWv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B5D10E192
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1740493041; x=1741097841; i=markus.elfring@web.de;
 bh=3PiIP1hxD1m9jYMgoVMW46TApIDu6OVW3nV0YlKWXjk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=K5+bAzWvbJIt2/LVkJyhAchWK0YioCBbAhlBP1CIId69Dt7dcr0Xx9mCJo/FZO2F
 MGaWN/QWRJ2rc74NfcVQEZSOBHD5w3hVXS5MA08WdJjL0UTpfXh+N5Q9/e7s7quGK
 T/qMTyz8+aEEqq+xiDWnx4h3WtMXLw04nSpNvFfBvfiB60eA5V75lLz0ltceYwLGE
 BDnKWho1fRFDbmjm0Fl8faxVY52tCbQI7LMNhBVwM7IIpxq8jT2L9CvjLL8En9tQs
 /SF9yJ2aWVjzzBJpXNSF8tdz3TcjB4mB8QTJ8j86hxc4vh45K5iFDFHrWOeo5Ihyc
 bo+lIlSXNiDmRqL+Dw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.36]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MqIB7-1t0gss0JxT-00gmDH; Tue, 25
 Feb 2025 15:17:21 +0100
Message-ID: <2fabe78f-a527-494f-8c3e-f2226ecbc43d@web.de>
Date: Tue, 25 Feb 2025 15:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qianyi Liu <liuqianyi125@gmail.com>, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Philipp Stanner <phasta@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20250225094125.224580-1-liuqianyi125@gmail.com>
Subject: Re: [PATCH V2] drm/sched: fix fence reference count leak
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250225094125.224580-1-liuqianyi125@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F4njyynBkRmF31L8qtqh4Qa/sWddqfZ2QogbbKK+kIBC4X8wbf/
 pPcTQOkimUZiYhAGwREn1U46cchQMYvR/IbNYffLU7axxSAS1BinPzHsOAikpsNt5eId7uU
 D2aTkglmAebxcGRlR1czM7zLkBVsysleiCtbaqdKacmptIAhxZHqYi1/JirfBy03UvApvyQ
 go3ig5hY+sTj20lu1nsBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0cMJcX94lzI=;yBRbMs+81Yg541y+4Gipxuzhesp
 Q0ZRKRTW65QhBr/QLXJpf4uFoF3yQkt4fqdd0LyLvo4VDEbs682nOw2sWxMAyMpXvstXt69LE
 2Pt2R5adkO2KUHQgBKFMFjxoqiNjJ1WSoJ+xhNYYqqYOJz0ay31+3msNjQrSlxP7cwm9hCuT6
 MCsOFwd3pNvP6qSvrwnPfOULquqLpROYbubSyPc/TK37RdFQjNIJz4I/xGgk6tyYscwwKkQmh
 ++u+3f5yqq5t/0A6qaJ1DuQ6p9Z7xoxi3HO53u77XK5YccsOkFPOrIATvFTQNUgiHg4xNLlhx
 O+0oiNIaliAdh6FhGsl6IVliZ17y1E68liV/4JpLOjOZq++t0LvFpwmHqDeny84RCUbjyvs+q
 3jeJ6Ry5LsigisuuYF2gS3rguUV761USIOddg49AHpd92GRKSYwCfVEf6hqL5uG6dsVNWPbk+
 DRh5A+VT3zCjPnWy15T2HMAU9j2VcZM++yLzEIO8rcCFMo4JXoQzLhw5PDBsMVkvprzo4WbLV
 gVaI1keTsbB26nIMRLruwdKeWLaPcGIfsWsCNskqSpmHg0pbt0+0oeeG8BYRa3YN+8kqZ7c8j
 8yi9TJVygeZtnLo0bBXhHqsddkwlUBbbINVm/FwH4e0vxRmhNdu5Wdv3sKM8wKoTmSiFr6uO7
 kERAQ3fh1j6kPEshCZWRzDCbwFXC8wLU4ZKZUqKGpGJsotWc80/7XhpM4GlCRpx6WfoJjWJd+
 rVRpaBW1ariusrH/2FatkHucJ2y2GQ7JRo1dLRod8JNXEB3EL4NFBY5/tkt1gAJ5VaIvRwuTc
 78AFXQaUGUex98Itb0vj0Vw+7HaXzDWktDe9jENX/8X9uNMV6EStPyXuWHV+0bYM9ZQxDQ+jj
 CmAHUHJtclVC99JM0nI+WSAEQCqoJi86cyOc5BjBQPQy0MGyY8d1G4GpFMGJum2MY1GBo4Bgx
 wq4ZU+bOPqJ8munQzDTobx6EO3h3R30iXvePKIjc8MMxpZlQ7HYvMjXZoUsQmt+O8xhYnQYsB
 0BA9PMnqk0fPfqWkjYUHw00vwGJd/eQzsA5KjJtowwKI2X40q5bEtoqSRiNO83so17j0XKPZY
 d0r30eTivbghLrqIeut+Nzet8rBC4GSxwUIHrXgeOyMySBK6WZRcAla+QX7F/tWxXmlrhQEuK
 /7kCeUD3BO5ELYgMQIO6BPIefc3W+gqvrrkgtpYM0D9hWHNvsY01UpTMT6yu2kZjCzuFRdJHv
 zpFoc33BYN6TteylaMOMZqgC1jRiz3796Mhk09/Qm0MjTRlsIPlHETObdy3yBa0O8IRL86BiA
 GcfRrpeAGJSF+E9cFflT02P73VFi+ocbMkgM70RlNVbjskVowYkl2jeJEfT7RbfU2dQ6a5Oib
 pCkIX2eBkIOrq1WK7NgFyr4kAj8k0cXsfIvImDu2YqB0+y+jR54nYfbamOwvxsTvKFQ7qAbVO
 TRAS1uu42yscrPScUDj4u6jJPt1M=
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
> fence callback add fails.

                     failed?


> To fix this, we should decrement the reference count of prev when
=E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc4#n94


> v2:

Patch version descriptions may be specified behind the marker line.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc4#n763

Regards,
Markus
