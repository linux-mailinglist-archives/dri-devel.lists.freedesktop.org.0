Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E6C2B99E5
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 18:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9323D6E55E;
	Thu, 19 Nov 2020 17:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC0D6E55E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 17:51:50 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AJHmMXO148567;
 Thu, 19 Nov 2020 17:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=AU8T+BYBfdaiKuO1Vwoy8JjJPEtdsBEEhANC9otqARI=;
 b=YStXJOadmnccjRQpmvIy3hjP9TSOo6ZcB+yKgbbwA6pB3AO62qhE5//hPHw6BqoADWMh
 gbRw4y9OLWPdgukwsO8xl2UJVB9cm0FKx0h83DyDPM7/7NGSOURFn/eUX1SSBGfCP0gg
 9V/2t3eZCHcBwbJA7XIEdbrXaV04K5yd9VlNL5RiQ4jMziwK5qXuzOlzpd1+53+5KdFp
 WQC0nQi6SjSINcjH/gUMKMf4L6JyCs+ta7SPvfMCDzsFz/kvQ4tx3W4h9ilVYRFBzitb
 3bydpVpnb4yjv/TNhBh/W+uf6e9sFcy4zR7McVEG4gS8Mu9dqlUsZlZfMSvaIVCJtBne OQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 34t4rb6wxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Nov 2020 17:51:45 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AJHnbAT161820;
 Thu, 19 Nov 2020 17:51:44 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 34ts0u2pfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 17:51:44 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AJHpcJG022889;
 Thu, 19 Nov 2020 17:51:39 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Nov 2020 09:51:38 -0800
Date: Thu, 19 Nov 2020 20:51:31 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] drm/vboxvideo: Unmap iomem on probe-failure and remove
Message-ID: <20201119175131.GI18329@kadam>
References: <20201027135153.324873-1-hdegoede@redhat.com>
 <f6b034c3-ef86-7214-f65e-af93b78bd456@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6b034c3-ef86-7214-f65e-af93b78bd456@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190127
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190127
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 19, 2020 at 12:35:56PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 10/27/20 2:51 PM, Hans de Goede wrote:
> > Add missing pci_iounmap() calls to properly unmap the memory on
> > probe-failure and remove.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> For some reason the spam-filter used by Red Hat's email system has eaten
> Daniel Vetter's reply to this, so let me copy and paste that from patchwork:
> 
> Daniel Vetter wrote:
> 
> > I think switching over to devm would be really nice. And for pci all
> > you need to do is use pcim_enable_device and delete all the cleanup
> > code, and it's all done. Hand rolling device cleanup code really isn't
> > a great idea and way too error-prone. Plus you're using lots of devm_
> > already.
> 
> Good point, so I just checked and the vboxvideo code is already
> using pcim_enable_device() so it looks like this is a false-positive
> from the lkp@intel.com bot, and Dan Carpenter missed that pcim_enable_device()
> makes all subsequent pci-resource acquiring calls behave like devm calls,
> when he forwarded the report to me.
> 
> Tl;DR: there is no bug / leak and this patch can be dropped.
> 
> Is there a place where I can report a bug against the lkp@intel.com bot
> for this false-positive ?

Ah.  Thanks!

This is a Smatch bug.  There is a list for that smatch@vger.kernel.org
but I already remove the pci_iomap() from the list of functions that
needs to be unwound based on your report.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
