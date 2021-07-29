Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 429AF3DA127
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 12:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242A489A94;
	Thu, 29 Jul 2021 10:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B9489A94
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 10:36:24 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 508A0223DB;
 Thu, 29 Jul 2021 10:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627554983;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UkKnqVbw14P1zZ1afK/03fijXFZbWicFe7fyoa6bfnY=;
 b=pwTsly5mnrizCEq06N5ukXErKPn6Gc1C4FWAemD4tE4rdrKSAD7WEsJBIsy8JMWoICKPro
 YUD+rdsGqthszKzibpdDw9PZmLm6K7z+/nJcnH3/9RbXzkKL1yBN2iLF4qJdxbzSEE22IX
 Yy8hsiRj4qt+y/wj0C71RSUrfiRJOCs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627554983;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UkKnqVbw14P1zZ1afK/03fijXFZbWicFe7fyoa6bfnY=;
 b=oD2Z+sefoAAeNVxRJnEQBL4v50NCmrVZt9d8xH9i0feek4vyCIM8VXMg7aRjFLf8nzGBrz
 j9JufWGGGCZMyACA==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
 by relay2.suse.de (Postfix) with ESMTP id 36ED5A3B8C;
 Thu, 29 Jul 2021 10:36:23 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id D7134DA7AF; Thu, 29 Jul 2021 12:33:37 +0200 (CEST)
Date: Thu, 29 Jul 2021 12:33:37 +0200
From: David Sterba <dsterba@suse.cz>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 47/64] btrfs: Use memset_after() to clear end of struct
Message-ID: <20210729103337.GS5047@suse.cz>
Mail-Followup-To: dsterba@suse.cz, Kees Cook <keescook@chromium.org>,
 linux-hardening@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Keith Packard <keithpac@amazon.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-48-keescook@chromium.org>
 <20210728094215.GX5047@twin.jikos.cz>
 <202107281455.2A0753F5@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202107281455.2A0753F5@keescook>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
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
Reply-To: dsterba@suse.cz
Cc: linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 02:56:31PM -0700, Kees Cook wrote:
> On Wed, Jul 28, 2021 at 11:42:15AM +0200, David Sterba wrote:
> > On Tue, Jul 27, 2021 at 01:58:38PM -0700, Kees Cook wrote:
> > > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > > field bounds checking for memset(), avoid intentionally writing across
> > > neighboring fields.
> > > 
> > > Use memset_after() so memset() doesn't get confused about writing
> > > beyond the destination member that is intended to be the starting point
> > > of zeroing through the end of the struct.
> > > 
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > ---
> > >  fs/btrfs/root-tree.c | 5 +----
> > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > > 
> > > diff --git a/fs/btrfs/root-tree.c b/fs/btrfs/root-tree.c
> > > index 702dc5441f03..ec9e78f65fca 100644
> > > --- a/fs/btrfs/root-tree.c
> > > +++ b/fs/btrfs/root-tree.c
> > > @@ -39,10 +39,7 @@ static void btrfs_read_root_item(struct extent_buffer *eb, int slot,
> > >  		need_reset = 1;
> > >  	}
> > >  	if (need_reset) {
> > > -		memset(&item->generation_v2, 0,
> > > -			sizeof(*item) - offsetof(struct btrfs_root_item,
> > > -					generation_v2));
> > > -
> > 
> > Please add
> > 		/* Clear all members from generation_v2 onwards */
> > 
> > > +		memset_after(item, 0, level);
> 
> Perhaps there should be another helper memset_starting()? That would
> make these cases a bit more self-documenting.

That would be better, yes.

> +		memset_starting(item, 0, generation_v2);

memset_from?
