Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB19686F477
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 11:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119A410F97C;
	Sun,  3 Mar 2024 10:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay163.nicmail.ru (relay163.nicmail.ru [91.189.117.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467A210E8E3;
 Fri,  1 Mar 2024 18:56:47 +0000 (UTC)
Received: from [10.28.138.152] (port=9840 helo=[192.168.95.111])
 by relay.hosting.mail.nic.ru with esmtp (Exim 5.55)
 (envelope-from <kiryushin@ancud.ru>) id 1rg83n-0005PA-BC;
 Fri, 01 Mar 2024 21:56:43 +0300
Received: from [87.245.155.195] (account kiryushin@ancud.ru HELO
 [192.168.95.111]) by incarp1104.mail.hosting.nic.ru (Exim 5.55)
 with id 1rg83n-00A9hx-1J; Fri, 01 Mar 2024 21:56:43 +0300
Message-ID: <ecfb0f31-a454-4a51-9fb8-9cd0aca3195c@ancud.ru>
Date: Fri, 1 Mar 2024 21:56:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikita Kiryushin <kiryushin@ancud.ru>
Subject: Re: [PATCH] drm/i915: Remove unneeded double drm_rect_visible call in
 check_overlay_dst
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Manasi Navare <manasi.d.navare@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <> <79c92cfa-cf5a-4a23-8a93-11c1af7432fc@ancud.ru>
 <ZeB45WKv4lP8QQpv@intel.com>
Content-Language: en-US
In-Reply-To: <ZeB45WKv4lP8QQpv@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MS-Exchange-Organization-SCL: -1
X-Mailman-Approved-At: Sun, 03 Mar 2024 10:45:57 +0000
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

On 2/29/24 15:30, Ville Syrjälä wrote:
> I prefer the current way where we have no side effects in
> the if statement.
>

This seem like a valid concern from readability and maintainability 
standpoint. My patch was aimed mostly at performance and maintainability 
using tools: some more pedantic analyzers are sensitive to non-checked 
return values (as of now, drm_rect_intersect is ignored).

Would it be a better idea to make an update to the patch with second 
drm_rect_visible call changed to an appropriately named state flag set 
with drm_rect_intersect result?

BTW, the original patch somehow got mangled while it made its way to the 
patchwork: source list line in patch got broken, which permits the patch 
from being applied (the original version did not have that line break). 
Any ideas how to prevent this happening with the second version of patch 
(in case the idea is viable)?
