Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC159625E41
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 16:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF82310E863;
	Fri, 11 Nov 2022 15:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFED10E849;
 Fri, 11 Nov 2022 15:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668180133; x=1699716133;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Koslal6pIHu5Q7zsw3W/jyP83uKb4HltVt+LTnJ3rPM=;
 b=hdNoZuY/lK1eubDWQaJQ8JhAp/CElSCTPgv1Yszt3CsNxsijuaewrlN7
 eaol17Zh96pq5zX8D6SNdK/9Q9byaaePFlWnxzE/QLHo59eLb1ECR/g1M
 ckhGro8QpRj01djrnzdOtNf5Si6XL86GOj94jVPwIto3NdG2gstIgmbda
 P7q7UZQy0ZizILyOQcpPBOyuJL1vlmTf2+5uhfuIdmhz99u55OGy97wk6
 MzVG7SPRl2vLQc5Oxfei4uwIm0zTEznuDcUWTrQBbqwIyaYCVtOwlIfZC
 QT68zMsq1BRpP1DbL6eoWlg8hFrZ4/S+qqZkuoE/BJ07R6P0UldCWViN4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="291332969"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="291332969"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 07:22:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="615513461"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="615513461"
Received: from ldunne-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.15.227])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 07:22:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/3] Add _PICK_EVEN_RANGES
In-Reply-To: <20221022064550.llyv4kj4grsxfncw@ldmartin-desk2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221011-pick-even-ranges-v1-0-1aaea52752ed@intel.com>
 <87mta1whjv.fsf@intel.com>
 <20221012190531.ecmurislebsivjhf@ldmartin-desk2.lan>
 <20221022064550.llyv4kj4grsxfncw@ldmartin-desk2.lan>
Date: Fri, 11 Nov 2022 17:22:08 +0200
Message-ID: <87r0y94iu7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Oct 2022, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Wed, Oct 12, 2022 at 12:05:31PM -0700, Lucas De Marchi wrote:
>>On Wed, Oct 12, 2022 at 11:51:48AM +0300, Jani Nikula wrote:
>>>On Tue, 11 Oct 2022, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>>>Add a new macro, _PICK_EVEN_RANGES, that supports using 2 address
>>>>ranges. This should cover most of our needs for _MMIO_PLL3 and such.
>>>>To show what is achieved with the new macro, convert some PLL-related
>>>>macros to use it instead of _MMIO_PLL3.
>>>
>>>While there's nothing particularly wrong about the solution when looked
>>>at in isolation, I do have pretty strong reservations on the whole.
>>>
>>>We have:
>>>
>>>1) _PICK_EVEN() used in _PIPE() and friends
>>>
>>>2) _PICK() used in _MMIO_PIPE3() and friends
>>>
>>>3) ->pipe_offsets[] etc. adjustment used in _MMIO_PIPE2() and friends
>>>
>>>4) ->ddi_index[] mapping proposed in [1]
>>>
>>>5) _PICK_EVEN_RANGES() proposed here
>>>
>>>Originally we only had the first one, when the hardware was
>>>simpler. Every single addition since then made sense at the time, but if
>>>we add 4 & 5 to the mix, I think it's just too many options.
>>>
>>>I think it's time to take a step back and figure out if there's a more
>>>generic approach that could be used.
>>
>>true... I actually see this as replacing most of the uses of _PICK()
>>and giving and extra benefit of removing the worry we are doing
>>out-of-bounds array access. It also allows to more easily move ranges
>>for new platforms, which is my intention here.
>
> Jani, any feedback here or in the possible things to do below? I'd like
> to get a sketch of whatever solution we think could be the right
> direction during next week.

Considering that I basically stalled this but couldn't provide a
decision on a concrete better path forward either,

Acked-by: Jani Nikula <jani.nikula@intel.com>

on the original approach here. Needs a rebase, but it doesn't block us
from the other ideas later either.

Thanks, and sorry,

Jani.



>
> thanks
> Lucas De Marchi
>
>>
>>So I think that we could have something like this if changing it to
>>something else means a bigger refactor. Talking about a big refactor, I
>>still think my series from a few years back would make sense:
>>
>>drm/i915/display: start description-based ddi initialization
>>(https://lore.kernel.org/all/20191223195850.25997-1-lucas.demarchi@intel.com/)
>>
>>I think that got stalled due to initialization in the intel_ddi.c trying
>>too much to group together the if/else ladder. But the overall intention
>>of the patch series I believe is still valid today:
>>
>>	(...) create a table-based initialization approach in
>>	which I keep the useful indexes for each platform: these indexes work
>>	similarly to what we have on the pll part. "enum port" is mostly a
>>	"driver thing" and when all the conversions take place, it would allow
>>	us to stop using the port as indexes to register or register bits. "enum
>>	tc_port", "enum phy", etc are not meaningful numbers from the spec POV
>>	and change with every other platform.
>>
>>+Bala who apparently is going to a similar approach in the ddi_index
>>approach.
>>
>>Other possible approaches hat come to mind (just dumping some thoughts,
>>with no actual code/poc):
>>
>>1) Inside display strut we have:
>>
>>	struct {
>>		u8 version;
>>		union {
>>			struct {
>>				i915_reg_t foo;
>>				i915_reg_t bar;
>>				i915_reg_t bla;
>>			} v1;
>>			struct {
>>				i915_reg_t xyz;
>>				i915_reg_t ijk;
>>			} v2;
>>		}
>>	} regs;
>>
>>instead of vesion it could be the "first platform to use it" like we
>>currently have. Those registers would then be initialized during module
>>bind and then we stop doing these conversions to map a platform to a
>>register offset.  It still needs some per-platform change for the
>>bitfields though.
>>
>>idea would be then to enforce using the right struct inside the union by
>>splitting the code in differen compilation units. One platform can
>>evolve from the other with the same compilation unit as long as it is
>>backward-compatible, i.e. we can add more registers, change offsets,
>>etc. But if the HW interface completely changes, it would need to use a
>>different version.
>>
>>2) Looking around what other teams do. In mesa the registers are actually
>>maintained in a xml. Example: gen12.xml
>>
>><register name="HIZ_CHICKEN" length="1" num="0x7018">
>>  <field name="HZ Depth Test LE/GE Optimization Disable" start="13" end="13" type="bool"/>
>>  <field name="HZ Depth Test LE/GE Optimization Disable Mask" start="29" end="29" type="bool"/>
>></register>
>>
>>In code it's used like this:
>>
>>reg.HZDepthTestLEGEOptimizationDisable = true;
>>
>>3) Kind of going in the same direction, but more in the kernel side. Maybe
>>switching to regmap?
>>
>>
>>I think one of the things that block this kind of refactors is having to
>>bring them back to all the previous platforms. Maybe going back only
>>until HAS_DDI() would be a good approach. Or maybe even spliting it on
>>DISPLAY_VER == 12?  That might help more radical changes.
>>
>>
>>Lucas De Marchi
>>
>>>
>>>
>>>BR,
>>>Jani.
>>>
>>>
>>>[1] https://patchwork.freedesktop.org/series/108833/
>>>
>>>-- 
>>>Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
