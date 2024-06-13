Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768249077A7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 18:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D93410E02F;
	Thu, 13 Jun 2024 15:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fXxiS3lG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F5010E02F;
 Thu, 13 Jun 2024 15:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3wI79EVibt43SH4PGZp+2uUA06kDU+dXqyZcd/qYGqo=; b=fXxiS3lGkDP8JmTivSEswlAbfA
 zLgBJjYIiwA6Q0FynVr18Y/ep7JICV4keZLGHXWY3xHC5g33QvtsoQ9Lld9HK5BstOkv/mZ+eRuyN
 HdlxUqKeTtnfthHlj/sXHV6rOYkbFwlUx5um1KdzOdJNBfgMm3Xcm3dzH5LpT8eHtENLrmga1fIWB
 WfV4GKoe3hhhTaDdU+31IJxmw8VmdM/XEMgNJeH7NQyxGae1B5kjfyn3XXAktJo2vn/DA/N7zr2IN
 gOLSqJUtleYwHOtQi1YkjIdgMctEQLUSz8maeh2S/IL55y9RHeCDghkPfMjFOrQxYeoLsEgL2QChE
 zJqaQ9qA==;
Received: from [177.172.124.193] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sHmrZ-002nFO-HR; Thu, 13 Jun 2024 17:59:45 +0200
Message-ID: <2a0cd195-b64a-40b5-ba46-364f6f6e0d0f@igalia.com>
Date: Thu, 13 Jun 2024 12:59:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm: Allow drivers to choose plane types to async
 flip
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20240612193713.167448-1-andrealmeid@igalia.com>
 <20240612193713.167448-3-andrealmeid@igalia.com>
 <pu4nawhvy52imqgpib4lx3s5lsbatmfrq3e7aa4zxfmewt6xrn@ki7woraegakt>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <pu4nawhvy52imqgpib4lx3s5lsbatmfrq3e7aa4zxfmewt6xrn@ki7woraegakt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Dmitry,

Em 12/06/2024 17:45, Dmitry Baryshkov escreveu:
> On Wed, Jun 12, 2024 at 04:37:12PM -0300, André Almeida wrote:
>> Different planes may have different capabilities of doing async flips,
>> so create a field to let drivers allow async flip per plane type.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c | 4 ++--
>>   drivers/gpu/drm/drm_plane.c       | 3 +++
>>   include/drm/drm_plane.h           | 5 +++++
>>   3 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> index 57662a1fd345..bbcec3940636 100644
>> --- a/drivers/gpu/drm/drm_plane.c
>> +++ b/drivers/gpu/drm/drm_plane.c
>> @@ -385,6 +385,9 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>>   
>>   	drm_modeset_lock_init(&plane->mutex);
>>   
>> +	if (type == DRM_PLANE_TYPE_PRIMARY)
>> +		plane->async_flip = true;
>> +
> 
> Why? Also note that the commit message writes about adding the field,
> not about enabling it for the primary planes.
> 

This is not meant to have any function change actually, just to enable 
per-plane configuration. Currently, any driver that supports async page 
flip in atomic API supports flipping the primary plane.

But as Ville pointed out, that belongs to driver code, so I'll move 
there, hope that it makes more clear

>>   	plane->base.properties = &plane->properties;
>>   	plane->dev = dev;
>>   	plane->funcs = funcs;
> 
> 
