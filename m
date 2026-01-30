Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGeZOoggfGmgKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 04:07:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB2B6B5C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 04:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A4610E8DC;
	Fri, 30 Jan 2026 03:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IXXYdzuc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C58010E8DC
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 03:07:48 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2a0834769f0so10755175ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 19:07:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769742468; cv=none;
 d=google.com; s=arc-20240605;
 b=jX3IOCW8x2DFHVUwUOiL7gXuz1p+TcTxTHkFBE/JnBggz4B2NuAx7jff9lM7dBv9vM
 jtGTnpBjlhTOnFgwdspCflXI6MIOCBRBQtJHnpr4dabDmrmfBJLPd/a6fZHGdkCrpRku
 qUDOxl3XP8X6agPCLC7+upMSPE/7gkBbyExZR3u/r3zn6oMRVadHFLFYTaU9XNFbup1R
 I21Epo2q5NBDuoZl5juYVVF8gHmkAkU6p2lxiAIey5+XH9BBmbYOPEX03L1YKTv+ZIc4
 worvxhHLnxga2u+GjEoLXCyU9CPFP+1r/dCdujotw98Jnr8hvWCQm6GbGZNcfxJ/yXHG
 X9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=l3mlnZZ9VIBVNPrLG6woBCVSdTzsbdrDbnf9ljSQpmA=;
 fh=yVnu3JW+haT/G2vMNOdKzgjLLbwSpSpCEDXy3LNrYa4=;
 b=YcSgDtr9niLIKF3KmhtOAwM6LpgLT/cNHW+D6upNqMpVo10AW0Ln06BjVKRxwFVhFM
 GObYxAQIjVnDPmG6PebhJITNjPxX8RepfztX5LKNJlrgMTb2QNQwIVxvEoIUV7DZsZPE
 FnJuVVaGezfdRm0wdY+AFTnsn2Kbzh6hmGVkanj9dkPPnKHWE0/9PjCw4JCwfE6+VwZb
 8wMAQ0GrG8FBsWWiiGsTOvuptvR8EAoh6hN8wJciJYWGrjGXBwPWExefnZi2urKoMy9d
 C40CLHh4AwBAibQozFcmkRF/GsAU1vKMPCUqXaVaBndNFKN3yqLHYeFZ0z6L3xQEqr8J
 zu2A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769742468; x=1770347268; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=l3mlnZZ9VIBVNPrLG6woBCVSdTzsbdrDbnf9ljSQpmA=;
 b=IXXYdzuc4pUOZvaGOeIu9YNY6p8b9TSJc+ZTkclkdRHu+G/mHxytMdYE8NduIOBDYb
 fOObYwnj3FMrFID0SiG+tVrcdNrvV3Dr51VqKDNrTdsJKmdSNqqLogQykc+3Ah/RCYlq
 hxSkVskaCQYmz8sHM8L5gf+uj2JMdg0GNTkDjLtWW8FScYbUBR7NTjTNYFdKNs4JZs0M
 moB7YViD42oi3DRjJj9NNCAIxw4TdqR9a5o3d7hnISKJ+LHOsH4gP/KXK+jrFx+XQovy
 HJicO8MblPr48WYfSYGkELlaSiQbnAxUmCDXCO9xDnLVcJq+Z3HhFbDtDLx8Rg7f9Fzx
 Gqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769742468; x=1770347268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l3mlnZZ9VIBVNPrLG6woBCVSdTzsbdrDbnf9ljSQpmA=;
 b=s7cPwNIPdBTmPDTu7EwiKUH/3h0a1BlFQNHkPTRdwWk0UurOMpR9fd+fszw9d0wwR7
 PnOS9oAm9542nAMOpDukNVMNBlVwJfEQj0YWz8f4JnmHM507WTRKWq6PoniHPSmoFDNz
 m1q2zx4skM28h0uZfxFpsfl8Mbndv6wV3NskUd6GkrN7o4Plh85qd9q4r4dNVynof5VM
 BvBu1WCXYA7E1Ad5cGtpYEoB9FmsEhHOrZBzdr19oL9wKEwvJFRsSJePQCINZDH4tMQQ
 iaww9RzN9rcUR7KM6M8LVIUGSIDLdtLrf4XbmmzjcwRz2rS0iB9tkWBjGjovOHpclRn4
 Q2xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWxBurFhvnPY3yx+HkTyOKnh4wxzRv47sKnUdAnLUrcnwyjM3yzA2lwt5EUeFfonD0dLttFlSuufI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0eX1tZd/AC6SsoTLYaMsPtd38rfYBMV94/LHiMkKfYOXuxPC7
 569YBsRQfNDPpStv1z8t4sAiA2mf9qDSFQoGrIPl53nCko8vyBbHpMRJo4m9ZzVd29sex9+wgts
 iGeJHMgAEV9Kui6ikYwSJOJmcaZ7k0Fc=
X-Gm-Gg: AZuq6aJ1XcouSMIDPnQrs84RAcR3Wi2WLcn6FPgHgntaTlgKZxkB5TanCbHyWJ+iHRJ
 TJkGhM3W+PLHm2NvaHYcGDPBfcmjSChHpsnj0ya+dHkxzvIx8I7oEfq05QGLRxPieb7q6cp18qy
 tGaY9qOzm6LlreUHeTPC2cFv5v/NbB7NeopNMhB/+kSI+UaROalOQIQpNl4leIDExFnaHm38S8M
 s705CvHuYwrtJe6DQzcRkSV/ucpQXrEKvmrmQZsATVUF2uMSyVitV0IF5BdG9K+iFwDtA==
X-Received: by 2002:a17:903:1b67:b0:2a8:dc02:8939 with SMTP id
 d9443c01a7336-2a8dc028b56mr9687905ad.0.1769742467629; Thu, 29 Jan 2026
 19:07:47 -0800 (PST)
MIME-Version: 1.0
References: <20260129233703.407404-1-xjdeng@buaa.edu.cn>
 <ie3hipmp5nqappyuwnxm2kpgscnl6qe42cwf2sep4inwunb5th@gontu4foua6q>
In-Reply-To: <ie3hipmp5nqappyuwnxm2kpgscnl6qe42cwf2sep4inwunb5th@gontu4foua6q>
From: Xingjing Deng <micro6947@gmail.com>
Date: Fri, 30 Jan 2026 11:07:38 +0800
X-Gm-Features: AZwV_QiqnwM7-hO72ct3vp6624JxKkDGHIKb9BztZJXrs6IyvANn95QXzsWnLaE
Message-ID: <CAK+ZN9oaUh5PPBx5QPCya=hqDM42CQptD2-MrJvMZsypNuZ66A@mail.gmail.com>
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
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xjdeng@buaa.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[micro6947@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[micro6947@gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,buaa.edu.cn:email]
X-Rspamd-Queue-Id: 40DB2B6B5C
X-Rspamd-Action: no action

Yes, I found that.
I will release patch v8.

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8830=E6=97=A5=E5=91=A8=E4=BA=94 10:38=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Jan 30, 2026 at 07:37:03AM +0800, Xingjing Deng wrote:
> > In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> > reserved memory to the configured VMIDs, but its return value was not c=
hecked.
> >
> > Fail the probe if the SCM call fails to avoid continuing with an
> > unexpected/incorrect memory permission configuration.
> >
> > This issue was found by an in-house analysis workflow that extracts AST=
-based
> > information and runs static checks, with LLM assistance for triage, and=
 was
> > confirmed by manual code review.
> > No hardware testing was performed.
> >
> > Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access =
to the DSP")
> > Cc: stable@vger.kernel.org # 6.11-rc1
> > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> > ---
> > v7:
> > - Add the detail description of how the tool detect.
> > - Link to v6: https://lore.kernel.org/linux-arm-msm/20260128033454.2614=
886-1-xjdeng@buaa.edu.cn/
> >
> > v6:
> > - Add description of the detection tool.
> > - Link to v5: https://lore.kernel.org/linux-arm-msm/20260117140351.8755=
11-1-xjdeng@buaa.edu.cn/T/#u
> >
> > v5:
> > - Squash the functional change and indentation fix into a single patch.
> > - Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-statute-=
showy-2c3f@gregkh/T/#t
> >
> > v4:
> > - Format the indentation
> > - Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72it=
rloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t
> >
> > v3:
> > - Add missing linux-kernel@vger.kernel.org to cc list.
> > - Standarlize changelog placement/format.
> > - Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke=
47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
> >
> > v2:
> > - Add Fixes: and Cc: stable tags.
> > - Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.4029=
635-1-xjdeng@buaa.edu.cn/T/#u
> > ---
> >  drivers/misc/fastrpc.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index ee652ef01534..8bac2216cb20 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -2337,8 +2337,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_devi=
ce *rpdev)
> >               if (!err) {
> >                       src_perms =3D BIT(QCOM_SCM_VMID_HLOS);
> >
> > -                     qcom_scm_assign_mem(res.start, resource_size(&res=
), &src_perms,
> > +                     err =3D qcom_scm_assign_mem(res.start, resource_s=
ize(&res), &src_perms,
> >                                   data->vmperms, data->vmcount);
> > +                     if (err) {
> > +                             goto err_free_data;
> > +                     }
>
> I think, checkpatch should warn here about unnecessary braces.
>
> >               }
> >
> >       }
> > --
> > 2.25.1
> >
>
> --
> With best wishes
> Dmitry
