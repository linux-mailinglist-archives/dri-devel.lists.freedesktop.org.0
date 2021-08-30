Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CD43FB3FC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 12:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A2089B01;
	Mon, 30 Aug 2021 10:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0172189B01;
 Mon, 30 Aug 2021 10:43:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="217968946"
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="217968946"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 03:43:13 -0700
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="530161321"
Received: from anikolae-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.249.47.21])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 03:43:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/edid: parse the DisplayID v2.0 VESA vendor block
 for MSO
In-Reply-To: <09f57d55813f916578d1dd1e28bee3a621068bdd.1630319138.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1630319138.git.jani.nikula@intel.com>
 <09f57d55813f916578d1dd1e28bee3a621068bdd.1630319138.git.jani.nikula@intel.com>
Date: Mon, 30 Aug 2021 13:43:07 +0300
Message-ID: <8735qrcix0.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Aug 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> The VESA Organization Vendor-Specific Data Block, defined in VESA
> DisplayID Standard v2.0, specifies the eDP Multi-SST Operation (MSO)
> stream count and segment pixel overlap.
>
> DisplayID v1.3 has Appendix B: DisplayID as an EDID Extension,
> describing how DisplayID sections may be embedded in EDID extension
> blocks. DisplayID v2.0 does not have such a section, perhaps implying
> that DisplayID v2.0 data should not be included in EDID extensions, but
> rather in a "pure" DisplayID structure at its own DDC address pair
> A4h/A5h, as described in VESA E-DDC Standard v1.3 chapter 3.
>
> However, in practice, displays out in the field have embedded DisplayID
> v2.0 data blocks in EDID extensions, including, in particular, some eDP
> MSO displays, where a pure DisplayID structure is not available at all.
>
> Parse the MSO data from the DisplayID data block. Do it as part of
> drm_add_display_info(), extending it to parse also DisplayID data to
> avoid requiring extra calls to update the information.

For reference, this is the EDID from a Lenovo ThinkPad X1 with eDP MSO
display. AFAICT, the display does not respond on A4h/A5h at all, it only
has the usual EDID at the usual DDC address.


BR,
Jani.


edid-decode (hex):

00 ff ff ff ff ff ff 00 06 af 13 10 00 00 00 00
00 1c 01 04 a5 1c 13 78 02 ee 95 a3 54 4c 99 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 d5 2b 68 50 40 e0 2c 50 18 10
3a 00 1c bd 10 00 00 18 00 00 00 0f 00 00 00 00
00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 42 31 33 35 51 41 4e 30 31 2e 30 20 0a 01 e1

70 20 08 06 00 7e 00 05 3a 02 92 00 20 61 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 90

----------------

Block 0, Base EDID:
  EDID Structure Version & Revision: 1.4
  Vendor & Product Identification:
    Manufacturer: AUO
    Model: 4115
    Made in: 2018
  Basic Display Parameters & Features:
    Digital display
    Bits per primary color channel: 8
    DisplayPort interface
    Maximum image size: 28 cm x 19 cm
    Gamma: 2.20
    Supported color formats: RGB 4:4:4
    First detailed timing includes the native pixel format and preferred refresh rate
  Color Characteristics:
    Red  : 0.6396, 0.3300
    Green: 0.2998, 0.5996
    Blue : 0.1503, 0.0595
    White: 0.3134, 0.3291
  Established Timings I & II: none
  Standard Timings: none
  Detailed Timing Descriptors:
    DTD 1:  1128x1504   60.006 Hz   3:4    92.889 kHz 112.210 MHz (284 mm x 189 mm)
                 Hfront   24 Hsync  16 Hback  40 Hpol N
                 Vfront    3 Vsync  10 Vback  31 Vpol N
    Manufacturer-Specified Display Descriptor (0x0f): 00 0f 00 00 00 00 00 00 00 00 00 00 00 00 00 20 '............... '
    Alphanumeric Data String: 'AUO'
    Alphanumeric Data String: 'B135QAN01.0 '
  Extension blocks: 1
Checksum: 0xe1

----------------

Block 1, DisplayID Extension Block:
  Version: 2.0
  Extension Count: 0
  Display Product Primary Use Case: Presentation display
  Vendor-Specific Data Block (VESA):
    Data Structure Type: eDP
    Default Colorspace and EOTF Handling: sRGB
    Number of Pixels in Hor Pix Cnt Overlapping an Adjacent Panel: 0
    Multi-SST Operation: Two Streams (number of links shall be 2 or 4)
  Checksum: 0x61
Checksum: 0x90


-- 
Jani Nikula, Intel Open Source Graphics Center
