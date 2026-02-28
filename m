Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCOaBsw2omnR0wQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:29:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 752D61BF6DD
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:28:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B55D10EC4B;
	Sat, 28 Feb 2026 00:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="IbvNqHYu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4188A10EC4B
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 00:28:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772238533; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bpgS9aV7yg/E1CWd1usnQoypLGz1r2a0ETlYDtDzmg26hPeREt8/YqUdHLFXPBbFal1obVnZtksLa9jDqgtPdyLaRYXjU3fYNiXE6er5Dt0jxeISee9V2lS2+YO1tLwi+B1I4w7KEhGrBKQmnOaVi+uPg0p0eQaP+wrUttCyEWc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772238533;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7tmmCY7Ovza+4ITH+8XRSFuK63HOeS+vgIXqqTqYpaw=; 
 b=Jc50X5wbLyV7X/zuqk79z/PM5dfsCPgdqHsMqswJyFulLOCZgeihkiwTxpzpNQYXFY/9HvVZcEexRSBdexBYjHggefo2ragt6byMKuCsMuRvJ+FgIpMEKN3AjSYRClXxYMAFEiuQr7jj0/s0ej5IoOVzAsZ911BnswuhKr6L3K0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772238533; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=7tmmCY7Ovza+4ITH+8XRSFuK63HOeS+vgIXqqTqYpaw=;
 b=IbvNqHYureDbKD9GT37bpK2BJb+YC+SMfp63f08R/SLGzV4MM3MywVqaGLD1+GPn
 78AmHJnavrGQle2t6F/obmJvnupaY3ppOUBm2K/6OitISRrSw5rdz2mk4TCOiyNGM7F
 2/ODfxh9ywzcoPW1oARqB3psNZyMZzdnd/xQE/s4=
Received: by mx.zohomail.com with SMTPS id 1772238531935720.5054842331604;
 Fri, 27 Feb 2026 16:28:51 -0800 (PST)
Date: Fri, 27 Feb 2026 16:28:51 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 aliceryhl@google.com, beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
Message-ID: <aaI2w5vIxB_kc98o@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-8-deborah.brouwer@collabora.com>
 <20260212111113.68778819@fedora>
 <1B40312F-694C-4154-ABF7-F96CE5576C0E@collabora.com>
 <20260220172154.4fe93c6d@fedora>
 <A60BBD53-B7D3-4E85-A72E-8B914B82C977@collabora.com>
 <20260222185743.02dabb26@fedora>
 <AF169886-65F7-4B7A-BAFE-D2C75ADAE678@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AF169886-65F7-4B7A-BAFE-D2C75ADAE678@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,slot.rs:url]
X-Rspamd-Queue-Id: 752D61BF6DD
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 03:46:48PM -0300, Daniel Almeida wrote:
> 
> 
> > On 22 Feb 2026, at 14:57, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > 
> > On Fri, 20 Feb 2026 13:55:31 -0300
> > Daniel Almeida <daniel.almeida@collabora.com> wrote:
> > 
> >>> On 20 Feb 2026, at 13:21, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >>> 
> >>> On Fri, 20 Feb 2026 12:25:43 -0300
> >>> Daniel Almeida <daniel.almeida@collabora.com> wrote:
> >>> 
> >>>>>> +
> >>>>>> +    // Checks and updates the seat state based on the slot it points to
> >>>>>> +    // (if any). Returns a Seat with a value matching the slot state.
> >>>>>> +    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Seat {
> >>>>>> +        let new_seat = match locked_seat.access(self) {
> >>>>>> +            Seat::Active(seat_info) => {
> >>>>>> +                let old_slot_idx = seat_info.slot as usize;
> >>>>>> +                let slot = &self.slots[old_slot_idx];
> >>>>>> +
> >>>>>> +                if kernel::warn_on!(
> >>>>>> +                    !matches!(slot, Slot::Active(slot_info) if slot_info.seqno == seat_info.seqno)
> >>>>>> +                ) {
> >>>>>> +                    Seat::NoSeat
> >>>>>> +                } else {
> >>>>>> +                    Seat::Active(SeatInfo {
> >>>>>> +                        slot: seat_info.slot,
> >>>>>> +                        seqno: seat_info.seqno,
> >>>>>> +                    })
> >>>>>> +                }
> >>>>>> +            }
> >>>>>> +
> >>>>>> +            Seat::Idle(seat_info) => {
> >>>>>> +                let old_slot_idx = seat_info.slot as usize;
> >>>>>> +                let slot = &self.slots[old_slot_idx];
> >>>>>> +
> >>>>>> +                if !matches!(slot, Slot::Idle(slot_info) if slot_info.seqno == seat_info.seqno) {
> >>>>>> +                    Seat::NoSeat
> >>>>>> +                } else {
> >>>>>> +                    Seat::Idle(SeatInfo {
> >>>>>> +                        slot: seat_info.slot,
> >>>>>> +                        seqno: seat_info.seqno,
> >>>>>> +                    })
> >>>>>> +                }
> >>>>>> +            }
> >>>>>> +
> >>>>>> +            _ => Seat::NoSeat,
> >>>>>> +        };
> >>>>>> +
> >>>>>> +        // FIXME: Annoying manual copy. The original idea was to not add Copy+Clone to SeatInfo,
> >>>>>> +        // so that only slot.rs can change the seat state, but there might be better solutions
> >>>>>> +        // to prevent that.    
> >>>>> 
> >>>>> Okay, I guess we want some inputs from Daniel and/or Alice on that one.    
> >>>> 
> >>>> Hm, I'd say we shouldn't implement Clone to avoid any possibility of holding on
> >>>> to stale state by duplicating it.  
> >>> 
> >>> Okay, so basically what we have now.
> >>> 
> >>>> 
> >>>> Why do we need to return Seat from this function? Can't we simply write
> >>>> locked_seat in place and not return anything?  
> >>> 
> >>> We do both actually. IIRC, the reason is that LockedBy borrows &self if
> >>> we want to read the locked_seat, which prevents us from calling methods
> >>> taking a &mut ref from a `match(locked_seat.access())`.  
> >> 
> >> 
> >> I am referring to this change:
> >> 
> >> --- a/drivers/gpu/drm/tyr/slot.rs
> >> +++ b/drivers/gpu/drm/tyr/slot.rs
> >> @@ -242,8 +242,8 @@ fn evict_slot(&mut self, slot_idx: usize, locked_seat: &LockedSeat<T, MAX_SLOTS>
> >>     }
> >> 
> >>     // Checks and updates the seat state based on the slot it points to
> >> -    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Seat {
> >> +    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) {
> >>         let new_seat = match locked_seat.access(self) {
> >>             Seat::Active(seat_info) => {
> >>                 let old_slot_idx = seat_info.slot as usize;
> >> @@ -278,26 +278,7 @@ fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Seat {
> >>             _ => Seat::NoSeat,
> >>         };
> >> 
> >> -        // FIXME: Annoying manual copy. The original idea was to not add Copy+Clone to SeatInfo,
> >> -        // so that only slot.rs can change the seat state, but there might be better solutions
> >> -        // to prevent that.
> >> -        match &new_seat {
> >> -            Seat::Active(seat_info) => {
> >> -                *locked_seat.access_mut(self) = Seat::Active(SeatInfo {
> >> -                    slot: seat_info.slot,
> >> -                    seqno: seat_info.seqno,
> >> -                })
> >> -            }
> >> -            Seat::Idle(seat_info) => {
> >> -                *locked_seat.access_mut(self) = Seat::Idle(SeatInfo {
> >> -                    slot: seat_info.slot,
> >> -                    seqno: seat_info.seqno,
> >> -                })
> >> -            }
> >> -            _ => *locked_seat.access_mut(self) = Seat::NoSeat,
> >> -        }
> >> -
> >> -        new_seat
> >> +        *locked_seat.access_mut(self) = new_seat;
> > 
> > That one requires Copy support, or am I missing something?
> 
> No. Copy and Clone produce a new value and both the old and new values remain
> valid. The line above is moving a value into a new location, invalidating the
> previous one. This means that Copy is not required.
> 
> > 
> >>     }
> >> 
> >> Or even shorter:
> >> 
> >>    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) {
> >>        let (slot_idx, seqno, is_active) = match locked_seat.access(self) {
> >>            Seat::Active(info) => (info.slot as usize, info.seqno, true),
> >>            Seat::Idle(info) => (info.slot as usize, info.seqno, false),
> >>            _ => return,
> >>        };
> >> 
> >>        let valid = if is_active {
> >>            !kernel::warn_on!(!matches!(&self.slots[slot_idx], Slot::Active(s) if s.seqno == seqno))
> >>        } else {
> >>            matches!(&self.slots[slot_idx], Slot::Idle(s) if s.seqno == seqno)
> >>        };
> >> 
> >>        if !valid {
> >>            *locked_seat.access_mut(self) = Seat::NoSeat;
> >>        }
> >>    }
> > 
> > Did you try that? Last I tried, I was hitting a wall because the caller
> > of check_seat() does a match on the updated seat, and inside this
> > match, it calls functions that need a &mut self, and the borrow checker
> > rightfully points the invalid &self then &mut self borrow pattern.
> 
> Yes, I compiled-tested all changes I suggested. My changes compile because they
> intentionally avoid doing what you said above.
> 
> The key here is that your borrows do not overlap anymore. The code I showed
> first borrows immutably, and then returns this tuple: (slot_idx, seqno, is_active).
> The immutable borrow then ends, since this tuple is copied (not borrowed) from
> its source. This benefits from the fact that primitive types are Copy.
> 
> Note that you can borrow both mutably and immutably in the same scope just fine. The
> borrows just can’t be alive at the same time. When the borrow checker rejects your code,
> it shows you why incompatible borrows overlap (i.e.: check the “first used here…later
> used here” part of the error).
> 
> > 
> >> 
> >> access vs access_mut() does not matter here: since the owner is &mut self
> >> anyways we know we have exclusive access to the LockedSeat throughout the whole
> >> function.
> > 
> > I agree, but LockedBy is picky, and last I tried I couldn't make it
> > work without the annoying update+return-copy-of-seat dance you see
> > here. Maybe I missed something obvious and it does indeed work with
> > your suggested changes, dunno.
> 
> Rewriting things so they pass the borrow checker is common in Rust. Sometimes
> it can be done rather easily; other times the design is just broken and needs
> to be reworked. Luckily this one fell in the first category.
> 
> This benefits from the fact that no one can race us between reading this tuple
> 
> (slot_idx, seqno, is_active) 
> 
> ..and using it. That’s because we’re taking &mut self as a proxy in LockedBy, so
> we’re sure we have exclusive access in this scope.
> 
> If you don’t have any complaints about the code I sent (i.e.: convoluted, wrong
> logic, etc), I suggest switching to it.

I’ve tested the short check_seat() function and can confirm that it correctly
compares Seat and Slot seqno as well as emits the kernel warning when we have a
mismatch on an active Seat. So I’ll the simplified check_seat() function in v2
unless there are any more issues to address.

> 
> 
> — Daniel
> 
