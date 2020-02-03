Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AEF1502F3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 10:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774BD6EB6A;
	Mon,  3 Feb 2020 09:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CD56EB68;
 Mon,  3 Feb 2020 09:06:56 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 013934fr088127;
 Mon, 3 Feb 2020 09:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=8WgPDKN0FJnUuKUBLKIxeobzc7t0Hcs7X5V3wjF1qF0=;
 b=LsHCgmGufai5qhkHeBqE7FZNDZB+nNdr1VIkClhVmmVBnP0vrrrqsyGzQXAsO5YvhFyn
 O6Ji/TwMEED9xLA0SHaIYYc/eBTR+NYfFiFHw8lAkc8B98IOBCPUKkRC59xP/eszz66x
 O3E9oCq0+zgIIUt3dpomej0ne1XSPTu+4Ru+KW9plKsJQz8IR+DWP3zppw1OKC95P0aF
 5Y9vDip0WXiAYtY7Cp/+Ab6CoT2BGl3WgxAGwPm0SGNXNIXzF2hZLZ3gOVlBk637s9TC
 D79dARXZ5zRLAeITfA9pstDkGSIzuLpI35Awp5DJSMe+lViv+r4ybs7Klc14zSaRXNbS iQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2xw19q69g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Feb 2020 09:06:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 01393JHS177625;
 Mon, 3 Feb 2020 09:06:40 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2xwjt3e3un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Feb 2020 09:06:39 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01396Ywj008538;
 Mon, 3 Feb 2020 09:06:35 GMT
Received: from kadam (/41.210.143.134) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 03 Feb 2020 01:06:31 -0800
Date: Mon, 3 Feb 2020 12:06:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: KASAN: use-after-free Read in vgem_gem_dumb_create
Message-ID: <20200203090619.GL1778@kadam>
References: <000000000000ae2f81059d7716b8@google.com>
 <CAKMK7uGivsYzP6h9rg0eN34YuOVbee6gnhdOxiys=M=4phK+kw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGivsYzP6h9rg0eN34YuOVbee6gnhdOxiys=M=4phK+kw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9519
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002030073
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9519
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002030073
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
Cc: Rob Clark <robdclark@chromium.org>, David Miller <davem@davemloft.net>,
 Dave Airlie <airlied@linux.ie>, netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 syzbot <syzbot+0dc4444774d419e916c8@syzkaller.appspotmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 02, 2020 at 02:19:18PM +0100, Daniel Vetter wrote:
> On Fri, Jan 31, 2020 at 11:28 PM syzbot
> <syzbot+0dc4444774d419e916c8@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    39bed42d Merge tag 'for-linus-hmm' of git://git.kernel.org..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=179465bee00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=2646535f8818ae25
> > dashboard link: https://syzkaller.appspot.com/bug?extid=0dc4444774d419e916c8
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16251279e00000
> >
> > The bug was bisected to:
> >
> > commit 7611750784664db46d0db95631e322aeb263dde7
> > Author: Alex Deucher <alexander.deucher@amd.com>
> > Date:   Wed Jun 21 16:31:41 2017 +0000
> >
> >     drm/amdgpu: use kernel is_power_of_2 rather than local version
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11628df1e00000
> > final crash:    https://syzkaller.appspot.com/x/report.txt?x=13628df1e00000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=15628df1e00000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+0dc4444774d419e916c8@syzkaller.appspotmail.com
> > Fixes: 761175078466 ("drm/amdgpu: use kernel is_power_of_2 rather than local version")
> 
> Aside: This bisect line is complete nonsense ... I'm kinda at the
> point where I'm assuming that syzbot bisect results are garbage, which
> is maybe not what we want. I guess much stricter filtering for noise
> is needed, dunno.
> -Danile

With race conditions the git bisect is often nonsense.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
