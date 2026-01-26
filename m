Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CjJDV7Pd2mxlQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:32:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB938D18D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C612E10E1B8;
	Mon, 26 Jan 2026 20:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fdSZ9Yz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D779810E1B8;
 Mon, 26 Jan 2026 20:32:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 003E260097;
 Mon, 26 Jan 2026 20:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0357FC116C6;
 Mon, 26 Jan 2026 20:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769459544;
 bh=Kct5uNwur9iEeicofZltm6kKuWaD1l3RDwm4sZ7w7fM=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=fdSZ9Yz3hn9Br6jIDDI1HBU4TogWfYgEuqCZXW3SZql7/swoLPvTUzmBjVpUlLy70
 A7sh25H5qYC9MNrH8qEFlFIo7b5Y064Ap/ztNzfa/JKICZTXRFti93wGi4dSI1ZUnF
 V4PxLwfX4HmgtNCauvEaHc9KgAbz1COads9r+87zDsmxQ14YrO2Pt7XzpRHk+Xi/pj
 ZdlU7wLiPMA88w6OgLP2so/29Ig0vBhPJWVMXzPAqhgfEkh7nS4iEZZZ1vFI54EqLg
 Dz09jdY+oufuCHmlEMTVBeKBe88OK6CXK+t1uZP5Na8YI3jWtBL8OI06CMBwIvPUe0
 GfvRbmsCTQkNg==
Message-ID: <ad3e0556-385b-471e-bb1c-43bd043ecf47@kernel.org>
Date: Mon, 26 Jan 2026 14:32:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amdgpu: Fix TLB flush failures after hibernation
 resume
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>,
 "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ionut_n2001@yahoo.com, linux-kernel@vger.kernel.org
References: <20260106125929.25214-6-sunlightlinux@gmail.com>
 <77fa0344-3507-420e-9d77-d454ace55cfd@amd.com>
 <20260126194057.7376-2-sunlightlinux@gmail.com>
 <CADnq5_MSvWLVqhgkdaYn6bjPC2L2=jf5v=h3n1cx=ZYgnXLQPQ@mail.gmail.com>
 <e8e1e479-0c13-40f2-b9be-d87e4503dcb4@kernel.org>
Content-Language: en-US
In-Reply-To: <e8e1e479-0c13-40f2-b9be-d87e4503dcb4@kernel.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,yahoo.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DCB938D18D
X-Rspamd-Action: no action



On 1/26/2026 2:28 PM, Mario Limonciello (AMD) (kernel.org) wrote:
> 
> 
> On 1/26/2026 2:25 PM, Alex Deucher wrote:
>> On Mon, Jan 26, 2026 at 2:52 PM Ionut Nechita (Sunlight Linux)
>> <sunlightlinux@gmail.com> wrote:
>>>
>>> From: Ionut Nechita <sunlightlinux@gmail.com>
>>>
>>> On Thu, Jan 8 2026 at 13:36, Christian König wrote:
>>>
>>>> Question is why the KIQ is not up and running before we do anything 
>>>> with it?
>>>
>>> Thank you for the feedback. I completely understand that my patch is
>>> just a workaround and not proper engineering - you're absolutely right
>>> that the real issue is KIQ being marked as ready before it's actually
>>> functional.
>>>
>>> I don't have experience with GPU drivers and video subsystems, so I'm
>>> not familiar with the proper initialization sequence for KIQ. I'd prefer
>>> not to keep a workaround for this issue in my tree.
>>>
>>> Is there a proper fix available, or could you point me in the right
>>> direction? I'm happy to test any patches on my AMD Cezanne (Renoir)
>>> hardware where I can reliably reproduce the issue after hibernation.
>>
>> Can you get a stack trace when this happens so we can see the call chain?
>>
>>>
>>> Also, regarding hibernation support: you mentioned that hibernation is
>>> not generally supported with the driver. Should I expect other issues
>>> beyond this TLB flush problem, or is this the main blocker?
>>
>> The biggest issue with hibernation is that it's not compatible with
>> secure boot so most distros don't officially support it.
> 
> And by extension of this it doesn't get as much testing as s2idle/s3 do.
> 
>>  The other
>> issue is that when we go into hibernation, we need to evict the
>> contents of VRAM somewhere and at the point when that happens, swap is
>> already offline.  So in a lot of cases, we don't have enough memory to
>> back up the VRAM contents.  There were patches to the Linux PM core,
>> but I can't recall if they've all landed yet. 
> 
> Yeah everything should have landed now, so swap will still be enabled.
> 
> There's also the
>> possibility that the user's swap partition is too small.
>>
>> Alex
> 
> I heard something about /sys/power/reserved_size being too small by 
> default still, so if you're having problems you might increase that.
> 
Sorry not reserved_size, /sys/power/image_size.

Here's where it was mentioned.

https://gitlab.freedesktop.org/drm/amd/-/issues/4882#note_3287247
