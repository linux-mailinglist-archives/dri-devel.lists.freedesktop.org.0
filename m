Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2752A144AEC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 05:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC8A6EF2A;
	Wed, 22 Jan 2020 04:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CB76EF28;
 Wed, 22 Jan 2020 04:48:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjMkk12kzqxRkL5fVgZumXMLKxCNM2R7Zr/W1zuWhKnQjxIRuxVCEOpwv96lalW+YqV1wwZ7CCPvyl9LPnqCyarEakDKAveVEsYeZJQPUUdtG3Bac+hV+bWDjAJGBBSZnLZPTa6QDDh43uo59Da59k9Lx1SAEI00ApbbBMv/qG9rtu4jcgWL7xZLY/Ek9OLWdehAb8QgqXnqWbdlnzN+jCAS/sq2enNlW1/jBgCYxZoPmi2zEFbX1VIJR5Xck1/0pOjlHVv02z6h5AueKxZYkNNwGCqk57/KESHqoZ6hhQKiR28uN4v7x+dXcYxcE75TTdyj5ny32zDh1Blbw5bMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4c4Cx+YEyJ6fMDdySGsvHDv6E5GIMeqFWgOg0zZ7wtU=;
 b=nFfLnYvshW5/iREVOQ8VmYGMc+EPeLddW/chNp8aENjvBmDIC1+jSl7Wyglynt5Oa+KjRfpSuIGF7asQSVSNCC3fXFHG0BR7UxMyMahRuMK3fxNq5jdR6GqeaVvpM9X7BiQgMDMoImxBcCy/CJXcmoV9GJ5J7OuseEmq8+WO/n5TblAscOBXS8RhVFPehhl3Iwhvv2HK94bRCFCpuHe8PDn1cqSu6UwF2XHyYED9+58yzlySysHs/5T85N7FULEXmX0II1mPdNe8r2KdcQqc1JkLpMF0SCBxtvIn1YUDBh7KYdMZ8CvZ3CMR4mz/+KBr8jnAUGE8balgeThWjPrQqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4c4Cx+YEyJ6fMDdySGsvHDv6E5GIMeqFWgOg0zZ7wtU=;
 b=b9CaY3CfsOsuMpautZXzGyUv1aRVQnstkfDBt01vQztNyv65UOLRUO43I5I5EL9zSQFakD2tOftrrGkA6o5kvBRaQfj/FRDjWPNTwVDQw482JZny3vWo3E288qsywM0iS041OoK1ydeBBrD45EbYNhARXkFFkhhCasGrdlMsIzc=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB3612.namprd12.prod.outlook.com (20.178.30.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Wed, 22 Jan 2020 04:48:55 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882%7]) with mapi id 15.20.2644.027; Wed, 22 Jan 2020
 04:48:55 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, Sean Paul <sean@poorly.run>
Subject: RE: [PATCH v2] drm/dp_mst: Remove VCPI while disabling topology mgr
Thread-Topic: [PATCH v2] drm/dp_mst: Remove VCPI while disabling topology mgr
Thread-Index: AQHVq0qRoQ6K6PHdDEyQOTgxkWsmjKetfuSAgAAJLICAA8wjgIA9+RMAgABFHwCAAASDgIAAAJwAgAbPEhA=
Date: Wed, 22 Jan 2020 04:48:54 +0000
Message-ID: <DM6PR12MB4137A84B694D85E26F8050D8FC0C0@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20191205090043.7580-1-Wayne.Lin@amd.com>
 <a6c4db964da7e00a6069d40abcb3aa887ef5522b.camel@redhat.com>
 <ec3e020798d99ce638c05b0f3eb00ebf53c3bd7c.camel@redhat.com>
 <DM6PR12MB41371AC4B0EC24E84AB0C84DFC580@DM6PR12MB4137.namprd12.prod.outlook.com>
 <CAMavQK+pS40SQibFuirjLAmjmy8NbOcXWvNsFP8PanS6dEcXWw@mail.gmail.com>
 <31d9eabe57a25ff8f4df22e645494d57715cdc0b.camel@redhat.com>
 <CAMavQK+pOtQ62mp4DSRDW7nHDz4doW3LA5AV1NML-wFa3s3cQA@mail.gmail.com>
 <cfae7fec779bd8fa4da0ad0e7664cf797a1700ab.camel@redhat.com>
In-Reply-To: <cfae7fec779bd8fa4da0ad0e7664cf797a1700ab.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-01-22T04:44:15Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=9263d1b0-1c41-482b-9c0a-000099e3ecf2;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-01-22T04:48:52Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: a19d6335-c614-4168-aff3-0000dfa3b4ca
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [165.204.68.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d64ac712-b8b9-421f-13ce-08d79ef662a4
x-ms-traffictypediagnostic: DM6PR12MB3612:|DM6PR12MB3612:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3612155A7327FECC00235B24FC0C0@DM6PR12MB3612.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 029097202E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(199004)(189003)(64756008)(86362001)(26005)(6506007)(2906002)(186003)(8676002)(81156014)(4326008)(53546011)(66946007)(66446008)(66476007)(478600001)(5660300002)(55016002)(9686003)(66556008)(52536014)(110136005)(76116006)(316002)(8936002)(54906003)(7696005)(33656002)(71200400001)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3612;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GL+ggOhw8+O48V0vFMfX8nNLR//UBz16cRoNf3WQGOn6ba/ZtcG3/ptJTN2QPHcVuOA2hNCIyTyBG1rGxjmKZFoXEQwNjMJYYJiTtipRKJ6W8v8Lt4leJgzcyg3cIdO4igeEkXxdk4PSmMenPt0wSYhUXmJ7b5OVGMy0eMJs3CSvzt2b/30k5rPiCks+ID6iQktMGUaGsg9Wu2QfJR9/iuKyhIioFOwwVIM1996cO7r6J7Zd/KtMxDJ7E2v3iEOZTiGU7oEq+xR+fVtsTFf8mHoTRrLobjY7Q5FKPGUG1ivxXgV4KGhRBp7bwF5bVj1cyrVbDmPaghaMOSg0yAb9pkFd5aFmoIlgEpiWXYrViYpgl1qLgzaDS/88l7zFGlFBNpqquSiK9OR901k3MpcHmLBTvjDqNV8734YIoDxvw7Qn32UZnX283zZQ77kdM0Ye
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64ac712-b8b9-421f-13ce-08d79ef662a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2020 04:48:54.8625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R2BKQpqaW/f2U/UX6VysZk+Gk7k/wO99qZGmJAWIyteng0QnJ/9lHpW9kE0317r3NbEBjXzvtGR90Yqew/39aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3612
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
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

Sorry for any inconvenience I brought.
Thank you so much Lyude, I will have a look on that fix patch later.

> -----Original Message-----
> From: Lyude Paul <lyude@redhat.com>
> Sent: Saturday, January 18, 2020 4:45 AM
> To: Sean Paul <sean@poorly.run>
> Cc: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org;
> amd-gfx@lists.freedesktop.org; Zuo, Jerry <Jerry.Zuo@amd.com>; Kazlauskas,
> Nicholas <Nicholas.Kazlauskas@amd.com>; stable@vger.kernel.org
> Subject: Re: [PATCH v2] drm/dp_mst: Remove VCPI while disabling topology
> mgr
> 
> Yeah that's fine with me, I'll send out a revert for this in just a moment
> 
> On Fri, 2020-01-17 at 15:43 -0500, Sean Paul wrote:
> > On Fri, Jan 17, 2020 at 3:27 PM Lyude Paul <lyude@redhat.com> wrote:
> > > On Fri, 2020-01-17 at 11:19 -0500, Sean Paul wrote:
> > > > On Mon, Dec 9, 2019 at 12:56 AM Lin, Wayne <Wayne.Lin@amd.com>
> wrote:
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > Sent: Saturday, December 7, 2019 3:57 AM
> > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>;
> > > > > > dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> > > > > > Cc: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>;
> > > > > > Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> > > > > > <Jerry.Zuo@amd.com>; stable@vger.kernel.org
> > > > > > Subject: Re: [PATCH v2] drm/dp_mst: Remove VCPI while
> > > > > > disabling topology mgr
> > > > > >
> > > > > > On Fri, 2019-12-06 at 14:24 -0500, Lyude Paul wrote:
> > > > > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > > > >
> > > > > > > I'll go ahead and push this to drm-misc-next-fixes right
> > > > > > > now, thanks!
> > > > > >
> > > > > > Whoops-meant to say drm-misc-next here, anyway, pushed!
> > > > > Thanks for your time!
> > > > >
> > > >
> > > > I'm getting the following warning on unplug with this patch:
> > > >
> >
> > \snip
> >
> > > I think I've got a better fix for this that should avoid that
> > > problem, I'll write up a patch and send it out in a bit
> >
> > Thanks Lyude! Should we revert this patch for the time being?
> >
> > > --
> > > Cheers,
> > >         Lyude Paul
> > >
> --
> Cheers,
> 	Lyude Paul
--
Best regards,
Wayne
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
