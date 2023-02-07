Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8657568D588
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 12:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF49310E4D5;
	Tue,  7 Feb 2023 11:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D475C10E4D5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 11:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hHCsPYCpRP300StWPDu6A8v4ibXwL73uzjB/3CfgHlE=; b=XuTCMPtd86/V4iOeMx6MI5WiBj
 HGl83CqtJzaLOsgjhRPAtc+xXw6MBCiuVtTfjiSd/r4vp5cmwnEFIzNKjMNLHs/tNfbygfIIi2vFL
 4cnbh80wHFhyJKqLof6k/FEn3+VjcsCLFabGfXZ6+OVZ46G0AvfORinCCWh8xEviFK9AZDQLtCOGH
 KwPi4anIxS5gWuTRyEcOz53ZnnDQbxUSM+YmH/d5trIsEYT4HghMn+2UR6boJbrQ3BuPnAHSSPwr7
 EUNS0ty+VkteQ9XdHmZg+B76fvyOHq6nWaWjdOrD2A7f1hynguMgr0mTxKihLO6jFyfBCKNYKsz/l
 EgdB1HRg==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pPMCA-00Bl67-2G; Tue, 07 Feb 2023 12:31:30 +0100
Message-ID: <5dfdf605-55a2-28d3-aecf-713a632b2431@igalia.com>
Date: Tue, 7 Feb 2023 08:31:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: DRM accel and debugfs/sysfs
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20230201152003.GA2623449@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230201152003.GA2623449@linux.intel.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stanislaw,

On 2/1/23 12:20, Stanislaw Gruszka wrote:
> Hi
> 
> I was about to send debugfs support for ivpu and noticed that there
> are current changes that deprecate drm_devel->debugfs_init callback.
> 
> Further I looked at this commit [1], that stated we should not
> use drm_minor for debugfs and sysfs. What is quite contrary to
> what drm accel framework did in the first place.
> 
> So my question is how we should use debugfs/sysfs in accel?
> Use it with old fashioned minor-centric way or change
> the framework somehow ?

As we are trying to replace drm_debugfs_create_files() [1], it would
be nice to see the accel debugfs support use the new debugfs API. This
would mean using the debugfs_list from the drm_device, deprecating
the debugfs_init callback, and adding the a similar code snippet to
accel_debugfs_init:

list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
	debugfs_create_file(entry->file.name, 0444,
			    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
	list_del(&entry->list);

Maybe Daniel has some more thoughts on this matter, but I guess it
would be better to drop the use of the old-fashioned minor-centric
implementation in accel.

[1] https://cgit.freedesktop.org/drm/drm-misc/tree/Documentation/gpu/todo.rst#n511

Best Regards,
- Maíra Canal

> 
> [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=99845faae7099cd704ebf67514c1157c26960a26
> 
> Regards
> Stanislaw
> 
