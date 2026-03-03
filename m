Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPeyORgUp2n9dQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:02:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D1C1F45AF
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F43510E871;
	Tue,  3 Mar 2026 17:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="yT+rKsO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D956610E871
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 17:02:11 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fQMXw2kcpz9ty2;
 Tue,  3 Mar 2026 18:02:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772557328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TkFz1dpQpWZ/PnNaBEvKOgiDKplU1Wb7XSM1S4gYrzE=;
 b=yT+rKsO8vPRsxJgDSO0tTOvWUcPsQmgyI8HqhmI+NIrWuHPy9qMSCvE43Um8GEw9w8695e
 zkwaCMEEGgXVBeyWmBqoJ4KbmvyXmcFBHeMPkHIidrQ3sVhXzHjKd5ubhCca/NHJ6RW9nG
 8htGC7yZaYa8Z8KaWOoKBBGZYER2pcQHCl25oBF5pNdXjl9LxygG0be75L66sEKECXOLdT
 tsMMw3mUj2A5Qo2ZquFzL28iXN6B7t3CunnWn1oh5KFiQUkg2qfVrkF06PIO31QhFRh5dH
 k+0PfkzJXuXFvrkkhLL/toWV1TjIQ6eXNRakZ8BJ/mpA14S85VnNmPTr5BH1/w==
Message-ID: <d7928937-176a-4b5a-8890-92639f6977b7@mailbox.org>
Date: Tue, 3 Mar 2026 18:02:04 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: Julian Orth <ju.orth@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
 <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
 <5a816b1b-fae3-42d9-95eb-b1706a91d138@linux.intel.com>
 <CAHijbEUvGm1On6YEhrEuWDv1iWAKa1e+sm9a6ywerWoUg7X9bA@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <CAHijbEUvGm1On6YEhrEuWDv1iWAKa1e+sm9a6ywerWoUg7X9bA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c7ac7d6a695afd57a12
X-MBO-RS-META: 956ruwp1f4m1npiopkwcrud7o58pzg5e
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
X-Rspamd-Queue-Id: 46D1C1F45AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ju.orth@gmail.com,m:maarten.lankhorst@linux.intel.com,m:christian.koenig@amd.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:juorth@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Action: no action

On 3/3/26 16:21, Julian Orth wrote:
> On Tue, Mar 3, 2026 at 4:15 PM Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>>
>> Hey,
>>
>> Den 2026-03-03 kl. 15:59, skrev Christian König:
>>> On 3/3/26 15:53, Maarten Lankhorst wrote:
>>>> Hey,
>>>>
>>>> Den 2026-03-01 kl. 13:34, skrev Julian Orth:
>>>>> Consider the following application:
>>>>>
>>>>>     #include <fcntl.h>
>>>>>     #include <string.h>
>>>>>     #include <drm/drm.h>
>>>>>     #include <sys/ioctl.h>
>>>>>
>>>>>     int main(void) {
>>>>>         int fd = open("/dev/dri/renderD128", O_RDWR);
>>>>>         struct drm_syncobj_create arg1;
>>>>>         ioctl(fd, DRM_IOCTL_SYNCOBJ_CREATE, &arg1);
>>>>>         struct drm_syncobj_handle arg2;
>>>>>         memset(&arg2, 1, sizeof(arg2)); // simulate dirty stack
>>>>>         arg2.handle = arg1.handle;
>>>>>         arg2.flags = 0;
>>>>>         arg2.fd = 0;
>>>>>         arg2.pad = 0;
>>>>>         // arg2.point = 0; // userspace is required to set point to 0
>>>>>         ioctl(fd, DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD, &arg2);
>>>>>     }
>>>>>
>>>>> The last ioctl returns EINVAL because args->point is not 0. However,
>>>>> userspace developed against older kernel versions is not aware of the
>>>>> new point field and might therefore not initialize it.
>>>>>
>>>>> The correct check would be
>>>>>
>>>>>     if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
>>>>>         return -EINVAL;
>>>>>
>>>>> However, there might already be userspace that relies on this not
>>>>> returning an error as long as point == 0. Therefore use the more lenient
>>>>> check.
>>>>>
>>>>> Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
>>>>> Signed-off-by: Julian Orth <ju.orth@gmail.com>
>>>>
>>>> I'm not convinced this is the correct fix.
>>>> Userspace built before the change had the old size for drm_syncobj_create,
>>>> the size is encoded into the ioctl, and zero extended as needed.
>>>>
>>>> See drivers/gpu/drm/drm_ioctl.c:
>>>>      out_size = in_size = _IOC_SIZE(cmd);
>>>>      ...
>>>>      if (ksize > in_size)
>>>>              memset(kdata + in_size, 0, ksize - in_size);
>>>>
>>>> This is a bug in a newly built app, and should be handled by explicitly zeroing
>>>> the entire struct or using named initializers, and only setting specific members
>>>> as required.
>>>>
>>>> In particular, apps built before the change will never encounter this bug.
>>>
>>> Yeah, I've realized that after pushing the patch as well.
>>>
>>> But I still think this patch is the right thing to do, because without requesting the functionality by setting the flag the point should clearly not have any effect at all.
>>>
>>> And when an application would have only explicitly assigned the fields known previously and then later been compiled with the new points field it would have failed.
>>>
>>> It is good practice to memset() structures given to the kernel so that all bytes are zero initialized, but it is not documented as mandatory as far as I know.
>> I know that in case of xe, even padding members are tested for being zero. For new code it's
>> explicitly recommended to test to prevent running into undefined behavior. In some cases
>> data may look valid, even if it's just random garbage from the stack.
> 
> This isn't about padding fields. This is about a new field that was
> added to the struct, increasing its size. Existing code could not have
> zero-initialized that field except by using memset or something
> equivalent. As long as the requirement to use memset is not
> documented, requiring existing code to use memset is a breaking change
> because code that didn't use memset always worked until the new field
> was added.

It's always been effectively mandatory, it's not a breaking change.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
