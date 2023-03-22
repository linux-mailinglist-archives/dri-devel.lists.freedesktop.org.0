Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9E56C40FA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 04:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6322E10E222;
	Wed, 22 Mar 2023 03:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-zteg10021401.me.com (pv50p00im-zteg10021401.me.com
 [17.58.6.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D38810E222
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 03:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1679455543;
 bh=d3CewEP7Fm5d2yjoCy7LEmwv7xA2WuRpJAgeMc7rORA=;
 h=Mime-Version:Content-Type:Date:Subject:From:To:Message-Id;
 b=nELPWmPqlsYHoj5Fg/JvGkvnx3wjmIUX/yugpVBKJ1PJAwfZ6JpLI99lFdO5EmGN4
 GUB0l344L+9VbtqsVgtlTl5sKo6ZmBTbc+5mZIVo8Alf+7/qD/S4yhFBfwDCpeSCRL
 9Md3x9/y38+/H50Dw2bAkIFWqZvshc5HfN3do/YjYfc0oVoMF2K/UA58Y9zWhEvaof
 AyOwmsG4wooqJe/JqV6TFTnqbHjrliyCuKeO520gTSrfGPtTj8Jzk6Cz0k+Tm6gqLB
 IMFifi1uiKndfRVYdY2ZO5RVFz9pcJUpbDzA5y5AZTBjl1LWxiapElMfGTSmz9SpPi
 kSK2fICVuFfFA==
Received: from localhost (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
 by pv50p00im-zteg10021401.me.com (Postfix) with ESMTPSA id 322128E02AF;
 Wed, 22 Mar 2023 03:25:39 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Mar 2023 04:25:37 +0100
Subject: Re: [PATCH 1/1] drm/sun4i: tcon: Fix setting PLL rate when using DSI
From: "Roman Beranek" <romanberanek@icloud.com>
To: "Frank Oltmanns" <frank@oltmanns.dev>, "Maxime Ripard" <maxime@cerno.tech>
Message-Id: <CRCLAFZ02N4O.1WVSKC1TFLUOO@iMac.local>
X-Mailer: aerc 0.14.0
References: <20230319160704.9858-1-frank@oltmanns.dev>
 <20230319160704.9858-2-frank@oltmanns.dev>
 <20230321145739.jlpbzplsc27dlh7v@houat> <87a605hmo5.fsf@oltmanns.dev>
In-Reply-To: <87a605hmo5.fsf@oltmanns.dev>
X-Proofpoint-GUID: HqhfhkMmz8MluUsjSYUoJn8zi8ifE6wZ
X-Proofpoint-ORIG-GUID: HqhfhkMmz8MluUsjSYUoJn8zi8ifE6wZ
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 spamscore=0
 bulkscore=0 clxscore=1011 mlxlogscore=231 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2303220023
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
Cc: Samuel Holland <samuel@sholland.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu
 Tsai <wens@csie.org>, jagan@amarulasolutions.com, michael@amarulasolutions.com,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "moderated list:ARM/Allwinner sunXi SoC
 support" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue Mar 21, 2023 at 8:55 PM CET, Frank Oltmanns wrote:
> My apologies, I wasn=E2=80=99t patient enough.

Frank, there's no need to apologize, in my judgement. You weren't
impatient, we simply happened to run into a coordination problem for
which, I think, neither of us was particularly to blamew. Take it easy
:)

Roman
