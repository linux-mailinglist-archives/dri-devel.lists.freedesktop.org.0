Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4ED9F0692
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 09:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1714910EF5A;
	Fri, 13 Dec 2024 08:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uXUKKijp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sxDj1iJq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uXUKKijp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sxDj1iJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464E010EF5A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 08:41:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0858F1F394;
 Fri, 13 Dec 2024 08:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734079287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oSsHN5+J9d02VhyHWuNhjfQNarpFE5UJ1kpmx6k1wTg=;
 b=uXUKKijp5KT/0OYL8V9MqL/7RWTxlQSg1dP9KZ3moEXBSlpwKVsN1eElbSZfeMBHc1Ixw/
 WajNzw1IJGKKZYNXvNYhzIl1UonULRyz3gI5MmiwGTCA7F+oBuNsW2l5D1wSsFXiyGxxUF
 AA02cgBL7AJCHIUej0VZy+8DP5zlko0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734079287;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oSsHN5+J9d02VhyHWuNhjfQNarpFE5UJ1kpmx6k1wTg=;
 b=sxDj1iJq2kYjPASgzIzsJzhp2H7fGcg4VaZZYX/WnjwZs+ASlN09yn6LI8S+o3wlB2qSIF
 MuIA8k/UiiOkMnAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734079287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oSsHN5+J9d02VhyHWuNhjfQNarpFE5UJ1kpmx6k1wTg=;
 b=uXUKKijp5KT/0OYL8V9MqL/7RWTxlQSg1dP9KZ3moEXBSlpwKVsN1eElbSZfeMBHc1Ixw/
 WajNzw1IJGKKZYNXvNYhzIl1UonULRyz3gI5MmiwGTCA7F+oBuNsW2l5D1wSsFXiyGxxUF
 AA02cgBL7AJCHIUej0VZy+8DP5zlko0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734079287;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oSsHN5+J9d02VhyHWuNhjfQNarpFE5UJ1kpmx6k1wTg=;
 b=sxDj1iJq2kYjPASgzIzsJzhp2H7fGcg4VaZZYX/WnjwZs+ASlN09yn6LI8S+o3wlB2qSIF
 MuIA8k/UiiOkMnAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B1C1B13927;
 Fri, 13 Dec 2024 08:41:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EqaQKTbzW2f1IwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Dec 2024 08:41:26 +0000
Content-Type: multipart/mixed; boundary="------------z22sf2S97md0PwkqFF47hyBe"
Message-ID: <690acce6-3e57-4731-9949-f8bb06d9cb58@suse.de>
Date: Fri, 13 Dec 2024 09:41:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Christophe Leroy <christophe.leroy@csgroup.eu>, javierm@redhat.com,
 arnd@arndb.de, deller@gmx.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
 <8403f989-c1de-48c9-ab48-83c1abb9e6f2@csgroup.eu>
 <5484d576-d63e-4166-85ea-0b508b0cb865@suse.de>
 <1248a2b6-71b0-4909-917f-a5605415a816@csgroup.eu>
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
In-Reply-To: <1248a2b6-71b0-4909-917f-a5605415a816@csgroup.eu>
X-Spam-Score: -7.13
X-Spamd-Result: default: False [-7.13 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 NEURAL_HAM_LONG(-0.93)[-0.929];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 MIME_BASE64_TEXT(0.10)[];
 FREEMAIL_TO(0.00)[csgroup.eu,redhat.com,arndb.de,gmx.de,ffwll.ch,gmail.com];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+];
 RCPT_COUNT_SEVEN(0.00)[10]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
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
--------------z22sf2S97md0PwkqFF47hyBe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi


Am 13.12.24 um 09:33 schrieb Christophe Leroy:
>
>>
>> The attached patch selects backlight support in the defconfigs that 
>> also have PMAC_BACKLIGHT=y. Can you please apply it on top of the 
>> patchset and report on the results?
>>
>
> That works for the defconfig but it is still possible to change 
> CONFIG_BACKLIGHT_CLASS_DEVICE manually.
>
> If it is necessary for PMAC_BACKLIGHT then it shouldn't be possible to 
> deselect it.

Here's another patch that make it depend on BACKLIGHT_CLASS_DEVICE=y. 
Can you please try this as well?

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

--------------z22sf2S97md0PwkqFF47hyBe
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-add-BACKLIGHT_CLASS_DEVICE-on-PPC-defconfigs.patch"
Content-Disposition: attachment;
 filename="0001-add-BACKLIGHT_CLASS_DEVICE-on-PPC-defconfigs.patch"
Content-Transfer-Encoding: base64

RnJvbSBhYzljN2MzZDk0MTMwMjFlN2ZhZTA2OTY2MTYwZDU4ZWIzYzVjNWQ3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogRnJpLCAxMyBEZWMgMjAyNCAwOTowMjo0MSArMDEwMApTdWJqZWN0
OiBbUEFUQ0hdIGFkZCBCQUNLTElHSFRfQ0xBU1NfREVWSUNFIG9uIFBQQyBkZWZjb25maWdz
CgotLS0KIGFyY2gvcG93ZXJwYy9jb25maWdzL3BtYWMzMl9kZWZjb25maWcgfCAxICsKIGFy
Y2gvcG93ZXJwYy9jb25maWdzL3BwYzZ4eF9kZWZjb25maWcgfCAxICsKIGRyaXZlcnMvbWFj
aW50b3NoL0tjb25maWcgICAgICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9jb25maWdzL3BtYWMzMl9kZWZjb25maWcgYi9hcmNoL3Bvd2VycGMvY29uZmlncy9wbWFj
MzJfZGVmY29uZmlnCmluZGV4IDU3ZGVkODJjMjg0MC4uZThiM2Y2N2JmM2Y1IDEwMDY0NAot
LS0gYS9hcmNoL3Bvd2VycGMvY29uZmlncy9wbWFjMzJfZGVmY29uZmlnCisrKyBiL2FyY2gv
cG93ZXJwYy9jb25maWdzL3BtYWMzMl9kZWZjb25maWcKQEAgLTIwOCw2ICsyMDgsNyBAQCBD
T05GSUdfRkJfQVRZPXkKIENPTkZJR19GQl9BVFlfQ1Q9eQogQ09ORklHX0ZCX0FUWV9HWD15
CiBDT05GSUdfRkJfM0RGWD15CitDT05GSUdfQkFDS0xJR0hUX0NMQVNTX0RFVklDRT15CiAj
IENPTkZJR19WR0FfQ09OU09MRSBpcyBub3Qgc2V0CiBDT05GSUdfRlJBTUVCVUZGRVJfQ09O
U09MRT15CiBDT05GSUdfTE9HTz15CmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvY29uZmln
cy9wcGM2eHhfZGVmY29uZmlnIGIvYXJjaC9wb3dlcnBjL2NvbmZpZ3MvcHBjNnh4X2RlZmNv
bmZpZwppbmRleCA0ZDc3ZTE3NTQxZTkuLmNhMGM5MGU5NTgzNyAxMDA2NDQKLS0tIGEvYXJj
aC9wb3dlcnBjL2NvbmZpZ3MvcHBjNnh4X2RlZmNvbmZpZworKysgYi9hcmNoL3Bvd2VycGMv
Y29uZmlncy9wcGM2eHhfZGVmY29uZmlnCkBAIC03MTYsNiArNzE2LDcgQEAgQ09ORklHX0ZC
X1RSSURFTlQ9bQogQ09ORklHX0ZCX1NNNTAxPW0KIENPTkZJR19GQl9JQk1fR1hUNDUwMD15
CiBDT05GSUdfTENEX1BMQVRGT1JNPW0KK0NPTkZJR19CQUNLTElHSFRfQ0xBU1NfREVWSUNF
PXkKIENPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFPXkKIENPTkZJR19GUkFNRUJVRkZFUl9D
T05TT0xFX1JPVEFUSU9OPXkKIENPTkZJR19MT0dPPXkKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWFjaW50b3NoL0tjb25maWcgYi9kcml2ZXJzL21hY2ludG9zaC9LY29uZmlnCmluZGV4IGJm
MzgyNDAzMmQ2MS4uZDAwZTcxM2MxMDkyIDEwMDY0NAotLS0gYS9kcml2ZXJzL21hY2ludG9z
aC9LY29uZmlnCisrKyBiL2RyaXZlcnMvbWFjaW50b3NoL0tjb25maWcKQEAgLTEyMCw3ICsx
MjAsNyBAQCBjb25maWcgUE1BQ19NRURJQUJBWQogY29uZmlnIFBNQUNfQkFDS0xJR0hUCiAJ
Ym9vbCAiQmFja2xpZ2h0IGNvbnRyb2wgZm9yIExDRCBzY3JlZW5zIgogCWRlcGVuZHMgb24g
UFBDX1BNQUMgJiYgQURCX1BNVSAmJiBGQiA9IHkgJiYgKEJST0tFTiB8fCAhUFBDNjQpCi0J
ZGVwZW5kcyBvbiBCQUNLTElHSFRfQ0xBU1NfREVWSUNFCisJZGVwZW5kcyBvbiBCQUNLTElH
SFRfQ0xBU1NfREVWSUNFPXkKIAlzZWxlY3QgRkJfQkFDS0xJR0hUCiAJaGVscAogCSAgU2F5
IFkgaGVyZSB0byBlbmFibGUgTWFjaW50b3NoIHNwZWNpZmljIGV4dGVuc2lvbnMgb2YgdGhl
IGdlbmVyaWMKLS0gCjIuNDcuMQoK

--------------z22sf2S97md0PwkqFF47hyBe--
