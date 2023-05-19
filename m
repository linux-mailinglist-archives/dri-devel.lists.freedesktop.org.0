Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 906B9709B81
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 17:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7438C10E4CD;
	Fri, 19 May 2023 15:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by gabe.freedesktop.org (Postfix) with SMTP id AB62B10E4CD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 15:42:53 +0000 (UTC)
Received: (qmail 42012 invoked by uid 1000); 19 May 2023 11:42:52 -0400
Date: Fri, 19 May 2023 11:42:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Helge Deller <deller@gmx.de>
Subject: Re: [syzbot] [fbdev?] [usb?] WARNING in
 dlfb_submit_urb/usb_submit_urb (2)
Message-ID: <c1cf7ff1-c204-4afc-aa9d-890e07d5ec72@rowland.harvard.edu>
References: <0000000000004a222005fbf00461@google.com> <ZGXVANMhn5j/jObU@ls3530>
 <4cd17511-2b60-4c37-baf3-c477cf6d1761@rowland.harvard.edu>
 <be824fbc-cde4-9a2a-8fb4-1ca23f498dca@gmx.de>
 <2905a85f-4a3b-4a4f-b8fb-a4d037d6c591@rowland.harvard.edu>
 <ZGZ3JPLqxCxA2UB6@ls3530>
 <c7b8e69a-cabe-4e17-a511-66179259d1d7@rowland.harvard.edu>
 <6e93305a-2d70-d411-3e36-c536449295dd@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e93305a-2d70-d411-3e36-c536449295dd@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org,
 syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 bernie@plugable.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 12:38:15PM +0200, Helge Deller wrote:
> Patch looks good and survived the test.
> 
> Will you send a proper patch to the fbdev mailing list, so that I can
> include it?

Will do.

While you're working on this driver, here's a suggestion for another 
improvement you can make.  The temporary buffer allocations and calls to 
usb_control_msg() in dlfb_get_edid() and dlfb_select_std_channel() can 
be replaced with calls to usb_control_msg_recv() and 
usb_control_msg_send() respectively.

Alan Stern
