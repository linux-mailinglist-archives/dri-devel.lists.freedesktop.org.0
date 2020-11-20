Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB80B2BA7DB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 12:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E766E8AC;
	Fri, 20 Nov 2020 11:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDC06E8AC
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 11:01:16 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AKAwZtA196157;
 Fri, 20 Nov 2020 11:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=RiILV8Of3q1OD+vFdsLlkleo+HY7AwC51QvSr49TjSk=;
 b=t8Z+Lkuos11YdkgiUAA6NvTYnJ2DgZPWOeAkksrogpVCO8NqbLP8Zy/Uhtl94v2z5rra
 Uaa8Lf/chyy+gu3ofZCfHRPpSyni+zkkmrMm/9zEEmER2B3vU+djf7J0iJiuUSgPYHlq
 fUFgz4hTEu6Kphzu68wj7YaRtFxvDpaEvRbajVZcKAroYXLqi/KGVnxWWrr4y30oR7zR
 wdZg4Lu6F4hXidBcQuv23QDV+2fN1/Y6OdY7yA1nN7Q0J5KWyT8a+wW12Bvl0RtFjXxo
 1IMNu08XHPRma/AJHEAB2G5dZkFK/BIQR0zwv6YO2HkpiZPm2hjzAYvteVa+NRm0R8lT 4g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 34t76ma5n2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Nov 2020 11:01:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AKAxdn8167298;
 Fri, 20 Nov 2020 11:01:08 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 34ts0v5d84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 11:01:08 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AKB143S024633;
 Fri, 20 Nov 2020 11:01:04 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 20 Nov 2020 03:01:04 -0800
Date: Fri, 20 Nov 2020 14:00:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/vboxvideo: Unmap iomem on probe-failure and remove
Message-ID: <20201120110055.GM18329@kadam>
References: <20201027135153.324873-1-hdegoede@redhat.com>
 <f6b034c3-ef86-7214-f65e-af93b78bd456@redhat.com>
 <20201119175131.GI18329@kadam>
 <CAKMK7uGB5-aDSyA42PVs7_86NEfinftvKWx6AKsLFjoUS-1VGw@mail.gmail.com>
 <20201120075811.GJ18329@kadam>
 <CAKMK7uHdAipPHEwyPPop+bny4Qm6hX=6cG1+0jG2y1NfsUi8JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHdAipPHEwyPPop+bny4Qm6hX=6cG1+0jG2y1NfsUi8JQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011200074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200074
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 10:39:45AM +0100, Daniel Vetter wrote:
> On Fri, Nov 20, 2020 at 8:58 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Thu, Nov 19, 2020 at 08:30:59PM +0100, Daniel Vetter wrote:
> > > On Thu, Nov 19, 2020 at 6:51 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > >
> > > > On Thu, Nov 19, 2020 at 12:35:56PM +0100, Hans de Goede wrote:
> > > > > Hi,
> > > > >
> > > > > On 10/27/20 2:51 PM, Hans de Goede wrote:
> > > > > > Add missing pci_iounmap() calls to properly unmap the memory on
> > > > > > probe-failure and remove.
> > > > > >
> > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > > >
> > > > > For some reason the spam-filter used by Red Hat's email system has eaten
> > > > > Daniel Vetter's reply to this, so let me copy and paste that from patchwork:
> > > > >
> > > > > Daniel Vetter wrote:
> > > > >
> > > > > > I think switching over to devm would be really nice. And for pci all
> > > > > > you need to do is use pcim_enable_device and delete all the cleanup
> > > > > > code, and it's all done. Hand rolling device cleanup code really isn't
> > > > > > a great idea and way too error-prone. Plus you're using lots of devm_
> > > > > > already.
> > > > >
> > > > > Good point, so I just checked and the vboxvideo code is already
> > > > > using pcim_enable_device() so it looks like this is a false-positive
> > > > > from the lkp@intel.com bot, and Dan Carpenter missed that pcim_enable_device()
> > > > > makes all subsequent pci-resource acquiring calls behave like devm calls,
> > > > > when he forwarded the report to me.
> > > > >
> > > > > Tl;DR: there is no bug / leak and this patch can be dropped.
> > > > >
> > > > > Is there a place where I can report a bug against the lkp@intel.com bot
> > > > > for this false-positive ?
> > > >
> > > > Ah.  Thanks!
> > > >
> > > > This is a Smatch bug.  There is a list for that smatch@vger.kernel.org
> > > > but I already remove the pci_iomap() from the list of functions that
> > > > needs to be unwound based on your report.
> > >
> > > I guess if smatch sees a pci_enable_device but not pcim_enable_device
> > > on the same device as passed to pci_iomap (and a pile of other pci
> > > functions) then it still must be unwound. Could smatch detect that?
> > > There's a lot of pci drivers not using the managed functions, catching
> > > bugs in these would be good.
> >
> > It's a lot of code.  There would be two ways to implement this:
> >
> > 1) Somehow store the links to figure out the value of:
> >
> >          devres_find(vbox->ddev.pdev.dev)->enabled
> >
> > That's very complicated.  I'm sort of working on some of the steps
> > involved but and it's probably a multi year process before it's
> > possible.
> >
> > 2) Create a data base table with driver data, then store if the driver
> > calls pcim_enable_device().  This is still a bit of work, but probably
> > straight forward.  Storing driver data would be useful for other things
> > as well.
> 
> Hm maybe I totally misunderstand how smatch works, but I thought you
> can track additional invariants and stuff on various pointers. So I
> figured you just track whether pci_enable_device has been called on a
> struct pci_device *dev, and then if anyone calls pci_iomap on the same
> pointer and there's no cleanup, it's a bug. For any other case you
> just can't tell (since absence of pcim_enable_device might just mean
> that smatch doesn't see through the maze). Or is that what you meant
> with approach 2?

Hm...  Your idea is another option #3.  It's probably less work.

I'll take a look at it.

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
