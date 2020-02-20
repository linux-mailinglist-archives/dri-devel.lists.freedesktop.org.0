Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85816165D25
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 13:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674C389AF3;
	Thu, 20 Feb 2020 12:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0067.hostedemail.com
 [216.40.44.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD3289AF3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 12:01:19 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 83219181D3039;
 Thu, 20 Feb 2020 12:01:16 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::,
 RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3868:3871:3872:4250:4321:5007:6119:8957:9040:10004:10400:10848:11026:11232:11658:11914:12043:12048:12114:12297:12438:12740:12760:12895:13069:13311:13357:13439:14180:14659:14721:21080:21433:21611:21627:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: low15_af1a30c2f956
X-Filterd-Recvd-Size: 1554
Received: from XPS-9350.home (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Thu, 20 Feb 2020 12:01:15 +0000 (UTC)
Message-ID: <0d8dd389a5061f7e178d4e974001236ec33290e5.camel@perches.com>
Subject: Re: drm_dp_mst_topology.c and old compilers
From: Joe Perches <joe@perches.com>
To: paulmck@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org,  airlied@linux.ie, daniel@ffwll.ch
Date: Thu, 20 Feb 2020 03:59:51 -0800
In-Reply-To: <20200220004232.GA28048@paulmck-ThinkPad-P72>
References: <20200220004232.GA28048@paulmck-ThinkPad-P72>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-02-19 at 16:42 -0800, Paul E. McKenney wrote:
> Hello!
> 
> A box with GCC 4.8.3 compiler didn't like drm_dp_mst_topology.c.  The
> following (lightly tested) patch makes it happy and seems OK for newer
> compilers as well.
> 
> Is this of interest?
[]
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
[]
> @@ -5396,7 +5396,7 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
>  {
>  	struct drm_dp_mst_port *immediate_upstream_port;
>  	struct drm_dp_mst_port *fec_port;
> -	struct drm_dp_desc desc = { 0 };
> +	struct drm_dp_desc desc = {{{ 0 }}};

Perhaps this is simpler as:

	struct drm_dp_desc desc = {};


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
