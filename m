Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C53BF46C4DA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7EE6F5F5;
	Tue,  7 Dec 2021 20:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mr85p00im-ztdg06021801.me.com (mr85p00im-ztdg06021801.me.com
 [17.58.23.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646796F5F5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 20:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1638909934; bh=rd82UKA3OGqoBBQRnGMiN/2Irj18hM4IDYdb/pa3z5E=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=CfOYc2vXkxsdptw7mZfDhoJQ3QmJ+BAK8Q/H/4JW71mk7x2LMVcmwbuZSz35mpyi7
 tt83guhoE1M49JvMnKma8AZb9dlSoSjGy/V+Vfzp/zjfqhD/Oqj4c6I7f2dgw6r7ZH
 BgO1oSXM/caa0PrwS4MJfF7iFRPkNGaJrH+zj0hK2iGwAraWyzsEO30JyxRFhdScp+
 WI0RlztRItcVKgsQSfiAmu71kRAuJlN/vGhac9OjKKabJrLZBNnFv9FzyMU9ceveIM
 HBMXf+IyiwBYgcJyJgbMw0IT0KMoAFht24meQI61MX2gtqiFnVjSpVsdZAEc6d8znf
 guTtkSjzxxh4w==
Received: from hitch.danm.net (c-73-98-236-45.hsd1.ut.comcast.net
 [73.98.236.45])
 by mr85p00im-ztdg06021801.me.com (Postfix) with ESMTPSA id 43CDB180A30;
 Tue,  7 Dec 2021 20:45:33 +0000 (UTC)
From: Dan Moulding <dmoulding@me.com>
To: sf@sfritsch.de
Subject: Re: [Nouveau] Regression in 5.15 in nouveau
Date: Tue,  7 Dec 2021 13:45:28 -0700
Message-Id: <20211207204528.6740-1-dmoulding@me.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <3bf72f52-0101-36e1-8c95-4bd983dd4f04@sfritsch.de>
References: <3bf72f52-0101-36e1-8c95-4bd983dd4f04@sfritsch.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.790,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-12-07=5F07:2021-12-06=5F02,2021-12-07=5F07,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 clxscore=1015 mlxlogscore=927 phishscore=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2112070126
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
Cc: regressions@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, dmoulding@me.com, regressions@leemhuis.info,
 bskeggs@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> There is a pretty obvious typo in there:
> 
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -359,7 +359,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct 
> nouveau_channel *chan, bool e
>                  fobj = dma_resv_shared_list(resv);
>          }
> 
> -       for (i = 0; (i < fobj ? fobj->shared_count : 0) && !ret; ++i) {
> +       for (i = 0; i < (fobj ? fobj->shared_count : 0) && !ret; ++i) {
>                  struct nouveau_channel *prev = NULL;
>                  bool must_wait = true;
> 
> 
> With that it works and I don't see the flickering in a short test. I 
> will do more testing, but maybe Dan can test, too.
> 
> Cheers,
> Stefan

After fixing the typo the patch is working for me, also. dmesg is also
clean. I will continue running the patched kernel. If I see any
issues, I will report back here.

Cheers,

-- Dan
