Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921D92C7F60
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 08:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361BD89F33;
	Mon, 30 Nov 2020 07:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4659089F33
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 07:56:55 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4557C20026;
 Mon, 30 Nov 2020 08:56:47 +0100 (CET)
Date: Mon, 30 Nov 2020 08:56:45 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [PATCH v2 02/28] video: fbcon: Fix warnings by using pr_debug()
 in fbcon
Message-ID: <20201130075645.GA1442147@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-3-sam@ravnborg.org>
 <9fbdaff8-18af-223d-6cec-4b44aeb94fec@suse.de>
 <fe2a56cd-10bd-962c-4f65-96c23a78cdd7@i-love.sakura.ne.jp>
 <20201129111836.GA1094053@ravnborg.org>
 <20201130063805.GA21500@PWN>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130063805.GA21500@PWN>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=1bFr7IoaHJKwnvFcCG0A:9 a=CjuIK1q_8ugA:10
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
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Jiri Slaby <jirislaby@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Alexander Klimov <grandmaster@al2klimov.de>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peter Rosin <peda@axentia.se>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peilin,
On Mon, Nov 30, 2020 at 01:38:05AM -0500, Peilin Ye wrote:
> Hi Sam,
> 
> On Sun, Nov 29, 2020 at 12:18:36PM +0100, Sam Ravnborg wrote:
> > On Sun, Nov 29, 2020 at 07:28:08PM +0900, Tetsuo Handa wrote:
> > > But replacing printk(KERN_DEBUG) with pr_debug() prevents __func__ from being printed
> > > when FBCONDEBUG is defined. Is such change what the author of this module expects?
> > 
> > When someone goes and enable DEBUG for fbcon they are also able to
> > recognize the logging, so the printing of the function name is redundant
> > in this case.
> > 
> > There is likely limited to no use for these few logging entries, but if
> > they should be dropped then I expect Peilin Ye to do so as he is the
> > only one doing active maintenance of fbcon lately.
> 
> Sure, I will take another look at them. Also sorry for the delay in that
> printk() -> dev_*() patch you suggested, overwhelmed by some other
> things this week. Sometimes fbcon.c accesses dev structs in a pretty
> weird way (e.g. registered_fb[con2fb_map[vc->vc_num]]->dev), I will get
> back to it when I understand this better.
Please just keep up the good work cleaning up fbcon and related stuff.
This is an area that needs some love and care and there is work for many
long nights yet to do.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
