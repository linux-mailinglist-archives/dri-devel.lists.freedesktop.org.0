Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B321EE2AB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 12:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5FE890EA;
	Thu,  4 Jun 2020 10:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03005890EA;
 Thu,  4 Jun 2020 10:38:36 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AA8C7C0441;
 Thu,  4 Jun 2020 10:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591267116; bh=oWm0B9FDmj1T9Ggq8HdrMv9Okrx+VBTHDQ3YH0nh8S8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=D19wqJImElIPlfP45XggRJC05aYK8RK9059g9YNfCdymryedClqZr8uGy8HIapYxY
 /5K0cjZR1wbw5k8gGB256MDV5lRJ/Q6ifTNAre9t6L2N/c3zVtgdAC+AKe8uOQvgsG
 jPEt2AdW9fiu8m6mKI5qEr4LyArWO8xvYImgel/0IdchBm1gdIa67ivU3flymZJ+j0
 UcYz069wwOeGMDwnaFJF19W7kI+9atzyS9zrK/lEWOA0n4OUXi9ILIGrNFDnEIuiFS
 u4K5z/YVwBFfWmTJ2aJ4SJ2tHg69unobWr9MayzNaWSJzhO13FWKW9xDlUTSGdrLUt
 SDpTA0BN1uwhQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 53F38A0071;
 Thu,  4 Jun 2020 10:38:32 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 4 Jun 2020 03:38:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 4 Jun 2020 03:38:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvMzBnAE/jvObiSx1/HpJZBGlufB1BZtrHtKR2NMBXfrL9XvUgdphSpZyKTj+GrwXWejgJSZwA/9eR3wwn9e7bCw3370C9Ow4zX+gaBtE2NmcTItCeKRSBYU8Bn8qD24hg4cfAgyQQdOjmpnF06eu8ezZwDX0mDZmkoPkEUpVZYX83w73uHjSCjkWg1iiH4f+iMkJoTk+n+uapLFVpXjkeZ0ROlnjURUqwYoi6DUnpbyH20deg022OH8kCZMtPAYc3i5WQOPFg/sIA0z9J7HEdiTrKt5Vh3zSC8QRCny9zV+ByNsqjPwoxR5u2pM0bDeJoRFayt1V4ko3tijujmmIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWm0B9FDmj1T9Ggq8HdrMv9Okrx+VBTHDQ3YH0nh8S8=;
 b=Ugq0sM16Lvx8ofGYnJ5bwYvYfqwcS0PSy/vmokHNr+zvc2j1R9TLI3G0zPoSUA1D5Rbsw7ZxtcmiI4GqPIP/bCJEWsYe5MI4IuvODS8Oy042Hysx5+0C53R8UdVhilknWK6gMNQJF5ZgNxGoPFnKWGUxH/0gBJkkyTjQccTzT3L9fyP4EosPQBWmZSu/MCPvF/dm0AEpdOC+oh4/j9KtqYpb2kGrUFsp/txTUByzZRDKmTJXpNvxr6bpwSALizjXRnUlD6KyYuLd1ZMwSNwQv3OGFNmPIkUqeR6zS8wCgdWYGKWLk/x4WSOnhBSKJPu87VDbK2ltSGREeGtGI22eBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWm0B9FDmj1T9Ggq8HdrMv9Okrx+VBTHDQ3YH0nh8S8=;
 b=XTkj93OGwFxd1tYNMaSRuiqHXrLfdp0sy+XY2KI4gQn64Cxlqtww8pRHl5Wmt73VkIozZHzBuoHyAPkES5VsOSuVkNikk4YiQLKy2HIFCqxj1mVBGTapaBhoRBGQzK3jSU1uGdNafiw22gTMmfJPSFp33YGEwlr2PHoP0jaitBM=
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 (2603:10b6:910:1a::19) by CY4PR1201MB2500.namprd12.prod.outlook.com
 (2603:10b6:903:d0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.22; Thu, 4 Jun
 2020 10:38:31 +0000
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::b1bf:dda1:dd1e:8e30]) by CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::b1bf:dda1:dd1e:8e30%5]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 10:38:31 +0000
X-SNPS-Relay: synopsys.com
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
Thread-Topic: [PATCH 53/59] drm/arc: Move to drm/tiny
Thread-Index: AQHWEvlb5mSQq60T60WU0QolrVlsW6h57yoAgAAle+CAAAXvgIAUjIQAgA+y2qCAAEc8gIApxpeAgAAoHHA=
Date: Thu, 4 Jun 2020 10:38:31 +0000
Message-ID: <CY4PR1201MB01363EB95985A2C64ADA6841DE890@CY4PR1201MB0136.namprd12.prod.outlook.com>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-54-daniel.vetter@ffwll.ch>
 <20200415094512.GA30444@ravnborg.org>
 <MWHPR12MB14532DA5713E3B579ABFE1F4A1DB0@MWHPR12MB1453.namprd12.prod.outlook.com>
 <CAKMK7uGDGgt8Cm_bFoyzeoP2CWyiUNdUwb7GL6Ohu3k0rP0p1w@mail.gmail.com>
 <20200428140842.GL3456981@phenom.ffwll.local>
 <CH2PR12MB3894B40C6D71435D3E759A34A1A20@CH2PR12MB3894.namprd12.prod.outlook.com>
 <CAKMK7uFRt14m24ajYygdRZz=fUMhA9u6=590R2jjhXGq=VtwNA@mail.gmail.com>,
 <20200604080507.GT20149@phenom.ffwll.local>
In-Reply-To: <20200604080507.GT20149@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [5.18.247.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae11fbb9-4896-429a-fb4a-08d808736cd4
x-ms-traffictypediagnostic: CY4PR1201MB2500:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB25004BDDD16AB0110B80A11CDE890@CY4PR1201MB2500.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CTQMDZ4Uum/OMrx0vWyqKCd935SXzUY9XSn1dXRNSzKfMRvMFt9kLq63OTgzCmG2s1WrtdwudJsv6DayNRyQMEcf7EnG5mAYrEoE8CCoMCG2rA0ncNQO7zGpGBzyg7StpjzNoK5YdIJcopgNBKvFYZ+nEaK5j4/soNHR1GABDMX5RVCwx1eENwk+JjyxjtZ9kFlYDPEza0yJtd4CSL2SxJk+8r1M3lScRkC10MRyVh2yeuLIxwfJFySpR0yobY/SBRxhdgmEFHl5EovhHckY+y6bbDCavjlIAMyClsnv5M0nPDIANgEvsZEQ+ars5hhOg/nRvFUWDPwt7lqyRyA6cvuwHiyQF3ypq66vJK2OrqcVM0MbCVQztXBWwSpc4KvNHJQjqrQcV/M5UmDRs2vGbA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(136003)(396003)(39860400002)(376002)(346002)(91956017)(5660300002)(6916009)(86362001)(52536014)(8676002)(966005)(55016002)(478600001)(66946007)(7696005)(66446008)(64756008)(66476007)(66556008)(83080400001)(2906002)(26005)(9686003)(316002)(6506007)(76116006)(53546011)(8936002)(107886003)(4326008)(33656002)(71200400001)(83380400001)(54906003)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: uoTBSJyyIvoLA1E4SVLbwibdjglWHx20E11zFfktp393BF0OMoHBrT6mEYHm3mDdvFugUJPMJCMxRdlUy5j6fvhW65SYX7MY2+v8Mu7pkNaadsO5Kh6b+lcd6WVyDz6wSVm2cQdvnTDYul+Z8ZWcFXoszGiA6F4EQR/tPWnO8V0RwwB6LNaf40n03FTjvfqNsdv7b0OvfN6zqcwoyJ0UsmvSudz6tbPbQPUFLqU1ABV9tCHa1IVHMLYLcFIjHv2RUAXFWtlcloxRA/61qiB9jxO/FheV2pru7FZFY0ylv3F3oPQcBZQupbMAU4+ZaabqX/4JLjUf8RyDKvOzxzRcagxjswhk6xTTO7as3l5+oCWQ7S0TxobPSDaVK3ir7dAh/bvaBUn75MsCTHrF9Lj0rW8qDXWcozyKc/IPur70/Sg1EdvoGwyvu5JdmnQfLLj+uUifZQzZWFxVYoimqC+cE3qz15YKI4wwJpVk7CTfXa8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ae11fbb9-4896-429a-fb4a-08d808736cd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 10:38:31.1344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2BMzCYEzon4VztAIyyB9+euqhGksZqoG8qm34WsX9gCnW74sp76gSZ4DXknSt01v6P1tTzMQ4PeDA8UjaU1GhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2500
X-OriginatorOrg: synopsys.com
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Sam Ravnborg <sam@ravnborg.org>,
 DRI  Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

I've already tested it (and found several issues), so please check my reply here:
https://www.mail-archive.com/linux-snps-arc@lists.infradead.org/msg07403.html

Not sure why you didn't receive my reply (probably the reason is because it was sent to your @ffwll.ch mail instead of @intel.com one).

________________________________________
From: Daniel Vetter <daniel@ffwll.ch>
Sent: Thursday, June 4, 2020 11:05
To: Alexey Brodkin
Cc: Intel Graphics Development; DRI Development; Daniel Vetter; Eugeniy Paltsev; Sam Ravnborg
Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny

On Fri, May 08, 2020 at 08:07:41PM +0200, Daniel Vetter wrote:
> On Fri, May 8, 2020 at 3:56 PM Alexey Brodkin
> <Alexey.Brodkin@synopsys.com> wrote:
> >
> > Hi Daniel,
> >
> > > > Looking at this patch series, feels a bit like hand-rolling of bridge
> > > > code, badly. We should get away from that.
> > > >
> > > > Once you have that I think the end result is tiny enough that it can
> > > > stay, bridges intergrate quite well into simple display pipe drivers.
> > > >
> > > > > BTW should I pull that series in my tree and send you a pull-request
> > > > > or that kind of change needs to go through another tree?
> > > > >
> > > > > Also I'd like to test the change we discuss here to make sure stuff
> > > > > still works. Once we do that I'll send an update. Any hint on
> > > > > when that change needs to be acked/nacked?
> > > >
> > > > Simplest is if this can all land through drm-misc, is arc not
> > > > maintained in there? And there's plenty of time for testing, I'm just
> > > > slowly crawling through the tree to get everything polished and
> > > > cleaned up in this area.
> > >
> > > Any updates on testing this pile here? First patch landed now, and I've
> > > started to push driver patches. So would be good to get this sorted out
> > > too.
> >
> > Sorry we're in the middle of 2 long weekends so missed this one.
> > I guess we'll be able to test it in a week or two from now.
> >
> > Is that OK?
>
> This aren't high-priority, so totally ok. As long as you don't land a
> driver rewrite and I have to rebase everything :-)

Ping for a bit of testing on this stuff ...
-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
https://urldefense.com/v3/__http://blog.ffwll.ch__;!!A4F2R9G_pg!Ncpf9M5g5wUEicELHfzz8syA0c0KogYc2E0tdnXGHGmUwGbROv-vwMDISCh7u6w58Dgs-ws$
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
