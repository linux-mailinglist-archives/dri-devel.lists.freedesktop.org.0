Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E77BFA553
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 08:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B95F10E6BD;
	Wed, 22 Oct 2025 06:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="oQGf4jIW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DaVhkWgu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AXnzepi1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d38IKGfc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A1E10E6BD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 06:51:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4BDDC21153;
 Wed, 22 Oct 2025 06:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761115895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5bBztiQKe3McWuotMfa8daU8SawULlhXGzCVd2U9PWQ=;
 b=oQGf4jIWyYg8hPowPD1gunncA0B32wEvvYxYa/a7DoTqdaWRx8615NNap23JvpL1JfcmOE
 DYcfN4Hr92hp00c9jzLPNMzqE2GePEHjBcdDhRGt1J+dYm642DZlE5+EiaJoMCCu/hAvOf
 dUvMMdZFwND1yOQJd8Qc6m7AWG2Ney4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761115895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5bBztiQKe3McWuotMfa8daU8SawULlhXGzCVd2U9PWQ=;
 b=DaVhkWguqUtCXutsreZIvTEa+ypkUd0mGiVvCfIv0em45o0IoHM1+5qmYZw+7MosZbnb0D
 pzon05Nk5ZXQ8kBg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AXnzepi1;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=d38IKGfc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761115891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5bBztiQKe3McWuotMfa8daU8SawULlhXGzCVd2U9PWQ=;
 b=AXnzepi11WJ4biS5HQsnFB1GSCFLGdeZBy7U9PgnAov9bP2f6pBu4OD5OfxVmcJDijwYrb
 dhgUg12UTXdkvpeji18T8mwwB4DO0XSHO5OEB1wFkI4rYnTFHsmNVhKZx+ABwzJmR9vRfY
 q+wc2QllXcdTGOdjtsqpEZwMxAfbuR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761115891;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5bBztiQKe3McWuotMfa8daU8SawULlhXGzCVd2U9PWQ=;
 b=d38IKGfcrSnptjTiDfPTEXIBtOA7pdeTyFWLxW39gsJmM0symN49RufUh9/JvLU4rmvcD3
 zrGJemTP+ZEobgCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03F8213A29;
 Wed, 22 Oct 2025 06:51:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LsNgO/J++GgjcAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Oct 2025 06:51:30 +0000
Content-Type: multipart/mixed; boundary="------------IFq0UOMYTWshbPHE0miIKq0X"
Message-ID: <43992c88-3a3a-4855-9f46-27a7e5fdec2e@suse.de>
Date: Wed, 22 Oct 2025 08:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] Screen goes blank with ASpeed AST2300 in
 6.18-rc2
To: Peter Schneider <pschneider1968@googlemail.com>,
 regressions@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 jfalempe@redhat.com, airlied@redhat.com, dianders@chromium.org,
 nbowler@draconx.ca, Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20251014084743.18242-1-tzimmermann@suse.de>
 <a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com>
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
In-Reply-To: <a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com>
X-Rspamd-Queue-Id: 4BDDC21153
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.41 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 MIME_BASE64_TEXT(0.10)[]; MX_GOOD(-0.01)[];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:mid,suse.de:dkim];
 FREEMAIL_TO(0.00)[googlemail.com,lists.linux.dev,vger.kernel.org];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+,1:+,2:+]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[googlemail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 HAS_ATTACHMENT(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:email, suse.de:mid, suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.41
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

This is a multi-part message in MIME format.
--------------IFq0UOMYTWshbPHE0miIKq0X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

Am 22.10.25 um 05:27 schrieb Peter Schneider:
> #regzbot introduced: 6f719373b943a955fee6fc2012aed207b65e2854
>
> Hi all,
>
> I have encountered a serious (for me) regression with 6.18-rc2 on my 
> 2-socket Ivy Bridge Xeon E5-2697 v2 server. After booting, my console 
> screen goes blank and stays blank. 6.18-rc1 was still fine.
>
> The machine has an Asus Z9PE-D16 server mainboard with an onboard 
> ASpeed AST2300 VGA chip with 16MB VRAM. I have attached an older HP 
> Monitor to it via old VGA jack/cable. It also has a second graphics 
> card in a PCI-E slot; an older NVidia GTX 560. It is not connected to 
> a monitor, but I have configured it via kernel command line for 
> PCI-pass-through to VMs running on this server (I use Proxmox VE, i.e. 
> QEMU/KVM virtual machines). Currently, no VMs use this yet, and also 
> no VMs are autostarting with machine boot. So when this regression 
> occurs, the server is idle. Pressing a key on the keyboard does not 
> make the screen come alive. The server is running fine though, and I 
> can access it via SSH. It just has no graphic output anymore. In case 
> this is important, the machine also has a ASMB6 BMC (can be used via 
> http).
>
> I have attached dmesg output from both 6.18-rc1 which is fine, and 
> 6.18-rc2 which exhibits this bug. I have bisected the issue, please 
> see attached git bisect.log.

Thanks for the detailed bug report.

Attached is a patch that partially reverts the broken commit. Could you 
please apply it on top of the broken kernel and report on the results?

Best regards
Thomas

>
> The bad commit is
>
> commit 6f719373b943a955fee6fc2012aed207b65e2854
> Author: Thomas Zimmermann <tzimmermann@suse.de>
> Date:   Tue Oct 14 10:46:34 2025 +0200
>
>     drm/ast: Blank with VGACR17 sync enable, always clear VGACRB6 sync 
> off
>
>     Blank the display by disabling sync pulses with VGACR17<7>. Unblank
>     by reenabling them. This VGA setting should be supported by all 
> Aspeed
>     hardware.
>
> When I revert this from 6.18-rc2, the issue goes away and my console 
> screen works again.
>
> I just saw that Greg just yesterday evening included the offending 
> patch already in stable RCs 6.12.55-rc1 and 6.17.5-rc1, so I'll test 
> these seperately and send a mail to the stable mailing list, too, if 
> affected (which I anticipate).
>
> Beste Grüße,
> Peter Schneider
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


--------------IFq0UOMYTWshbPHE0miIKq0X
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ast-Set-clear-screen-disable-bit.patch"
Content-Disposition: attachment;
 filename="0001-ast-Set-clear-screen-disable-bit.patch"
Content-Transfer-Encoding: base64

RnJvbSA1ZmRlYTJlOTkzNmE0OTkwNTkwMmUzMzllNjI3YTI3YjBhYjBhODg0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogV2VkLCAyMiBPY3QgMjAyNSAwODo0ODo0OSArMDIwMApTdWJqZWN0
OiBbUEFUQ0hdIGFzdDogU2V0L2NsZWFyIHNjcmVlbi1kaXNhYmxlIGJpdAoKLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCmluZGV4IDljZTg3
NGRiYTY5Yy4uYjczNDM3MDgzZGJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCkBAIC04
MjAsNiArODIwLDcgQEAgYXN0X2NydGNfaGVscGVyX2F0b21pY19mbHVzaChzdHJ1Y3QgZHJt
X2NydGMgKmNydGMsCiBzdGF0aWMgdm9pZCBhc3RfY3J0Y19oZWxwZXJfYXRvbWljX2VuYWJs
ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0
ZSkKIHsKIAlzdHJ1Y3QgYXN0X2RldmljZSAqYXN0ID0gdG9fYXN0X2RldmljZShjcnRjLT5k
ZXYpOworCXU4IHZnYXNyMSA9IDB4ZmY7CiAJdTggdmdhY3IxNyA9IDB4MDA7CiAJdTggdmdh
Y3JiNiA9IDB4ZmY7CiAKQEAgLTgyOCw2ICs4MjksOSBAQCBzdGF0aWMgdm9pZCBhc3RfY3J0
Y19oZWxwZXJfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVjdCBk
cm1fYXRvbQogCiAJYXN0X3NldF9pbmRleF9yZWdfbWFzayhhc3QsIEFTVF9JT19WR0FDUkks
IDB4MTcsIDB4N2YsIHZnYWNyMTcpOwogCWFzdF9zZXRfaW5kZXhfcmVnX21hc2soYXN0LCBB
U1RfSU9fVkdBQ1JJLCAweGI2LCAweGZjLCB2Z2FjcmI2KTsKKworCXZnYXNyMSAmPSB+QVNU
X0lPX1ZHQVNSMV9TRDsKKwlhc3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX1ZH
QVNSSSwgMHgwMSwgMHhkZiwgdmdhc3IxKTsKIH0KIAogc3RhdGljIHZvaWQgYXN0X2NydGNf
aGVscGVyX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0Yywgc3RydWN0IGRy
bV9hdG9taWNfc3RhdGUgKnN0YXRlKQpAQCAtODM1LDYgKzgzOSwxMCBAQCBzdGF0aWMgdm9p
ZCBhc3RfY3J0Y19oZWxwZXJfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRj
LCBzdHJ1Y3QgZHJtX2F0bwogCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3Rh
dGUgPSBkcm1fYXRvbWljX2dldF9vbGRfY3J0Y19zdGF0ZShzdGF0ZSwgY3J0Yyk7CiAJc3Ry
dWN0IGFzdF9kZXZpY2UgKmFzdCA9IHRvX2FzdF9kZXZpY2UoY3J0Yy0+ZGV2KTsKIAl1OCB2
Z2FjcjE3ID0gMHhmZjsKKwl1OCB2Z2FzcjEgPSAweDAwOworCisJdmdhc3IxIHw9IEFTVF9J
T19WR0FTUjFfU0Q7CisJYXN0X3NldF9pbmRleF9yZWdfbWFzayhhc3QsIEFTVF9JT19WR0FT
UkksIDB4MDEsIDB4ZGYsIHZnYXNyMSk7CiAKIAl2Z2FjcjE3ICY9IH5BU1RfSU9fVkdBQ1Ix
N19TWU5DX0VOQUJMRTsKIAlhc3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX1ZH
QUNSSSwgMHgxNywgMHg3ZiwgdmdhY3IxNyk7Ci0tIAoyLjUxLjAKCg==

--------------IFq0UOMYTWshbPHE0miIKq0X--
