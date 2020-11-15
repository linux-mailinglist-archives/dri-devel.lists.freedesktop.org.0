Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6942B3A87
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 00:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BDB89BBE;
	Sun, 15 Nov 2020 23:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0093.hostedemail.com
 [216.40.44.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8C489BBE;
 Sun, 15 Nov 2020 23:12:05 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id B6E2C100E7B43;
 Sun, 15 Nov 2020 23:12:04 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:69:327:355:379:599:967:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1593:1594:1605:1730:1747:1777:1792:1801:2194:2199:2393:2525:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3870:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4605:5007:8985:9025:9040:9121:9592:10004:10848:11026:11232:11473:11657:11658:11914:12043:12296:12297:12438:12555:12740:12760:12895:12986:13255:13439:14096:14097:14659:21080:21451:21627:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: brush60_4d0c30627324
X-Filterd-Recvd-Size: 21605
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Sun, 15 Nov 2020 23:12:03 +0000 (UTC)
Message-ID: <176ba5be7e1a4cd5aa36c5e891a55728075135d0.camel@perches.com>
Subject: Re: [PATCH 01/40] drm/amd/include/vega10_ip_offset: Mark _BASE
 structs as __maybe_unused
From: Joe Perches <joe@perches.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Sun, 15 Nov 2020 15:12:01 -0800
In-Reply-To: <20201113134938.4004947-2-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-2-lee.jones@linaro.org>
User-Agent: Evolution 3.38.1-1 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-11-13 at 13:48 +0000, Lee Jones wrote:
> This patch fixes nearly 400 warnings!
> 
> These structures are too widely used in too many varying
> configurations to be split-up into different headers or moved into
> source files.
> 
> Instead, we'll mark them as __maybe_unused which tells the compiler
> that we're aware they're being included into source files which do not
> make use of them - but we've looked into it, and it's okay.

https://gcc.gnu.org/onlinedocs/gcc-4.7.2/gcc/Type-Attributes.html#Type-Attributes

Wouldn't it be simpler to mark the struct definitions as maybe_unused
instead of the declarations?

And perhaps remove all the unnecessary zeroed declarations?

Something like this example?
---
 drivers/gpu/drm/amd/include/arct_ip_offset.h | 353 +++++++++++----------------
 1 file changed, 145 insertions(+), 208 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/arct_ip_offset.h b/drivers/gpu/drm/amd/include/arct_ip_offset.h
index a7791a9e1f90..9f2d6b832dd9 100644
--- a/drivers/gpu/drm/amd/include/arct_ip_offset.h
+++ b/drivers/gpu/drm/amd/include/arct_ip_offset.h
@@ -33,215 +33,152 @@ struct IP_BASE_INSTANCE
 struct IP_BASE
 {
     struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
-};
-
-
-static const struct IP_BASE ATHUB_BASE            ={ { { { 0x00000C20, 0x00012460, 0x00408C00, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE CLK_BASE            ={ { { { 0x000120C0, 0x00016C00, 0x00401800, 0, 0, 0 } },
-                                        { { 0x000120E0, 0x00016E00, 0x00401C00, 0, 0, 0 } },
-                                        { { 0x00012100, 0x00017000, 0x00402000, 0, 0, 0 } },
-                                        { { 0x00012120, 0x00017200, 0x00402400, 0, 0, 0 } },
-                                        { { 0x000136C0, 0x0001B000, 0x0042D800, 0, 0, 0 } },
-                                        { { 0x00013720, 0x0001B200, 0x0042E400, 0, 0, 0 } },
-                                        { { 0x000125E0, 0x00017E00, 0x0040BC00, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE DF_BASE            ={ { { { 0x00007000, 0x000125C0, 0x0040B800, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE FUSE_BASE            ={ { { { 0x000120A0, 0x00017400, 0x00401400, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE GC_BASE            ={ { { { 0x00002000, 0x0000A000, 0x00012160, 0x00402C00, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE HDP_BASE            ={ { { { 0x00000F20, 0x00012520, 0x0040A400, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE MMHUB_BASE            ={ { { { 0x00012440, 0x0001A000, 0x00408800, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE MP0_BASE            ={ { { { 0x00016000, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE MP1_BASE            ={ { { { 0x00016000, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE NBIF0_BASE            ={ { { { 0x00000000, 0x00000014, 0x00000D20, 0x00010400, 0x00012D80, 0x0041B000 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE OSSSYS_BASE            ={ { { { 0x000010A0, 0x00012500, 0x0040A000, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE PCIE0_BASE            ={ { { { 0x000128C0, 0x00411800, 0x04440000, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE SDMA0_BASE            ={ { { { 0x00001260, 0x00012540, 0x0040A800, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE SDMA1_BASE            ={ { { { 0x00001860, 0x00012560, 0x0040AC00, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE SDMA2_BASE            ={ { { { 0x00013760, 0x0001E000, 0x0042EC00, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE SDMA3_BASE            ={ { { { 0x00013780, 0x0001E400, 0x0042F000, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE SDMA4_BASE            ={ { { { 0x000137A0, 0x0001E800, 0x0042F400, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE SDMA5_BASE            ={ { { { 0x000137C0, 0x0001EC00, 0x0042F800, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE SDMA6_BASE            ={ { { { 0x000137E0, 0x0001F000, 0x0042FC00, 0, 0, 0 } },
-                                       { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE SDMA7_BASE            ={ { { { 0x00013800, 0x0001F400, 0x00430000, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE SMUIO_BASE            ={ { { { 0x00016800, 0x00016A00, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE THM_BASE            ={ { { { 0x00016600, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE UMC_BASE            ={ { { { 0x000132C0, 0x00014000, 0x00425800, 0, 0, 0 } },
-                                        { { 0x000132E0, 0x00054000, 0x00425C00, 0, 0, 0 } },
-                                        { { 0x00013300, 0x00094000, 0x00426000, 0, 0, 0 } },
-                                        { { 0x00013320, 0x000D4000, 0x00426400, 0, 0, 0 } },
-                                        { { 0x00013340, 0x00114000, 0x00426800, 0, 0, 0 } },
-                                        { { 0x00013360, 0x00154000, 0x00426C00, 0, 0, 0 } },
-                                        { { 0x00013380, 0x00194000, 0x00427000, 0, 0, 0 } },
-                                        { { 0x000133A0, 0x001D4000, 0x00427400, 0, 0, 0 } } } };
-static const struct IP_BASE UVD_BASE            ={ { { { 0x00007800, 0x00007E00, 0x00012180, 0x00403000, 0, 0 } },
-                                        { { 0x00007A00, 0x00009000, 0x000136E0, 0x0042DC00, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE DBGU_IO_BASE            ={ { { { 0x000001E0, 0x000125A0, 0x0040B400, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-static const struct IP_BASE RSMU_BASE            ={ { { { 0x00012000, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
-
+} __maybe_unused;
 
+static const struct IP_BASE ATHUB_BASE = {
+	{
+		{{ 0x00000C20, 0x00012460, 0x00408C00, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE CLK_BASE = {
+	{
+		{{ 0x000120C0, 0x00016C00, 0x00401800, 0, 0, 0 }},
+		{{ 0x000120E0, 0x00016E00, 0x00401C00, 0, 0, 0 }},
+		{{ 0x00012100, 0x00017000, 0x00402000, 0, 0, 0 }},
+		{{ 0x00012120, 0x00017200, 0x00402400, 0, 0, 0 }},
+		{{ 0x000136C0, 0x0001B000, 0x0042D800, 0, 0, 0 }},
+		{{ 0x00013720, 0x0001B200, 0x0042E400, 0, 0, 0 }},
+		{{ 0x000125E0, 0x00017E00, 0x0040BC00, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE DF_BASE = {
+	{
+		{{ 0x00007000, 0x000125C0, 0x0040B800, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE FUSE_BASE = {
+	{
+		{{ 0x000120A0, 0x00017400, 0x00401400, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE GC_BASE = {
+	{
+		{{ 0x00002000, 0x0000A000, 0x00012160, 0x00402C00, 0, 0 }},
+	}
+};
+static const struct IP_BASE HDP_BASE = {
+	{
+		{{ 0x00000F20, 0x00012520, 0x0040A400, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE MMHUB_BASE = {
+	{
+		{{ 0x00012440, 0x0001A000, 0x00408800, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE MP0_BASE = {
+	{
+		{{ 0x00016000, 0, 0, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE MP1_BASE = {
+	{
+		{{ 0x00016000, 0, 0, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE NBIF0_BASE = {
+	{
+		{{ 0x00000000, 0x00000014, 0x00000D20, 0x00010400, 0x00012D80, 0x0041B000 }},
+	}
+};
+static const struct IP_BASE OSSSYS_BASE = {
+	{
+		{{ 0x000010A0, 0x00012500, 0x0040A000, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE PCIE0_BASE = {
+	{
+		{{ 0x000128C0, 0x00411800, 0x04440000, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE SDMA0_BASE = {
+	{
+		{{ 0x00001260, 0x00012540, 0x0040A800, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE SDMA1_BASE = {
+	{
+		{{ 0x00001860, 0x00012560, 0x0040AC00, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE SDMA2_BASE = {
+	{
+		{{ 0x00013760, 0x0001E000, 0x0042EC00, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE SDMA3_BASE = {
+	{
+		{{ 0x00013780, 0x0001E400, 0x0042F000, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE SDMA4_BASE = {
+	{
+		{{ 0x000137A0, 0x0001E800, 0x0042F400, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE SDMA5_BASE = {
+	{
+		{{ 0x000137C0, 0x0001EC00, 0x0042F800, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE SDMA6_BASE = {
+	{
+		{{ 0x000137E0, 0x0001F000, 0x0042FC00, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE SDMA7_BASE = {
+	{
+		{{ 0x00013800, 0x0001F400, 0x00430000, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE SMUIO_BASE = {
+	{
+		{{ 0x00016800, 0x00016A00, 0, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE THM_BASE = {
+	{
+		{{ 0x00016600, 0, 0, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE UMC_BASE = {
+	{
+		{{ 0x000132C0, 0x00014000, 0x00425800, 0, 0, 0 }},
+		{{ 0x000132E0, 0x00054000, 0x00425C00, 0, 0, 0 }},
+		{{ 0x00013300, 0x00094000, 0x00426000, 0, 0, 0 }},
+		{{ 0x00013320, 0x000D4000, 0x00426400, 0, 0, 0 }},
+		{{ 0x00013340, 0x00114000, 0x00426800, 0, 0, 0 }},
+		{{ 0x00013360, 0x00154000, 0x00426C00, 0, 0, 0 }},
+		{{ 0x00013380, 0x00194000, 0x00427000, 0, 0, 0 }},
+		{{ 0x000133A0, 0x001D4000, 0x00427400, 0, 0, 0 }}
+	}
+};
+static const struct IP_BASE UVD_BASE = {
+	{
+		{{ 0x00007800, 0x00007E00, 0x00012180, 0x00403000, 0, 0 }},
+		{{ 0x00007A00, 0x00009000, 0x000136E0, 0x0042DC00, 0, 0 }},
+	}
+};
+static const struct IP_BASE DBGU_IO_BASE = {
+	{
+		{{ 0x000001E0, 0x000125A0, 0x0040B400, 0, 0, 0 }},
+	}
+};
+static const struct IP_BASE RSMU_BASE = {
+	{
+		{{ 0x00012000, 0, 0, 0, 0, 0 }},
+	}
+};
 
 #define ATHUB_BASE__INST0_SEG0                     0x00000C20
 #define ATHUB_BASE__INST0_SEG1                     0x00012460

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
