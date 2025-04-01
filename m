Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB4FA77D5D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 16:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6219610E5C0;
	Tue,  1 Apr 2025 14:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="fTRZxvJO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D92510E0F2;
 Tue,  1 Apr 2025 14:11:15 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZRqfl4vDPz9v2D;
 Tue,  1 Apr 2025 16:11:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1743516671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UWO4IkTvj6t5QznUa6gZEHXmK1+yMQe07LiOKe2edaI=;
 b=fTRZxvJOZg7fHaj4Wt4vzlS2WpArNGITZjTEEdY50nRTbZdPFNDzGwvTD8XSPVaFx7WDD0
 huF0Cmnw9jc+aOBEsdatvA6goeuYLVymNo/EdZb5cS6FsVZbs0VBs5dSlNtL6fVkTcJmDN
 CIF7PqV22Yr0kn/kV45dhevgBUGKjUr+TJ+2TzaUpsudUJ1nFkBnYJ86SB513zEhztHHTJ
 Xfe07BZqGUSc924643g3MoovdjHFJwJH00K1w9l4w9wrL7X5l4ns24lM8Mw30v24Y27E0b
 tVmqQBFRVgElTPLZjxTz6VjOqW0VUrNB14nvM9oYDvw0zbEzPP+YkO2NfcopsA==
Message-ID: <fd0440ba-1a34-4cad-9e89-701dec7673b4@mailbox.org>
Date: Tue, 1 Apr 2025 16:11:04 +0200
MIME-Version: 1.0
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: Shengyu Qu <wiagn233@outlook.com>, Alex Hung <alex.hung@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
 <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
 <63d2a14e-759f-44b6-99b4-de42b8d6b1e0@mailbox.org>
 <TYCPR01MB8437C142C860FA03F06B5E6998AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <TYCPR01MB8437C142C860FA03F06B5E6998AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 66f552388c84b4d4a59
X-MBO-RS-META: t93rft34tqkqyyekdk69x3gmz7bc1iz5
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

On 2025-04-01 14:32, Shengyu Qu wrote:
> 在 2025/4/1 17:56, Michel Dänzer 写道:
>> On 2025-03-31 19:42, Alex Hung wrote:
>>> On 3/31/25 11:04, Shengyu Qu wrote:
>>>> Or we can add some kind of "linked with" info to plane's COLOR_PIPELINE property, to let userspace know that cursor plane and background plane share the same colorop config. So that userspace could do extra conversion on cursor image data to avoid display wrong cursor color.
>>>
>>> That's over-complicate and makes little sense for both device drivers and userspace applications.
>>>
>>> If any planes share same colorop config, a device driver exposes the same color pipeline with the same colorops.
>>>
>>> If a plane does not support color pipeline or a driver doesn't want to support it, there is no color pipeline and no color objects.
>>
>> I suspect using the cursor plane is generally higher priority for Wayland compositors than using overlay planes, because the former is critical for a responsive user experience.
>>
>> This requires that the amdgpu DC driver backs the cursor plane with a dedicated HW plane though (as it's already doing in some cases), to either fully support color pipelines for the cursor plane, or at least provide proper "no color pipeline" behaviour for it. Letting the effective behaviour be determined by the other planes which happen to be behind the cursor plane isn't usable for Wayland compositors.
> Current behavior is just disable colorop for both background plane and cursor plane. 

Are you saying the color pipeline is implicitly disabled for any KMS planes which happen to be overlapped by the cursor plane?

That sounds like a no go.


> I'm not sure how much planes does the hardware support, but if there are too less planes to use, maybe we still need to make use of the cursor background plane in the compositor.

If the HW has too few planes to allow both the cursor & overlay planes to work correctly (regardless of their dimensions), the driver should not allow enabling both kinds of planes at the same time.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
