Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02AE284520
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 06:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C1D6E0E4;
	Tue,  6 Oct 2020 04:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0199.hostedemail.com
 [216.40.44.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782A16E0E4
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 04:55:08 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id E8DE618025614;
 Tue,  6 Oct 2020 04:55:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3868:3870:3874:4250:4321:5007:6120:7576:7903:10004:10400:10450:10455:10848:11026:11232:11657:11658:11914:12043:12296:12297:12740:12760:12895:13069:13149:13161:13229:13230:13255:13311:13357:13439:14181:14254:14659:14721:19904:19999:21080:21451:21627:30001:30002:30003:30004:30005:30006:30007:30008:30009:30010:30011:30012:30013:30014:30015:30016:30017:30018:30019:30020:30021:30022:30023:30024:30025:30026:30027:30028:30029:30030:30031:30032:30033:30034:30035:30036:30037:30038:30039:30040:30041:30042:30043:30044:30045:30046:30047:30048:30049:30050:30051:30052:30053:30054:30055:30057:30058:30059:30060:30061:30062:30063:30064:30065:30066:30067:30068:30069:30070:30071:30072:30073:30074:30075:30076:30077:30078:30079:30080:300
X-HE-Tag: smell79_1c14f78271c4
X-Filterd-Recvd-Size: 2318
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Tue,  6 Oct 2020 04:55:04 +0000 (UTC)
Message-ID: <92c4f9bd1d43b80a424a52131fcbc6a1a416de64.camel@perches.com>
Subject: Re: [RFC PATCH] DRM: amd: powerplay: don't undef pr_warn() {causes
 ARC build errors}
From: Joe Perches <joe@perches.com>
To: Randy Dunlap <rdunlap@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>,  dri-devel <dri-devel@lists.freedesktop.org>
Date: Mon, 05 Oct 2020 21:55:03 -0700
In-Reply-To: <9c86375d-34a9-6584-0069-452b193076d6@infradead.org>
References: <9c86375d-34a9-6584-0069-452b193076d6@infradead.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Cc: Evan Quan <evan.quan@amd.com>, kernel test robot <lkp@intel.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-10-05 at 21:50 -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> arch/arc/ implements BUG_ON() with BUG(). ARC has its own BUG()
> function and that function uses pr_warn() as part of its implementation.
> 
> Several (8) files in amd/powerplay/ #undef various pr_xyz() functions so
> that they won't be used by these drivers, since dev_() functions are
> preferred here and the #undefs make the pr_() functions unavailable.
[]
> --- lnx-59-rc7.orig/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ lnx-59-rc7/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -52,7 +52,7 @@
>   * They are more MGPU friendly.
>   */
>  #undef pr_err
> -#undef pr_warn
> +//#undef pr_warn
>  #undef pr_info
>  #undef pr_debug
>  
> --- lnx-59-rc7.orig/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
> +++ lnx-59-rc7/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
> @@ -54,7 +54,7 @@
>   * They are more MGPU friendly.
>   */
>  #undef pr_err
> -#undef pr_warn
> +//#undef pr_warn
>  #undef pr_info
>  #undef pr_debug 

These are bad ideas as all of these pr_<level> entries
may become functions in a near-term future.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
