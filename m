Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C93F7920B2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 09:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A726F10E050;
	Tue,  5 Sep 2023 07:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2674 seconds by postgrey-1.36 at gabe;
 Mon, 04 Sep 2023 12:25:35 UTC
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
 [67.231.149.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8DB10E1B3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 12:25:35 +0000 (UTC)
Received: from pps.filterd (m0047963.ppops.net [127.0.0.1])
 by m0047963.ppops.net-00176a03. (8.17.1.19/8.17.1.19) with ESMTP id
 3845xFEP005073
 for <dri-devel@lists.freedesktop.org>; Mon, 4 Sep 2023 07:41:01 -0400
Date: Mon, 4 Sep 2023 14:40:54 +0300
From: Ian Ray <ian.ray@ge.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: EXT: Re: [RFC] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw:
 switch to drm_do_get_edid()
Message-ID: <20230904114054.GA41874@zoo6.em.health.ge.com>
References: <20230901102400.552254-1-jani.nikula@intel.com>
 <CA+MoWDrtgtT26F-rZ-7s0PtQcTLqB6g1BARkegfZ3qQnhw=3ZQ@mail.gmail.com>
 <87fs3ui79j.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fs3ui79j.fsf@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: LWn_vk-pRf_X1p6w26O1Vj9oyrJRuK2j
X-Proofpoint-ORIG-GUID: LWn_vk-pRf_X1p6w26O1Vj9oyrJRuK2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-04_07,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0
 adultscore=0 suspectscore=0 mlxscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=720 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309040104
X-Mailman-Approved-At: Tue, 05 Sep 2023 07:23:00 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zheyu Ma <zheyuma97@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Martyn Welch <martyn.welch@collabora.co.uk>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@gmail.com>, Yuan Can <yuancan@huawei.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 04, 2023 at 01:04:40PM +0300, Jani Nikula wrote:
> 
> On Sat, 02 Sep 2023, Peter Senna Tschudin <peter.senna@gmail.com> wrote:
> > Good morning Jani,
> >
> > It has been a long time since I wrote the driver, and many many years
> > since I sent my last kernel patch, so my memory does not serve me very
> > well, but I will try to shed some light.
> >
> > On Fri, Sep 1, 2023 at 12:24 PM Jani Nikula <jani.nikula@intel.com> wrote:
> >>
> >> The driver was originally added in commit fcfa0ddc18ed ("drm/bridge:
> >> Drivers for megachips-stdpxxxx-ge-b850v3-fw (LVDS-DP++)"). I tried to
> >> look up the discussion, but didn't find anyone questioning the EDID
> >> reading part.
> >>
> >> Why does it not use drm_get_edid() or drm_do_get_edid()?
> >>
> >> I don't know where client->addr comes from, so I guess it could be
> >> different from DDC_ADDR, rendering drm_get_edid() unusable.
> >>
> >> There's also the comment:
> >>
> >>         /* Yes, read the entire buffer, and do not skip the first
> >>          * EDID_LENGTH bytes.
> >>          */
> >>
> >> But again, there's not a word on *why*.
> >
> > The video pipeline has two hardware bridges between the LVDS from the
> > SoC and DP+ output. For reasons, we would get hot plug events from one
> > of these bridges, and EDID from the other. If I am not mistaken, I
> > documented this strangeness in the DTS readme file.
> >
> > Did this shed any light on the *why* or did I tell you something you
> > already knew?
> 
> I guess that answers the question why it's necessary to specify the ddc
> to use, but not why drm_do_get_edid() could not be used. Is it really
> necessary to read the EDID in one go?

Moi Jani,

Sorry for slow reply -- I will look into this during this week.  I would
hope and expect that we could use common APIs.


> 
> BR,
> Jani.
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
> 
