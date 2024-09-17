Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18F797ACA8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 10:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01E310E036;
	Tue, 17 Sep 2024 08:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzvyHrCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BAC10E036
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 08:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726560773; x=1758096773;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7Kle5a9wOMqN8UDepFNANk+zGmnMjICA/1L5POQIl0g=;
 b=mzvyHrCy8Sm4VUu7RzSLvnNGQ3vwdLVcJ1cdgUGGeaUEKJl4tWirSvBr
 k2KeCZtLuKi+pyOgKv5a9LLV3s0Okdx8Xzhy8eqmuNTyc10P/dhiS9J11
 B1Liz4whmOd6M8t4LyuxmQe5FSKC2W5Q7EcZE3CKq+HpqmL5W+ZkQL1wx
 xfna8OWyeH6xVNolLznhAcrnuW3LaLes/cSrp07OgSqpVyCfKmc+QIH+p
 qSvdHTdVO/aeR8YP0fTK2Bfnc3hMr4R4JhgAnkOvL8Y4aaoslowxQNt1j
 XcL5jJcWI+GIDo4cnaVVuy5IHOMNnaqtX9s3IRYQZvKJnQ3is9Lw5aO6v Q==;
X-CSE-ConnectionGUID: eiUxtDEvRVajOKhaxMqvfA==
X-CSE-MsgGUID: EJ5EvQefQHKiqLHP6/AC1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="42919997"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="42919997"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 01:12:52 -0700
X-CSE-ConnectionGUID: v3yk2sDeTC6MD9u8ef2dfg==
X-CSE-MsgGUID: OZWlPFBFR1+JejZ0UuPlUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="92409242"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 01:12:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Derek Foreman <derek.foreman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, Helge Deller
 <deller@gmx.de>, linux-fbdev@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v4] drm/connector: hdmi: Fix writing Dynamic Range
 Mastering infoframes
In-Reply-To: <01020191faa595af-dba2cbbd-d487-4837-a923-7844fae7c1de-000000@eu-west-1.amazonses.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240827163918.48160-1-derek.foreman@collabora.com>
 <87cyltyros.fsf@intel.com>
 <01020191faa595af-dba2cbbd-d487-4837-a923-7844fae7c1de-000000@eu-west-1.amazonses.com>
Date: Tue, 17 Sep 2024 11:12:46 +0300
Message-ID: <87ed5id7gh.fsf@intel.com>
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

On Mon, 16 Sep 2024, Derek Foreman <derek.foreman@collabora.com> wrote:
> Gentle ping - is there anything more I need to do before this can land?

I don't think so. FWIW, I bounced this to intel-gfx and got passing CI
results too.

Cc: drm-misc maintainers. Just wondering where to merge this. It's a fix
to commits in v6.11. Are you still planning on a drm-misc-next-fixes
pull request for v6.12-rc1? That would be the quickest way to get this
upstream.

BR,
Jani.


>
> Thanks,
> Derek
>
> On 2024-08-28 03:31, Jani Nikula wrote:
>> On Tue, 27 Aug 2024, Derek Foreman <derek.foreman@collabora.com> wrote:
>>> The largest infoframe we create is the DRM (Dynamic Range Mastering)
>>> infoframe which is 26 bytes + a 4 byte header, for a total of 30
>>> bytes.
>>>
>>> With HDMI_MAX_INFOFRAME_SIZE set to 29 bytes, as it is now, we
>>> allocate too little space to pack a DRM infoframe in
>>> write_device_infoframe(), leading to an ENOSPC return from
>>> hdmi_infoframe_pack(), and never calling the connector's
>>> write_infoframe() vfunc.
>>>
>>> Instead of having HDMI_MAX_INFOFRAME_SIZE defined in two places,
>>> replace HDMI_MAX_INFOFRAME_SIZE with HDMI_INFOFRAME_SIZE(MAX) and make
>>> MAX 27 bytes - which is defined by the HDMI specification to be the
>>> largest infoframe payload.
>>>
>>> Fixes: f378b77227bc ("drm/connector: hdmi: Add Infoframes generation")
>>> Fixes: c602e4959a0c ("drm/connector: hdmi: Create Infoframe DebugFS entries")
>>>
>> Superfluous blank line. Can be fixed while applying.
>>
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>
>>
>>> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
>>> ---
>>>   drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 +---
>>>   drivers/gpu/drm/drm_debugfs.c                   | 4 +---
>>>   include/linux/hdmi.h                            | 9 +++++++++
>>>   3 files changed, 11 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>>> index 7854820089ec..feb7a3a75981 100644
>>> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>>> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>>> @@ -521,8 +521,6 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>>>   }
>>>   EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
>>>   
>>> -#define HDMI_MAX_INFOFRAME_SIZE		29
>>> -
>>>   static int clear_device_infoframe(struct drm_connector *connector,
>>>   				  enum hdmi_infoframe_type type)
>>>   {
>>> @@ -563,7 +561,7 @@ static int write_device_infoframe(struct drm_connector *connector,
>>>   {
>>>   	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
>>>   	struct drm_device *dev = connector->dev;
>>> -	u8 buffer[HDMI_MAX_INFOFRAME_SIZE];
>>> +	u8 buffer[HDMI_INFOFRAME_SIZE(MAX)];
>>>   	int ret;
>>>   	int len;
>>>   
>>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>>> index 6b239a24f1df..9d3e6dd68810 100644
>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>> @@ -520,8 +520,6 @@ static const struct file_operations drm_connector_fops = {
>>>   	.write = connector_write
>>>   };
>>>   
>>> -#define HDMI_MAX_INFOFRAME_SIZE		29
>>> -
>>>   static ssize_t
>>>   audio_infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
>>>   {
>>> @@ -579,7 +577,7 @@ static ssize_t _f##_read_infoframe(struct file *filp, \
>>>   	struct drm_connector *connector; \
>>>   	union hdmi_infoframe *frame; \
>>>   	struct drm_device *dev; \
>>> -	u8 buf[HDMI_MAX_INFOFRAME_SIZE]; \
>>> +	u8 buf[HDMI_INFOFRAME_SIZE(MAX)]; \
>>>   	ssize_t len = 0; \
>>>   	\
>>>   	connector = filp->private_data; \
>>> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
>>> index 3bb87bf6bc65..455f855bc084 100644
>>> --- a/include/linux/hdmi.h
>>> +++ b/include/linux/hdmi.h
>>> @@ -59,6 +59,15 @@ enum hdmi_infoframe_type {
>>>   #define HDMI_DRM_INFOFRAME_SIZE    26
>>>   #define HDMI_VENDOR_INFOFRAME_SIZE  4
>>>   
>>> +/*
>>> + * HDMI 1.3a table 5-14 states that the largest InfoFrame_length is 27,
>>> + * not including the packet header or checksum byte. We include the
>>> + * checksum byte in HDMI_INFOFRAME_HEADER_SIZE, so this should allow
>>> + * HDMI_INFOFRAME_SIZE(MAX) to be the largest buffer we could ever need
>>> + * for any HDMI infoframe.
>>> + */
>>> +#define HDMI_MAX_INFOFRAME_SIZE    27
>>> +
>>>   #define HDMI_INFOFRAME_SIZE(type)	\
>>>   	(HDMI_INFOFRAME_HEADER_SIZE + HDMI_ ## type ## _INFOFRAME_SIZE)

-- 
Jani Nikula, Intel
