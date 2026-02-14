Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJwxEa7Kj2ntTgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:06:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EEB13A72B
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BDC10E85F;
	Sat, 14 Feb 2026 01:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UV8C9Peq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812F510E85F
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 01:06:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F0D5E60054;
 Sat, 14 Feb 2026 01:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36D5C116C6;
 Sat, 14 Feb 2026 01:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771031209;
 bh=z/oYzgU4t2PyZ7v/2SPXdzZhUBGX4rlVOPLQkFhjCKQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UV8C9PeqK2ZhJyRELQFjNITcMTEOKqlhUd9Q0pQLusEOwyMHnicc119pjWAAokLqq
 6taIljEm8jCu/YYwF/jPlEBxaHDW0B+dmIWJC0MSeF+w9nkUyAg3UasN3v7rNe4Gqe
 eKSKB8oAyTEFcXGdj21tLxsnRKui15OK/NNu3kCR3qisv+NsckNIzc11R+Kv7xLk+E
 PO80oEKODbFgqyE0y16sKYY2D66pNbYyf3F5XsuntZ7bDWKF6sNTlsY4uvhjYEaV9D
 X1Dz6Z8pnvUql6ouAW22T583JBIm9ELBlnTUE3eAgH5+ICRjwpd1hi7XUGtP2ks0WW
 g9PaR/Ib0wR1A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Lizhi Hou <lizhi.hou@amd.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Sasha Levin <sashal@kernel.org>, mamin506@gmail.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.19-6.18] accel/amdxdna: Fix tail-pointer polling in
 mailbox_get_msg()
Date: Fri, 13 Feb 2026 19:59:43 -0500
Message-ID: <20260214010245.3671907-103-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:stable@vger.kernel.org,m:lizhi.hou@amd.com,m:maciej.falkowski@linux.intel.com,m:sashal@kernel.org,m:mamin506@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,linux.intel.com,kernel.org,gmail.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: A9EEB13A72B
X-Rspamd-Action: no action

From: Lizhi Hou <lizhi.hou@amd.com>

[ Upstream commit cd77d5a4aaf8c5c1d819f47cf814bf7d4920b0a2 ]

In mailbox_get_msg(), mailbox_reg_read_non_zero() is called to poll for a
non-zero tail pointer. This assumed that a zero value indicates an error.
However, certain corner cases legitimately produce a zero tail pointer.
To handle these cases, remove mailbox_reg_read_non_zero(). The zero tail
pointer will be treated as a valid rewind event.

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Link: https://patch.msgid.link/20251204181603.793824-1-lizhi.hou@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Good - `mailbox_get_tailptr()` already exists in v6.14 and the fix uses
it. No dependency issues.

## Comprehensive Analysis

### 1. Commit Message Analysis

The commit title explicitly says "Fix" and the message clearly describes
the bug: `mailbox_reg_read_non_zero()` polls for a non-zero tail
pointer, **incorrectly assuming that a zero value indicates an error**.
However, zero is a legitimate tail pointer value in certain corner cases
(ring buffer rewind events). The fix removes the flawed polling function
and instead uses a simple direct read via the existing
`mailbox_get_tailptr()`.

### 2. Code Change Analysis - The Bug Mechanism

The bug is in `mailbox_reg_read_non_zero()`:

```115:129:/home/sasha/linux-
autosel/drivers/accel/amdxdna/amdxdna_mailbox.c
static int mailbox_reg_read_non_zero(struct mailbox_channel *mb_chann,
u32 mbox_reg, u32 *val)
{
        struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
        void __iomem *ringbuf_addr = mb_res->mbox_base + mbox_reg;
        int ret, value;

        /* Poll till value is not zero */
        ret = readx_poll_timeout(readl, ringbuf_addr, value,
                                 value, 1 /* us */, 100);
        if (ret < 0)
                return ret;

        *val = value;
        return 0;
}
```

This function uses `readx_poll_timeout()` with `value` as both the
variable AND the condition (the condition is just `value`, i.e.,
truthy/non-zero). It polls every 1us for up to 100us. If the tail
pointer register is zero after 100us, it returns `-ETIMEDOUT`.

The call site in `mailbox_get_msg()`:

```289:290:/home/sasha/linux-
autosel/drivers/accel/amdxdna/amdxdna_mailbox.c
        if (mailbox_reg_read_non_zero(mb_chann,
mb_chann->res[CHAN_RES_I2X].mb_tail_ptr_reg, &tail))
                return -EINVAL;
```

When the function times out (tail is legitimately zero),
`mailbox_get_msg()` returns `-EINVAL`.

**The catastrophic consequence** is in `mailbox_rx_worker()` (in v6.14):

```377:386:/home/sasha/linux-
autosel/drivers/accel/amdxdna/amdxdna_mailbox.c
                /* Other error means device doesn't look good, disable
irq. */
                if (unlikely(ret)) {
                        MB_ERR(mb_chann, "Unexpected ret %d, disable
irq", ret);
                        WRITE_ONCE(mb_chann->bad_state, true);
                        disable_irq(mb_chann->msix_irq);
                        break;
                }
```

Any return other than `0` or `-ENOENT` causes:
1. `bad_state = true` is set **permanently** (never reset)
2. `disable_irq()` is called (in v6.14)
3. All future work items check `bad_state` and immediately return
4. The mailbox channel is **permanently dead** - no more firmware
   communication is possible
5. The AMD AI Engine accelerator becomes non-functional

**When does tail=0 legitimately occur?** The ring buffer protocol uses a
TOMBSTONE marker when wrapping. After the writer (firmware, for the I2X
channel) writes a TOMBSTONE at the end of the buffer and wraps to the
start, the tail pointer can be zero briefly or permanently depending on
the firmware's message scheduling. The commit describes this as a "valid
rewind event."

### 3. Fix Correctness

The fix replaces the flawed polling function with a direct register
read:
```c
tail = mailbox_get_tailptr(mb_chann, CHAN_RES_I2X);
```

This is obviously correct because the existing validation in
`mailbox_get_msg()` properly handles a zero tail:
- `tail > ringbuf_size || !IS_ALIGNED(tail, 4)` → 0 passes (aligned and
  within bounds)
- `head == tail` → if head is also 0, returns `-ENOENT` (empty buffer,
  which is the correct behavior)
- If head != 0 and tail == 0, the function processes messages normally
  (rewind scenario)

### 4. Scope and Risk Assessment

- **Size**: 1 file changed, 1 insertion, 18 deletions (net -17 lines)
- **Scope**: Entirely self-contained within the mailbox driver
- **Risk**: Very low - the fix removes a polling function and replaces
  it with a simple direct read, relying on already-existing validation
  code
- **Regression potential**: Near zero - all the defensive checks (bounds
  validation, alignment, empty-buffer check) remain intact

### 5. Dependencies

- No dependencies on other commits
- `mailbox_get_tailptr()` already exists in v6.14 (line 152)
- The patch applies cleanly to v6.14.y stable (surrounding code is
  identical)

### 6. User Impact

- Affects users of AMD AI Engine (XDNA) accelerators (Ryzen AI NPUs)
- The bug causes the accelerator to become permanently non-functional
  when the tail pointer is legitimately zero
- This is a **device-killing bug** that requires driver reload/reboot to
  recover
- The amdxdna driver exists in stable trees starting from v6.14

### 7. Stability Indicators

- Has `Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>`
- Author is `Lizhi Hou <lizhi.hou@amd.com>` - an AMD engineer and the
  primary amdxdna driver developer
- The fix was accepted via the drm subsystem merge path

### Conclusion

This commit fixes a real, severe bug where a false positive error
detection (treating zero tail pointer as invalid) permanently kills the
mailbox communication channel in the AMD XDNA accelerator driver. The
consequence is the accelerator device becoming completely non-functional
until driver reload/reboot. The fix is small (net -17 lines), obviously
correct (removes incorrect assumption, relies on existing validation),
self-contained (single file, no dependencies), and applies cleanly to
the v6.14 stable tree. It meets all stable kernel criteria.

**YES**

 drivers/accel/amdxdna/amdxdna_mailbox.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 858df97cd3fbd..a60a85ce564cb 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -112,22 +112,6 @@ static u32 mailbox_reg_read(struct mailbox_channel *mb_chann, u32 mbox_reg)
 	return readl(ringbuf_addr);
 }
 
-static int mailbox_reg_read_non_zero(struct mailbox_channel *mb_chann, u32 mbox_reg, u32 *val)
-{
-	struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
-	void __iomem *ringbuf_addr = mb_res->mbox_base + mbox_reg;
-	int ret, value;
-
-	/* Poll till value is not zero */
-	ret = readx_poll_timeout(readl, ringbuf_addr, value,
-				 value, 1 /* us */, 100);
-	if (ret < 0)
-		return ret;
-
-	*val = value;
-	return 0;
-}
-
 static inline void
 mailbox_set_headptr(struct mailbox_channel *mb_chann, u32 headptr_val)
 {
@@ -286,8 +270,7 @@ static int mailbox_get_msg(struct mailbox_channel *mb_chann)
 	u32 start_addr;
 	int ret;
 
-	if (mailbox_reg_read_non_zero(mb_chann, mb_chann->res[CHAN_RES_I2X].mb_tail_ptr_reg, &tail))
-		return -EINVAL;
+	tail = mailbox_get_tailptr(mb_chann, CHAN_RES_I2X);
 	head = mb_chann->i2x_head;
 	ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_I2X);
 	start_addr = mb_chann->res[CHAN_RES_I2X].rb_start_addr;
-- 
2.51.0

