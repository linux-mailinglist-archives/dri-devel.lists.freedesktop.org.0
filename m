Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7277D26A745
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 16:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B609C6E233;
	Tue, 15 Sep 2020 14:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 313 seconds by postgrey-1.36 at gabe;
 Tue, 15 Sep 2020 10:16:59 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C6A6E21F;
 Tue, 15 Sep 2020 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1600165016;
 bh=UogIhfq9qNNjo/T+q6FmRMfIDnT2whLvdoBDxqlHAEs=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=It8PJxKX+62s55buXkPtJLzmIhENLdco5fOLVkbZwtXVRR4ncadVNePgH/+rolnm6
 TkbXvwD+cBWeYe4aQZqyLcadJM82pHVRoJ/tHcs9/9Nl1eNb9lF8foeQZkHiqgFXAi
 2dQBEDY0VPS9lrH+/JOjapf3ceEV5D3Nt9YLXtqI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.3.160] ([91.64.89.12]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lc8c5-1kjniw49q9-00jZs1; Tue, 15
 Sep 2020 12:11:40 +0200
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>
From: Dirk Neukirchen <dirkneukirchen@web.de>
Subject: Haswell Regression in 5.9-rcX and lower 5.7.x, 5.8.x #2024 - Revert
 47f8253d2b89 ("drm/i915/gen7: Clear all EU/L3 residual contexts") ?
Message-ID: <fc85dfc7-7f82-51f3-4fae-efea02a8339c@web.de>
Date: Tue, 15 Sep 2020 12:10:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US-large
X-Provags-ID: V03:K1:q1PcOu+oSzo73KlR10JHwU4DZPm6zwsG9wzPFGol2UjC9PqS7YP
 PVUfiJNrmkAoHZ0YDTdE8OuMsPwCKuHQZFM5HgYoL640C6VGWbH9MEmnvTOdvUs1VTfgX5/
 RxcREQgi/m2yaeEM430y2aSTJlm9kSsU/wJyGV4yXPIIe9wqBm8CP2BbFy9MpQ8vqKIaQ4x
 fuF+/VWm6JjWgUh8YvkBw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3ALjIT/rIGQ=:zO3G9VQZWcubpvb0r8rK/x
 cZt2kQlSeZkYcKSenr1TpF//PTrYimy66Qmas5+E7kAvoFKQh5ssn4QeHILSOBIBX45/zF8VF
 aCWYV9n15GA52Zp91yfTRB5Wn402nXWkHXQPmafR8AXBkwPQlGqb6zcGX/za4xihKKZLnaJIG
 J3dcTj+RZQlUDkUPVRvgZgDmaAshPsxUP88Erxe6yih/lgVp29Exysuifn/sCIaA49ZH5c5rp
 MgX5niGhp/ELu+fNtIG0mFUnvWR3xttQYZKbhW5qCcocKlJCQuWtES7hUQIQvaQ9X2XT9jd+g
 gH7cIX2xWULgDcGwrfFtgjij45Hu49X4WW7COpOPZ1JetkeDheYAFMo41V705OfdCCO4jWKhw
 ny8TEPlOPTy1pChS2bAqeOaCQcc6fT5mq5HmTi0q4YGMVb2cYvrSL90QiI5OcEYE/AlrV2GnN
 a4REs1EjAA/3eIWYgXkUKmq3fk1pb8fdo5L2KBNgpqH50QcQdl5fU4d8L2D9QgfOiAczS7n7X
 NXmQOdiRnELUyWLY1KGZr9sT0ZbaEmM2E+0oEi2wgE9k9T3KvacvKHiWXUreSVzAye0f4u3Rg
 T7ffD+JKM3QM0MBqT/lqdu0CLxQrAD07gryFkCySE4uY9WJtVAud2VOfOdDNbhlJ6eYjZ09Fh
 vqAl12xObvKBLVye/8f6XlPkZISYLZWYb6lst8GXPHgXQvkqrjoxyn+zHjHsyBGhy7vZveXHG
 jiU4jLGgWaYQhdJJB3NeT5D5Ih5N6WqSiN5HHhkZaulalbFNXbg3VSujxQjkZQ9Qk8eX8VP+u
 ZxoF5idwZgpx4VRx9QOXgbEWQ55JCDtEtC6nXIE2fQOvNkBbKNgLk1bWjQQziCyRTpbl2giqx
 m74opxIOlNJmbZbV7AwQ1AzxzqXaptKEfOiyk6IdHLWkWZmlW9CgsImD0CpQHmMneKNmKDGnl
 ppjhPHt/YwzVz4e2rML3UG5HUawfGLqlayr/3qiA3G124CIEbGTjoC6A5aCcbDMwdU5UQx4YN
 QVK4Ahu9hzfla81wPW+Vckk9CIfU3iQwuQc7h0QBN8kXuokH/aG56M/AIh5Tb6BvIlbzEPieJ
 51+6bTTcer8cZsKLnlYFk2+/bRaAPuZRT6ZukaFgsEjK7jyT6MCRcB4n+1uqZoitm8nZ7P3SP
 2VLuk9oMgCqngLPN2TGEWhByucjDM7dJpQ74R+S6siqa+dEcbY6q0kOURmSv5ArPeGKuHPK/u
 iOyagMXiHxCgI5z7nAHgz2d9js77BoJ/Sl98T8A==
X-Mailman-Approved-At: Tue, 15 Sep 2020 14:38:31 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David, Chris and lists

I am inquiring about the current status of #2024 [1]

Problem: Kernels 5.7.x , 5.8.x, current 5.9-rcs and drm-tip have a large regression on (some?) Haswell (HSW)

This is verified by _multiple people_ using different methods.
All his is documented in [1]  , Kernel 5.6.19 was fine
Result: no output, no usable desktop due to gpu crashes

Hardware : 2x Acer C720 Chromebooks and potentially others

Methods:
- running mpv with vaapi enabled
- glxgears
- automatic desktop environment start (probably with acceleration)

There is atm no fix in drm-tip integrated (5.9.0_rc5bisect_g30b3e38bd6d5 for example still errors)
 and no activity from Intel in the bug report beside the "working" suggested patches / hacks there

There should be enough bisection info an there.
Nobody asked there to get more info or different bisects/trees.

So - the ticket is still open.

Because Fedora uses newish Kernels I would like to use it "normally" without
going for 5.4 LTS or waiting an unknown amount of time - as 5.9.x currently seems to have the
same regression.

Affected Hardware at my end:
- C720 with a Intel Celeron 2955U
- UEFI Bios instead of original Bios (mrchromebox.tech) if thats relevant for hardware init related bugs;
But the Kernel should take care of the correct initialization anyway

Feel free to comment which trees, branches, tags or patches we should try to help
and what _more_ to report for "Report-By" , "Tested-By", "Verified-By"
tagging so that [1] can be closed.

Greetings, Dirk

[1]https://gitlab.freedesktop.org/drm/intel/-/issues/2024

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
