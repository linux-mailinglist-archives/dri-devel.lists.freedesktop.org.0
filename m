Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF84D334932
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 21:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64736EA61;
	Wed, 10 Mar 2021 20:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CC86E372
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 20:55:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3036664FCA
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 20:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615409745;
 bh=xWjOf8nTfcD+Phhf59x0p5JgP4MEobSpBJ1sbM8sz4Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Xy6aswmGJ2brWDIjkLZ+qCOzT7NTdb9BP7eDF0uiL3v0GXjuIoKaADtTllhQicezh
 m+voeCPNxHzV5/gnSU6cV1Ea+bfXflWPuhcD8f+uMTEdW1e1hLUO7dPtJeWMIT6ChL
 nNDQmcMpULA/Xq9JVCiRFOe4Bo1NFjZKKw4DEZ03zpvguafNu8ybh5hAHoFAAIVp9Q
 6X90caprUSqbtHQ6+WOQ0cj0BajSp4Tzy11niXXX/iSDMG5bvaRNM1ezQn26cLc/aC
 Bh6EqxZhaqFOjI+73dpEoocDOIUtJciCkjpwZK2yEBzVEm8Kdt/48iUD/r4u3Oo9Mh
 tYJYm3PWKFEGA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1E972652DC; Wed, 10 Mar 2021 20:55:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212077] AMD GPU discrete card memory at highest frequency even
 while not in use
Date: Wed, 10 Mar 2021 20:55:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bat_malin@abv.bg
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212077-2300-IFELw28LC9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212077-2300@https.bugzilla.kernel.org/>
References: <bug-212077-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=212077

--- Comment #6 from Bat Malin (bat_malin@abv.bg) ---
No change in the code of 5.12-rc2...

for (i = 0; i < dep_mclk_table->count; i++) {
                for (j = 0; j < dep_sclk_table->count; j++) {
                        valid_entry = false;
                        for (k = 0; k < watermarks->num_wm_sets; k++) {
                                if (dep_sclk_table->entries[i].clk / 10 >=
watermarks->wm_clk_ranges[k].wm_min_eng_clk_in_khz &&
                                    dep_sclk_table->entries[i].clk / 10 <
watermarks->wm_clk_ranges[k].wm_max_eng_clk_in_khz &&
                                    dep_mclk_table->entries[i].clk / 10 >=
watermarks->wm_clk_ranges[k].wm_min_mem_clk_in_khz &&
                                    dep_mclk_table->entries[i].clk / 10 <
watermarks->wm_clk_ranges[k].wm_max_mem_clk_in_khz) {
                                        valid_entry = true;
                                        table->DisplayWatermark[i][j] =
watermarks->wm_clk_ranges[k].wm_set_id;
                                        break;

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
