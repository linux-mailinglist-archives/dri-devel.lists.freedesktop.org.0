Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE217CB0551
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0ACC10E5E6;
	Tue,  9 Dec 2025 14:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nEr9/mgf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qBuR22jO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nEr9/mgf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qBuR22jO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8E610E1E1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 14:51:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 624A9337DA;
 Tue,  9 Dec 2025 14:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765291882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uEamXISE226F8CKyoiNdbyfo3vNx+AfdWIHPalE0jXQ=;
 b=nEr9/mgfk1tIOer4Sa70I2RaC8eaCDiS5H1cHlpkcrBWTauczdva1QYgr/xMUfNZdERv5n
 3O7YnQDL5yP0oMZ8+zORhAYmtLtv7YXegoyLwActY+6iK4x2u6HT4iBFs0Uyw/cx6scFOQ
 90uriauh+tGmsn3asyXHUdoi02Sin0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765291882;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uEamXISE226F8CKyoiNdbyfo3vNx+AfdWIHPalE0jXQ=;
 b=qBuR22jOB0dZQAdT/plZi3oWA3eBteFG5gOz2VFBqkasSRxnezDglpdDnXg+1aRojY2nNM
 Q6PwVBhJ5NoRO9AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765291882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uEamXISE226F8CKyoiNdbyfo3vNx+AfdWIHPalE0jXQ=;
 b=nEr9/mgfk1tIOer4Sa70I2RaC8eaCDiS5H1cHlpkcrBWTauczdva1QYgr/xMUfNZdERv5n
 3O7YnQDL5yP0oMZ8+zORhAYmtLtv7YXegoyLwActY+6iK4x2u6HT4iBFs0Uyw/cx6scFOQ
 90uriauh+tGmsn3asyXHUdoi02Sin0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765291882;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uEamXISE226F8CKyoiNdbyfo3vNx+AfdWIHPalE0jXQ=;
 b=qBuR22jOB0dZQAdT/plZi3oWA3eBteFG5gOz2VFBqkasSRxnezDglpdDnXg+1aRojY2nNM
 Q6PwVBhJ5NoRO9AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9568C3EA63;
 Tue,  9 Dec 2025 14:51:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qOT9Imk3OGlAaAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 14:51:21 +0000
Message-ID: <2b95d76e-2672-4cae-a545-73c407f2b20c@suse.de>
Date: Tue, 9 Dec 2025 15:51:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 00/13] drm: Introduce GEM-UMA memory management
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, ogabbay@kernel.org, mamin506@gmail.com,
 lizhi.hou@amd.com, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-doc@vger.kernel.org
References: <20251209140141.94407-1-tzimmermann@suse.de>
 <20251209152734.6851f3ac@fedora>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20251209152734.6851f3ac@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.991]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; MIME_TRACE(0.00)[0:+];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[28]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,tomeuvizoso.net,imgtec.com,arm.com,collabora.com,igalia.com,redhat.com,chromium.org,lwn.net,lists.freedesktop.org,lists.linux.dev,vger.kernel.org];
 R_RATELIMIT(0.00)[to_ip_from(RLzxzh56npx61idbi11ft8b9pb)];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url, imap1.dmz-prg2.suse.org:helo,
 gitlab.freedesktop.org:url, suse.de:email, suse.de:mid]
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

Hi

Am 09.12.25 um 15:27 schrieb Boris Brezillon:
> On Tue,  9 Dec 2025 14:41:57 +0100
> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>> Duplicate GEM-SHMEM to GEM-UMA. Convert all DRM drivers for UMA
>> systems if they currently use GEM-SHMEM.
>>
>> Many DRM drivers for hardware with Unified Memory Architecture (UMA)
>> currently builds upon GEM-SHMEM and extends the helpers with features
>> for managing the GPU MMU. This allows the GPU to access the GEM buffer
>> content for its operation.
>>
>> There is another, larger, set of DRM drivers that use GEM-SHMEM merely
>> as buffer management with no hardware support. These drivers copy the
>> buffer content to the GPU on each page flip. The GPU itself has no direct
>> access. Hardware of this type is usually in servers, behind slow busses
>> (SPI, USB), or provided by firmware (drivers in sysfb/).
>>
>> After some discussion with Boris on the future of GEM-SHMEM, it seems
>> to me that both use cases more and more diverge from each other. The
>> most prominent example is the implementation of gem_prime_import,
>> where both use cases use distinct approaches.
>>
>> So we discussed the introduction of a GEM-UMA helper library for
>> UMA-based hardware. GEM-UMA will remain flexible enough for drivers
>> to extend it for their use case. GEM-SHMEM will become focused on the
>> simple-hardware use case. The benefit for both libraries is that they
>> will be easier to understand and maintain. GEM-SHMEM can be simplified
>> signiifcantly, I think.
>>
>> This RFC series introduces GEM-UMA and converts the UMA-related drivers.
>>
>> Patches 1 and 2 fix issues in GEM-SHMEM, so that we don't duplicate
>> errornous code.
>>
>> Patch 3 copies GEM-SHMEM to GEM-UMA. Patch 4 then does soem obvious
>> cleanups of unnecessary code.
> Instead of copying the code as-is, I'd rather take a step back and think
> about what we need and how we want to handle more complex stuff, like
> reclaim. I've started working on a shrinker for panthor [1], and as part
> of this series, I've added a commit implementing just enough to replace
> what gem-shmem currently provides. Feels like the new GEM-UMA thing
> could be designed on a composition rather than inheritance model,
> where we have sub-components (backing, cpu_map, gpu_map) that can be
> pulled in and re-used by the driver implementation. The common helpers
> would take those sub-components instead of a plain GEM object. That
> would leave the drivers free of how their internal gem_object fields are
> laid out and wouldn't require overloading the ->gem_create_object()
> function. It seems to be that it would better match the model you were
> describing the other day.

Yeah, I've seen your update to that series. Making individual parts of 
the memory manager freely composable with each other is a fine idea.

But the flipside is that I also want the simple drivers to move away 
from the flexible approach that GEM-SHMEM currently takes. There are 
many drivers that do not need or want that. These drivers benefit from 
something that is self contained. Many of the drivers are also hardly 
maintained, so simplifying things will also be helpful.

I could have added a new GEM implementation for these drivers, but there 
are less UMA drivers to convert and the GEM-UMA naming generally fits 
better than GEM-SHMEM.

I'd rather have GEM-UMA and evolve it from where it stands now; and also 
evolve GEM-SHMEM in a different direction. There's a difference in 
concepts here.

Best regards
Thomas

>
>> Patches 5 to 13 update the drivers that can be converted to GEM-UMA.
>> These changes are just symbol renaming. There are so far no functional
>> differences between the memory managers.
>>
>> A gave GEM-UMA some smoke testing by running virtgpu.
> [1]https://gitlab.freedesktop.org/bbrezillon/linux/-/commits/panthor-shrinker-revisited/drivers?ref_type=heads
> [2]https://gitlab.freedesktop.org/bbrezillon/linux/-/commit/4e6927fc2c60265b77a5a88013f55377bc4f4ab3
>
>> Thomas Zimmermann (13):
>>    drm/gem-shmem: Fix typos in documentation
>>    drm/gem-shmem: Fix the MODULE_LICENSE() string
>>    drm: Add GEM-UMA helpers for memory management
>>    drm/gem-uma: Remove unused interfaces
>>    drm/imagination: Use GEM-UMA helpers for memory management
>>    drm/lima: Use GEM-UMA helpers for memory management
>>    drm/panfrost: Use GEM-UMA helpers for memory management
>>    drm/panthor: Use GEM-UMA helpers for memory management
>>    drm/v3d: Use GEM-UMA helpers for memory management
>>    drm/virtgpu: Use GEM-UMA helpers for memory management
>>    accel/amdxdna: Use GEM-UMA helpers for memory management
>>    accel/ivpu: Use GEM-UMA helpers for memory management
>>    accel/rocket: Use GEM-UMA helpers for memory management
>>
>>   Documentation/gpu/drm-mm.rst                  |  12 +
>>   drivers/accel/amdxdna/Kconfig                 |   2 +-
>>   drivers/accel/amdxdna/aie2_ctx.c              |   1 -
>>   drivers/accel/amdxdna/aie2_message.c          |   1 -
>>   drivers/accel/amdxdna/aie2_pci.c              |   1 -
>>   drivers/accel/amdxdna/aie2_psp.c              |   1 -
>>   drivers/accel/amdxdna/aie2_smu.c              |   1 -
>>   drivers/accel/amdxdna/amdxdna_ctx.c           |   7 +-
>>   drivers/accel/amdxdna/amdxdna_gem.c           |  49 +-
>>   drivers/accel/amdxdna/amdxdna_gem.h           |   5 +-
>>   .../accel/amdxdna/amdxdna_mailbox_helper.c    |   1 -
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c       |   1 -
>>   drivers/accel/amdxdna/amdxdna_sysfs.c         |   1 -
>>   drivers/accel/ivpu/Kconfig                    |   2 +-
>>   drivers/accel/ivpu/ivpu_gem.c                 |  36 +-
>>   drivers/accel/ivpu/ivpu_gem.h                 |   4 +-
>>   drivers/accel/rocket/Kconfig                  |   2 +-
>>   drivers/accel/rocket/rocket_gem.c             |  46 +-
>>   drivers/accel/rocket/rocket_gem.h             |   6 +-
>>   drivers/gpu/drm/Kconfig                       |   9 +
>>   drivers/gpu/drm/Kconfig.debug                 |   1 +
>>   drivers/gpu/drm/Makefile                      |   4 +
>>   drivers/gpu/drm/drm_fbdev_uma.c               | 203 +++++
>>   drivers/gpu/drm/drm_gem_shmem_helper.c        |   5 +-
>>   drivers/gpu/drm/drm_gem_uma_helper.c          | 787 ++++++++++++++++++
>>   drivers/gpu/drm/imagination/Kconfig           |   4 +-
>>   drivers/gpu/drm/imagination/pvr_drv.c         |   2 +-
>>   drivers/gpu/drm/imagination/pvr_free_list.c   |   2 +-
>>   drivers/gpu/drm/imagination/pvr_gem.c         |  74 +-
>>   drivers/gpu/drm/imagination/pvr_gem.h         |  12 +-
>>   drivers/gpu/drm/lima/Kconfig                  |   4 +-
>>   drivers/gpu/drm/lima/lima_drv.c               |   2 +-
>>   drivers/gpu/drm/lima/lima_gem.c               |  30 +-
>>   drivers/gpu/drm/lima/lima_gem.h               |   6 +-
>>   drivers/gpu/drm/panfrost/Kconfig              |   2 +-
>>   drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
>>   drivers/gpu/drm/panfrost/panfrost_gem.c       |  30 +-
>>   drivers/gpu/drm/panfrost/panfrost_gem.h       |   6 +-
>>   .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  30 +-
>>   drivers/gpu/drm/panfrost/panfrost_mmu.c       |   8 +-
>>   drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |   6 +-
>>   drivers/gpu/drm/panthor/Kconfig               |   2 +-
>>   drivers/gpu/drm/panthor/panthor_drv.c         |   2 +-
>>   drivers/gpu/drm/panthor/panthor_fw.c          |   4 +-
>>   drivers/gpu/drm/panthor/panthor_gem.c         |  40 +-
>>   drivers/gpu/drm/panthor/panthor_gem.h         |   8 +-
>>   drivers/gpu/drm/panthor/panthor_mmu.c         |  10 +-
>>   drivers/gpu/drm/panthor/panthor_sched.c       |   1 -
>>   drivers/gpu/drm/tests/Makefile                |   1 +
>>   drivers/gpu/drm/tests/drm_gem_uma_test.c      | 385 +++++++++
>>   drivers/gpu/drm/v3d/Kconfig                   |   2 +-
>>   drivers/gpu/drm/v3d/v3d_bo.c                  |  45 +-
>>   drivers/gpu/drm/v3d/v3d_drv.h                 |   4 +-
>>   drivers/gpu/drm/v3d/v3d_mmu.c                 |   9 +-
>>   drivers/gpu/drm/virtio/Kconfig                |   4 +-
>>   drivers/gpu/drm/virtio/virtgpu_drv.c          |   4 +-
>>   drivers/gpu/drm/virtio/virtgpu_drv.h          |  12 +-
>>   drivers/gpu/drm/virtio/virtgpu_object.c       |  64 +-
>>   drivers/gpu/drm/virtio/virtgpu_plane.c        |   6 +-
>>   drivers/gpu/drm/virtio/virtgpu_vq.c           |   6 +-
>>   include/drm/drm_fbdev_uma.h                   |  20 +
>>   include/drm/drm_gem_uma_helper.h              | 293 +++++++
>>   62 files changed, 2018 insertions(+), 312 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_fbdev_uma.c
>>   create mode 100644 drivers/gpu/drm/drm_gem_uma_helper.c
>>   create mode 100644 drivers/gpu/drm/tests/drm_gem_uma_test.c
>>   create mode 100644 include/drm/drm_fbdev_uma.h
>>   create mode 100644 include/drm/drm_gem_uma_helper.h
>>
>>
>> base-commit: 0a21e96e0b6840d2a4e0b45a957679eeddeb4362
>> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
>> prerequisite-patch-id: a5a973e527c88a5b47053d7a72aefe0b550197cb
>> prerequisite-patch-id: 719d09751d38f5da743beed6266585ee063e1e29
>> prerequisite-patch-id: 0bbc85bc6b528c32592e07f4ceafa51795c4cad9
>> prerequisite-patch-id: c856d9c8a026e3244c44ec829e426e0ad4a685ab
>> prerequisite-patch-id: 13441c9ed3062ae1448a53086559dfcbbd578177
>> prerequisite-patch-id: 951c039657c1f58e4b6e36bc01c7a1c69ed59767
>> prerequisite-patch-id: 4370b8b803ca439666fb9d2beb862f6e78347ce3
>> prerequisite-patch-id: ebbaad226ed599f7aad4784fb3f4aaebe34cb110
>> prerequisite-patch-id: cb907c3e3e14de7f4d13b429f3a2a88621a8a9fe
>> prerequisite-patch-id: 0e243b426742122b239af59e36d742da5795a8b1
>> prerequisite-patch-id: 120f97fa1af9891375a0dcf52c51c1907b01fe6a

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


