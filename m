Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 474DD410AC3
	for <lists+dri-devel@lfdr.de>; Sun, 19 Sep 2021 10:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794856E19B;
	Sun, 19 Sep 2021 08:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 317 seconds by postgrey-1.36 at gabe;
 Sun, 19 Sep 2021 08:32:46 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8B46E19B
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Sep 2021 08:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632040364;
 bh=bhpnsaGrv1Np5DCcjaML4H7Oxy9P1u6fnD5PIt2nVJE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=WZEZqv1bhtL0sdLflrHFwIKXLwrv9vzvJYyyporOpj6XKZNZe72WAIfYLaIoMF2Vx
 1rAH2qiZPKDRMWREzr/YoH4rHVpOAb5XG7TVsyJQu4ISZuI0Y5t2/2foNrrV2qMQSH
 nhDrcVuTdcmBJJWL5LVIzagCZCuWvSrh7LADIMGY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([79.150.72.99]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MJE2D-1mC8pq469b-00KeCc; Sun, 19
 Sep 2021 10:27:18 +0200
Date: Sun, 19 Sep 2021 10:27:05 +0200
From: Len Baker <len.baker@gmx.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: Kees Cook <keescook@chromium.org>, Len Baker <len.baker@gmx.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] net: mana: Prefer struct_size over open coded arithmetic
Message-ID: <20210918171519.GA2141@titan>
References: <20210911102818.3804-1-len.baker@gmx.com>
 <20210918132010.GA15999@titan>
 <BYAPR21MB1270797B518555DF5DC87871BFDE9@BYAPR21MB1270.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR21MB1270797B518555DF5DC87871BFDE9@BYAPR21MB1270.namprd21.prod.outlook.com>
X-Provags-ID: V03:K1:0Usx9DIb/dE6r4AgA5bj+2H9ipZynWUT6G16cuQBnHsNr+kBZoR
 +l/jfqBdlR3QmD0jTX6WNa8vHjJkdzf2bXDDPykHodB/1mrO1nUJ6AZLVl0NgXVz0gtGISk
 jJ+kwAH1QYzowbUo0nJ0gygeIJkKK7eUPjsvlQ4Z6FH7rISeES9ue7+jK9zDavetLczc1FT
 V4vqf4e+YebRTYGD58maw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zW5x2d4q2pc=:z5hvtltpQRW3w5F2D1ZOsG
 H/+BcdtSCjHyDkk4f8O5LEEoo0ahrG1fXksKxSfvmmNmSh3i6mEUrouRLnKa1/ChwL90uD2US
 Vvc/m6q4CDKmnYO+xh7mc39lmB/f2wsV8I87W2Cr0DlfDYIAGduk7uQAjoMkeBZ2g4clvAG54
 o2gh110wdS2lnQJgtnxMdn9H7KQ1ExtHJXr/E2vHo/kL2Bk7vn/mJqtVmlHK9KggbfshIodju
 aV2lzyoUn17SJY/2oPL37gzFMm8/Z9Mef4O8MtCNB2dHkTlGmi2LCgr82FE6KMDjiF/YfoMOh
 bTclHNMlYiSfn+q9UTS1jZPW1l+vs24I5pnlXg8TMq9Nc4XRdbr9WN/siiMU20HJQmn5WIpyb
 lc0CkeF1ri0hBnH859z7U7jEN+3bhr0gf1b7I4ahICzHVZeTyiRqUpZcK/8RoS4cgO2ZV9P6m
 ro+Cqry3hQAG9SQXUhZ2Y1U6qZRjoE8o4vIVg5Ai4MxEzVBtz7J991qnHpmbz9GpwndPB1mtU
 p/p0g5xRxQN3ODJfoGM3t5loq0JAc3Tu/MugReilK3lZcUKSsHGV3GVfbeL/2jh30/p2jC1VU
 Q4Ig4O4G8G+w8j7GCkDH6Pi0YEewGpqdqZRE3WORWFdKgPxap0Vre2bC1zsJrhVMX4OP7Bi3O
 RVoIFX3Dr0N6UTguk/KKy9fdhWIKUvxwB+NsIuVK8FPeCx2IoK3cy5mDp6No5UPXxhET5rQqt
 CGWdohnzTbtQ2y4f6T/nQozRykoMoa3eV+AbosaJq/QgQLmRLTi4hE/hUGLAIqMbWH/x3Elqh
 UpXrOD7tPg2kisME3t2VnnfbP62jlLNeZow5XJqlkWhtCgPyTD6T0wWdaPRsCs7wMoUUnO/L7
 XdmQtxdvoabT0mMoyrvzxlbGnWwBD4W/gfBwGsCu/N8Jo9RM0Mn0w0zdqrFyyRJUjR0ONvvcu
 Pdf73dP8gq1U2H/kt3zWGNUPWnIIlm1nuNWUsZ4MrGzXQr5InmjxYnefv1cmIRPyO9R2Bv0So
 kfi/tVK6X5QfiI3FfxDyFo2Y+i5/DNmsw6YF5+6A3NIjYt1ZlFA/3llDjlAGDcreNsb4zD/tm
 sJG1rlNCFEgfpc=
Content-Transfer-Encoding: quoted-printable
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

Hi Dexuan,

On Sat, Sep 18, 2021 at 05:06:16PM +0000, Dexuan Cui wrote:
> > From: Len Baker <len.baker@gmx.com>
> > Sent: Saturday, September 18, 2021 6:20 AM
> >  ...
> > I have received a email from the linux-media subsystem telling that th=
is
> > patch is not applicable. The email is the following:
> >
> > Regards,
> > Len
>
> The patch is already in the net-next tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/comm=
it/?id=3Df11ee2ad25b22c2ee587045dd6999434375532f7

Thanks for the info.

Regards,
Len
