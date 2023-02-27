Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72616A4556
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 15:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAD510E41C;
	Mon, 27 Feb 2023 14:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F24710E41C;
 Mon, 27 Feb 2023 14:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677509850; x=1709045850;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=n09h7oekFFY75v77nbSeS9sGleQOMZ8q7e6IyymQHpk=;
 b=RW9L6oWhPm7m0xr1IbQxtfYEYW+8bVa+lg5uBLO2zTT+UcfS/4TbieK3
 vetbJ0VGnG+7W9CXQEcD1QcxyoL8iGKEnh5155xVaBbBqU0TLciW++VaJ
 xNQwMBOVan4NC0VZD4enUBMIoGRTIRzsjFNW0rKxhaWq9EeuhnfFoFgSl
 rTCRcA2HbNg3Z/AB14Q7KcTj6sU/M0lBtsDHWLi2vN/P2JJHJjuXj3qQo
 NZvd9KnT6hnZVuNexbZmmYokJE5jct/7dgQaxgM5oqKWN6DlX0/Ek8xfz
 YAFP4V5j0e47IgFsQPpuSsfJ1w10OWpiwslP8ZeZ9qBGeMPOSwYS7zAhJ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="333918301"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="333918301"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 06:57:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="704066659"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="704066659"
Received: from jkaisrli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.158])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 06:57:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/4] drm/displayid: use primary use case to figure out
 non-desktop
In-Reply-To: <a6feedc9-7a97-dc61-b2d6-02b93b7edfa0@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1676580180.git.jani.nikula@intel.com>
 <ed745bf1-eeca-6431-b828-e0f51b8bad30@collabora.com>
 <992eefe3-1ab8-b8ba-02d4-9bb9f9755688@collabora.com>
 <a6feedc9-7a97-dc61-b2d6-02b93b7edfa0@collabora.com>
Date: Mon, 27 Feb 2023 16:57:25 +0200
Message-ID: <87bklf17hm.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Iaroslav Boliukin <iam@lach.pw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Feb 2023, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> On 2/21/23 19:29, Dmitry Osipenko wrote:
>> On 2/20/23 18:44, Dmitry Osipenko wrote:
>>> On 2/16/23 23:44, Jani Nikula wrote:
>>>> Mostly this is prep work and plumbing for easier use of displayid
>>>> structure version and primary use case for parsing the displayid blocks,
>>>> but it can be nicely used for figuring out non-desktop too.
>>>>
>>>> Completely untested. :)
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>>> Cc: Iaroslav Boliukin <iam@lach.pw>
>>>> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>>
>>>> Jani Nikula (4):
>>>>   drm/displayid: add displayid_get_header() and check bounds better
>>>>   drm/displayid: return struct displayid_header from
>>>>     validate_displayid()
>>>>   drm/displayid: provide access to DisplayID version and primary use
>>>>     case
>>>>   drm/edid: update non-desktop use also from DisplayID
>>>>
>>>>  drivers/gpu/drm/drm_displayid.c | 62 ++++++++++++++++++++++++++++-----
>>>>  drivers/gpu/drm/drm_edid.c      | 25 +++++++++++++
>>>>  include/drm/drm_displayid.h     | 12 ++++++-
>>>>  3 files changed, 89 insertions(+), 10 deletions(-)
>>>>
>>>
>>> It works now without the EDID quirk, thanks!
>>>
>>> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>
>> 
>> I'm going to apply this to misc-next later this week if there won't be
>> any objections.
>> 
>
> Applied all 5 patches to misc-next

Thanks for the review and pushing!

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
