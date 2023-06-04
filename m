Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C706721AC4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 00:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1C010E0FC;
	Sun,  4 Jun 2023 22:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD5710E072
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 22:01:19 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E2EAB3E761;
 Mon,  5 Jun 2023 00:01:16 +0200 (CEST)
Date: Mon, 5 Jun 2023 00:01:15 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
Message-ID: <ojvx4uowxgxj73vwxrjeelp5drre5sw4rq43pbathfce4mw5vz@fwjsg3rhmox5>
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
 <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com>
 <bvjtgmuyz4zdjvt4jyjyt5hasiwnnaz4lyse6mf6b7grtig23f@yuji3z2mxue2>
 <c18c8687-0c4e-894e-a629-bc55e54031c5@quicinc.com>
 <6se25tikdg2tkiprz4h4umfta34tc5orddksvwi6woklf7c74k@rbserwp5kt3a>
 <9001aaaf-778e-5b3c-e87f-2b196d8b62ed@quicinc.com>
 <CAA8EJpp2mGcOHf5KJ8Zt_MQK+grAvbb=tVtaiT7MBLzCis20fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpp2mGcOHf5KJ8Zt_MQK+grAvbb=tVtaiT7MBLzCis20fg@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-30 23:14:19, Dmitry Baryshkov wrote:
> On Tue, 30 May 2023 at 20:37, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> >
> >
> > On 5/29/2023 2:36 PM, Marijn Suijten wrote:
> > > On 2023-05-24 12:18:09, Abhinav Kumar wrote:
> > >>
> > >>
> > >> On 5/24/2023 2:48 AM, Marijn Suijten wrote:
> > >>> On 2023-05-23 13:01:13, Abhinav Kumar wrote:
> > >>>>
> > >>>>
> > >>>> On 5/21/2023 10:21 AM, Dmitry Baryshkov wrote:
> > >>>>> Drop SSPP-specifig debugfs register dumps in favour of using
> > >>>>> debugfs/dri/0/kms or devcoredump.
> > >>>>>
> > >>>>
> > >>>> I did see another series which removes src_blk from the catalog (I am
> > >>>> yet to review that one) . Lets assume that one is fine and this change
> > >>>> will be going on top of that one right?
> > >>>
> > >>> It replaces src_blk with directly accessing the blk (non-sub-block)
> > >>> directly, because they were overlapping anyway.
> > >>>
> > >>>> The concern I have with this change is that although I do agree that we
> > >>>> should be in favor of using debugfs/dri/0/kms ( i have used it a few
> > >>>> times and it works pretty well ), devcoredump does not have the support
> > >>>> to dump sub-blocks . Something which we should add with priority because
> > >>>> even with DSC blocks with the separation of enc/ctl blocks we need that
> > >>>> like I wrote in one of the responses.
> > >>>>
> > >>>> So the "len" of the blocks having sub-blocks will be ignored in favor of
> > >>>> the len of the sub-blocks.
> > >>>
> > >>> The sub-blocks are not always contiguous with their parent block, are
> > >>> they?  It's probably better to print the sub-blocks separately with
> > >>
> > >> Yes, not contiguous otherwise we could have just had them in one big range.
> > >>
> > >>> clear headers anyway rather than dumping the range parent_blk_base to
> > >>> max(parent_blk_base+len, parent_blk_base+sblk_base+sblk_len...).
> > >>>
> > >>> - Marijn
> > >>
> > >> When I meant sub-block support to devcoredump, this is how I visualize
> > >> them to be printed
> > >>
> > >> =========================SSPP xxx =======================
> > >> =========================SSPP_CSC =======================(for SSPP_xxx)
> > >> =========================SSPP_QSEED =====================(for SSPP_xxx)
> > >
> > > Yeah something along those lines, though I don't really like the `(for
> > > SSPP_xxx)` suffix which we should either drop entirely and make the
> > > "heading" less of a "heading"
> > >
> >
> > I wrote that "for SSPP_xxx" to explain the idea, ofcourse it wont be
> > part of the print itself.
> >
> > Without that, it matches what you have shared below.
> >
> >
> > > ========================= SSPP xxx =======================
> > > ...
> > > ------------------------- SSPP_CSC -----------------------
> > > ...
> > > ------------------------- SSPP_QSEED ---------------------
> > > ...
> > >
> > > And/or inline the numbers:
> > >
> > > ========================= SSPP xxx =======================
> > > ...
> > > ----------------------- SSPP_xxx_CSC ---------------------
> > > ...
> > > ---------------------- SSPP_xxx_QSEED --------------------
> > > ...
> 
> I'd prefer this format. It eases grepping.

Cool.  And let's also have spaces around the names :)

- Marijn

> 
> > >
> >
> > sure this is also fine with me.
> >
> > > Either works, or any other pattern in the title (e.g `SSPP xxx: CSC`)
> > > that clearly tells the blocks and sub-blocks apart.
> > >
> > > - Marijn
> 
> 
> 
> -- 
> With best wishes
> Dmitry
