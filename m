Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGw7Le4ujWk/zwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 02:37:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F563129020
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 02:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F3910E6B9;
	Thu, 12 Feb 2026 01:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="hu0vehyd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D031510E6B8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 01:37:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770860263; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YsPdG4A1//Oz1JkR81eNAVIyvYZ4dHzxN+G5deKMAjID0Zxf1vDf76tAe6txkyEL2K34gly9lM2pKl2UxOzkw9PxLl6tWRX0IpyJUvJFCGUoTxBUSPHU85udgRt3wj5WtKB99wEKSjMCUbRmm/DlYaDopfdY/t7lQjBXQRot3wg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770860263;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=EewxOiPGp7wW6OP+Xv3Maai8GFiE+2MdY9jEfPuMeqs=; 
 b=k/LqnBnGx+F7ZO+z2aGFoKMhJ4oNSGjh43HI/mnln/equmT51+I6uhHLtacB3Kde75L7e3In66djJuQj8sZOVVS6k6W1lBtUkZ5KvKaj1Od1kDmdyUb42sxMGDPx+No5eG+nDFLlEmL4Bjc7OQkD7YmuGHAtDlDi/OtMSP0umgY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770860263; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=EewxOiPGp7wW6OP+Xv3Maai8GFiE+2MdY9jEfPuMeqs=;
 b=hu0vehydFudya1voYKpRE8NgRiXH/nbcaHV5X0FxzwmCE1lAzB+lhQ+gxMRQzPbh
 UNwtEnzYbr81R/Q24MR2C8yY9fpnVIkUpbg4Wdm8RorD/kvSI3SuEZSro3604WNh/aF
 y+0jzpFK484vmfr7pbhI05F6Y6T1BPaRAMQ2hkNE=
Received: by mx.zohomail.com with SMTPS id 1770860261865493.98814054517345;
 Wed, 11 Feb 2026 17:37:41 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, beata.michalska@arm.com, lyude@redhat.com,
 Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 07/12] drm/tyr: Add generic slot manager
Date: Wed, 11 Feb 2026 17:37:08 -0800
Message-ID: <20260212013713.304343-8-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212013713.304343-1-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,slot.rs:url]
X-Rspamd-Queue-Id: 2F563129020
X-Rspamd-Action: no action

From: Boris Brezillon <boris.brezillon@collabora.com>

Introduce a generic slot manager to dynamically allocate limited hardware
slots to software "seats". It can be used for both address space (AS) and
command stream group (CSG) slots.

The slot manager initially assigns seats to its free slots. It then
continues to reuse the same slot for a seat, as long as another seat
did not start to use the slot in the interim.

When contention arises because all of the slots are allocated, the slot
manager will lazily evict and reuse slots that have become idle (if any).

The seat state is protected using the LockedBy pattern with the same lock
that guards the SlotManager. This ensures the seat state stays consistent
across slot operations.

Hardware specific behaviour can be customized using the slot manager's
`SlotOperations` trait.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/slot.rs | 359 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/tyr.rs  |   1 +
 2 files changed, 360 insertions(+)
 create mode 100644 drivers/gpu/drm/tyr/slot.rs

diff --git a/drivers/gpu/drm/tyr/slot.rs b/drivers/gpu/drm/tyr/slot.rs
new file mode 100644
index 000000000000..37bf8800a225
--- /dev/null
+++ b/drivers/gpu/drm/tyr/slot.rs
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+//! Slot management abstraction for limited hardware resources.
+//!
+//! This module provides a generic [`SlotManager`] that assigns limited hardware
+//! slots to logical "seats". A seat represents an entity (such as a vm address
+//! space) that needs access to a hardware slot.
+//!
+//! The [`SlotManager`] tracks slot allocation using sequence numbers to detect
+//! when a seat's binding has been invalidated. When a seat requests activation,
+//! the manager will either reuse the seat's existing slot (if still valid),
+//! allocate a free slot (if any are available), or evict the oldest idle slot if any
+//! slots are idle.
+//!
+//! Hardware-specific behavior is customized by implementing the [`SlotOperations`]
+//! trait, which allows callbacks when slots are activated or evicted.
+//!
+//! This is primarily used for managing address space slots in the GPU, where
+//! the number of hardware address space slots is limited.
+//!
+//! [SlotOperations]: crate::slot::SlotOperations
+//! [SlotManager]: crate::slot::SlotManager
+#![allow(dead_code)]
+
+use core::{
+    mem::take,
+    ops::{
+        Deref,
+        DerefMut, //
+    }, //
+};
+
+use kernel::{
+    prelude::*,
+    sync::LockedBy, //
+};
+
+pub(crate) struct SeatInfo {
+    /// Slot used by this seat
+    slot: u8,
+
+    /// Sequence number encoding the last time this seat was active.
+    /// We also use it to check if a slot is still bound to a seat.
+    seqno: u64,
+}
+
+#[derive(Default)]
+pub(crate) enum Seat {
+    #[expect(clippy::enum_variant_names)]
+    #[default]
+    NoSeat,
+    Active(SeatInfo),
+    Idle(SeatInfo),
+}
+
+impl Seat {
+    pub(super) fn slot(&self) -> Option<u8> {
+        match self {
+            Self::Active(info) => Some(info.slot),
+            _ => None,
+        }
+    }
+}
+
+pub(crate) trait SlotOperations {
+    type SlotData;
+
+    /// Called when a slot is being activated for a seat.
+    ///
+    /// This callback allows hardware-specific actions to be performed when a slot
+    /// becomes active, such as updating hardware registers or invalidating caches.
+    fn activate(&mut self, _slot_idx: usize, _slot_data: &Self::SlotData) -> Result {
+        Ok(())
+    }
+
+    /// Called when a slot is being evicted and freed.
+    ///
+    /// This callback allows hardware-specific cleanup when a slot is being
+    /// completely freed, either explicitly or when an idle slot is being
+    /// reused for a different seat. Any hardware state should be invalidated.
+    fn evict(&mut self, _slot_idx: usize, _slot_data: &Self::SlotData) -> Result {
+        Ok(())
+    }
+}
+
+struct SlotInfo<T> {
+    /// Type specific data attached to a slot
+    slot_data: T,
+
+    /// Sequence number from when this slot was last activated
+    seqno: u64,
+}
+
+#[derive(Default)]
+enum Slot<T> {
+    #[default]
+    Free,
+    Active(SlotInfo<T>),
+    Idle(SlotInfo<T>),
+}
+
+pub(crate) struct SlotManager<T: SlotOperations, const MAX_SLOTS: usize> {
+    /// Manager specific data
+    manager: T,
+
+    /// Number of slots actually available
+    slot_count: usize,
+
+    /// Slots
+    slots: [Slot<T::SlotData>; MAX_SLOTS],
+
+    /// Sequence number incremented each time a Seat is successfully activated
+    use_seqno: u64,
+}
+
+// A `Seat` protected by the same lock that is used to wrap the `SlotManager`.
+type LockedSeat<T, const MAX_SLOTS: usize> = LockedBy<Seat, SlotManager<T, MAX_SLOTS>>;
+
+impl<T: SlotOperations, const MAX_SLOTS: usize> Unpin for SlotManager<T, MAX_SLOTS> {}
+
+impl<T: SlotOperations, const MAX_SLOTS: usize> SlotManager<T, MAX_SLOTS> {
+    pub(crate) fn new(manager: T, slot_count: usize) -> Result<Self> {
+        if slot_count == 0 {
+            return Err(EINVAL);
+        }
+        if slot_count > MAX_SLOTS {
+            return Err(EINVAL);
+        }
+        Ok(Self {
+            manager,
+            slot_count,
+            slots: [const { Slot::Free }; MAX_SLOTS],
+            use_seqno: 1,
+        })
+    }
+
+    fn record_active_slot(
+        &mut self,
+        slot_idx: usize,
+        locked_seat: &LockedSeat<T, MAX_SLOTS>,
+        slot_data: T::SlotData,
+    ) -> Result {
+        let cur_seqno = self.use_seqno;
+
+        *locked_seat.access_mut(self) = Seat::Active(SeatInfo {
+            slot: slot_idx as u8,
+            seqno: cur_seqno,
+        });
+
+        self.slots[slot_idx] = Slot::Active(SlotInfo {
+            slot_data,
+            seqno: cur_seqno,
+        });
+
+        self.use_seqno += 1;
+        Ok(())
+    }
+
+    fn activate_slot(
+        &mut self,
+        slot_idx: usize,
+        locked_seat: &LockedSeat<T, MAX_SLOTS>,
+        slot_data: T::SlotData,
+    ) -> Result {
+        self.manager.activate(slot_idx, &slot_data)?;
+        self.record_active_slot(slot_idx, locked_seat, slot_data)
+    }
+
+    fn allocate_slot(
+        &mut self,
+        locked_seat: &LockedSeat<T, MAX_SLOTS>,
+        slot_data: T::SlotData,
+    ) -> Result {
+        let slots = &self.slots[..self.slot_count];
+
+        let mut idle_slot_idx = None;
+        let mut idle_slot_seqno: u64 = 0;
+
+        for (slot_idx, slot) in slots.iter().enumerate() {
+            match slot {
+                Slot::Free => {
+                    return self.activate_slot(slot_idx, locked_seat, slot_data);
+                }
+                Slot::Idle(slot_info) => {
+                    if idle_slot_idx.is_none() || slot_info.seqno < idle_slot_seqno {
+                        idle_slot_idx = Some(slot_idx);
+                        idle_slot_seqno = slot_info.seqno;
+                    }
+                }
+                Slot::Active(_) => (),
+            }
+        }
+
+        match idle_slot_idx {
+            Some(slot_idx) => {
+                // Lazily evict idle slot just before it is reused
+                if let Slot::Idle(slot_info) = &self.slots[slot_idx] {
+                    self.manager.evict(slot_idx, &slot_info.slot_data)?;
+                }
+                self.activate_slot(slot_idx, locked_seat, slot_data)
+            }
+            None => {
+                pr_err!(
+                    "Slot allocation failed: all {} slots in use\n",
+                    self.slot_count
+                );
+                Err(EBUSY)
+            }
+        }
+    }
+
+    fn idle_slot(&mut self, slot_idx: usize, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Result {
+        let slot = take(&mut self.slots[slot_idx]);
+
+        if let Slot::Active(slot_info) = slot {
+            self.slots[slot_idx] = Slot::Idle(SlotInfo {
+                slot_data: slot_info.slot_data,
+                seqno: slot_info.seqno,
+            })
+        };
+
+        *locked_seat.access_mut(self) = match locked_seat.access(self) {
+            Seat::Active(seat_info) | Seat::Idle(seat_info) => Seat::Idle(SeatInfo {
+                slot: seat_info.slot,
+                seqno: seat_info.seqno,
+            }),
+            Seat::NoSeat => Seat::NoSeat,
+        };
+        Ok(())
+    }
+
+    fn evict_slot(&mut self, slot_idx: usize, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Result {
+        match &self.slots[slot_idx] {
+            Slot::Active(slot_info) | Slot::Idle(slot_info) => {
+                self.manager.evict(slot_idx, &slot_info.slot_data)?;
+                take(&mut self.slots[slot_idx]);
+            }
+            _ => (),
+        }
+
+        *locked_seat.access_mut(self) = Seat::NoSeat;
+        Ok(())
+    }
+
+    // Checks and updates the seat state based on the slot it points to
+    // (if any). Returns a Seat with a value matching the slot state.
+    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Seat {
+        let new_seat = match locked_seat.access(self) {
+            Seat::Active(seat_info) => {
+                let old_slot_idx = seat_info.slot as usize;
+                let slot = &self.slots[old_slot_idx];
+
+                if kernel::warn_on!(
+                    !matches!(slot, Slot::Active(slot_info) if slot_info.seqno == seat_info.seqno)
+                ) {
+                    Seat::NoSeat
+                } else {
+                    Seat::Active(SeatInfo {
+                        slot: seat_info.slot,
+                        seqno: seat_info.seqno,
+                    })
+                }
+            }
+
+            Seat::Idle(seat_info) => {
+                let old_slot_idx = seat_info.slot as usize;
+                let slot = &self.slots[old_slot_idx];
+
+                if !matches!(slot, Slot::Idle(slot_info) if slot_info.seqno == seat_info.seqno) {
+                    Seat::NoSeat
+                } else {
+                    Seat::Idle(SeatInfo {
+                        slot: seat_info.slot,
+                        seqno: seat_info.seqno,
+                    })
+                }
+            }
+
+            _ => Seat::NoSeat,
+        };
+
+        // FIXME: Annoying manual copy. The original idea was to not add Copy+Clone to SeatInfo,
+        // so that only slot.rs can change the seat state, but there might be better solutions
+        // to prevent that.
+        match &new_seat {
+            Seat::Active(seat_info) => {
+                *locked_seat.access_mut(self) = Seat::Active(SeatInfo {
+                    slot: seat_info.slot,
+                    seqno: seat_info.seqno,
+                })
+            }
+            Seat::Idle(seat_info) => {
+                *locked_seat.access_mut(self) = Seat::Idle(SeatInfo {
+                    slot: seat_info.slot,
+                    seqno: seat_info.seqno,
+                })
+            }
+            _ => *locked_seat.access_mut(self) = Seat::NoSeat,
+        }
+
+        new_seat
+    }
+
+    pub(crate) fn activate(
+        &mut self,
+        locked_seat: &LockedSeat<T, MAX_SLOTS>,
+        slot_data: T::SlotData,
+    ) -> Result {
+        let seat = self.check_seat(locked_seat);
+        match seat {
+            Seat::Active(seat_info) | Seat::Idle(seat_info) => {
+                // With lazy eviction, if seqno matches, the hardware state is still
+                // valid for both Active and Idle slots, so just update our records
+                self.record_active_slot(seat_info.slot as usize, locked_seat, slot_data)
+            }
+            _ => self.allocate_slot(locked_seat, slot_data),
+        }
+    }
+
+    // The idle() method will be used when we start adding support for user VMs
+    #[expect(dead_code)]
+    pub(crate) fn idle(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Result {
+        let seat = self.check_seat(locked_seat);
+        if let Seat::Active(seat_info) = seat {
+            self.idle_slot(seat_info.slot as usize, locked_seat)?;
+        }
+        Ok(())
+    }
+
+    /// Evict a seat from its slot, freeing up the hardware resource.
+    pub(crate) fn evict(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Result {
+        let seat = self.check_seat(locked_seat);
+
+        match seat {
+            Seat::Active(seat_info) | Seat::Idle(seat_info) => {
+                let slot_idx = seat_info.slot as usize;
+
+                self.evict_slot(slot_idx, locked_seat)?;
+            }
+            _ => (),
+        }
+
+        Ok(())
+    }
+}
+
+impl<T: SlotOperations, const MAX_SLOTS: usize> Deref for SlotManager<T, MAX_SLOTS> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.manager
+    }
+}
+
+impl<T: SlotOperations, const MAX_SLOTS: usize> DerefMut for SlotManager<T, MAX_SLOTS> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.manager
+    }
+}
diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
index 6eaa2135fe07..f54b997355e0 100644
--- a/drivers/gpu/drm/tyr/tyr.rs
+++ b/drivers/gpu/drm/tyr/tyr.rs
@@ -12,6 +12,7 @@
 mod gem;
 mod gpu;
 mod regs;
+mod slot;
 
 kernel::module_platform_driver! {
     type: TyrPlatformDeviceData,
-- 
2.52.0

