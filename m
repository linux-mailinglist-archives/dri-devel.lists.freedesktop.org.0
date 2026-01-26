Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOrSJ9xmd2nCfQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:06:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D33488962
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAB610E414;
	Mon, 26 Jan 2026 13:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="HbPbSt8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A3410E414
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 13:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1769432788; x=1770037588; i=markus.elfring@web.de;
 bh=iw8eyQhMIt8IkB9d7ySnjFRJGJshWsXl3KzyAjYzWRc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=HbPbSt8PRwmeB8qmAQX3Mi/ZBtJJY1ltRX1Q6z1tREUtlFpkr4+TapvvY42xMS3e
 MA4IC4cUEl635R8OCAM7qM6wO8TruiYoPHC4odhPRkiEeL7XPeE7Up8AZ+XE85txV
 fRKtH1c0TZTgdRC/EHzL0nYEYyVUu9+cQnJT9xmkKAtmkzPhwtdf/pMVYdnP+Av07
 HOYEOEuxmoJF6iEW0wv4VU4lDzZEPMu3DJmNlZR3m2bimjA6jMsc8swHJbLVe4KI5
 AhuONy2Pgf7Ojym19ZAvxPIG7DwkjLCA7Pz4rhw2idrWsBijlzNuxDk4XkZ55tJDt
 P7mWRQomRl92u2zn5g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.253]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Myf3x-1vyTOr15Bd-00z2cp; Mon, 26
 Jan 2026 14:06:28 +0100
Message-ID: <6d182a81-7033-4df7-834f-1c6b7252f38a@web.de>
Date: Mon, 26 Jan 2026 14:06:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zack Rusin <zack.rusin@broadcom.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260125162357.2164209-1-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH] drm/vmwgfx: fix a potential memory leak in vmw_ttm_bind()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260125162357.2164209-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0OXEHSY0HTzto1Obz0496BmqCkbPGrvQLnDP0/8Q34nyxzhk7V+
 DTJpY1yVuqGT/Ifp1JC8qKY2b34pJyr6mTCO+g+MIeXQCabRseKpYA8hRLz9aMCh53Hb+84
 H5kcOEICafEsvshCOuqhFqrM+DIoiGV+ZVZaj07j4Hd+AK+bgfXC0B/9sBJivcMgw4wo8+C
 /o54lzZoDhwzaXNUTrnaQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/rJbw4A/6EM=;oldKI67G1cwvYQvwaTBlg14phgV
 rvHlVQDsKE8kaRR8+V0shWVY4LPQcqnFglfY/TRUFhCHtm7DZ0Nvub5ZVtOkPr2u4JS329lcY
 3C8WDXTTDkY5f+RVEY2Eu2WFhSeJygtP6VTEH12wLTepYWF7UgwRhB8WEuF2xo8Ay9v3VzDbU
 Vs9bIjYynwIy7LJ5SLuwE28QHMVN/0IHwGY42hQvxzJ/c6SiRq8sMRpwrERgk5JOS/11W3cJ1
 DsZcEnY94xGnoFoPzl1AP+hwLWkEesqfdz26I+Z9K7cL6V8OPyRTYzr1hkL09g3ForbGbQkqT
 BezpcvN/v+kQRmQj77vLuCAz11BROcJK3rYHYB1QAUiOFGOB6K451LCxdZzkdzu1GHn3L0dCS
 zdRyoxFLzsG+NHjSLqCKvDczamuitZ4+Gm5M0XqvZbzR9Qg+QJnqZzGSWMGhaaxkeqvEBKcaY
 /Pm1u8NphiE6zr1ZGe5lnlSVsFmKuybwY7gEiHGUwayVg0+E2apRKatHeq9kPC1yWGQUD2hNT
 l+mk1mIrTQG68mPDb5uuICqmMVSMb9oaHwKE3p/1FkOcwffiQdBKD+7Cy3W5onPmTmpROwWqU
 pzMaVKPWRvXxXevoGQdM6HcBM4XQrOQaz/dnz5j9F7ghcdJXRZr6H/0VyOb3DWNQGM+JVSr7p
 zfy6p1sC8//iGX6iK+MCRNOotIjr+LVT9BfZfNn9xkeoPisgkbcEILV2atLaXf5OmtSzCEwrZ
 mbs2pkFrcXtljMTMFAiRo3MpjCKSusOBXARPbj/ayIIQbgaZI/aAeDrRN58Z5hCLo/KWmPZRY
 lx3l6/e4wC8On2KJ8FdfCu6IjlwFDm58Zej3TKrp2BEgEDmA6O31+DGP5ISvJA0RLk6JntBbW
 pnjtmkdOLGeJSl3u6J5W8tr0brd4BA8BRaOYoefhjUddb/TBYiLJanNANughAcanHP3e3Imp/
 7XyhVSbuboRZIZjp/0RlZ8GsiDliyhAq7iY5FoZh+47ViR+cXfeuCaH802FRNq4l+8VVB9gr0
 YQkGS0axlLBxFbpqNFysppX2ytygJYeDCOyg+4ONFyMTpacyusG62dkSyjuY5mCC5DTB9NAgr
 X1LkZkr6AW/mHZsFQ1/pMriBQEecgoLw7Kxh73GuIvPRi+LAsjJT15F9sxE9dEsoEyXA5PMZJ
 +huCAt93JmeZ+tVJnpLEo1tL1fcx6bOdmIJwnbbPFiADdXWY6PKa7yfZjzGaCK+qLHEI9Y6Od
 /nZMhBEJu47XTUQ9UQNhb9wN/75D8NxLJawvF75/3Xpg9knslWfPkBjmiz6gFwvnmqtX/Z3kX
 awFB1x6QpMehFqD7fBlcaPmTxgCoAXFq/p7/4a4oVBFbKdSFT3BWS/w7t5d8ysdbzH+yDs3mD
 zNKOL9BQnfB8z1QJX2THQqAJiUmdH2nGIjZEZqOxDSwj7qmenw/r2b7DSxAVU7dFYmQc2MzbS
 PnWxQ3iVJaOLwmd1H8TPKHwwJwkk7REM6YE2uoc+HPHpv2qSfI5Lnkkg7AnOfb87TFlfKOUXp
 qYqg+w+sIjWa62geZ/ycOdOOjZOi80VZKPJcgTxNwOKJVkCn3ZVxMX20zfKOsVxTpvViY3sqF
 BR/ffEL5oZbeSfhaKOpsXHBJ+ClJ94iqtmSrzUkwEVpn9rKEYIS3ddCbF/s1gm/7XA4Xs9ZTE
 KRBe51XZAXVNZGpdj497SFa9C9WJCY7Z/27En+JwVt0Fvb+YY1Lj6/9+VDTDj1NZGhJQDSGRo
 3YsebOwf2I7XVytDVC5fLu55UD4g7Xue5XpYF69MrvTVuKW/oX+jqmgitD/gl9oLpDATQlUf+
 DymbD9r12C/FRZi01fn/gJncGqjr2TNEOEn4N1FnOkU1JRTjCHEQyWN+xjqc8gXQmemtGiXhs
 nx6DwacZZLbFgSG065Z/WOo4fDRx0qHOpmbYKLjQxheQXV7N2c9SwXfPVzmjRATYBXAIhRBg1
 vOf4RQMjlcHn0Ud4KEQyQ2O4a5MU4rGXSCNpPam0IBPC7B5WRizIcbWgd8CMN6EV/p/7XVSDF
 sVJDkKhpD+E9zMVcCDrOr42PzlXU14SNX/YjvM89cEdZAUE2ve2DvuVV5K9mk3qYgegsDfMOr
 P2qDcoSWPdaN4N6FOk12UiCV1mA7LnTPYHB/XPsx9hlQqQXiofQOIkDggMrHBaneSyDR4kEsq
 REF6BlyztmAYm86Y4Bx8ZL3v7x2dQj1gX0SozoPpNGR6p/4G4prP6A6fevcQ445/K6ukl8Dzq
 GsJxRewuI1h4nOPtNRbyj7PxKcRaLgsmqWkEQ5nmu6Fd+9UQu61Fdf9k5Gk8ArpFCjr1qUScR
 /VX3g2/O3e+4Gq+vmI0HBntpPaGzqYEzPtC/5fdnz4mrjGaSwymVJx8KAEScJNw+6d8RdUYyX
 q3ZZ38DF/cP68w6p9OBOOgvGcAmHmqa3jvV1iFW9C/9VglUPNscPcwLeV64wXQieYwsx3vLat
 hT3U+95qn5oUWdAZmhtkh7NPUtxCk6GeFIQiNYI+gbzRwp/65KyGxyHZ1pY6PbXsMUErLq7wR
 8HayQSFcd/gLnx3UwPf+eB07y89eBZD/U2a8v6Bn0ZZ5kRuf21gt6q+XURoFRwr9K5rfRpdrk
 4SNBnoQtCVTAgMCk/Cnny7VXPOhU1Q4Bmb+HJq5DRUx+96UEzGGswCALsMQdKTL5c8ro/krpN
 8wBw49WvCqwtchoGt3KO6XdW7ndq/eadAY08oCwDCkGKOTV4+Sk87cnHF33CUW0c1KDW0VVbP
 qihOSfiStK4Iw1mq4acLA1crAF0rAB/5LDIgqKVldMo7idY2FYeYRdpevffvcM5VjEQaSh1N0
 v/UiW/Wby3ZzqjCDqB21NXh6cAzGQNzKfgmaCzrBpIt46aGvaTNx9iUXZ4l4p8q5qGZEX6Sfx
 WHvBIW9d903TFSfJu3CYvanjzlv9Yu6V5pFCY43VBS4rCKTPaxDAIreVdxbiZcodkhbZOHr9T
 euekdc5su/7jWdeeeQjPQiLOSrbY/+zeKND0v9N2kuF0vy8wUuvz8rcQmx1NjEEgABl8a7YYL
 +CN4HPhnWv/XS6h8EOEQfEBCKPcPUihs25YuxEhy75dC6Rs3OIVHl689MJe/oWqE/HseLYhTJ
 VFRfuow/XIcqkusu429jr5QO+XYmAxKzRLsG9z2M6AZW9qDtUxsRw/07BuvoB9zuAX/sAG0r7
 xm0odAn5nDuuzzJYukGqio6iO+0ED2KSVFF0HCQ6h5EpkPhq3FbEiFWsHv/LXEYuMTPl+9fpO
 tiV8plcKuf2aD+yUaPR0ZR2KRXFE8Sw+3uZivnOmq6Bd5B5IGduQUDCPpTFQcysNcfigfU3Og
 mv/+bkh1BZtTLL5mBxVVoRU6RBTQFapTyggeztAmfKvmCsNgFZj2MBLFNq6Fa7GMckR+rC4Ff
 /qCqcbfL3E/1OHXfZhnNsMub0VD9l5E6X9EbOPcOFKFmGzxz7jWxj3+uHKlGxPXJk5xMjCyoB
 HnR0KFZvSEyZQIvbeDzqIjMQlFCMjPJginWZqFvQRYeX/iBCuRkqJvXR7HVef337R3KnyDz1B
 0MdFGsc2Tr3idWWdsNtrTjZviKUpeo+ncWTyeAyvtKU7OzlnvzOYkj0+XFQJNwH38KEXQefZa
 UR+4Zd9t1xqVh7/T+igwkQL3m2faHP4mbU9lQgW3lylS+B69jjwFF3S2QVNbdAANlN6d5ASQ1
 wdAdI2GRQQUa0eQSplY3lr+krYK6SiNGjeC6d6YU7WIQZnK0ZiKPn1sgCh0DkMaWNHUVzRi7O
 0B1R4jWy2tEzTxsBV//tb9S+hlNVqNyQiA+dOGNL59zeC/rAPs0kQXI7IWoFtMx8+t1BSNfRk
 nj3kgX4Z/55CkUCd15aieqrz2DOFVAMuPcHz2QGHPFxec4HHGCE+QufvsP4Prh7x1ebF0PX05
 CfF8Mc3ZjVIqd12KnZ8LarYFxjmy0EY/hz2JJPXQ4AVc55jJMYvM9VfxGcbFesyGwi1S69+Lt
 2XL2QH/XepL91mUgLlkGj3CdyfKarWZt/W6/94Dd/4GTf5ZF4QX+N/RFnKLIrohYF7/7sY8It
 /c3XP9O4NbQEHWhyyw0U8VPTir9RBx2j4cbBle4In+sq+qOdeeCrx92sFyAL1z+c89SgrfIlF
 2/1VOTUoV1CgZdWr9nI2ArUzMEhzUCpVxpJLH9GeraY3IIdUpqYOMUrmMBdCQOBOEn1OVQ/g2
 W8CLJlinkDwfOnQaRWJFOFC0lnTewvDe7Q6J3aSY52+QZRmU1Hzp8rk9nOdyoj05s2+6DvCxa
 1qYWAhGknpbOK2IpnYYx621IsQ4T5kOBYVDx1ETyY5GCMNtprHAe1mXdc6IKJGgsWDJC0ZSq4
 ebs6WWoQIK2oMfuQ4jW7/+f0zjqTGxewwd04s4aM0d2AiMPIiiSMosb2zONLZbE8HqKeNKHw9
 OxwOl3KGX9CCEmyKOHkU6ZcPWC/DnZEvZAVqAN5PCYVlp2MlZLqznunWv23qPjqPYJ2fLw7Vq
 GgpqRO/tiwjmKitpOveYEVVDZEQWprBZITIAgwcuG14LANcEBlAHQBUk6iXzNy5bMszhlHkFf
 X0+FJTbxlPIlrf3LYjV2cas9SuCMVTI05u3aIvwoVILQ3eKj8/04N2+G3zGanZJjWZ+SimE44
 9PCBJQAr1UwPwXrXX6a14KCbKHsix24PZ2WcOTihLpLbFsxrQsumfWwtryB7f9q3tNIZ5biHY
 OY4MjYMs6bDJZmtiDbH+Q06syzhUhnYJmZ8y9FhCINTEG7PDsKVFo7nk/Aedn4GTQwFkWArlF
 6vpWiX4us4nK1P7/hWVk7SDpiN1DUUWTs3DIbiNfvQm807KzWgEzkc9Vb/IOO0D65bQEFcC70
 ymgBDWuhypn6crcHyoTyUfhSKNkhIVCqESMO6snsHttJZKoH9am97ZMX9DWVAIyw0kEhUrko9
 hl2DlfiDX276GdXNlRqfldflebwkiZ61lr0+x3YieVKBQ4IU1XIFYxb85/RCQwKD3U5TbBc1t
 uDJx7QLo3AD8f3IbY696Xn380gA30DIqB9bDLWXHHB8c62gsXXyNTO6pzX16bnxjxIcKJNTdK
 RQ1RwqO2Oxx8rQWdxCDN6VSpeR2dDFosDbNxNeclHMbS9IORi7KeJXkcPH8FPtUHSBzN2x5wL
 SsS4VrV1RqorLxcW2tzsm9FDCHeNfd/xxgTmjdGHykjaKpqW9Z5zhrmdOp7uT7M4vO69ykubI
 1MWL91+W8wpGzyqoz3w410skMVpQJHBnCU3yAdGZp2YhvayKkVg==
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:lihaoxiang@isrc.iscas.ac.cn,m:bcm-kernel-feedback-list@broadcom.com,m:airlied@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:zack.rusin@broadcom.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[isrc.iscas.ac.cn,lists.freedesktop.org,broadcom.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0D33488962
X-Rspamd-Action: no action

> In vmw_ttm_bind(), if vmw_mob_create() fails, call
> vmw_ttm_unmap_dma() to release the memory allocated
> by vmw_ttm_map_dma().

* Would an other word wrapping be nicer?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.19-rc7#n659

* How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and=
 =E2=80=9CCc=E2=80=9D) accordingly?


Regards,
Markus
