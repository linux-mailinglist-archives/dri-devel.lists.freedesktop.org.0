Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A32207C0B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 21:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3766C6E420;
	Wed, 24 Jun 2020 19:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB566E420
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 19:11:50 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05OJ7oUO178514;
 Wed, 24 Jun 2020 19:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ztzxAWCYHWVZX3rOY6jEix01wAS9uHZKZdJH6i0jFtA=;
 b=XmvLgBqEmclW3ljtliy05rkXOv1l03S7CgHEddLSn6l0Q1t9xbCmu2FGpASPqQRQKy+4
 C4FebfnbLpo6644zi4JLXFTvu8HvepOlG4OkijVGxEOpJoxRecZxYRLi28ZAqTk6sz7w
 IpPqlIrvxtKY1NsJ5TKRIxMW+J7KOkFgmiI7uYRFPFIMPWmTYmYO032amwLBwdwD8pNM
 G0w+6+SnBVgYcjypaZ1hsv/sQqT815m4Z5XwGCmoo0Z4+HoBFflKGuFusyO/85Oj9Pny
 4OD+WfwX9bWYqDe+snK4nQ+Et7T7Qr18OC0YDl6rvBA2p6yaM8xq+Zr/zKWRt4OTueXp Cw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 31uustmpbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 24 Jun 2020 19:11:45 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05OJ8Ani137723;
 Wed, 24 Jun 2020 19:11:44 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 31uur73w3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jun 2020 19:11:44 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05OJBhWi031145;
 Wed, 24 Jun 2020 19:11:44 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 24 Jun 2020 19:11:42 +0000
Date: Wed, 24 Jun 2020 22:11:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [bug report] drm/vc4: dsi: Fix bridge chain handling
Message-ID: <20200624191137.GI31008@kadam>
References: <20200624175806.GA7351@mwanda>
 <20200624203025.0ffea151@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624203025.0ffea151@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9662
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9662
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 cotscore=-2147483648 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006240126
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 08:30:25PM +0200, Boris Brezillon wrote:
> Hello Dan,
> 
> On Wed, 24 Jun 2020 20:58:06 +0300
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > Hello Boris Brezillon,
> > 
> > The patch 033bfe7538a1: "drm/vc4: dsi: Fix bridge chain handling"
> > from Dec 27, 2019, leads to the following static checker warning:
> > 
> > 	drivers/gpu/drm/vc4/vc4_dsi.c:758 vc4_dsi_encoder_disable()
> > 	warn: iterator used outside loop: 'iter'
> > 
> > drivers/gpu/drm/vc4/vc4_dsi.c
> >    743  static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
> >    744  {
> >    745          struct vc4_dsi_encoder *vc4_encoder = to_vc4_dsi_encoder(encoder);
> >    746          struct vc4_dsi *dsi = vc4_encoder->dsi;
> >    747          struct device *dev = &dsi->pdev->dev;
> >    748          struct drm_bridge *iter;
> >    749  
> >    750          list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
> >    751                  if (iter->funcs->disable)
> >    752                          iter->funcs->disable(iter);
> >    753          }
> > 
> > This loops backwards until iter is parked on the list head.
> > 
> >    754  
> >    755          vc4_dsi_ulps(dsi, true);
> >    756  
> >    757          list_for_each_entry_from(iter, &dsi->bridge_chain, chain_node) {
> > 
> > But then this "continues" until the iter is parked on the list head.
> > Since we ended with the iterator already on the list head then we never
> > enter this loop and it is a no-op.
> > 
> > Am I missing something?
> 
> It should definitely be list_for_each_entry() here. Thanks for
> this report. Would you mind sending a patch?

Yeah.  I can do that tomorrow.

I'm working on a new Smatch check and so I wasn't super familiar with
some of these list_for_each() loops.  Thanks!

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
