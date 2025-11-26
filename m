Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122B7C8A646
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC88D10E012;
	Wed, 26 Nov 2025 14:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=0la.ch header.i=@0la.ch header.b="n1RqwyqC";
	dkim=permerror (0-bit key) header.d=0la.ch header.i=@0la.ch header.b="3kTyR2ih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE22A10E012;
 Wed, 26 Nov 2025 14:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=0la.ch; c=relaxed/relaxed;
 h=From:To:Subject:Date:Message-ID; t=1764168069; bh=SbtXzmhcC0yTTttgmIST0I9
 9SrvnQllmE8i9G90uEsk=; b=n1RqwyqCdzxMBQqcNn4FwZN4JUMD2bTfxjqNxWixJ2b4AxZUyV
 8TXukpowX0SmcxFwkx6wSoWtZJ5wL25BcunvDMWr38iwuQIcU1nEvRCtWccJbNtGIGClWzQXp8L
 Jj6CWI/D2GtfDVSo+IpX8ZExB/9Tu9Bq7dmCmm/fRsdgSN8pqKip8lTA6uLO+5xDPDi3Z9dlJIp
 9IAlaQ4jwmGNWu7eRO80z4HKZnu1ArnBoiKU1nhmTG9661ch8+E18QPcPMOQkG999BnimPDW45i
 ha3E/Ul0F1ZGQd49o93P/2ywPQrKmg8MkfRIcwp/Orz80cENJ5OrwJ++DO4qE1RSj/w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=0la.ch; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1764168069;
 bh=SbtXzmhcC0yTTttgmIST0I9
 9SrvnQllmE8i9G90uEsk=; b=3kTyR2ihMCY/GE3U5T9QfbFORAC0ltcHS6fCUjWKbIkvq+kPTc
 sWJQ0vDT4z1ZJFJwEfw73mmsPlL9FerqTnDA==;
Message-ID: <2f847ef3-9fb9-46a1-b5bd-38d8498b7772@0la.ch>
Date: Wed, 26 Nov 2025 15:41:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/edid: prepare for VESA vendor-specific data
 block extension
To: Jani Nikula <jani.nikula@linux.intel.com>, Yaroslav Bolyukin
 <iam@lach.pw>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251126065126.54016-1-iam@lach.pw>
 <20251126065126.54016-3-iam@lach.pw>
 <68c55e772424f8e001898cdd1edcf4856820461e@intel.com>
 <41fbf5af-559a-4810-82c1-5c2e8a497e5b@0la.ch>
 <493bcd10bdfc8a3123323b77eead3dacadc08e3c@intel.com>
Content-Language: en-US
From: Yaroslav <iam@0la.ch>
In-Reply-To: <493bcd10bdfc8a3123323b77eead3dacadc08e3c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 2025-11-26 15:29, Jani Nikula wrote:
> On Wed, 26 Nov 2025, Yaroslav <iam@0la.ch> wrote:
> The failure mode is: Someone buys a new shiny laptop with eDP MSO, with
> bigger vendor block, and won't get a picture on screen.

I understand that, I'm only confused because this does seem to be as 
suitable for backport as this fixed DSC bpp thing is:

Someone buys a VR headset with fixed DSC bpp (Bigscreen Beyond/Bigscreen 
Beyond 2/Vive Pro 2), and the system is unable to detect them.

Unless eDP MSO with vendor specific data block extended with unset fixed 
DSC bpp value is much more popular in the wild, that is. I have however 
failed to discover any devices which have this value present other than 
the three mentioned VR headsets.

> BR,
> Jani.
> 
> 
