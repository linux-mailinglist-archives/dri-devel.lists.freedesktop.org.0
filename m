Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI+hLsZvfGk/MgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:45:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DFAB8992
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710B810E9A9;
	Fri, 30 Jan 2026 08:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RmIJbcvs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D0B10E9AE
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 08:45:54 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-82318702afbso1738243b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 00:45:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769762754; cv=none;
 d=google.com; s=arc-20240605;
 b=X5PASoQAOtCFX5vRCQU5j4f+vPnCPG9scfkXHpUnmOUxe9mPYZy8FyYs0xnvvhB7Ll
 MGeRDzjzRFK9eYZFvs5GsiSrQ/fcVH1jARqBAOojhOAGrQem8EwSFh5wIq8RFSpvgYYC
 xE7Acxn/gknllrcUe77Jkcw/q+Egix45Pvz7dgYSwJk5OLDwNILWfOaRpRDAiHMijOse
 75dkbIRkiwf3CKWKCTebdDx/I9EhKmdUudgLLpRhCSN47rUwKPvj6esX2WYkuApvzx5q
 VfDcM3ycejVINxyn/8UGR36c/raqgrvGmwNBmeyLPzVwMjrfqvKKLdghvpuh1NabjPUh
 yBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=eEAW01z9JQWBTM10b2sP0NfwiccdN1/5P+EOzAVhSFs=;
 fh=hWaOdPYiLpSwjkeTyXvFX+yZHZbrIJZMMgf7eP3iujo=;
 b=KvIEoNqjnpI2CpLNixPwTWpwpJlppDWtoXVdh5DnzCfzKiHF2J1/LjXWPspWcx/93y
 x7z2jX35vcXa9KJVZwqVPnmOjsm3ejJD+Sx92FBxk7MiVoW3OK7eO3/hX1HjxySjvvP9
 3ETMsBFwIwRge7bzTb+AtTudnE8M+Ug0qchnn00V+pbKAMJ6ZLEf+oVpfnIbUWelCcOo
 sbTGh+x0TYkITJqCzr6nfNWhE/iz2Rrd1BzKAkL2nY5ShxqTVNoQa7tAa2aEPJ57dKPk
 8mpfNAE6McTwshB8QHopioYxRE3fiiLUuQvydFm2+j5VPzI13l1TjF+R92TlG5WiuEQx
 WvFw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769762754; x=1770367554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eEAW01z9JQWBTM10b2sP0NfwiccdN1/5P+EOzAVhSFs=;
 b=RmIJbcvs20sHaa+R0OLj6E88M9hhI9QUHJ90BP2d0o38OalLPbzDkN58VuhPwacdAb
 DZ2wOGcLqapJ5dNQVv0W3DvtMjxhUbAI+pO6LHXctYpgr2LHujgUBI+gCMJqOEkWzHuq
 sbUtDe5eLYgSPO+c56nyKqeh3Hj8D6IcL1NQ/TRbiIXgCO3G5QIBS/PsNaQPzfp9dPur
 BS/bd9xWsBmMIuchTYhakvnNejN57N4ccCL2wSf9YoqOEa4KMImJkHFMRGHnVzzXSYCN
 5tZn5+e0mr+DFeEZhlEXaSbbwZLciBKzJ0aBEG+J7Ug8vpqFzcP7RFb7t7wFKiMs9bvD
 Gn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769762754; x=1770367554;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eEAW01z9JQWBTM10b2sP0NfwiccdN1/5P+EOzAVhSFs=;
 b=oFAkhjzqAGuAQFLsLSMUs0HO8d+I/RVmEPGdZHDgcOI2pNR7HU3ixEHH36w1I2CzNi
 ZguX7yenvXM8oD/a3c72o1Felx3dg0ythXofJgwUMsgQpQCWZU7vpDl2trhPWf3st4K8
 FgYPxx+PDgKwocVzks6/16zwb3EhZ+R6dS3t+ox9siyQiUwqGPESVUnJyQkmeAU2FgBW
 RNPTwtE9v0XmchEy5//gapr2OcvITk2yHzzZa4NRMTZF509MMgCbUD8vtAjYL+661YAv
 6+dv3OXhnVaiPGF+Ybf0n3d6bv9aNGryvqeHG7uUqnLltCcQcEGJKpnHm2fJDXmB+VGl
 Txdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHmokzJV70zdo4MbkJephFJVDJVsn6aLlEguwbX+rubCVrH/bpSOG8vgtBrvM1MiTocyqtIXbCHSM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7RYXIREgf50kX7L2MKgO9jDNkky0rNDpoeivIBQLbiVZutgtA
 7dLmBSiD3DD5m4YLI6XNNIgh5qXojNrQe/UeiEu5cToEP4jtTZS4TFhuwvxZhai4Wr22q9SOTRf
 sTOo3shqgCEGnQun48l/wQsJ3IOZS2ho=
X-Gm-Gg: AZuq6aJqVL8Vf6h4CQixqZSMN8/AU38vupFP7yOp/nobfCvcymIrtpET+96xYi8gm9D
 JCWh3Pk3SF3HezKt3WnwsY/MDfPq4cvZ8H2M3Whz1I9hk1FbFjE4+pFFerXSiKSKfWg9MMSlVpD
 Jg7AonAMzaL2dVv5HdTwH/LZbhAVTT4X97/oFLR569AvDieKyYSVvLIQDRBe7Kkngfg+1gDjAK+
 nOS2fehJsrUe1muYeWCXt7rogh1O7NnhHWzY3/X6N43dOfQ/OxQJk3s+Fd4pU36mFpfrodgWEWs
 aC5ylZCCPhvr0f08C9T9qolWse7+
X-Received: by 2002:a05:6a21:a42:b0:334:a11e:6bed with SMTP id
 adf61e73a8af0-392e0053615mr2227722637.29.1769762753855; Fri, 30 Jan 2026
 00:45:53 -0800 (PST)
MIME-Version: 1.0
References: <20260129233703.407404-1-xjdeng@buaa.edu.cn>
 <ie3hipmp5nqappyuwnxm2kpgscnl6qe42cwf2sep4inwunb5th@gontu4foua6q>
 <CAK+ZN9oaUh5PPBx5QPCya=hqDM42CQptD2-MrJvMZsypNuZ66A@mail.gmail.com>
 <4rfalipp5xyejwappzi5gny4muetuzrr2q3sunctfmsvb4juwf@64kdxjrakr5q>
In-Reply-To: <4rfalipp5xyejwappzi5gny4muetuzrr2q3sunctfmsvb4juwf@64kdxjrakr5q>
From: Xingjing Deng <micro6947@gmail.com>
Date: Fri, 30 Jan 2026 16:45:43 +0800
X-Gm-Features: AZwV_QiaVUxZYp2r3LsMEsEBTrYjWrRMw1lgAjNb8iVpASaAPEQ6nzSN-ssydZk
Message-ID: <CAK+ZN9pDpvf+29quNptrMKoti_E5m36XHZJP125ctZmBk2w3sw@mail.gmail.com>
Subject: Re: [PATCH v7] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de, 
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: micro6947@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xjdeng@buaa.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[micro6947@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[micro6947@gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 20DFAB8992
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8830=E6=97=A5=E5=91=A8=E4=BA=94 12:33=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Jan 30, 2026 at 11:07:38AM +0800, Xingjing Deng wrote:
> > Yes, I found that.
> > I will release patch v8.
>
> You have been notified once already. Please stop top-posting (aka
> responding at the top of the message).
>

Sorry about that, I just replied the email directly.

> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8830=E6=97=A5=E5=91=A8=E4=BA=94 10:38=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Fri, Jan 30, 2026 at 07:37:03AM +0800, Xingjing Deng wrote:
> > > > In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> > > > reserved memory to the configured VMIDs, but its return value was n=
ot checked.
> > > >
> > > > Fail the probe if the SCM call fails to avoid continuing with an
> > > > unexpected/incorrect memory permission configuration.
> > > >
> > > > This issue was found by an in-house analysis workflow that extracts=
 AST-based
> > > > information and runs static checks, with LLM assistance for triage,=
 and was
> > > > confirmed by manual code review.
> > > > No hardware testing was performed.
> > > >
> > > > Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool acc=
ess to the DSP")
> > > > Cc: stable@vger.kernel.org # 6.11-rc1
> > > > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> > > > ---
> > > > v7:
> > > > - Add the detail description of how the tool detect.
> > > > - Link to v6: https://lore.kernel.org/linux-arm-msm/20260128033454.=
2614886-1-xjdeng@buaa.edu.cn/
> > > >
> > > > v6:
> > > > - Add description of the detection tool.
> > > > - Link to v5: https://lore.kernel.org/linux-arm-msm/20260117140351.=
875511-1-xjdeng@buaa.edu.cn/T/#u
> > > >
> > > > v5:
> > > > - Squash the functional change and indentation fix into a single pa=
tch.
> > > > - Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-stat=
ute-showy-2c3f@gregkh/T/#t
> > > >
> > > > v4:
> > > > - Format the indentation
> > > > - Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.=
72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t
> > > >
> > > > v3:
> > > > - Add missing linux-kernel@vger.kernel.org to cc list.
> > > > - Standarlize changelog placement/format.
> > > > - Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.=
e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
> > > >
> > > > v2:
> > > > - Add Fixes: and Cc: stable tags.
> > > > - Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.=
4029635-1-xjdeng@buaa.edu.cn/T/#u
> > > > ---
> > > >  drivers/misc/fastrpc.c | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > > index ee652ef01534..8bac2216cb20 100644
> > > > --- a/drivers/misc/fastrpc.c
> > > > +++ b/drivers/misc/fastrpc.c
> > > > @@ -2337,8 +2337,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_=
device *rpdev)
> > > >               if (!err) {
> > > >                       src_perms =3D BIT(QCOM_SCM_VMID_HLOS);
> > > >
> > > > -                     qcom_scm_assign_mem(res.start, resource_size(=
&res), &src_perms,
> > > > +                     err =3D qcom_scm_assign_mem(res.start, resour=
ce_size(&res), &src_perms,
> > > >                                   data->vmperms, data->vmcount);
> > > > +                     if (err) {
> > > > +                             goto err_free_data;
> > > > +                     }
> > >
> > > I think, checkpatch should warn here about unnecessary braces.
> > >
> > > >               }
> > > >
> > > >       }
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
