Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C0E782303
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946DB10E1AE;
	Mon, 21 Aug 2023 04:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F71210E1AE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:54:42 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-91-64e2ee0f13f7
Date: Mon, 21 Aug 2023 13:51:36 +0900
From: Byungchul Park <byungchul@sk.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [RESEND PATCH v10 25/25] dept: Track the potential waits of
 PG_{locked,writeback}
Message-ID: <20230821045136.GB73328@system.software.com>
References: <20230821034637.34630-1-byungchul@sk.com>
 <20230821034637.34630-26-byungchul@sk.com>
 <ZOLnRSdH4Wcrl67L@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOLnRSdH4Wcrl67L@casper.infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxTH9zz39rm3nXXX6rJHWDbt4rZgJi9xyYkuy7LE7Vm2JSa6D7oP
 0K030lDQFEUgMcFZFXmtJsCo3VJgK4gVtRDFabWAUpgOmCBWBDI6NkFaSMCi5c21c2Z+Ofnl
 /HN++X84IqfJIzGiIWOvbMrQGbVExauCy6ree2XSr0/4yxcPx4sSIPQonwfbWSeBnobTCJxN
 BzGM3/gU7s4GEMz/1s1BRVkPgqqRIQ6a2ocRuOu+I9A7uhz6QlMEOssKCRyqOUvg94kFDIPl
 JzCcdn0JNy3VGDzhBzxUjBM4WXEIR8YYhrCjXgBH3jrw11kFWBhJhM7hfgW4B9ZD5Y+DBK64
 O3lob/Zj6P3FRmDY+VQBN9s7eOg5XqyAM5PVBCZmHRw4QlMC3PbYMZwzR0RHZpYU4C32YDjy
 03kMffcuI7ia/wcGl7OfQFsogKHRVcbBXO0NBP6SoACHi8ICnDxYgqDwcDkP3YteBZgH34f5
 Jzby0SbWFpjimLlxP3PP2nn2azVll6xDAjNfHRCY3bWPNdbFsZor45hVTYcUzFV/jDDX9AmB
 FQT7MJvs6hJYx/fzPBvtq8BbY3eqPtDLRkOWbIr/MEWVeid4it+zoM4eaJ7m8tCcqgApRSpt
 pI+8XvKcba3HhCjz0jpqu1jDR5lI71CfL8wVIFFcJb1LA01J0TUndahoqS03yiulFBqeKVVE
 WS0BvXs0FGGVqJGKEP178fF/wQraWTnKPzuOo76lcRx1clIsrV0So2tlpILVEfi3zqvSW9Rz
 wYujHiq1Kelg2IKf9VxNW+p8vAVJ1he01he01v+1dsTVI40hIytdZzBu3JCak2HI3vDt7nQX
 ivyl48DC181oumdbK5JEpF2mTnndr9codFmZOemtiIqcdpU69vGIXqPW63JyZdPuZNM+o5zZ
 imJFXvuaOml2v14j7dLtldNkeY9sep5iURmTh/Iv1qaVin+uuZYbszz+i13a5C3dQ1NHP37w
 5Kn9K7tmDTemtWy+ntiwZfumYqOzqn+s5WffkvzyaBJrKekvfOlhsOz+/Vvw5uffxLy94t6l
 ys/WX+tdO+MVCs7P+Q8kb+VIua6w4eEPOy5f6DKMrZ0wJ2TP5O5M039icb9x3X5KuXjOo+Uz
 U3WJcZwpU/cPbz3LRJMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUyTZxSGfZ73k2ad7zqMT4A/62LcWKYyJTkJC5kZCU+mW/bDuYVp7Ov6
 ZjQU0FaZkJngAFFEBLdaqZ0psBTEbs5CHH5gmiKFClMUVMawGx2bYxbYwOIqBddmM/PPyZVz
 57pzfhyR0QS5JNFQsEsxFchGLa9iVe9klL26dCqoX9PavBTqqtdA+MEBFuxnXDwMfHMagat9
 H4aJ7my4MxdCMP/9dQaslgEEDWN3GWj3BRB0tnzGw+D4szAUnubBbznEQ1nTGR5u3I9iGD12
 FMNp99vQV9uIwRO5x4J1gocT1jIcG79jiDhbBXCWroBgi02A6Fga+AO3Oej60s9B58grUH9y
 lIdLnX4WfB1BDIMX7DwEXI856PP1sjBQd5iDr6caebg/52TAGZ4W4KbHgeHb8ljb/tlFDnoO
 ezDs/+oshqEfLiK4fOBnDG7XbR66wiEMbW4LA4+auxEEayYFqKiOCHBiXw2CQxXHWLi+0MNB
 +Wg6zP9t59/IoF2haYaWt31CO+ccLL3aSOh5212Bll8eEajDvZu2taTSpksTmDbMhDnqbj3I
 U/fMUYFWTQ5hOnXtmkB7j8+zdHzIit9NyVG9rleMhiLFtDpTp8q9NXmK3RFV7xnpmGFK0SNV
 FUoQibSO2L0HhTiz0gpi/66JjTMvrSTDwxGmColiovQSCbW/Fl8zUq+KHLGXxPl5SUcis0e4
 OKslIHcqwzFWiRqpGpHfFh7+FzxH/PXj7L9yKhlenMDxTkZKJs2LYnydEDvB5gzxcV4mvUg8
 53pwLVLbnrJtT9m2/20HYlpRoqGgKF82GNNXmfNyiwsMe1Z9VJjvRrHPc+6N1nWgB4PZXiSJ
 SPuMWpcS1Gs4uchcnO9FRGS0ierkh2N6jVovF5copsJtpt1GxexFySKrXa5+631Fp5E+lncp
 eYqyQzE9SbGYkFSKlst+3ctrnasTgvXGYNSbkrRZ9lW2RAKWQE7apiUv7N346+jZ0kz6Re2W
 gPWPtdu3/tT/ecbxbDus78hMG/nxlGND5rLHuor+bSunTecq+z4sPN+vajCVrKshH/wyJvz5
 3vadliyblIjSPxWLXFfu/eULZOW9SYpzZ9cv2LI8ge4BLWvOldNSGZNZ/gfo2omcdQMAAA==
X-CFilter-Loop: Reflected
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
Cc: hamohammed.sa@gmail.com, hdanton@sina.com, jack@suse.cz,
 peterz@infradead.org, daniel.vetter@ffwll.ch, amir73il@gmail.com,
 david@fromorbit.com, dri-devel@lists.freedesktop.org, mhocko@kernel.org,
 linux-mm@kvack.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, her0gyugyu@gmail.com,
 kernel_team@skhynix.com, damien.lemoal@opensource.wdc.com,
 chris.p.wilson@intel.com, hch@infradead.org, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, ngupta@vflare.org,
 johannes.berg@intel.com, boqun.feng@gmail.com, dan.j.williams@intel.com,
 josef@toxicpanda.com, rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, longman@redhat.com, tglx@linutronix.de,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, max.byungchul.park@gmail.com, hannes@cmpxchg.org,
 tj@kernel.org, akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 21, 2023 at 05:25:41AM +0100, Matthew Wilcox wrote:
> On Mon, Aug 21, 2023 at 12:46:37PM +0900, Byungchul Park wrote:
> > @@ -377,44 +421,88 @@ static __always_inline int Page##uname(struct page *page)		\
> >  #define SETPAGEFLAG(uname, lname, policy)				\
> >  static __always_inline						\
> >  void folio_set_##lname(struct folio *folio)			\
> > -{ set_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); }	\
> > +{									\
> > +	set_bit(PG_##lname, folio_flags(folio, FOLIO_##policy));	\
> > +	dept_page_set_bit(&folio->page, PG_##lname);			\
> 
> The PG_locked and PG_writeback bits only actually exist in the folio;
> the ones in struct page are just legacy and never actually used.
> Perhaps we could make the APIs more folio-based and less page-based?

Yeah. I need to make it more folio-based. I will work on it. Thank you.

> >  static __always_inline void SetPage##uname(struct page *page)	\
> > -{ set_bit(PG_##lname, &policy(page, 1)->flags); }
> > +{									\
> > +	set_bit(PG_##lname, &policy(page, 1)->flags);			\
> > +	dept_page_set_bit(page, PG_##lname);				\
> > +}
> 
> I don't think we ever call this for PG_writeback or PG_locked.  If
> I'm wrong, we can probably fix that ;-)

Okay then, I will assume this will never be used. So are you asking me
to get rid of this part, right?

> >  static __always_inline void __SetPage##uname(struct page *page)	\
> > -{ __set_bit(PG_##lname, &policy(page, 1)->flags); }
> > +{									\
> > +	__set_bit(PG_##lname, &policy(page, 1)->flags);			\
> > +	dept_page_set_bit(page, PG_##lname);				\
> > +}
> 
> Umm.  We do call __SetPageLocked() though ... I'll fix those up to
> be __set_folio_locked().

Haha Okay. Lemme know when you get done on it. Thanks.

	Byungchul
