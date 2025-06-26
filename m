Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D3BAE9F15
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 15:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E58110E2C8;
	Thu, 26 Jun 2025 13:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JbklDXUr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CkSid8rR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JbklDXUr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CkSid8rR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF7E10E2C8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 13:39:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C52E81F38D;
 Thu, 26 Jun 2025 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750945160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Y+fXuIQy8LjgLKVkKiZRdsuWDkPGYLh2CKzhhRmBEW4=;
 b=JbklDXUrpeEe7qb6+1/IEwxlccDsCf037NzoZtNPfFxjwuNsn/CbKXN217Lmya4aeAzhFK
 SFN8bsCprPXtryCBr8V4pVG8XBPd8rMvWZCEUhHnsdxrdL0WJ61VeRkxzWHlJCvYO7KmBM
 PXYtGMLa+n5QWryuQMAbmNiLSHsMuSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750945160;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Y+fXuIQy8LjgLKVkKiZRdsuWDkPGYLh2CKzhhRmBEW4=;
 b=CkSid8rRTjJLhind4sj//uFyny0dpg76gs0sj7cMzrmK/Tv7ROFT1fjPz8segX5fmajgaJ
 rRAZp0WntXVRPxDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750945160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Y+fXuIQy8LjgLKVkKiZRdsuWDkPGYLh2CKzhhRmBEW4=;
 b=JbklDXUrpeEe7qb6+1/IEwxlccDsCf037NzoZtNPfFxjwuNsn/CbKXN217Lmya4aeAzhFK
 SFN8bsCprPXtryCBr8V4pVG8XBPd8rMvWZCEUhHnsdxrdL0WJ61VeRkxzWHlJCvYO7KmBM
 PXYtGMLa+n5QWryuQMAbmNiLSHsMuSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750945160;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Y+fXuIQy8LjgLKVkKiZRdsuWDkPGYLh2CKzhhRmBEW4=;
 b=CkSid8rRTjJLhind4sj//uFyny0dpg76gs0sj7cMzrmK/Tv7ROFT1fjPz8segX5fmajgaJ
 rRAZp0WntXVRPxDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 855EC13188;
 Thu, 26 Jun 2025 13:39:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YsWkHohNXWhpHgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 26 Jun 2025 13:39:20 +0000
Message-ID: <ff74c4c0-9876-4d62-a099-12061bca1cea@suse.de>
Date: Thu, 26 Jun 2025 15:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] drm/gem-shmem: Use dma_buf from GEM object instance
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
References: <20250226172457.217725-1-tzimmermann@suse.de>
 <20250226172457.217725-6-tzimmermann@suse.de>
 <CAN9Xe3QU_goD8ca9_dCew3V=U22SUbVmOri1p+fwiicJKNa6wQ@mail.gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <CAN9Xe3QU_goD8ca9_dCew3V=U22SUbVmOri1p+fwiicJKNa6wQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,linaro.org,amd.com,lists.freedesktop.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
X-Spam-Level: 
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

Hi,

this patch triggers a NULL-pointer deref. Stack trace is below.

Am 28.02.25 um 17:26 schrieb Anusha Srivatsa:
> Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>
>
>
> On Wed, Feb 26, 2025 at 12:28 PM Thomas Zimmermann 
> <tzimmermann@suse.de> wrote:
>
>     Avoid dereferencing struct drm_gem_object.import_attach for the
>     imported dma-buf. The dma_buf field in the GEM object instance refers
>     to the same buffer. Prepares to make import_attach optional.
>
>     Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>     ---
>      drivers/gpu/drm/drm_gem_shmem_helper.c | 6 +++---
>      1 file changed, 3 insertions(+), 3 deletions(-)
>
>     diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c
>     b/drivers/gpu/drm/drm_gem_shmem_helper.c
>     index 7722cd720248..d99dee67353a 100644
>     --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>     +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>     @@ -339,10 +339,10 @@ int drm_gem_shmem_vmap(struct
>     drm_gem_shmem_object *shmem,
>             int ret = 0;
>
>             if (drm_gem_is_imported(obj)) {
>     -               ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
>     +               ret = dma_buf_vmap(obj->dma_buf, map);
>


What I see is that ->dma_buf is NULL at this point.  The sequence of 
events is

1) Import the dma-buf into a GEM object and set the pointer at [1]
2) Release the GEM object from user space and clear the dma-buf pointer 
at [2]
3) Use the GEM object for a plane and try to vmap the dma-buf here

[1] 
https://elixir.bootlin.com/linux/v6.15.3/source/drivers/gpu/drm/drm_prime.c#L406
[2] 
https://elixir.bootlin.com/linux/v6.15.3/source/drivers/gpu/drm/drm_gem.c#L241

Step 3) should likely not happen before 2). It looks like a problem with 
ref-counting? Or is this intentional behavior?

Best regards
Thomas

[  156.791968] ------------[ cut here ]------------
[  156.796830] WARNING: CPU: 2 PID: 2255 at 
drivers/dma-buf/dma-buf.c:1527 dma_buf_vmap+0x224/0x430
[  156.805923] Modules linked in: udl(E) snd_seq_dummy(E) snd_hrtimer(E) 
snd_seq(E) snd_seq_device(E) af_packet(E) nf_tables(E) iptable_filter(E) 
snd_hda_codec_hdmi(E) binfmt_misc(E) snd_hda_codec_realtek(E) snd_
hda_codec_generic(E) snd_hda_scodec_component(E) snd_hda_intel(E) 
snd_intel_dspcfg(E) snd_hda_codec(E) ee1004(E) snd_hda_core(E) 
iTCO_wdt(E) snd_hwdep(E) intel_rapl_msr(E) eeepc_wmi(E) 
iTCO_vendor_support(E) snd_
pcm(E) asus_wmi(E) intel_rapl_common(E) sparse_keymap(E) 
nls_iso8859_1(E) x86_pkg_temp_thermal(E) e1000e(E) platform_profile(E) 
nls_cp437(E) snd_timer(E) i2c_i801(E) intel_powerclamp(E) battery(E) 
i2c_smbus(E) pt
p(E) snd(E) vfat(E) coretemp(E) rfkill(E) intel_wmi_thunderbolt(E) 
wmi_bmof(E) pcspkr(E) mxm_wmi(E) fat(E) soundcore(E) pps_core(E) 
i2c_mux(E) xfs(E) acpi_pad(E) button(E) mei_me(E) mei(E) joydev(E) 
loop(E) nvme_
fabrics(E) fuse(E) efi_pstore(E) dm_mod(E) configfs(E) nfnetlink(E) 
ip_tables(E) x_tables(E) i2c_algo_bit(E) ghash_clmulni_intel(E) 
drm_buddy(E) sha512_ssse3(E) video(E) hid_generic(E)
[  156.806220]  sha1_ssse3(E) aesni_intel(E) crypto_simd(E) cryptd(E) 
usbhid(E) ttm(E) wmi(E) intel_gtt(E) drm_display_helper(E) cec(E) 
btrfs(E) blake2b_generic(E) xor(E) raid6_pq(E) msr(E) i2c_dev(E) efivarfs(E)
  dmi_sysfs(E)
[  156.916628] CPU: 2 UID: 1000 PID: 2255 Comm: KMS thread Tainted: 
G        W   E      6.14.0-rc4-00399-g1a148af06000-dirty #62
[  156.928010] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
[  156.933253] Hardware name: System manufacturer System Product 
Name/Z170-A, BIOS 3802 03/15/2018
[  156.942028] RIP: 0010:dma_buf_vmap+0x224/0x430
[  156.946529] Code: 48 83 c4 60 5b 41 5c 41 5d 5d c3 cc cc cc cc 80 3c 
02 00 0f 85 5a 01 00 00 49 c7 04 24 00 00 00 00 48 85 db 0f 85 8b fe ff 
ff <0f> 0b b8 ea ff ff ff eb ba 48 85 f6 0f 85 51 01 00 00 48 89 54
24
[  156.965374] RSP: 0018:ffff88810a5cf8b0 EFLAGS: 00010246
[  156.971341] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 
dffffc0000000000
[  156.978539] RDX: 1ffff1103183cd19 RSI: ffff88818c1e68c8 RDI: 
ffff88818c1e68d0
[  156.985742] RBP: ffff88810a5cf928 R08: 0000000000000001 R09: 
fffffbfff754ad94
[  156.992928] R10: 0000000000000002 R11: 0000000000000000 R12: 
ffff88818c1e68c8
[  157.000385] R13: 1ffff110214b9f1a R14: dffffc0000000000 R15: 
ffffffffb95eb1e0
[  157.007599] FS:  00007f45327036c0(0000) GS:ffff888417000000(0000) 
knlGS:0000000000000000
[  157.015735] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  157.021527] CR2: 00007f9980a04cf0 CR3: 00000001263c4003 CR4: 
00000000003706f0
[  157.028729] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
0000000000000000
[  157.036237] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 
0000000000000400
[  157.043420] Call Trace:
[  157.045898]  <TASK>
[  157.048030]  ? show_trace_log_lvl+0x1af/0x2c0
[  157.052436]  ? show_trace_log_lvl+0x1af/0x2c0
[  157.056836]  ? show_trace_log_lvl+0x1af/0x2c0
[  157.061253]  ? drm_gem_shmem_vmap+0x74/0x710
[  157.065567]  ? dma_buf_vmap+0x224/0x430
[  157.069446]  ? __warn.cold+0x58/0xe4
[  157.073061]  ? dma_buf_vmap+0x224/0x430
[  157.077111]  ? report_bug+0x1dd/0x390
[  157.080842]  ? handle_bug+0x5e/0xa0
[  157.084389]  ? exc_invalid_op+0x14/0x50
[  157.088291]  ? asm_exc_invalid_op+0x16/0x20
[  157.092548]  ? dma_buf_vmap+0x224/0x430
[  157.096663]  ? dma_resv_get_singleton+0x6d/0x230
[  157.101341]  ? __pfx_dma_buf_vmap+0x10/0x10
[  157.105588]  ? __pfx_dma_resv_get_singleton+0x10/0x10
[  157.110697]  drm_gem_shmem_vmap+0x74/0x710
[  157.114866]  drm_gem_vmap+0xa9/0x1b0
[  157.118763]  drm_gem_vmap_unlocked+0x46/0xa0
[  157.123086]  drm_gem_fb_vmap+0xab/0x300
[  157.126979]  drm_atomic_helper_prepare_planes.part.0+0x487/0xb10
[  157.133032]  ? lockdep_init_map_type+0x19d/0x880
[  157.137701]  drm_atomic_helper_commit+0x13d/0x2e0
[  157.142671]  ? drm_atomic_nonblocking_commit+0xa0/0x180
[  157.147988]  drm_mode_atomic_ioctl+0x766/0xe40
[  157.152735]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[  157.157810]  ? __pfx___lock_acquire+0x10/0x10
[  157.162229]  ? __pfx___lock_acquire+0x10/0x10
[  157.166680]  ? find_held_lock+0x2f/0x130
[  157.170728]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[  157.175759]  ? do_raw_spin_unlock+0x55/0x230
[  157.180125]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[  157.185152]  drm_ioctl_kernel+0x141/0x2b0
[  157.189223]  ? lock_acquire+0x1a2/0x210
[  157.193137]  ? __pfx_drm_ioctl_kernel+0x10/0x10
[  157.197750]  drm_ioctl+0x489/0xb30
[  157.201240]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[  157.206287]  ? __pfx_drm_ioctl+0x10/0x10
[  157.210273]  ? __pfx_lock_acquire.part.0+0x10/0x10
[  157.215153]  ? __fget_files+0x1a2/0x2f0
[  157.219048]  ? lock_release+0x130/0x2a0
[  157.222947]  ? __fget_files+0x1ac/0x2f0
[  157.226868]  __x64_sys_ioctl+0x12e/0x190
[  157.230964]  do_syscall_64+0x66/0x150
[  157.234701]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  157.239813] RIP: 0033:0x7f454811916f
[  157.243425] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 
00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 
05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00
00
[  157.262274] RSP: 002b:00007f45327019f0 EFLAGS: 00000246 ORIG_RAX: 
0000000000000010
[  157.269929] RAX: ffffffffffffffda RBX: 0000560b36153720 RCX: 
00007f454811916f
[  157.277138] RDX: 00007f4532701a90 RSI: 00000000c03864bc RDI: 
0000000000000014
[  157.284321] RBP: 00007f4532701a90 R08: 00007f451402dd40 R09: 
00007f4514000090
[  157.291552] R10: 0000000000000000 R11: 0000000000000246 R12: 
00000000c03864bc
[  157.298761] R13: 0000000000000014 R14: 00007f4514018740 R15: 
0000560b372a9c80
[  157.305985]  </TASK>
[  157.308223] irq event stamp: 16371
[  157.311672] hardirqs last  enabled at (16383): [<ffffffffb66c4c0e>] 
__up_console_sem+0x5e/0x70
[  157.320365] hardirqs last disabled at (16394): [<ffffffffb66c4bf3>] 
__up_console_sem+0x43/0x70
[  157.329049] softirqs last  enabled at (16410): [<ffffffffb650e832>] 
handle_softirqs+0x502/0x6b0
[  157.337831] softirqs last disabled at (16405): [<ffffffffb650eae7>] 
__irq_exit_rcu+0xf7/0x160
[  157.346424] ---[ end trace 0000000000000000 ]---





>                     if (!ret) {
>                             if (drm_WARN_ON(obj->dev, map->is_iomem)) {
>     -  dma_buf_vunmap(obj->import_attach->dmabuf, map);
>     +  dma_buf_vunmap(obj->dma_buf, map);
>                                     return -EIO;
>                             }
>                     }
>     @@ -405,7 +405,7 @@ void drm_gem_shmem_vunmap(struct
>     drm_gem_shmem_object *shmem,
>             struct drm_gem_object *obj = &shmem->base;
>
>             if (drm_gem_is_imported(obj)) {
>     -  dma_buf_vunmap(obj->import_attach->dmabuf, map);
>     +               dma_buf_vunmap(obj->dma_buf, map);
>             } else {
>                     dma_resv_assert_held(shmem->base.resv);
>
>     -- 
>     2.48.1
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

