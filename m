Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 258353F0289
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 13:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574B26E53C;
	Wed, 18 Aug 2021 11:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4706E53C;
 Wed, 18 Aug 2021 11:21:12 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17IB31lO156050; Wed, 18 Aug 2021 07:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Edn45vo36K8lU6chCt343f0Z8Lrbpyo+EM+iBU5jXQs=;
 b=D/UJ5aOle8HgbA72+BqLI4XbUmsjoVjOsGYAEyzbOi49FxouXj1C95qkmUkkO56LB4Se
 +sLphIGQ/TcZ9X/6EhOYoF7PNC03C032DiFCAxZTdYg/N8KejWAoEZ6Iea7KoQ7l7/3e
 v1PyNI2vKh2S0K1cGV5qMwyznzQAppmdlsCla9UAoUrqR/6iXEhu4LMNVQdqMtbel/Pu
 EnxfDVQ+xIDKtfHlhxrkjL6vTdyitRX5W7HDrwscym2mqhY2CYILO4M9+RgJp3CfEMbU
 vdMaDag+pOgY6f8HlFnsIk17mOqHMh6mMed9znQCkWO0SCa0QcOYlp6oMC/jbxW4NQsB wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agp1p052q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 07:21:07 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17IB42KI159416;
 Wed, 18 Aug 2021 07:21:07 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agp1p0522-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 07:21:07 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17IBJhh5008650;
 Wed, 18 Aug 2021 11:21:05 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3ae53hxgd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 11:21:05 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17IBHXA459507010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Aug 2021 11:17:33 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA6F3A4054;
 Wed, 18 Aug 2021 11:21:02 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 710A5A4068;
 Wed, 18 Aug 2021 11:21:02 +0000 (GMT)
Received: from osiris (unknown [9.145.167.240])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 18 Aug 2021 11:21:02 +0000 (GMT)
Date: Wed, 18 Aug 2021 13:20:54 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: Dave Airlie <airlied@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [BUG - BISECTED] display not detected anymore
Message-ID: <YRztFhtGS9RkP2Bf@osiris>
References: <YRe7I67h4gMVOWuu@osiris>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <YRe7I67h4gMVOWuu@osiris>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XETsc40UgQ0fkxOGqhka2r3N4Jy-ZLq_
X-Proofpoint-ORIG-GUID: JfZTvNTVeQIUs6qj7U_gh0cetlGOrhZr
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-18_03:2021-08-17,
 2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999
 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108180069
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

On Sat, Aug 14, 2021 at 02:46:27PM +0200, Heiko Carstens wrote:
> Hello,
> 
> I have Fedora 33 running, and with the Fedore kernel update from 5.11
> series to 5.12 my external monitor was not detected anymore. Same is
> true with the Fedora supplied 5.13 kernel version.
> 
> So I tried with vanilla kernel 5.11 and latest git head from Linus'
> tree. 5.11 works while latest git head does not. Bisecting the problem
> points to commit 32c3d9b0f51e ("Merge tag 'drm-intel-next-2021-01-27'
> of git://anongit.freedesktop.org/drm/drm-intel into drm-next").
> 
> Unfortunately it is a merge commit, so it looks like conflicting
> changes have been made in the parent branches.
> 
> Hardware in use:
> 
> - ThinkPad X1 Yoga 4th / Carbon 7th
> - Intel(R) Core(TM) i5-8265U CPU @ 1.60GHz
> 
> The Thinkpad is connected to a ThinkPad Thunderbolt 3 Dock with a
> Thunderbolt cable and a monitor (Eizo EV3285) is connected via
> Displayport to the docking station.
> 
> The monitor is detected and works without any problems (4k@60HZ)
> before the above mentioned merge commit. With the commit and
> afterwards it is not detected anymore and only the Thinkpad builtin
> display can be used.
> 
> Any idea what went wrong? I can provide more information, or test
> debug patches if wanted. Just let me know.

So looks like I made a mistake when bisecting (it literally took me
two days due to the low power machine, even with a minimized kernel
config). Anyway, looking into it again the first bad commit is

ef79d62b5ce5 ("drm/i915: Encapsulate dbuf state handling harder")

With that commit the display is not detected anymore, one commit
before that it still works. So this one seems to be broken.

Ville, Stanislav, any idea how to fix this?

commit ef79d62b5ce53851901d6c1d21b74cbb9e27219b
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Fri Jan 22 22:56:32 2021 +0200

    drm/i915: Encapsulate dbuf state handling harder
    
    In order to make the dbuf state computation less fragile
    let's make it stand on its own feet by not requiring someone
    to peek into a crystall ball ahead of time to figure out
    which pipes need to be added to the state under which potential
    future conditions. Instead we compute each piece of the state
    as we go along, and if any fallout occurs that affects more than
    the current set of pipes we add the affected pipes to the state
    naturally.
    
    That requires that we track a few extra thigns in the global
    dbuf state: dbuf slices for each pipe, and the weight each
    pipe has when distributing the same set of slice(s) between
    multiple pipes. Easy enough.
    
    We do need to follow a somewhat careful sequence of computations
    though as there are several steps involved in cooking up the dbuf
    state. Thoguh we could avoid some of that by computing more things
    on demand instead of relying on earlier step of the algorithm to
    have filled it out. I think the end result is still reasonable
    as the entire sequence is pretty much consolidated into a single
    function instead of being spread around all over.
    
    The rough sequence is this:
    1. calculate active_pipes
    2. calculate dbuf slices for every pipe
    3. calculate total enabled slices
    4. calculate new dbuf weights for any crtc in the state
    5. calculate new ddb entry for every pipe based on the sets of
       slices and weights, and add any affected crtc to the state
    6. calculate new plane ddb entries for all crtcs in the state,
       and add any affected plane to the state so that we'll perform
       the requisite hw reprogramming
    
    And as a nice bonus we get to throw dev_priv->wm.distrust_bios_wm
    out the window.
    
    v2: Keep crtc_state->wm.skl.ddb
    
    Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20210122205633.18492-8-ville.syrjala@linux.intel.com
