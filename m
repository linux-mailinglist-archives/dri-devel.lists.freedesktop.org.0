Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2934375D4DD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 21:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8128610E096;
	Fri, 21 Jul 2023 19:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF60010E096
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 19:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689967532; x=1690572332; i=markus.elfring@web.de;
 bh=1nZupZRGXAZQLlG195bDgJ16T987d5UXOtu9Scc1ekA=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=vnv+Twomo4EhcGwilZoQqHhYwTjTOcqnR8Q3zC2O6P+K0eOLv4zaC+VgWEAVS9vZLRuHn6F
 Abdwrs//1yw5p/GRiRJ8zFfZPLkx5TTELQFfTg2336XgmhAh3u2pLX4Rj8iq44EyG486BQ1lA
 3bVBH/5kftttp3P3s+GjHdq59yS4Zd4cElBiGrmONn5Cs6ehBPrIEYTYbXm67r1TvpM4a9YOL
 BDdzPPrJJ6j2fKZy/L6bTi4eiU43a+ik5BDT10hbt2ByodcGNbEpBPHI4VSMl2DrYTV80DfuM
 MUz4lWTnwzo8rfzMeR4NbEA5TTjfH0Cnw4fsJFGZSxkZokKXJGlA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MBSB9-1qCmbD3Bnz-00D9pB; Fri, 21
 Jul 2023 21:25:32 +0200
Message-ID: <60aa8d21-3a3f-bbf6-e079-57be8fced255@web.de>
Date: Fri, 21 Jul 2023 21:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Carl Vanderlip <quic_carlv@quicinc.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230721183201.11001-1-quic_jhugo@quicinc.com>
Subject: Re: [PATCH] accel/qaic: Fix slicing memory leak
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230721183201.11001-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:rZkSEXIPqL4pwYcVsmUej7A5uQf/LQL3sMQFeV3Pv7Gr9S2WM3S
 ukeokMpzQp4ihNhEPsKy4KTpuvSGxtSP+T+DtEjW9lFNvFawVkhD51bRtUs0MZ+u7GSFE+Z
 98JcTjo+aEbsYN11NaRLp0kPiA/o6OFg5xsKY4TJfgG0LCruMHTLe47AffocG/gKoy08e7W
 MqOvD/HXrSvXIrRA1ZIdw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:It3x3UXQVIQ=;dQCM9Z7TTpTBo8nPikO/svW79JY
 RBqNlC6s0zkF1FOZTzRM7fkvi43EQ1jRQ+JOI5CnWiQ4WbsXnGs6x6aTswThCTVNdzkolMh1f
 bszP1NrjjiZ+Xhs+hD7RQkKwvoUMqarIhSZ1dMHgZ6Gt9ncXu6l62D+qRQcb1CmAeTjWDN4p0
 L5vpEGAcRWdvbZfpTXr8NZVX3PWx+rBESwdOpSJ79I6BTB2cS29SZrX169HvQZq4FuRYe7sBp
 qfcHBrKT19Uw8CL+v5n0O9o3Ic+xnY7s7v9vpRnHDrmTWZ0xQ+u/+Q4NMz93Z23P28SMzmnp3
 dcUFA6LW+DI5VXgPgjuiP0PvqxS7e//9Y+DiBNaD55SXqN/bGMGMM+tQvNPw229rOBAuajT85
 JAGcQR3vFypW3KWciEpwD7iKDFvZdBWQWAEb5pJmJtJis1J+oot+u+acOYPy96zR20BFDhqvs
 23n/U2ZTnLZNMi6kQGLY9gjebliyosbypMTrcf//KLuyKfaOz2tawvRJBg1yCK9u4UsAMfwUk
 iu5AmIKSFFsDEsPxZ0kB5BsJcdPy2ZBY8qsM1CgAFUztnCO93hlyfpByzh6BTYjzC6cvBI3nx
 AVtE8RE8554pvo7laq6WVvEKVAx9WdwFA1Ti0wbqJ2Lw3mwqeHkqPWb8hTEDikV28cg/bps3B
 myuUcKCBmO3Sp+LxTeiDKULaDHEIjrlgoVHHFTCKKs3h+ZfRG6YqqNj5r6ouUvsueBGKej/DB
 qmhNypy6Sa8sGF3HwKPAY138yiUzukXMM45L6IT4A7ns69ZJOEdPdUARPdJpHyYVj4I10jpW+
 xoSK90JijTA4nst799yL5xEaJMjk9/ceSOhXpvbB3c14IbNJOcsG9IbuO+h2Oby9Ew91x1DN0
 RW7QZRGe42M1h4TPMJI5fhVWNoS8PW9W44jFIzOmXQ+FIotAqK6S7WcW3LYl3/U7y8k1NpvxC
 C3yGUQ==
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
Cc: LKML <linux-kernel@vger.kernel.org>, quic_ajitpals@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Slicing configuration data from user is stored in a temporary buffer
> which should be freed unconditionally.

Are imperative change descriptions still preferred?

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.5-rc2#n94

Regards,
Markus
