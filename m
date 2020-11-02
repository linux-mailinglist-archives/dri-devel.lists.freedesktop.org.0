Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9032A3E6C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685116EBAC;
	Tue,  3 Nov 2020 08:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA306E12C;
 Mon,  2 Nov 2020 19:57:25 +0000 (UTC)
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A2JnjMh005906; Mon, 2 Nov 2020 19:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : mime-version; s=pps0720;
 bh=wWs0BUEJ4QSNrRzIaVowN9j/D52jMAm5Em0ykihOTZQ=;
 b=VNiX8vb822xLllVx1v3z5RrsyJUjBMeJ6tcgV+g2nFh3NLk2UMzjHNNQ3CTzo88LOnfq
 LljI1H9HSQQ5cKKYs7MIqptbZWYzV9b8gar9mi/notjhsenBE6pVBf/9LWqbz7sktRok
 eEZxw71kE3LcPaX5elJp8FGaMmGH3vECknTOiBlEwzy53RImjLycd2j6kJi8m5J+DiPW
 +wYwOQurL4OkyCiA75OG90aMfKkh2Zp8HdelJ/yKYgIj0E9ZO1O+TFcHMeSypGrqf6XX
 OLAXpCbT3uR4UfiowjKqlIhq0oAOsqsBjjeDG+8BzQLXwwHt9B0lVrODNIk6hueMupJw Cg== 
Received: from g4t3426.houston.hpe.com (g4t3426.houston.hpe.com
 [15.241.140.75])
 by mx0a-002e3701.pphosted.com with ESMTP id 34hht5d6fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Nov 2020 19:57:14 +0000
Received: from g4t3433.houston.hpecorp.net (g4t3433.houston.hpecorp.net
 [16.208.49.245])
 by g4t3426.houston.hpe.com (Postfix) with ESMTP id A1DD154;
 Mon,  2 Nov 2020 19:57:12 +0000 (UTC)
Received: from rfwz62 (rfwz62.americas.hpqcorp.net [10.33.237.8])
 by g4t3433.houston.hpecorp.net (Postfix) with ESMTP id 413E046;
 Mon,  2 Nov 2020 19:57:11 +0000 (UTC)
Date: Mon, 2 Nov 2020 12:57:11 -0700
From: rwright@hpe.com
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 0/3] Reduce context clear batch size to avoid gpu hang
Message-ID: <20201102195710.GA12790@rfwz62>
References: <20201101174132.10513-1-rwright@hpe.com>
 <8cdf0dd0-2a2f-bae9-71ea-89a88fdb14a5@redhat.com>
Content-Disposition: inline
In-Reply-To: <8cdf0dd0-2a2f-bae9-71ea-89a88fdb14a5@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-02_13:2020-11-02,
 2020-11-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011020151
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:24 +0000
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
Reply-To: rwright@hpe.com
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie,
 mika.kuoppala@linux.intel.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 linux-media@vger.kernel.org, matthew.auld@intel.com, rodrigo.vivi@intel.com,
 akeem.g.abodunrin@intel.com, chris@chris-wilson.co.uk,
 prathap.kumar.valsan@intel.com, wambui.karugax@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 10:48:54AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 11/1/20 6:41 PM, rwright@hpe.com wrote:
> > From: Randy Wright <rwright@hpe.com>
> > 
> > For several months, I've been experiencing GPU hangs when  starting
> > Cinnamon on an HP Pavilion Mini 300-020 if I try to run an upstream
> > kernel.  I reported this recently in
> > https://gitlab.freedesktop.org/drm/intel/-/issues/2413 where I have
> > attached the requested evidence including the state collected from
> > /sys/class/drm/card0/error and debug output from dmesg.
> > 
> > I ran a bisect to find the problem, which indicates this is the
> > troublesome commit:
> > 
> >   [47f8253d2b8947d79fd3196bf96c1959c0f25f20] drm/i915/gen7: Clear all EU/L3 residual contexts
> > ...
> > I've now cleaned up the patch to employ a new QUIRK_RENDERCLEAR_REDUCED.
> > The quirk is presently set only for the aforementioned HP Pavilion Mini
> > 300-020.  The patch now touches three files to define the quirk, set it,
> > and then check for it in function batch_get_defaults.
> 
> Note I'm not really an i915 dev.
> 
> With that said I do wonder if we should not use the
> reduced batch size in a lot more cases, the machine in question uses a
> 3558U CPU if the iGPU of that CPU has this issue, then I would expect
> pretty much all Haswell U models (at a minimum) to have this issue.
> 
> So solving this with a quirk for just the HP Pavilion Mini 300-020
> seems wrong to me. I think we need a more generic way of enabling
> the reduced batch size. I even wonder if we should not simply use
> it everywhere. Since you do have a proper Haswell CPU, I guess
> it being an U model makes the hang easier to trigger, but I suspect
> the higher TPD ones may also still be susceptible ...
> 
> Regards,
> 
> Hans
> 

Hi Hans,

As you noted, the 3558U cpu is one of the least powerful processors
to be designated as a Haswell, but there are others at the low end
of the Haswell architecture that I also suspect might exhibit
similar problems.

That leads me to think that more gpu hangs like mine will be reported
when commit 47f8253d makes its way into widely used kernels. And that's
why I chose to implement a quirk that would allow enrolling other
systems as they are identified.

Your remark about applying the reduced batch size in all cases certainly
would simplify the patch.   However, I don't have any other systems
using the i915 driver on which I could try to measure the putative
performance penalty of reducing the batch size on a system that worked
properly with the large size.   So I couldn't thoroughly investigate
the consequences of a broader change.

That said, if the i915 maintainers respond in favor of the simpler
unconditional reduction of the batch size, I will be glad to
propose a much simpler version of my patch.

I probably should clarify that this patch is to resolve a problem on a
personally owned system that I use at home.  It is not related to a
problem with any of HPE's products, and so I don't have a lab full of
systems using the i915 driver on which I can test a change that would
have an effect many products.  The consumer products like Pavilions
stayed with HP when HPE split from HP five years ago.

--
Randy Wright            Usmail: Hewlett Packard Enterprise
Email: rwright@hpe.com          Servers Linux Enablement
Phone: (970) 898-0998           3404 E. Harmony Rd, Mailstop 36
                                Fort Collins, CO 80528-9599 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
