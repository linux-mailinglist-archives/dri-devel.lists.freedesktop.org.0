Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAE43DC6A3
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 17:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8C56E834;
	Sat, 31 Jul 2021 15:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A89E6E821
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 15:25:53 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id l19so19524204pjz.0
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 08:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rMM6+nPYXY2uiSyyu4uBWYISUK/txh/pCdnfftmwE5I=;
 b=E0SoYgUeBE+ftZKNo9x/ExH0q8CDdIpilft8etS0hsXIxl3+Vlp6pt0MCFF4VHLSjd
 wmGidikllJX4N9GOuxdiKOtBL2OwlFFooSKknT62V/QxawH+fKFq/IN6UkGfthss0Jue
 /LaKbBpm/i7NpiK11ikcOkYrwperY7OevSA6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rMM6+nPYXY2uiSyyu4uBWYISUK/txh/pCdnfftmwE5I=;
 b=UcVsR8q4nAKmOE1C57uaprkgRbKfplSFBwoGD+LzHrJC8e3eSlOg5Me3PnhY54mlzE
 2rvbSURLmFJAN4516q4lcUebbXkh/vNAG/FOOT3jnwZRy1/NLD6rUgM74ldvy4UCcju1
 IrUN/CxWf/822uzKy3PEhS8GkCKr5+YpBWirYWD8L56sRFqpSaC0e0eJC+7BXXwYNobE
 8nDmkeUUpx+qrBD8elZOFwxi4X/yt4Ggz/kfu2kTKtZVmZ5pkq///Gffb0tvISqEv9tI
 7oy9bvIwyN5l+9f0SzmE0iBuCz2Njg4WgfTOfamt03eQpKjwG/kr2hoSnglJTnq5K4RV
 4/JQ==
X-Gm-Message-State: AOAM530KttJGKSkgmPcmLTa/Judb0Qt0W0glgWlo4Ws+oku0F5RbfLwd
 Za2DSKe7j+/dtU2Marzi2EDMig==
X-Google-Smtp-Source: ABdhPJwoeVgbbn7dICfcKEt6dw6EQc8t7kiQ+j9S2D0qHZ1VpbfIunOgZUzrdbIveyTtuLa19saudA==
X-Received: by 2002:a63:8948:: with SMTP id v69mr1184969pgd.132.1627745153109; 
 Sat, 31 Jul 2021 08:25:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m18sm5745081pjq.32.2021.07.31.08.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 08:25:52 -0700 (PDT)
Date: Sat, 31 Jul 2021 08:25:51 -0700
From: Kees Cook <keescook@chromium.org>
To: dsterba@suse.cz, linux-hardening@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Keith Packard <keithpac@amazon.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 47/64] btrfs: Use memset_after() to clear end of struct
Message-ID: <202107310822.31BEB6E543@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-48-keescook@chromium.org>
 <20210728094215.GX5047@twin.jikos.cz>
 <202107281455.2A0753F5@keescook> <20210729103337.GS5047@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729103337.GS5047@suse.cz>
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

On Thu, Jul 29, 2021 at 12:33:37PM +0200, David Sterba wrote:
> On Wed, Jul 28, 2021 at 02:56:31PM -0700, Kees Cook wrote:
> > On Wed, Jul 28, 2021 at 11:42:15AM +0200, David Sterba wrote:
> > > On Tue, Jul 27, 2021 at 01:58:38PM -0700, Kees Cook wrote:
> > > > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > > > field bounds checking for memset(), avoid intentionally writing across
> > > > neighboring fields.
> > > > 
> > > > Use memset_after() so memset() doesn't get confused about writing
> > > > beyond the destination member that is intended to be the starting point
> > > > of zeroing through the end of the struct.
> > > > 
> > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > > ---
> > > >  fs/btrfs/root-tree.c | 5 +----
> > > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > > > 
> > > > diff --git a/fs/btrfs/root-tree.c b/fs/btrfs/root-tree.c
> > > > index 702dc5441f03..ec9e78f65fca 100644
> > > > --- a/fs/btrfs/root-tree.c
> > > > +++ b/fs/btrfs/root-tree.c
> > > > @@ -39,10 +39,7 @@ static void btrfs_read_root_item(struct extent_buffer *eb, int slot,
> > > >  		need_reset = 1;
> > > >  	}
> > > >  	if (need_reset) {
> > > > -		memset(&item->generation_v2, 0,
> > > > -			sizeof(*item) - offsetof(struct btrfs_root_item,
> > > > -					generation_v2));
> > > > -
> > > 
> > > Please add
> > > 		/* Clear all members from generation_v2 onwards */
> > > 
> > > > +		memset_after(item, 0, level);
> > 
> > Perhaps there should be another helper memset_starting()? That would
> > make these cases a bit more self-documenting.
> 
> That would be better, yes.
> 
> > +		memset_starting(item, 0, generation_v2);
> 
> memset_from?

For v2, I bikeshed this to "memset_startat" since "from" is semantically
close to "source" which I thought might be confusing. (I, too, did not
like "starting".) :)

Can I make "bikeshed" a verb? :P

-- 
Kees Cook
