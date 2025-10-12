Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DF1BD09EB
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 20:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90D710E189;
	Sun, 12 Oct 2025 18:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SyGLwPjJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C7A10E189
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 18:37:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2D5BB60587;
 Sun, 12 Oct 2025 18:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FD6C4CEE7;
 Sun, 12 Oct 2025 18:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760294256;
 bh=ISZNqha6pY0OSa8MgD7namr6YOmnDQUXlgiOE8gWXQg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SyGLwPjJj/d6+Gs8rAOV1kHewG2LoANWY6eX+sfoo316t4BPGSWntbb8h5o5ZusGR
 ninCEAPfPKJpiR2SL9j1498IvrnXoNoe+S8B9JkUoKglkaDHDdrw2P+6m+XAiE72kG
 6CC7lAmWc6Ngt9AvOSW+6Wk+VSkHB7trx36uykLNU7WFIfXm0/6ZJQ+fcIKMAx4SA9
 kLPujQaHDNFpRsbEciemjmpgOubmXHPwA5Di0j3bu0aPTiEG18VOLzsttgfQQXA2uU
 f/IjSqOP6Chpy27GikWoo9BPj4UFREoTw7nypGk2MK9ywO1LEjFIHlPhJdktJC+MBO
 k6434iDZVZyCA==
Message-ID: <1be1a119-1fbd-435f-bb27-70f48d677ebf@kernel.org>
Date: Sun, 12 Oct 2025 13:37:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] PCI/VGA: Replace vga_is_firmware_default() with a
 screen info check
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>
References: <20250811162606.587759-1-superm1@kernel.org>
 <20250811162606.587759-3-superm1@kernel.org> <20251012182302.GA3412@sol>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251012182302.GA3412@sol>
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



On 10/12/25 1:23 PM, Eric Biggers wrote:
> Hi,
> 
> On Mon, Aug 11, 2025 at 11:26:04AM -0500, Mario Limonciello (AMD) wrote:
>> vga_is_firmware_default() checks firmware resources to find the owner
>> framebuffer resources to find the firmware PCI device.  This is an
>> open coded implementation of screen_info_pci_dev().  Switch to using
>> screen_info_pci_dev() instead.
>>
>> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> 
> I'm getting a black screen on boot on mainline, and it bisected to this
> commit.  Reverting this commit fixed it.
> 
> Please revert.
> 
> - Eric

Can you please share more information about your issue before we jump 
straight into a revert?  What kind of hardware do you have?  Perhaps a 
kernel log from mainline and another from mainline with the revert could 
help identify what's going on?

A revert might be the right solution, but I would rather fix the issue 
if it's plausible to do so.
