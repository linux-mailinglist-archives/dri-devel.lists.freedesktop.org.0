Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C3951E749
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 15:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E3B1132BF;
	Sat,  7 May 2022 13:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9597410E143;
 Fri,  6 May 2022 10:45:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E609D21A8A;
 Fri,  6 May 2022 10:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651833905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JBwOt1RF8EsTJcYBYl+0GNWlwHFwIOlw9+R5hnEyELE=;
 b=eSPSjotpfRcOWk0jZW9qANamWjseFdMATaSNtU3/M/YzCU8f/1EGO32s1kLoMfwMEd7sJs
 SfYKP9rKZm6yNSUYyqwgRjwLu3n1ihRt7/hCRH2HPhyapKVhq3NdcJKuPYBCEq0VweOoCY
 TrDMoyMTrCpnqtdUFKxFUtZaTLeapIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651833905;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JBwOt1RF8EsTJcYBYl+0GNWlwHFwIOlw9+R5hnEyELE=;
 b=8mDMrK8Nueh1reSSRQTYjwoLgqHT8TZPnSaw/2hxkXI2CzfTBgdzkbsenoKH3ZLkLpJoGp
 ui8lVBkXF0GPJfAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9B56813AA2;
 Fri,  6 May 2022 10:45:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iWjCIzH8dGImAwAAMHmgww
 (envelope-from <jroedel@suse.de>); Fri, 06 May 2022 10:45:05 +0000
Date: Fri, 6 May 2022 12:45:04 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com
Subject: Re: [BUG] Warning and NULL-ptr dereference in amdgpu driver with 5.18
Message-ID: <YnT8MAjb/jW4ENVS@suse.de>
References: <YnTAc96Uv0CXcGhD@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnTAc96Uv0CXcGhD@suse.de>
X-Mailman-Approved-At: Sat, 07 May 2022 13:18:19 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 06, 2022 at 08:30:13AM +0200, Jörg Rödel wrote:
> [81829.087101] ------------[ cut here ]------------
> [81829.087105] WARNING: CPU: 4 PID: 644 at drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce110/dce110_clk_mgr.c:140 dce110_fill_display_configs+0x4a/0x150 [amdgpu]

Same just happened with a kernel built from latest upstream, based on
commit fe27d189e3f42e31d3c8223d5daed7285e334c5e. So it's at least not
the iommu changes causing it :)

Please let me know if I can be of any help debugging this further.

Thanks,

	Joerg
