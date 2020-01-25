Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D996B14965F
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 16:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CCC6E880;
	Sat, 25 Jan 2020 15:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6911D6E57A
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 06:17:15 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id x1so4363659qkl.12
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 22:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tsg/r/0YkW+EwvqQByRlznkOGOX8nMWqFwoWlOGNvn8=;
 b=iY+grmAPc30j6s7U+lRPizYmH7hV2PAWEKR71dLE2dmN6yU1rFMyesbZUFSMOauaVf
 AQ9cpT68ECqVY+efd5oKkLJvdlIt9sZXp1sT7hhWx7cKC3Z0kVr+qI6rJzJHuS7+OAYT
 9tP8OzS97Jt32QTS1CFNMlc2IzGOFYPry2npjIJ+lyjXTv+Qg1tlLW3anAB8VyEs0WHd
 b1Q+rh7P8cnrvzw0V6HrjKy4O80PZNQnYnI1jN1Xd2QA1VsboWQ9oZ6Bv8rfkVJAhaIK
 22EQOoPEm6OaRMU3O4rOgxpn0I1J4f5p8qRuDarvNU+gH14FZqOSSJ0iow23txsL6/SX
 NIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tsg/r/0YkW+EwvqQByRlznkOGOX8nMWqFwoWlOGNvn8=;
 b=DulvVycGlDzDdE+/xNyCJJVIbXJELPR1xqfEqCNaEp4eIUDL3ixxS2SZWEtbChlmcz
 zCqt5kX7Dx2KKGL/RNNaeMe5mMoibJYVmtu1CkAtKP6biNYT/weE8Hvtrn5noPvYwfr+
 D+LjwEyPTbXvSmRSFJat5EiZrDbJiddOyfY5r0F9m2t011x0Q17ThD6J0GF5DrRZOjSA
 qrVxH+NtbFBDlsqy35PWUCMOGtRSw4FJNlmqJFIgmJNdY73LYZVvLD7kSF8dolJPvIwE
 9SJriQIomJgidBE8A/oJWV8x+/pIyMSzd5nGqXPG6bShD+6kxDLj14cdLVPM13WFXuAc
 SZnw==
X-Gm-Message-State: APjAAAV417j7GmwBfIMsiEe8pCFOx5nF/nRm/YSCvL80Bxq8yDxyB9QO
 Vx39aGkRmEE2sBeaMMSwscBrq2GULWxGYft+un0=
X-Google-Smtp-Source: APXvYqzXMH2ecc4WrNRTSRqMoJiY5NdwoAvLhz3IqzcpCpum0aGfk2zEnLWmJG13dZn/DF6tLcJ+3/2VAi47wkEYVVY=
X-Received: by 2002:a05:620a:15e9:: with SMTP id
 p9mr6924393qkm.490.1579933034407; 
 Fri, 24 Jan 2020 22:17:14 -0800 (PST)
MIME-Version: 1.0
References: <fed4f49349913cb6739dac647ba6a61d56b989d2.1579783936.git.christophe.leroy@c-s.fr>
 <e11a8f0670251267f87e3114e0bdbacb1eb72980.1579783936.git.christophe.leroy@c-s.fr>
 <CAHk-=wg4HEABOZdjxMzbembNmxs1zYfrNAEc2L+JS9FBSnM8JA@mail.gmail.com>
In-Reply-To: <CAHk-=wg4HEABOZdjxMzbembNmxs1zYfrNAEc2L+JS9FBSnM8JA@mail.gmail.com>
From: Tony Luck <tony.luck@gmail.com>
Date: Fri, 24 Jan 2020 22:17:03 -0800
Message-ID: <CA+8MBb++x2onyy0obGKc=3exTCekWRJ98xhQZuvHMQbFvV7zCw@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] uaccess: Tell user_access_begin() if it's for a
 write or not
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailman-Approved-At: Sat, 25 Jan 2020 15:47:14 +0000
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 the arch/x86 maintainers <x86@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Michael Ellerman <mpe@ellerman.id.au>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 23, 2020 at 10:03 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> We used to have a read/write argument to the old "verify_area()" and
> "access_ok()" model, and it was a mistake. It was due to odd i386 user
> access issues. We got rid of it. I'm not convinced this is any better
> - it looks very similar and for odd ppc access issues.

If the mode (read or write) were made visible to the trap handler, I'd
find that useful for machine check recovery.  If I'm in the middle of a
copy_from_user() and I get a machine check reading poison from a
user address ... then I could try to recover in the same way as for the
user accessing the poison (offline the page, SIGBUS the task). But if
the poison is in kernel memory and we are doing a copy_to_user(), then
we are hosed (or would need some more complex recovery plan).

[Note that we only get recoverable machine checks on loads... writes
are posted, so if something goes wrong it isn't synchronous with the store
instruction that initiated it]

-Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
