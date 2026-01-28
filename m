Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CtuMl4PemnH2AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 14:30:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCD4A229C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 14:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A42E10E6CF;
	Wed, 28 Jan 2026 13:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="PEQjXSR3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAE410E6CF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 13:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1769606980; x=1770211780; i=deller@gmx.de;
 bh=zGl6P2hWQuFb/WAZWna46mFr30odDI7nl+47dtIXaVk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=PEQjXSR3X4SlHT2rkjcj9QNrpqKMkg8zHIm2Am5eYXvyf6BB/F9XXBkua7vZ4h/v
 wGOj9uFlmtk9K2dSYCzEaZGqxvei7lWo2US6KAfx2NBJkbC9sg5l7JP/qDY6IJs2M
 j8X3ie4hRDQk5RjpdynNUY9OftdcuMFDIi2+1HX+z13iDDEdXW36CKnT1GaAeiWtm
 RlDthl3AuXq4CF3u1/58bUsRI74hucWb0Jao3wHLrTF1ATNKE6QSafXeJqx/+C0jJ
 tvckTp5cKKPSDlY7rQEcxCB6UVxAZeZXe7ZRVUc7MCrlUP43AKbMQ2ge8vtmPbind
 oO2nj/jU73NOcnFrWw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeU0q-1wLWMR3EtI-00cmmO; Wed, 28
 Jan 2026 14:29:39 +0100
Message-ID: <9ca6e1cc-7469-450b-a58f-9279412fb9de@gmx.de>
Date: Wed, 28 Jan 2026 14:29:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: au1100fb: Add missing check for clk_enable
To: Chen Ni <nichen@iscas.ac.cn>, u.kleine-koenig@baylibre.com,
 elfring@users.sourceforge.net
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260128091004.2747011-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260128091004.2747011-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xJD0tPvPQqSC36NKJK9LpAL0zf5WHtzFSAfat0mUlIMtRyetW9D
 38/UI8vBkAqFAUA44fpcSf3yUPSmuaFLbBPA+Ol/iqdlQF0Jd3mAJTMwEmLI1lJhk0sPui9
 gbqG2B1vIf5Hb2uuBsJGBUO4YswGG2o+nYllo30j3Rigs+ZvngyQ5K8b5RDuqViOIKap3tO
 ewbjQObmMxB2Q86EO3u1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VO1aih/uMx8=;q4mvLN5boc8W+HYoWAomWpv4j9I
 Sl/cx34vPnpAPuSqqZiO7vQnH+KD5Gx/hvAVTeH+eYznHBlB1T+FeTukx+YNvocUlB0c9OjHt
 iFgd1U7ZbO3NkPkNdxhJu2DyklkPjef9dGabax2pbj3qDHEczytsVLNnCIwgmRtdEIVE/uyoT
 oLUe5KJoxTX9PQfYA3ZtyQwn4AsTNOkEVfR8w31kN8spgFczR1sRT65KxcPtCbTPi05sczNo8
 bwPh7P/qkxbUTmcjHZBV86A0S/8EkdQekhJ32EDtVnysR+JiiSZMMSEcRStUfHTOGUurkwT/6
 6rQQmSsJSvKFTNUzsYiTiTq/jeVCZBrs1PE5NfA8IHwCwYkU8tPRZMQf4hxb4iSymeQPLNtso
 3hyucvrw/Z9/m2J7X97ZCwjROagE+CgaVIkXic0PnFpnMRLa4JKP8HitJfItpLVW7filj20ot
 BnZg2XimgVRfgWFkXck5vvilF7+lZpyyQnjJapZjo1mI7Bay3MX90EZAgFmBBfttOAo2hMS4B
 lkOe0n5CJKf0AiIn8/Lrn0rgS32F5aGAA5kaYcbdFuoBWAooKnY2T4GSl/0OyVqHn8JJcMcZT
 +elj/3YKQQjzMpDKkq3+s4XM2Oa8avWILfezZhLDJLwVSA9zFNnkhsDTSMhWbizq31/BfDfg7
 LVVLqKdMr0gy4fmggHjm6zLW4YTPT2zVW0kAYKiG036IfM37Me5smoUZZYEUC1MYNHA5otvgG
 6Ui6OjOSZPPOZOsdxoxrkiF2asKIh3kSO2g2VtQ9OJ1kxUOMuiinuBvzdUCuUqnP0rjUE4cMT
 oTop6eQ4rDo7tHrqWIQur+eSO61l7OMymW0H6tAlqoE/TIm+QA0pw8FMOBDn8kmaXVC63xhcE
 oCu/UA6wE/yqokQwork8ZSzGoAOTb3Ip5BE2/A31hT1FGFVbVXioW8rv3p+kaRy1LRXP/6Mvh
 izAS4SwtSh7w+eoLm6KnA07/2h0X6sm37eOQKqn5qawFuhrNlWc053Zl/rewFX9Cds8qzRQyA
 smt65u64BSpBaC20ePSe/KCtnReX3kToy5js8k9TrndZA4Q96Pob8cJgUM/gs/FuPMgW8EZ5f
 NPOVjYy8hNtlmMREgsikzlm2fohmkcTVN9zLBN/mWydRjEZoUveYiU1uzJ9wmzniH8WwNaq6k
 fq8V43/+/IOjhdbCSU1AeLliNa8rgz1Uv0wSHWLHJH+O1W5u5xpG5U/R+GNZdibUOX1NY8+QA
 vg3l3cks89NFhnMOUAjjGRE5AVhg/+1Upr7UffIc6clbVnnVqx0qKNOQhlzL6Lnw+X8HR8HyM
 onX9cRAOjlIdz5PXjKMgh37kVx6j41oA8/p42+JgGl4GXBh9MwiTpK2N60Dfh4J43CCDK0XKm
 TdUFrq2cW9BTo/WjCLfkSeGPw+nJW3yaTSe4UdBVBbWxgmxmim/Qpec6+8FyRVCMnE2ASLnE1
 mUdk4ChZju3O5oSc2wPAzJ6dPfGZLk+LraCD2gRRd/EraN+CdAZpPECECCrig0QChgDz5m5qs
 DiAt/V0+amL2T6ZoUwI0gW4bAIN9NTO3Iz89Z+LOBkDKG1u3HmQGoFuyT7Ll4g7Fzbs6QSpDd
 5VDpHay34Bu8qFAUdYwkD4ct5RdDFq2Uq83bUgcenWCgojYsw2Uk4YEYPoTyHih39r71as3os
 Ag+iTYV3LlGWJl548W2INgSUrbwqVt0B86z1MP0Q9LGh67pikwiSVROcA+aWGnKIH3JOf8YaR
 u8IBqtZ5efGAX3Q1DnECRoSglQWDv8k/cXSzmfa2WTDitN3zFsfhEAck2w3w1wIuHwhtH76+R
 COG/U+B1mEvT0U1d77evhARHwnL+9ltD4XF897i1T7rFM4mcR59+f7/JnoaOadnYpD0CaIQuP
 O7iIMsYxnmEtk3Rp3+1C1mTYtqWXHGNQaUCfSjG5ffs1YIAlmpPjCYZTRvBus8QIOrUNhiu1i
 PZBPMyV+qMsjfhEbn987cWXh+AMmqvsvrP5pC+M1/+zYgsh03a1Qqzz++066mdQlPLTzEOUvi
 AitDEWDHvrkpi7EZSp/ikxy56m+YCJrDxZgg5xojlDUWxrRmtV0Aj97pon4VbvW24E19QwV6J
 pTf7yvp1mDe6XiMAd2A/Jwk1rgedWACKQ4KAlyXbOm/bmSiAwTH2quPgO1YfrN+pXKpV0JAKD
 xFz/3xfmiOOawzmXBUNFCN7D6sNPNRg3aERYTjKLRA0f1aktC+yfS8HJ4Fj5ovkh5wX71Z/19
 870kxm5jzDjjXnv9iVftQJFXQLdqHPunv4MOVWVNiE9CDGHQhcdpMThC4X1Vm/mDDUmI4MSut
 pD+ycze6Qf9sjms430qW4rLP3n0Tv/Vr8a0SoHKyeVQH9G0w1HUYOn9qRBgmngUYQlgo0AI0z
 rcuWO8UC9EgaVCaW6WGVNo+PnWmI4Dq5j87dg2trDRuIYlrJl01kk+ougZs2RCJG5bGennRDu
 l0m9QvXFXo5uKBxmP0N+ZRr2XIKSZKgFEfdEBggl9uptkXvECXO4mXUsx1fp+cdc5I76PFhg+
 nbBSKxrisa/cCyagpfJqYhujkK6aMBfvUb1pMKWJ4IVnuaYbu8S2b2pexrCfWWQphSdnc4+ZG
 Ej8GIvuIoYAb6fUIrFW1/YrW+gAxZCSwdTQLXjv9iB5SCx2v8o4+DHkti3nzl5ATeDmwMm5y+
 z+9HICxRPLKtqPuop3iP4jCbO4Sm6PsWrU7XEuJtpt8rA4w04mmz/YwoqpzPwu2WYdy2k/qt4
 7MjzjitxG37m8IDkwdRyUTaYtgRta3eiuYpLA0mG4ePnbXo1TKeR+qWm9uf+qiAyfhCCbWOLq
 +wrErIq/Fd8ORX96WTF+c7t5aBx5VxASjHiSK2zxM5SHHRGX1ObJZcsw8sttUm8E7AfWjGQIE
 C8uv+O/PYaw2NkxjefOIKjNszAkE81xBRE+wJL5V+1oq4vDaxhwFuo8gmq0QEwVS6YiK/FLMy
 QY1jDs7/8FSezW+LrCJIN4yKVKv1J05cM2bsGyP2i4gqcCJ823DPMZF4VeFz84cFCmXfcZWuX
 na8tjOoz4xq+nYa+3ivwZEBU5qTfVxrCrjDiG9e3q3Mq2a1YXIF8cEiLU+EH/+P374nj2wizX
 2ecxNwPSKtB7hOPBuOCjmOr1r1dEoLE9rdcAbiGDQudRMWG11cs8XHOc/k/NGMv/Y8fUrD8FC
 4l5rmFF7oZzIcDj8iOdkoxCxA+bxXqPDny1+7jdyszqDI9ZLb/DFyHgq8lHw2ZFAFFCibv7UJ
 5bbLKVqYS6tjGN6WNqP9TNjFt4hkqMx+76dkkU7I4kw77dlnqVNta7elrmfdAPkM4i5qIMmtS
 H9jumJzrJtltkM7Gog+i7v5hK7eT3stkdl1MJxrYlBAR7XFU9LHfDm3Icgu0M/5AoMU+LUSHs
 Gd+hwzVNCLD41phG2tcjCj1vtwgQshS9EempZ3VtnHhPxWi85z4Bk5+BEtNoB1/1pCBotvcUr
 IeILqZzv8ik5dVVA3Hzj+IPmIV0Hnd79I5yDjeQPoopXa/0VlFtZ/vDBTyIv1rRF+8J4TWsk2
 pwNvzcEowhWrZxFXVjPY435cOI4dHd/+vadBtcIywgexJJChYaF42hTMIXhf9kP+K1j3Oqyuv
 E0xN+LZmGZ2pKnxthOJiuPsz9Xn32gCjoZBdm9WQXIMz4dVIuCi/xf1vpehsVbm4sebEkDAto
 gDTxyv9KOxlCwXYmm1dJGwdpekQQ0mRQiSCyVRCw+GDwq93BEECvwgO7FB2WvYjRVVRfedkdI
 bzrILvqBtN5Yj+H1HVwmj8yUqsn2Mr9p6YG1yArXHZMdEQZfazCD32rgWlD9gZRRppd+32UG4
 lMWdteNhL/hBm5ambcM8SvJEc1PDOiIAGOgui6ql8lMUvhbs3FPus9EtPr464NfBt6V+7Akq3
 hMTRpfs//Dec2ir++Tx228/da20KvAm0jb/LrrFQSXdCbASGvLdhC3NS5O8h+rbFqXTSnzrpd
 +GrW0LV+jy4/K/PzsVWTTJdoFGhug9ZVi+tb4dUJQ95OxVRcRwfOvJHWbgGK8qIj84ckJbO2L
 roWvVp9ESldCcjrU6n/JjoWeznsdLKXrqOH+voxXIsoArbLDxV5qL1qnMiDjiLlt0oYq7Horu
 vKnjIHhxSfy1olLhYvnUkwHq43EhZ9DgNDtouKie4Ug58w/cC6wIICVOnT1NFVxsAVe4DUX1B
 E84J18+9pv4FQb0BRETRjcsW5JEvBinc7A+ADLcIFHrt/DmbiXaazKUTG5latqzh94XI0wuCl
 zKY9D3a86Lafp4vHcZnTcsW/s5O7THtyrDxNBjYBu/RykrUaoHZs7ej7Ta8cJImY76T7RPxFj
 Ey9qhm/7jzmiUq9wyqFXfIqeaSpXyL6VMdAVx6irNUZkVxLGSrlpL4hmRc34162Wu6odsC5Oc
 un+aHjlqej/Nmhel1eu9m44zepp75DvLlAxFFdUVnTVlAJWyWFMW7JdxbUoFiI3Kr6i4ut6hW
 2/HnNs1ZLxm8MvOv3wbld7g2R5V4+qoQubi50g9g7RTfHB84OsBxp4fR6LnqpyGs0yeUyncyv
 iNmTc/ng0oRkvKftj+oCUJs7ucqglVIshvkbiou1roWBfxLr12Yxy58vSVJiW9mbyUfwloBBM
 06wt+AAlMkIvpnBvY+zzD3bzctfVBl5ZZpGcEiKs+vSQnQtSdQcAdZdytsT2qIiqUeftYVnlP
 fhzmXqL19+019BbqquxWX79B1MK3ezG7ecthvh9lGKscalUjX0tCBFkeIYCTMu8JQSD08amqc
 h+l5gqaiabhlTRSL4s2J0+NaaZf/gLvgOYgX3jVDWexfjDkAGQ6wNyyfed1TNuvjnTH9GAtnO
 ferI1lUtIOqpMXblBu7KowIZZgTKn3S/w+zavNW/ESh2Vxj6QW/DfZEwo68Vu9gHzlqZojjun
 +lpHzi65q1y7U6RCfqOuRpu/SYGD/3NZ0utSTN8JpH5z43krORNEpe065B2X0/4H+9SY7Qd31
 DjEaNSJ1sAjTlC3RScWWHd2r16nNlMT6W7JkwkWTx3qrvL0PHxeYFZ3ipBlrdG/BJbY6H9+Od
 8HcchpnT206F/hbe4SlbEZIbSsyUBrcLYhBhEkFhR7ymWxI690+QU2mvMM6KFi2bpNIfa3kT2
 4k7GwSTTJWq60GoTjwVpJXk5kD4cobCJHltPmAaU2Eb36eXHDOYU7LGl6GnWIEidcswbPCEwo
 5K3iszXHtO/OokUG/BAXnLLzLsk/yJ83QxZK4m4JIJXiC9FW25DnYS5HwY7gsEEErZX1RS0En
 m8140O/URZGlL8i+Oh5W
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
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:u.kleine-koenig@baylibre.com,m:elfring@users.sourceforge.net,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 1FCD4A229C
X-Rspamd-Action: no action

On 1/28/26 10:10, Chen Ni wrote:
> Add check for the return value of clk_enable() andreturn the error
> if it fails in order to catch the error.

Why?
If it really fails, the screen and everything stay blank,
so it's even worse....
It seems nobody is actually checking the return value, most likely
because if it fails, the system will sleep forever anyway.
Or am I missing something?

For now I reject this patch.

Helge


> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   drivers/video/fbdev/au1100fb.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100=
fb.c
> index 6251a6b07b3a..5e7a8f018b7b 100644
> --- a/drivers/video/fbdev/au1100fb.c
> +++ b/drivers/video/fbdev/au1100fb.c
> @@ -567,13 +567,16 @@ int au1100fb_drv_suspend(struct platform_device *d=
ev, pm_message_t state)
>   int au1100fb_drv_resume(struct platform_device *dev)
>   {
>   	struct au1100fb_device *fbdev =3D platform_get_drvdata(dev);
> +	int  ret;
>  =20
>   	if (!fbdev)
>   		return 0;
>  =20
>   	memcpy(fbdev->regs, &fbregs, sizeof(struct au1100fb_regs));
>  =20
> -	clk_enable(fbdev->lcdclk);
> +	ret =3D clk_enable(fbdev->lcdclk);
> +	if (ret)
> +		return ret;
>  =20
>   	/* Unblank the LCD */
>   	au1100fb_fb_blank(VESA_NO_BLANKING, &fbdev->info);

