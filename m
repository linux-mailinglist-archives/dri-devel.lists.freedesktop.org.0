Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF975A75914
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 11:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1351110E025;
	Sun, 30 Mar 2025 09:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="vavhQu1h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (unknown [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D29E10E025;
 Sun, 30 Mar 2025 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1743325623; x=1743930423; i=markus.elfring@web.de;
 bh=Wl5a2YLXa4omUL/QUP5AsB6nvAhhv1DRZGLOqSJhaco=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=vavhQu1hr9XS6QWLE4NMOj7S26eF1+O3M3VKjry918zD+JLefMYc6F81Y46/zvj0
 1OUiPxpwWplqWo5kWAtFqV9P9IR3sNvyaQwNjE9e6CteVsAFTHUYjiNoM/PXMuC/y
 qfW7voGjh5OVEEK35xDZLfh93Fo9TXFTSma2hNvhPBVjPlFpk+3/E1jwkUmO/pNkR
 I6fWGx2LLC8TIIF+GeV0YK6p68NieKX/8/pM3nZbQg3/T8Rl0iloXcxLNno3/AVF4
 j3QNb6EVIYfqX6eDIfFJ1loU4onxlWd8Fto9LoS9B5apW0bwavUi5kxxpzyiqqe+Z
 npChrhAIOePdySPsLQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.13]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MWzCt-1taS900pmD-00HoqV; Sun, 30
 Mar 2025 11:07:03 +0200
Message-ID: <f97e30e8-10f0-43f1-be87-028ad257577c@web.de>
Date: Sun, 30 Mar 2025 11:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250329113538.7935-1-qasdev00@gmail.com>
Subject: Re: [PATCH v2 RESEND] drm/msm/dpu: reorder pointer operations after
 sanity checks to avoid NULL deref
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250329113538.7935-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+V+xYx81Fu0g/QukKapJKNUF/JeSHHllM8Rnmw7CLFJPq+UmVp+
 VaDgX3cQO4mj3kuycYrO5/R+EciXlM3NhZn2X+XR7mfbLCkwZWqzjOm8cx5aP3HTALXatHD
 wMnyNGChCgzi8AooO5lkxk1muGK9AEPeYSuHLIHxIQHE4nli2qI9dVxWGfVHRKMZB5dCOd8
 LFIuYlHZFHDX4cR5ld83Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ajUk0CQ3CP0=;w2yQ7jNvlBtXpv6QU7BTYZm8qlk
 OmnVPjRmM56+aaNM2z4Tnd5Cc28eUK3PEo9g81Fw2zffe2Kb5kD0NnAA+36Py4g/xK/Wp71i8
 /gNsAdHRj4kNgDY7w0MtTW87UZ0WLGBDokadIGJxIGRYmZPrh7LpHgtg1UnflfLOdNgoxzrLA
 eJC31UV96xQgTROROSszh7CAt9air2wjOe/jRb2f8sKYSo9PMRz1cFaBccvxrdIAy0ocYDhtc
 wc5AD5lqnaKnP3yEiotrSjuUaQRkMfQpcaPmIJh428WYrDVtvKaCjTrvVuKoDjPbmWrAJTFGd
 Trw0E0ZvBHz/t36h9819v99HZTpLvPLX6rTm4Go5zP8rwLxbEE/bsqD3ODOjbTOrr3VoCfx6M
 zAgOnQbhWPQOt41iJ8qAsgYbeK6MzUh34YNnAfKzIxoMv41VnwjXMizFpXp4zPEvnB87D1/Ki
 xLh9CYeFXcXUmvTd06w71fN79CgH8FrLwQZIBis9WdfBt5cRqWeir6r/JoLx694zy4yPh5SWZ
 TevjOYKV2+dbvNVDyx+OJpoUBkQul6lDW2ypx32eNLt1QSNqOmrg4A47L5I0iOTHZ4zPIJQh/
 fe3XqHCbNi71ETmmtJxo4IeZBvRuMgYsIyLSPge2VWJ2HpWMXvGuIW6pTQ5rhf5w5nAjs8DIo
 t9gvEAI4NGoqsbOui0YzYY7JGubU2iwJqh/8/QVzhHBunsAkHvABJ75iVkHgJgcFRzkTflaul
 dtG0k5uKPxuXxAiiyHtcTCBWoKB4J+GcRatDIfFpVmhF2GkeV7CBjJt4vNb/DQxDKKsrzzwSs
 1qlLXohzRDbiiXPPHRUA2PFtJ8OT/WpKNRh38L2unpUGUS65vlnSvX0xa2mQzKGBMnjBdnZWC
 ON05pn/Wk/3AFmT6gLC08QNVviXXKDMwW8eB02CtpYson40Lz5jb2R0epij+C4fO7JsBkK6Y/
 IsQaEepve/39j8vf/ZJbywIfsSrhnlO3IqT34NjUSNCVKpCrYsLEKzUKTLzOaxlOdiKcuu7UL
 wKJeApFxgbivm8FrwrJnJyPwijRjQKWuhg7b7tDd9D2uuGzC6BxB6zgWgEUcKXSEBCbXW4j4A
 AdFufw9uvBwKFHWbmUn2w7HQagABT9x+lMMou3wI/dfGf3xaHa2nfAbBwNczCdUxIVvMMZFyW
 oql1v53A3qxtcXk3h0ZXD0GJCxd5rdKLO+iV5RYSylG464uXRSXzg7kAwht/Vi+4CCOP0J/Z6
 P++5ESP4A3jrs+5HeC8KWSG/uJVHjRTNmwr3PeSZc7nb4SZZLPMkE7qbViBXG0hNB+EjUUkNP
 D+iTXGEu7hIf2++NleUEYjmtr83cNdgnppYkvfk1stgG8oVC9mcpmBWYB/YF+kSBybpBJlQ9u
 MO0OsfdmwkibgbP5zUz0UoooJw9xyvUgP+O4zju8bP4lz9I2LY5wQgqgya6ov+/oVVXTETLmP
 BHGrVhIKvaqPKfJ/2ti0Giiy6SEKY01PYFV+VkLyLmuC82NB9
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
> Fix this by reordering the dereference after the sanity checks.

Can my previous patch review contribution trigger more desirable collatera=
l evolution
also for this development topic?
https://lore.kernel.org/all/6f01f71b-284b-4841-bda9-a3934cb4efc8@web.de/
https://lkml.org/lkml/2025/3/10/696

Is any automated source code analysis involved here?

Regards,
Markus
