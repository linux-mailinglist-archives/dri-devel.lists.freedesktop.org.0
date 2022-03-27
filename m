Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35504E8657
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 09:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D2710E052;
	Sun, 27 Mar 2022 07:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032DF10E052;
 Sun, 27 Mar 2022 07:00:08 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id o13so9808052pgc.12;
 Sun, 27 Mar 2022 00:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=B0zrfPEDf4e6Muxcxkz/ovZxAtJjbnxgK8f96p1+0Ck=;
 b=jGj7DxIxbQDEybCOraMIwxMI2fjdiKS80eNF0u8LceCAdpoMvK9TpKZFHj66yn/PvU
 Y7dusyT/9mhdjtHJvQuczJa99J5CDjLO9ar+k0c6DeeN1AN9j029JnROqmo2vOGpByqa
 nxetEzGOppd1xJWdDsm2w8SMIQc6eZ8IStMegiMf9eAJGRzSQ/w0UITMvPnEns5X5bnI
 ahhYx79wbgHwl1uymG2X8tRrGrODU4gR8ye3rWk8Wz92cj3TgtDK0A0B4B73+JsG6nCd
 fPNcjjI8mnMktphoDaszyRT3RvfEZgyLWO2WItjFtWrK9Xw4rkziT5GOOd6noYJw2BzK
 /bxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=B0zrfPEDf4e6Muxcxkz/ovZxAtJjbnxgK8f96p1+0Ck=;
 b=jS47Y9wAf0vUQ/the2nKEBS/Q207aB7OgPmlZgpB9Gq1R0zm2xbal8rSY4NoJM+ip+
 5Cx/23RZUw1t3m2TsQKTnk9b3DJ3DF5FcarGxQ9ekXVT6/uosB/6UThSh0uOB6UbbCHn
 GVgSMjT6TqBTJeCyUBFDeNIK2RSYQ0TFdjQ7dgZbxzxIjxz0px+f1BXvGOGj5mYmBsFO
 1W0u7X7y1K9A4nPt95driikZTIIzH1BADyX8LhnNBnnVDkPeNzKAVNUXis4IjMYh3cmD
 QnaM6f+3BOLGLkPcXAMNTqIGiFFtKM7BJNWTZzLWp9HfNqnt6qAGbFtYo9dAqQi0N1VM
 lRUA==
X-Gm-Message-State: AOAM533LDEdxpsl+rNx7enDuhOSQeSq31+cAaDsNYYCeC6GJk4jDNuRy
 fM6N+9ZA3mk4F9GL31gwPLo=
X-Google-Smtp-Source: ABdhPJywbizoZk4XOW6LYGf7wmYWM2ocTqSR5GKSGYZ8m/s7E/ivTY1Lj3nXe2pu5WnBz7Ftb5RN/A==
X-Received: by 2002:a63:6949:0:b0:380:94ab:9333 with SMTP id
 e70-20020a636949000000b0038094ab9333mr5839368pgc.199.1648364407607; 
 Sun, 27 Mar 2022 00:00:07 -0700 (PDT)
Received: from localhost ([115.220.243.108]) by smtp.gmail.com with ESMTPSA id
 u10-20020a17090a2b8a00b001c6594e5ddcsm10698140pjd.15.2022.03.27.00.00.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Mar 2022 00:00:06 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: linux@roeck-us.net
Subject: Re: [PATCH] device: fix missing check on list iterator
Date: Sun, 27 Mar 2022 14:59:50 +0800
Message-Id: <20220327065950.7886-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <80429172-37c6-c9ce-4df7-259bb90338a8@roeck-us.net>
References: <80429172-37c6-c9ce-4df7-259bb90338a8@roeck-us.net>
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
Cc: kherbst@redhat.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 xiam0nd.tong@gmail.com, bskeggs@redhat.com, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 26 Mar 2022 22:38:05 -0700, Guenter Roeck <linux@roeck-us.net> wrote:
> > @@ -103,11 +103,16 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
> >   		return -EINVAL;
> >   
> >   	if (args->v0.state != NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT) {
> > -		list_for_each_entry(pstate, &clk->states, head) {
> > -			if (i++ == args->v0.state)
> > +		list_for_each_entry(iter, &clk->states, head) {
> > +			if (i++ == args->v0.state) {
> > +				pstate = iter;
> 
> Is iter and the assignment really necessary ? Unless I am missing something,
> list_for_each_entry() always assigns pos (pstate/iter), even if the list is
> empty. If nothing is found, pstate would be NULL at the end, so

the pstate will not be NULL at the end! so the assignment is necessary!
#define list_for_each_entry(pos, head, member)                          \
    for (pos = __container_of((head)->next, pos, member);               \
         &pos->member != (head);                                        \
         pos = __container_of(pos->member.next, pos, member))

--
Xiaomeng Tong
