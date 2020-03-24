Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEF219226A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEC56E59D;
	Wed, 25 Mar 2020 08:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C3189B62;
 Tue, 24 Mar 2020 18:58:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rn0atL2fElw6s0azaj0G72fD9AWyC8mj3XcwQTWykkaD7A4jobUB7hhc7fmWQKwqRiznMsq9r/vGJWFNt6+n9tYZZlwZouojREJdH8FnySx9VeH2CVlFQLSPphEn9jVnAn1ZVZfyepL9yi6jjWUHGOKhbWvwmFQhAOKHLjywehjYW5P6ZK9MbdWSK/fzRdYbbaAgPaJGMHiOlxqQHOxLj+ghs7V2ly61qytDq2QKHT1ZNg6DU10Fhku1wKlO47cIrgfDfs7SBEiLisrBWIdYEDH4DBNdK4quuTO8DWrBxa2j8XiLCgXHg36+yBnnmnNoZ2w39etx5oPmR1bx3iRzGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOK7NdaHlpJm86hqi8G0umHaichNTYS/UUeFe89nhpg=;
 b=PFxTSekukv4FepzFw+ZmoKNLNf3aGWYsgTyQQ28JEelB1ubTdFXjPdrbB3fH8Xqf6CKb95U+83fgpLSGhOSV7/3LEFliwiPLo6KTbTDsXgwVTcsNIJCWQ4e/p0rnyIGOIqlJ3ICDUGnYdgg6qyQqlXna5E1Yz/OHDXsMkqTs+Snwy4JY1zSjWTWLtccVVoMvy++7BtV3QJEdNjhPn5OUjjdD0PH90iP6/bQ1wpqLJ66Ky7XEv1QMOUqaVBpNYUlWZNKtyoyRe0Xr8ys18KfxS6SfLNuzaKfGkBvEvCKPMOLNHuSyHD18oLk+dGtyIH1SE5si0jNwUeYvvALb7Abuvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOK7NdaHlpJm86hqi8G0umHaichNTYS/UUeFe89nhpg=;
 b=L/NPMw5CTYISXSVn6zQ3JdkTQNszYqbb1hKsswcAEQrdfyHIDDvOh3RsPhhjyElZMPpVCjEcmS/zijzd7Oh6zB8K39FA4fArjG8bhtZiCpybMdHrZvRoakiVAdhIEJa3fRJzEjcr7vx0LeAPMEOuXciHHjBupoLWHHO3pqKDWoo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4734.eurprd05.prod.outlook.com (20.176.7.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Tue, 24 Mar 2020 18:58:15 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3%7]) with mapi id 15.20.2835.023; Tue, 24 Mar 2020
 18:58:15 +0000
Date: Tue, 24 Mar 2020 15:58:07 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 hmm 2/9] mm/hmm: return the fault type from
 hmm_pte_need_fault()
Message-ID: <20200324185807.GN13183@mellanox.com>
References: <20200324011457.2817-1-jgg@ziepe.ca>
 <20200324011457.2817-3-jgg@ziepe.ca>
 <20200324072712.GA23447@lst.de>
Content-Disposition: inline
In-Reply-To: <20200324072712.GA23447@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: BL0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:208:91::35) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 BL0PR05CA0025.namprd05.prod.outlook.com (2603:10b6:208:91::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.12 via Frontend Transport; Tue, 24 Mar 2020 18:58:14 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jGokZ-0007tt-RT; Tue, 24 Mar 2020 15:58:07 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2fddc5c4-9032-4b3b-5196-08d7d0254ec0
X-MS-TrafficTypeDiagnostic: VI1PR05MB4734:
X-Microsoft-Antispam-PRVS: <VI1PR05MB4734106363915F30B7AD6592CFF10@VI1PR05MB4734.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(2616005)(4744005)(33656002)(4326008)(36756003)(5660300002)(1076003)(316002)(8936002)(54906003)(478600001)(86362001)(6916009)(26005)(186003)(66946007)(2906002)(52116002)(9746002)(8676002)(66556008)(66476007)(9786002)(81166006)(81156014)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4734;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H3hEFsHLi81imPltmJoiN25lcMBOiKGvdJYMttAo0LgCj+qDvDUyUnh+GdtPtvVidYEheuuFWO5LIr/8N2wsoDt65ciYzm4Zza/nMB0VxWMUCd2YWdlfyJg9ng6nKgeAVzjaYazgh20au26X4Sio5CEKtxLM6Dcyq06Hgimu+VSUms3USco79+CYfBMBQKmkP38uf4ykN6Ah3vVjgbTRMqtuae34aQR4S/MX2WAbpB+wA+0p1WwkeavX3dMe2RsvUy/0GHDkMFHHzlanri1ZKMHZRH4BImphZ4COJDoo5p7lw/UJhDFabVz70tL1m6H7KoKFIvHf1/8z7mOAzWAX0CH7llJKpuUbnOpXtNNxZ3ODjhh/JVEHUBmmkZbLFmZSVr6Eec6F49i0mEFdpWf9dvlnrZ7WA8VcHnaWll/efNwP7s04NNYB/nWEDU2TgJ3czSfeZb5Ni8NvVtxqFaCwLAkkhxyY0FCX/IPIqZ8vDzj5gb4xnLMQqs7sHF/cOcEU
X-MS-Exchange-AntiSpam-MessageData: AD0IwTgRYuC/K6/KToIx9Zs1s2W6U2CCBhv0xO5fZ6p5jDUKD7RnXSS2WBZj3pHtereBSMP6GP442hVzoYbcHWTf3M4qW9QIqUxoBrWtAoh5fxX6sjCNGhdC8nMACq4HHt1PbWE53abo3LazK3SASQ==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fddc5c4-9032-4b3b-5196-08d7d0254ec0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 18:58:15.2237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJdFZhD3aR4PxI4VUhlRkTgVCFtZ3voOMPkb6C+iYTx6WJ5WUUdeqsOA00BBYnU39BakpLTiKvaZBMi0+z8dxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4734
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:16:37 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 08:27:12AM +0100, Christoph Hellwig wrote:
> On Mon, Mar 23, 2020 at 10:14:50PM -0300, Jason Gunthorpe wrote:
> > +enum {
> > +	HMM_NEED_FAULT = 1 << 0,
> > +	HMM_NEED_WRITE_FAULT = HMM_NEED_FAULT | (1 << 1),
> > +	HMM_NEED_ALL_BITS = HMM_NEED_FAULT | HMM_NEED_WRITE_FAULT,
> 
> I have to say I find the compound version of HMM_NEED_WRITE_FAULT
> way harder to understand than the logic in the previous version,
> and would refer keeping separate bits here.
> 
> Mostly beccause of statements like this:
> 
> > +	if ((required_fault & HMM_NEED_WRITE_FAULT) == HMM_NEED_WRITE_FAULT) {
> 
> which seems rather weird.

Okay, I checked it over, and there is one weird statement above but
only one place that |'s them together, so it is overall simpler to
split the enum.

I'll keep the HMM_NEED_ALL_BITS, I think that purpose is clear enough.

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
