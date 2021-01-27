Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58FF30710F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456266E94E;
	Thu, 28 Jan 2021 08:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5C889CCE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 17:44:09 +0000 (UTC)
Date: Wed, 27 Jan 2021 18:44:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1611769448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=VIoN5TDvd5gewKoIsScVFfitrAXPVjTNHdpGwsh86Dw=;
 b=RF5EfPm4S/SNHK5FbLRlqPt1g8wPqMKZDcQgR7GZGTMLpC6H1DMe5+dCwh5RP5NYBhRJ0T
 aJwVpnxnkTgFWFH5ZhcC2wTY0cTQt8qIWByDl0OO0YqfVqO4WjN5yZ5uWcXyewERh94eL5
 v8/fK7ZIXd8xskhX9Z9TtrHLEI0lR3KaUfIKjgwJTW3+DG7UU8bk+fUr61b7XQN9BOz6oG
 ovEbh5PY5BCPJtnJSW7lfw7zS2FOvqlL+zcO+YDs4lfdazzamag3BqBCS/pSkC+xQzFL1c
 BvEW0MgF0P56CykIUmyXKRcdV12zy2x/VVh952C+3n1+Kw/gYFov8JcU1mWdCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1611769448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=VIoN5TDvd5gewKoIsScVFfitrAXPVjTNHdpGwsh86Dw=;
 b=ZBOiJsMm3c8gBrxw+xeIP93ALD7J6GpdSDUpyBfzyD6vKCwHfwK/+3aqvJt0BOxFfhZnIY
 kmJLUrXbqHc1akBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-fbdev@vger.kernel.org, Peter Collingbourne <pcc@google.com>
Subject: [RFC] in_atomic() usage in amba-clcd.c / FB_ARMCLCD
Message-ID: <20210127174408.ududpwfrbg3dhyxj@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: Thomas Gleixner <tglx@linutronix.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mba-clcd driver uses in_interrupt() in clcdfb_sleep():
| /*
|  * Unfortunately, the enable/disable functions may be called either from
|  * process or IRQ context, and we _need_ to delay.  This is _not_ good.
|  */
| static inline void clcdfb_sleep(unsigned int ms)
| {
|         if (in_atomic()) {
|                 mdelay(ms);
|         } else {
|                 msleep(ms);
|         }
| }

I traced it back to its initial merge:
    bfe694f833643 ("[ARM] Add ARM AMBA CLCD framebuffer driver.")
    https://git.kernel.org/history/history/c/bfe694f833643

The driver has been removed and added back in the meantime. 
I've been looking for the IRQ context as described in the comment and
couldn't find it. The functions calling clcdfb_sleep() also call
conditionally backlight_update_status() which acquires a mutex.

Is this part really outdated and now msleep() could be used
unconditionally?

Sebastian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
