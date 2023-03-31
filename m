Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76446D16D7
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 07:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9224610E2FF;
	Fri, 31 Mar 2023 05:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-zteg10011401.me.com (pv50p00im-zteg10011401.me.com
 [17.58.6.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5F410E2FF
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 05:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1680240968;
 bh=sKGRoi8TeZzYLNcSuhfkFHZh2ruRuMHAHIi1NUfW1Nk=;
 h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To;
 b=YfLElU2Ymf/i7Ge+KOBYztYdfyRgC6f6dwW6rf7hWSEDNfS6mqDRuG1iwPe8a2w6O
 7h7bjp2x2BP+G/qRj5njtsX0LQtic/6fmaQf0zuqtwaGOex7CGIApAHDYPcuUbP49l
 kHrczWSLy6Z/ljWE0RVbimXTtgIKhPLTNGEu+NqTrqZrxEojQAtfcKhQjuwbozCP79
 lq34BaM83M8o44jP0bQZ4ShHrdxEy5dzluDfnQZn9ZE4oBgrijwiVPVE7Mapiceq6b
 4LAWSNeXudl09L66wPxGQHsuCbWY4nvspjV362rOJn65XXF9dlemhbeUPD9GdD37LP
 YhYr7hRwOzQkw==
Received: from localhost (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
 by pv50p00im-zteg10011401.me.com (Postfix) with ESMTPSA id 28B4FDC02DC;
 Fri, 31 Mar 2023 05:36:04 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 Mar 2023 07:36:02 +0200
Message-Id: <CRKBPM6IOSJS.3RBNRJ8TSZX9U@iMac.local>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
From: "Roman Beranek" <romanberanek@icloud.com>
To: "Frank Oltmanns" <frank@oltmanns.dev>
X-Mailer: aerc 0.14.0
References: <20230320161636.24411-1-romanberanek@icloud.com>
 <87wn356ni4.fsf@oltmanns.dev> <20230327202045.ceeqqwjug4ktxtsf@penduick>
 <CRHKFX934UA0.1MCKCD8SJSPIE@iMac.local>
 <20230329195802.veybo3367zifw77n@penduick> <877cuyon5e.fsf@oltmanns.dev>
In-Reply-To: <877cuyon5e.fsf@oltmanns.dev>
X-Proofpoint-GUID: 1DKQc4fsLyT6il9NAOZ-x1dK75Ip_PH6
X-Proofpoint-ORIG-GUID: 1DKQc4fsLyT6il9NAOZ-x1dK75Ip_PH6
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0
 mlxlogscore=252 spamscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2303310043
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
Cc: Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Frank,

On Thu Mar 30, 2023 at 6:45 AM CEST, Frank Oltmanns wrote:
> Roman, will you please submit a V2 of the patch I submitted then? Or do
> you want me to do it?

Yes, I'm already on it, only missing a cover letter.

Roman
